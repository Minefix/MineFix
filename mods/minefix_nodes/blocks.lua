-- Stones

minetest.register_node("minefix_nodes:andesite", {
	description = "Andesite",
	tiles = {"minefix_nodes_andesite.png"},
	is_ground_content = true,
	groups = {cracky = 3},
	category = "building"
})

minetest.register_node("minefix_nodes:andesite_polished", {
	description = "Polished Andesite",
	tiles = {"minefix_nodes_andesite_polished.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	category = "building"
})

minetest.register_node("minefix_nodes:diorite", {
	description = "Diorite",
	tiles = {"minefix_nodes_diorite.png"},
	is_ground_content = true,
	groups = {cracky = 3},
	category = "building"
})

minetest.register_node("minefix_nodes:diorite_polished", {
	description = "Polished Diorite",
	tiles = {"minefix_nodes_diorite_polished.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	category = "building"
})

minetest.register_node("minefix_nodes:granite", {
	description = "Granite",
	tiles = {"minefix_nodes_granite.png"},
	is_ground_content = true,
	groups = {cracky = 3},
	category = "building"
})

minetest.register_node("minefix_nodes:granite_polished", {
	description = "Polished Granite",
	tiles = {"minefix_nodes_granite_polished.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	category = "building"
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
	category = "building"
})

-- Slabs and stairs

minefix_nodes.register_slab(
	"stone",
	"default:stone",
	"Stone Slab",
	{"minefix_nodes_stone_slab.png"},
	{cracky = 3},
	default.node_sound_stone_defaults()
)

minefix_nodes.register_slab(
	"cobblestone",
	"default:cobblestone",
	"Cobblestone Slab",
	{"default_cobble.png"},
	{cracky = 3},
	default.node_sound_stone_defaults()
)

minefix_nodes.register_slab(
	"wood",
	"default:wood",
	"Oak Wood Slab",
	{"default_wood.png"},
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	default.node_sound_wood_defaults()
)

minefix_nodes.register_slab(
	"junglewood",
	"default:junglewood",
	"Jungle Wood Slab",
	{"default_junglewood.png"},
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	default.node_sound_wood_defaults()
)

minefix_nodes.register_slab(
	"stonebrick",
	"default:stonebrick",
	"Stone Brick Slab",
	{"default_stone_brick.png"},
	{cracky = 3},
	default.node_sound_stone_defaults()
)

minefix_nodes.register_slab(
	"brick",
	"default:brick",
	"Brick Slab",
	{"default_brick.png"},
	{cracky = 3},
	default.node_sound_stone_defaults()
)

minefix_nodes.register_slab(
	"sandstone",
	"default:sandstone",
	"Sandstone Slab",
	{"default_sandstone.png"},
	{cracky = 3},
	default.node_sound_stone_defaults()
)
