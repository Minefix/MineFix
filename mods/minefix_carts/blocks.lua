minetest.register_node("minefix_carts:rail", {
	description = "Rail",
	category = "transportation",
	drawtype = "raillike",
	tiles = {"minefix_carts_rail.png", "minefix_carts_rail_curved.png", "minefix_carts_rail_t_junction.png", "minefix_carts_rail_crossing.png"},
	inventory_image = "minefix_carts_rail.png",
	wield_image = "minefix_carts_rail.png",
	paramtype = "light",
	is_ground_content = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		-- but how to specify the dimensions for curved and sideways rails?
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	groups = {bendy=2,snappy=1,dig_immediate=2,attached_node=1,rail=1,connect_to_raillike=1},
})

--[[minetest.register_node("minefix_carts:powerrail", {
	description = "Powered Rail",
	drawtype = "raillike",
	tiles = {"minefix_carts_rail_pwr.png", "minefix_carts_rail_curved_pwr.png", "minefix_carts_rail_t_junction_pwr.png", "minefix_carts_rail_crossing_pwr.png"},
	inventory_image = "minefix_carts_rail_pwr.png",
	wield_image = "minefix_carts_rail_pwr.png",
	paramtype = "light",
	is_ground_content = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		-- but how to specify the dimensions for curved and sideways rails?
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	groups = {bendy=2,snappy=1,dig_immediate=2,attached_node=1,rail=1,connect_to_raillike=1},

	after_place_node = function(pos, placer, itemstack)
		if not mesecon then
			minetest.env:get_meta(pos):set_string("cart_acceleration", "0.5")
		end
	end,

	mesecons = {
		effector = {
			action_on = function(pos, node)
				minetest.env:get_meta(pos):set_string("cart_acceleration", "0.5")
			end,

			action_off = function(pos, node)
				minetest.env:get_meta(pos):set_string("cart_acceleration", "0")
			end,
		},
	},
})]]--
