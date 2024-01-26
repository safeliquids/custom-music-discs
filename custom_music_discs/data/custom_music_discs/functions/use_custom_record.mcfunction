advancement revoke @s only custom_music_discs:use_custom_record
scoreboard players set $r custom_music_discs 0
scoreboard players set $found_jukebox custom_music_discs 0
execute anchored eyes run function custom_music_discs:find_the_jukebox
execute if score $found_jukebox custom_music_discs matches 0 run tellraw @s "Something went wrong. Try playing that disc again."
