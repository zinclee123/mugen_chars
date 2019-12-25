;-----------------------------------------------------------
; 破防Helper1

[Statedef 12000]
type = S
ctrl = 0
anim = 9999
velset = 0,0
movetype = A
physics = N
sprpriority = 0

[state turn]
type = turn
trigger1 = facing != root,facing

[State Explod]
type = Explod
trigger1 = time = 0
anim = 7055
id = 7000
sprpriority = 20
postype = p2
pos = Floor(EnemyNear,Const(size.mid.pos.x)),Floor(EnemyNear,Const(size.mid.pos.y)*1.3*(1+(P2StateType = A)*0.1*(1-(P2StateType = C)*0.5)))
bindtime = 1
supermove = 999
pausemove = 999
ignorehitpause = 1
persistent = 0
under = 0
ontop = 1
ownpal = 1
facing = -1


[state playsnd]
type = playsnd
trigger1 = time = 0
value = 12000,0

[state a]
type = Helper
trigger1 = time = 0
id = 12010
name = "g"
sprpriority = 1
pos = 0,0
postype = back
stateno = 12010
Helpertype = normal
keyctrl = 1 
ownpal = 1

[state DestroySelf]
type = DestroySelf
trigger1 = time = 0


;-----------------------------------------------------------
; 破防Helper2

[Statedef 12010]
type = S
ctrl = 0
anim = 9999
velset = 0,0
movetype = I
physics = N
sprpriority = 200

[State -2]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[state -2,a]
type = Explod
triggerall = TeamSide = 1
trigger1 = time = 0
anim = 12010
id = 12000
postype = Left
bindtime = -1
facing = 1
pos = 0,ceil(GameHeight/2-20+root,var(35))
sprpriority = 95
removetime = -2
pausemovetime = 999999
supermovetime = 999999
scale = 0.4,0.4

[state -2,a]
type = Explod
triggerall = TeamSide = 2
trigger1 = time = 0
anim = 12011
id = 12000
postype = Right
bindtime = -1
facing = -1
pos = 0,ceil(GameHeight/2-20+root,var(35))
sprpriority = 95
removetime = -2
pausemovetime = 999999
supermovetime = 999999
scale = 0.4,0.4

[state VarSet]
type = VarSet
trigger1 = time = 0
var(2) = 256

[state VarAdd]
type = VarAdd
trigger1 = time >= 8
trigger1 = time < 42
var(2) = -8

[State palfx];
type = palfx
trigger1 = time >= 8
trigger1 = time < 72
time = 1
add = var(2),var(2),var(2)

[state DestroySelf]
type = DestroySelf
trigger1 = time = 80


;===========================================================================
[Statedef 30000]
type    = S
movetype= I
physics = N
anim    = 10000000
ctrl    = 0
sprpriority = 5

[State 30000]
type = PosSet
trigger1 = time = 0
y = 0
ignorehitpause = 1

[State 30000]
type = EnvShake
trigger1 = time = 0
time = 7
freq = 70
ampl = -10
ignorehitpause = 1

[State 30000]
type = Explod
triggerall = numexplod(13020) = 0
trigger1 = time = 0
anim = 13020
postype = p1
scale = 0.45,0.45
under = 1
id = 13020
pausemovetime = 999
supermovetime = 999

[State 30000]
type = Explod
triggerall = numexplod(13021) = 0
triggerall = time = 0
Trigger1 = enemynear,GetHitVar(YVel) >= 7
Trigger2 = enemynear,GETHITVAR(YACCEL) >= 0.525
anim = 13021
postype = p1
scale = 0.45,0.45
ontop = 1
id = 13021
pausemovetime = 999
supermovetime = 999

[State 30000]
type = PlaySnd
ignorehitpause = 1
Trigger1          = enemynear,GetHitVar(YVel) < 7
Trigger2          = enemynear,GETHITVAR(YACCEL) < 0.525
triggerall = time = 0
channel = 6
loop = 0
value = S3500,2

[State 30000]
type = PlaySnd
ignorehitpause = 1
Trigger1 = enemynear,GetHitVar(YVel) >= 7
Trigger2 = enemynear,GETHITVAR(YACCEL) >= 0.525
triggerall = time = 0
channel = 6
loop = 0
value = S3500,10

[State 30000]
type = DestroySelf
trigger1 = time = 1

;===========================================================================
[Statedef 30001]
type    = S
movetype= I
physics = N
anim    = 10000000
ctrl    = 0
sprpriority = 5

[State 30000]
type = PosSet
trigger1 = time = 0
y = 0
ignorehitpause = 1

[State 2100,]
type = Envcolor
trigger1 = time = 0
time = 1
value = 255,255,255
under = 1

[State 30000]
type = EnvShake
trigger1 = time = 0
time = 10
freq = 140
ampl = -20
ignorehitpause = 1

[State 30000]
type = Explod
triggerall = numexplod(13020) = 0
trigger1 = time = 0
anim = 13020
postype = p1
scale = 0.45,0.45
under = 1
id = 13020
pausemovetime = 999
supermovetime = 999

[State 30000]
type = Explod
triggerall = numexplod(13021) = 0
trigger1 = time = 0
anim = 13021
postype = p1
scale = 0.45,0.45
ontop = 1
id = 13021
pausemovetime = 999
supermovetime = 999

[State 30000]
type = PlaySnd
ignorehitpause = 1
trigger1 = time = 0
channel = 6
loop = 0
value = S3500,10

[State 30000]
type = DestroySelf
trigger1 = time = 1

;===========================================================================
[Statedef 17087]
type	     = A
movetype     = H
physics	     = N
velset	     = 3, 6
ctrl	     = 0
sprpriority  = 2

[State 17087, Turn]
type = Turn
trigger1 = time = 0
ignorehitpause = 1

[State 17087, ChangeAnim2]
type = ChangeAnim2
trigger1 = !time
value = 17087
ignorehitpause = 1

[State 17087]
type = VelAdd
trigger1 = 1
y = 1.5

[State 17087, PalFX]
type = PalFX
trigger1 = time % 15 = 0
time = 15
add = 0,40,130
mul = 256,256,256
sinadd = 92,92,92,15
invertall = 1
color = 256
ignorehitpause = 1  

[State 17087, 5]
type = ChangeState
trigger1 = vel y > 0 && pos y > 0
value = 17088

[State 17087, 5]
type = SelfState
trigger1 = time > 100
value = 5100

;===========================================================================
[Statedef 17088]
type    = A
movetype= H
physics = N
anim    = 17088
velset = -2.5, -7
ctrl = 0

[State 17088, ChangeAnim2]
type = ChangeAnim2
trigger1 = !time
value = 17088
ignorehitpause = 1

[State 17088, PosSet]
type = PosSet
trigger1 = time = 0
y = 0
ignorehitpause = 1

[State 17088]
type = VelAdd
trigger1 = 1
y = .32

[State 17088, 5]
type = SelfState
trigger1 = vel y > 0 && pos y > 0
value = 5100

;===========================================================================
;(HELPER)弾
[Statedef 1011]
type = A
ctrl = 0
anim = 13028
velset = 4,0
movetype = A
physics = N
sprpriority = 5

[State Helper]
Type               = Helper 
Trigger1           = movehit = 1
Name               = "Skill_Fire" 
ID                 = 7000 + ID
Pos                = 0,0
PosType            = P2 
StateNo            = 7000
OwnPal             = 1 
IgNoreHitPause     = 1 

[State 0, SprPriority]
type = SprPriority
trigger1 = 1
value = 5
ignorehitpause = 1

