interface = {}

dofile(minetest.get_modpath("gamemode") .. "/creative/init.lua")
dofile(minetest.get_modpath("gamemode") .. "/survival/init.lua")


local digtime = 5;
local caps = {times = {digtime, digtime, digtime}, uses = 0, maxlevel = 256}

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
		print("test")
		player:get_inventory():set_stack("hand", 1, "gamemode:creative_hand")
	elseif gamemode == "survival" then
		player:get_inventory():set_stack("hand", 1, "")
	end
end)

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if gamemode.get_player_gamemode(player) == "creative" then
		handleCreativeInventory(player, formname, fields)
	else
		createSurvivalInventory(player)
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

	-- Hud and GUI related
	player:get_inventory():set_size("main", 9 * 4)
	player.hud_set_hotbar_itemcount(player, 9)
	player:hud_set_hotbar_image("interface_hotbar.png")
	player:hud_set_hotbar_selected_image("interface_hotbar_selected.png")

	-- Hide built-in hud bars, so we can customize them to our likings instead
	local hud_flags = player:hud_get_flags()
	hud_flags.healthbar = false
	hud_flags.breathbar = false
	player:hud_set_flags(hud_flags)

	registerCreativeInventory(player)

	if gamemode.get_player_gamemode(player) == "survival" then -- If the gamemode mod isn't loaded, the gamemode will always be survival
		createSurvivalInventory(player)

		createHud(player)
	elseif gamemode.get_player_gamemode(player) == "creative" then
		fillCreativeInventory(player, "building", 0)
		createCreativeInventory(player, "building", 0, 0) -- Player, tab, startIndex, pageNumber

		for i=0,31,1 do
			player:hud_remove(i)
		end
	end

	gamemode.register_on_gamemode_change(function(player, gamemode)
		if gamemode == "survival" then
			createSurvivalInventory(player)

			createSurvivalHud(player)
		elseif gamemode == "creative" then
			fillCreativeInventory(player, "building", 0)
			createCreativeInventory(player, "building", 0, 0) -- Player, tab, startIndex, pageNumber

			for i=0,31,1 do
				player:hud_remove(i)
			end
		end
	end)
end)
