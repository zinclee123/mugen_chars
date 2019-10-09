;---------------------------------------------------------------------------
;远轻拳
[Statedef 200]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 200
poweradd = 0
sprpriority = 1

[State 200]
type = PlaySnd
trigger1 = animelem = 2
value = 200,random%2

[State 200]
type = PlaySnd
trigger1 = animelem = 1
value = 300,0

[State 200]
type = HitDef
trigger1 = var(30) = 0
trigger1 = animelem = 3
attr = S, NA
damage = 20*fvar(39), 0
getpower = 105,105
givepower = 20,20
animtype = Light
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 11, 12
sparkno = s7000
sparkxy = -8, -78
hitsound = s400, 0
guard.sparkno = s7010
guardsound = s120, 0
ground.type = high
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -5.6
airguard.velocity = -1.9,-2
air.type = high
air.velocity = -1.4,-3
air.hittime = 12
ID = 200

[State 200]
type = HitDef
trigger1 = var(30) = 1
trigger1 = animelem = 3
attr = S, NA
damage = 20*fvar(39), 0
getpower = 105,105
givepower = 20,20
animtype = Light
guardflag = N
hitflag = MAF
priority = 4, Hit
pausetime = 11, 12
sparkno = s7000
sparkxy = -8, -78
hitsound = s420, 1
guard.sparkno = s7010
guardsound = s120, 0
ground.type = high
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -5.6
airguard.velocity = -1.9,-2
air.type = high
air.velocity = -1.4,-3
air.hittime = 12
ID = 200

[State -3,跳跃]
type = ChangeState
TriggerAll = var(59)
TriggerAll = Life >= 100
triggerall = animtime = 0
Trigger1 = EnemyNear,MoveType = H && !EnemyNear,Ctrl
Trigger1 = EnemyNear,StateNo = [120,159]
Trigger1 = EnemyNear,GetHitVar(HitTime) >= 1
Trigger1 = P2BodyDist X >= 80 
Trigger1 = var(33) := ifelse(P2BodyDist X > 110, 4, 3)
Trigger1 = var(50) := 3906011

Trigger2 = EnemyNear,MoveType = H && !EnemyNear,Ctrl
Trigger2 = EnemyNear,StateNo = [120,159]
Trigger2 = EnemyNear,GetHitVar(HitTime) >= 2
Trigger2 = EnemyNear,BackEdgeBodyDist < 10
Trigger2 = P2BodyDist X < 50
Trigger2 = var(33) := 3
Trigger2 = var(50) := 3906021

Trigger3 = FrontEdgeBodyDist < 60
Trigger3 = EnemyNear,MoveType = I && !EnemyNear,Ctrl
Trigger3 = EnemyNear,AnimTime <= -19
Trigger3 = EnemyNear,BackEdgeBodyDist < 10
Trigger3 = var(33) := 3
Trigger3 = var(50) := 3906031

value = 39


[State 200]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;远重拳
[Statedef 210]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 210
poweradd = 0
sprpriority = 1

[State 210]
type = PlaySnd
trigger1 = animelem = 4
value = 210,0

[State 210]
type = PlaySnd
trigger1 = animelem = 5
value = 300,0

[state 210]
type = posadd
trigger1 = animelem = 4
x = 30

[State 210]
type = HitDef
trigger1 = var(30) = 0
trigger1 = animelem = 7
attr = S, NA
animtype  = hard
damage    = 80*fvar(39)
priority = 5, Hit
getpower = 100,100
givepower = 20,20
guardflag = M
pausetime = 11,12
sparkno = s7006
sparkxy = -12,-69
hitsound   = s410,1
guardsound = s120,0
guard.sparkno = s7011
ground.type = low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -10.5
air.velocity = -3.2,-4
ID = 200

[State 210]
type = HitDef
trigger1 = var(30) = 1
trigger1 = animelem = 7
attr = S, NA
animtype  = hard
damage    = 80*fvar(39)
priority = 5, Hit
getpower = 100,100
givepower = 20,20
guardflag = N
pausetime = 11,120
sparkno = s7006
sparkxy = -12,-69
hitsound   = s420,1
guardsound = s120,0
guard.sparkno = s7011
ground.type = low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -10.5
air.velocity = -3.2,-4
ID = 200

[State 200, 7]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;远轻脚
[Statedef 230]
type    = S
movetype= A
physics = S
juggle  = 8
velset = 0,0
ctrl = 0
anim = 230
poweradd = 0
sprpriority = 1

[State 230];
type = PlaySnd
trigger1 = animelem = 2
value = 200,random%2

[State 230];
type = PlaySnd
trigger1 = animelem = 1
value = 300,1

[State 230]
type = HitDef
trigger1 = var(30) = 0
trigger1 = animelem = 3
attr = S, NA
animtype  = light
damage    = 25 * fvar(39)
priority = 4, Hit
getpower = 50,50
givepower = 10,10
guardflag = M
pausetime = 11,12
sparkno = s7000
sparkxy = -21,-76
hitsound   = s400,2
guard.sparkno = s7010
guardsound = s120,0
ground.type = high
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -6
air.velocity = -2.5,-3.5
ID = 200


[State 230]
type = HitDef
trigger1 = var(30) = 1
trigger1 = animelem = 3
attr = S, NA
animtype  = light
damage    = 25 * fvar(39)
priority = 4, Hit
getpower = 50,50
givepower = 10,10
guardflag = N
pausetime = 11,12
sparkno = s7000
sparkxy = -21,-76
hitsound   = s420,1
guard.sparkno = s7010
guardsound = s120,0
ground.type = high
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -6
air.velocity = -2.5,-3.5
ID = 200


[State 230]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;远重脚
[Statedef 240]
type    = S
movetype= A
physics = S
juggle  = 8
velset = 0,0
ctrl = 0
anim = 240
poweradd = 0
sprpriority = 1

[State 240];
type = PlaySnd
trigger1 = animelem = 3
value = 210,0

[State 240];
type = PlaySnd
trigger1 = animelem = 4
value = 300,1

[State 240]
type = HitDef
trigger1 = var(30) = 0
trigger1 = animelem = 6
attr = S, NA
animtype  = hard
damage    = 80*fvar(39)
priority = 5, Hit
getpower = 100,100
givepower = 20,20
guardflag = M
pausetime = 12,13
sparkno = s7001
sparkxy = -24,-104
hitsound   = s400,3
guard.sparkno = s7011
guardsound = s120,0
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -12
air.velocity = -3,-5.2
ID = 200


[State 240]
type = HitDef
trigger1 = var(30) = 1
trigger1 = animelem = 6
attr = S, NA
animtype  = hard
damage    = 80*fvar(39)
priority = 5, Hit
getpower = 100,100
givepower = 20,20
guardflag = N
pausetime = 12,13
sparkno = s7001
sparkxy = -24,-104
hitsound   = s420,1
guard.sparkno = s7011
guardsound = s120,0
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -12
air.velocity = -3,-5.2
ID = 200


[State 240]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1



;---------------------------------------------------------------------------
;近轻拳
[Statedef 205]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 205
poweradd = 0
sprpriority = 1

[State 205]
type = PlaySnd
trigger1 = animelem = 2
value = 200,random%2

[State 205]
type = PlaySnd
trigger1 = animelem = 1
value = 300,0

[State 205]
type = HitDef
trigger1 = var(30) = 0
trigger1 = animelem = 3
attr = S, NA
damage = 20*fvar(39), 0
getpower = 50,50
givepower = 10,10
animtype = Light
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 11, 12
sparkno = s7000
sparkxy = -14, -66
hitsound = s400, 0
guard.sparkno = s7010
guardsound = s120, 0
ground.type = high
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -6
airguard.velocity = -1.9,-2
air.type = high
air.velocity = -1.4,-3
air.hittime = 12
ID = 200

air.juggle = 8

[State 205]
type = HitDef
trigger1 = var(30) = 1
trigger1 = animelem = 3
attr = S, NA
damage = 20*fvar(39), 0
getpower = 50,50
givepower = 10,10
animtype = Light
guardflag = N
hitflag = MAF
priority = 4, Hit
pausetime = 11, 12
sparkno = s7000
sparkxy = -14, -66
hitsound = s420, 1
guard.sparkno = s7010
guardsound = s120, 0
ground.type = high
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -6
airguard.velocity = -1.9,-2
air.type = high
air.velocity = -1.4,-3
air.hittime = 12
ID = 205
air.juggle = 8

