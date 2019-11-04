;=================================================================================
;State0代替
;=================================================================================
[Statedef 1]
type = S
physics = N
sprpriority = 0
velset = 0,0

[State -2,防止乱转向]
type = AssertSpecial
trigger1 = EnemyNear,StateType = A
trigger1 = EnemyNear,Pos Y < -40
trigger1 = EnemyNear,MoveType = H
trigger1 = EnemyNear,Ctrl = 0
trigger1 = EnemyNear,BackEdgeBodyDist <= 0 || EnemyNear,FrontEdgeBodyDist <= 0
flag = NoAutoTurn

[State 1]
type = ChangeState
Trigger1 = RoundState != 2
Trigger2 = P2BodyDist x < 0
value = 0
Ctrl = 1
ignorehitpause = 1

[State -3,STOP]
type = StopSnd
trigger1 = prevstateno = [191,194]
trigger1 = roundstate = 2
channel = 0

[State -3,STOP]
type = StopSnd
trigger1 = prevstateno = [191,194]
trigger1 = roundstate = 2
channel = 1

[State 0, 1]
type = ChangeAnim
trigger1 = Anim != 0 && Anim != 5
trigger2 = Anim = 5 && AnimTime = 0 ;Turn anim over
value = 0

[State 0, 2]
type = VelSet
trigger1 = Time = 0
y = 0

[State 0, 3] ;Stop moving if low velocity or 4 ticks pass
type = VelSet
trigger1 = abs(vel x) < 2
trigger2 = Time = 4
trigger3 = Time = 0
x = 0

[State 0, 4] ;Are you dead?
type = ChangeState
trigger1 = !alive
value = 5050 + 100*((Anim = 5120) || (Anim = 5150))

;=================================================================================
;AI用前行
;=================================================================================
[Statedef 19]
type    = S
physics = S
velset = 0,0
sprpriority = 0

[State -2,防止乱转向]
type = AssertSpecial
trigger1 = EnemyNear,StateType = A
trigger1 = EnemyNear,Pos Y < -40
trigger1 = EnemyNear,MoveType = H
trigger1 = EnemyNear,Ctrl = 0
trigger1 = EnemyNear,BackEdgeBodyDist <= 0 || EnemyNear,FrontEdgeBodyDist <= 0
flag = NoAutoTurn

[State 21, 1]
Type = Turn
trigger1 = EnemyNear,MoveType != H
Trigger1 = P2Dist X < 0

[State 20, 1]
type = VelSet
trigger1 = 1
x = const(velocity.walk.fwd.x)

[State 20, 3]
type = ChangeAnim
triggerall = vel x > 0
trigger1 = Anim != 20 && Anim != 5
trigger2 = Anim = 5 && AnimTime = 0
value = 20

[State 19, Exit]
type = ChangeState
TriggerAll = Time >= 16
Trigger1 = RoundState != 2
Trigger1 = var(50) := 1111901
;
Trigger2 = EnemyNear,Ctrl
Trigger2 = P2BodyDist X <= 80
Trigger2 = var(50) := 1111902
;
Trigger3 = frontedgebodydist <= 20
Trigger3 = var(50) := 1111903

Trigger4 = InGuardDist
Trigger4 = EnemyNear,facing != facing
Trigger4 = var(50) := 1111904

Trigger5 = Time >= 120
Trigger5 = var(50) := 1111905

Trigger6 = EnemyNear,facing = facing 
Trigger6 = var(50) := 1111906

;为打起身做准备
Trigger7 = EnemyNear,StateType = L
Trigger7 = !EnemyNear,Ctrl
Trigger7 = P2BodyDist x <= 80
Trigger7 = var(50) := 1111907

Trigger8 = EnemyNear,StateType != L
Trigger8 = EnemyNear,MoveType = H
Trigger8 = P2BodyDist X <= 5
Trigger8 = var(50) := 1111908

value = ifelse(var(59)=0,0,1)
ctrl = ifelse(var(59)=0,1,0)

;=================================================================================
;AI用后退
;=================================================================================
[Statedef 18]
type    = S
physics = S
velset = 0,0
sprpriority = 0
ctrl = 0


[State 22, 1]
Type = Turn
Trigger1 = P2Dist X < 0

[State 20, 2]
type = VelSet
Trigger1 = 1
x = const(Velocity.walk.back.x)

[State 20, 4]
type = ChangeAnim
TriggerAll = Vel x < 0
Trigger1 = Anim != 21 && Anim != 5
Trigger2 = Anim = 5 && AnimTime = 0
value = 21

[State 18, Exit]
type = ChangeState
Trigger1 = RoundState != 2
Trigger1 = var(50) := 1111801

Trigger2 = InGuardDist
Trigger2 = EnemyNear,facing != facing
Trigger2 = var(50) := 1111802

Trigger3 = Time >= 120
Trigger3 = var(50) := 1111803

Trigger4 = P2BodyDist X >= 180
Trigger4 = var(50) := 1111804

Trigger5 = BackEdgeBodyDist <= 20
Trigger5 = var(50) := 1111805

Trigger6 = EnemyNear,MoveType = A || EnemyNear,Ctrl
Trigger6 = EnemyNear,facing = facing 
Trigger6 = var(50) := 1111806
;为打起身做准备
Trigger7 = Time >= 12
Trigger7 = EnemyNear,StateType = L
Trigger7 = !EnemyNear,Ctrl
Trigger7 = P2BodyDist x >= 60

value = ifelse(var(59)=0,0,1)
ctrl = ifelse(var(59)=0,1,0)

;=================================================================================
;起跳
;=================================================================================
[Statedef 39]
type = S
physics = S
ctrl = 0
velset = 0,0
facep2 = 1
sprpriority = 1

[State 39]
type = NotHitBy
trigger1 = Time = 0
value = ,AT
time = 4

[State 40, ChangeAnim]
type = ChangeAnim
trigger1 = !time
value = 40

[State 40, 1]
type = VarSet
trigger1 = Time = 0
sysvar(1) = 0

[State 40, 2]
type = VarSet
trigger1 = var(4) = [1,4]
sysvar(1) = 1

[State 40, 3]
type = VarSet
trigger1 = var(59) = 0
trigger1 = var(4) = [5,6]
sysvar(1) = -1


[State 40, 6]
type = VelSet
triggerall = AnimTime = 0
trigger1 = var(4) = 1
x = const(velocity.jump.fwd.x)
y = -6.35

[State 40, 6]
type = VelSet
triggerall = AnimTime = 0
trigger1 = var(4) = 2
x = const(velocity.runjump.fwd.x)
y = -6.35

[State 40, 6]
type = VelSet
triggerall = AnimTime = 0
trigger1 = var(4) = 3
x = const(velocity.jump.fwd.x)
y = const(velocity.jump.y)

[State 40, 6]
type = VelSet
triggerall = AnimTime = 0
trigger1 = var(4) = 4
x = const(velocity.runjump.fwd.x)
y = const(velocity.jump.y)

[State 40, 6]
type = VelSet
triggerall = AnimTime = 0
trigger1 = var(4) = 5
x = const(velocity.jump.back.x)
y = -6.35

[State 40, 6]
type = VelSet
triggerall = AnimTime = 0
trigger1 = var(4) = 6
x = const(velocity.jump.back.x)
y = const(velocity.jump.y)

[State 40, 6]
type = VelSet
triggerall = AnimTime = 0
trigger1 = var(4) = 7
x = 0
y = -6.35

[State 40, 6]
type = VelSet
triggerall = AnimTime = 0
trigger1 = var(4) = 8
x = 0
y = const(velocity.jump.y)

[State 40, 5]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = prevstateno = 99
trigger1 = sysvar(1) = 1
x = const(velocity.runjump.fwd.x)

[State 191,]
type = PlaySnd
trigger1 = AnimTime = 0
trigger1 = prevstateno = 99 ;RUN_FWD
trigger1 = sysvar(1) = 1
trigger1 = Alive
value = s3,2
channel = 4

[State 191,]
type = PlaySnd
triggerall = time = 0
triggerall = Alive
trigger1 = prevstateno != 99
value = s3,1
channel = 4


[State 40, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;=================================================================================
;AI用前跑
;=================================================================================
[Statedef 99]
type    = S
physics = S
anim = 100
sprpriority = 1
ctrl = 0

[State 30000]
type = Explod
trigger1 = time = 2
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

[State 100, 1]
type = VelSet
trigger1 = AnimElemtime(2) >= 0
x = const(velocity.run.fwd.x)

[State 191,]
type = PlaySnd
triggerall = time = 0
trigger1 = Alive
value = s3500,6
channel = 6

[State 191,]
type = PlaySnd
triggerall = gametime%15 = 0
trigger1 = Alive
value = s3500,6
channel = 6

[State 100,]
type = StopSnd
trigger1 = Anim != 100
channel = 6

[State 100, 2] ;Prevent run from canceling into walk
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 100, 3] ;Prevent from turning
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 101, 6]
type = ChangeState
TriggerAll = EnemyNear,StateNo != 116110
TriggerAll = EnemyNear,StateNo != 1473
TriggerAll = EnemyNear,StateNo != 5040
Trigger1 = time >= 16
Trigger1 = AnimTime = 0
Trigger1 = var(50) := 1119901
;对方可控的情况下，不要跑太近
Trigger2 = P2BodyDist X <= 55
Trigger2 = P2BodyDist Y >= -120
Trigger2 = EnemyNear,MoveType != H && (EnemyNear,Ctrl || EnemyNear,StateNo < 200)
Trigger2 = EnemyNear,facing != facing || P2BodyDist X < 0
Trigger2 = var(50) := 1119902

Trigger3 = time >= 16
Trigger3 = EnemyNear,StateType = L
Trigger3 = P2BodyDist X < 55
Trigger3 = var(50) := 1119903

Trigger4 = time >= 16
Trigger4 = InGuardDist
Trigger4 = EnemyNear,facing != facing
Trigger4 = var(50) := 1119904

Trigger5 = time >= 16
Trigger5 = !EnemyNear,Ctrl && EnemyNear,MoveType = I
Trigger5 = P2BodyDist x < 20
Trigger5 = var(50) := 1119905

Trigger6 = EnemyNear,MoveType = H
Trigger6 = EnemyNear,StateNo >= 5000
Trigger6 = P2BodyDist x <= ifelse(EnemyNear,StateNo = 5040, 45, 10)
Trigger6 = var(50) := 1119906
value = 1








































































[Statedef -3]

;---------------------------------------------------------------------------------
;BC重置
;---------------------------------------------------------------------------------
[State -3,]
type = VarSet
trigger1 = RoundState < 2
var(20) = 0


;---------------------------------------------------------------------------------
;跳跃挤压处理
;拳皇体积框只到胸口位置，这里需要计算下
;---------------------------------------------------------------------------------
[State -3,]
type = PlayerPush
trigger1 = P2BodyDist x < 35
trigger1 = StateType = A
trigger1 = EnemyNear,StateType != A
trigger1 = P2BodyDist Y >= 20
Trigger1 = EnemyNear,MoveType != H
value = 0


;---------------------------------------------------------------------------------
;版边处理
;---------------------------------------------------------------------------------
[State -3, noautoturn]
type = AssertSpecial
trigger1 = BackEdgeBodyDist < 23
flag = noautoturn

[State -3,]
type = PosAdd
trigger1 = EnemyNear,MoveType = H 
trigger1 = EnemyNear,StateType = A
trigger1 = FrontEdgeBodyDist <= 0
value = 5

;---------------------------------------------------------------------------------
;手操跳跃相关,包括连跳
;---------------------------------------------------------------------------------
[State -3]
type = VarSet
trigger1 = var(59) = 0
trigger1 = command = "jump"
trigger1 = ctrl
trigger1 = statetype = S
var(3) = 1

[State -3]
type = VarSet
trigger1 = var(59) = 0
trigger1 = Var(3) = 1
trigger1 = stateno = 40
trigger1 = AnimTime = 0
var(3) = ifelse(sysvar(1)=0, 2, ifelse(sysvar(1)=1, 3, 4))

[State -3]
type = VarSet
trigger1 = var(59) = 0
triggerall = Time = 2
trigger1 = stateno = 50
trigger2 = stateno != [40,59]
var(3) = 0

[State -3]
type = VelAdd
trigger1 = var(59) = 0
trigger1 = var(3) = 3
trigger1 = stateno = 50
x = 2

[State -3]
type = VelAdd
trigger1 = var(59) = 0
trigger1 = var(3) = 4
trigger1 = stateno = 50
x = -2.1

[State -3]
type = VarSet
triggerall = var(59) = 0
trigger1 = Var(3) != 0
trigger2 = prevstateno = 100
trigger2 = AnimTime = 0
v = 2
value = 1

[State -3]
type = VarSet
trigger1 = statetype != A
trigger1 = stateno != 40
var(2) = 0

[State -3, Afterimage]
type = Afterimage
trigger1 = var(3) >= 1
trigger1 = stateno = 50
trigger2 = AnimTime = 0
trigger2 = prevstateno = 100
trigger2 = sysvar(1) = 1
trigger3 = var(4) = 2 || var(4) = 4
time = 2
length = 7
PalBright = 0,0,0
PalContrast = 256,256,256
PalAdd = 0,0,0
PalMul = 1,1,1
FrameGap = 3

[State -3, Afterimagetime]
type = Afterimagetime
triggerall = Stateno != 0
triggerall = StateNo != 1
trigger1 = stateno = 50
trigger1 = time%2 = 0
trigger2 = var(59)
trigger2 = Var(4) = 2 || var(4) = 4 
trigger2 = time%2 = 0
time = 2

