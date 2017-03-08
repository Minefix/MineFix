#!/bin/env bash

# Dependencies: java (extracting the MC jar), imagemagick

minecraft_version="1.8.9"
location_minecraft="$HOME/.minecraft/versions"
location_minetest="$HOME/.minetest"
texturepack_name="Minecraft"

location_minetest_textures="${location_minetest}/textures/${texturepack_name}"
mkdir ${location_minetest_textures}

mkdir /tmp/mc-to-mt && cd /tmp/mc-to-mt
jar xf ${location_minecraft}/${minecraft_version}/${minecraft_version}.jar



# Creating texturepack info
mv pack.png ${location_minetest_textures}/screenshot.png
echo "${texturepack_name}" > ${location_minetest_textures}/info.txt



cd assets/minecraft/textures

# Moving and converting textures



# Beds
mv items/bed.png ${location_minetest_textures}/beds_bed.png
mv blocks/bed_feet_side.png ${location_minetest_textures}/beds_bed_side_bottom.png
cp ${location_minetest_textures}/beds_bed_side_bottom.png ${location_minetest_textures}/beds_bed_side_bottom_r.png
mv blocks/bed_head_side.png ${location_minetest_textures}/beds_bed_side_top.png
cp ${location_minetest_textures}/beds_bed_side_top.png ${location_minetest_textures}/beds_bed_side_top_r.png
mv blocks/bed_feet_top.png ${location_minetest_textures}/beds_bed_top_bottom.png
mv blocks/bed_head_top.png ${location_minetest_textures}/beds_bed_top_top.png

# Boats
mv items/boat.png ${location_minetest_textures}/boats_inventory.png
cp ${location_minetest_textures}/boats_inventory.png ${location_minetest_textures}/boats_wield.png

# Buckets
mv items/bucket_empty.png ${location_minetest_textures}/bucket.png
mv items/bucket_lava.png ${location_minetest_textures}/bucket_lava.png
mv items/bucket_water.png ${location_minetest_textures}/bucket_water.png

# Carts
mv blocks/rail_normal.png ${location_minetest_textures}/carts_rail.png
mv blocks/rail_normal_turned.png ${location_minetest_textures}/carts_rail_curved.png
mv blocks/rail_golden.png ${location_minetest_textures}/carts_rail_pwr.png

# Hud icons
convert gui/icons.png -crop 9x9+16+18 ${location_minetest_textures}/bubble.png

convert gui/icons.png -crop 7x7+53+1 -resize 9x9 ${location_minetest_textures}/heart.png
convert gui/icons.png -crop 9x9+16+0 ${location_minetest_textures}/heart_empty.png
convert gui/icons.png -crop 7x7+89+1 -resize 9x9 ${location_minetest_textures}/heart_poison_full.png

convert gui/icons.png -crop 7x7+53+28 -resize 9x9 ${location_minetest_textures}/hunger_full.png
convert gui/icons.png -crop 9x9+16+27 ${location_minetest_textures}/hunger_empty.png
convert gui/icons.png -crop 7x7+89+28 -resize 9x9 ${location_minetest_textures}/hunger_poison_full.png

convert gui/widgets.png -crop 182x22+0+0 ${location_minetest_textures}/interface_hotbar.png
convert gui/widgets.png -crop 22x22+1+23 ${location_minetest_textures}/interface_hotbar_selected.png

convert gui/widgets.png -crop 9x9+243+3 ${location_minetest_textures}/crosshair.png

# Default textures
convert blocks/destroy_stage_0.png \
		blocks/destroy_stage_1.png \
		blocks/destroy_stage_2.png \
		blocks/destroy_stage_3.png \
		blocks/destroy_stage_4.png \
		blocks/destroy_stage_5.png \
		blocks/destroy_stage_6.png \
		blocks/destroy_stage_7.png \
		blocks/destroy_stage_8.png \
		blocks/destroy_stage_9.png -append ${location_minetest_textures}/crack_anylength.png

mv blocks/stone_andesite.png ${location_minetest_textures}/default_andesite.png
mv blocks/stone_andesite_smooth.png ${location_minetest_textures}/default_andesite_polished.png
mv blocks/stone_diorite.png ${location_minetest_textures}/default_diorite.png
mv blocks/stone_diorite_smooth.png ${location_minetest_textures}/default_diorite_polished.png
mv blocks/stone_granite.png ${location_minetest_textures}/default_granite.png
mv blocks/stone_granite_smooth.png ${location_minetest_textures}/default_granite_polished.png
mv blocks/stone.png ${location_minetest_textures}/default_stone.png
mv blocks/stonebrick.png ${location_minetest_textures}/default_stone_brick.png
mv blocks/cobblestone.png ${location_minetest_textures}/default_cobblestone.png
mv blocks/cobblestone_mossy.png ${location_minetest_textures}/default_cobblestone_mossy.png

