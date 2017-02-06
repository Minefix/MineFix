-- Minetest 0.4 mod: default
-- See README.txt for licensing and other information.

-- The API documentation in here was moved into game_api.txt

-- Definitions made by this mod that other mods can use too
default = {}

default.LIGHT_MAX = 14

-- Load files
local default_path = minetest.get_modpath("default")

default.players = {}

for key, value in pairs(minetest.registered_entities) do
	print(key)

	for key, value2 in pairs(value) do
		print("      " .. key)

		for key, value3 in pairs(value) do
			print("             " .. key)
		end
	end
end

minetest.register_on_joinplayer(function(player)
	default.players[player:get_player_name()] = player
end)

dofile(default_path.."/functions.lua")
dofile(default_path.."/trees.lua")
dofile(default_path.."/nodes.lua")
dofile(default_path.."/furnace.lua")
dofile(default_path.."/tools.lua")
dofile(default_path.."/item_entity.lua")
dofile(default_path.."/craftitems.lua")
dofile(default_path.."/crafting.lua")
dofile(default_path.."/mapgen.lua")
dofile(default_path.."/player.lua")