[State 205]
type = ChangeState
triggerall = animtime = 0
Trigger1 = EnemyNear,StateNo >= 5000 
Trigger1 = MoveHit
Trigger1 = EnemyNear,gethitvar(hittime) >= 4 || (EnemyNear,StateNo = 5700 && EnemyNear,time = 36)
Trigger1 = P2BodyDist x - ifelse(EnemyNear,BackEdgeBodyDist > 10, fvar(37) * 3, 0) - ifelse(EnemyNear,BackEdgeBodyDist < 10,Vel x * 3, 0)< 42
Trigger1 = var(50) := 041061
value = 410

[State 205]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1


;---------------------------------------------------------------------------
;近重拳
[Statedef 215]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 215
poweradd = 0
sprpriority = 1

[State 215];
type = PlaySnd
trigger1 = animelem = 2
value = 210,0

[State 215];
type = PlaySnd
trigger1 = animelem = 1
value = 300,0

[State 215]
type = HitDef
trigger1 = var(30) = 0
trigger1 = animelem = 4
attr = S, NA
animtype  = hard
damage    = 60*fvar(39)
priority = 5, Hit
getpower = 100,100
givepower = 20,20
guardflag = M
pausetime = 11,12
sparkno = s7006
sparkxy = -24,-71
hitsound   = s410,1
guardsound = s120,0
guard.sparkno = s7011
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -9
air.velocity = -2.5,-4
ID = 210


[State 215]
type = HitDef
trigger1 = var(30) = 1
trigger1 = animelem = 4
attr = S, NA
animtype  = hard
damage    = 60 * fvar(39)
priority = 5, Hit
getpower = 100,100
givepower = 20,20
guardflag = N
pausetime = 11,12
sparkno = s7006
sparkxy = -24,-71
hitsound   = s420,1
guardsound = s120,0
guard.sparkno = s7011
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -9
air.velocity = -2.5,-4
ID = 210


[State 215]
type = HitDef
trigger1 = var(30) = 0
trigger1 = animelem = 5
trigger1 = movehit
attr = S, NA
animtype  = hard
damage    = 20 * fvar(39)
priority = 5, Hit
getpower = 100,100
givepower = 20,20
guardflag = M
pausetime = 11,12
sparkno = s7006
sparkxy = -24,-79
hitsound   = s410,1
guardsound = s120,0
guard.sparkno = s7011
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -10.5
air.velocity = -2.5,-6
ID = 210
nochainID = 210

[State 215]
type = HitDef
trigger1 = var(30) = 1
trigger1 = animelem = 5
trigger1 = movehit
attr = S, NA
animtype  = hard
damage    = 20 * fvar(39)
priority = 5, Hit
getpower = 100,100
givepower = 20,20
guardflag = N
pausetime = 11,12
sparkno = s7006
sparkxy = -24,-79
hitsound   = s420,1
guardsound = s120,0
guard.sparkno = s7011
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -10.5
air.velocity = -2.5,-6
ID = 210
nochainID = 210

[State 215]
type = HitDef
trigger1 = var(30) = 0
trigger1 = animelem = 5
trigger1 = movehit = 0
attr = S, NA
animtype  = hard
damage    = 60 * fvar(39)
priority = 5, Hit
getpower = 100,100
givepower = 20,20
guardflag = M
pausetime = 11,12
sparkno = s7006
sparkxy = -24,-79
hitsound   = s410,1
guardsound = s120,0
guard.sparkno = s7011
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -10.5
air.velocity = -2.5,-6
ID = 210
nochainID = 210

[State 215]
type = HitDef
trigger1 = var(30) = 1
trigger1 = animelem = 5
trigger1 = movehit = 0
attr = S, NA
animtype  = hard
damage    = 60 * fvar(39)
priority = 5, Hit
getpower = 100,100
givepower = 20,20
guardflag = N
pausetime = 11,12
sparkno = s7006
sparkxy = -24,-79
hitsound   = s420,1
guardsound = s120,0
guard.sparkno = s7011
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -10.5
air.velocity = -2.5,-6
ID = 210
nochainID = 210

[State 215]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;近轻脚
[Statedef 235]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 235
poweradd = 0
sprpriority = 1

[State 235]
type = PlaySnd
trigger1 = animelem = 2
value = 200,random%2

[State 235]
type = PlaySnd
trigger1 = animelem = 1
value = 300,1

[State 235]
type = HitDef
trigger1 = var(30) = 0
trigger1 = animelem = 3
attr = S, NA
animtype  = light
damage    = 25 * fvar(39)
priority = 4, Hit
getpower = 50,50
givepower = 10,10
guardflag = M
pausetime = 11,12
sparkno = s7000
sparkxy = -21,-39
hitsound   = s400,2
guard.sparkno = s7010
guardsound = s120,0
ground.type = low
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -6
air.velocity = -2.5,-3.5
ID = 200

[State 235]
type = HitDef
trigger1 = var(30) = 1
trigger1 = animelem = 3
attr = S, NA
animtype  = light
damage    = 25 * fvar(39)
priority = 4, Hit
getpower = 50,50
givepower = 10,10
guardflag = N
pausetime = 11,12
sparkno = s7000
sparkxy = -21,-39
hitsound   = s420,1
guard.sparkno = s7010
guardsound = s120,0
ground.type = low
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -6
air.velocity = -2.5,-3.5
ID = 200

[State 235]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;近重脚
[Statedef 245]
type    = S
movetype= A
physics = S
juggle  = 8
velset = 0,0
ctrl = 0
anim = 245
poweradd = 0
sprpriority = 1

[State 245];
type = PlaySnd
trigger1 = animelem = 1
value = 210,0

[State 245];
type = PlaySnd
trigger1 = animelem = 1
value = 300,1

[State 245]
type = HitDef
trigger1 = var(30) = 0
trigger1 = animelem = 4
attr = S, NA
animtype  = hard
damage    = 80*fvar(39)
priority = 5, Hit
getpower = 100,100
givepower = 20,20
guardflag = M
pausetime = 11,12
sparkno = s7001
sparkxy = -15,-72
hitsound   = s400,3
guard.sparkno = s7011
guardsound = s120,0
ground.type = low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -8.5
air.velocity = -2.5,-4
guard.velocity = -12
fall = 0
fall.recover = 0
ID = 200


[State 245]
type = HitDef
trigger1 = var(30) = 1
trigger1 = animelem = 4
attr = S, NA
animtype  = hard
damage    = 80*fvar(39)
priority = 5, Hit
getpower = 100,100
givepower = 20,20
guardflag = N
pausetime = 11,12
sparkno = s7001
sparkxy = -15,-72
hitsound   = s420,1
guard.sparkno = s7011
guardsound = s120,0
ground.type = low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -8.5
air.velocity = -2.5,-4
guard.velocity = -12
fall = 0
fall.recover = 0
ID = 200

[State 245]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1


;---------------------------------------------------------------------------
;蹲轻拳
[Statedef 400]
type    = C
movetype= A
physics = C
poweradd= 0
velset = 0,0
ctrl = 0
anim = 400
sprpriority = 1

[State 400]
type = PlaySnd
trigger1 = animelem = 2
value = 300, 0

[State 400]
type = PlaySnd
trigger1 = animelem = 2
value = 200, random%2


[State 400]
type = HitDef
trigger1 = var(30) = 0
trigger1 = animelem = 2
attr = C, NA
damage    = 20*fvar(39)
priority = 4, Hit
animtype  = Light
hitflag = MAF
guardflag = M
getpower = 50,50
givepower = 10,10
pausetime = 11,12
sparkno = s7005
sparkxy = -10,-51
hitsound   = s410,0
guard.sparkno = s7010
guardsound = s120,0
ground.type = low
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -5
air.velocity = -2.5,-3
ground.cornerpush.veloff = -5
ID = 400

