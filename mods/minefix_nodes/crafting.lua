-- Gold

minetest.register_craft({
	type = "cooking",
	output = "default:gold_ingot",
	recipe = "default:stone_with_gold",
	cooktime = 10,
})

minetest.register_craft({
	output = "minefix_nodes:pick_gold",
	recipe = {
		{"default:gold_ingot", "default:gold_ingot", "default:gold_ingot"},
		{"", "default:stick", ""},
		{"", "default:stick", ""}
	}
})

minetest.register_craft({
	output = "minefix_nodes:shovel_gold",
	recipe = {
		{"default:gold_ingot"},
		{"default:stick"},
		{"default:stick"}
	}
})

minetest.register_craft({
	output = "minefix_nodes:axe_gold",
	recipe = {
		{"default:gold_ingot", "default:gold_ingot"},
		{"default:gold_ingot", "default:stick"},
		{"", "default:stick"}
	}
})

minetest.register_craft({
	output = "minefix_nodes:axe_gold",
	recipe = {
		{"default:gold_ingot", "default:gold_ingot"},
		{"default:stick", "default:gold_ingot"},
		{"default:stick", ""}
	}
})

minetest.register_craft({
	output = "minefix_nodes:hoe_gold",
	recipe = {
		{"default:gold_ingot", "default:gold_ingot"},
		{"", "default:stick"},
		{"", "default:stick"}
	}
})

minetest.register_craft({
	output = "minefix_nodes:hoe_gold",
	recipe = {
		{"default:gold_ingot", "default:gold_ingot"},
		{"default:stick", ""},
		{"default:stick", ""}
	}
})

minetest.register_craft({
	output = "minefix_nodes:sword_gold",
	recipe = {
		{"default:gold_ingot"},
		{"default:gold_ingot"},
		{"default:stick"}
	}
})

-- Stones

minetest.register_craft({
	type = "shapeless",
	output = "minefix_nodes:andesite 2",
	recipe = {"minefix_nodes:diorite", "default:cobble"}
})

minetest.register_craft({
	output = "minefix_nodes:andesite_polished 4",
	recipe = {
		{"minefix_nodes:andesite", "minefix_nodes:andesite"},
		{"minefix_nodes:andesite", "minefix_nodes:andesite"}
	}
})

minetest.register_craft({
	output = "minefix_nodes:diorite_polished 4",
	recipe = {
		{"minefix_nodes:diorite", "minefix_nodes:diorite"},
		{"minefix_nodes:diorite", "minefix_nodes:diorite"}
	}
})

minetest.register_craft({
	output = "minefix_nodes:granite_polished 4",
	recipe = {
		{"minefix_nodes:granite", "minefix_nodes:granite"},
		{"minefix_nodes:granite", "minefix_nodes:granite"}
	}
})
