--[[
Registers a new creative inventory tab, useful for external mods. They will have to require this mod
@tablocation = can be top or bottom of the creative inventory
@tabimage = the item to show on the tab
]]
interface.registerCategory = function(categoryname, label, tablocation, tabimage)
	--Example: interface.registerCategory("test", "test category", "top", "default:brick");
	interface.tabs[categoryname] = {
		["position"] = tablocation,
		["label"] = label,
		["image"] = tabimage
	}
end

interface.initializeCreativeInventory = function(owner)
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

		end,
	})
end

interface.fillCreativeInventory = function(player, tab)
	local inventory = minetest.get_inventory({type="detached", name="creative"})
	inventory:set_size("main", 0)

	local creative_list = {};
	for name, def in pairs(minetest.registered_items) do
		if def.category ~= nil and tab == def.category then
			table.insert(creative_list, name)
		elseif def.category ~= nil and tab == "search" then -- We want the search tab to have all items by default

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

	interface.creative_inventory_size = #creative_list
end

interface.createCreativeInventory = function(player, tab, startIndex, pageNumber)
	local inventory = minetest.get_inventory({type="detached", name="creative"})

	if startIndex < 0 then
		startIndex = 0
	end

	pageNumber = math.floor(pageNumber) or 1
	local pagemax = math.floor((interface.creative_inventory_size - 1) / (9 * 5) + 1)
	local slider_height = 4 / pagemax
	local slider_pos = slider_height * (pageNumber - 1) + 2.25

	local activeTab, tabsTop, tabsBottom = "", "", ""
	local tabsTopButtonX, tabsBottomButtonX = -0.1, -0.1
	for key, value in pairs(interface.tabs) do
		if value.position == "top" then
			if key == tab then
				activeTab = "image[" .. tabsTopButtonX - 0.17 ..",-0.25;1.5,1.44;interface_creative_tab_active.png]"
			else
				tabsTop = tabsTop .. "image[" .. tabsTopButtonX - 0.15 .. ",-0.2;1.27,1.27;interface_creative_tab_inactive.png]"
			end
			tabsTop = tabsTop .. "item_image_button[" .. tabsTopButtonX .. ",0;1,1;" .. value.image .. ";" .. key .. ";]"
			tabsTopButtonX = tabsTopButtonX + 1.28
		else
			if key == tab then
				activeTab = "image[" .. tabsBottomButtonX - 0.17 ..",8.07;1.5,1.44;interface_creative_tab_active.png^[transformfy]]"
			else
				tabsTop = tabsTop .. "image[" .. tabsBottomButtonX - 0.15 .. ",8.15;1.27,1.27;interface_creative_tab_inactive.png^[transformfy]]"
			end
			tabsBottom = tabsBottom .. "item_image_button[" .. tabsBottomButtonX .. ",8.3;1,1;" .. value.image .. ";" .. key .. ";]"
			tabsBottomButtonX = tabsBottomButtonX + 1.28
		end
	end

	local background, itemlist, slider
	if tab == "inventory" then
		background = "background[-0.2,1;11.5,7.25;interface_creative_inventory.png]"
		itemlist = "list[current_player;main;0,3.75;10,3;9]"
		slider = ""
	else
		background = "background[-0.2,1;11.5,7.25;interface_creative_list.png]"
		itemlist = "list[detached:creative;main;0,1.74;10,5;" .. tostring(startIndex) .. "]"
		slider = "image_button[10,1.76;0.85,0.6;interface_creative_up.png;creative_prev;]" ..
		"image[10," .. tostring(slider_pos) .. ";0.75," .. tostring(slider_height) .. ";interface_creative_slider.png]" ..
		"image_button[10,6.13;0.85,0.6;interface_creative_down.png;creative_next;]"
	end

	local formspec = "size[12,9.3]" ..
		background ..
		"bgcolor[#080808BB;true]" ..
		"listcolors[#9990;#FFF7;#FFF0;#160816;#D4D2FF]" ..
		"label[-5,-5;Building Blocks]" ..
		activeTab ..
		tabsTop ..
		"image[10.2,-0.2;1.25,1.27;interface_creative_tab_inactive.png]" ..
		"item_image_button[10.3,0;1,1;default:wood_oak;search;]" .. -- Use a temporary item for the search tab for now
		itemlist ..
		slider ..
		"list[current_player;main;0,7;9,1;]" ..
		tabsBottom ..
		"image[10.2,8.15;1.25,1.27;interface_creative_tab_inactive.png^[transformfy]]" ..
		"item_image_button[10.3,8.3;1,1;default:chest;inventory;]"

		if pageNumber ~= nil then
			formspec = formspec .. "p" .. tostring(pageNumber)
		end
	player:set_inventory_formspec(formspec)
end
