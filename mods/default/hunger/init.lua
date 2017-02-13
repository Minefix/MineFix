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


dofile(minetest.get_modpath("default") .. "/hunger/functions.lua")
dofile(minetest.get_modpath("default") .. "/hunger/handlers.lua")

if minetest.setting_getbool("enable_damage") then
	position = {}

	minetest.register_on_joinplayer(function(player)
		local inventory = player:get_inventory()
		inventory:set_size("hunger", 3) -- 3 slots: 1 for hunger, 1 for saturation, 1 for exhaustion
		if not inventory:contains_item("hunger", ":") then
			default.set_hunger(player, HUNGER_MAX)
			default.set_saturation(player, HUNGER_SATURATION_MAX)
			default.set_exhaustion(player, HUNGER_EXHAUSTION_MAX)
		end

		minetest.register_on_dignode(hunger.handle_blockbreak)
		minetest.register_on_respawnplayer(function(player)
			default.set_hunger(player, HUNGER_MAX)
			default.set_saturation(player, HUNGER_SATURATION_MAX)
			default.set_exhaustion(player, 0)
		end)

		-- Start the damage and health regen timers
		default.players[player:get_player_name()].timer_damage = 0
		default.players[player:get_player_name()].timer_healthregen_quick = 0
		default.players[player:get_player_name()].timer_healthregen_slow = 0
		default.players[player:get_player_name()].timer_movement = 0

		position[player:get_player_name()] = player:getpos()
	end)

	minetest.register_globalstep(function(dtime)
		for player_name, value in pairs(default.players) do
			local player = minetest.get_player_by_name(player_name)

			-- If the player has sprinted for more than 1 meter, add exhaustion
			if default.players[player_name].sprinting == true then
				if player:getpos().x >= position[player_name].x + 1 or player:getpos().x <= position[player_name].x - 1
				or player:getpos().y >= position[player_name].y + 1 or player:getpos().y <= position[player_name].y - 1 then
					default.update_exhaustion(player, HUNGER_EXHAUST_SPRINT)

					if player:getpos().x >= position[player_name].x + 1 or player:getpos().x <= position[player_name].x - 1 then
						position[player_name].x = player:getpos().x
					else
						position[player_name].y = player:getpos().y
					end
				end
			end

			-- Not sure how quick the following is, might cause lagg
			-- It might be quicker to first check the timers and then check hunger level
			-- Will have to be tested on a full server
			if player:get_hp() > 0 then
				if default.get_hunger(player) == 0 then -- Damage for having emtpy hunger
					default.players[player_name].timer_damage = default.players[player_name].timer_damage + dtime

					if default.players[player_name].timer_damage >= HUNGER_DAMAGE_TICK then -- If the time since last damage is greater than HUNGER_DAMAGE_TICK
						default.players[player_name].timer_damage = 0

						player:set_hp(player:get_hp() - 1)
					end
				elseif default.get_hunger(player) >= HUNGER_MAX and default.get_saturation(player) ~= 0 and player:get_hp() ~= 20 then -- Quick health regen
					default.players[player_name].timer_healthregen_quick = default.players[player_name].timer_healthregen_quick + dtime

					if default.players[player_name].timer_healthregen_quick >= HUNGER_HEALTHREGEN_QUICK_TICK then
						default.players[player_name].timer_healthregen_quick = 0

						player:set_hp(player:get_hp() + 1)
						default.update_exhaustion(player, 6)
					end
				elseif default.get_hunger(player) >= (HUNGER_MAX / 10) * 9 and player:get_hp() ~= 20 then -- Slow health regen
					default.players[player_name].timer_healthregen_slow = default.players[player_name].timer_healthregen_slow + dtime

					if default.players[player_name].timer_healthregen_slow >= HUNGER_HEALTHREGEN_SLOW_TICK then
						default.players[player_name].timer_healthregen_slow = 0

						player:set_hp(player:get_hp() + 1)
						default.update_exhaustion(player, 6)
					end
				end
			end
		end
	end)

	minetest.register_on_item_eat(function(hp_change, replace_with_item, itemstack, user, pointed_thing)
		local item = user:get_wielded_item()

		for name, def in pairs(minetest.registered_items) do
			if def.name == item:get_name() then
				local inventory = user:get_inventory()
				if def.hunger_chance and def.hunger_level > 0 and def.hunger_chance > 0 and def.hunger_chance <= 100 then
					if not default.player_has_status_by_name("hunger", user) then -- Only start hunger if the player isn't already hungry
						math.randomseed(os.time())
						local result = math.random(1, 100)

						if result <= def.hunger_chance then -- Making the player hungry
							default.init_status_by_name("hunger", user, def.hunger_level, def.hunger_duration)
						end
					end
				end

				if def.poison_chance and def.poison_level > 0 and def.poison_chance > 0 and def.poison_chance <= 100 then
					if not default.player_has_status_by_name("poison", user) then -- Only poison if the player isn't already poisened
						math.randomseed(os.time())
						local result = math.random(1, 100)

						if result <= def.poison_chance then -- Poison the player
							default.init_status_by_name("poison", user, def.poison_level, def.poison_duration)
						end
					end
				end

				break
			end
		end
	end)
end
