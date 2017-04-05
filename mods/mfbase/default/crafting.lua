-- mods/default/crafting.lua

minetest.register_craft({
	type = "shapeless",
	output = "default:andesite 2",
	recipe = {"default:diorite", "default:cobblestone"}
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
	output = 'default:apple_gold 1',
	recipe = {
		{'default:gold_ingot', 'default:gold_ingot', 'default:gold_ingot'},
		{'default:gold_ingot', 'default:apple', 'default:gold_ingot'},
		{'default:gold_ingot', 'default:gold_ingot', 'default:gold_ingot'}
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
		{'group:coal'},
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
		{'default:coal', 'default:coal', 'default:coal'},
		{'default:coal', 'default:coal', 'default:coal'},
		{'default:coal', 'default:coal', 'default:coal'},
	}
})

minetest.register_craft({
	output = 'default:coal 9',
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
	output = 'default:brickblock',
	recipe = {
		{'default:brick', 'default:brick'},
		{'default:brick', 'default:brick'},
	}
})

minetest.register_craft({
	output = 'default:lapisblock',
	recipe = {
		{'default:dye_blue', 'default:dye_blue', 'default:dye_blue'},
		{'default:dye_blue', 'default:dye_blue', 'default:dye_blue'},
		{'default:dye_blue', 'default:dye_blue', 'default:dye_blue'},
	}
})

minetest.register_craft({
	output = 'default:lapis 9',
	recipe = {
		{'default:lapisblock'},
	}
})

minetest.register_craft({
	output = 'default:sandstone_normal',
	recipe = {
		{'default:sand', 'default:sand'},
		{'default:sand', 'default:sand'},
	}
})

minetest.register_craft({
        output = 'default:sandstone_red_normal',
        recipe = {
                {'default:sand_red', 'default:sand_red'},
                {'default:sand_red', 'default:sand_red'},
        }
})

minetest.register_craft({
        output = 'default:sandstone_smooth 4',
        recipe = {
                {'default:sandstone_normal', 'default:sandstone_normal'},
                {'default:sandstone_normal', 'default:sandstone_normal'},
        }
})

minetest.register_craft({
        output = 'default:sandstone_red_smooth 4',
        recipe = {
                {'default:sandstone_red_normal', 'default:sandstone_red_normal'},
                {'default:sandstone_red_normal', 'default:sandstone_red_normal'},
        }
})

minetest.register_craft({
        output = 'default:sandstone_chiseled',
        recipe = {
                {'stairs:slab_sandstone'},
                {'stairs:slab_sandstone'},
        }
})

minetest.register_craft({
        output = 'default:sandstone_red_chiseled',
        recipe = {
                {'stairs:slab_sandstone_red'},
                {'stairs:slab_sandstone_red'},
        }
})

-- Clay

minetest.register_craft({
	output = 'default:clayblock',
	recipe = {
		{'default:clay', 'default:clay'},
		{'default:clay', 'default:clay'},
	}
})

-- COlored Glass

minetest.register_craft({
	output = 'default:glass_black',
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:glass', 'default:dye_black', 'default:glass'},
		{'default:glass', 'default:glass', 'default:glass'},
	}
})

minetest.register_craft({
	output = 'default:glass_blue',
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:glass', 'default:dye_blue', 'default:glass'},
		{'default:glass', 'default:glass', 'default:glass'},
	}
})

minetest.register_craft({
	output = 'default:glass_brown',
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:glass', 'default:dye_brown', 'default:glass'},
		{'default:glass', 'default:glass', 'default:glass'},
	}
})

minetest.register_craft({
	output = 'default:glass_cyan',
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:glass', 'default:dye_cyan', 'default:glass'},
		{'default:glass', 'default:glass', 'default:glass'},
	}
})

minetest.register_craft({
	output = 'default:glass_gray',
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:glass', 'default:dye_gray', 'default:glass'},
		{'default:glass', 'default:glass', 'default:glass'},
	}
})

minetest.register_craft({
	output = 'default:glass_green',
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:glass', 'default:dye_green', 'default:glass'},
		{'default:glass', 'default:glass', 'default:glass'},
	}
})

minetest.register_craft({
	output = 'default:glass_light_blue',
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:glass', 'default:dye_light_blue', 'default:glass'},
		{'default:glass', 'default:glass', 'default:glass'},
	}
})

minetest.register_craft({
	output = 'default:glass_light_gray',
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:glass', 'default:dye_light_gray', 'default:glass'},
		{'default:glass', 'default:glass', 'default:glass'},
	}
})

minetest.register_craft({
	output = 'default:glass_lime_green',
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:glass', 'default:dye_lime_green', 'default:glass'},
		{'default:glass', 'default:glass', 'default:glass'},
	}
})

minetest.register_craft({
	output = 'default:glass_magenta',
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:glass', 'default:dye_magenta', 'default:glass'},
		{'default:glass', 'default:glass', 'default:glass'},
	}
})