;---------------------------------------------------------------------------------
;闪光用
;---------------------------------------------------------------------------------
[State -3, palfx]
type = palfx
trigger1 = gethitvar(chainid) = 17000 && time%2 = 0 && movetype=h && (stateno!=[120,160]) && (StateNo !=[5100,5460])&& Stateno != [20,21]
time = 1
add = 0,15,75
color = 0
invertall = 1
ignorehitpause = 1
































;=================================================================================
;AI Helper
;=================================================================================
[State -3]
type = Helper
Trigger1 = !numHelper(33000)
Helpertype = normal
name = "AIconfig"
ID = 33000
StateNo=33000
PosType = p1
Pos = 0,0
facing = -1
Ownpal = 1
IgnoreHitPause = 1
pausemovetime=2147483647
supermovetime=2147483647
SprPriority = 7
persistent = 0

[State -3]
type=ChangeState
Trigger1= isHelper(33000)
Trigger1= StateNo!=33000
value=33000

[State -3]
type = Helper
Trigger1 = !numHelper(33001)
Helpertype = normal
name = "AI Right"
ID = 33001
StateNo=33001
Postype = p1
Facing = 1
Pausemovetime = 0
Persistent = 0
Ignorehitpause = 1
KeyCtrl = 0
Ownpal = 1

[State -3]
type=ChangeState
Trigger1= isHelper(33001)
Trigger1= StateNo!=33001
value=33001

[State -3]
type = Helper
Trigger1 = !numHelper(33002)
Helpertype = normal
name = "AI left"
ID = 33002
StateNo=33002
Postype = p1
Facing = -1
Pausemovetime = 0
Persistent = 0
Ignorehitpause = 1
KeyCtrl = 0
Ownpal = 1

[State -3]
type=ChangeState
Trigger1= isHelper(33002)
Trigger1= StateNo!=33002
value=33002

[State -3, AI]
type=Helper
TriggerAll =!isHelper
Trigger1=!NumHelper(11990)
Helpertype=normal
name="Distance"
StateNo=11990
ID=11990
pos=50,0
postype=p1
keyCtrl=0
pausemovetime=2147483647
supermovetime=2147483647
persistent = 0
Ignorehitpause = 1

[State -3]
type=ChangeState
Trigger1= isHelper(11990)
Trigger1= StateNo!=11990
value=11990


[state -3, AI Detect Projectile System]
type = Helper
Trigger1 = !numHelper(33333333)
name = "AI Detect Projectile System"
ID = 33333333
StateNo = 33333333
postype = p1
ownpal = 1
keyCtrl = 0
size.xscale = 1.0
size.yscale = 1.0
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

;---------------------------------------------------------------------------------
;挑衅
;---------------------------------------------------------------------------------
[State -3]
type = ChangeState
TriggerAll = EnemyNear,Alive = 0
TriggerAll = WinKo
TriggerAll = RoundState = 3
TriggerAll = StateType != A
Trigger1 = var(11) = 1
Trigger1 = EnemyNear,StateNo = 177200 && EnemyNear,AnimTime < -160
Value = 195
;---------------------------------------------------------------------------------
;死界鞭尸
;---------------------------------------------------------------------------------
[State -3]
type = ChangeState
TriggerAll = EnemyNear,Alive = 0
TriggerAll = WinKo
TriggerAll = RoundState = 3
TriggerAll = StateType != A
TriggerAll = EnemyNear,StateNo != 177200
Trigger1 = var(1) = [1,3]
trigger2 = stateno = 205
trigger3 = stateno = 210
trigger4 = stateno = 215 
trigger5 = stateno = 235
trigger6 = stateno = 245 
trigger7 = stateno = 400
trigger8 = stateno = 410 
trigger9 = stateno = 430
trigger10 = stateno = 440
trigger11 = stateno = 315
trigger12 = stateno = 1155 && AnimElemtime(1) >= 0 && AnimElemtime(2) < 0
trigger13 = stateno = 1405 && AnimElemtime(4) >= 0 && AnimElemtime(5) < 0
trigger14 = stateno = 1900 && AnimElemtime(4) >= 0 && AnimElemtime(6) < 0 
trigger15 = stateno = 1950 && AnimElemtime(4) >= 0 && AnimElemtime(6) < 0 
trigger16 = stateno = 1905 && AnimElemtime(1) >= 0 && AnimElemtime(5) < 0 
trigger17 = stateno = 2110 && AnimElemtime(7) >= 0 && AnimElemtime(11) < 0 
trigger18 = stateno = 2111 && AnimElemtime(7) >= 0 && AnimElemtime(11) < 0 
trigger19 = stateno = 2112 && AnimElemtime(7) >= 0 && AnimElemtime(11) < 0 
trigger20 = stateno = 2200 && AnimElemtime(21) >= 0 && AnimElemtime(23) < 0 
trigger21 = stateno = 320 && AnimElemtime(2) >= 0 && AnimElemtime(4) < 0 
trigger22 = stateno = 100
trigger23 = stateno = 1460
trigger24 = stateno = 2315
trigger25 = stateno = 2305
value = 3560

;---------------------------------------------------------------------------------
;AI Start
;---------------------------------------------------------------------------------
[State -3]
type = varset
Trigger1 = RoundState = 2 && EnemyNear,alive && EnemyNear,life > 0
;Trigger1 = movehit
var(59) = 1
IgnoreHitPause = 1

[State -3]
type = varset
Trigger1 = RoundState != 2 || EnemyNear,life = 0 || !EnemyNear,alive
var(59) = 0
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;计算敌方X方向速度
;---------------------------------------------------------------------------------
[State -3]
type = varset
Trigger1 = !MoveContact
Trigger1 = fvar(37) != EnemyNear,Vel x
fvar(37) = EnemyNear,Vel x
ignorehitpause = 1

[State -3]
type = varset
Trigger1 = facing = -1
Trigger1 = MoveContact
Trigger1 = fvar(37) != EnemyNear,gethitvar(xVel)
fvar(37) = EnemyNear,gethitvar(xVel)
ignorehitpause = 1


[State -3]
type = varset
Trigger1 = facing = 1
Trigger1 = MoveContact
Trigger1 = fvar(37) != -(EnemyNear,gethitvar(xVel))
fvar(37) = -(EnemyNear,gethitvar(xVel))
ignorehitpause = 1

;---------------------------------------------------------------------------------
;计算敌方重力加速度
;---------------------------------------------------------------------------------
[State -3]
type = varset
Trigger1 = !MoveContact
Trigger1 = EnemyNear,StateType = A
fvar(38) = EnemyNear,const(movement.yaccel)
ignorehitpause = 1

[State -3]
type = varset
Trigger1 = MoveContact
Trigger1 = EnemyNear,StateType = A
fvar(38) = EnemyNear,gethitvar(yaccel)
ignorehitpause = 1

[State -3]
type = varset
Trigger1 = MoveContact
Trigger1 = EnemyNear,StateType != A
fvar(38) = 0
ignorehitpause = 1

;---------------------------------------------------------------------------------
;计算敌人落地时间
;---------------------------------------------------------------------------------
[State -3, ];t=(-v0+√(v0^2-2a(x0-x)))/a
type = VarSet
trigger1= 1
;fvar(9)= (-vel y+(vel y**2-2*const(movement.yaccel)*ifelse(pos y>0,0,pos y-0))**.5)/const(movement.yaccel)
fvar(11)= (-EnemyNear,vel y+(EnemyNear,vel y**2-2*fvar(38)*ifelse(EnemyNear,pos y>0,0,EnemyNear,pos y-0))**.5)/fvar(38)
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;计算自己落地时间
;---------------------------------------------------------------------------------
[State -3, 落地时间];t=(-v0+√(v0^2-2a(x0-x)))/a
type = VarSet
trigger1= 1
;fvar(9)= (-vel y+(vel y**2-2*const(movement.yaccel)*ifelse(pos y>0,0,pos y-0))**.5)/const(movement.yaccel)
fvar(9)= (-vel y+(vel y**2-2*const(movement.yaccel)*ifelse(pos y>0,0,pos y-0))**.5)/const(movement.yaccel)
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;可控判别
;---------------------------------------------------------------------------------
[State -3]
type = VarSet
trigger1 = 1
var(11) = 0
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;可控状态
[State -3]
type = VarSet
TriggerAll = StateType != A 
trigger1 = Ctrl || StateNo = 1 || StateNo = 18 || StateNo = 19 || (StateNo = [120,149]) || StateNo = 99 || (StateNo = [10,12]) 
trigger2 = (StateNo = 52 && AnimTime = 0) 
trigger3 = StateNo = 901
var(11) = 1
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;普通技能取消条件
[State -3]
type = VarSet
trigger1 = StateNo = 205 && AnimElemTime(2) >= 1
trigger2 = StateNo = 235 && AnimElemTime(4) >= 1
trigger3 = StateNo = 215 && AnimElemTime(2) >= 1
trigger4 = StateNo = 245 && AnimElemTime(3) >= 1

trigger5 = StateNo = 200 && AnimElemTime(2) >= 1
trigger6 = StateNo = 210 && AnimElemTime(4) >= 1

trigger7 = StateNo = 430 && AnimElemTime(2) >= 1
trigger8 = StateNo = 400 && AnimElemTime(2) >= 1
trigger9 = StateNo = 410 && AnimElemTime(3) >= 1 
var(11) = 2
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;特殊技取消条件
[State -3]
type = VarSet
trigger1 = StateNo = 320 && AnimElemTime(2) >= 1
trigger2 = StateNo = 315 && AnimElemTime(4) >= 1
var(11) = 3
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;上一次的EX技能
;---------------------------------------------------------------------------------
[State -3]
type = VarSet
TriggerAll = var(43) != 0
Trigger1 = EnemyNear,MoveType != H
Trigger2 = EnemyNear,Ctrl
var(43) = 0

;---------------------------------------------------------------------------------
;跳跃控制
;---------------------------------------------------------------------------------

[State -3]
type = varset
Trigger1 = 1
var(44) = 0

[State -3]
type = Null;varadd
Trigger1 = var(44) > 0
var(44) = -1

[State -3]
type = Null;varadd
TriggerAll = EnemyNear,MoveHit = 1
Trigger1 = helper(33000),var(13) = 50
Trigger2 = helper(33000),var(13) = [600,650] 
Trigger3 = helper(33000),var(13) = 52
Trigger4 = helper(33000),var(13) = 39
var(44) = 90 + EnemyNear,GetHitVar(damage)

;---------------------------------------------------------------------------------
;立回控制
;---------------------------------------------------------------------------------
[State -3]
type = varadd
Trigger1 = var(46) > 0
var(46) = -1
ignorehitpause = 1

;=================================================================================
;抢招9
;=================================================================================
[State -3,EX升龙]
type = ChangeState
TriggerAll = var(59)
TriggerAll = var(11) = 1
Triggerall = StateType != A
Triggerall = Power >= 500
Triggerall = EnemyNear,Life < 130 || Power >= 3000
TriggerAll = !EnemyNear,NumProj && !PlayerIdExist(Helper(33333333),var(3))
;抢地面招式
trigger1 = P2BodyDist x = [-5, 40]
Trigger1 = EnemyNear,StateType != A
Trigger1 = EnemyNear,MoveType = A
Trigger1 = EnemyNear,StateNo < 1000
Trigger1 = EnemyNear,StateNo = Helper(33000),var(2)
trigger1 = enemynear,time < helper(33000),var(3)
Trigger1 = var(50) := 195591
;对空
Trigger2 = EnemyNear,StateType = A
Trigger2 = EnemyNear,StateNo != 5040
trigger2 = P2BodyDist x = [-5, 40]
trigger2 = EnemyNear,pos y = [-35, -10]
Trigger2 = var(50) := 195592
;取消
Trigger3 = Var(20) = 0
Trigger3 = EnemyNear,MoveType = H && EnemyNear,StateNo >= 5000 && !EnemyNear,Ctrl
Trigger3 = StateNo = 1405 && MoveHit
value = 1955

[State -3,CL HP]
type = ChangeState
value  = 215
TriggerAll = var(59)
triggerall = p2bodydist X < 24
TriggerAll = var(11) = 1
Triggerall = StateType != A
TriggerAll = Random < 200
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,StateNo < 1000
TriggerAll = EnemyNear,StateNo = Helper(33000),var(2)
triggerAll = enemynear,time < helper(33000),var(3) - 3
;对地
Trigger1 = EnemyNear,StateType = S
Trigger1 = P2BodyDist x - fvar(37) * 3 < 40 
Trigger1 = var(50) := 21591
IgnoreHitPause = 1

[State -3,CR LP]
type = ChangeState
value = 400
TriggerAll = var(59)
TriggerAll = var(11) = 1
Triggerall = StateType != A
TriggerAll = Random < 200
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,Vel x = [0,2.8]
TriggerAll = EnemyNear,StateNo < 1000
TriggerAll = EnemyNear,StateNo = Helper(33000),var(2)
triggerAll = enemynear,time < helper(33000),var(3) - 1
;对地
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - fvar(37) * 3 < 41 
Trigger1 = var(50) := 40091
IgnoreHitPause = 1

[State -3,CR LK]
type = ChangeState
value = 430
TriggerAll = var(59)
TriggerAll = var(11) = 1
Triggerall = StateType != A
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,StateNo < 1000
TriggerAll = EnemyNear,StateType != A
TriggerAll = EnemyNear,Vel x = [0,2.8]
TriggerAll = P2BodyDist x < 51 
;对地
Trigger1 = EnemyNear,StateNo = Helper(33000),var(2)
trigger1 = enemynear,time < helper(33000),var(3) - 1
Trigger1 = var(50) := 43091
;对地
Trigger2 = EnemyNear,StateType = S
Trigger2 = EnemyNear,Time < 2
trigger2 = EnemyNear,AnimTime < -21
Trigger2 = var(50) := 43092
;没记录就直接抢
Trigger3 = P2BodyDist x > 40
Trigger3 = EnemyNear,StateNo != Helper(33000),var(2)
trigger3 = EnemyNear,time < 2
Trigger3 = var(50) := 43093
IgnoreHitPause = 1