;---------------------[エフェクト]
[State explod];エフェクト
type = Explod
trigger1 = time % 5 = 0
anim = 13026
id = 1010
sprpriority = 10
postype = p1
pos = 0,0
bindtime = -1
ignorehitpause = 1
under = 0
ownpal = 1

[State explod];エフェクト
type = Explod
trigger1 = time % 5 = 0
anim = 13030
id = 1020
sprpriority = 10
postype = p1
pos = -20,0
bindtime = 1
ignorehitpause = 1
under = 0
ownpal = 1

;---------------------[当身関係]
[State HitBy]
Type               = HitBy
Trigger1           = MoveType = A
Time               = 1
Value              = SCA,AP

[State HitOverride]
Type               = HitOverride
Trigger1           = MoveType = A
Time               = 1
Attr               = SCA,AP
StateNo            = 1015
IgnoreHitPause     = 1

;---------------------[攻撃]
[State 600, 2]
type = HitDef
trigger1 = movecontact = 0
attr = SCA,AP
animtype  = hard
damage    = 0,10
priority = 1, Hit
getpower = 0,0
givepower = 16,16
hitflag = MAF
guardflag = M
hitsound = s3500,13
guardsound = s2,1
pausetime = 0,12
sparkno = s13003 
guard.sparkno = s13022
sparkxy = 20,-45
ground.type = Low
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -12
guard.velocity = -12
air.juggle = 8
air.velocity = -3.6,-3.8
air.fall = 1
fall.recover = 0
palfx.time = 25
palfx.add = 80,-40,-140
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,15
palfx.invertall = 1
palfx.color = 0
id = 1011
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
EnvShake.Time      =  4
EnvShake.Ampl      = -7

[State PowerAdd]
type = PowerAdd
Trigger1 = movecontact && NumTarGet(1011)
value = 120

[State TarGetLifeAdd]
Type               = TargetLifeAdd
Trigger1           = movehit && NumTarGet(1011)
Id                 = 1011
Value              = -60
Absolute           = 1
IgnoreHitPause     = 1
Persistent         = 0
;---------------------[攻撃]

[State ChangeState]
Type               = ChangeState
Trigger1           = MoveContact
Value              = 1015
IgnoreHitPause     = 1

[State DestroySelf]
Type               = DestroySelf
Trigger1           = FrontEdgeBodyDist <= -5
Trigger2           = MoveContact
IgnoreHitPause     = 1
;----------------------------------------------------------------------------
;(HELPER)弾
[Statedef 1012]
type = A
ctrl = 0
anim = 13028
velset = 7,0
movetype = A
physics = N
sprpriority = 5

[State Helper]
Type               = Helper 
Trigger1         = movehit = 1
Name               = "Skill_Fire7" 
ID                 = 7000 + ID
Pos                = 0,0
PosType            = P2 
StateNo            = 7000
OwnPal             = 1 
IgNoreHitPause     = 1 

[State 0, SprPriority]
type = SprPriority
trigger1 = 1
value = 5
ignorehitpause = 1

;---------------------[エフェクト]
[State explod];エフェクト
type = Explod
trigger1 = time % 5 = 0
anim = 13026
id = 1010
sprpriority = 10
postype = p1
pos = 0,0
bindtime = -1
ignorehitpause = 1
under = 0
ownpal = 1

[State explod];エフェクト
type = Explod
trigger1 = time % 5 = 0
anim = 13030
id = 1020
sprpriority = 10
postype = p1
pos = -20,0
bindtime = 1
ignorehitpause = 1
under = 0
ownpal = 1

;---------------------[当身関係]
[State HitBy]
Type               = HitBy
Trigger1           = MoveType = A
Time               = 1
Value              = SCA,AP

[State HitOverride]
Type               = HitOverride
Trigger1           = MoveType = A
Time               = 1
Attr               = SCA,AP
StateNo            = 1015
IgnoreHitPause     = 1

;---------------------[攻撃]
[State 600, 2]
type = HitDef
trigger1 = movecontact = 0
attr = SCA,AP
animtype  = hard
damage    = 0,10
priority = 1, Hit
getpower = 0,0
givepower = 16,16
hitflag = MAF
guardflag = M
hitsound = s3500,13
guardsound = s2,1
pausetime = 0,12
sparkno = s13003 
guard.sparkno = s13022
sparkxy = 20,-45
ground.type = Low
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -12
guard.velocity = -12
air.juggle = 8
air.velocity = -3.6,-3.8
air.fall = 1
fall.recover = 0
palfx.time = 25
palfx.add = 80,-40,-140
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,15
palfx.invertall = 1
palfx.color = 0
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
EnvShake.Time      =  4
EnvShake.Ampl      = -7
id = 1012

[State PowerAdd]
type = PowerAdd
Trigger1 = movecontact && NumTarGet(1012)
value = 120

[State TarGetLifeAdd]
Type               = TarGetLifeAdd
Trigger1           = movehit&&NumTarGet(1012)
Id                 = 1012
Value              = -60
Absolute           = 1
IgnoreHitPause     = 1
Persistent         = 0
;---------------------[攻撃]

[State ChangeState]
Type               = ChangeState
Trigger1           = MoveContact
Value              = 1015
IgnoreHitPause     = 1

[State DestroySelf]
Type               = DestroySelf
Trigger1           = FrontEdgeBodyDist <= -5
Trigger2           = MoveContact
IgnoreHitPause     = 1
;----------------------------------------------------------------------------
;(HELPER)弾
[Statedef 1013]
type = A
ctrl = 0
anim = 13028
velset = 12,0
movetype = A
physics = N
sprpriority = 5

[State Helper]
Type               = Helper 
Trigger1         = movehit = 1
Name               = "Skill_Fire8" 
ID                 = 7000 + ID
Pos                = 0,0
PosType            = P2 
StateNo            = 7000
OwnPal             = 1 
IgNoreHitPause     = 1 

[State 0, SprPriority]
type = SprPriority
trigger1 = 1
value = 5
ignorehitpause = 1

;---------------------[エフェクト]
[State explod];エフェクト
type = Explod
trigger1 = time % 5 = 0
anim = 13026
id = 1010
sprpriority = 10
postype = p1
pos = 0,0
bindtime = -1
ignorehitpause = 1
under = 0
ownpal = 1

[State explod];エフェクト
type = Explod
trigger1 = time % 5 = 0
anim = 13030
id = 1020
sprpriority = 10
postype = p1
pos = -20,0
bindtime = 1
ignorehitpause = 1
under = 0
ownpal = 1

;---------------------[当身関係]
[State HitBy]
Type               = HitBy
Trigger1           = MoveType = A
Time               = 1
Value              = SCA,AP

[State HitOverride]
Type               = HitOverride
Trigger1           = MoveType = A
Time               = 1
Attr               = SCA,AP
StateNo            = 1015
IgnoreHitPause     = 1

;---------------------[攻撃]
[State 600, 2]
type = HitDef
trigger1 = movecontact = 0
attr = SCA,AP
animtype  = hard
damage    = 50,10
priority = 5, Hit
getpower = 25,25
givepower = 16,16
hitflag = MAFDP
guardflag = M
hitsound = s3500,13
guardsound = s2,1
pausetime = 0,12
sparkno = s13003 
guard.sparkno = s13022
sparkxy = 20,-45
ground.type = Low
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -12
guard.velocity = -12
air.juggle = 8
air.velocity = -3.6,-3.8
air.fall = 1
fall.recover = 0
palfx.time = 99
palfx.add = 80,-40,-140
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,15
palfx.invertall = 1
palfx.color = 0
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
EnvShake.Time      =  8
EnvShake.Ampl      = -12
id = 1812

[State ChangeState]
Type               = ChangeState
Trigger1           = MoveContact
Value              = 1015
IgnoreHitPause     = 1

