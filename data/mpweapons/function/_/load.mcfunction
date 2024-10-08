#>mpweapons:_/load
#--------------------
# @LOAD
#--------------------

# load
scoreboard players set *mpweapons load-status 1

# settings
execute unless data storage mpweapons:settings {PERSIST:true} run function mpweapons:settings

#declare storage mpweapons:var
#declare storage mpweapons:in
#declare storage mpweapons:out
#declare storage mpweapons:data
#declare storage mpweapons:hook
#declare storage mpweapons:implement

# scoreboards
scoreboard objectives add -mpweapons dummy
scoreboard objectives add --mpweapons dummy
scoreboard objectives add _mpweapons-use_bow minecraft.used:minecraft.bow
scoreboard objectives add _mpweapons-use_crossbow minecraft.used:minecraft.crossbow
#scoreboard objectives add mpweapons-scoreboard dummy

# cache
function mpweapons:_/cache/generate

# tick
schedule clear mpweapons:_/tick
function mpweapons:_/tick