[State -3,CL LK]
type = ChangeState
value = 235
TriggerAll = var(59)
TriggerAll = var(11) = 1
Triggerall = StateType != A
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,StateNo < 1000
TriggerAll = EnemyNear,StateNo = Helper(33000),var(2)
triggerAll = enemynear,time < helper(33000),var(3) - 7
Triggerall = P2BodyDist X<= 14
;对地
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - fvar(37) * 7 < 51 
Trigger1 = var(50) := 23591
IgnoreHitPause = 1


[State -3,CL LP]
type = ChangeState
value = 205
TriggerAll = var(59)
TriggerAll = var(11) = 1
Triggerall = StateType != A
TriggerAll = Random < 200
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,StateNo < 1000
TriggerAll = EnemyNear,StateNo = Helper(33000),var(2)
triggerAll = enemynear,time < helper(33000),var(3) - 2
triggerall = p2bodydist X < 18
;对地
Trigger1 = EnemyNear,StateType = S
Trigger1 = P2BodyDist x - fvar(37) * 3 < 35 
Trigger1 = var(50) := 20591
IgnoreHitPause = 1

[State -3,88]
type = ChangeState
value = 320
TriggerAll = var(59)
TriggerAll = var(11) = 1
Triggerall = StateType != A
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,StateNo < 1000
TriggerAll = EnemyNear,StateNo = Helper(33000),var(2)
triggerAll = enemynear,time < helper(33000),var(3) - 2
triggerall = p2bodydist X < 75
;对地
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - fvar(37) * 3 < 80 
Trigger1 = var(50) := 32091
IgnoreHitPause = 1

;=================================================================================
;抓硬直8
;=================================================================================

;------------------------------------------------------------------------------------------------
;版边44奈落，为3重奈落准备
;原人物State52无硬直，Time=1即可切到下个动作
;------------------------------------------------------------------------------------------------
[State -3]
type = ChangeState
TriggerAll = var(59)
TriggerAll = StateNo = 52
TriggerAll = !InGuardDist
TriggerAll = EnemyNear,StateType != L
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000
TriggerAll = var(50) != 33036
Trigger1 = BackEdgeBodyDist < 25 || FrontEdgeBodyDist < 25
Trigger1 = P2BodyDist x < 30
Trigger1 = EnemyNear,GetHitVar(HitTime) >= 9
value = 105


[State -3,小跳]
type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = EnemyNear,StateType != L
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000
;优先前跳接奈落
Trigger1 = EnemyNear,StateNo >= 5000
Trigger1 = var(11) = 1 || StateNo = 52 || StateNo = 901
Trigger1 = var(20) = 0 || var(20) > 890 || Helper(33000),var(14) != 330 || var(50) = 33036
Trigger1 = EnemyNear,StateType != C
Trigger1 = P2BodyDist x < 80
Trigger1 = EnemyNear,GetHitVar(HitTime) >= 13
Trigger1 = var(4) := ifelse(P2BodyDist x < 45,1,2)
Trigger1 = var(50) := 3981
value = 39


[State -3,前行抓硬直]
type = ChangeState
TriggerAll = var(59)
TriggerAll = var(11) = 1
TriggerAll = StateNo != 99
TriggerAll = StateType != A
TriggerAll = !PlayerIdExist(Helper(33333333),var(3)) || abs(PlayerId(Helper(33333333),var(3)),pos x - pos x) > 80 
;抓出招硬直
Trigger1 = EnemyNear,StateNo = [200,4999]
Trigger1 = EnemyNear,StateType != L
Trigger1 = !InGuardDist || EnemyNear,Facing = Facing
Trigger1 = EnemyNear,MoveType = A || EnemyNear,MoveType = I
Trigger1 = EnemyNear,AnimTime < -6
Trigger1 = P2BodyDist X > 0
Trigger1 = var(50) := 009981
;抓5700
Trigger2 = EnemyNear,StateNo = 5700
Trigger2 = P2BodyDist X > 0
Trigger2 = var(50) := 009982
;前行贴近抓防御硬直
Trigger3 = !InGuardDist
Trigger3 = EnemyNear,MoveType = H
Trigger3 = EnemyNear,StateNo >= 5000 || Enemynear,StateNo = [150,159]
Trigger3 = EnemyNear,GetHitVar(HitTime) >= 6
Trigger3 = P2BodyDist X > 0
Trigger3 = var(50) := 009983
value = ifelse(P2BodyDist x >= 45, 99, 19)
IgnoreHitPause = 1

[State -3,普通抓硬直]
type = ChangeState
TriggerAll = var(59) 
TriggerAll = !inguarddist || EnemyNear,Facing = Facing || (EnemyNear,StateNo >= 1000 && EnemyNear,AnimTime >= -15)
TriggerAll = !(EnemyNear,StateNo = [0,29]) && !(EnemyNear,StateNo = [90,109]) 
TriggerAll = EnemyNear,StateNo <= 4999
TriggerAll = EnemyNear,MoveType = A || EnemyNear,MoveType = I 
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateType != L
TriggerAll = !(EnemyNear,StateNo >= 5000 && EnemyNear,MoveType = I)
TriggerAll = StateType != A 
TriggerAll = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
TriggerAll = EnemyNear,Time > 8 || EnemyNear,Facing = Facing
TriggerAll = !PlayerIdExist(Helper(33333333),var(3)) || abs(PlayerId(Helper(33333333),var(3)),pos x - pos x) > 50 
TriggerAll = EnemyNear,Vel x < 2.8
;近立Y/近立B
Trigger1 = var(11) = 1 
Trigger1 = EnemyNear,StateType = S
Trigger1 = EnemyNear,animtime < -4
Trigger1 = EnemyNear,StateNo < 1000 || EnemyNear,AnimTime = [-9, -5]
Trigger1 = P2BodyDist x = [-24, 24]
Trigger1 = var(54) := ifelse(Power>=1000&&Random<300,245,215)
Trigger1 = var(50) := 021571
;蹲A
Trigger2 = var(11) = 1 || (StateNo = 430 && AnimElemTime(2) > 0)||(StateNo = 400 && AnimElemTime(2) > 0)
Trigger2 = P2BodyDist x = [-50, 50]
Trigger2 = (EnemyNear,animtime = [-6,-3]) || (P2BodyDist x < 15 && EnemyNear,AnimTime <= -3)
Trigger2 = var(54) := 430
Trigger2 = var(50) := 043071
value = var(54)

;---------------------------------------------------------------------------------
;目前统一用蹲轻脚抓
;其他的以后再酌情放开
;---------------------------------------------------------------------------------
[State -3,抓空中落地]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = var(11) = 1
TriggerAll = StateType != A 
TriggerAll = P2BodyDist x >= 0
TriggerAll = EnemyNear,StateNo <= 5000 && EnemyNear,MoveType != H
TriggerAll = !EnemyNear,NumProj && !PlayerIdExist(Helper(33333333),var(3))
TriggerAll = !inguarddist
Triggerall = EnemyNear,StateNo != 5040
TriggerAll = !(EnemyNear,StateNo >= 5000 && EnemyNear,MoveType = I)
TriggerAll = EnemyNear,Facing != Facing
;蹲b非版边
Trigger1 = BackEdgeBodyDist >= 10
Trigger1 = fvar(11) = [3,5]
Trigger1 = P2BodyDist x - fvar(37)*fvar(11) = [-51,51]
Trigger1 = var(54) := 430
Trigger1 = var(50) := 043082
;蹲b版边
Trigger2 = BackEdgeBodyDist < 10
Trigger2 = fvar(11) = [3,5]
Trigger2 = P2BodyDist x - fvar(37)*fvar(11) < 51
Trigger2 = var(54) := 430
Trigger2 = var(50) := 043083
;蹲D
Trigger3 = fvar(11) = [9,12]
Trigger3 = P2BodyDist x - fvar(37)*fvar(11)  = [50, 70]
Trigger3 = var(54) := 440
Trigger3 = var(50) := 044083
value = var(54)
IgnoreHitPause = 1


;=================================================================================
;切返7
;=================================================================================
[State -3,耗气前滚]
type = changestate
TriggerAll = var(59)
TriggerAll = roundstate = 2
TriggerAll = StateType != A 
TriggerAll = Power >= 1000
TriggerAll = power >= 2500 || (Life < 200) || (EnemyNear,Life < 300 && Power >= 2000) || (EnemyNear,Life < 150)
TriggerAll = EnemyNear,StateType != A
TriggerAll = EnemyNear,MoveType = A && !EnemyNear,Ctrl
TriggerAll = StateNo = [150,152]
TriggerAll = EnemyNear,Vel x >= 0
;
Trigger1 = EnemyNear,AnimTime < -35
Trigger1 = P2BodyDist x < 80
Trigger1 = var(50) := 70071
value = 700
IgnoreHitPause = 1

[State -3,前滚]
type = changestate
TriggerAll = var(59)
TriggerAll = var(11) = 1
TriggerAll = roundstate = 2
TriggerAll = StateType != A 
TriggerAll = EnemyNear,Vel x >= 0
;攻击的前闪避
Trigger1 = inguarddist 
;不能是投技
Trigger1 = !(EnemyNear,HitDefAttr = SCA, AT)
Trigger1 = helper(33000),var(11) != 3
Trigger1 = EnemyNear,MoveType = A && !EnemyNear,Ctrl
Trigger1 = EnemyNear,facing != facing
Trigger1 = P2BodyDist x < 75
Trigger1 = EnemyNear,animtime < -33
Trigger1 = var(50) := 070072
Trigger1 = EnemyNear,BackEdgeBodyDist > 60
value = 700

[State -3,182]
type = ChangeState
triggerall = var(59)
triggerall = statetype != A 
triggerall = EnemyNear,HitDefAttr = SCA,AA,AP,AT || EnemyNear,StateType = A
triggerall = EnemyNear,MoveType = A
triggerall = EnemyNear,Vel x >= 0 ;类似Bloo这种空振后退的
triggerall = Power >= 1000
TriggerAll = EnemyNear,Facing != Facing
;1段切返
trigger1= var(11) = [2,3]
;trigger1 = EnemyNear,StateNo = [2000, 4999]
trigger1 = EnemyNear,StateType != A
trigger1 = P2BodyDist x < 90
trigger1 = EnemyNear,AnimTime <= -18
trigger1 = var(50) := 210071
;凹对面普通超远距离技能,5B 5B之类的，不能空振
trigger2 = var(11) = [1,3]
trigger2 = P2BodyDist X >= 55
Trigger2 = EnemyNear,StateType = S
trigger2 = EnemyNear,StateNo = [200,999]
trigger2 = EnemyNear,StateType != A
trigger2 = P2BodyDist x - fvar(37) * 6 < 90
trigger2 = EnemyNear,AnimTime <= -19
trigger2 = var(50) := 210072
value = 2100
IgnoreHitPause = 1

[State -3,182释放]
type = ChangeState
triggerall = var(59)
triggerall = StateNo = 2100 && AnimElemtime(8) > 0
triggerall = time >= 39
;一段对地
trigger1 = EnemyNear,StateType != A 
trigger1 = var(54) := 2110
trigger1 = var(50) := 211071
;一段对空
trigger2 = EnemyNear,StateNo != 5040
trigger2 = EnemyNear,StateType = A
trigger2 = P2BodyDist x - fvar(37)*9 < 60
trigger2 = EnemyNear,Pos Y + EnemyNear,Vel Y * 9 + fvar(38) * 9 * (9 + 1) / 2 = [-50, -30]
trigger2 = var(54) := ifelse((time = [39,95]), 2110, ifelse((time =[96,141]), 2111, 2112))
trigger2 = var(50) := 211072
;版边二段对空
trigger3 = EnemyNear,StateNo != 5040
trigger3 = EnemyNear,StateType = A
trigger3 = P2BodyDist x - fvar(37)*11 = [20, 110]
trigger3 = EnemyNear,Pos Y + EnemyNear,Vel Y * 11 + fvar(38) * 11 * (11 + 1) / 2 = [-32, -10]
trigger3 = var(54) := ifelse((time = [39,95]), 2110, ifelse((time =[96,141]), 2111, 2112))
trigger3 = var(50) := 211073
;直接释放
trigger4 = time >= 177
trigger4 = var(54) := 2112
trigger4 = var(50) := 211074
value = var(54)

[State -3,大升龙]
type = ChangeState
triggerall = var(59)
triggerall = statetype != A 
triggerall = EnemyNear,MoveType = A
triggerall = EnemyNear,Vel x >= 0 ;类似Bloo这种空振后退的
;凹对面必杀、超杀，可能有多段判定，所以必须第一个攻击判定能打到
trigger1 = var(11) = [2,3]
trigger1 = EnemyNear,StateNo = [200, 4999]
trigger1 = EnemyNear,StateType != A
trigger1 = P2BodyDist x - fvar(37) * 6 = [-10,60]
trigger1 = EnemyNear,AnimTime <= -6 || EnemyNear,Time < 4
trigger1 = var(50) := 115071
;凹对面普通超远距离技能,5B 5B之类的，不能空振
trigger2 = var(11) = [1,3]
trigger2 = P2BodyDist X >= 55
Trigger2 = EnemyNear,StateType = S
trigger2 = EnemyNear,StateNo = [200,999]
trigger2 = EnemyNear,StateType != A
trigger2 = P2BodyDist x - fvar(37) * 6 = [-10,60]
trigger2 = EnemyNear,AnimTime <= -6 || EnemyNear,Time < 4
trigger2 = var(50) := 115071
value = 1150
IgnoreHitPause = 1

