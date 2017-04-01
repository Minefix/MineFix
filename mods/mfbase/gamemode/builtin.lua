minetest.register_item("gamemode:creative_hand", {
	type = "none",
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

gamemode.register_gamemode("creative")
gamemode.register_gamemode("survival")

gamemode.register_on_gamemode_change(function(player, gamemode)
	if gamemode == "creative" then
		player:get_inventory():set_stack("hand", 1, "gamemode:creative_hand")
	elseif gamemode == "survival" then
		player:get_inventory():set_stack("hand", 1, "")
	end
end)

minetest.register_on_joinplayer(function(player)
	if not gamemode.get_player_gamemode(player) then -- Set initial gamemode
		if minetest.setting_getbool("creative_mode") then -- Check default gamemode for the world
			gamemode.set_player_gamemode(player, "creative")
			player:get_inventory():set_stack("hand", 1, "gamemode:creative_hand")
		else
			gamemode.set_player_gamemode("survival")
		end
	end
end)