mv items/apple.png ${location_minetest_textures}/default_apple.png
mv items/apple_golden.png ${location_minetest_textures}/default_apple_golden.png
mv items/book_normal.png ${location_minetest_textures}/default_book.png
mv items/book_written.png ${location_minetest_textures}/default_book_written.png
mv blocks/bookshelf.png ${location_minetest_textures}/default_bookshelf.png
mv items/brick.png ${location_minetest_textures}/default_brick.png
mv blocks/brick.png ${location_minetest_textures}/default_brick_block.png
mv blocks/cactus_bottom.png ${location_minetest_textures}/default_cactus_bottom.png
mv blocks/cactus_side.png ${location_minetest_textures}/default_cactus_side.png
mv blocks/cactus_top.png ${location_minetest_textures}/default_cactus_top.png

# Normal chest
convert entity/chest/normal.png -crop 14x14+14+0 ${location_minetest_textures}/default_chest_top.png
convert entity/chest/normal.png -crop 14x14+28+0 ${location_minetest_textures}/default_chest_top_inside.png
convert entity/chest/normal.png -crop 14x14+28+19 ${location_minetest_textures}/default_chest_bottom.png
convert entity/chest/normal.png -crop 14x14+14+19 ${location_minetest_textures}/default_chest_bottom_inside.png
convert entity/chest/normal.png -crop 14x5+14+14 chest_part1.png
convert entity/chest/normal.png -crop 14x10+14+33 chest_part2.png
convert chest_part1.png chest_part2.png -append ${location_minetest_textures}/default_chest_front.png
mv chest_part1.png ${location_minetest_textures}/default_chest_front_top.png
mv chest_part2.png ${location_minetest_textures}/default_chest_front_bottom.png
convert entity/chest/normal.png -crop 14x5+0+14 chest_part1.png
convert entity/chest/normal.png -crop 14x10+0+33 chest_part2.png
convert chest_part1.png chest_part2.png -append ${location_minetest_textures}/default_chest_side.png
mv chest_part1.png ${location_minetest_textures}/default_chest_side_top.png
mv chest_part2.png ${location_minetest_textures}/default_chest_side_bottom.png

# Double chest
convert entity/chest/normal_double.png -crop 30x14+14+0 ${location_minetest_textures}/default_chest_double_top.png
convert entity/chest/normal_double.png -crop 30x14+44+0 ${location_minetest_textures}/default_chest_double_top_inside.png
convert entity/chest/normal_double.png -crop 30x14+44+19 ${location_minetest_textures}/default_chest_double_bottom.png
convert entity/chest/normal_double.png -crop 30x14+14+19 ${location_minetest_textures}/default_chest_double_bottom_inside.png
convert entity/chest/normal_double.png -crop 30x5+14+14 chest_part1.png
convert entity/chest/normal_double.png -crop 30x10+14+33 chest_part2.png
convert chest_part1.png chest_part2.png -append ${location_minetest_textures}/default_chest_double_front.png
mv chest_part1.png ${location_minetest_textures}/default_chest_double_front_top.png
mv chest_part2.png ${location_minetest_textures}/default_chest_double_front_bottom.png
convert entity/chest/normal_double.png -crop 30x5+58+14 chest_part1.png
convert entity/chest/normal_double.png -crop 30x10+58+33 chest_part2.png
convert chest_part1.png chest_part2.png -append ${location_minetest_textures}/default_chest_double_back.png
mv chest_part1.png ${location_minetest_textures}/default_chest_double_front_top.png
mv chest_part2.png ${location_minetest_textures}/default_chest_double_front_bottom.png
convert entity/chest/normal_double.png -crop 14x5+0+14 chest_part1.png
convert entity/chest/normal_double.png -crop 14x10+0+33 chest_part2.png
convert chest_part1.png chest_part2.png -append ${location_minetest_textures}/default_chest_double_side.png
mv chest_part1.png ${location_minetest_textures}/default_chest_double_side_top.png
mv chest_part2.png ${location_minetest_textures}/default_chest_double_side_bottom.png

