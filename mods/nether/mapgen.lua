-- Parameters

local NETHER_DEPTH = -5000
local TCAVE = 0.6
local BLEND = 128

-- Stuff

local yblmax = NETHER_DEPTH - BLEND * 2

-- Initialize noise object and localise noise buffer

local nobj_cave = nil
local nbuf_cave


-- Content ids

local c_air = minetest.get_content_id("air")

local c_stone_with_coal = minetest.get_content_id("default:stone_with_coal")
local c_stone_with_iron = minetest.get_content_id("default:stone_with_iron")
local c_stone_with_diamond = minetest.get_content_id("default:stone_with_diamond")
local c_stone_with_gold = minetest.get_content_id("default:stone_with_gold")
local c_stone_with_copper = minetest.get_content_id("default:stone_with_copper")

local c_gravel = minetest.get_content_id("default:gravel")
local c_dirt = minetest.get_content_id("default:dirt")
local c_sand = minetest.get_content_id("default:sand")

local c_cobble = minetest.get_content_id("default:cobble")
local c_mossycobble = minetest.get_content_id("default:mossycobble")
local c_stair_cobble = minetest.get_content_id("stairs:stair_cobble")

local c_lava_source = minetest.get_content_id("default:lava_source")
local c_lava_flowing = minetest.get_content_id("default:lava_flowing")
local c_water_source = minetest.get_content_id("default:water_source")
local c_water_flowing = minetest.get_content_id("default:water_flowing")

local c_glowstone = minetest.get_content_id("nether:glowstone")
local c_sand_soul = minetest.get_content_id("nether:sand_soul")
local c_netherbrick = minetest.get_content_id("nether:brick")
local c_netherrack = minetest.get_content_id("nether:rack")


local np_cave = {
	offset = 0,
	scale = 1,
	spread = {x = 384, y = 128, z = 384}, -- squashed 3:1
	seed = 59033,
	octaves = 5,
	persist = 0.7
}


-- On-generated function

minetest.register_on_generated(function(minp, maxp, seed)
	if minp.y > NETHER_DEPTH then
		return
	end

	local t1 = os.clock()

	local x1 = maxp.x
	local y1 = maxp.y
	local z1 = maxp.z
	local x0 = minp.x
	local y0 = minp.y
	local z0 = minp.z

	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local area = VoxelArea:new{MinEdge = emin, MaxEdge = emax}
	local data = vm:get_data()

	local x11 = emax.x -- Limits of mapchunk plus mapblock shell
	local y11 = emax.y
	local z11 = emax.z
	local x00 = emin.x
	local y00 = emin.y
	local z00 = emin.z

	local ystride = x1 - x0 + 1
	local zstride = ystride * ystride
	local chulens = {x = ystride, y = ystride, z = ystride}
	local minposxyz = {x = x0, y = y0, z = z0}

	nobj_cave = nobj_cave or minetest.get_perlin_map(np_cave, chulens)
	local nvals_cave = nobj_cave:get3dMap_flat(minposxyz, nbuf_cave)

	for y = y00, y11 do -- Y loop first to minimise tcave calculations
		local tcave
		local in_chunk_y = false
		if y >= y0 and y <= y1 then
			if y > yblmax then
				tcave = TCAVE + ((y - yblmax) / BLEND) ^ 2
			else
				tcave = TCAVE
			end
			in_chunk_y = true
		end

		for z = z00, z11 do
			local vi = area:index(x00, y, z) -- Initial voxelmanip index
			local ni
			local in_chunk_yz = in_chunk_y and z >= z0 and z <= z1

			for x = x00, x11 do
				if in_chunk_yz and x == x0 then
					-- Initial noisemap index
					ni = (z - z0) * zstride + (y - y0) * ystride + 1
				end
				local in_chunk_yzx = in_chunk_yz and x >= x0 and x <= x1 -- In mapchunk

				local id = data[vi] -- Existing node
				-- Cave air, cave liquids and dungeons are overgenerated,
				-- convert these throughout mapchunk plus shell
				if id == c_air or -- Air and liquids to air
						id == c_lava_source or
						id == c_lava_flowing or
						id == c_water_source or
						id == c_water_flowing then
					data[vi] = c_air
				-- Dungeons are preserved so we don't need
				-- to check for cavern in the shell
				elseif id == c_cobble or -- Dungeons (preserved) to netherbrick
						id == c_mossycobble or
						id == c_stair_cobble then
					data[vi] = c_netherbrick
				end

				if in_chunk_yzx then -- In mapchunk
					if nvals_cave[ni] > tcave then -- Only excavate cavern in mapchunk
						data[vi] = c_air
					elseif id == c_stone_with_gold or -- Precious ores to glowstone
							id == c_stone_with_diamond then
						data[vi] = c_glowstone
					elseif id == c_gravel or -- Blob ore to nethersand
							id == c_dirt or
							id == c_sand then
						data[vi] = c_sand_soul
					else -- All else to netherstone
						data[vi] = c_netherrack
					end

					ni = ni + 1 -- Only increment noise index in mapchunk
				end

				vi = vi + 1
			end
		end
	end

	vm:set_data(data)
	vm:set_lighting({day = 0, night = 0})
	vm:calc_lighting()
	vm:update_liquids()
	vm:write_to_map()

	local chugent = math.ceil((os.clock() - t1) * 1000)
	print ("[nether] generate chunk " .. chugent .. " ms")
end)