[State 400]
type = HitDef
trigger1 = var(30) = 1
trigger1 = animelem = 2
attr = C, NA
damage    = 20*fvar(39)
priority = 4, Hit
animtype  = Light
hitflag = MAF
guardflag = N
getpower = 50,50
givepower = 10,10
pausetime = 11,12
sparkno = s7005
sparkxy = -10,-51
hitsound   = s420,1
guard.sparkno = s7010
guardsound = s120,0
ground.type = low
ground.slidetime = 9
ground.hittime  = 9
ground.velocity = -5
air.velocity = -2.5,-3
ground.cornerpush.veloff = -5
ID = 400

[State -3,跳跃]
type = ChangeState
TriggerAll = var(59)
TriggerAll = Life >= 100
triggerall = animtime = 0
Trigger1 = EnemyNear,MoveType = H && !EnemyNear,Ctrl
Trigger1 = EnemyNear,StateNo = [120,159]
Trigger1 = EnemyNear,GetHitVar(HitTime) >= 1
Trigger1 = P2BodyDist X >= 80 
Trigger1 = var(33) := ifelse(P2BodyDist X > 110, 4, 3)
Trigger1 = var(50) := 3906012

Trigger2 = EnemyNear,MoveType = H && !EnemyNear,Ctrl
Trigger2 = EnemyNear,StateNo = [120,159]
Trigger2 = EnemyNear,GetHitVar(HitTime) >= 2
Trigger2 = EnemyNear,BackEdgeBodyDist < 10
Trigger2 = P2BodyDist X < 50
Trigger2 = var(33) := 3
Trigger2 = var(50) := 3906022

Trigger3 = FrontEdgeBodyDist < 60
Trigger3 = EnemyNear,MoveType = I && !EnemyNear,Ctrl
Trigger3 = EnemyNear,AnimTime <= -19
Trigger3 = EnemyNear,BackEdgeBodyDist < 10
Trigger3 = var(33) := 3
Trigger3 = var(50) := 3906032

value = 39


[State -3,目押接蹲轻拳]
type = ChangeState
TriggerAll = var(59)
triggerall = animtime = 0
TriggerAll = EnemyNear,MoveType = H && !EnemyNear,Ctrl
Triggerall = EnemyNear,StateType != A
Trigger1 = EnemyNear,StateNo = [120,159]
Trigger1 = (EnemyNear,gethitvar(hittime) = [1,3]) || (EnemyNear,StateNo = 5700 && EnemyNear,time = 38)
Trigger1 = P2BodyDist x - ifelse(EnemyNear,BackEdgeBodyDist > 10, fvar(37) * 1, 0) - ifelse(EnemyNear,BackEdgeBodyDist < 10,Vel x * 1, 0)< 50
Trigger1 = var(50) := 040011162
value = 400

[State 400]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
;蹲重拳
[Statedef 410]
type    = C
movetype= A
physics = N
ctrl = 0
velset = 0,0
anim = 410
sprpriority = 1


[State 410]
type = PlaySnd
trigger1 = animelem = 1
value = 300, 0

[State 410]
type = PlaySnd
trigger1 = animelem = 1
value = 210, 0

[State 410]
type = HitDef
trigger1 = var(30) = 0
trigger1 = AnimElem = 2
attr = C, NA
damage    = 60*fvar(39)
priority = 5, Hit
animtype  = hard
hitflag = MAF
guardflag = M
pausetime = 11,12
getpower = 100,100
givepower = 20,20
sparkno = s7002
sparkxy = -14,-60
hitsound   = s400,1
guard.sparkno = s7011
guardsound = s120,0
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = 0
air.velocity = -2,-6
fall = 0
fall.recover = 0
ID = 410


[State 410]
type = HitDef
trigger1 = var(30) = 1
trigger1 = AnimElem = 2
attr = C, NA
damage    = 60*fvar(39)
priority = 5, Hit
animtype  = hard
hitflag = MAF
guardflag = N
pausetime = 11,12
getpower = 100,100
givepower = 20,20
sparkno = s7002
sparkxy = -14,-60
hitsound   = s420,1
guard.sparkno = s7011
guardsound = s120,0
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = 0
air.velocity = -2,-6
fall = 0
fall.recover = 0
ID = 410


[State 410]
type = HitDef
trigger1 = var(30) = 0
trigger1 = animelem = 3
trigger1 = movehit
attr = C, NA
damage    = 20*fvar(39)
priority = 5, Hit
animtype  = hard
hitflag = MAF
guardflag = M
pausetime = 11,12
getpower = 100,100
givepower = 20,20
sparkno = s7006
sparkxy = -8,-112
hitsound   = s410,1
guard.sparkno = s7011
guardsound = s120,0
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -7
air.velocity = -2,-6
fall = 0
fall.recover = 0
ID = 410


[State 410]
type = HitDef
trigger1 = var(30) = 1
trigger1 = animelem = 3
trigger1 = movehit
attr = C, NA
damage    = 20*fvar(39)
priority = 5, Hit
animtype  = hard
hitflag = MAF
guardflag = N
pausetime = 11,12
getpower = 100,100
givepower = 20,20
sparkno = s7006
sparkxy = -8,-112
hitsound   = s420,1
guard.sparkno = s7011
guardsound = s120,0
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -7
air.velocity = -2,-6
fall = 0
fall.recover = 0
ID = 410


[State 410]
type = HitDef
trigger1 = var(30) = 0
trigger1 = animelem = 4
trigger1 = movehit = 0
attr = C, NA
damage    = 60*fvar(39)
priority = 5, Hit
animtype  = hard
hitflag = MAF
guardflag = M
pausetime = 11,12
getpower = 100,100
givepower = 20,20
sparkno = s7006
sparkxy = -8,-112
hitsound   = s410,1
guard.sparkno = s7011
guardsound = s120,0
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -11
air.velocity = -2,-6
fall = 0
fall.recover = 0
ID = 410


[State 410]
type = HitDef
trigger1 = var(30) = 1
trigger1 = animelem = 4
trigger1 = movehit = 0
attr = C, NA
damage    = 60*fvar(39)
priority = 5, Hit
animtype  = hard
hitflag = MAF
guardflag = N
pausetime = 11,12
getpower = 100,100
givepower = 20,20
sparkno = s7006
sparkxy = -8,-112
hitsound   = s420,1
guard.sparkno = s7011
guardsound = s120,0
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -11
air.velocity = -2,-6
fall = 0
fall.recover = 0
ID = 410

[State 410]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
;蹲轻脚
[Statedef 430]
type    = C
movetype= A
physics = C
poweradd= 0
velset = 0,0
ctrl = 0
anim = 430
sprpriority = 1

[State 430]
type = PlaySnd
trigger1 = animelem = 2
value = 300, 1

[State 430]
type = PlaySnd
trigger1 = animelem = 2
value = 200, random%2

[State 430]
type = HitDef
trigger1 = animelem = 2
attr = C, NA
damage    = 20*fvar(39)
priority = 4, Hit
animtype  = Light
hitflag = M
guardflag = L
pausetime = 7,8
sparkno = s7000
sparkxy = -10,-11
hitsound   = s400,2
getpower = 50,50
givepower = 10,10
guard.sparkno = s7010
guardsound = s120,0
ground.type = Low
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -5
air.velocity = -2,-3
down.velocity = -5,0
down.hittime = 20
ground.cornerpush.veloff = -5
ID = 430

[State 430]
type = ChangeState
triggerall = var(59)
triggerall = AnimTime = 0 
Triggerall = EnemyNear,StateNo >= 5000 && !EnemyNear,Ctrl
triggerall = MoveHit
Triggerall = EnemyNear,gethitvar(hittime) >= 3
Trigger1 = P2BodyDist x - ifelse(EnemyNear,BackEdgeBodyDist > 10, fvar(37) * 3, 0) - ifelse(EnemyNear,BackEdgeBodyDist < 10,Vel x * 3, 0)< 48
Trigger1 = var(50) := 041061
value = 410

[State 430]
type = ChangeState
triggerall = var(59)
triggerall = AnimTime = 0 
Triggerall = (EnemyNear,StateNo =[120,159]) && !EnemyNear,Ctrl
triggerall = MoveContact
Triggerall = EnemyNear,gethitvar(hittime) >= 2
Trigger1 = P2BodyDist x - ifelse(EnemyNear,BackEdgeBodyDist > 10, fvar(37) * 1, 0) - ifelse(EnemyNear,BackEdgeBodyDist < 10,Vel x * 1, 0)< 50
Trigger1 = var(50) := 040061
value = 400

