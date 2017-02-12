local hunger_exhaust = 0.005 -- per game tick (each ~0.005 seconds)
function callback_hunger(player, level, duration, ticks)
	default.update_exhaustion(player, level * hunger_exhaust)
end

local poison_ticks = {25, 12, 6, 3, 1} -- Ticks before damaging half a heart
function callback_poison(player, level, duration, ticks)
	if ticks >= poison_ticks[level] then
		if (player:get_hp() > 1) then
			player:set_hp(player:get_hp() - 1)
		end

		return true
	end
end

default.register_status("hunger", "Hunger", "default_status_hunger.png", callback_hunger)
default.register_status("poison", "Poison", "default_status_poison.png", callback_poison)