function make_portal(pos)
	local p1, p2 = is_portal(pos)
	if not p1 or not p2 then
		return false
	end

	for d = 1, 2 do
	for y = p1.y + 1, p2.y - 1 do
		local p
		if p1.z == p2.z then
			p = {x = p1.x + d, y = y, z = p1.z}
		else
			p = {x = p1.x, y = y, z = p1.z + d}
		end
		if minetest.get_node(p).name ~= "air" then
			return false
		end
	end
	end

	local param2
	if p1.z == p2.z then
		param2 = 0
	else
		param2 = 1
	end

	local target = {x = p1.x, y = p1.y, z = p1.z}
	target.x = target.x + 1
	if target.y < NETHER_DEPTH then
		target.y = find_surface_target_y(target.x, target.z, -16)
	else
		local start_y = NETHER_DEPTH - math.random(500, 1500) -- Search start
		target.y = find_nether_target_y(target.x, target.z, start_y)
	end

	for d = 0, 3 do
	for y = p1.y, p2.y do
		local p = {}
		if param2 == 0 then
			p = {x = p1.x + d, y = y, z = p1.z}
		else
			p = {x = p1.x, y = y, z = p1.z + d}
		end
		if minetest.get_node(p).name == "air" then
			minetest.set_node(p, {name = "nether:portal", param2 = param2})
		end
		local meta = minetest.get_meta(p)
		meta:set_string("p1", minetest.pos_to_string(p1))
		meta:set_string("p2", minetest.pos_to_string(p2))
		meta:set_string("target", minetest.pos_to_string(target))
	end
	end

	return true
end

function find_nether_target_y(target_x, target_z, start_y)
	local nobj_cave_point = minetest.get_perlin(np_cave)
	local air = 0 -- Consecutive air nodes found

	for y = start_y, start_y - 4096, -1 do
		local nval_cave = nobj_cave_point:get3d({x = target_x, y = y, z = target_z})

		if nval_cave > TCAVE then -- Cavern
			air = air + 1
		else -- Not cavern, check if 4 nodes of space above
			if air >= 4 then
				-- Check volume for non-natural nodes
				local minp = {x = target_x - 1, y = y - 1, z = target_z - 2}
				local maxp = {x = target_x + 2, y = y + 3, z = target_z + 2}
				if volume_is_natural(minp, maxp) then
					return y + 2
				else -- Restart search a little lower
					find_nether_target_y(target_x, target_z, y - 16)
				end
			else -- Not enough space, reset air to zero
				air = 0
			end
		end
	end

	return start_y -- Fallback
end


function find_surface_target_y(target_x, target_z, start_y)
	for y = start_y, start_y - 256, -16 do
		-- Check volume for non-natural nodes
		local minp = {x = target_x - 1, y = y - 1, z = target_z - 2}
		local maxp = {x = target_x + 2, y = y + 3, z = target_z + 2}
		if volume_is_natural(minp, maxp) then
			return y
		end
	end

	return y -- Fallback
end