[State 430]
type = ChangeState
triggerall = var(59) 
triggerall = movecontact
trigger1 = AnimTime = 0
value = 19

[State 430]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
;蹲重脚
[Statedef 440]
type    = C
movetype= A
physics = C
poweradd= 0
ctrl = 0
anim = 440
velset = 0,0
sprpriority = 1

[State 440]
type = PlaySnd
trigger1 = animelem = 3
value = 300, 1

[State 440]
type = PlaySnd
trigger1 = animelem = 3
value = 210, 0

[State 440]
type = HitDef
trigger1 = var(30) = 0
trigger1 = animelem = 5
attr = C, NA
damage    = 80*fvar(39)
priority = 5, Hit
hitflag = MAF
guardflag = L
pausetime = 11,12
sparkno = s7001
getpower = 100,100
givepower = 20,20
sparkxy = -15,-10
hitsound   = s400,3
guardsound = s120,0
guard.sparkno = s7011
ground.type = Trip
ground.slidetime = 10
ground.hittime  = 17
ground.velocity = -1.5,-5
air.velocity = -4,-4
guard.velocity = -11
fall = 1
fall.recover = 0
ID = 440

[State 440]
type = HitDef
trigger1 = var(30) = 1
trigger1 = animelem = 5
attr = C, NA
damage    = 80*fvar(39)
priority = 5, Hit
hitflag = MAF
guardflag = N
pausetime = 11,12
sparkno = s7001
getpower = 100,100
givepower = 20,20
sparkxy = -15,-10
hitsound   = s420,1
guardsound = s120,0
guard.sparkno = s7011
ground.type = Trip
ground.slidetime = 10
ground.hittime  = 17
ground.velocity = -1.5,-5
air.velocity = -4,-4
guard.velocity = -11
fall = 1
fall.recover = 0
ID = 440

[State 440]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1


;---------------------------------------------------------------------------
;空轻拳
[Statedef 600]
type    = A
movetype= A
physics = A
poweradd= 0
ctrl = 0
anim = 600
sprpriority = 2

[State 600]
type = PlaySnd
trigger1 = animelem = 2
value = 300, 0

[State 600]
type = PlaySnd
trigger1 = animelem = 2
value = 200, random%2


[State 600]
type = HitDef
trigger1 = var(30) = 0
trigger1 = animelem = 3
attr = A, NA
damage    = 30*fvar(39)
priority = 4, Hit
getpower = 50,50
givepower = 10,10
guardflag = H
pausetime = 11,12
sparkno = s7005
sparkxy = -10,-70
hitsound   = s410,0
guard.sparkno = s7010
guardsound = s120,0
ground.type = low
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -4
air.velocity = -1.3,-3
ID = 600


[State 600]
type = HitDef
trigger1 = var(30) = 1
trigger1 = animelem = 3
attr = A, NA
damage    = 30*fvar(39)
priority = 4, Hit
getpower = 50,50
givepower = 10,10
guardflag = N
pausetime = 11,12
sparkno = s7005
sparkxy = -10,-70
hitsound   = s420,1
guard.sparkno = s7010
guardsound = s120,0
ground.type = low
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -4
air.velocity = -1.3,-3
ID = 600



;---------------------------------------------------------------------------
;空中重拳
[Statedef 610]
type    = A
movetype= A
physics = A
poweradd= 0
ctrl = 0
anim = 610
sprpriority = 2

[State 610]
type = PlaySnd
trigger1 = animelem = 3
value = 300, 0

[State 610]
type = PlaySnd
trigger1 = animelem = 2
value = 210, 0

[State 610]
type = HitDef
trigger1 = var(30) = 0
trigger1 = animelem = 5
attr = A, NA
damage = 90*fvar(39)
priority = 5, Hit
guardflag = H
getpower = 100,100
givepower = 20,20
pausetime = 11,12
sparkno = s7006
sparkxy = -9,-43
hitsound   = s410,1
guard.sparkno = s7011
guardsound = s120,0
animtype = hard
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -7
air.velocity = -3,-5
ID = 610

[State 610]
type = HitDef
trigger1 = var(30) = 0
trigger1 = animelem = 6
attr = A, NA
damage = 90*fvar(39)
priority = 5, Hit
guardflag = H
getpower = 100,100
givepower = 20,20
pausetime = 11,12
sparkno = s7006
sparkxy = -9,-43
hitsound   = s410,1
guard.sparkno = s7011
guardsound = s120,0
animtype = hard
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -7
air.velocity = -3,-5
ID = 610

[State 610]
type = HitDef
trigger1 = var(30) = 1
trigger1 = animelem = 5
attr = A, NA
damage = 90*fvar(39)
priority = 5, Hit
guardflag = N
getpower = 100,100
givepower = 20,20
pausetime = 11,12
sparkno = s7006
sparkxy = -9,-43
hitsound   = s420,1
guard.sparkno = s7011
guardsound = s120,0
animtype = hard
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -7
air.velocity = -3,-5
ID = 610

[State 610]
type = HitDef
trigger1 = var(30) = 1
trigger1 = animelem = 6
attr = A, NA
damage = 90*fvar(39)
priority = 5, Hit
guardflag = N
getpower = 100,100
givepower = 20,20
pausetime = 11,12
sparkno = s7006
sparkxy = -9,-43
hitsound   = s420,1
guard.sparkno = s7011
guardsound = s120,0
animtype = hard
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -7
air.velocity = -3,-5
ID = 610

;---------------------------------------------------------------------------
;空轻脚
[Statedef 630]
type    = A
movetype= A
physics = A
ctrl = 0
anim = 630
sprpriority = 1


[State 630]
type = PlaySnd
trigger1 = animelem = 2
value = 300, 1

[State 630]
type = PlaySnd
trigger1 = animelem = 2
value = 200, random%2

[State 630]
type = HitDef
trigger1 = var(30) = 0
trigger1 = animelem = 3
attr = A, NA
damage = 35*fvar(39)
priority = 4, Hit
getpower = 50,50
givepower = 10,10
guardflag = H
pausetime = 12,14
sparkno = s7000
sparkxy = -11,-20
hitsound   = s400,2
guard.sparkno = s7010
guardsound = s120,0
ground.type = low
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -4
air.velocity = -2,-3
ID = 630


[State 630]
type = HitDef
trigger1 = var(30) = 1
trigger1 = animelem = 3
attr = A, NA
damage = 35*fvar(39)
priority = 4, Hit
getpower = 50,50
givepower = 10,10
guardflag = N
pausetime = 12,14
sparkno = s7000
sparkxy = -11,-20
hitsound   = s420,1
guard.sparkno = s7010
guardsound = s120,0
ground.type = low
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -4
air.velocity = -2,-3
ID = 630



;---------------------------------------------------------------------------
;空重脚
[Statedef 640]
type    = A
movetype= A
physics = A
ctrl = 0
anim = 640
sprpriority = 1

[State 640]
type = PlaySnd
trigger1 = animelem = 2
value = 300, 1

[State 640];
type = PlaySnd
trigger1 = animelem = 2
value = 210, 0

[State 640]
type = HitDef
trigger1 = var(30) = 0
trigger1 = animelem >= 4
attr = A, NA
damage    = 90*fvar(39)
priority = 5, Hit
guardflag = H
getpower = 100,100
givepower = 20,20
pausetime = 12,14
sparkno = s7001
sparkxy = -12,-26
hitsound   = s400,3
guard.sparkno = s7011
guardsound = s120,0
animtype = hard
ground.type = low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -5
air.velocity = -3,-4
ID = 640
;

[State 640, 3]
type = HitDef
trigger1 = var(30) = 1
trigger1 = animelem >= 4
attr = A, NA
damage    = 90*fvar(39)
priority = 5, Hit
guardflag = N
getpower = 100,100
givepower = 20,20
pausetime = 12,14
sparkno = s7001
sparkxy = -12,-26
hitsound   = s420,1
guard.sparkno = s7011
guardsound = s120,0
animtype = hard
ground.type = low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -4.5
air.velocity = -3,-4
ID = 640
;

