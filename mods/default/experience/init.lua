local attraction_range = 6

default.EXPERIENCE_MAX = 2147483647
default.EXPERIENCE_MAX_LEGITIMATE = 21863
default.LEVEL_MAX = 40

dofile(minetest.get_modpath("default") .. "/experience/functions.lua")

local experience_orbs = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 17, 37, 73, 149, 307, 617, 1237, 2477}


for _, value in pairs(experience_orbs) do
	if value <= 2 then 			texture = "default_experience_orb_1"
	elseif value <= 6 then 		texture = "default_experience_orb_2"
	elseif value <= 16 then 	texture = "default_experience_orb_3"
	elseif value <= 36 then 	texture = "default_experience_orb_4"
	elseif value <= 72 then 	texture = "default_experience_orb_5"
	elseif value <= 148 then	texture = "default_experience_orb_6"
	elseif value <= 306 then 	texture = "default_experience_orb_7"
	elseif value <= 616 then 	texture = "default_experience_orb_8"
	elseif value <= 1236 then 	texture = "default_experience_orb_9"
	elseif value <= 2476 then 	texture = "default_experience_orb_10"
	else						texture = "default_experience_orb_11"
	end

	minetest.register_entity("default:experience_orb_" .. value, {
		initial_properties = {
			physical = false,
			collisionbox = {}, -- We don't need a collisionbox, so let it empty on purpose
			visual = "sprite",
			visual_size = {x = 0.2, y = 0.2},
			textures = {texture},
			is_visible = true,
			makes_footstep_sound = false
		},
		on_step = function(self, dtime)
			local position = self.object:getpos()

			if self.target then -- If the orb has a target, start moving it towards the target
				local target_pos = self.target:getpos()
				local self_pos = self.object:getpos()

				if target_pos.x >= self_pos.x - attraction_range and target_pos.x <= self_pos.x + attraction_range and
				target_pos.z >= self_pos.z - attraction_range and target_pos.z <= self_pos.z + attraction_range and
				target_pos.y >= self_pos.y - attraction_range and target_pos.y <= self_pos.y + attraction_range then -- Target is still in range
					local velocity_x, velocity_z, velocity_y = 0, 0, 0
					local acceleration_x, acceleration_z, acceleration_y = 0, 0, 0

					if target_pos.x <= self_pos.x - 0.5 then
						velocity_x = -0.5
					elseif target_pos.x >= self_pos.x + 0.5 then
						velocity_x = 0.5
					end
					if velocity_x ~= 0 then
						acceleration_x = target_pos.x - self_pos.x
					end

					if target_pos.z <= self_pos.z - 0.5 then
						velocity_z = -0.5
					elseif target_pos.z >= self_pos.z + 0.5 then
						velocity_z = 0.5
					end
					if velocity_z ~= 0 then
						acceleration_z = target_pos.z - self_pos.z
					end

					-- Y == height. We don't want the orb at the foot of the player but rather near the top of it's legs
					if target_pos.y <= (self_pos.y - 1) - 0.5 then
						velocity_y = -0.5
					elseif target_pos.y >= (self_pos.y + 1) + 0.5 then
						velocity_y = 0.5
					end
					if velocity_y ~= 0 then
						acceleration_y = target_pos.y - self_pos.y
					end

					self.object:setvelocity({x = velocity_x, z = velocity_z, y = velocity_y})
					self.object:setacceleration({x = acceleration_x, z = acceleration_z, y = acceleration_y})

					if velocity_x == 0 and velocity_z == 0 and velocity_y == 0 then -- Orb is at the players position, apply experience and remove it from the world
						self.object:remove()
						minetest.sound_play("default_glass_footstep", {to_player = self.target:get_player_name()}) -- Will need a proper sound

						for result in string.gmatch(self.name, "[^_]+") do
							if tonumber(result) then -- If this reports nil, it means tonumber() failed and we can't use it as an experience value
								default.update_experience(self.target, tonumber(result))
								break
							end
						end
					end
				else
					self.object:setvelocity({x = 0, z = 0, y = 0})
					self.target = nil
				end
			else
				local objects_nearby = minetest.get_objects_inside_radius(position, attraction_range)
				local players_nearby = {}

				for _, obj in ipairs(objects_nearby) do
					if obj:is_player() then
						self.target = obj -- The closest objects are found first, so we don't need to sort manually
					end
				end
			end
		end
	})
end

minetest.register_on_joinplayer(function(player)
	local inventory = player:get_inventory()
	inventory:set_size("experience", 2) -- 2 slots: 1 for current experience, 1 for total experience since last respawn

	if not inventory:contains_item("experience", ":") then
		default.set_experience(player, 0)
		default.set_experience_total(player, 0)
	end

	minetest.register_on_respawnplayer(function(player)
		default.set_experience(player, 0)
		default.set_experience_total(player, 0)
	end)
end)

minetest.register_on_dignode(function(pos, oldnode, digger)
	local node = nil
	for name, def in pairs(minetest.registered_items) do
		if oldnode.name == name then
			node = def
			break
		end
	end

	if node.experience then
		local experience_drop = 0
		if type(node.experience) == "table" then
			experience_drop = math.random(node.experience[1], node.experience[2])
		else
			experience_drop = node.experience
		end

		local table_reverse = function(table)
			local size = #table
			local newTable = {}

			for key, value in ipairs(table) do
				newTable[size - key] = value
			end

			return newTable
		end

		local experience_orbs = table_reverse(experience_orbs)

		for key, value in ipairs(experience_orbs) do -- Will keep iterating till experience is out
			if experience_drop >= value then
				while true do
					experience_drop = experience_drop - value

					local position_modifier = math.random(-7, 7) / 10
					local pos = {x = pos.x + position_modifier, z = pos.z + position_modifier, y = pos.y}
					minetest.add_entity(pos, "default:experience_orb_" .. value)

					if experience_drop < value then
						break
					end
				end
			end
		end
	end
end)
