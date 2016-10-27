minetest.register_entity("minefix_carts:cart", cart)
minetest.register_craftitem("minefix_carts:cart", {
	description = "Minecart",
	inventory_image = minetest.inventorycube("minefix_cart_top.png", "minefix_cart_side.png", "minefix_cart_side.png"),
	wield_image = "minefix_cart_side.png",

	on_place = function(itemstack, placer, pointed_thing)
		if not pointed_thing.type == "node" then
			return
		end
		if cart_func:is_rail(pointed_thing.under) then
			minetest.env:add_entity(pointed_thing.under, "minefix_carts:cart")
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
			return itemstack
		elseif cart_func:is_rail(pointed_thing.above) then
			minetest.env:add_entity(pointed_thing.above, "minefix_carts:cart")
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
			return itemstack
		end
	end,
})