mv items/clay_ball.png ${location_minetest_textures}/default_clay.png
mv blocks/clay.png ${location_minetest_textures}/default_clay_block.png
mv items/charcoal.png ${location_minetest_textures}/default_charcoal.png
mv items/coal.png ${location_minetest_textures}/default_coal.png
mv blocks/coal_block.png ${location_minetest_textures}/default_coal_block.png
mv blocks/coal_ore.png ${location_minetest_textures}/default_coal_ore.png
mv items/diamond.png ${location_minetest_textures}/default_diamond.png
mv blocks/diamond_block.png ${location_minetest_textures}/default_diamond_block.png
mv blocks/diamond_ore.png ${location_minetest_textures}/default_diamond_ore.png
mv blocks/dirt.png ${location_minetest_textures}/default_dirt.png
mv blocks/grass_side.png ${location_minetest_textures}/default_grass_side.png
# Since the default MC grass texture is gray, we can't just copy it. MC decides it's grass color depending on the biome the block is in, and from the grass gradiant located in `colormap/grass.png`
# Minefix's grass will have to be altered to get the same effect. We'll use Minetest's default grass texture for now
# Same goes for the leave textures
# The following command is taken from the #minetest IRC chat http://irc.minetest.ru/minetest/2013-09-20#i_3329109
#convert blocks/grass_top.png \( +clone +matte -fill $(convert colormap/grass.png -crop 1x1+32+128 -depth 8 txt: | tail -n +2 | sed -n 's/^.*\(#[^ ]*\).*$/\1/p') -colorize 100% +clone +swap -compose overlay -composite \) -compose SrcIn -composite -gamma 0.4 ${location_minetest_textures}/default_grass.png
mv blocks/deadbush.png ${location_minetest_textures}/default_dry_shrub.png
mv items/dye_powder_black.png ${location_minetest_textures}/default_dye_black.png
mv items/dye_powder_blue.png ${location_minetest_textures}/default_dye_blue.png
mv items/dye_powder_brown.png ${location_minetest_textures}/default_dye_brown.png
mv items/dye_powder_cyan.png ${location_minetest_textures}/default_dye_cyan.png
mv items/dye_powder_gray.png ${location_minetest_textures}/default_dye_gray.png
mv items/dye_powder_green.png ${location_minetest_textures}/default_dye_green.png
mv items/dye_powder_light_blue.png ${location_minetest_textures}/default_dye_light_blue.png
mv items/dye_powder_silver.png ${location_minetest_textures}/default_dye_light_gray.png
mv items/dye_powder_lime.png ${location_minetest_textures}/default_dye_lime_green.png
mv items/dye_powder_magenta.png ${location_minetest_textures}/default_dye_magenta.png
mv items/dye_powder_orange.png ${location_minetest_textures}/default_dye_orange.png
mv items/dye_powder_pink.png ${location_minetest_textures}/default_dye_pink.png
mv items/dye_powder_purple.png ${location_minetest_textures}/default_dye_purple.png
mv items/dye_powder_red.png ${location_minetest_textures}/default_dye_red.png
mv items/dye_powder_white.png ${location_minetest_textures}/default_dye_white.png
mv items/dye_powder_yellow.png ${location_minetest_textures}/default_dye_yellow.png
mv items/flint.png ${location_minetest_textures}/default_flint.png
mv blocks/furnace_front_off.png ${location_minetest_textures}/default_furnace_front.png
mv blocks/furnace_front_on.png ${location_minetest_textures}/default_furnace_front_active.png
mv blocks/furnace_side.png ${location_minetest_textures}/default_furnace_side.png
mv blocks/furnace_top.png ${location_minetest_textures}/default_furnace_top.png
cp ${location_minetest_textures}/default_furnace_top.png ${location_minetest_textures}/default_furnace_bottom.png
convert gui/container/furnace.png -crop 13x13+176+0 ${location_minetest_textures}/default_furnace_fire_fg.png
convert gui/container/furnace.png -crop 13x13+57+37 fire_background.png
convert fire_background.png -transparent $(convert fire_background.png -format %c -depth 8 histogram:info:histogram_image.txt && sort -n histogram_image.txt | tail -1 | awk '{print $3}') ${location_minetest_textures}/default_furnace_fire_bg.png # Change the predominant color (the background) to transparent, we only need the flames
mv blocks/glass.png ${location_minetest_textures}/default_glass.png
mv blocks/glass_black.png ${location_minetest_textures}/default_glass_black.png
mv blocks/glass_blue.png ${location_minetest_textures}/default_glass_blue.png
mv blocks/glass_brown.png ${location_minetest_textures}/default_glass_brown.png
mv blocks/glass_cyan.png ${location_minetest_textures}/default_glass_cyan.png
mv blocks/glass_gray.png ${location_minetest_textures}/default_glass_gray.png
mv blocks/glass_green.png ${location_minetest_textures}/default_glass_green.png
mv blocks/glass_light_blue.png ${location_minetest_textures}/default_glass_light_blue.png
mv blocks/glass_silver.png ${location_minetest_textures}/default_glass_light_gray.png
mv blocks/glass_lime.png ${location_minetest_textures}/default_glass_lime_green.png
mv blocks/glass_magenta.png ${location_minetest_textures}/default_glass_magenta.png
mv blocks/glass_orange.png ${location_minetest_textures}/default_glass_orange.png
mv blocks/glass_pink.png ${location_minetest_textures}/default_glass_pink.png
mv blocks/glass_purple.png ${location_minetest_textures}/default_glass_purple.png
mv blocks/glass_red.png ${location_minetest_textures}/default_glass_red.png
mv blocks/glass_white.png ${location_minetest_textures}/default_glass_white.png
mv blocks/glass_yellow.png ${location_minetest_textures}/default_glass_yellow.png
mv items/gold_ingot.png ${location_minetest_textures}/default_gold_ingot.png
mv blocks/gold_block.png ${location_minetest_textures}/default_gold_block.png
mv blocks/gold_ore.png ${location_minetest_textures}/default_gold_ore.png
mv blocks/gravel.png ${location_minetest_textures}/default_gravel.png
mv blocks/ice.png ${location_minetest_textures}/default_ice.png
mv items/iron_ingot.png ${location_minetest_textures}/default_iron_ingot.png
mv blocks/iron_block.png ${location_minetest_textures}/default_iron_block.png
mv blocks/iron_ore.png ${location_minetest_textures}/default_iron_ore.png
mv blocks/ladder.png ${location_minetest_textures}/default_ladder_wood.png
mv blocks/lapis_block.png ${location_minetest_textures}/default_lapis_block.png
mv blocks/lava_flow.png ${location_minetest_textures}/default_lava_flowing_animated.png
mv blocks/lava_still.png ${location_minetest_textures}/default_lava_source_animated.png
mv blocks/obsidian.png ${location_minetest_textures}/default_obsidian.png
mv items/paper.png ${location_minetest_textures}/default_paper.png
mv items/reeds.png ${location_minetest_textures}/farming_reeds.png
mv blocks/reeds.png ${location_minetest_textures}/default_papyrus.png
mv blocks/planks_acacia.png ${location_minetest_textures}/default_planks_acacia.png
mv blocks/planks_big_oak.png ${location_minetest_textures}/default_planks_darkoak.png
mv blocks/planks_birch.png ${location_minetest_textures}/default_planks_birch.png
mv blocks/planks_jungle.png ${location_minetest_textures}/default_planks_jungle.png
mv blocks/planks_oak.png ${location_minetest_textures}/default_planks_oak.png
mv blocks/planks_spruce.png ${location_minetest_textures}/default_planks_spruce.png
mv blocks/sapling_acacia.png ${location_minetest_textures}/default_sapling_acacia.png
mv blocks/sapling_roofed_oak.png ${location_minetest_textures}/default_sapling_darkoak.png
mv blocks/sapling_birch.png ${location_minetest_textures}/default_sapling_birch.png
mv blocks/sapling_jungle.png ${location_minetest_textures}/default_sapling_jungle.png
mv blocks/sapling_oak.png ${location_minetest_textures}/default_sapling_oak.png
mv blocks/sapling_spruce.png ${location_minetest_textures}/default_sapling_spruce.png
mv blocks/sand.png ${location_minetest_textures}/default_sand.png
mv blocks/sandstone_top.png ${location_minetest_textures}/default_sandstone_top.png
mv blocks/sandstone_bottom.png ${location_minetest_textures}/default_sandstone_bottom.png
mv blocks/sandstone_normal.png ${location_minetest_textures}/default_sandstone_normal.png
mv blocks/sandstone_carved.png ${location_minetest_textures}/default_sandstone_chiseled.png
mv blocks/sandstone_smooth.png ${location_minetest_textures}/default_sandstone_smooth.png
mv items/sign.png ${location_minetest_textures}/default_sign_wood.png
mv blocks/snow.png ${location_minetest_textures}/default_snow.png
mv items/snowball.png ${location_minetest_textures}/default_snowball.png
mv blocks/grass_side_snowed.png ${location_minetest_textures}/default_snow_side.png
mv items/stick.png ${location_minetest_textures}/default_stick.png
mv items/wood_axe.png ${location_minetest_textures}/default_tool_woodaxe.png
mv items/wood_hoe.png ${location_minetest_textures}/farming_tool_woodhoe.png
mv items/wood_pickaxe.png ${location_minetest_textures}/default_tool_woodpick.png
mv items/wood_shovel.png ${location_minetest_textures}/default_tool_woodshovel.png
mv items/wood_sword.png ${location_minetest_textures}/default_tool_woodsword.png
mv items/stone_axe.png ${location_minetest_textures}/default_tool_stoneaxe.png
mv items/stone_hoe.png ${location_minetest_textures}/farming_tool_stonehoe.png
mv items/stone_pickaxe.png ${location_minetest_textures}/default_tool_stonepick.png
mv items/stone_shovel.png ${location_minetest_textures}/default_tool_stoneshovel.png
mv items/stone_sword.png ${location_minetest_textures}/default_tool_stonesword.png
mv items/iron_axe.png ${location_minetest_textures}/default_tool_ironaxe.png
mv items/iron_hoe.png ${location_minetest_textures}/farming_tool_ironhoe.png
mv items/iron_pickaxe.png ${location_minetest_textures}/default_tool_ironpick.png
mv items/iron_shovel.png ${location_minetest_textures}/default_tool_ironshovel.png
mv items/iron_sword.png ${location_minetest_textures}/default_tool_ironsword.png
mv items/gold_axe.png ${location_minetest_textures}/default_tool_goldaxe.png
mv items/gold_hoe.png ${location_minetest_textures}/farming_tool_goldhoe.png
mv items/gold_pickaxe.png ${location_minetest_textures}/default_tool_goldpick.png
mv items/gold_shovel.png ${location_minetest_textures}/default_tool_goldshovel.png
mv items/gold_sword.png ${location_minetest_textures}/default_tool_goldsword.png
mv items/diamond_axe.png ${location_minetest_textures}/default_tool_diamondaxe.png
mv items/diamond_hoe.png ${location_minetest_textures}/farming_tool_diamondhoe.png
mv items/diamond_pickaxe.png ${location_minetest_textures}/default_tool_diamondpick.png
mv items/diamond_shovel.png ${location_minetest_textures}/default_tool_diamondshovel.png
mv items/diamond_sword.png ${location_minetest_textures}/default_tool_diamondsword.png
mv blocks/log_acacia.png ${location_minetest_textures}/default_wood_acacia.png
mv blocks/log_acacia_top.png ${location_minetest_textures}/default_wood_acacia_top.png
mv blocks/log_big_oak.png ${location_minetest_textures}/default_wood_darkoak.png
mv blocks/log_big_oak_top.png ${location_minetest_textures}/default_wood_darkoak_top.png
mv blocks/log_birch.png ${location_minetest_textures}/default_wood_birch.png
mv blocks/log_birch_top.png ${location_minetest_textures}/default_wood_birch_top.png
mv blocks/log_jungle.png ${location_minetest_textures}/default_wood_jungle.png
mv blocks/log_jungle_top.png ${location_minetest_textures}/default_wood_jungle_top.png
mv blocks/log_oak.png ${location_minetest_textures}/default_wood_oak.png
mv blocks/log_oak_top.png ${location_minetest_textures}/default_wood_oak_top.png
mv blocks/log_spruce.png ${location_minetest_textures}/default_wood_spruce.png
mv blocks/log_spruce_top.png ${location_minetest_textures}/default_wood_spruce_top.png
mv blocks/wool_colored_black.png ${location_minetest_textures}/default_wool_black.png
mv blocks/wool_colored_blue.png ${location_minetest_textures}/default_wool_blue.png
mv blocks/wool_colored_brown.png ${location_minetest_textures}/default_wool_brown.png
mv blocks/wool_colored_cyan.png ${location_minetest_textures}/default_wool_cyan.png
mv blocks/wool_colored_gray.png ${location_minetest_textures}/default_wool_gray.png
mv blocks/wool_colored_green.png ${location_minetest_textures}/default_wool_green.png
mv blocks/wool_colored_light_blue.png ${location_minetest_textures}/default_wool_light_blue.png
mv blocks/wool_colored_silver.png ${location_minetest_textures}/default_wool_light_gray.png
mv blocks/wool_colored_lime.png ${location_minetest_textures}/default_wool_lime_green.png
mv blocks/wool_colored_magenta.png ${location_minetest_textures}/default_wool_magenta.png
mv blocks/wool_colored_orange.png ${location_minetest_textures}/default_wool_orange.png
mv blocks/wool_colored_pink.png ${location_minetest_textures}/default_wool_pink.png
mv blocks/wool_colored_purple.png ${location_minetest_textures}/default_wool_purple.png
mv blocks/wool_colored_red.png ${location_minetest_textures}/default_wool_red.png
mv blocks/wool_colored_white.png ${location_minetest_textures}/default_wool_white.png
mv blocks/wool_colored_yellow.png ${location_minetest_textures}/default_wool_yellow.png
convert gui/container/furnace.png -crop 22x15+177+14 furnace_arrow.png
convert furnace_arrow.png -transparent $(convert furnace_arrow.png -format %c -depth 8 histogram:info:histogram_image.txt && sort -n histogram_image.txt | tail -1 | awk '{print $3}') ${location_minetest_textures}/gui_furnace_arrow_fg.png # Change the predominant color (the background) to transparent, we only need the arrow
convert gui/container/furnace.png -crop 22x15+80+35 furnace_arrow.png
convert furnace_arrow.png -transparent $(convert furnace_arrow.png -format %c -depth 8 histogram:info:histogram_image.txt && sort -n histogram_image.txt | tail -1 | awk '{print $3}') ${location_minetest_textures}/gui_furnace_arrow_bg.png # Change the predominant color (the background) to transparent, we only need the arrow

