function status.register_status(name, display_name, image, callback)
	for key, value in pairs(statuses) do
		if value.name == name then
			return "FAILURE: A status with this name has already been registered"
		end
	end

	statuses[#statuses + 1] = {
		name = name,
		display_name = display_name,
		image = image,
		callback = callback -- Callback to call every tick the user has this status
	}

	return #statuses
end



function status.init_status_by_id(status_id, player, level, duration)
	player:set_attribute("status:" .. status_id, minetest.write_json({
		level = level,
		duration = duration,
		ticks = 0
	}))
end

function status.init_status_by_name(status_name, player, level, duration)
	local status_id = nil

	for key, value in pairs(statuses) do
		if value.name == status_name then
			status_id = key
		end
	end

	if status_id then
		player:set_attribute("status:" .. status_id, minetest.write_json({
			level = level,
			duration = duration,
			ticks = 0
		}))
	else
		minetest.log("FAILURE: No such status effect known")
	end
end

function status.player_has_status_by_id(status_id, player)
	local player_status = player:get_attribute("status:" .. status_id)
	if player_status and minetest.parse_json(player_status).level ~= 0 then
		return true
	end

	return false
end

function status.player_has_status_by_name(status_name, player)
	local status_id = nil

	for key, value in pairs(statuses) do
		if value.name == status_name then
			status_id = key
		end
	end

	if status_id then
		local player_status = player:get_attribute("status:" .. status_id)
		if player_status and minetest.parse_json(player_status).level ~= 0 then
			return true
		end
	else
		minetest.log("FAILURE: No such status effect known")
	end

	return false
end

function status.get_player_status_length_by_id(status_id, player)
	return minetest.parse_json(player:get_attribute("status:" .. status_id)).duration
end

function status.get_player_status_length_by_name(status_name, player)
	local status_id = nil

	for key, value in pairs(statuses) do
		if value.name == status_name then
			status_id = key
		end
	end

	return minetest.parse_json(player:get_attribute("status:" .. status_id)).duration
end
