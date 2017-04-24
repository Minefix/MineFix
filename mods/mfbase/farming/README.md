# Farming

This mod adds Minecraft's food and block farming system to Minetest. For more details, read how it works from the [Minecraft Gamepedia](http://minecraft.gamepedia.com/Farming).

## API

To allow other mods to add growable crops, farming tools, or growth boosters (for example bonemeal), this mod includes a simple to use API.

### Crops

The core of this mod focusses around growables (crops). There are several variants: crops (wheat, carrots, potatoes, etc), blocks (sugarcane/reeds, cacti, etc) and plants (melons, pumpkings, etc). Call the registering functions like you would normally call `minetest.register_node()`.

#### Examples
A crop requires a stages parameter telling it how many stages of growth it goes through. The specified drop will be dropped once the crop is **fully grown**.
```
farming.register_crop("farming:crop_wheat", {
	description = "Seeds",
	category = "materials",
	stages = 8,
	drop = {
		items = {
			{items = {"farming:wheat"}, rarity = 1},
			{items = {"farming:crop_wheat"}, rarity = 3},
			{items = {"farming:crop_wheat"}, rarity = 3},
			{items = {"farming:crop_wheat"}, rarity = 3},
		}
	},
	texture = "farming_wheat.png",
	inventory_image = "farming_wheat_seed.png",
	minlight = 9,
})

```

A block requires a drawtype (and if needed node_box) as the block might not always be solid (like reeds). A max height should also be specified to determine the maximum height the "plant" can reach.
```
farming.register_block("farming:cactus", {
	description = "Cactus",
	category = "decoration",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, -0.4375, 0.4375, 0.5, 0.4375}, -- NodeBox1
		},
	},
	walkable = true,
	type = "block",
	drop = "farming:cactus",
	texture = {"default_cactus_top.png", "default_cactus_bottom.png", "default_cactus_side.png"},
	baseblocks = {"default:sand", "farming:cactus"},
	maxheight = 3,
})
```

A plant requires a description and category for both the seeds and the resulting plant to appear in the creative inventory, an amount of stages for the stem to grow, a texture connected and disconnect for the stem, and a minimum light level for  growing.
```
farming.register_plant("farming:melon", {
	description = "Melon",
	description_seeds = "Melon Seeds",
	category = "building",
	category_seeds = "materials",
	stages = 8,
	texture = {"farming_melon_top.png", "farming_melon_top.png", "farming_melon_side.png"},
	texture_connected = "farming_melon_stem_connected.png",
	texture_disconnected = "farming_melon_stem_disconnected.png",
	inventory_image_seeds = "farming_melon_seeds.png",
	minlight = 9,
})
```

Do note that the "seed" the player in the inventory will have in the example above will be called "farming:crop_wheat_1", *not* "farming:crop_wheat". This name will have to be used in for example crafting recipes.

### Farming tools

Farming tools can be used to till dirt and grass and make it farmland which then can be used to grow crops on. To make a tool a farming tool just add the `farming.till` function to a tools definition like this example:

```
minetest.register_tool("farming:hoe_wood", {
	description = "Wooden Hoe",
	category = "tools",
	inventory_image = "farming_tool_woodhoe.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level = 0,
		groupcaps = {
			crumbly = {times={[1] = 3.00, [2] = 1.60, [3] = 0.60}, uses = 60, maxlevel = 1},
			farming = {uses = 60},
		},
		damage_groups = {fleshy = 1},
	},
	on_place = farming.till
})
```

As seen above, the wooden hoe is made a farming tool by the `farming = {uses = 60}` groupcap (specifying how many uses the tool has for tilling dirt) and calling `farming.till` in the `on_place` callback. Each time this tool is used to till dirt 1 out of 60 uses will be subtracted.

### Growth boosters

To make a growth booster, the item will have to be defined with a "growth_boost" value. The value decides how much stages a crop should be boosted.

For example:

```
minetest.register_craftitem("bonemeal", {
	description = "Bonemeal",
	category = "materials",
	inventory_image = "bonemeal.png",
	growth_boost = 2
})
```

This item would then grow the crop on which it's pointed by 2 levels each time the players rightclicks.
