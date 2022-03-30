; =========== Ryu (リュウ(隆)) by BeterHans ===============
; =========== a Project based on POTSs Ryu =============

;=======================================< HELPER STATES >========================================
;==============================================================================================

;========================<Alpha Counter FX>=============================
[StateDef 751]
type = A
velSet = 0,0
anim = 9741

[State 751, Player]
type = VarSet
trigger1 = !Time
var(0) = Parent, var(43)

[State 751, PosSet]
type = PosSet
trigger1 = PlayerIDexist(var(0))
x = ceil(PlayerID(var(0)), pos x)
y = ceil(PlayerID(var(0)), pos y) + (PlayerID(var(0)), const(size.mid.pos.y))

[State 751, PosSet (Laying Down)]
type = PosSet
trigger1 = PlayerIDexist(var(0))
trigger1 = PlayerID(var(0)), StateType = L
x = ceil(PlayerID(var(0)), pos x)
y = ceil(PlayerID(var(0)), pos y) - 20

[State 751, Facing]
type = Turn
trigger1 = PlayerIDexist(var(0))
trigger1 = Facing != (PlayerID(var(0)), Facing)

[State 751, Flame Explod 1]
type = Explod
trigger1 = PlayerIDexist(var(0)) && !NumExplod(751)
anim = 751
ID = 751
bindtime = -1
sprPriority = 3
posType = P1
facing = 1
scale = 1,1
ownpal = 1

[State 751, End]
type = DestroySelf
trigger1 = Time >= 120
trigger2 = !PlayerIDexist(var(0))

[State 751, End]
type = DestroySelf
triggerAll = PlayerIDexist(var(0))
trigger1 = PlayerID(var(0)), ctrl
trigger2 = PlayerID(var(0)), Movetype != H || PlayerID(var(0)), StateNo >= 5100
trigger3 = PlayerIDExist(var(0))
trigger3 = PlayerID(var(0)),Pos y >= 0 && PlayerID(var(0)),vel y > 0

;========================< JUMP DUST >=============================
[Statedef 7100]
physics = N
velset = 0, 0
anim = 9741
[State 7100, Bind]
type = bindtoroot
trigger1 = time
[State 7100, Dust]
type = explod
trigger1 = !time
anim = 7100
ID = 7100
sprpriority = 3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
[State 7100, Dust]
type = explod
trigger1 = !time || time = 2 || time = 6
anim = 7101
ID = 7100
sprpriority = 3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
[State 7100, Assert]
type = assertspecial
trigger1 = 1
flag = invisible
[State 7100, End]
type = destroyself
trigger1 = time >= 7


;========================< HADOU KEN >=============================
[Statedef 1005]
type = S
physics = N
movetype = A
anim = 1005
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 200, No Reverse Guard]
type = AssertSpecial
trigger1 = Enemynear,facing = facing
flag = unguardable