[State DestroySelf]
Type               = DestroySelf
Trigger1           = FrontEdgeBodyDist <= -5
Trigger2           = MoveContact
IgnoreHitPause     = 1
;----------------------------------------------------------------------------
;(HELPER)弾
[Statedef 1014]
type = A
ctrl = 0
anim = 13028
velset = 9,0
movetype = A
physics = N
sprpriority = 5

[State Helper]
Type               = Helper 
Trigger1         = random < 2000
Trigger1         = movehit = 1
Name               = "Skill_Fire9" 
ID                 = 7000 + ID
Pos                = 0,0
PosType            = P2 
StateNo            = 7000
OwnPal             = 1 
IgNoreHitPause     = 1 

[State 0, SprPriority]
type = SprPriority
trigger1 = 1
value = 5
ignorehitpause = 1

;---------------------[エフェクト]
[State explod];エフェクト
type = Explod
trigger1 = time % 5 = 0
anim = 13026
id = 1010
sprpriority = 10
postype = p1
pos = 0,0
bindtime = -1
ignorehitpause = 1
under = 0
ownpal = 1

[State explod];エフェクト
type = Explod
trigger1 = time % 5 = 0
anim = 13030
id = 1020
sprpriority = 10
postype = p1
pos = -20,0
bindtime = 1
ignorehitpause = 1
under = 0
ownpal = 1

;---------------------[当身関係]
[State HitBy]
Type               = HitBy
Trigger1           = MoveType = A
Time               = 1
Value              = SCA,AP

[State HitOverride]
Type               = HitOverride
Trigger1           = MoveType = A
Time               = 1
Attr               = SCA,AP
StateNo            = 1016
IgnoreHitPause     = 1

;---------------------[攻撃]
[State 600, 2]
type = HitDef
trigger1 = movecontact = 0
attr = SCA,AP
animtype  = hard
damage    = 0,10
priority = 3, Hit
getpower = 0,0
givepower = 16,16
hitflag = MAFDP
guardflag = M
hitsound = s3500,13
guardsound = s2,1
pausetime = 0,12
sparkno = s13003 
guard.sparkno = s13022
sparkxy = 20,-45
ground.type = Low
ground.hittime = 15
ground.slidetime = 15
ground.velocity = -3.6,-8
guard.velocity = -3.6
air.juggle = 8
air.velocity = -3.6,-8
air.fall = 1
fall = 1
fall.recover = 0
palfx.time = 99
palfx.add = 80,-40,-140
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,15
palfx.invertall = 1
palfx.color = 0
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
yaccel = .54
id = 1811

[State TarGetLifeAdd]
Type               = TarGetLifeAdd
TriggerAll         = NumTarGet(1811)
Trigger1           = MoveHit = 1
Id                 = 1811
Value              = -130
Absolute           = 1
IgnoreHitPause     = 1
Persistent         = 0

;---------------------[攻撃]
[State hitfire233]
Type = Explod
Trigger1 = MoveHIT = 1
Anim = IfElse(MoveHit, 13006, 13008)
PosType = P2
Pos = 20,-45
Id  = 7000
OnTop = 1
OwnPal = 0
Scale = .45,.45
IgnoreHitPause = 1
Persistent = 0


[State ChangeState]
Type               = ChangeState
Trigger1           = MoveContact
Value              = 1016
IgnoreHitPause     = 1

[State DestroySelf]
Type               = DestroySelf
Trigger1           = FrontEdgeBodyDist <= -5
Trigger2           = MoveContact
IgnoreHitPause     = 1
;----------------------------------------------------------------------------
;(HELPER)弾
[Statedef 1015]
type = A
ctrl = 0
anim = 13029
velset = 0,0
physics = N
sprpriority = 5

[State 30000]
type = Explod
trigger1 = time = 0
anim = 13020
postype = p1
scale = 0.25,0.25
under = 1
pausemovetime = 999
supermovetime = 999

;---------------------[エフェクト]
[State a];
type = removeexplod
trigger1 = time = 0
id = 1010

[State 0, SprPriority]
type = SprPriority
trigger1 = 1
value = 5
ignorehitpause = 1

[State explod];エフェクト
type = Explod
trigger1 = time = 0
anim = 13029
id = 1010
sprpriority = 10
postype = p1
pos = 0,0
bindtime = 1
ignorehitpause = 1
under = 0
ownpal = 1

;---------------------[当身関係]
[state a]
type = nothitby
trigger1 = 1
value = SCA
time = -1

;---------------------[拡大縮小]

;---------------------[]
[State 200, 7]
type = destroyself
trigger1 = time = 1

;----------------------------------------------------------------------------
;(HELPER)弾
[Statedef 1016]
type = A
ctrl = 0
anim = 13029
velset = 0,0
movetype = I
physics = N
sprpriority = 5

[State 30000]
type = Explod
trigger1 = time = 0
anim = 13020
postype = p1
scale = 0.25,0.25
under = 1
pausemovetime = 999
supermovetime = 999

;---------------------[エフェクト]
[State 1000, EnvSHAKE]
type = ENvShake
trigger1 = TIME = 0
Time      =  18
Ampl      = -14

[State 1000, EnvColor]
type = EnvColor
trigger1 = TIME  = 0
time = 3
value = 255,255,255
under = 1
ignorehitpause = 1

[State 200]
type = PlaySnd
trigger1 = time = 0
value = s3500,12

[State 200]
type = PlaySnd
trigger1 = time = 0
value = s3500,13

[State 200]
type = PlaySnd
trigger1 = time = 0
value = s3600,18

[State 200]
type = PlaySnd
trigger1 = time = 0
value = s3600,19

[State 1000]
type = PlaySnd
trigger1 = time = 0
value = s12,8

[State a];
type = removeexplod
trigger1 = time = 0
id = 1010

[State 0, SprPriority]
type = SprPriority
trigger1 = 1
value = 5
ignorehitpause = 1

[State explod];エフェクト
type = Explod
trigger1 = time = 0
anim = 13029
id = 1010
sprpriority = 10
postype = p1
pos = 0,0
bindtime = 1
ignorehitpause = 1
under = 0
ownpal = 1

[State explod];エフェクト
type = Explod
trigger1 = time = 0
anim = 13040
scale = .38,.38
id = 1010
sprpriority = 10
postype = p1
pos = 0,0
bindtime = 1
ignorehitpause = 1
under = 0
ownpal = 1

;---------------------[当身関係]
[state a]
type = nothitby
trigger1 = 1
value = SCA
time = -1

;---------------------[拡大縮小]

;---------------------[]
[State 200, 7]
type = destroyself
trigger1 = time = 1

[Statedef 8050]
type     = S
movetype = A
physics  = S
juggle   = 0
velset   = 0,0
anim     = 13048
ctrl     = 0
sprpriority = -1

[State TarGetLifeAdd]
Type               = TarGetLifeAdd
Trigger1           = movehit && NumTarGet(8050)
Id                 = 8050
Value              = -Ceil(TarGet,LifeMax * 0.01*root,fvar(13))
Absolute           = 1
IgnoreHitPause     = 1
Persistent         = 0

[State -2,]
type = Explod
trigger1 = time = 10
trigger1 = movehit
anim = 13003
pos = 10*0.5,-164*0.5+(random%75)
sprpriority = 20
postype = p2
bindtime = 1
supermove = 999
pausemove = 999
ignorehitpause = 1
persistent = 0
under = 0
ontop = 1
ownpal = 1
SCALE = 1.3,1.3