minetest.register_craft({
	output = 'default:glass_orange',
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:glass', 'default:dye_orange', 'default:glass'},
		{'default:glass', 'default:glass', 'default:glass'},
	}
})

minetest.register_craft({
	output = 'default:glass_pink',
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:glass', 'default:dye_pink', 'default:glass'},
		{'default:glass', 'default:glass', 'default:glass'},
	}
})

minetest.register_craft({
	output = 'default:glass_purple',
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:glass', 'default:dye_purple', 'default:glass'},
		{'default:glass', 'default:glass', 'default:glass'},
	}
})

minetest.register_craft({
	output = 'default:glass_red',
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:glass', 'default:dye_red', 'default:glass'},
		{'default:glass', 'default:glass', 'default:glass'},
	}
})

minetest.register_craft({
	output = 'default:glass_white',
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:glass', 'default:dye_white', 'default:glass'},
		{'default:glass', 'default:glass', 'default:glass'},
	}
})

minetest.register_craft({
	output = 'default:glass_yellow',
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:glass', 'default:dye_yellow', 'default:glass'},
		{'default:glass', 'default:glass', 'default:glass'},
	}
})



minetest.register_craft({
	output = 'default:clayblock_hardened_black 8',
	recipe = {
		{'default:clayblock', 'default:clayblock', 'default:clayblock'},
		{'default:clayblock', 'default:dye_black', 'default:clayblock'},
		{'default:clayblock', 'default:clayblock', 'default:clayblock'}
	}
})

minetest.register_craft({
	output = 'default:clayblock_hardened_blue 8',
	recipe = {
		{'default:clayblock', 'default:clayblock', 'default:clayblock'},
		{'default:clayblock', 'default:dye_blue', 'default:clayblock'},
		{'default:clayblock', 'default:clayblock', 'default:clayblock'}
	}
})

minetest.register_craft({
	output = 'default:clayblock_hardened_brown 8',
	recipe = {
		{'default:clayblock', 'default:clayblock', 'default:clayblock'},
		{'default:clayblock', 'default:dye_brown', 'default:clayblock'},
		{'default:clayblock', 'default:clayblock', 'default:clayblock'}
	}
})

minetest.register_craft({
	output = 'default:clayblock_hardened_cyan 8',
	recipe = {
		{'default:clayblock', 'default:clayblock', 'default:clayblock'},
		{'default:clayblock', 'default:dye_cyan', 'default:clayblock'},
		{'default:clayblock', 'default:clayblock', 'default:clayblock'}
	}
})

minetest.register_craft({
	output = 'default:clayblock_hardened_gray 8',
	recipe = {
		{'default:clayblock', 'default:clayblock', 'default:clayblock'},
		{'default:clayblock', 'default:dye_gray', 'default:clayblock'},
		{'default:clayblock', 'default:clayblock', 'default:clayblock'}
	}
})

minetest.register_craft({
	output = 'default:clayblock_hardened_green 8',
	recipe = {
		{'default:clayblock', 'default:clayblock', 'default:clayblock'},
		{'default:clayblock', 'default:dye_green', 'default:clayblock'},
		{'default:clayblock', 'default:clayblock', 'default:clayblock'}
	}
})

minetest.register_craft({
	output = 'default:clayblock_hardened_light_blue 8',
	recipe = {
		{'default:clayblock', 'default:clayblock', 'default:clayblock'},
		{'default:clayblock', 'default:dye_light_blue', 'default:clayblock'},
		{'default:clayblock', 'default:clayblock', 'default:clayblock'}
	}
})

minetest.register_craft({
	output = 'default:clayblock_hardened_light_gray 8',
	recipe = {
		{'default:clayblock', 'default:clayblock', 'default:clayblock'},
		{'default:clayblock', 'default:dye_light_gray', 'default:clayblock'},
		{'default:clayblock', 'default:clayblock', 'default:clayblock'}
	}
})

minetest.register_craft({
	output = 'default:clayblock_hardened_lime_green 8',
	recipe = {
		{'default:clayblock', 'default:clayblock', 'default:clayblock'},
		{'default:clayblock', 'default:dye_lime_green', 'default:clayblock'},
		{'default:clayblock', 'default:clayblock', 'default:clayblock'}
	}
})

minetest.register_craft({
	output = 'default:clayblock_hardened_magenta 8',
	recipe = {
		{'default:clayblock', 'default:clayblock', 'default:clayblock'},
		{'default:clayblock', 'default:dye_magenta', 'default:clayblock'},
		{'default:clayblock', 'default:clayblock', 'default:clayblock'}
	}
})

minetest.register_craft({
	output = 'default:clayblock_hardened_orange 8',
	recipe = {
		{'default:clayblock', 'default:clayblock', 'default:clayblock'},
		{'default:clayblock', 'default:dye_orange', 'default:clayblock'},
		{'default:clayblock', 'default:clayblock', 'default:clayblock'}
	}
})

