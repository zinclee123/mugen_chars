;----------------------------------------
;Heat Drive DM
[Statedef 3000];Ok!
type    = S
movetype= A
physics = S
poweradd = 0
ctrl = 0
velset = 0
sprpriority = 2
facep2 = 1
anim = 3000

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 1202

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 1203

[State 1000, VarSet]
type = VarSet
trigger1 = !time
var(43) = ifElse(Command = "x",0,1)

[State 1000, VarSet]
type = VarSet
trigger1 = !time
var(54) = 0

[State 1000, VarSet]
type = VarSet
trigger1 = prevstateno = [1000,2999]
var(54) = 1

[State -2, PalFX]
type = PalFX
trigger1 = prevstateno = [1000,2999]
trigger1 = time < 17
time = 1
add = 255,255,255
sinadd = 0,0,0
invertall = 0
color = 256
ignorehitpause = 1
persistent = 2

[State 6001, pause]
type = SuperPause
trigger1 = time = 1
time = 28
movetime = 18
anim = -1
darken = 0
poweradd = ifelse(var(51)>0,0, -1000-(prevstateno = [1000,2999])*1000)

[State 0, VarSet]
type = VarSet
trigger1 = time = 1
v = 51
value = 0

[State 1000, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 3000,0
channel = 0
volume = 200
persistent = 0

[State 1000, 1]
type = PlaySnd
trigger1 = animelem = 1
value = 5,10

[State 3000, VarSet]
type = VarSet
trigger1 = time = 0 ;Superpause tick error fix.
var(6) = 26

[State 13000, EnvColor]
type = EnvColor
trigger1 = time = 1
value = 255,255,255
time = 4
under = 1
ignorehitpause = 1
persistent = 0

[State 4000]
type = EnvColor
trigger1 = time = 1
value = 0, 0, 0
time = 28
under = 1

[State 6001, pause]
type = Explod
trigger1 = time = 1
anim = 15200-(1*200)
pos = 11,-91
postype = p1
supermovetime = 9999999999999999
pausemovetime = 9999999999999999
supermove = 1
removetime = 28
sprpriority = -2
ownpal = 1
[State 6001, pause]
type = Explod
trigger1 = time = 1
anim = 15201-(1*200)
pos = 11,-91
postype = p1
supermovetime = 9999999999999999
pausemovetime = 9999999999999999
supermove = 1
sprpriority = 4
ownpal = 1

[State 0, HitBy]
type = HitBy
trigger1 = 1
value = SCA, NT,ST,HT

[State 0, Explod]
type = Explod
trigger1 = animelemtime(5)=0
id = 3005
anim = 3005
pos = 0,0
sprpriority = 4
supermovetime = 9999
pausemovetime = 9999
removetime = 250
ownpal = 1
removeongethit = 1
bindtime = -1

[State 0, Explod]
type = Explod
trigger1 = animelemtime(5)=0
id = 3008
anim = 3008
pos = 0,0
sprpriority = -2
supermovetime = 9999
pausemovetime = 9999
ownpal = 1
removeongethit = 0
bindtime = 1

[State 1000, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 3001
ctrl = 0

[Statedef 3001];Ok!
type    = S
movetype= A
physics = S
poweradd= 0
ctrl = 0
velset = 0
sprpriority = 2
anim = 3001

[State 0, VarSet]
type = VarSet
trigger1 = !time
v = 27
value = 0

[State 0, VarSet]
type = VarSet
trigger1 = time = 120
v = 27
value = 1

[State 1000, 6]
type = ChangeState
trigger1 = var(59) = 0
trigger1 = !var(43) && command != "hold_x"
trigger2 = var(59) = 0
trigger2 = var(43) && command != "hold_y"
trigger3 = time = 120
value = 3002
ctrl = 0

[Statedef 3002];Ok!
type    = S
movetype= A
physics = N
poweradd= 0
ctrl = 0
velset = 0
sprpriority = 2
anim = ifelse(!var(43),3002,3003)

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 4,9
volume = 200

[State 0, Explod]
type = Explod
trigger1 = animelemtime(1)=0
id = 3006
anim = 3006
pos = 0,0
sprpriority = 4
ownpal = 1
removeongethit = 0
bindtime = 1
supermovetime = 999
pausemovetime = 999

[State 810, 1]
type = AfterImage
trigger1 = animelem = 3
time = 999
length = 5
framegap = 1
palcontrast = 256,256,256
paladd = 0,0,40
palmul = 1,1,1
trans = add1

[State 0, PlayerPush]
type = PlayerPush
trigger1 = animelemtime(5)>=0 && animelemtime(7)<0
value = 0

[State 0, PlayerPush]
type = PlayerPush
trigger1 = animelemtime(7)>=0
value = 1

[State 0, AssertSpecial]
type = AssertSpecial
triggerall = var(27)
trigger1 = 1
flag = unguardable

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 3005

[State 13000, EnvColor]
type = EnvColor
trigger1 = movehit = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 2
x = 16

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 7
x = 19

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 8
x = -11

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 3
x = 10

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 7
x = 8.4791412353515625

[State 0, VelMul]
type = VelMul
trigger1 = animelemtime(7)>0
x = 0.92082261840705862451839068255805

[State 210, 1]
type = HitDef
trigger1 = animelem = 5
attr = S, HA
damage = floor(208*ifelse(var(56),1.25,1))+50*var(27),10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 4, Hit
sparkno = S27003
sparkxy = -30, -70
hitsound = 0
guardsound = s3+(1*2), 13
guard.sparkno = s27502
ground.type = High
pausetime = 1,1
guard.pausetime = 1,1
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -4.5, -6.5
guard.velocity = -11.1796875
air.type = High
air.velocity = -22, -6.5
air.hittime = 13
air.juggle = 0
getpower = 0,0
givepower = 0,0
id = 3000
fall = 1
air.fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
palfx.time = 60
palfx.add = 40,-70,-200
palfx.sinadd = 40,30,0,10
palfx.color = 0
palfx.invertall = 1
yaccel = 0.45

[State 1200, 0]
type = TargetState
trigger1 = numtarget && movehit && p2movetype = H
value = 3009
ignorehitpause = 0
persistent = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = numtarget && movehit && p2movetype = H
value = 3004
ignorehitpause = 0
persistent = 0

[State 0, VarSet]
type = VarSet
trigger1 = !time
v = 40
value = 0

[State 0, VarSet]
type = VarSet
trigger1 = animelemtime(3)>0
trigger1 = frontedgebodydist <= 5
v = 40
value = 5
persistent = 0

[State 1000, 6]
type = ChangeState
trigger1 = animelemtime(7)<0
trigger1 = var(40)=1
value = 3010
ctrl = 0

[State 1000, 6]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

[Statedef 3004];Ok!
type    = S
movetype= A
physics = N
poweradd= 0
ctrl = 0
velset = 0
sprpriority = 2
anim = 3004

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

[State 0, Explod]
type = Explod
trigger1 = animelemtime(1)=0
id = 3007
anim = 3007
pos = 0,0
sprpriority = 4
supermovetime = 9999
pausemovetime = 9999
ownpal = 1
removeongethit = 1
bindtime = 7

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 4
x = 9

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 5
x = -11

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 1
x = 9.208221435546875

[State 0, VelMul]
type = VelMul
trigger1 = animelemtime(1)>0
x = 0.92082290751818648814356968863407

[State 1000: Helper]
type = PlaySnd
trigger1 = !time
value = 12,6
ignorehitpause = 1
volume = 200
persistent = 0

[State 1000: Helper]
type = PlaySnd
trigger1 = !time
value = 4,8
ignorehitpause = 1
volume = 200
persistent = 0

[State 1000, 6]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

[Statedef 3010];Ok!
type    = S
movetype= A
physics = N
poweradd= 0
ctrl = 0
velset = 0
sprpriority = 2
anim = 3010

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 1
x = 9

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 2
x = -11

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 1
x = 9.208221435546875

[State 0, VelMul]
type = VelMul
trigger1 = animelemtime(1)>0
x = 0.92082290751818648814356968863407

[State 1000, 6]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;-----------------
;Spinning Fall
[Statedef 3009]
type = A
movetype = H
physics = N
velset = 0, 0
facep2 = 1

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 0, ChangeAnim]
type = ChangeAnim2
trigger1 = time = 0
value = 3009

[State 0, VelSet]
type = VelSet
trigger1 = Time = 0
x = -2
y = -17

[State 0, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = .6

[State 5110, 6]
type = PlaySnd
trigger1 = Pos Y >= -15 && Vel Y > 0
value = F7, 0

[State 0, SelfState]
type = ChangeState
trigger1 = Pos Y >= -15 && Vel Y > 0
value = 6201

[Statedef 6201]
type = A
movetype = H
physics = N
velset = 0, 0

[State 0, EnvShake]
type = EnvShake
trigger1 = Time = 0
time = 20
ampl = -8

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 0, PosSet]
type = PosSet
trigger1 = Time = 0
y = 0

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
value = 5100+ifelse(SelfAnimexist(5101),1,0)

[State 0, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 6202

[Statedef 6202]
type = A
movetype = H
physics = N
velset = 0, 0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 0, VelSet]
type = VelSet
trigger1 = Time = 0
x = -1.5
y = -3

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
value = 5160+ifelse(SelfAnimexist(5161),1,0)

[State 0, VelAdd]
type = VelAdd
trigger1 = 1
y = .525

[State 0, SelfState]
type = SelfState
trigger1 = Pos Y >= -2 && Vel Y > 0
value = 5110

;----------------------------------------
;Chain Drive DM
[Statedef 3100];Ok!
type    = S
movetype= A
physics = S
poweradd = 0
ctrl = 0
velset = 0
sprpriority = 2
facep2 = 1
anim = 3100

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 1202

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 1203


[State -2, PalFX]
type = PalFX
trigger1 = prevstateno = [1000,2999]
trigger1 = time < 17
time = 1
add = 255,255,255
sinadd = 0,0,0
invertall = 0
color = 256
ignorehitpause = 1
persistent = 2

[State 6001, pause]
type = SuperPause
trigger1 = time = 1
time = 28
movetime = 2
anim = -1
darken = 0
p2defmul = 1
poweradd = ifelse(var(51)>0,0, -1000-(prevstateno = [1000,2999])*1000)

[State 0, VarSet]
type = VarSet
trigger1 = time = 1
var(51) = 0

[State 1000, 1]
type = PlaySnd
trigger1 = animelem = 7
value = 3100,0
channel = 0
volume = 200
persistent = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = 3100,2
volume = 200

[State 3000, VarSet]
type = VarSet
trigger1 = time = 0 ;Superpause tick error fix.
var(6) = 26

[State 13000, EnvColor]
type = EnvColor
trigger1 = time = 1
value = 255,255,255
time = 4
under = 1
ignorehitpause = 1
persistent = 0

[State 4000]
type = EnvColor
trigger1 = time = 1
value = 0, 0, 0
time = 29
under = 1

[State 1000, 1]
type = PlaySnd
trigger1 = animelem = 1
value = 5,10

[State 6001, pause]
type = Explod
trigger1 = time = 1
anim = 15200-(1*200)
pos = -2,-92
postype = p1
supermovetime = 9999999999999999
pausemovetime = 9999999999999999
supermove = 1
removetime = 28
sprpriority = -2
ownpal = 1

[State 6001, pause]
type = Explod
trigger1 = time = 1
anim = 15201-(1*200)
pos = -2,-92
postype = p1
supermovetime = 9999999999999999
pausemovetime = 9999999999999999
supermove = 1
sprpriority = 4
ownpal = 1

[State 0, HitBy]
type = HitBy
trigger1 = time < 34
value = SCA, NT,ST,HT

[State 0, Helper]
type = Helper
trigger1 = animelemtime(6) = 1
helpertype = normal
name = "Sunglasses"
ID = 3101
stateno = 3101
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
ignorehitpause = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = helper(3101),movehit
value = 3104

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Sunglasses
[Statedef 3101]
type = S
movetype = A
physics = N
anim = 3101

[State 0, VelSet]
type = VelSet
trigger1 = time = 0
x = 11
y = -2.5

[State 0, VelAdd]
type = VelAdd
trigger1 = time >= 8
y = .5

[state 0, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA, AA, AP, AT
stateno = 3102
time = -1

[State 210, 1]
type = HitDef
trigger1 = animelem = 1
attr = S, HP
damage = 33*root,fvar(39),10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 3, Hit
sparkno = s27003
sparkxy = -20, -65
hitsound = s5,3
guardsound = s5, 13
guard.sparkno = s27502
ground.type = High
pausetime = 0,8
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = 0
guard.velocity = 0
air.type = High
air.velocity = -4.5, -4.5
air.hittime = 13
air.juggle = 0
getpower =0,0
givepower = 16,16
id = 3101
air.fall = 1
fall = 0
fall.recover = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5

[State 1411, VarSet]
type = ParentVarSet
trigger1 = numtarget(3101) && movehit
var(16) = 16
persistent = 0
ignorehitpause=1

[State 0, ChangeState]
type = ChangeState
trigger1 = movecontact
trigger2 = time = 300
value = 3102
ctrl = 0

[Statedef 3102]
ctrl = 0
anim = 3102
velset = 0,0

[State 0, DestroySelf]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = root,stateno = 3105

[Statedef 3103]
type    = S
movetype= A
physics = N
juggle  = 0
poweradd = 0
ctrl = 0
velset = 0,0
anim = ifelse(prevstateno=3104,3103,3113)
facep2 = 0

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 1
x = 11.67333984375

[State 0, VelMul]
type = VelMul
trigger1 = animelemtime(1) > 0
x = 0.75726774584849625632659890408667

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 1
x = 13

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 3
x = 8

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

[Statedef 3104];Ok!
type    = S
movetype= A
physics = N
poweradd= 0
ctrl = 0
velset = 0
sprpriority = 2
anim = 3104

[State 3104]
type = NotHitBy
trigger1 = 1
value = SCA

[State 0, Explod]
type = Explod
trigger1 = time = 6
anim = 3105
ID = 3105
pos = 0,0
postype = p1
bindtime = 1
scale = 1,1
sprpriority = 4
ownpal = 1
removeongethit = 0
ignorehitpause = 1
supermovetime = 9999
pausemovetime = 9999

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 4
x = 16

[State 0, VelSet]
type = VelSet
trigger1 = movecontact
x = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 3100,3
volume = 200

[State 13000, EnvColor]
type = EnvColor
trigger1 = movehit = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 210, 1]
type = HitDef
trigger1 = animelem = 5
trigger1 = p2life > 0
attr = S, HA
damage = 58,0
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 4, Hit
sparkno = S27003
sparkxy = -10, -70
hitsound = s5,7
guardsound = s3+(1*2), 13
guard.sparkno = s27502
ground.type = High
pausetime = 1,2
guard.pausetime = 1,1
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = 0
guard.velocity = 0
air.type = High
air.velocity = -4.5, -6.5
air.hittime = 13
air.juggle = 0
getpower = 0,0
givepower = 0,0
id = 3104
fall = 0
air.fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5
snap = 50,0
kill = 0
forcestand = 1

[State 0, TargetState]
type = TargetState
trigger1 = numtarget && movehit && p2movetype = H
value = 3107
ignorehitpause = 0
persistent = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = movehit
value = 3105
ctrl = 0

[State 1000, 6]
type = ChangeState
trigger1 = animtime = 0
value = 3103
ctrl = 0

[Statedef 3105]
type     = S
movetype = A
physics  = N
anim     = 3115
velset   = 0,0
ctrl     = 0
sprpriority = 2

[State 3106, 無敵]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3106, Helper]
type = Helper
trigger1 = AnimElem = 1
helpertype = Normal
name = "Megane"
stateno = 3125
ID = 3127
helpertype = Normal
pos = 0,0
postype = P1
keyctrl = 0
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 時間停止]
type = Pause
trigger1 = 1
movetime = 2
time = 2

