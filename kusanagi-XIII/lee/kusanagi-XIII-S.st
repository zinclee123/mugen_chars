;---------------------------------------------------------------------------
; ここからは必殺技のステ?ト
;---------------------------------------------------------------------------
; 弱百八式・闇払い

[Statedef 1000]
type     = S
movetype = A
physics  = S
juggle   = 0
poweradd = 0
velset   = 0,0
anim     = 1000
ctrl     = 0
sprpriority = 3

[State a]
type = varadd
triggerall = statetype != A
triggerall = movetype!=H
triggerall = time = 0
trigger1 = prevstateno=[1000,1999]
v = 20
value = -180

[State 30000]
type = Explod
trigger1 = AnimElem = 5
anim = 13038
postype = p1
pos = -10,0
scale = 0.5,0.5
sprpriority = 5
id = 13020
ownpal = 1
facing = 1
pausemovetime = 999
supermovetime = 999
bindtime = 0

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = s10,10
channel = 4

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = s3500,15

[State 1000, ヘルパーを出す]
type = Helper
trigger1 = AnimElem = 5
name = "DIBO"
stateno = 1011
ID = 1011
helpertype = normal
pos = 30,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1

[State 1000, エフェクト?示]
type = Explod
trigger1 = AnimElem = 5
persistent = 0
anim = 13025
postype = P1
pos = 10,-25
sprpriority = 5
bindtime = 1
ownpal = 1

[State 1000, エフェクト?示]
type = Explod
trigger1 = AnimElem = 5
persistent = 0
anim = 13027
postype = P1
pos = 30,0
sprpriority = 6
bindtime = 1
ownpal = 1

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;-------------------------------------------------------------------------------
[Statedef 1001]
type    = S
movetype= I
physics = N
velset = 4,0
anim = 999
sprpriority = 1

[State 1000, Explod]
type = Explod
trigger1 = timemod = 6,0
trigger1 = time > 5
anim = f4148
pos = 0,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
sprpriority = 1

[State 1000, 4]
type = destroyself
trigger1 = time > 0
trigger1 = parent, numprojID(1000) = 0
;---------------------------------------------------------------------------
; 強百八式・闇払い

[Statedef 1050]
type     = S
movetype = A
physics  = S
juggle   = 0
velset   = 0,0
anim     = 1050
ctrl     = 0
sprpriority = 3

[State a]
type = varadd
triggerall = statetype != A
triggerall = movetype!=H
triggerall = time = 0
trigger1 = prevstateno=[1000,1999]
v = 20
value = -180

[State 30000, 底?]
type = Explod
trigger1 = AnimElem = 5
anim = 13038
postype = p1
pos = -10,0
scale = 0.5,0.5
sprpriority = 5
id = 13020
facing = 1
ownpal = 1
pausemovetime = 999
supermovetime = 999
bindtime = 0

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = s10,10
channel = 4

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = s3500,15

[State 1000, ヘルパーを出す]
type = Helper
trigger1 = AnimElem = 5
name = "DIBO"
stateno = 1012
ID = 1012
helpertype = normal
pos = 30,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1

[State 1000, エフェクト?示]
type = Explod
trigger1 = AnimElem = 5
persistent = 0
anim = 13025
postype = P1
pos = 10,-25
sprpriority = 5
bindtime = 1
ownpal = 1

[State 1000, エフェクト?示]
type = Explod
trigger1 = AnimElem = 5
persistent = 0
anim = 13027
postype = P1
pos = 30,0
sprpriority = 6
bindtime = 1
ownpal = 1

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;-------------------------------------------------------------------------------
[Statedef 1002]
type    = S
movetype= I
physics = N
velset = 7,0
anim = 999
sprpriority = 1

[State 1000, Explod]
type = Explod
trigger1 = timemod = 6,0
trigger1 = time > 5
anim = f4148
pos = 0,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
sprpriority = 1

[State 1000, 4]
type = destroyself
trigger1 = time > 0
trigger1 = parent, numprojID(1000) = 0
;---------------------------------------------------------------------------
; 弱百式・鬼焼き?発動
[Statedef 1100]
type     = S
movetype = A
physics  = S
juggle   = 0
poweradd = 100
velset   = 0,0
anim     = 1100
ctrl     = 0
sprpriority = 3

[State a]
type = varadd
triggerall = statetype != A
triggerall = movetype!=H
triggerall = time = 0
trigger1 = prevstateno=[1000,1999]
v = 20
value = -180

[State 0, PalFX]
type = PalFX
triggerall = var(20)
triggerall = time < 8
trigger1 = prevstateno >= 1000 && var(20) > 0
time = 1
add = 255,255,255
sinadd = 0,0,0
invertall = 0
color = 256
ignorehitpause = 1
persistent = 2

[State 1000, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 210, 物理的なキャラの幅]
type = Width
trigger1 = 1
edge = 20,0

[State 1200, ]
type = ReversalDef
trigger1 = 1
reversal.attr = SCA,AA
numhits = 0
pausetime = 10,12
sparkno = s13022
hitsound = s2,1
ID = 1155

[State 1000, PosAdd]
type = PosAdd
triggerall = Numtarget(1155)
trigger1 = Enemynear,Movereversed = 1
x = Ifelse(Gametime%2=0,1,-1)
y = 0
ignorehitpause = 1
persistent = 1

[State 1000, MoveHitReset]
type = MoveHitReset
triggerall = Numtarget(1155)
trigger1 = Enemynear,Movereversed = 1
ignorehitpause = 1
persistent = 1

[State 1000, Helper]
type = Helper
trigger1 = time = 3
helpertype = normal
name = "colicion"
stateno = 1101
Id = 1101
pos = 0,0
postype = p1
facing = 1
ownpal = 1

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 1105
;--------------------------------------------------------------------------
;Colicion
[StateDef 1101]
type = S
movetype= A
physics = S
juggle  = 0
velset = 0,0
ctrl = 0
anim = 1602
poweradd = 0

[State 3110, 2]
type = BindToParent
trigger1 = 1
pos = 20,0

[State 3110, 2]
type = BindToParent
trigger1 = parent,statetype = A
pos = 20,-40

[state 1000]
type = nothitby
trigger1 = 1
value = SCA

[state 1000]
type = hitby
trigger1 = 1
value = SCA,NP,SP
ignorehitpause = 1

[state 1000]
type = hitoverride
trigger1 = 1
attr = SCA,NP,SP
stateno = 1101
ignorehitpause = 1

[state 1000, destroyself]
type = destroyself
trigger1 = parent,movetype = H
trigger2 = time = 24
;---------------------------------------------------------------------------
; 弱百式・鬼焼き?攻撃

[Statedef 1105]
type     = S
movetype = A
physics  = S
juggle   = 0
poweradd = 0
velset   = 0,0
anim     = 1105
ctrl     = 0
sprpriority = 5

[State Helper]
Type               = Helper 
Triggerall         = random < 150
Trigger1         = movehit = 1
Name               = "Skill_Fire" 
ID                 = 7000 + ID
Pos                = 0,0
PosType            = P2 
StateNo            = 7000
OwnPal             = 1 
IgNoreHitPause     = 1 

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 1
value = s10,11
channel = 4

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = s3500,14

