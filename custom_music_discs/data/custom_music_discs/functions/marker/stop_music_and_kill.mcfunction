# stop custom music playing from this marker and kill it

data modify storage custom_music_discs:data jukebox.record.custom_music set from entity @s data.custom_music
execute if data storage custom_music_discs:data jukebox.record.custom_music.sound run function custom_music_discs:music/m_stop with storage custom_music_discs:data jukebox.record.custom_music
kill @s