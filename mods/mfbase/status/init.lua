status = {}
statuses = {}

dofile(minetest.get_modpath("status") .. "/functions.lua")
dofile(minetest.get_modpath("status") .. "/builtin.lua")

if minetest.setting_getbool("enable_damage") then
	minetest.register_on_joinplayer(function(player)
		local inventory = player:get_inventory()
		inventory:set_size("status", #statuses)
	end)

	local timer = 0
	minetest.register_globalstep(function(dtime)
		timer = timer + dtime
		for _, player in pairs(minetest.get_connected_players()) do
			local inventory = player:get_inventory()

			for id, status_def in pairs(statuses) do
				if inventory:get_stack("status", id):get_count() ~= 0 then -- Check if the user has this status (status level 1 or higher)
					local stack = inventory:get_stack("status", id)

					if timer >= 1 then -- Each second
						timer = 0

						stack:set_wear(stack:get_wear() - 1) --We use wear as the countdown timer
						inventory:set_stack("status", id, stack)
					end

					if stack:get_wear() > 0 then
						stack:set_metadata(tostring(tonumber(stack:get_metadata()) + 1)) --We use metadata to count the ticks
						inventory:set_stack("status", id, stack)

						local result = status_def.callback(player, stack:get_count(), stack:get_wear(), tonumber(stack:get_metadata())) -- Player object, status level, duration left, ticks since last callback

						if result then -- If the callback ran succesfull and wants to reset the tick timer
							stack:set_metadata("0")
							inventory:set_stack("status", id, stack)
						end
					else
						stack:set_count(0)
						inventory:set_stack("status", id, stack)
					end
				end
			end
		end
	end)

end
