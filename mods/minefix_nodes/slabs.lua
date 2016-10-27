local ownRotation = {
	[0] = 8,
	[1] = 0,
	[2] = 2,
	[3] = 1,
	[4] = 3,
	[5] = 4
}
local placeRotation = {
	[0] = 0, -- y axis
	[1] = 20, -- y -axis
	[2] = 12, -- x axis
	[3] = 16, -- x -axis
	[4] = 4, -- z axis
	[5] = 8 -- z -axis
}

function minefix_nodes.register_slab(type, material, description, images, groups, sounds)
	-- First register the doubleslab block
	minetest.register_node(":minefix_nodes:doubleslab_" .. type, {
		-- Don't give it a description, so it doesn't show up in the creative inventory
		tiles = images,
		is_ground_content = false,
		groups = groups,
		sounds = sounds,
		drop = "minefix_nodes:slab_" .. type .. " 2"
	})

	minetest.register_node(":minefix_nodes:slab_" .. type, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
		on_place = function(itemstack, player, targetblock)
			local under = minetest.get_node(targetblock.under)
			local wield_item = itemstack:get_name()

			if under and wield_item == under.name then
				local targetDirection = minetest.dir_to_facedir(vector.subtract(targetblock.above, targetblock.under), true)

				local p2 = under.param2

				-- Check if the placing slab has the same direction as the already placed slab
				if ownRotation[math.floor(p2 / 4)] == targetDirection then
					-- Set the old slab to the new double slab block
					minetest.set_node(targetblock.under, {name = "minefix_nodes:doubleslab_" .. type})

					-- If the player is in creative mode, remove the slab he placed from his inventory
					if not minetest.setting_getbool("creative_mode") then
						itemstack:take_item()
					end

					return itemstack
				end

				--[[
				This is broken! Doesn't work properly for sideways slabs, but that needs to be removed anyway
				Please have a look at it
				]]--
				-- Placing a slab on an upside down slab should make it right-side up.
				if p2 >= 20 and targetDirection == 8 then
					p2 = p2 - 20
				-- Same for the opposite case: slab below normal slab
				elseif p2 <= 3 and targetDirection == 4 then
					p2 = p2 + 20
				end

				-- Else attempt to place node with proper param2
				minetest.item_place_node(ItemStack(wield_item), player, targetblock, p2)
				if not minetest.setting_getbool("creative_mode") then
					itemstack:take_item()
				end

				return itemstack
			else
				-- Get position relative to the targetblock
				local direction = minetest.dir_to_wallmounted(vector.subtract(targetblock.above, targetblock.under), true)

				local rotation = placeRotation[targetDirection]; -- Set rotation to the proper direction

				if rotation == 0 or rotation == 20 then -- If the rotation is bottom or top
					rotation = rotation + minetest.dir_to_facedir(player:get_look_dir()) --Rotate the block to face the player
				end

				-- Finally place the block
				return minetest.item_place(itemstack, player, targetblock, rotation)
			end
		end
	})

	if material then
		minetest.register_craft({
			output = 'minefix_nodes:slab_' .. type .. " 6",
			recipe = {
				{material, material, material}
			},
		})
	end
end