[State 3106, 物理的なキャラの幅]
type = Width
trigger1 = 1
edge = 60,0

[State 3106, TargetBind]
type = TargetBind
trigger1 = 1
pos = 45,0

[State 3106, 無敵]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3106, エフェクト表示]
type = Explod
trigger1 = AnimElem = 5
persistent = 0
anim = 20000
postype = P1
pos = 50,-90
sprpriority = 10
ignorehitpause = 1
supermovetime = 9999
pausemovetime = 9999

[State 3106, PlaySnd]
type = PlaySnd
Trigger1 = AnimElem = 5
value = s12,0

[State 3106, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 3106

[Statedef 3125]
type     = A
movetype = I
physics  = N
anim     = 3125
velset   = .6,-6.5
ctrl     = 0

[State 1000, PosSet]
type = PosSet
trigger1 = time = 0
y = -80

[State 1100, VelAdd]
type = VelAdd
trigger1 = 1
y = .2

[State 3000, このヘルパーを消す]
type = DestroySelf
trigger1 = Root,Anim = 3115 && Root,AnimElem = 5
trigger2 = Root,Anim = 3215 && Root,AnimElem = 5
trigger3 = Vel Y > 0 && Pos Y >= 0
trigger4 = Time = 120

[Statedef 3106]
type    = S
movetype= A
physics = N
juggle  = 0
poweradd = 0
ctrl = 0
velset = 0,0
anim = 3106
facep2 = 0

[State 0, TargetBind]
type = TargetBind
trigger1 = time < 92
time = 1
pos = 50,0
ignorehitpause = 1

[State 0, VelSet]
type = VelSet
trigger1 = animelemtime(42)<0
x = 2
ignorehitpause = 0

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 42
x = 0

[State 0, Width]
type = Width
trigger1 = 1
value = 25,5
edge = 55,35

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 13000, EnvColor]
type = EnvColor
trigger1 = animelem = 4
trigger2 = animelem = 6
trigger3 = animelem = 19
trigger4 = animelem = 21
trigger5 = animelem = 29
trigger6 = animelem = 38
trigger7 = animelem = 40
trigger8 = animelem = 11
trigger9 = animelem = 15
trigger10 = animelem = 24
trigger11 = animelem = 33
trigger12 = animelem = 46
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1

