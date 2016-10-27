local modpath = minetest.get_modpath("minefix_nether")

dofile(modpath .. "/blocks.lua")
dofile(modpath .. "/items.lua")
dofile(modpath .. "/crafting.lua")
dofile(modpath .. "/mapgen.lua")

-- 3D noise



-- Functions

function build_portal(pos, target)
	local p1 = {x = pos.x - 1, y = pos.y - 1, z = pos.z}
	local p2 = {x = p1.x + 3, y = p1.y + 4, z = p1.z}

	local path = minetest.get_modpath("minefix_nether") .. "/schematics/nether_portal.mts"
	minetest.place_schematic({x = p1.x, y = p1.y, z = p1.z - 2}, path, 0, nil, true)

	for y = p1.y, p2.y do
	for x = p1.x, p2.x do
		local meta = minetest.get_meta({x = x, y = y, z = p1.z})
		meta:set_string("p1", minetest.pos_to_string(p1))
		meta:set_string("p2", minetest.pos_to_string(p2))
		meta:set_string("target", minetest.pos_to_string(target))
	end
	end
end


function volume_is_natural(minp, maxp)
	local c_air = minetest.get_content_id("air")
	local c_ignore = minetest.get_content_id("ignore")

	local vm = minetest.get_voxel_manip()
	local pos1 = {x = minp.x, y = minp.y, z = minp.z}
	local pos2 = {x = maxp.x, y = maxp.y, z = maxp.z}
	local emin, emax = vm:read_from_map(pos1, pos2)
	local area = VoxelArea:new({MinEdge = emin, MaxEdge = emax})
	local data = vm:get_data()

	for z = pos1.z, pos2.z do
	for y = pos1.y, pos2.y do
		local vi = area:index(pos1.x, y, z)
		for x = pos1.x, pos2.x do
			local id = data[vi] -- Existing node
			if id ~= c_air and id ~= c_ignore then -- These are natural
				local name = minetest.get_name_from_content_id(id)
				if not minetest.registered_nodes[name].is_ground_content then
					return false
				end
			end
			vi = vi + 1
		end
	end
	end

	return true
end


function move_check(p1, max, dir)
	local p = {x = p1.x, y = p1.y, z = p1.z}
	local d = math.abs(max - p1[dir]) / (max - p1[dir])

	while p[dir] ~= max do
		p[dir] = p[dir] + d
		if minetest.get_node(p).name ~= "default:obsidian" then
			return false
		end
	end

	return true
end


function check_portal(p1, p2)
	if p1.x ~= p2.x then
		if not move_check(p1, p2.x, "x") then
			return false
		end
		if not move_check(p2, p1.x, "x") then
			return false
		end
	elseif p1.z ~= p2.z then
		if not move_check(p1, p2.z, "z") then
			return false
		end
		if not move_check(p2, p1.z, "z") then
			return false
		end
	else
		return false
	end

	if not move_check(p1, p2.y, "y") then
		return false
	end
	if not move_check(p2, p1.y, "y") then
		return false
	end

	return true
end


function is_portal(pos)
	for d = -3, 3 do
		for y = -4, 4 do
			local px = {x = pos.x + d, y = pos.y + y, z = pos.z}
			local pz = {x = pos.x, y = pos.y + y, z = pos.z + d}

			if check_portal(px, {x = px.x + 3, y = px.y + 4, z = px.z}) then
				return px, {x = px.x + 3, y = px.y + 4, z = px.z}
			end
			if check_portal(pz, {x = pz.x, y = pz.y + 4, z = pz.z + 3}) then
				return pz, {x = pz.x, y = pz.y + 4, z = pz.z + 3}
			end
		end
	end
end


-- ABMs

minetest.register_abm({
	nodenames = {"minefix_nether:portal"},
	interval = 1,
	chance = 2,
	action = function(pos, node)
		minetest.add_particlespawner(
			32, --amount
			4, --time
			{x = pos.x - 0.25, y = pos.y - 0.25, z = pos.z - 0.25}, --minpos
			{x = pos.x + 0.25, y = pos.y + 0.25, z = pos.z + 0.25}, --maxpos
			{x = -0.8, y = -0.8, z = -0.8}, --minvel
			{x = 0.8, y = 0.8, z = 0.8}, --maxvel
			{x = 0, y = 0, z = 0}, --minacc
			{x = 0, y = 0, z = 0}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"minefix_nether_particle.png" --texture
		)
		for _, obj in ipairs(minetest.get_objects_inside_radius(pos, 1)) do
			if obj:is_player() then
				local meta = minetest.get_meta(pos)
				local target = minetest.string_to_pos(meta:get_string("target"))
				if target then
					-- force emerge of target area
					minetest.get_voxel_manip():read_from_map(target, target)
					if not minetest.get_node_or_nil(target) then
						minetest.emerge_area(
							vector.subtract(target, 4), vector.add(target, 4))
					end
					-- teleport the player
					minetest.after(3, function(obj, pos, target)
						local objpos = obj:getpos()
						objpos.y = objpos.y + 0.1 -- Fix some glitches at -8000
						if minetest.get_node(objpos).name ~= "minefix_nether:portal" then
							return
						end

						obj:setpos(target)

						local function check_and_build_portal(pos, target)
							local n = minetest.get_node_or_nil(target)
							if n and n.name ~= "minefix_nether:portal" then
								build_portal(target, pos)
								minetest.after(2, check_and_build_portal, pos, target)
								minetest.after(4, check_and_build_portal, pos, target)
							elseif not n then
								minetest.after(1, check_and_build_portal, pos, target)
							end
						end

						minetest.after(1, check_and_build_portal, pos, target)

					end, obj, pos, target)
				end
			end
		end
	end,
})