convert blocks/door_acacia_upper.png \
		blocks/door_acacia_lower.png -append door.png
convert door.png -flop door_flipped.png
convert blocks/door_acacia_lower.png -crop 3x16+0+0 door_border_lower.png
convert blocks/door_acacia_upper.png -crop 3x16+0+0 door_border_upper.png
convert door_border_upper.png \
		door_border_lower.png -append door_side.png
convert door.png \
		door_flipped.png \
		door_side.png +append ${location_minetest_textures}/doors_door_wood_acacia.png
mv items/door_acacia.png ${location_minetest_textures}/doors_item_wood_acacia.png

convert blocks/door_birch_upper.png \
		blocks/door_birch_lower.png -append door.png
convert door.png -flop door_flipped.png
convert blocks/door_birch_lower.png -crop 3x16+0+0 door_border_lower.png
convert blocks/door_birch_upper.png -crop 3x16+0+0 door_border_upper.png
convert door_border_upper.png \
		door_border_lower.png -append door_side.png
convert door.png \
		door_flipped.png \
		door_side.png +append ${location_minetest_textures}/doors_door_wood_birch.png
mv items/door_birch.png ${location_minetest_textures}/doors_item_wood_birch.png

convert blocks/door_dark_oak_upper.png \
		blocks/door_dark_oak_lower.png -append door.png
