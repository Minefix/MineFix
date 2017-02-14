local hunger_exhaust = 0.005 -- per game tick (each ~0.005 seconds)
function callback_hunger(player, level, duration, ticks)
	hunger.update_exhaustion(player, level * hunger_exhaust)
end
status.register_status("hunger", "Hunger", "hunger_status_hunger.png", callback_hunger)

minetest.register_on_item_eat(function(hp_change, saturation_change, replace_with_item, itemstack, user, pointed_thing)
	local item = user:get_wielded_item()

	for name, def in pairs(minetest.registered_items) do
		if def.name == item:get_name() then
			if def.hunger_chance and def.hunger_level > 0 and def.hunger_chance > 0 and def.hunger_chance <= 100 then
				if not status.player_has_status_by_name("hunger", user) then -- Only start hunger if the player isn't already hungry
					math.randomseed(os.time())
					local result = math.random(1, 100)

					if result <= def.hunger_chance then -- Making the player hungry
						status.init_status_by_name("hunger", user, def.hunger_level, def.hunger_duration)
					end
				end
			end

			if def.poison_chance and def.poison_level > 0 and def.poison_chance > 0 and def.poison_chance <= 100 then
				if not status.player_has_status_by_name("poison", user) then -- Only poison if the player isn't already poisened
					math.randomseed(os.time())
					local result = math.random(1, 100)
					if result <= def.poison_chance then -- Poison the player
						status.init_status_by_name("poison", user, def.poison_level, def.poison_duration)
					end
				end
			end

			break
		end
	end
end)
