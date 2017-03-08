local tick_time = 20 -- 20 default
local tick_chance = 4 -- 4 default

local check_water_nearby = function(pos)
	local water_found = false
	local node = minetest.get_node({x = pos.x - 1, y = pos.y, z = pos.z}).name
	if node == "default:water_source" or node == "default:water_flowing" then
		water_found = true
	end

	if not water_found then
		node = minetest.get_node({x = pos.x, y = pos.y, z = pos.z - 1}).name
		if node == "default:water_source" or node == "default:water_flowing" then
			water_found = true
		end
	end

	if not water_found then
		node = minetest.get_node({x = pos.x + 1, y = pos.y, z = pos.z}).name
		if node == "default:water_source" or node == "default:water_flowing" then
			water_found = true
		end
	end

	if not water_found then
		node = minetest.get_node({x = pos.x, y = pos.y, z = pos.z + 1}).name
		if node == "default:water_source" or node == "default:water_flowing" then
			water_found = true
		end
	end

	return water_found
end

local growth_boost = function(pos, node, clicker, itemstack, pointed_thing, stages) -- Allow growth boosters, for example bonemeal
	local growth_boost = minetest.registered_items[itemstack:get_name()].growth_boost

	if growth_boost then
		for stage, stage_name in pairs(stages) do
			local next_node = minetest.registered_nodes[stages[stage + 1]]

			if node.name == stage_name and stage ~= #stages then
				if next_node and (next_node.plant and stage + 1 ~= #stages) then -- If the plant is melon-like, don't allow the growth boost to plant the block
					if stage + growth_boost > #stages then -- If the boost would make the growable too big, just set it to the ma
						growth_boost = #stages - stage
					end

					minetest.set_node(pos, {name = stages[stage + growth_boost]})
					break
				end
			end
		end
	end
end

local determine_growth_probability = function(pos, node, stages)
	for stage, stage_name in pairs(stages) do
		if stage_name == node.name and stage == #stages then
			return
		end
	end

	if node.param1 < minetest.registered_nodes[node.name].minlight or (minetest.registered_nodes[node.name].maxlight and node.param1 > minetest.registered_nodes[node.name].maxlight) then
		return
	end

	local block_beneath = minetest.get_node({x = pos.x, y = pos.y - 1, z = pos.z}).name

	local points = 0
	if block_beneath == "farming:farmland_dry" then
		points = 2
	elseif block_beneath == "farming:farmland_wet" then
		points = 4
	end

	local pos_x, pos_y, pos_z = pos.x - 4, pos.y, pos.z - 4

	local crop_nearby = {
		total = 0,
		x = 0,
		z = 0
	}
	local x = 0
	while x <= 8 do
		local z = 0

		while z <= 8 do
			local found_node_beneath = minetest.get_node({x = pos_x + x, y = pos_y - 1, z = pos_z + z})
			local found_node = minetest.get_node({x = pos_x + x, y = pos_y, z = pos_z + z})

			if pos_x + x ~= pos.x or pos_z + z ~= pos.z then
				if found_node ~= node then -- If the found node is not the current node
					if found_node_beneath.name == "farming:farmland_dry" then
						points = points + 0.25
					elseif found_node_beneath.name == "farming:farmland_wet" then
						points = points + 0.75
					end

					for stage, stage_name in pairs(stages) do
						if found_node.name == stage_name then
							crop_nearby.total = crop_nearby.total + 1

							if pos_x + x == pos.x then
								crop_nearby.x = crop_nearby.x + 1
							elseif pos_z + z == pos.z then
								crop_nearby.z = crop_nearby.z + 1
							end
						end
					end
				end
			end

			z = z + 1
		end

		x = x + 1
	end

	if (crop_nearby.x > 0 and crop_nearby.x < crop_nearby.total) or (crop_nearby.z > 0 and crop_nearby.z > crop_nearby.total) then -- If there are more crops not on the same axis
		points = points / 2
	end

	local growth_probability = 1 / (math.floor(25 / points) + 1) * 100
	growth_probability = math.ceil(growth_probability - 0.5) -- Rounding

	if math.random(0, 100) <= growth_probability then
		for stage, stage_name in pairs(stages) do
			if stage_name == node.name then
				return true
			end
		end
	end

	return
end

farming.register_crop = function(name, def)
	if not def.stages or not def.minlight then
		return
	end

	local stages = {}

	local texture = def.texture:split(".")[1]
	stages[1] = name .. "_1"

	minetest.register_node(stages[1], {
		description = def.description,
		category = def.category,
		drawtype = "plantlike",
		offset = 1,
		tiles = {texture .. "_1.png"},
		inventory_image = def.inventory_image,
		wield_image = def.inventory_image,
		walkable = false,
		groups = {flammable = 2, plant = 1, dig_immediate = 3},
		drop = stages[1],
		paramtype = "light",
		paramtype2 = "meshoptions",
		place_param2 = 0x3,
		sunlight_propagates = true,
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
		minlight = def.minlight,
		maxlight = def.maxlight,
		node_placement_prediction = "", -- Prevent the client from showing the block before it's actually placed
		on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
			return growth_boost(pos, node, clicker, itemstack, pointed_thing, stages)
		end,
		on_place = function(itemstack, placer, pointed_thing)
			local target_node = minetest.get_node(pointed_thing.under)
			local node_above = minetest.get_node(pointed_thing.above)

			if node_above.name == "air" and (target_node.name == "farming:farmland_dry" or target_node.name == "farming:farmland_wet") then
				return minetest.item_place_node(itemstack, placer, pointed_thing)
			end

			return itemstack
		end,
		on_use = def.on_use,
		sounds = default.node_sound_leaves_defaults(),
		crop = true,
	})

	local index = 1
	while index < def.stages do
		index = index + 1

		local drop = stages[1]
		if index == def.stages then
			if def.drop.items then
				for key1, value in pairs(def.drop.items) do
					if value.items[1] == name then
						def.drop.items[key1].items[1] = stages[1]
					end
				end
			end
			drop = def.drop
		end
		stages[index] = name .. "_" .. index

		minetest.register_node(name .. "_" .. index, {
			drawtype = "plantlike",
			waving = 1,
			tiles = {texture .. "_" .. index .. ".png"},
			walkable = false,
			buildable_to = true,
			groups = {flammable = 2, plant = 1, dig_immediate = 3},
			drop = drop,
			paramtype = "light",
			paramtype2 = "meshoptions",
			place_param2 = 0x3,
			sunlight_propagates = true,
			selection_box = {
				type = "fixed",
				fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
			},
			minlight = def.minlight,
			maxlight = def.maxlight,
			on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
				return growth_boost(pos, node, clicker, itemstack, pointed_thing, stages)
			end,
			sounds = default.node_sound_leaves_defaults(),
			crop = true
		})
	end

	minetest.register_abm({
		nodenames = stages,
		interval = tick_time, -- Every 20 seconds
		chance = tick_chance, -- Chance of 1 in 4
		action = function(pos, node)
			if determine_growth_probability(pos, node, stages) then
				for stage, stage_name in pairs(stages) do
					if stage_name == node.name then
						minetest.set_node(pos, {name = stages[stage + 1], param2 = 0x3})
						break
					end
				end
			end
		end
	})
end

farming.register_block = function(name, def)
	minetest.register_node(name, {
		description = def.description,
		category = def.category,
		drawtype = def.drawtype,
		node_box = def.node_box,
		tiles = def.texture,
		inventory_image = def.inventory_image,
		wield_image = def.inventory_image,
		walkable = def.walkable,
		groups = {flammable = 2, plant = 1, dig_immediate = 3},
		drop = name,
		paramtype = "light",
		paramtype2 = "meshoptions",
		place_param2 = def.place_param2,
		minlight = def.minlight,
		maxlight = def.maxlight,
		node_placement_prediction = "", -- Prevent the client from showing the block before it's actually placed
		on_place = function(itemstack, placer, pointed_thing)
			local target_node = minetest.get_node(pointed_thing.under)
			local node_above = minetest.get_node(pointed_thing.above)

			local allow_placement = false
			if node_above.name == "air" then
				for _, value in pairs(def.baseblocks) do
					if target_node.name == value then
						allow_placement = true
					end
				end
			end

			if not allow_placement then
				return itemstack
			end

			if not def.allowneighbours then
				local neighbour_found = false
				local node = minetest.get_node({x = pointed_thing.above.x - 1, y = pointed_thing.above.y, z = pointed_thing.above.z}).name
				if node ~= "air" then
					neighbour_found = true
				end

				if not neighbour_found then
					node = minetest.get_node({x = pointed_thing.above.x, y = pointed_thing.above.y, z = pointed_thing.above.z - 1}).name
					if node ~= "air" then
						neighbour_found = true
					end
				end

				if not neighbour_found then
					node = minetest.get_node({x = pointed_thing.above.x + 1, y = pointed_thing.above.y, z = pointed_thing.above.z}).name
					if node ~= "air" then
						neighbour_found = true
					end
				end

				if not neighbour_found then
					node = minetest.get_node({x = pointed_thing.above.x, y = pointed_thing.above.y, z = pointed_thing.above.z + 1}).name
					if node ~= "air" then
						neighbour_found = true
					end
				end

				if neighbour_found then
					return itemstack
				end
			end

			if minetest.get_node({x = pointed_thing.above.x, y = pointed_thing.above.y - 1, z = pointed_thing.above.z}).name ~= name then
				if def.requirewater then
					if not check_water_nearby(pointed_thing.under) then
						return itemstack
					end
				end
			end

			return minetest.item_place_node(itemstack, placer, pointed_thing)
		end,
		on_use = def.on_use,
		--[[
		We manually have to remove blocks above
		Normally this could be done automatically by adding `attached_node` to the node groups, however this would prevent the players from stacking the nodes theirselves
		]]
		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			local height = 1
			while true do
				local pos_above = {x = pos.x, y = pos.y + height, z = pos.z}
				local node_above = minetest.get_node(pos_above)

				if node_above.name ~= name then
					return
				end

				--minetest.node_dig(pos_above, node_above, digger)
				minetest.set_node(pos_above, {name="air"})
				minetest.item_drop(ItemStack({name = name, count = 1}), digger, pos_above)

				height = height + 1
			end
		end,
		sounds = default.node_sound_leaves_defaults(),
		crop = true
	})

	minetest.register_abm({
		nodenames = {name},
		interval = tick_time,
		chance = tick_chance,
		action = function(pos, node)
			if def.requirewater and minetest.get_node({x = pos.x, y = pos.y - 1, z = pos.z}).name ~= node.name then
				if not check_water_nearby({x = pos.x, y = pos.y - 1, z = pos.z}) then
					minetest.remove_node(pos)
				end
			end

			if (def.maxlight and node.param1 < def.minlight) or (def.maxlight and node.param1 > def.maxlight) then
				return
			end

			local node_above = minetest.get_node({x = pos.x, y = pos.y + 1, z = pos.z})

			if node_above.name ~= "air" then
				return
			end

			local height = 0
			while true do -- Get block height
				height = height + 1

				if minetest.get_node({x = pos.x, y = pos.y - height, z = pos.z}).name ~= node.name then
					break
				end
			end

			if height >= def.maxheight then
				return
			end

			local meta = minetest.get_meta(pos)
			meta:set_int("age", meta:get_int("age") + 1)

			if meta:get_int("age") < 16 then
				return
			end

			local result = minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z}, {name = node.name})
			meta:set_int("age", 0)
		end
	})
