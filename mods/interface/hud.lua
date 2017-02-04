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

	local breath_hud = player:hud_add({
		hud_elem_type = "statbar",
		direction = 1,
		position = {x = 0.5, y = 1},
		size = {x = 24, y = 24},
		text = "bubble.png",
		number = 0, --We'll set it to the proper value in the coming tick
		alignment = {x = 0, y = 1},
		offset = {x = 230, y = -90}
	})

	local timer = 0
	minetest.register_globalstep(function(dtime)
		timer = timer + dtime

		if timer > 0.5 then --Only update hud every half a second
			timer = 0
			for name, player in pairs(default.players) do
				player:hud_change(health_hud, text, player:get_hp())

				if player:get_breath() == 11 then
					player:hud_change(breath_hud, text, 0)
				else
					player:hud_change(breath_hud, text, player:get_breath() * 2) --Minetest only uses 10 units for breath instead of 20
				end
			end
		end
	end)
end
