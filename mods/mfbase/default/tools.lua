-- mods/default/tools.lua

-- The hand
minetest.register_item(":", {
	type = "none",
	wield_image = "wieldhand.png",
	wield_scale = {x=1,y=1,z=2.5},
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 0,
		groupcaps = {
			cracky = {times={[1]=250, [2]=125, [3]=7.5}, uses=0, maxlevel=1},
			crumbly = {times={[1]=7.5, [2]=3.00, [3]=0.70}, uses=0, maxlevel=1},
			snappy = {times={[1]=1.90, [2]=0.60, [3]=0.40}, uses=0, maxlevel=1},
			oddly_breakable_by_hand = {times={[1]=3.50, [2]=2.00, [3]=0.70, [4]=0.50}, uses=0}
		},
		damage_groups = {fleshy=1},
	}
})

--
-- Picks
--

minetest.register_tool("default:pick_wood", {
	description = "Wooden Pickaxe",
	category = "tools",
	inventory_image = "default_tool_woodpick.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[3]=1.60}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
})
minetest.register_tool("default:pick_stone", {
	description = "Stone Pickaxe",
	category = "tools",
	inventory_image = "default_tool_stonepick.png",
	tool_capabilities = {
		full_punch_interval = 1.3,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[2]=2.0, [3]=1.00}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
})
minetest.register_tool("default:pick_iron", {
	description = "Iron Pickaxe",
	category = "tools",
	inventory_image = "default_tool_ironpick.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=4.00, [2]=1.60, [3]=0.80}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
})
minetest.register_tool("default:pick_gold", {
	description = "Golden pickaxe",
	inventory_image = "default_tool_goldpick.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 3,
		groupcaps = {
			cracky = {times = {[1] = 2.4, [2] = 1.2, [3] = 0.6}, uses = 20, maxlevel = 3},
		},
		damage_groups = {fleshy = 5},
	},
	category = "tools"
})
minetest.register_tool("default:pick_diamond", {
	description = "Diamond Pickaxe",
	category = "tools",
	inventory_image = "default_tool_diamondpick.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=2.0, [2]=1.0, [3]=0.50}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
})

--
-- Shovels
--
default.makegrasspath = function(itemstack, placer, pointed_thing) -- Change grass into a grasspath when rightclicked on with a shovel
	if minetest.get_node(pointed_thing.under).name == "default:dirt_with_grass" then
		local tool_uses = itemstack:get_tool_capabilities().groupcaps.crumbly.uses -- All shovels have the crumbly groupcap

		if tool_uses == 0 then
			return itemstack
		end

		local check_above = {x = pointed_thing.under.x, y = pointed_thing.above.y, z = pointed_thing.under.z}
		if minetest.get_node(check_above).name == "air" then
			minetest.set_node(pointed_thing.under, {name = "default:grasspath"})
			minetest.sound_play("default_dig_crumbly", {
				pos = pointed_thing.under,
				gain = 0.5,
			})

			if minetest.get_modpath("gamemode") ~= nil then
				if gamemode.get_player_gamemode(player) == "survival" then
					itemstack:add_wear(65535 / (tool_uses - 1))
				end
			else
				if not minetest.setting_getbool("creative_mode") then
					itemstack:add_wear(65535 / (tool_uses - 1))
				end
			end
		end
	else
		minetest.item_place_node(itemstack, placer, pointed_thing)
	end
end

minetest.register_tool("default:shovel_wood", {
	description = "Wooden Shovel",
	category = "tools",
	types = {"shovel"},
	inventory_image = "default_tool_woodshovel.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			crumbly = {times={[1]=3.00, [2]=1.60, [3]=0.60}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	on_place = default.makegrasspath,
})
minetest.register_tool("default:shovel_stone", {
	description = "Stone Shovel",
	category = "tools",
	types = {"shovel"},
	inventory_image = "default_tool_stoneshovel.png",
	tool_capabilities = {
		full_punch_interval = 1.4,
		max_drop_level=0,
		groupcaps={
			crumbly = {times={[1]=1.80, [2]=1.20, [3]=0.50}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	on_place = default.makegrasspath,
})
minetest.register_tool("default:shovel_iron", {
	description = "Iron Shovel",
	category = "tools",
	types = {"shovel"},
	inventory_image = "default_tool_ironshovel.png",
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.50, [2]=0.90, [3]=0.40}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=3},
	},
	on_place = default.makegrasspath,
})
minetest.register_tool("default:shovel_gold", {
	description = "Golden shovel",
	category = "tools",
	types = {"shovel"},
	inventory_image = "default_tool_goldshovel.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level = 3,
		groupcaps = {
			crumbly = {times = {[1] = 1.2, [2] = 0.6, [3] = 0.3}, uses = 20, maxlevel = 3},
		},
		damage_groups = {fleshy = 4},
	},
	on_place = default.makegrasspath,
})
minetest.register_tool("default:shovel_diamond", {
	description = "Diamond Shovel",
	category = "tools",
	types = {"shovel"},
	inventory_image = "default_tool_diamondshovel.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.10, [2]=0.50, [3]=0.30}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
	on_place = default.makegrasspath,
})

--
-- Axes
--

minetest.register_tool("default:axe_wood", {
	description = "Wooden Axe",
	category = "tools",
	inventory_image = "default_tool_woodaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=0,
		groupcaps={
			choppy = {times={[2]=3.00, [3]=1.60}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
})
minetest.register_tool("default:axe_stone", {
	description = "Stone Axe",
	category = "tools",
	inventory_image = "default_tool_stoneaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			choppy={times={[1]=3.00, [2]=2.00, [3]=1.30}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
})
minetest.register_tool("default:axe_iron", {
	description = "Iron Axe",
	category = "tools",
	inventory_image = "default_tool_ironaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.50, [2]=1.40, [3]=1.00}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
})
minetest.register_tool("default:axe_gold", {
	description = "Golden axe",
	inventory_image = "default_tool_goldaxe.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 3,
		groupcaps = {
			choppy = {times = {[1] = 2.2, [2] = 1.0, [3] = 0.6}, uses = 20, maxlevel = 3},
		},
		damage_groups = {fleshy = 6},
	},
	category = "tools"
})
minetest.register_tool("default:axe_diamond", {
	description = "Diamond Axe",
	category = "tools",
	inventory_image = "default_tool_diamondaxe.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.10, [2]=0.90, [3]=0.50}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=7},
	},
})

--
-- Swords
--

minetest.register_tool("default:sword_wood", {
	description = "Wooden Sword",
	category = "combat",
	inventory_image = "default_tool_woodsword.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	}
})
minetest.register_tool("default:sword_stone", {
	description = "Stone Sword",
	category = "combat",
	inventory_image = "default_tool_stonesword.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.4, [3]=0.40}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=4},
	}
})
minetest.register_tool("default:sword_iron", {
	description = "Iron Sword",
	category = "combat",
	inventory_image = "default_tool_ironsword.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=6},
	}
})
minetest.register_tool("default:sword_gold", {
	description = "Golden sword",
	inventory_image = "default_tool_goldsword.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level = 1,
		groupcaps = {
			snappy = {times = {[1] = 2.0, [2] = 1.0, [3] = 0.35}, uses = 30, maxlevel = 3},
		},
		damage_groups = {fleshy = 7},
	},
	category = "combat"
})
minetest.register_tool("default:sword_diamond", {
	description = "Diamond Sword",
	category = "combat",
	inventory_image = "default_tool_diamondsword.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=8},
	}
})
