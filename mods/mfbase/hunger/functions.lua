-- ===================================
-- Hunger
function hunger.set_hunger(player, value)
	if value > HUNGER_MAX then
		value = HUNGER_MAX
	elseif value < 0 then
		value = 0
	end

	local inventory = player:get_inventory()
	inventory:set_stack("hunger", 1, ItemStack({name = ":", count = value}))
end

function hunger.update_hunger(player, modifier)
	local inventory = player:get_inventory()
	local player_hunger = hunger.get_hunger(player)

	local hunger_new = 0
	if player_hunger + modifier > HUNGER_MAX then
		hunger_new = HUNGER_MAX
	elseif player_hunger + modifier < 0 then
		hunger_new = 0
	else
		hunger_new = player_hunger + modifier
	end

	hunger.set_hunger(player, hunger_new)
end

function hunger.get_hunger(player)
	return player:get_inventory():get_stack("hunger", 1):get_count()
end

-- ===================================
-- Saturation
function hunger.set_saturation(player, value)
	if value > HUNGER_SATURATION_MAX then
		value = HUNGER_SATURATION_MAX
	elseif value < 0 then -- If value is lower than 0, then the developer wants to empty the hunger AND the saturation
		value = 0
		hunger.update_hunger(player, -1)
	end

	player:get_inventory():set_stack("hunger", 2, ItemStack({name = ":", count = value * 10})) -- We can't store decimal values in an inventory, so increase it by 10 times itself, we'll decrease it when reading again
end

function hunger.update_saturation(player, modifier)
	local inventory = player:get_inventory()
	local player_saturation = hunger.get_saturation(player)

	local saturation_new = 0
	if player_saturation + modifier > HUNGER_SATURATION_MAX then
		saturation_new = HUNGER_SATURATION_MAX
	elseif player_saturation + modifier < 0 then
		saturation_new = 0
	else
		saturation_new = player_saturation + modifier
	end

	hunger.set_saturation(player, saturation_new)

	if player_saturation == 0 and player_saturation + modifier < 0 then -- Saturation is subtracted but player already has 0 saturation, so subtract 1 hunger as well
		hunger.update_hunger(player, -1)
	end
end

function hunger.get_saturation(player)
	return player:get_inventory():get_stack("hunger", 2):get_count() / 10
end

-- ===================================
-- Exhaustion
function hunger.set_exhaustion(player, value)
	if value > HUNGER_EXHAUSTION_MAX then -- The developer
		value = 0
		hunger.update_saturation(player, -1)
	elseif value < 0 then
		value = 0
	end

	player:get_inventory():set_stack("hunger", 3, ItemStack({name = ":", count = value * 1000})) -- We can't store decimal values in an inventory, so increase it by 1000 times itself, we'll decrease it when reading again
end

function hunger.update_exhaustion(player, modifier)
	local inventory = player:get_inventory()
	local player_exhaustion = hunger.get_exhaustion(player)

	local exhaustion_new = 0
	if player_exhaustion + modifier > HUNGER_EXHAUSTION_MAX then
		exhaustion_new = player_exhaustion + modifier - HUNGER_EXHAUSTION_MAX
		hunger.update_saturation(player, -1)
	elseif player_exhaustion + modifier < 0 then
		exhaustion_new = 0
	else
		exhaustion_new = player_exhaustion + modifier
	end

	-- TODO: For some reason when setting it from 0.7 to 0.8, it sets it to 0.799 instead. Figure out why
	hunger.set_exhaustion(player, exhaustion_new)
end

function hunger.get_exhaustion(player)
	return player:get_inventory():get_stack("hunger", 3):get_count() / 1000
end
