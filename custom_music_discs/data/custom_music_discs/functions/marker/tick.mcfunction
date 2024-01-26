# do this at the beginning of a tick at jukebox markers
# if music was not already playing, start it and return
# else, if the jukebox doesn't have a record any more, stop custom music (stored on the marker)

execute store success score $is_playing custom_music_discs if entity @s[tag=custom_music_discs.playing]

execute if score $is_playing custom_music_discs matches 0 run function custom_music_discs:marker/start_music
execute if score $is_playing custom_music_discs matches 0 run return 1

# it was already playing -> if record was ejected, stop custom music
execute if block ~ ~ ~ jukebox[has_record=true] run return 2
data modify storage custom_music_discs:data jukebox.record.custom_music set from entity @s data.custom_music
execute if data storage custom_music_discs:data jukebox.record.custom_music.sound run function custom_music_discs:music/m_stop with storage custom_music_discs:data jukebox.record.custom_music

kill @s
