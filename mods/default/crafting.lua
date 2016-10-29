-- mods/default/crafting.lua

minetest.register_craft({
	type = "shapeless",
	output = "default:andesite 2",
	recipe = {"default:diorite", "default:cobble"}
})

minetest.register_craft({
	output = "default:andesite_polished 4",
	recipe = {
		{"default:andesite", "default:andesite"},
		{"default:andesite", "default:andesite"}
	}
})

minetest.register_craft({
	output = "default:diorite_polished 4",
	recipe = {
		{"default:diorite", "default:diorite"},
		{"default:diorite", "default:diorite"}
	}
})

minetest.register_craft({
	output = "default:granite_polished 4",
	recipe = {
		{"default:granite", "default:granite"},
		{"default:granite", "default:granite"}
	}
})

minetest.register_craft({
	output = 'default:planks_oak 4',
	recipe = {
		{'default:wood_oak'},
	}
})

minetest.register_craft({
	output = 'default:birch_planks 4',
	recipe = {
		{'default:birch_wood'},
	}
})

minetest.register_craft({
	output = 'default:planks_jungle 4',
	recipe = {
		{'default:wood_jungle'},
	}
})

minetest.register_craft({
	output = 'default:planks_spruce 4',
	recipe = {
		{'default:wood_spruce'},
	}
})

minetest.register_craft({
	output = 'default:planks_acacia 4',
	recipe = {
		{'default:wood_acacia'},
	}
})

minetest.register_craft({
	output = 'default:stick 4',
	recipe = {
		{'group:wood'},
	}
})