end

farming.register_plant = function(name, def)
	if not def.stages or not def.minlight then
		return
	end

	minetest.register_node(name, {
		description = def.description,
		category = def.category,
		tiles = def.texture,
		inventory_image = def.inventory_image,
		groups = {cracky = 3, stone = 1},
		sounds = default.node_sound_wood_defaults(),
	})

	local stages = {}

	stages[1] = name .. "_1"

	minetest.register_node(stages[1], {
		description = def.description_seeds,
		category = def.category_seeds,
		drawtype = "plantlike",
		offset = 1,
		tiles = {"transparent.png^[combine:16x16:0," .. 14 - (1 / def.stages * 1 * 14) .. "=" .. def.texture_disconnected},
		inventory_image = def.inventory_image_seeds,
		wield_image = def.inventory_image,
		walkable = false,
		groups = {flammable = 2, plant = 1, dig_immediate = 3},
		drop = stages[1],
		paramtype = "light",
		sunlight_propagates = true,
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
		minlight = def.minlight,
		maxlight = def.maxlight,
		node_placement_prediction = "", -- Prevent the client from showing the block before it's actually placed
		on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
			return growth_boost(pos, node, clicker, itemstack, pointed_thing, stages)
		end,
		on_place = function(itemstack, placer, pointed_thing)
			local target_node = minetest.get_node(pointed_thing.under)
			local node_above = minetest.get_node(pointed_thing.above)

			if node_above.name == "air" and (target_node.name == "farming:farmland_dry" or target_node.name == "farming:farmland_wet") then
				return minetest.item_place_node(itemstack, placer, pointed_thing)
			end

			return itemstack
		end,
		on_use = def.on_use,
		sounds = default.node_sound_leaves_defaults(),
		plant = true,
	})

	local index = 1
	while index < def.stages do
		index = index + 1

		local drop = stages[1]

		stages[index] = name .. "_" .. index

		if #stages ~= def.stages then
			minetest.register_node(stages[index], {
				drawtype = "plantlike",
				waving = 1,
				tiles = {"transparent.png^[combine:16x16:0," .. 14 - (1 / def.stages * index * 14) .. "=" .. def.texture_disconnected},
				walkable = false,
				groups = {flammable = 2, plant = 1, dig_immediate = 3},
				drop = drop,
				paramtype = "light",
				sunlight_propagates = true,
				selection_box = {
					type = "fixed",
					fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
				},
				minlight = def.minlight,
				maxlight = def.maxlight,
				on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
					return growth_boost(pos, node, clicker, itemstack, pointed_thing, stages)
				end,
				sounds = default.node_sound_leaves_defaults(),
				plant = true
			})
		else
			minetest.register_node(stages[index], {
				drawtype = "plantlike",
				waving = 1,
				tiles = {def.texture_connected},
				walkable = false,
				groups = {flammable = 2, plant = 1, dig_immediate = 3},
				drop = drop,
				paramtype = "light",
				paramtype2 = "meshoptions",
				sunlight_propagates = true,
				selection_box = {
					type = "fixed",
					fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
				},
				minlight = def.minlight,
				maxlight = def.maxlight,
				sounds = default.node_sound_leaves_defaults(),
				plant = true
			})
		end
	end

	minetest.register_abm({
		nodenames = stages,
		interval = tick_time,
		chance = tick_chance,
		action = function(pos, node)
			if determine_growth_probability(pos, node, stages) then
				for stage, stage_name in pairs(stages) do
					if stage_name == node.name then
						local next_node = minetest.registered_nodes[stages[stage + 1]]

						if next_node and stage + 1 ~= #stages then -- If the plant is melon-like, don't allow the growth boost to plant the block
							minetest.set_node(pos, {name = stages[stage + 1]})
							break
						else
							local pos_x, pos_z = pos.x - 1, pos.z - 1
							local available_pos = {}
							local x = 0
							while x <= 2 do
								local z = 0

								while z <= 2 do
									local found_node = minetest.get_node({x = pos_x + x, y = pos.y, z = pos_z + z})

									if pos_x + x == pos.x or pos_z + z == pos.z then
										if found_node ~= node then -- If the found node is not the current node
											if found_node.name == "air" then
												table.insert(available_pos, {x = pos_x + x, y = pos.y, z = pos_z + z})
											end
										end
									end

									z = z + 1
								end

								x = x + 1
							end

							if #available_pos > 0 then -- Only place a block if there is space
								local chosen_spot = available_pos[math.random(1, #available_pos)]

								minetest.set_node(pos, {name = stages[#stages], param2 = 0x5})
								minetest.set_node(chosen_spot, {name = name})

								minetest.register_on_dignode(function(block_pos, oldnode, digger)
									if oldnode.name == name and vector.equals(chosen_spot, block_pos) then -- If the broken block equals our just placed block
										minetest.set_node(pos, {name = stages[#stages - 1]}) -- Set the stem 1 stage back
									end
								end)
							end
						end
					end
				end
			end
		end
	})
end

-- Change dry farmland to wet, and vice versa
minetest.register_abm({
	nodenames = {"farming:farmland_dry", "farming:farmland_wet"},
	interval = 1,
	chance = 4,
	action = function(pos, node)
		if node.name == "farming:farmland_dry" then
			local block_above = minetest.get_node({x = pos.x, y = pos.y + 1, z = pos.z}).name

			if minetest.find_node_near(pos, 4, "default:water_source") or minetest.find_node_near(pos, 4, "default:water_flowing") then
				node.param1 = node.param1 + 1

				if node.param1 >= 7 then
					minetest.set_node(pos, {name = "farming:farmland_wet"})
				else
					minetest.set_node(pos, node)
				end
			else
				if node.param1 > 0 then
					node.param1 = node.param1 - 1
					minetest.set_node(pos, node)
				else -- Check if the farmland has been dry for too long
					if not minetest.registered_items[block_above].crop then -- Don't allow drying up if there is a crop on the farmland
						local meta = minetest.get_meta(pos)
						if not meta:get_int("dry") then
							meta:set_int("dry", 0)
						else
							if meta:get_int("dry") < 3 then
								meta:set_int("dry", meta:get_int("dry") + 1)
							else
								minetest.set_node(pos, {name = "default:dirt"})
							end
						end
					end
				end
			end
		else
			if not minetest.find_node_near(pos, 4, "default:water_source") then
				minetest.set_node(pos, {name = "farming:farmland_dry", param1 = 6})
			end
		end
	end
})

-- Change farmland to dirt if something is placed on top of it, which is not a crop, by building against a block next to it or a different mod
minetest.register_abm({
	nodenames = {"farming:farmland_dry", "farming:farmland_wet"},
	interval = 0.5,
	chance = 1,
	action = function(pos, node)
		local block_above = minetest.get_node({x = pos.x, y = pos.y + 1, z = pos.z})

		if block_above.name ~= "air" and (not minetest.registered_nodes[block_above.name].crop and not minetest.registered_nodes[block_above.name].plant) then
			minetest.set_node(pos, {name = "default:dirt"})
		end
	end
})

-- Change farmland to dirt if something is placed on top of it, which is not a crop
minetest.register_on_placenode(function(pos, newnode) -- Check if a block is placed above farmland, if so replace the farmland for dirt
	if newnode.name ~= "air" then -- You never know what kind of magic a player might be able too ;)
		local block_beneath = minetest.get_node({x = pos.x, y = pos.y - 1, z = pos.z}).name
		if (block_beneath == "farming:farmland_dry" or block_beneath == "farming:farmland_wet") and not minetest.registered_items[newnode.name].crop and not minetest.registered_nodes[newnode.name].plant then
			minetest.set_node({x = pos.x, y = pos.y - 1, z = pos.z}, {name = "default:dirt"})
		end
	end
end)

farming.till = function(pos, node, clicker, itemstack, pointed_thing)
	if itemstack:get_tool_capabilities().groupcaps.farming then
		local tool_uses = itemstack:get_tool_capabilities().groupcaps.farming.uses

		if tool_uses == 0 then
			return itemstack
		end

		local check_above = {x = pos.x, y = pos.y + 1, z = pos.z}
		if minetest.get_node(check_above).name == "air" then
			minetest.set_node(pointed_thing.under, {name = "farming:farmland_dry"})
			minetest.sound_play("default_dig_crumbly", {
				pos = pointed_thing.under,
				gain = 0.5,
			})

			if not minetest.setting_getbool("creative_mode") then
				itemstack:add_wear(65535 / (tool_uses - 1))
			end
		end
	else -- If the wielded item while right clicking is no farming tool, just place the block like normal
		minetest.item_place_node(itemstack, clicker, pointed_thing)
	end

	return itemstack
end

minetest.override_item("default:dirt", {
	on_rightclick = farming.till,
	growth_boost = 1
})

minetest.override_item("default:dirt_with_grass", {
	on_rightclick = farming.till
})
