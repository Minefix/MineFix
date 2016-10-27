minetest.register_node("minefix_nether:portal", {
	description = "Nether Portal",
	tiles = {
		"minefix_nether_transparent.png",
		"minefix_nether_transparent.png",
		"minefix_nether_transparent.png",
		"minefix_nether_transparent.png",
		{
			name = "minefix_nether_portal.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.5,
			},
		},
		{
			name = "minefix_nether_portal.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.5,
			},
		},
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	use_texture_alpha = true,
	walkable = false,
	diggable = false,
	pointable = false,
	buildable_to = false,
	is_ground_content = false,
	drop = "",
	light_source = 5,
	post_effect_color = {a = 180, r = 128, g = 0, b = 128},
	alpha = 192,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.1,  0.5, 0.5, 0.1},
		},
	},
	groups = {not_in_creative_inventory = 1}
})

minetest.register_node(":default:obsidian", {
	description = "Obsidian",
	tiles = {"default_obsidian.png"},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},

	on_destruct = function(pos)
		local meta = minetest.get_meta(pos)
		local p1 = minetest.string_to_pos(meta:get_string("p1"))
		local p2 = minetest.string_to_pos(meta:get_string("p2"))
		local target = minetest.string_to_pos(meta:get_string("target"))
		if not p1 or not p2 then
			return
		end

		for x = p1.x, p2.x do
		for y = p1.y, p2.y do
		for z = p1.z, p2.z do
			local nn = minetest.get_node({x = x, y = y, z = z}).name
			if nn == "default:obsidian" or nn == "minefix_nether:portal" then
				if nn == "minefix_nether:portal" then
					minetest.remove_node({x = x, y = y, z = z})
				end
				local m = minetest.get_meta({x = x, y = y, z = z})
				m:set_string("p1", "")
				m:set_string("p2", "")
				m:set_string("target", "")
			end
		end
		end
		end

		meta = minetest.get_meta(target)
		if not meta then
			return
		end
		p1 = minetest.string_to_pos(meta:get_string("p1"))
		p2 = minetest.string_to_pos(meta:get_string("p2"))
		if not p1 or not p2 then
			return
		end

		for x = p1.x, p2.x do
		for y = p1.y, p2.y do
		for z = p1.z, p2.z do
			local nn = minetest.get_node({x = x, y = y, z = z}).name
			if nn == "default:obsidian" or nn == "minefix_nether:portal" then
				if nn == "minefix_nether:portal" then
					minetest.remove_node({x = x, y = y, z = z})
				end
				local m = minetest.get_meta({x = x, y = y, z = z})
				m:set_string("p1", "")
				m:set_string("p2", "")
				m:set_string("target", "")
			end
		end
		end
		end
	end,
})

minetest.register_node("minefix_nether:rack", {
	description = "Netherrack",
	tiles = {"minefix_nether_rack.png"},
	is_ground_content = true,
	groups = {cracky = 3, level = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("minefix_nether:sand_soul", {
	description = "Soul sand",
	tiles = {"minefix_nether_sand_soul.png"},
	is_ground_content = true,
	groups = {crumbly = 3, level = 2, falling_node = 1},
	sounds = default.node_sound_gravel_defaults({
		footstep = {name = "default_gravel_footstep", gain = 0.45},
	}),
})

minetest.register_node("minefix_nether:glowstone", {
	description = "Glowstone",
	tiles = {"minefix_nether_glowstone.png"},
	is_ground_content = true,
	light_source = 14,
	paramtype = "light",
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("minefix_nether:brick", {
	description = "Nether Brick",
	tiles = {"minefix_nether_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2, level = 2},
	sounds = default.node_sound_stone_defaults(),
})

local fence_texture =
	"default_fence_overlay.png^minefix_nether_brick.png^default_fence_overlay.png^[makealpha:255,126,126"

minetest.register_node("minefix_nether:fence_nether_brick", {
	description = "Nether Brick Fence",
	drawtype = "fencelike",
	tiles = {"minefix_nether_brick.png"},
	inventory_image = fence_texture,
	wield_image = fence_texture,
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {cracky = 2, level = 2},
	sounds = default.node_sound_stone_defaults(),
})

-- Register stairs and slabs

minefix_nodes.register_slab(
	"netherbrick",
	"minefix_nether:brick",
	"Nether Brick Slab",
	{"minefix_nether_brick.png"},
	{cracky = 3},
	default.node_sound_stone_defaults()
)

stairs.register_stair(
	"nether_brick",
	"minefix_nether:brick",
	{cracky = 2, level = 2},
	{"minefix_nether_brick.png"},
	"Nether brick stairs",
	default.node_sound_stone_defaults()
)