[State -2,]
type = Explod
trigger1 = time = 10
trigger1 = moveguarded
anim = 13022
pos = 10*0.5,-164*0.5+(random%75)
sprpriority = 20
postype = p2
bindtime = 1
supermove = 999
pausemove = 999
ignorehitpause = 1
persistent = 0
under = 0
ontop = 1
ownpal = 1
SCALE = 1.3,1.3

[State -2,]
type = Explod
trigger1 = time = 20
trigger1 = movehit
anim = 13003
pos = 10*0.5,-164*0.5+(random%75)
sprpriority = 20
postype = p2
bindtime = 1
supermove = 999
pausemove = 999
ignorehitpause = 1
persistent = 0
under = 0
ontop = 1
ownpal = 1
SCALE = 1.3,1.3

[State -2,]
type = Explod
trigger1 = time = 20
trigger1 = moveguarded
anim = 13022
pos = 10*0.5,-164*0.5+(random%75)
sprpriority = 20
postype = p2
bindtime = 1
supermove = 999
pausemove = 999
ignorehitpause = 1
persistent = 0
under = 0
ontop = 1
ownpal = 1
SCALE = 1.3,1.3

[State -2,]
type = Explod
trigger1 = time = 30
trigger1 = movehit
anim = 13003
pos = 10*0.5,-164*0.5+(random%75)
sprpriority = 20
postype = p2
bindtime = 1
supermove = 999
pausemove = 999
ignorehitpause = 1
persistent = 0
under = 0
ontop = 1
ownpal = 1
SCALE = 1.3,1.3

;?道打?火花
[State -2,]
type = Explod
trigger1 = time = 30
trigger1 = moveguarded
anim = 13022
pos = 10*0.5,-164*0.5+(random%75)
sprpriority = 20
postype = p2
bindtime = 1
supermove = 999
pausemove = 999
ignorehitpause = 1
persistent = 0
under = 0
ontop = 1
ownpal = 1
SCALE = 1.3,1.3

[State -2,]
type = Explod
trigger1 = time = 40
trigger1 = movehit
anim = 13003
pos = 10*0.5,-164*0.5+(random%75)
sprpriority = 20
postype = p2
bindtime = 1
supermove = 999
pausemove = 999
ignorehitpause = 1
persistent = 0
under = 0
ontop = 1
ownpal = 1
SCALE = 1.3,1.3

;?道打?火花
[State -2,]
type = Explod
trigger1 = time = 40
trigger1 = moveguarded
anim = 13022
pos = 10*0.5,-164*0.5+(random%75)
sprpriority = 20
postype = p2
bindtime = 1
supermove = 999
pausemove = 999
ignorehitpause = 1
persistent = 0
under = 0
ontop = 1
ownpal = 1
SCALE = 1.3,1.3

[State -2,]
type = Explod
trigger1 = time = 50
trigger1 = movehit
anim = 13003
pos = 10*0.5,-164*0.5+(random%75)
sprpriority = 20
postype = p2
bindtime = 1
supermove = 999
pausemove = 999
ignorehitpause = 1
persistent = 0
under = 0
ontop = 1
ownpal = 1
SCALE = 1.3,1.3

;?道打?火花
[State -2,]
type = Explod
trigger1 = time = 50
trigger1 = moveguarded
anim = 13022
pos = 10*0.5,-164*0.5+(random%75)
sprpriority = 20
postype = p2
bindtime = 1
supermove = 999
pausemove = 999
ignorehitpause = 1
persistent = 0
under = 0
ontop = 1
ownpal = 1
SCALE = 1.3,1.3

[State -2,]
type = Explod
trigger1 = time = 60
trigger1 = movehit
anim = 13003
pos = 10*0.5,-164*0.5+(random%75)
sprpriority = 20
postype = p2
bindtime = 1
supermove = 999
pausemove = 999
ignorehitpause = 1
persistent = 0
under = 0
ontop = 1
ownpal = 1
SCALE = 1.3,1.3

;?道打?火花
[State -2,]
type = Explod
trigger1 = time = 60
trigger1 = moveguarded
anim = 13022
pos = 10*0.5,-164*0.5+(random%75)
sprpriority = 20
postype = p2
bindtime = 1
supermove = 999
pausemove = 999
ignorehitpause = 1
persistent = 0
under = 0
ontop = 1
ownpal = 1
SCALE = 1.3,1.3

[State -2,]
type = Explod
trigger1 = time = 70
trigger1 = movehit
anim = 13003
pos = 10*0.5,-164*0.5+(random%75)
sprpriority = 20
postype = p2
bindtime = 1
supermove = 999
pausemove = 999
ignorehitpause = 1
persistent = 0
under = 0
ontop = 1
ownpal = 1
SCALE = 1.3,1.3

;?道打?火花
[State -2,]
type = Explod
trigger1 = time = 70
trigger1 = moveguarded
anim = 13022
pos = 10*0.5,-164*0.5+(random%75)
sprpriority = 20
postype = p2
bindtime = 1
supermove = 999
pausemove = 999
ignorehitpause = 1
persistent = 0
under = 0
ontop = 1
ownpal = 1
SCALE = 1.3,1.3

[State -2,]
type = Explod
trigger1 = time = 80
trigger1 = movehit
anim = 13003
pos = 10*0.5,-164*0.5+(random%75)
sprpriority = 20
postype = p2
bindtime = 1
supermove = 999
pausemove = 999
ignorehitpause = 1
persistent = 0
under = 0
ontop = 1
ownpal = 1
SCALE = 1.3,1.3

;?道打?火花
[State -2,]
type = Explod
trigger1 = time = 80
trigger1 = moveguarded
anim = 13022
pos = 10*0.5,-164*0.5+(random%75)
sprpriority = 20
postype = p2
bindtime = 1
supermove = 999
pausemove = 999
ignorehitpause = 1
persistent = 0
under = 0
ontop = 1
ownpal = 1
SCALE = 1.3,1.3

[State -2,]
type = Explod
trigger1 = time = 90
trigger1 = movehit
anim = 13003
pos = 10*0.5,-164*0.5+(random%75)
sprpriority = 20
postype = p2
bindtime = 1
supermove = 999
pausemove = 999
ignorehitpause = 1
persistent = 0
under = 0
ontop = 1
ownpal = 1
SCALE = 1.3,1.3

;?道打?火花
[State -2,]
type = Explod
trigger1 = time = 90
trigger1 = moveguarded
anim = 13022
pos = 10*0.5,-164*0.5+(random%75)
sprpriority = 20
postype = p2
bindtime = 1
supermove = 999
pausemove = 999
ignorehitpause = 1
persistent = 0
under = 0
ontop = 1
ownpal = 1
SCALE = 1.3,1.3

[State 200]
type = HitDef
trigger1 = gametime%7 = 1
attr = S, SA
damage = 0, 10
animtype = Hard
guardflag = MA
hitflag = MAFDP
priority = 3, Hit
pausetime = 0, 0
sparkno = s13003 
guard.sparkno = s13022
sparkxy = 20,-45
hitsound = s1,3
guardsound = s2,0
ground.type = High
ground.slidetime = 18
ground.hittime  = 20
air.type = High
air.velocity = -2.5,-3
air.hittime = 12
id = 8050
p2stateno = 177200
P2SPRPRIORITY = 1

[State de]
type = destroySelf
trigger1 = animtime = 0

;---------------------------------------------------------------------------
;相手動作
[Statedef 177200]
movetype= H
velset = 0,0
ctrl = 0

[State 177200]
type = Posset
Trigger1 = Time = 0
Y = 0

[State 2120]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 0, HitFallSet]
type = HitFallSet
trigger1 = Time = 0
value = 0

