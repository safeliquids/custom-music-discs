# do this at the beginning of a tick at jukebox markers
# if music was not already playing, start it and return
# else, if the jukebox doesn't have a record any more, stop custom music (stored on the marker)

execute store success score $is_playing custom_music_discs if entity @s[tag=custom_music_discs.playing]

execute if score $is_playing custom_music_discs matches 0 run function custom_music_discs:marker/start_music
execute if score $is_playing custom_music_discs matches 0 run return 1

# if the disc was ejected (or juke got removed), stop the music
execute unless block ~ ~ ~ jukebox[has_record=true] run function custom_music_discs:marker/stop_music_and_kill
