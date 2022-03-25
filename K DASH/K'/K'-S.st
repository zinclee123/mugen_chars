;=====================================================
; 扳机
;=====================================================
[Statedef 1000]
type    = S
movetype= A
physics = N
poweradd = 31
ctrl = 0
velset = 0,0
sprpriority = 2
facep2 = 1
anim = 1000

[State 0, VarAdd]
type = VarAdd
triggerall = time = 0
triggerall = var(51)>0
trigger1 = prevstateno >= 1000
var(51) = -128
persistent = 0
ignorehitpause = 1

[State 0, PalFX]
type = PalFX
triggerall = var(51)
triggerall = time < 8
trigger1 = prevstateno >= 1000 && var(51) > 0
time = 1
add = 255,255,255
sinadd = 0,0,0
invertall = 0
color = 256
ignorehitpause = 1
persistent = 2


[State 0, Explod]
type = Explod
trigger1 = animelemtime(3)=2
id = 3008
anim = 3008
pos = 0,0
sprpriority = -2
supermovetime = 9999
pausemovetime = 9999
ownpal = 1
removeongethit = 0
bindtime = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 1000,0
volume = 200
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 1000,1
volume = 200

[State 1000: Helper]
type = Helper
trigger1 = animelemtime(3) = 1
helpertype = Normal
name = "Eins Trigger Flame"
id = 1001
pos = 5, 0
postype = p1
facing = 1
stateno = 1001
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
persistent = 0

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 10
movetype = I

[State 0, VarSet]
type = VarSet
trigger1 = time = 1
v = 43
value = 0

;Second Shoot
[State 0, VarSet]
type = VarSet
triggerall = var(59) = 0
triggerall = Animelem = 4,>0 && Animelem = 8,<4
trigger1 = command = "holdfwd" && command = "a"
var(43) = 1

;Second Shell
[State 0, VarSet]
type = VarSet
triggerall = var(59) = 0
triggerall = Animelem = 4,>0 && Animelem = 8,<4
trigger1 = command = "holdfwd" && command = "b"
var(43) = 2

;Blackout Weak
[State 0, VarSet]
type = VarSet
triggerall = var(59) = 0
triggerall = Animelem = 4,>0 && Animelem = 8,<4
trigger1 = command = "holdback" && command = "a"
var(43) = 3

;Blackout Hard
[State 0, VarSet]
type = VarSet
triggerall = var(59) = 0
triggerall = Animelem = 4,>0 && Animelem = 8,<4
trigger1 = command = "holdback" && command = "b"
var(43) = 4

;Minute Spike W.
[State 0, VarSet]
type = VarSet
triggerall = var(59) = 0
triggerall = Animelem = 4,>0 && Animelem = 8,<4
trigger1 = command = "holdfwd" && command = "x"
var(43) = 5

;Minute Spike H.
[State 0, VarSet]
type = VarSet
triggerall = var(59) = 0
triggerall = Animelem = 4,>0 && Animelem = 8,<4
trigger1 = command = "holdfwd" && command = "y"
var(43) = 6

;Minute Spike W.
[State 0, VarSet]
type = VarSet
triggerall = var(59) = 0
triggerall = Animelem = 4,>0 && Animelem = 8,<4
trigger1 = command = "qcb_a"
var(43) = 7

;Minute Spike H.
[State 0, VarSet]
type = VarSet
triggerall = var(59) = 0
triggerall = Animelem = 4,>0 && Animelem = 8,<4
trigger1 = command = "qcb_b"
var(43) = 8

[State 0, ChangeState]
type = ChangeState
triggerall = Animelem = 7,>0 && Animelem = 8,<=3
trigger1 = var(43) = 1
value = 1005
ctrl = 0

[State 0, ChangeState]
type = ChangeState
triggerall = Animelem = 8,>0 && Animelem = 8,<=3
trigger1 = var(43) = 2
value = 1010
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = Animelem = 8,>0 && Animelem = 8,<=3
trigger1 = var(43) = 3
value = 1020
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = Animelem = 8,>0 && Animelem = 8,<=3
trigger1 = var(43) = 4
value = 1025
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = Animelem = 8,>0 && Animelem = 8,<=3
trigger1 = var(43) = 5
value = 1030
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = Animelem = 8,>0 && Animelem = 8,<=3
trigger1 = var(43) = 6
value = 1035
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = Animelem = 8,>0 && Animelem = 8,<=3
trigger1 = var(43) = 7
value = 1040
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = Animelem = 8,>0 && Animelem = 8,<=3
trigger1 = var(43) = 8
value = 1045
ctrl = 0

