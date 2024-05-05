# run this as a marker to attempt stopping vanilla music

data modify storage custom_music_discs:data marker.custom_music set from entity @s data.custom_music
data modify storage custom_music_discs:data marker.disc.id set from entity @s data.disc.id

function custom_music_discs:music/m_stop_original with storage custom_music_discs:data marker.disc