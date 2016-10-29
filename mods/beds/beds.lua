-- Simple shaped bed

beds.register_bed("beds:bed", {
	description = "Bed",
	inventory_image = "beds_bed.png",
	wield_image = "beds_bed.png",
	tiles = {
		bottom = {
			"beds_bed_top_bottom.png^[transformR90",
			"default_planks_oak.png",
			"beds_bed_side_bottom_r.png",
			"beds_bed_side_bottom_r.png^[transformfx",
			"beds_transparent.png",
			"beds_bed_side_bottom.png"
		},
		top = {
			"beds_bed_top_top.png^[transformR90",
			"default_planks_oak.png",
			"beds_bed_side_top_r.png",
			"beds_bed_side_top_r.png^[transformfx",
			"beds_bed_side_top.png",
			"beds_transparent.png",
		}
	},
	nodebox = {
		bottom = {
			{0.3125, -0.5, -0.5, 0.5, -0.3125, -0.3125}, -- FeetRightBottom
			{-0.5, -0.3125, -0.5, 0.5, -0.1875, 0.5}, -- Bottom
			{-0.5, -0.1875, -0.5, 0.5, 0.0625, 0.5}, -- Top
			{-0.5, -0.5, -0.5, -0.3125, -0.3125, -0.3125}, -- FeetLeftBottom
		},
		top = {
			{0.3125, -0.5, 0.3125, 0.5, -0.3125, 0.5}, -- FeetRightTop
			{-0.5, -0.3125, -0.5, 0.5, -0.1875, 0.5}, -- Bottom
			{-0.5, -0.1875, -0.5, 0.5, 0.0625, 0.5}, -- Top
			{-0.5, -0.5, 0.3125, -0.3125, -0.3125, 0.5}, -- FeetLeftTop
		},
	},
	selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
	recipe = {
		{"default:wool_red", "default:wool_red", "default:wool_white"},
		{"group:wood", "group:wood", "group:wood"}
	},
})

-- Aliases for PilzAdam's beds mod

minetest.register_alias("beds:bed_bottom_red", "beds:bed_bottom")
minetest.register_alias("beds:bed_top_red", "beds:bed_top")