minetest.register_craft({
	output = 'default:clayblock_hardened_pink 8',
	recipe = {
		{'default:clayblock', 'default:clayblock', 'default:clayblock'},
		{'default:clayblock', 'default:dye_pink', 'default:clayblock'},
		{'default:clayblock', 'default:clayblock', 'default:clayblock'}
	}
})

minetest.register_craft({
	output = 'default:clayblock_hardened_purple 8',
	recipe = {
		{'default:clayblock', 'default:clayblock', 'default:clayblock'},
		{'default:clayblock', 'default:dye_purple', 'default:clayblock'},
		{'default:clayblock', 'default:clayblock', 'default:clayblock'}
	}
})

minetest.register_craft({
	output = 'default:clayblock_hardened_red 8',
	recipe = {
		{'default:clayblock', 'default:clayblock', 'default:clayblock'},
		{'default:clayblock', 'default:dye_red', 'default:clayblock'},
		{'default:clayblock', 'default:clayblock', 'default:clayblock'}
	}
})

minetest.register_craft({
	output = 'default:clayblock_hardened_white 8',
	recipe = {
		{'default:clayblock', 'default:clayblock', 'default:clayblock'},
		{'default:clayblock', 'default:dye_white', 'default:clayblock'},
		{'default:clayblock', 'default:clayblock', 'default:clayblock'}
	}
})

minetest.register_craft({
	output = 'default:clayblock_hardened_yellow 8',
	recipe = {
		{'default:clayblock', 'default:clayblock', 'default:clayblock'},
		{'default:clayblock', 'default:dye_yellow', 'default:clayblock'},
		{'default:clayblock', 'default:clayblock', 'default:clayblock'}
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


-- Dyes

minetest.register_craft({
	type = "shapeless",
	output = 'default:dye_light_blue 2',
	recipe = {'default:dye_blue', 'default:dye_white'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'default:dye_purple 2',
	recipe = {'default:dye_blue', 'default:dye_red'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'default:dye_magenta 3',
	recipe = {'default:dye_blue', 'default:dye_pink', 'default:dye_red'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'default:dye_magenta 4',
	recipe = {'default:dye_blue', 'default:dye_green', 'default:dye_red', 'default:dye_red'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'default:dye_cyan 2',
	recipe = {'default:dye_blue', 'default:dye_green'},
})

-- Wool

minetest.register_craft({
	type = "shapeless",
	output = 'default:wool_black',
	recipe = {'default:wool_white', 'default:dye_black'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'default:wool_blue',
	recipe = {'default:wool_white', 'default:dye_blue'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'default:wool_brown',
	recipe = {'default:wool_white', 'default:dye_brown'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'default:wool_cyan',
	recipe = {'default:wool_white', 'default:dye_cyan'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'default:wool_gray',
	recipe = {'default:wool_white', 'default:dye_gray'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'default:wool_green',
	recipe = {'default:wool_white', 'default:dye_green'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'default:wool_light_blue',
	recipe = {'default:wool_white', 'default:dye_light_blue'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'default:wool_light_gray',
	recipe = {'default:wool_white', 'default:dye_light_gray'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'default:wool_lime_green',
	recipe = {'default:wool_white', 'default:dye_lime_green'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'default:wool_magenta',
	recipe = {'default:wool_white', 'default:dye_magenta'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'default:wool_orange',
	recipe = {'default:wool_white', 'default:dye_orange'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'default:wool_pink',
	recipe = {'default:wool_white', 'default:dye_pink'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'default:wool_purple',
	recipe = {'default:wool_white', 'default:dye_purple'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'default:wool_red',
	recipe = {'default:wool_white', 'default:dye_red'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'default:wool_yellow',
	recipe = {'default:wool_white', 'default:dye_red'},
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
	output = "default:charcoal",
	recipe = "group:wood",
	cooktime = 10,
})

minetest.register_craft({
	type = "cooking",
	output = "default:glass",
	recipe = "group:sand",
	cooktime = 10,
})

minetest.register_craft({
	type = "cooking",
	output = "default:stone",
	recipe = "default:cobblestone",
	cooktime = 10,
})

minetest.register_craft({
	type = "cooking",
	output = "default:stone",
	recipe = "default:cobblestone_mossy",
	cooktime = 10,
})

minetest.register_craft({
	type = "cooking",
	output = "default:brick",
	recipe = "default:clay",
	cooktime = 10,
})

minetest.register_craft({
	type = "cooking",
	output = "default:coal",
	recipe = "default:stone_with_coal",
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

minetest.register_craft({
	type = "cooking",
	output = "default:lapis",
	recipe = "default:stone_with_lapis",
	cooktime = 10,
})

minetest.register_craft({
	type = "cooking",
	output = "default:dye_green",
	recipe = "farming:cactus",
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
	recipe = "group:coal",
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
