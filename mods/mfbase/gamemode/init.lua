gamemode = {}

local callbacks = {}
local gamemodes = {}

gamemode.register_gamemode = function(gamemode_name)
	table.insert(gamemodes, gamemode_name)
end

gamemode.register_on_gamemode_change = function(mod_callback)
	table.insert(callbacks, mod_callback)
end

gamemode.set_player_gamemode = function(player, gamemode)
	for _, value in pairs(gamemodes) do
		if gamemode == value then
			player:set_attribute("default:gamemode", gamemode)
			return
		end
	end

	minetest.log("[Gamemode] ERROR: This gamemode does not exist")
end

gamemode.get_player_gamemode = function(player)
	return player:get_attribute("default:gamemode")
end

-- Registering builtin gamemodes (survival, creative)
dofile(minetest.get_modpath("gamemode") .. "/builtin.lua")

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
		local gamemode_valid = false
		for _, gamemode in pairs(gamemodes) do
			if params[1] == gamemode then
				gamemode_valid = true
			end
		end

		if not params[1] or not gamemode_valid then
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

		-- Setting gamemode
		target:set_attribute("default:gamemode", params[1])

		-- Running all callbacks
		for _, callback in pairs(callbacks) do
			callback(target, params[1])
		end

		return true, "Gamemode changed"
	end
})