;Punches Light
[State 210, 1]
type = HitDef
trigger1 = animelem = 4
trigger2 = animelem = 6
attr = S, HA
damage = 10,10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 4, Hit
sparkno = S27003
sparkxy = -30, -60
hitsound = s5,1
guardsound = s3+(1*2), 13
guard.sparkno = s27502
ground.type = High
pausetime = 3,2
guard.pausetime = 3,1
ground.slidetime = 17
ground.hittime = 40
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -1.5
guard.velocity = 0
air.type = High
air.velocity = -4.5, -6.5
air.hittime = 13
air.juggle = 0
getpower = 0,0
givepower = 0,0
fall = 0
air.fall = 1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5
snap = 50,0
kill = 0
forcestand = 1

;Punches Hard
[State 210, 1]
type = HitDef
trigger1 = animelem = 19
trigger2 = animelem = 21
trigger3 = animelem = 29
trigger4 = animelem = 38
trigger5 = animelem = 40
attr = S, HA
damage = 10,10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 4, Hit
sparkno = S27003
sparkxy = -30, -30-(random%40)
hitsound = s5,3
guardsound = s5, 13
guard.sparkno = s27502
ground.type = High
pausetime = 3,2
guard.pausetime = 3,1
ground.slidetime = 17
ground.hittime = 40
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -1.5
guard.velocity = 0
air.type = High
air.velocity = -4.5, -6.5
air.hittime = 13
air.juggle = 0
getpower = 0,0
givepower = 0,0
fall = 0
air.fall = 1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5
snap = 50,0
kill = 0
forcestand = 1

;Kicks Light
[State 210, 1]
type = HitDef
trigger1 = animelem = 11
trigger2 = animelem = 15
attr = S, HA
damage = 10,10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 4, Hit
sparkno = S27003
sparkxy = -30, -30
hitsound = s5,5
guardsound = s5, 13
guard.sparkno = s27502
ground.type = Low
pausetime = 3,2
guard.pausetime = 3,1
ground.slidetime = 17
ground.hittime = 40
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -1.5
guard.velocity = 0
air.type = High
air.velocity = -4.5, -6.5
air.hittime = 13
air.juggle = 0
getpower = 0,0
givepower = 0,0
fall = 0
air.fall = 1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5
snap = 50,0
kill = 0
forcestand = 1

;Kicks Hard
[State 210, 1]
type = HitDef
trigger1 = animelem = 24
trigger2 = animelem = 33
attr = S, HA
damage = 10,10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 4, Hit
sparkno = S27003
sparkxy = -30, -30-(random%40)
hitsound = s5,7
guardsound = s3+(1*2), 13
guard.sparkno = s27502
ground.type = Low
pausetime = 3,2
guard.pausetime = 3,1
ground.slidetime = 17
ground.hittime = 40
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -1.5
guard.velocity = 0
air.type = High
air.velocity = -4.5, -6.5
air.hittime = 13
air.juggle = 0
getpower = 0,0
givepower = 0,0
fall = 0
air.fall = 1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5
snap = 50,0
kill = 0
forcestand = 1

;Final Hit
[State 210, 1]
type = HitDef
trigger1 = animelem = 46
attr = S, HA
damage = 50,10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 4, Hit
sparkno = S27003
sparkxy = -30, -65
hitsound = s5,9
guardsound = s3+(1*2), 13
guard.sparkno = s27502
ground.type = High
pausetime = 32,33
guard.pausetime = 32,33
ground.slidetime = 17
ground.hittime = 40
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -1.5
guard.velocity = 0
air.type = High
air.velocity = -4.5, -6.5
air.hittime = 13
air.juggle = 0
getpower = 0,0
givepower = 0,0
id = 3116
fall = 1
air.fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5
snap = 50,0
kill = 1
forcestand = 1
p2stateno = 13100
palfx.time = 65
palfx.add = 40,-70,-200
palfx.sinadd = 40,30,0,10
palfx.color = 0
palfx.invertall = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 46 && movehit
value = 4,7

[State 0, VarSet]
type = VarSet
trigger1 = animelem = 45
v = 16
value = 24

[State -2, Helper]
type = Helper
trigger1 = !numhelper(50000) && !numhelper(50001)
trigger1 = WinKO
helpertype = normal
name = "K.O."
ID = 50000
stateno = 50000
pos = 160,120
postype = left    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 999999999999
pausemovetime = 999999999999
ignorehitpause = 1


[State 5100, EnvShake]
type = EnvShake
trigger1 = animelem = 46
time = 10
freq = 180
ampl = -4

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 45
value = 3100,1
volume = 200
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 113
value = 12,11
volume = 200
channel = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

[Statedef 3107]
type = S
physics = N
movetype = H
ctrl = 0
velset = 0,0
facep2 = 1

[State 0, HitFallSet]
type = HitFallSet
trigger1 = 1
value = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3107

;Hit By One Inch Punch (For Pausetime)
[Statedef 13100]
type    = S
movetype= H
physics = N
velset = 0,0

[State 181, 1]
type = NotHitBy
trigger1 = 1
value = SCA

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
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047+((Name = "Gill" && AuthorName = "GM" && Facing = -1)*100000) + GetHitVar(animtype)))
value = 5047+((Name = "Gill" && AuthorName = "GM" && Facing = -1)*100000) + GetHitVar(animtype) ;5051 - 4 + type

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

[State 5000, 7]
type = ChangeState
trigger1 = HitShakeOver
value = 13101

;Hit By One Inch Punch (Air Fall)
[Statedef 13101]
type    = A
movetype= H
physics = N
velset = 0,0

[State 181, 1]
type = null;NotHitBy
trigger1 = 1
value = SCA

[State 3340, Vel]
type = VelSet
trigger1 = time = 0
x = ifelse((facing=enemynear,facing),5,-5)
y = -6

[State 3340, Gravity]
type = VelAdd
trigger1 = Time > 0
y = .5

[State 3340, Anim 5050]
type = ChangeAnim
trigger1 = !selfanimexist(5061)
trigger1 = !time
persistent = 0
value = 5050+((Name = "Gill" && AuthorName = "GM" && Facing = -1)*100000)

[State 3340, Anim 5050]
type = ChangeAnim
trigger1 = selfanimexist(5061)
trigger1 = !time
persistent = 0
value = 5061

[State 5050, 6]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= ifelse((anim = [5051,5059]) || (anim = [5061,5069]), 0, 25)
value = 13102 ;HIT_BOUNCE

[State 5050, 6]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= ifelse((anim = [105051,105059]) || (anim = [105061,105069]), 0, 25)
value = 13102 ;HIT_BOUNCE

;Hit By One Inch Punch (Slide)
[Statedef 13102]
type    = S
movetype= H
physics = N
velset = 0,0

[State 181, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 803, ChangeAnim2]
type = ChangeAnim2
trigger1 = !time
value = 10802

[State 803, ChangeAnim2]
type = Null;ChangeAnim
trigger1 = selfanimexist(5101)
trigger1 = !time
value = 5101

[State 0, PosSet]
type = PosSet
trigger1 = !time
y = 0

[State InitVel]
type = VelSet
trigger1 = !time
X = ifelse((facing=enemynear,facing),3.56535983085632,-3.56535983085632)

[State Accel]
type = VelAdd
trigger1 = Vel X != 0
X = ifelse((facing=enemynear,facing),-0.176470592617989,0.176470592617989)

[State 802, VelSet]
type = VelSet
trigger1 = Time = 20
x = 0

[State 802, SelfState]
type = ChangeState
trigger1 = Vel X = 0
value = 13103

;Hit By One Inch Punch (Liedown)
[Statedef 13103]
type    = S
movetype= H
physics = N

[State 181, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 803, ChangeAnim2]
type = ChangeAnim2
trigger1 = !selfanimexist(5111)
trigger1 = !time
value = 10803

[State 803, ChangeAnim]
type = ChangeAnim
trigger1 = selfanimexist(5111)
trigger1 = !time
value = 5111

[State 803, SelfState]
type = SelfState
trigger1 = time = 60
value = Ifelse(alive,5120,5150)

;----------------------------------------
;Chain Drive SDM
[Statedef 3110];Ok!
type    = S
movetype= A
physics = S
poweradd = 0
ctrl = 0
velset = 0
sprpriority = 2
facep2 = 1
anim = 3110

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 1202

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 1203

[State 6001, pause]
type = SuperPause
trigger1 = time = 1
time = 28
movetime = 28
anim = -1
darken = 0
sound = s3,17
p2defmul = 1
poweradd = ifelse(var(51)>0,-1000,-3000)

