# Status

This module adds Minecraft's status system to Minetest. For more details, read how it works from the [Minecraft Gamepedia](http://minecraft.gamepedia.com/Status_effect).

## Built-in statuses

Currently built-in statuses are (internal names are shown, so don't use these for your own statuses):

* hunger
* poison

## API
To allow other mods to register new statuses, or active existing or new statuses, this module includes a simple to use API.

There are 5 functions:

* default.register_status(name, display_name, image, callback)
    * Registers a new status. "Name" is used internally, "display_name" is shown to the player, "image" is the image shown in the survival inventory when the player is affected, callback is the function that will be called every tick to apply status effects
	* Will return the status id used by other functions
* default.init_status_by_id(status_id, player, level, duration)
    * Start the status effect that belongs to the specified id by the player
* default.init_status_by_name(status_name, player, level, duration)
    * Start the status effect that belongs to the specified name by the player
* default.player_has_status_by_id(status_id, player)
    * Returns true if the player has the specified status
* default.player_has_status_by_name(status_name, player)
    * Returns true if the player has the specified status

Once a new status is registered, and it's activated by the player, this module will call the specified callback every game tick (each ~0.05s). The callback will be passed 4 arguments:

* player - The player object on who the status is applied on
* level - The level of the status
* duration - The left over duration of the status
* ticks - Ticks since last time a status effect was applied

Once an effect is applied (say damaging the player each 20 ticks (each second)) true has to be returned. If something else is returned, it's assumed the effect isn't applied and the amount of ticks won't be reset.