[State 700,]
type = Palfx
trigger1 = time = 0
trigger2 = time = 10
trigger3 = time = 20
trigger4 = time = 30
trigger5 = time = 40
trigger6 = time = 50
trigger7 = time = 60
trigger8 = time = 70
trigger9 = time = 80
trigger10 = time = 90
trigger11 = time = 100
trigger12 = time = 110
trigger13 = time = 120
trigger14 = time = 130
trigger15 = time = 140
trigger16 = time = 150
trigger17 = time = 160
trigger18 = time = 170
trigger19 = time = 180
trigger20 = time = 190
time = 10
add = 30,-40,-140
sinadd = 60,60,50,10
color = 0
invertall = 1

[State 52, 1]
type = VelSet
trigger1 = time >= 0
x = 0
y = 0

[State 6000, 3]
type = StateTypeSet
trigger1 = Pos Y = 0
statetype = S

[State 6000, 3]
type = StateTypeSet
trigger1 = Pos Y != 0
trigger2 = AnimTime = 0
statetype = A

[State 1830]
type = ChangeAnim2
Trigger1 = Time = 0
value = 2635

[State 1830]
type = CHANGEState
trigger1 = Animtime = 0
value = 177201

;---------------------------------------------------------------------------
;吹っ飛び
[Statedef 177201]
type = A
movetype= H
physics  = N
ctrl = 0

[State 2120]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 170, 無敵]
type = NotHitBy
trigger1 = 1
value = SCA

[State 52, 1]
type = VelSet
trigger1 = time = 0
x = -4
y = -6

[State 52, 1]
type = Veladd
trigger1 = time >= 0
y = .4

[State 1830]
type = ChangeAnim2
Trigger1 = Time = 0
value = 5050

[State 1830]
type = SelfState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 5100

;---------------------------------------------------------------------------

[StateDef 8000]
Type               = U
PhysIcs            = U
MoveType           = U
Anim               = 1
Ctrl               = 0
Sprpriority        = 0
VelSet             = 0,0

[State VarSet]
Type               = VarSet
Trigger1           = Time = 0
V                  = 0
Value              = 0

[State VarAdd]
Type               = VarAdd
Trigger1           = Time = (20,52]
V                  = 0
Value              = 8

[State BgPalFx]
Type               = BGPalFx
Trigger1           = 1
Time               = 2
Mul                = 255,255,255
Color              = Var(0)

[State DestroySelf]
Type               = DestroySelf
Trigger1           = Var(0) >= 256


[StateDef 8010]
Type               = U
PhysIcs            = U
MoveType           = U
Anim               = 1
Ctrl               = 0
Sprpriority        = 0
VelSet             = 0,0

[State VarSet]
Type               = VarSet
Trigger1           = Time = 0
V                  = 0
Value              = 0

[State VarAdd]
Type               = VarAdd
Trigger1           = Time = (20,52]
V                  = 0
Value              = 8

[State BgPalFx]
Type               = BGPalFx
Trigger1           = 1
Time               = 2
Mul                = Var(0),Var(0),Var(0)
Color              = Var(0)

[State DestroySelf]
Type               = DestroySelf
Trigger1           = Var(0) >= 256

[StateDef 8010]
Type               = U
PhysIcs            = U
MoveType           = U
Anim               = 1
Ctrl               = 0
Sprpriority        = 0
VelSet             = 0,0

[State VarSet]
Type               = VarSet
Trigger1           = Time = 0
V                  = 0
Value              = 0

[State VarAdd]
Type               = VarAdd
Trigger1           = Time = (20,52]
V                  = 0
Value              = 8

[State BgPalFx]
Type               = BGPalFx
Trigger1           = 1
Time               = 2
Mul                = Var(0),Var(0),Var(0)
Color              = Var(0)

[State DestroySelf]
Type               = DestroySelf
Trigger1           = Var(0) >= 256

[StateDef 7000]
Type               = U
PhysIcs            = U
MoveType           = U
Anim               = 1
Ctrl               = 0
Sprpriority        = 0
VelSet             = 0,0

[State PosSet]
Type               = PosSet
Trigger1           = 1
X                  = EnemyNear(Root,Var(58)),Pos X
Y                  = EnemyNear(Root,Var(58)),Pos Y

[State Sprpriority Random]
Type               = VarRandom
Trigger1           = Time = [0,20]
V                  = 0 
Range              = -10,10

[State Sprpriority Random]
Type               = VarRandom
Trigger1           = Time = [0,20]
V                  = 1 
Range              = -4,3

[State Sprpriority Random]
Type               = VarRandom
Trigger1           = Time = [0,20]
V                  = 2
Range              = -8,0

[State Explod]
Type               = Explod
Trigger1           = Time = [0,20]
Anim               = 13017
Id                 = 7200
PosType            = P1
Pos                = 0,-50
RanDom             = 55,70
Sprpriority        = Var(0)
ontop              = 1
OwnPal             = 1
Scale              = .4,.4
IgnoreHitPause     = 1
Persistent         = 5

[State Helper]
Type               = Helper 
Trigger1           = RanDom % 2 = 0
Trigger1           = Time = [0,20]
Name               = "Skill_Fire1" 
ID                 = 7000
Pos                = (Var(1) * 10),(Var(2) * 10)
PosType            = P2 
StateNo            = 7005
OwnPal             = 1 
IgNoreHitPause     = 1 
Persistent         = 10

[State Helper]
Type               = Helper 
Trigger1           = Random % 2 = 1
Trigger1           = Time = [0,20]
Name               = "Skill_Fire2" 
ID                 = 7000
Pos                = (Var(1) * 10),(Var(2) * 10)
PosType            = P2 
StateNo            = 7010
OwnPal             = 1 
IgnoreHitPause     = 1
Persistent         = 10

[State DestroySelf]
Type               = DestroySelf
Trigger1           = Time >= 20

[StateDef 7005]
Type               = U
PhysIcs            = U
MoveType           = U
Anim               = 1
Ctrl               = 0
Sprpriority        = 0
VelSet             = 0,0  

[State Sprpriority Random]
Type               = VarRandom
Trigger1           = Time = 0
V                  = 0 
Range              = -5,5 

[State Explod]
Type               = Explod
Trigger1           = Time = 0
Anim               = 13018
Id                 = 7200
PosType            = P1
Pos                = 0,0
Sprpriority        = Var(0) + 1
OwnPal             = 1
ontop              = 1
vel                = 2,-1
Scale              = .3,.3
IgnoreHitPause     = 1
Persistent         = 8

[State DestroySelf]
Type               = DestroySelf
Trigger1           = Time = 0 

[StateDef 7010]
Type               = U
PhysIcs            = U
MoveType           = U
Anim               = 1
Ctrl               = 0
Sprpriority        = 0
VelSet             = 0,0  

[State Sprpriority Random]
Type               = VarRandom
Trigger1           = Time = 0
V                  = 0 
Range              = -5,5 

[State Explod]
Type               = Explod
Trigger1           = Time = 0
Anim               = 13019
Id                 = 7200
PosType            = P1
Pos                = 0,0
Sprpriority        = Var(0) + 1
OwnPal             = 1
ontop              = 1
Scale              = .35,.35
IgnoreHitPause     = 1
Persistent         = 8

[State DestroySelf]
Type               = DestroySelf
Trigger1           = Time = 0 

  

;---------------------------------------------------------------------------
[StateDef 7020]
Type               = U
PhysIcs            = U
MoveType           = U
Anim               = 1
Ctrl               = 0
Sprpriority        = 0
VelSet             = 0,0

[State PosSet]
Type               = PosSet
Trigger1           = 1
X                  = EnemyNear(Root,Var(58)),Pos X
Y                  = EnemyNear(Root,Var(58)),Pos Y

