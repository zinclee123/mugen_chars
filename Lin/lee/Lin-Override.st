[Statedef 0]
type = S
physics = S
sprpriority = 0

[State 0, 1]
type = ChangeAnim
trigger1 = Anim != var(1) && Anim != 5
trigger2 = Anim = 5 && AnimTime = 0 ;Turn anim over
value = var(1)

[State 0, 2]
type = VelSet
trigger1 = Time = 0
y = 0

[State 0, 3] ;Stop moving if low velocity or 4 ticks pass
type = VelSet
trigger1 = abs(vel x) < 2
trigger2 = Time = 4
x = 0

[State removeexplod]
type = removeexplod
trigger1 = time = 0
ID = 2

[State explod]
type = Explod
trigger1 = anim = 1
trigger1 = numexplod(2) = 0
anim = 2
id = 2
sprpriority = 2
postype = p1
pos = 0,0
bindtime = -1
supermove = 0
removetime = -1
under = 0
trans = addalpha
alpha = 255,110
ownpal = 1

[State 0, 4] ;Are you dead?
type = ChangeState
trigger1 = !alive
value = 5050


;---------------------------------------------------------------------------
; Jump Up
[Statedef 50]
type    = A
physics = A

[state a]
type = velset
trigger1 = vel y >= 8
y = 8

[State 50, 1]
type = VarSet
trigger1 = Time = 0
sysvar(1) = 0

[State 50, 2]
type = ChangeAnim
trigger1 = Time = 0
value = ifelse((vel x)=0, 41, ifelse((vel x)>0, 42, 43))

[State 50, 3]
type = ChangeAnim
trigger1 = Vel y > -2
trigger1 = SelfAnimExist(anim + 3)
persistent = 0
value = Anim + 3

;---------------------------------------------------------------------------
; Jump Land
[Statedef 52]
type    = S
physics = S
ctrl = 0
anim = 47

[state a]
type = turn
trigger1 = time = 0
trigger1 = p2dist x < 0

[State 52, 1]
type = VelSet
trigger1 = Time = 0
x = 0
y = 0

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 52, 3]
type = CtrlSet
trigger1 = Time = 1
value = 1

[State 52, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;前冲
[Statedef 100]
type    = S
physics = S
anim = 100
sprpriority = 1
ctrl = 1

[State 00]
type = PlaySnd
trigger1 = Time= 0
value = 100, 0
loop = 1
channel = 1

[State 01]
type = VelSet
trigger1 = animelem = 2,>=0
x = const(velocity.run.fwd.x)

[State 02] ;Prevent run from canceling into walk
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 03] ;Prevent from turning
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 04]
type = ChangeState
trigger1 = command != "holdfwd"
trigger1 = time >= 14
value = 101


;---------------------------------------------------------------------------
;前冲停止
[Statedef 101]
type    = S
physics = S
anim = 101
sprpriority = 1
velset = 0,0
ctrl = 1

[State 00]
type = stopSnd
trigger1 = Time= 0
channel = 1

[State 04]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1



;---------------------------------------------------------------------------
;后撤
[Statedef 105]
type    = S
physics = N
ctrl = 0
anim = 105
sprpriority = 1
velset = 0.0

[State 105]
type = PlaySnd
trigger1 = animelem = 3
value = 105, 0

[state 105]
type = statetypeset
trigger1 = animelem = 3
value = A

[State 105]
type = VelSet
trigger1 = animelem = 3
x = -9
y = -1

[state 105]
type = veladd
trigger1 = animelem = 3,>=0
y = 0.20

[state 105]
type = velmul
trigger1 = 1
x = 0.99


[State 105]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 106

;---------------------------------------------------------------------------
;前冲下落
[Statedef 106]
type    = S
physics = N
ctrl = 0
anim = 106
velset = 0,0

[State 106];
type = PlaySnd
trigger1 = time = 0
value = 41,0

[State 106]
type = VelSet
trigger1 = Time = 0
x = 0
y = 0

[State 106]
type = PosSet
trigger1 = Time = 0
y = 0

