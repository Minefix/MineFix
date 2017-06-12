-- mods/default/nodes.lua

--[[ Node name convention:

Although many node names are in combined-word form, the required form for new
node names is words separated by underscores. If both forms are used in written
language (for example pinewood and pine wood) the underscore form should be used.

--]]


--[[ Index:

Stone
-----
(1. Material 2. Cobble variant 3. Brick variant 4. Modified forms)

default:stone
default:cobblestone
default:stonebrick
default:cobblestone_mossy

default:sandstone_normal
default:sandstone_chiseled
default:sandstone_smooth

default:sandstone_red_normal
default:sandstone_red_chiseled
default:sandstone_red_smooth

default:obsidian

Soft / Non-Stone
----------------
(1. Material 2. Modified forms)

default:dirt
default:dirt_coarse
default:dirt_with_grass
default:dirt_with_snow

default:sand
default:sand_red

default:gravel

default:clayblock

default:snow
default:snowblock

default:ice

Trees
-----
(1. Trunk 2. Fabricated trunk 3. Leaves 4. Sapling 5. Fruits)

default:wood_oak
default:planks_oak
default:leaves_oak
default:sapling_oak
default:apple

default:wood_birch
default:planks_birch
default:leaves_birch
default:sapling_birch

default:wood_jungle
default:planks_jungle
default:leaves_jungle
default:sapling_jungle

default:wood_spruce
default:planks_spruce
default:leaves_spruce
default:sapling_spruce

default:wood_acacia
default:planks_acacia
default:leaves_acacia
default:sapling_acacia

Ores
----
(1. In stone 2. Blocks)

default:stone_with_coal
default:coalblock

default:stone_with_iron
default:ironblock

default:stone_with_gold
default:goldblock

default:stone_with_diamond
default:diamondblock

Plantlife
---------

default:dry_shrub
default:junglegrass

default:grass_1
default:grass_2
default:grass_3
default:grass_4
default:grass_5

Liquids
-------
(1. Source 2. Flowing)

default:water_source
default:water_flowing

default:lava_source
default:lava_flowing

Tools / "Advanced" crafting / Non-"natural"
-------------------------------------------

default:torch

default:chest
default:chest_locked

default:bookshelf

default:sign_wall_wood

default:ladder_wood

default:fence_wood
default:fence_acacia_wood
default:fence_junglewood
default:fence_pine_wood
default:fence_aspen_wood

default:glass

default:brickblock

--]]

--
-- Stone
--