minetest.register_craft({
	output = 'default:sign_wall_wood 3',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', 'group:wood', 'group:wood'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:torch 4',
	recipe = {
		{'default:coal_lump'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:pick_wood',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:pick_stone',
	recipe = {
		{'group:stone', 'group:stone', 'group:stone'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:pick_iron',
	recipe = {
		{'default:iron_ingot', 'default:iron_ingot', 'default:iron_ingot'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = "default:pick_gold",
	recipe = {
		{"default:gold_ingot", "default:gold_ingot", "default:gold_ingot"},
		{"", "default:stick", ""},
		{"", "default:stick", ""}
	}
})

minetest.register_craft({
	output = 'default:pick_diamond',
	recipe = {
		{'default:diamond', 'default:diamond', 'default:diamond'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:shovel_wood',
	recipe = {
		{'group:wood'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:shovel_stone',
	recipe = {
		{'group:stone'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:shovel_iron',
	recipe = {
		{'default:iron_ingot'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = "default:shovel_gold",
	recipe = {
		{"default:gold_ingot"},
		{"default:stick"},
		{"default:stick"}
	}
})

minetest.register_craft({
	output = 'default:shovel_diamond',
	recipe = {
		{'default:diamond'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:axe_wood',
	recipe = {
		{'group:wood', 'group:wood'},
		{'group:wood', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:axe_stone',
	recipe = {
		{'group:stone', 'group:stone'},
		{'group:stone', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:axe_iron',
	recipe = {
		{'default:iron_ingot', 'default:iron_ingot'},
		{'default:iron_ingot', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = "default:sword_gold",
	recipe = {
		{"default:gold_ingot"},
		{"default:gold_ingot"},
		{"default:stick"}
	}
})

minetest.register_craft({
	output = 'default:axe_diamond',
	recipe = {
		{'default:diamond', 'default:diamond'},
		{'default:diamond', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:axe_wood',
	recipe = {
		{'group:wood', 'group:wood'},
		{'group:stick', 'group:wood'},
		{'group:stick',''},
	}
})

minetest.register_craft({
	output = 'default:axe_stone',
	recipe = {
		{'group:stone', 'group:stone'},
		{'group:stick', 'group:stone'},
		{'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:axe_iron',
	recipe = {
		{'default:iron_ingot', 'default:iron_ingot'},
		{'group:stick', 'default:iron_ingot'},
		{'group:stick', ''},
	}
})

minetest.register_craft({
	output = "default:axe_gold",
	recipe = {
		{"default:gold_ingot", "default:gold_ingot"},
		{"default:gold_ingot", "default:stick"},
		{"", "default:stick"}
	}
})

minetest.register_craft({
	output = "default:axe_gold",
	recipe = {
		{"default:gold_ingot", "default:gold_ingot"},
		{"default:stick", "default:gold_ingot"},
		{"default:stick", ""}
	}
})

minetest.register_craft({
	output = 'default:axe_diamond',
	recipe = {
		{'default:diamond', 'default:diamond'},
		{'group:stick', 'default:diamond'},
		{'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:sword_wood',
	recipe = {
		{'group:wood'},
		{'group:wood'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:sword_stone',
	recipe = {
		{'group:stone'},
		{'group:stone'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:sword_iron',
	recipe = {
		{'default:iron_ingot'},
		{'default:iron_ingot'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:sword_diamond',
	recipe = {
		{'default:diamond'},
		{'default:diamond'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:rail 24',
	recipe = {
		{'default:iron_ingot', '', 'default:iron_ingot'},
		{'default:iron_ingot', 'group:stick', 'default:iron_ingot'},
		{'default:iron_ingot', '', 'default:iron_ingot'},
	}
})

minetest.register_craft({
	output = 'default:chest',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', '', 'group:wood'},
		{'group:wood', 'group:wood', 'group:wood'},
	}
})

minetest.register_craft({
	output = 'default:chest_locked',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', 'default:iron_ingot', 'group:wood'},
		{'group:wood', 'group:wood', 'group:wood'},
	}
})

minetest.register_craft( {
	type = "shapeless",
	output = "default:chest_locked",
	recipe = {"default:chest", "default:iron_ingot"},
})

minetest.register_craft({
	output = 'default:furnace',
	recipe = {
		{'group:stone', 'group:stone', 'group:stone'},
		{'group:stone', '', 'group:stone'},
		{'group:stone', 'group:stone', 'group:stone'},
	}
})

minetest.register_craft({
	output = 'default:coalblock',
	recipe = {
		{'default:coal_lump', 'default:coal_lump', 'default:coal_lump'},
		{'default:coal_lump', 'default:coal_lump', 'default:coal_lump'},
		{'default:coal_lump', 'default:coal_lump', 'default:coal_lump'},
	}
})

minetest.register_craft({
	output = 'default:coal_lump 9',
	recipe = {
		{'default:coalblock'},
	}
})

minetest.register_craft({
	output = 'default:ironblock',
	recipe = {
		{'default:iron_ingot', 'default:iron_ingot', 'default:iron_ingot'},
		{'default:iron_ingot', 'default:iron_ingot', 'default:iron_ingot'},
		{'default:iron_ingot', 'default:iron_ingot', 'default:iron_ingot'},
	}
})

minetest.register_craft({
	output = 'default:iron_ingot 9',
	recipe = {
		{'default:ironblock'},
	}
})

minetest.register_craft({
	output = 'default:goldblock',
	recipe = {
		{'default:gold_ingot', 'default:gold_ingot', 'default:gold_ingot'},
		{'default:gold_ingot', 'default:gold_ingot', 'default:gold_ingot'},
		{'default:gold_ingot', 'default:gold_ingot', 'default:gold_ingot'},
	}
})

minetest.register_craft({
	output = 'default:gold_ingot 9',
	recipe = {
		{'default:goldblock'},
	}
})

minetest.register_craft({
	output = 'default:diamondblock',
	recipe = {
		{'default:diamond', 'default:diamond', 'default:diamond'},
		{'default:diamond', 'default:diamond', 'default:diamond'},
		{'default:diamond', 'default:diamond', 'default:diamond'},
	}
})

minetest.register_craft({
	output = 'default:diamond 9',
	recipe = {
		{'default:diamondblock'},
	}
})

minetest.register_craft({
	output = 'default:sandstone',
	recipe = {
		{'group:sand', 'group:sand'},
		{'group:sand', 'group:sand'},
	}
})

minetest.register_craft({
	output = 'default:sand 4',
	recipe = {
		{'default:sandstone'},
	}
})

minetest.register_craft({
	output = 'default:sandstonebrick 4',
	recipe = {
		{'default:sandstone', 'default:sandstone'},
		{'default:sandstone', 'default:sandstone'},
	}
})

minetest.register_craft({
	output = 'default:sandstone_block 9',
	recipe = {
		{'default:sandstone', 'default:sandstone', 'default:sandstone'},
		{'default:sandstone', 'default:sandstone', 'default:sandstone'},
		{'default:sandstone', 'default:sandstone', 'default:sandstone'},
	}
})

minetest.register_craft({
	output = 'default:clay',
	recipe = {
		{'default:clay_lump', 'default:clay_lump'},
		{'default:clay_lump', 'default:clay_lump'},
	}
})

minetest.register_craft({
	output = 'default:clay_lump 4',
	recipe = {
		{'default:clay'},
	}
})

minetest.register_craft({
	output = 'default:brick',
	recipe = {
		{'default:clay_brick', 'default:clay_brick'},
		{'default:clay_brick', 'default:clay_brick'},
	}
})

minetest.register_craft({
	output = 'default:clay_brick 4',
	recipe = {
		{'default:brick'},
	}
})

minetest.register_craft({
	output = 'default:paper',
	recipe = {
		{'default:papyrus', 'default:papyrus', 'default:papyrus'},
	}
})

minetest.register_craft({
	output = 'default:book',
	recipe = {
		{'default:paper'},
		{'default:paper'},
		{'default:paper'},
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "default:book_written",
	recipe = {"default:book", "default:book_written"}
})

minetest.register_craft({
	output = 'default:bookshelf',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'default:book', 'default:book', 'default:book'},
		{'group:wood', 'group:wood', 'group:wood'},
	}
})

minetest.register_craft({
	output = 'default:ladder_wood 3',
	recipe = {
		{'group:stick', '', 'group:stick'},
		{'group:stick', 'group:stick', 'group:stick'},
		{'group:stick', '', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:stonebrick 4',
	recipe = {
		{'default:stone', 'default:stone'},
		{'default:stone', 'default:stone'},
	}
})

minetest.register_craft({
	output = 'default:snowblock',
	recipe = {
		{'default:snow', 'default:snow', 'default:snow'},
		{'default:snow', 'default:snow', 'default:snow'},
		{'default:snow', 'default:snow', 'default:snow'},
	}
})

minetest.register_craft({
	output = 'default:snow 9',
	recipe = {
		{'default:snowblock'},
	}
})

--
-- Crafting (tool repair)
--
minetest.register_craft({
	type = "toolrepair",
	additional_wear = -0.02,
})

--
-- Cooking recipes
--

minetest.register_craft({
	type = "cooking",
	output = "default:glass",
	recipe = "group:sand",
	cooktime = 10,
})

minetest.register_craft({
	type = "cooking",
	output = "default:stone",
	recipe = "default:cobble",
	cooktime = 10,
})

minetest.register_craft({
	type = "cooking",
	output = "default:stone",
	recipe = "default:mossycobble",
	cooktime = 10,
})

minetest.register_craft({
	type = "cooking",
	output = "default:clay_brick",
	recipe = "default:clay_lump",
	cooktime = 10,
})

minetest.register_craft({
	type = "cooking",
	output = "default:iron_ingot",
	recipe = "default:stone_with_iron",
	cooktime = 10,
})

minetest.register_craft({
	type = "cooking",
	output = "default:gold_ingot",
	recipe = "default:stone_with_gold",
	cooktime = 10,
})

--
-- Fuels
--

-- Support use of group:tree
minetest.register_craft({
	type = "fuel",
	recipe = "group:tree",
	burntime = 15,
})

-- Support use of group:wood
minetest.register_craft({
	type = "fuel",
	recipe = "group:wood",
	burntime = 15,
})

-- Support use of group:stairs
minetest.register_craft({
	type = "fuel",
	recipe = "group:stairs",
	burntime = 5,
})

-- Support use of group:slab
minetest.register_craft({
	type = "fuel",
	recipe = "group:slab",
	burntime = 5,
})

-- Support use of group:sapling
minetest.register_craft({
	type = "fuel",
	recipe = "group:sapling",
	burntime = 5,
})


-- Regular fuels
minetest.register_craft({
	type = "fuel",
	recipe = "bucket:bucket_lava",
	burntime = 1000,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:coalblock",
	burntime = 800,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:coal_lump",
	burntime = 80,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:wood_oak",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:wood_birch",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:wood_spruce",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:wood_acacia",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:wood_jungle",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:planks_oak",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:planks_birch",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:planks_spruce",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:planks_acacia",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:planks_jungle",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:fence_wood_oak",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:fence_wood_birch",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:fence_wood_spruce",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:fence_wood_acacia",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:fence_wood_jungle",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:gate_wood_oak_closed",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:gate_wood_birch_closed",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:gate_wood_jungle_closed",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:gate_wood_spruce_closed",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:gate_wood_acacia_closed",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "stairs:stair_wood_oak",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "stairs:stair_wood_birch",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "stairs:stair_wood_jungle",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "stairs:stair_wood_spruce",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "stairs:stair_wood_acacia",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:trapdoor",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:bookshelf",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:chest",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:chest_locked",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "stairs:slab_wood_oak",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "stairs:slab_wood_birch",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "stairs:slab_wood_jungle",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "stairs:slab_wood_spruce",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "stairs:slab_wood_acacia",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:ladder_wood",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:sign_wall_wood",
	burntime = 10,
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:door_wood_oak",
	burntime = 10,
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:door_wood_birch",
	burntime = 10,
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:door_wood_jungle",
	burntime = 10,
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:door_wood_spruce",
	burntime = 10,
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:door_wood_acacia",
	burntime = 10,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:sapling_oak",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:sapling_birch",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:sapling_jungle",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:sapling_spruce",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:sapling_acacia",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:wool_black",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:wool_blue",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:wool_brown",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:wool_cyan",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:wool_gray",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:wool_green",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:wool_light_blue",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:wool_light_gray",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:wool_lime_green",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:wool_magenta",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:wool_orange",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:wool_pink",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:wool_purple",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:wool_red",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:wool_white",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:wool_yellow",
	burntime = 5,
})
