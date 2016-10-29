function jukebox.register_disc(name, music_name)
	jukebox.registered_discs[name] = music_name
end

-- +---------+
-- |  Discs  |
-- +---------+

for i = 1, 9 do
	local item_name = "jukebox:disc_" .. i
	local description = "Music Disc " .. i
	local inventory_image = "jukebox_disc_" .. i .. ".png"
	local music_name = "jukebox_disc_" .. i

	jukebox.register_disc(item_name, {
		description = description,
		inventory_image = inventory_image,
		music_name = music_name
	})
end

minetest.register_craftitem("jukebox:disc_13", {
	description = "Music Disc 13",
	category = "miscellaneous",
	inventory_image = "jukebox_disc_13.png",
	stack_max = 1
})
jukebox.register_disc("jukebox:disc_13", "jukebox_disc_13")

minetest.register_craftitem("jukebox:disc_cat", {
	description = "Music Disc Cat",
	category = "miscellaneous",
	inventory_image = "jukebox_disc_cat.png",
	stack_max = 1
})
jukebox.register_disc("jukebox:disc_cat", "jukebox_disc_cat")

minetest.register_craftitem("jukebox:disc_blocks", {
	description = "Music Disc Blocks",
	category = "miscellaneous",
	inventory_image = "jukebox_disc_blocks.png",
	stack_max = 1
})
jukebox.register_disc("jukebox:disc_blocks", "jukebox_disc_blocks")

minetest.register_craftitem("jukebox:disc_chirp", {
	description = "Music Disc Chirp",
	category = "miscellaneous",
	inventory_image = "jukebox_disc_chirp.png",
	stack_max = 1
})
jukebox.register_disc("jukebox:disc_13", "jukebox_disc_chirp")

minetest.register_craftitem("jukebox:disc_far", {
	description = "Music Disc Far",
	category = "miscellaneous",
	inventory_image = "jukebox_disc_far.png",
	stack_max = 1
})
jukebox.register_disc("jukebox:disc_far", "jukebox_disc_far")

minetest.register_craftitem("jukebox:disc_mall", {
	description = "Music Disc Mall",
	category = "miscellaneous",
	inventory_image = "jukebox_disc_mall.png",
	stack_max = 1
})
jukebox.register_disc("jukebox:disc_mall", "jukebox_disc_mall")

minetest.register_craftitem("jukebox:disc_mellohi", {
	description = "Music Disc Mellohi",
	category = "miscellaneous",
	inventory_image = "jukebox_disc_mellohi.png",
	stack_max = 1
})
jukebox.register_disc("jukebox:disc_mellohi", "jukebox_disc_mellohi")

minetest.register_craftitem("jukebox:disc_stal", {
	description = "Music Disc Stal",
	category = "miscellaneous",
	inventory_image = "jukebox_disc_stal.png",
	stack_max = 1
})
jukebox.register_disc("jukebox:disc_stal", "jukebox_disc_stal")

minetest.register_craftitem("jukebox:disc_strad", {
	description = "Music Disc Strad",
	category = "miscellaneous",
	inventory_image = "jukebox_disc_strad.png",
	stack_max = 1
})
jukebox.register_disc("jukebox:disc_strad", "jukebox_disc_strad")

minetest.register_craftitem("jukebox:disc_ward", {
	description = "Music Disc Ward",
	category = "miscellaneous",
	inventory_image = "jukebox_disc_ward.png",
	stack_max = 1
})
jukebox.register_disc("jukebox:disc_ward", "jukebox_disc_ward")

minetest.register_craftitem("jukebox:disc_11", {
	description = "Music Disc 11",
	category = "miscellaneous",
	inventory_image = "jukebox_disc_11.png",
	stack_max = 1
})
jukebox.register_disc("jukebox:disc_11", "jukebox_disc_11")

minetest.register_craftitem("jukebox:disc_wait", {
	description = "Music Disc Wait",
	category = "miscellaneous",
	inventory_image = "jukebox_disc_wait.png",
	stack_max = 1
})
jukebox.register_disc("jukebox:disc_wait", "jukebox_disc_wait")
