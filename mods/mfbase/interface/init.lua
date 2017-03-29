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

local startIndex = 0

dofile(minetest.get_modpath("interface") .. "/survival.lua")
dofile(minetest.get_modpath("interface") .. "/creative.lua")
dofile(minetest.get_modpath("interface") .. "/hud.lua")

minetest.register_on_joinplayer(function(player)
	player:get_inventory():set_size("main", 9 * 4)
	player.hud_set_hotbar_itemcount(player, 9)
	player:hud_set_hotbar_image("interface_hotbar.png")
	player:hud_set_hotbar_selected_image("interface_hotbar_selected.png")

	if player:get_attribute("default:gamemode") == "survival" then -- If the creative mod isn't loaded, the gamemode will always be survival
		interface.createSurvivalInventory(player)
	end

	if minetest.get_modpath("creative") ~= nil then
		interface.registerCreativeInventory(player)

		if player:get_attribute("default:gamemode") == "creative" then
			interface.fillCreativeInventory(player, "building", 0)
			interface.createCreativeInventory(player, "building", 0, 0) -- Player, tab, startIndex, pageNumber
		end
	end

	if minetest.setting_getbool("enable_damage") then
		interface.createHud(player)
	end
end)

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if player:get_attribute("default:gamemode") == "creative" then
		interface.handleCreativeInventory(player, formname, fields)
	else
		interface.createSurvivalInventory(player)
	end
end)
