hunger = {}

HUNGER_DAMAGE_TICK = 4
HUNGER_HEALTHREGEN_QUICK_TICK = 0.5
HUNGER_HEALTHREGEN_SLOW_TICK = 4

HUNGER_MAX = 20
HUNGER_SATURATION_MAX = 20
HUNGER_EXHAUSTION_MAX = 4

HUNGER_EXHAUST_SWIM = 0.01 -- per meter
HUNGER_EXHAUST_BREAK = 0.005 -- per block broken
HUNGER_EXHAUST_SPRINT = 0.1 -- per meter
HUNGER_EXHAUST_JUMP = 0.05 -- per jump, unused
HUNGER_EXHAUST_ATTACK = 0.1 -- per attack landed
HUNGER_EXHAUST_DEFEND = 0.1 -- per distinct instance of damage being received
HUNGER_EXHAUST_STATUS = 0.1 -- per second, per Hunger status effect level unused
HUNGER_EXHAUST_JUMPSPRINT = 0.2 -- per jump (only while sprinting), unused
HUNGER_EXHAUST_HEALTHREGEN = 6.0 -- per 1 heart healed
HUNGER_EXHAUST_POISONFLESH = 3.0 --unused
HUNGER_EXHAUST_POISONPUFFERFISH = 4.5 --unused


dofile(minetest.get_modpath("hunger") .. "/functions.lua")
dofile(minetest.get_modpath("hunger") .. "/handlers.lua")

if minetest.setting_getbool("enable_damage") then
	if minetest.get_modpath("status") ~= nil then
		dofile(minetest.get_modpath("hunger") .. "/status.lua")
	end
	
	position = {}
	local players = {}

	minetest.register_on_joinplayer(function(player)
		local inventory = player:get_inventory()
		inventory:set_size("hunger", 3) -- 3 slots: 1 for hunger, 1 for saturation, 1 for exhaustion
		if not inventory:contains_item("hunger", ":") then
			hunger.set_hunger(player, HUNGER_MAX)
			hunger.set_saturation(player, HUNGER_SATURATION_MAX)
			hunger.set_exhaustion(player, HUNGER_EXHAUSTION_MAX)
		end

		minetest.register_on_dignode(hunger.handle_blockbreak)
		minetest.register_on_respawnplayer(function(player)
			hunger.set_hunger(player, HUNGER_MAX)
			hunger.set_saturation(player, HUNGER_SATURATION_MAX)
			hunger.set_exhaustion(player, 0)
		end)

		-- Start the damage and health regen timers
		players[player:get_player_name()] = {}
		players[player:get_player_name()].timer_damage = 0
		players[player:get_player_name()].timer_healthregen_quick = 0
		players[player:get_player_name()].timer_healthregen_slow = 0
		players[player:get_player_name()].timer_movement = 0

		position[player:get_player_name()] = player:getpos()
	end)

	minetest.register_globalstep(function(dtime)
		for _, player in pairs(minetest.get_connected_players()) do
			local player_name = player:get_player_name()

			-- If the player has sprinted for more than 1 meter, add exhaustion
			if minetest.get_modpath("physics") ~= nil then
				if physics.is_sprinting(player) then
					if player:getpos().x >= position[player_name].x + 1 or player:getpos().x <= position[player_name].x - 1
					or player:getpos().y >= position[player_name].y + 1 or player:getpos().y <= position[player_name].y - 1 then
						hunger.update_exhaustion(player, HUNGER_EXHAUST_SPRINT)

						if player:getpos().x >= position[player_name].x + 1 or player:getpos().x <= position[player_name].x - 1 then
							position[player_name].x = player:getpos().x
						else
							position[player_name].y = player:getpos().y
						end
					end
				end
			end

			-- Not sure how quick the following is, might cause lagg
			-- It might be quicker to first check the timers and then check hunger level
			-- Will have to be tested on a full server
			if player:get_hp() > 0 then
				if hunger.get_hunger(player) == 0 then -- Damage for having emtpy hunger
					players[player_name].timer_damage = players[player_name].timer_damage + dtime

					if players[player_name].timer_damage >= HUNGER_DAMAGE_TICK then -- If the time since last damage is greater than HUNGER_DAMAGE_TICK
						players[player_name].timer_damage = 0

						player:set_hp(player:get_hp() - 1)
					end
				elseif hunger.get_hunger(player) >= HUNGER_MAX and hunger.get_saturation(player) ~= 0 and player:get_hp() ~= 20 then -- Quick health regen
					players[player_name].timer_healthregen_quick = players[player_name].timer_healthregen_quick + dtime

					if players[player_name].timer_healthregen_quick >= HUNGER_HEALTHREGEN_QUICK_TICK then
						players[player_name].timer_healthregen_quick = 0

						player:set_hp(player:get_hp() + 1)
						hunger.update_exhaustion(player, 6)
					end
				elseif hunger.get_hunger(player) >= (HUNGER_MAX / 10) * 9 and player:get_hp() ~= 20 then -- Slow health regen
					players[player_name].timer_healthregen_slow = players[player_name].timer_healthregen_slow + dtime

					if players[player_name].timer_healthregen_slow >= HUNGER_HEALTHREGEN_SLOW_TICK then
						players[player_name].timer_healthregen_slow = 0

						player:set_hp(player:get_hp() + 1)
						hunger.update_exhaustion(player, 6)
					end
				end
			end
		end
	end)
end