;---------------------------------------------------------------------------
;垂直空轻拳
[Statedef 605]
type    = A
movetype= A
physics = A
poweradd= 0
ctrl = 0
anim = 605
sprpriority = 2

[State 605]
type = PlaySnd
trigger1 = animelem = 2
value = 300, 0

[State 605]
type = PlaySnd
trigger1 = animelem = 2
value = 200, random%2

[State 605]
type = HitDef
trigger1 = var(30) = 0
trigger1 = animelem = 3
attr = A, NA
damage    = 35*fvar(39)
priority = 4, Hit
getpower = 50,50
givepower = 10,10
guardflag = H
pausetime = 11,12
sparkno = s7005
sparkxy = -10,-70
hitsound   = s410,0
guard.sparkno = s7010
guardsound = s120,0
ground.type = low
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -4
air.velocity = -1.3,-3
ID = 605


[State 605]
type = HitDef
trigger1 = var(30) = 1
trigger1 = animelem = 3
attr = A, NA
damage    = 35*fvar(39)
priority = 4, Hit
getpower = 50,50
givepower = 10,10
guardflag = N
pausetime = 11,12
sparkno = s7005
sparkxy = -10,-70
hitsound   = s420,1
guard.sparkno = s7010
guardsound = s120,0
ground.type = low
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -4
air.velocity = -1.3,-3
ID = 605



;---------------------------------------------------------------------------
;垂直空中重拳
[Statedef 615]
type    = A
movetype= A
physics = A
poweradd= 0
ctrl = 0
anim = 615
sprpriority = 2

[State 615]
type = PlaySnd
trigger1 = animelem = 3
value = 300, 0

[State 615]
type = PlaySnd
trigger1 = animelem = 2
value = 210, 0

[State 615]
type = HitDef
trigger1 = var(30) = 0
trigger1 = animelem = 5
attr = A, NA
damage = 90*fvar(39)
priority = 5, Hit
guardflag = H
getpower = 100,100
givepower = 20,20
pausetime = 11,12
sparkno = s7006
sparkxy = -9,-43
hitsound   = s410,1
guard.sparkno = s7011
guardsound = s120,0
animtype = hard
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -7
air.velocity = -3,-5
ID = 615


[State 615]
type = HitDef
trigger1 = var(30) = 0
trigger1 = animelem = 6
attr = A, NA
damage = 90*fvar(39)
priority = 5, Hit
guardflag = H
getpower = 100,100
givepower = 20,20
pausetime = 11,12
sparkno = s7006
sparkxy = -9,-43
hitsound   = s410,1
guard.sparkno = s7011
guardsound = s120,0
animtype = hard
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -7
air.velocity = -3,-5
ID = 615


[State 615]
type = HitDef
trigger1 = var(30) = 1
trigger1 = animelem = 5
attr = A, NA
damage = 90*fvar(39)
priority = 5, Hit
guardflag = N
getpower = 100,100
givepower = 20,20
pausetime = 11,12
sparkno = s7006
sparkxy = -9,-43
hitsound   = s420,1
guard.sparkno = s7011
guardsound = s120,0
animtype = hard
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -7
air.velocity = -3,-5
ID = 615


[State 615]
type = HitDef
trigger1 = var(30) = 1
trigger1 = animelem = 6
attr = A, NA
damage = 90*fvar(39)
priority = 5, Hit
guardflag = N
getpower = 100,100
givepower = 20,20
pausetime = 11,12
sparkno = s7006
sparkxy = -9,-43
hitsound   = s420,1
guard.sparkno = s7011
guardsound = s120,0
animtype = hard
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -7
air.velocity = -3,-5
ID = 615


;---------------------------------------------------------------------------
;垂直空轻脚
[Statedef 635]
type    = A
movetype= A
physics = A
ctrl = 0
anim = 635
sprpriority = 1


[State 635]
type = PlaySnd
trigger1 = animelem = 2
value = 300, 1

[State 635]
type = PlaySnd
trigger1 = animelem = 2
value = 200, random%2

[State 635]
type = HitDef
trigger1 = var(30) = 0
trigger1 = animelem = 4
attr = A, NA
damage = 35*fvar(39)
priority = 4, Hit
getpower = 50,50
givepower = 10,10
guardflag = H
pausetime = 12,14
sparkno = s7000
sparkxy = -11,-20
hitsound   = s400,2
guard.sparkno = s7010
guardsound = s120,0
ground.type = low
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -4
air.velocity = -2,-3
ID = 635


[State 630]
type = HitDef
trigger1 = var(30) = 1
trigger1 = animelem = 4
attr = A, NA
damage = 35*fvar(39)
priority = 4, Hit
getpower = 50,50
givepower = 10,10
guardflag = N
pausetime = 12,14
sparkno = s7000
sparkxy = -11,-20
hitsound   = s420,1
guard.sparkno = s7010
guardsound = s120,0
ground.type = low
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -4
air.velocity = -2,-3
ID = 635



;---------------------------------------------------------------------------
;垂直空重脚
[Statedef 645]
type    = A
movetype= A
physics = A
ctrl = 0
anim = 645
sprpriority = 1

[State 645]
type = PlaySnd
trigger1 = animelem = 2
value = 300, 1

[State 645]
type = PlaySnd
trigger1 = animelem = 2
value = 210, 0

[State 645]
type = HitDef
trigger1 = hitcount = 0
trigger1 = var(30) = 0
trigger1 = animelem >= 4
attr = A, NA
damage    = 90*fvar(39)
priority = 5, Hit
guardflag = H
getpower = 100,100
givepower = 20,20
pausetime = 12,14
sparkno = s7001
sparkxy = -12,-26
hitsound   = s400,3
guard.sparkno = s7011
guardsound = s120,0
animtype = hard
ground.type = low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -5
air.velocity = -3,-4
ID = 645


[State 645]
type = HitDef
trigger1 = hitcount = 0
trigger1 = var(30) = 1
trigger1 = animelem >= 4
attr = A, NA
damage    = 90*fvar(39)
priority = 5, Hit
guardflag = N
getpower = 100,100
givepower = 20,20
pausetime = 12,14
sparkno = s7001
sparkxy = -12,-26
hitsound   = s420,1
guard.sparkno = s7011
guardsound = s120,0
animtype = hard
ground.type = low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -4.5
air.velocity = -3,-4
ID = 645



;---------------------------------------------------------------------------
;空中超重击
[Statedef 690]
type    = A
movetype= A
physics = A
ctrl = 0
anim = 690
sprpriority = 2


[State 690]
type = PlaySnd
trigger1 = animelem = 5
value = 300, 1

[State 690]
type = PlaySnd
trigger1 = animelem = 2
value = 490, 0


[State 690]
type = HitDef
trigger1 = var(30) = 0
trigger1 = animelem = 6
attr = A, NA
animtype  = hard
damage    = 100*fvar(39)
priority = 99, Hit
getpower = 150,150
givepower = 50,50
guardflag = M
pausetime = 12,14
sparkno = s7007
sparkxy = -12,-59
hitsound   = s410,1
guard.sparkno = s7011
guardsound = s120,0
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -6,-6.5
air.velocity = -6,-6.8
yaccel = 0.45
fall = 1
fall.recover = 0
ID = 690


[State 690]
type = HitDef
trigger1 = var(30) = 1
trigger1 = animelem = 6
attr = A, NA
animtype  = hard
damage    = 100*fvar(39)
priority = 99, Hit
getpower = 150,150
givepower = 50,50
guardflag = N
pausetime = 12,14
sparkno = s7007
sparkxy = -12,-59
hitsound   = s420,1
guard.sparkno = s7011
guardsound = s120,0
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -6,-6.5
air.velocity = -6,-6.8
yaccel = 0.45
fall = 1
fall.recover = 0
ID = 690



;---------------------------------------------------------------------------
;超重击
[Statedef 290]
type    = S
movetype= A
physics = S
poweradd= 0
ctrl = 0
velset = 0,0
anim = 290
sprpriority = 2


[State 290]
type = PlaySnd
trigger1 = animelem = 7
value = 300, 1

[State 290]
type = PlaySnd
trigger1 = animelem = 3
value = 290, 0


