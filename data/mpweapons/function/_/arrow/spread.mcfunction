#> mpweapons:_/arrow/spread
#--------------------
# _/arrow/bow
#--------------------

data modify storage mpweapons:var arrow.data set from entity @s

# final magnitude/force [*arrow.force x 10000]
data modify storage six:in magnitude.vector set from storage mpweapons:var arrow.data.Motion
function six:api/vector/space/magnitude
execute store result score *arrow.force -mpweapons run data get storage six:out magnitude.result 10000
execute store result storage six:in random.min int 1 run data get storage mpweapons:var arrow.spread_setting.magnitude.min 10000
execute store result storage six:in random.max int 1 run data get storage mpweapons:var arrow.spread_setting.magnitude.max 10000
execute store result score *arrow.force_add -mpweapons run function six:api/inline/random
scoreboard players operation *arrow.force -mpweapons += *arrow.force_add -mpweapons

#get arrow direction
data modify storage six:in to_rotation.vector set from storage mpweapons:var arrow.data.Motion
function six:api/vector/space/to_rotation
data modify storage mpweapons:var arrow.orig.direction set from storage six:out to_rotation.result

#generate random point on radius spread circle
execute store result storage six:in random.min int 1 run data get storage mpweapons:var arrow.spread_setting.radius.min 100
execute store result storage six:in random.max int 1 run data get storage mpweapons:var arrow.spread_setting.radius.max 100
execute store result storage six:in to_space.magnitude double 0.01 run function six:api/inline/random
data merge storage six:in {to_space:{vector:[0f, 0f]}}
execute store result storage six:in to_space.vector[0] float 0.1 run random value -1799..1800
function six:api/vector/rotation/to_space

#point 50 blocks away
data modify storage mpweapons:var arrow.spread.x set from storage six:out to_space.result[0]
data modify storage mpweapons:var arrow.spread.y set from storage six:out to_space.result[2]

execute summon marker run function mpweapons:_/arrow/spread.1 with storage mpweapons:var arrow.spread
data modify entity @s Motion set from storage mpweapons:var arrow.final_motion

data remove storage mpweapons:var arrow
scoreboard players reset *arrow.force -mpweapons
scoreboard players reset *arrow.force_add -mpweapons