[State 1000, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1



;=====================================================
; 扳机火花
;=====================================================
[Statedef 1001]
type = A
movetype = A
physics = N
ctrl = 0
velset = 0, 0
ownpal = 1
anim = 1001
sprpriority = 4

[State 7001, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1005, nothitby]
type = nothitby
trigger1 = 1
value = SCA
time = -1
ignorehitpause=1

[State 210, 1]
type = HitDef
trigger1 = animelem = 1
attr = S, SP
damage = 41*root,fvar(39),10
animtype = Hard
air.animtype = Up
guardflag = M
hitflag = MAF
priority = 3, Hit
sparkno = -1 ;s17002+(root,var(31)*10000)
sparkxy = -20, -40
hitsound = -1;s4,1
guardsound = -1;s3+(root,1*2), 13
guard.sparkno = -1;s17502+(root,var(31)*10000)
ground.type = Low
pausetime = 0,5
guard.pausetime = 0,3
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 24
guard.slidetime = 24
guard.ctrltime = 24
ground.velocity = -3,-6.5
guard.velocity = -11.1796875
air.type = High
air.velocity = -3, -6.5
air.hittime = 13
air.juggle = 0
getpower = 93,93
givepower = 16,16
id = 1000
nochainid = 1000,1005
air.fall = 1
fall = 1
fall.recover = 1
fall.recovertime = 120
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
Palfx.time       = 35
Palfx.add       = 40,-70,-200
Palfx.sinadd   = 40,30,0,10
Palfx.color     = 0
Palfx.invertall = 1
yaccel = .5

[State 3005, ContactSound]
type = PlaySnd
trigger1 = MoveContact && NumTarget
value = ifelse(MoveHit,4,5), ifelse(MoveHit,1,13)
persistent = 0

[State 3005, ContactSpark]
type = Explod
trigger1 = MoveContact && NumTarget
anim = ifelse(MoveHit,27002,27502)
ID = 27000
pos = 0,-50
postype = p2
facing = 1
bindtime = 1
removetime = -2
sprpriority = 4
shadow = 0,0,0
ownpal = 1
persistent = 0

[State 0, Projectile]
type = Projectile
trigger1 = !time
attr = S, SP
projanim = 1002
projpriority = 9999
projhitanim = -1
projremovetime = 15
offset = 0,0

[State 1411, VarSet]
type = ParentVarSet
trigger1 = numtarget(1000) && movehit
var(16) = 12
persistent = 0
ignorehitpause=1

[State 1411, VarSet]
type = ParentVarAdd
trigger1 = moveguarded
fvar(10) = 1200
persistent = 0
ignorehitpause=1

[State 1050, VarSet]
type = VarSet
trigger1 = 1
var(1) = movehit
ignorehitpause = 1

[State -2, Helper]
type = Helper
trigger1 = !numhelper(50000) && !numhelper(50001)
trigger1 = WinKO
helpertype = normal
name = "K.O."
ID = 50001
stateno = 50000
pos = 160,120
postype = left    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 999999999999
pausemovetime = 999999999999
ignorehitpause = 1

[State 1005, End]
type=destroyself
trigger1 = animtime = 0
trigger2 = (root, stateno = 1005) && root, animelem = 4
trigger3 = (root, stateno = 1010) && root, animelem = 3

;Second Shoot
[Statedef 1005]
type    = A
movetype = A
physics = N
poweradd = 31
ctrl = 0
velset = 0,0
sprpriority = 2
anim = 1005

[State 1000: Helper]
type = Helper
trigger1 = animelemtime(4) = 1
helpertype = Normal
name = "Second Shoot Proj"
id = 1007
pos = 89,-69
postype = p1
facing = 1
stateno = 1007
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
persistent = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 1005,0
volume = 200
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 1005,1
volume = 200

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 2
trigger2 = animelem = 3
x = 8

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 1006
ctrl = 0

[Statedef 1006]
type = S
movetype = I
physics = S
poweradd= 0
ctrl = 0
velset = 0,0
sprpriority = 2
anim = 1006

[State 300, Land]
type = PlaySnd
trigger1 = !time
value = 12,2

[State 852, PosSet]
type = PosSet
trigger1 = !time
y = 0

[State 220,2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Second Shoot Proj
[Statedef 1007]
type = A
movetype = A
physics = N
ctrl = 0
velset = 0, 0
ownpal = 1
anim = 1007
sprpriority = 4

[State 0, VelSet]
type = VelSet
trigger1 = parent,prevstateno = 1000
trigger1 = time = 1
x = 4

[State 0, VelSet]
type = VelSet
trigger1 = parent,prevstateno = 1015
trigger1 = time = 1
x = 7

[State 7001, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1005, HitOverride]
type=hitoverride
trigger1= 1
attr=SCA,AA,AP,AT
time=-1
stateno=stateno+1
ignorehitpause=1

[State 1005, HB]
type=hitby
trigger1= 1
value=SCA,NP,SP,HP
time=-1

[State 210, 1]
type = HitDef
trigger1 = animelem = 1
attr = S, SP
damage = 66 * root,fvar(39),10
animtype = Hard
air.animtype = Up
guardflag = M
hitflag = MAF
priority = 3, Hit
sparkno = -1;s17002+(root,var(31)*10000)
sparkxy = -20, 0
hitsound = -1;s4,1
guardsound = -1;s3+(root,var(32)*2), 13
guard.sparkno = -1;s17502+(root,var(31)*10000)
ground.type = Low
pausetime = 0,8
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 24
guard.slidetime = 24
guard.ctrltime = 24
ground.velocity = -11.1796875
guard.velocity = -11.1796875
air.type = High
air.velocity = -4.5, -8.5
air.hittime = 13
air.juggle = 0
getpower = 93,93
givepower = 16,16
id = 1005
nochainid = 1005
air.fall = 1
fall = 0
fall.recover = 1
fall.recovertime = 120
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
Palfx.time       = 35
Palfx.add       = 40,-70,-200
Palfx.sinadd   = 40,30,0,10
Palfx.color     = 0
Palfx.invertall = 1
yaccel = .5

[State 3005, ContactSound]
type = PlaySnd
trigger1 = MoveContact && NumTarget
value = ifelse(MoveHit,4,5), ifelse(MoveHit,1,13)
persistent = 0

[State 3005, ContactSpark]
type = Explod
trigger1 = MoveContact && NumTarget
anim = ifelse(MoveHit,27002,27502)
ID = 27000
pos = 0,-50
postype = p2
facing = 1
bindtime = 1
removetime = -2
sprpriority = 4
shadow = 0,0,0
ownpal = 1
persistent = 0

[State 1411, VarSet]
type = ParentVarSet
trigger1 = numtarget(1005) && movehit
var(16) = 12
persistent = 0
ignorehitpause=1

[State 1411, VarSet]
type = ParentVarAdd
trigger1 = moveguarded
fvar(10) = 1200
persistent = 0
ignorehitpause=1

[State 1050, VarSet]
type = VarSet
trigger1 = !time
var(0) = 2
ignorehitpause = 1

[State 1050, VarSet]
type = VarSet
trigger1 = 1
var(1) = movehit
ignorehitpause = 1

[State 1005, End]
type=changestate
trigger1= movecontact
value=stateno+1
ignorehitpause=1

[State 1005, End]
type=destroyself
trigger1= pos x!=[-200,200]

[Statedef 1008]
type=S
physics=N
movetype=A
ctrl=0
anim=1
sprpriority=4
velset =0,0

[State -2, Helper]
type = Helper
trigger1 = !numhelper(50000) && !numhelper(50001)
trigger1 = WinKO
helpertype = normal
name = "K.O."
ID = 50001
stateno = 50000
pos = 160,120
postype = left    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 999999999999
pausemovetime = 999999999999
ignorehitpause = 1

[State 1050, VarSet]
type = VarSet
triggerall = numtarget(1005) && var(1)
trigger1 = target(1005), ishelper = 0
var(0) = 1

[State 1005, End]
type=destroyself
trigger1= time = 1

;Second Shell
[Statedef 1010]
type    = S
movetype = A
physics = N
poweradd = 31
ctrl = 0
velset = 0,0
sprpriority = 2
anim = 1010

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 1010,0
volume = 200
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 1010,1
volume = 200

[State 0, Explod]
type = Explod
trigger1 = animelemtime(4)=0
anim = 1011
ID = 1011
pos = 0,0
postype = p1
bindtime = 1
scale = 1,1
sprpriority = 4
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 8
movetype = I

[State 210, 1]
type = HitDef
trigger1 = animelem = 4
trigger2 = animelem = 7
attr = S, SA
damage = 66 * fvar(39),10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAFP
priority = 4, Hit
sparkno = s27002
sparkxy = -10, -120
hitsound = s4,1
guardsound = s5, 13
guard.sparkno = s27502
ground.type = High
pausetime = 0,13
guard.pausetime = 0,11
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 32
ground.velocity = -2,-12
guard.velocity = -11.1796875
air.type = High
air.velocity = -2,-11.5
air.hittime = 13
air.juggle = 0
getpower = 31,31
givepower = 10,10
id = 1010
nochainid = 1010
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
Palfx.time       = 57
Palfx.add       = 40,-70,-200
Palfx.sinadd   = 40,30,0,10
Palfx.color     = 0
Palfx.invertall = 1
yaccel = 0.43
p2stateno = 5000

[State 1050, VarSet]
type = VarSet
trigger1 = 1
var(1) = movehit
ignorehitpause = 1

[State 1411, VarSet]
type = VarSet
trigger1 = numtarget(1010) && movehit
var(16) = 12
persistent = 0
ignorehitpause=1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;----------------------------------------
;Eins Trigger (Hard)
[Statedef 1015];Ok!
type    = S
movetype= A
physics = N
poweradd = 31
ctrl = 0
velset = 0,0
sprpriority = 2
facep2 = 1
anim = 1015

[State 0, VarAdd]
type = VarAdd
triggerall = var(51)
triggerall = !time
trigger1 = (prevstateno = [1000,2999]) && var(51)>0
var(51) = -128
persistent = 0
ignorehitpause = 1

[State 0, PalFX]
type = PalFX
triggerall = var(51)
triggerall = time < 8
trigger1 = (prevstateno = [1000,2999]) && var(51)>0
time = 1
add = 255,255,255
sinadd = 0,0,0
invertall = 0
color = 256
ignorehitpause = 1
persistent = 2


[State 0, Explod]
type = Explod
trigger1 = animelemtime(3)=2
id = 3008
anim = 3008
pos = 0,0
sprpriority = -2
supermovetime = 9999
pausemovetime = 9999
ownpal = 1
removeongethit = 0
bindtime = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 1000,0
volume = 200
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 1000,1
volume = 200

[State 1000: Helper]
type = Helper
trigger1 = animelemtime(3) = 1
helpertype = Normal
name = "Eins Trigger Flame"
id = 1016
pos = 10, 0
postype = p1
facing = 1
stateno = 1016
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
persistent = 0

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 10
movetype = I

[State 0, VarSet]
type = VarSet
trigger1 = time = 1
v = 43
value = 0

;Second Shoot
[State 0, VarSet]
type = VarSet
triggerall = var(59) = 0
triggerall = Animelem = 4,>0 && Animelem = 8,<4
trigger1 = command = "holdfwd" && command = "a"
var(43) = 1

;Second Shell
[State 0, VarSet]
type = VarSet
triggerall = var(59) = 0
triggerall = Animelem = 4,>0 && Animelem = 8,<4
trigger1 = command = "holdfwd" && command = "b"
var(43) = 2

;Blackout Weak
[State 0, VarSet]
type = VarSet
triggerall = var(59) = 0
triggerall = Animelem = 4,>0 && Animelem = 8,<4
trigger1 = command = "holdback" && command = "a"
var(43) = 3

;Blackout Hard
[State 0, VarSet]
type = VarSet
triggerall = var(59) = 0
triggerall = Animelem = 4,>0 && Animelem = 8,<4
trigger1 = command = "holdback" && command = "b"
var(43) = 4

;Minute Spike W.
[State 0, VarSet]
type = VarSet
triggerall = var(59) = 0
triggerall = Animelem = 4,>0 && Animelem = 8,<4
trigger1 = command = "holdfwd" && command = "x"
var(43) = 5

;Minute Spike H.
[State 0, VarSet]
type = VarSet
triggerall = var(59) = 0
triggerall = Animelem = 4,>0 && Animelem = 8,<4
trigger1 = command = "holdfwd" && command = "y"
var(43) = 6

;Minute Spike W.
[State 0, VarSet]
type = VarSet
triggerall = var(59) = 0
triggerall = Animelem = 4,>0 && Animelem = 8,<4
trigger1 = command = "qcb_a"
var(43) = 7

;Minute Spike H.
[State 0, VarSet]
type = VarSet
triggerall = var(59) = 0
triggerall = Animelem = 4,>0 && Animelem = 8,<4
trigger1 = command = "qcb_b"
var(43) = 8

[State 0, ChangeState]
type = ChangeState
triggerall = Animelem = 7,>0 && Animelem = 8,<=3
trigger1 = var(43) = 1
value = 1005
ctrl = 0

[State 0, ChangeState]
type = ChangeState
triggerall = var(59) = 0
triggerall = Animelem = 8,>0 && Animelem = 8,<=3
trigger1 = var(43) = 2
value = 1010
ctrl = 0

[State 0, ChangeState]
type = ChangeState
triggerall = var(59) = 0
trigger1 = Animelem = 8,>0 && Animelem = 8,<=3
trigger1 = var(43) = 3
value = 1020
ctrl = 0

[State 0, ChangeState]
type = ChangeState
triggerall = var(59) = 0
trigger1 = Animelem = 8,>0 && Animelem = 8,<=3
trigger1 = var(43) = 4
value = 1025
ctrl = 0

[State 0, ChangeState]
type = ChangeState
triggerall = var(59) = 0
trigger1 = Animelem = 8,>0 && Animelem = 8,<=3
trigger1 = var(43) = 5
value = 1030
ctrl = 0

[State 0, ChangeState]
type = ChangeState
triggerall = var(59) = 0
trigger1 = Animelem = 8,>0 && Animelem = 8,<=3
trigger1 = var(43) = 6
value = 1035
ctrl = 0

[State 0, ChangeState]
type = ChangeState
triggerall = var(59) = 0
trigger1 = Animelem = 8,>0 && Animelem = 8,<=3
trigger1 = var(43) = 7
value = 1040
ctrl = 0

[State 0, ChangeState]
type = ChangeState
triggerall = var(59) = 0
trigger1 = Animelem = 8,>0 && Animelem = 8,<=3
trigger1 = var(43) = 8
value = 1045
ctrl = 0

[State 1000, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Eins Trigger Proj
[Statedef 1016]
type = A
movetype = A
physics = N
ctrl = 0
velset = 0, 0
ownpal = 1
anim = 1001
sprpriority = 4

[State 7001, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1005, nothitby]
type=nothitby
trigger1= 1
value=SCA
time=-1
ignorehitpause=1

[State 210, 1]
type = HitDef
trigger1 = animelem = 1
attr = S, SP
damage = 50 * root,fvar(39),10
animtype = Hard
air.animtype = Up
guardflag = M
hitflag = MAF
priority = 3, Hit
sparkno = -1;s17002+(root,var(31)*10000)
sparkxy = -20, -40
hitsound = -1;s4,1
guardsound = -1;s3+(root,var(32)*2), 13
guard.sparkno = -1;s17502+(root,var(31)*10000)
ground.type = Low
pausetime = 0,4
guard.pausetime = 0,3
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -3
guard.velocity = -11.1796875
air.type = High
air.velocity = -3, -6.5
air.hittime = 13
air.juggle = 0
getpower = 93,93
givepower = 16,16
id = 1015
nochainid = 1015, 1005
air.fall = 1
fall = 0
fall.recover = 1
fall.recovertime = 120
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
Palfx.time       = 35
Palfx.add       = 40,-70,-200
Palfx.sinadd   = 40,30,0,10
Palfx.color     = 0
Palfx.invertall = 1
yaccel = .5

[State 3005, ContactSound]
type = PlaySnd
trigger1 = MoveContact && NumTarget
value = ifelse(MoveHit,4,5), ifelse(MoveHit,1,13)
persistent = 0

[State 3005, ContactSpark]
type = Explod
trigger1 = MoveContact && NumTarget
anim = ifelse(MoveHit,27002,27502)
ID = 27000
pos = 0,-50
postype = p2
facing = 1
bindtime = 1
removetime = -2
sprpriority = 4
shadow = 0,0,0
ownpal = 1
persistent = 0

[State 0, Projectile]
type = Projectile
trigger1 = !time
attr = S, SP
projanim = 1002
projpriority = 9999
projhitanim = -1
projremovetime = 15
offset = 0,0

[State 1411, VarSet]
type = ParentVarSet
trigger1 = numtarget(1000) && movehit
var(16) = 12
persistent = 0
ignorehitpause=1

[State 1411, VarSet]
type = ParentVarAdd
trigger1 = moveguarded
fvar(10) = 1200
persistent = 0
ignorehitpause=1

[State 1050, VarSet]
type = VarSet
trigger1 = 1
var(1) = movehit
ignorehitpause = 1

[State -2, Helper]
type = Helper
trigger1 = !numhelper(50000) && !numhelper(50001)
trigger1 = WinKO 
helpertype = normal
name = "K.O."
ID = 50001
stateno = 50000
pos = 160,120
postype = left    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 999999999999
pausemovetime = 999999999999
ignorehitpause = 1

[State 1005, End]
type=destroyself
trigger1 = animtime = 0
trigger2 = (root, stateno = 1005) && root, animelem = 4
trigger3 = (root, stateno = 1010) && root, animelem = 3

;Weak Blackout followup
[Statedef 1020]
type    = S
movetype = I
physics = N
poweradd =0
ctrl = 0
velset = 0,0
sprpriority = 2
anim = 1020

[State 750, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 1020,1
volume = 200

[State 65000: AfterImage]
type = AfterImage
trigger1 = animelem = 4
time = 16
length = 4
palbright = 0,0,0
palcontrast = 0,0,0
paladd = -100,-100,-100
timegap = 4
framegap = 1
trans = add1

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 3
trigger2 = animelem = 8
x = 21
[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 9
trigger2 = animelemtime(10)=0
x = 13
[State 0, PosAdd]
type = PosAdd
trigger1 = animelemtime(10)=1
x = 10
[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 11
x = 20

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 2
x = 5.5

[State 0, VelMul]
type = VelMul
trigger1 = animelemtime(11)>=0
x = 0.82393576882102272727272727272727

[State 0, VelSet]
type = VelSet
trigger1 = animtime = 0
x = 0

[State 0, PlayerPush]
type = PlayerPush
trigger1 = time < 15
value = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Hard Blackout followup
[Statedef 1025]
type    = S
movetype = I
physics = N
poweradd = 0
ctrl = 0
velset = 0,0
sprpriority = 2
anim = 1025

[State 750, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 1020,1
volume = 200

[State 65000: AfterImage]
type = AfterImage
trigger1 = animelem = 4
time = 12
length = 4
palbright = 0,0,0
palcontrast = 0,0,0
paladd = -100,-100,-100
timegap = 4
framegap = 1
trans = add1

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 3
x = 26
[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 9
x = 24

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 2
x = 10

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 9
x = 7.8077850341796875

[State 0, VelMul]
type = VelMul
trigger1 = animelemtime(9)>0
x = 0.92082135507562181081942031421307

[State 0, VelSet]
type = VelSet
trigger1 = animtime = 0
x = 0

[State 0, PlayerPush]
type = PlayerPush
trigger1 = time < 16
value = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Weak Minute Spike followup
[Statedef 1030];Ok!
type    = S
movetype= A
physics = N
poweradd= 0
ctrl = 0
velset = 0
sprpriority = 2
anim = 1030

[State 0, Explod]
type = Explod
trigger1 = animelem = 1
anim = 1033
ID = 1033
pos = 20, -150
postype = p1
bindtime = 1
scale = 1,0.8
sprpriority = 4
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 1000, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 1200,1

[State 210, 1]
type = HitDef
trigger1 = animelem = 3
trigger2 = animelem = 4
attr = S, SA
damage = 66 * fvar(39),10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAFP
priority = 6, Hit
sparkno = s27002
sparkxy = -10, -60
hitsound = s4,1
guardsound = s5, 13
guard.sparkno = s27502
ground.type = High
pausetime = 0,13
guard.pausetime = 0,11
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -4,-6
guard.velocity = -11.1796875
air.type = High
air.velocity = -4,-6
air.hittime = 13
air.juggle = 0
getpower = 31,31
givepower = 10,10
id = 1030
nochainid = 1030
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
Palfx.time       = 30
Palfx.add       = 40,-70,-200
Palfx.sinadd   = 40,30,0,10
Palfx.color     = 0
Palfx.invertall = 1
yaccel = 0.48

[State 1050, VarSet]
type = VarSet
trigger1 = 1
var(1) = movehit
ignorehitpause = 1

[State 1411, VarSet]
type = VarSet
trigger1 = numtarget(1030) && movehit
var(16) = 12
persistent = 0
ignorehitpause=1

[State 220,2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;Hard Minute Spike followup
[Statedef 1035];Ok!
type    = S
movetype= A
physics = N
poweradd= 0
ctrl = 0
velset = 0
sprpriority = 2
anim = 1035

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 4,9
volume = -50

[State 0, Explod]
type = Explod
trigger1 = animelem = 1
anim = 1037
ID = 1037
pos = 0,0
postype = p1
bindtime = -1
sprpriority = 5
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 0, Explod]
type = Explod
trigger1 = animelem = 3
anim = 1036
ID = 1036
pos = -20,10
postype = p1
bindtime = 15
scale = 1,1
sprpriority = 5
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 0, VelSet]
type = PosAdd
trigger1 = animelem = 3
x = 18

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 3
x = 12

[State 0, VelMul]
type = VelMul
trigger1 = animelemtime(3) > 0
x = 0.953125

[State 210, 1]
type = HitDef
trigger1 = animelem = 3
attr = A, SA
damage = 68 * fvar(39),10
animtype = back
air.animtype = back
guardflag = M
hitflag = MAF
priority = 4, Hit
sparkno = s17002+(1*10000)
sparkxy = -20, -80
hitsound = s5,3
guardsound = s3+(1*2), 13-(1)
guard.sparkno = s17502+(1*10000)
ground.type = High
pausetime = 12,13
guard.pausetime = 12,11
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -5.5, -8.5
guard.velocity = -11.1796875
air.type = High
air.velocity =-5.5, -8.5
air.hittime = 13
air.juggle = 0
getpower = 47,47
givepower = 16,16
id = 1030
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5
palfx.time = 30
palfx.add = 40,-70,-200
palfx.sinadd = 40,30,0,10
palfx.color = 0
palfx.invertall = 1

[State 0]
type = velset
trigger1 = AnimElem = 7
x = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = movehit = 1
value = 4,1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1



;Weak Minute Spike followup
[Statedef 1040];Ok!
type    = S
movetype= A
physics = N
poweradd= 0
ctrl = 0
velset = 0
sprpriority = 2
anim = 1040

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1030,0
volume = 200
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 1030,1
volume = -50

[State 0, Explod]
type = Explod
trigger1 = animelemtime(3) = 0
anim = 1031
ID = 1031
pos = 0,0
postype = p1
bindtime = 15
scale = 1,1
sprpriority = 5
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 0, Explod]
type = Explod
trigger1 = animelemtime(3) = 1
anim = 1032
ID = 1032
pos = 0,0
postype = p1
bindtime = 15
scale = 1,1
sprpriority = 5
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 4
statetype = A

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 4
x = 7.625

[State 0, VelMul]
type = VelMul
trigger1 = animelemtime(4) > 0
x = 0.953125

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 4
y = -2.5

[State 0, VelAdd]
type = VelAdd
trigger1 = animelemtime(4) > 0
y = 0.36

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 9
x = 10

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 11
x = 12

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 11
movetype = I

[State 210, 1]
type = HitDef
trigger1 = animelem = 4
attr = A, SA
damage = 68 * fvar(39),10
animtype = diagup
air.animtype = diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
sparkno = s17002+(var(31)*10000)
sparkxy = -20, -80
hitsound = s4,1
guardsound = s5, 12
guard.sparkno = s27502
ground.type = High
pausetime = 12,13
guard.pausetime = 12,11
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -5.5, -8.5
guard.velocity = -11.1796875
air.type = High
air.velocity =-5.5, -8.5
air.hittime = 13
air.juggle = 0
getpower = 47,47
givepower = 16,16
id = 1030
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5
palfx.time = 30
palfx.add = 40,-70,-200
palfx.sinadd = 40,30,0,10
palfx.color = 0
palfx.invertall = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = statetype = A
trigger1 = Vel Y + Pos Y >= 0
value = 1043
ctrl = 0

[Statedef 1043]
type = S
movetype = I
physics = S
poweradd= 0
ctrl = 0
velset = 0,0
sprpriority = 2
anim = 1043

[State 300, Land]
type = PlaySnd
trigger1 = !time
value = 12,2

[State 852, PosSet]
type = PosSet
trigger1 = !time
y = 0

[State 220,2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Hard Minute Spike followup
[Statedef 1045];Ok!
type    = S
movetype= A
physics = N
poweradd= 0
ctrl = 0
velset = 0
sprpriority = 2
anim = 1045

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1030,0
volume = 200
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 1030,1
volume = -50

[State 0, Explod]
type = Explod
trigger1 = animelemtime(3) = 0
anim = 1031
ID = 1031
pos = 0,0
postype = p1
bindtime = 15
scale = 1,1
sprpriority = 5
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 0, Explod]
type = Explod
trigger1 = animelemtime(3) = 1
anim = 1036
ID = 1036
pos = 0,0
postype = p1
bindtime = 15
scale = 1,1
sprpriority = 5
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 4
statetype = A

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 4
x = 9.53125

[State 0, VelMul]
type = VelMul
trigger1 = animelemtime(4) > 0
x = 0.953125

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 4
y = -4

[State 0, VelAdd]
type = VelAdd
trigger1 = animelemtime(4) > 0
y = 0.45

[State 0, PosAdd]
type = PosAdd
trigger1 = animelemtime(11)=0
trigger2 = animelemtime(11)=1
x = 12

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 12
trigger2 = animelem = 13
x = 9

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 11
movetype = I

[State 210, 1]
type = HitDef
trigger1 = animelem = 4
attr = A, SA
damage = 68 * fvar(39),10
animtype = diagup
air.animtype = diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
sparkno = s17002+(var(31)*10000)
sparkxy = -20, -80
hitsound = s4,1
guardsound = s5, 12
guard.sparkno = s27502
ground.type = High
pausetime = 12,13
guard.pausetime = 12,11
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -5.5, -8.5
guard.velocity = -11.1796875
air.type = High
air.velocity =-5.5, -8.5
air.hittime = 13
air.juggle = 0
getpower = 47,47
givepower = 16,16
id = 1030
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5
palfx.time = 30
palfx.add = 40,-70,-200
palfx.sinadd = 40,30,0,10
palfx.color = 0
palfx.invertall = 1


[State 0, ChangeState]
type = ChangeState
trigger1 = statetype = A
trigger1 = Vel Y + Pos Y >= 0
value = 1046
ctrl = 0

[Statedef 1046]
type = S
movetype = I
physics = S
poweradd= 0
ctrl = 0
velset = 0,0
sprpriority = 2
anim = 1047

[State 300, Land]
type = PlaySnd
trigger1 = !time
value = 2+(var(32)*10),2

[State 852, PosSet]
type = PosSet
trigger1 = !time
y = 0

[State 220,2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;-------------------------------------------------------------------------------
;Weak Blackout
[Statedef 1100]
type    = S
movetype = I
physics = N
poweradd = 150
ctrl = 0
velset = 0,0
sprpriority = 2
anim = 1100

[State 750, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 0, VarAdd]
type = VarAdd
triggerall = !time
trigger1 = (prevstateno = [1000,2999]) && var(51)>0
var(51) = -128
persistent = 0
ignorehitpause = 1

[State 0, PalFX]
type = PalFX
triggerall = var(51)
triggerall = time < 8
trigger1 = (prevstateno = [1000,2999]) && var(51)>0
time = 1
add = 255,255,255
sinadd = 0,0,0
invertall = 0
color = 256
ignorehitpause = 1
persistent = 2


[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1100,0
volume = 200
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 1020,1
volume = 200

[State 65000: AfterImage]
type = AfterImage
trigger1 = animelem = 5
time = 16
length = 4
palbright = 0,0,0
palcontrast = 0,0,0
paladd = -100,-100,-100
timegap = 4
framegap = 1
trans = add1

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 4
x = 5

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 10
trigger2 = animelem = 11
trigger3 = animelem = 12
trigger4 = animelem = 13
x = 9

[State 0, VelMul]
type = VelMul
trigger1 = animelemtime(14)>=0
x = 0.82393576882102272727272727272727

[State 0, VelSet]
type = VelSet
trigger1 = animtime = 0
x = 0

[State 0, PlayerPush]
type = PlayerPush
trigger1 = time < 23
value = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1


;Hard Blackout
[Statedef 1105]
type    = S
movetype = I
physics = N
poweradd = 200
ctrl = 0
velset = 0,0
sprpriority = 2
anim = 1105

[State 750, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 0, VarAdd]
type = VarAdd
triggerall = !time
trigger1 = (prevstateno = [1000,2999]) && var(51)>0
var(51) = -128
persistent = 0
ignorehitpause = 1

[State 0, PalFX]
type = PalFX
triggerall = var(51)
triggerall = time < 8
trigger1 = (prevstateno = [1000,2999]) && var(51)>0
time = 1
add = 255,255,255
sinadd = 0,0,0
invertall = 0
color = 256
ignorehitpause = 1
persistent = 2


[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1100,0
volume = 200
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 1020,1
volume = 200

[State 65000: AfterImage]
type = AfterImage
trigger1 = animelem = 5
time = 22
length = 4
palbright = 0,0,0
palcontrast = 0,0,0
paladd = -100,-100,-100
timegap = 4
framegap = 1
trans = add1

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 4
x = 10

[State 0, VelMul]
type = VelMul
trigger1 = animelemtime(14)>=0
x = 0.82393576882102272727272727272727

[State 0, VelSet]
type = VelSet
trigger1 = animtime = 0
x = 0

[State 0, PlayerPush]
type = PlayerPush
trigger1 = time < 34
value = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;----------------------------------------
;Crow Bite Weak
[Statedef 1200];Ok!
type    = S
movetype= A
physics = N
poweradd = 93
ctrl = 0
velset = 0
sprpriority = 2
facep2 = 1
anim = 1200

[State 0, VarAdd]
type = VarAdd
triggerall = !time
trigger1 = (prevstateno = [1000,2999]) && var(51)>0
var(51) = -128
persistent = 0
ignorehitpause = 1

[State 0, PalFX]
type = PalFX
triggerall = var(51)
triggerall = time < 8
trigger1 = (prevstateno = [1000,2999]) && var(51)>0
time = 1
add = 255,255,255
sinadd = 0,0,0
invertall = 0
color = 256
ignorehitpause = 1
persistent = 2


[State 1000, 1]
type = PlaySnd
trigger1 = animelem = 1
value = 1200,0
channel = 0
volume = 200

[State 1000, 1]
type = PlaySnd
trigger1 = animelem = 5
value = 1200,1
volume = 200

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 11
movetype = I

[State 0, HitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
value = SCA, AA, AP, AT

[State 0, Explod]
type = Explod
trigger1 = animelemtime(5) = 1
anim = 1202
ID = 1202
pos = -6,13
postype = p1
bindtime = 17
scale = 1,1
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 0, Explod]
type = Explod
trigger1 = animelem = 8
anim = 1203
ID = 1203
pos = 20,5
postype = p1
bindtime = 22
scale = 1,1
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 4
x = 10

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 7
x = 6

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 9
statetype = A

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 9
y = -6

[State 0, VelAdd]
type = VelAdd
trigger1 = animelemtime(9) > 0
y = 0.6

[State 1000,飛ぶ道具ヘルパー呼び出し] 
type = Helper
trigger1 = animelem = 4
id = 1204
name = "?升?相?"
sprpriority = 5
pos = 0,0
postype = p1
stateno = 1204
helpertype = normal
pausemovetime = 0
ignorehitpause = 1
persistent = 0
keyctrl = 0
ownpal = 1

[state 当helper?肉的?候，本体模??肉]
type = changeanim
trigger1 = helper(1204),hitpausetime > 0
value = anim
elem = animelemno(0)

[State 210, 1]
type = null;HitDef
trigger1 = animelem = 4
attr = S, SA
damage = 70 * fvar(39),10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 5, Hit
sparkno = s27002
sparkxy = -20, -60
hitsound = 0
guardsound = s5, 13
guard.sparkno = s17502+(1*10000)
ground.type = High
pausetime = 12,13
guard.pausetime = 12,11
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -4.5,-6.5
guard.velocity = -11.1796875
air.type = High
air.velocity = -4.5,-6.5
air.hittime = 13
air.juggle = 0
getpower = 47,47
givepower = 16,16
id = 1200
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
Palfx.time       = 56
Palfx.add       = 40,-70,-200
Palfx.sinadd   = 40,30,0,10
Palfx.color     = 0
Palfx.invertall = 1
yaccel = 0.5
p2stateno = 5000

[State 210, 1]
type = HitDef
trigger1 = animelem = 8 || animelem = 9
attr = A, SA
damage = 40 * fvar(39),10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 8, Hit
sparkno = s17002+(1*10000)
sparkxy = -20, -70
hitsound = 0
guardsound = s3+(1*2), 13
guard.sparkno = s17502+(1*10000)
ground.type = High
pausetime = 8,9
guard.pausetime = 8,7
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -2,-11.2
guard.velocity = -11.1796875
air.type = High
air.velocity = -2,-11
air.hittime = 13
air.juggle = 0
getpower = 47,47
givepower = 16,16
id = 1201
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
Palfx.time       = 56
Palfx.add       = 40,-70,-200
Palfx.sinadd   = 40,30,0,10
Palfx.color     = 0
Palfx.invertall = 1
persistent = 0
yaccel = 0.5
p2stateno = 5000

[State 1000: Helper]
type = PlaySnd
triggerall = numhelper(247)
triggerall = helper(247), var(1) = 1
trigger1 = helper(1204),numtarget(1200)
trigger2 = numtarget(1201)
value = 4,1
ignorehitpause = 1

[State 1000: Helper]
type = PlaySnd
triggerall = numhelper(247)
triggerall = helper(247), var(1) = 1
trigger1 = helper(1204),numtarget(1200)
trigger2 = numtarget(1201)
value = 3+(1*2),3
ignorehitpause = 1

[State 1000, 6]
type = ChangeState
trigger1 = statetype = A
trigger1 = Vel Y + Pos Y >= 0
value = 1201
ctrl = 0

[Statedef 1201]
type = S
movetype = I
physics = S
poweradd= 0
ctrl = 0
velset = 0,0
sprpriority = 2
anim = 1201

[State 300, Land]
type = PlaySnd
trigger1 = !time
value = 12,2

[State 852, PosSet]
type = PosSet
trigger1 = !time
y = 0

[State 220,2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;------------------------------------------------------------------------

[Statedef 1204];こっちはヘルパー用ステートです 
type    = S
movetype= A
physics = N
juggle  = 0
poweradd= 0
velset = 0,0
anim = 1204
ctrl = 0

[state a]
type = Nothitby
trigger1 = 1
value = SCA

[State 210, 1]
type = HitDef
trigger1 = 1
attr = S, SA
damage = 70 * ROOT,fvar(39),10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 5, Hit
sparkno = s27002
sparkxy = -20, -60
hitsound = 0
guardsound = s5, 13
guard.sparkno = s17502+(1*10000)
ground.type = High
pausetime = 12,13
guard.pausetime = 12,11
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -4.5,-6.5
guard.velocity = -11.1796875
air.type = High
air.velocity = -4.5,-8
air.hittime = 13
air.juggle = 0
getpower = 47,47
givepower = 16,16
id = 1200
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
Palfx.time       = 56
Palfx.add       = 40,-70,-200
Palfx.sinadd   = 40,30,0,10
Palfx.color     = 0
Palfx.invertall = 1
yaccel = 0.5
p2stateno = 5000


[State 1010, 3]
type = destroyself;destroyself
trigger1 = movecontact && enemynear(var(58)),HitShakeOver = 1
trigger2 = root,stateno = 1200 && root,time >= 7
trigger3 = root,stateno != 1200

;----------------------------------------
;Crow Bite Hard
[Statedef 1205];Ok!
type    = S
movetype= A
physics = N
poweradd = 93
ctrl = 0
velset = 0
sprpriority = 2
facep2 = 1
anim = 1205

[State 0, VarAdd]
type = VarAdd
triggerall = !time
trigger1 = (prevstateno = [1000,2999]) && var(51)>0
var(51) = -128
persistent = 0
ignorehitpause = 1

[State 0, PalFX]
type = PalFX
triggerall = var(51)
triggerall = time < 8
trigger1 = (prevstateno = [1000,2999]) && var(51)>0
time = 1
add = 255,255,255
sinadd = 0,0,0
invertall = 0
color = 256
ignorehitpause = 1
persistent = 2


[State 1000, 1]
type = PlaySnd
trigger1 = animelem = 1
value = 1200,0
channel = 0
volume = 200

[State 1000, 1]
type = PlaySnd
trigger1 = animelem = 5
value = 1200,1
volume = 200

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 11
movetype = I

[State 0, HitBy]
type = NotHitBy
trigger1 = AnimElemTime(6) < 0
value = SCA, AA, AP, AT

[State 0, Explod]
type = Explod
trigger1 = animelemtime(5) = 1
anim = 1202
ID = 1202
pos = -6,13
postype = p1
bindtime = 17
scale = 1,1
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 0, Explod]
type = Explod
trigger1 = animelem = 8
anim = 1203
ID = 1203
pos = 20,5
postype = p1
bindtime = 22
scale = 1,1
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 4
x = 15

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 7
x = 9

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 8
x = 5

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 9
statetype = A

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 6
x = 7.25

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 8
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 9
x = 5.3961334228515625

[State 0, VelMul]
type = VelMul
trigger1 = animelemtime(6) > 0 && animelemtime(9) < 0
x = 0.90625

[State 0, VelMul]
type = VelMul
trigger1 = animelemtime(9) >= 0
x = 1

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 9
y = -9.5

[State 0, VelAdd]
type = VelAdd
trigger1 = animelemtime(9) > 0
y = 0.42578125

[State 0, Width]
type = Width
trigger1 = 1
value = 15,15

[State 210, 1]
type = HitDef
trigger1 = animelem = 4
attr = S, SA
damage = 70 * fvar(39),10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 8, Hit
sparkno = s17002+(1*10000)
sparkxy = -20, -60
hitsound = 0
guardsound = s3+(1*2), 13
guard.sparkno = s17502+(1*10000)
ground.type = Low
pausetime = 12,13
guard.pausetime = 12,11
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -4.5
guard.velocity = -11.1796875
air.type = High
air.velocity = -4.5,-6.5
air.hittime = 13
air.juggle = 0
getpower = 47,47
givepower = 16,16
id = 1200
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
Palfx.time       = 30
Palfx.add       = 40,-70,-200
Palfx.sinadd   = 40,30,0,10
Palfx.color     = 0
Palfx.invertall = 1
yaccel = 0.5
p2stateno = 5000

[State 210, 1]
type = HitDef
trigger1 = animelem = 8
attr = A, SA
damage = 40*fvar(39),10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 8, Hit
sparkno = s17002+(1*10000)
sparkxy = -20, -70
hitsound = 0
guardsound = s3+(1*2), 13
guard.sparkno = s17502+(1*10000)
ground.type = High
pausetime = 8,9
guard.pausetime = 8,7
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -2,-12
guard.velocity = -11.1796875
air.type = High
air.velocity = -2,-12
air.hittime = 13
air.juggle = 0
getpower = 47,47
givepower = 16,16
id = 1201
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
Palfx.time       = 56
Palfx.add       = 40,-70,-200
Palfx.sinadd   = 40,30,0,10
Palfx.color     = 0
Palfx.invertall = 1
persistent = 0
yaccel = 0.5
p2stateno = 5000

[State 210, 1]
type = HitDef  
trigger1 = animelem = 10
attr = A, SA
damage = 10*fvar(39),10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 8, Hit
sparkno = s17002+(1*10000)
sparkxy = -20, -70
hitsound = 0
guardsound = s3+(1*2), 13
guard.sparkno = s17502+(1*10000)
ground.type = High
pausetime = 6,7
guard.pausetime = 6,5
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -2,-11
guard.velocity = -11.1796875
air.type = High
air.velocity = -2,-6.5
air.hittime = 13
air.juggle = 0
getpower = 47,47
givepower = 16,16
id = 1202
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
Palfx.time       = 45
Palfx.add       = 40,-70,-200
Palfx.sinadd   = 40,30,0,10
Palfx.color     = 0
Palfx.invertall = 1
persistent = 0
yaccel = 0.5
p2stateno = 5000

[State 1000: Helper]
type = PlaySnd
triggerall = numhelper(247)
triggerall = helper(247), var(1) = 1
trigger1 = numtarget(1200)
trigger2 = numtarget(1201)
trigger3 = numtarget(1202)
value = 4,1
ignorehitpause = 1


[State 1000: Helper]
type = PlaySnd
triggerall = numhelper(247)
triggerall = helper(247), var(1) = 1
trigger1 = numtarget(1200)
trigger2 = numtarget(1201)
trigger3 = numtarget(1202)
value = 3+(1*2),3
ignorehitpause = 1

[State 0, VarSet]
type = VarSet
triggerall = var(59) = 0
trigger1 = time = 1
v = 43
value = 0

;Secondary Bite
[State 0, VarSet]
type = VarSet
triggerall = var(59) = 0
triggerall = animelem = 9,>0 && animelem = 13,<0
trigger1 = command = "holdfwd" && command = "a"
trigger2 = command = "holdfwd" && command = "b"
var(43) = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animelem = 13
trigger1 = var(43) = 1
value = 1210
ctrl = 0

[State 1000, 6]
type = ChangeState
trigger1 = statetype = A
trigger1 = Vel Y + Pos Y >= 0
value = 1206
ctrl = 0

[Statedef 1206]
type = S
movetype = I
physics = S
poweradd= 0
ctrl = 0
velset = 0,0
sprpriority = 2
anim = 1206

[State 300, Land]
type = PlaySnd
trigger1 = !time
value = 12,2

[State 852, PosSet]
type = PosSet
trigger1 = !time
y = 0

[State 220,2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Tsuika Kougeki
[Statedef 1210]
type    = A
movetype= A
physics = N
juggle  = 0
poweradd = 31
ctrl = 0
anim = 1210
facep2 = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 1200,1
volume = 200

[State 0, VelAdd]
type = VelAdd
trigger1 = time >= 0
y = 0.42578125

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 7
movetype = I

[State 0, Explod]
type = Explod
trigger1 = animelemtime(3) = 1
anim = 1211
ID = 1211
pos = 0,0
postype = p1
bindtime = 12
scale = 1,1
sprpriority = 4
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 210, 1]
type = HitDef
trigger1 = animelem = 5
attr = A, SA
damage = 41 * fvar(39),10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 4, Hit
sparkno = s17002+(1*10000)
sparkxy = -10, -50
hitsound = 0
guardsound = s3+(1*2), 13-(1)
guard.sparkno = s17502+(1*10000)
ground.type = Low
pausetime = 12,13
guard.pausetime = 12,11
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 28
ground.velocity = 0,0
air.type = High
air.velocity = -6,9
air.hittime = 2
getpower = 31,31
givepower = 10,10
air.fall = 1
air.fall.recover = 0
fall.recover = 0
p2stateno = 1250
id = 1210
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
fall.xvelocity = -2
fall.yvelocity = -6
fall.envshake.time = 14
fall.envshake.freq = 180
fall.envshake.ampl = -4
Palfx.time       = 25
Palfx.add       = 40,-70,-200
Palfx.sinadd   = 40,30,0,10
Palfx.color     = 0
Palfx.invertall = 1


[State 1000: Helper]
type = PlaySnd
triggerall = numhelper(247)
triggerall = helper(247), var(1) = 1
trigger1 = numtarget(1210)
value = 4,1
ignorehitpause = 1


[State 1000: Helper]
type = PlaySnd
triggerall = numhelper(247)
triggerall = helper(247), var(1) = 1
trigger1 = numtarget(1210)
value = 5,3
ignorehitpause = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1206
ctrl = 0

;---------------------------------------------------------------------------
; HITA_UP (initial going up)
[Statedef 1250]
type    = U;A
movetype= H
physics = N
ctrl = 0

[State 5030, 4]
type = ChangeState
trigger1 = !time
trigger1 = statetype != A
value = stateno + 4 ;HITA_FALL

[State 1250, StateTypeSet]
type = StateTypeSet
trigger1 = !time
statetype = A       ;S,A,C,L

[State 1250, ChangeAnim]
type = ChangeAnim
trigger1 = !hitshakeover;!time
value = 5030+((Name = "Gill" && AuthorName = "GM" && Facing = -1)*100000)

[State 5030, 1]
type = VelAdd;Gravity
trigger1 = 1
y = GetHitVar(yaccel)

[State 5030, 2]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 1107, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 5030, 4]
type = ChangeState
trigger1 = HitShakeOver
trigger2 = Vel Y > 0    ;Hit ground
trigger2 = Pos Y >= 10  ;.
value = stateno + 1 ;HITA_FALL
;---------------------------------------------------------------------------
; HITA_FALL (knocked up, falling)
[Statedef 1251]
type    = A
movetype= H
physics = N

[State 5050, 1] ;Change anim when done with transition
type = ChangeAnim
trigger1 = AnimTime = 0
trigger1 = Anim = 5035+((Name = "Gill" && AuthorName = "GM" && Facing = -1)*100000)
trigger2 = Time = 0     ;If no transition anim
trigger2 = Anim != 5035+((Name = "Gill" && AuthorName = "GM" && Facing = -1)*100000)
trigger2 = (Anim != [5051, 5059]) && (Anim != [5061, 5069]) && (Anim != [105051, 105059]) && (Anim != [105061, 105069])
trigger2 = Anim != 5090+((Name = "Gill" && AuthorName = "GM" && Facing = -1)*100000) ;Not if hit off ground anim
value = 5050+((Name = "Gill" && AuthorName = "GM" && Facing = -1)*100000)

[State 5050, 2] ;Coming down anim
type = ChangeAnim
trigger1 = anim = [5050,5059]
trigger1 = Vel Y >= ifelse(anim = 5050, 1, -2)
trigger1 = SelfAnimExist(anim+10)
value = anim+10
persistent = 0

[State 5050, 2] ;Coming down anim
type = ChangeAnim
trigger1 = anim = [105050,105059]
trigger1 = Vel Y >= ifelse(anim = 105050, 1, -2)
trigger1 = SelfAnimExist(anim+10)
value = anim+10
persistent = 0

[State 5050, 3] ;Gravity
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 5050, 6]
type = ChangeState
trigger1 = Vel Y + Pos Y >= 0
value = stateno + 1 ;HIT_BOUNCE

;---------------------------------------------------------------------------
; HIT_BOUNCE (hit ground)
[Statedef 1252]
type    = L
movetype= H
physics = N

[State 1352, NotHitBy]
type = NotHitBy
trigger1 = time < 6
value = SCA
time = 1

[State 5100, 1]
type = VelSet
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
trigger1 = vel x > 1
x = 1

[State 5100, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 5100, Var] ;Save fall velocity
type = VarSet
trigger1 = Time = 0
sysvar(1) = floor(vel y)

[State 5100, 2] ;Hit ground anim (normal)
type = ChangeAnim2
trigger1 = !time
value = stateno+((Name = "Gill" && AuthorName = "GM" && Facing = -1)*30000)

[State 5100, 2] ;Hit ground anim (normal)
type = ChangeAnim
triggerall = Name = "cvsfelicia" && authorname = "Jesuszilla"
trigger1 = !time
value = 5100

[State 5100, 4]
type = PosSet
trigger1 = Time = 0
y = 0

[State 5100, 5]
type = VelSet
trigger1 = Time = 0
y = 0

[State 5100, 6] ;Reduce speed
type = VelMul
trigger1 = Time = 0
x = 0.75

[State 5100, 7]
type = ChangeState
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
value = 5110 ;HIT_LIEDOWN

[State 5100, 9]
type = HitFallDamage
trigger1 = Time = 3

[State 5100, 11]
type = PosFreeze
trigger1 = 1

[State 5100, 12]
type = ChangeState
trigger1 = time = 5
value = stateno + 1

[State 5100, 13]
type = ForceFeedback
trigger1 = Time = 0
waveform = sinesquare
ampl = 128,-3,-.2,.005
time = 20

;---------------------------------------------------------------------------
; HIT_BOUNCE (bounce into air)
[Statedef 1253]
type    = L
movetype= H
physics = N

[State 5101, 1] ;Coming hit ground anim (normal)
type = ChangeAnim
trigger1 = animtime = 0
value = 5160+((Name = "Gill" && AuthorName = "GM" && Facing = -1)*100000)

[State 1207, VelSet]
type = VelSet
trigger1 = time = 0
x = ifelse((facing=enemynear,facing),-gethitvar(fall.xvel),gethitvar(fall.xvel))
y = gethitvar(fall.yvel)

[State 5101, 4]
type = PosSet
trigger1 = animelem = 3
y = 10

[State 5101, 5] ;Acceleration
type = VelAdd
trigger1 = 1
y = .4

[State 5101, 6] ;Hit ground
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 12
type = SelfState
value = 5110

;---------------------------------------------------------------------------
; HITG_SHAKE
[Statedef 1254]
type    = S
movetype= H
physics = N
velset = 0,0
p2facing = 1

[State 5000, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = ifelse((GetHitVar(groundtype) = 1),5000+((Name = "Gill" && AuthorName = "GM" && Facing = -1)*100000),5010+((Name = "Gill" && AuthorName = "GM" && Facing = -1)*100000)) + GetHitVar(animtype)

[State 5000, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030+((Name = "Gill" && AuthorName = "GM" && Facing = -1)*100000)

[State 5000, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047 + GetHitVar(animtype) ;5051 - 4 + type

[State 5000, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 5000, 5] ;State type gets set to aerial if getting hit up
type = StateTypeSet
trigger1 = Time = 0
trigger1 = GetHitVar(yvel) != 0 || GetHitVar(fall)
trigger2 = Pos Y != 0
statetype = a

[State 5000, 7]
type = ChangeState
trigger1 = HitShakeOver
value = stateno + 1

[State 5000, FFB Light]
type = ForceFeedback
trigger1 = anim = 5000
trigger2 = anim = 5010
persistent = 0
time = 6
waveform = square

[State 5000, FFB Medium]
type = ForceFeedback
trigger1 = anim = 5001
trigger2 = anim = 5011
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 5000, FFB Hard]
type = ForceFeedback
trigger1 = anim = 5012
trigger2 = anim = 5002
trigger3 = anim = 5030
persistent = 0
time = 15
waveform = sinesquare
ampl = 140
;---------------------------------------------------------------------------
; HIT_BOUNCE (hit ground)
[Statedef 1255]
type    = L
movetype= H
physics = N

[State 5100, 1]
type = VelSet
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
trigger1 = vel x > 1
x = 1

[State 5100, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 5100, Var] ;Save fall velocity
type = VarSet
trigger1 = Time = 0
sysvar(1) = floor(vel y)

[State 5100, 2] ;Hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
trigger1 = !SelfAnimExist(5100+((Name = "Gill" && AuthorName = "GM" && Facing = -1)*100000) + (anim % 10))
value = 5100+((Name = "Gill" && AuthorName = "GM" && Facing = -1)*100000)

[State 5100, 3] ;Hit ground anim (for hit up)
type = ChangeAnim
trigger1 = time = 0
trigger1 = SelfAnimExist(5100+((Name = "Gill" && AuthorName = "GM" && Facing = -1)*100000) + (anim % 10))
value = 5100+((Name = "Gill" && AuthorName = "GM" && Facing = -1)*100000) + (anim % 10)

[State 5100, 4]
type = PosSet
trigger1 = Time = 0
y = 0

[State 5100, 5]
type = VelSet
trigger1 = Time = 0
y = 0

[State 5100, 6] ;Reduce speed
type = VelMul
trigger1 = Time = 0
x = 0.75

[State 5100, 7]
type = SelfState
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
value = 5110 ;HIT_LIEDOWN

[State 5100, 9]
type = HitFallDamage
trigger1 = Time = 3

[State 5100, 10]
type = PlaySnd
trigger1 = Time = 1
value = F7, (sysvar(1) > 5) + (sysvar(1) > 14)

[State 5100, 11]
type = PosFreeze
trigger1 = 1

[State 5100, 12]
type = ChangeState
trigger1 = AnimTime = 0
value = stateno + 1;5101

[State 5100, 13]
type = ForceFeedback
trigger1 = Time = 0
waveform = sinesquare
ampl = 128,-3,-.2,.005
time = 20

;---------------------------------------------------------------------------
; HIT_BOUNCE (bounce into air)
[Statedef 1256]
type    = L
movetype= H
physics = N

[State 5101, 1] ;Coming hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim != [5101,5109]
trigger1 = anim != [105101,105109]
trigger2 = !SelfAnimExist(5160+((Name = "Gill" && AuthorName = "GM" && Facing = -1)*100000) + (anim % 10))
value = 5160+((Name = "Gill" && AuthorName = "GM" && Facing = -1)*100000)

[State 5101, 2] ;Coming hit ground anim (for hit up)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim = [5101,5109]
trigger1 = SelfAnimExist(5160 + (anim % 10))
value = 5160 + (anim % 10)

[State 5101, 2] ;Coming hit ground anim (for hit up)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim = [105101,105109]
trigger1 = SelfAnimExist(5160+((Name = "Gill" && AuthorName = "GM" && Facing = -1)*100000) + (anim % 10))
value = 5160+((Name = "Gill" && AuthorName = "GM" && Facing = -1)*100000) + (anim % 10)

[State 1256, VelSet]
type = VelSet
trigger1 = time = 0
y = -4.5

[State 5101, 4]
type = PosSet
trigger1 = Time = 0
y = 20

[State 5101, 5] ;Acceleration
type = VelAdd
trigger1 = 1
y = .4

[State 5101, 6] ;Hit ground
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 12
type = SelfState
value = 5110

;-------------------------------------------------------------------------------
;Weak Minute Spike
[Statedef 1300];Ok!
type    = S
movetype= A
physics = N
poweradd = 109
ctrl = 0
velset = 0
sprpriority = 2
anim = 1300

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 1202


[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 1203

[State 0, VarAdd]
type = VarAdd
triggerall = !time
trigger1 = (prevstateno = [1000,2999]) && var(51)>0
var(51) = -128
persistent = 0
ignorehitpause = 1

[State 0, PalFX]
type = PalFX
triggerall = time < 8
trigger1 = (prevstateno = [1000,2999]) && var(51)>0
time = 1
add = 255,255,255
sinadd = 0,0,0
invertall = 0
color = 256
ignorehitpause = 1
persistent = 2


[State 1400, AUTOGUARD]
type = ReversalDef
trigger1 = animelem = 1
trigger2 = animelem = 2
attr = S, SP
reversal.attr = SCA, NA, SA, HA, NP, SP, HP
numhits = 0
pausetime = 12,12
sparkxy = 0,0;-10, -40
sparkno = s27502
hitsound = s5, 13

[State 0, HitBy]
type = HitBy
trigger1 = time < 4
value = SCA, NT,ST,HT

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1030,0
volume = 200
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 1030,1
volume = -50

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 4
statetype = A

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 4
x = 7.625

[State 0, VelMul]
type = VelMul
trigger1 = animelemtime(4) > 0
x = 0.953125

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 4
y = -2.5

[State 0, VelAdd]
type = VelAdd
trigger1 = animelemtime(4) > 0
y = 0.36

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 2
trigger2 = animelem = 3
trigger3 = animelem = 10
x = 8

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 4
x = 7

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 9
x = 10

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 11
x = 2

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 12
x = 8

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 13
x = 5

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 10
movetype = I

[State 210, 1]
type = HitDef
trigger1 = animelem = 8
attr = A, SA
damage = 66 * fvar(39),10
animtype = diagup
air.animtype = diagup
guardflag = M
hitflag = MAF
priority = 8, Hit
sparkno = s17002+(1*10000)
sparkxy = -20, -80
hitsound = s5,9
guardsound = s3+(1*2), 13-(1)
guard.sparkno = s17502+(1*10000)
ground.type = High
pausetime = 12,13
guard.pausetime = 12,11
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -5.5, -8.5
guard.velocity = -11.1796875
air.type = High
air.velocity = -5.5, -8.5
air.hittime = 13
air.juggle = 0
getpower = 93,93
givepower = 31,31
id = 1300
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5
fall.envshake.time = 14
fall.envshake.freq = 180
fall.envshake.ampl = -4


[State 0, ChangeState]
type = ChangeState
trigger1 = statetype = A
trigger1 = Vel Y + Pos Y >= 0
value = 1301
ctrl = 0

[Statedef 1301]
type = S
movetype = I
physics = S
poweradd= 0
ctrl = 0
velset = 0,0
sprpriority = 2
anim = 1301

[State 300, Land]
type = PlaySnd
trigger1 = !time
value = 12,2

[State 852, PosSet]
type = PosSet
trigger1 = !time
y = 0

[State 220,2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Hard Minute Spike
[Statedef 1305];Ok!
type    = S
movetype= A
physics = N
poweradd = 109
ctrl = 0
velset = 0
sprpriority = 2
anim = 1305

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 1202

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 1203

[State 0, VarAdd]
type = VarAdd
triggerall = !time
trigger1 = (prevstateno = [1000,2999]) && var(51)>0
var(51) = -128
persistent = 0
ignorehitpause = 1

[State 0, PalFX]
type = PalFX
triggerall = time < 8
trigger1 = (prevstateno = [1000,2999]) && var(51)>0
time = 1
add = 255,255,255
sinadd = 0,0,0
invertall = 0
color = 256
ignorehitpause = 1
persistent = 2


[State 0, HitBy]
type = HitBy
trigger1 = time < 3
value = SCA, NT,ST,HT

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1030,0
volume = 200
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 1030,1
volume = -50

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 4
statetype = A

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 4
x = 9.53125

[State 0, VelMul]
type = VelMul
trigger1 = animelemtime(4) > 0
x = 0.953125

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 4
y = -4

[State 0, VelAdd]
type = VelAdd
trigger1 = animelemtime(4) > 0
y = 0.39

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 2
trigger2 = animelem = 3
trigger3 = animelem = 10
x = 8

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 4
x = 7

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 9
x = 10

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 11
x = 2

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 12
x = 8

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 13
x = 5

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 10
movetype = I

[State 210, 1]
type = HitDef
trigger1 = animelem = 8
attr = A, SA
damage = 66 * fvar(39),10
animtype = diagup
air.animtype = diagup
guardflag = M
hitflag = MAF
priority = 8, Hit
sparkno = s27002
sparkxy = -20, -75
hitsound = s5,9
guardsound = s5, 12
guard.sparkno = s27502
ground.type = High
pausetime = 12,13
guard.pausetime = 12,11
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -5.5, -8.5
guard.velocity = -11.1796875
air.type = High
air.velocity = -5.5, -8.5
air.hittime = 13
air.juggle = 0
getpower = 93,93
givepower = 31,31
id = 1305
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5
fall.envshake.time = 14
fall.envshake.freq = 180
fall.envshake.ampl = -4



[State 0, ChangeState]
type = ChangeState
trigger1 = statetype = A
trigger1 = Vel Y + Pos Y >= 0
value = 1306
ctrl = 0

[Statedef 1306]
type = S
movetype = I
physics = S
poweradd= 0
ctrl = 0
velset = 0,0
sprpriority = 2
anim = 1306

[State 300, Land]
type = PlaySnd
trigger1 = !time
value = 12,2

[State 852, PosSet]
type = PosSet
trigger1 = !time
y = 0

[State 220,2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Narrow Spike
[Statedef 1310]
type    = S
movetype= A
physics = N
poweradd = 31
ctrl = 0
velset = 0,0
anim = 1310
facep2 = 0

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 0
id = 1007

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 6
movetype = I

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 2
trigger2 = animelem = 7
x = 16

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 3
x = 9.208221435546875

[State 0, VelMul]
type = VelMul
trigger1 = animelemtime(3) > 0
x = 0.92082290751818648814356968863407

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 6
x = 0

[State 210, 1]
type = HitDef
trigger1 = !(numtarget(1305) && enemynear,stateno >= 5000)
trigger1 = animelem = 3
attr = S, SA
damage = 75 * fvar(39),10
animtype = Hard
air.animtype = back
guardflag = L
hitflag = MAF
priority = 4, Hit
sparkno = s27002
sparkxy = -20, -20
hitsound = s5,9
guardsound = s5, 12
guard.sparkno = s27502
ground.type = High
pausetime = 12,13
guard.pausetime = 12,11
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 24
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -4.5, -6.5
guard.velocity = -11.1796875
air.type = High
air.velocity = -4.5, -7.5
air.hittime = 13
air.juggle = 0
getpower = 93,93
givepower = 16,16
id = 1310
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
ground.cornerpush.veloff = -4.5
guard.cornerpush.veloff = -6.5
air.cornerpush.veloff = 0
yaccel = 0.45


[State 0, VarSet]
type = VarSet
triggerall = var(59) = 0
trigger1 = !time
v = 43
value = 0

[State 0, VarSet]
type = VarSet
triggerall = var(59) = 0
triggerall = Animelem = 7,>0 && Animelem = 10,<=3
trigger1 = command = "dp_x"
var(43) = 1

[State 0, ChangeState]
type = ChangeState
triggerall = var(59) = 0
trigger1 = animtime = 0
trigger1 = var(43) = 1
value = 1200
ctrl = 0

[State 0, VarSet]
type = VarSet
triggerall = var(59) = 0
triggerall = Animelem = 7,>0 && Animelem = 10,<=3
trigger1 = command = "dp_y"
var(43) = 2

[State 0, ChangeState]
type = ChangeState
triggerall = var(59) = 0
trigger1 = animtime = 0
trigger1 = var(43) = 2
value = 1205
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;------------------------------------------------------------------------------
;Weak Aerial Minute Spike
[Statedef 1320];Ok!
type    = A
movetype= A
physics = N
poweradd = 109
ctrl = 0
velset = 0,0
sprpriority = 2
anim = 1320

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 1202

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 1203

[State 0, VarAdd]
type = VarAdd
triggerall = !time
trigger1 = (prevstateno = [1000,2999]) && var(51)>0
var(51) = -128
persistent = 0
ignorehitpause = 1

[State 0, PalFX]
type = PalFX
triggerall = time < 8
trigger1 = (prevstateno = [1000,2999]) && var(51)>0
time = 1
add = 255,255,255
sinadd = 0,0,0
invertall = 0
color = 256
ignorehitpause = 1
persistent = 2


[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 1030,0
volume = 200
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 1030,1
volume = -50

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 3
x = 9.53125

[State 0, VelMul]
type = VelMul
trigger1 = animelemtime(3) > 0
x = 0.953125

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 3
y = -2.5

[State 0, VelAdd]
type = VelAdd
trigger1 = animelemtime(3) > 0
y = 0.36

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 7
x = 18

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 8
trigger2 = animelem = 9
x = 12

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 10
x = 8

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 7
movetype = I

[State 210, 1]
type = HitDef
trigger1 = animelem = 5
attr = A, SA
damage = 66 * fvar(39),10
animtype = diagup
air.animtype = diagup
guardflag = M
hitflag = MAF
priority = 7, Hit
sparkno = s17002+(1*10000)
sparkxy = -20, -75
hitsound = s5,9
guardsound = s3+(1*2), 13-(1)
guard.sparkno = s17502+(1*10000)
ground.type = High
pausetime = 12,13
guard.pausetime = 12,11
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -5.5, -8.5
guard.velocity = -11.1796875
air.type = High
air.velocity = -5.5, -8.5
air.hittime = 13
air.juggle = 0
getpower = 93,93
givepower = 31,31
id = 1300
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5



[State 0, ChangeState]
type = ChangeState
trigger1 = statetype = A
trigger1 = Vel Y + Pos Y >= 0
value = 1301
ctrl = 0

;Hard Aerial Minute Spike
[Statedef 1325];Ok!
type    = A
movetype= A
physics = N
poweradd = 109
ctrl = 0
velset = 0,0
sprpriority = 2
anim = 1325

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 1202

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 1203

[State 0, VarAdd]
type = VarAdd
triggerall = !time
trigger1 = (prevstateno = [1000,2999]) && var(51)>0
var(51) = -128
persistent = 0
ignorehitpause = 1

[State 0, PalFX]
type = PalFX
triggerall = time < 8
trigger1 = (prevstateno = [1000,2999]) && var(51)>0
time = 1
add = 255,255,255
sinadd = 0,0,0
invertall = 0
color = 256
ignorehitpause = 1
persistent = 2


[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 1030,0
volume = 200
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 1030,1
volume = -50

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 3
x = 9.53125

[State 0, VelMul]
type = VelMul
trigger1 = animelemtime(3) > 0
x = 0.953125

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 3
y = -4

[State 0, VelAdd]
type = VelAdd
trigger1 = animelemtime(3) > 0
y = 0.39

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 7
x = 13

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 8
x = 18

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 9
x = 12

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 10
x = 9

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 7
movetype = I

[State 210, 1]
type = HitDef
trigger1 = animelem = 5
attr = A, SA
damage = 66 * fvar(39),10
animtype = diagup
air.animtype = diagup
guardflag = M
hitflag = MAF
priority = 7, Hit
sparkno = s17002+(1*10000)
sparkxy = -20, -75
hitsound = s5,9
guardsound = s3+(1*2), 13-(1)
guard.sparkno = s17502+(1*10000)
ground.type = High
pausetime = 12,13
guard.pausetime = 12,11
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -5.5, -8.5
guard.velocity = -11.1796875
air.type = High
air.velocity = -5.5, -8.5
air.hittime = 13
air.juggle = 0
getpower = 93,93
givepower = 31,31
id = 1300
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5

[State 0, ChangeState]
type = ChangeState
trigger1 = statetype = A
trigger1 = Vel Y + Pos Y >= 0
value = 1306
ctrl = 0

;-------------------------------------------------------------------------------
;EX Air Trigger
[Statedef 1400]
type    = A
movetype = A
physics = N
poweradd = 109
ctrl = 0
sprpriority = 2
anim = 1400
facep2 = 1

[State 100, 3] ;Prevent from turning
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 1202

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 1203

[State 0, VarAdd]
type = VarAdd
triggerall = !time
trigger1 = (prevstateno = [1000,2999]) && var(51)>0
var(51) = -128
persistent = 0
ignorehitpause = 1

[State 0, PalFX]
type = PalFX
triggerall = time < 8
trigger1 = (prevstateno = [1000,2999]) && var(51)>0
time = 1
add = 255,255,255
sinadd = 0,0,0
invertall = 0
color = 256
ignorehitpause = 1
persistent = 2


[State 0, Gravity]
type = Gravity
trigger1 = Pos Y < 0

[State 210, 1]
type = Projectile
trigger1 = animelem = 6
projID = 1402
projanim = 1402
projhitanim = -1
projremanim = 1403
projcancelanim = -1
offset = 41,-51
projpriority = 1
projsprpriority = 4
velocity = 3, 4
attr = A, SP
damage = 53*fvar(39),10
animtype = Hard
guardflag = M
hitflag = MAF
sparkno = s27002
sparkxy = 15, 35
hitsound = s4,1
guardsound = s5,13
guard.sparkno = s27502
ground.type = Low
pausetime = 0,13
guard.pausetime = 0,11
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 24
guard.slidetime = 24
guard.ctrltime = 24
ground.velocity = -3
guard.velocity = -3
air.type = High
air.velocity = -4.5, -6.5
air.hittime = 13
air.juggle = 0
getpower = 93,93
givepower = 16,16
id = 1402
nochainid = 1402
air.fall = 1
fall = 0
fall.recover = 1
fall.recovertime = 120
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
Palfx.time       = 35
Palfx.add       = 40,-70,-200
Palfx.sinadd   = 40,30,0,10
Palfx.color     = 0
Palfx.invertall = 1
yaccel = .5

[State 0, Explod]
type = Explod
trigger1 = animelemtime(5) = 1
anim = 1401
ID = 1401
pos = 0,0
postype = p1
bindtime = 16
scale = 1,1
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 1400,0
volume = 200
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = 1400,1
volume = 200

[State 0, PosSet]
type = PosSet
trigger1 = statetype = A
trigger1 = Pos Y >= -10 && animelem = 7, < 0
y = -10

[State 0, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1404
ctrl = 0

[Statedef 1450]
type    = A
movetype = A
physics = N
poweradd = 109
ctrl = 0
velset = 0,0
sprpriority = 2
anim = 1400
facep2 = 1

[State 100, 3] ;Prevent from turning
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 1202

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 1203

[State 0, VarAdd]
type = VarAdd
triggerall = !time
trigger1 = (prevstateno = [1000,2999]) && var(51)>0
var(51) = -128
persistent = 0
ignorehitpause = 1

[State 0, PalFX]
type = PalFX
triggerall = time < 8
trigger1 = (prevstateno = [1000,2999]) && var(51)>0
time = 1
add = 255,255,255
sinadd = 0,0,0
invertall = 0
color = 256
ignorehitpause = 1
persistent = 2

[State 0, VelSet]
type = PosAdd
trigger1 = animelem = 5
x = -20
y = -5

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 6
x = -4
y = -6

[State 0, VelAdd]
type = VelAdd
trigger1 = animelem = 6, >= 0
y = .48

[State 0, VelAdd]
type = VelMul
trigger1 = animelem = 6, >= 0
x = .95

[State 210, 1]
type = Projectile
trigger1 = animelem = 6
projID = 1402
projanim = 1402
projhitanim = -1
projremanim = 1403
projcancelanim = -1
offset = 41,-51
projpriority = 1
projsprpriority = 4
velocity = 4, 5
attr = A, SP
damage = 53*fvar(39),10
animtype = Hard
guardflag = M
hitflag = MAF
sparkno = s27002
sparkxy = 15, 35
hitsound = s4,1
guardsound = s5,13
guard.sparkno = s27502
ground.type = Low
pausetime = 0,13
guard.pausetime = 0,11
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -3,-5
guard.velocity = -11.1796875
air.type = High
air.velocity = -4.5, -6.5
air.hittime = 13
air.juggle = 0
getpower = 93,93
givepower = 16,16
id = 1402
nochainid = 1402
air.fall = 1
fall = 1
fall.recover = 1
fall.recovertime = 120
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
Palfx.time       = 35
Palfx.add       = 40,-70,-200
Palfx.sinadd   = 40,30,0,10
Palfx.color     = 0
Palfx.invertall = 1
yaccel = .5

[State 0, Explod]
type = Explod
trigger1 = animelemtime(5) = 1
anim = 1401
ID = 1401
pos = 0,0
postype = p1
bindtime = 16
scale = 1,1
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 1400,0
volume = 200
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = 1400,1
volume = 200

[State 0, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1404
ctrl = 0

[Statedef 1404]
type = S
movetype = I
physics = S
poweradd= 0
ctrl = 0
velset = 0,0
sprpriority = 2
anim = 1404


[State 300, Land]
type = PlaySnd
trigger1 = !time
value = 12,2

[State 852, PosSet]
type = PosSet
trigger1 = !time
y = 0

[State 220,2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


[Statedef 1800]
type = S
movetype = I
physics = S
velset = 0,0
ctrl = 0
anim = 1800

[State x]
type = PlaySnd
trigger1 = AnimElem = 4
value = S10,9

[State x]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[Statedef 1900]
type = A
movetype = A
physics = N
anim = 1900
velset = 0,0
ctrl = 0
sprpriority = 2

[State x]
type = poweradd
trigger1 = root,stateno != 1800
trigger1 = Time = 0
value = -1000

[State 1000, 1]
type = Playsnd
trigger1 = AnimElem = 1
value = 2000,4
channel = 28

[State 1000, 1]
type = Playsnd
trigger1 = AnimElem = 6
trigger2 = AnimElem = 14
value = 5,6

[State 3005, width]
type = width
trigger1 = 1
edge = 10

[State 1105, y]
type = velset
trigger1 = 1
x = 3

[State 1105, y]
type = velset
trigger1 = time < 2
y = -4

[State 1105, y]
type = veladd
trigger1 = time > 1
y = .3

[State 1100, hitdef]
type = HitDef
trigger1 = AnimElem = 6
attr = A, SA
damage = 40,10
animtype = hard
hitflag = MAF
guardflag = M
sparkno = s27002
guard.sparkno = s27502
sparkxy = -10,-60
hitsound = S5,7
guardsound = S5,13
pausetime = 10,10
ground.hittime = 17
ground.type = high
ground.slidetime = 17
ground.velocity = -2
air.velocity = -4,-8
fall = 0
yaccel = .5

[State 1100, hitdef]
type = HitDef
trigger1 = AnimElem = 14
attr = A, SA
damage = 50,10
animtype = hard
hitflag = MAF
guardflag = M
sparkno = s27002
guard.sparkno = s27502
sparkxy = -10,-60
hitsound = S5,9
guardsound = S5,13
pausetime = 5,5
ground.hittime = 17
ground.type = high
ground.slidetime = 17
ground.velocity = -5,-8
air.velocity = -4,-8
fall = 1
yaccel = .5
palfx.time = 30
palfx.add = 30,30,60
palfx.sinadd = 40,30,0,10
palfx.color = 0
palfx.invertall = 1

[State 1000, 1]
type = Playsnd
trigger1 = AnimElem = 13, > 0 && movehit = 1
value = 2000,3

[State -2, 0]
type = Helper
trigger1 = animelem = 13
helpertype = normal
pos = -20,-20
postype = p1
stateno = 1901

[State 1100, state]
type = Changestate
trigger1 = vel y >= 0 && pos y >= 0
value = ifelse(movehit,1910,1905)

[Statedef 1901]
type = A
ctrl = 0
anim = 1920
velset = 0,0
sprpriority = 3

[State 4300, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State a]
type = AngleDraw
trigger1 = 1
value = -45
scale = 0.6,0.6

[State 4300, DestroySelf]
type = DestroySelf
trigger1 = AnimTime = 0

[Statedef 1905]
type = S
movetype = A
physics = N
anim = 1905
velset = 0,0
ctrl = 0

[State 1110, pos]
type = posset
trigger1 = time = 0
y = 0

[State 200, 1]
type = PlaySnd
trigger1 = time = 0
value = 12,2

[State 200, 1]
type = PlaySnd
trigger1 = AnimElem = 4
value = 2000,1

[State 200, 1]
type = PlaySnd
trigger1 = AnimElem = 7
value = 2000,2

[State 3020, 3]
type = Projectile
trigger1 = AnimElem = 7
projID = 1930
projanim = 1930
projhitanim = 1930
projremovetime = 20
velocity = 4
projpriority = 1
postype = p1
offset = 0,0
attr = S, SP
damage = 60,10
animtype = hard
hitflag = MAFP
guardflag = M
sparkno = -1
guard.sparkno = -1
sparkxy = 80,-50
hitsound = S2000,3
guardsound = S5,13
pausetime = 0,17
ground.hittime = 19
ground.type = high
ground.slidetime = 19
ground.velocity = -12
air.velocity = -4,-6
air.fall = 1
yaccel = .5
palfx.time = 41
palfx.add = 30,30,60
palfx.sinadd = 40,30,0,10
palfx.color = 0
palfx.invertall = 1

[State x]
type = StateTypeSet
trigger1 = AnimElem = 14
movetype = I

[State 0, Turn]
type = Turn
trigger1 = AnimElem = 14

[State x]
type = VelSet
trigger1 = AnimElem >= 18
x = 5

[State 200, 1]
type = PlaySnd
trigger1 = AnimElem = 18
value = 2000,0
channel = 28

[State 1100, state]
type = DestroySelf
trigger1 = FrontEdgeDist <= -30

[Statedef 1910]
type = S
movetype = I
physics = N
anim = 1910
velset = 0,0
ctrl = 0

[State 1110, pos]
type = posset
trigger1 = time = 0
y = 0

[State 200, 1]
type = PlaySnd
trigger1 = time = 0
value = 12,2

[State 0, Turn]
type = Turn
trigger1 = AnimElem = 4

[State 200, 1]
type = PlaySnd
trigger1 = AnimElem = 8
value = 2000,0
channel = 28

[State x]
type = VelSet
trigger1 = AnimElem >= 8
x = 5

[State 1100, state]
type = DestroySelf
trigger1 = FrontEdgeDist <= -30