[State 290]
type = HitDef
trigger1 = var(30) = 0
trigger1 = animelem = 10
attr = S, NA
animtype  = high
damage    = 118*fvar(39)
priority = 6, Hit
getpower = 160,160
givepower = 50,50
guardflag = M
pausetime = 11,12
sparkno = s7002
sparkxy = -15,-93
hitsound   = s400,4
guard.sparkno = s7011
guardsound = s120,0
ground.type = high
ground.slidetime = 17
ground.hittime  = 17
ground.velocity = -4,-6.8
air.velocity = -4,-6.8
guard.velocity = -11
yaccel = 0.45
fall = 1
fall.recover = 0
ID = 290



[State 290]
type = HitDef
trigger1 = var(30) = 1
trigger1 = animelem = 10
attr = S, NA
animtype  = high
damage    = 118*fvar(39)
priority = 6, Hit
getpower = 160,160
givepower = 50,50
guardflag = N
pausetime = 11,12
sparkno = s7002
sparkxy = -15,-93
hitsound   = s420,1
guard.sparkno = s7011
guardsound = s120,0
ground.type = high
ground.slidetime = 17
ground.hittime  = 17
ground.velocity = -4,-6.8
air.velocity = -4,-6.8
guard.velocity = -11
yaccel = 0.45
fall = 1
fall.recover = 0
ID = 290



[State 290]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;---------------------------------------------------------------------------
; 刚CD
[Statedef 291]
type    = S
movetype= A
physics = S
poweradd= -1000
ctrl = 0
velset = 0,0
anim = 290
sprpriority = 1

[State 291]
type = NotHitBy
triggerall = 1
trigger1 = 1
value = SCA


[State 291]
type = PlaySnd
trigger1 = animelem = 4
value = 300, 1

[State 291]
type = PlaySnd
trigger1 = animelem = 5
value = 490, 0


[State 291]
type = EnvColor
trigger1 = movehit
persistent = 0
ignorehitpause = 1
time = 2
value = 255,255,255
under = 2


[State 291]
type = HitDef
trigger1 = AnimElem = 10
attr = S, NA
animtype  = diagup
damage    = 45
priority = 6, Hit
getpower = 0,0
guardflag = M
pausetime = 11,12
sparkno = s7002
sparkxy = -15,-69
hitsound   = s400,4
guard.sparkno = s7011
guardsound = s120,0
ground.type = high
ground.slidetime = 17
ground.hittime  = 17
ground.velocity = -6,-6.5
air.velocity = -6,-6.8
guard.velocity = -11
fall = 1
fall.recover = 0
ID = 291

kill = 0


[State 291]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


[Statedef 250]
type    = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 250
poweradd = 0
sprpriority = 1

[state 250]
type = varset
trigger1 = time = 0
v = 30
value = 0

[state 250]
type = changeanim
trigger1 = time = 0
trigger1 = prevstateno = [200,499]
value = 251

[State 250];
type = PlaySnd
trigger1 = animelem = 9
value = 250,0

[State 250]
type = PlaySnd
trigger1 = animelem = 9
value = 300,0

[state 250]
type = posadd
trigger1 = animelem = 10
trigger2 = animelem = 11
x = 18

[State 250]
type = HitDef
trigger1 = anim = 250
trigger1 = animelem = 10
attr = S, N
animtype  = hard
damage    = 70*fvar(39)
priority = 5, Hit
getpower = 120,120
givepower = 25,25
hitflag = MAF
guardflag = M
pausetime = 11,12
sparkno = s7002
sparkxy = -20,-68
hitsound   = s400,1
guardsound = s120,0
guard.sparkno = s7011
ground.type = high
ground.slidetime = 23
ground.hittime  = 23
ground.velocity = -7
air.velocity = -3.5,-4
yaccel = 0.5
fall = 0
fall.recover = 0
ID = 250

[State 250]
type = HitDef
trigger1 = anim = 251
trigger1 = animelem = 10
attr = S, N
animtype  = hard
damage    = 50 + var(8)*19
priority = 5, Hit
getpower = 120,120
givepower = 25,25
hitflag = MAF
guardflag = M
pausetime = 11,12
sparkno = s7002
sparkxy = -20,-68
hitsound   = s400,1
guardsound = s120,0
guard.sparkno = s7011
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -7
air.velocity = -3.5,-4
yaccel = 0.5
fall = 0
fall.recover = 0
ID = 250


[State 250]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1


;---------------------------------------------------------------------------
;打开
[Statedef 1600]
type    = S
movetype= A
physics = N
velset = 0,0
anim = 1600
sprpriority = 1
ctrl = 0

[state a]
type = varset
triggerall = var(59) = 0
trigger1 = time = 0
v = 30
value = 0

[state 1600]
type = varset
triggerall = var(59) = 0
trigger1 = time = 0
v = 6
value = 0

[state 1600]
type = varset
triggerall = var(59) = 0
trigger1 = time = 0
trigger1 = command = "x"
v = 5
value = 1

[state 1600]
type = varset
triggerall = var(59) = 0
trigger1 = time = 0
trigger1 = command = "y"
v = 5
value = 2

[state 1600]
type = changeanim
trigger1 = time = 0
trigger1 = var(5) = 2
value = 1601


[State 1600]
type = PlaySnd
trigger1 = animelem = 7
value = 1600, 0

[State 1600]
type = PlaySnd
trigger1 = animelem = 7
value = 850, 0

[State 1600]
type = PlaySnd
trigger1 = var(5) = 2
trigger1 = animelemtime(5) = 3;animelem = 6
value = 190, 0


[State 1600]
type = Explod
trigger1 = var(5) = 2
trigger1 = animelemtime(5) = 3
anim = 1605
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

[State 1600]
type = EnvShake
trigger1 = animelem = 7
time = 20
ampl = -6
freq = 95
phase = 95


[State 1600]
type = NotHitBy
trigger1 = animelem = 6,<0
value = SCA


[State 1600]
type = HitDef
trigger1 = var(5) = 1
trigger1 = animelem = 7
attr = S, SA
animtype  = up
damage    = 80*fvar(39),10
priority = 7, Hit
getpower = 125,125
givepower = 40,40
guardflag = H
pausetime = 11,12
sparkno = s7002
sparkxy = -32,-53
hitsound   = s400,4
guardsound = s120,1
guard.sparkno = s7012
ground.type = low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = 0,25
guard.velocity = -10
air.velocity = -3,25
yaccel = 0.46;28
ID = 1600
fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
guard.cornerpush.veloff = -4
p2stateno = ifelse(EnemyNear,StateType = A, 5020, ifelse(EnemyNear,StateType = C, 5010, 5000))

[State 1600]
type = HitDef
trigger1 = var(5) = 2
trigger1 = animelem = 7
attr = S, SA
animtype  = up
damage    = 138*fvar(39),10
priority = 12, Hit
getpower = 146,146
givepower = 20,20
guardflag = N
pausetime = 32,35
sparkno = s7003
sparkxy = -32,-53
hitsound   = s400,4
guardsound = s120,1
guard.sparkno = s7012
ground.type = low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = 0,25
guard.velocity = -10
air.velocity = -3,25
yaccel = 0.46;28
ID = 1601

palfx.time =48
palfx.mul = 100,120,80
palfx.sinadd = 93,115,68,16
palfx.add = -30,-20,-50
fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
guard.cornerpush.veloff = -4
envshake.time = 35
envshake.ampl = -8
envshake.freq = 92
envshake.phase = 92
p2stateno = ifelse(EnemyNear,StateType = A, 5020, ifelse(EnemyNear,StateType = C, 5010, 5000))

[state 1600]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1


;---------------------------------------------------------------------------
;緊急回避前
[Statedef 700]
type = S
movetype = I
physics = N
poweradd= 0
ctrl = 0
anim = 700
velset = 0,0
sprpriority = 1

[State 700]
type = PlaySnd
trigger1 = animelem = 1
value = 850, 2

;---------------------[演出]
[State 290, 1]
type = poweradd
triggerall = time = 0
trigger1 = prevstateno = 150
trigger2 = prevstateno = 151
trigger3 = prevstateno = [200,499]
value = -1000

[State 700, 2];無敵の状態を作る
type = NotHitBy
triggerall = 1
trigger1 = prevstateno = 150
trigger2 = prevstateno = 151
value = SCA

