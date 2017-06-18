local sprint_speed = 1.77
local gravity_rate = 1.17

physics = {}
local players = {}

minetest.register_on_joinplayer(function(player)
	players[player:get_player_name()] = {}
    minetest.register_globalstep(function(dtime)
		if player:is_player() then
	        -- Jump tweak
	        if player:get_player_control().jump then
	            minetest.after(0.18, function()
	                player:set_physics_override({
	                    gravity = gravity_rate,
	                })
	            end)
	        end

	        -- Sprinting
	        if player:get_player_control().aux1 and player:get_player_control().up then
	            player:set_physics_override({
	                speed = sprint_speed
	            })

				players[player:get_player_name()].sprinting = true
	        else
	            player:set_physics_override({
	                speed = 1.0
	            })

				players[player:get_player_name()].sprinting = false
	        end
		end
    end)
end)

function physics.is_sprinting(player)
	return players[player:get_player_name()].sprinting
end