convert door.png -flop door_flipped.png
convert blocks/door_dark_oak_lower.png -crop 3x16+0+0 door_border_lower.png
convert blocks/door_dark_oak_upper.png -crop 3x16+0+0 door_border_upper.png
convert door_border_upper.png \
		door_border_lower.png -append door_side.png
convert door.png \
		door_flipped.png \
		door_side.png +append ${location_minetest_textures}/doors_door_wood_oak_dark.png
mv items/door_dark_oak.png ${location_minetest_textures}/doors_item_wood_oak_dark.png

convert blocks/door_jungle_upper.png \
		blocks/door_jungle_lower.png -append door.png
convert door.png -flop door_flipped.png
convert blocks/door_jungle_lower.png -crop 3x16+0+0 door_border_lower.png
convert blocks/door_jungle_upper.png -crop 3x16+0+0 door_border_upper.png
convert door_border_upper.png \
		door_border_lower.png -append door_side.png
convert door.png \
		door_flipped.png \
		door_side.png +append ${location_minetest_textures}/doors_door_wood_jungle.png
mv items/door_jungle.png ${location_minetest_textures}/doors_item_wood_jungle.png

convert blocks/door_spruce_upper.png \
		blocks/door_spruce_lower.png -append door.png
convert door.png -flop door_flipped.png
convert blocks/door_spruce_lower.png -crop 3x16+0+0 door_border_lower.png
convert blocks/door_spruce_upper.png -crop 3x16+0+0 door_border_upper.png
convert door_border_upper.png \
		door_border_lower.png -append door_side.png
