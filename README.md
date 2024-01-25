# custom-music-discs

A Minecraft: Java Edition datapack that allows for playing custom made music discs. This pack uses macros so Minecraft version 1.20.2 or higher is required.

## Quick Start

1. Download or clone the repository. Place the custom_music_disc subdirectory in your datapacks directory.
2. To apply a custom track to a disc, add the following structure to its tag:
	```
	{ custom_music: { sound: <name> } }
	```
	where `<name>` is the identifier of a sound event to play.
