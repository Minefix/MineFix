minetest.register_craft({
	type = "shapeless",
	output = "minefixnodes:andesite 2",
	recipe = {"minefixnodes:diorite", "default:cobble"}
})

minetest.register_craft({
	output = "minefixnodes:andesite_polished 4",
	recipe = {
		{"minefixnodes:andesite", "minefixnodes:andesite"},
		{"minefixnodes:andesite", "minefixnodes:andesite"}
	}
})

minetest.register_craft({
	output = "minefixnodes:diorite_polished 4",
	recipe = {
		{"minefixnodes:diorite", "minefixnodes:diorite"},
		{"minefixnodes:diorite", "minefixnodes:diorite"}
	}
})

minetest.register_craft({
	output = "minefixnodes:granite_polished 4",
	recipe = {
		{"minefixnodes:granite", "minefixnodes:granite"},
		{"minefixnodes:granite", "minefixnodes:granite"}
	}
})
