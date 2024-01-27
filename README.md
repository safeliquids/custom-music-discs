# custom-music-discs

A Minecraft: Java Edition datapack that allows for playing custom made music discs. This pack uses macros so Minecraft version 1.20.2 or higher is required.

## Quick Start

1. Download or clone the repository. Place the custom_music_discs subdirectory in your datapacks directory.
2. To apply a custom track to a disc, add the following structure to its tag:
	```
	{ custom_music: { sound: <name> } }
	```
	where `<name>` is the identifier of a sound event to play.

## Full format
In addition to the sound event id, several other properties can be given in the ***"custom_music"*** tag. All available tags are
1. ***"sound": string, optional*** - id of the sound to play. If omitted, record music is stopped and nothing plays.
2. ***"display_name": string, optional*** - name of the music that displays in the "Now Playing" actionbar message. If omitted, nothing is displayed. The name is treated as plain text, not JSON text component.
3. ***"volume": float, default: 1.0*** - volume of the sound
4. ***"pitch": float, default: 1.0*** - pitch of the sound

## License
This datapack is available under the MIT license. That means it can be
re-released (such as in a Minecraft map) or otherwise used as long as it 
stays under the same license and credits the author (ie. me). For convenience,
a copy of the LICENSE document is insie the actual datapack folder so there is
no need to manually copy it.

## Known Issues
- if a custom disc is played during a server reload, the original record music is not stopped.
