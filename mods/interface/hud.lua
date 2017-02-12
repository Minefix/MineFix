interface.createHud = function(player)
	-- Hide built-in hud bars, so we can customize them to our likings instead
	local hud_flags = player:hud_get_flags()
	hud_flags.healthbar = false
	hud_flags.breathbar = false
	player:hud_set_flags(hud_flags)

	local health_hud = player:hud_add({
		hud_elem_type = "statbar",
		position = {x = 0.5, y = 1},
		size = {x = 24, y = 24},
		text = "heart.png",
		number = player:get_hp(),
		offset = {x = -260, y = -90}
	})

	local hunger_empty_hud = player:hud_add({
		hud_elem_type = "statbar",
		direction = 1,
		position = {x = 0.5, y = 1},
		size = {x = 24, y = 24},
		text = "hunger_empty.png",
		number = 20,
		alignment = {x = 0, y = 1},
		offset = {x = 230, y = -90}
	})

	local hunger_hud = player:hud_add({
		hud_elem_type = "statbar",
		direction = 1,
		position = {x = 0.5, y = 1},
		size = {x = 24, y = 24},
		text = "hunger_full.png",
		number = default.get_hunger(player),
		alignment = {x = 0, y = 1},
		offset = {x = 230, y = -90}
	})

	local breath_hud = player:hud_add({
		hud_elem_type = "statbar",
		direction = 1,
		position = {x = 0.5, y = 1},
		size = {x = 24, y = 24},
		text = "bubble.png",
		number = 0, --We'll set it to the proper value in the coming tick
		alignment = {x = 0, y = 1},
		offset = {x = 230, y = -120}
	})

	local timer = 0
	minetest.register_globalstep(function(dtime)
		timer = timer + dtime

		if timer > 0.2 then --Only update hud every fifth of a second
			timer = 0

			player:hud_change(health_hud, "number", player:get_hp())
			player:hud_change(hunger_hud, "number", default.get_hunger(player))

			if player:get_breath() == 11 then
				player:hud_change(breath_hud, "number", 0)
			else
				player:hud_change(breath_hud, "number", player:get_breath() * 2) --Minetest only uses 10 units for breath instead of 20
			end

			if default.player_has_status_by_name("hunger", player) then
				player:hud_change(hunger_hud, "text", "hunger_poison_full.png")
			else
				player:hud_change(hunger_hud, "text", "hunger_full.png")
			end

			if default.player_has_status_by_name("poison", player) then
				player:hud_change(health_hud, "text", "heart_poison_full.png")
			else
				player:hud_change(health_hud, "text", "heart.png")
			end
		end
	end)
end