[State 106]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
[Statedef 170]
type = S
ctrl = 0
anim = 170
velset = 0,0

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

;---------------------------------------------------------------------------
[Statedef 175]
type = S
ctrl = 0
anim = 175
velset = 0,0

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

;---------------------------------------------------------------------------
[Statedef 180]
type = S

[State 180]
type = ChangeState
trigger1 = var(9) = 3
trigger1 = time = 0
value = 184


[State 180]
type = ChangeState
trigger1 = var(7) = 1
trigger1 = time = 0
value = 185

[State 180]
type = ChangeState
trigger1 = var(1) = 0
trigger1 = time = 0
value = 181+random%3

;---------------------------------------------------------------------------
;通常胜利1
[Statedef 181]
type = S
ctrl = 0
anim = 181
velset = 0,0

[State 181]
type = PlaySnd
trigger1 = animelem = 1
value = 181,0

[State 181]
type = Explod
trigger1 = time = 0
anim = 182
id = 3000
sprpriority = 2
postype = p1
pos = 0,0
bindtime = -1
supermove = 0
removetime = -1
under = 0
ownpal = 1

[state 181]
type = Helper
trigger1 = matchover = 1
trigger1 = time = 140
id = 8500
name = "g"
sprpriority = 1
pos = 0,0
postype = p1
stateno = 8500
helpertype = normal
pausemovetime = 999999
keyctrl = 1 
ownpal = 1

[State 181, 4]
type = AssertSpecial
trigger1 = time = [0,170]
flag = roundnotover

;---------------------------------------------------------------------------
;通常胜利2
[Statedef 182]
type = S
ctrl = 0
anim = 183
velset = 0,0

[State 182]
type = PlaySnd
trigger1 = animelem = 10
value = 182,0

[State 182]
type = Explod
trigger1 = animelem = 10
anim = 184
id = 3000
sprpriority = 2
postype = p1
pos = -9,3
bindtime = -1
supermove = 0
under = 0
trans = addalpha
alpha = 245,80
ownpal = 1

[state 182]
type = Helper
trigger1 = matchover = 1
trigger1 = time = 130
id = 8500
name = "g"
sprpriority = 1
pos = 0,0
postype = p1
stateno = 8500
helpertype = normal
pausemovetime = 999999
keyctrl = 1 
ownpal = 1

[State 182, 4]
type = AssertSpecial
trigger1 = time = [0,160]
flag = roundnotover

;---------------------------------------------------------------------------
;通常胜利3
[Statedef 183]
type = S
ctrl = 0
anim = 185
velset = 0,0

[State 183]
type = PlaySnd
trigger1 = animelem = 2
value = 183,0

[state 183]
type = Helper
trigger1 = matchover = 1
trigger1 = time = 130
id = 8500
name = "g"
sprpriority = 1
pos = 0,0
postype = p1
stateno = 8500
helpertype = normal
pausemovetime = 999999
keyctrl = 1 
ownpal = 1

[State 183]
type = AssertSpecial
trigger1 = time = [0,150]
flag = roundnotover


;---------------------------------------------------------------------------
;通常胜利4 红丸专用
[Statedef 184]
type = S
ctrl = 0
anim = 186
velset = 0,0

[State 184]
type = PlaySnd
trigger1 = animelem = 6
value = 184,0

[state 184]
type = Helper
trigger1 = matchover = 1
trigger1 = time = 150
id = 8500
name = "g"
sprpriority = 1
pos = 0,0
postype = p1
stateno = 8500
helpertype = normal
pausemovetime = 999999
keyctrl = 1 
ownpal = 1

[State 184]
type = AssertSpecial
trigger1 = time = [0,170]
flag = roundnotover

;---------------------------------------------------------------------------
;通常胜利5 ネスツ専用
[Statedef 185]
type = S
ctrl = 0
anim = 187
velset = 0,0

[State 185]
type = PlaySnd
trigger1 = time = 0
value = 185,0

[State 185]
type = PlaySnd
trigger1 = time = 74
value = 185,1

[State 185]
type = PlaySnd
trigger1 = time = 141
value = 185,2

