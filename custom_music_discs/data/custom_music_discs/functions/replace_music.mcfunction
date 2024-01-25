# run this function at the found jukebox
# 1. stop vanilla record music (done using a marker in the next tick)
# 2. extract custom music name from found jukebox
# 3. play that music

summon marker ~ ~ ~ {Tags:[custom_music_discs.jukebox]}

data modify storage custom_music_discs:data jukebox.record.custom_music set from block ^ ^ ^ RecordItem.tag.custom_music

execute if data storage custom_music_discs:data jukebox.record.custom_music.sound run function custom_music_discs:replace_music_inner with storage custom_music_discs:data jukebox.record.custom_music

title @a[distance=..64] actionbar ""

# execute if data storage custom_music_discs:data jukebox.record.custom_music.display_name run tellraw @a[distance=..64] [{"text":"Now Playing: ", "color":"dark_green"}, {"type":"nbt", "source":"storage", "storage":"custom_music_discs:data", "nbt":"jukebox.record.custom_music.display_name"}]