[State Sprpriority Random]
Type               = VarRandom
Trigger1           = Time = [0,20]
V                  = 0 
Range              = -10,10

[State Sprpriority Random]
Type               = VarRandom
Trigger1           = Time = [0,20]
V                  = 1 
Range              = -4,3

[State Sprpriority Random]
Type               = VarRandom
Trigger1           = Time = [0,20]
V                  = 2
Range              = -8,0

[State Explod]
Type               = Explod
Trigger1           = Time = [0,20]
Anim               = 13017
Id                 = 7200
PosType            = P1
Pos                = 0,-50
RanDom             = 55,70
Sprpriority        = Var(0)
ontop              = 1
OwnPal             = 1
Scale              = .4,.4
IgnoreHitPause     = 1
Persistent         = 5

[State Helper]
Type               = Helper 
Trigger1           = RanDom % 4 = 0
Trigger1           = Time = [0,20]
Name               = "Skill_Fire3" 
ID                 = 7000
Pos                = (Var(1) * 10),(Var(2) * 10)
PosType            = P2 
StateNo            = 7025
OwnPal             = 1 
IgNoreHitPause     = 1 
Persistent         = 10

[State Helper]
Type               = Helper 
Trigger1           = RanDom % 4 = 1
Trigger1           = Time = [0,20]
Name               = "Skill_Fire4" 
ID                 = 7000
Pos                = (Var(1) * 10),(Var(2) * 10)
PosType            = P2 
StateNo            = 7030
OwnPal             = 1 
IgnoreHitPause     = 1
Persistent         = 10

[State DestroySelf]
Type               = DestroySelf
Trigger1           = Time >= 20

[StateDef 7025]
Type               = U
PhysIcs            = U
MoveType           = U
Anim               = 1
Ctrl               = 0
Sprpriority        = 0
VelSet             = 0,0  

[State Sprpriority Random]
Type               = VarRandom
Trigger1           = Time = 0
V                  = 0 
Range              = -5,5 

[State Explod]
Type               = Explod
Trigger1           = Time = 0
Anim               = 13018
Id                 = 7200
PosType            = P1
Pos                = 0,0
Sprpriority        = Var(0) + 1
OwnPal             = 1
ontop              = 1
vel                = 2,-1
Scale              = .3,.3
IgnoreHitPause     = 1
Persistent         = 8


[State DestroySelf]
Type               = DestroySelf
Trigger1           = Time = 0  


[StateDef 7030]
Type               = U
PhysIcs            = U
MoveType           = U
Anim               = 1
Ctrl               = 0
Sprpriority        = 0
VelSet             = 0,0  

[State Sprpriority Random]
Type               = VarRandom
Trigger1           = Time = 0
V                  = 0 
Range              = -5,5 

[State Explod]
Type               = Explod
Trigger1           = Time = 0
Anim               = 13019
Id                 = 7200
PosType            = P1
Pos                = 0,0
Sprpriority        = Var(0) + 1
OwnPal             = 1
ontop              = 1
Scale              = .35,.35
IgnoreHitPause     = 1
Persistent         = 8

[State DestroySelf]
Type               = DestroySelf
Trigger1           = Time = 0  

;HdBar
[Statedef 7550]
type = A
ctrl = 0
anim = 9999
velset = 0,0
movetype = I
physics = N
sprpriority = 10

;---------------------[]
[state a]
type = varset
trigger1 = time = 0
v = 1
value = 0

[state a]
type = changestate
triggerall = root,movetype != H
trigger1 = root,var(20) = 900
value = 7551

;HdBar
[Statedef 7551]
type = A
ctrl = 0
anim = 9999
velset = 0,0
movetype = I
physics = N
sprpriority = 10

[state -2,a]
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = 1
trigger1 = numexplod(7539) = 0
anim = 2
id = 7539
postype = back
bindtime = -1
pos = 49.5,221-ifelse(gameheight/gamewidth>=.74,0,10)
sprpriority = 996
removetime = -1
ownpal = 1
;ontop = 1

[state -2,a]
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = -1
trigger1 = numexplod(7539) = 0
anim = 2
id = 7539
postype = back
bindtime = -1
pos = 92.5,221-ifelse(gameheight/gamewidth>=.74,0,10)
sprpriority = 996
removetime = -1
ownpal = 1
facing = -1
;ontop = 1


[state -2,a]
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = 1
trigger1 = numexplod(7530) = 0
anim = 7530
id = 7530
postype = back
bindtime = -1
pos = 56,221-ifelse(gameheight/gamewidth>=.74,0,10)
sprpriority = 996
removetime = -1
ownpal = 1
;ontop = 1

[state -2,a]
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = -1
trigger1 = numexplod(7530) = 0
anim = 7530
id = 7530
postype = back
bindtime = -1
pos = 86,221-ifelse(gameheight/gamewidth>=.74,0,10)
sprpriority = 996
removetime = -1
ownpal = 1
facing = -1
;ontop = 1

[state a]
type = removeexplod
trigger1 = RoundState > 2
id = 7530

;---------------------[]
[state a]
type = varset
trigger1 = time = 0
v = 1
value = 0

[state a]
type = varadd
trigger1 = time <= 4
v = 1
value = 20

[state a]
type = varset
trigger1 = time = 5
v = 1
value = 100

[state a]
type = varadd
trigger1 = time >= 27
v = 1
value = -20

[state a]
type = varset
trigger1 = time = 32
v = 1
value = 100

;---------------------[]
[state a]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = invisible

[state -2,a]
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = 1
trigger1 = time >= 0
anim = 7532
id = 7532
postype = left
bindtime = -1
pos = 56,221-ifelse(gameheight/gamewidth>=.74,0,10)
sprpriority = 997
removetime = 1
ownpal = 1
;ontop = 1

[state -2,a]
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = -1
trigger1 = time >= 0
anim = 7532
id = 7532
postype = right
bindtime = 1
pos = -86,221-ifelse(gameheight/gamewidth>=.74,0,10)
sprpriority = 997
removetime = 1
ownpal = 1
facing = 1
;ontop = 1

[state a]
type = ModifyExplod
trigger1 = 1
ID = 7532
scale = root,var(20) * 0.001112,1

[state a]
type = removeexplod
trigger1 = RoundState > 2
id = 7532

;---------------------[]
[state a]
type = removeexplod
trigger1 = root,var(20) = 0
id = 7530

[state a]
type = removeexplod
trigger1 = root,var(20) = 0
id = 7532

[state a]
type = removeexplod
trigger1 = root,var(20) = 0
id = 7539

[state a]
type = changestate
trigger1 = root,var(20) = 0
value = 7550

;------------------------------------------------------------------------------
;HdBar
[Statedef 7552]
type = A
ctrl = 0
anim = 9999
velset = 0,0
movetype = I
physics = N
sprpriority = 10

;---------------------[]
[state a]
type = varset
trigger1 = time = 0
fv = 1
value = 0

[state a]
type = changestate
triggerall = root,movetype != H
trigger1 = root,fvar(20) = 0
value = 7553

;HdBar
[Statedef 7553]
type = A
ctrl = 0
anim = 9999
velset = 0,0
movetype = I
physics = N
sprpriority = 10

[state -2,a]
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = 1
trigger1 = numexplod(7540) = 0
anim = 7531
id = 7540
postype = back
bindtime = -1
pos = 56,210.5-ifelse(gameheight/gamewidth>=.74,0,10)
sprpriority = 996
removetime = -1
ownpal = 1
;ontop = 1

