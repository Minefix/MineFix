status = {}
statuses = {}

dofile(minetest.get_modpath("status") .. "/functions.lua")
dofile(minetest.get_modpath("status") .. "/builtin.lua")

if minetest.setting_getbool("enable_damage") then
	local timer = 0
	minetest.register_globalstep(function(dtime)
		timer = timer + dtime
		for _, player in pairs(minetest.get_connected_players()) do
			for id, status_def in pairs(statuses) do
				if status.player_has_status_by_id(id, player) then -- Check if the user has this status (status level 1 or higher)
					local attribute = minetest.parse_json(player:get_attribute("status:" .. id))

					if timer >= 1 then -- Each second
						timer = 0

						attribute.duration = attribute.duration - 1

						player:set_attribute("status:" .. id, minetest.write_json(attribute))
					end

					if status.get_player_status_length_by_id(id, player) > 0 then
						attribute.ticks = attribute.ticks + 1
						player:set_attribute("status:" .. id, minetest.write_json(attribute))

						local result = status_def.callback(player, attribute.level, attribute.duration, attribute.ticks) -- Player object, status level, duration left, ticks since last callback

						if result then -- If the callback ran succesfull and wants to reset the tick timer
							attribute.ticks = 0
							player:set_attribute("status:" .. id, minetest.write_json(attribute))
						end
					else
						attribute.level = 0
						player:set_attribute("status:" .. id, minetest.write_json(attribute))
					end
				end
			end
		end
	end)

end
