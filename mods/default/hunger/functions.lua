-- ===================================
-- Hunger
function default.set_hunger(player, value)
	if value > HUNGER_MAX then
		value = HUNGER_MAX
	elseif value < 0 then
		value = 0
	end

	local inventory = player:get_inventory()
	inventory:set_stack("hunger", 1, ItemStack({name = ":", count = value}))
end

function default.update_hunger(player, modifier)
	local inventory = player:get_inventory()
	local hunger = default.get_hunger(player)

	local hunger_new = 0
	if hunger + modifier > HUNGER_MAX then
		hunger_new = HUNGER_MAX
	elseif hunger + modifier < 0 then
		hunger_new = 0
	else
		hunger_new = hunger + modifier
	end

	default.set_hunger(player, hunger_new)
end

function default.get_hunger(player)
	return player:get_inventory():get_stack("hunger", 1):get_count()
end

-- ===================================
-- Saturation
function default.set_saturation(player, value)
	if value > HUNGER_SATURATION_MAX then
		value = HUNGER_SATURATION_MAX
	elseif value < 0 then -- If value is lower than 0, then the developer wants to empty the hunger AND the saturation
		value = 0
		default.update_hunger(player, -1)
	end

	local inventory = player:get_inventory()
	inventory:set_stack("hunger", 2, ItemStack({name = ":", count = value * 10})) -- We can't store decimal values in an inventory, so increase it by 10 times itself, we'll decrease it when reading again
end

function default.update_saturation(player, modifier)
	local inventory = player:get_inventory()
	local saturation = default.get_saturation(player)

	local saturation_new = 0
	if saturation + modifier > HUNGER_SATURATION_MAX then
		saturation_new = HUNGER_SATURATION_MAX
	elseif saturation + modifier < 0 then
		saturation_new = 0
	else
		saturation_new = saturation + modifier
	end

	default.set_saturation(player, saturation_new)

	if saturation == 0 and saturation + modifier < 0 then -- Saturation is subtracted but player already has 0 saturation, so subtract 1 hunger as well
		default.update_hunger(player, -1)
	end
end

function default.get_saturation(player)
	return player:get_inventory():get_stack("hunger", 2):get_count() / 10
end

-- ===================================
-- Exhaustion
function default.set_exhaustion(player, value)
	if value > HUNGER_EXHAUSTION_MAX then -- The developer
		value = 0
		default.update_saturation(player, -1)
	elseif value < 0 then
		value = 0
	end

	local inventory = player:get_inventory()
	inventory:set_stack("hunger", 3, ItemStack({name = ":", count = value * 1000})) -- We can't store decimal values in an inventory, so increase it by 1000 times itself, we'll decrease it when reading again
end

function default.update_exhaustion(player, modifier)
	local inventory = player:get_inventory()
	local exhaustion = default.get_exhaustion(player)

	local exhaustion_new = 0
	if exhaustion + modifier > HUNGER_EXHAUSTION_MAX then
		exhaustion_new = exhaustion + modifier - HUNGER_EXHAUSTION_MAX
		default.update_saturation(player, -1)
	elseif exhaustion + modifier < 0 then
		exhaustion_new = 0
	else
		exhaustion_new = exhaustion + modifier
	end

	-- TODO: For some reason when setting it from 0.7 to 0.8, it sets it to 0.799 instead. Figure out why
	default.set_exhaustion(player, exhaustion_new)
end

function default.get_exhaustion(player)
	return player:get_inventory():get_stack("hunger", 3):get_count() / 1000
end
