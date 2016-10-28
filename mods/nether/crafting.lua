minetest.register_craft({
	output = "nether:brick 1",
	recipe = {
		{"nether:brick_bar", "nether:brick_bar"},
		{"nether:brick_bar", "nether:brick_bar"},
	}
})

minetest.register_craft({
	output = "nether:fence_nether_brick 6",
	recipe = {
		{"nether:brick", "nether:brick", "nether:brick"},
		{"nether:brick", "nether:brick", "nether:brick"},
	},
})

minetest.register_craft({
	type = "cooking",
	output = "default:nether_brick_bar",
	recipe = "default:nether_rack",
	cooktime = 10,
})