[State -2, PalFX]
type = PalFX
trigger1 = prevstateno = [1000,2999]
trigger1 = time < 17
time = 1
add = 255,255,255
sinadd = 0,0,0
invertall = 0
color = 256
ignorehitpause = 1
persistent = 2

[State 0, VarSet]
type = VarSet
trigger1 = time = 1
v = 51
value = 0

[State 1000, 1]
type = PlaySnd
trigger1 = animelem = 7
value = 3100,0
channel = 0
volume = 200
persistent = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = 3100,2
volume = 200

[State 3000, VarSet]
type = VarSet
trigger1 = time = 0 ;Superpause tick error fix.
var(6) = 26

[State 13000, EnvColor]
type = EnvColor
trigger1 = time = 1
value = 255,255,255
time = 4
under = 1
ignorehitpause = 1
persistent = 0

[State 3000, AssertSpecial]
type = AssertSpecial
trigger1 = time = [1,29]
flag = noBG
flag2 = noFG

[State 3050, BGPalfx]
type = BGPalfx
trigger1 = time >= 30
invertall = 1
time = 1
mul = 120,120,120
ignorehitpause = 1

[State 6001, pause]
type = Explod
trigger1 = time = 1
anim = 15300-(1*200)
pos = -2,-92
postype = p1
supermovetime = 9999999999999999
pausemovetime = 9999999999999999
supermove = 1
removetime = 28
sprpriority = -2
ownpal = 1
[State 6001, pause]
type = Explod
trigger1 = time = 1
anim = 15301-(1*200)
pos = -2,-92
postype = p1
supermovetime = 9999999999999999
pausemovetime = 9999999999999999
supermove = 1
removetime = 28
sprpriority = 4
ownpal = 1

[State 0, HitBy]
type = HitBy
trigger1 = time < 35
value = SCA, NT,ST,HT

[State 0, Helper]
type = Helper
trigger1 = animelemtime(6) = 1
helpertype = normal
name = "Sunglasses"
ID = 3111
stateno = 3111
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
ignorehitpause = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = helper(3111),movehit
value = 3114

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Sunglasses
[Statedef 3111]
type = S
movetype = A
physics = N
anim = 3101

[State 0, VelSet]
type = VelSet
trigger1 = time = 0
x = 12
y = -2.5

[State 0, VelAdd]
type = VelAdd
trigger1 = time >= 8
y = .5

[state 0, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA, AA, AP, AT
stateno = 3102
time = -1

[State 210, 1]
type = HitDef
trigger1 = animelem = 1
attr = S, HP
damage = 33*root,fvar(39),10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 3, Hit
sparkno = s27003
sparkxy = -20, -65
hitsound = s5,3
guardsound = s5, 13
guard.sparkno = s27502
ground.type = High
pausetime = 0,8
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = 0
guard.velocity = 0
air.type = High
air.velocity = -4.5, -4
air.hittime = 13
air.juggle = 0
getpower =0,0
givepower = 16,16
id = 3101
air.fall = 1
fall = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5

[State 1411, VarSet]
type = ParentVarSet
trigger1 = numtarget(3101) && movehit
var(16) = 16
persistent = 0
ignorehitpause=1

[State 0, ChangeState]
type = ChangeState
trigger1 = movecontact
trigger2 = time = 300
value = 3112
ctrl = 0

[Statedef 3112]
ctrl = 0
anim = 3102
velset = 0,0

[State 0, ParentVarSet]
type = ParentVarSet
trigger1 = time = 0
v = 34
value = 1
ignorehitpause = 1

[State 0, DestroySelf]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = root,stateno = 3215

[Statedef 3114];Ok!
type    = S
movetype= A
physics = N
poweradd= 0
ctrl = 0
velset = 0
sprpriority = 2
anim = 3104

[State 3104]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3050, BGPalfx]
type = BGPalfx
trigger1 = 1
invertall = 1
time = 1
mul = 120,120,120
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = time = 6
anim = 3105
ID = 3105
pos = 0,0
postype = p1
bindtime = 1
scale = 1,1
sprpriority = 4
ownpal = 1
removeongethit = 0
ignorehitpause = 1
supermovetime = 9999
pausemovetime = 9999

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 4
x = 16

[State 0, VelSet]
type = VelSet
trigger1 = movecontact
x = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 3100,3
volume = 200

[State 13000, EnvColor]
type = EnvColor
trigger1 = movehit = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 210, 1]
type = HitDef
trigger1 = animelem = 5
trigger1 = p2life > 0
attr = S, HA
damage = 20,0
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 4, Hit
sparkno = S27003
sparkxy = -10, -70
hitsound = s5,7
guardsound = s3+(1*2), 13
guard.sparkno = s27502
ground.type = High
pausetime = 1,2
guard.pausetime = 1,1
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = 0
guard.velocity = 0
air.type = High
air.velocity = -4.5, -6.5
air.hittime = 13
air.juggle = 0
getpower = 0,0
givepower = 0,0
id = 3104
fall = 0
air.fall = 1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5
snap = 50,0
kill = 0
forcestand = 1

[State 0, TargetState]
type = TargetState
trigger1 = numtarget && movehit && p2movetype = H
value = 3107
ignorehitpause = 0
persistent = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = movehit
value = 3215
ctrl = 0

[State 1000, 6]
type = ChangeState
trigger1 = animtime = 0
value = 3103
ctrl = 0

[Statedef 3215]
type     = S
movetype = A
physics  = N
anim     = 3215
velset   = 0,0
ctrl     = 0
sprpriority = 2

[State 3050, BGPalfx]
type = BGPalfx
trigger1 = 1
invertall = 1
time = 5
mul = 120,120,120
ignorehitpause = 1

[State 3106, 無敵]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3106, Helper]
type = Helper
trigger1 = AnimElem = 1
helpertype = Normal
name = "Megane"
stateno = 3125
ID = 3127
helpertype = Normal
pos = 0,0
postype = P1
keyctrl = 0
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 時間停止]
type = Pause
trigger1 = 1
movetime = 2
time = 2

[State 3106, 物理的なキャラの幅]
type = Width
trigger1 = 1
edge = 60,0

[State 3106, TargetBind]
type = TargetBind
trigger1 = 1
pos = 45,0

[State 3106, 無敵]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3106, エフェクト表示]
type = Explod
trigger1 = AnimElem = 5
persistent = 0
anim = 20000
postype = P1
pos = 50,-90
sprpriority = 10
ignorehitpause = 1
supermovetime = 9999
pausemovetime = 9999

[State 3106, PlaySnd]
type = PlaySnd
Trigger1 = AnimElem = 5
value = s12,0

[State 3106, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 3116

[Statedef 3116]
type    = S
movetype= A
physics = N
juggle  = 0
poweradd = 0
ctrl = 0
velset = 0,0
anim = 3135
facep2 = 0

[State 3050, BGPalfx]
type = BGPalfx
trigger1 = 1
invertall = 1
time = 5
mul = 120,120,120
ignorehitpause = 1

[State 0, TargetBind]
type = TargetBind
trigger1 = time < 148
time = 1
pos = 50,0
ignorehitpause = 1

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 90
x = 16

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 91
x = 12

[State 0, VelSet]
type = VelSet
trigger1 = animelemtime(80)<0
x = 1
ignorehitpause = 0

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 92
x = 5
ignorehitpause = 0

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 80
trigger2 = animelem = 96
x = 0

[State 0, Width]
type = Width
trigger1 = 1
value = 25,5
edge = 55,35

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 13000, EnvColor]
type = EnvColor
trigger1 = animelem = 4
trigger2 = animelem = 6
trigger3 = animelem = 19
trigger4 = animelem = 21
trigger5 = animelem = 29
trigger6 = animelem = 37
trigger7 = animelem = 39
trigger8 = animelem = 11
trigger9 = animelem = 15
trigger10 = animelem = 24
trigger11 = animelem = 32
trigger12 = animelem = 84
trigger13 = animelem = 98
trigger14 = animelem = 42
trigger15 = animelem = 44
trigger16 = animelem = 57
trigger17 = animelem = 59
trigger18 = animelem = 67
trigger19 = animelem = 76
trigger20 = animelem = 78
trigger21 = animelem = 49
trigger22 = animelem = 62
trigger23 = animelem = 71
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1

;Punches Light
[State 210, 1]
type = HitDef
trigger1 = animelem = 4
trigger2 = animelem = 6
attr = S, HA
damage = 4,10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 4, Hit
sparkno = S27003
sparkxy = -30, -60
hitsound = s5,1
guardsound = s3+(1*2), 13
guard.sparkno = s27502
ground.type = High
pausetime = 3,2
guard.pausetime = 3,1
ground.slidetime = 17
ground.hittime = 40
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -1.5
guard.velocity = 0
air.type = High
air.velocity = -4.5, -6.5
air.hittime = 13
air.juggle = 0
getpower = 0,0
givepower = 0,0
fall = 0
air.fall = 1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5
snap = 50,0
kill = 0
forcestand = 1