[State -3,鹤摘]
type = ChangeState
triggerall = var(59)
triggerall = var(11) = [1,3]
triggerall = statetype != A 
triggerall = EnemyNear,MoveType = A
triggerall = EnemyNear,Vel x >= 0 ;类似Bloo这种空振后退的
triggerall = !EnemyNear,NumProj && !PlayerIdExist(Helper(33333333),var(3))
;凹对面必杀、超杀，可能有多段判定，所以必须第一个攻击判定能打到
trigger1 = P2BodyDist x = [50,80]
trigger1 = EnemyNear,StateNo = [200,1999]
trigger1 = EnemyNear,StateType = C
trigger1 = enemynear,stateno = helper(33000),var(2)
trigger1 = helper(33000),var(3) - enemynear,time >= 3
trigger1 = EnemyNear,AnimTime <= -9
trigger1 = var(50) := 130071
value = 1300
IgnoreHitPause = 1

;=================================================================================
;连段+连携6
;小跳起跳到落地17F
;后撤起跳到落地13F
;落地硬直是1F
;奈落落出判定是第6F在击中17F硬直，2B击中时间要3F

;奈落计算
;如果想第二次奈落能击中敌人并且落地还能接2B，则需要第二次奈落击中敌人后落地还有4F时间
;第一次奈落击中落地需要有大于7F的硬直时间，才能保证第二次起跳就出奈落能打到


;近C >> 轰斧
;近C >> 88
;2B >> 2A >> 88
;远A >> 88
;远C >> 88
;2C >> 88
;近B >> 2A/2B
;2B 可以目押 3D

;=================================================================================
[State -3,MAX大蛇薙释放]
type = ChangeState
triggerall = var(59)
triggerall = StateNo = 2500 && AnimElemtime(4) >= 0
;打地面
trigger1 = EnemyNear,StateType != A
trigger1 = var(50) := 251061
;追浮空
trigger2 = EnemyNear,StateType = A 
Trigger2 = EnemyNear,BackEdgeBodyDist > 15 || P2BodyDist X >= 8
trigger2 = p2bodydist X - fvar(37) * 19 = [0, 120]
trigger2 = EnemyNear,Pos Y + EnemyNear,Vel Y * 19 + fvar(38) * 19 * (19 + 1) / 2 = [-40,-25]
trigger2 = var(50) := 251062
;版边追浮空
trigger3 = EnemyNear,StateType = A 
Trigger3 = EnemyNear,BackEdgeBodyDist <= 15
trigger3 = P2BodyDist x < 8
trigger3 = HitCount = 3
trigger3 = var(50) := 251063
;到点释放
trigger4 = AnimTime = 0
value = 2510


[State -3,普通大蛇薙释放]
type = ChangeState
triggerall = var(59)
triggerall = StateNo = 2000 && AnimElemtime(6) >= 0
;打地面
trigger1 = EnemyNear,StateType != A
trigger1 = var(50) := 201061
;追浮空
trigger2 = EnemyNear,StateType = A 
trigger2 = p2bodydist X - fvar(37) * 16 < 120
trigger2 = EnemyNear,Pos Y + EnemyNear,Vel Y * 16 + fvar(38) * 16 * (16 + 1) / 2 = [-35,-20]
trigger2 = var(50) := 201062
;到点释放
trigger3 = AnimTime = 0
value = 2010


[State 75第二下]
type = ChangeState
triggerall = var(59)
triggerall = EnemyNear,MoveType = H
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 || Enemynear,StateNo = [150,159]
trigger1 = StateNo = 1250 && AnimElemtime(8) >= 0 && AnimElemtime(9) < 0
trigger1 = var(50) := 125561
value = 1255

[State EX75第二下]
type = ChangeState
triggerall = var(59)
triggerall = EnemyNear,MoveType = H
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 || Enemynear,StateNo = [150,159]
trigger1 = StateNo = 1953 && AnimElemtime(8) >= 0 && AnimElemtime(9) < 0
trigger1 = var(50) := 195461
value = 1954 

;------------------------------------------------------------------------------------------------
;BC
;------------------------------------------------------------------------------------------------
[State -3, BC]
type = ChangeState
value = 901
triggerall = var(59) 
triggerall = ctrl = 0
triggerall = power >= 1000
triggerall = power >= 2000 || EnemyNear,Life < 400 || EnemyNear,Life - Life > 300
triggerall = var(20) = 0
TriggerAll = !InGuardDist
TriggerAll = EnemyNear,StateType != L
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000 
trigger1 = StateNo = 320 && MoveHit && AnimElemTime(6) > 1
trigger1 = var(50) := 90161

trigger2 = StateNo = 310 || StateNo = 315 
trigger2 = MoveHit && AnimElemTime(6) > 0
trigger2 = var(50) := 90162


;------------------------------------------------------------------------------------------------
;超杀收尾
;------------------------------------------------------------------------------------------------
[State -3,白矢追地收尾]
type = ChangeState
triggerall = var(59) 
triggerall = var(11) = 1
triggerall = power >= 2000
Triggerall = !EnemyNear,Ctrl
TriggerAll = var(20) = 0
TriggerAll = StateType != A
triggerAll = EnemyNear,Life < (400 * fvar(39)) || EnemyNear,Life < 200 || EnemyNear,Life - Life > 350
TriggerAll = P2BodyDist X < 90
Trigger1 = EnemyNear,StateNo = 116101 && EnemyNear,Pos Y >= -10
Trigger2 = EnemyNear,StateNo = 116110 && EnemyNear,Time < 10
Value = 3100

[State -3,零式/白矢/MAX大蛇薙收尾]
type = ChangeState
triggerall = var(59) 
triggerall = ctrl = 0
triggerall = power >= 2000
Triggerall = EnemyNear,MoveType = H
TriggerAll = var(20) = 0

trigger1 = EnemyNear,Life < (400 * fvar(39)) || EnemyNear,Life < 200 || EnemyNear,Life - Life > 350
trigger1 = stateno = 1155 && AnimElemtime(1) >= 0 && AnimElemtime(2) < 0 && movehit
trigger1 = NumTarget(1155)
trigger1 = EnemyNear,StateType != A
trigger1 = var(54) := 3100

;MAX大蛇薙有机会就放，伤害巨大无比
trigger2 = stateno = 1155 && AnimElemtime(1) >= 0 && AnimElemtime(2) < 0 && movehit
trigger2 = NumTarget(1155)
trigger2 = EnemyNear,StateType = A && EnemyNear,BackEdgeBodyDist < 10
trigger2 = P2BodyDist X < 25
trigger2 = var(54) := 2500

trigger3 = EnemyNear,StateType != A
trigger3 = EnemyNear,Life < (400 * fvar(39)) || EnemyNear,Life < 200
trigger3 = stateno = 1405 && AnimElemtime(4) >= 0 && AnimElemtime(5) < 0 && movehit
trigger3 = var(54) := ifelse(random < 500, 3500, 3100)

trigger4 = EnemyNear,Life < (400 * fvar(39)) || EnemyNear,Life < 200
trigger4 = stateno = 1460 && movehit
trigger4 = var(54) := ifelse(random < 500, 3500, 3100)

value = var(54)

[State -3,182/大蛇薙/雾焰收尾]
type = ChangeState
triggerall = var(59) 
triggerall = ctrl = 0
triggerall = power >= 1000
Triggerall = EnemyNear,MoveType = H
triggerAll = EnemyNear,Life < (200 * fvar(39)) || EnemyNear,Life < 200 || EnemyNear,Life - Life > 350
TriggerAll = var(20) = 0

trigger1 = stateno = 1155 && AnimElemtime(1) >= 0 && AnimElemtime(2) < 0 && movehit
trigger1 = NumTarget(1155)
trigger1 = EnemyNear,StateType != A
trigger1 = var(54) := ifelse(random < 500, 2300, 2100)
trigger1 = var(50) := 210066

trigger2 = P2BodyDist X < 50 && EnemyNear,BackEdgeBodyDist < 30
trigger2 = stateno = 1155 && AnimElemtime(1) >= 0 && AnimElemtime(2) < 0 && movehit
trigger2 = NumTarget(1155)
trigger2 = EnemyNear,StateType = A 
trigger2 = var(54) := 2000
trigger2 = var(50) := 200066

trigger3 = EnemyNear,StateType != A
trigger3 = stateno = 1405 && AnimElemtime(4) >= 0 && AnimElemtime(5) < 0 && movehit
trigger3 = var(54) := 2100;ifelse(random < 500, 2100, 2300)
trigger3 = var(50) := 210067

trigger4 = stateno = 1460 && movehit
trigger4 = var(54) := ifelse(random < 500, 2000, 2100)
trigger4 = var(50) := 210068

value = var(54)

[State -3,轰斧]
type = ChangeState
triggerall = var(59)
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType != A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 || EnemyNear,StateNo = [120,159]
triggerall = EnemyNear,GetHitVar(Hittime) >= 12
Triggerall = MoveHit || (MoveGuarded && EnemyNear,Power < 900)
trigger1 = EnemyNear,StateType = C || Random < 500
trigger1 = StateNo = 215 && MoveContact
trigger1 = var(50) := 31561
value = 315

[State -3,88]
type = ChangeState
triggerall = var(59)
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType != A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 || EnemyNear,StateNo = [120,159]
triggerall = EnemyNear,GetHitVar(Hittime) >= 4
Triggerall = MoveHit || (MoveGuarded && EnemyNear,Power < 900)
trigger1 = StateNo = 400 && MoveContact
trigger2 = StateNo = 215 && MoveContact
trigger3 = StateNo = 210 && MoveContact
trigger4 = StateNo = 200 && MoveContact
trigger5 = StateNo = 410 && MoveContact
trigger6 = StateNo = 430 && MoveHit && AnimTime = 0
value = 320

;------------------------------------------------------------------------------------------------
;浮空追击
;------------------------------------------------------------------------------------------------
[State 重胧车]
type = ChangeState
triggerall = var(59)
triggerall = var(11) = 1
triggerall = StateType != A
triggerall = EnemyNear,MoveType = H && enemynear,StateType = A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000
triggerall = var(20) = 0
;版边胧车追75
trigger1 = helper(33001),p2bodydist x >= 80 && helper(33002),p2bodydist x >= 80
trigger1 = NumTarget(1255) || NumTarget(1806) || NumTarget(1805)
trigger1 = P2BodyDist x - fvar(37) * 12 < 100
trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 12 + fvar(38) * 12 * (12 + 1) / 2 = [-65,-30]
trigger1 = var(50) := 155061
value = 1550

[State 升龙追MAX大蛇薙]
type = ChangeState
triggerall = var(59)
triggerall = var(11) = 1
triggerall = StateType != A
triggerall = EnemyNear,MoveType = H && enemynear,StateType = A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000
Trigger1 = NumTarget(2520) || NumTarget(2525) || NumTarget(2530)
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - fvar(37) * 5 = [-5,65]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 5 + fvar(38) * 5 * (5 + 1) / 2 = [-40,-15]
trigger1 = var(50) := 115069
value = 1150



;------------------------------------------------------------------------------------------------
;BC连
;版中75>>琴月阳
;版边升龙>>胧车
;------------------------------------------------------------------------------------------------
[State -1, DC 终焉]
type = ChangeState
value = 2700
triggerall = var(59)
triggerall = var(20) = 0 
triggerall = power >= 3000
triggerall = statetype != A
triggerall = EnemyNear,MoveType = H 
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000
trigger1 = stateno = 2110 && AnimElemtime(7) >= 0 && AnimElemtime(11) < 0 && movehit
trigger2 = stateno = 2111 && AnimElemtime(7) >= 0 && AnimElemtime(11) < 0 && movehit
trigger3 = stateno = 2112 && AnimElemtime(7) >= 0 && AnimElemtime(11) < 0 && movehit

;---------------------------------------------------------------------------------------
;还剩3气的时候走182，可以DC到终焉
[State -3,182/大蛇薙收尾]
type = ChangeState
triggerall = var(59)
triggerall = StateType != A
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType = A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000
triggerall = power >= 1000
;非BC或者在版中
triggerall = var(20) = 0 || (helper(33001),p2bodydist x >= 30 && helper(33002),p2bodydist x >= 30)
trigger1 = Fvar(39) < 0.7 || Life < 200
trigger1 = StateNo = 1155 && MoveHit
value = ifelse(power >= 3000 || random < 300, 2100, 2000)


[State -3,版边MAX大蛇薙]
type = ChangeState
triggerall = var(59)
triggerall = StateType != A
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType = A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000
triggerall = power >= 2000
;非BC或者在版中
triggerall = Fvar(39) < 0.7 || Life < 300
triggerall = var(20) = 0 || (helper(33001),p2bodydist x >= 30 && helper(33002),p2bodydist x >= 30)
trigger1 = StateNo = 1155 && MoveHit
value = 3100

[State -3,白矢收尾]
type = ChangeState
triggerall = var(59)
triggerall = StateType != A
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType = A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000
triggerall = power >= 2000
;非BC或者在版中
triggerall = var(20) = 0 || (helper(33001),p2bodydist x >= 30 && helper(33002),p2bodydist x >= 30)
trigger1 = StateNo = 1155 && MoveHit
value = 3100



;------------------------------------------------------------------------------------------------
;EX收尾
;------------------------------------------------------------------------------------------------
[State -3,EX琴月阳收尾]
type = ChangeState
value = 1956
triggerall = var(59)
triggerall = var(11) = 1
triggerall = statetype != A
triggerall = power >= 500
triggerall = EnemyNear,MoveType = H 
triggerall = !EnemyNear,Ctrl
triggerall = var(20) = 0
triggerall = var(43) != 1956
;116110 time >= 60才会站起来
trigger1 = EnemyNear,Life < 150
trigger1 = P2BodyDist x < 50
trigger1 = EnemyNear,StateNo = 116110 && Enemynear,Time < 53
trigger1 = EnemyNear,StateType = L
trigger1 = var(50) := 195661
trigger1 = var(43) := 1956

