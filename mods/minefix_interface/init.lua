minefix_interface = {}
minefix_interface.creative_inventory_size = 0

local creative_mode = minetest.setting_getbool("creative_mode")

local tabs = {
	["building"] = {
		["position"] = "top",
		["label"] = "Building Blocks",
		["image"] = "default:brick",
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
		["image"] = "minefix_carts:rail",
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
		["image"] = "minefix_nodes:sword_gold",
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

minetest.register_on_joinplayer(function(player)
	if not creative_mode then
		return
	end

	minefix_interface.initializeCreativeInventory(player)
	minefix_interface.fillCreativeInventory(player, "building")
	minefix_interface.createCreativeInventory(player, "building", 0, 0)
end)

--Gets called if a button is pressed in a player's inventory form
--If it returns true, remaining functions (other mods, etc) are not called
minetest.register_on_player_receive_fields(function(player, formname, fields)
	if creative_mode then
		local tab = nil;

		for key, value in pairs(fields) do
			if tabs[key] then
				tab = key
				minefix_interface.fillCreativeInventory(player, tab)
			end
		end

		if fields.creative_prev or fields.creative_next then
			tab = nil
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
		elseif fields.creative_next and startIndex < minefix_interface.creative_inventory_size - 9 * 5 then
			startIndex = startIndex + 9 * 5
		end

		if startIndex < 0 then
			startIndex = startIndex + 9 * 5
		elseif startIndex >= minefix_interface.creative_inventory_size then
			startIndex = startIndex - 9 * 5
		end

		minefix_interface.createCreativeInventory(player, tab, startIndex, startIndex / (9*5) + 1)
	end
end)

--[[
Registers a new creative inventory tab, useful for external mods. They will have to require this mod
@tablocation = can be top or bottom of the creative inventory
@tabimage = the item to show on the tab
]]
minefix_interface.registerCategory = function(categoryname, label, tablocation, tabimage)
	--Example: minefix_interface.registerCategory("test", "test category", "top", "default:brick");
	minetest.log(tabimage)
	tabs[categoryname] = {
		["position"] = tablocation,
		["label"] = label,
		["image"] = tabimage
	}
end

minefix_interface.initializeCreativeInventory = function(owner)
	local owner_name = owner:get_player_name()

	minetest.create_detached_inventory("creative", {
		allow_move = function(inv, from_list, from_index, to_list, to_index, count, player)
			return 0
		end,
		allow_put = function(inv, listname, index, stack, player)
			return -1
		end,
		allow_take = function(inv, listname, index, stack, player)
			--[[if player:get_player_control().sneak then
				return stack:get_stack_max()
			else]] -- Not used yet, we can't set an item yet the moment it is picked up from the inventory
				return -1
			--end
		end,
		on_move = function(inv, from_list, from_index, to_list, to_index, count, player)
			return -1
		end,
		on_put = function(inv, listname, index, stack, player)
			return
		end,
		on_take = function(inv, listname, index, stack, player)
			local player_name, stack_name = player:get_player_name(), stack:get_name()
			if stack then
				minetest.log("Action", player_name .. " takes " .. stack_name .. " from creative inventory")
			end
		end,
	})
end

minefix_interface.fillCreativeInventory = function(player, tab)
	local inventory = minetest.get_inventory({type="detached", name="creative"})
	inventory:set_size("main", 0)

	local creative_list = {};
	for name, def in pairs(minetest.registered_items) do
		if def.category ~= nil and tab == def.category then
			table.insert(creative_list, name)
		end
	end

	table.sort(creative_list)

	if #creative_list ~= 0 then
		inventory:set_size("main", #creative_list)
	else
		inventory:set_size("main", 1) --Set it to 1 big so the game won't complain that the 'main' list doesn't exist
	end

	for key, itemstring in ipairs(creative_list) do
		inventory:add_item("main", ItemStack(itemstring))
	end

	minefix_interface.creative_inventory_size = #creative_list
end

minefix_interface.createCreativeInventory = function(player, tab, startIndex, pageNumber)
	if startIndex < 0 then
		startIndex = 0
	end

	if tab ~= nil then
		name = tab
	end

	pageNumber = math.floor(pageNumber) or 1
	local pagemax = math.floor((minefix_interface.creative_inventory_size - 1) / (9 * 5) + 1)
	local slider_height = 4 / pagemax
	local slider_pos = slider_height * (pageNumber - 1) + 2.25

	local activeTab, tabsTop, tabsBottom = "", "", ""
	local tabsTopButtonX, tabsBottomButtonX = -0.1, -0.1
	for key, value in pairs(tabs) do
		if value.position == "top" then
			if key == name then
				activeTab = "image[" .. tabsTopButtonX - 0.18 ..",-0.25;1.5,1.44;minefix_interface_creative_tab_active.png]"
			else
				tabsTop = tabsTop .. "image[" .. tabsTopButtonX - 0.15 .. ",-0.2;1.27,1.27;minefix_interface_creative_tab_inactive.png]"
			end
			tabsTop = tabsTop .. "item_image_button[" .. tabsTopButtonX .. ",0;1,1;" .. value.image .. ";" .. key .. ";]"
			tabsTopButtonX = tabsTopButtonX + 1.28
		else
			if key == name then
				activeTab = "image[" .. tabsBottomButtonX - 0.18 ..",8.07;1.5,1.44;minefix_interface_creative_tab_active.png^[transformfy]]"
			else
				tabsTop = tabsTop .. "image[" .. tabsBottomButtonX - 0.15 .. ",8.15;1.27,1.27;minefix_interface_creative_tab_inactive.png^[transformfy]]"
			end
			tabsBottom = tabsBottom .. "item_image_button[" .. tabsBottomButtonX .. ",8.3;1,1;" .. value.image .. ";" .. key .. ";]"
			tabsBottomButtonX = tabsBottomButtonX + 1.28
		end
	end

	local formspec = "size[10,9.3]" ..
		"background[-0.2,1;10.4524,7.25;minefix_interface_inventory_creative.png]" ..
		"bgcolor[#080808BB;true]" ..
		"listcolors[#9990;#FFF7;#FFF0;#160816;#D4D2FF]" ..
		"label[-5,-5;Building Blocks]" ..
		activeTab ..
		tabsTop ..
		"image[9.1,-0.2;1.27,1.27;minefix_interface_creative_tab_inactive.png]" ..
		"image_button[9.23,0;1,1;minefix_interface_creative_search.png;search;]" ..
		"list[detached:creative;main;0,1.74;9,5;" .. tostring(startIndex) .. "]" ..
		"image_button[8.98,1.76;0.85,0.6;minefix_interface_creative_up.png;creative_prev;]" ..
		"image[9," .. tostring(slider_pos) .. ";0.75," .. tostring(slider_height) .. ";minefix_interface_creative_slider.png]" ..
		"image_button[8.98,6.13;0.85,0.6;minefix_interface_creative_down.png;creative_next;]" ..
		"list[current_player;main;0,7;9,1;]" ..
		tabsBottom ..
		"image[9.1,8.15;1.27,1.27;minefix_interface_creative_tab_inactive.png^[transformfy]]" ..
		"image_button[9.23,8.3;1,1;minefix_interface_creative_inventory.png;inventory;]"

		if pageNumber ~= nil then
			formspec = formspec .. "p" .. tostring(pageNumber)
		end
	player:set_inventory_formspec(formspec)
end