[State 1005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1006
ignorehitpause = 1

[State 1005, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1005, Strength]
type = varset
trigger1 = !time
var(10) = root, var(10)

[State 1005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 1005, Vel]
type = velset
trigger1 = 1
x = ifelse(var(10) = 3, 6, ifelse(var(10) = 2, 4.5, 3))
y = 0

[State 1005, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 7
persistent = 0
ignorehitpause = 1

[State 1005, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = S, SP
damage = ceil(82 * parent, fvar(29)), 7
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 12 / ((root, var(20) > 0) + 1)
sparkno = -1
guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
air.velocity = -4, -4
air.fall = 1
fall.recover = 1
fall.recovertime = 30
getpower = ifelse(p2movetype = H, 140, 320) * !(root, var(20)), 70 * !(root, var(20))
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
sprpriority = 4
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1
id = 1005

[State 1005, Miss]
type = hitdef
trigger1 = numenemy
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, SP
hitflag = 

[State 1005, Sparks]
type = explod
trigger1 = movehit && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = 7020 + (random % 8)
ID = 7000
sprpriority = 5
Space = stage
BindID = ID
facing = facing
pos = 16 * facing,0
removetime = -2
ownpal = 1
ignorehitpause = 1
persistent = 0
pausemovetime = 65535
supermovetime = 65535

[State 1005, End]
type = changestate
trigger1 = movecontact
value = 1006
ignorehitpause = 1

[State 1005, End]
type = destroyself
trigger1 = time > 10
trigger1 = screenpos x != [-20*Const(size.xscale), (ScreenWidth / CameraZoom) + 20.0 * Const(size.xscale)]

[Statedef 1006]
type = A
physics = N
movetype = I
anim = 1006
velset = 0, 0
ctrl = 0
sprpriority = 4

[State 1006, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1006, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
ignorehitpause = 1
persistent = 0

[State 1006, End]
type = destroyself
trigger1 = !animtime


;========================< EX HADOU KEN >=============================
[Statedef 1015]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 200, No Reverse Guard]
type = AssertSpecial
trigger1 = Enemynear,facing = facing
flag = unguardable

[State 1015, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 2, 1015, 1016)
ignorehitpause = 1
[State 1015, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1015, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 4
[State 1015, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 1015

[State 1015, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 1015, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 1015, Vel]
type = velset
trigger1 = 1
x = ifelse((time < 2 && var(2) > 1), 1, 7)
y = 0

[State 1015, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1015, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 7
channel = 1
persistent = 0
ignorehitpause = 1

[State 1015, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = S, SP
damage = ceil(62 * parent, fvar(29)), 7
animtype = Back
hitflag = MAF
guardflag = MA
pausetime = 4 * (var(2) < 2), 6
sparkno = -1
guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4, -6
ground.cornerpush.veloff = 0
air.velocity = -4, -6
fall = 1
fall.recover = 1
fall.recovertime = 22
getpower = 0
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.color = 32
palfx.sinadd = 80, 25, 0, 8
palfx.mul = 512, 256, 128
palfx.time = 32
sprpriority = 4
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1

[State 1015, Miss]
type = hitdef
trigger1 = numenemy
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, SP
hitflag = 

[State 1015, Sparks]
type = explod
trigger1 = movehit && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = 7020 + (random % 8)
ID = 7000
sprpriority = 5
Space = stage
BindID = ID
facing = facing
pos = 16 * facing,0
removetime = -2
ownpal = 1
ignorehitpause = 1
persistent = 0
pausemovetime = 65535
supermovetime = 65535

[State 1015, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7180) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7180
ID = 7180
name = "flames"
postype = p2
bindtime = 1000
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1

[State 1015, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 2, 1015, 1016)
[State 1015, End]
type = destroyself
trigger1 = time > 10
trigger1 = screenpos x != [-20*Const(size.xscale), (ScreenWidth / CameraZoom) + 20.0 * Const(size.xscale)]

[Statedef 1016]
type = A
physics = N
movetype = I
anim = 1016
ctrl = 0
velset = 0, 0
sprpriority = 4
[State 1016, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
ignorehitpause = 1
persistent = 0
[State 1016, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 1016, End]
type = destroyself
trigger1 = !animtime


;========================< SHAKUNETSU HADOU KEN >=============================
[Statedef 1025]
type = S
physics = N
movetype = A
anim = 1015
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 200, No Reverse Guard]
type = AssertSpecial
trigger1 = Enemynear,facing = facing
flag = unguardable

[State 1025, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1026
ignorehitpause = 1
[State 1025, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1025, Strength]
type = varset
trigger1 = !time
var(10) = root, var(10)
[State 1025, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 1025, Vel]
type = velset
trigger1 = 1
x = ifelse(var(10) = 3, 5, ifelse(var(10) = 2, 4, 3))
y = 0

[State 1025, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1025, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 7
persistent = 0
ignorehitpause = 1

[State 1025, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = S, SP
damage = ceil(90 * parent, fvar(29)), 8
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = (8 * (var(2) < 2)) / ((root, var(20) > 0) + 1), 10 / ((root, var(20) > 0) + 1)
sparkno = -1
guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(time <= 18, -4, -10.52), ifelse(time <= 18, -5, 0)
ground.cornerpush.veloff = 0
air.velocity = -4, -5
fall = (time <= 18)
fall.recover = 1
fall.recovertime = 22
air.fall = 1
getpower = ifelse(p2movetype = H, 140, 320) * !(root, var(20)), 70 * !(root, var(20))
givepower = 36, 36
envshake.time = 14
envshake.freq = 90
envshake.ampl = 8
palfx.color = 32
palfx.sinadd = 80, 25, 0, 8
palfx.mul = 512, 256, 128
palfx.time = 32
sprpriority = 4
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1

[State 1025, Miss]
type = hitdef
trigger1 = numenemy
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, SP
hitflag = 

[State 1025, Sparks]
type = explod
trigger1 = movehit && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = 7020 + (random % 8)
ID = 7000
sprpriority = 5
Space = stage
BindID = ID
facing = facing
pos = 16 * facing,0
removetime = -2
ownpal = 1
ignorehitpause = 1
persistent = 0
pausemovetime = 65535
supermovetime = 65535

[State 1025, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7180) < 1
trigger1 = !(target, time) && (target, movetype = H) && !var(16)
helpertype = normal
stateno = 7180
ID = 7180
name = "flames"
postype = p2
bindtime = 1000
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1

[State 1025, End]
type = changestate
trigger1 = movecontact
value = 1026
ignorehitpause = 1

[State 1025, End]
type = destroyself
trigger1 = time > 10
trigger1 = screenpos x != [-20*Const(size.xscale), (ScreenWidth / CameraZoom) + 20.0 * Const(size.xscale)]

[Statedef 1026]
type = A
physics = N
movetype = I
anim = 1016
velset = 0, 0
ctrl = 0
sprpriority = 4
[State 1026, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 1026, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
ignorehitpause = 1
persistent = 0
[State 1026, End]
type = destroyself
trigger1 = !animtime


;========================< SHINKUU HADOU KEN >=============================
[Statedef 3005]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 200, No Reverse Guard]
type = AssertSpecial
trigger1 = Enemynear,facing = facing
flag = unguardable

[State 3005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 6, 3005, 3006)
ignorehitpause = 1

[State 3005, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3005, Unguardable var]
type = VarSet
trigger1 = !time && !PrevStateNo
var(17) = Parent,var(17)

[State 3005, Assert: UnGuardable]
type = AssertSpecial
trigger1 = var(17) > 0
trigger1 = var(17) := (var(17) - 1)
flag = UnGuardable
ignoreHitPause = 1

[State 3005, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 5

[State 3005, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3005

[State 3005, hitvar]
type = varadd
trigger1 = !time
var(2) = 1

[State 3005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 3005, Vel]
type = velset
trigger1 = 1
x = ifelse((time < 2 && var(2) > 1), 1, 9)
y = 0

[State 3005, shield]
type = helper
trigger1 = (root, var(1) != 2) && !numhelper(3008)
helpertype = normal
stateno = 3008
ID = 3008
name = "Shinkuu Shield"
postype = p1
ownpal = 1

[State 3005, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 7
channel = 1
persistent = 0
ignorehitpause = 1

[State 3005, Hit]
type = hitdef
trigger1 = root, var(1) = 1
priority = 4, Hit
attr = S, HP
damage = ceil(36 * parent, fvar(29)), 8
animtype = Back
hitflag = MAF
guardflag = M
pausetime = 4 * (var(2) < 6), 8
sparkno = -1
guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(2) < 5, -10.52, -6), ifelse(var(2) < 5, 0, -4)
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.velocity = -6, -4
fall = (var(2) >= 6)
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1
ID = 3005

[State 3005, Hit]
type = hitdef
trigger1 = root, var(1) != 1
priority = 4, Hit
attr = S, HP
damage = ceil(36 * parent, fvar(29)), 8
animtype = Back
hitflag = MAF
guardflag = M
pausetime = 4 * (var(2) < 6), 8
sparkno = -1
guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(2) < 5, -10.52, -6), ifelse(var(2) < 5, 0, -6)
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.velocity = -6, -6
fall = (var(2) >= 6)
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 32
sprpriority = 4
yaccel = 0.5
forcestand = 1
ID = 3005

[State 3005, Miss]
type = hitdef
trigger1 = numenemy && (root, var(1) <= 1)
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, HP
hitflag = 

[State 3005, Tell Parent Hit and set target ID]
type = ParentVarSet
triggerall = Parent,AILevel
trigger1 = movehit && numtarget(3005)
trigger1 = (target(3005),StateNo = [5000,5099]) && target(3005),time < 2
var(36) = target(3005),ID
ignorehitpause = 1

[State 3005, Sparks]
type = explod
trigger1 = movehit && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = 7030 + (random % 8)
ID = 7000
sprpriority = 5
Space = stage
BindID = ID
facing = facing
pos = 16 * facing,0
removetime = -2
ownpal = 1
ignorehitpause = 1
persistent = 0
pausemovetime = 65535
supermovetime = 65535

[State 3005, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7181) < 1 && (root, var(1) != 1)
trigger1 = !(target, time) && (target, movetype = H) && !var(16)
helpertype = normal
stateno = 7181
ID = 7181
name = "flames"
postype = p2
bindtime = 1000
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1

[State 3005, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 6, 3005, 3006)

[State 3005, End]
type = destroyself
trigger1 = time > 10
trigger1 = screenpos x != [-20*Const(size.xscale), (ScreenWidth / CameraZoom) + 20.0 * Const(size.xscale)]

[Statedef 3006]
type = A
physics = N
movetype = I
anim = 3006
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3006, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3006, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
ignorehitpause = 1
persistent = 0

[State 3006, End]
type = destroyself
trigger1 = !animtime


;========================< DOUBLE SHINKUU HADOU KEN >=============================
[Statedef 3605]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 200, No Reverse Guard]
type = AssertSpecial
trigger1 = Enemynear,facing = facing
flag = unguardable

[State 3605, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 10, 3605, 3606)
ignorehitpause = 1

[State 3605, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3605, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 7

[State 3605, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3605

[State 3605, Hit Number Var]
type = varadd
trigger1 = !time
var(2) = 1

[State 3605, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 3605, Vel]
type = velset
trigger1 = 1
x = ifelse((time < 3 && var(2) > 1), 0.2, 10)
y = 0

[State 6005, shield]
type = helper
trigger1 = !numhelper(3008)
helpertype = normal
stateno = 3008
ID = 3008
name = "Shinkuu Shield"
postype = P1
size.xscale = Const(Size.xscale) * 1
size.yscale = Const(Size.yscale) * 1
size.proj.doscale = ID
ownpal = 1

[State 3605, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3605, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 7
channel = 1
persistent = 0
ignorehitpause = 1

[State 3605, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = S, HP
damage = ceil(68 * parent,fvar(29)), 24
animtype = Back
hitflag = MAF
guardflag = M
pausetime = 4 * (var(2) < 10), 8
sparkno = -1
guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(2) < 10, -10.52, -6), ifelse(var(2) < 10, 0, -4)
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.velocity = -6, -4
fall = (var(2) >= 10)
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

;[State 3605, Miss]
;type = hitdef
;trigger1 = numenemy && (Parent, var(1) <= 1)
;trigger1 = (enemynear, stateno = [5070, 5071])
;attr = S, HP
;hitflag =

[State 3605, Sparks]
type = explod
trigger1 = movehit && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = 7030 + (random % 8)
ID = 7000
sprpriority = 5
Space = stage
BindID = ID
facing = facing
pos = 16 * facing,0
removetime = -2
ownpal = 1
ignorehitpause = 1
persistent = 0
pausemovetime = 65535
supermovetime = 65535

[State 3605, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7181) < 1 && (Parent, var(1) != 1)
trigger1 = !(target, time) && (target, movetype = H) && !var(16)
helpertype = normal
stateno = 7181
ID = 7181
name = "flames"
postype = P2
bindtime = 1000
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1

[State 3605, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 10, 3605, 3606)

[State 3605, End]
type = destroyself
trigger1 = time > 10
trigger1 = screenpos x != [-20*Const(size.xscale), (ScreenWidth / CameraZoom) + 20.0 * Const(size.xscale)]


;================ Double ShinKuu Hadoken ================
[Statedef 3606]
type = A
physics = N
movetype = I
anim = 3006
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3606, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = 0.5,0.5

[State 3606, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3606, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
ignorehitpause = 1
persistent = 0

[State 3606, End]
type = destroyself
trigger1 = !animtime



;========================< SHINKUU SHIELD >=============================
[Statedef 3008]
type = A
physics = N
movetype = A
anim = 3008
ctrl = 0
velset = 8, 0
sprpriority = 3

[State 3008, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3008, Bind]
type = varset
trigger1 = !time
var(0) = parent, ID

[State 3008, Bind]
type = bindtoparent
trigger1 = playerIDexist(var(0))
pos = 10, 0
time = 1

[State 3008, Turn]
type = turn
trigger1 = playerIDexist(var(0))
trigger1 = (facing != parent, facing)

[State 3008, End]
type = destroyself
trigger1 = !playerIDexist(var(0))
trigger2 = playerIDexist(var(0))
trigger2 = parent, stateno != 3005 && parent, stateno != 3605


;========================< DENJIN HADOU KEN >=============================
[Statedef 3025]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3025, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < var(4), 3025, 3026)
ignorehitpause = 1

[State 3025, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3025, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3025

[State 3025, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = ifelse(root, var(25) >= 200, 4, ifelse(root, var(25) >= 120, 3, ifelse(root, var(25) >= 60, 2, ifelse(root, var(25) >= 20, 1, 0))))

[State 3025, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 3025, maxhitvar]
type = varadd
trigger1 = !time && !prevstateno
var(4) = 1 + var(10)

[State 3025, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 3025, Vel]
type = velset
trigger1 = 1
x = ifelse((time < 2 && var(2) > 1), 0.5, 4 + 1.5 * var(10))
y = 0

[State 3025, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3025, particles]
type = explod
trigger1 = 1
vel = -.5 -(random / 1000.0), 0
accel = 0, 0.075
anim = 3031
sprpriority = 3
postype = p1
pos = -25, 0
random = 70, 30
facing = -1 + (random < 500) * 2
vfacing = -1 + (random < 500) * 2
scale = 0.5, 0.5
ownpal = 1
ignorehitpause = 1

[State 3025, particles]
type = explod
trigger1 = var(4) = 5
vel = -.5 -(random / 1000.0), 0
accel = 0, 0.075
anim = 3031
sprpriority = 3
postype = p1
pos = -25, 0
random = 70, 30
facing = -1 + (random < 500) * 2
vfacing = -1 + (random < 500) * 2
scale = 0.5, 0.5
ownpal = 1
ignorehitpause = 1

[State 3025, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 7
channel = 1
persistent = 0
ignorehitpause = 1

[State 3025, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 5, 5
channel = 2
persistent = 0
ignorehitpause = 1

[State 3025, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = S, HP
damage = ceil(48 * parent, fvar(29)), 7
animtype = Hard
hitflag = MAF
pausetime = 4 * (var(2) < var(4)), 12
sparkno = -1
guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -6, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -5, -2
fall = 0
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.color = 32
palfx.sinadd = 10, 30, 60, 8
palfx.mul = 128, 256, 512
palfx.time = 32
sprpriority = 4
yaccel = 0.5
ID = 3025
Fall.Envshake.Time = 0
Fall.Envshake.Ampl = ID; Send Thrower ID
forcestand = 1

[State 3025, Miss]
type = hitdef
trigger1 = numenemy && (root, var(1) <= 1)
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, HP
hitflag = 

[State 3025, Tell Parent Hit and set task]
type = ParentVarSet
triggerall = Parent,AILevel && Parent,var(57) != 3
trigger1 = movehit && numtarget(3025)
trigger1 = target(3025), gethitvar(hitcount) >= 2
trigger1 = (target(3025), stateno = 5000) || (target(3025), stateno = 5010) || (target(3025), stateno = 5020)
var(57) = 3
ignorehitpause = 1

[State 3025, Tell Parent Hit and set target ID]
type = ParentVarSet
triggerall = Parent,AILevel
trigger1 = movehit && numtarget(3025)
trigger1 = target(3025), gethitvar(hitcount) >= 2
trigger1 = (target(3025), stateno = 5000) || (target(3025), stateno = 5010) || (target(3025), stateno = 5020)
var(36) = target(3025),ID
ignorehitpause = 1

[State 3025, P2state]
type = TargetState
trigger1 = movehit && numtarget(3025)
trigger1 = target(3025), gethitvar(hitcount) >= 2
trigger1 = (target(3025), stateno = 5000) || (target(3025), stateno = 5010) || (target(3025), stateno = 5020)
value = 7696
ID = 3025
ignorehitpause = 1

[State -2, Debug]
type = displaytoclipboard
trigger1 = 1
text = "AI = %d"
params = hitcount

[State 3025, Sparks]
type = explod
trigger1 = movehit && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = 7030 + (random % 8)
ID = 7000
sprpriority = 5
Space = stage
BindID = ID
facing = facing
pos = 16 * facing,0
removetime = -2
ownpal = 1
ignorehitpause = 1
persistent = 0
pausemovetime = 65535
supermovetime = 65535

[State 3025, dizzyfx]
type = helper
trigger1 = movehit && numtarget && numhelper(3033) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 3033
ID = 3033
name = "Dizzy FX"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1
persistent = 0

[State 3025, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < var(4), 3025, 3026)

[State 3025, End]
type = destroyself
trigger1 = time > 10
trigger1 = screenpos x != [-20*Const(size.xscale), (ScreenWidth / CameraZoom) + 20.0 * Const(size.xscale)]

[Statedef 3026]
type = A
physics = N
movetype = I
anim = 3026
ctrl = 0
velset = 0, 0
sprpriority = 4
[State 3026, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
ignorehitpause = 1
persistent = 0
[State 3026, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3026, End]
type = destroyself
trigger1 = !animtime


;========================< METSU HADOU KEN >=============================
[Statedef 3045]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3045, hitvar]
type = varadd
trigger1 = !time
var(2) = 1

[State 3045, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = floor(parent, var(26) / 40)

[State 3045, maxhitvar]
type = varadd
trigger1 = !time && !prevstateno
var(4) = 3 + var(10)

[State 3045, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1


[State 200, No Reverse Guard]
type = AssertSpecial
trigger1 = Enemynear,facing = facing
flag = unguardable

[State 3045, hitby]
type = hitby
trigger1 = 1
time = 1
value = SCA, AP

[State 3045, HitOverride]
type = hitoverride
trigger1 = 1
time = 1
attr = SCA, AA,AP,AT
stateno = ifelse(var(2) < var(4), 3045, 3046)
ignorehitpause = 1

[State 3045, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3045

[State 3045, Vel]
type = velset
trigger1 = 1
x = ifelse((time < 2 && var(2) > 1), 0.5, 6 + 2 * var(10))
y = 0

[State 3045, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3045, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 7
channel = 1
persistent = 0
ignorehitpause = 1

[State 3045, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = S,HP
damage = ceil(68 * parent, fvar(29)), 7
animtype = Hard
fall.animtype = Hard
hitflag = MAF
pausetime = 6 * (var(2) < var(4)), 8
sparkno = -1
guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -6, -5
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -5, -2
fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.color = 0
palfx.sinadd = 64, 0, 0, 4
palfx.mul = 256, 0, 0
palfx.time = 48
sprpriority = 4
yaccel = 0.5
ID = 3045
forcestand = 1

[State 3045, Miss]
type = hitdef
trigger1 = numenemy && (root, var(1) <= 1)
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, HP
hitflag = 

[State 3045, Tell Parent Hit and set task]
type = ParentVarSet
triggerall = Parent,AILevel && Parent,var(59) != 3025
trigger1 = movehit && numtarget(3045)
trigger1 = target(3045), gethitvar(hitcount) >= 2
trigger1 = (target(3045), stateno = 5000) || (target(3045), stateno = 5010) || (target(3045), stateno = 5020)
var(59) = 3025
ignorehitpause = 1

[State 3045, Tell Parent Hit and set target ID]
type = ParentVarSet
triggerall = Parent,AILevel
trigger1 = movehit && numtarget(3045)
trigger1 = target(3045), gethitvar(hitcount) >= 2
trigger1 = (target(3045), stateno = 5000) || (target(3045), stateno = 5010) || (target(3045), stateno = 5020)
var(36) = target(3045),ID
ignorehitpause = 1

[State 3045, P2state]
type = targetstate
trigger1 = movehit && numtarget(3045)
trigger1 = target(3045), gethitvar(hitcount) >= 2
trigger1 = (target(3045), stateno = 5000) || (target(3045), stateno = 5010) || (target(3045), stateno = 5020)
value = 1113045
ID = 3045
ignorehitpause = 1

[State 3045, Sparks]
type = explod
trigger1 = movehit && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = 7030 + (random % 8)
ID = 7000
sprpriority = 5
Space = stage
BindID = ID
facing = facing
pos = 16 * facing,0
removetime = -2
ownpal = 1
ignorehitpause = 1
persistent = 0
pausemovetime = 65535
supermovetime = 65535

[State 3045, dizzyfx]
type = helper
trigger1 = movehit && numtarget && numhelper(3033) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 3033
ID = 3033
name = "Dizzy FX"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1

[State 3045, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < var(4), 3045, 3046)

[State 3045, End]
type = destroyself
trigger1 = time > 10
trigger1 = screenpos x != [-20*Const(size.xscale), (ScreenWidth / CameraZoom) + 20.0 * Const(size.xscale)]

[State 3045, Debug]
type = displaytoclipboard
trigger1 = 1
text = "var(2)=%d, var(4)=%d"
params = var(2), var(4)
ignorehitpause = 1

[Statedef 3046]
type = A
physics = N
movetype = I
anim = 3046
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3046, Snd]
type = playsnd
trigger1 = !time
value = 5, 10
ignorehitpause = 1
persistent = 0

[State 3046, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3046, End]
type = destroyself
trigger1 = !animtime

[State 3046, Debug]
type = displaytoclipboard
trigger1 = 1
text = "var(2)=%d, var(4)=%d"
params = var(2), var(4)
ignorehitpause = 1


;========================< Ultra Metsu! Hadoken! (Ultra 滅！ 波動拳！) >=============================
[Statedef 3055]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 200, No Reverse Guard]
type = AssertSpecial
trigger1 = Enemynear,facing = facing
flag = unguardable

[State 3055, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3055
ignorehitpause = 1

[State 3055, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3055, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3055, Bind]
type = bindtoroot
trigger1 = 1
pos = 69, -66

[State 3055, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7
[State 3055, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3055

[State 3055, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3055, movehitvar2]
type = varset
trigger1 = !time && prevstateno
var(4) = animelemno(0)
ignorehitpause = 1

[State 3055, bgpal]
type = bgpalfx
trigger1 = 1
mul = 512, 0, 0
time = 2
mul = 512, 0, 0
add = -70, -70, -70
color = 0
ignorehitpause = 1

[State 3055, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = 2, 7
channel = 1
ignorehitpause = 1

[State 3055, Hit]
type = hitdef
triggerall = animelemno(0) != var(4)
trigger1 = animelem = 1 || animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9 || animelem = 11
trigger2 = animelem = 13 || animelem = 15 || animelem = 17 || animelem = 19 || animelem = 21
attr = S, HP
damage = ceil(70 * parent, fvar(29)), 7
animtype = Hard
fall.animtype = Hard
hitflag = MAFD
priority = 4, Hit
pausetime = 2, 2
guard.dist = 320
sparkno = -1
guard.sparkno = -1
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -20, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -20, -.5
down.velocity = -20, -.5
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3055, Hit]
type = hitdef
trigger1 = animelemno(0) != var(4)
trigger1 = animelem = 23
attr = S, HP 
damage = ceil(100 * parent, fvar(29)), 7
animtype = Diagup
fall.animtype = Diagup
hitflag = MAFD
priority = 4, Hit 
pausetime = 2, 2
guard.dist = 320
sparkno = -1
guard.sparkno = -1
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -20, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -20, -9
down.velocity = -20, -9
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3055, Sparks]
type = explod
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = ifelse(moveguarded, 7001, 7030 + (random % 8))
ID = 7000
sprpriority = 5
Space = stage
BindID = ID
facing = facing
pos = 16 * facing,0
removetime = -2
ownpal = 1
ignorehitpause = 1
persistent = 0
pausemovetime = 65535
supermovetime = 65535

[State 3055, End]
type = changestate
trigger1 = !animtime || root, stateno != 3050 || root, anim != 3050
value = 3056

[Statedef 3056]
type = A
physics = N
movetype = I
anim = 3056
ctrl = 0
velset = 0, 0
sprpriority = 4
[State 3056, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3056, bgpal]
type = bgpalfx
trigger1 = 1
mul = 512 -ceil(18 * time), ceil(18 * time), ceil(18 * time)
add = (-70 + 5 * time), (-70 + 5 * time), (-70 + 5 * time)
color = ceil(18 * time)
time = 2
[State 3056, End]
type = destroyself
trigger1 = !animtime


;========================< HADOUKEN BLOW BACK >=============================
[Statedef 3054]
physics = N
movetype = A
anim = 3054
[State 3054, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA
[State 3054, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3054
ignorehitpause = 1
[State 3054, bound]
type = screenbound
trigger1 = 1
value = 0
[State 3054, Push]
type = playerpush
trigger1 = 1
value = 1
[State 3054, Vel]
type = velset
trigger1 = !time && !prevstateno
x = 40
[State 3054, Vel]
type = velmul
trigger1 = 1
x = 0.9
[State 3054, Snd]
type = playsnd
trigger1 = !time && !prevstateno
value = 5, 2
[State 3054, Hit]
type = hitdef
trigger1 = !time
priority = 4, Hit
attr = S, SP
damage = 0, 0
numhits = 0
animtype = Back
hitflag = MAF
guard.dist = 0
sparkno = -1
guard.sparkno = -1
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -8, -6
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -8, -6
kill = 0
[State 3054, End]
type = destroyself
trigger1 = time >= 15


;========================< B&W DUST >=============================
[Statedef 3125]
physics = N
anim = 9741
[State 3125, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1
[State 3125, Dust]
type = explod
trigger1 = !time
anim = 3125
ID = 3125
sprpriority = -2
postype = p1
removetime = 16
[State 3125, Fade]
type = palfx
trigger1 = !time
color = 0
mul = 384, 384, 384
sinadd = -255, -255, -255, 64
time = 16
[State 3125, Shrink]
type = modifyexplod
trigger1 = 1
ID = 3125
scale = 0.2 + (0.05 * time) * const(size.xscale), 0.05 + (0.0125 * time) * const(size.yscale)
[State 3125, End]
type = destroyself
trigger1 = time >= 17

;======================< MESSATSU GOSHORYU LV 3 HitMax Charge Camera/BG Controller >=========================
[Statedef 7150]
type = A
physics = N
movetype = I
ctrl = 0
velset = 0, 0
sprpriority = -2
anim = 9741


[State 7150, Get Default Ground Level]
type = varset
trigger1 = !time
var(21) = Parent,var(5)


;------ Run Counter --------
[State 7150, Counter add]
type = varadd
trigger1 = var(6) != 0
var(6) = 1

;-------------- vars ----------------------
[State 7150, min zoom var]
type = varset
trigger1 = !time
trigger1 = CameraZoom > 0 && CameraZoom < 1
fvar(21) = (1 - CameraZoom)
persistent = 0

[State 7150, min zoom var]
type = varset
trigger1 = !time
trigger1 = CameraZoom >= 1
fvar(21) = 0
persistent = 0

[State 7150, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = noFG
flag2 = noshadow

;-------- ScreenBound--------
[State 7150, Screen bind]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 1,1
ignorehitpause = 1

;-------- Pos fixs -------------
[State 7150, BindtoParent 1]
type = BindtoParent
trigger1 = Parent,var(10) < 10
trigger1 = time < 2
pos = 60 * Const(Size.xscale), 0 * Const(Size.xscale)

[State 7150, Move up the camera to high avoid spark]
type = BindtoParent
trigger1 = time = 45
pos = 0, -242

[State 7150, sync x again]
type = BindtoParent
trigger1 = time = 63
pos = 0, -242

[State 7150, set Down the camera to get ready]
type = posset
trigger1 = time = 64
trigger1 = var(7):= 1
trigger1 = var(6):= 1
y = -122

[State 7150, Moving down camera to see hand]
type = posadd
trigger1 = var(7) = 1
trigger1 = var(6) = [1,22]
y = 1

[State 7150, BindtoParent 2 to extand hand time 86]
type = BindtoParent
trigger1 = Parent,anim = 3155
trigger1 = Parent,animelemtime(6) = 0
trigger1 = var(7) := 2
trigger1 = var(6) := 1
facing = 1
pos = 0, -90
persistent = 0

[State 7150, BindtoParent 3 to open fingers 24 frames 92,115]
type = BindtoParent
trigger1 = Parent,anim = 3155 && Parent,var(10) = 12
trigger1 = var(7) := 3
trigger1 = var(6) := 1
facing = 1
pos = 0, -90
persistent = 0

[State 7150, open fingers pos move down 24 frames 92,115]
type = posadd
trigger1 = var(7) = 3
trigger1 = var(6) = [1,24]
y = 1

[State 7150, BindtoParent 4 to CHARGE time 115]
type = BindtoParent
trigger1 = Parent,anim = 3155
trigger1 = Parent,animelemtime(12) = 0
trigger1 = var(7) := 4
trigger1 = var(6) := 1
facing = 1
pos = 0, -22
persistent = 0

[State 7150, BindtoParent 3 last hit]
type = BindtoParent
trigger1 = Parent,var(10) = 16
trigger1 = Parent,anim = 3156
facing = 1
pos = 0 * Const(Size.xscale), 0 * Const(Size.xscale)
persistent = 0


;-------- Zoom --------------
[State 7150, zoom 1 Hit, Not Follow player on Ground]
type = zoom
trigger1 = Parent,var(10) < 10
scale = (fvar(21) + 1.4)
pos = ((pos x) / (fvar(21) + 1.4)) * CameraZoom, ((pos y - var(21)) -  (CameraPos y / (fvar(21) + 1.4))) * CameraZoom
ignorehitpause = 1

[State 7150, zoom 2 Black windows]
type = zoom
trigger1 = Parent,var(10) = 11
trigger1 = Parent,anim = 3155
trigger1 = time < 64
scale = (fvar(21) + 4)
pos = ((pos x) / (fvar(21) + 4)) * CameraZoom, ((pos y - 9) -  (CameraPos y / (fvar(21) + 4))) * CameraZoom
ignorehitpause = 1

[State 7150, zoom 3 extand hand 64-85 and 86-92]
type = zoom
trigger1 = var(7) = 1
trigger1 = var(6) = [1,23]
trigger2 = var(7) = 2
scale = (fvar(21) + 4)
pos = ((pos x) / (fvar(21) + 4)) * CameraZoom, ((pos y - 42) -  (CameraPos y / (fvar(21) + 4))) * CameraZoom
;pos = Ceil(pos x + (facing * 0)),Ceil((pos y - var(21)) * CameraZoom)
ignorehitpause = 1

[State 7150, zoom 3 open fingers final zoom 1.24 start 92 and 24 frames]
type = zoom
trigger1 = var(7) = 3
trigger1 = var(6) = [1,24]
scale = ((fvar(21) + 4) - 0.12*var(6))
pos = ((pos x) / ((fvar(21) + 4) - 0.12*var(6))) * CameraZoom, ((pos y - 42) -  (CameraPos y / ((fvar(21) + 4) - 0.12*var(6)))) * CameraZoom
;pos = Ceil(pos x + (facing * 0)),Ceil((pos y - var(21)) * CameraZoom)
ignorehitpause = 1

[State 7150, zoom 4 Charge! final zoom 1.2 start 115-164 50 frames]
type = zoom
trigger1 = var(7) = 4
trigger1 = var(6) = [1,50]
scale = ((fvar(21) + 1.24) - 0.0008*var(6))
pos = ((pos x) / ((fvar(21) + 1.24) - 0.0008*var(6))) * CameraZoom, ((pos y - 42) -  (CameraPos y / ((fvar(21) + 1.24) - 0.0008*var(6)))) * CameraZoom
;pos = Ceil(pos x + (facing * 0)),Ceil((pos y - var(21)) * CameraZoom)
ignorehitpause = 1

[State 7150, zoom 5 Charge]
type = zoom
trigger1 = (Parent,var(10) != 16)
trigger1 = Parent,anim = 3155 || Parent,anim = 3156
trigger1 = (Parent,time = [300,428])
scale = (fvar(21) + 1.2)
pos = ((pos x) / (fvar(21) + 1.2)) * CameraZoom, ((pos y - 42) -  (CameraPos y / (fvar(21) + 1.2))) * CameraZoom
;pos = Ceil(pos x + (facing * 0)),Ceil((pos y - var(21)) * CameraZoom)
ignorehitpause = 1

[State 7150, last hit zoom 1]
type = zoom
trigger1 = Parent,anim = 3156 && Parent,var(10) = 16
trigger1 = (Parent,time = [429,439])
scale = 1.3
pos = ((pos x + facing *9) / 1.3) * CameraZoom, (((pos y + 90) - 4.5*(Parent,time-429)) -  (CameraPos y / 1.3)) * CameraZoom
;pos = Ceil(pos x + (facing * 9)), Ceil((pos y + 90) - 4.5*(Parent,time-429))
ignorehitpause = 1

[State 7150, last hit zoom 2]
type = zoom
trigger1 = Parent,anim = 3156 && Parent,var(10) = 16
trigger1 = (Parent,time = [440,490])
scale =  1.3
pos = ((pos x + (facing * 9)) / 1.3) * CameraZoom, ((pos y) -  (CameraPos y / 1.3)) * CameraZoom
;pos = Ceil(pos x + (facing * 9)), Ceil(pos y)
ignorehitpause = 1

[State 7150, last hit zoom 3]
type = zoom
trigger1 = Parent,anim = 3156 && Parent,var(10) = 16
trigger1 = (Parent,time = [491,510])
scale = (1.3 - 0.015*(Parent,time-491))
pos = ((pos x + (facing * (9 - 0.45*(Parent,time-491)))) / (1.3 - 0.015*(Parent,time-491))) * CameraZoom, ((pos y) -  (CameraPos y / (1.3 - 0.015*(Parent,time-491)))) * CameraZoom
;pos = Ceil(pos x + (facing * (9 - 0.45*(Parent,time-491)))), Ceil(pos y)
ignorehitpause = 1


[State 7150, BGPAL fade in]
type = BgPalFx
trigger1 = time <= 12
time = 1
mul = 256 - time*21, 256 - time*21, 256 - time*21

[State 7150, BGPAL black1]
type = BgPalFx
trigger1 = time = [13,142]
time = 1
mul = 0,0,0

[State 7150, BGPAL black2]
type = BgPalFx
trigger1 = Parent,anim = 3156 && parent,var(10) = 14
trigger2 = Parent,anim = 3156 && Parent,var(10) = 15
trigger2 = Parent,animelemtime(3)>0
time = 1
mul = 0,0,0

[State 7150, BGPAL black to normal]
type = BgPalFx
trigger1 = Parent,anim = 3156 && Parent,var(10) = 16
trigger1 = Parent,time = [429,469]
time = 1
mul = Ceil(6.4*(Parent,time-429)),Ceil(6.4*(Parent,time-429)),Ceil(6.4*(Parent,time-429))

[State 7150, Explod Evil ryu]
type = Explod
trigger1 = !NumExplod(7515)
trigger1 = Parent,anim = 3156 && Parent,animelemtime(6) = 0
anim = 7515
ID = 7515
space = Screen
pos = Ceil(ScreenWidth / 2.0 + facing * 10) , ScreenHeight / 2.0
facing = facing
sprpriority = 0
removetime = 60 + 0*(var(5):=61)
supermovetime = 65535
pausemovetime = 65535
scale = 0.6, 0.6
ownpal = 1
ignorehitpause = 1

[State 7150, Countdown]
type = varadd
trigger1 = var(5) > 0 && time
var(5) = -1

[State 7150, ModifyExplod Evil ryu fade in]
type = ModifyExplod
trigger1 = NumExplod(7515)
trigger1 = var(5) = [50,60]
ID = 7515
scale = 0.06*(60-var(5)),0.06*(60-var(5))
trans = addalpha
alpha = 25*(60-var(5)),256

[State 7150, ModifyExplod Evil ryu keep ]
type = ModifyExplod
trigger1 = NumExplod(7515)
trigger1 = var(5) = [10,49]
ID = 7515
scale = 0.6 + 0.01*(49-var(5)), 0.6 + 0.01*(49-var(5))
trans = addalpha
alpha = 256,256

[State 7150, ModifyExplod Evil ryu fade out]
type = ModifyExplod
trigger1 = NumExplod(7515)
trigger1 = var(5) = [1,9]
ID = 7515
scale = 1 + 0.2*(9-var(5)),1 + 0.2*(9-var(5))
trans = addalpha
alpha = 256 - 12 * (9-var(5)),256

[State 7150, End]
type = destroyself
trigger1 = time > 700
trigger2 = Parent,StateNo != 3150

[State 7150, Debug]
type = displaytoclipboard
trigger1 = 1
text="pos x=%d, pos y=%d, camerazoom=%d, var(21)=%d, fvar(21)=%d"  
params= pos x, pos y, camerazoom, var(21), fvar(21)
ignorehitpause = 1

[State 7150, Debug]
type = appendtoclipboard
trigger1 = 1
text="\nvar(7)=%d, var(6)=%d,Parent,var(10)=%d, Parent,time=%d, Parent,pos x=%d, parent,pos y=%d"  
params= var(7), var(6),Parent,var(10), Parent,time, Parent,pos x, parent,pos y
ignorehitpause = 1

;======================< MESSATSU GOSHORYU LV 3 HitMax Charge Helper >=========================
[Statedef 7151]
type = A
physics = N
movetype = I
ctrl = 0
velset = 0, 0
sprpriority = 2
anim = 9741

[State 7151, BindtoParent]
type = BindtoParent
trigger1 = (Parent,var(10) = [11,12])
trigger1 = Parent,anim = 3155
facing = 1
pos = -11 * Const(Size.xscale), -142 * Const(Size.xscale)


[State 7151, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = noFG
flag2 = noshadow

;-------- ScreenBound--------
[State 7151, Screen bind]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0
ignorehitpause = 1

[State 7151, Trans]
type = Trans
trigger1 = 1
trans = sub

[State 7151, Blackball]
type = ChangeAnim
trigger1 = Parent,anim = 3155
trigger1 = Parent,animelemtime(12) = 0
value = 7151

[State 7151, RemoveBlackball]
type = ChangeAnim
trigger1 = Parent,anim = 3155
trigger1 = Parent,animelemtime(15) = 0
value = 9741

[State 7151, Scale 1]
type = AngleDraw
trigger1 = Anim = 7151
trigger1 = Parent,anim = 3155
trigger1 = Parent,animelemtime(12) = [1,30]
scale = (0.05 + 0.0033*(Parent,animelemtime(12) - 1)),(0.05 + 0.0033*(Parent,animelemtime(12) - 1))

[State 7151, Scale 2]
type = AngleDraw
trigger1 = Anim = 7151
trigger1 = Parent,anim = 3155
trigger1 = Parent,animelemtime(12) = [31,50]
scale = 0.15, 0.15

[State 7151, Scale 3]
type = AngleDraw
trigger1 = Anim = 7151
trigger1 = Parent,anim = 3155
trigger1 = time = [51,60]
scale = 0.15 - 0.015*(time - 51), 0.15 - 0.015*(time - 51)


[State 7151, Explod White BG]
type = Explod
trigger1 = !time && !NumExplod(7153)
anim = 7153
ID = 7153
space = Screen
pos = Ceil(ScreenWidth / 2.0), Ceil(ScreenHeight / 2.0)
facing = 1
sprpriority = -5
scale = 4,4
ownpal = 1
trans = addalpha
alpha = 256,0

[State 7151, start Fadeout white]
type = varset
trigger1 = NumExplod(7153)
trigger1 = Parent,anim = 3156 && Parent,animelemtime(3) = 1
var(5) = 14

[State 7151, white turn to black]
type = ModifyExplod
trigger1 = NumExplod(7153)
trigger1 = var(5)
ID = 7153
trans = addalpha
alpha = 252 - 18*(14-var(5)),18*(14-var(5))

[State 7151, Countdown]
type = varadd
trigger1 = var(5) > 0 && time
var(5) = -1

[State 7151, Explod Charge]
type = Explod
trigger1 = !time && !NumExplod(7154)
anim = 7154
ID = 7154
space = Stage
pos = 0,0
facing = 1
bindID = ID
sprpriority = -1
bindtime = -1
removetime = -2
supermovetime = 65535
pausemovetime = 65535
scale = 0.75, 0.75
ownpal = 1
trans = sub

[State 7151,safe]
type = RemoveExplod
trigger1 = NumExplod(7153)
trigger1 = Parent,anim = 3156 && Parent,animelemtime(3) > 1
trigger1 = var(5) <= 0
ID = 7153

[State 7151,safe all]
type = RemoveExplod
trigger1 = time > 500
trigger2 = Parent,StateNo != 3150
trigger3 = Parent,anim = 3156 && Parent,animelemtime(6) > 1

[State 7151, End]
type = destroyself
trigger1 = time > 500
trigger2 = Parent,StateNo != 3150
trigger3 = Parent,anim = 3156 && Parent,animelemtime(6) > 1

[State 7151, Debug]
type = displaytoclipboard
trigger1 = 1
text="var(5)=%d"  
params= var(5)
ignorehitpause = 1

;======================< MESSATSU GOSHORYU LV 3 HitMax Dive Attack Helper >=========================
[Statedef 7155]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 0
anim = 9741

[State 7155, BindtoParent]
type = BindtoParent
trigger1 = Parent,anim = 3156
trigger1 = Parent,animelemtime(8) >= 0 && Parent,animelemtime(9) < 0
facing = 1
pos = 3 * Const(Size.xscale), -2 * Const(Size.xscale)

[State 7155, Dive light]
type = Explod
trigger1 = !time && !NumExplod(4105)
trigger1 = Parent,anim = 3156
trigger1 = Parent,animelemtime(8) = 0
anim = 4105
ID = 4105
space = Stage
pos = 0,0
facing = 1
bindID = ID
sprpriority = 1
bindtime = -1
removetime = -2
supermovetime = 65535
pausemovetime = 65535
scale = 0.75, 0.75
ownpal = 1
trans = add

[State 7155, Dive light]
type = Explod
trigger1 = time && !NumExplod(3030)
trigger1 = Parent,anim = 3156
trigger1 = Parent,animelemtime(8) = 20
anim = 3030
ID = 3030
space = Stage
pos = 0,0
facing = 1
bindID = ID
sprpriority = 2
bindtime = -1
removetime = -2
supermovetime = 65535
pausemovetime = 65535
scale = 1,1
ownpal = 1
trans = add

[State 7155, Dive Dust]
type = Explod
trigger1 = time && !NumExplod(7107)
trigger1 = Parent,anim = 3156
trigger1 = Parent,animelemtime(8) = 26
anim = 7107
ID = 7107
space = Stage
pos = 0,0
facing = 1
bindID = ID
sprpriority = 1
bindtime = 1
removetime = -2
supermovetime = 65535
pausemovetime = 65535
scale = 1, 1
ownpal = 1
trans = add

[State 7155, particles]
type = explod
trigger1 = Parent,anim = 3156
trigger1 = Parent,animelemtime(8) = [20,50]
vel = IFElse(Random<500,1,-1) * ceil(1+random/500) * Const(Size.xscale),ceil(1+random/500) * Const(Size.yscale)
accel = IFElse(Random<500,1,-1) * 0.08 * Const(Size.xscale), -0.5 * Const(Size.yscale)
anim = 4108
ID = 4108
sprpriority = Random%3
space = stage
bindID = ID
bindtime = 1
removetime = 22
facing = -1+(random<500)*2
pos = facing * 2 * Const(Size.xscale), -40 * Const(Size.yscale)
scale = 0.5 * Const(Size.xscale), 0.1 * Const(Size.yscale)
random = 60,60
ownpal = 1

[State 7155, particles]
type = explod
trigger1 = Parent,anim = 3156
trigger1 = Parent,animelemtime(8) = [20,50]
vel = IFElse(Random<500,1,-1) * ceil(1+random/500) * Const(Size.xscale),ceil(1+random/500) * Const(Size.yscale)
accel = IFElse(Random<500,1,-1) * 0.08 * Const(Size.xscale), -0.5 * Const(Size.yscale)
anim = 4108
ID = 4108
sprpriority = Random%3
space = stage
bindID = ID
bindtime = 1
removetime = 22
facing = -1+(random<500)*2
pos = facing * 2 * Const(Size.xscale), -40 * Const(Size.yscale)
scale = 0.5 * Const(Size.xscale), 0.1 * Const(Size.yscale)
random = 60,60
ownpal = 1


[State 7155, EnvShake]
type = EnvShake
trigger1 = time
trigger1 = Parent,anim = 3156
trigger1 = Parent,animelemtime(8) = 20
time = 26
freq = 80
ampl = 30



[State 7151, End]
type = destroyself
trigger1 = time > 300
trigger2 = Parent,StateNo != 3150
trigger3 = Parent,Anim != 3156


;========================< METSU SHORYUU KEN >=============================
[Statedef 3165]
physics = N
velset = 0, 0
anim = 3165
sprpriority = 3

[State 3165, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3165, Bind]
type = bindtoroot
trigger1 = 1
[State 3165, Shadows]
type = afterimage
trigger1 = !time && !prevstateno
time = 999
timegap = 1
framegap = 1
length = 3
palcontrast = 120, 30, 30
trans = add

[State 3165, End]
type = destroyself
trigger1 = !animtime


;========================< TATSUMAKI VACUUM >=============================
[Statedef 3205]
physics = N
velset = 0, 0
anim = 3205

[State 3205, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA

[State 3205, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3205
ignorehitpause = 1

[State 3205, bound]
type = screenbound
trigger1 = 1
value = 0

[State 3205, Turn]
type = turn
trigger1 = rootdist x < 5
[State 3205, Push]
type = playerpush
trigger1 = p2bodydist x = [ -10, 10]
value = 1

[State 3205, Pos]
type = posset
trigger1 = pos y != 0
y = 0

[State 3205, Vel]
type = velset
trigger1 = Parent, var(1) = 1
x = 250.0 / (Parentdist x + 50.0)


[State 3205, Vel]
type = velset
trigger1 = Parent, var(1) != 1
x = 500.0 / (Parentdist x + 50.0)

[State 3205, Dust]
type = explod
trigger1 = (p2bodydist x = [ -5, 5]) && (enemynear, statetype != A) && !(time % 12)
anim = 7103
ID = 7103
sprpriority = 2
postype = p1
pos = 0, 0
scale = 1, 1
removetime = -2
ownpal = 1
[State 3205, Pos]
type = posadd
trigger1 = p2bodydist x != [ -5, 5]
x = ceil(p2dist x) - enemynear, const(size.ground.back) -5
[State 3205, End]
type = destroyself
trigger1 = root, stateno != 3200 || (root, anim != [3201, 3202]) || root, movecontact


;========================< CLOUD >=============================
[Statedef 3215]
physics = N
anim = 3215
sprpriority = 4

[State 3215, Pos]
type = posadd
trigger1 = !time
y = -ceil(screenpos y) -20
[State 3215, Bind]
type = posset
trigger1 = var(0) != 3
x = ceil(root, pos x)
[State 3215, Bind]
type = posset
trigger1 = var(0) = 2
y = -180

[State 3215, Vel]
type = velset
trigger1 = !time
trigger1 = var(0) := 1
y = (pos y + 180) / -57.9

[State 3215, Anim]
type = changeanim
trigger1 = anim = 3215 && (root, anim = [3201, 3202])
trigger1 = var(0) := 2
value = 3216
[State 3215, Vel]
type = velset
trigger1 = var(0) = 2
y = 0

[State 3215, Vel]
type = velset
trigger1 = anim = 3216 && (root, anim != [3201, 3202])
trigger1 = var(0) := 3
y = -2

[State 3215, rain]
type = explod
trigger1 = var(0) = 2 && !numexplod(3217)
anim = 3217
ID = 3217
sprpriority = 3
postype = p1
facing = 1
pos = 0, -ceil(pos y)
bindtime = -1
removetime = -1
trans = addalpha
alpha = 128, 128

[State 3215, rain]
type = removeexplod
trigger1 = var(0) = 3

[State 3215, Snd]
type = playsnd
trigger1 = var(0) = 2
value = 5, 16
channel = 0
loop = 1
persistent = 0
[State 3215, Snd]
type = stopsnd
trigger1 = var(0) != 2
channel = 0

[State 3215, End]
type = destroyself
trigger1 = var(0) = 3 && vel y < 0 && pos y <= -260

;========================<Dizzy Ducks>===========================
[Statedef 6300]
type=S
physics=N
anim=6300
sprpriority=1
ctrl=0

[state 6300, bind]
type=bindtoparent
trigger1= 1
pos= -2,-100

[state 6300, playsnd]
type=playsnd
trigger1= !time
value= 5300,0
channel=5

[state 6300, playsnd]
type=playsnd
trigger1= time%18=0
value= 5300,1
channel=0

[state 6300, remove]
type=destroyself
trigger1= parent,stateno != [5000,5999]
trigger2= roundstate != 2

;========================< S.G.S. GUARDED >=============================
[Statedef 4012]
physics = N
velset = 0, 0
anim = 9741

[State 4012, BG PalFX]
type = bgpalfx
trigger1 = !time
time = 20
add = -255, -128, -64
sinadd = 255, 128, 64, 80
persistent = 0
[State 4012, palfx]
type = palfx
trigger1 = !time
time = 24
sinadd = -255, -255, -255, 96

[State 4012, thunder]
type = explod
trigger1 = !time
anim = 4012
ID = 4012
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
removetime = -2
supermovetime = 30
ownpal = 1
[State 4012, Circle]
type = explod
trigger1 = !time
anim = 7501
ID = 4013
sprpriority = 5
postype = p1
removetime = 20
supermovetime = 30

[State 4012, Shrink]
type = modifyexplod
trigger1 = numexplod(4013)
ID = 4013
scale = 0.2 + (0.09 * time), 0.2 + (0.09 * time)
[State 4012, No Shadow]
type = assertspecial
trigger1 = 1
flag = invisible
ignorehitpause = 1
[State 4012, End]
type = destroyself
trigger1 = time >= 24


;========================< BAG >=============================
[Statedef 6000]
physics = N
anim = 6000
sprpriority = 0
[State 6000, bound]
type = screenbound
trigger1 = 1
value = 0
[State 6000, Bind1]
type = bindtoroot
trigger1 = (root, anim = 355) && roundstate = 1
trigger1 = (root, animelemtime(1) >= 0) && (root, animelemtime(4) < 0)
pos = 61, -46
[State 6000, Bind4]
type = bindtoroot
trigger1 = (root, anim = 355) && roundstate = 1
trigger1 = (root, animelemtime(4) >= 0) && (root, animelemtime(5) < 0)
pos = 38, -46
[State 6000, Bind5]
type = bindtoroot
trigger1 = (root, anim = 355) && roundstate = 1
trigger1 = (root, animelemtime(5) >= 0) && (root, animelemtime(6) < 0)
pos = 14, -46
[State 6000, Bind6]
type = bindtoroot
trigger1 = (root, anim = 355) && roundstate = 1
trigger1 = (root, animelemtime(6) >= 0) && (root, animelemtime(7) < 0)
pos = 2, -43
[State 6000, Bind7]
type = bindtoroot
trigger1 = (root, anim = 355) && roundstate = 1
trigger1 = root, animelem = 7
pos = -19, -46
[State 6000, Accel]
type = gravity
trigger1 = time >= 91
[State 6000, Vel]
type = velset
trigger1 = time = 91
x = -7
[State 6000, Vel]
type = velmul
trigger1 = time >= 91
x = 0.85
[State 6000]
type = sprpriority
trigger1 = time >= 91
value = -3
[State 6000, End]
type = changestate
trigger1 = pos y >= -4
value = 6001

[Statedef 6001]
physics = S
anim = ifelse(random < 750, 6001, 6002)
sprpriority = -3
velset = vel x, 0
[State 6001, Stop]
type = posset
trigger1 = 1
y = -4
[State 6001, landsnd]
type = playsnd
trigger1 = !time
trigger2 = anim = 6003 && animelem = 3
value = 5, 2
[State 6001, Dust]
type = explod
trigger1 = !time
anim = 7104
ID = 7104
sprpriority = -4
postype = p1
scale = 0.25, 0.25
ownpal = 1
[State 6001, fall]
type = changeanim
triggerall = anim = 6001 && animelemtime(2) > 0 && random < 500
trigger1 = root, movetype = H && (rootdist x = [ -30, 30]) && (rootdist x = [ -30, 30]); && !(root, time)
trigger2 = enemy, movetype = H && (p2dist x = [ -30, 30]) && (p2dist y = [ -30, 30]); && !(enemy, time)
value = 6003
persistent = 0
[State 6001, bound]
type = screenbound
trigger1 = 1
value = 0


;========================< DIZZY FX >=============================
[Statedef 3033]
physics = N
velset = 0, 0
anim = 9741
sprpriority = 4
[State 3033, Assert]
type = assertspecial
trigger1 = 1
flag = invisible
ignorehitpause = 1
[State 3033, Pos]
type = posadd
trigger1 = 1
x = ceil(p2dist x)
y = ceil(p2dist y)
[State 3033, Snd]
type = playsnd
trigger1 = enemynear, stateno = 5300
value = 0, ifelse(random < 500, 5300, 5301)
persistent = 0
[State 3033, End]
type = destroyself
trigger1 = enemynear, ctrl
trigger1 = (enemynear, movetype != H) && (enemynear, stateno != 5300)


;========================< FIRE >=============================
;--- RED ---
[Statedef 7180]
physics = N
velset = 0, 0
anim = 9741
sprpriority = 4
[State 7180, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1
[State 7180, flames]
type = explod
trigger1 = 1
anim = 7180
ID = 7180
sprpriority = 3
postype = p2
vel = -.2, -.75
pos = (enemynear, const(size.mid.pos.x)), ifelse((enemynear, statetype = L), 0, (enemynear, const(size.mid.pos.y) + 10))
random = 40, 40
scale = 0.5, 0.5
ownpal = 1
[State 7180, Pos]
type = posadd
trigger1 = 1
x = ceil(p2dist x)
y = ceil(p2dist y)
[State End]
type = destroyself
triggerall = numenemy
trigger1 = enemynear, ctrl
trigger2 = enemynear, movetype != H || enemynear, stateno = 5300
trigger3 = enemynear, statetype = L && (enemynear, stateno != [5080, 5081])
[State End]
type = destroyself
trigger1 = !numenemy || time >= 120


;--- SHARED ---
[Statedef 7181]
physics = N
velset = 0, 0
anim = 9741
sprpriority = 4
[State 7181, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1
[State 7181, flames]
type = explod
trigger1 = 1
anim = 7181
ID = 7181
sprpriority = 3
postype = p2
vel = -.2, -.75
pos = (enemynear, const(size.mid.pos.x)), ifelse((enemynear, statetype = L), 0, (enemynear, const(size.mid.pos.y) + 10))
random = 40, 40
removetime = -2
scale = 0.5, 0.5
ownpal = 1
[State 7181, Pos]
type = posadd
trigger1 = 1
x = ceil(p2dist x)
y = ceil(p2dist y)
[State End]
type = destroyself
triggerall = numenemy
trigger1 = enemynear, ctrl
trigger2 = enemynear, movetype != H || enemynear, stateno = 5300
trigger3 = enemynear, statetype = L && (enemynear, stateno != [5080, 5081])
[State End]
type = destroyself
trigger1 = !numenemy || time >= 120


;========================< SHIN SHORYUUKEN SHOCKWAVE 1 >=============================
[Statedef 7050]
physics = N
velset = 0, 0
anim = 9741

[State 7050, palfx]
type = palfx
trigger1 = time = 5
time = 10
add = 0, 0, 0
sinadd = -255, -255, -255, 40

[State 7050, Circle]
type = explod
trigger1 = !time
anim = 7051
ID = 7051
sprpriority = 5
postype = p1
removetime = 15
pausemovetime = -1
supermovetime = -1

[State 7050, Circle]
type = explod
trigger1 = !time
anim = 7050
ID = 7050
sprpriority = 5
postype = p1
removetime = 15
pausemovetime = -1
supermovetime = -1

[State 7050, Shrink]
type = modifyexplod
trigger1 = 1
ID = 7051
scale = 0.15 * time, 0.15 * time

[State 7050, Shrink]
type = modifyexplod
trigger1 = 1
ID = 7050
scale = 0.05 * time, 0.05 * time

[State 7050, No Shadow]
type = assertspecial
trigger1 = 1
flag = invisible
ignorehitpause = 1

[State 7050, Safety]
type = removeexplod
trigger1 = time >= 15
ID = 7050

[State 7050, End]
type = destroyself
trigger1 = time >= 15

;========================< SHIN SHORYUUKEN SHOCKWAVE 2 >=============================
[Statedef 7051]
physics = N
velset = 0, 0
anim = 9741

[State 7051, Circle]
type = explod
trigger1 = !time
anim = 7051
ID = 7051
sprpriority = 5
postype = P1
removetime = 30
pausemovetime = -1
supermovetime = -1

[State 7051, Circle]
type = explod
trigger1 = !time
anim = 7050
ID = 7050
sprpriority = 5
postype = p1
removetime = 30
pausemovetime = -1
supermovetime = -1

[State 7051, Shrink 1 final 0.8]
type = modifyexplod
trigger1 = time < 8
ID = 7051
scale = time * 0.0875, time * 0.0875

[State 7051, Shrink 2]
type = modifyexplod
trigger1 = time >= 8
ID = 7051
Scale = 0.7 + 0.025*(time-8), 0.7 + 0.025*(time-8)

[State 7051, Shrink 1 final 0.6]
type = modifyexplod
trigger1 = time < 8
ID = 7050
scale = time * 0.0875, time * 0.0875

[State 7051, Shrink 2]
type = modifyexplod
trigger1 = time >= 8
ID = 7050
scale = 0.7 + 0.03*(time-8), 0.7 + 0.03*(time-8)


[State 7051, No Shadow]
type = assertspecial
trigger1 = 1
flag = invisible
ignorehitpause = 1

[State 7051, Safety]
type = removeexplod
trigger1 = time >= 30
ID = 7050

[State 7051, End]
type = destroyself
trigger1 = time >= 30

;========================< SHIN SHORYUUKEN BGPalHelper >=============================
[Statedef 7058]
physics = N
velset = 0, 0
sprpriority = -5
anim = 9741

[State 7058, No FG]
type = AssertSpecial
trigger1 = 1
flag = NoFG

[State 7058, fade in]
type = BgPalFx
trigger1 = time < 10 && !var(5)
time = 1
add = -(time * 3),-(time * 3),-(time * 3)

[State 7058, fade keep]
type = BgPalFx
trigger1 = time >= 10 && !var(5)
trigger1 = var(6) := (-30 - 1*(time-10))
time = 1
add = -30 - 1*(time-10), -30 - 1*(time-10),-30 - 1*(time-10)

[State 7058, fade away]
type = BgPalFx
trigger1 = var(5)
time = 1
add = Ceil(var(6) - var(5)*(var(6)/30.0)),Ceil(var(6) - var(5)*(var(6)/30.0)),Ceil(var(6) - var(5)*(var(6)/30.0))

[State 7058, Start to fade]
type = varset
triggerall = !var(5)
trigger1 = Parent,StateNo != 3120
trigger2 = Parent,Anim = 1111
var(5) = 1

[State 7058, End]
type = destroyself
trigger1 = var(5) > 30

[State 7058, run var5]
type = varadd
trigger1 = var(5) > 0
var(5) = 1




;========================< POWER CHARGE >=============================
;--- MAIN FX ---
[Statedef 7240]
type = S
anim = 7240
velset = 0, 0
ctrl = 0

[State 7240, Bind]
type = bindtoroot
trigger1 = (root, stateno = 740) && (root, anim = 740)
pos = -10, 0
[State 7240, Snd]
type = playsnd
trigger1 = !time
value = 7, 4
channel = 0

[State 7240, Aura]
type = explod
trigger1 = !numexplod(7242)
ID = 7242
anim = 7242
sprpriority = 3
postype = p1
bindtime = -1
removetime = -1
pausemovetime = -1
supermovetime = -1
scale = 0.5, 0.5
ownpal = 1

[State 7240, FX]
type = modifyexplod
trigger1 = numexplod(7242) && (root, power < 3000)
ID = 7242
scale = 0.5, 0.1 + .4 * (root, power / 3000.0)
[State 7240, FX]
type = modifyexplod
trigger1 = numexplod(7242) && (root, power >= 3000)
ID = 7242
scale = 0.5, 0.5

[State 7240, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 7240, End]
type = stopsnd
trigger1 = (root, stateno != 740) || (root, anim != 740) || (root, movetype = H)
channel = 0
[State 7240, End]
type = removeexplod
trigger1 = (root, stateno != 740) || (root, anim != 740) || (root, movetype = H)
[State 7240, End]
type = destroyself
trigger1 = (root, stateno != 740) || (root, anim != 740) || (root, movetype = H)


;--- PARTICLES ---
[Statedef 7243]
type = S
anim = 9741
velset = 0, 0
ctrl = 0

[State 7243, Bind]
type = bindtoroot
trigger1 = !(time % 4)
pos = ceil(-90 + (random / 6.25)), ceil(20 -(random / 6.25))

[State 7243, Particle]
type = explod
trigger1 = (time % 4) = 1
anim = 7243
sprpriority = ifelse(random < 750, 5, -1)
postype = p1
vel = ((rootdist x -10) / 16.0), ((rootdist y -60) / 16.0)
scale = ifelse(random < 500, 0.5, -.5), ifelse(random < 500, 0.5, -.5)
removetime = 16
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 7243, End]
type = removeexplod
trigger1 = (root, stateno != 740) || (root, anim != 740) || (root, movetype = H)
[State 7243, End]
type = destroyself
trigger1 = (root, stateno != 740) || (root, anim != 740) || (root, movetype = H)


;========================< ZERO COUNTER CHARGE >=============================
[Statedef 7250]
physics = N
velset = 0, 0
anim = 9741

[State 7250, BG PalFX]
type = bgpalfx
trigger1 = !time
time = 20
add = -255, -128, -64
sinadd = 255, 128, 64, 80
persistent = 0
[State 7250, palfx]
type = palfx
trigger1 = !time
time = 20
sinadd = -255, -255, -255, 80

[State 7250, Dust]
type = explod
trigger1 = !time
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
supermovetime = 30
ownpal = 1
[State 7250, thunder]
type = explod
trigger1 = !time
anim = 7250
ID = 7250
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
removetime = -2
supermovetime = 30
ownpal = 1
[State 7250, Circle]
type = explod
trigger1 = !time
anim = 7251
ID = 7251
sprpriority = 3
postype = p1
removetime = 20
supermovetime = 30

[State 7250, Shrink]
type = modifyexplod
trigger1 = numexplod(7251)
ID = 7251
scale = 0.2 + (0.09 * time), 0.2 + (0.09 * time)
[State 7250, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
flag2 = invisible
ignorehitpause = 1
[State 7250, End]
type = destroyself
trigger1 = time >= 20


;========================< ORIGINAL COMBO CHARGE >=============================
[Statedef 7260]
physics = N
velset = 0, 0
anim = 9741

[State 7260, BG PalFX]
type = bgpalfx
trigger1 = !time
time = 30
add = -255, -255, -128
sinadd = 255, 255, 128, 120
[State 7260, palfx]
type = palfx
trigger1 = time = 20
time = 11
sinadd = -255, -255, -255, 40
persistent = 0

[State 7260, main]
type = explod
trigger1 = !time
anim = 7260
ID = 7260
sprpriority = 5
postype = p1
removetime = 20
supermovetime = 300
[State 7260, sphere]
type = explod
trigger1 = !time
anim = 7500
ID = 7261
sprpriority = 5
postype = p1
removetime = -1
supermovetime = 300
[State 7260, Circle]
type = explod
trigger1 = time = 20
anim = 7501
ID = 7262
sprpriority = 5
postype = p1
removetime = -1
supermovetime = 300

[State 7260, shrinkcircle]
type = modifyexplod
trigger1 = 1
ID = 7260
scale = 2 -(0.1 * time), 2 -(0.1 * time)
[State 7260, shrinkcircle]
type = modifyexplod
trigger1 = 1
ID = 7261
scale = 0.017 * time, 0.017 * time
[State 7260, shrinkcircle]
type = modifyexplod
trigger1 = time >= 20
ID = 7262
scale = 0.1 + (0.1 * (time -20)), 0.1 + (0.1 * (time -20))

[State 7260, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
flag2 = invisible
ignorehitpause = 1
[State 7260, bound]
type = screenbound
trigger1 = 1
value = 0
[State 7260, Safety]
type = removeexplod
trigger1 = time >= 30
[State 6110, End]
type = destroyself
trigger1 = time >= 30


;========================< SUPER CHARGE >=============================
[Statedef 7500]
physics = N
velset = 0, 0
anim = 9741

[State 7500, Lv1]
type = bgpalfx
trigger1 = time <= 10 && root, var(10) = 5
time = 1
add = 256 -ceil(25.6 * time), 256 -ceil(25.6 * time), 256 -ceil(25.6 * time)
mul = 256 -floor(25.6 * time), 256 -floor(25.6 * time), 256
color = 256 -floor(25.6 * time)

[State 7500, Lv1]
type = bgpalfx
trigger1 = (time = [11, 39]) && root, var(10) = 5
time = 1
mul = 0, 0, 256
color = 0

[State 7500, Lv1]
type = bgpalfx
trigger1 = time >= 40 && root, var(10) = 5
time = 1
mul = ceil(51.2 * (time -40)), ceil(51.2 * (time -40)), 256
color = floor(51.2 * (time -40))

[State 7500, Lv2]
type = bgpalfx
trigger1 = time <= 15 && root, var(10) = 6
time = 1
add = 256 -ceil(17.07 * time), 256 -ceil(17.07 * time), 256 -ceil(17.07 * time)
mul = 256 -floor(17.07 * time), 256 -floor(17.07 * time), 256
color = 256 -floor(17.07 * time)

[State 7500, Lv2]
type = bgpalfx
trigger1 = (time = [16, 47]) && root, var(10) = 6
time = 1
mul = 0, 0, 256
color = 0

[State 7500, Lv2]
type = bgpalfx
trigger1 = time >= 48 && root, var(10) = 6
time = 1
mul = ceil(51.2 * (time -48)), ceil(51.2 * (time -48)), 256
color = floor(51.2 * (time -48))

[State 7500, Lv3]
type = bgpalfx
trigger1 = time <= 20 && root, var(10) = 7
time = 1
add = 256 -ceil(12.8 * time), 256 -ceil(12.8 * time), 256 -ceil(12.8 * time)
mul = 256 -floor(12.8 * time), 256 -floor(12.8 * time), 256 -floor(12.8 * time)
color = 256 -floor(12.8 * time)

[State 7500, Lv3]
type = bgpalfx
trigger1 = (time = [21, 54]) && root, var(10) = 7
time = 1
mul = 0, 0, 0
color = 0

[State 7500, Lv3]
type = bgpalfx
trigger1 = time >= 55 && root, var(10) = 7
time = 1
mul = ceil(51.2 * (time -55)), ceil(51.2 * (time -55)), ceil(51.2 * (time -55))
color = floor(51.2 * (time -55))

[State 7500, Ultra Sound Charge]
type = PlaySnd
trigger1 = time = 1 && parent,var(10) = 7
value = 7,9
volumescale = 100
channel = 6
abspan = 0

[State 7500, Spiral]
type = helper
trigger1 = !time && root, var(10) >= 6
helpertype = normal
stateno = 7509
ID = 7509
name = "Super Charge Spiral"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 7500, Main]
type = explod
trigger1 = !time
anim = 7500
ID = 7500
sprpriority = 5
postype = p1
removetime = -1
pausemovetime = -1
supermovetime = -1

[State 7500, Large Circle]
type = explod
trigger1 = !time
anim = 7501
ID = 7501
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1

;ID 7510 Normal Ryu
;ID 7511 Evil Ryu Hadoken
;ID 7512 Evil Ryu Shoyouken

[State 7500, LV3 Portrait]
type = explod
trigger1 = time = 1 && root, var(10) = 7
anim = 7510 + (parent, var(1) = 2)
ID = 7510 + (parent, var(1) = 2)
space = screen
facing = facing
pos = ScreenWidth/2,ScreenHeight/2
sprpriority = -16
bindtime = -1
removetime = -1
pausemovetime = 65535
supermovetime = 65535

[State 7500, Circle]
type = explod
trigger1 = !time
anim = 7502
ID = 75021
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1

[State 7500, Circle]
type = explod
trigger1 = time = 7
anim = 7502
ID = 75022
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1

[State 7500, Circle]
type = explod
trigger1 = time = 14
anim = 7502
ID = 75023
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1

[State 7500, Circle]
type = explod
trigger1 = time = 21
anim = 7502
ID = 75024
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1

[State 7500, Circle]
type = explod
trigger1 = time = 28
anim = 7502
ID = 75025
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1

[State 7500, Scale]
type = modifyexplod
trigger1 = root, var(10) = 5
ID = 7500
scale = 1.5 -(0.0333 * time), 1.5 -(0.0333 * time)

[State 7500, Scale]
type = modifyexplod
trigger1 = root, var(10) = 6
ID = 7500
scale = 1.5 -(0.0283 * time), 1.5 -(0.0283 * time)

[State 7500, Scale]
type = modifyexplod
trigger1 = root, var(10) = 7
ID = 7500
scale = 1.5 -(0.025 * time), 1.5 -(0.025 * time)

[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(7501)
ID = 7501
scale = 0.25 + (0.075 * time), 0.25 + (0.075 * time)
trans = addalpha
alpha = ceil(256 -6.4 * time), 256

;--------- Scale Portrait ---------------------------------
[State 7500, Scale Portrait 7510]
type = modifyexplod
trigger1 = numexplod(7510) && time < 8
ID = 7510
scale = 0.05*time, 0.05*time
trans = addalpha
alpha = (32 * time), 256

[State 7500, Scale Portrait 7510]
type = modifyexplod
trigger1 = numexplod(7510) && (time = [8, 50])
ID = 7510
scale = 0.35+(0.002*(time-7)), 0.35+(0.002*(time-7))
trans = addalpha
alpha = 256, 256

[State 7500, Scale Portrait 7510]
type = modifyexplod
trigger1 = numexplod(7510) && time > 50
ID = 7510
scale = (0.35+(0.002*(50-7))) + 0.1*(time-50), (0.35+(0.002*(50-7))) + 0.1*(time-50)
trans = addalpha
alpha = 256 -ceil(25.6 * (time -50)), 256



[State 7500, Scale Portrait 7511]
type = modifyexplod
trigger1 = numexplod(7511) && time < 8
ID = 7511
scale = 0.08*time, 0.08*time
trans = addalpha
alpha = (32 * time), 256

[State 7500, Scale Portrait 7511]
type = modifyexplod
trigger1 = numexplod(7511) && (time = [8, 50])
ID = 7511
scale = 0.5+(0.002*(time-7)), 0.5+(0.002*(time-7))
trans = addalpha
alpha = 256, 256

[State 7500, Scale Portrait 7511]
type = modifyexplod
trigger1 = numexplod(7511) && time > 50
ID = 7511
scale = (0.5+(0.002*(50-7))) + 0.1*(time-50), (0.5+(0.002*(50-7))) + 0.1*(time-50)
trans = addalpha
alpha = 256 -ceil(25.6 * (time -50)), 256
;------------------------------------------
[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(75021)
ID = 75021
scale = 0.25 + (0.0375 * time), 0.25 + (0.0375 * time)

[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(75022)
ID = 75022
scale = 0.25 + (0.0375 * (time -7)), 0.25 + (0.0375 * (time -7))

[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(75023)
ID = 75023
scale = 0.25 + (0.0375 * (time -14)), 0.25 + (0.0375 * (time -14))

[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(75024)
ID = 75024
scale = 0.25 + (0.0375 * (time -21)), 0.25 + (0.0375 * (time -21))

[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(75025)
ID = 75025
scale = 0.25 + (0.0375 * (time -28)), 0.25 + (0.0375 * (time -28))

[State 7500, Safety]
type = assertspecial
trigger1 = 1
flag = noshadow
flag2 = invisible
[State 7500, No bars]
type = assertspecial
trigger1 = root, var(10) = 7
flag = nobardisplay
flag2 = noFG

[State 7500, Safety]
type = removeexplod
trigger1 = root, var(10) = 5 && time >= 45
trigger2 = root, var(10) = 6 && time >= 53
trigger3 = time >= 60

[State 7500, End]
type = destroyself
trigger1 = root, var(10) = 5 && time >= 45
trigger2 = root, var(10) = 6 && time >= 53
trigger3 = time >= 60


;--- Spiral ---
[Statedef 7509]
physics = N
anim = 7509
sprpriority = 5

[State 7509, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 7509, Spin]
type = angleset
trigger1 = !time
value = -15 * (random % 24)
[State 7509, Spin]
type = angleadd
trigger1 = 1
value = -15

[State 7509, Angle]
type = angledraw
trigger1 = root, var(10) = 6
scale = 1 -(time / 53.0), 1 -(time / 53.0)

[State 7509, Trans]
type = trans
trigger1 = root, var(10) = 6
trans = addalpha
alpha = floor(4.83 * time), 256

[State 7509, Angle]
type = angledraw
trigger1 = root, var(10) = 7
scale = 1 -(time / 60.0), 1 -(time / 60.0)

[State 7509, Trans]
type = trans
trigger1 = root, var(10) = 7
trans = addalpha
alpha = floor(4.267 * time), 256

[State 7509, End]
type = destroyself
trigger1 = root, var(10) = 6 && time >= 53
trigger2 = time >= 60



;========================< SUPER CHARGE Double >=============================
[Statedef 7520]
physics = N
velset = 0, 0
anim = 9741

[State 7520, Lv3]
type = bgpalfx
trigger1 = time <= 20 && parent,var(10) = 7
time = 1
add = 256 -ceil(12.8 * time), 256 -ceil(12.8 * time), 256 -ceil(12.8 * time)
mul = 256 -floor(12.8 * time), 256 -floor(12.8 * time), 256 -floor(12.8 * time)
color = 256 -floor(12.8 * time)

[State 7520, Lv3]
type = bgpalfx
trigger1 = (time = [21, 59]) && parent,var(10) = 7
time = 1
mul = 0, 0, 0
color = 0

[State 7520, Lv3]
type = bgpalfx
trigger1 = (time = [60,80]) && parent,var(10) = 7
time = 1
mul = ceil(12.8 * (time - 60)), ceil(12.8 * (time -60)), ceil(12.8 * (time - 60))
color = floor(12.8 * (time - 60))

[State 7520, Ryu Explod]
type = Explod
trigger1 = time = 1 && !NumExplod(7512)
anim = 7512
ID = 7512
space = screen
facing = facing
pos = Ceil(ScreenWidth * IFElse(facing = 1,0.3,1 - 0.3)),Ceil(ScreenHeight/2.0)
sprpriority = -2
ownpal = 1
bindID = ID
bindtime = -1
removetime = 100
supermovetime = 256
pausemovetime = 256
scale = 0.35, 0.35

[State 7520, Scale Portrait ryu fade in]
type = modifyexplod
trigger1 = numexplod(7512) && time < 10
ID = 7512
scale = 0.035 * time, 0.035 * time
trans = addalpha
alpha = Ceil(time * 25.6),256

[State 7520, Scale Portrait ryu]
type = modifyexplod
trigger1 = numexplod(7512) && (time = [10,50])
ID = 7512
scale = (0.35 + (time - 10) * 0.003), (0.35 + (time - 10) * 0.003)
trans = addalpha
alpha = 256,256

[State 7520, Scale Portrait ryu fade out]
type = modifyexplod
trigger1 = numexplod(7512) && (time = [51,60])
ID = 7512
scale = (0.35 + 0.12 + (time-50)*0.1), (0.35 + 0.12 + (time-50)*0.1)
trans = addalpha
alpha = 256 - Ceil((time-50) * 25.6),256


[State 7520, Ken Explod]
type = Explod
trigger1 = time = 11 && !NumExplod(7513)
anim = 7513
ID = 7513
space = screen
facing = facing
pos = Ceil(ScreenWidth * IFElse(facing = 1,1 - 0.3,0.3)),Ceil(ScreenHeight/2.0)
sprpriority = -3
ownpal = 1
bindID = ID
bindtime = -1
removetime = 100
supermovetime = 256
pausemovetime = 256
scale = 0.35, 0.35

[State 7520, Scale Portrait ken fade in]
type = modifyexplod
trigger1 = numexplod(7513) && time = [11,19]
ID = 7513
scale = 0.035 * (time-11), 0.035 * (time-11)
trans = addalpha
alpha = Ceil((time-11) * 25.6),256

[State 7520, Scale Portrait ken]
type = modifyexplod
trigger1 = numexplod(7513) && (time = [20,60])
ID = 7513
scale = (0.35 + (time - 20) * 0.003), (0.35 + (time - 20) * 0.003)
trans = addalpha
alpha = 256,256

[State 7520, Scale Portrait ken fade out]
type = modifyexplod
trigger1 = numexplod(7513) && (time = [61,70])
ID = 7513
scale = (0.35 + 0.12 + (time-60)*0.1), (0.35 + 0.12 + (time-60)*0.1)
trans = addalpha
alpha = 256 - Ceil((time-60) * 25.6),256

;--------- Spiral FX -----------
[State 7520, Main]
type = explod
trigger1 = !time
anim = 7500
ID = 7500
sprpriority = 5
space = stage
bindID = ID
removetime = 60
pausemovetime = -1
supermovetime = -1

[State 7520, Large Circle]
type = explod
trigger1 = !time
anim = 7501
ID = 7501
sprpriority = 5
space = stage
bindID = ID
removetime = 60
pausemovetime = -1
supermovetime = -1

[State 7520, Scale Main]
type = modifyexplod
trigger1 = numexplod(7500) && time < 60
ID = 7500
scale = 1.5 -(0.025 * time), 1.5 -(0.025 * time)

[State 7520, Scale Large Circle]
type = modifyexplod
trigger1 = numexplod(7501) && time < 60
ID = 7501
scale = 0.25 + (0.075 * time), 0.25 + (0.075 * time)
trans = addalpha
alpha = ceil(256 -6.4 * time), 256

[State 7520, Spiral]
type = helper
trigger1 = !time && root, var(10) >= 6
helpertype = normal
stateno = 7509
ID = 7509
name = "Super Charge Spiral"
postype = p1
pausemovetime = 256
supermovetime = 256
size.proj.doscale = ID
ownpal = 1

[State 7520, safe]
type = RemoveExplod
trigger1 = time > 100
trigger2 = Parent,StateNo != 3601

[State 7520, End]
type = destroyself
trigger1 = time > 100
trigger2 = Parent,StateNo != 3601


;========================< SUPER CHARGE SF4 Ultra >=============================
[Statedef 7530]
physics = N
velset = 0, 0
anim = 9741

[State 7530, Ultra]
type = bgpalfx
trigger1 = time < 10
time = 1
add = 256 -ceil(28 * time), 256 -ceil(28 * time), 256 -ceil(28 * time)
mul = 256 -floor(28 * time), 256 -floor(28 * time), 256 -floor(28 * time)
color = 256 -floor(28 * time)

[State 7530, Ultra]
type = bgpalfx
trigger1 = (time = [10, 58])
time = 1
mul = 0, 0, 0
color = 0

[State 7530, Ultra]
type = bgpalfx
trigger1 = (time = [59,66])
time = 1
mul = ceil(32 * (time - 59)), ceil(32 * (time - 59)), ceil(32 * (time - 59))
color = floor(32 * (time - 59))

[State 7530, Evil Ryu Portriat Explod Mugen 1.0 Old Type]
type = Explod
trigger1 = !time
trigger1 = Parent,StateNo = 3150
anim = 7514
ID = 7514
sprpriority = -1
postype = back
facing = 1
pos = Screenwidth/2, ScreenHeight/2
scale = 0.6 * Const(size.xscale), 0.6 * Const(size.yscale)
removetime = -1
supermovetime = 256
pausemovetime = 256

[State 7530, fade in]
type = ModifyExplod
trigger1 = NumExplod(7514)
trigger1 = time <= 10
ID = 7514
postype = back
facing = 1
pos = -(Screenwidth/2) + time*(Screenwidth/10), ScreenHeight/2
trans = addalpha
alpha = 23 * time,256

[State 7530, in position]
type = ModifyExplod
trigger1 = NumExplod(7514)
trigger1 = (time = [11,58])
ID = 7514
postype = back
facing = 1
pos = Ceil((Screenwidth/2) + (time-11)*0.5), ScreenHeight/2
scale = (0.6 + (time-11)*0.001) * Const(size.xscale), (0.6 + (time-11)*0.001) * Const(size.yscale)
trans = addalpha
alpha = 256,256

[State 7530, fade out]
type = ModifyExplod
trigger1 = NumExplod(7514)
trigger1 = (time = [59,66])
ID = 7514
postype = back
facing = 1
pos = Ceil((Screenwidth/2) + 47*0.5 + (time-59)*(Screenwidth/14.0)), ScreenHeight/2
scale = (0.65 + (time-59)*0.1) * Const(size.xscale), (0.65 + (time-59)*0.1) * Const(size.yscale)
trans = addalpha
alpha = (256 - 10*(time-58)),256

[State 7530, Ultra Sound Charge]
type = PlaySnd
trigger1 = time = 1
value = 7,9
volumescale = 100
channel = 6
abspan = 0

;--------- Spiral FX -----------
[State 7530, Main]
type = explod
trigger1 = !time
anim = 7500
ID = 7500
sprpriority = 5
space = stage
bindID = ID
removetime = 58
pausemovetime = 256
supermovetime = 256

[State 7530, Large Circle]
type = explod
trigger1 = !time
anim = 7501
ID = 7501
sprpriority = 5
space = stage
bindID = ID
removetime = 58
pausemovetime = 256
supermovetime = 256

[State 7530, Scale Main]
type = modifyexplod
trigger1 = numexplod(7500) && time <= 58
ID = 7500
scale = 1.5 -(0.025 * time), 1.5 -(0.025 * time)

[State 7530, Scale Large Circle]
type = modifyexplod
trigger1 = numexplod(7501) && time <= 58
ID = 7501
scale = 0.25 + (0.075 * time), 0.25 + (0.075 * time)
trans = addalpha
alpha = ceil(256 -6.4 * time), 256

[State 7530, Spiral]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7509
ID = 7509
name = "Super Charge Spiral"
postype = p1
pausemovetime = 256
supermovetime = 256
size.proj.doscale = ID
ownpal = 1


[State 7530, safe]
type = RemoveExplod
trigger1 = time > 66
trigger2 = Parent,StateNo != 3150

[State 7530, End]
type = destroyself
trigger1 = time > 70
trigger2 = Parent,StateNo != 3150


;========================< COUNTER F.X. >=============================
[Statedef 7400]
type = A
physics = N
anim = 9741

[State 7400, superchargebgpalfx]
type = allpalfx
trigger1 = !time
time = 8
add = 255, 255, 255
sinadd = -255, -255, -255, 32

[State 7400, slow]
type = pause
trigger1 = time < 8
time = 1

[State 7400, End]
type = destroyself
trigger1 = time >= 8


;========================< SUPER FINISH >=============================
[Statedef 7600]
type = A
velset = 0, 0
anim = 9741

[State 7600, Bind]
type = posset
trigger1 = 1
x = 0
y = Ceil((pos y -screenpos y)+(GameHeight/2.0))

[State 7600, Snd]
type = playsnd
trigger1 = !time
value = 7, 7
channel = 1

[State 7600, Snd]
type = sndpan
trigger1 = time <= 80
channel = 1
abspan = ceil(sin(gametime / 20.0 * pi) * 160)

[State 7600, Snd]
type = assertspecial
trigger1 = time <= 80
flag = nomusic

[State 7600, BGPalfx]
type = bgpalfx
trigger1 = time < 28
time = 1
mul = 0,0,0

[State 7600, bgpalfx]
type = bgpalfx
trigger1 = time = [28,60]
time = 1
mul = (time-28)*8,(time-28)*8,(time-28)*8

[State 7600, MvC]
type = explod
trigger1 = !time
anim = 7601
ID = 7601
ontop = 1
space = screen
facing = 1
pos = 0,0
scale = 1, (1.3333333 * screenheight / screenwidth)
bindtime = -1
removetime = 20
pausemovetime = -1
supermovetime = -1

[State 7600, Fade]
type = modifyexplod
trigger1 = numexplod(7601)
ID = 7601
trans = addalpha
alpha = ifelse(time < 10, 256, ceil(256 -(time -10) * 25.6)), 256

[State 7600, Circle]
type = explod
trigger1 = !time
anim = 7600
ID = 7600
sprpriority = -255
space = screen
facing = 1
pos = screenwidth/2, floor((1.3333333 * screenheight / screenwidth) * 120)
bindtime = -1
removetime = 20
pausemovetime = -1
supermovetime = -1

[State 7600, Scale]
type = modifyexplod
trigger1 = numexplod(7600)
ID = 7600
scale = (0.25 * time) * (1.3333333 * screenheight / screenwidth), (0.25 * time) * (1.3333333 * screenheight / screenwidth)
trans = addalpha
alpha = ceil(256 -12.8 * time), 256


;------ Kanji Super Move names ---------

[State 7600, Move Name: Custom Combo]
type = VarSet
trigger1= !Time && Const(size.proj.doscale) = 20
var(0) = 1

[State 7600, Move Name: shinku_hadoken]
type = VarSet
trigger1= !Time && Const(size.proj.doscale) = 3005
var(0) = 2

[State 7600, Move Name: Denjin_Hadoken]
type = VarSet
trigger1= !Time && Const(size.proj.doscale) = 3025
var(0) = 3

[State 7600, Move Name: Nidan_Shoryuusuki]
type = VarSet
trigger1= !Time && Const(size.proj.doscale) = 3100
var(0) = 4

[State 7600, Move Name: Shin_Shoryuken]
type = VarSet
trigger1= !Time && Const(size.proj.doscale) = 3120
var(0) = 5

[State 7600, Move Name: reppujinraishou]
type = VarSet
trigger1= !Time && Const(size.proj.doscale) = 3180
var(0) = 6

[State 7600, Move Name: shinku_tasupaki]
type = VarSet
trigger1= !Time && Const(size.proj.doscale) = 3200
var(0) = 7

[State 7600, Move Name: Metsu_Hadoken]
type = VarSet
trigger1= !Time && (Const(size.proj.doscale) = [3045,3055])
var(0) = 11

[State 7600, Move Name: Messatsu_Goshoryu]
type = VarSet
trigger1= !Time && Const(size.proj.doscale) = 3140
trigger2= !Time && Const(size.proj.doscale) = 3150
var(0) = 12

[State 7600, metsu_shoryuuken]
type = VarSet
trigger1= !Time && Const(size.proj.doscale) = 3160
var(0) = 13

[State 7600, SGS]
type = VarSet
trigger1= !Time && Const(size.proj.doscale) = 4001
var(0) = 14

[State 7600, debug]
type = displaytoclipboard
trigger1 = 1
text = "root var(51) %d, var(0) = %d"  
params = root,var(51), var(0)
ignorehitpause = 1

[State 7600, Text Layer 1 fixed]
type = Explod
trigger1 = !Time && var(0)
anim = 8620 + var(0)
ID = 10
onTop = 1
Space = Screen
facing = 1
pos = ScreenWidth/2, ScreenHeight/2
scale = 0.32, 0.32
bindTime = -1
removeTime = 100
pauseMoveTime = -1
superMoveTime = -1

[State 7600, Text Layer2 grow]
type = Explod
trigger1 = !Time && var(0)
anim = 8620 + var(0)
ID = 11
onTop = 1
Space = Screen
facing = 1
pos = ScreenWidth/2, ScreenHeight/2
scale = 0.32, 0.32
bindTime = -1
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 7600, Text 1 fix Fade]
type = ModifyExplod
trigger1 = NumExplod(10)
ID = 10
scale = 0.32 + (0.002 * Time), 0.32 + (0.002 * Time)
trans = AddAlpha
alpha = ifElse(Time < 28, 256, 256 - 8 * (Time - 28)), 256

[State 7600, Text 2 grow Fade]
type = ModifyExplod
trigger1 = NumExplod(11)
ID = 11
scale = 0.32 + (0.0625 * Time), 0.32 + (0.0625 * Time)
trans = AddAlpha
alpha = 256 - (32 * Time), 256


;---------------------------------------


[State 7600, safety]
type = removeexplod
trigger1 = time > 60 && numexplod
trigger2 = roundstate != 3

[State 7600, nobars]
type = assertspecial
trigger1 = time <= 40
flag = nobardisplay
flag2 = noFG
flag3 = globalnoshadow

[State 7600, end]
type = destroyself
trigger1 = roundstate != 3


;========================< KANJI B.G. >=============================
[Statedef 7610]
physics = N
velset = 0, 0
anim = 9741

[State 7610, Assert]
type = assertspecial
trigger1 = time < 120
flag = nomusic

[State 7610, Snd]
type = playsnd
trigger1 = !time
value = 7, 8

[State 7610, black]
type = bgpalfx
trigger1 = time < 120
time = 2
add = -255, -255, -255

[State 7610, black]
type = bgpalfx
trigger1 = time = 120
time = 60
add = -255, -255, -255
sinadd = 255, 255, 255, 240

[State 7610, Fade]
type = palfx
trigger1 = time = 120
time = 60
sinadd = -255, -255, -255, 240

[State 7610, Kanji]
type = explod
trigger1 = !time
anim = 7610
ID = 7610
sprpriority = -5
space = screen
facing = 1
pos = screenwidth/2, Ceil(screenheight/2)
scale = 0.5 * (1.3333333 * screenheight / screenwidth), 0.5 * (1.3333333 * screenheight / screenwidth)
bindtime = -1

[State 7610, Shrink]
type = modifyexplod
trigger1 = time < 6
ID = 7610
scale = (5.5 - time) * (1.3333333 * screenheight / screenwidth), (5.5 - time) * (1.3333333 * screenheight / screenwidth)

[State 7610, Shrink]
type = modifyexplod
trigger1 = time >= 6
ID = 7610
scale = 0.5 * (1.3333333 * screenheight / screenwidth), 0.5 * (1.3333333 * screenheight / screenwidth)

[State 7610, flamebg]
type = explod
trigger1 = !time
anim = 7611
ID = 7611
sprpriority = 5
postype = left
pos = 0, floor((screenheight / screenwidth) * 80) - 60
bindtime = -1
removetime = -1
pausemovetime = 300
supermovetime = 300

[State 7610, Assert]
type = assertspecial
trigger1 = 1
flag = invisible
flag2 = nobardisplay
ignorehitpause = 1

[State 7610, Assert]
type = assertspecial
trigger1 = time < 120
flag = noFG
ignorehitpause = 1

[State 7610, Safety]
type = removeexplod
trigger1 = time >= 180

[State 7610, End]
type = destroyself
trigger1 = time >= 180


;========================< CAMERA CONTROL >=============================
[Statedef 7650]
physics = N
velset = 0, 0
anim = 9741

[State 7650, bound]
type = screenbound
trigger1 = 1
value = 0
movecamera = 1, 1

[State 7650, End]
type = destroyself
trigger1 = roundstate = 2



; = = = = = = = = = = = = <Beterhans General Zoom Controler for Super>= = = = = = = = = = 
[Statedef 7660]
type = A
physics = N
movetype = I
velset = 0,0
anim = 9741
sprpriority = -4

;Only use this helper with player or a player helper
;Super zoom in effect.
;var(5)	Camera Action State	-1 mean exit and close (0 is zoom in 1 is stay 2 is zoom out 3 is destroy)
;var(6)	Camera Counter for var(5) State
;var(7) Camera Counter for shake
;var(8) Focus Point x
;var(9) Focus Point y
;var(10) is Parent Var(10)
;var(11) is zoom in / fade in time
;var(12) is zoom out / fade out time
;Var(40) is Parent ID or Target ID
;--------------------------------------
;fvar(13) is (Target zoom level - 1)
;fvar(5) is zoom in step values
;fvar(15) is zoom out step values
;fvar(21) is (1 - Camzer zoom level)
;fvar(22) final value of relative zoom factor which used in zoom controller


;---------- Parent Check ----------------
[State Parent Check 1]
type = varset
trigger1 = var(40) = 0
trigger1 = PlayerIDExist(Const(size.proj.doscale))
var(40) = Const(size.proj.doscale)
ignoreHitPause = 1

[State Parent Check 2]
type = varset
trigger1 = var(40)
trigger1 = PlayerIDExist(Const(size.proj.doscale)) = 0
var(40) = 0
ignoreHitPause = 1

;------- Control system camera -----------
[State 7660, bound]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1,1
ignoreHitPause = 1

[State 7660, Safety]
type = null;AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noFG
flag3 = nobardisplay

;------- set config values -----------
[State 7660, get-var10]
type = varset
trigger1 = !time
var(10) = parent,var(10)
persistent = 0

;---- Uncommint compensation to allow Abszoom ----
[State 7660, compensation zoom var]
type = varset
trigger1 = CameraZoom > 0 && CameraZoom < 1
fvar(21) = (1 - CameraZoom)

[State 7660, compensation zoom var]
type = varset
trigger1 = CameraZoom >= 1
fvar(21) = 0

;---- Uncommint compensation to allow Abszoom ----


[State 7660, set fadin time]
type = varset
trigger1 = !time
var(11) = 12 + var(10)
persistent = 0

[State 7660, set fadout time]
type = varset
trigger1 = !time
var(12) = 12 + var(10)
persistent = 0

[State 7660, set target zoom level]
type = varset
trigger1 = !time
fvar(13) = fvar(21) + 0.5

[State 7660, calcuate zoomin step size]
type = varset
trigger1 = !time
fvar(5) = fvar(13) / var(11)

[State 7660, calcuate zoomout step size]
type = varset
trigger1 = !time
fvar(15) = fvar(13) / var(12)

;------------- INIT Finished -----------------

;------------- Camera Phase control var(5) ---------
[State 7660, Exit for unexpected reasons]
type = varset
triggerall = var(5) != -1
trigger1 = !var(40); Parent or Target not existed
trigger1 = var(6) := 1
var(5) = -1

[State 7660, Change zoom State 1]; 
type = varadd
triggerall = var(5) >= 0
trigger1 = var(5) = 0 && var(11) <= 0
trigger2 = var(5) = 2 && var(12) <= 0
var(5) = 1

[State 7660, Change zoom State 2 zoom out]; no super charge helper found zoom out
type = varadd
triggerall = var(5) >= 0
trigger1 = var(5) = 1
trigger1 = !NumHelper(7500) && !NumHelper(7260)
var(5) = 1

;--------------- Pos Move and Binds ---------------
[State 7660, Init Pos]; alway zoom from camera pos to view it smoothly.
type = posset
trigger1 = !time
x = 0;camera always in middle of the screen
y = CameraPos y

[State 7660, fly to parent fad in];zoom in 
type = velset
trigger1 = !time
trigger1 = var(40) && var(5) = 0
x = (ParentDist x + (Const(Size.ground.front) * Const(Size.xScale) * 2.0 )) / var(11)
y = (ParentDist y + (Parent,P2Dist y / 3.0)) / var(11)
ignorehitpause = 1

[State 7660, bind to parent stay for 1]; stay and stop moving
type = BindToParent
trigger1 = var(40) && var(5) = 1
time = 1
facing = 1
pos = Floor(2 * Const(Size.ground.front) * Const(Size.xScale)), Floor(Parent,P2Dist y / 3.0 * Const(Size.yScale))
;pos = Parent,P2Dist x / 4.0, Parent,P2Dist y / 3.0
ignorehitpause = 1

[State 7660, move fadout]; zoom out move
type = velset
trigger1 = var(5) >= 2
trigger2 = var(5) = -1; In case error
x = (-Pos x * facing) / var(12)
y = (CameraPos y - Pos y) / var(12)
persistent = 0

;----------------- Compute zoom factor fvar(22) ---------------------
[State 7660, compute scale on error unexpected exit]
type = varset
triggerall = var(5) = -1
trigger1 = var(6) <= var(12)
fvar(22) = IFElse(fvar(22) <= 1, 1, 1 + (((fvar(22) - 1) / var(12)) * (var(12) - var(6))))
ignorehitpause = 1

[State 7660, Zoom in]; and - counter var(11)
type = VarSet
triggerall = var(5) >= 0
trigger1 = var(5) = 0 && var(11)
trigger1 = var(11):= var(11) - 1
fvar(22) = (1 + (fvar(13) - (fvar(5) * var(11))))
ignorehitpause = 1

[State 7660, Zoom keep]; no couter but triggered by supercharge helper disappear.
type = VarSet
triggerall = var(5) >= 0
trigger1 = var(5) = 0 && var(11) = 0
trigger2 = var(5) = 1
fvar(22) = (1 + (fvar(13) - (fvar(5) * var(11))))
ignorehitpause = 1

[State 7660, Zoom out]; and - counter var(12)
type = VarSet
triggerall = var(5) >= 0
trigger1 = var(5) = 2 && var(12)
trigger1 = var(12):= var(12) - 1
fvar(22) = (1 + (fvar(15) * var(12)))
ignorehitpause = 1



;---------------- Apply Zoom -------
[State 7660, Apply Zoom]
type = zoom
triggerall = fvar(22); needs to be >= 1
trigger1 = time >= 0
scale = fvar(22)
pos = ((pos x) / fvar(22)) * CameraZoom, ((pos y) -  (CameraPos y / fvar(22))) * CameraZoom
ignorehitpause = 1


;---------------- End --------------
[State 7660, end]
type = destroyself
trigger1 = var(5) = -1
trigger1 = var(6) > var(12); Unexpected finish
trigger2 = var(5) >= 3; normal exit

[State 7660, Debug 1]
type = displaytoclipboard
trigger1 = 1
text = "X=%d, Y=%d,fvar(22)=%d ,CAMZOM=%d, fvar(21)=%d"  
params = pos x, pos y, fvar(22) , CameraZoom, fvar(21)
ignorehitpause = 1

[State 7660, Debug 2]
type = appendtoclipboard
trigger1 = 1
text = "\nActSTAT=%d, COUNT=%d, var(12)=%d, fvar(15)=%d, fvar(13)=%d"  
params = var(5),var(6),var(12),fvar(15),fvar(13)
ignorehitpause = 1


;------- Run Counter must put at end--------
[State 7660, Counter var6 add 1]
type = varadd
trigger1 = var(6) != 0
var(6) = 1

[State 7660, Counter var7 add 1]
type = varadd
trigger1 = var(7) != 0
var(7) = 1


; = = = = = = = = = = = = <Zoom Controler for 3160 Shin Shoryuken (滅・昇龍拳) >= = = = = = = = = = 
;Only use this helper with player or a player helper
;Super zoom in effect.
[Statedef 7664]
type = A
physics = N
movetype = I
velset = 0,0
anim = 9741
sprpriority = 4

;Only use this helper with player or a player helper
;Super zoom in effect.
;var(5)	Camera Action State
;var(6)	Camera Counter at start
;var(7) Shake counter
;var(8) Temp focus point x
;var(9) Temp focus point y
;var(10) is Parent Var(10)
;var(11) is zoom in / fade in time
;var(12) is zoom out / fade out time
;var(21) is Ground level (Only use on Ground)
;Var(40) is Parent ID
;--------------------------------------
;fvar(13) is (Target zoom level - 1)
;fvar(14) is zoom in step values
;fvar(15) is zoom out step values
;fvar(21) is (1 - Camzer zoom level)
;fvar(22) relative zoom factor

;---------- Parent Check ----------------
[State Parent/Target Check 1]
type = varset
trigger1 = var(40) = 0
trigger1 = PlayerIDExist(Const(size.proj.doscale))
var(40) = Const(size.proj.doscale)
ignoreHitPause = 1

[State Parent/Target Check 2]
type = varset
trigger1 = var(40)
trigger1 = PlayerIDExist(Const(size.proj.doscale)) = 0
var(40) = 0
ignoreHitPause = 1

[State 7675, Safety]
type = AssertSpecial
trigger1 = var(5) = [0,3]
flag = noshadow
flag2 = noFG
flag3 = nobardisplay
ignorehitpause = 1

[State 7675, bound]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1,1
ignorehitpause = 1

;------ fvar(21) --
[State 7675, min zoom var]
type = varset
triggerall = CameraZoom > 0 && CameraZoom < 1
trigger1 = 1
fvar(21) = (1 - CameraZoom)
ignorehitpause = 1

[State 7675, min zoom var]
type = varset
triggerall = CameraZoom <= 0 || CameraZoom >= 1
trigger1 = 1
fvar(21) = 0
ignorehitpause = 1

;------- Mini State Change -------
[State 7664, Error Exit]
type = varset
triggerall = var(5) != -1
trigger1 = !(PlayerID(var(40)),StateNo = 3162 || (PlayerID(var(40)),StateNo = [5000,5099]))
trigger1 = var(6):= 1
trigger2 = !(Parent,StateNo = 3160 || Parent,StateNo = 3161)
triiger2 = var(6):= 1
var(5) = -1

[State 7664, Stage 0];Start
type = varset
triggerall = var(5) = 0 && var(6) = 0
trigger1 = Parent,Anim = 3160 && Parent,AnimElemTime(7) >= 0
var(6) = 1
ignorehitpause = 1

[State 7664, Stage 0]; Charge
type = varset
triggerall = var(5) = 0 && var(6)
trigger1 = Parent,Anim = 3161 && Parent,AnimElemTime(9) >= 0
trigger1 = var(6) := 1
var(5) = 1
ignorehitpause = 1

[State 7664, Stage 0]; Strike
type = varset
triggerall = var(5) = 1 && var(6)
trigger1 = Parent,Anim = 3161 && Parent,AnimElemTime(10) = 2
trigger1 = var(6) := 1
var(5) = 2
ignorehitpause = 1


[State 7664, Stage 0]; Zoom Out
type = varset
triggerall = var(5) = 2 && var(6)
trigger1 = Parent,Anim = 3161 && Parent,AnimElemTime(13) = 0
trigger1 = var(6) := 1
var(5) = 3
ignorehitpause = 1



;---------------------------------


;----------- Pos Moves -----------

[State 7664, Move to Player]
type = posset
trigger1 = var(5) = 0 && (var(6) = [1,9])
x = ((Parent,Pos x) + 35 * Const(Size.xscale) * facing) / 9.0 * var(6)
y = ((Parent,Pos y - 10) * Const(Size.yscale)) / 9.0 * var(6)
ignorehitpause = 1


[State 7664, Move to Strike UP]
type = posset
trigger1 = var(5) = 2 && (var(6) = [1,5])
x = (Parent,Pos x + 35 * Const(Size.xscale) * facing) + (6 * Const(Size.xscale) * facing / 5.0 * var(6))
y = ((Parent,Pos y - 10) * Const(Size.yscale)) - (30 * Const(Size.xscale) / 5.0 * var(6))
ignorehitpause = 1

[State 7664, Zoom out sync y]
type = posset
trigger1 = var(5) = 3
trigger1 = var(6) = [1,12]
x = Parent,Pos X
ignorehitpause = 1



;----------- BGPalfx ----------------

;----------- Compute the Scale ----
[State 7664, compute scale on exit]
type = varset
trigger1 = var(5) = -1 && var(6) = [1,31]
fvar(22) = IFElse(fvar(22) <= 1, 1, 1 + (((fvar(22) - 1)/30) * (31 - var(6))))
ignorehitpause = 1

[State 7664, Zoom when hit]
type = varset
trigger1 = var(5) = 0
trigger1 = var(6) = [1,9]
fvar(22) = (1 + fvar(21) + (0.7 / 9.0 * var(6)) );+0.7 is last result value
ignorehitpause = 1

[State 7664, Zoom charge]
type = varset
trigger1 = var(5) = 1
trigger1 = var(6) = [1,20]
fvar(22) = (1 + fvar(21) + 0.7 + (1 / 20.0 * var(6)) );+1.7 is last result value
ignorehitpause = 1

[State 7664, Zoom out]
type = varset
trigger1 = var(5) = 3
trigger1 = var(6) = [1,20]
fvar(22) = 1 + ((fvar(21) + 1.7)/12) * (12 - var(6))
ignorehitpause = 1


;----------- Apply the Zoom -------
[State 7664, Zoom]
type = zoom
triggerall = fvar(22)
trigger1 = time
scale = fvar(22)
pos = ((pos x) / fvar(22)) * CameraZoom, ((pos y) -  (CameraPos y / fvar(22))) * CameraZoom
ignorehitpause = 1


;---------- End ------------
[State 7664, end]
type = destroyself
trigger1 = var(5) = -1 && var(6) > 30
trigger2 = var(5) = 3 && var(6) > 12
ignorehitpause = 1

;---------- Debug ----------
[State 7664, Debug 1]
type = displaytoclipboard
trigger1 = 1
text = "X=%d, Y=%d, CamY=%d, CamZ=%d, fvar(21)=%d fvar(22)=%d\n"  
params = pos x, pos y, CameraPos y, CameraZoom, fvar(21),fvar(22)
ignorehitpause = 1

[State 7664, Debug 2]
type = appendtoclipboard
trigger1 = 1
text = "Stage=%d, Count=%d, GameW=%d, GameH=%d"
params = var(5), var(6),GameWidth,GameHeight
;text = "GameWidth=%d, GameHeight=%d, fvar(22)=%d, var(5)=%d, var(6)=%d"  
;params = GameWidth,GameHeight,fvar(22),var(5),var(6)
ignorehitpause = 1


;------- Run Counter Must at the end--------
[State 7664, Counter var6 add 1]
type = varadd
trigger1 = var(6) != 0
var(6) = 1
ignorehitpause = 1



; = = = = = = = = = = = = <Zoom Controler for 3120 Shin Shoryuken (真・昇龍拳) >= = = = = = = = = = 
;Only use this helper with player or a player helper
;Super zoom in effect.
[Statedef 7663]
type = A
physics = N
movetype = I
velset = 0,0
anim = 9741
sprpriority = 4

;Only use this helper with player or a player helper
;Super zoom in effect.
;var(5)	Camera Action State
;var(6)	Camera Counter at start
;var(7) Shake counter
;var(8) Temp focus point x
;var(9) Temp focus point y
;var(10) is Parent Var(10)
;var(11) is zoom in / fade in time
;var(12) is zoom out / fade out time
;var(21) is Ground level (Only use on Ground)
;Var(40) is Parent ID
;--------------------------------------
;fvar(13) is (Target zoom level - 1)
;fvar(14) is zoom in step values
;fvar(15) is zoom out step values
;fvar(21) is (1 - Camzer zoom level)
;fvar(22) relative zoom factor

;---------- Parent Check ----------------
[State Parent/Target Check 1]
type = varset
trigger1 = var(40) = 0
trigger1 = PlayerIDExist(Const(size.proj.doscale))
var(40) = Const(size.proj.doscale)
ignoreHitPause = 1

[State Parent/Target Check 2]
type = varset
trigger1 = var(40)
trigger1 = PlayerIDExist(Const(size.proj.doscale)) = 0
var(40) = 0
ignoreHitPause = 1

[State 7675, Safety]
type = AssertSpecial
trigger1 = var(5) = [0,3]
flag = noshadow
flag2 = noFG
flag3 = nobardisplay
ignorehitpause = 1

[State 7675, bound]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1,1
ignorehitpause = 1

;------ fvar(21) --
[State 7675, min zoom var]
type = varset
triggerall = CameraZoom > 0 && CameraZoom < 1
trigger1 = 1
fvar(21) = (1 - CameraZoom)
ignorehitpause = 1

[State 7675, min zoom var]
type = varset
triggerall = CameraZoom <= 0 || CameraZoom >= 1
trigger1 = 1
fvar(21) = 0
ignorehitpause = 1

;------- Mini State Change -------
[State 7663, Error Exit]
type = varset
triggerall = var(5) != -1
trigger1 = PlayerID(var(40)),StateNo < 5000
trigger1 = var(6):= 1
trigger2 = !(Parent,StateNo = 3100 || Parent,StateNo = 3120)
triiger2 = var(6):= 1
var(5) = -1

[State 7663, Stage 0];Start
type = varset
triggerall = var(5) = 0 && var(6) = 0
trigger1 = Parent,Anim = 3120 && Parent,AnimElemTime(4)>= 0
trigger2 = Parent,Anim = 3101
var(6) = 1
ignorehitpause = 1

[State 7663, Stage 1]; Say Shin
type = varset
trigger1 = var(5) = 0 && var(6) > 0
trigger1 = Parent,Anim = 3121 && Parent,AnimElemTime(1) = 1
trigger1 = var(6):= 1
var(5) = 1
ignorehitpause = 1

[State 7663, State 2]; Shoryu ken hit
type = varset
trigger1 = var(5) = 1
trigger1 = Parent,Anim = 3121 && Parent,AnimElemTime(4) = -1
trigger1 = var(6):= 1
var(5) = 2
ignorehitpause = 1


[State 7663, State 3]; Zoom out
type = varset
trigger1 = var(5) = 2
trigger1 = Parent,Anim = 3121 && Parent,AnimElemTime(5) = 2
trigger1 = var(6):= 1
var(5) = 3
ignorehitpause = 1

[State 7663, State 4]; sync out
type = varset
trigger1 = var(5) = 3
trigger1 = Parent,Anim = 1111
trigger1 = pos y < Parent, pos y
trigger1 = var(6):= 1
var(5) = 4
ignorehitpause = 1

;---------------------------------


;----------- Pos Moves -----------
[State 7663, move to ground in case of error]
type = posset
trigger1 = var(5) = -1 && var(6) = 1
x = CameraPos x + (Pos x - CameraPos x)/30*(30 - var(6))
y = CameraPos y + (Pos y - CameraPos y)/30*(30 - var(6))
ignorehitpause = 1

[State 7663, move to pos 1]
type = PosSet
trigger1 = var(5) = 0 && var(6) = [1,8]
time = 1
x = (Parent,Pos x + 35 * Const(Size.xscale) * facing) / 8.0 * var(6)
y = (Parent,Const(Size.mid.pos.y) * Const(Size.yscale)) / 8.0 * var(6)
ignorehitpause = 1

[State 7663, move to pos 1]
type = PosAdd
trigger1 = var(5) = 1 && var(6) = [1,8]
time = 1
;x = (Parent,Pos x + 35 * Const(Size.xscale) * facing) / 8.0 * var(6)
y = ((Parent,Const(Size.head.pos.y) - Parent,Const(Size.mid.pos.y)) * Const(Size.yscale)) / 32.0
ignorehitpause = 1


[State 7663, move to pos 2 for shoryuken hits]
type = PosAdd
trigger1 = var(5) = 2 && var(6) = [1,8]
time = 1
y = -2 * Const(Size.yscale)
ignorehitpause = 1

[State 7663, save value]
type = varset
trigger1 = var(5)=2 && var(6) = 8
var(8) = ParentDist X
ignorehitpause = 1

[State 7663, save value]
type = varset
trigger1 = var(5)=2 && var(6) = 8
var(9) = ParentDist Y
ignorehitpause = 1

[State 7663, BindtoParent]
type = BindtoParent
trigger1 = var(5)=4
time = 1
pos = var(8)*facing,0

;----------- BGPalfx ----------------
[State 7663, BGPal fade dark]
type = BGPalFX
trigger1 = var(5) = 0
trigger1 = var(6) = [1,8]
time = 1
add = 0,0,0
mul = Floor(256 - ((192/8.0) * var(6))), Floor(256 - ((192/8.0) * var(6))), Floor(256 - ((192/8.0) * var(6)))
ignorehitpause = 1

[State 7663, BGPal fade dark]
type = BGPalFX
trigger1 = var(5) = [1,3]
trigger2 = var(5) = 0 && var(6) > 8
time = 1
add = 0,0,0
mul = 64,64,64
ignorehitpause = 1

[State 7663, BGPal fade dark]
type = BGPalFX
trigger1 = var(5) = 4
trigger1 = var(6) = [1,12]
time = 1
add = 0,0,0
mul = Floor(64 + (192/12)*var(6)), Floor(64 + (192/12)*var(6)), Floor(64 + (192/12)*var(6))
ignorehitpause = 1

;----------- Compute the Scale ----
[State 7663, compute scale on exit]
type = varset
trigger1 = var(5) = -1 && var(6) = [1,31]
fvar(22) = IFElse(fvar(22) <= 1, 1, 1 + (((fvar(22) - 1)/30) * (31 - var(6))))
ignorehitpause = 1

[State 7663, Zoom in when hit type 1]
type = varset
trigger1 = Parent,Anim = 3120
trigger1 = var(5) = 0
trigger1 = var(6) = [1,8]
fvar(22) = (1 + fvar(21) + (2 / 8.0 * var(6)) );+2 is last result value
ignorehitpause = 1

[State 7663, time to hit switch from 3101]
type = varset
trigger1 = var(39) = 0
trigger1 = !time && Parent,Anim = 3101
var(39) = Abs(Parent,AnimElemtime(6))
ignorehitpause = 1

[State 7663, Zoom in when hit type 1]
type = varset
trigger1 = Parent,Anim = 3101
trigger1 = var(5) = 0 && var(39)
trigger1 = Parent,AnimElemTime(6) < 0
fvar(22) = 1 + fvar(21) + (2.0 / var(39)) * (var(39) - Abs(Parent,AnimElemTime(6)))
ignorehitpause = 1

[State 7663, Zoom in 2nd hit]
type = varset
trigger1 = var(5) = 1
trigger1 = var(6) = [1,8]
fvar(22) = (1 + fvar(21) + 2 + (1/8.0)*var(6) );+3
ignorehitpause = 1

[State 7663, Zoom out a bit shoryuken hit]
type = varset
trigger1 = var(5) = 2
trigger1 = var(6) = [1,8]
fvar(22) = (1 + fvar(21) + 3 - (2.6/8.0)*var(6) );+0.4
ignorehitpause = 1

[State 7663, Zoom out all]
type = varset
trigger1 = var(5) = 3
trigger1 = var(6) = [1,30]
fvar(22) = 1 + ((fvar(21) + 0.4)/30) * (30 - var(6))
ignorehitpause = 1



;----------- Apply the Zoom -------
[State 6663, Zoom]
type = zoom
triggerall = fvar(22)
trigger1 = time
scale = fvar(22)
pos = ((pos x) / fvar(22)) * CameraZoom, ((pos y) -  (CameraPos y / fvar(22))) * CameraZoom
ignorehitpause = 1


;---------- End ------------
[State 7663, end]
type = destroyself
trigger1 = var(5) = -1 && var(6) > 30
trigger2 = var(5) = 4 && Pos y >= -10
ignorehitpause = 1

;---------- Debug ----------
[State 7663, Debug 1]
type = displaytoclipboard
trigger1 = 1
text = "X=%d, Y=%d, CamY=%d, CamZ=%d, fvar(21)=%d fvar(22)=%d\n"  
params = pos x, pos y, CameraPos y, CameraZoom, fvar(21),fvar(22)
ignorehitpause = 1

[State 7663, Debug 2]
type = appendtoclipboard
trigger1 = 1
text = "Stage=%d, Count=%d, GameW=%d, GameH=%d"
params = var(5), var(6),GameWidth,GameHeight
;text = "GameWidth=%d, GameHeight=%d, fvar(22)=%d, var(5)=%d, var(6)=%d"  
;params = GameWidth,GameHeight,fvar(22),var(5),var(6)
ignorehitpause = 1


;------- Run Counter Must at the end--------
[State 7663, Counter var6 add 1]
type = varadd
trigger1 = var(6) != 0
var(6) = 1
ignorehitpause = 1

[State 7663, Counter var7 add 1]
type = varadd
trigger1 = var(7) != 0
var(7) = 1
ignorehitpause = 1

;========================<Intro CAMERA CONTROL>=============================
[StateDef 8999]
type = S
velSet = 0,0
anim = 9741

[State 8999, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 1,1
ignoreHitPause = 1

[State 8999, End]
type = DestroySelf
trigger1 = RoundState = 2
