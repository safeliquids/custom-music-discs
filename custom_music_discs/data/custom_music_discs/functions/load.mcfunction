scoreboard objectives add custom_music_discs dummy
scoreboard players set $max_range custom_music_discs 550
scoreboard players set $r custom_music_discs 0
scoreboard players set $found_jukebox custom_music_discs 0

# set up map of record item ids and sound events
data modify storage custom_music_discs:data RECORD_MAP set value [ \
    {id:"minecraft:music_disc_11", sound:"minecraft:music_disc.11"}, \
    {id:"minecraft:music_disc_13", sound:"minecraft:music_disc.13"}, \
    {id:"minecraft:music_disc_5", sound:"minecraft:music_disc.5"}, \
    {id:"minecraft:music_disc_blocks", sound:"minecraft:music_disc.blocks"}, \
    {id:"minecraft:music_disc_cat", sound:"minecraft:music_disc.cat"}, \
    {id:"minecraft:music_disc_chirp", sound:"minecraft:music_disc.chirp"}, \
    {id:"minecraft:music_disc_far", sound:"minecraft:music_disc.far"}, \
    {id:"minecraft:music_disc_mall", sound:"minecraft:music_disc.mall"}, \
    {id:"minecraft:music_disc_mellohi", sound:"minecraft:music_disc.mellohi"}, \
    {id:"minecraft:music_disc_otherside", sound:"minecraft:music_disc.otherside"}, \
    {id:"minecraft:music_disc_pigstep", sound:"minecraft:music_disc.pigstep"}, \
    {id:"minecraft:music_disc_relic", sound:"minecraft:music_disc.relic"}, \
    {id:"minecraft:music_disc_stal", sound:"minecraft:music_disc.stal"}, \
    {id:"minecraft:music_disc_strad", sound:"minecraft:music_disc.strad"}, \
    {id:"minecraft:music_disc_wait", sound:"minecraft:music_disc.wait"}, \
    {id:"minecraft:music_disc_ward", sound:"minecraft:music_disc.ward"}]
