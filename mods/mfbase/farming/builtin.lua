-- ==================
-- Items

minetest.register_craftitem("farming:wheat", {
	description = "Wheat",
	category = "materials",
	inventory_image = "farming_wheat.png",
	stack_max = 64
})

minetest.register_craftitem("farming:bread", {
	description = "Bread",
	category = "foodstuff",
	inventory_image = "farming_bread.png",
	stack_max = 64,
	on_use = minetest.item_eat(5, 6)
})

minetest.register_craft({
	output = "farming:bread",
	recipe = {
		{"farming:wheat", "farming:wheat", "farming:wheat"}
	}
})

minetest.register_craftitem("farming:potato_baked", {
	description = "Baked Potato",
	category = "foodstuff",
	inventory_image = "farming_potato_baked.png",
	stack_max = 64,
	on_use = minetest.item_eat(5, 6)
})

minetest.register_craft({
	type = "cooking",
	output = "farming:potato_baked",
	recipe = "farming:crop_potato_1", -- Not ideal...
	cooktime = 10,
})

-- ==================
-- Crops

farming.register_crop("farming:crop_wheat", {
	description = "Seeds",
	category = "materials",
	stages = 8,
	drop = {
		items = {
			{items = {"farming:wheat"}, rarity = 1},
			{items = {"farming:crop_wheat"}, rarity = 3},
			{items = {"farming:crop_wheat"}, rarity = 3},
			{items = {"farming:crop_wheat"}, rarity = 3},
		}
	},
	texture = "farming_wheat.png",
	inventory_image = "farming_wheat_seed.png",
	minlight = 9,
})

farming.register_crop("farming:crop_carrot", {
	description = "Carrot",
	category = "foodstuff",
	stages = 8,
	drop = {
		items = {
			{items = {"farming:crop_carrot"}, rarity = 1}, -- At least 1 potato drop when fully grown
			{items = {"farming:crop_carrot"}, rarity = 3},
			{items = {"farming:crop_carrot"}, rarity = 3},
			{items = {"farming:crop_carrot"}, rarity = 3},
		}
	},
	texture = "farming_carrots.png",
	inventory_image = "farming_carrot.png",
	minlight = 9,
	on_use = minetest.item_eat(3, 3.6)
})

farming.register_crop("farming:crop_potato", {
	description = "Potato",
	category = "materials",
	stages = 8,
	drop = {
		items = {
			{items = {"farming:crop_potato"}, rarity = 1}, -- At least 1 potato drop when fully grown
			{items = {"farming:crop_potato"}, rarity = 3},
			{items = {"farming:crop_potato"}, rarity = 3},
			{items = {"farming:crop_potato"}, rarity = 3},
		}
	},
	texture = "farming_potatoes.png",
	inventory_image = "farming_potato.png",
	minlight = 9,
	on_use = minetest.item_eat(1, 0.6)
})

-- ==================
-- Farm blocks

farming.register_block("farming:cactus", {
	description = "Cactus",
	category = "decoration",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, -0.4375, 0.4375, 0.5, 0.4375}, -- NodeBox1
		},
	},
	walkable = true,
	type = "block",
	drop = "farming:cactus",
	texture = {"default_cactus_top.png", "default_cactus_bottom.png", "default_cactus_side.png"},
	baseblocks = {"default:sand", "farming:cactus"},
	maxheight = 3,
})

farming.register_block("farming:reeds", {
	description = "Sugar Cane",
	category = "materials",
	drawtype = "plantlike",
	walkable = false,
	type = "block",
	drop = "farming:reeds",
	texture = {"default_papyrus.png"},
	inventory_image = "farming_reeds.png",
	baseblocks = {"default:sand", "farming:reeds"},
	maxheight = 3,
	allowneighbours = true,
	requirewater = true
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:sand"},
	sidelen = 16,
	noise_params = {
		offset = -0.012,
		scale = 0.024,
		spread = {x = 100, y = 100, z = 100},
		seed = 230,
		octaves = 3,
		persist = 0.6
	},
	y_min = 1,
	y_max = 30,
	decoration = "farming:cactus",
	height = 3,
		height_max = 4,
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:sand"},
	sidelen = 16,
	noise_params = {
		offset = -0.0003,
		scale = 0.0009,
		spread = {x = 200, y = 200, z = 200},
		seed = 230,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"desert"},
	y_min = 5,
	y_max = 31000,
	decoration = "farming:cactus",
	height = 2,
	height_max = 3,
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = -0.3,
		scale = 0.7,
		spread = {x = 100, y = 100, z = 100},
		seed = 354,
		octaves = 3,
		persist = 0.7
	},
	y_min = 1,
	y_max = 1,
	decoration = "farming:reeds",
	height = 2,
	height_max = 3,
	spawn_by = "default:water_source",
	num_spawn_by = 1,
})

-- ==================
-- Plants (melon, pumpkin)

