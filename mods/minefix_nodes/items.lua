minetest.register_tool("minefix_nodes:pick_gold", {
	description = "Golden pickaxe",
	inventory_image = "minefix_nodes_tool_goldpick.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 3,
		groupcaps = {
			cracky = {times = {[1] = 2.4, [2] = 1.2, [3] = 0.6}, uses = 20, maxlevel = 3},
		},
		damage_groups = {fleshy = 5},
	},
})

minetest.register_tool("minefix_nodes:shovel_gold", {
	description = "Golden shovel",
	inventory_image = "minefix_nodes_tool_goldshovel.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level = 3,
		groupcaps = {
			crumbly = {times = {[1] = 1.2, [2] = 0.6, [3] = 0.3}, uses = 20, maxlevel = 3},
		},
		damage_groups = {fleshy = 4},
	},
})

minetest.register_tool("minefix_nodes:axe_gold", {
	description = "Golden axe",
	inventory_image = "minefix_nodes_tool_goldaxe.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 3,
		groupcaps = {
			choppy = {times = {[1] = 2.2, [2] = 1.0, [3] = 0.6}, uses = 20, maxlevel = 3},
		},
		damage_groups = {fleshy = 6},
	},
})

minetest.register_tool("minefix_nodes:sword_gold", {
	description = "Golden sword",
	inventory_image = "minefix_nodes_tool_goldsword.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level = 1,
		groupcaps = {
			snappy = {times = {[1] = 2.0, [2] = 1.0, [3] = 0.35}, uses = 30, maxlevel = 3},
		},
		damage_groups = {fleshy = 7},
	},
})

minetest.register_tool("minefix_nodes:hoe_gold", {
	description = "Golden hoe",
	inventory_image = "minefix_nodes_tool_goldhoe.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 3,
		groupcaps = {
			cracky = {times = {[1] = 2.4, [2] = 1.2, [3] = 0.60}, uses = 20, maxlevel = 3},
		},
		damage_groups = {fleshy = 5},
	},
})