convert door.png \
		door_flipped.png \
		door_side.png +append ${location_minetest_textures}/doors_door_wood_spruce.png
mv items/door_spruce.png ${location_minetest_textures}/doors_item_wood_spruce.png

convert blocks/door_wood_upper.png \
		blocks/door_wood_lower.png -append door.png
convert door.png -flop door_flipped.png
convert blocks/door_wood_lower.png -crop 3x16+0+0 door_border_lower.png
convert blocks/door_wood_upper.png -crop 3x16+0+0 door_border_upper.png
convert door_border_upper.png \
		door_border_lower.png -append door_side.png
convert door.png \
		door_flipped.png \
		door_side.png +append ${location_minetest_textures}/doors_door_wood.png
mv items/door_wood.png ${location_minetest_textures}/doors_item_wood.png

convert blocks/door_iron_upper.png \
		blocks/door_iron_lower.png -append door.png
convert door.png -flop door_flipped.png
convert blocks/door_iron_lower.png -crop 3x16+0+0 door_border_lower.png
convert blocks/door_iron_upper.png -crop 3x16+0+0 door_border_upper.png
convert door_border_upper.png \
		door_border_lower.png -append door_side.png
convert door.png \
		door_flipped.png \
		door_side.png +append ${location_minetest_textures}/doors_door_iron.png
mv items/door_iron.png ${location_minetest_textures}/doors_item_iron.png