[State -3,EX 75追升龙/琴月阳]
type = ChangeState
value = 1953
triggerall = var(59)
triggerall = statetype != A
triggerall = power >= 500
;能绝杀对方或者低血量时候
Triggerall = Power >= 2000 || EnemyNear,Life < 200 || Life < 200 || EnemyNear,Life - Life > 400
triggerall = EnemyNear,MoveType = H 
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000
triggerall = var(20) = 0
triggerall = var(43) != 1953
triggerall = Helper(33001),P2BodyDist x < 80 || Helper(33002),P2BodyDist x < 80

trigger1 = StateNo = 1405 && AnimElemtime(4) >= 0 && AnimElemtime(5) < 0 && MoveHit
trigger1 = var(50) := 195361
trigger1 = var(43) := 1953

trigger2 = Stateno = 1155 && AnimElemtime(1) >= 0 && AnimElemtime(2) < 0 && MoveHit
trigger2 = var(50) := 195362
trigger2 = var(43) := 1953

trigger3 = StateNo = 1460 && MoveHit
trigger3 = var(50) := 195363
trigger3 = var(43) := 1953

[State EX胧车]
type = ChangeState
triggerall = var(59)
triggerall = var(11) = 1
triggerall = StateType != A
triggerall = EnemyNear,MoveType = H && enemynear,StateType = A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000
triggerall = var(20) = 0
triggerall = power >= 500
Triggerall = EnemyNear,Life = [90,125]
;版边胧车追75
trigger1 = NumTarget(1255) || NumTarget(1806) || NumTarget(1805)
trigger1 = P2BodyDist x - fvar(37) * 12 < 100
trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 12 + fvar(38) * 12 * (12 + 1) / 2 = [-65,-30]
trigger1 = var(50) := 195261
trigger1 = var(43) := 1952
;追琴月阳
trigger2 = (StateNo = 1405 || StateNo = 1460) && MoveHit
trigger2 = var(50) := 195262
trigger2 = var(43) := 1952
value = 1952

[State 胧车]
type = ChangeState
triggerall = var(59)
triggerall = EnemyNear,MoveType = H && enemynear,StateType = A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000
;版边胧车追75
trigger1 = var(11) = 1
trigger1 = helper(33001),p2bodydist x < 40 || helper(33002),p2bodydist x < 40
trigger1 = NumTarget(1255) || NumTarget(1806) || NumTarget(1805)
trigger1 = P2BodyDist x - fvar(37) * 10 < 100
trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 10 + fvar(38) * 10 * (10 + 1) / 2 = [-65,-37]
trigger1 = var(50) := 150061
;升龙取消胧车
trigger2 = var(20) > 0
trigger2 = StateNo = 1155 && MoveHit 
trigger2 = var(50) := 150062
value = 1500

[State -3,琴月阳]
type = ChangeState
triggerall = var(59)
triggerall = StateType != A
triggerall = EnemyNear,MoveType = H 
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000

trigger1 = var(20) > 0
trigger1 = EnemyNear,StateType != A
trigger1 = StateNo = 320 && MoveHit
trigger1 = var(50) := 140061
;版中追击75
trigger2 = helper(33001),p2bodydist x >= 45 && helper(33002),p2bodydist x >= 45
trigger2 = var(11) = 1
trigger2 = NumTarget(1255) && EnemyNear,StateType = A
trigger2 = var(50) := 140062

trigger3 = EnemyNear,StateType != A
trigger3 = (StateNo = 310 || StateNo = 315) && MoveHit && AnimElemTime(6) > 0
trigger3 = var(50) := 140063

value = 1400

[State -3,大升龙]
type = ChangeState
triggerall = var(59)
triggerall = EnemyNear,MoveType = H
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000
triggerall = var(20) > 0
Trigger1 = EnemyNear,StateType != A
trigger1 = StateNo = 1405 && MoveHit 
trigger1 = var(50) := 115061
value = 1150

[State -3,75踢飞]
type = ChangeState
triggerall = var(59)
triggerall = StateType != A
triggerall = EnemyNear,MoveType = H
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000
triggerall = var(20) > 0
trigger1 = StateNo = 1155 && MoveHit 
trigger1 = var(50) := 125061
trigger2 = EnemyNear,BackEdgeBodyDist <= 30 || EnemyNear,StateType = A
trigger2 = StateNo = 1405 && MoveHit 
value = 1250

[State 升龙]
type = ChangeState
triggerall = var(59)
triggerall = var(11) = 1
triggerall = EnemyNear,MoveType = H && enemynear,StateType = A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000
;升龙追胧车
trigger1 = helper(33001),p2bodydist x < 20 || helper(33002),p2bodydist x < 20
trigger1 = NumTarget(1500) 
trigger1 = P2BodyDist x < 65
trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 6 + fvar(38) * 6 * (6 + 1) / 2 = [-33, -20]
trigger1 = var(50) := 115062
value = 1150

;------------------------------------------------------------------------------------------------
;普通技连段/连携
;02UM原作 2B是只能接轻攻击的，但是目前这个草的CMD里是允许的
;先按照02UM的写，最后酌情
;------------------------------------------------------------------------------------------------
[State -3]
type = ChangeState
triggerall = var(59)
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType != A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 || EnemyNear,StateNo = [120,159]
;优先接2A，可以带入3D接打连段
trigger1 = EnemyNear,GetHitVar(Hittime) >= 3
trigger1 = StateNo = 430 && MoveContact
trigger1 = P2BodyDist x < 37
trigger1 = var(54) := 400
trigger1 = var(50) := 40061
;太远则改为2B >> 2B >> 5B
trigger2 = EnemyNear,GetHitVar(Hittime) >= 3
trigger2 = StateNo = 430 && MoveContact
trigger2 = P2BodyDist x - fvar(37) * 3 < 50
trigger2 = var(54) := 430
trigger2 = var(50) := 43061
;太远则改为2B >> 2B >> 目押3D
trigger3 = P2BodyDist x < 65
trigger3 = EnemyNear,GetHitVar(Hittime) >= 2
trigger3 = StateNo = 430 && AnimTime = 0 && MoveContact
trigger3 = var(54) := 320
trigger3 = var(50) := 32061
value = var(54)

[State -3]
type = ChangeState
triggerall = var(59)
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType != A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 || EnemyNear,StateNo = [120,159]
triggerall = EnemyNear,GetHitVar(Hittime) >= 3
trigger1 = p2bodydist X < 14
trigger1 = StateNo = 235 && MoveContact
trigger1 = var(54) := 235
trigger1 = var(50) := 23566
trigger2 = StateNo = 235 && MoveContact
trigger2 = var(54) := ifelse(P2BodyDist x < 25, 430, 400)
trigger2 = var(50) := 40066
value = var(54)

;------------------------------------------------------------------------------------------------
;必杀技 连段+连携
;------------------------------------------------------------------------------------------------
[State -3,75追空中击中]
type = ChangeState
triggerall = var(59)
triggerall = StateType != A
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType = A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000
triggerall = MoveHit
Triggerall = p2bodydist Y = [-35, -15]
Triggerall = P2BodyDist x < 15
trigger1 = StateNo = 215 || StateNo = 245 || StateNo = 210
value = 1250

[State -3,升龙追空中击中]
type = ChangeState
triggerall = var(59)
triggerall = StateType != A
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType = A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000
triggerall = MoveHit
trigger1 = StateNo = 200 || StateNo = 205 || StateNo = 215 || StateNo = 245
trigger2 = StateNo = 400 || StateNo = 210
value = ifelse(Power >= 500, 1150, 1100)

[State -3,特殊技追加必杀]
type = ChangeState
triggerall = var(59)
triggerall = StateType != A
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType != A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000
triggerall = MoveHit
triggerall = !(Power >= 1000 && (EnemyNear,Life - Life > 300 || Life < 300 || EnemyNear,Life < 400))
triggerall = power < 2000 || ((Power = [1000,2000)) && EnemyNear,Life >= 400) || (power >= 2000 && EnemyNear,Life < 200)
triggerall = (StateNo = 320 && AnimElemTime(2) > 0) || (StateNo = 315 && AnimElemTime(6) > 0) 
;75踢飞大伤害
trigger1 = Life < EnemyNear,Life || EnemyNear,Life < 250 || EnemyNear,BackEdgeBodyDist < 10
trigger1 = P2BodyDist x < 35
trigger1 = var(54) := 1250
trigger1 = var(50) := 125066
;暗勾手
trigger2 = Life - EnemyNear,Life > 500 && Random < 300
trigger2 = var(54) := 1050
trigger2 = var(50) := 105066
;琴月阳
trigger3 = var(54) := ifelse(random<700, 1400, 1450)
trigger3 = var(50) := 140066
value = var(54)


[State -3,暗勾手连携]
type = ChangeState
triggerall = var(59)
triggerall = StateType != A
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType != A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo = [150,159]
Triggerall = EnemyNear,Power < 1000
trigger1 = StateNo = 320 && AnimElemTime(2) > 0 && MoveGuarded 
trigger1 = var(50) := 105067
trigger2 = StateNo = 315 && AnimElemTime(6) > 0 && MoveGuarded
trigger2 = var(50) := 105068
value = ifelse(Enemynear,BackEdgeBodyDist < 20 || P2BodyDist x < 25, 1250, 1050)




;------------------------------------------------------------------------------------------------
;MoveContact中
;优先接跳奈落
;------------------------------------------------------------------------------------------------
[State -3]
type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = EnemyNear,StateType != L
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000 || EnemyNear,StateNo = [120,159]
;优先前跳接奈落
Trigger1 = EnemyNear,StateNo >= 5000
Trigger1 = var(11) = 1 || StateNo = 52 || StateNo = 901
Trigger1 = EnemyNear,StateType != C
Trigger1 = P2BodyDist x < 80
Trigger1 = var(20) = 0 || var(20) > 890 || Helper(33000),var(14) != 330 || var(50) = 33036
Trigger1 = EnemyNear,GetHitVar(HitTime) >= 13
Trigger1 = var(54) := 39
Trigger1 = var(4) := ifelse(EnemyNear,MoveType = H, 2, 1)
Trigger1 = var(50) := 3961
;再次近C，尤其是可以带入BC
Trigger2 = var(11) = 1
Trigger2 = EnemyNear,StateNo >= 5000
Trigger2 = P2BodyDist x < 24
Trigger2 = EnemyNear,GetHitVar(HitTime) >= 5
Trigger2 = P2BodyDist x < 10 || EnemyNear,GetHitVar(HitTime) = [5,9]
Trigger2 = var(54) := 215
Trigger2 = var(50) := 21561
;近B
Trigger3 = var(11) = 1
Trigger3 = EnemyNear,StateType = S || Random < 300
Trigger3 = EnemyNear,StateNo = [150,159]
Trigger3 = P2BodyDist x < 14
Trigger3 = EnemyNear,GetHitVar(HitTime) >= 7
Trigger3 = var(54) := 235
Trigger3 = var(50) := 23561
;蹲B
Trigger4 = var(11) = 1
Trigger4 = EnemyNear,GetHitVar(HitTime)>= 2
Trigger4 = P2BodyDist x - ifelse(EnemyNear,BackEdgeBodyDist >= 20, fvar(37), 0)*4 < ifelse(EnemyNear,BackEdgeBodyDist >= 20, 51, 35)
Trigger4 = (EnemyNear,StateNo = [150,159]) || EnemyNear,GetHitVar(HitTime) =  [2, 5]
Trigger4 = var(54) := 430
Trigger4 = var(50) := 43066
;蹲B
Trigger5 = var(11) = 1
Trigger5 = EnemyNear,GetHitVar(HitTime)>= 2
Trigger5 = P2BodyDist x < 50 && EnemyNear,Facing = Facing
Trigger5 = (EnemyNear,StateNo = [150,159]) || EnemyNear,GetHitVar(HitTime) =  [2, 5]
Trigger5 = var(54) := 430
Trigger5 = var(50) := 43067
;3D
Trigger6 = var(11) = 1
Trigger6 = P2BodyDist x = [50,70]
Trigger6 = EnemyNear,GetHitVar(HitTime) >= 2
Trigger6 = EnemyNear,GetHitVar(HitTime) = [2,5]
Trigger6 = var(54) := 320
Trigger6 = var(50) := 32062
value = var(54) 

;=================================================================================
;移动5
;=================================================================================
[State -3,前滚]
type = changestate
TriggerAll = var(59)
TriggerAll = roundstate = 2
TriggerAll = StateType != A 
TriggerAll = var(11) = 1
TriggerAll = EnemyNear,StateType = L
TriggerAll = EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = P2BodyDist x < 85
Trigger1 = EnemyNear,StateNo = 116110 && EnemyNear,Time = [19, 22]
Trigger1 = Enemynear,Facing != Facing
Trigger1 = Helper(33001),P2BodyDist x > 60 && Helper(33002),P2BodyDist x > 60
Trigger1 = var(50) := 70051
Trigger2 = EnemyNear,StateNo = 116110 && EnemyNear,Time < 24
Trigger2 = BackEdgeBodyDist < 32
Trigger2 = var(50) := 70052
value = 700
IgnoreHitPause = 1



