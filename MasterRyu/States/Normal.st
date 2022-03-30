; ______________________________
;| Ryu by Phantom.of.the.Server |
; 
;============================================================================================
;=====================================< NORMAL STATES >========================================
;============================================================================================

;=========< Stand Light Punch >==========
[Statedef 200]
type = S
movetype = A
physics = S
anim = ifelse(p2bodydist x <= (const(size.xscale) * 25), 201, 200)
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 200, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200 && var(1) != 2
value = 3, ifelse(random < 500, 3, 6)
channel = 0
[State 200, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200 && var(1) = 2
value = 13, ifelse(random < 500, 1, 3)
channel = 0
[State 200, Snd]
type = playsnd
trigger1 = var(1) = 2 && random < 200 && animelem = 2
value = 13, ifelse(random < 500, 1, 3)
channel = 0

[State 200, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
channel = 1

[State 200, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = anim = 200 && animelem = 2
attr = S, NA
damage = 30, 0
ID = 200 + 4*(P2Movetype=H)
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -85
hitsound = s2, 1
guardsound = s2, 0
ground.type = High
ground.slidetime = 12 + 2 * var(29)
ground.hittime = 12 + 2 * var(29)
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = 140 * !var(20), 70 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 200, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = anim = 201 && animelem = 2
attr = S, NA
damage = 35, 0
ID = 201 + 3*(P2Movetype=H)
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -93
hitsound = s2, 1
guardsound = s2, 0
ground.type = High
ground.slidetime = 12 + 2 * var(29)
ground.hittime = 12 + 2 * var(29)
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = 140 * !var(20), 70 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 200, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========< Stand Medium Punch >==========
[Statedef 205]
type = S
movetype = A
physics = S
juggle = ifelse(numtarget, 15, 8)
anim = ifelse(p2bodydist x <= (const(size.xscale) * 25), 206 + (var(1) = 2) * 2, 205)
velset = 0, 0
poweradd = 18 * !var(20)
sprpriority = 1
ctrl = 0
facep2 = 1

[State 205, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 205, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0
[State 205, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
channel = 1

[State 205, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3 && anim = 205
attr = S, NA
damage = 65, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -78
hitsound = s2, 2
guardsound = s2, 0
ground.type = High
ground.slidetime = 17 + 3 * var(29)
ground.hittime = 17 + 3 * var(29)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 72 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 205, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3 && anim = 206
attr = S, NA
damage = 60, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -77
hitsound = s2, 2
guardsound = s2, 0
ground.type = High
ground.slidetime = 17 + 3 * var(29)
ground.hittime = 17 + 3 * var(29)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 72 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 205, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3 && anim = 208
attr = S, NA
damage = 60, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -61
hitsound = s2, 2
guardsound = s2, 0
ground.type = Low
ground.slidetime = 17 + 3 * var(29)
ground.hittime = 17 + 3 * var(29)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 72 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 205, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========< Sakotsu Wari >==========
[Statedef 207]
type = S
movetype = A
physics = S
juggle = ifelse(numtarget, 15, 8)
anim = 207
velset = 0, 0
poweradd = 18 * !var(20)
sprpriority = 1
ctrl = 0
facep2 = 1

[State 207, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3 + (var(1) = 2) * 10, 3 -(var(1) = 2) * 2
channel = 0
[State 207, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 3
channel = 1

[State 207, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 4
attr = S, NA
damage = 38, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = H
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -78
hitsound = s2, 2
guardsound = s2, 0
ground.type = High
ground.slidetime = 17 + 3 * var(29)
ground.hittime = 17 + 3 * var(29)
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 72 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
ID = 207

[State 207, hit2]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 5
attr = S, NA
damage = 38, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = H
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -39
hitsound = s2, 2
guardsound = s2, 0
ground.type = Low
ground.slidetime = 15 + 3 * var(29)
ground.hittime = 15 + 3 * var(29)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 72 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
ID = 207

[State AI Dont Combo set]
type = varset
trigger1 = var(16) = 0
trigger1 = AILevel
trigger1 = AnimElemtime(5) < 0
var(16) = 99

[State AI Dont Combo Clear]
type = varset
trigger1 = var(16) = 99
trigger1 = AILevel
trigger1 = AnimElemtime(5) >= 0
var(16) = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I

[State 207, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========< Stand Hard Punch >==========
[Statedef 210]
type = S
movetype = A
physics = S
anim = ifelse((prevstateno = 710), 210 + (var(1) != 1) * 3, ifelse(p2bodydist x <= (const(size.xscale) * 25), 211, 210 + (var(1) != 1) * 3))
velset = 0, 0
poweradd = 18 * !var(20)
sprpriority = 1
ctrl = 0
facep2 = 1

[State 210, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 210, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0
[State 210, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
channel = 1

[State 210, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 4 && anim = 210
attr = S, NA
damage = 96, 0
ID = 210
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 14), ifelse(var(20), 6, 16)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -15, -69
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 20 + 4 * var(29)
ground.hittime = 20 + 4 * var(29)
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 70 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 210, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3 && anim = 211
attr = S, NA
damage = 90, 0
ID = 211
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 14), ifelse(var(20), 6, 16)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -15, -77
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 20 + 4 * var(29)
ground.hittime = 20 + 4 * var(29)
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 70 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
forcestand = 1
mindist = 1, -60

[State 210, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 5 && anim = 211
trigger1 = !movecontact && !movereversed
attr = S, NA
damage = 90, 0
ID = 211
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 14), ifelse(var(20), 6, 16)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -111
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 20 + 4 * var(29)
ground.hittime = 20 + 4 * var(29)
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 70 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
mindist = 1, -60

[State 210, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 4 && anim = 213
attr = S, NA
damage = 98, 0
ID = 213
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 14), ifelse(var(20), 6, 16)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -66
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 20 + 4 * var(29)
ground.hittime = 20 + 4 * var(29)
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 70 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 210, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = prevstateno = 710
trigger1 = animelem = 4 && anim = 210
attr = S, NA
damage = 98, 0
ID = 210
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 14), ifelse(var(20), 6, 16)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, ifelse((anim = 210), -69, -66)
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 18 + 4 * var(29)
ground.hittime = 18 + 4 * var(29)
ground.velocity = -6, -3
air.type = Low
air.hittime = 18
air.velocity = -6, -3
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.77, -10.52)
guard.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
fall = 1
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 70 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120

[State 210, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = prevstateno = 710
trigger1 = animelem = 4 && anim = 213
attr = S, NA
damage = 98, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 14), ifelse(var(20), 6, 16)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, ifelse((anim = 210), -69, -66)
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 20 + 4 * var(29)
ground.hittime = 20 + 4 * var(29)
ground.velocity = -6, -3
air.type = Low
air.hittime = 18
air.velocity = -6, -3
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.77, -10.52)
guard.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
fall = 1
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 70 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120

[State Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State 210, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========< Stand Hard Punch 2 >==========
[Statedef 212]
type = S
movetype = A
physics = S
juggle = ifelse(numtarget, 15, 8)
anim = 212
velset = 0, 0
poweradd = 18 * !var(20)
sprpriority = 1
ctrl = 0
facep2 = 1

[State 212, Snd]
type = playsnd
trigger1 = animelem = 5
value = 3, 4
channel = 0

[State 212, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 3
channel = 1

[State 212, Vel]
type = velset
trigger1 = animelemtime(4) >= 0 && animelemtime(6) <= 0
x = 6

[State 212, pos fix]
type = posadd
trigger1 = anim = 212
trigger1 = animelem = 6, =0
x = IfElse(P2Bodydist x < 32 && P2Dist y > -26,P2Bodydist x,32)
ignorehitpause = 1

[State 212, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = (animelem = 6 || animelem = 7) && anim = 212
attr = S, NA
damage = 50, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 14), ifelse(var(20), 6, 16)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -61
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 20 + 4 * var(29)
ground.hittime = 20 + 4 * var(29)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 70 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
ID = 212

[State AI Dont Combo set]
type = varset
trigger1 = var(16) = 0
trigger1 = AILevel
trigger1 = AnimElemtime(7) < 0
var(16) = 99

[State AI Dont Combo Clear]
type = varset
trigger1 = var(16) = 99
trigger1 = AILevel
trigger1 = AnimElemtime(7) >= 0
var(16) = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(8) >= 0
movetype = I

[State 212, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========< Kikoku Tsuki >==========
[Statedef 213]
type = S
movetype = A
physics = S
juggle = ifelse(numtarget, 15, 8)
anim = 213
velset = 0, 0
poweradd = 18 * !var(20)
sprpriority = 1
ctrl = 0
facep2 = 1

[State 213, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 213, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0
[State 213, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
channel = 1

[State 213, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 4
attr = S, NA
damage = 98, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -69
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 18 + 4 * var(29)
ground.hittime = 18 + 4 * var(29)
ground.velocity = -4, -4
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
fall = 1
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.77, -10.52)
guard.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 70 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120

[State Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State 213, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========< Seichuu Nidan Tsuki >==========
[Statedef 214]
type = S
movetype = A
physics = S
juggle = ifelse(numtarget, 15, 8)
anim = 214
velset = 0, 0
poweradd = 18 * !var(20)
sprpriority = 1
ctrl = 0
facep2 = 1

[State 214, Snd]
type = playsnd
trigger1 = animelem = 2 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0

[State 214, Snd]
type = playsnd
trigger1 = animelem = 2 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0

[State 214, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 3
channel = 1

[State 214, Vel]
type = velset
trigger1 = animelem = 2
x = 9

[State 214, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5, 12

[State 214, Dust]
type = explod
trigger1 = animelemtime(2) >= 0 && vel x > 0.5 && !(time % 3)
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = 45, 0
vel = -2, 0
removetime = -2
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 214, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 2
attr = S, NA
damage = 30, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -49
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 20 + 4 * var(29)
ground.hittime = 20 + 4 * var(29)
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 70 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 214, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3
attr = S, NA
damage = 75, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -62
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 20 + 4 * var(29)
ground.hittime = 20 + 4 * var(29)
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 70 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
ID = 214

[State AI Dont Combo set]
type = varset
trigger1 = var(16) = 0
trigger1 = AILevel
trigger1 = AnimElemtime(3) < 0
var(16) = 99

[State AI Dont Combo Clear]
type = varset
trigger1 = var(16) = 99
trigger1 = AILevel
trigger1 = AnimElemtime(3) >= 0
var(16) = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 214, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========< Stand Light Kick >==========
[Statedef 215]
type = S
movetype = A
physics = S
juggle = ifelse(numtarget, 15, 8)
anim = 215
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 215, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 200 && var(1) != 2
value = 3, ifelse(random < 500, 3, 6)
channel = 0
[State 215, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 200 && var(1) = 2
value = 13, ifelse(random < 500, 1, 3)
channel = 0

[State 215, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 4
channel = 1

[State 215, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3
attr = S, NA
damage = 30, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -35
hitsound = s2, 4
guardsound = s2, 0
ground.type = Low
ground.slidetime = 12 + 2 * var(29)
ground.hittime = 12 + 2 * var(29)
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = 140 * !var(20), 70 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 215, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========< Stand Medium Kick >==========
[Statedef 220]
type = S
movetype = A
physics = S
juggle = ifelse(numtarget, 15, 8)
velset = 0, 0
poweradd = 18 * !var(20)
sprpriority = 1
ctrl = 0
facep2 = 1

[State 220, Kick Type]
type = varset
trigger1 = !time
var(10) = 0 + ((AILevel && P2StateType != A) || (!AILevel && Command="holdback"))

[State 220, Anim Normal]
type = ChangeAnim
triggerall = !time
trigger1 = !(prevstateno = 710 || (p2bodydist x <= (const(size.xscale) * 22)))
value = IFElse(var(10),223,220)

[State 220, Anim close]
type = ChangeAnim
triggerall = !time
trigger1 = prevstateno = 710 || (p2bodydist x <= (const(size.xscale) * 22))
value = 221


[State 220, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0

[State 220, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0

[State 220, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 4
channel = 1

[State 220, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = (anim = 220 || anim = 223) && !(MoveContact || MoveReversed)
trigger1 = animelemtime(3)>0 && animelemtime(5)<0
attr = S, NA
damage = 70, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -93 + 30*(anim=223)
hitsound = s2, 5
guardsound = s2, 0
ground.type = High
ground.slidetime = 17 + 3 * var(29)
ground.hittime = 17 + 3 * var(29)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 72 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 220, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = (animelem = 3 && anim = 221) && !(MoveContact || MoveReversed)
attr = S, NA
damage = 60, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -15, -78
hitsound = s2, 5
guardsound = s2, 0
ground.type = Low
ground.slidetime = 17 + 3 * var(29)
ground.hittime = 17 + 3 * var(29)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 72 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
forcestand = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 220, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========< SENPUU KYAKU >==========
[Statedef 222]
type = A
movetype = A
physics = N
juggle = ifelse(numtarget, 15, 8)
anim = 222
velset = vel x, 0
poweradd = 18 * !var(20)
sprpriority = 1
ctrl = 0
facep2 = 1

[State 222, Snd]
type = playsnd
trigger1 = animelem = 5
value = 3 + (var(1) = 2) * 10, 2
channel = 0
[State 222, Snd]
type = playsnd
trigger1 = animelem = 1
value = 0, 40
[State 222, Dust]
type = helper
trigger1 = animelem = 1
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 222, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 6
channel = 1

[State 222, Dust]
type = explod
trigger1 = animelem = 1
anim = 6022
ID = 6022
sprpriority = 3
postype = p1
pos = 0, 0
vel = 0.33, -.5
removetime = -2
ownpal = 1
scale = 0.66, 0.66

[State 222, Vel]
type = velset
trigger1 = animelem = 2
x = ifelse(prevstateno = 100, 5, 3)
y = -4.5
[State 222, Accel]
type = gravity
trigger1 = animelemtime(2) > 0

[State 222, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 7
attr = A, NA
damage = 75, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 14), ifelse(var(20), 6, 14)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -78
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 24 + 3 * var(29)
ground.hittime = 24 + 3 * var(29)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 24
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 72 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State Idle]
type = statetypeset
trigger1 = animelemtime(8) >= 0
movetype = I

[State 222, End]
type = changestate
trigger1 = pos y > 10 && vel y > 0
value = 52
ctrl = 1


;=========< Stand Hard Kick >==========
[Statedef 225]
type = S
movetype = A
physics = S
juggle = ifelse(numtarget, 15, 8)
anim = ifelse(p2bodydist x <= (const(size.xscale) * 25), 226, 225)
velset = 0, 0
poweradd = 18 * !var(20)
sprpriority = 1
ctrl = 0
facep2 = 1

[State 225, Snd]
type = playsnd
trigger1 = animelem = 4 && random < 500 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 225, Snd]
type = playsnd
trigger1 = animelem = 4 && random < 500 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0
[State 225, Snd]
type = playsnd
trigger1 = anim = 225 && animelem = 4
trigger2 = anim = 226 && (animelem = 2 || animelem = 5)
value = 1, 6
channel = 1

[State 225, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 5 && anim = 225
attr = S, NA
damage = 100, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 14), ifelse(var(20), 6, 16)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -92
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 20 + 4 * var(29)
ground.hittime = 20 + 4 * var(29)
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 70 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 225, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3 && anim = 226
attr = S, NA
damage = 50, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -103
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 20 + 4 * var(29)
ground.hittime = 20 + 4 * var(29)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 18
air.velocity = -3, -3
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 70 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 225, Hit]
type = hitdef
trigger1 = p2stateno != 5040
trigger1 = animelem = 5 && anim = 226
attr = S, NA
damage = 50, 0
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 6, 14), ifelse(var(20), 6, 16)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -72
hitsound = s2, 6
guardsound = s2, 0
ground.type = Low
ground.slidetime = 20 + 4 * var(29)
ground.hittime = 20 + 4 * var(29)
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -4, -8), 8
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 70 * !var(20)
givepower = 36, 36
yaccel = 0.5
air.fall = 1
fall.recover = 1
fall.recovertime = 120

[State Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I

[State 225, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========< Crouch Light Punch >==========
[Statedef 230]
type = C
movetype = A
physics = C
juggle = ifelse(numtarget, 15, 8)
anim = 230
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 230, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200 && var(1) != 2
value = 3, ifelse(random < 500, 3, 6)
channel = 0
[State 230, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200 && var(1) = 2
value = 13, ifelse(random < 500, 1, 3)
channel = 0

[State 230, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
channel = 1

[State 230, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 2
attr = C, NA 
damage = 30, 0
ID = 230 + 4*(P2Movetype=H)
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = M 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -51
hitsound = s2, 1
guardsound = s2, 0
ground.type = Low
ground.slidetime = 14 + 2 * var(29)
ground.hittime = 14 + 2 * var(29)
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = 140 * !var(20), 70 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 230, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=========< Crouch Medium Punch >==========
[Statedef 235]
type = C
movetype = A
physics = C
juggle = ifelse(numtarget, 15, 8)
anim = 235
velset = 0, 0
poweradd = 18 * !var(20)
sprpriority = 1
ctrl = 0
facep2 = 1

[State 235, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 235, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0
[State 235, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
channel = 1

[State 235, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3
attr = C, NA 
damage = 60, 0
ID = 235
animtype = Medium 
air.animtype = Back
fall.animtype = Back
guardflag = M 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -46
hitsound = s2, 2
guardsound = s2, 0
ground.type = Low
ground.slidetime = 17 + 3 * var(29)
ground.hittime = 17 + 3 * var(29)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 72 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
ID = 235

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 235, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=========< Crouch Hard Punch >==========
[Statedef 240]
type = C
movetype = A
physics = C
juggle = ifelse(numtarget, 15, 8)
anim = 240
velset = 0, 0
poweradd = 18 * !var(20)
sprpriority = 1
ctrl = 0
facep2 = 1

[State 240, Snd]
type = playsnd
trigger1 = animelem = 4 && random < 500 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 240, Snd]
type = playsnd
trigger1 = animelem = 4 && random < 500 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0
[State 240, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 3
channel = 1

[State 240, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 4
attr = C, NA
damage = 90, 0
ID = 240
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF 
priority = 5, Hit 
pausetime = ifelse(var(20), 6, 14), ifelse(var(20), 6, 16)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -73
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 20 + 4 * var(29)
ground.hittime = 20 + 4 * var(29)
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 70 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
forcestand = 1

[State 240, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 5
trigger1 = !movecontact && !movereversed
attr = S, NA
damage = 90, 0
ID = 240
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF 
priority = 5, Hit 
pausetime = ifelse(var(20), 6, 14), ifelse(var(20), 6, 16)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -120
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 20 + 4 * var(29)
ground.hittime = 20 + 4 * var(29)
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 70 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I

[State 240, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=========< Crouch Light Kick >==========
[Statedef 245]
type = C
movetype = A
physics = C
juggle = ifelse(numtarget, 15, 8)
anim = 245
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 245, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200 && var(1) != 2
value = 3, ifelse(random < 500, 3, 6)
channel = 0
[State 245, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200 && var(1) = 2
value = 13, ifelse(random < 500, 1, 3)
channel = 0

[State 245, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
channel = 1

[State 245, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 2
attr = C, NA 
damage = 30, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = L
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -4
hitsound = s2, 4
guardsound = s2, 0
ground.type = Low
ground.slidetime = 14 + 2 * var(29)
ground.hittime = 14 + 2 * var(29)
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
down.velocity = -2, -2
getpower = 140 * !var(20), 70 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
ID = 245 + 4*(P2MoveType=H)

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 245, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=========< Crouch Medium Kick >==========
[Statedef 250]
type = C
movetype = A
physics = C
juggle = ifelse(numtarget, 15, 8)
anim = 250
velset = 0, 0 
poweradd = 18 * !var(20)
sprpriority = 1
ctrl = 0
facep2 = 1

[State 250, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 250, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0
[State 250, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
channel = 1

[State 250, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3
attr = C, NA 
damage = 60, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = L 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -5
hitsound = s2, 5
guardsound = s2, 0
ground.type = Low
ground.slidetime = 17 + 3 * var(29)
ground.hittime = 17 + 3 * var(29)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
down.velocity = -3, -3
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 72 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
ID = 250

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 250, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=========< Crouch Hard Kick >==========
[Statedef 255]
type = C
movetype = A
physics = C
juggle = 1;ifelse(var(1) >= 2, 1, ifelse((p2movetype = H && p2statetype = A), 7, 9))
anim = 255
velset = 0, 0
poweradd = 18 * (!var(20) && prevstateno != 750)
sprpriority = 1
ctrl = 0
facep2 = 1

[State 255, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0

[State 255, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0

[State 255, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 6
channel = 1

[State NHB -ZC]
type = nothitby
trigger1 = prevstateno = 750 && animelemtime(4) < 0
value = SCA
time = 1

[State 255, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5040]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = Prevstateno != 750
trigger1 = anim = 255
trigger1 = animelemtime(3) >= 0 && animelemtime(5) < 0
trigger1 = !MoveContact && !MoveReversed
attr = C, NA
damage = 90, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = L 
hitflag = MAFL
priority = 4, Hit 
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -6
hitsound = s2, 6
guardsound = s2, 0
ground.type = Trip
ground.slidetime = 20 + 4 * var(29)
ground.hittime = 20 + 4 * var(29)
ground.velocity = -1, -8.24
air.type = Low
air.hittime = 18
air.velocity = -1, -8.24
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.77, -10.52)
guard.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 70 * !var(20)
givepower = 36, 36
yaccel = 0.67
fall = 1
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
ID = 255

[State 255, Hit]
type = hitdef
trigger1 = prevstateno = 750
trigger1 = anim = 255
trigger1 = animelemtime(3) >= 0 && animelemtime(5) < 0
trigger1 = !MoveContact && !MoveReversed
attr = C, SA
damage = 90, 0
animtype = DiagUp
guardflag = L 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -6
hitsound = s2, 6
guardsound = s2, 0
ground.type = Low
ground.slidetime = 20 + 4 * var(29)
ground.hittime = 20 + 4 * var(29)
ground.velocity = -5, -6.2
air.type = Low
air.hittime = 18
air.velocity = -5, -6.2
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.77, -10.52)
guard.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
getpower = 0, 0
givepower = 36, 36
yaccel = 0.6
fall = 1
fall.recover = 1
fall.recovertime = 120
ID = 255

[State 255, Alpha FX]
type = Helper
triggerall = Anim = 255 && Prevstateno = 750
trigger1 = AnimElemTime(4) > 0
trigger1 = !NumHelper(751)
trigger1 = MoveHit && NumTarget(255)
trigger1 = Target,StateNo = [5000,5099]
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 751
ID = 751
name = "Alpha FX"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State 255, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=========< Air Light Punch >==========
[Statedef 260]
type = A
movetype = A
physics = A
juggle = ifelse(numtarget, 15, 8)
anim = 260
poweradd = 0
sprpriority = 1
ctrl = 0

[State 260, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200 && var(1) != 2
value = 3, ifelse(random < 500, 3, 6)
channel = 0
[State 260, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200 && var(1) = 2
value = 13, ifelse(random < 500, 1, 3)
channel = 0

[State 260, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
channel = 1

[State 260, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 2
attr = A, NA 
damage = 38, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = HA 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -50
hitsound = s2, 1
guardsound = s2, 0
ground.type = High
ground.hittime = 14
ground.slidetime = 14
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.velocity = ifelse(var(20), -2.66, -4.49)
guard.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = 140 * !var(20), 70 * !var(20)
givepower = 36, 36
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 260, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I


;=========< Air Medium Punch >==========
[Statedef 265]
type = A
movetype = A
physics = A
juggle = ifelse(numtarget, 15, ifelse((vel x && var(1) != 2), 1, 8))
anim = ifelse((vel x && var(1) != 2), 265, 266)
poweradd = 18 * !var(20)
sprpriority = 1
ctrl = 0

[State 265, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 265, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0
[State 265, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
channel = 1

[State 265, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = anim = 265 && animelem = 2
attr = A, NA 
damage = 53, 0
animtype = Medium 
air.animtype = Back
fall.animtype = Back
guardflag = HA 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -88
hitsound = s2, 2
guardsound = s2, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.velocity = ifelse(var(20), -4.30, -7.51)
guard.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -1.33, -2.67), -9
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 72 * !var(20)
givepower = 36, 36
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
ID= 265

[State 265, Hit]
type = hitdef
trigger1 = p2stateno != 5040
trigger1 = anim = 265 && animelem = 3
attr = A, NA 
damage = 23, 0
animtype = Medium 
air.animtype = Back
fall.animtype = Back
guardflag = HA 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -133
hitsound = s2, 2
guardsound = s2, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.velocity = ifelse(var(20), -4.30, -7.51)
guard.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = High
air.hittime = 18
air.velocity = ifelse(var(20), -1.33, -2.67), -9
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 72 * !var(20)
givepower = 36, 36
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
ID= 265

[State 265, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = anim = 266 && animelem = 3
attr = A, NA 
damage = 60, 0
animtype = Medium 
air.animtype = Back
fall.animtype = Back
guardflag = HA 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -52
hitsound = s2, 2
guardsound = s2, 0
ground.type = High
ground.hittime = 15
ground.slidetime = 15
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.velocity = ifelse(var(20), -4.30, -7.51)
guard.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 72 * !var(20)
givepower = 36, 36
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
ID= 266

[State AI Dont Combo set]
type = varset
trigger1 = var(16) = 0
trigger1 = AILevel
trigger1 = Anim = 265 && AnimElemtime(3) < 0
var(16) = 99

[State AI Dont Combo Clear]
type = varset
trigger1 = var(16) = 99
trigger1 = AILevel
trigger1 = Anim = 265 && AnimElemtime(3) >= 1
var(16) = 0

[State 265, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I


;=========< Air Hard Punch >==========
[Statedef 270]
type = A
movetype = A
physics = A
juggle = ifelse(numtarget, 15, 8)
anim = 270
poweradd = 18 * !var(20)
sprpriority = 1
ctrl = 0

[State 270, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 270, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0
[State 270, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
channel = 1

[State 270, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 3
attr = A, NA
damage = 90, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = HA 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 6, 14), ifelse(var(20), 6, 16)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -52
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.velocity = ifelse(var(20), -5.77, -10.52)
guard.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 70 * !var(20)
givepower = 36, 36
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
fall.recover = 1
forcenofall = !var(20)

[State 270, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I


;=========< Air Light Kick >==========
[Statedef 275]
type = A
movetype = A
physics = A
juggle = ifelse(numtarget, 15, 8)
anim = ifelse((vel x || var(9) = 2), 275, 276)
poweradd = 0
sprpriority = 1
ctrl = 0

[State 275, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200 && var(1) != 2
value = 3, ifelse(random < 500, 3, 6)
channel = 0
[State 275, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200 && var(1) = 2
value = 13, ifelse(random < 500, 1, 3)
channel = 0

[State 275, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
channel = 1

[State 275, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 2 && anim = 275
attr = A, NA 
damage = 37, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = HA 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -42
hitsound = s2, 4
guardsound = s2, 0
ground.type = High
ground.hittime = 14
ground.slidetime = 14
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.velocity = ifelse(var(20), -2.66, -4.49)
guard.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = 140 * !var(20), 70 * !var(20)
givepower = 36, 36
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 275, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = animelem = 2 && anim = 276
attr = A, NA 
damage = 37, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = HA 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -108
hitsound = s2, 4
guardsound = s2, 0
ground.type = High
ground.hittime = 14
ground.slidetime = 14
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.velocity = ifelse(var(20), -2.66, -4.49)
guard.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.type = High
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = 140 * !var(20), 70 * !var(20)
givepower = 36, 36
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 275, Type]
type = statetypeset
trigger1 = animelemtime(8) >= 0
movetype = I


;=========< Air Medium Kick >==========
[Statedef 280]
type = A
movetype = A
physics = A
juggle = ifelse(numtarget, 15, 8)
anim = ifelse((vel x || var(9) = 2), 280, 281)
poweradd = 18 * !var(20)
sprpriority = 1
ctrl = 0

[State 280, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 280, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0
[State 280, Snd]
type = playsnd
trigger1 = anim = 280 && animelem = 3
trigger2 = anim = 281 && animelem = 2
value = 1, 5
channel = 1

[State 280, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = anim = 280 && animelem = 3
attr = A, NA 
damage = 60, 0
animtype = Medium 
air.animtype = Back
fall.animtype = Back
guardflag = HA 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -48
hitsound = s2, 5
guardsound = s2, 0
ground.type = High
ground.hittime = 17
ground.slidetime = 17
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.velocity = ifelse(var(20), -4.30, -7.51)
guard.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 72 * !var(20)
givepower = 36, 36
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 280, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = anim = 281 && animelem = 2
attr = A, NA 
damage = 60, 0
animtype = Medium 
air.animtype = Back
fall.animtype = Back
guardflag = HA 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -108
hitsound = s2, 5
guardsound = s2, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.velocity = ifelse(var(20), -4.30, -7.51)
guard.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = High
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 72 * !var(20)
givepower = 36, 36
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 280, Type]
type = statetypeset
trigger1 = anim = 280 && animelemtime(4) >= 0
trigger2 = anim = 281 && animelemtime(3) >= 0
movetype = I


;======================< TENMA KUUJIN KYAKU >=============================
[Statedef 282]
type = A
physics = N
movetype = A
anim = 282
velset = 0.3 * vel x, 0.3 * vel y
ctrl = 0
poweradd = 18 * !var(20)
sprpriority = -1
juggle = 0

[State 282, Snd]
type = playsnd
trigger1 = animelem = 1
value = 3 + (var(1) = 2) * 10, 2 + (var(1) = 2) * 2
channel = 0

[State 282, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 6
channel = 1

[State 282, Vel]
type = velset
trigger1 = animelemtime(4) >= 0
x = 10
y = 10

[State 282, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = !movecontact && !movereversed
attr = A, NA
damage = 90, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = HA 
hitflag = MAFD
priority = 4, Hit 
pausetime = ifelse(var(20), 6, 14), ifelse(var(20), 6, 16)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -15
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.velocity = ifelse(var(20), -4.30, -7.51)
guard.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
down.hittime = 20
down.velocity = 0, 0
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 72 * !var(20)
givepower = 36, 36
yaccel = 0.5
fall = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 282, End]
type = changestate
trigger1 = pos y >= 0
value = 52


;=========< Air Hard Kick >==========
[Statedef 285]
type = A
movetype = A
physics = A
juggle = ifelse(numtarget, 15, 8)
anim = ifelse((vel x || var(9) = 2), 285, 286)
poweradd = 18 * !var(20)
sprpriority = 1
ctrl = 0

[State 285, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 285, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0
[State 285, Snd]
type = playsnd
trigger1 = anim = 285 && animelem = 3
trigger2 = anim = 286 && animelem = 4
value = 1, 6
channel = 1

[State 285, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = anim = 285 && animelem = 3
attr = A, NA
damage = 90, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = HA 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 6, 14), ifelse(var(20), 6, 16)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -48
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.velocity = ifelse(var(20), -5.77, -10.52)
guard.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 70 * !var(20)
givepower = 36, 36
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 285, Hit]
type = hitdef
trigger1 = ((p2stateno != [5020, 5050]) || var(20) || roundstate = 3) && p2stateno != 5040
trigger1 = anim = 286 && animelem = 5
attr = A, NA
damage = 90, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = HA 
hitflag = MAF 
priority = 4, Hit 
pausetime = ifelse(var(20), 6, 14), ifelse(var(20), 6, 16)
sparkno = s7010 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -77
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.velocity = ifelse(var(20), -5.77, -10.52)
guard.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 70 * !var(20)
givepower = 36, 36
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 285, Type]
type = statetypeset
trigger1 = anim = 285 && animelemtime(4) >= 0
trigger2 = anim = 286 && animelemtime(6) >= 0
movetype = I


;=========================================================================
;===============================< THROWS >==================================
;=========================================================================
;========< THROW CONTROLLER >==========
[Statedef 800]
type = S
movetype = A
physics = S
juggle = 15
velset = 0, 0
ctrl = 0
anim = 800
sprpriority = 1
facep2 = 1
poweradd = 18 * !var(20)

[State 800, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "z", 1, ifelse(command = "y", 2, 3))

[State 800, Strength]
type = varset
trigger1 = !time && AIlevel
var(10) = ceil(random / 333)

[State 800, Tech Hit]
type = varset
trigger1 = 1
var(19) = 0

[State 800, Tech Hit]
type = varset
trigger1 = numenemy
trigger1 = enemynear, statetype != A
trigger1 = (enemynear, stateno = [0, 999]) && (enemynear, stateno != [100, 119]) && (enemynear, stateno != [200, 799])
var(19) = 7

[State 800, Do not guard]
type = attackdist
trigger1 = 1
value = 0

[State 800, Hit]
type = hitdef
triggerall = P2MoveType != H && !(P2StateNo = [150,159])
trigger1 = anim = 800 && animelem = 2 && (var(10) = [1, 2])
attr = S, NT 
hitflag = M-
priority = 5, Miss
sparkno = -1
hitsound = s0, 800
p1facing = ifelse((!AIlevel && command = "holdfwd") || (AIlevel && frontedgedist < backedgedist), -1, 1)
p2facing = 1
p1stateno = ifelse((!AIlevel && command = "holdfwd") || (AIlevel && frontedgedist < backedgedist), 803, 801) 
guard.dist = 0
fall = 1
fall.recover = 1
fall.recovertime = 120

[State 800, Hit]
type = hitdef
triggerall = P2MoveType != H && !(P2StateNo = [150,159])
trigger1 = anim = 800 && animelem = 2 && var(10) = 3
attr = S, NT 
hitflag = M-
priority = 5, Miss
sparkno = -1
hitsound = s0, 800
p1facing = ifelse((!AIlevel && command = "holdfwd") || (AIlevel && frontedgedist < backedgedist), -1, 1)
p2facing = 1
p1stateno = ifelse((!AIlevel && command = "holdfwd") || (AIlevel && frontedgedist < backedgedist), 803, 801)
guard.dist = 0
fall = 1
fall.recover = 1
fall.recovertime = 120

[State 800, misssnd]
type = playsnd
trigger1 = animelem = 4
value = 5000 + (var(1) = 2) * 10, 4 -(var(1) = 2) * 3
channel = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 800, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- PLAYER ---
[Statedef 801]
type = S
movetype = A
physics = S
anim = 801
ctrl = 0
sprpriority = 1

[State Tech Hit]
type = changestate
trigger1 = numtarget && var(19)
trigger1 = (target, command = "holdfwd" || target, command = "holdback") && target, command != "holdup" && target, command != "holddown"
trigger1 = (target, command = "b" || target, command = "c" || target, command = "y" || target, command = "z")
value = 890
[State Tech Hit]
type = varadd
trigger1 = var(19) > 0
var(19) = -1

[State Throw]
type = targetstate
trigger1 = !time
value = 802

[State Width]
type = width
trigger1 = 1
edge = 30, 0

[State 801, Bind 1]
type = targetbind
trigger1 = 1
pos = 45, 0

[State 801, End]
type = changestate
trigger1 = !animtime
value = ifelse(var(10) = 3, 810, 805)
ctrl = 0

;--- PLAYER TURNS ---
[Statedef 803]
type = S
movetype = A
physics = S
anim = 803
ctrl = 0
sprpriority = 1

[State Tech Hit]
type = changestate
trigger1 = numtarget && var(19)
trigger1 = (target, command = "holdfwd" || target, command = "holdback") && target, command != "holdup" && target, command != "holddown"
trigger1 = (target, command = "b" || target, command = "c" || target, command = "y" || target, command = "z")
value = 890
[State Tech Hit]
type = varadd
trigger1 = var(19) > 0
var(19) = -1

[State Throw]
type = targetstate
trigger1 = !time
value = 804

[State Width]
type = width
trigger1 = 1
edge = 30, 30

[State 803, Bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = -45, 0
[State 803, Bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = -25, 0
[State 803, Bind 3]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = 0, 0
[State 803, Bind 4]
type = targetbind
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = 22, 0
[State 803, Bind 5]
type = targetbind
trigger1 = animelemtime(5) >= 0
pos = 45, 0

[State 803, spr]
type = sprpriority
trigger1 = 1
value = 1 -2 * (animelemtime(2) >= 0 && animelemtime(5) < 0)

[State 803, End]
type = changestate
trigger1 = !animtime
value = ifelse(var(10) = 3, 810, 805)
ctrl = 0

;--- TARGET ---
[Statedef 802]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0
[State 802, Anim]
type = changeanim2
trigger1 = !time
value = 802
[State Safety]
type = selfstate
trigger1 = time >= 60
value = ifelse(pos y < 0, 5040, 0)
ctrl = 1


[Statedef 804]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0
[State 804, Anim]
type = changeanim2
trigger1 = !time
value = 804
[State Safety]
type = selfstate
trigger1 = time >= 60
value = ifelse(pos y < 0, 5040, 0)
ctrl = 1


;========< SEOI NAGE >==========
;--- PLAYER ---
[Statedef 805]
type = S
movetype = A
physics = S
anim = 805
ctrl = 0

[State 805, Lost Target]
type = ChangeState
triggerall = (time=[1,9])
trigger1 = !NumTarget
trigger2 =  Target,StateNo>=5000
value = 898
ctrl = 0

[State 805, NoPush]
type = PlayerPush
trigger1= 1
value = 0

[State 805, throw]
type = targetstate
trigger1 = !time
value = ifelse(var(10) = 1, 806, 808)

[State 805, throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State Tech Hit]
type = changestate
trigger1 = numtarget && var(19)
trigger1 = (target, command = "holdfwd" || target, command = "holdback") && target, command != "holdup" && target, command != "holddown"
trigger1 = (target, command = "b" || target, command = "c" || target, command = "y" || target, command = "z")
value = 890

[State Tech Hit]
type = varadd
trigger1 = var(19) > 0
var(19) = -1

[State 805, width]
type = width
trigger1 = animelemtime(4) < 0
edge = 0, 40

[State 805, width]
type = width
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
edge = 0, 70

[State 805, throw snd]
type = playsnd
trigger1 = (var(1) != 2 && animelem = 2) || (var(1) = 2 && animelem = 1)
value = 3 + (var(1) = 2) * 10, 4 + (var(1) = 2) * 3
channel = 0

[State 805, Bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = 15, -76
[State 805, Bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = -11, -105
[State 805, Bind 3]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = -40, -80
[State 805, Bind 4]
type = targetbind
trigger1 = animelem = 4 && var(10) = 2
pos = -70, -45

[State 805, Snd]
type = playsnd
trigger1 = var(10) = 2 && numtarget
trigger1 = target, stateno = 5110 && target, time = 1
value = 5, 3
volume = -100
persistent = 0

[State 805, Dust]
type = explod
trigger1 = var(10) = 2 && numtarget
trigger1 = target, stateno = 5110 && target, time = 1
anim = 7120
ID = 7120
sprpriority = -2
postype = p2
pos = 0, 0
removetime = -2
ownpal = 1
scale = 0.5, 0.5

[State 805, Shake]
type = envshake
trigger1 = var(10) = 2 && numtarget
trigger1 = target, stateno = 5110 && target, time <= 1
trigger2 = var(10) = 1 && numtarget
trigger2 = target, stateno = 5100 && target, time <= 1
time = 12
freq = 60
ampl = 6
persistent = 0

[State 805, hurt far]
type = targetlifeadd
trigger1 = var(10) = 1 && numtarget
;trigger1 = target, stateno = 5100 && target, time <= 1
trigger1 = target,StateNo = 807 && target,pos y > -40
value = -ceil(140 * fvar(29))
ignorehitpause = 1
persistent = 0

[State 805, hurt near]
type = targetlifeadd
trigger1 = var(10) != 1 && numtarget
trigger1 = target, stateno = 5110 && target, time = 1
value = -ceil(140 * fvar(29))

[State 805, hurt]
type = targetpoweradd
trigger1 = animelem = 4
value = 36

[State 805, Power]
type = poweradd
trigger1 = animelem = 4 && !var(20)
value = 72

[State 805, throw]
type = targetstate
trigger1 = animelem = 4
value = ifelse(var(10) = 1, 807, 809)

[State 805, Pos]
type = posadd
trigger1 = !animtime
x = 3
[State 805, Turn]
type = turn
trigger1 = !animtime

[State 805, End]
type = changestate
trigger1 = !animtime
value = 0 
ctrl = 1


;--- TARGET ---
[Statedef 806]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0
[State 806, Anim]
type = changeanim2
trigger1 = !time
value = 806
[State 806, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[Statedef 807]
type = A
movetype = H
physics = N
velset = 7, 15

[State 807, Accel]
type = gravity
trigger1 = 1

[State 807, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 807, hitground]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= (-const(size.ground.front) -const(size.ground.back))
value = 5100

[Statedef 808]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0
[State 808, Anim]
type = changeanim2
trigger1 = !time
value = 808
[State 808, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[Statedef 809]
type = A
movetype = H
physics = N
velset = 2, 10

[State 809, Accel]
type = gravity
trigger1 = 1

[State 809, hitground]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= -9
value = 5110


;========< TOMOE NAGE >==========
;--- PLAYER ---
[Statedef 810]
type = S
movetype = A
physics = S
anim = 810
ctrl = 0

[State 810, No Push]
type = PlayerPush
trigger1 = 1
value = 0

[State 805, Lost Target]
type = ChangeState
trigger1 = !NumTarget
trigger2 = (time=[1,16]) && Target,StateNo>=5000
value = 899
ctrl = 0

[State 810, throw]
type = targetstate
trigger1 = !time
value = 811
[State 810, throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State Tech Hit]
type = changestate
trigger1 = numtarget && var(19)
trigger1 = (target, command = "holdfwd" || target, command = "holdback") && target, command != "holdup" && target, command != "holddown"
trigger1 = (target, command = "b" || target, command = "c" || target, command = "y" || target, command = "z")
value = 890
[State Tech Hit]
type = varadd
trigger1 = var(19) > 0
var(19) = -1

[State 810, width]
type = width
trigger1 = animelemtime(2) < 0
edge = 0, 20
[State 810, width]
type = width
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
edge = 0, 50
[State 810, width]
type = width
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
edge = 0, 70

[State 810, throw snd]
type = playsnd
trigger1 = animelem = 2
value = 3 + (var(1) = 2) * 10, 2
channel = 0

[State 810, Bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = 18, 0
[State 810, Bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 12, -62
[State 810, Bind 3]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = -7, -54
[State 810, Bind 4]
type = targetbind
trigger1 = animelem = 4
pos = -74, -57

[State 810, hurt]
type = targetlifeadd
trigger1 = animelem = 4
value = -ceil(140 * fvar(29))
[State 810, hurt]
type = targetpoweradd
trigger1 = animelem = 4
value = 36
[State 810, Power]
type = poweradd
trigger1 = animelem = 4 && !var(20)
value = 72
[State 810, throw]
type = targetstate
trigger1 = animelem = 4
value = 812

[State 810, Pos]
type = posadd
trigger1 = animelem = 1 || animelem = 2 || animelem = 3 || animelem = 4
x = ifelse((animelem = 2), -17, ifelse((animelem = 2), -15, ifelse((animelem = 3), -5, -14)))

[State 810, Turn]
type = turn
trigger1 = !animtime
[State 810, End]
type = changestate
trigger1 = !animtime
value = 0 
ctrl = 1


;--- TARGET ---
[Statedef 811]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0
[State 811, Anim]
type = changeanim2
trigger1 = !time
value = 811
[State 811, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[Statedef 812]
type = A
movetype = H
physics = N
velset = 5, -9
[State 812, Accel]
type = gravity
trigger1 = 1

[State 812, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 812, hitground]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= (-const(size.ground.front) -const(size.ground.back))
value = 5100


;===========< Target Escaped >==========
[Statedef 890]
type = S
physics = N
movetype = I
anim = 5945
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 890, Bind]
type = targetbind
trigger1 = !time && numtarget
pos = 0, 0
[State 890, p2state]
type = targetstate
trigger1 = !time && numtarget
value = 895
[State 890, Throw]
type = targetfacing
trigger1 = !time && numtarget
value = -1

[State 890, Pos]
type = posadd
trigger1 = !time
x = 24

[State 890, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 890, Push]
type = playerpush
trigger1 = 1
value = 0

[State 890, Pos]
type = posset
trigger1 = !time
y = 0
[State 890, Vel]
type = velset
trigger1 = 1
x = -1.425
y = 0

[State 890, Snd]
type = playsnd
trigger1 = time = 2
value = ifelse(var(1) = 2, 5010, 5000), ifelse(var(1) = 2, 1, 4)
channel = 0

[State 890, FX]
type = playsnd
trigger1 = !time
value = 7, 3

[State 890, FX]
type = explod
trigger1 = !time
anim = 7000
ID = 7000
sprpriority = 5
postype = p1
pos = 0, -55
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 890, End]
type = changestate
trigger1 = time >= 27
value = 0
ctrl = 1


;--- TARGET ---
[Statedef 895]
type = S
physics = N
movetype = I
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 895, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5945), 5945, 130)
[State 895, Anim]
type = changeanim
trigger1 = !time && !selfanimexist(5945) && selfanimexist(5910)
value = 5910
[State 895, Anim]
type = changeanim
trigger1 = time >= 20 && anim = 130
value = 140

[State 895, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 895, Push]
type = playerpush
trigger1 = 1
value = 0

[State 895, Pos]
type = posset
trigger1 = !time
y = 0
[State 895, Vel]
type = velset
trigger1 = 1
x = -1.425
y = 0

[State 895, End]
type = selfstate
trigger1 = time >= 27
value = 0
ctrl = 1

;====== Throw breaked by Hit ====
[StateDef 898]
type = S
physics = S
movetype = I
anim = 898
ctrl = 0
velset = 0,0
sprPriority = 1

[State 898, Posfix]
type = Posset
trigger1 = !time
y = 0

[State 898, Turn]
type = Turn
trigger1 = !time && P2Dist x <0

[State 898, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 5000 + (10*(var(40)=1)),1
channel = 0

[State 898, End]
type = ChangeState
trigger1 = !Animtime
value = 0
ctrl = 1

;====== Throw breaked by Hit ====
[StateDef 899]
type = C
physics = C
movetype = I
anim = 899
ctrl = 0
velset = 0,0
sprPriority = 1

[State 898, Posfix]
type = Posset
trigger1 = !time
y = 0

[State 899, Turn]
type = Turn
trigger1 = !time && P2Dist x <0

[State 898, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 5000 + (10*(var(40)=1)),1
channel = 0

[State 898, End]
type = ChangeState
trigger1 = !Animtime
value = 0
ctrl = 1
