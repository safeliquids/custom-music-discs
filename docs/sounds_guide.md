# A Note on Adding Custom Sounds via Resource Pack
This writeup will discuss how to add or replace sounds in Minecraft using a resource pack. If you already know how that works, feel free to skip it.

In general [this paragraph](https://minecraft.wiki/w/Resource_pack#Sounds) and [this article](https://minecraft.wiki/w/Sounds.json) are good reference on the topic. You can also look at the sounds_example resource pack in this repository for a minimal example. Read [this article](https://minecraft.wiki/w/Resource_pack) for general information on resource packs and how to make one.

## Adding Sound Files
Sound files must be in .ogg format and are stored in a resource pack in the folder `assets/<namespace>/sounds/`. The [resource location](https://minecraft.wiki/w/Resource_location) of such a sound file is then `<namespace>:<path/to/file.ogg>`. The example resource pack contains several sound files. For example, the file `sounds_example/assets/example/sounds/drume/drume_mono.ogg` has the resource location `example:drume/drume_mono` where `example` is the namespace of the resource pack. Making these files accessible ingame, eg. for use with the `/playsound` command, requires some more work. That is discussed in the following paragraph.

## Sound Events
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

## Mono and Stereo Sounds
As said above, Minecraft only accepts .ogg files for sounds. Both stereo (left and right channels) and mono (only one channel) sound files work, however, there is a difference. Mono sounds are played from a specified position in the world and the volume decreases with distance. Stereo sounds always stay at the same volume even if a player moves far away from the origin of the sound.