minetest.register_node("default:stone", {
	description = "Stone",
	category = "building",
	tiles = {"default_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:cobblestone',
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:cobblestone", {
	description = "Cobblestone",
	category = "building",
	tiles = {"default_cobblestone.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stonebrick", {
	description = "Stone Brick",
	category = "building",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_stone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:cobblestone_mossy", {
	description = "Mossy Cobblestone",
	category = "building",
	tiles = {"default_cobblestone_mossy.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

-- Stones

minetest.register_node("default:andesite", {
	description = "Andesite",
	category = "building",
	tiles = {"default_andesite.png"},
	is_ground_content = true,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:andesite_polished", {
	description = "Polished Andesite",
	category = "building",
	tiles = {"amf_default_andesite_polished.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:diorite", {
	description = "Diorite",
	category = "building",
	tiles = {"default_diorite.png"},
	is_ground_content = true,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:diorite_polished", {
	description = "Polished Diorite",
	category = "building",
	tiles = {"default_diorite_polished.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:granite", {
	description = "Granite",
	category = "building",
	tiles = {"default_granite.png"},
	is_ground_content = true,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:granite_polished", {
	description = "Polished Granite",
	category = "building",
	tiles = {"default_granite_polished.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:sandstone_normal", {
	description = "Sandstone",
	category = "building",
	tiles = {"default_sandstone_top.png", "default_sandstone_bottom.png", "default_sandstone_normal.png"},
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:sandstone_chiseled", {
	description = "Chiseled Sandstone",
	category = "building",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_sandstone_top.png", "default_sandstone_bottom.png", "default_sandstone_chiseled.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:sandstone_smooth", {
	description = "Smooth Sandstone",
	category = "building",
	tiles = {"default_sandstone_top.png", "default_sandstone_bottom.png", "default_sandstone_smooth.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:sandstone_red_normal", {
        description = "Red Sandstone",
        category = "building",
        tiles = {"default_sandstone_red_top.png", "default_sandstone_red_bottom.png", "default_sandstone_red_normal.png"},
        groups = {crumbly = 1, cracky = 3},
        sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:sandstone_red_chiseled", {
        description = "Red Chiseled Sandstone",
        category = "building",
        paramtype2 = "facedir",
        place_param2 = 0,
        tiles = {"default_sandstone_red_top.png", "default_sandstone_red_bottom.png", "default_sandstone_red_chiseled.png"},
        is_ground_content = false,
        groups = {cracky = 2},
        sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:sandstone_red_smooth", {
        description = "Red Smooth Sandstone",
        category = "building",
        tiles = {"default_sandstone_red_top.png", "default_sandstone_red_bottom.png", "default_sandstone_red_smooth.png"},
        is_ground_content = false,
        groups = {cracky = 2},
        sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:obsidian", {
	description = "Obsidian",
	category = "building",
	tiles = {"default_obsidian.png"},
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},
})

--
-- Soft / Non-Stone
--

minetest.register_node("default:dirt", {
	description = "Dirt",
	category = "building",
	tiles = {"default_dirt.png"},
	groups = {crumbly = 3, soil = 1},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("default:dirt_coarse", {
        description = "Coarse Dirt",
        category = "building",
        tiles = {"default_dirt_coarse.png"},
        groups = {crumbly = 3, soil = 1},
        sounds = default.node_sound_dirt_defaults(),
        on_rightclick = default.tilltodirt
})

minetest.register_node("default:podzol", {
        description = "Podzol",
        category = "building",
        tiles = {"default_podzol_top.png", "default_podzol_side.png"},
        groups = {crumbly = 3, soil = 1},
        sounds = default.node_sound_dirt_defaults(),
        on_rightclick = default.tilltodirt
})

minetest.register_node("default:dirt_with_grass", {
	description = "Dirt with Grass",
	category = "building",
	tiles = {"default_grass.png", "default_dirt.png",
		{name = "default_dirt.png^default_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("default:dirt_with_snow", {
	description = "Dirt with Snow",
	category = "building",
	tiles = {"default_snow.png", "default_dirt.png",
		{name = "default_dirt.png^default_snow_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.15},
	}),
})

minetest.register_node("default:grasspath", {
	description = "Grass path",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.4375, 0.5}, -- Block
		}
	},
	tiles = {"default_grasspath_top.png", "default_grasspath_side.png"},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("default:sand", {
	description = "Sand",
	category = "building",
	tiles = {"default_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("default:sand_red", {
        description = "Red Sand",
        category = "building",
        tiles = {"default_sand_red.png"},
        groups = {crumbly = 3, falling_node = 1, sand = 1},
        sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("default:gravel", {
	description = "Gravel",
	category = "building",
	tiles = {"default_gravel.png"},
	groups = {crumbly = 2, falling_node = 1},
	sounds = default.node_sound_gravel_defaults(),
	drop = {
		max_items = 1,
		items = {
			{items = {'default:flint'}, rarity = 16},
			{items = {'default:gravel'}}
		}
	}
})


-- Clay

minetest.register_node("default:clayblock", {
	description = "Clay",
	category = "building",
	tiles = {"default_clay_block.png"},
	groups = {crumbly = 3},
	drop = 'default:clay 4',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:clayblock_hardened", {
	description = "Terracotta",
	category = "building",
	tiles = {"default_clay_block_hardened.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:clayblock_hardened',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:clayblock_hardened_black", {
	description = "Black Terracotta",
	category = "building",
	tiles = {"default_clay_block_hardened_black.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:clayblock_hardened_black',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:clayblock_hardened_blue", {
	description = "Blue Terracotta",
	category = "building",
	tiles = {"default_clay_block_hardened_blue.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:clayblock_hardened_blue',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:clayblock_hardened_brown", {
	description = "Brown Terracotta",
	category = "building",
	tiles = {"default_clay_block_hardened_brown.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:clayblock_hardened_brown',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:clayblock_hardened_cyan", {
	description = "Cyan Terracotta",
	category = "building",
	tiles = {"default_clay_block_hardened_cyan.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:clayblock_hardened_cyan',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:clayblock_hardened_gray", {
	description = "Gray Terracotta",
	category = "building",
	tiles = {"default_clay_block_hardened_gray.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:clayblock_hardened_gray',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:clayblock_hardened_green", {
	description = "Green Terracotta",
	category = "building",
	tiles = {"default_clay_block_hardened_green.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:clayblock_hardened_green',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:clayblock_hardened_light_blue", {
	description = "Light Blue Terracotta",
	category = "building",
	tiles = {"default_clay_block_hardened_light_blue.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:clayblock_hardened_light_blue',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:clayblock_hardened_light_gray", {
	description = "Light Gray Terracotta",
	category = "building",
	tiles = {"default_clay_block_hardened_light_gray.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:clayblock_hardened_light_gray',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:clayblock_hardened_lime_green", {
	description = "Lime Green Terracotta",
	category = "building",
	tiles = {"default_clay_block_hardened_lime_green.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:clayblock_hardened_lime_green',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:clayblock_hardened_magenta", {
	description = "Magenta Terracotta",
	category = "building",
	tiles = {"default_clay_block_hardened_magenta.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:clayblock_hardened_magenta',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:clayblock_hardened_orange", {
	description = "Orange Terracotta",
	category = "building",
	tiles = {"default_clay_block_hardened_orange.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:clayblock_hardened_orange',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:clayblock_hardened_pink", {
	description = "Pink Terracotta",
	category = "building",
	tiles = {"default_clay_block_hardened_pink.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:clayblock_hardened_pink',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:clayblock_hardened_purple", {
	description = "Purple Terracotta",
	category = "building",
	tiles = {"default_clay_block_hardened_purple.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:clayblock_hardened_purple',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:clayblock_hardened_red", {
	description = "Red Terracotta",
	category = "building",
	tiles = {"default_clay_block_hardened_red.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:clayblock_hardened_red',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:clayblock_hardened_white", {
	description = "White Terracotta",
	category = "building",
	tiles = {"default_clay_block_hardened_white.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:clayblock_hardened_white',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:clayblock_hardened_yellow", {
	description = "Yellow Terracotta",
	category = "building",
	tiles = {"default_clay_block_hardened_yellow.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:clayblock_hardened_yellow',
	sounds = default.node_sound_stone_defaults(),
})




minetest.register_node("default:snow", {
	description = "Snow",
	category = "building",
	tiles = {"default_snow.png"},
	inventory_image = "default_snowball.png",
	wield_image = "default_snowball.png",
	paramtype = "light",
	buildable_to = true,
	floodable = true,
	walkable = false,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
		},
	},
	groups = {crumbly = 3, falling_node = 1, puts_out_fire = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.15},
		dug = {name = "default_snow_footstep", gain = 0.2},
		dig = {name = "default_snow_footstep", gain = 0.2}
	}),

	on_construct = function(pos)
		pos.y = pos.y - 1
		if minetest.get_node(pos).name == "default:dirt_with_grass" then
			minetest.set_node(pos, {name = "default:dirt_with_snow"})
		end
	end,
})

minetest.register_node("default:snowblock", {
	description = "Snow Block",
	category = "building",
	tiles = {"default_snow.png"},
	groups = {crumbly = 3, puts_out_fire = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.15},
		dug = {name = "default_snow_footstep", gain = 0.2},
		dig = {name = "default_snow_footstep", gain = 0.2}
	}),
})

minetest.register_node("default:ice", {
	description = "Ice",
	category = "building",
	tiles = {"default_ice.png"},
	is_ground_content = false,
	paramtype = "light",
	groups = {cracky = 3, puts_out_fire = 1},
	sounds = default.node_sound_glass_defaults(),
})

--
-- Trees
--

minetest.register_node("default:wood_oak", {
	description = "Oak Wood",
	category = "building",
	tiles = {"default_wood_oak_top.png", "default_wood_oak_top.png", "default_wood_oak.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {wood = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("default:planks_oak", {
	description = "Oak Wood Planks",
	category = "building",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_planks_oak.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, planks = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:sapling_oak", {
	description = "Oak Sapling",
	category = "decoration",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_sapling_oak.png"},
	inventory_image = "default_sapling_oak.png",
	wield_image = "default_sapling_oak.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"default:sapling_oak",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 6, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

minetest.register_node("default:leaves_oak", {
	description = "Oak Leaves",
	category = "decoration",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.3,
	tiles = {"default_leaves_oak.png"},
	special_tiles = {"default_leaves_oak_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/20 (5%) chance
				items = {'default:sapling_oak'},
				rarity = 20,
			},
			{
				items = {'default:apple'},
				rarity = 200,
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})

minetest.register_node("default:wood_darkoak", {
	description = "Dark Oak Wood",
	category = "building",
	tiles = {"default_wood_darkoak_top.png", "default_wood_darkoak_top.png", "default_wood_darkoak.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {wood = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("default:planks_darkoak", {
	description = "Dark Oak Wood Planks",
	category = "building",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_planks_darkoak.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, planks = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:sapling_darkoak", {
	description = "Dark Oak Sapling",
	category = "decoration",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_sapling_darkoak.png"},
	inventory_image = "default_sapling_darkoak.png",
	wield_image = "default_sapling_darkoak.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"default:sapling_darkoak",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 6, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

minetest.register_node("default:leaves_darkoak", {
	description = "Dark Oak Leaves",
	category = "decoration",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.3,
	tiles = {"default_leaves_darkoak.png"},
	special_tiles = {"default_leaves_darkoak_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/20 (5%) chance
				items = {'default:sapling_darkoak'},
				rarity = 20,
			},
			{
				items = {'default:apple'},
				rarity = 200,
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})

minetest.register_node("default:wood_jungle", {
	description = "Jungle Wood",
	category = "building",
	tiles = {"default_wood_jungle_top.png", "default_wood_jungle_top.png", "default_wood_jungle.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {wood = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("default:planks_jungle", {
	description = "Jungle Wood Planks",
	category = "building",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_planks_jungle.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, planks = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:leaves_jungle", {
	description = "Jungle Leaves",
	category = "decoration",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.3,
	tiles = {"default_leaves_jungle.png"},
	special_tiles = {"default_leaves_jungle_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/40 (2.5%) chance
				items = {'default:sapling_jungle'},
				rarity = 40
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})

minetest.register_node("default:sapling_jungle", {
	description = "Jungle Sapling",
	category = "decoration",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_sapling_jungle.png"},
	inventory_image = "default_sapling_jungle.png",
	wield_image = "default_sapling_jungle.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"default:sapling_jungle",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 15, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})


minetest.register_node("default:wood_spruce", {
	description = "Spruce Wood",
	category = "building",
	tiles = {"default_wood_spruce_top.png", "default_wood_spruce_top.png", "default_wood_spruce.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {wood = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("default:planks_spruce", {
	description = "Spruce Wood Planks",
	category = "building",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_planks_spruce.png"},
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, planks = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:leaves_spruce",{
	description = "Spruce Leaves",
	category = "decoration",
	drawtype = "allfaces_optional",
	visual_scale = 1.3,
	tiles = {"default_leaves_spruce.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:sapling_spruce"}, rarity = 20},
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})

minetest.register_node("default:sapling_spruce", {
	description = "Spruce Sapling",
	category = "decoration",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_sapling_spruce.png"},
	inventory_image = "default_sapling_spruce.png",
	wield_image = "default_sapling_spruce.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 3,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"default:sapling_spruce",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 12, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})


minetest.register_node("default:wood_acacia", {
	description = "Acacia Wood",
	category = "building",
	tiles = {"default_wood_acacia_top.png", "default_wood_acacia_top.png", "default_wood_acacia.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {wood = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("default:planks_acacia", {
	description = "Acacia Wood Planks",
	category = "building",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_planks_acacia.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, planks = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:leaves_acacia", {
	description = "Acacia Leaves",
	category = "decoration",
	drawtype = "allfaces_optional",
	visual_scale = 1.3,
	tiles = {"default_leaves_acacia.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {"default:sapling_acacia"},
				rarity = 20
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})

minetest.register_node("default:sapling_acacia", {
	description = "Acacia Sapling",
	category = "decoration",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_sapling_acacia.png"},
	inventory_image = "default_sapling_acacia.png",
	wield_image = "default_sapling_acacia.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"default:sapling_acacia",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -4, y = 1, z = -4},
			{x = 4, y = 6, z = 4},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

minetest.register_node("default:wood_birch", {
	description = "Birch Tree",
	category = "building",
	tiles = {"default_wood_birch_top.png", "default_wood_birch_top.png", "default_wood_birch.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {wood = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("default:planks_birch", {
	description = "Birch Wood Planks",
	category = "building",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_planks_birch.png"},
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, planks = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:leaves_birch", {
	description = "Birch Leaves",
	category = "decoration",
	drawtype = "allfaces_optional",
	visual_scale = 1.3,
	tiles = {"default_leaves_birch.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {"default:sapling_birch"},
				rarity = 20
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})

minetest.register_node("default:sapling_birch", {
	description = "Birch Sapling",
	category = "decoration",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_sapling_birch.png"},
	inventory_image = "default_sapling_birch.png",
	wield_image = "default_sapling_birch.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 3,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"default:sapling_birch",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 12, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

--
-- Ores
--

minetest.register_node("default:stone_with_coal", {
	description = "Coal Ore",
	category = "building",
	tiles = {"default_coal_ore.png"},
	groups = {cracky = 3},
	drop = "default:coal",
	experience = {0, 2}, -- Drop between 0 and 2 experience
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:coalblock", {
	description = "Coal Block",
	category = "building",
	tiles = {"default_coal_block.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("default:stone_with_iron", {
	description = "Iron Ore",
	category = "building",
	tiles = {"default_iron_ore.png"},
	groups = {cracky = 2},
	drop = "default:stone_with_iron",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:ironblock", {
	description = "Iron Block",
	category = "building",
	tiles = {"default_iron_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("default:stone_with_gold", {
	description = "Gold Ore",
	category = "building",
	tiles = {"default_gold_ore.png"},
	groups = {cracky = 2},
	drop = "default:stone_with_gold",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:goldblock", {
	description = "Gold Block",
	category = "building",
	tiles = {"default_gold_block.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("default:stone_with_diamond", {
	description = "Diamond Ore",
	category = "building",
	tiles = {"default_diamond_ore.png"},
	groups = {cracky = 1},
	drop = "default:diamond",
	experience = {3, 7}, -- Drop between 0 and 2 experience
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:diamondblock", {
	description = "Diamond Block",
	category = "building",
	tiles = {"default_diamond_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("default:stone_with_lapis", {
	description = "Lapis Lazuli Ore",
	category = "building",
	tiles = {"default_lapis_ore.png"},
	groups = {cracky = 2},
	drop = {
		max_items = 8,
		items = {
			{items = {'default:dye_blue 4'}}, --Make sure it will always drop something
			{items = {'default:dye_blue 5'}, rarity = 5},
			{items = {'default:dye_blue 6'}, rarity = 6},
			{items = {'default:dye_blue 7'}, rarity = 7},
			{items = {'default:dye_blue 8'}, rarity = 8},
		}
	},
	experience = {2, 5},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:lapisblock", {
	description = "Lapis Lazuli Block",
	category = "building",
	tiles = {"default_lapis_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})

--
-- Plantlife (non-cubic)
--

minetest.register_node("default:dry_shrub", {
	description = "Dry Shrub",
	category = "decoration",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"default_dry_shrub.png"},
	inventory_image = "default_dry_shrub.png",
	wield_image = "default_dry_shrub.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},
})

minetest.register_node("default:junglegrass", {
	description = "Jungle Grass",
	category = "decoration",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.3,
	tiles = {"default_junglegrass.png"},
	inventory_image = "default_junglegrass.png",
	wield_image = "default_junglegrass.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},
})


minetest.register_node("default:grass_1", {
	description = "Grass",
	category = "decoration",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"default_grass_1.png"},
	-- Use texture of a taller grass stage in inventory
	inventory_image = "default_grass_3.png",
	wield_image = "default_grass_3.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},

	on_place = function(itemstack, placer, pointed_thing)
		-- place a random grass node
		local stack = ItemStack("default:grass_" .. math.random(1,5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("default:grass_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 5 do
	minetest.register_node("default:grass_" .. i, {
		description = "Grass",
		drawtype = "plantlike",
		waving = 1,
		tiles = {"default_grass_" .. i .. ".png"},
		inventory_image = "default_grass_" .. i .. ".png",
		wield_image = "default_grass_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		drop = "default:grass_1",
		groups = {snappy = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory = 1, grass = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
	})
end


--
-- Liquids
--

minetest.register_node("default:water_source", {
	description = "Water Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "default_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{
			name = "default_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "default:water_flowing",
	liquid_alternative_source = "default:water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1},
})

minetest.register_node("default:water_flowing", {
	description = "Flowing Water",
	drawtype = "flowingliquid",
	tiles = {"default_water.png"},
	special_tiles = {
		{
			name = "default_water_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "default_water_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "default:water_flowing",
	liquid_alternative_source = "default:water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1},
})


minetest.register_node("default:lava_source", {
	description = "Lava Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "default_lava_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
		},
	},
	special_tiles = {
		-- New-style lava source material (mostly unused)
		{
			name = "default_lava_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
			backface_culling = false,
		},
	},
	paramtype = "light",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "default:lava_flowing",
	liquid_alternative_source = "default:lava_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 4 * 2,
	post_effect_color = {a = 191, r = 255, g = 64, b = 0},
	groups = {lava = 3, liquid = 2, igniter = 1},
})

minetest.register_node("default:lava_flowing", {
	description = "Flowing Lava",
	drawtype = "flowingliquid",
	tiles = {"default_lava.png"},
	special_tiles = {
		{
			name = "default_lava_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
		{
			name = "default_lava_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
	},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "default:lava_flowing",
	liquid_alternative_source = "default:lava_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 4 * 2,
	post_effect_color = {a = 191, r = 255, g = 64, b = 0},
	groups = {lava = 3, liquid = 2, igniter = 1,
		not_in_creative_inventory = 1},
})

--
-- Tools / "Advanced" crafting / Non-"natural"
--

minetest.register_node("default:torch", {
	description = "Torch",
	category = "decoration",
	drawtype = "torchlike",
	tiles = {
		{
			name = "default_torch_on_floor_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0
			},
		},
		{
			name="default_torch_on_ceiling_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0
			},
		},
		{
			name="default_torch_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0
			},
		},
	},
	inventory_image = "default_torch_on_floor.png",
	wield_image = "default_torch_on_floor.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	light_source = default.LIGHT_MAX - 1,
	selection_box = {
		type = "wallmounted",
		wall_top = {-0.1, 0.5 - 0.6, -0.1, 0.1, 0.5, 0.1},
		wall_bottom = {-0.1, -0.5, -0.1, 0.1, -0.5 + 0.6, 0.1},
		wall_side = {-0.5, -0.3, -0.1, -0.5 + 0.3, 0.3, 0.1},
	},
	groups = {choppy = 2, dig_immediate = 3, flammable = 1, attached_node = 1},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
})

-- Workbench
minetest.register_node("default:crafting_table", {
	description = "Crafting Table",
	category = "decoration",
	tiles = {
		"default_craftingtable_top.png", "default_planks_oak.png",
		"default_craftingtable_side.png", "default_craftingtable_side.png",
		"default_craftingtable_side.png", "default_craftingtable_front.png"
	},
	paramtype2 = "facedir",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults(),
	on_rightclick = function(pos, node, clicker, itemstack)
		minetest.show_formspec(clicker:get_player_name(), "default:crafting_table",
		"size[9,8.5;]" ..
		"bgcolor[#080808BB;true]" ..
		"background[0,0;9,8.5;gui_formbg.png;true]" ..
		"label[4,0;Crafting]" ..
		"list[current_player;craft;2,0.5;3,3;]" ..
		"image[5,1.5;1,1;gui_furnace_arrow_bg.png^[transformR270]" ..
		"list[current_player;craftpreview;6,1.5;1,1;]" ..
		"label[0,3.75;Inventory]" ..
		"list[current_player;main;0,4.25;9,3;9]" ..
		"list[current_player;main;0,7.50;9,1;]"
		)
	end,
})

-- Chest
local chest_formspec =
	"size[9,8.5]" ..
	"bgcolor[#080808BB;true]" ..
	"background[5,5;1,1;gui_formbg.png;true]" ..
	"label[0,-0.1;Chest]" ..
	"list[current_name;main;0,0.3;9,3;]" ..
	"label[0,3.75;Inventory]" ..
	"list[current_player;main;0,4.25;9,3;9]" ..
	"list[current_player;main;0,7.50;9,1;]"

local function get_locked_chest_formspec(pos)
	local spos = pos.x .. "," .. pos.y .. "," .. pos.z
	local formspec =
		"size[9,8.5]" ..
		"bgcolor[#080808BB;true]" ..
		"background[5,5;1,1;gui_formbg.png;true]" ..
		"label[0,-0.1;Chest]" ..
		"list[nodemeta:" .. spos .. ";main;0,0.3;9,3;]" ..
		"label[0,3.75;Inventory]" ..
		"list[current_player;main;0,4.25;9,3;9]" ..
		"list[current_player;main;0,7.50;9,1;]"
	return formspec
end

local function has_locked_chest_privilege(meta, player)
	local name = ""
	if player then
		if minetest.check_player_privs(player, "protection_bypass") then
			return true
		end
		name = player:get_player_name()
	end
	if name ~= meta:get_string("owner") then
		return false
	end
	return true
end

minetest.register_node("default:chest", {
	description = "Chest",
	category = "decoration",
	tiles = {"default_chest_top.png", "default_chest_top.png", "default_chest_side.png",
		"default_chest_side.png", "default_chest_side.png", "default_chest_front.png"},
	paramtype2 = "facedir",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults(),

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", chest_formspec)
		local inv = meta:get_inventory()
		inv:set_size("main", 9*3)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index,
			to_list, to_index, count, player)
		minetest.log("action", player:get_player_name() ..
			" moves stuff in chest at " .. minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" moves " .. stack:get_name() ..
			" to chest at " .. minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" takes " .. stack:get_name() ..
			" from chest at " .. minetest.pos_to_string(pos))
	end,
	on_blast = function(pos)
		local drops = {}
		default.get_inventory_drops(pos, "main", drops)
		drops[#drops+1] = "default:chest"
		minetest.remove_node(pos)
		return drops
	end,
})

minetest.register_node("default:chest_locked", {
	description = "Locked Chest",
	category = "redstone",
	tiles = {"default_chest_top.png", "default_chest_top.png", "default_chest_side.png",
		"default_chest_side.png", "default_chest_side.png", "default_chest_lock.png"},
	paramtype2 = "facedir",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults(),

	after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", "Locked Chest (owned by " ..
				meta:get_string("owner") .. ")")
	end,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", "")
		local inv = meta:get_inventory()
		inv:set_size("main", 9 * 3)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main") and has_locked_chest_privilege(meta, player)
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index,
			to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		if not has_locked_chest_privilege(meta, player) then
			return 0
		end
		return count
	end,
    allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if not has_locked_chest_privilege(meta, player) then
			return 0
		end
		return stack:get_count()
	end,
    allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if not has_locked_chest_privilege(meta, player) then
			return 0
		end
		return stack:get_count()
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" moves " .. stack:get_name() ..
			" to locked chest at " .. minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" takes " .. stack:get_name()  ..
			" from locked chest at " .. minetest.pos_to_string(pos))
	end,
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		local meta = minetest.get_meta(pos)
		if has_locked_chest_privilege(meta, clicker) then
			minetest.show_formspec(
				clicker:get_player_name(),
				"default:chest_locked",
				get_locked_chest_formspec(pos)
			)
		end
		return itemstack
	end,
	on_blast = function() end,
})


local bookshelf_formspec =
	"size[8,7;]" ..
	"bgcolor[#080808BB;true]" ..
	"background[5,5;1,1;gui_formbg.png;true]" ..
	"listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]" ..
	"list[context;books;0,0.3;8,2;]" ..
	"list[current_player;main;0,2.85;8,1;]" ..
	"list[current_player;main;0,4.08;8,3;8]" ..
	"listring[context;books]" ..
	"listring[current_player;main]"

minetest.register_node("default:bookshelf", {
	description = "Bookshelf",
	category = "building",
	tiles = {"default_planks_oak.png", "default_planks_oak.png", "default_bookshelf.png",
		"default_bookshelf.png", "default_bookshelf.png", "default_bookshelf.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults(),

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", bookshelf_formspec)
		local inv = meta:get_inventory()
		inv:set_size("books", 8 * 2)
	end,
	can_dig = function(pos,player)
		local inv = minetest.get_meta(pos):get_inventory()
		return inv:is_empty("books")
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack)
		if minetest.get_item_group(stack:get_name(), "book") ~= 0 then
			return stack:get_count()
		end
		return 0
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name() ..
			" moves stuff in bookshelf at " .. minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" moves stuff to bookshelf at " .. minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" takes stuff from bookshelf at " .. minetest.pos_to_string(pos))
	end,
	on_blast = function(pos)
		local drops = {}
		default.get_inventory_drops(pos, "books", drops)
		drops[#drops+1] = "default:bookshelf"
		minetest.remove_node(pos)
		return drops
	end,
})

local function register_sign(material, desc, def)
	minetest.register_node("default:sign_wall_" .. material, {
		description = desc .. " Sign",
		category = "decoration",
		drawtype = "nodebox",
		tiles = {"default_sign_wall_" .. material .. ".png"},
		inventory_image = "default_sign_" .. material .. ".png",
		wield_image = "default_sign_" .. material .. ".png",
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		is_ground_content = false,
		walkable = false,
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.4375, 0.4375, -0.3125, 0.4375, 0.5, 0.3125},
			wall_bottom = {-0.4375, -0.5, -0.3125, 0.4375, -0.4375, 0.3125},
			wall_side   = {-0.5, -0.3125, -0.4375, -0.4375, 0.3125, 0.4375},
		},
		groups = def.groups,
		legacy_wallmounted = true,
		sounds = def.sounds,

		on_construct = function(pos)
			--local n = minetest.get_node(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("formspec", "field[text;;${text}]")
		end,
		on_receive_fields = function(pos, formname, fields, sender)
			--print("Sign at "..minetest.pos_to_string(pos).." got "..dump(fields))
			local player_name = sender:get_player_name()
			if minetest.is_protected(pos, player_name) then
				minetest.record_protection_violation(pos, player_name)
				return
			end
			local meta = minetest.get_meta(pos)
			if not fields.text then return end
			minetest.log("action", (player_name or "") .. " wrote \"" ..
				fields.text .. "\" to sign at " .. minetest.pos_to_string(pos))
			meta:set_string("text", fields.text)
			meta:set_string("infotext", '"' .. fields.text .. '"')
		end,
	})
end

register_sign("wood", "Wooden", {
	sounds = default.node_sound_wood_defaults(),
	groups = {choppy = 2, attached_node = 1, flammable = 2, oddly_breakable_by_hand = 3}
})

minetest.register_node("default:ladder_wood", {
	description = "Wooden Ladder",
	category = "decoration",
	drawtype = "signlike",
	tiles = {"default_ladder_wood.png"},
	inventory_image = "default_ladder_wood.png",
	wield_image = "default_ladder_wood.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = = <default>
		--wall_bottom = = <default>
		--wall_side = = <default>
	},
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	legacy_wallmounted = true,
	sounds = default.node_sound_wood_defaults(),
})

default.register_fence("default:fence_wood_oak", {
	description = "Wooden Fence",
	texture = "default_fence_wood_oak.png",
	inventory_image = "default_fence_overlay.png^default_wood_oak.png^default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_wood_oak.png^default_fence_overlay.png^[makealpha:255,126,126",
	material = "default:wood_oak",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence("default:fence_wood_acacia", {
	description = "Acacia Fence",
	texture = "default_fence_wood_acacia.png",
	inventory_image = "default_fence_overlay.png^default_wood_acacia.png^default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_wood_acacia.png^default_fence_overlay.png^[makealpha:255,126,126",
	material = "default:wood_acacia",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence("default:fence_wood_jungle", {
	description = "Jungle Fence",
	texture = "default_fence_wood_jungle.png",
	inventory_image = "default_fence_overlay.png^default_wood_jungle.png^default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_wood_jungle.png^default_fence_overlay.png^[makealpha:255,126,126",
	material = "default:wood_jungle",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence("default:fence_wood_spruce", {
	description = "Spruce Fence",
	texture = "default_fence_wood_spruce.png",
	inventory_image = "default_fence_overlay.png^default_wood_spruce.png^default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_wood_spruce.png^default_fence_overlay.png^[makealpha:255,126,126",
	material = "default:wood_spruce",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence("default:fence_wood_birch", {
	description = "Birch Fence",
	texture = "default_fence_wood_birch.png",
	inventory_image = "default_fence_overlay.png^default_wood_birch.png^default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_wood_birch.png^default_fence_overlay.png^[makealpha:255,126,126",
	material = "default:wood_birch",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults()
})


-- Glass

minetest.register_node("default:glass", {
	description = "Glass",
	category = "building",
	drawtype = "glasslike_framed_optional",
	tiles = {"default_glass.png", "default_glass_detail.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	drop = {}, -- Make sure it never drops anything
	groups = {cracky = 3, oddly_breakable_by_hand = 4},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("default:glass_black", {
	description = "Black Stained Glass",
	category = "building",
	drawtype = "glasslike_framed_optional",
	use_texture_alpha = true,
	tiles = {"default_glass_black.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	drop = {}, -- Make sure it never drops anything
	groups = {cracky = 3, oddly_breakable_by_hand = 4},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("default:glass_blue", {
	description = "Blue Stained Glass",
	category = "building",
	drawtype = "glasslike_framed_optional",
	use_texture_alpha = true,
	tiles = {"default_glass_blue.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	drop = {}, -- Make sure it never drops anything
	groups = {cracky = 3, oddly_breakable_by_hand = 4},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("default:glass_brown", {
	description = "Brown Stained Glass",
	category = "building",
	drawtype = "glasslike_framed_optional",
	use_texture_alpha = true,
	tiles = {"default_glass_brown.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	drop = {}, -- Make sure it never drops anything
	groups = {cracky = 3, oddly_breakable_by_hand = 4},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("default:glass_cyan", {
	description = "Cyan Stained Glass",
	category = "building",
	drawtype = "glasslike_framed_optional",
	use_texture_alpha = true,
	tiles = {"default_glass_cyan.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	drop = {}, -- Make sure it never drops anything
	groups = {cracky = 3, oddly_breakable_by_hand = 4},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("default:glass_gray", {
	description = "Gray Stained Glass",
	category = "building",
	drawtype = "glasslike_framed_optional",
	use_texture_alpha = true,
	tiles = {"default_glass_gray.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	drop = {}, -- Make sure it never drops anything
	groups = {cracky = 3, oddly_breakable_by_hand = 4},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("default:glass_green", {
	description = "Green Stained Glass",
	category = "building",
	drawtype = "glasslike_framed_optional",
	use_texture_alpha = true,
	tiles = {"default_glass_green.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	drop = {}, -- Make sure it never drops anything
	groups = {cracky = 3, oddly_breakable_by_hand = 4},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("default:glass_light_blue", {
	description = "Light Blue Stained Glass",
	category = "building",
	drawtype = "glasslike_framed_optional",
	use_texture_alpha = true,
	tiles = {"default_glass_light_blue.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	drop = {}, -- Make sure it never drops anything
	groups = {cracky = 3, oddly_breakable_by_hand = 4},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("default:glass_light_gray", {
	description = "Light Gray Stained Glass",
	category = "building",
	drawtype = "glasslike_framed_optional",
	use_texture_alpha = true,
	tiles = {"default_glass_light_gray.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	drop = {}, -- Make sure it never drops anything
	groups = {cracky = 3, oddly_breakable_by_hand = 4},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("default:glass_lime_green", {
	description = "Lime Green Stained Glass",
	category = "building",
	drawtype = "glasslike_framed_optional",
	use_texture_alpha = true,
	tiles = {"default_glass_lime_green.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	drop = {}, -- Make sure it never drops anything
	groups = {cracky = 3, oddly_breakable_by_hand = 4},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("default:glass_magenta", {
	description = "Magenta Stained Glass",
	category = "building",
	drawtype = "glasslike_framed_optional",
	use_texture_alpha = true,
	tiles = {"default_glass_magenta.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	drop = {}, -- Make sure it never drops anything
	groups = {cracky = 3, oddly_breakable_by_hand = 4},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("default:glass_orange", {
	description = "Orange Stained Glass",
	category = "building",
	drawtype = "glasslike_framed_optional",
	use_texture_alpha = true,
	tiles = {"default_glass_orange.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	drop = {}, -- Make sure it never drops anything
	groups = {cracky = 3, oddly_breakable_by_hand = 4},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("default:glass_pink", {
	description = "Pink Stained Glass",
	category = "building",
	drawtype = "glasslike_framed_optional",
	use_texture_alpha = true,
	tiles = {"default_glass_pink.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	drop = {}, -- Make sure it never drops anything
	groups = {cracky = 3, oddly_breakable_by_hand = 4},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("default:glass_purple", {
	description = "Purple Stained Glass",
	category = "building",
	drawtype = "glasslike_framed_optional",
	use_texture_alpha = true,
	tiles = {"default_glass_purple.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	drop = {}, -- Make sure it never drops anything
	groups = {cracky = 3, oddly_breakable_by_hand = 4},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("default:glass_red", {
	description = "Red Stained Glass",
	category = "building",
	drawtype = "glasslike_framed_optional",
	use_texture_alpha = true,
	tiles = {"default_glass_red.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	drop = {}, -- Make sure it never drops anything
	groups = {cracky = 3, oddly_breakable_by_hand = 4},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("default:glass_white", {
	description = "White Stained Glass",
	category = "building",
	drawtype = "glasslike_framed_optional",
	use_texture_alpha = true,
	tiles = {"default_glass_white.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	drop = {}, -- Make sure it never drops anything
	groups = {cracky = 3, oddly_breakable_by_hand = 4},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("default:glass_yellow", {
	description = "Yellow Stained Glass",
	category = "building",
	drawtype = "glasslike_framed_optional",
	use_texture_alpha = true,
	tiles = {"default_glass_yellow.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	drop = {}, -- Make sure it never drops anything
	groups = {cracky = 3, oddly_breakable_by_hand = 4},
	sounds = default.node_sound_glass_defaults(),
})




minetest.register_node("default:brickblock", {
	description = "Bricks",
	category = "building",
	paramtype2 = "facedir",
	tiles = {"default_brick_block.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:anvil", {
	description = "Anvil",
	category = "decoration",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"default_anvil_top_0.png", "default_anvil_base.png", "default_anvil_base.png",
"default_anvil_base.png", "default_anvil_base.png", "default_anvil_base.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, -0.25, 0.375}, -- Base
			{-0.3125, -0.5, -0.25, 0.3125, -0.1875, 0.25}, -- PoleBase
			{-0.25, -0.1875, -0.125, 0.25, 0.125, 0.125}, -- Pole
			{-0.5, 0.125, -0.3125, 0.5, 0.5, 0.3125}, -- Block
		}
	},
})


-- Wool
minetest.register_node("default:wool_black", {
	description = "Black Wool",
	category = "building",
	tiles = {"default_wool_black.png"},
	is_ground_content = false,
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3,
			flammable = 3, wool = 1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("default:wool_blue", {
	description = "Blue Wool",
	category = "building",
	tiles = {"default_wool_blue.png"},
	is_ground_content = false,
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3,
			flammable = 3, wool = 1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("default:wool_brown", {
	description = "Brown Wool",
	category = "building",
	tiles = {"default_wool_brown.png"},
	is_ground_content = false,
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3,
			flammable = 3, wool = 1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("default:wool_cyan", {
	description = "Cyan Wool",
	category = "building",
	tiles = {"default_wool_cyan.png"},
	is_ground_content = false,
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3,
			flammable = 3, wool = 1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("default:wool_gray", {
	description = "Gray Wool",
	category = "building",
	tiles = {"default_wool_gray.png"},
	is_ground_content = false,
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3,
			flammable = 3, wool = 1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("default:wool_green", {
	description = "White Wool",
	category = "building",
	tiles = {"default_wool_green.png"},
	is_ground_content = false,
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3,
			flammable = 3, wool = 1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("default:wool_light_blue", {
	description = "Light Blue Wool",
	category = "building",
	tiles = {"default_wool_light_blue.png"},
	is_ground_content = false,
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3,
			flammable = 3, wool = 1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("default:wool_light_gray", {
	description = "Light Gray Wool",
	category = "building",
	tiles = {"default_wool_light_gray.png"},
	is_ground_content = false,
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3,
			flammable = 3, wool = 1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("default:wool_lime_green", {
	description = "Lime Green Wool",
	category = "building",
	tiles = {"default_wool_lime_green.png"},
	is_ground_content = false,
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3,
			flammable = 3, wool = 1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("default:wool_magenta", {
	description = "Magenta Wool",
	category = "building",
	tiles = {"default_wool_magenta.png"},
	is_ground_content = false,
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3,
			flammable = 3, wool = 1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("default:wool_orange", {
	description = "Orange Wool",
	category = "building",
	tiles = {"default_wool_orange.png"},
	is_ground_content = false,
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3,
			flammable = 3, wool = 1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("default:wool_pink", {
	description = "Pink Wool",
	category = "building",
	tiles = {"default_wool_pink.png"},
	is_ground_content = false,
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3,
			flammable = 3, wool = 1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("default:wool_purple", {
	description = "Purple Wool",
	category = "building",
	tiles = {"default_wool_purple.png"},
	is_ground_content = false,
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3,
			flammable = 3, wool = 1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("default:wool_red", {
	description = "Red Wool",
	category = "building",
	tiles = {"default_wool_red.png"},
	is_ground_content = false,
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3,
			flammable = 3, wool = 1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("default:wool_white", {
	description = "White Wool",
	category = "building",
	tiles = {"default_wool_white.png"},
	is_ground_content = false,
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3,
			flammable = 3, wool = 1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("default:wool_yellow", {
	description = "Yellow Wool",
	category = "building",
	tiles = {"default_wool_yellow.png"},
	is_ground_content = false,
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3,
			flammable = 3, wool = 1},
	sounds = default.node_sound_defaults(),
})