farming.register_plant("farming:melon", {
	description = "Melon",
	description_seeds = "Melon Seeds",
	category = "building",
	category_seeds = "materials",
	stages = 8,
	texture = {"farming_melon_top.png", "farming_melon_top.png", "farming_melon_side.png"},
	texture_connected = "farming_melon_stem_connected.png",
	texture_disconnected = "farming_melon_stem_disconnected.png",
	inventory_image_seeds = "farming_melon_seeds.png",
	minlight = 9,
})

farming.register_plant("farming:pumpkin", {
	description = "Pumpkin",
	description_seeds = "Pumpkin Seeds",
	category = "building",
	category_seeds = "materials",
	stages = 8,
	texture = {"farming_pumpkin_top.png", "farming_pumpkin_top.png", "farming_pumpkin_side.png", "farming_pumpkin_side.png", "farming_pumpkin_side.png", "farming_pumpkin_face_off.png"},
	texture_connected = "farming_pumpkin_stem_connected.png",
	texture_disconnected = "farming_pumpkin_stem_disconnected.png",
	inventory_image_seeds = "farming_pumpkin_seeds.png",
	minlight = 9,
})

-- ==================
-- Hoes

minetest.register_tool("farming:hoe_wood", {
	description = "Wooden Hoe",
	category = "tools",
	inventory_image = "farming_tool_woodhoe.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level = 0,
		groupcaps = {
			crumbly = {times={[1] = 3.00, [2] = 1.60, [3] = 0.60}, uses = 60, maxlevel = 1},
			farming = {uses = 60},
		},
		damage_groups = {fleshy = 1},
	},
	on_place = farming.till
})

minetest.register_craft({
	output = "farming:hoe_wood",
	recipe = {
		{'group:wood', 'group:wood', ''},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = "farming:hoe_wood",
	recipe = {
		{'', 'group:wood', 'group:wood'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_tool("farming:hoe_stone", {
	description = "Stone Hoe",
	category = "tools",
	inventory_image = "farming_tool_stonehoe.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level = 0,
		groupcaps = {
			crumbly = {times={[1] = 3.00, [2] = 1.60, [3] = 0.60}, uses = 132, maxlevel = 1},
			farming = {uses = 132},
		},
		damage_groups = {fleshy = 1},
	},
	on_place = farming.till
})

minetest.register_craft({
	output = "farming:hoe_stone",
	recipe = {
		{'default:cobblestone', 'default:cobblestone', ''},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = "farming:hoe_stone",
	recipe = {
		{'', 'default:cobblestone', 'default:cobblestone'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_tool("farming:hoe_iron", {
	description = "Iron Hoe",
	category = "tools",
	inventory_image = "farming_tool_ironhoe.png",
	tool_capabilities = {
		full_punch_interval = 0.33,
		max_drop_level = 0,
		groupcaps = {
			crumbly = {times={[1] = 3.00, [2] = 1.60, [3] = 0.60}, uses = 251, maxlevel = 1},
			farming = {uses = 251},
		},
		damage_groups = {fleshy = 1},
	},
	on_place = farming.till
})

minetest.register_craft({
	output = "farming:hoe_iron",
	recipe = {
		{'default:iron_ingot', 'default:iron_ingot', ''},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = "farming:hoe_iron",
	recipe = {
		{'', 'default:iron_ingot', 'default:iron_ingot'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_tool("farming:hoe_gold", {
	description = "Golden Hoe",
	category = "tools",
	inventory_image = "farming_tool_goldhoe.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level = 0,
		groupcaps = {
			crumbly = {times={[1] = 3.00, [2] = 1.60, [3] = 0.60}, uses = 33, maxlevel = 1},
			farming = {uses = 33},
		},
		damage_groups = {fleshy = 1},
	},
	on_place = farming.till
})

minetest.register_craft({
	output = "farming:hoe_gold",
	recipe = {
		{'default:gold_ingot', 'default:gold_ingot', ''},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = "farming:hoe_gold",
	recipe = {
		{'', 'default:gold_ingot', 'default:gold_ingot'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_tool("farming:hoe_diamond", {
	description = "Diamond Hoe",
	category = "tools",
	inventory_image = "farming_tool_diamondhoe.png",
	tool_capabilities = {
		full_punch_interval = 0.25,
		max_drop_level = 0,
		groupcaps = {
			crumbly = {times={[1] = 3.00, [2] = 1.60, [3] = 0.60}, uses = 1562, maxlevel = 1},
			farming = {uses = 1562},
		},
		damage_groups = {fleshy = 1},
	},
	on_place = farming.till
})

minetest.register_craft({
	output = "farming:hoe_diamond",
	recipe = {
		{'default:diamond', 'default:diamond', ''},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = "farming:hoe_diamond",
	recipe = {
		{'', 'default:diamond', 'default:diamond'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})