;FLAMIN Punches Light
[State 210, 1]
type = HitDef
trigger1 = animelem = 42
trigger2 = animelem = 44
attr = S, HA
damage = 4,10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 4, Hit
sparkno = S27003
sparkxy = -30, -60
hitsound = s5,1
guardsound = s3+(1*2), 13
guard.sparkno = s27502
ground.type = High
pausetime = 2,2
guard.pausetime = 2,1
ground.slidetime = 17
ground.hittime = 40
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -1.5
guard.velocity = 0
air.type = High
air.velocity = -4.5, -6.5
air.hittime = 13
air.juggle = 0
getpower = 0,0
givepower = 0,0
fall = 0
air.fall = 1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5
snap = 50,0
kill = 0
forcestand = 1
palfx.time = 3
palfx.add = 40,-70,-200
palfx.sinadd = 40,30,0,10
palfx.color = 0
palfx.invertall = 1

;Punches Hard
[State 210, 1]
type = HitDef
trigger1 = animelem = 19
trigger2 = animelem = 21
trigger3 = animelem = 29
trigger4 = animelem = 37
trigger5 = animelem = 39
attr = S, HA
damage = 5,10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 4, Hit
sparkno = S27003
sparkxy = -30, -30-(random%40)
hitsound = s5,3
guardsound = s3+(1*2), 13
guard.sparkno = s27502
ground.type = High
pausetime = 3,2
guard.pausetime = 3,1
ground.slidetime = 17
ground.hittime = 40
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -1.5
guard.velocity = 0
air.type = High
air.velocity = -4.5, -6.5
air.hittime = 13
air.juggle = 0
getpower = 0,0
givepower = 0,0
fall = 0
air.fall = 1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5
snap = 50,0
kill = 0
forcestand = 1

;FLAMIN Punches Hard
[State 210, 1]
type = HitDef
trigger1 = animelem = 57
trigger2 = animelem = 59
trigger3 = animelem = 67
trigger4 = animelem = 76
trigger5 = animelem = 78
attr = S, HA
damage = 10,10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 4, Hit
sparkno = S27003
sparkxy = -30, -30-(random%40)
hitsound = s5,3
guardsound = s3+(1*2), 13
guard.sparkno = s27502
ground.type = High
pausetime = 2,2
guard.pausetime = 2,1
ground.slidetime = 17
ground.hittime = 40
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -1.5
guard.velocity = 0
air.type = High
air.velocity = -4.5, -6.5
air.hittime = 13
air.juggle = 0
getpower = 0,0
givepower = 0,0
fall = 0
air.fall = 1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5
snap = 50,0
kill = 0
forcestand = 1
palfx.time = 3
palfx.add = 40,-70,-200
palfx.sinadd = 40,30,0,10
palfx.color = 0
palfx.invertall = 1

;Kicks Light
[State 210, 1]
type = HitDef
trigger1 = animelem = 11
trigger2 = animelem = 15
attr = S, HA
damage = 6,10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 4, Hit
sparkno = S27003
sparkxy = -30, -30
hitsound = s5,5
guardsound = s3+(1*2), 13
guard.sparkno = s27502
ground.type = Low
pausetime = 3,2
guard.pausetime = 3,1
ground.slidetime = 17
ground.hittime = 40
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -1.5
guard.velocity = 0
air.type = High
air.velocity = -4.5, -6.5
air.hittime = 13
air.juggle = 0
getpower = 0,0
givepower = 0,0
fall = 0
air.fall = 1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5
snap = 50,0
kill = 0
forcestand = 1

;FLAMIN Kicks Light
[State 210, 1]
type = HitDef
trigger1 = animelem = 49
trigger2 = animelem = 53
attr = S, HA
damage = 6,10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 4, Hit
sparkno = S27003
sparkxy = -30, -30
hitsound = s5,5
guardsound = s3+(1*2), 13
guard.sparkno = s27502
ground.type = Low
pausetime = 2,2
guard.pausetime = 2,1
ground.slidetime = 17
ground.hittime = 40
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -1.5
guard.velocity = 0
air.type = High
air.velocity = -4.5, -6.5
air.hittime = 13
air.juggle = 0
getpower = 0,0
givepower = 0,0
fall = 0
air.fall = 1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5
snap = 50,0
kill = 0
forcestand = 1
palfx.time = 3
palfx.add = 40,-70,-200
palfx.sinadd = 40,30,0,10
palfx.color = 0
palfx.invertall = 1

;Kicks Hard
[State 210, 1]
type = HitDef
trigger1 = animelem = 24
trigger2 = animelem = 32
attr = S, HA
damage = 10,10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 4, Hit
sparkno = S27003
sparkxy = -30, -30-(random%40)
hitsound = s5,7
guardsound = s3+(1*2), 13
guard.sparkno = s27502
ground.type = Low
pausetime = 3,2
guard.pausetime = 3,1
ground.slidetime = 17
ground.hittime = 40
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -1.5
guard.velocity = 0
air.type = High
air.velocity = -4.5, -6.5
air.hittime = 13
air.juggle = 0
getpower = 0,0
givepower = 0,0
fall = 0
air.fall = 1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5
snap = 50,0
kill = 0
forcestand = 1

;FLAMIN Kicks Hard
[State 210, 1]
type = HitDef
trigger1 = animelem = 62
trigger2 = animelem = 71
attr = S, HA
damage = 10,10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 4, Hit
sparkno = S27003
sparkxy = -30, -30-(random%40)
hitsound = s5,7
guardsound = s3+(1*2), 13
guard.sparkno = s27502
ground.type = Low
pausetime = 2,2
guard.pausetime = 2,1
ground.slidetime = 17
ground.hittime = 40
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -1.5
guard.velocity = 0
air.type = High
air.velocity = -4.5, -6.5
air.hittime = 13
air.juggle = 0
getpower = 0,0
givepower = 0,0
fall = 0
air.fall = 1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5
snap = 50,0
kill = 0
forcestand = 1
palfx.time = 3
palfx.add = 40,-70,-200
palfx.sinadd = 40,30,0,10
palfx.color = 0
palfx.invertall = 1

;doshita
[State 210, 1]
type = HitDef
trigger1 = animelem = 84
attr = S, HA
damage = 10,10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 4, Hit
sparkno = S27003
sparkxy = -30, -65
hitsound = s4,7
guardsound = s3+(1*2), 13
guard.sparkno = s27502
ground.type = High
pausetime = 1,17
guard.pausetime = 1,17
ground.slidetime = 17
ground.hittime = 40
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -1.5
guard.velocity = 0
air.type = High
air.velocity = -4.5, -6.5
air.hittime = 13
air.juggle = 0
getpower = 0,0
givepower = 0,0
id = 3115
fall = 0
air.fall = 1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5
snap = 50,0
kill = 0
forcestand = 1
palfx.time = 60
palfx.add = 40,-70,-200
palfx.sinadd = 40,30,0,10
palfx.color = 0
palfx.invertall = 1

;AH!
[State 210, 1]
type = HitDef
trigger1 = animelem = 98
attr = S, HA
damage = 100,10
animtype = diagup
air.animtype = diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
sparkno = S27003
sparkxy = -30, -65
hitsound = s4,7
guardsound = s3+(1*2), 13
guard.sparkno = s27502
ground.type = High
pausetime = 32,33
guard.pausetime = 32,33
ground.slidetime = 17
ground.hittime = 40
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = -5.5,-8.5
guard.velocity = 0
air.type = High
air.velocity = -5.5,-8.5
air.hittime = 13
air.juggle = 0
getpower = 0,0
givepower = 0,0
id = 3116
fall = 1
air.fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5
kill = 0
p2stateno = 3217
forcestand = 1
palfx.time = 65
palfx.add = 40,-70,-200
palfx.sinadd = 40,30,0,10
palfx.color = 0
palfx.invertall = 1

[State 0, TargetState]
type = TargetState
trigger1 = animelem = 85
value = 3117
ID = 3115

[State 0, Explod]
type = Explod
trigger1 = animelem = 85
anim = 3136
ID = 3118
pos = 0,0
postype = p1
bindtime = 1
scale = 1,1
sprpriority = -2
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 84
anim = 12510
ID = 12510
pos = 30,-58
postype = p1
bindtime = 1
scale = 1,1
sprpriority = 4
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 84
anim = 12510
ID = 12510
pos = 65,-65
postype = p1
bindtime = 1
scale = 1,1
sprpriority = 4
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 84
anim = 12510
ID = 12510
pos = 65,-100
postype = p1
bindtime = 1
scale = 1,1
sprpriority = 4
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 84
anim = 12510
ID = 12510
pos = 50,-58
postype = p1
bindtime = 1
scale = .6,.6
sprpriority = 5
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 84
anim = 12510
ID = 12510
pos = 30,-100
postype = p1
bindtime = 1
scale = .6,.6
sprpriority = 4
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 0, VarSet]
type = VarSet
trigger1 = animelem = 84
trigger2 = animelem = 97
v = 16
value = 24

