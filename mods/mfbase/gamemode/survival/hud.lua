local player_huds = {}

function createSurvivalHud(player)
	player_huds[player:get_player_name()] = {}
	local player_hudlist = player_huds[player:get_player_name()]

	local health_hud_height = -90
	local breath_hud_height = -90
	if minetest.get_modpath("experience") ~= nil then
		health_hud_height = health_hud_height - 20
		breath_hud_height = breath_hud_height - 20

		experience_empty_hud = player:hud_add({
			hud_elem_type = "image",
			position = {x = 0.5, y = 1},
			scale = {x = 2.75, y = 2}, -- 2.75 times the image width means we're compatible with Minecraft's texture size
			text = "interface_experiencebar_empty.png",
			offset = {x = 0, y = -70}
		})

		experience_full_hud = player:hud_add({
			hud_elem_type = "image",
			position = {x = 0.5, y = 1},
			scale = {x = 0, y = 2},
			text = "interface_experiencebar_full.png",
			alignment = {x = 1, y = 0},
			offset = {x = -250, y = -70}
		})

		experiencetext_hud = player:hud_add({
			hud_elem_type = "text",
			position = {x = 0.5, y = 1},
			text = experience.get_level(player),
			number = 0x00FF00, -- Actually the color of the text, we use green
			offset = {x = 0, y = -77},
			scale = {x = 1, y = 1}
		})

		player_hudlist["experience_empty_hud"] = experience_empty_hud
		player_hudlist["experience_full_hud"] = experience_full_hud
		player_hudlist["experiencetext_hud"] = experiencetext_hud
	end

	if minetest.get_modpath("hunger") ~= nil then
		breath_hud_height = breath_hud_height - 30

		local hunger_hud_height = -90
		if not minetest.get_modpath("experience") ~= nil then
			hunger_hud_height = hunger_hud_height - 20
		end

		hunger_empty_hud = player:hud_add({
			hud_elem_type = "statbar",
			direction = 1,
			position = {x = 0.5, y = 1},
			size = {x = 24, y = 24},
			text = "hunger_empty.png",
			number = 20,
			alignment = {x = 0, y = 1},
			offset = {x = 230, y = hunger_hud_height}
		})

		hunger_hud = player:hud_add({
			hud_elem_type = "statbar",
			direction = 1,
			position = {x = 0.5, y = 1},
			size = {x = 24, y = 24},
			text = "hunger_full.png",
			number = hunger.get_hunger(player),
			alignment = {x = 0, y = 1},
			offset = {x = 230, y = hunger_hud_height}
		})

		player_hudlist["hunger_empty_hud"] = hunger_empty_hud
		player_hudlist["hunger_hud"] = hunger_hud
	end

	health_hud = player:hud_add({
		hud_elem_type = "statbar",
		position = {x = 0.5, y = 1},
		size = {x = 24, y = 24},
		text = "heart.png",
		number = player:get_hp(),
		offset = {x = -260, y = health_hud_height}
	})

	breath_hud = player:hud_add({
		hud_elem_type = "statbar",
		direction = 1,
		position = {x = 0.5, y = 1},
		size = {x = 24, y = 24},
		text = "bubble.png",
		number = 0, --We'll set it to the proper value in the coming tick
		alignment = {x = 0, y = 1},
		offset = {x = 230, y = breath_hud_height}
	})

	player_hudlist["health_hud"] = health_hud
	player_hudlist["breath_hud"] = breath_hud
end

local timer = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime

	if timer > 0.2 then --Only update hud every fifth of a second
		timer = 0

		for _, player in pairs(minetest.get_connected_players()) do
			if gamemode.get_player_gamemode(player) == "survival" then
				local player_hudlist = player_huds[player:get_player_name()]

				-- Health bar
				player:hud_change(player_hudlist["health_hud"], "number", player:get_hp())

				-- Breath bar
				if player:get_breath() == 11 then
					player:hud_change(player_hudlist["breath_hud"], "number", 0)
				else
					player:hud_change(player_hudlist["breath_hud"], "number", player:get_breath() * 2) --Minetest only uses 10 units for breath instead of 20
				end


				if minetest.get_modpath("experience") ~= nil then
					-- Experience bar
					local player_level = experience.get_level(player)
					local experience_previous_level = experience.get_experience_for_level(player_level)
					local experience_next_level = experience.get_experience_for_level(player_level + 1) - experience_previous_level
					local experience_current = experience.get_experience(player) - experience_previous_level
					local percentage = experience_current / experience_next_level

					if player_level == 40 then
						percentage = 1
					elseif percentage == 1 then
						percentage = 0
					end

					-- Minecraft just shows a percentage of the full experience bar texture
					-- Since Minetest can't do this (yet) we just scale the image from 0 to 100% width
					-- Doesn't look quite as nice but it works
					player:hud_change(experience_full_hud, "scale", {x = percentage * 2.75, y = 2})
					player:hud_change(experiencetext_hud, "text", player_level)
				end

				if minetest.get_modpath("hunger") ~= nil then
					player:hud_change(player_hudlist["hunger_hud"], "number", hunger.get_hunger(player))
				end

				if minetest.get_modpath("status") ~= nil then
					-- Poison status
					if status.player_has_status_by_name("poison", player) then
						player:hud_change(player_hudlist["health_hud"], "text", "heart_poison_full.png")
					else
						player:hud_change(player_hudlist["health_hud"], "text", "heart.png")
					end

					if minetest.get_modpath("hunger") ~= nil then
						-- Hunger status
						if status.player_has_status_by_name("hunger", player) then
							player:hud_change(player_hudlist["hunger_hud"], "text", "hunger_poison_full.png")
						else
							player:hud_change(player_hudlist["hunger_hud"], "text", "hunger_full.png")
						end
					end
				end
			end
		end
	end
end)
