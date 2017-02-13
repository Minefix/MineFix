interface.createHud = function(player)
	-- Hide built-in hud bars, so we can customize them to our likings instead
	local hud_flags = player:hud_get_flags()
	hud_flags.healthbar = false
	hud_flags.breathbar = false
	player:hud_set_flags(hud_flags)

	local experience_empty_hud = player:hud_add({
		hud_elem_type = "image",
		position = {x = 0.5, y = 1},
		scale = {x = 2.75, y = 2}, -- 2.75 times the image width means we're compatible with Minecraft's texture size
		text = "interface_experiencebar_empty.png",
		offset = {x = 0, y = -70}
	})

	local experience_full_hud = player:hud_add({
		hud_elem_type = "image",
		position = {x = 0.5, y = 1},
		scale = {x = 0, y = 2},
		text = "interface_experiencebar_full.png",
		alignment = {x = 1, y = 0},
		offset = {x = -250, y = -70}
	})

	local experiencetext_hud = player:hud_add({
		hud_elem_type = "text",
		position = {x = 0.5, y = 1},
		text = default.get_level(player),
		number = 0x00FF00, -- Actually the color of the text, we use green
		offset = {x = 0, y = -77},
		scale = {x = 1, y = 1}
	})

	local health_hud = player:hud_add({
		hud_elem_type = "statbar",
		position = {x = 0.5, y = 1},
		size = {x = 24, y = 24},
		text = "heart.png",
		number = player:get_hp(),
		offset = {x = -260, y = -110}
	})

	local hunger_empty_hud = player:hud_add({
		hud_elem_type = "statbar",
		direction = 1,
		position = {x = 0.5, y = 1},
		size = {x = 24, y = 24},
		text = "hunger_empty.png",
		number = 20,
		alignment = {x = 0, y = 1},
		offset = {x = 230, y = -110}
	})

	local hunger_hud = player:hud_add({
		hud_elem_type = "statbar",
		direction = 1,
		position = {x = 0.5, y = 1},
		size = {x = 24, y = 24},
		text = "hunger_full.png",
		number = default.get_hunger(player),
		alignment = {x = 0, y = 1},
		offset = {x = 230, y = -110}
	})

	local breath_hud = player:hud_add({
		hud_elem_type = "statbar",
		direction = 1,
		position = {x = 0.5, y = 1},
		size = {x = 24, y = 24},
		text = "bubble.png",
		number = 0, --We'll set it to the proper value in the coming tick
		alignment = {x = 0, y = 1},
		offset = {x = 230, y = -140}
	})

	local timer = 0
	minetest.register_globalstep(function(dtime)
		timer = timer + dtime

		if timer > 0.2 then --Only update hud every fifth of a second
			timer = 0

			for name, player in pairs(default.players) do
				-- Experience bar
				local player = minetest.get_player_by_name(name)
				local player_level = default.get_level(player)
				local experience_previous_level = default.get_experience_for_level(player_level)
				local experience_next_level = default.get_experience_for_level(player_level + 1) - experience_previous_level
				local experience_current = default.get_experience(player) - experience_previous_level
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

				-- Health bar
				player:hud_change(health_hud, "number", player:get_hp())
				player:hud_change(hunger_hud, "number", default.get_hunger(player))

				-- Breath bar
				if player:get_breath() == 11 then
					player:hud_change(breath_hud, "number", 0)
				else
					player:hud_change(breath_hud, "number", player:get_breath() * 2) --Minetest only uses 10 units for breath instead of 20
				end

				-- Hunger status
				if default.player_has_status_by_name("hunger", player) then
					player:hud_change(hunger_hud, "text", "hunger_poison_full.png")
				else
					player:hud_change(hunger_hud, "text", "hunger_full.png")
				end

				-- Poison status
				if default.player_has_status_by_name("poison", player) then
					player:hud_change(health_hud, "text", "heart_poison_full.png")
				else
					player:hud_change(health_hud, "text", "heart.png")
				end
			end
		end
	end)
end