mv blocks/trapdoor.png ${location_minetest_textures}/doors_trapdoor.png
mv blocks/iron_trapdoor.png ${location_minetest_textures}/doors_trapdoor_iron.png
mv items/bread.png ${location_minetest_textures}/farming_bread.png
mv blocks/hay_block_side.png ${location_minetest_textures}/farming_haybale.png
mv blocks/hay_block_top.png ${location_minetest_textures}/farming_haybale_top.png
mv blocks/melon_top.png ${location_minetest_textures}/farming_melon_top.png
mv blocks/melon_side.png ${location_minetest_textures}/farming_melon_side.png
mv items/seeds_melon.png ${location_minetest_textures}/farming_melon_seeds.png
mv blocks/melon_stem_connected.png ${location_minetest_textures}/farming_melon_stem_connected.png
mv blocks/melon_stem_disconnected.png ${location_minetest_textures}/farming_melon_stem_disconnected.png
mv blocks/pumpkin_face_off.png ${location_minetest_textures}/farming_pumpkin_face_off.png
mv blocks/pumpkin_face_on.png ${location_minetest_textures}/farming_pumpkin_face_on.png
mv blocks/pumpkin_top.png ${location_minetest_textures}/farming_pumpkin_top.png
mv blocks/pumpkin_side.png ${location_minetest_textures}/farming_pumpkin_side.png
mv items/seeds_pumpkin.png ${location_minetest_textures}/farming_pumpkin_seeds.png
mv blocks/pumpkin_stem_connected.png ${location_minetest_textures}/farming_pumpkin_stem_connected.png
mv blocks/pumpkin_stem_disconnected.png ${location_minetest_textures}/farming_pumpkin_stem_disconnected.png
mv blocks/wheat_stage_0.png ${location_minetest_textures}/farming_wheat_1.png
mv blocks/wheat_stage_1.png ${location_minetest_textures}/farming_wheat_2.png
mv blocks/wheat_stage_2.png ${location_minetest_textures}/farming_wheat_3.png
mv blocks/wheat_stage_3.png ${location_minetest_textures}/farming_wheat_4.png
mv blocks/wheat_stage_4.png ${location_minetest_textures}/farming_wheat_5.png
mv blocks/wheat_stage_5.png ${location_minetest_textures}/farming_wheat_6.png
mv blocks/wheat_stage_6.png ${location_minetest_textures}/farming_wheat_7.png
mv blocks/wheat_stage_7.png ${location_minetest_textures}/farming_wheat_8.png
mv items/wheat.png ${location_minetest_textures}/farming_wheat.png
mv items/seeds_wheat.png ${location_minetest_textures}/farming_wheat_seed.png
mv items/potato.png ${location_minetest_textures}/farming_potato.png
mv items/potato_baked.png ${location_minetest_textures}/farming_potato_baked.png
mv items/potato_poisonous.png ${location_minetest_textures}/farming_potato_poisonous.png
cp blocks/potatoes_stage_0.png ${location_minetest_textures}/farming_potatoes_1.png
mv blocks/potatoes_stage_0.png ${location_minetest_textures}/farming_potatoes_2.png
cp blocks/potatoes_stage_1.png ${location_minetest_textures}/farming_potatoes_3.png
mv blocks/potatoes_stage_1.png ${location_minetest_textures}/farming_potatoes_4.png
cp blocks/potatoes_stage_2.png ${location_minetest_textures}/farming_potatoes_5.png
cp blocks/potatoes_stage_2.png ${location_minetest_textures}/farming_potatoes_6.png
mv blocks/potatoes_stage_2.png ${location_minetest_textures}/farming_potatoes_7.png
cp blocks/potatoes_stage_3.png ${location_minetest_textures}/farming_potatoes_8.png
mv items/carrot.png ${location_minetest_textures}/farming_carrot.png
cp blocks/carrots_stage_0.png ${location_minetest_textures}/farming_carrots_1.png
mv blocks/carrots_stage_0.png ${location_minetest_textures}/farming_carrots_2.png
cp blocks/carrots_stage_1.png ${location_minetest_textures}/farming_carrots_3.png
mv blocks/carrots_stage_1.png ${location_minetest_textures}/farming_carrots_4.png
cp blocks/carrots_stage_2.png ${location_minetest_textures}/farming_carrots_5.png
cp blocks/carrots_stage_2.png ${location_minetest_textures}/farming_carrots_6.png
mv blocks/carrots_stage_2.png ${location_minetest_textures}/farming_carrots_7.png
mv blocks/carrots_stage_3.png ${location_minetest_textures}/farming_carrots_8.png
mv items/flint_and_steel.png ${location_minetest_textures}/fire_flint_steel.png


convert gui/icons.png -crop 182x5+0+64 ${location_minetest_textures}/interface_experiencebar_empty.png
convert gui/icons.png -crop 182x5+0+69 ${location_minetest_textures}/interface_experiencebar_full.png

for i in {0..3}
do
	for x in {0..3}
	do
		convert entity/experience_orb.png -crop 16x16+$((${i}*16))+$((${x}*16)) ${location_minetest_textures}/experience_orb_$((${i} * 4 + ${x} + 1)).png
	done
done

mv blocks/flower_dandelion.png ${location_minetest_textures}/flowers_dandelion_yellow.png
mv blocks/flower_rose.png ${location_minetest_textures}/flowers_rose.png
mv blocks/flower_tulip_orange.png ${location_minetest_textures}/flowers_tulip.png
mv blocks/waterlily.png ${location_minetest_textures}/flowers_waterlily.png
cp ${location_minetest_textures}/flowers_waterlily.png ${location_minetest_textures}/flowers_waterlily_bottom.png

convert gui/container/creative_inventory/tabs.png -crop 28x30+0+2 ${location_minetest_textures}/interface_creative_tab_inactive.png
convert gui/container/creative_inventory/tabs.png -crop 28x30+0+32 ${location_minetest_textures}/interface_creative_tab_active.png
convert gui/container/creative_inventory/tabs.png -crop 28x29+0+63 ${location_minetest_textures}/interface_creative_tab_inactive_rotated.png
convert gui/container/creative_inventory/tabs.png -crop 28x32+0+96 ${location_minetest_textures}/interface_creative_tab_active_rotated.png
convert gui/container/creative_inventory/tabs.png -crop 12x15+232+0 ${location_minetest_textures}/interface_creative_slider.png
convert gui/container/creative_inventory/tabs.png -crop 12x15+244+0 ${location_minetest_textures}/interface_creative_slider_inactive.png
convert gui/container/inventory.png -crop 120x33+0+165 ${location_minetest_textures}/default_status_bar_bg.png
convert gui/container/inventory.png -crop 16x16+109+200 ${location_minetest_textures}/status_poison.png
convert gui/container/inventory.png -crop 16x16+19+217 ${location_minetest_textures}/hunger_status_hunger.png

