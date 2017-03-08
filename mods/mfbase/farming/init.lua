farming = {}

dofile(minetest.get_modpath("farming") .. "/functions.lua")
dofile(minetest.get_modpath("farming") .. "/builtin.lua")

minetest.register_node("farming:farmland_dry", {
	description = "Dry Farmland",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.4375, 0.5}, -- Block
		}
	},
	tiles = {"farming_farmland_dry.png", "default_dirt.png"},
	drop = "default:dirt",
	groups = {crumbly = 3, not_in_creative_inventory = 1, grassland = 1},
	sounds = default.node_sound_dirt_defaults(),
	paramtype = "none",
	param1 = 0
})

minetest.register_node("farming:farmland_wet", {
	description = "Wet Farmland",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.4375, 0.5}, -- Block
		}
	},
	tiles = {"farming_farmland_wet.png", "default_dirt.png"},
	drop = "default:dirt",
	groups = {crumbly = 3, not_in_creative_inventory = 1, grassland = 1},
	sounds = default.node_sound_dirt_defaults()
})
