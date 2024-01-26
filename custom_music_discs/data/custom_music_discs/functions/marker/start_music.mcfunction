# do this at the beginning of a tick at jukebox markers that haven't started playing yet
# 1. stop vanilla music (all records for now)
# 2. display Now Playing message
# 3. play custom music with correct volume and pitch

stopsound @a record music_disc.11
stopsound @a record music_disc.13
stopsound @a record music_disc.5
stopsound @a record music_disc.blocks
stopsound @a record music_disc.cat
stopsound @a record music_disc.chirp
stopsound @a record music_disc.far
stopsound @a record music_disc.mall
stopsound @a record music_disc.mellohi
stopsound @a record music_disc.otherside
stopsound @a record music_disc.pigstep
stopsound @a record music_disc.relic
stopsound @a record music_disc.stal
stopsound @a record music_disc.strad
stopsound @a record music_disc.wait
stopsound @a record music_disc.ward

data modify storage custom_music_discs:data jukebox.record.custom_music set from entity @s data.custom_music

execute if data storage custom_music_discs:data jukebox.record.custom_music.display_name run title @a[distance=..64] times 10 70 20
execute if data storage custom_music_discs:data jukebox.record.custom_music.display_name run title @a[distance=..64] actionbar {"translate":"record.nowPlaying", "color":"dark_green", "with":[{"type":"nbt", "source":"storage", "storage":"custom_music_discs:data", "nbt":"jukebox.record.custom_music.display_name"}]}

execute unless data storage custom_music_discs:data jukebox.record.custom_music.volume run data modify storage custom_music_discs:data jukebox.record.custom_music.volume set value 1.0
execute unless data storage custom_music_discs:data jukebox.record.custom_music.pitch run data modify storage custom_music_discs:data jukebox.record.custom_music.pitch set value 1.0
execute if data storage custom_music_discs:data jukebox.record.custom_music.sound run function custom_music_discs:music/m_start with storage custom_music_discs:data jukebox.record.custom_music

tag @s add custom_music_discs.playing