[state -2,a]
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = -1
trigger1 = numexplod(7540) = 0
anim = 7531
id = 7540
postype = back
bindtime = -1
pos = 86,210.5-ifelse(gameheight/gamewidth>=.74,0,10)
sprpriority = 996
removetime = -1
ownpal = 1
facing = -1
;ontop = 1

[state a]
type = removeexplod
trigger1 = RoundState > 2
id = 7540

;---------------------[]
[state a]
type = varset
trigger1 = time = 0
fv = 1
value = 0

[state a]
type = varadd
trigger1 = time <= 4
fv = 1
value = 20

[state a]
type = varset
trigger1 = time = 5
fv = 1
value = 100

[state a]
type = varadd
trigger1 = time >= 27
fv = 1
value = -20

[state a]
type = varset
trigger1 = time = 32
fv = 1
value = 100

;---------------------[]
[state a]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = invisible

[state -2,a]
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = 1
trigger1 = time >= 0
anim = 7533
id = 7542
postype = left
bindtime = -1
pos = 56,210.5-ifelse(gameheight/gamewidth>=.74,0,10)
sprpriority = 997
removetime = 1
ownpal = 1
;ontop = 1

[state -2,a]
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = -1
trigger1 = time >= 0
anim = 7533
id = 7542
postype = right
bindtime = 1
pos = -86,210.5-ifelse(gameheight/gamewidth>=.74,0,10)
sprpriority = 997
removetime = 1
ownpal = 1
facing = 1
;ontop = 1

[state a]
type = ModifyExplod
trigger1 = 1
ID = 7542
scale = root,fvar(20) * 0.001112,1

[state a]
type = removeexplod
trigger1 = RoundState > 2
id = 7542

;---------------------[]
[state a]
type = removeexplod
trigger1 = root,fvar(20) = 900
id = 7540

[state a]
type = removeexplod
trigger1 = root,fvar(20) = 900
id = 7542

[state a]
type = changestate
trigger1 = root,fvar(20) = 900
value = 7552

;------------------------------------------------------------------------------
[Statedef 42000]
Type = S
MoveType = I
Physics = N
Anim = 9999
VelSet = 0,0
Ctrl = 0

[State 40000, BindToRoot]
type = BindToRoot
trigger1 = 1
pos = 0,0

[State 40000, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 40000, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 40000, SelfState]
type = SelfState
trigger1 = !ishelper
value = 0

[State 40000, AssertSpecial]
type = AssertSpecial
Trigger1 = 1
flag = NoShadow
flag2 = invisible

[State 40000, Turn]
type = Turn
trigger1 = Facing*ifelse((EnemyNear,Pos X-Pos X)>=0,1,-1) < 0
IgnoreHitPause = 1

[State 40000, VarSet]
type = VarSet
triggerall = parent,stateno = 2700
trigger1 = time = [0,15]
fv = 1
value = 1+0.25*sin(2*pi*0.0125*time)/camerazoom

[State 40000, VarSet]
type = VarSet
triggerall = parent,stateno = 2700
trigger1 = time = [20,35]
fv = 1
value = 1+0.25/camerazoom-0.3*sin(2*pi*0.0125*(time-20))/camerazoom
ignorehitpause = 1

[State 40000, Zoom]
type = Zoom
Trigger1 = fvar(1)
scale = fvar(1)
pos = pos x,pos y
ignorehitpause = 1

[State 40000, DestroySelf]
type = DestroySelf
trigger1 = parent,stateno!= 2700
trigger2 = parent,movetype = H
ignorehitpause = 1


[Statedef 42001]
Type = S
MoveType = I
Physics = N
Anim = 9999
VelSet = 0,0
Ctrl = 0

[State 40000, BindToRoot]
type = BindToRoot
trigger1 = 1
pos = 0,0

[State 40000, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 40000, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 40000, SelfState]
type = SelfState
trigger1 = !ishelper
value = 0

[State 40000, AssertSpecial]
type = AssertSpecial
Trigger1 = 1
flag = NoShadow
flag2 = invisible

[State 40000, Turn]
type = Turn
trigger1 = Facing*ifelse((EnemyNear,Pos X-Pos X)>=0,1,-1) < 0
IgnoreHitPause = 1

[State 40000, VarSet]
type = VarSet
triggerall = parent,stateno = 2710
trigger1 = time = [0,15]
fv = 1
value = 1+0.5*sin(2*pi*0.0125*time)/camerazoom

[State 40000, VarSet]
type = VarSet
triggerall = parent,stateno = 2710
trigger1 = time = [65,80]
fv = 1
value = 1+0.5/camerazoom-0.3*sin(2*pi*0.0125*(time-65))/camerazoom
ignorehitpause = 1

[State 40000, Zoom]
type = Zoom
Trigger1 = fvar(1)
scale = fvar(1)
pos = pos x,pos y
ignorehitpause = 1

[State 40000, DestroySelf]
type = DestroySelf
trigger1 = parent,stateno= 2710 && time = 81
trigger2 = parent,movetype = H
trigger3 = parent,stateno!= 2710
ignorehitpause = 1

[Statedef 42002]
Type = S
MoveType = I
Physics = N
Anim = 9999
VelSet = 0,0
Ctrl = 0

[State 40000, BindToRoot]
type = BindToRoot
trigger1 = 1
pos = 0,0

[State 40000, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 40000, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 40000, SelfState]
type = SelfState
trigger1 = !ishelper
value = 0

[State 40000, AssertSpecial]
type = AssertSpecial
Trigger1 = 1
flag = NoShadow
flag2 = invisible

[State 40000, Turn]
type = Turn
trigger1 = Facing*ifelse((EnemyNear,Pos X-Pos X)>=0,1,-1) < 0
IgnoreHitPause = 1

[State 40000, VarSet]
type = VarSet
triggerall = parent,stateno = 2300
trigger1 = time = [0,15]
fv = 1
value = 1+0.25*sin(2*pi*0.0125*time)/camerazoom

[State 40000, VarSet]
type = VarSet
triggerall = parent,stateno = 2300
trigger1 = time = [20,35]
fv = 1
value = 1+0.25/camerazoom-0.3*sin(2*pi*0.0125*(time-20))/camerazoom
ignorehitpause = 1

[State 40000, Zoom]
type = Zoom
Trigger1 = fvar(1)
scale = fvar(1)
pos = pos x,pos y
ignorehitpause = 1

[State 40000, DestroySelf]
type = DestroySelf
trigger1 = parent,stateno!= 2300
trigger2 = parent,movetype = H
ignorehitpause = 1


[Statedef 42003]
Type = S
MoveType = I
Physics = N
Anim = 9999
VelSet = 0,0
Ctrl = 0

[State 40000, BindToRoot]
type = BindToRoot
trigger1 = 1
pos = 0,0

[State 40000, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 40000, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 40000, SelfState]
type = SelfState
trigger1 = !ishelper
value = 0

[State 40000, AssertSpecial]
type = AssertSpecial
Trigger1 = 1
flag = NoShadow
flag2 = invisible

[State 40000, Turn]
type = Turn
trigger1 = Facing*ifelse((EnemyNear,Pos X-Pos X)>=0,1,-1) < 0
IgnoreHitPause = 1

[State 40000, VarSet]
type = VarSet
triggerall = parent,stateno = 2100
trigger1 = time = [0,15]
fv = 1
value = 1+0.25*sin(2*pi*0.0125*time)/camerazoom

[State 40000, VarSet]
type = VarSet
triggerall = parent,stateno = 2100
trigger1 = time = [20,35]
fv = 1
value = 1+0.25/camerazoom-0.3*sin(2*pi*0.0125*(time-20))/camerazoom
ignorehitpause = 1

[State 40000, Zoom]
type = Zoom
Trigger1 = fvar(1)
scale = fvar(1)
pos = pos x,pos y
ignorehitpause = 1

