# Farming

This mod adds Minecraft's food and block farming system to Minetest. For more details, read how it works from the [Minecraft Gamepedia](http://minecraft.gamepedia.com/Farming).

## API

To allow other mods to add growable crops, farming tools, or growth boosters (for example bonemeal), this mod includes a simple to use API.

### Crops

The core of this mod focusses around growables (crops). To add a growable, call `farming.register_growable()` like you would normally call `minetest.register_node()`. Add the following parameters:

* type
	* The type of growable. It supports the following options:
		* stages (wheat, carrots, potatoes, etc)
* texture (instead of `tiles`)
	* The base texture to use for the growable. The name will be modified to fit the stages if necessary
	* `farming_wheat.png` (when registering wheat) for example is changed to `farming_wheat_1.png` up to `farming_wheat_8.png` as it has 8 growth stages
* inventory_image
	* The image to be shown in the inventory, for example seeds
* minlight
	* The minimum amount of light the growable needs to grow
* maxlight (optional)
	* The maximum amount of light the growable accepts in order to grow

If `type` is set to "crop", the following parameter is also required:

* stages
	* The amount of stages the growable has in it's life

Example:

```
farming.register_growable("farming:crop_wheat", {
	description = "Seeds",
	category = "materials",
	type = "crop",
	stages = 8,
	texture = "farming_wheat.png",
	inventory_image = "farming_wheat_seed.png",
	minlight = 1,
})

```

Do note that the "seed" the player in the inventory will have in the example above will be called "farming:crop_wheat_1", *not* "farming:crop_wheat". This name will have to be used in for example crafting recipes.

### Farming tools

Farming tools can be used to till dirt and grass and make it farmland which then can be used to grow crops on. To make a tool a farming tool just add farming to the groupcaps.

Example:

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
})
```

As seen above, the wooden hoe is made a farming tool by the `farming = {uses = 60}` groupcap. Each time this tool is used to till dirt 1 out of 60 uses will be subtracted.

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
