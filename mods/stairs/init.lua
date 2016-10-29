-- Minetest 0.4 mod: stairs
-- See README.txt for licensing and other information.


-- Global namespace for functions

stairs = {}


-- Get setting for replace ABM

local replace = minetest.setting_getbool("enable_stairs_replace_abm")


-- Register stairs.
-- Node will be called stairs:stair_<subname>

function stairs.register_stair(subname, recipeitem, groups, images, description, sounds)
	groups.stair = 1
	minetest.register_node(":stairs:stair_" .. subname, {
		description = description,
		category = "building",
		drawtype = "mesh",
		mesh = "stairs_stair.obj",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = groups,
		sounds = sounds,
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
			},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y - 1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	})

	-- for replace ABM
	if replace then
		minetest.register_node(":stairs:stair_" .. subname .. "upside_down", {
			replace_name = "stairs:stair_" .. subname,
			groups = {slabs_replace = 1},
		})
	end

	if recipeitem then
		minetest.register_craft({
			output = 'stairs:stair_' .. subname .. ' 8',
			recipe = {
				{recipeitem, "", ""},
				{recipeitem, recipeitem, ""},
				{recipeitem, recipeitem, recipeitem},
			},
		})

		-- Flipped recipe for the silly minecrafters
		minetest.register_craft({
			output = 'stairs:stair_' .. subname .. ' 8',
			recipe = {
				{"", "", recipeitem},
				{"", recipeitem, recipeitem},
				{recipeitem, recipeitem, recipeitem},
			},
		})
	end
end


local ownRotation = {
	[0] = 8,
	[1] = 0,
	[2] = 2,
	[3] = 1,
	[4] = 3,
	[5] = 4
}
local placeRotation = {
	[0] = 0, -- y axis
	[1] = 20, -- y -axis
	[2] = 12, -- x axis
	[3] = 16, -- x -axis
	[4] = 4, -- z axis
	[5] = 8 -- z -axis
}

function stairs.register_slab(type, material, description, images, groups, sounds)
	-- First register the doubleslab block
	minetest.register_node(":stairs:doubleslab_" .. type, {
		-- Don't give it a description, so it doesn't show up in the creative inventory
		tiles = images,
		is_ground_content = false,
		groups = groups,
		sounds = sounds,
		drop = "stairs:slab_" .. type .. " 2"
	})

	minetest.register_node(":stairs:slab_" .. type, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
		category = "building",
		on_place = function(itemstack, player, targetblock)
			local under = minetest.get_node(targetblock.under)
			local wield_item = itemstack:get_name()

			if under and wield_item == under.name then
				local targetDirection = minetest.dir_to_facedir(vector.subtract(targetblock.above, targetblock.under), true)

				local p2 = under.param2

				-- Check if the placing slab has the same direction as the already placed slab
				if ownRotation[math.floor(p2 / 4)] == targetDirection then
					-- Set the old slab to the new double slab block
					minetest.set_node(targetblock.under, {name = "stairs:doubleslab_" .. type})

					-- If the player is in creative mode, remove the slab he placed from his inventory
					if not minetest.setting_getbool("creative_mode") then
						itemstack:take_item()
					end

					return itemstack
				end

				--[[
				This is broken! Doesn't work properly for sideways slabs, but that needs to be removed anyway
				Please have a look at it
				]]--
				-- Placing a slab on an upside down slab should make it right-side up.
				if p2 >= 20 and targetDirection == 8 then
					p2 = p2 - 20
				-- Same for the opposite case: slab below normal slab
				elseif p2 <= 3 and targetDirection == 4 then
					p2 = p2 + 20
				end

				-- Else attempt to place node with proper param2
				minetest.item_place_node(ItemStack(wield_item), player, targetblock, p2)
				if not minetest.setting_getbool("creative_mode") then
					itemstack:take_item()
				end

				return itemstack
			else
				-- Get position relative to the targetblock
				local direction = minetest.dir_to_wallmounted(vector.subtract(targetblock.above, targetblock.under), true)

				local rotation = placeRotation[targetDirection]; -- Set rotation to the proper direction

				if rotation == 0 or rotation == 20 then -- If the rotation is bottom or top
					rotation = rotation + minetest.dir_to_facedir(player:get_look_dir()) --Rotate the block to face the player
				end

				-- Finally place the block
				return minetest.item_place(itemstack, player, targetblock, rotation)
			end
		end
	})

	if material then
		minetest.register_craft({
			output = 'stairs:slab_' .. type .. " 6",
			recipe = {
				{material, material, material}
			},
		})
	end