[State 210, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemTime (1) >= 0 && AnimElemTime (3) <= 0
edge = 30,0

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 1
x = 18

[State 1000, 軸位置移動]
type = Velset
trigger1 = AnimElem = 2
x = 3.2
y = -5.5

[State 1000, 軸位置移動]
type = VelAdd
trigger1 = AnimElemtime(2) > 0
y = .38

[State 6000, 3]
type = StateTypeSet
trigger1 = AnimElem = 2
statetype = A

[State 1100, エフェクト?示]
type = Explod
trigger1 = AnimElem = 2
persistent = 0
anim = 13031
postype = P1
bindtime = 1
vel = .1,-.1
pos = 50,-5
ownpal = 1
sprpriority = 10

[State 200, ヒット定?]
type = HitDef
trigger1 = time = 0
attr = S, SA
damage = 80,18
getpower = 50,50
givepower = 16,16
animtype = hard
guardflag = M
hitflag = MAF
priority = 5, Hit
pausetime = 12,12
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -25, -60
hitsound = s1,1
guardsound = s2,1
ground.type = High
ground.slidetime = 35
ground.hittime = 18
ground.velocity = -2.3,-9.5
air.velocity = -2.3,-9
airguard.velocity = -5,-7
guard.velocity = -10
air.type = High
air.hittime = 12
fall = 1
fall.recovertime = 50
palfx.time = 50
palfx.add = 80,-40,-140
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,15
palfx.invertall = 1
palfx.color = 0
yaccel = .5
ground.cornerpush.veloff = -5
EnvShake.Time      =  4
EnvShake.Ampl      = -7
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
id = 1105

[State 200, ヒット定?]
type = HitDef
triggerall = moveguarded
trigger1 = animelem = 2
attr = S, SA
damage = 40,10
getpower = 50,50
givepower = 16,16
animtype = hard
guardflag = M
hitflag = MAF
priority = 5, Hit
pausetime = 12,12
sparkno = 3
guard.sparkno = 50
sparkxy = -25, -65
hitsound = s1,1
guardsound = s2,1
ground.type = High
ground.slidetime = 16
ground.hittime  = 20
ground.velocity = -2.3,-9.5
air.velocity = -2.3,-9
guard.velocity = -12
airguard.velocity = -5,-7
air.type = High
air.hittime = 12
fall = 1
palfx.time = 50
palfx.add = 80,-40,-140
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,15
palfx.invertall = 1
palfx.color = 0
yaccel = .5
ground.cornerpush.veloff = 0
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
id = 1105

[State 200, ヒット定?]
type = HitDef
triggerall = numexplod(4150) = 1
trigger1 = animelem = 2
attr = S, SA
damage = 40,10
animtype = hard
guardflag = M
hitflag = MAF
getpower = 50,50
givepower = 16,16
priority = 5, Hit
pausetime = 12,12
sparkno = 3
guard.sparkno = 50
sparkxy = -15, -75
hitsound = s1,1
guardsound = s2,1
ground.type = High
ground.slidetime = 5
ground.hittime  = 20
ground.velocity = -2.3,-9.5
air.velocity = -2.3,-9
airguard.velocity = -5,-7
guard.velocity = -12
air.type = High
air.hittime = 12
fall = 1
palfx.time = 50
palfx.add = 80,-40,-140
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,15
palfx.invertall = 1
palfx.color = 0
yaccel = .5
ground.cornerpush.veloff = 0
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
id = 1105

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = Movehit = 1
value = s3500,13

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1120
;---------------------------------------------------------------------------
; 着地

[Statedef 1120]
type     = S
movetype = I
physics  = S
juggle   = 0
poweradd = 0
velset   = 0,0
anim     = 1120
ctrl     = 0
sprpriority = 2


[State 30000]
type = Explod
trigger1 = time = 0
anim = 13036
postype = p1
scale = 0.5,0.5
pos = 0,-5
sprpriority = 5
id = 13020
bindtime = 0
pausemovetime = 999
ownpal = 1
supermovetime = 999

[State 52, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = s4,0
volumescale = 50

[State 1000,]
type = Posset
trigger1 = time = 0
y = 0

[State 1000, 軸位置移動]
type = Velset
trigger1 = time = 0
x = 0
y = 0

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
; 強百式・鬼焼き?発動

[Statedef 1150]
type     = S
movetype = A
physics  = S
juggle   = 0
poweradd = 100
velset   = 0,0
anim     = 1150
ctrl     = 0
sprpriority = 3

[State a]
type = varadd
triggerall = statetype != A
triggerall = movetype!=H
triggerall = time = 0
trigger1 = prevstateno= [1000,1999]
var(20) = -128

[State 0, PalFX]
type = PalFX
triggerall = var(20)
triggerall = time < 8
trigger1 = prevstateno >= 1000 && var(20) > 0
time = 1
add = 255,255,255
sinadd = 0,0,0
invertall = 0
color = 256
ignorehitpause = 1
persistent = 2

[State 1000, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 210, 物理的なキャラの幅]
type = Width
trigger1 = 1
edge = 20,0

[State 1200, ]
type = ReversalDef
trigger1 = 1
reversal.attr = SCA,AA
numhits = 0
pausetime = 10,12
sparkno = s13022
hitsound = s2,1
ID = 1155

[State 1000, PosAdd]
type = PosAdd
triggerall = Numtarget(1155)
trigger1 = Enemynear,Movereversed = 1
x = Ifelse(Gametime%2=0,1,-1)
y = 0
ignorehitpause = 1
persistent = 1

[State 1000, MoveHitReset]
type = MoveHitReset
triggerall = Numtarget(1155)
trigger1 = Enemynear,Movereversed = 1
ignorehitpause = 1
persistent = 1

[State 1000, Helper]
type = Helper
trigger1 = time = 4
helpertype = normal
name = "colicion"
stateno = 1102
Id = 1101
pos = 0,0
postype = p1
facing = 1
ownpal = 1

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 1155
;--------------------------------------------------------------------------
;Colicion
[StateDef 1102]
type = S
movetype= A
physics = S
juggle  = 0
velset = 0,0
ctrl = 0
anim = 1602
poweradd = 0

[State 3110, 2]
type = BindToParent
trigger1 = 1
pos = 20,0

[State 3110, 2]
type = BindToParent
trigger1 = parent,statetype = A
pos = 20,-40

[state 1000]
type = nothitby
trigger1 = 1
value = SCA

[state 1000]
type = hitby
trigger1 = 1
value = SCA,NP,SP
ignorehitpause = 1

[state 1000]
type = hitoverride
trigger1 = 1
attr = SCA,NP,SP
stateno = 1102
ignorehitpause = 1

[state 1000, destroyself]
type = destroyself
trigger1 = parent,movetype = H
trigger2 = time = 30
;---------------------------------------------------------------------------
; 強百式・鬼焼き?攻撃

[Statedef 1155]
type     = S
movetype = A
physics  = S
juggle   = 0
velset   = 0,0
anim     = 1155
ctrl     = 0
sprpriority = 5

[State Helper]
Type               = Helper 
Triggerall         = random < 150
Trigger1         = movehit = 1
Name               = "Skill_Fire" 
ID                 = 7000 + ID
Pos                = 0,0
PosType            = P2 
StateNo            = 7000
OwnPal             = 1 
IgNoreHitPause     = 1 

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 1
value = s10,11
channel = 4

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = s3500,14

[State 210, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemTime (1) >= 0 && AnimElemTime (3) <= 0
edge = 30,0

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 1
x = 18

[State 1000, 軸位置移動]
type = Velset
trigger1 = AnimElem = 2
x = 3.8
y = -7.5

[State 1000, 軸位置移動]
type = VelAdd
trigger1 = AnimElemtime(2) > 0
y = .42

[State 6000, 3]
type = StateTypeSet
trigger1 = AnimElem = 2
statetype = A

[State 1100, エフェクト?示]
type = Explod
trigger1 = AnimElem = 2
persistent = 0
anim = 13031
postype = P1
ownpal = 1
bindtime = 1
vel = .1,-.1
pos = 50,-5
sprpriority = 10

[State 1155,无敌,覆盖攻击第一F]
type = NotHitBy
trigger1 = Time <= 1
value = SCA
time = 1

[State 200, ヒット定?]
type = HitDef
trigger1 = AnimElem = 1
attr = S, SA
damage = 70,10
getpower = 50,50
givepower = 16,16
animtype = Hard
guardflag = M
hitflag = MAF
priority = 5, Hit
pausetime = 13,13
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -25, -60
hitsound = s1,1
guardsound = s2,1
ground.type = High
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = -9
air.velocity = -2.3,-9
airguard.velocity = -5,-7
guard.velocity = -12
air.type = High
air.hittime = 12
air.fall = 1
fall.recovertime = 30
palfx.time = 25
palfx.add = 80,-40,-140
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,15
palfx.invertall = 1
palfx.color = 0
yaccel = .5
ground.cornerpush.veloff = -5
EnvShake.Time      =  6
EnvShake.Ampl      = -10
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
id = 1155

[State 200, ヒット定?]
type = HitDef
trigger1 = AnimElem = 2
trigger2 = Movecontact = 0 && AnimElem = 2
trigger2 = AnimElem = 3
attr = A, SA
damage = 30,10
getpower = 50,50
givepower = 16,16
animtype = hard
guardflag = M
hitflag = MAF
priority = 5, Hit
pausetime = 12,12
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -25, -60
hitsound = s1,1
guardsound = s2,1
ground.type = High
ground.slidetime = 35
ground.hittime = 20
ground.velocity = -2.3,-10
air.velocity = -2.3,-9
airguard.velocity = -5,-7
guard.velocity = -12
air.type = High
air.hittime = 12
fall = 1
fall.recovertime = 30
guard.velocity = -10
palfx.time = 60
palfx.add = 80,-40,-140
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,15
palfx.invertall = 1
palfx.color = 0
yaccel = .5
ground.cornerpush.veloff = 0
EnvShake.Time      =  8
EnvShake.Ampl      = -12
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
id = 1156


[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = Movehit = 1
value = s3500,13

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1160

;---------------------------------------------------------------------------
; 着地
[Statedef 1160]
type     = S
movetype = I
physics  = S
juggle   = 0
poweradd = 0
velset   = 0,0
anim     = 1160
ctrl     = 0
sprpriority = 2

[State 30000]
type = Explod
trigger1 = time = 0
anim = 13036
postype = p1
scale = 0.5,0.5
pos = 0,0
sprpriority = 5
id = 13020
ownpal = 1
bindtime = 0
pausemovetime = 999
supermovetime = 999

[State 52, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = s4,0
volumescale = 50

[State 1000,]
type = Posset
trigger1 = time = 0
y = 0

[State 1000, 軸位置移動]
type = Velset
trigger1 = time = 0
x = 0
y = 0

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 弱七拾五式・改

[Statedef 1200]
type     = S
movetype = A
physics  = S
juggle   = 0
poweradd = 40
velset   = 0,0
anim     = 1200
ctrl     = 0
sprpriority = 5

[State a]
type = varadd
triggerall = statetype != A
triggerall = movetype!=H
triggerall = time = 0
trigger1 = prevstateno=[1000,1999]
v = 20
value = -180

[State 0, PalFX]
type = PalFX
triggerall = var(20)
triggerall = time < 8
trigger1 = prevstateno >= 1000 && var(20) > 0
time = 1
add = 255,255,255
sinadd = 0,0,0
invertall = 0
color = 256
ignorehitpause = 1
persistent = 2

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 5
value = s3,0
channel = 4

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 6
value = s10,12
channel = 4

[State 210, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemTime (2) >= 0 && AnimElemTime (6) <= 0
edge = 30,0

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 2 | AnimElem = 3
x = 5

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 5
x = 10

[State 1000, 軸位置移動]
type = Velset
trigger1 = AnimElemtime(5) >= 0
x = 2.5

[State 1000, 軸位置移動]
type = Velset
trigger1 = AnimElem = 6
y = -4

[State 1000, 軸位置移動]
type = VelAdd
trigger1 = AnimElemtime(6) > 0
y = .35

[State 6000, 3]
type = StateTypeSet
trigger1 = AnimElem = 6
statetype = A

[State 1000, 1]
type = PlaySnd
trigger1 = time = 12
value = 0,3

[State 200, ヒット定?]
type = HitDef
trigger1 = time = 0
attr = A, SA
damage = 20,10
getpower = 40,40
givepower = 16,16
animtype = Hard
guardflag = M
hitflag = MAF
priority = 5, Hit
pausetime = 10,8
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -25, -70
hitsound = s1,3
guardsound = s2,1
ground.type = High
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = -7
air.velocity = -2.5,-5
yaccel = .45
air.type = High
air.hittime = 12
air.fall = 1
fall.recover = 0
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
id = 1200

[State 1000, ]
type = Varset
triggerall = var(59) = 0
trigger1 = time = 0
var(16) = 0

[State 1000, ]
type = Varset
triggerall = var(59) = 0
triggerall = AnimElemtime(6) >= 0 && AnimElemtime(9) < 0
trigger1 = command = "a"
var(16) = 1

[State 1000,]
type = ChangeState
triggerall = var(59) = 0
trigger1 = AnimElemtime(8) >= 0 && AnimElemtime(9) < 0
trigger1 = var(16) = 1
value = 1205

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1120

;---------------------------------------------------------------------------
; 弱七拾五式・改二段目

[Statedef 1205]
type     = A
movetype = A
physics  = N
juggle   = 8
anim     = 1205
ctrl     = 0
sprpriority = 5

[State 1000, 1]
type = PlaySnd
trigger1 = time = 3
value = 0,3

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = s0,3
channel = 4

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = s10,13
channel = 4

[State 210, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemTime (1) >= 0 && AnimElemTime (5) <= 0
edge = 30,0

[State 1000, 軸位置移動]
type = VelAdd
trigger1 = 1
y = .25

[State 200, ヒット定?]
type = HitDef
trigger1 = time = 0
attr = A, SA
damage = 30,7
getpower = 40,40
givepower = 16,16
animtype = Hard
guardflag = M
hitflag = MAF
priority = 5, Hit
pausetime = 8,13
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -25, -70
hitsound = s1,3
guardsound = s2,1
ground.type = High
ground.slidetime = 14
ground.hittime  = 14
ground.velocity = -2.3,-9
guard.velocity = -9
air.velocity = -2.3,-8
yaccel = .45
air.type = High
air.hittime = 12
fall = 1
fall.recover = 0
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
EnvShake.Time      =  8
EnvShake.Ampl      = -12
id = 1205

[State 1000, ]
type = Varset
triggerall = var(59) = 0
trigger1 = time = 0
var(16) = 0

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1120

;---------------------------------------------------------------------------
; 強七拾五式・改

[Statedef 1250]
type     = S
movetype = A
physics  = S
juggle   = 6
poweradd = 40
velset   = 0,0
anim     = 1250
ctrl     = 0
sprpriority = 5

[State a]
type = varadd
triggerall = statetype != A
triggerall = movetype!=H
triggerall = time = 0
trigger1 = prevstateno=[1000,1999]
v = 20
value = -180

[State 0, PalFX]
type = PalFX
triggerall = var(20)
triggerall = time < 8
trigger1 = prevstateno >= 1000 && var(20) > 0
time = 1
add = 255,255,255
sinadd = 0,0,0
invertall = 0
color = 256
ignorehitpause = 1
persistent = 2

[State 1000, 1]
type = PlaySnd
trigger1 = time = 17
value = 0,3

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 5
value = s3,0
channel = 4

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 6
value = s10,12
channel = 4

[State 210, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemTime (2) >= 0 && AnimElemTime (6) <= 0
edge = 30,0

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 2 | AnimElem = 3
x = 5

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 5
x = 10

[State 1000, 軸位置移動]
type = Velset
trigger1 = AnimElemtime(4) >= 3
x = 3

[State 1000, 軸位置移動]
type = Velset
trigger1 = AnimElem = 6
y = -4

[State 1000, 軸位置移動]
type = VelAdd
trigger1 = AnimElemtime(6) > 0
y = .375

[State 6000, 3]
type = StateTypeSet
trigger1 = AnimElem = 6
statetype = A

[State 200, ヒット定?]
type = HitDef
trigger1 = time = 0
attr = A, SA
damage = 20,10
getpower = 40,40
givepower = 16,16
animtype = Hard
guardflag = M
hitflag = MAF
priority = 5, Hit
pausetime = 10,10
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -25, -70
hitsound = s1,3
guardsound = s2,1
ground.type = High
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = -4,-6
air.velocity = -4,-6
yaccel = .45
air.type = High
air.hittime = 12
fall = 1
fall.recover = 0
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
id = 1250
guard.cornerpush.veloff = -8

[State 1000, ]
type = Varset
triggerall = var(59) = 0
trigger1 = time = 0
var(16) = 0

[State 1000, ]
type = Varset
triggerall = var(59) = 0
triggerall = AnimElemtime(6) >= 0 && AnimElemtime(9) < 0
trigger1 = command = "b"
var(16) = 1

[State 1000,]
type = ChangeState
triggerall = var(59) = 0
trigger1 = AnimElemtime(8) >= 0 && AnimElemtime(9) < 0
trigger1 = var(16) = 1
value = 1255

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1260

;---------------------------------------------------------------------------
; 強七拾五式・改?二段目

[Statedef 1255]
type     = A
movetype = A
physics  = N
juggle   = 1
anim     = 1255
ctrl     = 0
sprpriority = 5

[State 1000, 1]
type = PlaySnd
trigger1 = time = 4
value = 0,3

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = s0,3
channel = 4

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = s10,13
channel = 4

[State 210, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemTime (1) >= 0 && AnimElemTime (5) <= 0
edge = 30,0

[State 1000, 軸位置移動]
type = VelAdd
trigger1 = 1
x = -.07
y = .28

[State 200, ヒット定?]
type = HitDef
trigger1 = time = 0
attr = A, SA
damage = 30,7
getpower = 40,40
givepower = 16,16
animtype = up
guardflag = M
hitflag = MAF
priority = 5, Hit
pausetime = 13,13
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -25, -70
hitsound = s1,3
guardsound = s2,1
ground.type = High
ground.slidetime = 21
ground.hittime  = 21
ground.velocity = -2.2,-11
guard.velocity = -10
air.velocity = -2.2,-11
yaccel = .54
air.type = High
air.hittime = 12
fall = 1
fall.recover = 0
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
EnvShake.Time      =  8
EnvShake.Ampl      = -12
id = 1255
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = -15


[state 2]
type = varset
trigger1 = movehit
var(17) = 1

[State 1000, ]
type = Varset
triggerall = var(59) = 0
trigger1 = time = 0
var(16) = 0

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1260

;---------------------------------------------------------------------------
; 着地

[Statedef 1260]
type     = S
movetype = I
physics  = S
juggle   = 0
poweradd = 0
anim     = 1260
ctrl     = 0
sprpriority = 2

[State 1260]
type = velset
trigger1 = time = 0
y = 0

[State 30000, 底]
type = Explod
trigger1 = time = 0
anim = 13036
postype = p1
scale = 0.5,0.5
pos = 0,-5
sprpriority = 5
ownpal = 1
id = 13020
bindtime = 0
pausemovetime = 999
supermovetime = 999

[State 52, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = s4,0
volumescale = 50

[State 1000,]
type = Posset
trigger1 = time = 0
y = 0

[State 1000, 軸位置移動]
type = Velset
trigger1 = time = 0
x = 0
y = 0

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 弱九百拾式・?摘み

[Statedef 1300]
type     = S
movetype = A
physics  = S
juggle   = 8
poweradd = 40
velset   = 0,0
anim     = 1300
ctrl     = 0
sprpriority = 2

[State a]
type = varadd
triggerall = statetype != A
triggerall = movetype!=H
triggerall = time = 0
trigger1 = prevstateno=[1000,1999]
v = 20
value = -180

[State 30000]
type = Explod
trigger1 = time = 10
anim = 13038
postype = p1
pos = 0,0
scale = 0.5,0.5
sprpriority = 5
id = 13020
ownpal = 1
facing = 1
pausemovetime = 999
supermovetime = 999
bindtime = 0

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 1
value = s10,18
channel = 4

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = s0,1

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 2 | AnimElem = 3
x = 10

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 9
x = -20

[State 1000, ]
type = ReversalDef
triggerall = var(21)
trigger1 = 1
reversal.attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
sparkno = s13022
hitsound = s2,1
pausetime = 12,14
p1stateno = 1305
sparkxy = 15,-70

[State 1000, ]
type = ReversalDef
triggerall = !var(21)
trigger1 = AnimElem = 2
reversal.attr = SCA,AA
sparkno = s13022
hitsound = s2,1
pausetime = 12,14
p1stateno = 1305
sparkxy = 15,-70

[State 1000, PosAdd]
type = PosAdd
triggerall = Numtarget(1155)
trigger1 = Enemynear,Movereversed = 1
x = Ifelse(Gametime%2=0,1,-1)
y = 0
ignorehitpause = 1
persistent = 1

[State 1000, MoveHitReset]
type = MoveHitReset
triggerall = Numtarget(1155)
trigger1 = Enemynear,Movereversed = 1
ignorehitpause = 1
persistent = 1

[State 1000, ]
type = ReversalDef
trigger1 = AnimElem = 4
reversal.attr = SCA,AA
sparkno = s13022
hitsound = s2,1
pausetime = 12,14
p1stateno = 1310
sparkxy = 15,-70

[State 1000, PosAdd]
type = PosAdd
triggerall = Numtarget(1155)
trigger1 = Enemynear,Movereversed = 1
x = Ifelse(Gametime%2=0,1,-1)
y = 0
ignorehitpause = 1
persistent = 1

[State 1000, MoveHitReset]
type = MoveHitReset
triggerall = Numtarget(1155)
trigger1 = Enemynear,Movereversed = 1
ignorehitpause = 1
persistent = 1

[State 200, ヒット定?]
type = HitDef
trigger1 = AnimElem = 5
trigger2 = AnimElem = 6
attr = S, SA
damage = 65, 9
getpower = 150,150
givepower = 16,16
animtype = Hard
hitflag = MAF
guardflag = M
priority = 5, Hit
pausetime = 11, 11
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -20, -70
hitsound = s1,1
guardsound = s2,1
ground.type = High
ground.slidetime = 21
ground.hittime  = 22
ground.velocity = -2,-9.5
guard.velocity = -8
air.type = High
air.velocity = -2,-9.5
yaccel = .5
air.hittime = 12
fall = 1
fall.recover = 0
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
id = 1300


[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 強九百拾式・摘み
[Statedef 1350]
type     = S
movetype = A
physics  = S
juggle   = 8
poweradd = 40
velset   = 0,0
anim     = 1350
ctrl     = 0
sprpriority = 2

[State a]
type = varadd
triggerall = statetype != A
triggerall = movetype!=H
triggerall = time = 0
trigger1 = prevstateno=[1000,1999]
v = 20
value = -180

[State 30000]
type = Explod
trigger1 = time = 14
anim = 13038
postype = p1
pos = 0,0
scale = 0.5,0.5
sprpriority = 5
id = 13020
ownpal = 1
facing = 1
pausemovetime = 999
supermovetime = 999
bindtime = 0

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 1
value = s10,18
channel = 4

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = s0,1

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 2 | AnimElem = 3
x = 10

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 9
x = -20

[State 1000, ]
type = ReversalDef
triggerall = var(21)
trigger1 = 1
reversal.attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
sparkno = s13022
hitsound = s2,1
pausetime = 12,14
p1stateno = 1305
sparkxy = 15,-70

[State 1000, ]
type = ReversalDef
triggerall = !var(21)
trigger1 = AnimElem = 2 && 3
reversal.attr = SCA,AA
sparkno = s13022
hitsound = s2,1
pausetime = 12,14
p1stateno = 1305
sparkxy = 15,-70

[State 1000, PosAdd]
type = PosAdd
triggerall = Numtarget(1155)
trigger1 = Enemynear,Movereversed = 1
x = Ifelse(Gametime%2=0,1,-1)
y = 0
ignorehitpause = 1
persistent = 1

[State 1000, MoveHitReset]
type = MoveHitReset
triggerall = Numtarget(1155)
trigger1 = Enemynear,Movereversed = 1
ignorehitpause = 1
persistent = 1

[State 1000, ]
type = ReversalDef
trigger1 = AnimElem = 4 && 5
attr = S,SA
reversal.attr = SCA,AA
sparkno = s13022
hitsound = s2,1
pausetime = 12,14
p1stateno = 1310
ID = 1155

[State 1000, PosAdd]
type = PosAdd
triggerall = Numtarget(1155)
trigger1 = Enemynear,Movereversed = 1
x = Ifelse(Gametime%2=0,1,-1)
y = 0
ignorehitpause = 1
persistent = 1

[State 1000, MoveHitReset]
type = MoveHitReset
triggerall = Numtarget(1155)
trigger1 = Enemynear,Movereversed = 1
ignorehitpause = 1
persistent = 1

[State 200, ヒット定?]
type = HitDef
trigger1 = AnimElem = 5
attr = S, SA
damage = 65, 9
getpower = 150,150
givepower = 16,16
animtype = Hard
hitflag = MAF
guardflag = M
priority = 5, Hit
pausetime = 11, 12
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -20, -70
hitsound = s1,1
guardsound = s2,1
ground.type = High
ground.slidetime = 21
ground.hittime  = 22
ground.velocity = -2,-9.5
guard.velocity = -8
air.type = High
air.velocity = -2,-9.5
yaccel = .5
air.hittime = 12
fall = 1
fall.recover = 0
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
id = 1350

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 外式・虎伏せ

[Statedef 1305]
type     = S
movetype = A
physics  = S
juggle   = 8
poweradd = 30
velset   = 0,0
anim     = 1305
ctrl     = 0
sprpriority = 5

[State Helper]
Type               = Helper 
Triggerall         = random < 150
Trigger1         = movehit = 1
Trigger1         = time > 3
Name               = "Skill_Fire" 
ID                 = 7000 + ID
Pos                = 0,0
PosType            = P2 
StateNo            = 7000
OwnPal             = 1 
IgNoreHitPause     = 1 

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = s10,19
channel = 4

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 5
value = s0,4

[State 210, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemTime (1) >= 0 && AnimElemTime (5) <= 0
edge = 30,0

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 1 | AnimElem = 2 | AnimElem = 3 | AnimElem = 4 | AnimElem = 5
x = 10

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 8 | AnimElem = 10
x = -10

[State 30000]
type = Explod
trigger1 = AnimElem = 2
anim = 13038
postype = p1
pos = 0,0
scale = 0.5,0.5
sprpriority = 5
id = 13020
ownpal = 1
facing = 1
pausemovetime = 999
supermovetime = 999
bindtime = 0

[State 1100, エフェクト?示]
type = Explod
trigger1 = AnimElem = 2
persistent = 0
anim = 1605
scale = .45,.45
ownpal = 1
postype = P1
pos = 80,-20
sprpriority = 10

[State 1305]
type = nothitby
trigger1 = time < 10
value = SCA
time = 1

[State 200, ヒット定?]
type = HitDef
trigger1 = time = 0
attr = A, HA
damage = 70,9
getpower = 120,120
givepower = 16,16
animtype = up
guardflag = M
hitflag = MAF
priority = 6, Hit
pausetime = 12,13
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -25, -40
hitsound = s1,1
guardsound = s2,1
ground.type = High
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = -4,15
air.velocity = -4,15
air.type = High
air.hittime = 12
fall = 1
fall.recover = 0
palfx.time = 30
palfx.add = 80,-40,-140
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,15
palfx.invertall = 1
palfx.color = 0
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
id = 1305


[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = Movehit = 1
value = s12,8

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 外式・龍射り

[Statedef 1310]
type     = S
movetype = A
physics  = S
juggle   = 8
poweradd = 30
velset   = 0,0
anim     = 1310
ctrl     = 0
sprpriority = 5

[State Helper]
Type               = Helper 
Triggerall         = random < 150
Trigger1         = movehit = 1
Trigger1         = time > 3
Name               = "Skill_Fire" 
ID                 = 7000 + ID
Pos                = 0,0
PosType            = P2 
StateNo            = 7000
OwnPal             = 1 
IgNoreHitPause     = 1 

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = s10,20
channel = 4

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = s0,4

[State 210, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemTime (1) >= 0 && AnimElemTime (4) <= 0
edge = 30,0

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 1 | AnimElem = 2 | AnimElem = 3 | AnimElem = 4
x = 10

[State 30000, 底?]
type = Explod
trigger1 = AnimElem = 3
anim = 13038
postype = p1
pos = 0,0
scale = 0.5,0.5
sprpriority = 5
id = 13020
ownpal = 1
facing = 1
pausemovetime = 999
supermovetime = 999
bindtime = 0

[State 1100, エフェクト?示]
type = Explod
trigger1 = AnimElem = 4
persistent = 0
anim = 1605
scale = .45,.45
ownpal = 1
postype = P1
pos = 60,-80
sprpriority = 10

[State 1305]
type = nothitby
trigger1 = time < 11
value = SCA
time = 1

[State 200, ヒット定?]
type = HitDef
trigger1 = time = 0
attr = A, HA
damage = 70,9
getpower = 120,120
givepower = 16,16
animtype = Hard
guardflag = M
hitflag = MAF
priority = 6, Hit
pausetime = 8,10
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -25, -70
hitsound = s1,1
guardsound = s2,1
ground.type = High
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = -5,-5
air.velocity = -5,-5
air.type = High
air.hittime = 12
fall = 1
fall.recover = 0
palfx.time = 50
palfx.add = 80,-40,-140
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,15
palfx.invertall = 1
palfx.color = 0
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
id = 1310

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = Movehit = 1
value = s12,8

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 弱弐百拾弐式・琴月陽

[Statedef 1400]
type     = S
movetype = A
physics  = S
juggle   = 0
poweradd = 120
velset   = 0,0
anim     = 1400
ctrl     = 0
sprpriority = 2

[State a]
type = varadd
triggerall = statetype != A
triggerall = movetype!=H
triggerall = time = 0
trigger1 = prevstateno=[1000,1999]
v = 20
value = -180
IgNoreHitPause = 1

[State 0, PalFX]
type = PalFX
triggerall = var(20)
triggerall = time < 8
trigger1 = prevstateno >= 1000 && var(20) > 0
time = 1
add = 255,255,255
sinadd = 0,0,0
invertall = 0
color = 256
ignorehitpause = 1
persistent = 2 

[State 30000]
type = Explod
trigger1 = time = 2
anim = 13038
postype = p1
pos = 0,0
scale = 0.5,0.5
sprpriority = 5
id = 13020
ownpal = 1
facing = 1
pausemovetime = 999
supermovetime = 999
bindtime = 0

[State 810, 物理的なキャラの幅]
type = Width
trigger1 = 1
edge = 50,0

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = s3500,5
channel = 5

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = s3500,6
channel = 5

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 5
value = s3500,5
channel = 5

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = s10,14
channel = 4

[State 1000, 音を鳴らす]
type = StopSnd
trigger1 = AnimElem = 7
channel = 5

[State 1000, 軸位置移動]
type = Velset
trigger1 = AnimElemtime(2) >= 0 && AnimElemtime(7) <= 0
x = 9

[State 1000, 軸位置移動]
type = Velset
trigger1 = Animtime = 0
x = 0

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = AnimElemtime(2) >= 0 && AnimElemtime(6) <= 0
trigger1 = p2bodydist X < 70
value = 1405

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 強弐百拾弐式・琴月陽

[Statedef 1450]
type     = S
movetype = A
physics  = S
juggle   = 0
poweradd = 120
velset   = 0,0
anim     = 1450
ctrl     = 0
sprpriority = 2

[State a]
type = varadd
triggerall = statetype != A
triggerall = movetype!=H
triggerall = time = 0
trigger1 = prevstateno=[1000,1999]
v = 20
value = -180

[State 0, PalFX]
type = PalFX
triggerall = var(20)
triggerall = time < 8
trigger1 = prevstateno >= 1000 && var(20) > 0
time = 1
add = 255,255,255
sinadd = 0,0,0
invertall = 0
color = 256
ignorehitpause = 1
persistent = 2

[State 30000, 底?]
type = Explod
trigger1 = time = 2
anim = 13038
postype = p1
pos = 0,0
scale = 0.5,0.5
sprpriority = 5
id = 13020
ownpal = 1
facing = 1
pausemovetime = 999
supermovetime = 999
bindtime = 0

[State 810, 物理的なキャラの幅]
type = Width
trigger1 = 1
edge = 50,0

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = s3500,5
channel = 5

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = s3500,6
channel = 5

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 5
value = s3500,5
channel = 5

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = s10,14
channel = 4

[State 1000, 音を鳴らす]
type = StopSnd
trigger1 = AnimElem = 10
channel = 5

[State 1000, 軸位置移動]
type = Velset
trigger1 = AnimElemtime(2) >= 0 && AnimElemtime(10) <= 0
x = 9

[State 1000, 軸位置移動]
type = Velset
trigger1 = Animtime = 0
x = 0

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = AnimElemtime(2) >= 0 && AnimElemtime(9) <= 0
trigger1 = p2bodydist X < 70
value = 1405

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 琴月肘打ち

[Statedef 1405]
type     = S
movetype = A
physics  = S
juggle   = 0
poweradd = 0
ctrl     = 0
velset   = 0,0
anim     = 1405
sprpriority = 5

[State 810, 物理的なキャラの幅]
type = Width
trigger1 = 1
edge = 30,0

[State 1000, 音を鳴らす]
type = StopSnd
trigger1 = Time = 0
channel = 5

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = s0,1

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 2
x = 10

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 6
x = -10

[State 1000, 軸位置移動]
type = Velset
trigger1 = AnimElemtime(1) >= 0 && AnimElemtime(3) < 0
x = 8

[State 1000, 軸位置移動]
type = Velset
trigger1 = AnimElem = 5
x = 0

[State 1000, VelSet]
type = VelSet
triggerall = movecontact
trigger1 = 1
x = 0
ignorehitpause = 1

[State 200, ヒット定?]
type = HitDef
trigger1 = time = 0
attr = S, SA
damage = 50,10
getpower = 80,80
givepower = 16,16
animtype = high
guardflag = M
hitflag = MAF
priority = 6, Hit
pausetime = 10,17
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -20, -60
hitsound = s1,1
guardsound = s2,1
ground.type = Low
ground.slidetime = 10
ground.hittime = 21
ground.velocity = -9
air.type = High
air.velocity = -5,-5
air.hittime = 12
air.fall = 1
fall.recover = 0
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
id = 1405

[State 210, ステ?ト変更]
type = ChangeState
triggerall = prevstateno = 1400
triggerall = Movecontact
trigger1 = animelem = 5
value = 1410
ignorehitpause = 0

[State 210, ステ?ト変更]
type = ChangeState
triggerall = prevstateno = 1450
triggerall = Movecontact
trigger1 = animelem = 5
value = 1460
ignorehitpause = 0

[State 210, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 琴月?掴み

[Statedef 1410]
type     = S
movetype = A
physics  = S
juggle   = 0
poweradd = 0
ctrl     = 0
velset   = 0,0
anim     = 1410
sprpriority = 5

[State 810, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemtime(1) > 0 && AnimElemtime(3) < 0
edge = 50,0

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 1 | AnimElem = 3
x = 10

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 2
x = 30

[State 200, ヒット定?]
type = HitDef
trigger1 = AnimElem = 3
attr = S, ST
damage = 0, 0
getpower = 50,50
givepower = 0,0
animtype = Hard
guardflag = M
hitflag = MAF
priority = 6, Hit
pausetime = 3,3
sparkno = s13024
guard.sparkno = s13022 
sparkxy = -25, -60
hitsound = s1,6
guardsound = s2,1
ground.type = High
ground.slidetime = 19
ground.hittime = 19
ground.velocity = 0
air.type = High
air.velocity = 0,0
airguard.velocity = -4,-5
air.hittime = 12
fall = 1
fall.recover = 0
p1facing = 1
p2facing = 1
guard.velocity = -12
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = -20
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
id = 1410

[State 1000, p2GCRUSH]
type = targetstate
trigger1 = movehit
persistent = 0
ignorehitpause = 0
value = 1420
ctrl = 0

[State 1000, ChangeState]
type = ChangeState
trigger1 = movehit
persistent = 0
ignorehitpause = 0
value = 1415
ctrl = 0

[State 210, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 琴月爆破
[Statedef 1460]
type     = S
movetype = A
physics  = S
juggle   = 0
poweradd = 0
ctrl     = 0
velset   = 0,0
anim     = 1460
sprpriority = 5


[State 1000, 軸位置移動]
type = Posadd
trigger1 =AnimElem = 2
x = 15

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 3 | AnimElem = 4 | AnimElem = 5
x = 10

[State 810, 物理的なキャラの幅]
type = Width
trigger1 = 1
edge = 50,0

[State 2110, 相手と重なった時の処理]
type = PlayerPush
trigger1 = 1
value = 0

[State 200, ヒット定?]
type = HitDef
trigger1 = time = 0
attr = S, SA
damage = 40,9
getpower = 40,40
givepower = 16,16
animtype = high
guardflag = M
hitflag = MAF
priority = 5, Hit
pausetime = 15,20
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -20, -60
hitsound = s1,1
guardsound = s2,1
ground.type = hard
ground.slidetime = 10
ground.hittime = 21
ground.velocity = -3
air.type = High
air.velocity = -5,-5
air.hittime = 12
air.fall = 1
fall.recover = 0
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
EnvShake.Time      =  4
EnvShake.Ampl      = -7
id = 1460

[state 2]
type = changestate
trigger1 = animtime = 0
value = 1465

;---------------------------------------------------------------------------
; 琴月爆破
[Statedef 1465]
type     = S
movetype = A
physics  = S
juggle   = 0
poweradd = 0
ctrl     = 0
velset   = 0,0
anim     = 1465
sprpriority = 5

[State Helper]
Type               = Helper 
Triggerall         = random < 150
Trigger1         = movehit = 1
Name               = "Skill_Fire" 
ID                 = 7000 + ID
Pos                = 0,0
PosType            = P2 
StateNo            = 7000
OwnPal             = 1 
IgNoreHitPause     = 1 

[State 30000]
type = Explod
trigger1 = time = 14
anim = 13038
postype = p1
pos = 0,0
scale = 0.5,0.5
sprpriority = 5
id = 13020
facing = 1
ownpal = 1
pausemovetime = 999
supermovetime = 999
bindtime = 0

[State 30000]
type = Explod
trigger1 = time = 14
anim = 13038
postype = p1
pos = 0,0
scale = 0.5,0.5
sprpriority = 5
id = 13020
ownpal = 1
facing = -1
pausemovetime = 999
supermovetime = 999
bindtime = 0

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3 | AnimElem = 6
x = 10

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 8
x = -10

[State 810, 物理的なキャラの幅]
type = Width
trigger1 = 1
edge = 50,0

[State 2110, 相手と重なった時の処理]
type = PlayerPush
trigger1 = 1
value = 0

[State -2, 爆発ニつ]
type = Explod
trigger1 = movehit = 1
anim = 1430
scale = .28,.28
pos = 0,-55
postype = p2
ownpal = 1
ownpal = 1
bindtime = 1
sprpriority = 11
persistent = 0
ignorehitpause = 1

[State 200, ヒット定?]
type = HitDef
trigger1 = time = 0
attr = S, SA
damage = 60,9
getpower = 40,40
givepower = 16,16
animtype = high
guardflag = M
hitflag = MAF
priority = 5, Hit
pausetime = 20,17
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -20, -60
hitsound = s1,1
guardsound = s2,1
ground.type = Low
ground.slidetime = 10
ground.hittime = 21
ground.velocity = -8.5,-3
air.type = High
air.velocity = -10,-3
air.hittime = 12
air.fall = 1
p2stateno = 1470
fall.recover = 0
envshake.ampl = -8
envshake.freq = 100
envshake.time = 20
palfx.time = 35
palfx.add = 80,-40,-140
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,15
palfx.invertall = 1
palfx.color = 0
id = 1465

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = Movehit = 1
value = s3500,12
volumescale = 170
ignorehitpause = 1
persistent = 0

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = Movehit = 1
value = s3500,13
volumescale = 170
ignorehitpause = 1
persistent = 0

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = Movehit = 1
value = s12,8
volumescale = 170
ignorehitpause = 1
persistent = 0

[State 1000, 音を鳴らす]
type = envcolor
trigger1 = Movehit = 1
value = 255,255,255
under = 1
time = 2
ignorehitpause = 1
persistent = 0

[state 2]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;吹っ飛び動作
[Statedef 1470]
type    = S
movetype= H
physics = N
velset = 0,0

[state 2]
type = nothitby
trigger1 = 1
value = SCA

[State 5000, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = ifelse((GetHitVar(groundtype) = 1),5000,5010) + GetHitVar(animtype)

[State 5000, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030

[State 5000, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047 + GetHitVar(animtype) ;5051 - 4 + type

[State 5000, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

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
value = 1471
;---------------------------------------------------------------------------
;吹っ飛び動作
[Statedef 1471]
type    = A
movetype= H
physics = N

[state 2]
type = nothitby
trigger1 = 1
value = SCA

[State 7010, 1]
type = ChangeAnim
Trigger1 = Time = 0
value = 5035

[State 7010, 1]
type = VelAdd;Gravity
trigger1 = 1
y = GetHitVar(yaccel)

[State 5030, 2]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 7010, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 1472
;---------------------------------------------------------------------------
;吹っ飛び動作
[Statedef 1472]
type    = A
movetype= H
physics = N

[state 2]
type = nothitby
trigger1 = 1
value = SCA

[State 820, 1]
type = ChangeAnim
Trigger1 = Time = 0
value = 5050

[State 5050, 3] ;Gravity
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 820, 1]
type = ChangeState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1473
;---------------------------------------------------------------------------
;Arrastrada
[Statedef 1473]
type    = L
movetype= H
physics = N
velset = 0,0

[state 2]
type = nothitby
trigger1 = 1
value = SCA

[State 7015, ChangeAnim] ;Freeze anim
type = null;ChangeAnim
trigger1 = Time > 0
value = anim

[State 7015, PosAdd]
type = PosAdd
trigger1 = time = [0,20]
x = Ifelse(Gametime%2=0,1,-1)
y = 0
ignorehitpause = 1
persistent = 1

[State 7015, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1473

[State 7015, 1]
type = ChangeAnim
Trigger1 = Time = 20
value = 5110

[State 7015, 移動]
type = PosSet
trigger1 = time = 0
y = 0

[State 263, 2]
type = Velmul
trigger1 = 1
x = .92

[State 263, 4]
type = PosSet
trigger1 = Time = 0
y = 0

[State 263, 5]
type = VelSet
trigger1 = Time = 0
x = ifelse((p2bodydist X <=-10),5,-5)
y = 0

[State 263, 6]
type = VelSet
trigger1 = Time = 30
x = 0
y = 0


[State 1000, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = f7,6

[State 7015, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 820, 1]
type = SelfState
trigger1 = time = 40
trigger1 = Alive
value = 5120

[State 820, 1]
type = SelfState
trigger1 = time = 40
trigger1 = !Alive
value = 5150

;---------------------------------------------------------------------------
; 琴月?爆破

[Statedef 1415]
type     = S
movetype = A
physics  = S
juggle   = 0
poweradd = 0
ctrl     = 0
velset   = 0,0
anim     = 1415
sprpriority = 5

[State Helper]
Type               = Helper 
Triggerall         = random < 150
trigger1 		   = time > 32
Name               = "Skill_Fire" 
ID                 = 7000 + ID
Pos                = 0,0
PosType            = P2 
StateNo            = 7000
OwnPal             = 1 
IgNoreHitPause     = 1 

[State 170, 無敵]
type = NotHitBy
trigger1 = 1
value = SCA

[State 810, 物理的なキャラの幅]
type = Width
trigger1 = 1
edge = 50,0

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElemtime(1) = 10
value = s10,15
channel = 4

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = time = 32
value = s3500,12

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = time = 32
value = s3500,13

[State 1100, エフェクト?示]
type = Explod
trigger1 = time = 32
persistent = 0
anim = 1430
postype = P1
ownpal = 1
pos = 40,-88
sprpriority = 10
scale = 0.35,0.35

[State 30000, 底?]
type = Explod
trigger1 = time = 32
anim = 13038
postype = p1
pos = 0,5
scale = 0.65,0.65
sprpriority = 5
id = 13020
ownpal = 1
facing = 1
pausemovetime = 999
supermovetime = 999
bindtime = 0

[State 30000, 底?]
type = Explod
trigger1 = time = 32
anim = 13020
postype = p1
scale = 0.45,0.45
under = 1
ownpal = 1
id = 13020
pausemovetime = 999
supermovetime = 999

[State 30000, 底?]
type = Explod
trigger1 = time = 32
anim = 13021
postype = p1
scale = 0.45,0.45
ontop = 1
ownpal = 1
id = 13021
pausemovetime = 999
supermovetime = 999

[State 30000, 底?]
type = Explod
trigger1 = time = 32
anim = 13038
postype = p1
pos = 0,5
scale = 0.65,0.65
sprpriority = 5
id = 13020
ownpal = 1
facing = -1
pausemovetime = 999
supermovetime = 999
bindtime = 0

[State 1000, EnvColor]
type = EnvColor
trigger1 = time = 32
time = 3
value = 255,255,255
under = 1
ignorehitpause = 1

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 1
x = 10

[State 810, 3]
type = TargetBind
trigger1 = AnimElemtime(1) >= 0 && AnimElemtime(2) <= 0
pos = 42, -90

[State 810, 3]
type = TargetBind
trigger1 = AnimElemtime(2) >= 0 && AnimElemtime(3) <= 0
pos = 42, -122

[State 810, 3]
type = TargetBind
trigger1 = AnimElemtime(3) = 1
pos = 42, -50

[State 2110, 相手と重なった時の処理]
type = PlayerPush
trigger1 = 1
value = 0

[State 810, ヒット定?]
type = HitDef
trigger1 = AnimElem = 3
attr = S, NT
damage = 100
getpower = 25,25
givepower = 16,16
animtype = high
hitflag = MAF
priority = 5, Hit
pausetime = 0,0
sparkno = -1
ground.type = High
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = -3,-10
air.velocity = -3,-10
yaccel = .5
air.type = High
air.hittime = 12
fall = 1
fall.recover = 0
palfx.time = 80
palfx.add = 80,-40,-140
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,15
palfx.invertall = 1
palfx.color = 0

numhits = 0
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
EnvShake.Time      =  18
EnvShake.Ampl      = -18
id = 1410


[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = Movehit = 1
value = s12,8

[State 210, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;投げられている相手の動作

[Statedef 1420]
type    = A
movetype= H
physics = N
velset = 0,0

[State 2120]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1420

[State 820, 1]
type = SelfState
trigger1 = Animtime = 0
trigger2 = Enemy,Stateno != 1415
trigger2 = Enemy,Stateno != 1416
value = 5100

;---------------------------------------------------------------------------
; 弱独楽屠り

[Statedef 1500]
type     = S
movetype = A
physics  = S
juggle   = 0
poweradd = 120
velset   = 0,0
anim     = 1500
ctrl     = 0
sprpriority = 5

[State a]
type = varadd
triggerall = statetype != A
triggerall = movetype!=H
triggerall = time = 0
trigger1 = prevstateno=[1000,1999]
v = 20
value = -180

[State 0, PalFX]
type = PalFX
triggerall = var(20)
triggerall = time < 8
trigger1 = prevstateno >= 1000 && var(20) > 0
time = 1
add = 255,255,255
sinadd = 0,0,0
invertall = 0
color = 256
ignorehitpause = 1
persistent = 2

[State 210, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemTime (3) >= 0
edge = 30,-60

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = s3,2

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = s10,16

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 7
value = s0,4

[State 30000, 底?]
type = Explod
trigger1 = time = 6
anim = 13037
postype = p1
pos = 10,0
scale = 0.34,0.34
ownpal = 1
sprpriority = 5
id = 13020
facing = 1
pausemovetime = 999
supermovetime = 999
bindtime = 0

;40448
[State -2, Accel]
type = VelSet
trigger1 = anim = 1500 && animelemtime(3) > 0
;x = (5.71875*exp((-0.04800921918636060775200362532344)*(time-8)))
x = (7*exp((-0.04800921918636060775200362532344)*(time-7)))

;5.71875
;5.45068359375
;5.1951904296875
[State -2, Accel]
type = VelSet
trigger1 = animelem = 3
y = -6

[State -2, VelAdd]
type = VelAdd
trigger1 = animelemtime(3) > 0  && animelemtime(7) < 0
y = 0.375+0.1875

[State -2, VelAdd]
type = VelAdd
trigger1 = animelemtime(7) >= 0
y = 0.625

[State -2, VelAdd]
type = PosAdd
trigger1 = animelem = 7
x = Vel X
persistent = 0

[State 6000, 3]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A

[State 210, 1]
type = HitDef
triggerall = !var(55)
trigger1 = animelem = 4
attr = A, SA
damage = 40,10
getpower = 60,60
givepower = 16,16
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 5, Hit
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -10, -80
hitsound = s1,3
guardsound = s2,1
ground.type = High
pausetime = 11,12
guard.pausetime = 8,9
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 28
ground.velocity = -4.5,-10.5
air.type = High
air.velocity = -4.5,-10
air.hittime = 13
air.juggle = 0
fall = 1
air.fall = 1
fall.recovertime = 35
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
EnvShake.Time      =  8
EnvShake.Ampl      = -15
id = 1500

[State 1000, ステート変更]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= -10
value = 1160

;---------------------------------------------------------------------------
; 弱独楽屠り
[Statedef 1550];Ok!
type    = S
movetype= A
physics = N
poweradd= 110
ctrl = 0
velset = 0
sprpriority = 2
juggle = 7
facep2 = 1

[State a]
type = varadd
triggerall = statetype != A
triggerall = movetype!=H
triggerall = time = 0
trigger1 = prevstateno=[1000,1999]
v = 20
value = -180

[State 0, PalFX]
type = PalFX
triggerall = var(20)
triggerall = time < 8
trigger1 = prevstateno >= 1000 && var(20) > 0
time = 1
add = 255,255,255
sinadd = 0,0,0
invertall = 0
color = 256
ignorehitpause = 1
persistent = 2

[State 30000, 底?]
type = Explod
trigger1 = time = 8
anim = 13037
postype = p1
pos = 10,0
scale = 0.34,0.34
ownpal = 1
sprpriority = 5
id = 13020
facing = 1
pausemovetime = 999
supermovetime = 999
bindtime = 0

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !time
value = 1550

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 3
statetype = A
;9.0234375
;8.40625

;0.6171875

;40448
[State -2, Accel]
type = VelSet
trigger1 = animelemtime(3) > 0
;x = (5.71875*exp((-0.04800921918636060775200362532344)*(time-8)))
x = (7*exp((-0.04800921918636060775200362532344)*(time-7)))

[State -2, Accel]
type = VelSet
trigger1 = animelemtime(3) > 0
;x = (5.71875*exp((-0.04800921918636060775200362532344)*(time-8)))
x = (9.53125*exp((-0.04800921918636060775200362532344)*(time-9)))

;5.71875
;5.45068359375
;5.1951904296875
[State -2, Accel]
type = VelSet
trigger1 = animelem = 3
y = -6

[State -2, Accel]
type = VelSet
trigger1 = animelem = 3
y = -4

[State -2, VelAdd]
type = VelAdd
trigger1 = animelemtime(3) > 0 && animelemtime(16) < 0
y = 0.09375

[State -2, VelAdd]
type = VelAdd
trigger1 = animelemtime(16) >= 0
y = 0.28125
persistent = 1

[State -2, VelAdd]
type = PosAdd
trigger1 = animelem = 16
x = Vel X
persistent = 0

[State 1000, 1]
type = PlaySnd
trigger1 = animelem = 3
trigger2 = animelem = 7
trigger3 = animelem = 15
value = 0,3

[state 23]
type = playsnd
trigger1 = animelem = 15
value = s10,16

[State 210, 1]
type = HitDef
trigger1 = animelem = 4
attr = A, SA
damage = 35,9 ;1.24 Mul for Counter Hit
getpower = 50,50
givepower = 16,16
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 5, Hit
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -10, -80
hitsound = s1,3
guardsound = s2,1
ground.type = High
pausetime = 8,9
guard.pausetime = 8,9
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 28
ground.velocity = -4.5,ifelse(var(10),-10.5,-7)
air.type = High
air.velocity = -4.5,-7
air.hittime = 13
air.juggle = 0
fall = 1
air.fall = 1
id = 1550
fall.recovertime = 35
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
EnvShake.Time      =  6
EnvShake.Ampl      = -15

[State 210, 1]
type = HitDef
trigger1 = animelem = 7
attr = A, SA
damage = 45,9 ;1.24 Mul for Counter Hit
getpower = 50,50
givepower = 16,16
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 5, Hit
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -10, -80
hitsound = s1,3
guardsound = s2,1
ground.type = High
pausetime = 8,9
guard.pausetime = 8,9
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 28
ground.velocity = -3.5,-7
air.type = High
air.velocity = -3.5,-7
air.hittime = 13
air.juggle = 0

fall = 1
air.fall = 1
fall.recovertime = 35
id = 1551
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
EnvShake.Time      =  8
EnvShake.Ampl      = -12


[State 210, 1]
type = HitDef
trigger1 = animelem = 16
attr = A, SA
damage = 45,9
getpower = 50,50
givepower = 16,16
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 5, Hit
pausetime = 10,10
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -20, -60
hitsound = s1,3
guardsound = s2,1
ground.type = High
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = -5,15
guard.velocity = -11
air.velocity = -5,15
airguard.velocity = -3,-5
air.animtype = back
air.hittime = 0
air.fall = 1
fall.recover = 0
air.fall.recover = 0
fall = 1
fall.recovertime = 0
fall.envshake.ampl = 5
fall.envshake.freq = 90
fall.envshake.time = 15
p2stateno = 1551
id = 1552
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5
fall.xvelocity = -2
fall.yvelocity = -6
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
EnvShake.Time      =  8
EnvShake.Ampl      = -15

[State 1000, 6]
type = ChangeState
triggerall = statetype = A
trigger1 = Vel Y + Pos Y >= 0
value = 1160
ctrl = 0

;-------------------------------------------------------------------------------
[Statedef 1551]
type    = A
movetype= H
physics = N
velset = 0,0
;facep2 = 1

[State 2120]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 52, 1]
type = hitVelSet
trigger1 = time = 10
x = 1
y = 1

[State 52, 2]
type = Veladd
trigger1 = time >= 10
y = .5

[State 810,]
type = EnvShake
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
ampl = 10
freq = 120
time = 10

[State 1830]
type = ChangeAnim2
Trigger1 = Time = 0
value = 5030

[State 1830]
type = changeState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1552

;---------------------------------------------------------------------------
; Downed get-hit (hit ground from fall)
[Statedef 1552]
type    = L
movetype= H
physics = N

[State 5100, 2004.04.14 behavior]
type = VelSet
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
trigger1 = vel x < -1
x = -1

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
trigger1 = (anim != [5051,5059]) && (anim != [5061,5069])
trigger2 = !SelfAnimExist(5100 + (anim % 10))
value = 5100

[State 5100, 3] ;Hit ground anim (for hit up)
type = ChangeAnim
trigger1 = time = 0
trigger1 = (anim = [5051,5059]) || (anim = [5061,5069])
trigger1 = SelfAnimExist(5100 + (anim % 10))
value = 5100 + (anim % 10)

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
type = selfState
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
value = 5110 ;HIT_LIEDOWN

[State 5100, PalFX]
type = PalFX
trigger1 = time = 0
time = 1

[State 5100, 11]
type = HitFallDamage
trigger1 = Time = 3

[State 5100, 13]
type = PosFreeze
trigger1 = 1

[State 5100, 14]
type = ChangeState
trigger1 = time = 4
value = 1553

[State 5100, 15]
type = NotHitBy
trigger1 = 1
value = SCA

[State 5100, 16]
type = ForceFeedback
trigger1 = Time = 0
waveform = sinesquare
ampl = 128,-3,-.2,.005
time = 20

;---------------------------------------------------------------------------
; HIT_BOUNCE (bounce into air)
[Statedef 1553]
type    = L
movetype= H
physics = N

[State 5101, 1] ;Coming hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim != [5101,5109]
trigger2 = !SelfAnimExist(5160 + (anim % 10))
value = 5160

[State 5101, 2] ;Coming hit ground anim (for hit up)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim = [5101,5109]
trigger1 = SelfAnimExist(5160 + (anim % 10))
value = 5160 + (anim % 10)

[State 5101, 3]
type = null;HitFallVel
trigger1 = Time = 0

[State 5101, 4]
type = VelSet
trigger1 = Time = 0
y = -3.7

[State 5101, 4]
type = VelSet
trigger1 = (sysvar(1) > 14)
trigger1 = Time = 0
y = -7

[State 5101, 5] ;Acceleration
type = VelAdd
trigger1 = 1
y = 0.610

[State 5101, 6]
type = NotHitBy
trigger1 = 1
value = SCA

[State 5101, 7] ;Hit ground
type = selfState
trigger1 = Pos Y + Vel Y >= 0
value = 5110

;---------------------------------------------------------------------------
; 百拾四式・荒咬み

[Statedef 1600]
type     = S
movetype = A
physics  = S
juggle   = 0
poweradd = 30
velset   = 0,0
anim     = 1600
ctrl     = 0
sprpriority = 3

[State 210, 物理的なキャラの幅]
type = Width
trigger1 = 1
edge = 25,0

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 3 | AnimElem = 4
x = 10

[State 1200, ]
type = ReversalDef
trigger1 = 1
reversal.attr = SCA,AA
numhits = 0
pausetime = 12,13
sparkno = s13022
hitsound = s2,1

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 1605

;---------------------------------------------------------------------------
; 百拾四式・荒咬み?攻撃

[Statedef 1605]
type     = S
movetype = A
physics  = S
juggle   = 3
poweradd = 0
velset   = 0,0
anim     = 1601
ctrl     = 0
sprpriority = 3

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 1
value = s10,12
channel = 4

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = s0,4

[State 210, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemTime (1) >= 0 && AnimElemTime (4) <= 0
edge = 30,0

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 1 | AnimElem = 2 | AnimElem = 3
x = 10

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 12 | AnimElem = 14
x = -10

[State 1100, エフェクト?示]
type = Explod
trigger1 = AnimElem = 6
persistent = 0
anim = 1605
postype = P1
pos = 70,-60
sprpriority = 10
ignorehitpause = 1
ID = 1600

[State 200, ヒット定?]
type = HitDef
trigger1 = time = 0
attr = S, SA
damage = 36,8
animtype = Hard
guardflag = MA
hitflag = MAFP
priority = 5, Hit
pausetime = 10,11
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -25, -70
hitsound = s1,1
guardsound = s2,1
ground.type = Low
ground.slidetime = 19
ground.hittime  = 19
ground.velocity = -9
air.velocity = -4,-4
air.hittime = 12
air.fall = 1
fall.recover = 0
palfx.time = 35
palfx.add = 80,-40,-140
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,15
palfx.invertall = 1
palfx.color = 0

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = Movehit = 1
value = s12,8
persistent = 0
ignorehitpause = 1

[State 1000, ]
type = Varset
triggerall = var(59) = 0
trigger1 = time = 0
var(16) = 0

[State 1000,]
type = ChangeState
triggerall = var(59) = 0
trigger1 = AnimElemtime(9) >= 3 && AnimElemtime(12) < 0
trigger1 = var(16) = 1
value = 1610

[State 1000,]
type = ChangeState
triggerall = var(59) = 0
trigger1 = AnimElemtime(11) >= 1 && AnimElemtime(13) < 0
trigger1 = var(16) = 2
value = 1620

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 百弐拾八式・九傷

[Statedef 1610]
type     = S
movetype = A
physics  = S
juggle   = 2
poweradd = 30
velset   = 0,0
anim     = 1610
ctrl     = 0
sprpriority = 3

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 1
value = s10,19
channel = 4

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = s0,4

[State 210, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemTime (1) >= 0 && AnimElemTime (5) <= 0
edge = 30,0

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 2 | AnimElem = 4 | AnimElem = 5 | AnimElem = 8
trigger2 = AnimElem = 9
x = 10

[State 1100, エフェクト?示]
type = Explod
trigger1 = AnimElem = 5
persistent = 0
anim = 1615
postype = P1
pos = 55,-60
sprpriority = 10
ignorehitpause = 1
ID = 1610

[State 2000,]
type = RemoveExplod
trigger1 = AnimElem = 5
ID = 1600

[State 200, ヒット定?]
type = HitDef
trigger1 = time = 0
attr = S, SA
damage = 30,6
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 5, Hit
pausetime = 10,11
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -25, -70
hitsound = s1,1
guardsound = s2,1
ground.type = High
ground.slidetime = 21
ground.hittime  = 21
ground.velocity = -3,-7
air.velocity = -3,-7
yaccel = .45
air.hittime = 12
fall = 1
fall.recover = 0
palfx.time = 50
palfx.add = 80,-40,-140
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,15
palfx.invertall = 1
palfx.color = 0

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = Movehit = 1
value = s12,8
persistent = 0
ignorehitpause = 1

[State 1000, ]
type = Varset
triggerall = var(59) = 0
trigger1 = time = 0
var(16) = 0

[State 1000, ]
type = Varset
triggerall = var(59) = 0
triggerall = AnimElemtime(5) >= 0 && AnimElemtime(7) < 13
trigger1 = command = "x" || command = "y"
var(16) = 1

[State 1000, ]
type = Varset
triggerall = var(59) = 0
triggerall = AnimElemtime(5) >= 0 && AnimElemtime(7) < 13
trigger1 = command = "a" || command = "b"
var(16) = 2

[State 1000,]
type = ChangeState
triggerall = var(59) = 0
trigger1 = AnimElemtime(7) >= 4 && AnimElemtime(7) < 13
trigger1 = var(16) = 1
value = 1620

[State 1000,]
type = ChangeState
triggerall = var(59) = 0
trigger1 = AnimElemtime(7) >= 4 && AnimElemtime(7) < 13
trigger1 = var(16) = 2
value = 1630

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 百弐拾七式・八錆

[Statedef 1620]
type     = S
movetype = A
physics  = S
juggle   = 2
poweradd = 30
velset   = 0,0
anim     = 1620
ctrl     = 0
sprpriority = 3

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = s10,20
channel = 4

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = s0,4

[State 210, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemTime (1) >= 0 && AnimElemTime (4) <= 0
edge = 30,0

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 1 | AnimElem = 2 | AnimElem = 3 | AnimElem = 4
x = 10

[State 1100, エフェクト?示]
type = Explod
trigger1 = AnimElem = 4
persistent = 0
anim = 1315
postype = P1
pos = 60,-80
sprpriority = 10
ignorehitpause = 1
ID = 1600

[State 2000,]
type = RemoveExplod
trigger1 = AnimElem = 5
ID = 1610

[State 200, ヒット定?]
type = HitDef
trigger1 = time = 0
attr = S, SA
damage = 34,6
animtype = Hard
guardflag = H
hitflag = MAF
priority = 5, Hit
pausetime = 11,12
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -25, -70
hitsound = s1,1
guardsound = s2,1
ground.type = High
ground.slidetime = 21
ground.hittime  = 21
ground.velocity = -4,15
air.velocity = -4,15
air.hittime = 12
fall = 1
fall.recover = 0
palfx.time = 50
palfx.add = 80,-40,-140
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,15
palfx.invertall = 1
palfx.color = 0

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = Movehit = 1
value = s12,8
persistent = 0
ignorehitpause = 1

[State 1000, ]
type = Varset
triggerall = var(59) = 0
trigger1 = time = 0
var(16) = 0

[State 1000, ]
type = Varset
triggerall = var(59) = 0
triggerall = prevstateno = 1605
triggerall = AnimElemtime(6) < 0
trigger1 = command = "x" || command = "y"
var(16) = 1

[State 1000, ]
type = Varset
triggerall = var(59) = 0
triggerall = prevstateno = 1605
triggerall = AnimElemtime(6) < 0
trigger1 = command = "a" || command = "b"
var(16) = 2

[State 1000,]
type = ChangeState
triggerall = var(59) = 0
trigger1 = AnimElemtime(5) >= 10 && AnimElemtime(6) < 0
trigger1 = var(16) = 1
value = 1640

[State 1000,]
type = ChangeState
triggerall = var(59) = 0
trigger1 = AnimElemtime(5) >= 10 && AnimElemtime(6) < 0
trigger1 = var(16) = 2
value = 1630

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 百弐拾五式・七瀬

[Statedef 1630]
type     = S
movetype = A
physics  = S
juggle   = 2
poweradd = 30
velset   = 0,0
anim     = 1625
ctrl     = 0
sprpriority = 3

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = s10,18
channel = 4

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = s0,4

[State 210, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemTime (1) >= 0 && AnimElemTime (6) <= 0
edge = 35,0

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 4
x = 10

[State 1000, 軸位置移動]
type = Velset
trigger1 = AnimElemtime(4) >= 0 && AnimElemtime(6) < 0
x = 7

[State 1000, 軸位置移動]
type = Velset
trigger1 = AnimElem = 7
x = 0

[State 2000,]
type = RemoveExplod
trigger1 = AnimElem = 5
ID = 1610

[State 200, ヒット定?]
type = HitDef
trigger1 = time = 0
attr = S, SA
damage = 36,8
animtype = Diagup
guardflag = MA
hitflag = MAF
priority = 5, Hit
pausetime = 11,12
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -25, -75
hitsound = s1,3
guardsound = s2,1
ground.type = High
ground.slidetime = 21
ground.hittime  = 21
ground.velocity = -6,-6
air.velocity = -6,-6
yaccel = .45
air.hittime = 12
fall = 1
fall.recover = 0

[State 1000, ]
type = Varset
triggerall = var(59) = 0
trigger1 = time = 0
var(16) = 0

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 外式・砌穿ち
[Statedef 1640]
type     = S
movetype = A
physics  = S
juggle   = 0
poweradd = 30
velset   = 0,0
anim     = 1630
ctrl     = 0
sprpriority = 3

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = s10,10
channel = 4

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 5
value = s0,4

[State 210, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemTime (1) >= 0 && AnimElemTime (5) <= 0
edge = 30,0

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 1 | AnimElem = 2 | AnimElem = 3 | AnimElem = 4 | AnimElem = 5
x = 10

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 8 | AnimElem = 10
x = -10

[State 1100, エフェクト?示]
type = Explod
trigger1 = AnimElem = 5
persistent = 0
anim = 1315
postype = P1
pos = 70,-30
sprpriority = 10

[State 2000,]
type = RemoveExplod
trigger1 = AnimElem = 5
ID = 1600

[State 200, ヒット定?]
type = HitDef
trigger1 = time = 0
attr = S, SA
damage = 32,6
animtype = Hard
guardflag = L
hitflag = MAFD
priority = 5, Hit
pausetime = 13,14
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -25, -40
hitsound = s1,1
guardsound = s2,1
ground.type = High
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = -3,15
air.velocity = -3,15
air.type = High
air.hittime = 12
fall = 1
fall.recover = 0
palfx.time = 30
palfx.add = 80,-40,-140
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,15
palfx.invertall = 1
palfx.color = 0
fall.envshake.ampl = 5
fall.envshake.freq = 100
fall.envshake.time = 15

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = Movehit = 1
value = s12,8
persistent = 0
ignorehitpause = 1

[State 1000, ]
type = Varset
triggerall = var(59) = 0
trigger1 = time = 0
var(16) = 0

[State 1000,]
type = ChangeState
triggerall = var(59) = 0
trigger1 = AnimElemtime(6) >= 3 && AnimElemtime(7) < 0
trigger1 = var(16) = 1
value = 1650

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 琴月

[Statedef 1650]
type     = S
movetype = A
physics  = S
juggle   = 0
poweradd = 30
ctrl     = 0
velset   = 0,0
anim     = 1640
sprpriority = 3

[State 810, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemtime(1) > 0 && AnimElemtime(3) < 0
edge = 50,0

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = s0,4

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 1 | AnimElem = 3
x = 10

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 2
x = 30

[State 200, ヒット定?]
type = HitDef
trigger1 = AnimElem = 3
attr = S, ST
damage = 0, 0
animtype = Hard
guardflag = MA
hitflag = MAFD
priority = 5, Hit
pausetime = 0,0
sparkno = s4040
guard.sparkno = s4120
sparkxy = -25, -60
hitsound = s1,5
guardsound = s2,1
ground.type = High
ground.slidetime = 19
ground.hittime  = 20
ground.velocity = 0
guard.velocity = -9
air.type = High
air.velocity = 0,0
airguard.velocity = -4,-5
air.hittime = 12
fall = 1
fall.recover = 0
p1stateno = 1415
p2stateno = 1420
p1facing = 1
p2facing = 1
ground.cornerpush.veloff = ifelse(Movehit=1,1,0)
air.cornerpush.veloff = ifelse(Movehit=1,1,0)

[State 1000, ]
type = Varset
triggerall = var(59) = 0
trigger1 = time = 0
var(16) = 0

[State 210, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 百拾五式・毒咬み

[Statedef 1700]
type     = S
movetype = A
physics  = S
juggle   = 3
poweradd = 100
velset   = 0,0
anim     = 1700
ctrl     = 0
sprpriority = 3

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 8
value = s10,18
channel = 4

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 9
value = s0,4

[State 210, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemTime (1) >= 0 && AnimElemTime (4) <= 0
edge = 50,0

[State 210, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemTime (4) >= 0 && AnimElemTime (13) <= 0
edge = 30,0

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 1 | AnimElem = 4 | AnimElem = 5 | AnimElem = 6
trigger2 = AnimElem = 8 | AnimElem = 10 | AnimElem = 11 | AnimElem = 14
x = 10

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 2 | AnimElem = 3 
x = 15

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 9
x = 20

[State 1100, エフェクト?示]
type = Explod
trigger1 = AnimElem = 11
persistent = 0
anim = 1605
postype = P1
pos = 55,-65
sprpriority = 10
ignorehitpause = 1
ID = 1700

[State 200, ヒット定?]
type = HitDef
trigger1 = time = 0
attr = S, SA
damage = 40,8
animtype = Hard
guardflag = MA
hitflag = MAFP
priority = 5, Hit
pausetime = 10,11
sparkno = 3
guard.sparkno = s4120
sparkxy = -25, -65
hitsound = s1,1
guardsound = s2,1
ground.type = Low
ground.slidetime = 21
ground.hittime  = 21
ground.velocity = -9
air.velocity = -4,-4
air.hittime = 12
air.fall = 1
fall.recover = 0
palfx.time = 35
palfx.add = 80,-40,-140
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,15
palfx.invertall = 1
palfx.color = 0

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = Movehit = 1
value = s12,8
persistent = 0
ignorehitpause = 1

[State 1000, ]
type = Varset
triggerall = var(59) = 0
trigger1 = time = 0
var(16) = 0

[State 1000,]
type = ChangeState
triggerall = var(59) = 0
trigger1 = AnimElemtime(13) >= 5 && AnimElemtime(15) < 0
trigger1 = var(16) = 1
value = 1710

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 四百壱式・罪詠み

[Statedef 1710]
type     = S
movetype = A
physics  = S
juggle   = 2
poweradd = 10
velset   = 0,0
anim     = 1710
ctrl     = 0
sprpriority = 3

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = s0,4

[State 210, 物理的なキャラの幅]
type = Width
trigger1 = 1
edge = 25,0

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 1 | AnimElem = 2 | AnimElem = 3 | AnimElem = 4
x = 10

[State 1100, エフェクト?示]
type = Explod
trigger1 = AnimElem = 4
persistent = 0
anim = 1615
postype = P1
pos = 45,-65
sprpriority = 10
ignorehitpause = 1
ID = 1710

[State 2000,]
type = RemoveExplod
trigger1 = AnimElem = 4
ID = 1700

[State 200, ヒット定?]
type = HitDef
trigger1 = time = 0
attr = S, SA
damage = 30,6
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 5, Hit
pausetime = 10,11
sparkno = 3
guard.sparkno = s4120
sparkxy = -25, -65
hitsound = s1,1
guardsound = s2,1
ground.type = High
ground.slidetime = 21
ground.hittime  = 21
ground.velocity = -7
air.velocity = -3,-5
air.hittime = 12
air.fall = 1
fall.recover = 0
palfx.time = 35
palfx.add = 80,-40,-140
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,15
palfx.invertall = 1
palfx.color = 0

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = Movehit = 1
value = s12,8
persistent = 0
ignorehitpause = 1

[State 1000, ]
type = Varset
triggerall = var(59) = 0
trigger1 = time = 0
var(16) = 0

[State 1000, ]
type = Varset
triggerall = var(59) = 0
triggerall = AnimElemtime(6) < 0
trigger1 = command = "holdfwd"
trigger1 = command = "x" || command = "y"
var(16) = 1

[State 1000,]
type = ChangeState
triggerall = var(59) = 0
trigger1 = AnimElemtime(5) >= 2 && AnimElemtime(6) < 0
trigger1 = var(16) = 1
value = 1720

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 四百弐式・罰詠み

[Statedef 1720]
type     = S
movetype = A
physics  = S
juggle   = 1
poweradd = 10
velset   = 0,0
anim     = 1720
ctrl     = 0
sprpriority = 3

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = s3,0

[State 210, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemTime (3) >= 0 && AnimElemTime (6) <= 0
edge = 20,-50

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 3 | AnimElem = 4 | AnimElem = 5
x = 10

[State 1000, 軸位置移動]
type = Velset
trigger1 = AnimElem = 4
x = 3
y = -5

[State 1000, 軸位置移動]
type = VelAdd
trigger1 = AnimElemtime(4) > 0
y = .38

[State 6000, 3]
type = StateTypeSet
trigger1 = AnimElem = 4
statetype = A

[State 200, ヒット定?]
type = HitDef
trigger1 = time = 0
attr = A, SA
damage = 23,4
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 5, Hit
pausetime = 10,11
sparkno = 3
guard.sparkno = s4120
sparkxy = -25, -75
hitsound = s1,1
guardsound = s2,1
ground.type = High
ground.slidetime = 21
ground.hittime  = 22
ground.velocity = -2,-9
air.velocity = -2,-9
yaccel = .43
air.type = High
air.hittime = 12
fall = 1
fall.recover = 0
palfx.time = 50
palfx.add = 80,-40,-140
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,15
palfx.invertall = 1
palfx.color = 0

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = Movehit = 1
value = s12,8

[State 1000, ]
type = Varset
triggerall = var(59) = 0
trigger1 = time = 0
var(16) = 0

[State 1000,]
type = ChangeState
triggerall = var(59) = 0
trigger1 = AnimElemtime(5) >= 1 && AnimElemtime(6) < 0
trigger1 = var(16) = 1
value = 1730

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 20
value = 1160

;---------------------------------------------------------------------------
; 百式・鬼焼き

[Statedef 1730]
type     = A
movetype = A
physics  = N
juggle   = 1
poweradd = 10
anim     = 1730
ctrl     = 0
sprpriority = 5

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 1
value = s10,11
channel = 4

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 1
value = s12,2

[State 210, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemTime (1) >= 0 && AnimElemTime (3) <= 0
edge = 30,0

[State 1000, 軸位置移動]
type = Velset
trigger1 = AnimElem = 1
y = -3.5

[State 1000, 軸位置移動]
type = VelAdd
trigger1 = 1
y = .32

[State 1100, エフェクト?示]
type = Explod
trigger1 = AnimElem = 1
persistent = 0
anim = 1110
postype = P1
pos = 0,0
sprpriority = 10

[State 1100, エフェクト?示]
type = Explod
trigger1 = AnimElem = 6
persistent = 0
anim = 1115
postype = P1
pos = -10,15
sprpriority = 10

[State 200, ヒット定?]
type = HitDef
trigger1 = time = 0
attr = A, SA
damage = 20,4
animtype = up
guardflag = MA
hitflag = MAF
priority = 5, Hit
pausetime = 10,10
sparkno = 3
guard.sparkno = s4120
sparkxy = -25, -60
hitsound = s1,1
guardsound = s2,1
ground.type = High
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = -3.2,-8
guard.velocity = -9
air.velocity = -3.2,-8
yaccel = .45
air.type = High
air.hittime = 12
fall = 1
fall.recover = 0
palfx.time = 50
palfx.add = 80,-40,-140
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,15
palfx.invertall = 1
palfx.color = 0

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = Movehit = 1
value = s12,8

[State 1000, ]
type = Varset
triggerall = var(59) = 0
trigger1 = time = 0
var(16) = 0

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1160

;---------------------------------------------------------------------------
; 弱独楽屠り

[Statedef 1800]
type     = S
movetype = A
physics  = S
juggle   = 8
poweradd = 100
velset   = 0,0
anim     = 1800
ctrl     = 0
sprpriority = 5

[State 210, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemTime (3) >= 0
edge = 30,-60

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = s3,2

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = s10,16
channel = 4

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 7
value = s0,4

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 3
x = 10

[State 1000, 軸位置移動]
type = Velset
trigger1 = AnimElemtime(3) >= 0
x = 4

[State 1000, 軸位置移動]
type = Velset
trigger1 = AnimElem = 3
y = -8.5

[State 1000, 軸位置移動]
type = VelAdd
trigger1 = AnimElemtime(3) >= 0
y = .72

[State 6000, 3]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A

[State 200, ヒット定?]
type = HitDef
trigger1 = time = 0
attr = A, SA
damage = 100,20
animtype = up
guardflag = M
hitflag = HAF
priority = 5, Hit
pausetime = 6,6
sparkno = 3
guard.sparkno = s4120
sparkxy = -25, -75
hitsound = s1,4
guardsound = s2,1
ground.type = High
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = -5,15
guard.velocity = -11
air.velocity = -5,15
airguard.velocity = -5,-5
air.type = High
air.hittime = 12
fall = 1
fall.recover = 0
fall.envshake.ampl = 5
fall.envshake.freq = 90
fall.envshake.time = 15

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= -10
value = 1160

;---------------------------------------------------------------------------
; 強独楽屠り

[Statedef 1850]
type     = S
movetype = A
physics  = S
juggle   = 8
poweradd = 100
velset   = 0,0
anim     = 1850
ctrl     = 0
sprpriority = 5

[State 210, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemTime (3) >= 0
edge = 30,0

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = s3,2

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 5
value = s10,17
channel = 4

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 7
value = s0,4

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 3
x = 10

[State 1000, 軸位置移動]
type = Velset
trigger1 = AnimElemtime(3) >= 0
x = 6

[State 1000, 軸位置移動]
type = Velset
trigger1 = AnimElem = 3
y = -11

[State 1000, 軸位置移動]
type = VelAdd
trigger1 = AnimElemtime(3) >= 0
x = -.1
y = .7

[State 6000, 3]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A

[State 200, ヒット定?]
type = HitDef
trigger1 = time = 0
attr = A, SA
damage = 120,24
animtype = up
guardflag = M
hitflag = MAF
priority = 5, Hit
pausetime = 6,6
sparkno = 3
guard.sparkno = s4120
sparkxy = -25, -75
hitsound = s1,4
guardsound = s2,1
ground.type = High
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = -5,15
guard.velocity = -11
air.velocity = -5,15
airguard.velocity = -5,-5
air.type = High
air.hittime = 12
fall = 1
fall.recover = 0
fall.envshake.ampl = 5
fall.envshake.freq = 90
fall.envshake.time = 15

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= -10
value = 1160

;---------------------------------------------------------------------------
; 弱蒼鬼

[Statedef 1900]
type     = S
movetype = A
physics  = S
juggle   = 8
poweradd = 100
ctrl     = 0
velset   = 0,0
anim     = 1900
sprpriority = 3

[State 810, 物理的なキャラの幅]
type = Width
trigger1 = 1
edge = 30,0

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = s10,0
channel = 4

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = s0,4

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 2
x = 10

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 6
x = -10

[State 1000, 軸位置移動]
type = Velset
trigger1 = AnimElem = 2
x = 10

[State 1000, 軸位置移動]
type = Velset
trigger1 = AnimElem = 5
x = 0

[State 200, ヒット定?]
type = HitDef
trigger1 = time = 0
attr = S, SA
damage = 52, 11
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 5, Hit
pausetime = 10,11
sparkno = 3
guard.sparkno = s4120
sparkxy = -20, -60
hitsound = s1,1
guardsound = s2,1
ground.type = Low
ground.slidetime = 20
ground.hittime  = 21
ground.velocity = -6
air.velocity = -4,-4
air.hittime = 12
air.fall = 1
fall.recover = 0
palfx.time = 35
palfx.add = 80,-40,-140
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,15
palfx.invertall = 1
palfx.color = 0

[State 210, ステ?ト変更]
type = ChangeState
trigger1 = Movecontact
value = 1905

[State 210, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 強蒼鬼

[Statedef 1950]
type     = S
movetype = A
physics  = S
juggle   = 8
poweradd = 100
ctrl     = 0
velset   = 0,0
anim     = 1950
sprpriority = 3

[State 1120, 全身無敵]
type = NotHitBy
trigger1 = Time = 0
value = SCA
time = 13

[State 810, 物理的なキャラの幅]
type = Width
trigger1 = 1
edge = 30,0

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = s10,0
channel = 4

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = s0,4

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 2
x = 10

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 6
x = -10

[State 1000, 軸位置移動]
type = Velset
trigger1 = AnimElem = 2
x = 12

[State 1000, 軸位置移動]
type = Velset
trigger1 = AnimElem = 5
x = 0

[State 200, ヒット定?]
type = HitDef
trigger1 = time = 0
attr = S, SA
damage = 52, 11
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 5, Hit
pausetime = 10,11
sparkno = 3
guard.sparkno = s4120
sparkxy = -20, -60
hitsound = s1,1
guardsound = s2,1
ground.type = Low
ground.slidetime = 20
ground.hittime  = 21
ground.velocity = -6
air.velocity = -4,-4
air.hittime = 12
air.fall = 1
fall.recover = 0
palfx.time = 35
palfx.add = 80,-40,-140
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,15
palfx.invertall = 1
palfx.color = 0

[State 210, ステ?ト変更]
type = ChangeState
trigger1 = Movecontact
value = 1905

[State 210, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 蒼鬼?追撃

[Statedef 1905]
type     = S
movetype = A
physics  = S
juggle   = 0
poweradd = 0
velset   = 0,0
anim     = 1905
ctrl     = 0
sprpriority = 3

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 5
value = s3,0

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 5
value = s10,16
channel = 4

[State 210, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemTime (4) >= 0 && AnimElemTime (7) <= 0
edge = 20,-50

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 1 | AnimElem = 4 | AnimElem = 5 | AnimElem = 6
x = 10

[State 1000, 軸位置移動]
type = Velset
trigger1 = AnimElem = 5
x = 3
y = -5

[State 1000, 軸位置移動]
type = VelAdd
trigger1 = AnimElemtime(5) > 0
y = .38

[State 6000, 3]
type = StateTypeSet
trigger1 = AnimElem = 5
statetype = A

[State 200, ヒット定?]
type = HitDef
trigger1 = AnimElem = 4
attr = S, SA
damage = 32, 6
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 5, Hit
pausetime = 12,13
sparkno = 3
guard.sparkno = s4120
sparkxy = -20, -60
hitsound = s1,1
guardsound = s2,1
ground.type = High
ground.slidetime = 20
ground.hittime  = 21
ground.velocity = -6
air.type = High
air.velocity = -4,-4
air.hittime = 12
air.fall = 1
fall.recover = 0
palfx.time = 35
palfx.add = 80,-40,-140
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,15
palfx.invertall = 1
palfx.color = 0

[State 200, ヒット定?]
type = HitDef
trigger1 = AnimElem = 5
attr = A, SA
damage = 23,4
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 5, Hit
pausetime = 11,12
sparkno = 3
guard.sparkno = s4120
sparkxy = -25, -75
hitsound = s1,1
guardsound = s2,1
ground.type = High
ground.slidetime = 21
ground.hittime  = 22
ground.velocity = -3,-9
air.velocity = -3,-9
yaccel = .45
air.type = High
air.hittime = 12
fall = 1
fall.recover = 0
palfx.time = 50
palfx.add = 80,-40,-140
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,15
palfx.invertall = 1
palfx.color = 0
getpower = 25,25
givepower = 16,16

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = Movehit = 1
value = s12,8

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 20
value = 1160



[state -1] 
type = powerset 
trigger1 = 1 
value = 3000
;---------------------------------------------------------------------------
; EX暗仏

[Statedef 1951]
type     = S
movetype = A
physics  = S
juggle   = 0
poweradd = -500
velset   = 0,0
anim     = 1000
ctrl     = 0
sprpriority = 3

;---------------------------------------------------------
;Drive Cancel Effect 1  -------------------------------------------------------------------------
[State 1000, Explod]
type = Explod
triggerall = facing = 1
triggerall = AnimElem = 1
trigger1 = prevstateno = [1000,1950]
anim = 7120
pos = 0,80
postype = left
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 7
ownpal = 1

[State 1000, Explod]
type = Explod
triggerall = facing = 1
triggerall = AnimElem = 1
trigger1 = prevstateno = [1000,1950]
anim = 7123
pos = 80,80
postype = left
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 8
ownpal = 1

[State 1000, Explod]
type = Explod
triggerall = facing = 1
triggerall = AnimElem = 1
trigger1 = prevstateno = [1000,1950]
anim = 7124
pos = 80,80
postype = left
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 8
ownpal = 1

;Drive Cancel Effect -1 -------------------------------------------------------------------------
[State 1000, Explod]
type = Explod
triggerall = facing = -1
triggerall = AnimElem = 1
trigger1 = prevstateno = [1000,1950]
facing = -1
anim = 7120
pos = 0,80
postype = right
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 7
ownpal = 1

[State 1000, Explod]
type = Explod
triggerall = facing = -1
triggerall = AnimElem = 1
trigger1 = prevstateno = [1000,1950]
anim = 7123
pos = -80,80
postype = right
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 8
ownpal = 1

[State 1000, Explod]
type = Explod
triggerall = facing = -1
triggerall = AnimElem = 1
trigger1 = prevstateno = [1000,1950]
anim = 7124
pos = -80,80
postype = right
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 8
ownpal = 1
;---------------------------------------------------------

[State Helper]
Type               = Helper 
Trigger1           = Time = 0
Name               = "Skill_Color" 
ID                 = 8000 + ID
Pos                = 0,0
PosType            = P1 
StateNo            = 8000
OwnPal             = 1 
IgNoreHitPause     = 1 
SuperMoveTime      = 30

[State explod];????????
type = Explod
trigger1 = AnimElem = 1
anim = 7001
id = 4010
sprpriority = 30
postype = p1
pos = -10,0
supermove = 999
pausemove = 999
ignorehitpause = 1
bindtime = -1
persistent = 0
ownpal = 1
scale = 0.58,0.58

[State 30000, 底?]
type = Explod
trigger1 = AnimElem = 5
anim = 13038
postype = p1
pos = -10,0
scale = 0.5,0.5
sprpriority = 5
id = 13020
facing = 1
pausemovetime = 999
ownpal = 1
supermovetime = 999
bindtime = 0

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = s10,10
channel = 4

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = s10,10
channel = 4

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = s3500,15

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = time = 0
value = s3500,11

[State 1000, EnvColor]
type = EnvColor
trigger1 = time = 0
time = 3
value = 255,255,255
under = 1
ignorehitpause = 1

[State 1000, ヘルパーを出す]
type = Helper
trigger1 = AnimElem = 5
name = "DIBO"
stateno = 1014
ID = 1014
helpertype = normal
pos = 30,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1

[State 1000, エフェクト?示]
type = Explod
trigger1 = AnimElem = 5
persistent = 0
anim = 13025
postype = P1
pos = 10,-25
sprpriority = 5
bindtime = 1
ownpal = 1

[State 1000, エフェクト?示]
type = Explod
trigger1 = AnimElem = 5
persistent = 0
anim = 13027
postype = P1
pos = 30,0
sprpriority = 6
bindtime = 1
ownpal = 1

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
; EX独楽屠り
[Statedef 1952];Ok!
type    = S
movetype= A
physics = N
poweradd= -500
ctrl = 0
velset = 0
sprpriority = 2
juggle = 0
facep2 = 1

;---------------------------------------------------------
;Drive Cancel Effect 1  -------------------------------------------------------------------------
[State 1000, Explod]
type = Explod
triggerall = facing = 1
triggerall = time = 0
trigger1 = prevstateno = [1000,1950]
anim = 7120
pos = 0,80
postype = left
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 7
ownpal = 1

[State 1000, Explod]
type = Explod
triggerall = facing = 1
triggerall = time = 0
trigger1 = prevstateno = [1000,1950]
anim = 7123
pos = 80,80
postype = left
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 8
ownpal = 1

[State 1000, Explod]
type = Explod
triggerall = facing = 1
triggerall = time = 0
trigger1 = prevstateno = [1000,1950]
anim = 7124
pos = 80,80
postype = left
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 8
ownpal = 1

;Drive Cancel Effect -1 -------------------------------------------------------------------------
[State 1000, Explod]
type = Explod
triggerall = facing = -1
triggerall = time = 0
trigger1 = prevstateno = [1000,1950]
facing = -1
anim = 7120
pos = 0,80
postype = right
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 7
ownpal = 1

[State 1000, Explod]
type = Explod
triggerall = facing = -1
triggerall = time = 0
trigger1 = prevstateno = [1000,1950]
anim = 7123
pos = -80,80
postype = right
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 8
ownpal = 1

[State 1000, Explod]
type = Explod
triggerall = facing = -1
triggerall = time = 0
trigger1 = prevstateno = [1000,1950]
anim = 7124
pos = -80,80
postype = right
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 8
ownpal = 1
;---------------------------------------------------------


[State 30000, 底?]
type = Explod
trigger1 = time = 8
anim = 13010
postype = p1
pos = 10,-5
scale = 0.5,0.5
sprpriority = 5
id = 13020
facing = 1
ownpal = 1
pausemovetime = 999
supermovetime = 999
bindtime = 0

[State 30000, 底?]
type = Explod
trigger1 = time = 8
anim = 13037
postype = p1
pos = 10,-5
scale = 0.5,0.5
sprpriority = 5
ownpal = 1
id = 13020
facing = 1
pausemovetime = 999
supermovetime = 999
bindtime = 0

[State Helper]
Type               = Helper 
Trigger1           = Time = 0
Name               = "Skill_Color" 
ID                 = 8000 + ID
Pos                = 0,0
PosType            = P1 
StateNo            = 8000
OwnPal             = 1 
IgNoreHitPause     = 1 
SuperMoveTime      = 30

[State explod];????????
type = Explod
Trigger1           = Time = 0
anim = 7001
id = 4010
sprpriority = 30
postype = p1
pos = 15,0
supermove = 999
pausemove = 999
ignorehitpause = 1
bindtime = 0
persistent = 0
ownpal = 1
scale = 0.58,0.58

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = time = 0
value = s3500,11

[State 1000, EnvColor]
type = EnvColor
trigger1 = time = 0
time = 3
value = 255,255,255
under = 1
ignorehitpause = 1

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !time
value = 1551

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 3
statetype = A
;9.0234375
;8.40625

;0.6171875

;40448
[State -2, Accel]
type = VelSet
trigger1 = animelemtime(3) > 0
;x = (5.71875*exp((-0.04800921918636060775200362532344)*(time-8)))
x = (7*exp((-0.02800921918636060775200362532344)*(time-7)))
[State -2, Accel]
type = VelSet
trigger1 = animelemtime(3) > 0
;x = (5.71875*exp((-0.04800921918636060775200362532344)*(time-8)))
x = (9.53125*exp((-0.02800921918636060775200362532344)*(time-9)))

;5.71875
;5.45068359375
;5.1951904296875
[State -2, Accel]
type = VelSet
trigger1 = animelem = 3
y = -6

[State -2, Accel]
type = VelSet
trigger1 = animelem = 3
y = -4

[State -2, Accel]
type = VelSet
trigger1 = time = 39
y = -2

[State -2, Accel]
type = Velset
trigger1 = time = 39
x = -9

[State -2, Accel]
type = VelSet
trigger1 = time = 53
y = -2

[State -2, Accel]
type = Velset
trigger1 = time = 53
x = -9

[State -2, VelAdd]
type = VelAdd
trigger1 = time > 11
trigger1 = time < 90
y = 0.09375

[State -2, VelAdd]
type = VelAdd
trigger1 = time > 90
y = 0.28125
persistent = 1

[State -2, VelAdd]
type = PosAdd
trigger1 = animelem = 22
x = Vel X
persistent = 0

[State 1000, 1]
type = PlaySnd
trigger1 = animelem = 3
trigger2 = animelem = 8
trigger3 = animelem = 13
trigger4 = animelem = 17
trigger5 = animelem = 25
value = 0,3

[state 23]
type = playsnd
trigger1 = animelem = 24
value = s10,16

[State 210, 1]
type = HitDef
trigger1 = animelem = 4
attr = A, SA
damage = 60,10 ;1.24 Mul for Counter Hit
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 4, Hit
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -10, -80
hitsound = s1,3
guardsound = s2,1
ground.type = High
pausetime = 8,9
guard.pausetime = 8,9
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 28
ground.velocity = -4.5,ifelse(var(10),-10.5,-7)
air.type = High
air.velocity = -4.5,-7
air.hittime = 13
air.juggle = 0
getpower = 94,94
givepower = 16,16
fall = 1
air.fall = 1
id = 1800
fall.recovertime = 35
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
EnvShake.Time      =  6
EnvShake.Ampl      = -15


[State 210, 1]
type = HitDef
trigger1 = animelem = 7
attr = A, SA
damage = 15,10 ;1.24 Mul for Counter Hit
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 4, Hit
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -10, -80
hitsound = s1,3
guardsound = s2,1
ground.type = High
pausetime = 8,9
guard.pausetime = 8,9
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 28
ground.velocity = -3.5,-7
air.type = High
air.velocity = -3.5,-7
air.hittime = 13
air.juggle = 0
getpower = 94,94
givepower = 16,16
fall = 1
air.fall = 1
fall.recovertime = 35
id = 1801
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
EnvShake.Time      =  8
EnvShake.Ampl      = -12


[State 210, 1]
type = HitDef
trigger1 = animelem = 12
attr = A, SA
damage = 15,10 ;1.24 Mul for Counter Hit
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 4, Hit
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -10, -80
hitsound = s1,3
guardsound = s2,1
ground.type = High
pausetime = 8,9
guard.pausetime = 8,9
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 28
ground.velocity = -3.5,-7
air.type = High
air.velocity = -3.5,-7
air.hittime = 13
air.juggle = 0
getpower = 94,94
givepower = 16,16
fall = 1
air.fall = 1
fall.recovertime = 35
id = 1802
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
EnvShake.Time      =  8
EnvShake.Ampl      = -12


[State 210, 1]
type = HitDef
trigger1 = animelem = 16
attr = A, SA
damage = 15,10 ;1.24 Mul for Counter Hit
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 4, Hit
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -10, -80
hitsound = s1,3
guardsound = s2,1
ground.type = High
pausetime = 8,9
guard.pausetime = 8,9
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 28
ground.velocity = -2,-7
air.type = High
air.velocity = -2,-7
air.hittime = 13
air.juggle = 0
getpower = 94,94
givepower = 16,16
fall = 1
air.fall = 1
fall.recovertime = 35
id = 1803
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
EnvShake.Time      =  8
EnvShake.Ampl      = -12

[State 210, 1]
type = HitDef
trigger1 = animelem = 24
attr = A, SA
damage = 60,10
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 13,13
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -20, -60
hitsound = s1,3
guardsound = s2,1
ground.type = High
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = -5,15
guard.velocity = -11
air.velocity = -5,15
airguard.velocity = -3,-5
air.animtype = back
air.hittime = 0
air.fall = 1
fall.recover = 0
air.fall.recover = 0
fall = 1
fall.recovertime = 0
fall.envshake.ampl = 5
fall.envshake.freq = 90
fall.envshake.time = 15
getpower = 47,47
givepower = 16,16
p2stateno = 1551
id = 1804
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5
fall.xvelocity = -2
fall.yvelocity = -6
EnvShake.Time      =  8
EnvShake.Ampl      = -15


[State 1000, 6]
type = ChangeState
triggerall = statetype = A
trigger1 = Vel Y + Pos Y >= 0
value = 1160
ctrl = 0

;---------------------------------------------------------------------------
; EX七拾五式 改

[Statedef 1953]
type     = S
movetype = A
physics  = S
juggle   = 0
poweradd = -500
velset   = 0,0
anim     = 1250
ctrl     = 0
sprpriority = 5

;---------------------------------------------------------
;Drive Cancel Effect 1  -------------------------------------------------------------------------
[State 1000, Explod]
type = Explod
triggerall = facing = 1
triggerall = time = 0
trigger1 = prevstateno = [1000,1950]
anim = 7120
pos = 0,80
postype = left
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 7
ownpal = 1

[State 1000, Explod]
type = Explod
triggerall = facing = 1
triggerall = time = 0
trigger1 = prevstateno = [1000,1950]
anim = 7123
pos = 80,80
postype = left
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 8
ownpal = 1

[State 1000, Explod]
type = Explod
triggerall = facing = 1
triggerall = time = 0
trigger1 = prevstateno = [1000,1950]
anim = 7124
pos = 80,80
postype = left
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 8
ownpal = 1

;Drive Cancel Effect -1 -------------------------------------------------------------------------
[State 1000, Explod]
type = Explod
triggerall = facing = -1
triggerall = time = 0
trigger1 = prevstateno = [1000,1950]
facing = -1
anim = 7120
pos = 0,80
postype = right
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 7
ownpal = 1

[State 1000, Explod]
type = Explod
triggerall = facing = -1
triggerall = time = 0
trigger1 = prevstateno = [1000,1950]
anim = 7123
pos = -80,80
postype = right
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 8
ownpal = 1

[State 1000, Explod]
type = Explod
triggerall = facing = -1
triggerall = time = 0
trigger1 = prevstateno = [1000,1950]
anim = 7124
pos = -80,80
postype = right
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 8
ownpal = 1
;---------------------------------------------------------


[State Helper]
Type               = Helper 
Trigger1           = Time = 0
Name               = "Skill_Color" 
ID                 = 8000 + ID
Pos                = 0,0
PosType            = P1 
StateNo            = 8000
OwnPal             = 1 
IgNoreHitPause     = 1 
SuperMoveTime      = 30

[State explod]
type = Explod
Trigger1 = Time = 0
anim = 7001
id = 4010
sprpriority = 30
postype = p1
pos = 5,0
supermove = 999
pausemove = 999
ignorehitpause = 1
bindtime = 0
persistent = 0
ownpal = 1
scale = 0.58,0.58

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = time = 0
value = s3500,11

[State 1000, EnvColor]
type = EnvColor
trigger1 = time = 0
time = 3
value = 255,255,255
under = 1
ignorehitpause = 1

[State 1000, 1]
type = PlaySnd
trigger1 = time = 17
value = 0,3

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 5
value = s3,0
channel = 4

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 6
value = s10,12
channel = 4

[State 210, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemTime (2) >= 0 && AnimElemTime (6) <= 0
edge = 30,0

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 2 | AnimElem = 3
x = 5

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 5
x = 10

[State 1000, 軸位置移動]
type = Velset
trigger1 = AnimElemtime(4) >= 3
x = 3

[State 1000, 軸位置移動]
type = Velset
trigger1 = AnimElem = 6
y = -4

[State 1000, 軸位置移動]
type = VelAdd
trigger1 = AnimElemtime(6) > 0
y = .375

[State 6000, 3]
type = StateTypeSet
trigger1 = AnimElem = 6
statetype = A

[State 200, ヒット定?]
type = HitDef
trigger1 = time = 0
attr = A, SA
damage = 50,30
animtype = Hard
guardflag = M
hitflag = MAF
priority = 5, Hit
pausetime = 10,10
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -25, -70
hitsound = s1,3
guardsound = s2,1
ground.type = High
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = -4,-10
air.velocity = -4,-10
yaccel = .45
air.type = High
air.hittime = 12
fall = 1
fall.recover = 0
getpower = 25,25
givepower = 16,16
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
id = 1805


[State 1000, ]
type = Varset
triggerall = var(59) = 0
trigger1 = time = 0
var(16) = 0

[State 1000, ]
type = Varset
triggerall = var(59) = 0
triggerall = AnimElemtime(6) >= 0 && AnimElemtime(9) < 0
trigger1 = command = "b"
var(16) = 1

[State 1000,]
type = ChangeState
triggerall = var(59) = 0
trigger1 = AnimElemtime(8) >= 0 && AnimElemtime(9) < 0
trigger1 = var(16) = 1
value = 1954

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1260

;---------------------------------------------------------------------------
; 強七拾五式・改?二段目

[Statedef 1954]
type     = A
movetype = A
physics  = N
juggle   = 0
poweradd = 0
anim     = 1255
ctrl     = 0
sprpriority = 5

[State 1000, 1]
type = PlaySnd
trigger1 = time = 4
value = 0,3

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = s0,3
channel = 4

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = s10,13
channel = 4

[State 210, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemTime (1) >= 0 && AnimElemTime (5) <= 0
edge = 30,0

[State 1000, 軸位置移動]
type = VelAdd
trigger1 = 1
x = -.08
y = .3

[State 200, ヒット定?]
type = HitDef
trigger1 = time = 0
attr = A, SA
damage = 50,37
animtype = up
guardflag = M
hitflag = MAF
priority = 5, Hit
pausetime = 13,13
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -25, -70
hitsound = s1,3
guardsound = s2,1
ground.type = High
ground.slidetime = 16
ground.hittime  = 16
ground.velocity = -2.2,-11
guard.velocity = -10
air.velocity = -2.2,-11
yaccel = .54
air.type = High
air.hittime = 12
fall = 1
fall.recover = 0
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
getpower = 25,25
givepower = 16,16
EnvShake.Time      =  8
EnvShake.Ampl      = -12
id = 1806

[state 2]
type = varset
trigger1 = movehit
var(17) = 1

[State 1000, ]
type = Varset
triggerall = var(59) = 0
trigger1 = time = 0
var(16) = 0

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1260

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
; 強百式・鬼焼き?攻撃

[Statedef 1955]
type     = S
movetype = A
physics  = S
juggle   = 0
poweradd = -500
velset   = 0,0
anim     = 1156
ctrl     = 0
sprpriority = 5

;---------------------------------------------------------
;Drive Cancel Effect 1  -------------------------------------------------------------------------
[State 1000, Explod]
type = Explod
triggerall = facing = 1
triggerall = time = 0
trigger1 = prevstateno = [1000,1950]
anim = 7120
pos = 0,80
postype = left
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 7
ownpal = 1

[State 1000, Explod]
type = Explod
triggerall = facing = 1
triggerall = time = 0
trigger1 = prevstateno = [1000,1950]
anim = 7123
pos = 80,80
postype = left
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 8
ownpal = 1

[State 1000, Explod]
type = Explod
triggerall = facing = 1
triggerall = time = 0
trigger1 = prevstateno = [1000,1950]
anim = 7124
pos = 80,80
postype = left
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 8
ownpal = 1

;Drive Cancel Effect -1 -------------------------------------------------------------------------
[State 1000, Explod]
type = Explod
triggerall = facing = -1
triggerall = time = 0
trigger1 = prevstateno = [1000,1950]
facing = -1
anim = 7120
pos = 0,80
postype = right
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 7
ownpal = 1

[State 1000, Explod]
type = Explod
triggerall = facing = -1
triggerall = time = 0
trigger1 = prevstateno = [1000,1950]
anim = 7123
pos = -80,80
postype = right
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 8
ownpal = 1

[State 1000, Explod]
type = Explod
triggerall = facing = -1
triggerall = time = 0
trigger1 = prevstateno = [1000,1950]
anim = 7124
pos = -80,80
postype = right
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 8
ownpal = 1
;---------------------------------------------------------


[State Helper]
Type               = Helper 
Trigger1           = Time = 0
Name               = "Skill_Color" 
ID                 = 8000 + ID
Pos                = 0,0
PosType            = P1 
StateNo            = 8000
OwnPal             = 1 
IgNoreHitPause     = 1 
SuperMoveTime      = 30

[State explod]
type = Explod
Trigger1           = Time = 0
anim = 7001
id = 4010
sprpriority = 30
postype = p1
pos = 5,0
supermove = 999
pausemove = 999
ignorehitpause = 1
bindtime = 0
persistent = 0
ownpal = 1
scale = 0.58,0.58

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = time = 0
value = s3500,11


[State Helper]
Type               = Helper 
Triggerall         = random < 200
Trigger1         = movehit = 1
Name               = "Skill_Fire" 
ID                 = 7000 + ID
Pos                = 0,0
PosType            = P2 
StateNo            = 7000
OwnPal             = 1 
IgNoreHitPause     = 1 

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 1
value = s10,11
channel = 4

[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = s3500,14

[State 210, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemTime (1) >= 0 && AnimElemTime (3) <= 0
edge = 30,0

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 1
x = 18

[State 1000, 軸位置移動]
type = Velset
trigger1 = AnimElem = 2
x = 1.8
y = -6.5

[State 1000, 軸位置移動]
type = Velset
trigger1 = AnimElem = 6
x = 1.8
y = -6.5

[State 1000, 軸位置移動]
type = VelAdd
trigger1 = AnimElemtime(2) > 0
y = .42

[State 6000, 3]
type = StateTypeSet
trigger1 = AnimElem = 2
statetype = A

[State 1100, エフェクト?示]
type = Explod
trigger1 = AnimElem = 2
persistent = 0
anim = 13031
postype = P1
bindtime = 1
vel = .1,-.1
pos = 50,-5
ownpal = 1
sprpriority = 10

[State 1100, エフェクト?示]
type = Explod
trigger1 = AnimElem = 7
persistent = 0
anim = 13031
postype = P1
bindtime = 1
vel = .1,-.1
pos = 50,-5
ownpal = 1
sprpriority = 10

[State 200, ヒット定?]
type = HitDef
trigger1 = AnimElem = 1
attr = S, SA
damage = 80,10
animtype = Hard
guardflag = M
hitflag = MAF
priority = 5, Hit
pausetime = 5,5
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -25, -60
hitsound = s1,1
guardsound = s2,1
ground.type = High
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = 0
air.velocity = -2.3,-9
airguard.velocity = 0,-7
guard.velocity = -12
air.type = High
air.hittime = 12
air.fall = 1
fall.recovertime = 30
palfx.time = 25
palfx.add = 80,-40,-140
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,15
palfx.invertall = 1
palfx.color = 0
getpower = 25,25
givepower = 16,16
yaccel = .5
ground.cornerpush.veloff = -5
EnvShake.Time      =  6
EnvShake.Ampl      = -10
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
id = 1807


[State 200, ヒット定?]
type = HitDef
trigger1 = AnimElem = 2
trigger2 = Movecontact = 0 && AnimElem = 2
trigger2 = AnimElem = 3
attr = A, SA
damage = 40,10
animtype = hard
guardflag = M
hitflag = MAF
priority = 5, Hit
pausetime = 5,5
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -25, -60
hitsound = s1,1
guardsound = s2,1
ground.type = High
ground.slidetime = 35
ground.hittime = 20
ground.velocity = 0,-10
air.velocity = 0,-9
airguard.velocity = -5,-7
guard.velocity = -12
air.type = High
air.hittime = 12
fall = 1
fall.recovertime = 30
guard.velocity = -10
palfx.time = 60
palfx.add = 80,-40,-140
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,15
palfx.invertall = 1
palfx.color = 0
getpower = 25,25
givepower = 16,16
yaccel = .5
ground.cornerpush.veloff = 0
EnvShake.Time      =  8
EnvShake.Ampl      = -12
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
id = 1808

[State 200, ヒット定?]
type = HitDef
trigger1 = AnimElem = 8
trigger2 = AnimElem = 9
attr = A, SA
damage = 20,10
animtype = hard
guardflag = M
hitflag = MAF
priority = 5, Hit
pausetime = 5,5
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -25, -60
hitsound = s1,1
guardsound = s2,1
ground.type = High
ground.slidetime = 35
ground.hittime = 20
ground.velocity = 0,-10
air.velocity = 0,-9
airguard.velocity = -5,-7
guard.velocity = -12
air.type = High
air.hittime = 12
fall = 1
fall.recovertime = 30
guard.velocity = -10
palfx.time = 60
palfx.add = 80,-40,-140
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,15
palfx.invertall = 1
palfx.color = 0
getpower = 25,25
givepower = 16,16
yaccel = .5
ground.cornerpush.veloff = 0
EnvShake.Time      =  8
EnvShake.Ampl      = -12
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
id = 1809


[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = Movehit = 1
value = s3500,13

[State 1000, ステ?ト変更]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1160

;---------------------------------------------------------------------------
; 琴月?掴み

[Statedef 1956]
type     = S
movetype = A
physics  = S
juggle   = 0
poweradd = -500
ctrl     = 0
velset   = 0,0
anim     = 1410
sprpriority = 5

;---------------------------------------------------------
;Drive Cancel Effect 1  -------------------------------------------------------------------------
[State 1000, Explod]
type = Explod
triggerall = facing = 1
triggerall = time = 0
trigger1 = prevstateno = [1000,1950]
anim = 7120
pos = 0,80
postype = left
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 7
ownpal = 1

[State 1000, Explod]
type = Explod
triggerall = facing = 1
triggerall = time = 0
trigger1 = prevstateno = [1000,1950]
anim = 7123
pos = 80,80
postype = left
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 8
ownpal = 1

[State 1000, Explod]
type = Explod
triggerall = facing = 1
triggerall = time = 0
trigger1 = prevstateno = [1000,1950]
anim = 7124
pos = 80,80
postype = left
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 8
ownpal = 1

;Drive Cancel Effect -1 -------------------------------------------------------------------------
[State 1000, Explod]
type = Explod
triggerall = facing = -1
triggerall = time = 0
trigger1 = prevstateno = [1000,1950]
facing = -1
anim = 7120
pos = 0,80
postype = right
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 7
ownpal = 1

[State 1000, Explod]
type = Explod
triggerall = facing = -1
triggerall = time = 0
trigger1 = prevstateno = [1000,1950]
anim = 7123
pos = -80,80
postype = right
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 8
ownpal = 1

[State 1000, Explod]
type = Explod
triggerall = facing = -1
triggerall = time = 0
trigger1 = prevstateno = [1000,1950]
anim = 7124
pos = -80,80
postype = right
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 8
ownpal = 1
;---------------------------------------------------------


[State Helper]
Type               = Helper 
Trigger1           = Time = 0
Name               = "Skill_Color" 
ID                 = 8000 + ID
Pos                = 0,0
PosType            = P1 
StateNo            = 8000
OwnPal             = 1 
IgNoreHitPause     = 1 
SuperMoveTime      = 30


[State 170, 無敵]
type = NotHitBy
trigger1 = 1
value = SCA

[State explod]
type = Explod
Trigger1           = Time = 0
anim = 7001
id = 4010
sprpriority = 30
postype = p1
pos = 0,0
supermove = 999
pausemove = 999
ignorehitpause = 1
bindtime = -1
persistent = 0
ownpal = 1
scale = 0.58,0.58

[State 1000, EnvColor]
type = EnvColor
trigger1 = time = 0
time = 3
value = 255,255,255
under = 1
ignorehitpause = 1

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = time = 0
value = s3500,11

[State 810, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemtime(1) > 0 && AnimElemtime(3) < 0
edge = 50,0

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 1 | AnimElem = 3
x = 10

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 2
x = 30

[State 200, ヒット定?]
type = HitDef
trigger1 = AnimElem = 3
attr = S, ST
damage = 0, 0
animtype = Hard
hitflag = MAFDP
priority = 5, Hit
pausetime = 3,3
sparkno = s13024
guard.sparkno = s13022 
sparkxy = -25, -60
hitsound = s1,6
guardsound = s2,1
ground.type = High
ground.slidetime = 19
ground.hittime = 19
ground.velocity = 0
air.type = High
air.velocity = 0,0
airguard.velocity = -4,-5
air.hittime = 12
fall = 1
fall.recover = 0
p1facing = 1
p2facing = 1
guard.velocity = -12
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = -20
getpower = 0,0
givepower = 0,0

[State 1000, p2GCRUSH]
type = targetstate
trigger1 = movehit
persistent = 0
ignorehitpause = 0
value = 1420
ctrl = 0

[State 1000, ChangeState]
type = ChangeState
trigger1 = movehit
persistent = 0
ignorehitpause = 0
value = 1416
ctrl = 0

[State 210, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
; 琴月?爆破

; 琴月?爆破

[Statedef 1416]
type     = S
movetype = A
physics  = S
juggle   = 0
poweradd = 0
ctrl     = 0
velset   = 0,0
anim     = 1415
sprpriority = 5

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State Helper]
Type               = Helper 
Triggerall         = random < 150
trigger1 = time > 32
Name               = "Skill_Fire" 
ID                 = 7000 + ID
Pos                = 0,0
PosType            = P2 
StateNo            = 7000
OwnPal             = 1 
IgNoreHitPause     = 1 


[State 810, 物理的なキャラの幅]
type = Width
trigger1 = 1
edge = 50,0

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElemtime(1) = 10
value = s10,15
channel = 4

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = time = 32
value = s3600,18

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = time = 32
value = s3600,19

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = time = 32
value = s3500,12

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = time = 32
value = s3500,13

[State 1100, エフェクト?示]
type = Explod
trigger1 = time = 32
persistent = 0
anim = 1430
postype = P1
pos = 40,-88
sprpriority = 10
scale = 0.35,0.35
ownpal = 1

[State 30000, 底?]
type = Explod
trigger1 = time = 32
anim = 13038
postype = p1
pos = 0,5
scale = 0.65,0.65
sprpriority = 10
id = 13020
facing = 1
ownpal = 1
pausemovetime = 999
supermovetime = 999
bindtime = 0

[State 30000, 底?]
type = Explod
trigger1 = time = 32
anim = 13020
postype = p1
scale = 0.45,0.45
under = 1
id = 13020
ownpal = 1
pausemovetime = 999
supermovetime = 999

[State 30000, 底?]
type = Explod
trigger1 = time = 32
anim = 13021
postype = p1
scale = 1,1
ontop = 1
id = 13021
ownpal = 1
pausemovetime = 999
supermovetime = 999

[State 30000, 底?]
type = Explod
trigger1 = time = 32
anim = 13038
postype = p1
pos = 0,5
scale = 1,1
sprpriority = 10
id = 13020
facing = -1
ownpal = 1
pausemovetime = 999
supermovetime = 999
bindtime = 0

[State 1000, EnvColor]
type = EnvColor
trigger1 = time = 32
time = 3
value = 255,255,255
under = 1
ignorehitpause = 1

[State 1000, 軸位置移動]
type = Posadd
trigger1 = AnimElem = 1
x = 10

[State 810, 3]
type = TargetBind
trigger1 = AnimElemtime(1) >= 0 && AnimElemtime(2) <= 0
pos = 42, -90

[State 810, 3]
type = TargetBind
trigger1 = AnimElemtime(2) >= 0 && AnimElemtime(3) <= 0
pos = 42, -122

[State 810, 3]
type = TargetBind
trigger1 = AnimElemtime(3) = 1
pos = 42, -50

[State 2110, 相手と重なった時の処理]
type = PlayerPush
trigger1 = 1
value = 0

[State 810, ヒット定?]
type = HitDef
trigger1 = AnimElem = 3
attr = S, NT
damage = 150,150
animtype = high
hitflag = MAF
priority = 5, Hit
pausetime = 0,0
sparkno = -1
ground.type = High
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = -4,-12
air.velocity = -4,-12
yaccel = .5
air.type = High
air.hittime = 12
fall = 1
fall.recover = 0
palfx.time = 80
palfx.add = 80,-40,-140
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,15
palfx.invertall = 1
palfx.color = 0
getpower = 25,25
givepower = 16,16
numhits = 0
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
EnvShake.Time      =  18
EnvShake.Ampl      = -18
id = 1810


[State 1000, ヘルパーを出す]
type = Helper
trigger1 = time = 32
name = "DIBO"
stateno = 1958
ID = 1958
helpertype = normal
sprpriority = 2
pos = 2,0
postype = p1
size.xscale = 0.7
size.yscale = 0.8
facing = 1
keyctrl = 0
ownpal = 1


[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = Movehit = 1
value = s12,8

[State 210, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


[Statedef 1958]
type     = S
movetype = A
physics  = S
juggle   = 0
poweradd = 0
ctrl     = 0
velset   = 0,0
anim     = 13042
sprpriority = 5

[State 0, SprPriority]
type = SprPriority
trigger1 = 1
value = 5
ignorehitpause = 1

[State 30000, 底?]
type = Explod
trigger1 = animelem = 14
anim = 13043
postype = p1
pos = 0,5
scale = 0.7,0.8
sprpriority = 6
id = 13020
pausemovetime = 999
supermovetime = 999
bindtime = 0

[State 0, DestroySelf]
type = DestroySelf
trigger1 = AnimTime = 0
