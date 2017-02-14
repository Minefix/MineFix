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
	player:get_inventory():set_stack("status", status_id, ItemStack({name = ":", count = level, wear = duration, metadata = "0"}))
end

function status.init_status_by_name(status_name, player, level, duration)
	local id = nil

	for key, value in pairs(statuses) do
		if value.name == status_name then
			id = key
		end
	end

	if id then
		player:get_inventory():set_stack("status", id, ItemStack({name = ":", count = level, wear = duration, metadata = "0"}))
	else
		minetest.log("FAILURE: No such status effect known")
	end
end

function status.player_has_status_by_id(status_id, player)
	if player:get_inventory():get_stack("status", status_id):get_count() ~= 0 then
		return true
	end

	return false
end

function status.player_has_status_by_name(status_name, player)
	local id = nil

	for key, value in pairs(statuses) do
		if value.name == status_name then
			id = key
		end
	end

	if player:get_inventory():get_stack("status", id):get_count() ~= 0 then
		return true
	end

	return false
end

function status.get_player_status_length_by_id(status_id, player)
	local stack = player:get_inventory():get_stack("status", status_id)
	if stack:get_count() ~= 0 then
		return stack:get_wear()
	end

	return false
end

function status.get_player_status_length_by_name(status_name, player)
	local id = nil

	for key, value in pairs(statuses) do
		if value.name == status_name then
			id = key
		end
	end

	local stack = player:get_inventory():get_stack("status", id)
	if stack:get_count() ~= 0 then
		return stack:get_wear()
	end

	return false
end