end


-- Register default stairs and slabs

stairs.register_stair(
	"wood_oak",
	"default:planks_oak",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"default_planks_oak.png"},
	"Oak Wood Stairs",
	default.node_sound_wood_defaults()
)

stairs.register_stair(
	"wood_darkoak",
	"default:planks_darkoak",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"default_planks_darkoak.png"},
	"Dark Oak Wood Stairs",
	default.node_sound_wood_defaults()
)

stairs.register_stair(
	"wood_birch",
	"default:planks_birch",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"default_planks_birch.png"},
	"Birch Wood Stairs",
	default.node_sound_wood_defaults()
)

stairs.register_stair(
	"wood_jungle",
	"default:planks_jungle",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"default_planks_jungle.png"},
	"Jungle Wood Stair",
	default.node_sound_wood_defaults()
)

stairs.register_stair(
	"wood_spruce",
	"default:planks_spruce",
	{choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	{"default_planks_spruce.png"},
	"Spruce Wood Stair",
	default.node_sound_wood_defaults()
)

stairs.register_stair(
	"wood_acacia",
	"default:planks_acacia",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"default_planks_acacia.png"},
	"Acacia Wood Stair",
	default.node_sound_wood_defaults()
)

stairs.register_stair(
	"cobble",
	"default:cobble",
	{cracky = 3},
	{"default_cobble.png"},
	"Cobblestone Stair",
	default.node_sound_stone_defaults()
)

stairs.register_stair(
	"stonebrick",
	"default:stonebrick",
	{cracky = 2},
	{"default_stone_brick.png"},
	"Stone Brick Stair",
	default.node_sound_stone_defaults()
)

stairs.register_stair(
	"sandstone",
	"default:sandstone",
	{crumbly = 1, cracky = 3},
	{"default_sandstone.png"},
	"Sandstone Stair",
	default.node_sound_stone_defaults()
)

stairs.register_stair(
	"brick",
	"default:brick",
	{cracky = 3},
	{"default_brick.png"},
	"Brick Stair",
	default.node_sound_stone_defaults()
)

-- Slabs

stairs.register_slab(
	"stone",
	"default:stone",
	"Stone Slab",
	{"stairs_stone_slab.png"},
	{cracky = 3},
	default.node_sound_stone_defaults()
)

stairs.register_slab(
	"cobblestone",
	"default:cobblestone",
	"Cobblestone Slab",
	{"default_cobble.png"},
	{cracky = 3},
	default.node_sound_stone_defaults()
)

stairs.register_slab(
	"wood_oak",
	"default:planks_oak",
	"Oak Wood Slab",
	{"default_planks_oak.png"},
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	default.node_sound_wood_defaults()
)

stairs.register_slab(
	"wood_darkoak",
	"default:planks_darkoak",
	"Dark Oak Wood Slab",
	{"default_planks_darkoak.png"},
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	default.node_sound_wood_defaults()
)

stairs.register_slab(
	"wood_birch",
	"default:planks_birch",
	"Birch Wood Slab",
	{"default_planks_birch.png"},
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	default.node_sound_wood_defaults()
)

stairs.register_slab(
	"wood_jungle",
	"default:planks_jungle",
	"Jungle Wood Slab",
	{"default_planks_jungle.png"},
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	default.node_sound_wood_defaults()
)

stairs.register_slab(
	"wood_acacia",
	"default:planks_acacia",
	"Acacia Wood Slab",
	{"default_planks_acacia.png"},
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	default.node_sound_wood_defaults()
)

stairs.register_slab(
	"wood_spruce",
	"default:planks_spruce",
	"Spruce Wood Slab",
	{"default_planks_spruce.png"},
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	default.node_sound_wood_defaults()
)

stairs.register_slab(
	"stonebrick",
	"default:stonebrick",
	"Stone Brick Slab",
	{"default_stone_brick.png"},
	{cracky = 3},
	default.node_sound_stone_defaults()
)

stairs.register_slab(
	"brick",
	"default:brick",
	"Brick Slab",
	{"default_brick.png"},
	{cracky = 3},
	default.node_sound_stone_defaults()
)

stairs.register_slab(
	"sandstone",
	"default:sandstone",
	"Sandstone Slab",
	{"default_sandstone.png"},
	{cracky = 3},
	default.node_sound_stone_defaults()
)
