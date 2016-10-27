minetest.register_craft({
	output = "minefix_carts:cart",
	recipe = {
		{"", "", ""},
		{"default:iron_ingot", "", "default:iron_ingot"},
		{"default:iron_ingot", "default:iron_ingot", "default:iron_ingot"},
	},
})

--[[ We'll implement this once we have redstone
minetest.register_craft({
	output = "minefix_carts:powerrail 2",
	recipe = {
		{"default:iron_ingot", "default:mese_crystal_fragment", "default:iron_ingot"},
		{"default:iron_ingot", "default:stick", "default:iron_ingot"},
		{"default:iron_ingot", "", "default:iron_ingot"},
	}
})

minetest.register_craft({
	output = "carts:powerrail 2",
	recipe = {
		{"default:iron_ingot", "", "default:iron_ingot"},
		{"default:iron_ingot", "default:stick", "default:iron_ingot"},
		{"default:iron_ingot", "default:mese_crystal_fragment", "default:iron_ingot"},
	}
})]]--
