# custom-music-discs

A Minecraft: Java Edition datapack that allows for playing custom made music discs. This pack uses macros so Minecraft version 1.20.2 or higher is required.

## Quick Start

1. Download or clone the repository. Place the custom_music_discs subdirectory in your datapacks directory.
2. To apply a custom track to a disc, add the following structure to its tag:
	```
	{ custom_music: { sound: <name> } }
	```
	where `<name>` is the identifier of a sound event to play, such as `"minecraft:entity.pig.ambient"`.

## Full format
In addition to the sound event id, several other properties can be given in the ***"custom_music"*** tag. All available tags are
- ***"sound": string, optional*** - id of the sound to play. If omitted, record music is stopped and nothing plays.
- ***"display_name": string, optional*** - name of the music that displays in the "Now Playing" actionbar message. If omitted, nothing is displayed. The name is treated as plain text, not JSON text component.
- ***"volume": float, default: 4.0*** - volume of the sound. Note that volume higher than 1 does not make sounds louder and instead increases the range at which they can be heard. 4.0 corresponds to the range of regular jukeboxes (64 blocks.)
- ***"pitch": float, default: 1.0*** - pitch of the sound

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