[State 40000, DestroySelf]
type = DestroySelf
trigger1 = parent,stateno!= 2100
trigger2 = parent,movetype = H
ignorehitpause = 1


[Statedef 42004]
Type = S
MoveType = I
Physics = N
Anim = 9999
VelSet = 0,0
Ctrl = 0

[State 40000, BindToRoot]
type = BindToRoot
trigger1 = 1
pos = 0,0

[State 40000, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 40000, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 40000, SelfState]
type = SelfState
trigger1 = !ishelper
value = 0

[State 40000, AssertSpecial]
type = AssertSpecial
Trigger1 = 1
flag = NoShadow
flag2 = invisible

[State 40000, Turn]
type = Turn
trigger1 = Facing*ifelse((EnemyNear,Pos X-Pos X)>=0,1,-1) < 0
IgnoreHitPause = 1

[State 40000, VarSet]
type = VarSet
triggerall = parent,stateno = 2150
trigger1 = time = [0,15]
fv = 1
value = 1+0.25*sin(2*pi*0.0125*time)/camerazoom

[State 40000, VarSet]
type = VarSet
triggerall = parent,stateno = 2150
trigger1 = time = [20,35]
fv = 1
value = 1+0.25/camerazoom-0.3*sin(2*pi*0.0125*(time-20))/camerazoom
ignorehitpause = 1

[State 40000, Zoom]
type = Zoom
Trigger1 = fvar(1)
scale = fvar(1)
pos = pos x,pos y
ignorehitpause = 1

[State 40000, DestroySelf]
type = DestroySelf
trigger1 = parent,stateno!= 2150
trigger2 = parent,movetype = H
ignorehitpause = 1

[Statedef 42005]
Type = S
MoveType = I
Physics = N
Anim = 9999
VelSet = 0,0
Ctrl = 0

[State 40000, BindToRoot]
type = BindToRoot
trigger1 = 1
pos = 0,0

[State 40000, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 40000, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 40000, SelfState]
type = SelfState
trigger1 = !ishelper
value = 0

[State 40000, AssertSpecial]
type = AssertSpecial
Trigger1 = 1
flag = NoShadow
flag2 = invisible

[State 40000, Turn]
type = Turn
trigger1 = Facing*ifelse((EnemyNear,Pos X-Pos X)>=0,1,-1) < 0
IgnoreHitPause = 1

[State 40000, VarSet]
type = VarSet
triggerall = parent,stateno = 3100
trigger1 = time = [0,15]
fv = 1
value = 1+0.25*sin(2*pi*0.0125*time)/camerazoom

[State 40000, VarSet]
type = VarSet
triggerall = parent,stateno = 3100
trigger1 = time = [20,35]
fv = 1
value = 1+0.25/camerazoom-0.3*sin(2*pi*0.0125*(time-20))/camerazoom
ignorehitpause = 1

[State 40000, Zoom]
type = Zoom
Trigger1 = fvar(1)
scale = fvar(1)
pos = pos x,pos y
ignorehitpause = 1

[State 40000, DestroySelf]
type = DestroySelf
trigger1 = parent,stateno!= 3100
trigger2 = parent,movetype = H
ignorehitpause = 1


[Statedef 42006]
Type = S
MoveType = I
Physics = N
Anim = 9999
VelSet = 0,0
Ctrl = 0

[State 40000, BindToRoot]
type = BindToRoot
trigger1 = 1
pos = 0,0

[State 40000, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 40000, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 40000, SelfState]
type = SelfState
trigger1 = !ishelper
value = 0

[State 40000, AssertSpecial]
type = AssertSpecial
Trigger1 = 1
flag = NoShadow
flag2 = invisible

[State 40000, Turn]
type = Turn
trigger1 = Facing*ifelse((EnemyNear,Pos X-Pos X)>=0,1,-1) < 0
IgnoreHitPause = 1

[State 40000, VarSet]
type = VarSet
triggerall = parent,stateno = 3110
trigger1 = time = [0,15]
fv = 1
value = 1+0.5*sin(2*pi*0.0125*time)/camerazoom

[State 40000, VarSet]
type = VarSet
triggerall = parent,stateno = 3110
trigger1 = time = [25,40]
fv = 1
value = 1+0.5/camerazoom-0.3*sin(2*pi*0.0125*(time-25))/camerazoom
ignorehitpause = 1

[State 40000, Zoom]
type = Zoom
Trigger1 = fvar(1)
scale = fvar(1)
pos = pos x,pos y
ignorehitpause = 1

[State 40000, DestroySelf]
type = DestroySelf
trigger1 = parent,stateno != 3110
trigger2 = parent,movetype = H
ignorehitpause = 1


[Statedef 42007]
Type = S
MoveType = I
Physics = N
Anim = 9999
VelSet = 0,0
Ctrl = 0

[State 40000, BindToRoot]
type = BindToRoot
trigger1 = 1
pos = 0,0

[State 40000, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 40000, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 40000, SelfState]
type = SelfState
trigger1 = !ishelper
value = 0

[State 40000, AssertSpecial]
type = AssertSpecial
Trigger1 = 1
flag = NoShadow
flag2 = invisible

[State 40000, Turn]
type = Turn
trigger1 = Facing*ifelse((EnemyNear,Pos X-Pos X)>=0,1,-1) < 0
IgnoreHitPause = 1

[State 40000, VarSet]
type = VarSet
triggerall = parent,stateno = 3560
trigger1 = time = [0,15]
fv = 1
value = 1+0.25*sin(2*pi*0.0125*time)/camerazoom

[State 40000, VarSet]
type = VarSet
triggerall = parent,stateno = 3560
trigger1 = time = [20,35]
fv = 1
value = 1+0.25/camerazoom-0.3*sin(2*pi*0.0125*(time-20))/camerazoom
ignorehitpause = 1

[State 40000, Zoom]
type = Zoom
Trigger1 = fvar(1)
scale = fvar(1)
pos = pos x,pos y
ignorehitpause = 1

[State 40000, DestroySelf]
type = DestroySelf
trigger1 = parent,stateno!= 3560
trigger2 = parent,movetype = H
ignorehitpause = 1


[Statedef 42008]
Type = S
MoveType = I
Physics = N
Anim = 9999
VelSet = 0,0
Ctrl = 0

[State 40000, BindToRoot]
type = BindToRoot
trigger1 = 1
pos = 0,0

[State 40000, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 40000, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 40000, SelfState]
type = SelfState
trigger1 = !ishelper
value = 0

[State 40000, AssertSpecial]
type = AssertSpecial
Trigger1 = 1
flag = NoShadow
flag2 = invisible

[State 40000, Turn]
type = Turn
trigger1 = Facing*ifelse((EnemyNear,Pos X-Pos X)>=0,1,-1) < 0
IgnoreHitPause = 1

[State 40000, VarSet]
type = VarSet
triggerall = parent,stateno = 902
trigger1 = time = [0,15]
fv = 1
value = 1+0.3*sin(2*pi*0.0125*time)/camerazoom

[State 40000, VarSet]
type = VarSet
triggerall = parent,stateno = 902
trigger1 = time = [60,75]
fv = 1
value = 1+0.3/camerazoom-0.3*sin(2*pi*0.0125*(time-60))/camerazoom
ignorehitpause = 1

[State 40000, Zoom]
type = Zoom
Trigger1 = fvar(1)
scale = fvar(1)
pos = pos x,pos y
ignorehitpause = 1

[State 40000, DestroySelf]
type = DestroySelf
trigger1 = parent,stateno!= 902
trigger2 = parent,movetype = H
ignorehitpause = 1