[State -3,后撤]
type = ChangeState
value = 105
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = var(11) = 1
TriggerAll = BackEdgeBodyDist >= 60
;防投技
Trigger1 = helper(33000),var(14) = 3
Trigger1 = P2BodyDist x < 50
Trigger1 = var(50) := 10551
;
Trigger2 = EnemyNear,StateNo = 5120 && EnemyNear,AnimTime = [-2,0]
Trigger2 = P2BodyDist x < 10
Trigger2 = var(50) := 10552
;
Trigger3 = !inguarddist
Trigger3 = EnemyNear,Facing = Facing
Trigger3 = P2BodyDist Y < -60
Trigger3 = EnemyNear,Vel Y <= 0
Trigger3 = P2BodyDist x < 20
IgnoreHitPause = 1

[State -3, 前跑]
type = ChangeState
value = 99
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = StateType != A
TriggerAll =!inguarddist
TriggerAll =!enemy,numproj
TriggerAll = Ctrl || StateNo = 1 || StateNo = 19  || StateNo = 18
Trigger1 = P2BodyDist x >= 240
Trigger1 = Random <= 200
Trigger1 = var(50) := 990501

Trigger2 = P2BodyDist x = [160,240]
Trigger2 = Random <= 150
Trigger2 = var(50) := 990502

Trigger3 = P2BodyDist x = [80,160]
Trigger3 = Random <= 100
Trigger3 = var(50) := 990503

Trigger4 = P2BodyDist x >= 50
Trigger4 = EnemyNear,StateNo = 5300
Trigger4 = var(50) := 990504

;追打
Trigger5 = P2BodyDist x > 15
Trigger5 = EnemyNear,MoveType = H && !EnemyNear,Ctrl 
Trigger5 = EnemyNear,StateNo >= 5000
Trigger5 = EnemyNear,gethitvar(hittime) > 3 || EnemyNear,StateNo = 5700
Trigger5 = var(50) := 990505

;移动到合适的位置打敌人起身
Trigger6 = P2BodyDist x > 100
Trigger6 = EnemyNear,StateType = L
Trigger6 = var(50) := 990506

;抓硬直
Trigger7 = EnemyNear,StateNo != 5120
Trigger7 = P2BodyDist x > 45
Trigger7 = !EnemyNear,Ctrl
Trigger7 = EnemyNear,AnimTime < -6
Trigger7 = EnemyNear,MoveType = A || EnemyNear,MoveType = I 
Trigger7 = EnemyNear,StateNo >= 200
Trigger7 = !inguarddist
Trigger7 = var(50) := 990507

;推版边
Trigger8 = (EnemyNear,StateNo = 116110 || EnemyNear,StateNo = 1473) && EnemyNear,Time < 10

;追打
Trigger9 = P2BodyDist x > 35
Trigger9 = EnemyNear,MoveType = H && !EnemyNear,Ctrl 
Trigger9 = EnemyNear,StateNo = 5040
Trigger9 = P2BodyDist Y < -20
Trigger9 = var(50) := 990505

;道具掩护前冲
Trigger10 = P2BodyDist x > 80
Trigger10 = numhelper(1011) || numhelper(1012) 

IgnoreHitPause = 1

[State -3, 前行]
type = ChangeState
value = 19
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = EnemyNear,StateType != L
TriggerAll = EnemyNear,StateNo != [5120,5299]
TriggerAll = P2BodyDist x >= 0
TriggerAll = (PrevStateNo != [140,155]) || P2BodyDist X > 120
TriggerAll = !inguarddist
TriggerAll = !enemy,numproj && !PlayerIdExist(Helper(33333333),var(3)) 
TriggerAll = (Ctrl || StateNo = 1) || (StateNo = 18 && Time >= 20)

Trigger1 =(P2BodyDist X = [55,120])
Trigger1 = Random <= 50
Trigger1 = var(50) := 190501

Trigger2 = P2BodyDist X > 140
Trigger2 = Random <= 100
Trigger2 = var(50) := 190502

Trigger3 = BackEdgeBodyDist <= 20
Trigger3 = var(50) := 190503

;移动到合适的位置打敌人起身
Trigger4 = P2BodyDist x > 55
Trigger4 = EnemyNear,StateType = L
Trigger4 = var(50) := 190504

;抓硬直
Trigger5 = EnemyNear,StateNo = [200,4999]
Trigger5 = EnemyNear,StateNo != 5040
Trigger5 = EnemyNear,StateNo != 5120
Trigger5 = P2BodyDist x > 15
Trigger5 = !EnemyNear,Ctrl
Trigger5 = EnemyNear,MoveType = A || EnemyNear,MoveType = I 
Trigger5 = !inguarddist
Trigger5 = var(50) := 190505

;近身
Trigger6 = !EnemyNear,Ctrl
Trigger6 = P2BodyDist X >= 45 && P2BodyDist X <= 95
Trigger6 = var(50) := 190506
IgnoreHitPause = 1

[State -3, 后退]
type = ChangeState
value = 18
TriggerAll = var(59) 
TriggerAll = RoundState = 2
TriggerAll = StateType != A
TriggerAll = BackEdgeBodyDist > 30

TriggerAll = !enemy,numproj && !PlayerIdExist(Helper(33333333),var(3)) 
TriggerAll = Ctrl || StateNo = 1 || (StateNo = 19 && Time >= 12) || (StateNo = 104 && Time >= 12)
TriggerAll = !(EnemyNear,MoveType = A || (EnemyNear,MoveType = I && EnemyNear,StateNo < 5000))

Trigger1 = !inguarddist
Trigger1 = !(EnemyNear,MoveType = H || (EnemyNear,StateNo = [120,159]))
Trigger1 = P2BodyDist X < 55
Trigger1 = var(50) := 180501

Trigger2 = !inguarddist
Trigger2 =(PrevStateNo = [140,155]) && P2BodyDist X <= 120
Trigger2 = Random <= 50
Trigger2 = var(50) := 180502

Trigger3 = !inguarddist
Trigger3 = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,Ctrl
Trigger3 = P2BodyDist x < 55
Trigger3 = var(50) := 180503

;移动到合适的位置打敌人起身
Trigger4 = !inguarddist
Trigger4 = P2BodyDist x < 55
Trigger4 = EnemyNear,StateNo = 5120
Trigger4 = var(50) := 180504
IgnoreHitPause = 1


[State -3,小跳追击JCD]
type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = var(11) = 1 || StateNo = 52
Trigger1 = EnemyNear,StateType = A
Trigger1 = EnemyNear,StateNo >= 5000 && !EnemyNear,Ctrl
Trigger1 = NumTarget(650)
Trigger1 = EnemyNear,P2BodyDist Y < -40
Trigger1 = var(4) := 1 
Trigger1 = var(39) := 390505
value = 39

[State -3,跳跃]
type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = var(11) = 1 || StateNo = 52
TriggerAll = Life >= 100
;前小跳躲投技
Trigger1 = P2BodyDist x < 90
Trigger1 = helper(33000),var(14) = 3
Trigger1 = var(4) := 1
Trigger1 = var(50) := 390501
;大跳起攻
Trigger2 = var(44) <= 0
Trigger2 = EnemyNear,Vel x <= 0 || Life - EnemyNear,Life > 200
Trigger2 = !inguarddist
Trigger2 = EnemyNear,Ctrl || EnemyNear,StateNo < 110
Trigger2 = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != A
Trigger2 = P2BodyDist x = [65, 120]
Trigger2 = var(4) := ifelse(P2BodyDist x < 95,3,ifelse(EnemyNear,Vel x > 0,3,4))
Trigger2 = var(50) := 390502
;起攻打可能有的飞行道具
Trigger3 = var(44) <= 0
Trigger3 = !EnemyNear,Ctrl 
Trigger3 = EnemyNear,MoveType = A && EnemyNear,AnimTime <= -27
Trigger3 = P2BodyDist X = [100,180]
Trigger3 = var(4) := ifelse(P2BodyDist X < 118, 3, 4)
Trigger3 = var(50) := 390504
;打版边
Trigger4 = !EnemyNear,Ctrl  && EnemyNear,StateNo = 5040
Trigger4 = Fvar(11) > 9
Trigger4 = P2BodyDist X < 60
Trigger4 = EnemyNear,BackEdgeBodyDist < 10
Trigger4 = var(4) := ifelse(P2BodyDist X < 80, 1, 2)
Trigger4 = var(50) := 390505
value = 39
IgnoreHitPause = 1

;=================================================================================
;打起身4
;=================================================================================
[State -3,跳跃]
type = ChangeState
TriggerAll = var(59)
TriggerAll = !inguarddist
TriggerAll = StateType != A
TriggerAll = var(11) = 1 || StateNo = 52
;打起身
Trigger1 = P2BodyDist x = [25, 60]
Trigger1 = EnemyNear,StateNo = 5120 && EnemyNear,animtime = [-14, -9]
Trigger1 = var(4) := 1
Trigger1 = var(50) := 390701

;打起身
Trigger2 = 0
Trigger2 = P2BodyDist x = [45, 65]
Trigger2 = EnemyNear,StateNo = 5120 && EnemyNear,animtime = [-14, -9]
Trigger2 = var(4) := 2
Trigger2 = var(50) := 390702

Trigger3 = P2BodyDist x = [60, 100]
Trigger3 = EnemyNear,StateNo = 5120 && EnemyNear,animtime = [-20, -16]
Trigger3 = var(4) := 3
Trigger3 = var(50) := 390703

Trigger4 = P2BodyDist x = [100, 140]
Trigger4 = EnemyNear,StateNo = 5120 && EnemyNear,animtime = [-20, -16]
Trigger4 = var(4) := 4
Trigger4 = var(50) := 390704
;打起身对手版边
Trigger5 = EnemyNear,BackEdgeBodyDist < 10 || FrontEdgeBodyDist < 80
Trigger5 = P2BodyDist x < 50
Trigger5 = EnemyNear,StateNo = 5120 && EnemyNear,animtime = [-13, -9]
Trigger5 = var(4) := 1
Trigger5 = var(50) := 390705

;打起身对手版边
Trigger6 = Helper(33001),p2bodydist x < 10 || Helper(33002),p2bodydist x < 10
Trigger6 = P2BodyDist x < 120
Trigger6 = EnemyNear,StateNo = 5120 && EnemyNear,animtime = [-22, -14]
Trigger6 = var(4) := 4
Trigger6 = var(50) := 390706

;打落地受身
Trigger7 = EnemyNear,StateNo = 5050
Trigger7 = !EnemyNear,Ctrl && EnemyNear,MoveType = H
Trigger7 = EnemyNear,BackEdgeBodyDist < 20
Trigger7 = P2BodyDist X < 50
Trigger7 = EnemyNear,Pos Y >= -10
Trigger7 = var(4) := 1
Trigger7 = var(50) := 390707
value = 39
IgnoreHitPause = 1

;=================================================================================
;立回3
;=================================================================================

;-------------------------------------------------------------------
;落地硬直4F，出招时间6F，击中硬直是9F的话
;则保证连携最早出招时间是  9 - fvar(9) - 4 + 6 >= 2, Fvar(9) <= 击中硬直 + 出招时间 - 6F + 1F
;保证落地不被打的最早出招时间是 9 - fvar(9) - 4 + 6 >= -1, Fvar(9) <= 击中硬直 + 出招时间 - 3F + 1F
;+1F是误差
;-------------------------------------------------------------------
[State -3, 奈落]
type = ChangeState
value = 330
;TriggerAll = var(59)
TriggerAll = Ctrl || StateNo = 105 || StateNo = [120,149]
TriggerAll = StateType = A
TriggerAll = EnemyNear,StateNo >= 5000
TriggerAll = EnemyNear,MoveType = H
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateType != L && EnemyNear,StateNo != 5120
Trigger1 = fvar(9) >= 7
Trigger1 = EnemyNear,StateType != A
Trigger1 = (EnemyNear,GetHitVar(HitTime) = [5,6]) || (EnemyNear,Facing = Facing && P2BodyDist x < -15)
Trigger1 = P2BodyDist x - Vel X * 6 - fvar(37) * 6 < 45
Trigger1 = P2BodyDist Y - Vel Y * 6 - const(movement.yaccel) * 6 * (6 + 1) / 2 <= ifelse(EnemyNear,StateType = C,35,45)
Trigger1 = var(50) := 33035

Trigger2 = fvar(9) >= 7
Trigger2 = EnemyNear,StateType != A
Trigger2 = StateNo = 105 && ((EnemyNear,GetHitVar(HitTime) = [5,6]) || fvar(9) < 7.8)
Trigger2 = var(50) := 33036

Trigger3 = EnemyNear,StateType = A
Trigger3 = P2BodyDist x - Vel x * 6 - ifelse(EnemyNear,Facing != Facing,1,-1)*fvar(37) * 14 = [-25, 45]
Trigger3 = P2BodyDist y - Vel Y * 6 - const(movement.yaccel) * 6 * (6 + 1) / 2 + EnemyNear,Vel Y * 6 + fvar(38) * 6 * (6 + 1) / 2 = [-45,35]
Trigger3 = var(50) := 33037