;飞贼四天王
[State 185]
type = Explod
trigger1 = time = 0
anim = 188
id = 3000
sprpriority = 2
postype = p1
pos = 32,0
bindtime = -1
supermove = 0
under = 0
ownpal = 1
facing = -1

[State 185]
type = EnvColor
trigger1 = time = 21
trigger2 = time = 23
trigger3 = time = 56
trigger4 = time = 58
time = 1
value = 255,255,255
under = 2


[state 185]
type = Helper
trigger1 = matchover = 1
trigger1 = time = 220
id = 8500
name = "g"
sprpriority = 1
pos = 0,0
postype = p1
stateno = 8500
helpertype = normal
pausemovetime = 999999
keyctrl = 1 
ownpal = 1

[State 185]
type = AssertSpecial
trigger1 = time = [0,240]
flag = roundnotover


;---------------------------------------------------------------------------
; 登场
[Statedef 190]
type = S
ctrl = 0
anim = 190
velset = 0,0

[state 190]
type = null;changestate
trigger1 = p2name = "yashiro" || p4name = "yashiro"
trigger2 = p2name = "Yashiro Nanakase" || p4name = "Yashiro Nanakase"
trigger3 = p2name = "orochiyashiro" || p4name = "orochiyashiro"
trigger4 = p2name = "orochi yashiro" || p4name = "orochi yashiro"
trigger5 = p2name = "orochi_yashiro" || p4name = "orochi_yashiro"
trigger6 = p2name = "Shermie" || p4name = "Shermie"
trigger7 = p2name = "orochiShermie" || p4name = "orochiShermie"
trigger8 = p2name = "orochi Shermie" || p4name = "orochi Shermie"
trigger9 = p2name = "orochi_Shermie" || p4name = "orochi_Shermie"
value = 191

[state 190]
type = changestate
trigger1 = p2name = "ORIGINAL ZERO" || p4name = "ORIGINAL ZERO"
trigger2 = p2name = "ZERO-KO" || p4name = "ZERO-KO"
value = 192

[State 190]
type = PlaySnd
trigger1 = animelem = 9
value = 190,0

[State 190]
type = Explod
trigger1 = animelemtime(7) = 3
anim = 191
id = 3000
sprpriority = 2
postype = p1
pos = 0,0
bindtime = -1
supermove = 0
under = 0
trans = addalpha
alpha = 245,80
ownpal = 1

[State 1020, 4]
type = EnvShake
trigger1 = animelem = 9
time = 20
ampl = -6
freq = 95
phase = 95

[State 191, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 191, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0

;---------------------------------------------------------------------------
;登场(飞贼、影二)
[Statedef 191]
type = S
ctrl = 0
anim = 191
velset = 0,0

[State 191]
type = PlaySnd
trigger1 = var(5) = 0
trigger1 = animelem = 3
value = 191,0

[State 191]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 191]
type = ChangeState
trigger1 = AnimTime = 0
value = 0


;---------------------------------------------------------------------------
;登场 オリジナルゼロ
[Statedef 192]
type = S
ctrl = 0
anim = 193
velset = 0,0

[State 192]
type = PlaySnd
trigger1 = animelem = 2
value = 192,0

[State 191, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 191, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0

;---------------------------------------------------------------------------
;挑衅
[Statedef 199]
type = S
ctrl = 0
anim = 199
velset = 0,0
movetype = I
physics = N
sprpriority = 2

[State 195, 1]
type = CtrlSet
trigger1 = Time = 33
value = 1

[State 195, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;===========================================================================
; Guard Crash
;===========================================================================
[Statedef 5700]
type     = S
movetype = H
physics  = N
sprpriority = -1
facep2 = 1

[State 5700, ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 5700

[State 5700, PosSet]
type = PosSet
trigger1 = Time = 0
y = 0

[State 5700, VelSet]
type = VelSet
trigger1 = time = 0
x = -10

[State 5700, VelMul]
type = VelMul
trigger1 = 1
x = .85

[State 5700, SelfState]
type = SelfState
trigger1 = time >= 35
value = 0
ctrl = 1