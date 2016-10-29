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

dofile(minetest.get_modpath("interface") .. "/creative.lua")

local creative_mode = minetest.setting_getbool("creative_mode")

minetest.register_on_joinplayer(function(player)
	if not creative_mode then
		return
	end

	player.hud_set_hotbar_itemcount(player, 9)
	player:hud_set_hotbar_image("interface_hotbar.png")
	player:hud_set_hotbar_selected_image("interface_hotbar_selected.png")
	player:get_inventory():set_size("main", 9*4)

	interface.initializeCreativeInventory(player)
	interface.fillCreativeInventory(player, "building")
	interface.createCreativeInventory(player, "building", 0, 0)
end)

--Gets called if a button is pressed in a player's inventory form
--If it returns true, remaining functions (other mods, etc) are not called
minetest.register_on_player_receive_fields(function(player, formname, fields)
	if creative_mode then
		local tab = nil;

		for key, value in pairs(fields) do
			if interface.tabs[key] then
				tab = key
				interface.fillCreativeInventory(player, tab)
			end
		end

		if fields.creative_prev or fields.creative_next then
			tab = nil
		elseif fields.inventory then
			tab = "inventory"
		elseif fields.search then
			tab = "search"
			interface.fillCreativeInventory(player, tab)
			startIndex = 0; --The player clicked on a new tab, so make sure to set the startindex to 0
		else
			startIndex = 0;
		end

		local current_page = 0
		local formspec = player:get_inventory_formspec()
		local size = string.len(formspec)
		local marker = string.sub(formspec, size - 2)
		marker = string.sub(marker,1)

		if marker ~= nil and marker == "p" then
			local page = string.sub(formspec, size - 1)
			startIndex = page
		end
		startIndex = tonumber(startIndex) or 0

		if fields.creative_prev and startIndex >= 9 * 5 then
			startIndex = startIndex - 9 * 5
		elseif fields.creative_next and startIndex < interface.creative_inventory_size - 9 * 5 then
			startIndex = startIndex + 9 * 5
		end

		if startIndex < 0 then
			startIndex = startIndex + 9 * 5
		elseif startIndex >= interface.creative_inventory_size then
			startIndex = startIndex - 9 * 5
		end

		interface.createCreativeInventory(player, tab, startIndex, startIndex / (9*5) + 1)
	end
end)