[State -3, 奈落]
type = ChangeState
value = 330
;triggerall = var(59)
TriggerAll = Ctrl || StateNo = [120,149]
TriggerAll = StateType = A
TriggerAll = EnemyNear,StateNo < 5000
TriggerAll = EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = fvar(9) >= 7
;对非版边地面
Trigger1 = EnemyNear,BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - Vel X * 6 - fvar(37) * 6 < 45
Trigger1 = P2BodyDist Y - Vel Y * 6 - const(movement.yaccel) * 6 * (6 + 1) / 2 <= ifelse((P2BodyDist x - Vel X * 6 - fvar(37) * 6 < -10), ifelse(EnemyNear,StateType = C,30,47), 40)
Trigger1 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 23) || fvar(9) <= 9 || P2BodyDist x < -5
Trigger1 = var(50) := 33031
;对版边地面
Trigger2 = EnemyNear,BackEdgeBodyDist < 10 || EnemyNear,FrontEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x - Vel X * 6 - fvar(37) * 6  < 45
Trigger2 = P2BodyDist Y - Vel Y * 6 - const(movement.yaccel) * 6 * (6 + 1) / 2 <= 40
Trigger2 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 23) || fvar(9) <= 9
Trigger2 = var(50) := 33032
;对空
Trigger3 = EnemyNear,StateNo != 5040
Trigger3 = EnemyNear,StateType = A
Trigger3 = P2BodyDist x - Vel x * 6 - ifelse(EnemyNear,Facing != Facing,1,-1)*fvar(37) * 14 = [-25, 45]
Trigger3 = P2BodyDist y - Vel Y * 6 - const(movement.yaccel) * 6 * (6 + 1) / 2 + EnemyNear,Vel Y * 6 + fvar(38) * 6 * (6 + 1) / 2 = [-45,35]
Trigger3 = var(50) := 33033
;对空版边
Trigger4 = EnemyNear,StateNo != 5040
Trigger4 = EnemyNear,StateType = A
Trigger4 = EnemyNear,BackEdgeBodyDist < 10
Trigger4 = P2BodyDist x - Vel x * 6 - ifelse(EnemyNear,Facing != Facing,1,-1)*fvar(37) * 6 < 45
Trigger4 = P2BodyDist y - Vel Y * 6 - const(movement.yaccel) * 6 * (6 + 1) / 2 + EnemyNear,Vel Y * 6 + fvar(38) * 6 * (6 + 1) / 2 = [-45,35]
Trigger4 = var(50) := 33034


[State -3,JCD]
type = ChangeState
value = 650
TriggerAll = var(59)
TriggerAll = Ctrl || StateNo = [120,149]
TriggerAll = StateType = A
Triggerall = StateNo != 105
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = fvar(9) >= 18
;对非版边地面
Trigger1 = EnemyNear,StateNo < 200
Trigger1 = EnemyNear,BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - Vel X * 16 - fvar(37) * 16 = [-10, 25]
Trigger1 = P2BodyDist Y - Vel Y * 16 - const(movement.yaccel) * 16 * (16 + 1) / 2 <= ifelse(EnemyNear,StateType = C,10,20)
Trigger1 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 28) || fvar(9) <= 26
Trigger1 = var(50) := 65031
;对版边地面
Trigger2 = EnemyNear,StateNo < 200
Trigger2 = EnemyNear,BackEdgeBodyDist < 10 || EnemyNear,FrontEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x - Vel X * 16 - fvar(37) * 16  = [-5, 53]
Trigger2 = P2BodyDist Y - Vel Y * 16 - const(movement.yaccel) * 16 * (16 + 1) / 2 <= ifelse(EnemyNear,StateType = C,10,20)
Trigger2 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 28) || fvar(9) <= 26
Trigger2 = var(50) := 65032
;对空
Trigger3 = EnemyNear,StateNo != 5040
Trigger3 = EnemyNear,StateType = A
Trigger3 = P2BodyDist x - Vel x * 16 - fvar(37) * 16 < 30
Trigger3 = P2BodyDist y - Vel Y * 16 - const(movement.yaccel) * 16 * (16 + 1) / 2 + EnemyNear,Vel Y * 16 + fvar(38) * 16 * (16 + 1) / 2 = [-25,30]
Trigger3 = var(50) := 65033
IgnoreHitPause = 1

[State -3,垂直JD]
type = ChangeState
value = 640
TriggerAll = var(59)
TriggerAll = Ctrl || StateNo = [120,149]
TriggerAll = StateType = A
Triggerall = StateNo != 105
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = Vel x = 0
TriggerAll = fvar(9) >= 7
;对非版边地面
Trigger1 = EnemyNear,BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - Vel X * 7 - fvar(37) * 7 < 53
Trigger1 = P2BodyDist Y - Vel Y * 7 - const(movement.yaccel) * 7 * (7 + 1) / 2 <= ifelse(EnemyNear,StateType = C,50,70)
Trigger1 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 14) || fvar(9) <= 11
Trigger1 = var(50) := 64031
;对版边地面
Trigger2 = EnemyNear,BackEdgeBodyDist < 10 || EnemyNear,FrontEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x - Vel X * 7 - fvar(37) * 7  < 53
Trigger2 = P2BodyDist Y - Vel Y * 7 - const(movement.yaccel) * 7 * (7 + 1) / 2 <= ifelse(EnemyNear,StateType = C,50,70)
Trigger2 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 14) || fvar(9) <= 11
Trigger2 = var(50) := 64032
;对空
Trigger3 = EnemyNear,StateNo != 5040
Trigger3 = EnemyNear,StateType = A
Trigger3 = P2BodyDist x - Vel x * 7 - fvar(37) * 7 < 60
Trigger3 = P2BodyDist y - Vel Y * 7 - const(movement.yaccel) * 7 * (7 + 1) / 2 + EnemyNear,Vel Y * 7 + fvar(38) * 7 * (7 + 1) / 2 = [-55,55]
Trigger3 = var(50) := 64033
IgnoreHitPause = 1

[State -3,JD]
type = ChangeState
value = 645
TriggerAll = var(59)
TriggerAll = Ctrl || StateNo = [120,149]
TriggerAll = StateType = A
Triggerall = StateNo != 105
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = Vel x != 0
TriggerAll = fvar(9) >= 10
;对非版边地面
Trigger1 = EnemyNear,BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType = S
Trigger1 = P2BodyDist x - Vel X * 9 - fvar(37) * 9 = [30, 55]
Trigger1 = P2BodyDist Y - Vel Y * 9 - const(movement.yaccel) * 9 * (9 + 1) / 2 <= ifelse(EnemyNear,StateType = C,40,50)
Trigger1 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 16) || fvar(9) <= 13
Trigger1 = var(50) := 64531
;对版边地面
Trigger2 = EnemyNear,BackEdgeBodyDist < 10 || EnemyNear,FrontEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType = S
Trigger2 = P2BodyDist x - Vel X * 9 - fvar(37) * 9  = [-10, 67]
Trigger2 = P2BodyDist Y - Vel Y * 9 - const(movement.yaccel) * 9 * (9 + 1) / 2 <= ifelse(EnemyNear,StateType = C,40,50)
Trigger2 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 16) || fvar(9) <= 13
Trigger2 = var(50) := 64532
;对空
Trigger3 = EnemyNear,StateNo != 5040
Trigger3 = EnemyNear,StateType = A
Trigger3 = P2BodyDist x - Vel x * 9 - fvar(37) * 9 < 67
Trigger3 = P2BodyDist y - Vel Y * 9 - const(movement.yaccel) * 9 * (9 + 1) / 2 + EnemyNear,Vel Y * 9 + fvar(38) * 9 * (9 + 1) / 2 = [-45,45]
Trigger3 = var(50) := 64533
IgnoreHitPause = 1


[State -3,垂直JB]
type = ChangeState
value = 630
triggerall = var(59)
TriggerAll = Ctrl || StateNo = [120,149]
Triggerall = StateNo != 105
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = Vel x = 0
TriggerAll = fvar(9) >= 5
;对空
Trigger1 = EnemyNear,StateNo != 5040
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - Vel x * 6 - fvar(37) * 6 = [-5,25]
Trigger1 = P2BodyDist y - Vel Y * 6 - const(movement.yaccel) * 6 * (6 + 1) / 2 + EnemyNear,Vel Y * 6 + fvar(38) * 6 * (6 + 1) / 2 = [-30,60]
Trigger1 = var(50) := 63031
IgnoreHitPause = 1


[State -3,JB]
type = ChangeState
value = 635
TriggerAll = var(59)
TriggerAll = Ctrl || StateNo = [120,149]
Triggerall = StateNo != 105
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = Vel x != 0
TriggerAll = fvar(9) >= 6
;对非版边地面
Trigger1 = EnemyNear,BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - Vel X * 6 - fvar(37) * 6 = [-5, 30]
Trigger1 = P2BodyDist Y - Vel Y * 6 - const(movement.yaccel) * 6 * (6 + 1) / 2 <= ifelse(EnemyNear,StateType = C,40,50)
Trigger1 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 12) || fvar(9) <= 9
Trigger1 = var(50) := 63531
;对版边地面
Trigger2 = EnemyNear,BackEdgeBodyDist < 10 || EnemyNear,FrontEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x - Vel X * 6 - fvar(37) * 6  = [-5, 30]
Trigger2 = P2BodyDist Y - Vel Y * 6 - const(movement.yaccel) * 6 * (6 + 1) / 2 <= ifelse(EnemyNear,StateType = C,40,50)
Trigger2 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 12) || fvar(9) <= 9
Trigger2 = var(50) := 63532
;对空
Trigger3 = EnemyNear,StateNo != 5040
Trigger3 = EnemyNear,StateType = A
Trigger3 = P2BodyDist x - Vel x * 6 - fvar(37) * 6 = [-5,25]
Trigger3 = P2BodyDist y - Vel Y * 6 - const(movement.yaccel) * 6 * (6 + 1) / 2 + EnemyNear,Vel Y * 6 + fvar(38) * 6 * (6 + 1) / 2 = [-10,60]
Trigger3 = var(50) := 63533
IgnoreHitPause = 1

[State -3,JC]
type = ChangeState
value = 610
TriggerAll = var(59)
TriggerAll = Ctrl || StateNo = [120,149]
Triggerall = StateNo != 105
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = fvar(9) >= 7
;对非版边地面
Trigger1 = EnemyNear,BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - Vel X * 6 - fvar(37) * 6 = [-5, 60]
Trigger1 = P2BodyDist Y - Vel Y * 6 - const(movement.yaccel) * 6 * (6 + 1) / 2 <= ifelse(EnemyNear,StateType = C,40,55)
Trigger1 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 13) || fvar(9) <= 10
Trigger1 = var(50) := 61031
;对版边地面
Trigger2 = EnemyNear,BackEdgeBodyDist < 10 || EnemyNear,FrontEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x - Vel X * 6 - fvar(37) * 6  = [0, 60]
Trigger2 = P2BodyDist Y - Vel Y * 6 - const(movement.yaccel) * 6 * (6 + 1) / 2 <= ifelse(EnemyNear,StateType = C,40,55)
Trigger2 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 13) || fvar(9) <= 10
Trigger2 = var(50) := 61032

;------------------------------------------------------------------------------------------------
;以下是投技，注意优先级不要比抓硬直高
;------------------------------------------------------------------------------------------------
[State -3,D投]
type = ChangeState
value = 801
TriggerAll = var(59)
triggerall = var(11) = 1
TriggerAll = StateType != A
TriggerAll = EnemyNear,MoveType != H && EnemyNear,StateType != A
TriggerAll = P2BodyDist X = [-15,15]
TriggerAll = EnemyNear,StateNo != 52
TriggerAll = BackEdgeBodyDist < 80
Trigger1 = EnemyNear,Vel Y = 0
Trigger1 = EnemyNear,MoveType != H && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
Trigger1 = EnemyNear,Ctrl || EnemyNear,StateNo < 200
Trigger1 = var(50) := 80131

Trigger2 = EnemyNear,MoveType = A || EnemyNear,MoveType = I
Trigger2 = EnemyNear,AnimTime >= -2
Trigger2 = var(50) := 80133
IgnoreHitPause = 1

[State -3,C投]
type = ChangeState
value = 800
TriggerAll = var(59)
triggerall = var(11) = 1
TriggerAll = StateType != A
TriggerAll = EnemyNear,MoveType != H && EnemyNear,StateType != A
TriggerAll = P2BodyDist X = [-15,15] 
TriggerAll = EnemyNear,StateNo != 52
Trigger1 = EnemyNear,Vel Y = 0
Trigger1 = EnemyNear,MoveType != H && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
Trigger1 = EnemyNear,Ctrl || EnemyNear,StateNo < 200
Trigger1 = var(50) := 80031
Trigger2 = EnemyNear,MoveType = A || EnemyNear,MoveType = I
Trigger2 = EnemyNear,AnimTime >= -2
Trigger2 = var(50) := 80033
IgnoreHitPause = 1


;--------------------------------------------------------------------------------------------------
;站立技能

[State -3,近5C]
type = ChangeState
value = 215
TriggerAll = var(59)
TriggerAll = var(11) = 1
TriggerAll = StateType != A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
triggerall = p2bodydist X < 24
TriggerAll = !PlayerIdExist(Helper(33333333),var(3)) || abs(PlayerId(Helper(33333333),var(3)),P2BodyDist x) > 50 
;一段立回对空
Trigger1 = !InGuardDist
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - fvar(37) * 4 = [-5,35]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 4 + fvar(38) * 4 * (4 + 1) / 2 = [-40,-25]
Trigger1 = var(50) := 021531
;二段对空
Trigger2 = !InGuardDist
Trigger2 = EnemyNear,StateType = A
Trigger2 = P2BodyDist x - fvar(37) * 7 = [-5,30]
Trigger2 = EnemyNear,pos y + EnemyNear,Vel Y * 7 + fvar(38) * 7 * (7 + 1) / 2 = [-85,-35]
Trigger2 = var(50) := 021532
;一段抢空
Trigger3 =  EnemyNear,MoveType = A
Trigger3 = EnemyNear,StateType = A
trigger3 = EnemyNear,stateno = helper(33000),var(2)
trigger3 = EnemyNear,time < helper(33000),var(3) - 4
Trigger3 = P2BodyDist x - fvar(37) * 4 = [-5,38]
Trigger3 = EnemyNear,pos y + EnemyNear,Vel Y * 4 + fvar(38) * 4 * (4 + 1) / 2 = [-40,-25]
Trigger3 = var(50) := 021533

