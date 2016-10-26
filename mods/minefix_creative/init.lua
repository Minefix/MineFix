if minetest.setting_getbool("creative_mode") then
	local digtime = 5;
	local caps = {times = {digtime, digtime, digtime}, uses = 0, maxlevel = 256}

	minetest.register_item(":", {
		type = "none",
		wield_image = "wieldhand.png",
		wield_scale = {x = 1, y = 1, z = 2.5},
		tool_capabilities = {
			full_punch_interval = 0.5,
			max_drop_level = 3,
			groupcaps = {
				crumbly = caps,
				cracky = caps,
				snappy = caps,
				choppy = caps,
				oddly_breakable_by_hand = caps,
			},
			damage_groups = {fleshy = 10},
		}
	});
end
