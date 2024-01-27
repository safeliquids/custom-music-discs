# call this to silence the sound event corresponding to the disc id
# parameters:
#     id: item id of the disc
# 
# the list RECORD_MAP contains pairs like so
#     {id:"minecraft:music_disc_11", sound:"minecraft:music_disc.11"}

$data modify storage custom_music_discs:data marker.original_music set from storage custom_music_discs:data RECORD_MAP[{id:"$(id)"}]
function custom_music_discs:music/m_stop_original_inner with storage custom_music_discs:data marker.original_music
