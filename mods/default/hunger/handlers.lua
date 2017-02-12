local item_eat = function(hunger_change, saturation_change, replace_with_item, chance_of_poison, user, pointed_thing)
	return function(itemstack, user, pointed_thing)
		if default.get_hunger(user) < HUNGER_MAX then -- Only eat when hunger isn't full
			if itemstack:take_item() ~= nil then
				-- Update saturation
				local old_saturation = default.get_saturation(user)
				if old_saturation + saturation_change > HUNGER_SATURATION_MAX then
					default.set_saturation(user, HUNGER_SATURATION_MAX)
				elseif old_saturation + saturation_change < 0 then
					default.set_saturation(user, 0)
				else
					default.update_saturation(user, saturation_change)
				end

				-- Update hunger
				local old_hunger = default.get_hunger(user)
				if old_hunger + hunger_change > HUNGER_MAX then
					default.set_hunger(user, HUNGER_MAX)
				elseif old_hunger + hunger_change < 0 then
					default.set_hunger(user, 0)
				else
					default.update_hunger(user, hunger_change)
				end

				if replace_with_item then
					if itemstack:is_empty() then
						itemstack:add_item(replace_with_item)
					else
						local inv = user:get_inventory()
						if inv:room_for_item("main", {name = replace_with_item}) then
							inv:add_item("main", replace_with_item)
						else
							local pos = user:getpos()
							pos.y = math.floor(pos.y + 0.5)
							core.add_item(pos, replace_with_item)
						end
					end
				end
			end
		end

		return itemstack
	end
end

local eat = function(hunger_change, saturation_change, replace_with_item, itemstack, user, pointed_thing)
	local func = item_eat(hunger_change, saturation_change, replace_with_item, user, pointed_thing)

	return func(itemstack, user, pointed_thing)
end

local do_item_eat = function(hunger_change, saturation_change, replace_with_item, itemstack, user, pointed_thing)
	local itemstack_itemcount = itemstack:get_count()
	itemstack = eat(hunger_change, saturation_change, replace_with_item, itemstack, user, pointed_thing)

	if itemstack:get_count() ~= itemstack_itemcount then -- Only call the other functions if the food is actually eaten
		for _, callback in pairs(core.registered_on_item_eats) do
			local result = callback(hunger_change, replace_with_item, itemstack, user, pointed_thing)
			if result then
				return result
			end
		end
	end
	return itemstack
end

core.item_eat = function(hunger_change, saturation_change, replace_with_item)
	return function(itemstack, user, pointed_thing)  -- closure
		return do_item_eat(hunger_change, saturation_change, replace_with_item, itemstack, user, pointed_thing)
	end
end

function hunger.handle_blockbreak(pos, oldnode, player)
	if not player or not player:is_player() then -- Make sure the digger is a player
		return
	end

	default.update_exhaustion(player, HUNGER_EXHAUST_BREAK)
end
