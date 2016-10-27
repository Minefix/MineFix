minetest.register_craftitem(":fire:flint_and_steel", {
	description = "Flint and Steel",
	inventory_image = "fire_flint_steel.png",
	on_place = function(stack, _, pt)
		if pt.under and minetest.get_node(pt.under).name == "default:obsidian" then
			local done = make_portal(pt.under)
			if done and not minetest.setting_getbool("creative_mode") then
				stack:take_item()
			end
		end

		return stack
	end,
})

minetest.register_craftitem("minefix_nether:brick_bar", {
	description = "Nether Brick",
	inventory_image = "nether_brick_bar.png"
})
