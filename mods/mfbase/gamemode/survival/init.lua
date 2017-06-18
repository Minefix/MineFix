dofile(minetest.get_modpath("gamemode") .. "/survival/hud.lua")

formspec = ""

function createSurvivalInventory(player)
	formspec = "size[9,8.5]"..
		"bgcolor[#080808BB;true]" ..
		"background[0,0;9,8.5;gui_formbg.png;true]" ..
		"label[5,0.1;Crafting]" ..
		"list[current_player;craft;5,0.5;2,2;]"..
		"image[7,1;1,1;gui_furnace_arrow_bg.png^[transformR270]" ..
		"list[current_player;craftpreview;8,1;1,1;]"..
		"list[current_player;main;0,4.25;9,3;9]" ..
		"list[current_player;main;0,7.50;9,1;]"

	player:set_inventory_formspec(formspec)
end

local timer = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime

	if timer > 1 then --Only update statuses display every second
		timer = 0

		for key, player in ipairs(minetest.get_connected_players()) do
			if player:get_attribute("default:gamemode") == "survival" then
				player:set_inventory_formspec(formspec)

				local status_formspec = ""
				local bar_height = 0
				if minetest.get_modpath("status") ~= nil then
					for key, value in pairs(statuses) do --TODO: Needs sorting by status with longest duration left first
						if status.player_has_status_by_id(key, player) then
							local duration = status.get_player_status_length_by_id(key, player)
							duration = tostring(math.floor(duration / 60)) .. ":" .. tostring(duration % 60)

							status_formspec = status_formspec ..
							"background[0," .. bar_height .. ";5.5,1.5;default_status_bar_bg.png]" ..
							"image[0.25," .. bar_height + 0.25 .. ";1,1;" .. value.image .. "]" ..
							"label[1.25," .. bar_height + 0.1 .. ";" .. value.display_name .. "]" ..
							"label[1.25," .. bar_height + 0.5 .. ";" .. duration .. "]"

							bar_height = bar_height + 1.75
						end
					end

					if string.len(status_formspec) > 0 then -- Bigger than 0 means the player has a status applied
						local formspec = "size[15,8.5]"..
							"bgcolor[#080808BB;true]" ..
							status_formspec ..
							"background[5.75,0;9.5,8.75;gui_formbg.png]" ..
							"label[11,0.1;Crafting]" ..
							"list[current_player;craft;11,0.5;2,2;]"..
							"image[13,1;1,1;gui_furnace_arrow_bg.png^[transformR270]" ..
							"list[current_player;craftpreview;14,1;1,1;]"..
							"list[current_player;main;6,4.25;9,3;9]" ..
							"list[current_player;main;6,7.50;9,1;]"

						player:set_inventory_formspec(formspec)
					end
				end
			end
		end
	end
end)
