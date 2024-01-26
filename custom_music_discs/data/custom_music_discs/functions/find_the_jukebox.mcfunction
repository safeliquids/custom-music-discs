# raycast to find the jukebox that was played
# if found, stop the original music and replace it with custom music

# if the jukebox was not found, the score $found_jukebox equals 0 after this function call

execute store success score $found_jukebox custom_music_discs if block ^ ^ ^ jukebox
execute if score $found_jukebox custom_music_discs matches 1 run function custom_music_discs:place_marker

scoreboard players add $r custom_music_discs 1
execute if score $found_jukebox custom_music_discs matches 0 if score $r custom_music_discs matches 0..550 positioned ^ ^ ^0.01 run function custom_music_discs:find_the_jukebox
