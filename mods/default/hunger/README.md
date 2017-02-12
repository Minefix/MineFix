# Hunger

This mod adds Minecraft's hunger system to Minetest. For more details, read how it works from the [Minecraft Gamepedia](http://minecraft.gamepedia.com/Hunger#Mechanics).

## API
To allow other mods to modify the hunger, saturation and exhaustion levels, this mod includes a simple to use API.

There are 8 functions:

* set_hunger(player, value)
    * Sets the player's hunger level to a specified value. This takes the maximum and minimum hunger levels into account
* update_hunger(player, modifier)
	* Updates the player's hunger level with the modifier. If hunger has to be subtracted, specify a negative value. This takes the maximum and minimum hunger levels into account
* get_hunger(player)
    * Reads the player's hunger level
* set_saturation(player, value)
    * Sets the player saturation level to a specified value. This takes the maximum and minimum saturation levels into account
* update_saturation(player, modifier)
    * Updates the player's saturation level with the modifier. If saturation has to be subtracted, specify a negative value. This takes the maximum and minimum saturation levels into account
* get_saturation(player)
    * Reads the player's hunger level
* set_exhaustion(player, value)
    * Sets the player's exhaustion level to a specified value. This takes the maximum and minimum hunger levels into account
	* Setting it to the maximum exhaustion will **not** remove 1 saturation. Use update_saturation() for that
* update_exhaustion(player, modifier)
    * Increases the player's exhaustion level with the modifier. This takes the maximum exhaustion level into account
* get_exhaustion(player)
    * Reads the player's exhaustion level

The maximum hunger and saturation levels are 20 (hardcoded), and exhaustion 4. The minimum for all of them is 0.

### Poison

It's also possible to make players hungry or poison them by eating certain foods (using the status module). To accomplish this add "hunger_level" (1 to whatever value preferred), "hunger_duration" (in seconds) and "hunger_chance" (in percentages) to the food when registering it as a craftitem. Same goes for poison. Examples:

```
minetest.register_craftitem("default:apple", {
	description = "Apple",
	category = "foodstuff",
	inventory_image = "default_apple.png",
	on_use = minetest.item_eat(4, 2.4),
	hunger_level = 1,
	hunger_duration = 30,
	hunger_chance = 50
})
```

```
minetest.register_craftitem("default:apple", {
	description = "Apple",
	category = "foodstuff",
	inventory_image = "default_apple.png",
	on_use = minetest.item_eat(4, 2.4),
	poison_level = 1,
	poison_duration = 30,
	poison_chance = 50
})
```

To manually make the player hungry call `default.init_status_by_name("hunger", player, level, duration)`. To manually poison the player call `default.poison("poison", player, level, duration)`.

When hungry, the player will gain 0.005 saturation multiplied by his hunger level per game tick (each 0.05 seconds).

When poisoned the player will get damaged every few ticks. The following table shows the rates:

| Level | Ticks per half a heart | heart per second |
| ----- | ---------------------- | ---------------- |
| 1     | 25                     | 0.4              |
| 2     | 12                     | 0.8              |
| 3     | 6                      | 1.66             |
| 4     | 3                      | 3.33             |
| 5+    | 1                      | 10               |
