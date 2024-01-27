# run this as the newly created jukebox marker

tag @s add custom_music_discs.jukebox
data modify storage custom_music_discs:data jukebox.record.item set from block ~ ~ ~ RecordItem
data modify entity @s data.custom_music set from storage custom_music_discs:data jukebox.record.item.tag.custom_music
data modify entity @s data.disc.id set from storage custom_music_discs:data jukebox.record.item.id