[State 5100, EnvShake]
type = EnvShake
trigger1 = animelem = 84
trigger2 = animelem = 97
time = 10
freq = 180
ampl = -4

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 97
value = 3100,1
volume = 200
channel = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animelem = 98, = 10
value = 3400

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

[Statedef 3117]
type = S
physics = N
movetype = H
ctrl = 0
velset = 0,0
facep2 = 1

[State 0, VelSet]
type = VelSet
trigger1 = time = 1
x = -4.5

[State 0, VelMul]
type = VelMul
trigger1 = time > 1
x = 0.95

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3117

[Statedef 3217]
type = S
physics = S
movetype = H
ctrl = 0
velset = 0,0
facep2 = 1

[State 0, VelSet]
type = VelSet
trigger1 = time = 12
x = -15

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 5016
;----------------------------------------
;Crimson Star Road HSDM
[Statedef 3200];Ok!
type    = S
movetype= A
physics = N
poweradd = 0
ctrl = 0
velset = 0
sprpriority = 2
facep2 = 1
anim = 3200


[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noBG
flag2 = noFG

[State -2, Helper]
type = Helper
triggerall = !numhelper(40001)
trigger1 = time = 3
helpertype = normal
name = "HSDM"
ID = 40001
stateno = 40001
pos = 160,120
postype = left    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 999999999999
pausemovetime = 999999999999
ignorehitpause = 1

[State -2, Helper]
type = Helper
triggerall = !numhelper(40003)
trigger1 = time = 25
helpertype = normal
name = "H.Port"
ID = 40003
stateno = 40003
pos = 160,120
postype = left    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 999999999999
pausemovetime = 999999999999
ignorehitpause = 1

[State -2, Helper]
type = Helper
triggerall = !numhelper(40004)
trigger1 = time = 25
helpertype = normal
name = "Player 1"
ID = 40004
stateno = 40004
pos = 160,120
postype = left    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 999999999999
pausemovetime = 999999999999
ignorehitpause = 1

[State 6001, pause]
type = Explod
trigger1 = animelemtime(2)=1
anim = 15500
pos = -5,-85
postype = p1
supermovetime = 9999999999999999
pausemovetime = 9999999999999999
supermove = 1
removetime = 28
sprpriority = -2
ownpal = 1

[State 6001, pause]
type = Explod
trigger1 = animelemtime(2)=1
anim = 15501
pos = -5,-85
postype = p1
supermovetime = 9999999999999999
pausemovetime = 9999999999999999
supermove = 1
removetime = 28
sprpriority = 4
ownpal = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 1202

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 1203

[State 6001, pause]
type = SuperPause
trigger1 = time = 1
time = 28
movetime = 28
anim = -1
sound = s3,15
p2defmul = 1
poweradd = ifelse(roundstate=2,ifelse(var(51)>0,-1000,-3000),0)

[State 0, VarSet]
type = VarSet
trigger1 = time = 1
v = 51
value = 0

[State 3200]
type = NotHitBy
trigger1 = AnimElemTime(9) < 8
value = SCA

[State 0, StopSnd]
type = StopSnd
trigger1 = !time
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 3200,0
volume = 200
channel = 0

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 8
x = 5

[State 0, VelMul]
type = VelMul
trigger1 = animelemtime(10)<0
x = 1

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 10
x = 0

[State 0, AfterImage]
type = AfterImage
trigger1 = animelem = 9
time = 16
length = 5
framegap = 1
timegap = 2
trans = none
palcontrast = 255,255,255
paladd = 0,0,0
palmul = 1,1,1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = unguardable

[State 210, 1]
type = HitDef
trigger1 = animelem = 9
attr = S, HA
damage = 0,0
animtype = Hard
air.animtype = back
guardflag = N
hitflag = MAF
priority = 4, Hit
sparkno = S27002
sparkxy = 0, -70
hitsound = s5,3
guardsound = s5, 13
guard.sparkno = s27502
ground.type = High
pausetime = 0,12
guard.pausetime = 0,12
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = 0
guard.velocity = 0
air.type = High
air.velocity = -4.5, -6.5
air.hittime = 13
air.juggle = 0
getpower = 0,0
givepower = 0,0
id = 3200
fall = 0
air.fall = 1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5
snap = 25,0
kill = 0
forcestand = 1

[State 1200, 0]
type = TargetState
trigger1 = numtarget && movehit && p2movetype = H
value = 3203
ignorehitpause = 0
persistent = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = numtarget && movehit && p2movetype = H
value = 3201
ignorehitpause = 0
persistent = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

[Statedef 3201]
type    = S
movetype= A
physics = N
juggle  = 0
poweradd = 0
ctrl = 0
velset = 0,0
anim = 3201
facep2 = 1
sprpriority = -5

[State 0, AfterImageTime]
type = AfterImageTime
trigger1 = !time
time = 0

[State 0, Explod]
type = Explod
triggerall = time >= 13 && time <= 87
trigger1 = gametime%2
anim = 3210
ID = 3210
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
supermovetime = 999
pausemovetime = 999
scale = 1,1
sprpriority = -4
ontop = 0
ownpal = 1
removeongethit = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = 3200,1
volume = 200
channel = 0

[State 0, EnvColor]
type = EnvColor
trigger1 = animelem = 1
value = 0, 0, 0
time = 88
under = 1
ignorehitpause = 1
persistent = 0

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 1
time = 1
pos = 25,0
ignorehitpause = 1

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 2
x = 1

[State 0, VelMul]
type = VelMul
trigger1 = animelemtime(2) > 0
x = 1

[State 0, VelSet]
type = VelSet
trigger1 = animtime = 0
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3202
ctrl = 0

[Statedef 3202]
type    = S
movetype= A
physics = N
juggle  = 0
poweradd = 0
ctrl = 0
velset = 0,0
anim = 3202
facep2 = 0

[State 0, Turn]
type = Turn
trigger1 = animelem = 2

[State 0, TargetBind]
type = TargetBind
trigger1 = frontedgebodydist <= 5
trigger2 = backedgebodydist <= 5
time = 1
id = -1
pos = -55,0

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = animelem = 23, < 0
flag = noBG
flag2 = noFG

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = nojugglecheck

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = 3200,2
volume = 200
channel = 0

[State 0, EnvColor]
type = EnvColor
trigger1 = animelem = 1
value = 0, 0, 0
time = 118
under = 1
ignorehitpause = 1
persistent = 0

[State 0, EnvColor]
type = EnvColor
trigger1 = animelemtime(20)=1
value = 255, 255, 255
time = 3
under = 1
ignorehitpause = 1

[State 0, EnvColor]
type = EnvColor
trigger1 = animelem = 9
trigger2 = animelem = 10
trigger3 = animelem = 11
trigger4 = animelem = 12
trigger5 = animelem = 13
trigger6 = animelem = 14
trigger7 = animelem = 16
value = 255, 255, 255
time = 1
under = 1
ignorehitpause = 1

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 210, 1]
type = HitDef
trigger1 = animelemtime(15)=2
attr = S, HA
damage = 40,10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 4, Hit
sparkno = S27003
sparkxy = 0, -70
hitsound = s4,6
guardsound = s4,6
guard.sparkno = s27502
ground.type = High
pausetime = 0,23
guard.pausetime = 0,23
ground.slidetime = 17
ground.hittime = 40
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = 0, -11
guard.velocity = 0
air.type = High
air.velocity = 0, -11
air.hittime = 13
air.juggle = 0
getpower = 0,0
givepower = 0,0
fall = 1
air.fall = 1
fall.recover = 0
air.fall.recover = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5
kill = 1
forcestand = 1
id = 3202
envshake.time = 24
envshake.freq = 180
envshake.ampl = -4
palfx.time = 90
palfx.add = 40,-70,-200
palfx.sinadd = 40,30,0,10
palfx.color = 0
palfx.invertall = 1
p2stateno = 3204

[State 1411, VarSet]
type = VarSet
trigger1 = animelem = 14
var(16) = 24
persistent = 0
ignorehitpause=1

[State 0, Explod]
type = Explod
trigger1 = animelem = 16
id = 12512
anim = 12512
pos = 47,-110
sprpriority = 6
supermovetime = 9999
pausemovetime = 9999
ownpal = 1
removeongethit = 0
bindtime = 1

[State 0, Helper]
type = Helper
trigger1 = animelem = 9
trigger2 = animelem = 10
trigger3 = animelem = 11
trigger4 = animelem = 12
trigger5 = animelem = 13
trigger6 = animelem = 14
helpertype = normal
stateno = 3206
name = "Explosions"
postype = p2
pos = 0,0
keyctrl = 0
ownpal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

[Statedef 3203]
type = S
physics = S
movetype = H
ctrl = 0
velset = 0,0
facep2 = 1

