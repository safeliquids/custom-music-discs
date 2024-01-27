# run this function at the found jukebox
# correct action bar message and the custom music will play in the next tick at the placed marker
# if there is already a marker in this jukebox, stop it's music

execute align xyz positioned ~0.5 ~0.5 ~0.5 as @e[type=marker,tag=custom_music_discs.jukebox,predicate=custom_music_discs:within_same_block] run function custom_music_discs:marker/stop_music_and_kill
execute summon marker run function custom_music_discs:marker/create