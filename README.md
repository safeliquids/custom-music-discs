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

## A Note on Adding Custom Sounds via Resource Pack
This section will discuss how to add or replace sounds in Minecraft using a resource pack. If you already know how that works, feel free to skip it.

In general [this paragraph](https://minecraft.wiki/w/Resource_pack#Sounds) and [this article](https://minecraft.wiki/w/Sounds.json) are good reference on the topic. You can also look at the sounds_example resource pack in this repository for a minimal example. Read [this article](https://minecraft.wiki/w/Resource_pack) for general information on resource packs and how to make one.

### Adding Sound Files
Sound files must be in .ogg format and are stored in a resource pack in the folder `assets/<namespace>/sounds/`. The [resource location](https://minecraft.wiki/w/Resource_location) of such a sound file is then `<namespace>:<path/to/file.ogg>`. The example resource pack contains several sound files. For example, the file `sounds_example/assets/example/sounds/drume/drume_mono.ogg` has the resource location `example:drume/drume_mono` where `example` is the namespace of the resource pack. Making these files accessible ingame, eg. for use with the `/playsound` command, requires some more work. That is discussed in the following paragraph.

### Sound Events
Sounds are played using so called *sound events*. Thus, adding or overwriting sound events allows for adding or replacing sounds in the game. The *identifier* of a sound event consists of a namespace, a colon, and a dot-separated name. For example `minecraft:block.amethyst_block.step` is the identifier of the sound of a Block of Amethyst being stepped on. Sound events are defined in a file called `sounds.json` which is stored in the namespace folder of your resource pack, see example
```
sounds_example
\ - assets
    \ - example
        \ - sounds.json
```
A `sounds.json` file placed like so adds sound events in the `example` namespace. Similarly, `sounds.json` in the `minecraft` namespace folder modifies or adds sounds in the default namespace `minecraft`. 

`sounds.json` consists of a single object where keys are identifiers of sound events, and values are objects defining the sound event. If the namespace is `example` a structure such as
```json
{
	"drume.mono": {
        "sounds": [
            {
                "name": "example:durme/drume_mono",
                "stream": true
            }
        ]
    }
}
```
defines a sound event `example:drume.mono`. This event plays a file with the resource location `example:drume/drume_mono` which, as we already know, references the file `assets/example/sounds/drume/drume_mono.ogg` in a resource pack. [sounds.json](sounds_example/assets/example/sounds.json) in the example pack defines this and several other events.

Note that, the `"stream"` property set to true specifies that the file should not be entirely loaded into memory and instead be streamed from disk. This is recommended for sounds longer than a couple seconds. See [this article again](https://minecraft.wiki/w/Sounds.json) for all properties that can be used here.

### Mono and Stereo Sounds
As said above, Minecraft only accepts .ogg files for sounds. Both stereo (left and right channels) and mono (only one channel) sound files work, however, there is a difference. Mono sounds are played from a specified position in the world and the volume decreases with distance. Stereo sounds always stay at the same volume even if a player moves far away from the origin of the sound.

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
