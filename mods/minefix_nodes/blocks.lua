-- Stones

minetest.register_node("minefix_nodes:andesite", {
	description = "Andesite",
	tiles = {"minefix_nodes_andesite.png"},
	is_ground_content = true,
	groups = {cracky = 3}
})

minetest.register_node("minefix_nodes:andesite_polished", {
	description = "Polished Andesite",
	tiles = {"minefix_nodes_andesite_polished.png"},
	is_ground_content = false,
	groups = {cracky = 3}
})

minetest.register_node("minefix_nodes:diorite", {
	description = "Diorite",
	tiles = {"minefix_nodes_diorite.png"},
	is_ground_content = true,
	groups = {cracky = 3}
})

minetest.register_node("minefix_nodes:diorite_polished", {
	description = "Polished Diorite",
	tiles = {"minefix_nodes_diorite_polished.png"},
	is_ground_content = false,
	groups = {cracky = 3}
})

minetest.register_node("minefix_nodes:granite", {
	description = "Granite",
	tiles = {"minefix_nodes_granite.png"},
	is_ground_content = true,
	groups = {cracky = 3}
})

minetest.register_node("minefix_nodes:granite_polished", {
	description = "Polished Granite",
	tiles = {"minefix_nodes_granite_polished.png"},
	is_ground_content = false,
	groups = {cracky = 3}
})

-- Haybale

minetest.register_node("minefix_nodes:haybale", {
	description = "Haybale",
	tiles = {
		"minefix_nodes_haybale_top.png",
		"minefix_nodes_haybale_top.png",
		"minefix_nodes_haybale_side.png",
		"minefix_nodes_haybale_side.png",
		"minefix_nodes_haybale_side.png",
		"minefix_nodes_haybale_side.png"
	},
	is_ground_content = false,
	groups = {snappy=3, flammable=4, fall_damage_add_percent=-30},
	sounds = default.node_sound_leaves_defaults(),
})
