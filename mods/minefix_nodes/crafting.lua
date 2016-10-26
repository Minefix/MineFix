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