[State 0, HitFallSet]
type = HitFallSet
trigger1 = time = 0
value = 0

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3203

[Statedef 3210]
type=S
physics=N
movetype=A
ctrl=0
anim=3210
sprpriority=-2
velset =0,0

[State 0, AfterImage]
type = AfterImage
trigger1 = !time
time = 100
length = 12
framegap = 1
timegap = 2
trans = none
palcontrast = 255,255,255
paladd = 0,0,0
palmul = 1,1,1

[State 0, BindToParent]
type = BindToParent
trigger1 = 1
time = 105
facing = 1
pos = 0,0

[State 1005, End]
type=destroyself
trigger1= time = 105

[Statedef 3206]
type = A
movetype = A
physics = N
velset = 0, 0
sprpriority = 5
anim = 3206
ctrl = 0
ownpal = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = nojugglecheck

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 210, 1]
type = HitDef
trigger1 = time = 0
attr = S, HA
damage = 45,10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 4, Hit
sparkno = -1;S27003
sparkxy = 0, -20
hitsound = s4,1
guardsound = s3+(1*2), 13
guard.sparkno = s27502
ground.type = High
pausetime = 1,0
guard.pausetime = 0,0
ground.slidetime = 17
ground.hittime = 40
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = 0, -6
guard.velocity = 0
air.type = High
air.velocity = 0, -6
air.hittime = 13
air.juggle = 0
getpower = 0,0
givepower = 0,0
fall = 1
air.fall = 1
fall.recover = 0
air.fall.recover = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5
kill = 0
forcestand = 1
palfx.time = 10
palfx.add = 40,-70,-200
palfx.sinadd = 40,30,0,10
palfx.color = 0
palfx.invertall = 1

[State 0, Explod]
type = Explod
trigger1 = time = 1
id = 27003
anim = 27003
pos = 0,-40
postype = p2
random = 0,40
sprpriority = 6
supermovetime = 9999
pausemovetime = 9999
ownpal = 1
removeongethit = 0
bindtime = 1

[State 0, Explod]
type = Explod
trigger1 = !numexplod(27000)
trigger1 = time = 1
id = 27000
anim = 27000
pos = 0,0
postype = p2
random = 0,40
sprpriority = 6
supermovetime = 9999
pausemovetime = 9999
ownpal = 1
removeongethit = 0
bindtime = 1

[State 0, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0

[Statedef 3204]
type = A
movetype = H
physics = N

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 0, VelSet]
type = VelSet
trigger1 = Time = 0
x = 0
y = 0
z = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time >= 0
value = 3009

[State 0, ChangeState]
type = ChangeState
trigger1 = HitShakeOver = 1
value = 3205

[Statedef 3205]
type = A
movetype = H
physics = N
velset = 1.8,-13.5

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 0, VelAdd]
type = VelAdd
trigger1 = time > 0
y = .5

[State 0, EnvShake]
type = EnvShake
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
time = 20

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = Pos Y >= -15 && Vel Y > 0
trigger1 = SelfAnimexist(5061)
value = 5061

[State 5110, 6]
type = PlaySnd
trigger1 = Pos Y >= -15 && Vel Y > 0
value = F7, 0

[State 0, SelfState]
type = SelfState
trigger1 = Pos Y >= -15 && Vel Y > 0
value = 5100




[Statedef 3300];Ok!
type    = S
movetype= A
physics = S
poweradd = 0
ctrl = 0
velset = 0,0
sprpriority = 2
anim = 3300

[State 0]
type = NotHitBy
trigger1 = AnimElemTime(6) < 0
value = SCA
time = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 1202

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 1203

[State 6001, pause]
type = SuperPause
trigger1 = time = 0
time = 28
movetime = 7
anim = -1
darken = 0
poweradd = -1000-((prevstateno = [1000,2999])-(var(51) > 0))*1000

[State -2, PalFX]
type = PalFX
trigger1 = prevstateno = [1000,2999]
trigger1 = time < 17
time = 1
add = 255,255,255
sinadd = 0,0,0
invertall = 0
color = 256
ignorehitpause = 1
persistent = 2

[State 0, VarSet]
type = VarSet
trigger1 = time = 1
var(51) = 0

[State 4000]
type = EnvColor
trigger1 = time = 1
value = 0, 0, 0
time = 29
under = 1

[State 1000, 1]
type = PlaySnd
trigger1 = animelem = 1
value = 5,10

[State 6001, pause]
type = Explod
trigger1 = time = 1
anim = 15000
pos = -25,-100
postype = p1
supermovetime = 9999999999999999
pausemovetime = 9999999999999999
supermove = 1
removetime = 28
sprpriority = -2
ownpal = 1

[State 6001, pause]
type = Explod
trigger1 = time = 1
anim = 15001
pos = -25,-100
postype = p1
supermovetime = 9999999999999999
pausemovetime = 9999999999999999
supermove = 1
sprpriority = 4
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = animelemtime(4) = 1
trigger2 = animelemtime(15) = 1
anim = 1202
ID = 1202
pos = -6,13
postype = p1
bindtime = 17
removetime = 17
scale = 1,1
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 0, Explod]
type = Explod
trigger1 = animelemtime(6) = 1
trigger2 = animelemtime(17) = 1
anim = 1203
ID = 1203
pos = 20,5
postype = p1
bindtime = 22
removetime = 22
scale = 1,1
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 0, Explod]
type = Explod
trigger1 = animelemtime(25) = 1
anim = 1211
ID = 1211
pos = 0,0
postype = p1
bindtime = 12
removetime = 12
scale = 1,1
sprpriority = 4
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
trigger2 = animelem = 15
trigger3 = animelem = 24
value = 1200,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 13
value = 1200,0

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 28
movetype = I

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 7
trigger2 = animelem = 18
x = 28

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 3
x = 2

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 18, > 0
x = 5.5

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 18
statetype = A

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 18
y = -8

[State 0, VelAdd]
type = VelAdd
trigger1 = animelemtime(18) > 0
y = 0.42

[State 0, Width]
type = Width
trigger1 = 1
player = 10,10
edge = 10,10

[State 0, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = animelem = 4
trigger2 = animelem = 6
trigger3 = animelem = 7
trigger4 = animelem = 16
trigger5 = animelem = 17
trigger6 = animelem = 18
trigger7 = animelem = 19
trigger8 = animelem = 20
trigger9 = animelem = 27
value = 255,255,255
time = 2
under = 1
ignorehitpause =1
persistent =1

[State 200, 1]
type = HitDef
trigger1 = animelem = 4
trigger2 = animelem = 6
trigger3 = animelem = 7
trigger4 = animelem = 16
trigger5 = animelem = 17
trigger6 = animelem = 18
attr = S, HA
damage = 25, 5
animtype = Hard
guardflag = M
hitflag = MAF
priority = 5, Hit
pausetime = 3,16
sparkno = s27002
sparkxy = -10, -30
hitsound = s5,3
guardsound = s5, 13
guard.sparkno = s27502
ground.type = Low
ground.slidetime = 17
ground.hittime  = 17
ground.velocity = -1
guard.velocity = -12
guard.pausetime = 0,11
guard.slidetime = 10
guard.hittime = 18
guard.ctrltime = 18
airguard.velocity = -4,-1
air.type = High
air.velocity = 0, -5
air.hittime = 11
air.animtype = back
fall.animtype = back
ground.cornerpush.veloff = -1
air.cornerpush.veloff = 0
guard.cornerpush.veloff = -1
getpower = 0
givepower = 31, 31
fall = 0
air.fall = 1
air.recover = 0
fall.recover = 0
yaccel = .45
palfx.time = 35
Palfx.add = 40,-70,-200
Palfx.sinadd = 40,30,0,10
Palfx.color = 0
palfx.invertall = 1

[State 200, 1]
type = HitDef
trigger1 = animelem = 19
trigger2 = animelem = 20
attr = A, HA
damage = 30, 10
animtype = Hard
guardflag = M
hitflag = MAF
priority = 5, Hit
pausetime = 3,4
sparkno = s27002
sparkxy = -10, -17
hitsound = s5,3
guardsound = s5, 13
guard.sparkno = s27502
ground.type = Low
ground.slidetime = 17
ground.hittime  = 17
ground.velocity = -2,-10
guard.velocity = -12
guard.pausetime = 0,11
guard.slidetime = 10
guard.hittime = 18
guard.ctrltime = 18
airguard.velocity = -4,-1
air.type = High
air.velocity = -2,-7
air.hittime = 11
air.animtype = back
fall.animtype = back
ground.cornerpush.veloff = -1
air.cornerpush.veloff = 0
guard.cornerpush.veloff = -1
getpower = 0
givepower = 31, 31
fall = 1
air.fall = 1
air.recover = 0
fall.recover = 0
yaccel = .5
palfx.time = 35
Palfx.add = 40,-70,-200
Palfx.sinadd = 40,30,0,10
Palfx.color = 0
palfx.invertall = 1

[State 200, 1]
type = HitDef
trigger1 = animelem = 27
attr = A, HA
damage = 50, 10
animtype = Medium
guardflag = M
hitflag = MAF
priority = 5, Hit
pausetime = 31,32
sparkno = s27002
sparkxy = -10, -17
hitsound = s5,7
guardsound = s5, 13
guard.sparkno = s27502
ground.type = High
ground.slidetime = 17
ground.hittime  = 17
ground.velocity = -2,7
guard.velocity = -9
guard.pausetime = 9,11
guard.slidetime = 10
guard.hittime = 18
guard.ctrltime = 18
airguard.velocity = -4,-1
air.type = Low
air.velocity = -4,12
air.hittime = 11
air.animtype = back
fall.animtype = back
ground.cornerpush.veloff = -1
air.cornerpush.veloff = 0
guard.cornerpush.veloff = -1
getpower = 0
givepower = 31, 31
fall = 1
air.fall = 1
air.recover = 0
fall.recover = 0
yaccel = .5
palfx.time = 30
Palfx.add = 40,-70,-200
Palfx.sinadd = 40,30,0,10
Palfx.color = 0
palfx.invertall = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1206
ctrl = 0


[Statedef 3400];Ok!
type    = S
movetype= A
physics = N
poweradd = 0
ctrl = 0
velset = 0
sprpriority = 2
anim = 3400

[State 3106, 無敵]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3050, BGPalfx]
type = BGPalfx
trigger1 = 1
invertall = 1
time = 1
mul = 120,120,120
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = animelemtime(5)=0
id = 3005
anim = 3005
pos = 0,0
sprpriority = 4
supermovetime = 9999
pausemovetime = 9999
removetime = 250
ownpal = 1
removeongethit = 1
bindtime = -1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 9
id = 3005

