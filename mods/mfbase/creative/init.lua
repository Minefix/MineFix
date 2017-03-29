local digtime = 5;
local caps = {times = {digtime, digtime, digtime}, uses = 0, maxlevel = 256}

minetest.register_item("creative:hand", {
	type = "none",
	--wield_image = "wieldhand.png",
	wield_image = "wieldhand.png",
	wield_scale = {x = 1, y = 1, z = 2.5},
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level = 3,
		groupcaps = {
			crumbly = caps,
			cracky = caps,
			snappy = caps,
			choppy = caps,
			oddly_breakable_by_hand = caps,
		},
		damage_groups = {fleshy = 10},
	}
})

minetest.register_on_joinplayer(function(player)
	if not player:get_attribute("default:gamemode") then -- Set initial gamemode
		if minetest.setting_getbool("creative_mode") then
			player:set_attribute("default:gamemode", "creative")
		else
			player:set_attribute("default:gamemode", "survival")
		end
	end

	if player:get_attribute("default:gamemode") == "creative" then
		--player:get_inventory():set_stack("hand", 1, "creative:hand")
	else
		player:get_inventory():set_stack("hand", 1, "")
	end
end)

minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack)
	if placer:get_attribute("default:gamemode") == "creative" then
		return true
	end
end)

function minetest.handle_node_drops(pos, drops, digger)
	if not digger or not digger:is_player() then
		return
	end
	if digger:get_attribute("default:gamemode") == "creative" then
		local inv = digger:get_inventory()
		if inv then
			for _, item in ipairs(drops) do
				item = ItemStack(item):get_name()
				if not inv:contains_item("main", item) then
					inv:add_item("main", item)
				end
			end
		end
	end
end

minetest.register_chatcommand("gamemode", {
	params = "<gamemode> [player]",
	description = "Sets a player's game mode",
	func = function(name, param)
		local player = minetest.get_player_by_name(name)

		local params = {}
		for i in string.gmatch(param, "%S+") do
			table.insert(params, i)
		end

		-- Determine gamemode
		if not params[1] or (params[1] ~= "survival" and params[1] ~= "creative") then
			return false, "Please specify a valid gamemode"
		end

		-- Determine target
		local target = nil
		if params[2] then
			local player = minetest.get_player_by_name(params[2])
			if player then
				target = player
			else
				return false, "Player not found"
			end
		else
			if not player then
				return false, "If this command is not ran by a player, then a player has to be specified"
			end

			target = player
		end

		target:set_attribute("default:gamemode", params[1])

		for key, value in pairs(target:get_armor_groups()) do
			print(key)
		end

		if params[1] == "creative" then
			target:get_inventory():set_stack("hand", 1, "creative:hand")
		else
			target:get_inventory():set_stack("hand", 1, "")
		end

		return true, "Gamemode changed"
	end
})