[State -3,远5C]
type = ChangeState
value = 210
TriggerAll = var(59)
TriggerAll = var(11) = 1
TriggerAll = StateType != A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = !PlayerIdExist(Helper(33333333),var(3)) || abs(PlayerId(Helper(33333333),var(3)),P2BodyDist x) > 50 
;对空
Trigger1 = EnemyNear,Facing != Facing
Trigger1 = !InGuardDist
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - fvar(37) * 9 = [-5,56]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 9 + fvar(38) * 9 * (9 + 1) / 2 = [-35,-15]
Trigger1 = var(50) := 021031


[State -3,近5A]
type = ChangeState
value = 205
TriggerAll = var(59)
TriggerAll = var(11) = 1
TriggerAll = StateType != A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
triggerall = p2bodydist x < 18
TriggerAll = !PlayerIdExist(Helper(33333333),var(3)) || abs(PlayerId(Helper(33333333),var(3)),P2BodyDist x) > 50 
;立回对空
Trigger1 = !InGuardDist
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - fvar(37) * 3 = [-5,35]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 3 + fvar(38) * 3 * (3 + 1) / 2 = [-45,-25]
Trigger1 = var(50) := 020531
;抢空
Trigger2=  EnemyNear,MoveType = A
Trigger2 = EnemyNear,StateType = A
trigger2 = EnemyNear,stateno = helper(33000),var(2)
trigger2 = EnemyNear,time < helper(33000),var(3) - 3
Trigger2 = P2BodyDist x - fvar(37) * 3 = [-5,38]
Trigger2 = EnemyNear,pos y + EnemyNear,Vel Y * 3 + fvar(38) * 3 * (3 + 1) / 2 = [-45,-25]
Trigger2 = var(50) := 020532
;对地
Trigger3 = !InGuardDist
Trigger3 = var(46) = 0
Trigger3 = var(45) != 205
Trigger3 = EnemyNear,StateType = S
Trigger3 = p2bodydist x < 18
Trigger3 = var(50) := 020533
Trigger3 = var(46) := var(46) + 60
Trigger3 = var(45) := 205



[State -3,远5A]
type = ChangeState
value = 200
TriggerAll = var(59)
TriggerAll = var(11) = 1
TriggerAll = StateType != A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = !PlayerIdExist(Helper(33333333),var(3)) || abs(PlayerId(Helper(33333333),var(3)),P2BodyDist x) > 50 
;立回对空
Trigger1 = !InGuardDist
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - fvar(37) * 3 = [-10,49]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 3 + fvar(38) * 3 * (3 + 1) / 2 = [-50,-25]
Trigger1 = var(50) := 020031
;抢空
Trigger2=  EnemyNear,MoveType = A
Trigger2 = EnemyNear,StateType = A
trigger2 = EnemyNear,stateno = helper(33000),var(2)
trigger2 = EnemyNear,time < helper(33000),var(3) - 3
Trigger2 = P2BodyDist x - fvar(37) * 3 = [-10,49]
Trigger2 = EnemyNear,pos y + EnemyNear,Vel Y * 3 + fvar(38) * 3 * (3 + 1) / 2 = [-50,-25]
Trigger2 = var(50) := 020032
;对地
Trigger3 = var(46) = 0
Trigger3 = var(45) != 200
Trigger3 = !InGuardDist
Trigger3 = EnemyNear,StateType = S
Trigger3 = p2bodydist x >= 18
Trigger3 = P2BodyDist x - fvar(37) * 3 = [-10,49]
Trigger3 = var(50) := 020033
Trigger3 = var(46) := var(46) + 60
Trigger3 = var(45) := 200


[State -3,远B]
type = ChangeState
value = 230
TriggerAll = var(59)
TriggerAll = var(11) = 1
TriggerAll = StateType != A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
triggerall = p2bodydist X >= 14
TriggerAll = !PlayerIdExist(Helper(33333333),var(3)) || abs(PlayerId(Helper(33333333),var(3)),P2BodyDist x) > 50 
;对空
Trigger1 = EnemyNear,Facing != Facing
Trigger1 = !InGuardDist
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - fvar(37) * 6 = [10,70]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 6 + fvar(38) * 6 * (6 + 1) / 2 = [-30,-10]
Trigger1 = var(50) := 023031
;对地面 先禁止了
Trigger2 = Life > 300
Trigger2 = var(45) != 230
Trigger2 = var(46) = 0
Trigger2 = EnemyNear,StateNo < 200
Trigger2 = EnemyNear,Vel x >= 0
Trigger2=  EnemyNear,MoveType != A
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x = [85, 90]
Trigger2 = var(50) := 023032
Trigger2 = var(46) := var(46) + 180
Trigger2 = var(45) := 230


;--------------------------------------------------------------------------------------------------
;蹲技能
[State -3,2C]
type = ChangeState
value = 410
TriggerAll = var(59)
TriggerAll = var(11) = 1
TriggerAll = StateType != A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
Triggerall = !enemy,numproj && !PlayerIdExist(Helper(33333333),var(3)) 
;立回对空
Trigger1 = EnemyNear,Facing != Facing
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - fvar(37) * 10 = [-10,45]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 10 + fvar(38) * 10 * (10 + 1) / 2 = [-80,-30]
Trigger1 = var(50) := 041031

[State -3,2A]
type = ChangeState
value = 400
TriggerAll = var(59)
TriggerAll = var(11) = 1
TriggerAll = var(46) < 60
TriggerAll = StateType != A
TriggerAll = (EnemyNear,Ctrl || EnemyNear,StateNo <= 199)
TriggerAll = !InGuardDist
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对地
Trigger1 = !PlayerIdExist(Helper(33333333),var(3)) || abs(PlayerId(Helper(33333333),var(3)),P2BodyDist x) > 50 
Trigger1 = (P2BodyDist x >= 0 && EnemyNear,Facing != Facing) || (P2BodyDist x <= 0 && EnemyNear,Facing = Facing)
Trigger1 = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
Trigger1 = EnemyNear,Vel x >= 0
Trigger1 = P2BodyDist x = [-32, 32]
Trigger1 = var(50) := 040031
Trigger1 = var(46) := var(46) + 60
Trigger1 = var(45) := 400
IgnoreHitPause = 1

[State -3,2B]
type = ChangeState
value = 430
TriggerAll = var(59)
TriggerAll = var(11) = 1
TriggerAll = var(46) = 0
TriggerAll = var(45) != 430
TriggerAll = StateType != A
TriggerAll = (EnemyNear,Ctrl || EnemyNear,StateNo <= 199)
TriggerAll = !InGuardDist
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对地
Trigger1 = !PlayerIdExist(Helper(33333333),var(3)) || abs(PlayerId(Helper(33333333),var(3)),P2BodyDist x) > 50 
Trigger1 = (P2BodyDist x >= 0 && EnemyNear,Facing != Facing) || (P2BodyDist x <= 0 && EnemyNear,Facing = Facing)
Trigger1 = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
Trigger1 = (P2BodyDist x + ifelse((EnemyNear,StateNo = [18,24]),0,fvar(37))*3 = [-56, -45]) || P2BodyDist x - ifelse((EnemyNear,StateNo = [18,40]),0,fvar(37))*3 =[45, 56]
Trigger1 = var(50) := 043031
Trigger1 = var(46) := var(46) + 60
Trigger1 = var(45) := 430


IgnoreHitPause = 1


;--------------------------------------------------------------------------------------------------
;必杀技

[State -3,大升龙]
type = ChangeState
value = 1150
TriggerAll = var(59)
TriggerAll = var(11) = [1,3]
TriggerAll = StateType != A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对空
Trigger1 = EnemyNear,Facing != Facing
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - fvar(37) * 5 = [-5,60]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 5 + fvar(38) * 5 * (5 + 1) / 2 = [-40,-15]
Trigger1 = var(50) := 115031
IgnoreHitPause = 1

[State -3,暗勾手]
type = ChangeState
TriggerAll = var(59)
TriggerAll = var(11) = 1
triggerall = numhelper(1011) = 0 && numhelper(1012) = 0
TriggerAll = StateType != A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
TriggerAll = P2BodyDist x > 190

Trigger1 = (EnemyNear,Ctrl || EnemyNear,StateNo <= 22)
Trigger1 = !inguarddist
Trigger1 = Random < 50
Trigger1 = var(54) := 1000
trigger1 = var(50) := 100031

Trigger2 = EnemyNear,StateNo >= 1000 && EnemyNear,AnimTime < -25
Trigger2 = PlayerIdExist(helper(33333333),var(3)) 
Trigger2 = PlayerID(helper(33333333),var(3)),p2bodydist x > 100
Trigger2 = var(54) := 1050
trigger2 = var(50) := 105031


Trigger3 = EnemyNear,NumProj
Trigger3 = EnemyNear,StateNo >= 1000 && EnemyNear,AnimTime < -30
Trigger3 = var(54) := 1050
trigger3 = var(50) := 105032
value = var(54)
IgnoreHitPause = 1

;=================================================================================
;其他2
;=================================================================================
[State -3,蓄力结束]
type = changestate
TriggerAll = var(59)
TriggerAll = roundstate = 2
TriggerAll = StateType != A 
Triggerall = StateNo = 911
Trigger1 = EnemyNear,MoveType = A
Trigger1 = var(50) := 91221
Trigger2 = EnemyNear,MoveType != H
Trigger2 = P2BodyDist x - EnemyNear,Vel x * 4 <= 90
Trigger2 = var(50) := 91222
Trigger3 = EnemyNear,NumProj
Trigger3 = var(50) := 91223
Trigger4 = PlayerIdExist(helper(33333333),var(3)) 
Trigger4 = PlayerId(helper(33333333),var(3)),p2bodydist x - PlayerId(helper(33333333),var(3)),vel x * 4 < 90
Trigger4 = var(50) := 91224
Trigger5 = EnemyNear,StateNo = 5120 && P2BodyDist X < 80
value = 912

[State -3,蓄气]
type = changestate
TriggerAll = var(59)
Triggerall = var(11) = 1
TriggerAll = roundstate = 2
TriggerAll = StateType != A 
TriggerAll = !inguarddist
Triggerall = Power <= (PowerMax - 500)
Triggerall = var(20) = 0
Triggerall = !EnemyNear,Ctrl && !EnemyNear,MoveType != A
Triggerall = !EnemyNear,NumProj && !PlayerIdExist(helper(33333333),var(3))
Trigger1 = EnemyNear,StateType != A || EnemyNear,Pos Y >= 0
Trigger1 = EnemyNear,StateNo = [116000,116110]
Trigger1 = var(50) := 9102
Trigger2 = StateNo >= 100 && !EnemyNear,Ctrl
Trigger2 = P2BodyDist x > 180
Trigger2 = P2BodyDist x - EnemyNear,Vel x * 4 > 90
Trigger2 = var(50) := 91022
value = 910

[State -3,后滚]
type = changestate
TriggerAll = var(59)
TriggerAll = roundstate = 2
TriggerAll = StateType != A 
TriggerAll = var(11) = 1
TriggerAll = EnemyNear,MoveType = A && !EnemyNear,Ctrl
TriggerAll = helper(33000),var(11) != 3
TriggerAll = BackEdgeBodyDist >= 60
TriggerAll = inguarddist
TriggerAll = !EnemyNear,numproj && !PlayerIdExist(helper(33333333),var(3))
TriggerAll = EnemyNear,Vel X = 0
;对方攻击的距离大于我们能攻击到的最大距离，就后撤一下
Trigger1 = Life >= 200
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x = [75,90]
Trigger1 = EnemyNear,Vel X <= 0
Trigger1 = EnemyNear,animtime = [-25, -10]
Trigger1 = var(50) := 71021

Trigger2 = P2BodyDist x = [60,90]
Trigger2 = EnemyNear,StateType = A
Trigger2 = fvar(37) > 0
Trigger2 = EnemyNear,Vel y < 0
Trigger2 = EnemyNear,pos y <= -60
Trigger2 = var(50) := 71022
value = 710



[State -3,刚CD]
type = ChangeState
value = 300
TriggerAll = var(59)
TriggerAll = StateNo = [150,152]
TriggerAll = power >= 3500 || (EnemyNear,life < 50 && Power >= 1000)
TriggerAll = EnemyNear,animtime < -5
TriggerAll = !EnemyNear,Ctrl && EnemyNear,MoveType = A
;对空
Trigger1 = EnemyNear,Vel x >= 0
Trigger1 = Fvar(11) >= 7
Trigger1 = GetHitVar(Hittime) - fvar(11) >= 4
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x = [-4, 50]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 6 + fvar(38) * 6 * (6 + 1) / 2 >= -55
Trigger1 = var(50) := 30021
IgnoreHitPause = 1


[State -3, 落地受身]
type = ChangeState
value = 5201
triggerall = var(59) 
triggerall = alive
trigger1 = stateno = 5050
trigger1 = pos y > 0
trigger1 = vel y > 0
Trigger1 = var(50) := 520121
IgnoreHitPause = 1


;=================================================================================
;防御1
;=================================================================================
[State -1, 防御]
Type = ChangeState
Value = 120
TriggerAll = var(59) 
TriggerAll = RoundState = 2
TriggerAll = Ctrl || StateNo = 1 || (StateNo = [18,19]) ||StateNo = [99,100]  

Trigger1 = InGuardDist
Trigger1 = StateType != A || (StateType = A && Helper(33000),var(11) != 4)
Trigger1 = var(50) := 012011

Trigger2 = P2BodyDist X= [-50,50]
Trigger2 = NumHelper(33000)>0
Trigger2 = Helper(33000),InGuardDist
Trigger2 = Facing*EnemyNear,Facing!=-1 || P2Dist X<0
Trigger2 = var(50) := 012012
IgnoreHitPause = 1