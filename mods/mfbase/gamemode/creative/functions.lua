local creative_inventory_size = {}
local INVENTORYSIZE = 9 * 5

--[[
Registers a new creative inventory tab, useful for external mods. They will have to require this mod
@categoryname = The name of the category, this name will have to be added to items
@label = The name of the category when hovering your mouse over the tab
@tablocation = can be top or bottom of the creative inventory
@tabimage = the item to show on the tab
]]
gamemode.registerCategory = function(categoryname, label, tablocation, tabimage)
	--Example: interface.registerCategory("test", "test category", "top", "default:brick");

	for category in pairs(inventoryTabs) do
		if category == categoryname then
			minetest.log("[interface] ERROR: A category with this name already exists")
			return
		end
	end

	inventoryTabs[categoryname] = {
		["position"] = tablocation,
		["label"] = label,
		["image"] = tabimage
	}
end

function registerCreativeInventory(player)
	minetest.create_detached_inventory("creative_" .. player:get_player_name(), {
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

		end,
	})
end

function fillCreativeInventory(player, tab, startIndex)
	local inventory = minetest.get_inventory({type = "detached", name = "creative_" .. player:get_player_name()})
	inventory:set_size("main", 0) -- First we'll empty whatever was in the inventory before by setting inventory size to 0, we'll resize it later

	local creative_list_full = {};
	for name, def in pairs(minetest.registered_items) do
		if def.category ~= nil and (tab == def.category or tab == "search") then
			table.insert(creative_list_full, name)
		end
	end

	local creative_list_selection = {};
	local iteration = 0
	for _, value in pairs(creative_list_full) do
		if iteration >= startIndex + INVENTORYSIZE then
			break
		elseif iteration >= startIndex then
			table.insert(creative_list_selection, value)
		end

		iteration = iteration + 1
	end

	local creative_list_filledup = INVENTORYSIZE - (#creative_list_selection % INVENTORYSIZE) + #creative_list_selection -- Fill up empty spots
	inventory:set_size("main", INVENTORYSIZE) -- Set inventory size back to the correct size

	for key, itemstring in ipairs(creative_list_selection) do
		inventory:add_item("main", ItemStack(itemstring))
	end

	creative_inventory_size[player:get_player_name()] = #creative_list_full
end

-- Actually sets the inventory for the specified player
function createCreativeInventory(player, tab, startIndex, pageNumber)
	if startIndex < 0 then
		startIndex = 0
	end

	pageNumber = pageNumber or 0
	local pagemax = math.floor(math.floor(((creative_inventory_size[player:get_player_name()] or 0) / 9) / 5 + 1))
	local slider_height = 4 / pagemax
	local slider_pos = slider_height * (pageNumber) + 2.25

	local activeTab, tabsTop, tabsBottom = "", "", ""
	local tabsTopButtonX, tabsBottomButtonX = -0.1, -0.1
	for key, value in pairs(inventoryTabs) do
		if value.position == "top" then
			if key == tab then
				activeTab = "image[" .. tabsTopButtonX - 0.17 ..",-0.30;1.27,1.65;interface_creative_tab_active.png]"
			else
				tabsTop = tabsTop .. "image[" .. tabsTopButtonX - 0.15 .. ",-0.15;1.27,1.27;interface_creative_tab_inactive.png]"
			end
			tabsTop = tabsTop .. "item_image_button[" .. tabsTopButtonX - 0.075 .. ",0;1,1;" .. value.image .. ";" .. key .. ";]"
			tabsTopButtonX = tabsTopButtonX + 1.28
		else
			if key == tab then
				activeTab = "image[" .. tabsBottomButtonX - 0.17 ..",8;1.27,1.65;interface_creative_tab_active.png^[transformfy]]"
			else
				tabsTop = tabsTop .. "image[" .. tabsBottomButtonX - 0.15 .. ",8.175;1.27,1.27;interface_creative_tab_inactive.png^[transformfy]]"
			end
			tabsBottom = tabsBottom .. "item_image_button[" .. tabsBottomButtonX - 0.075 .. ",8.3;1,1;" .. value.image .. ";" .. key .. ";]"
			tabsBottomButtonX = tabsBottomButtonX + 1.28
		end
	end

	local searchTab, inventoryTab
	if tab == "search" then
		searchTab = "image[10.18,-0.30;1.27,1.65;interface_creative_tab_active.png]"
	else
		searchTab = "image[10.2,-0.15;1.25,1.27;interface_creative_tab_inactive.png]"
	end
	searchTab = searchTab .. "item_image_button[10.3,0;1,1;default:wood_oak;search;]" -- Use a temporary item for the search tab for now

	if tab == "inventory" then
		inventoryTab = "image[10.18,8;1.27,1.65;interface_creative_tab_active.png^[transformfy]]"
	else
		inventoryTab = "image[10.2,8.175;1.25,1.27;interface_creative_tab_inactive.png^[transformfy]]"
	end
	inventoryTab = inventoryTab .. "item_image_button[10.3,8.3;1,1;default:chest;inventory;]"

	local background, itemlist, slider
	if tab == "inventory" then
		background = "background[-0.2,1;11.5,7.25;gui_formbg.png]"
		itemlist = "list[current_player;main;0,3.75;9,3;9]"
		slider = ""
	else
		background = "background[-0.2,1;11.5,7.25;gui_formbg.png]"
		itemlist = "list[detached:creative_" .. player:get_player_name() .. ";main;0,1.74;9,5;]"
		slider = "image_button[10,1.76;0.85,0.6;interface_creative_up.png;creative_prev;]" ..
		"image[10," .. tostring(slider_pos) .. ";0.75," .. tostring(slider_height) .. ";interface_creative_slider.png]" ..
		"image_button[10,6.13;0.85,0.6;interface_creative_down.png;creative_next;]"
	end

	local formspec = "size[12,9.3]" ..
		background ..
		"bgcolor[#080808BB;true]" ..
		"label[-5,-5;Building Blocks]" ..
		activeTab ..
		tabsTop ..
		searchTab ..
		itemlist ..
		slider ..
		"list[current_player;main;0,7;9,1;]" ..
		tabsBottom ..
		inventoryTab ..
		"field[0,0;0,0;active_tab;;" .. (tab or "building") .. "]" ..
		"field[0,0;0,0;page;;" .. (tostring(pageNumber) or 0) .. "]"
	player:set_inventory_formspec(formspec)
end

--Gets called if a button is pressed in a player's inventory form, or the inventory is opened
--If it returns true, remaining functions (other mods, etc) are not called
function handleCreativeInventory(player, formname, fields)
	fields.page = tonumber(fields.page)

	local tab = nil;
	for key, value in pairs(fields) do
		if inventoryTabs[key] then
			tab = key
		end
	end

	if tab and tab ~= fields.active_tab then
		fields.page = 0
	end

	if not tab then
		if fields.inventory then
			tab = "inventory"
		elseif fields.search then
			tab = "search"
		else -- fields.creative_prev, fields.creative_next, everything else
			tab = fields.active_tab
		end
	end

	if fields.creative_prev and fields.page > 0 then
		fields.page = fields.page - 1
	elseif fields.creative_next and (fields.page + 1) * INVENTORYSIZE < (creative_inventory_size[player:get_player_name()] or 0) then
		fields.page = fields.page + 1
	end

	local startIndex = (fields.page or 0) * INVENTORYSIZE -- (fields.page or 0) is needed as fields.page is not set when closing the inventory
	if tab ~= "inventory" then
		fillCreativeInventory(player, tab, startIndex)
	end

	createCreativeInventory(player, tab, startIndex, fields.page)
end
