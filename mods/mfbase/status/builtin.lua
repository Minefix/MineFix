local poison_ticks = {25, 12, 6, 3, 1} -- Ticks before damaging half a heart
function callback_poison(player, level, duration, ticks)
	if ticks >= poison_ticks[level] then
		if (player:get_hp() > 1) then
			player:set_hp(player:get_hp() - 1)
		end

		return true
	end
end
status.register_status("poison", "Poison", "status_poison.png", callback_poison)
