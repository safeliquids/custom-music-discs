# do this at the beginning of a tick at jukebox markers that haven't started playing yet
# 1. stop vanilla music
# 2. display Now Playing message
# 3. play custom music with correct volume and pitch

data modify storage custom_music_discs:data marker.custom_music set from entity @s data.custom_music
data modify storage custom_music_discs:data marker.disc.id set from entity @s data.disc.id

function custom_music_discs:music/m_stop_original with storage custom_music_discs:data marker.disc

execute if data storage custom_music_discs:data marker.custom_music.display_name run title @a[distance=..64] times 10 70 20
execute if data storage custom_music_discs:data marker.custom_music.display_name run title @a[distance=..64] actionbar {"translate":"record.nowPlaying", "color":"dark_green", "with":[{"type":"nbt", "source":"storage", "storage":"custom_music_discs:data", "nbt":"marker.custom_music.display_name"}]}

#set defaults for volume and pitch
execute unless data storage custom_music_discs:data marker.custom_music.volume run data modify storage custom_music_discs:data marker.custom_music.volume set value 1.0
execute unless data storage custom_music_discs:data marker.custom_music.pitch run data modify storage custom_music_discs:data marker.custom_music.pitch set value 1.0
execute if data storage custom_music_discs:data marker.custom_music.sound run function custom_music_discs:music/m_start with storage custom_music_discs:data marker.custom_music

tag @s add custom_music_discs.playing