mv blocks/jukebox_side.png ${location_minetest_textures}/jukebox.png
mv blocks/jukebox_top.png ${location_minetest_textures}/jukebox_top.png
mv items/record_11.png ${location_minetest_textures}/jukebox_disc_11.png
mv items/record_13.png ${location_minetest_textures}/jukebox_disc_13.png
mv items/record_blocks.png ${location_minetest_textures}/jukebox_disc_blocks.png
mv items/record_cat.png ${location_minetest_textures}/jukebox_disc_cat.png
mv items/record_chirp.png ${location_minetest_textures}/jukebox_disc_chirp.png
mv items/record_far.png ${location_minetest_textures}/jukebox_disc_far.png
mv items/record_mall.png ${location_minetest_textures}/jukebox_disc_mall.png
mv items/record_mellohi.png ${location_minetest_textures}/jukebox_disc_mellohi.png
mv items/record_stal.png ${location_minetest_textures}/jukebox_disc_stal.png
mv items/record_strad.png ${location_minetest_textures}/jukebox_disc_strad.png
mv items/record_wait.png ${location_minetest_textures}/jukebox_disc_wait.png
mv items/record_ward.png ${location_minetest_textures}/jukebox_disc_ward.png
mv items/netherbrick.png ${location_minetest_textures}/nether_brick_bar.png
mv blocks/nether_brick.png ${location_minetest_textures}/nether_brick.png
mv blocks/netherrack.png ${location_minetest_textures}/nether_rack.png
mv blocks/glowstone.png ${location_minetest_textures}/nether_glowstone.png
mv blocks/portal.png ${location_minetest_textures}/nether_portal.png
mv blocks/soul_sand.png ${location_minetest_textures}/nether_sand_soul.png
mv blocks/tnt_bottom.png ${location_minetest_textures}/tnt_bottom.png
mv blocks/tnt_side.png ${location_minetest_textures}/tnt_side.png
mv blocks/tnt_top.png ${location_minetest_textures}/tnt_top.png
mv blocks/iron_bars.png ${location_minetest_textures}/xpanes_bar.png
mv blocks/farmland_dry.png ${location_minetest_textures}/farming_farmland_dry.png
mv blocks/farmland_wet.png ${location_minetest_textures}/farming_farmland_wet.png
mv blocks/crafting_table_top.png ${location_minetest_textures}/default_craftingtable_top.png
mv blocks/crafting_table_side.png ${location_minetest_textures}/default_craftingtable_side.png
mv blocks/crafting_table_front.png ${location_minetest_textures}/default_craftingtable_front.png

mv blocks/hardened_clay.png ${location_minetest_textures}/default_clay_block_hardened.png
mv blocks/hardened_clay_stained_black.png ${location_minetest_textures}/default_clay_block_hardened_black.png
mv blocks/hardened_clay_stained_blue.png ${location_minetest_textures}/default_clay_block_hardened_blue.png
mv blocks/hardened_clay_stained_brown.png ${location_minetest_textures}/default_clay_block_hardened_brown.png
mv blocks/hardened_clay_stained_cyan.png ${location_minetest_textures}/default_clay_block_hardened_cyan.png
mv blocks/hardened_clay_stained_gray.png ${location_minetest_textures}/default_clay_block_hardened_gray.png
mv blocks/hardened_clay_stained_green.png ${location_minetest_textures}/default_clay_block_hardened_green.png
mv blocks/hardened_clay_stained_light_blue.png ${location_minetest_textures}/default_clay_block_hardened_light_blue.png
mv blocks/hardened_clay_stained_lime.png ${location_minetest_textures}/default_clay_block_hardened_lime_green.png
mv blocks/hardened_clay_stained_magenta.png ${location_minetest_textures}/default_clay_block_hardened_magenta.png
mv blocks/hardened_clay_stained_orange.png ${location_minetest_textures}/default_clay_block_hardened_orange.png
mv blocks/hardened_clay_stained_pink.png ${location_minetest_textures}/default_clay_block_hardened_pink.png
mv blocks/hardened_clay_stained_purple.png ${location_minetest_textures}/default_clay_block_hardened_purple.png
mv blocks/hardened_clay_stained_red.png ${location_minetest_textures}/default_clay_block_hardened_red.png
mv blocks/hardened_clay_stained_silver.png ${location_minetest_textures}/default_clay_block_hardened_light_gray.png
mv blocks/hardened_clay_stained_white.png ${location_minetest_textures}/default_clay_block_hardened_white.png
mv blocks/hardened_clay_stained_yellow.png ${location_minetest_textures}/default_clay_block_hardened_yellow.png

mv blocks/anvil_base.png ${location_minetest_textures}/default_anvil_base.png
mv blocks/anvil_top_damaged_0.png ${location_minetest_textures}/default_anvil_top_0.png
mv blocks/anvil_top_damaged_1.png ${location_minetest_textures}/default_anvil_top_1.png
mv blocks/anvil_top_damaged_2.png ${location_minetest_textures}/default_anvil_top_2.png


mogrify ${location_minetest_textures}/*.png # Remove any invalid iCCP chunks from the images

# Clearing up
rm -rf /tmp/mc-to-mt
