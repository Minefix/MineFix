# Jukebox

This mod adds a jukebox and music discs to Minetest.

The original mod is made by BlockMen, LNJ and Rui, you can find it [here](https://github.com/minetest-mods/jukebox).

## API Documentation

The jukebox mod offers a simple API to register new discs. First make a regular item, and then register it with this mod using the following:

```
jukebox.register_disc("mymod:disc", "musicname") -- Make sure the music name is without the file extension
```

Of course make sure the music file is in the `sounds/` directory in your mod folder.

## Copyright

Copyright (C) 2013 BlockMen <blockmen2015@gmail.com>
Copyright (C) 2015-2016 LNJ <lnj.git@gmail.com>
Copyright (C) 2016 Rui

## License

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 2 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.


### Asset licenses

BlockMen (WTFPL):
  jukebox_disc_*.png (added coulors by lightonflux)


Music: CC0

The authors are (freesound.org):
  - cheesepuff (song1)
  - geerterig (song2)
  - rap2h (song3)
  - keffstay (song4)
  - usedtobe (song5)
  - zagi2 (song6)
