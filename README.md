# custom-music-discs

A Minecraft: Java Edition datapack that allows for playing custom made music discs. This versin of the pack is compatible with Minecraft version 1.20.5.

## Installation and Quick Start

1. Download or clone the repository. Place the custom_music_discs subdirectory in your datapacks directory.
2. If the server (or singleplayer world) is running, type the command `/reload` or restart it entirely.
3. To apply a custom track to a disc, add the following structure to its `"minecraft:custom_data"` component:
	```
	{ custom_music: { sound: <name> } }
	```
	where `<name>` is the identifier of a sound event to play, such as `"minecraft:entity.pig.ambient"`. That can be done by modifying the item data or a command such as
	```
	/give @p music_disc_cat[custom_data={custom_music:{sound:"minecraft:entity.pig.ambient"}}]
	```

## Behaviour
Several data tags can be applied to a music disc item to make it play a custom sound. When a disc with custom music applied to it is inserted into a jukebox by a player, the vanilla record music is stopped and the configured sound is played instead. When it is ejected either by a player, a hopper or removing the jukebox, the custom music stops, similar to playing regular records.

Do note that, stopping a sound in a given channel stops all instances of that sound currently playing in that channel. That may lead to some unwanted interactions eg. when playing multiple copies of the same custom music disc simultaneously. Also see [Known Issues](#known-issues).

## Custom Music Format
Custom music is applied to a vanilla music disc in a ***"custom_music"*** data tag inside the item's ***"minecraft:custom_data"*** component. Several properties can be set in ***"custom_music"***
- ***"sound": string, optional*** - id of the sound event to play. If omitted, record music is stopped and nothing plays.
- ***"display_name": string, optional*** - name of the music that displays in the "Now Playing" actionbar message. If omitted, nothing is displayed. The name is treated as plain text, not JSON text component.
- ***"volume": float, default: 4.0*** - volume of the sound. Note that volume higher than 1 does not make sounds louder and instead increases the range at which they can be heard. 4.0 corresponds to the range of regular jukeboxes (64 blocks.)
- ***"pitch": float, default: 1.0*** - pitch of the sound

A command such as
```
/give @p music_disc_cat[custom_data={custom_music:{sound:"minecraft:entity.pig.ambient", display_name:"Piggy Noises!", volume:1.5, pitch:0.8}}]
```
creates a custom music disc that plays the ambient pig noise at volume 1.5 and pitch 0.8. When played, it shows "Now Playing: Piggy Noises!" in the action bar of nearby players.

## Adding Custom Sounds via Resource Pack
If you don't know how to add custom sounds to Minecraft, you can read [this guide](docs/sounds_guide.md). Check out [this article](https://minecraft.wiki/w/Resource_pack) for general information on resource packs and how to make one.

## License
This datapack is available under the MIT license. That means it can be
re-released (such as in a Minecraft map) or otherwise used as long as it 
stays under the same license and credits the author (ie. me). For convenience,
a copy of the LICENSE document is insie the actual datapack folder so there is
no need to manually copy it.

All sounds in the example resource pack were produced by safeliquids (me) and are free to use for whatever purpose.

## Acknowledgements
The [Unofficial Minecraft Wiki](https://minecraft.wiki) has been a great resource when developing this datapack.

## Known Issues
- If a custom disc is played during a server reload, the original record music is not stopped.
- When a custom disc is played, all sound events with the same id in the record channel are stopped. This is a technical limitation and unlikely to be fixed.
