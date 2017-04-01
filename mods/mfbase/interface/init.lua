interface = {}
interface.creative_inventory_size = 0

interface.tabs = {
	["building"] = {
		["position"] = "top",
		["label"] = "Building Blocks",
		["image"] = "default:brickblock",
	},
	["decoration"] = {
		["position"] = "top",
		["label"] = "Decoration Blocks",
		["image"] = "flowers:flower_rose",
	},
	["redstone"] =  {
		["position"] = "top",
		["label"] = "Redstone",
		["image"] = "tnt:gunpowder",
	},
	["transportation"] = {
		["position"] = "top",
		["label"] = "Transportation",
		["image"] = "carts:rail",
	},
	["miscellaneous"] = {
		["position"] = "top",
		["label"] = "Miscellaneous",
		["image"] = "bucket:bucket_lava",
	},
	["foodstuff"] = {
		["position"] = "bottom",
		["label"] = "Foodstuffs",
		["image"] = "default:apple",
	},
	["tools"] = {
		["position"] = "bottom",
		["label"] = "Tools",
		["image"] = "default:axe_diamond",
	},
	["combat"] = {
		["position"] = "bottom",
		["label"] = "Combat",
		["image"] = "default:sword_gold",
	},
	["brewing"] = {
		["position"] = "bottom",
		["label"] = "Brewing",
		["image"] = "default:snow",
	},
	["materials"] = {
		["position"] = "bottom",
		["label"] = "Materials",
		["image"] = "default:stick",
	}
}

interface.player_huds = {}

local startIndex = 0

dofile(minetest.get_modpath("interface") .. "/survival.lua")
dofile(minetest.get_modpath("interface") .. "/creative.lua")
dofile(minetest.get_modpath("interface") .. "/hud.lua")

minetest.register_on_joinplayer(function(player)
	player:get_inventory():set_size("main", 9 * 4)
	player.hud_set_hotbar_itemcount(player, 9)
	player:hud_set_hotbar_image("interface_hotbar.png")
	player:hud_set_hotbar_selected_image("interface_hotbar_selected.png")

	-- Hide built-in hud bars, so we can customize them to our likings instead
	local hud_flags = player:hud_get_flags()
	hud_flags.healthbar = false
	hud_flags.breathbar = false
	player:hud_set_flags(hud_flags)

	interface.registerCreativeInventory(player)

	gamemode.register_on_gamemode_change(function(player, gamemode)
		if gamemode == "survival" then
			interface.createSurvivalInventory(player)

			interface.createHud(player)
		elseif gamemode == "creative" then
			interface.fillCreativeInventory(player, "building", 0)
			interface.createCreativeInventory(player, "building", 0, 0) -- Player, tab, startIndex, pageNumber

			for i=0,31,1 do
				player:hud_remove(i)
			end
		end
	end)

	if gamemode.get_player_gamemode(player) == "survival" then -- If the gamemode mod isn't loaded, the gamemode will always be survival
		interface.createSurvivalInventory(player)

		interface.createHud(player)
	elseif gamemode.get_player_gamemode(player) == "creative" then
		interface.fillCreativeInventory(player, "building", 0)
		interface.createCreativeInventory(player, "building", 0, 0) -- Player, tab, startIndex, pageNumber

		for i=0,31,1 do
			player:hud_remove(i)
		end
	end
end)

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if gamemode.get_player_gamemode(player) == "creative" then
		interface.handleCreativeInventory(player, formname, fields)
	else
		interface.createSurvivalInventory(player)
	end
end)