[State 0, Explod]
type = Explod
trigger1 = animelemtime(5)=0
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
trigger1 = animelem = 11
value = 4,9
volume = 200

[State 0, Explod]
type = Explod
trigger1 = animelemtime(9)=0
id = 3006
anim = 3006
pos = 0,0
sprpriority = 4
supermovetime = 9999
pausemovetime = 9999
ownpal = 1
removeongethit = 0
bindtime = 1

[State 810, 1]
type = AfterImage
trigger1 = animelem = 11
time = 44
length = 5
framegap = 1
palcontrast = 256,256,256
paladd = 0,0,40
palmul = 1,1,1
trans = add1

[State 0, PlayerPush]
type = PlayerPush
trigger1 = animelemtime(11)>=0 && animelemtime(15)<0
value = 0

[State 0, PlayerPush]
type = PlayerPush
trigger1 = animelemtime(15)>=0
value = 1

[State 13000, EnvColor]
type = EnvColor
trigger1 = movehit = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 11
x = 8

[State 0, VelMul]
type = VelMul
trigger1 = animelemtime(15)>0
x = 0.9

[State 210, 1]
type = HitDef
trigger1 = animelem = 13
attr = S, HA
damage = 50,10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 4, Hit
sparkno = S27003
sparkxy = -30, -70
hitsound = s12,6
guardsound = s5, 13
guard.sparkno = s27502
ground.type = High
pausetime = 1,1
guard.pausetime = 1,1
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 24
ground.velocity = 0, -10
guard.velocity = -11.1796875
air.type = High
air.velocity = 0, -10
air.hittime = 13
air.juggle = 0
getpower = 0,0
givepower = 0,0
id = 3000
fall = 1
air.fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
palfx.time = 50
palfx.add = 40,-70,-200
palfx.sinadd = 40,30,0,10
palfx.color = 0
palfx.invertall = 1
yaccel = 0.4
p2stateno = 3009

[State 3005, ContactSpark]
type = Explod
trigger1 = MoveHit = 1
anim = 12505
pos = 0,-50
postype = p2
bindtime = -1
sprpriority = 4
ownpal = 1

[State 1000, 6]
type = velset
trigger1 = animelem = 19
X = 0

[State 1000, 6]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1


[Statedef 4000];Ok!
type    = S
movetype= A
physics = N
poweradd = 0
ctrl = 0
velset = 0
sprpriority = 2
anim = 3600

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noBG
flag2 = noFG

[State -2, Helper]
type = Helper
triggerall = !numhelper(40001)
trigger1 = time = 3
helpertype = normal
name = "HSDM"
ID = 40001
stateno = 40001
pos = 160,120
postype = left    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 999999999999
pausemovetime = 999999999999
ignorehitpause = 1

[State -2, Helper]
type = Helper
triggerall = !numhelper(40003)
trigger1 = time = 25
helpertype = normal
name = "H.Port"
ID = 40003
stateno = 40003
pos = 160,120
postype = left    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 999999999999
pausemovetime = 999999999999
ignorehitpause = 1

[State -2, Helper]
type = Helper
triggerall = !numhelper(40004)
trigger1 = time = 25
helpertype = normal
name = "Player 1"
ID = 40004
stateno = 40004
pos = 160,120
postype = left    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 999999999999
pausemovetime = 999999999999
ignorehitpause = 1

[State 6001, pause]
type = SuperPause
trigger1 = time = 1
time = 28
movetime = 28
anim = -1
sound = s3,15
p2defmul = 1
poweradd = ifelse(var(51)>0,-1000,-3000)

[State 0, VarSet]
type = VarSet
trigger1 = time = 1
var(51) = 0

[State 6001, pause]
type = Explod
trigger1 = animelemtime(2)=1
anim = 15500
pos = -25,-75
postype = p1
supermovetime = 9999999999999999
pausemovetime = 9999999999999999
supermove = 1
removetime = 28
sprpriority = -2
ownpal = 1

[State 6001, pause]
type = Explod
trigger1 = animelemtime(2)=1
anim = 15501
pos = -25,-75
postype = p1
supermovetime = 9999999999999999
pausemovetime = 9999999999999999
supermove = 1
removetime = 28
sprpriority = 4
ownpal = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 1202

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 1203

[State 4300, エフェクト表示]
type = Explod
trigger1 = AnimElem = 6
anim = 3610
ID = 4300
pos = 10,15
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = 20
supermovetime = 9999
sprpriority = 5
removeongethit = 1
supermove = 1
pausemove = 1

[State 4300, エフェクト表示]
type = Explod
trigger1 = AnimElem = 11
anim = 7061
ID = 10050
postype = P1
pos = 10,0
persistent = 0
sprpriority = -1
bindtime = -1
removetime = 90
ownpal = 1
supermove = 1
ignorehitpause = 1
removeongethit = 1

[State 4300, Helper]
type = Helper
trigger1 = AnimElem = 8
helpertype = Normal
name = "Chain Drive"
ID = 4300
stateno = 4100
pos = 2,-6
postype = p1
facing = 1
keyctrl = 0
ownpal = 1

[State 4300, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[Statedef 4100]
type     = S
movetype = A
physics  = S
juggle   = 0
velset   = 0,0
anim     = 3620
ctrl     = 0
sprpriority = 9

[State 4300, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 4300, PlaySnd]
type = PlaySnd
trigger1 = Time = 10
value = s8,0

[State 4300, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 10
value = s3,19

[State 4300, EnvShake]
type = EnvShake
trigger1 = animelem = 9
time = 45
freq = 100
ampl = -6

[State 4300, HitDef]
type = HitDef
trigger1 = gametime%5 = 0
attr = S, HP
damage = 25,3
getpower = 0,0
givepower = 0,0
animtype = Up
guardflag = M
hitflag = MAF
sprpriority = 9
priority = 7, Hit
pausetime = 0,6
guard.pausetime = 0,12
sparkno = s27002
guard.sparkno = s27502
sparkxy = -20,-75+(floor(p2bodydist Y))
hitsound = s4,1
guardsound = s3,13
ground.type = Hard
ground.slidetime = 20
ground.hittime   = 21
ground.velocity  = 0,-10
guard.velocity = -8
air.velocity = -1,-10
air.hittime = 12
air.fall = 1
fall.recover = 0
fall = 1
air.fall = 1
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
palfx.time = 40
palfx.add = 30,-40,-140
palfx.sinadd = 60,60,50,10
palfx.color = 0
palfx.invertall = 1
envshake.time = 10
envshake.ampl = -10
envshake.freq = 45
envshake.phase = 45

[State 4300, DestroySelf]
type = ChangeState
trigger1 = Time > 105
value = 4110

[Statedef 4110]
type = S
ctrl = 0
anim = 3630
velset = 0,0
sprpriority = 8

[State 4300, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State a]
type = AngleDraw
trigger1 = animelem = 7, > 0
value = 90
scale = 0.8,0.8

[State a]
type = posadd
trigger1 = animelem = 7
X = -20
Y = -100

[State 4300, Trans]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 200,256

[State 4300, DestroySelf]
type = DestroySelf
trigger1 = AnimTime = 0