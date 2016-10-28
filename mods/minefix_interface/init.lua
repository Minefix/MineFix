minefix_interface = {}
minefix_interface.creative_inventory_size = 0

local creative_mode = minetest.setting_getbool("creative_mode")

local buttonOffset = {
	["building"] = "-0.29, -0.2",
	["decoration"] = "0.98, -0.2",
	["redstone"] = "2.23, -0.2",
	["transportation"] = "3.495, -0.2",
	["miscellaneous"] = "4.75, -0.2",
	["search"] = "8.99, -0.2",
	["foodstuff"] = "-0.29, 8.12",
	["tools"] = "0.98, 8.12",
	["combat"] = "2.23, 8.12",
	["brewing"] = "3.495, 8.12",
	["materials"] = "4.75, 8.12",
	["inventory"] = "8.99, 8.12"
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
	local tab = nil;

	local creativeInventoryTab = false
	if fields.building then
		tab = "building"
		minefix_interface.fillCreativeInventory(player, tab)
		creativeInventoryTab = true
	elseif fields.decoration then
		tab = "decoration"
		minefix_interface.fillCreativeInventory(player, tab)
		creativeInventoryTab = true
	elseif fields.redstone then
		tab = "redstone"
		minefix_interface.fillCreativeInventory(player, tab)
		creativeInventoryTab = true
	elseif fields.transportation then
		tab = "transportation"
		minefix_interface.fillCreativeInventory(player, tab)
		creativeInventoryTab = true
	elseif fields.miscellaneous then
		tab = "miscellaneous"
		minefix_interface.fillCreativeInventory(player, tab)
		creativeInventoryTab = true
	elseif fields.search then
		tab = "search"
		minefix_interface.fillCreativeInventory(player, tab)
		creativeInventoryTab = true
	elseif fields.foodstuff then
		tab = "foodstuff"
		minefix_interface.fillCreativeInventory(player, tab)
		creativeInventoryTab = true
	elseif fields.tools then
		tab = "tools"
		minefix_interface.fillCreativeInventory(player, tab)
		creativeInventoryTab = true
	elseif fields.combat then
		tab = "combat"
		minefix_interface.fillCreativeInventory(player, tab)
		creativeInventoryTab = true
	elseif fields.brewing then
		tab = "brewing"
		minefix_interface.fillCreativeInventory(player, tab)
		creativeInventoryTab = true
	elseif fields.materials then
		tab = "materials"
		minefix_interface.fillCreativeInventory(player, tab)
		creativeInventoryTab = true
	elseif fields.inventory then
		tab = "inventory"
		minefix_interface.fillCreativeInventory(player, tab)
		creativeInventoryTab = true
	elseif fields.creative_prev or fields.creative_next then
		tab = "building" --Has to be fixed, we got to figure out on which page we are instead of hardcoding a single page
		creativeInventoryTab = true
	end

	if creativeInventoryTab then
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
		elseif fields.creative_next then
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

minefix_interface.initializeCreativeInventory = function(owner)
	local owner_name = owner:get_player_name()

	minetest.create_detached_inventory("creative", {
		allow_move = function(inv, from_list, from_index, to_list, to_index, count, player)
			if creative_mode then
				return count
			else
				return 0
			end
		end,
		allow_put = function(inv, listname, index, stack, player)
			return -1
		end,
		allow_take = function(inv, listname, index, stack, player)
			return -1
		end,
		on_move = function(inv, from_list, from_index, to_list, to_index, count, player)
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
		if not def.groups.not_in_creative_inventory or def.groups.not_in_creative_inventory ~= 0 then
			if tab == "building" then
				if def.category == "building" then
					table.insert(creative_list, name)
				end
			elseif tab == "decoration" then
				if def.category == "decoration" then
					table.insert(creative_list, name)
				end
			elseif tab == "redstone" then
				if def.category == "redstone" then
					table.insert(creative_list, name)
				end
			elseif tab == "transportation" then
				if def.category == "transportation" then
					table.insert(creative_list, name)
				end
			elseif tab == "miscellaneous" then
				if def.category == "miscellaneous" then
					table.insert(creative_list, name)
				end
			elseif tab == "foodstuff" then
				if def.category == "foodstuff" then
					table.insert(creative_list, name)
				end
			elseif tab == "tools" then
				if def.category == "tools" then
					table.insert(creative_list, name)
				end
			elseif tab == "combat" then
				if def.category == "combat" then
					table.insert(creative_list, name)
				end
			elseif tab == "brewing" then
				if def.category == "brewing" then
					table.insert(creative_list, name)
				end
			elseif tab == "materials" then
				if def.category == "materials" then
					table.insert(creative_list, name)
				end
			end
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
	pageNumber = math.floor(pageNumber) or 1
	local pagemax = math.floor((minefix_interface.creative_inventory_size - 1) / (9 * 5) + 1)
	local slider_height = 4 / pagemax
	local slider_pos = slider_height * (pageNumber - 1) + 2.25

	local formspec = "size[10,9.3]" ..
		"background[-0.19,-0.25;10.5,9.87;minefix_interface_inventory_creative.png]" ..
		"bgcolor[#080808BB;true]" ..
		"listcolors[#9990;#FFF7;#FFF0;#160816;#D4D2FF]" ..
		"label[-5,-5;Building Blocks]" ..
		"image[" .. buttonOffset[tab] .. ";1.5,1.44;minefix_interface_creative_active.png]" ..
		"image_button[-0.1,0;1,1;minefix_interface_creative_building.png;building;]" .. -- Building tab
		"image_button[1.18,0;1,1;minefix_interface_creative_decoration.png;decoration;]" .. -- Decoration tab
		"image_button[2.43,0;1,1;minefix_interface_creative_redstone.png;redstone;]" .. -- Redstone tab
		"image_button[3.693,0;1,1;minefix_interface_creative_transportation.png;transportation;]" .. -- Transportation tab
		"image_button[4.97,0;1,1;minefix_interface_creative_miscellaneous.png;miscellaneous;]" .. --Miscellaneous tab
		"image_button[9.22,0;1,1;minefix_interface_creative_search.png;search;]" .. --Search tab
		"list[detached:creative;main;0,1.74;9,5;" .. startIndex .. "]" ..
		"image_button[9.03,1.74;0.85,0.6;minefix_interface_creative_up.png;creative_prev;]" ..
		"image[9.04," .. tostring(slider_pos) .. ";0.75," .. tostring(slider_height) .. ";minefix_interface_creative_slider.png]" ..
		"image_button[9.03,6.15;0.85,0.6;minefix_interface_creative_down.png;creative_next;]" ..
		"list[current_player;main;0,7;9,1;]" ..
		"image_button[-0.1,8.28;1,1;minefix_interface_creative_foodstuff.png;foodstuff;]" .. -- Foodstuff tab
		"image_button[1.18,8.28;1,1;minefix_interface_creative_tools.png;tools;]" .. -- Tools tab
		"image_button[2.43,8.28;1,1;minefix_interface_creative_combat.png;combat;]" .. -- Combat tab
		"image_button[3.693,8.28;1,1;minefix_interface_creative_brewing.png;brewing;]" .. -- Brewing tab
		"image_button[4.97,8.28;1,1;minefix_interface_creative_materials.png;materials;]" .. -- Materials tab
		"image_button[9.22,8.28;1,1;minefix_interface_creative_inventory.png;inventory;]" -- Inventory tab

		if pageNumber ~= nil then
			formspec = formspec .. "p" .. tostring(pageNumber)
		end
	player:set_inventory_formspec(formspec)
end