[State 1];無敵の状態を作る
type = NotHitBy
triggerall = animelem = 10,<0
trigger1 = prevstateno != 150
trigger2 = prevstateno != 151
value = SCA

[state a]
type = playerpush
trigger1 = 1
value = 0

[State 50, 4]
type = AfterImage
trigger1 = time = 0
time = 12
trans = add1
timegap = 2
framegap = 2
length = 6
palbright = 12,12,12
palcontrast = 225,225,225
palpostbright = 0,0,0
paladd = 0,0,0
palmul = 1,1,1

;---------------------[エフェクト]
[State a]
type = EnvColor
triggerall = time = 0
trigger1 = prevstateno = 150
trigger2 = prevstateno = 151
persistent = 0
ignorehitpause = 1
time = 3
value = 255,255,255
under = 2

;---------------------[移動]
[state a]
type = posset
trigger1 = time = 0
y = 0


[State 600, 1]
type = velset
trigger1 = Time = 0
x = 0

[State 600, 1]
type = velset
trigger1 = animelem = 3
x = 6.5

[State 600, 1]
type = velset
trigger1 = animelem = 8
x = 0


;---------------------[ステート移行]
[State 200, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;緊急回避後
[Statedef 701]
type = S
movetype = I
physics = N
poweradd= 0
ctrl = 0
anim = 701
velset = 0,0
sprpriority = 1

[State 700]
type = PlaySnd
trigger1 = animelem = 1
value = 850, 2

;---------------------[演出]
[State 290, 1]
type = poweradd
triggerall = time = 0
trigger1 = prevstateno = 150
trigger2 = prevstateno = 151
value = -1000

[State 700, 2];無敵の状態を作る
type = NotHitBy
triggerall = 1
trigger1 = prevstateno = 150
trigger2 = prevstateno = 151
value = SCA

[State 1];無敵の状態を作る
type = NotHitBy
triggerall = animelem = 9,<0
trigger1 = prevstateno != 150
trigger2 = prevstateno != 151
value = SCA

[state a]
type = playerpush
trigger1 = 1
value = 0

[State 50, 4]
type = AfterImage
trigger1 = time = 0
time = 12
trans = add1
timegap = 2
framegap = 2
length = 6
palbright = 12,12,12
palcontrast = 225,225,225
palpostbright = 0,0,0
paladd = 0,0,0
palmul = 1,1,1

;---------------------[エフェクト]
[State a]
type = EnvColor
triggerall = time = 0
trigger1 = prevstateno = 150
trigger2 = prevstateno = 151
persistent = 0
ignorehitpause = 1
time = 3
value = 255,255,255
under = 2

;---------------------[移動]
[state a]
type = posset
trigger1 = time = 0
y = 0


[State 600, 1]
type = velset
trigger1 = Time = 0
x = 0

[State 600, 1]
type = velset
trigger1 = animelem = 3
x = -5.7

[State 600, 1]
type = velset
trigger1 = animelem = 7
x = 0


;---------------------[ステート移行]
[State 200, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;---------------------------------------------------------------------------
;ダウン回避
[Statedef 702]
type = S
movetype = I
physics = N
poweradd= 0
ctrl = 0
anim = 702
velset = 0,0
sprpriority = 1

[State 700]
type = PlaySnd
trigger1 = animelem = 1
value = 850, 2

;---------------------[演出]
[State 700, 2];無敵の状態を作る
type = NotHitBy
trigger1 = 1
value = SCA

[state a]
type = playerpush
trigger1 = 1
value = 0

;---------------------[移動]
[state a]
type = posset
trigger1 = time = 0
y = 0

[State 600, 1]
type = velset
trigger1 = Time = 0
x = -12

[State 600, 1]
type = velset
trigger1 = animelem = 7
x = 0

[State 600, 1]
type = velmul
trigger1 = 1
x = 0.9


;---------------------[ステート移行]
[State 200, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1



;---------------------------------------------------------------------------
;C投
[Statedef 800]
type    = S
movetype= A
physics = S
juggle  = 0
velset = 0,0
ctrl = 0
anim = 800
sprpriority = 1

[State 800, 1]
type = HitDef
Trigger1 = Time = 0
Trigger1 = p2stateno != 150 && 151 && 152 && 153 && 130 && 131 && 140
attr = S, NT
hitflag = M-
priority = 1, Miss 
sparkno = -1
sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 801
p2stateno = 810
fall = 1
nochainID = 600,9999

;---------------------[ステート移行]
[State 800, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0

;---------------------------------------------------------------------------
;握斬?投げ
[Statedef 801]
type    = S
movetype= A
physics = N
anim = 801
sprpriority = 2

[state a]
type = varset
trigger1 = time = 0
v = 30
value = 0

;---------------------[演出]
[State a]
type = sprpriority
trigger1 = animelem = 3
value = -2

;---------------------[エフェクト]
[State explod];ヒット
type = Explod
trigger1 = animelem = 2
anim = 7080
id = 3000
sprpriority = -3
postype = p1
pos = 35,-83
bindtime = 1
supermove = 0
ignorehitpause = 0
under = 0

[State explod];ヒット
type = Explod
trigger1 = animelem = 7
anim = 7007
id = 3000
sprpriority = 5
postype = p1
pos = 35,-145
bindtime = 1
supermove = 0
ignorehitpause = 0
under = 0

[State explod];血
type = Explod
trigger1 = animelem = 7
anim = 805
id = 3000
sprpriority = 6
postype = p1
pos = 35,-145
bindtime = 1
supermove = 0
ignorehitpause = 0
under = 0


[State explod];ヒット
type = null;Explod
trigger1 = animelem = 9
anim = 7002
id = 3000
sprpriority = 5
postype = p1
pos = 70,-38
bindtime = 1
supermove = 0
ignorehitpause = 0
under = 0
;---------------------[サウンド]
[State 810, Grab Sound];
type = PlaySnd
trigger1 = animelem = 2
value = 420, 0

[State 810, Grab Sound];
type = PlaySnd
trigger1 = animelem = 7
value = 1300, 4

[State 810, Grab Sound];
type = PlaySnd
trigger1 = animelem = 7
value = 410, 1


;---------------------[相手制御]
[State 801, 2]
type = TargetBind
trigger1 = animelem = 1
pos = 28,0

[State 801, 2]
type = TargetBind
trigger1 = animelem = 2
pos = 24,0

[State 801, 2]
type = TargetBind
trigger1 = animelem = 3
pos = 35,-90

[State 801, 2]
type = TargetBind
trigger1 = animelem = 5
pos = 35,-131

[State 801, 2]
type = TargetBind
trigger1 = animelem = 6
pos = 32,-127

[State 801, 2]
type = TargetBind
trigger1 = animelem = 9
pos = 30,-125

[State 801, 2]
type = TargetBind
trigger1 = animelem = 10
pos = 44,-68


[State 801, 2]
type = Targetlifeadd
trigger1 = animelem = 7
value = -118


;---------------------[演出]
[State 210, Width];画面端の押し戻し判定
type = Width
trigger1 = 1
edge = 60,0

;---------------------[ステート移行]
[State 821, 3] 
type = changeState
trigger1 = animtime = 0
value = 0
ctrl = 1


;---------------------------------------------------------------------------
;(ENEMY)握斬?掴まれ
[Statedef 810]
type    = A
movetype= H
physics = N
velset = 0,0
sprpriority = -1

;---------------------[演出]
[State 700, 2];無敵の状態を作る
type = NotHitBy
trigger1 = 1
value = SCA

[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 810

[State 1];カメラ固定
type = screenbound
trigger1 = 1
value = 1
movecamera = 1

;---------------------[ステート移行]
[state a]
type = changestate
trigger1 = animtime = 0
value = 811

;---------------------------------------------------------------------------
;(ENEMY)握斬?落下
[Statedef 811]
type    = A
movetype= H
physics = N
velset = 0,0
sprpriority = -1

;---------------------[演出]
[State 700, 2];無敵の状態を作る
type = NotHitBy
trigger1 = 1
value = SCA

[State 820, 1]
type = ChangeAnim
Trigger1 = Time = 0
value = 5050

[State 1];カメラ固定
type = screenbound
trigger1 = 1
value = 1
movecamera = 1

;---------------------[速度]
[State 821, 1]
type = VelAdd
Trigger1 = 1
y = .55

;---------------------[ステート移行]
[State 821, 3] 
type = SelfState
triggerall = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100


;---------------------------------------------------------------------------
;D投
[Statedef 850]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 800
sprpriority = 1

;---------------------[攻撃]
[State 800, 1]
type = HitDef
Trigger1 = Time = 0
Trigger1 = p2stateno != 150 && 151 && 152 && 153 && 130 && 131 && 140
attr = S, NT
hitflag = M-
priority = 1, Miss 
sparkno = -1
sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 851
p2stateno = 860
fall = 1
nochainID = 600,9999

;---------------------[ステート移行]
[State 800, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0

;---------------------------------------------------------------------------
;握斬鬼?投げ
[Statedef 851]
type    = S
movetype= A
physics = N
anim = 851
sprpriority = 2

[state a]
type = varset
trigger1 = time = 0
v = 30
value = 0

;---------------------[演出]
[State a]
type = sprpriority
trigger1 = animelem = 3
value = -2

;---------------------[エフェクト]
[State explod];ヒット
type = Explod
trigger1 = animelem = 2
anim = 7080
id = 3000
sprpriority = -3
postype = p1
pos = 35,-83
bindtime = 1
supermove = 0
ignorehitpause = 0
under = 0

[State explod];ヒット
type = Explod
trigger1 = animelem = 7
anim = 7007
id = 3000
sprpriority = 5
postype = p1
pos = 35,-145
bindtime = 1
supermove = 0
ignorehitpause = 0
under = 0

[State explod];血
type = Explod
trigger1 = animelem = 7
anim = 805
id = 3000
sprpriority = 6
postype = p1
pos = 35,-145
bindtime = 1
supermove = 0
ignorehitpause = 0
under = 0


[State explod];ヒット
type = null;Explod
trigger1 = animelem = 9
anim = 7002
id = 3000
sprpriority = 5
postype = p1
pos = 70,-38
bindtime = 1
supermove = 0
ignorehitpause = 0
under = 0
;---------------------[サウンド]
[State 810, Grab Sound];
type = PlaySnd
trigger1 = animelem = 2
value = 420, 0

[State 810, Grab Sound];
type = PlaySnd
trigger1 = animelem = 7
value = 1300, 4

[State 810, Grab Sound];
type = PlaySnd
trigger1 = animelem = 7
value = 410, 1

[State 810, Grab Sound];
type = PlaySnd
trigger1 = animelem = 14
value = 850, 1

[State 810, Grab Sound];
type = PlaySnd
trigger1 = animelem = 15
value = 850, 2
;---------------------[相手制御]
[State 801, 2]
type = TargetBind
trigger1 = animelem = 1
pos = 28,0

[State 801, 2]
type = TargetBind
trigger1 = animelem = 2
pos = 24,0

[State 801, 2]
type = TargetBind
trigger1 = animelem = 3
pos = 35,-90

[State 801, 2]
type = TargetBind
trigger1 = animelem = 5
pos = 35,-131

[State 801, 2]
type = TargetBind
trigger1 = animelem = 6
pos = 32,-127

[State 801, 2]
type = TargetBind
trigger1 = animelem = 9
pos = 16,-134

[State 801, 2]
type = TargetBind
trigger1 = animelem = 10
trigger2 = animelem = 12
pos = 3,-133

[State 801, 2]
type = TargetBind
trigger1 = animelem = 11
pos = 7,-134

[State 801, 2]
type = TargetBind
trigger1 = animelem = 13
pos = -40,-85

[State 801, 2]
type = TargetBind
trigger1 = animelem = 14
pos = -46,-64


[State 801, 2]
type = Targetlifeadd
trigger1 = animelem = 7
value = -118

[state a]
type = turn
trigger1 = animtime = 0

;---------------------[演出]
[State 210, Width];画面端の押し戻し判定
type = Width
trigger1 = 1
edge = 60,0

;---------------------[ステート移行]
[State 821, 3] 
type = changeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;(ENEMY)握斬鬼?掴まれ
[Statedef 860]
type    = A
movetype= H
physics = N
velset = 0,0
sprpriority = -1

;---------------------[演出]
[State 700, 2];無敵の状態を作る
type = NotHitBy
trigger1 = 1
value = SCA

[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 860

[State 1];カメラ固定
type = screenbound
trigger1 = 1
value = 1
movecamera = 1

;---------------------[速度]
[state a]
type = velset
trigger1 = animelemtime(10) = 1
x = 14
y = 12

[state a]
type = velset
triggerall = Vel Y > 0
trigger1 = Pos Y >= 0
x = 2
y = 20


;---------------------[ステート移行]
[State 821, 3] 
type = SelfState
triggerall = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100


;---------------------------------------------------------------------------
; MAX発動
[Statedef 900]
type = S
ctrl = 0
anim = 900
velset = 0,0
movetype = I
physics = N
sprpriority = 1
poweradd = -1000

;---------------------[効果音]
[State 00];
type = PlaySnd
trigger1 = animelem = 3
value = 900,0

;---------------------[変数]
[state a]
type = varset
trigger1 = time = 0
v = 20
value = 900

;---------------------[演出]
[State a]
type = Explod
trigger1 = animelem = 4
anim = 6001
sprpriority = 3
postype = p1
pos = -20,-114
bindtime = 1
under = 0
ownpal = 1
supermovetime = 999

[State 1020, 4]
type = EnvShake
trigger1 = animelem = 4
time = 10
ampl = -5
freq = 95
phase = 95

;---------------------[ステート移行]
[State 195, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; クイックMAX
[Statedef 901]
type = S
ctrl = 0
anim = 901
velset = 0,0
movetype = I
physics = N
sprpriority = 1
poweradd = -2000

;---------------------[効果音]
[State 00];
type = PlaySnd
trigger1 = time = 0
value = 900,1

;---------------------[変数]
[state a]
type = varset
trigger1 = time = 0
v = 20
value = 900

;---------------------[演出]


;---------------------[ステート移行]
[State 195, 2]
type = ChangeState
trigger1 = Time = 0
value = 0
ctrl = 1


;---------------------------------------------------------------------------
;(ENEMY)吹き飛び
[Statedef 996]
type    = A
movetype= H
physics = N
sprpriority = 1
velset = 0,0

[State 700, 2];無敵の状態を作る
type = NotHitBy
trigger1 = 1
value = SCA

[State 820, 1]
type = ChangeAnim
Trigger1 = Time = 0
value = 5050

[State 821, 3] 
type = changeState
trigger1 = time >= GetHitVar(hitshaketime)
value = 997

;---------------------------------------------------------------------------
;(ENEMY)吹き飛び
[Statedef 997]
type    = A
movetype= H
physics = N
sprpriority = 1
velset = -6,-5

[State 700, 2];無敵の状態を作る
type = NotHitBy
trigger1 = 1
value = SCA

[State 820, 1]
type = ChangeAnim
Trigger1 = Time = 0
value = 5050

[State 821, 1]
type = VelAdd
Trigger1 = time != 0
y = .51

[State 821, 3] 
type = changeState
triggerall = Vel Y > 0
trigger1 = Pos Y >= 0
value = 998

;---------------------------------------------------------------------------
;(ENEMY)滑り
[Statedef 998]
type    = S
movetype= H
physics = N
velset = -9,0
sprpriority = 1

[State 1027, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 0
value = F7,2

[state a]
type = posset
trigger1 = time = 0
y = 0

[state a]
type = velmul
trigger1 = 1
x = 0.85

[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 998

[State 821, 3] 
type = changestate
trigger1 = time = 20
value = 999


;---------------------------------------------------------------------------
;(ENEMY)ダウン
[Statedef 999]
type    = A
movetype= H
physics = N
velset = 0,0
sprpriority = 1

[State 820, 1]
type = ChangeAnim
Trigger1 = Time = 0
value = 5110

[State 1];カメラ固定
type = screenbound
trigger1 = 1
value = 1
movecamera = 1


[State 821, 3] 
type = ChangeState
trigger1 = time = 15
value = 5111 
