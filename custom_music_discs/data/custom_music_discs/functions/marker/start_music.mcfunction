# do this at the beginning of a tick at jukebox markers that haven't started playing yet
# 1. stop vanilla music
# 2. display Now Playing message
# 3. play custom music with correct volume and pitch

function custom_music_discs:marker/stop_original_music

title @a[distance=..64] times 10 70 20
execute if data storage custom_music_discs:data marker.custom_music.display_name run title @a[distance=..64] actionbar {"translate":"record.nowPlaying", "color":"dark_green", "with":[{"type":"nbt", "source":"storage", "storage":"custom_music_discs:data", "nbt":"marker.custom_music.display_name"}]}

# if there is not sound effect, stop execution
execute unless data storage custom_music_discs:data marker.custom_music.sound run return 1

#set defaults for volume and pitch
execute unless data storage custom_music_discs:data marker.custom_music.volume run data modify storage custom_music_discs:data marker.custom_music.volume set value 4.0
execute unless data storage custom_music_discs:data marker.custom_music.pitch run data modify storage custom_music_discs:data marker.custom_music.pitch set value 1.0
function custom_music_discs:music/m_start with storage custom_music_discs:data marker.custom_music

tag @s add custom_music_discs.playing
