;=================================================================================
;State0代替
;=================================================================================
[Statedef 1]
type = S
physics = S
sprpriority = 0

[State 1]
type = ChangeState
Trigger1 = RoundState != 2
Trigger2 = P2BodyDist x < 0
value = 0
Ctrl = 1
ignorehitpause = 1


[State 1]
type = ChangeAnim
trigger1 = Anim != var(1) && Anim != 5
trigger2 = Anim = 5 && AnimTime = 0 ;Turn anim over
value = var(1)

[State 1]
type = VelSet
trigger1 = Time = 0
y = 0

[State 1] ;Stop moving if low velocity or 4 ticks pass
type = VelSet
trigger1 = abs(vel x) < 2
trigger2 = Time = 4
x = 0

[State 1]
type = removeexplod
trigger1 = time = 0
ID = 2

[State 1]
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

[State 1]
type = ChangeState
trigger1 = !alive
value = 5050

[State 1]
type = Turn
trigger1 = teammode = single || teammode = turns
trigger1 = p2dist x < 0

;=================================================================================
;AI用前行
;=================================================================================
[Statedef 19]
type    = S
physics = S
sprpriority = 0
ctrl = 0

[State 21, 1]
Type = Turn
Trigger1 = P2Dist X < 0

[State 20, 1]
type = VelSet
Trigger1 = 1
x = const(Velocity.walk.fwd.x)

[State 20, 3]
type = ChangeAnim
TriggerAll = Vel x > 0
Trigger1 = Anim != 20 && Anim != 5
Trigger2 = Anim = 5 && AnimTime = 0
value = 20

[State 19, Exit]
type = ChangeState
TriggerAll = Time >= 16
Trigger1 = RoundState != 2
Trigger1 = var(50) := 1111901
;
Trigger2 = EnemyNear,Ctrl
Trigger2 = P2BodyDist X <= 55
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
Trigger7 = P2BodyDist x <= var(51)
Trigger7 = var(50) := 1111907

Trigger8 = EnemyNear,MoveType = H
Trigger8 = P2BodyDist X <= 15
Trigger8 = var(50) := 1111908

value = ifelse(var(59)=0,0,1)
ctrl = ifelse(var(59)=0,1,0)

;=================================================================================
;AI用后退
;=================================================================================
[Statedef 18]
type    = S
physics = S
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
Trigger7 = P2BodyDist x >= var(51)

value = ifelse(var(59)=0,0,1)
ctrl = ifelse(var(59)=0,1,0)

;=================================================================================
;AI用跳跃
;=================================================================================
[Statedef 39]
type = S
movetype = I
physics = S
anim = 40
ctrl = 0
sprpriority = 1

[State 39]
type = NotHitBy
trigger1 = Time = 0
value = ,AT
time = 4

[State 39, Var]
type = varset
Trigger1 = var(33) <= 4
sysvar(1) = 1

[State 39, Var]
type = varset
Trigger1 = var(33) = [5,8]
sysvar(1) = -1

[State 39, Var]
type = varset
Trigger1 = var(33) >= 9
sysvar(1) = 0

;--------------------------------------------------------------
;前小跳
[State 39, Vel]
type = Velset
Trigger1 = !animtime
Trigger1 = var(33) = 1
x = const(Velocity.jump.fwd.x)
y = -5

;--------------------------------------------------------------
;前小影跳
[State 39, Vel]
type = Velset
Trigger1 = !animtime
Trigger1 = var(33) = 2
x = 5
y = -5

;--------------------------------------------------------------
;前中跳
[State 39, Vel]
type = Velset
Trigger1 = !animtime
Trigger1 = var(33) = 3
x = const(Velocity.jump.fwd.x)
y = const(Velocity.jump.y)

;--------------------------------------------------------------
;前中影跳
[State 39, Vel]
type = Velset
Trigger1 = !animtime
Trigger1 = var(33) = 4
x = 5
y = const(Velocity.jump.y)

;--------------------------------------------------------------
;后小跳
[State 39, Vel]
type = Velset
Trigger1 = !animtime
Trigger1 = var(33) = 5
x = const(Velocity.jump.back.x)
y = -5

;--------------------------------------------------------------
;后小影跳
[State 39, Vel]
type = Velset
Trigger1 = !animtime
Trigger1 = var(33) = 6
x = -5
y = -5

;--------------------------------------------------------------
;后中跳
[State 39, Vel]
type = Velset
Trigger1 = !animtime
Trigger1 = var(33) = 7
x = const(Velocity.jump.back.x)
y = const(Velocity.jump.y)

;--------------------------------------------------------------
;后中影跳
[State 39, Vel]
type = Velset
Trigger1 = !animtime
Trigger1 = var(33) = 8
x = -5
y = const(Velocity.jump.y)

;--------------------------------------------------------------
;原地小影跳
[State 39, Vel]
type = Velset
Trigger1 = !animtime
Trigger1 = var(33) = 7
x = const(Velocity.jump.neu.x)
y = -5

;--------------------------------------------------------------
;原地中影跳
[State 39, Vel]
type = Velset
Trigger1 = !animtime
Trigger1 = var(33) = 8
x = const(Velocity.jump.neu.x)
y = const(Velocity.jump.y)


[State 39,]
type = VelSet
Trigger1 = (AnimTime = 0)
Trigger1 = (PrevStateNo = 100) || (PrevStateNo = 99)
Trigger1 = (sysvar(1) = 1)
Trigger1 = var(33) = [1,4]
x = const(Velocity.runjump.fwd.x)

[State 40,]
type = Turn
TriggerAll = (PrevStateNo = 52)
Trigger1 = (Time = 0) && (P2Dist X < 0)
Persistent = 0

[State 40,PlaySnd]
type = PlaySnd
triggerall = AnimTime = 0
Trigger1 = (PrevStateNo = 100) || (PrevStateNo = 99) || PrevStateNo = 10
value = 40, 1

[State 40,PlaySnd]
type = PlaySnd
triggerall = AnimTime = 0
trigger1 = (PrevStateNo != 100) && (PrevStateNo != 99) && (PrevStateNo != 10)
value = 40, 0

[State -3]
type = AfterImage
triggerall = AnimTime = 0
trigger1 = var(33) = 2 || var(33) = 4
trigger2 = var(33) = 6 || var(33) = 8
trigger2 = var(33) = 9 || var(33) = 10
time = 10
trans = add1
timegap = 1
framegap = 2
length = 8
palbright = 12,12,12
palcontrast = 225,225,225
palpostbright = 0,0,0
paladd = 0,0,0
palmul = 1,1,1

[State 4600,10]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
Ctrl = 1

;=================================================================================
;AI用前跑
;=================================================================================
[Statedef 99]
type    = S
movetype = I
physics = N
anim = 100
ctrl = 0


[State 99]
type = PlaySnd
trigger1 = Time= 0
value = 100, 0
loop = 1
channel = 1


[State 99]
type = VelSet
trigger1 = AnimElem = 2,>=0
x = const(velocity.run.fwd.x)

[State 99]
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 99]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn


[State 100, 4]
type = ChangeState

Trigger1 = time >= 12
Trigger1 = AnimTime = 0
Trigger1 = var(50) := 1119901
;对方可控的情况下，不要跑太近
Trigger2 = P2BodyDist X <= 55
Trigger2 = P2BodyDist Y >= -120
Trigger2 = EnemyNear,MoveType != H && (EnemyNear,Ctrl || EnemyNear,StateNo < 200)
Trigger2 = EnemyNear,facing != facing || P2BodyDist X < 0
Trigger2 = var(50) := 1119902

Trigger3 = time >= 12
Trigger3 = EnemyNear,StateType = L
Trigger3 = P2BodyDist X < 55
Trigger3 = var(50) := 1119903

Trigger4 = time >= 12
Trigger4 = InGuardDist
Trigger4 = EnemyNear,facing != facing
Trigger4 = var(50) := 1119904

Trigger5 = time >= 12
Trigger5 = !EnemyNear,Ctrl && EnemyNear,MoveType = I
Trigger5 = P2BodyDist x < 20
Trigger5 = var(50) := 1119905

Trigger6 = EnemyNear,MoveType = H
Trigger6 = EnemyNear,StateNo >= 5000
Trigger6 = P2BodyDist x <= ifelse(EnemyNear,StateNo = 5040, 45, 10)
Trigger6 = var(50) := 1119906

value = 101








[Statedef -3]
;=================================================================================
;落地音效、起跳音效
;=================================================================================
[State -3, Landing Sound]
type = PlaySnd
triggerall = Time = 1
trigger1 = StateNo = 52 
trigger2 = StateNo = 106
value = 41, 0

[State -3, 2]
type = PlaySnd
triggerall = var(59) = 0
triggerall = time = 1
trigger1 = StateNo = 40 
trigger1 = var(15) <= 0
value = 40, 0
channel = 3

[State -3, 2]
type = PlaySnd
triggerall = var(59) = 0
triggerall = time = 1
trigger1 = StateNo = 40 
trigger1 = var(15) > 1
value = 40, 1
channel = 3

;=================================================================================
;手操小跳、影跳
;=================================================================================
[State -3]
type = varset
triggerall = var(59) = 0
trigger1 = StateNo = 10
trigger1 = time = 0
trigger2 = StateNo = 100
v = 15
value = 20

[State -3]
type = varset
triggerall = var(59) = 0
trigger1 = StateNo = 52
trigger1 = time = 0
v = 15
value = 0

[State -3]
type = varset
triggerall = var(59) = 0
trigger1 = StateNo = 40
trigger1 = command != "holdup"
v = 16
value = 1

[State -3]
type = varset
triggerall = var(59) = 0
trigger1 = StateNo = 40
trigger1 = command = "holdup"
v = 16
value = 0

[State -3, 5]
type = velset
triggerall = var(59) = 0
trigger1 = StateNo = 50
trigger1 = anim = 42
trigger1 = time = 1
trigger1 = var(15) >= 1
x = 5
;y = -9


[State -3]
type = velset
triggerall = var(59) = 0
trigger1 = StateNo = 50
trigger1 = anim = 43
trigger1 = time = 1
trigger1 = var(15) >= 1
x = -5
;y = -9

[State -3]
type = veladd
triggerall = var(59) = 0
trigger1 = StateNo = 50
trigger1 = time = 1
trigger1 = var(16) = 1
y = 3

[State -3]
type = AfterImage
triggerall = var(59) = 0
trigger1 = StateNo = 50
trigger1 = time = 1
trigger1 = var(15) >= 1
time = 10
trans = add1
timegap = 1
framegap = 2
length = 8
palbright = 12,12,12
palcontrast = 225,225,225
palpostbright = 0,0,0
paladd = 0,0,0
palmul = 1,1,1


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

;=================================================================================
;打逆不可防用
;=================================================================================
[State -3, 打逆不可防用]
type = AssertSpecial
triggerall = StateNo = [200,4999]
triggerall = MoveType = A
trigger1 = Enemynear,P2Dist x < 0
flag = unguardable

;=================================================================================
;变量设置
;=================================================================================

;---------------------------------------------------------------------------------
;AI Start
;1. 轻拳轻脚movehit中，可以前跳贴着打，类似保利达
;2. 要和duagi的AI对比一下
;3. 430打中自己会后退，这个得改一下
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
;清BC
;---------------------------------------------------------------------------------
[State -3]
type = varset
trigger1 = roundstate < 2
trigger1 = var(20) > 0
var(20) = 0
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
;攻击修正用
;非爆气状态			1
;原地爆气/BC断连 	0.6
;BC连中				0.4
;---------------------------------------------------------------------------------
[State -3]
type = VarSet
trigger1 = var(20) = 0
fvar(39) = 1 
IgnoreHitPause = 1

[State -3]
type = VarSet
triggerAll = var(20) > 0
trigger1 = EnemyNear,MoveType != H 
trigger2 = EnemyNear,Ctrl 
fvar(39) = 0.7
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;可控判别
;---------------------------------------------------------------------------------
[State -3]
type = VarSet
trigger1 = 1
var(2) = 0
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;可控状态
[State -3]
type = VarSet
trigger1 = StateType != A
trigger1 = Ctrl || StateNo = 0 || StateNo = 1 || StateNo = 18 || StateNo = 19 || StateNo = 99 || StateNo = 101 || StateNo = [120,149]
var(2) = 1
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;对应特殊技取消条件
[State -3]
type = VarSet
trigger1 = StateNo = 200 && AnimElem >= 3
trigger2 = StateNo = 205 && AnimElem >= 3
trigger3 = StateNo = 215 && AnimElem >= 4
trigger4 = StateNo = 235 && AnimElem >= 3
trigger5 = StateNo = 245 && AnimElem >= 4
trigger6 = StateNo = 400 && AnimElem >= 2
trigger7 = StateNo = 410 && time >= 1
var(2) = 2
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;对应必杀技的取消条件
[State -3]
type = VarSet
trigger1 = StateNo = 250 && AnimElem >= 10
trigger2 = StateNo = 290 && AnimElem >= 10
trigger3 = StateNo = 450 && AnimElem >= 10
var(2) = 3
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;对应超杀技的取消条件
[State -3]
type = VarSet
Trigger1 = StateNo = 1310 && AnimElem >= 4
Trigger2 = StateNo = 1405 && AnimElemTime(44) > 0
var(2) = 4
IgnoreHitPause = 1


;---------------------------------------------------------------------------------
;目押追击罗杀Reset用
;防止无限连
;---------------------------------------------------------------------------------
[State -3]
type = VarSet
Trigger1 = EnemyNear,StateType = L
Trigger2 = EnemyNear,Ctrl
Trigger3 = EnemyNear,MoveType != H
var(52) = 0
IgnoreHitPause = 1

;=================================================================================
;抢招9
;血量没优势一律2B
;有优势换别的
;=================================================================================
[State -3,蹲轻脚]
type = ChangeState
value = 430
TriggerAll = var(59)
TriggerAll = var(2) = 1
TriggerAll = Random < 200
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,StateNo < 1000
TriggerAll = (EnemyNear,StateNo = Helper(33000),var(2) && EnemyNear,time < Helper(33000),var(3)) || EnemyNear,Time <= 1  
;对地
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x < 52
Trigger1 = var(50) := 43091
IgnoreHitPause = 1

[State -3,近立X]
type = ChangeState
value = 205
TriggerAll = var(59)
TriggerAll = var(2) = 1
TriggerAll = EnemyNear,MoveType = A
TriggerAll = StateType = S
TriggerAll = EnemyNear,StateNo < 1000
TriggerAll = EnemyNear,StateNo = Helper(33000),var(2)
TriggerAll = EnemyNear,time < Helper(33000),var(3) - 3
TriggerAll = P2Dist X < 50
;对地
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - fvar(39) * 3 < 52
Trigger1 = var(50) := 20591
;对空
Trigger2 = BackEdgeBodyDist >= 10
Trigger2 = EnemyNear,StateType = A
Trigger2 = P2BodyDist x - fvar(37) * 3 = [-14, 52]
Trigger2 = EnemyNear,pos y + EnemyNear,Vel Y * 3 + fvar(38) * 3 * (3 + 1) / 2 = [-35,-20]
Trigger2 = var(50) := 20592
;版边对空
Trigger3 = BackEdgeBodyDist < 10
Trigger3 = EnemyNear,StateType = A
Trigger3 = P2BodyDist x - fvar(37) * 3 < 31
Trigger3 = EnemyNear,pos y + EnemyNear,Vel Y * 3 + fvar(38) * 3 * (3 + 1) / 2 = [-35,-20]
Trigger3 = var(50) := 20593
IgnoreHitPause = 1

[State -3,立X]
type = ChangeState
value = 200
TriggerAll = var(59)
TriggerAll = var(2) = 1
TriggerAll = EnemyNear,MoveType = A
TriggerAll = StateType = S
TriggerAll = EnemyNear,StateNo < 1000
TriggerAll = EnemyNear,StateNo = Helper(33000),var(2)
TriggerAll = EnemyNear,time < Helper(33000),var(3) - 3
;对地
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x < 70
Trigger1 = var(50) := 20091
;对空
Trigger2 = BackEdgeBodyDist >= 10
Trigger2 = EnemyNear,StateType = A
Trigger2 = P2BodyDist x - fvar(37) * 2 = [-14, 70]
Trigger2 = EnemyNear,pos y + EnemyNear,Vel Y * 3 + fvar(38) * 3 * (3 + 1) / 2 = [-48,-25]
Trigger2 = var(50) := 20092
;版边对空
Trigger3 = BackEdgeBodyDist < 10
Trigger3 = EnemyNear,StateType = A
Trigger3 = P2BodyDist x - fvar(37) * 2 < 70
Trigger3 = EnemyNear,pos y + EnemyNear,Vel Y * 3 + fvar(38) * 3 * (3 + 1) / 2 = [-48,-25]
Trigger3 = var(50) := 20093

IgnoreHitPause = 1

[State -3,蹲X]
type = ChangeState
value = 400
TriggerAll = var(59)
TriggerAll = var(2) = 1
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,StateNo < 1000
;对地
TriggerAll = (EnemyNear,StateNo = Helper(33000),var(2) && EnemyNear,time < Helper(33000),var(3)) || EnemyNear,Time <= 1  
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x < 48
Trigger1 = var(50) := 40091
;对空
Trigger2 = EnemyNear,StateNo = Helper(33000),var(2)
Trigger2 = EnemyNear,time < Helper(33000),var(3)
Trigger2 = EnemyNear,StateType = A
Trigger2 = P2BodyDist x < 48
Trigger2 = EnemyNear,Pos Y + EnemyNear,Vel Y * 1 + fvar(38) * 1 * (1 + 1) / 2 = [-35,-5]
Trigger2 = var(50) := 40092
IgnoreHitPause = 1


;=================================================================================
;抓硬直8
;=================================================================================
[State -3,前行抓硬直]
type = ChangeState
TriggerAll = var(59)
TriggerAll = var(2) = 1
TriggerAll = StateNo != 99
TriggerAll = StateType != A
TriggerAll = var(50) != 120065
;抓受击硬直
Trigger1 = !InGuardDist
Trigger1 = EnemyNear,StateNo >= 5000 && !EnemyNear,Ctrl && EnemyNear,StateType != L
Trigger1 = EnemyNear,MoveType = H
Trigger1 = EnemyNear,GetHitVar(HitTime) >= 2
Trigger1 = P2BodyDist X > 35
Trigger1 = var(50) := 009981
;抓打击硬直
Trigger2 = !InGuardDist || EnemyNear,Facing = Facing
Trigger2 = EnemyNear,MoveType = A || EnemyNear,MoveType = I
Trigger2 = EnemyNear,GetHitVar(HitTime) >= 2
Trigger2 = P2BodyDist X > 0
Trigger2 = var(50) := 009982
;抓5700
Trigger3 = EnemyNear,StateNo = 5700
Trigger3 = P2BodyDist X > 0
Trigger3 = var(50) := 009983
value = 99


;---------------------------------------------------------------------------------
;目前统一用蹲轻脚抓硬直，因为蹲轻脚可以最大伤害并且可以通过目押连接蹲C进入BC
;其他的以后再酌情放开
;---------------------------------------------------------------------------------
[State -3,抓破防]
type = ChangeState
TriggerAll = var(59)
TriggerAll = var(2) = 1
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,Facing != Facing
Trigger1 = EnemyNear,StateNo = 5700
Trigger1 = P2BodyDist x < 10 && EnemyNear,Time < 33
Trigger1 = var(50) := 043072
value = 430

[State -3,普通抓硬直]
type = ChangeState
TriggerAll = var(59)
TriggerAll = var(2) = 1
TriggerAll = (EnemyNear,AnimTime = [-6,-1]) || EnemyNear,Facing = Facing
TriggerAll = EnemyNear,MoveType = A || EnemyNear,MoveType = I 
TriggerAll = !EnemyNear,Ctrl
TriggerAll = P2StateType != L
TriggerAll = P2StateNo != 5200 && P2StateNo != 5210 && P2StateNo != 5201
TriggerAll = StateType != A 
TriggerAll = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
;近立Y
Trigger1 = 0
Trigger1 = EnemyNear,StateNo < 1000 || EnemyNear,AnimTime = [-8, -1]
Trigger1 = P2Dist X < 55
Trigger1 = P2BodyDist x = [-50, 52]
Trigger1 = EnemyNear,animtime < -7
Trigger1 = var(54) := 215
Trigger1 = var(50) := 021571
;近立D
Trigger2 = 0
Trigger2 = EnemyNear,StateNo < 1000
Trigger2 = P2Dist X < 55
Trigger2 = P2BodyDist x = [-44, 44]
Trigger2 = EnemyNear,animtime < -9
Trigger2 = var(54) := 245
Trigger2 = var(50) := 024571
;蹲A
Trigger3 = P2BodyDist x = [-52, 52]
Trigger3 = (EnemyNear,animtime = [-3,-1]) || (P2BodyDist x < 15 && EnemyNear,AnimTime <= -1 )
Trigger3 = var(54) := 430
Trigger3 = var(50) := 043071
;近立X
Trigger4 = 0
Trigger4 = P2Dist X < 50
Trigger4 = P2BodyDist x = [-52, 52]
Trigger4 = EnemyNear,animtime < -3
Trigger4 = var(54) := 205
Trigger4 = var(50) := 020571
;立X
Trigger5 = EnemyNear,StateType = S
Trigger5 = P2Dist X >= 50
Trigger5 = P2BodyDist x = [-60, 60]
Trigger5 = (EnemyNear,animtime = [-3,-1]) || (P2BodyDist x < 10 && EnemyNear,AnimTime <= -2)
Trigger5 = var(54) := 200
Trigger5 = var(50) := 020071
value = var(54)
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;目前统一用蹲轻脚抓硬直，因为蹲轻脚可以最大伤害并且可以通过目押连接蹲C进入BC
;其他的以后再酌情放开
;---------------------------------------------------------------------------------
[State -3,抓空中落地]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = var(2) = 1
TriggerAll = EnemyNear,Facing != Facing
TriggerAll = StateType != A 
TriggerAll = P2BodyDist x >= 0
TriggerAll = EnemyNear,StateNo <= 5000 && EnemyNear,MoveType != H
TriggerAll = !EnemyNear,NumProj && !PlayerIdExist(Helper(33333333),var(3)) 
;蹲X非版边
Trigger1 = BackEdgeBodyDist >= 10
Trigger1 = fvar(11) = [1,3]
Trigger1 = P2BodyDist x = [-10,44]
Trigger1 = var(54) := 400
Trigger1 = var(50) := 040072
;蹲X版边
Trigger2 = BackEdgeBodyDist < 10
Trigger2 = fvar(11) = [1,3]
Trigger2 = P2BodyDist x < 44
Trigger2 = var(54) := 400
Trigger2 = var(50) := 040073
;蹲A非版边
Trigger3 = BackEdgeBodyDist >= 10
Trigger3 = fvar(11) = [1,3]
Trigger3 = P2BodyDist x = [0,52]
Trigger3 = var(54) := 430
Trigger3 = var(50) := 043072
;蹲A版边
Trigger4 = BackEdgeBodyDist < 10
Trigger4 = fvar(11) = [1,3]
Trigger4 = P2BodyDist x < 52
Trigger4 = var(54) := 430
Trigger4 = var(50) := 043073
;蹲B非版边
Trigger5 = BackEdgeBodyDist >= 10
Trigger5 = fvar(11) = [11,13]
Trigger5 = P2BodyDist x - fvar(37) * 12 = [50,84]
Trigger5 = var(54) := 440
Trigger5 = var(50) := 044072
;蹲B版边
Trigger6 = BackEdgeBodyDist < 10
Trigger6 = fvar(11) = [11,13]
Trigger6 = P2BodyDist x = [50,84]
Trigger6 = var(54) := 440
Trigger6 = var(50) := 044073
value = var(54)
IgnoreHitPause = 1
;=================================================================================
;切返7
;=================================================================================
[State -3,千手罗汉]
type = ChangeState
triggerall = var(59)
triggerall = inguarddist
triggerall = statetype != A 
triggerall = var(2) = [1,3]
triggerall = power >= 3000 || (var(20) > 0 && Power >= 1000)
;切返用
trigger1 = EnemyNear,Life = [260, 340]
trigger1 = EnemyNear,StateType != A && EnemyNear,MoveType = A
trigger1 = P2BodyDist X = [-5,80]
trigger1 = EnemyNear,AnimTime < -2
;磨血用
Trigger2 = RoundNo >= 3
Trigger2 = EnemyNear,Life < 150 && EnemyNear,StateNo = [150,153]
Trigger2 = EnemyNear,GetHitVar(HitTime) >= 2
value = 2300


[State -3,影向]
type = ChangeState
triggerall = var(59)
triggerall = inguarddist
triggerall = statetype != A 
triggerall = var(2) = [1,3]
triggerall = (power >= 3000 || EnemyNear,Life < 200 && Power >= 1000) || var(20) > 0
TriggerAll = EnemyNear,NumProj = 0 && !PlayerIdExist(Helper(33333333),var(3)) 
;远距离的直接过去抓
trigger1 = !EnemyNear,Ctrl
trigger1 = EnemyNear,MoveType = A && EnemyNear,StateType != A && EnemyNear,Vel Y = 0
trigger1 = EnemyNear,AnimTime < 0
trigger1 = P2BodyDist X < 30
trigger1 = (p2bodydist x / 2.4) < (-EnemyNear,AnimTime)
trigger1 = var(5) := 1
trigger1 = var(50) := 210071
;当身
trigger2 = inguarddist
trigger2 = enemynear,stateno = helper(33000),var(2)
trigger2 = enemynear,time < helper(33000),var(3) 
trigger2 = EnemyNear,HitDefAttr = SCA,AA
trigger2 = EnemyNear,MoveType = A 
trigger2 = P2BodyDist x < 40
trigger2 = EnemyNear,Pos y >= -45
trigger2 = !EnemyNear,HitDefAttr = SCA,NT,ST,HT && Helper(33000),var(11) != 3
trigger2 = var(5) := 2
trigger2 = var(50) := 210072
value = 2100
IgnoreHitPause = 1

[State -3,打开]
type = ChangeState
triggerall = var(59)
triggerall = inguarddist
triggerall = statetype != A 
triggerall = var(2) = 2
trigger1 = EnemyNear,MoveType = A
trigger1 = enemynear,StateNo >= 1000
trigger1 = enemynear,stateno = helper(33000),var(2)
trigger1 = helper(33000),var(3) - enemynear,time < -AnimTime
trigger1 = P2BodyDist x < 55
trigger1 = var(5) := 1
trigger1 = var(50) := 160071
value = 1600
IgnoreHitPause = 1

[State -3,前小跳]
type = ChangeState
triggerall = var(59)
triggerall = statetype != A 
triggerall = var(2) = 1
trigger1 = EnemyNear,HitDefAttr = SCA,NT,ST,HT || Helper(33000),var(11) = 3
trigger1 = EnemyNear,Facing != Facing
trigger1 = P2BodyDist x < 40
trigger1 = var(33) := 1
trigger1 = var(50) := 390701
value = 39


;=================================================================================
;连段+连携6
;所有招式立，蹲A优先级最高，因为蹲A可以连蹲Y带入BC
;其次是立Y，可以带入BC
;BC连中罗杀目押追立X椡
;版边可以那义 >> 飞天脚踢 >> 无影红砂手再接乱舞
;版边还可以那义接弱飞天脚踢飞，然后接打开强制倒地，飞天脚再追击地面，最后乱舞打起身必中，这个研究下条件
;
;1.立X必须接罗杀
;2.蹲A >> 蹲Y两段 >> 鞭发拳 >> 蛇突牙
;3.蹲A >> 蹲A >> 立X/蹲X >> 罗杀
;4.蹲A >> 蹲Y一段 >> 鞭发拳 >> 罗杀/飞天脚/喷毒/无影手
;5 蹲A >> 蹲A 目押这个得研究一下
;=================================================================================

;---------------------------------------------------------------------------------
;var(53) = 1 表示普通技能还可以追加，不能直接取消到必杀技
;条件是蹲轻脚能打到的最远距离
;---------------------------------------------------------------------------------
[State -3,MAX超杀结束对方生命]
type = ChangeState
triggerall = var(59) 
triggerall = statetype != A
triggerall = EnemyNear,MoveType = H && !EnemyNear,Ctrl
triggerall = MoveHit
triggerall = EnemyNear,Life < 300
Triggerall = roundno >= 2
triggerall = power >= 3000 || (var(20) > 0 && Power >= 1000)

trigger1 = StateNo = 215 || StateNo = 410 || StateNo = 250

trigger1 = EnemyNear,StateNo >= 5000
trigger1 = EnemyNear,StateType != A
trigger1 = var(54) := ifelse(random < 500, 2300, 2200) 
trigger1 = var(5) := 1
trigger1 = var(50) := 20063

trigger2 = EnemyNear,BackEdgeBodyDist < 60
trigger2 = StateNo = 1405 && AnimElemTime(44) > 0
trigger2 = MoveHit
trigger2 = var(54) := ifelse(random < 500, 2200, 2300) 
trigger2 = var(5) := 1
trigger2 = var(50) := 220064


trigger3 = StateNo = 1310 && MoveHit && AnimElemTime(5) > 0
trigger3 = EnemyNear,StateNo >= 5000
trigger3 = var(54) := ifelse(random < 500, 2300, 2200) 
trigger3 = var(5) := 1
trigger3 = var(50) := 210065
value = var(54)


[State -3,超杀结束对方生命]
type = ChangeState
triggerall = var(59) 
triggerall = statetype != A
triggerall = EnemyNear,MoveType = H && !EnemyNear,Ctrl
triggerall = MoveHit
triggerall = EnemyNear,Life < 200

trigger1 = StateNo = 215 || StateNo = 410 || StateNo = 250
trigger1 = power >= 1000 || var(20) > 0
trigger1 = EnemyNear,StateNo >= 5000
trigger1 = EnemyNear,StateType != A
trigger1 = var(54) := ifelse(random < 500, 2000, 2100) 
trigger1 = var(5) := 1
trigger1 = var(50) := 20063


trigger2 = power >= 2000 || var(20) > 0
trigger2 = EnemyNear,BackEdgeBodyDist < 60
trigger2 = StateNo = 1405 && AnimElemTime(44) > 0
trigger2 = MoveHit
trigger2 = var(54) := 2000
trigger2 = var(5) := 1
trigger2 = var(50) := 20064

trigger3 = power >= 2000 || var(20) > 0
trigger3 = StateNo = 1310 && MoveHit && AnimElemTime(5) > 0
trigger3 = EnemyNear,StateNo >= 5000
trigger3 = var(54) := ifelse(random < 500 || EnemyNear,StateType = A, 2000, 2100) 
trigger3 = var(5) := 1
trigger3 = var(50) := 210065
value = var(54)


[State -3,MAX超杀BC收尾用]
type = ChangeState
triggerall = var(59) 
triggerall = statetype != A
triggerall = EnemyNear,MoveType = H && !EnemyNear,Ctrl
triggerall = var(20) > 0 && Power >= 1000
trigger1 = StateNo = 1405 && AnimElemTime(44) > 0
trigger1 = MoveHit
trigger1 = var(5) := 1

trigger2 = var(5) = 1
trigger2 = StateNo = 1310 && MoveHit && AnimElemTime(5) > 0
trigger2 = EnemyNear,StateNo >= 5000
trigger2 = var(5) := 1

value = ifelse(random < 500, 2300, 2200)

[State -3,超杀BC收尾用]
type = ChangeState
triggerall = var(59) 
triggerall = statetype != A
triggerall = EnemyNear,MoveType = H && !EnemyNear,Ctrl

trigger1 = StateNo = 1405 && AnimElemTime(44) > 0
trigger1 = MoveHit
trigger1 = var(20) > 0
trigger1 = var(54) := 2000

trigger2 = var(20) > 0
trigger2 = var(5) = 1
trigger2 = StateNo = 1310 && MoveHit && AnimElemTime(5) > 0
trigger2 = EnemyNear,StateNo >= 5000
trigger2 = var(54) := ifelse(random < 500, 2000, 2100) 
value = var(54)


[State -3,BC]
type = ChangeState
value = 901
triggerall = var(59) 
triggerall = statetype != A
triggerall = power >= 2000
triggerall = var(20) = 0
triggerall = EnemyNear,StateNo >= 5000 && EnemyNear,MoveType = H
triggerall = EnemyNear,StateType != A && EnemyNear, vel y = 0
trigger1 = stateno = 250
trigger1 = MoveHit
trigger1 = fvar(39) := 0.4


[State -3]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000
;2Y一段 >> 鞭发拳，限制下Time并通过random控制
;一段不接，二段也可以接，之后接蛇突牙用
Trigger1 = StateNo = 410 && AnimElemTime(2) = 1 && MoveHit
Trigger1 = Random < 300 || Power >= 2000 || FrontEdgeBodyDist < 90
Trigger1 = var(50) := 025061
;2Y二段 >> 鞭发拳
Trigger2 = StateNo = 410 && AnimElemTime(3) > 2 && MoveHit
Trigger2 = var(50) := 025062
;近Y一段 >> 鞭发拳
;一段不接，二段也可以接，之后接蛇突牙用
Trigger3 = StateNo = 215 && AnimElemTime(4) = 1 && MoveHit
Trigger3 = Random < 300 || Power >= 2000 || FrontEdgeBodyDist < 90 
Trigger3 = var(50) := 025063
;近Y二段 >> 鞭发拳
Trigger4 = StateNo = 215 && AnimElemTime(5) > 0 && MoveHit
Trigger4 = var(50) := 025064
;近D
Trigger5 = StateNo = 245 && MoveHit
Trigger5 = var(50) := 025065
;BC状态
Trigger6 = var(20) > 0
Trigger6 = StateNo = 215 || StateNo = 410
Trigger6 = MoveHit
value = 250


[State -3,蛇突牙]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000
;辫子 >> 蛇突牙 
Trigger1 = var(50) = 25062 || var(50) = 25064
Trigger1 = StateNo = 250 && MoveHit
Trigger1 = var(5) := ifelse(P2BodyDist X < 80, 2, 3)
Trigger1 = var(50) := 150061
value = 1500

[State -3,罗杀]
type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000 || EnemyNear,StateNo = [120,159]
TriggerAll = !(EnemyNear,Power >= 1000 && MoveGuarded)
;2X >> 斩铁舞·罗杀
Trigger1 = StateNo = 400 && MoveContact
Trigger1 = var(5) := ifelse(EnemyNear,BackEdgeBodyDist < 30, 2, 1)
Trigger1 = var(50) := 130061
;辫子 >> 斩铁舞·罗杀 
;如果是鞭发拳是一段接的
Trigger2 = ((var(50) = 025061 || var(50) = 025063) && Random < 300) || var(20) > 0 || EnemyNear,Facing = Facing
Trigger2 = StateNo = 250 && MoveContact
Trigger2 = var(5) := ifelse(EnemyNear,BackEdgeBodyDist < 30, 2, 1)
Trigger2 = var(50) := 130062
;立X >> 斩铁舞·罗杀 
Trigger3 = StateNo = 200 && MoveHit
Trigger3 = var(5) := ifelse(EnemyNear,BackEdgeBodyDist < 30, 2, 1)
Trigger3 = var(50) := 130063
value = 1300

[State -3,那义]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000 || EnemyNear,StateNo = [120,159] 
TriggerAll = P2BodyDist x - ifelse(EnemyNear,BackEdgeBodyDist > 10, fvar(37) * 1, 0) - ifelse(EnemyNear,BackEdgeBodyDist < 10,Vel x * 1, 0) >= 50 || var(52) > 0 
;罗杀 >> 那义
Trigger1 = StateNo = 1300 && MoveHit && AnimElem >= 11
Trigger1 = EnemyNear,StateType != A || (EnemyNear,Pos Y + EnemyNear,Vel Y * 6 + fvar(38) * 6 * (6 + 1) / 2 = [-85, -25])
Trigger1 = var(50) := 131061
value = 1310

[State -3,强飞天脚BC用]
type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000 
;那义取消接飞天脚
Trigger1 = (EnemyNear,Facing != Facing && EnemyNear,BackEdgeBodyDist < 32) || (EnemyNear,Facing = Facing && EnemyNear,FrontEdgeBodyDist < 32)
Trigger1 = var(20) > 0
Trigger1 = StateNo = 1310 && MoveHit
Trigger1 = var(5) := 2
Trigger1 = var(50) := 120065
value = 1220

[State -3,波颈]
type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !InGuardDist 
TriggerAll = EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000 
;罗杀 >> 那义
Trigger1 = P2Dist x >= 55 || P2BodyDist X >= 35 || EnemyNear,BackEdgeBodyDist > 5 || FrontEdgeBodyDist >= 42 || anim = 1310 || Random < 300
Trigger1 = StateNo = 1310 && MoveHit && animelemtime(9) = 1
Trigger1 = EnemyNear,StateType != A
Trigger1 = var(50) := 132061
value = 1320


[State -3,飞天脚]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000 
;辫子 >> 无影手 
Trigger1 = Random < 400 || EnemyNear,BackEdgeBodyDist < 90
Trigger1 = StateNo = 250 && MoveHit
Trigger1 = var(5) := 2
Trigger1 = var(50) := 120061
value = ifelse(EnemyNear,BackEdgeBodyDist < 90, 1220, 1200)

[State -3,无影手]
type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000 
TriggerAll = P2BodyDist x - ifelse(EnemyNear,BackEdgeBodyDist > 10, fvar(37) * 19, 0) - ifelse(EnemyNear,BackEdgeBodyDist < 10,Vel x * 19, 0) < 80
;辫子 >> 无影手 
Trigger1 = Random < 700
Trigger1 = StateNo = 250 && MoveHit
Trigger1 = var(5) := 1
Trigger1 = var(50) := 140061
value = 1400


[State -3,喷毒弱]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000 
;辫子 >> 喷毒弱 
Trigger1 = StateNo = 250 && MoveHit
Trigger1 = var(5) := 1
Trigger1 = var(50) := 100061
value = 1000

[State -3,喷毒强]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = EnemyNear,StateType = A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000 
;对空 >> 喷毒强 
Trigger1 = StateNo = 200 || StateNo = 205 || StateNo = 410 
Trigger1 = MoveHit
Trigger1 = EnemyNear,Pos Y < -40 && EnemyNear,Vel Y < 0
Trigger1 = var(5) := 2
Trigger1 = var(50) := 100062
value = 1000

[State -3,蛇突牙空挥攒气]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = EnemyNear,StateType = A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000
;辫子 >> 蛇突牙 
Trigger1 = StateNo = 215 || StateNo = 205
Trigger1 = MoveHit
Trigger1 = var(5) := 4
Trigger1 = var(50) := 150062
value = 1500

;-----------------------------------------------------------
;movehit中的连段，通常是空中的攻击击中等等, 也包括2A接2A接X/2X这种
;一律优先蹲A
;最好： 蹲A >> 蹲Y >> 辫子 各种
;再次： 蹲A >> 蹲X >> 罗杀
;最次： 蹲A >> 罗杀
;-----------------------------------------------------------
[State -3]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = var(2) = 1
TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = EnemyNear,StateType != L
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000 || EnemyNear,StateNo = [120,159]
;蹲Y
Trigger1 = EnemyNear,StateNo >= 5000 
Trigger1 = Helper(33000),var(14) = 400 || Helper(33000),var(14) = 430 || Helper(33000),var(14) = 205 || Helper(33000),var(14) = 235
Trigger1 = (EnemyNear,gethitvar(hittime) =[3,5]) || (EnemyNear,StateNo = 5700 && EnemyNear,time = 36)
Trigger1 = P2BodyDist x - ifelse(EnemyNear,BackEdgeBodyDist > 10, fvar(37) * 3, 0) - ifelse(EnemyNear,BackEdgeBodyDist < 10,Vel x * 3, 0)< 42
Trigger1 = var(54) := 410
Trigger1 = var(50) := 041061
;蹲X
Trigger2 = Helper(33000),var(14) = 430 
Trigger2 = (EnemyNear,gethitvar(hittime) = [1,3]) || (EnemyNear,StateNo = 5700 && EnemyNear,time = 38)
Trigger2 = P2BodyDist x - ifelse(EnemyNear,BackEdgeBodyDist > 10, fvar(37) * 1, 0) - ifelse(EnemyNear,BackEdgeBodyDist < 10,Vel x * 1, 0)< 50
Trigger2 = var(54) := 400
Trigger2 = var(50) := 040062
;蹲A
Trigger3 = (EnemyNear,gethitvar(hittime) = [1,3]) || (EnemyNear,StateNo = 5700 && EnemyNear,time = 38)
Trigger3 = P2BodyDist x - ifelse(EnemyNear,BackEdgeBodyDist > 10, fvar(37) * 1, 0) - ifelse(EnemyNear,BackEdgeBodyDist < 10,Vel x * 1, 0)< 52
Trigger3 = var(54) := 430
Trigger3 = var(50) := 043062
;蹲A
Trigger4 = (EnemyNear,gethitvar(hittime) >= 2) || (EnemyNear,StateNo = 5700 && EnemyNear,time = 38)
Trigger4 = P2BodyDist x < 10
Trigger4 = var(54) := 430
Trigger4 = var(50) := 043063
value = var(54)



;-----------------------------------------------------------
;目押
;-----------------------------------------------------------
[State -3,无影手]
type = ChangeState
TriggerAll = var(59)
TriggerAll = var(2) = 1
TriggerAll = StateType != A
TriggerAll = EnemyNear,StateType = A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000 
TriggerAll = EnemyNear,StateNo != 5040
;追击飞天脚强
Trigger1 = var(20) > 0 || Life < EnemyNear,Life
Trigger1 = NumTarget(1220)
Trigger1 = EnemyNear,Pos Y + EnemyNear,Vel Y * 21 + fvar(38) * 21 * (21 + 1) / 2 = [-85,-20]
Trigger1 = FrontEdgeBodyDist < 80
Trigger1 = var(5) := 2
Trigger1 = var(50) := 140061

;追击飞天脚强
Trigger2 = var(20) > 0 || Life < EnemyNear,Life
Trigger2 = NumTarget(1220)
Trigger2 = EnemyNear,Pos Y + EnemyNear,Vel Y * 19 + fvar(38) * 19 * (19 + 1) / 2 = [-85,-20]
Trigger2 = FrontEdgeBodyDist < 80
Trigger2 = var(5) := 1
Trigger2 = var(50) := 140062

;追击蛇突牙
Trigger3 = Life < EnemyNear,Life || Random < 300
Trigger3 = NumTarget(1510) || NumTarget(1511) || NumTarget(1512) 
Trigger3 = EnemyNear,Pos Y + EnemyNear,Vel Y * 19 + fvar(38) * 19 * (19 + 1) / 2 = [-85,-20]
Trigger3 = EnemyNear,Facing != Facing
Trigger3 = P2BodyDist X - fvar(37) * 19 = [0,62]
Trigger3 = var(5) := 1
Trigger3 = var(50) := 140063

;追击蛇突牙
Trigger4 = Life < EnemyNear,Life || Random < 300
Trigger4 = NumTarget(1510) || NumTarget(1511) || NumTarget(1512) 
Trigger4 = EnemyNear,Pos Y + EnemyNear,Vel Y * 19 + fvar(38) * 19 * (19 + 1) / 2 = [-85,-20]
Trigger4 = EnemyNear,Facing = Facing
Trigger4 = P2BodyDist X + fvar(37) * 19 = [0,62]
Trigger4 = var(5) := 1
Trigger4 = var(50) := 140064

value = 1400

[State -3,打开]
type = ChangeState
TriggerAll = var(59)
TriggerAll = var(2) = 1
TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = EnemyNear,StateType = A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000 
TriggerAll = EnemyNear,StateNo != 5040
TriggerAll = EnemyNear,Pos Y + EnemyNear,Vel Y * 15 + fvar(38) * 15 * (15 + 1) / 2 = [-55,-20]
TriggerAll = var(20) = 0

;Trigger1 = Helper(33000),var(14) != 1500 || (Life < EnemyNear,Life)
Trigger1 = EnemyNear,Facing != Facing
Trigger1 = p2bodydist X - fvar(37) * 15 = [-40, 45]
Trigger1 = var(50) := 160061
Trigger1 = var(5) := 1

;Trigger2 = Helper(33000),var(14) != 1500  || (Life < EnemyNear,Life)
Trigger2 = EnemyNear,Facing = Facing
Trigger2 = p2bodydist X + fvar(37) * 15 = [-45, 40]
Trigger2 = var(50) := 160062
Trigger2 = var(5) := 1
value = 1600

[State -3,飞天脚弱追地攻击]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = var(2) = 1
TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo != 5040
TriggerAll = FrontEdgeBodyDist < 90  || P2BodyDist X = [85, 115]
;追击打开
Trigger1 = EnemyNear,StateNo = 5111 && EnemyNear,Time < 40
Trigger1 = NumTarget(1600)
Trigger1 = p2bodydist X < 90
Trigger1 = var(5) := 1
Trigger1 = var(50) := 120063
;追击喷毒
Trigger2 = NumTarget(1200) = 0;防止重复追击
Trigger2 = EnemyNear,StateNo = [996,999]
Trigger2 = p2bodydist X < 90
Trigger2 = var(5) := 1
Trigger2 = var(50) := 120064
value = 1200

[State -3,近Y追击那义]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = var(2) = 1
TriggerAll = StateType != A
TriggerAll = EnemyNear,StateNo >= 5000 && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateType = A && EnemyNear,MoveType = H
TriggerAll = NumTarget(1311)
Trigger1 = P2BodyDist X < 55
Trigger1 = EnemyNear,BackEdgeBodyDist < 15
Trigger1 = EnemyNear,Pos Y + EnemyNear,Vel Y * 6 + fvar(38) * 6 * (6 + 1) / 2 = [-75,-20]
Trigger1 = var(50) := 21566
value = 215

[State -3,近X追击那义]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = var(2) = 1
TriggerAll = StateType != A
TriggerAll = EnemyNear,StateNo >= 5000 && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateType = A && EnemyNear,MoveType = H
TriggerAll = NumTarget(1311)
Trigger1 = P2BodyDist X < 50
Trigger1 = EnemyNear,BackEdgeBodyDist < 15
Trigger1 = EnemyNear,Pos Y + EnemyNear,Vel Y * 2 + fvar(38) * 2 * (2 + 1) / 2 = [-75,-20]
Trigger1 = var(50) := 20566
value = 205

;-----------------------------------------------------------
;连携跳跃压制
;-----------------------------------------------------------
[State -3,跳跃]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = var(2) = 1
TriggerAll = !inguarddist 
TriggerAll = Life >= 100
Trigger1 = EnemyNear,MoveType = H && !EnemyNear,Ctrl
Trigger1 = EnemyNear,StateNo = [120,159]
Trigger1 = EnemyNear,GetHitVar(HitTime) >= 1
Trigger1 = P2BodyDist X >= 70 
Trigger1 = var(33) := ifelse(P2BodyDist X > 110, 4, 3)
Trigger1 = var(50) := 390601

Trigger2 = EnemyNear,MoveType = H && !EnemyNear,Ctrl
Trigger2 = EnemyNear,StateNo = [120,159]
Trigger2 = EnemyNear,GetHitVar(HitTime) >= 2
Trigger2 = EnemyNear,BackEdgeBodyDist < 10
Trigger2 = P2BodyDist X < 50
Trigger2 = var(33) := 3
Trigger2 = var(50) := 390602

Trigger3 = FrontEdgeBodyDist < 60
Trigger3 = EnemyNear,MoveType = I && !EnemyNear,Ctrl
Trigger3 = EnemyNear,AnimTime <= -15
Trigger3 = EnemyNear,BackEdgeBodyDist < 10
Trigger3 = var(33) := 3
Trigger3 = var(50) := 390603

value = 39

;=================================================================================
;移动5
;=================================================================================
[State -3,后撤]
type = ChangeState
value = 105
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = var(2) = 1
TriggerAll = BackEdgeBodyDist >= 60
;防投技
Trigger1 = helper(33000),var(14) = 3
Trigger1 = P2BodyDist x < 50
Trigger1 = var(50) := 1050501
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
TriggerAll = var(50) != 120065
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
Trigger7 = EnemyNear,MoveType = A || EnemyNear,MoveType = I 
Trigger7 = !inguarddist
Trigger7 = var(50) := 990507
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
TriggerAll = !enemy,numproj
TriggerAll = (Ctrl || StateNo = 1) || (StateNo = 18 && Time >= 20)
TriggerAll = var(50) != 120065

Trigger1 =(P2BodyDist X = [55,120]) || EnemyNear,facing = facing
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
Trigger5 = EnemyNear,StateNo != 5120
Trigger5 = P2BodyDist x > 15
Trigger5 = !EnemyNear,Ctrl
Trigger5 = EnemyNear,MoveType = A || EnemyNear,MoveType = I 
Trigger5 = !inguarddist
Trigger5 = var(50) := 190505

;近身
Trigger6 = !EnemyNear,Ctrl
Trigger6 = P2BodyDist X >= 45 && P2BodyDist X <= 95
IgnoreHitPause = 1

[State -3, 后退]
type = ChangeState
value = 18
TriggerAll = var(59) 
TriggerAll = RoundState = 2
TriggerAll = StateType != A
TriggerAll = BackEdgeBodyDist > 30
TriggerAll = !inguarddist
TriggerAll = !enemy,numproj
TriggerAll = Ctrl || StateNo = 1 || (StateNo = 19 && Time >= 12) || (StateNo = 99 && Time >= 12)
TriggerAll = !((EnemyNear,MoveType = A || EnemyNear,MoveType = I) && EnemyNear,Facing = Facing && P2BodyDist X > 0)
TriggerAll = var(50) != 120065

Trigger1 = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159]))
Trigger1 = P2BodyDist X < 55
Trigger1 = var(50) := 180501

Trigger2 =(PrevStateNo = [140,155]) && P2BodyDist X <= 120
Trigger2 = Random <= 50
Trigger2 = var(50) := 180502

Trigger3 = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,Ctrl
Trigger3 = P2BodyDist x < 55
Trigger3 = var(50) := 180503

;移动到合适的位置打敌人起身
Trigger4 = P2BodyDist x < 55
Trigger4 = EnemyNear,StateType = L || EnemyNear,StateNo = 5120
Trigger4 = var(50) := 180504

IgnoreHitPause = 1

[State -3,跳跃]
type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = var(2) = 1
TriggerAll = Life >= 100
TriggerAll = var(50) != 120065
;前小跳躲投技
Trigger1 = P2BodyDist x < 90
Trigger1 = helper(33000),var(14) = 3
Trigger1 = var(33) := 1
Trigger1 = var(50) := 390501
;大跳起攻
Trigger2 = Time % 3 = 0 && EnemyNear,Vel X = 0
Trigger2 = EnemyNear,Ctrl
Trigger2 = !inguarddist
Trigger2 = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != A
Trigger2 = P2BodyDist x = [95, 110]
Trigger2 = var(33) := 4
Trigger2 = var(50) := 390502
;1倍X速度大跳起攻
Trigger3 = 0
Trigger3 = EnemyNear,Ctrl
Trigger3 = !inguarddist
Trigger3 = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != A
Trigger3 = P2BodyDist x < 70 && EnemyNear,BackEdgeBodyDist < 30
Trigger3 = var(33) := 3
Trigger3 = var(50) := 390503
;起攻打可能有的飞行道具
Trigger4 = !EnemyNear,Ctrl 
Trigger4 = EnemyNear,MoveType = A && EnemyNear,AnimTime <= -25
Trigger4 = P2BodyDist X = [60, 135]
Trigger4 = var(33) := ifelse(P2BodyDist X < 95, 3, 4)
Trigger4 = var(50) := 390504
;打版边
Trigger5 = !EnemyNear,Ctrl  && EnemyNear,StateNo = 5040
Trigger5 = Fvar(11) > 9
Trigger5 = P2BodyDist X < 60
Trigger5 = EnemyNear,BackEdgeBodyDist < 10
Trigger5 = var(33) := ifelse(P2BodyDist X < 80, 3, 4)
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
TriggerAll = var(2) = 1
TriggerAll = var(50) != 120065

;打起身
Trigger1 = P2BodyDist x = [50, 90]
Trigger1 = EnemyNear,StateNo = 5120 && EnemyNear,animtime = [-15, -12]
Trigger1 = var(33) := 3
Trigger1 = var(50) := 390701
;打起身对手版边
Trigger2 = EnemyNear,BackEdgeBodyDist < 10 || FrontEdgeBodyDist < 80
Trigger2 = P2BodyDist x < 90
Trigger2 = EnemyNear,StateNo = 5120 && EnemyNear,animtime = [-15, -8]
Trigger2 = var(33) := 3
Trigger2 = var(50) := 390702
;打落地受身
Trigger3 = EnemyNear,StateNo = 5050
Trigger3 = !EnemyNear,Ctrl && EnemyNear,MoveType = H
Trigger3 = EnemyNear,BackEdgeBodyDist < 10
Trigger3 = P2BodyDist X < 70
Trigger3 = EnemyNear,Pos Y >= -25
Trigger3 = var(33) := 3
Trigger3 = var(50) := 390703
value = 39
IgnoreHitPause = 1

;=================================================================================
;立回3
;=================================================================================

;------------------------------------------------------------------------------------------------
;喷毒强 对空
;------------------------------------------------------------------------------------------------
[State -3]
type = ChangeState
value = 1000
TriggerAll = var(59)
triggerall = var(2) = 1
TriggerAll = !InGuardDist
TriggerAll = StateType != A
;对空
Trigger1 = EnemyNear,MoveType != H
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist X > 70
Trigger1 = P2BodyDist x - EnemyNear,Vel X * 29 = [40, 120]
Trigger1 = fvar(11) >= 29
Trigger1 = var(5) := 2
Trigger1 = var(50) := 10000301


;------------------------------------------------------------------------------------------------
;飞毛脚强
;------------------------------------------------------------------------------------------------
[State -3,飞毛脚强]
type = ChangeState
value = 1100
TriggerAll = var(59)
triggerall = var(2) = 1
TriggerAll = StateType != A
;出版边1
Trigger1 = BackEdgeBodyDist < 30
Trigger1 = !EnemyNear,NumProj && !PlayerIdExist(helper(33333333),var(3)) 
Trigger1 = EnemyNear,StateType = L || (EnemyNear,StateNo = 5120 && AnimTime < -10)
Trigger1 = var(50) := 110001
Trigger1 = var(5) := 2
;出版边2
Trigger2 = BackEdgeBodyDist < 30
Trigger2 = !EnemyNear,NumProj && !PlayerIdExist(helper(33333333),var(3)) 
Trigger2 = EnemyNear,StateType = A && EnemyNear,Ctrl
Trigger2 = EnemyNear,pos y + EnemyNear,Vel Y * 3 + fvar(38) * 3 * (3 + 1) / 2 < -60
Trigger2 = var(50) := 110002
Trigger2 = var(5) := 2
;躲道具用
Trigger3 = EnemyNear,MoveType = A 
Trigger3 = EnemyNear,AnimTime < -34
Trigger3 = P2BodyDist X > 120 
Trigger3 = var(50) := 110003
Trigger3 = var(5) := 2

;------------------------------------------------------------------------------------------------
;蛇突牙打远距离敌人
;------------------------------------------------------------------------------------------------
[State -3,打远处]
type = ChangeState
;TriggerAll = var(59)
triggerall = var(2) = 1
TriggerAll = StateType != A
TriggerAll = P2BodyDist x > 60
TriggerAll = NumTarget(1512) = 0 && NumTarget(1511) = 0 && NumTarget(1510) = 0 
;打落地
Trigger1 = EnemyNear,StateType = A
Trigger1 = fvar(11) = [17,19]
Trigger1 = P2BodyDist x - EnemyNear,Vel X * 18 = [119,169]
Trigger1 = var(5) := 2
Trigger1 = var(50) := 150001
;打落地2
Trigger2 = EnemyNear,StateType = A
Trigger2 = fvar(11) = [17,19]
Trigger2 = P2BodyDist x - EnemyNear,Vel X * 18 = [184,233]
Trigger2 = var(5) := 3
Trigger2 = var(50) := 150002
;打硬直
Trigger3 = EnemyNear,MoveType = A || (EnemyNear,MoveType = I && EnemyNear,StateNo =[1000,5000))
Trigger3 = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
Trigger3 = P2BodyDist X = [184,240]
Trigger3 = EnemyNear,AnimTime <= -18
Trigger3 = var(5) := 3
Trigger3 = var(50) := 150003
value = 1500


;------------------------------------------------------------------------------------------------
;以下是投技，注意优先级不要比抓硬直高
;------------------------------------------------------------------------------------------------
[State -3,D投]
type = ChangeState
value = 850
TriggerAll = var(59)
triggerall = var(2) = 1
TriggerAll = StateType != A
TriggerAll = EnemyNear,Ctrl
triggerall = P2MoveType != H && !P2StateType = A
TriggerAll = (EnemyNear,Facing != Facing && (P2BodyDist X = [0,8]))
Trigger1 = EnemyNear,Vel Y = 0
Trigger1 = BackEdgeBodyDist < 80
Trigger1 = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120

Trigger2 = EnemyNear,StateNo = 52
IgnoreHitPause = 1

[State -3,C投]
type = ChangeState
value = 800
TriggerAll = var(59)
triggerall = var(2) = 1
TriggerAll = StateType != A
TriggerAll = EnemyNear,Ctrl
triggerall = P2MoveType != H && !P2StateType = A
TriggerAll = (EnemyNear,Facing != Facing && (P2BodyDist X = [0,8])) 
Trigger1 = EnemyNear,Vel Y = 0
Trigger1 = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120

Trigger2 = EnemyNear,StateNo = 52
IgnoreHitPause = 1


;------------------------------------------------------------------------------------------------
;以下是空中
;------------------------------------------------------------------------------------------------
[State -3,空CD]
type = ChangeState
value = 690
TriggerAll = var(59)
TriggerAll = Vel X != 0
TriggerAll = Ctrl || StateNo = [120,149]
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对空
Trigger1 = EnemyNear,StateNo != 5040
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - Vel x * 11 - fvar(37) * 11 < 53
Trigger1 = P2BodyDist y - Vel Y * 11 - const(movement.yaccel) * 11 * (11 + 1) / 2 + EnemyNear,Vel Y * 11 + fvar(38) * 11 * (11 + 1) / 2 = [-67,45]
Trigger1 = var(50) := 69031
IgnoreHitPause = 1


[State -3,空B]
type = ChangeState
value = 640
;TriggerAll = var(59)
TriggerAll = Vel X != 0
TriggerAll = Ctrl || StateNo = [120,149]
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = fvar(9) >= 7
;2段对非版边地面
Trigger1 = EnemyNear,BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - Vel X * 9 - fvar(37) * 9 < 62
Trigger1 = P2BodyDist Y - Vel Y * 9 - const(movement.yaccel) * 9 * (9 + 1) / 2 <= ifelse(EnemyNear,StateType = C,50,70)
Trigger1 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 25) || fvar(9) = (11, 23]
Trigger1 = var(50) := 64031
;2段对版边地面
Trigger2 = EnemyNear,BackEdgeBodyDist < 10 || EnemyNear,FrontEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x - Vel X * 9 - fvar(37) * 9  < 62
Trigger2 = P2BodyDist Y - Vel Y * 9 - const(movement.yaccel) * 9 * (9 + 1) / 2 <= ifelse(EnemyNear,StateType = C,50,70)
Trigger2 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 25) || fvar(9) = (11, 23]
Trigger2 = var(50) := 64032

;3段对非版边地面
Trigger3 = EnemyNear,BackEdgeBodyDist >= 10
Trigger3 = EnemyNear,StateType != A
Trigger3 = P2BodyDist x - Vel X * 12 - fvar(37) * 12 = [-15, 40]
Trigger3 = P2BodyDist Y - Vel Y * 12 - const(movement.yaccel) * 12 * (12 + 1) / 2 <= ifelse(EnemyNear,StateType = C,50,70)
Trigger3 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 22) || fvar(9) = (14, 21]
Trigger3 = var(50) := 64033
;3段对版边地面
Trigger4 = EnemyNear,BackEdgeBodyDist < 10
Trigger4 = EnemyNear,StateType != A
Trigger4 = P2BodyDist x - Vel X * 12 - fvar(37) * 12 < 40
Trigger4 = P2BodyDist Y - Vel Y * 12 - const(movement.yaccel) * 12 * (12 + 1) / 2 <= ifelse(EnemyNear,StateType = C,50,70)
Trigger4 = (EnemyNear,MoveType = A && InGuardDist && var(9) < 22) || fvar(9) = (14, 21]
Trigger4 = var(50) := 64034
;1段对空
Trigger5 = EnemyNear,StateNo != 5040
Trigger5 = EnemyNear,StateType = A
Trigger5 = P2BodyDist x - Vel x * 7 - fvar(37) * 7 < 70
Trigger5 = P2BodyDist y - Vel Y * 7 - const(movement.yaccel) * 7 * (7 + 1) / 2 + EnemyNear,Vel Y * 7 + fvar(38) * 7 * (7 + 1) / 2 = [-35,35]
Trigger5 = var(50) := 64035
IgnoreHitPause = 1


[State -3,空A]
type = ChangeState
value = 630
TriggerAll = var(59)
TriggerAll = Vel X != 0
TriggerAll = Ctrl || StateNo = [120,149]
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = fvar(9) >= 8
;对非版边地面
Trigger1 = EnemyNear,BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - Vel X * 8 = [-10, 58]
Trigger1 = P2BodyDist Y - Vel Y * 8 - const(movement.yaccel) * 8 * (8 + 1) / 2 <= ifelse(EnemyNear,StateType = C,50,70)
Trigger1 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 16) || fvar(9) = (8, 14]
Trigger1 = var(50) := 63031
;对版边地面
Trigger2 = EnemyNear,BackEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x - Vel X * 8 < 58
Trigger2 = P2BodyDist Y - Vel Y * 8 - const(movement.yaccel) * 8 * (8 + 1) / 2 <= ifelse(EnemyNear,StateType = C,50,70)
Trigger2 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 16) || fvar(9) = (8, 14]
Trigger2 = var(50) := 63032
;对空
Trigger3 = EnemyNear,StateNo != 5040
Trigger3 = EnemyNear,StateType = A
Trigger3 = P2BodyDist x - Vel x * 8 - fvar(37) * 8 < 58
Trigger3 = P2BodyDist y - Vel Y * 8 - const(movement.yaccel) * 8 * (8 + 1) / 2 + EnemyNear,Vel Y * 8 + fvar(38) * 8 * (8 + 1) / 2 = [-49,20]
Trigger3 = var(50) := 63033
IgnoreHitPause = 1


[State -3,空Y]
type = ChangeState
value = 610
TriggerAll = var(59)
TriggerAll = Vel X != 0
TriggerAll = Ctrl || StateNo = [120,149]
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = fvar(9) >= 9
;对非版边地面
Trigger1 = EnemyNear,BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - Vel X * 10 = [-10, 30]
Trigger1 = P2BodyDist Y - Vel Y * 10 - const(movement.yaccel) * 10 * (10 + 1) / 2 <= ifelse(EnemyNear,StateType = C,60,80)
Trigger1 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 19) || fvar(9) = (10, 17]
Trigger1 = var(50) := 61031
;对版边地面
Trigger2 = EnemyNear,BackEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x - Vel X * 10 < 40
Trigger2 = P2BodyDist Y - Vel Y * 10 - const(movement.yaccel) * 10 * (10 + 1) / 2 <= ifelse(EnemyNear,StateType = C,60,80)
Trigger2 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 19) || fvar(9) = (10, 17]
Trigger2 = var(50) := 61032
;对空
Trigger3 = EnemyNear,StateNo != 5040
Trigger3 = EnemyNear,StateType = A
Trigger3 = P2BodyDist x - Vel x * 10 - fvar(37) * 10 < 40
Trigger3 = P2BodyDist y - Vel Y * 10 - const(movement.yaccel) * 10 * (10 + 1) / 2 + EnemyNear,Vel Y * 10 + fvar(38) * 10 * (10 + 1) / 2 = [-30,45]
Trigger3 = var(50) := 61033
;对空
Trigger4 = EnemyNear,StateNo != 5040
Trigger4 = EnemyNear,StateType = A
Trigger4 = P2BodyDist x - Vel x * 9 - fvar(37) * 9  =[-23, 24]
Trigger4 = P2BodyDist y - Vel Y * 9 - const(movement.yaccel) * 9 * (9 + 1) / 2 + EnemyNear,Vel Y * 9 + fvar(38) * 9 * (9 + 1) / 2 = [-80,-20]
Trigger4 = var(50) := 61034

IgnoreHitPause = 1


[State -3,空X]
type = ChangeState
value = 600
TriggerAll = var(59)
TriggerAll = Vel X != 0
TriggerAll = Ctrl || StateNo = [120,149]
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = fvar(9) >= 6
;对非版边地面
Trigger1 = EnemyNear,BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - Vel X * 6 = [-15, 55]
Trigger1 = P2BodyDist Y - Vel Y * 6 - const(movement.yaccel) * 6 * (6 + 1) / 2 <= ifelse(EnemyNear,StateType = C,50,65)
Trigger1 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 18) || fvar(9) = (6, 10]
Trigger1 = var(50) := 60031
;对版边地面
Trigger2 = EnemyNear,BackEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x - Vel X * 6 < 55
Trigger2 = P2BodyDist Y - Vel Y * 6 - const(movement.yaccel) * 6 * (6 + 1) / 2 <= ifelse(EnemyNear,StateType = C,50,65)
Trigger2 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 18) || fvar(9) = (6, 10]
Trigger2 = var(50) := 60032
;对空
Trigger3 = EnemyNear,StateNo != 5040
Trigger3 = EnemyNear,StateType = A
Trigger3 = P2BodyDist x - Vel x * 6 - fvar(37) * 6 < 55
Trigger3 = P2BodyDist y - Vel Y * 6 - const(movement.yaccel) * 6 * (6 + 1) / 2 + EnemyNear,Vel Y * 6 + fvar(38) * 6 * (6 + 1) / 2 = [-30,45]
Trigger3 = var(50) := 60033
IgnoreHitPause = 1



;------------------------------------------------------------------------------------------------
;以下是立
;------------------------------------------------------------------------------------------------
[State -3,近立X]
type = ChangeState
value = 205
TriggerAll = var(59)
TriggerAll = var(2) = 1
TriggerAll = EnemyNear,Facing != Facing
TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = P2Dist x < 50
;对空
Trigger1 = EnemyNear,StateNo != 5040
Trigger1 = BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - fvar(37) * 3 = [-5, 50]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 3 + fvar(38) * 3 * (3 + 1) / 2 = [-40,-17]
Trigger1 = var(50) := 020531
;版边对空
Trigger2 = BackEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType = A
Trigger2 = P2BodyDist x - fvar(37) * 3 < 50
Trigger2 = EnemyNear,pos y + EnemyNear,Vel Y * 3 + fvar(38) * 3 * (3 + 1) / 2 = [-40,-17]
Trigger2 = var(50) := 020532
IgnoreHitPause = 1


[State -3,立X]
type = ChangeState
value = 200
TriggerAll = var(59)
TriggerAll = var(2) = 1
TriggerAll = EnemyNear,Facing != Facing
TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = P2BodyDist x >= 50
;对空
Trigger1 = EnemyNear,StateNo != 5040
Trigger1 = BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - fvar(37) * 3 = [-5, 60]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 3 + fvar(38) * 3 * (3 + 1) / 2 = [-56,-37]
Trigger1 = var(50) := 020031
;版边对空
Trigger2 = BackEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType = A
Trigger2 = P2BodyDist x - fvar(37) * 3 < 60
Trigger2 = EnemyNear,pos y + EnemyNear,Vel Y * 3 + fvar(38) * 3 * (3 + 1) / 2 = [-56,-37]
Trigger2 = var(50) := 020032
;对地
Trigger3 = Time % 7 = 0
Trigger3 = (EnemyNear,Ctrl || EnemyNear,StateNo <= 22)
;Trigger3 = EnemyNear,StateType = S
Trigger3 = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
Trigger3 = P2BodyDist x < 60
Trigger3 = var(50) := 020033
IgnoreHitPause = 1

[State -3,近立A]
type = ChangeState
value = 235
TriggerAll = var(59)
TriggerAll = var(2) = 1
TriggerAll = EnemyNear,Facing != Facing
TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = P2Dist x < 50
TriggerAll = (EnemyNear,Ctrl || EnemyNear,StateNo <= 22)
;对地
Trigger1 = Time % 4 = 0
Trigger1 = Random < 200
Trigger1 = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
Trigger1 = P2BodyDist x < 50
Trigger1 = var(50) := 023531
IgnoreHitPause = 1


[State -3,立A]
type = ChangeState
value = 230
TriggerAll = var(59)
TriggerAll = var(2) = 1
TriggerAll = EnemyNear,Facing != Facing
TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = P2BodyDist x >= 50
;对空
Trigger1 = EnemyNear,StateNo != 5040
Trigger1 = BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - fvar(37) * 5 = [-5, 65]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 5 + fvar(38) * 5 * (5 + 1) / 2 = [-30,-10]
Trigger1 = var(50) := 023031
;版边对空
Trigger2 = BackEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType = A
Trigger2 = P2BodyDist x - fvar(37) * 5 = [55, 65]
Trigger2 = EnemyNear,pos y + EnemyNear,Vel Y * 5 + fvar(38) * 5 * (5 + 1) / 2 = [-30,-10]
Trigger2 = var(50) := 023032
;对地
Trigger3 = EnemyNear,Ctrl
Trigger3 = Time % 5 = 0
Trigger3 = EnemyNear,StateType = S
Trigger3 = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
Trigger3 = P2BodyDist x  = [50, 65]
Trigger3 = var(50) := 023033
IgnoreHitPause = 1


[State -3,立B]
type = ChangeState
value = 240
TriggerAll = var(59)
TriggerAll = var(2) = 1
TriggerAll = EnemyNear,Facing != Facing
TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对空
Trigger1 = EnemyNear,StateNo != 5040
Trigger1 = BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - fvar(37) * 10 = [48, 68]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 10 + fvar(38) * 10 * (10 + 1) / 2 = [-60,-30]
Trigger1 = var(50) := 024031

;------------------------------------------------------------------------------------------------
;以下是蹲
;------------------------------------------------------------------------------------------------
[State -3,蹲A]
type = ChangeState
value = 430
TriggerAll = var(59)
TriggerAll = var(2) = 1
TriggerAll = StateType != A
TriggerAll = (EnemyNear,Ctrl || EnemyNear,StateNo <= 22)
TriggerAll = !InGuardDist
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对地
Trigger1 = (P2BodyDist x >= 0 && EnemyNear,Facing != Facing) || (P2BodyDist x <= 0 && EnemyNear,Facing = Facing)
Trigger1 = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
Trigger1 = (P2BodyDist x = [-52, -48]) || P2BodyDist x = [48, 52]
Trigger1 = var(50) := 043031
IgnoreHitPause = 1

[State -3,蹲X]
type = ChangeState
value = 400
TriggerAll = var(59)
TriggerAll = var(2) = 1
TriggerAll = StateType != A
TriggerAll = (EnemyNear,Ctrl || EnemyNear,StateNo <= 22)
TriggerAll = !InGuardDist
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对地
Trigger1 = Time % 6 = 0
Trigger1 = (P2BodyDist x >= 0 && EnemyNear,Facing != Facing) || (P2BodyDist x <= 0 && EnemyNear,Facing = Facing)
Trigger1 = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
Trigger1 = P2BodyDist x = [-48, 48]
Trigger1 = var(50) := 040031

IgnoreHitPause = 1

[State -3,蹲Y]
type = ChangeState
value = 410
TriggerAll = var(59)
TriggerAll = var(2) = 1
TriggerAll = EnemyNear,Facing != Facing
TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = EnemyNear,StateNo != 5040
TriggerAll = EnemyNear,StateType = A
;对空
Trigger1 = P2BodyDist x - fvar(37) * 4 = [0, 39]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 4 + fvar(38) * 4 * (4 + 1) / 2 = [-76,-29]
Trigger1 = var(50) := 041031

;对空
Trigger2 = P2BodyDist x - fvar(37) * 8 = [13, 40]
Trigger2 = EnemyNear,pos y + EnemyNear,Vel Y * 8 + fvar(38) * 8 * (8 + 1) / 2 = [-104,-33]
Trigger2 = var(50) := 041031

;对空
Trigger3 = P2BodyDist x - fvar(37) * 12 = [7, 32]
Trigger3 = EnemyNear,pos y + EnemyNear,Vel Y * 12 + fvar(38) * 12 * (12 + 1) / 2 = [-148,-77]
Trigger3 = var(50) := 041031
IgnoreHitPause = 1



;=================================================================================
;其他2
;=================================================================================
;前滚后滚都放到后面，表示如果上述攻击手段都不行的时候，再使用AB闪避
[State -3,耗气前滚]
type = changestate
TriggerAll = var(59)
TriggerAll = roundstate = 2
TriggerAll = StateType != A 
TriggerAll = Power >= 1000
TriggerAll = power >= 2500 || (Life < 200) || (EnemyNear,Life < 300 && Power >= 2000) || (EnemyNear,Life < 150)
TriggerAll = stateno = [150,152]
TriggerAll = EnemyNear,MoveType = A && !EnemyNear,Ctrl
TriggerAll = helper(33000),var(11) != 3
TriggerAll = EnemyNear,facing != facing
TriggerAll = StateNo = [150,152]
TriggerAll = frontedgebodydist >= 60
;
Trigger1 = EnemyNear,AnimTime < -30
Trigger1 = P2BodyDist x < 80
Trigger1 = var(50) := 70021
value = 700
IgnoreHitPause = 1

[State -3,前滚]
type = changestate
;TriggerAll = var(59)
TriggerAll = var(2) = 1
TriggerAll = roundstate = 2
TriggerAll = StateType != A 
TriggeaAll = FrontEdgeBodyDist >= 60
;攻击的前闪避
Trigger1 = inguarddist
Trigger1 = EnemyNear,MoveType = A && !EnemyNear,Ctrl
Trigger1 = helper(33000),var(11) != 3
Trigger1 = EnemyNear,facing != facing
Trigger1 = P2BodyDist x < 95
Trigger1 = EnemyNear,animtime < -30
Trigger1 = var(50) := 070022
;闪避空中攻击
Triggea2 = FrontEdgeBodyDist >= 120
Trigger2 = fvar(11) > 17
Trigger2 = P2BodyDist x < 60
Trigger2 = EnemyNear,StateType = A 
Trigger2 = EnemyNear,Facing != Facing
Trigger2 = P2BodyDist x - fvar(37) * 8 < 0
Trigger2 = var(50) := 070023
;闪避飞行道具
Trigger3 = EnemyNear,animtime < -33 || P2BodyDist X > 150
Trigger3 = EnemyNear,MoveType = A
Trigger3 = inguarddist
Trigger3 = PlayerIdExist(helper(33333333),var(3)) 
Trigger3 = ifelse(facing = 1, PlayerID(helper(33333333),var(3)), pos x > pos x, PlayerID(helper(33333333),var(3)), pos x < pos x)
Trigger3 = PlayerID(helper(33333333),var(3)), Vel x > 0
;distance / Velocity = time = startup time + active 
Trigger3 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) < 60
Trigger3 = var(50) := 070024
;攻击的前升龙
Trigger4 = inguarddist
Trigger4 = EnemyNear,MoveType = A && !EnemyNear,Ctrl
Trigger4 = helper(33000),var(11) != 3
Trigger4 = EnemyNear,facing != facing
Trigger4 = P2BodyDist x < 60
Trigger4 = EnemyNear,animtime < -15
Trigger4 = EnemyNear,Vel X > 0 && EnemyNear,Vel Y < 0
Trigger4 = EnemyNear,StateNo >= 1000
Trigger4 = var(50) := 070025
value = 700
IgnoreHitPause = 1

[State -3,后滚]
type = changestate
TriggerAll = var(59)
TriggerAll = roundstate = 2
TriggerAll = StateType != A 
TriggerAll = var(2) = 1
TriggerAll = EnemyNear,MoveType = A && !EnemyNear,Ctrl
TriggerAll = helper(33000),var(11) != 3
TriggerAll = EnemyNear,facing != facing
TriggerAll = BackEdgeBodyDist >= 60
TriggerAll = inguarddist
TriggerAll = !EnemyNear,numproj && !PlayerIdExist(helper(33333333),var(3))
TriggerAll = EnemyNear,Vel X = 0
;对方攻击的距离大于我们能攻击到的最大距离，就后撤一下
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x = [60,85]
Trigger1 = EnemyNear,animtime = [-25, -6]
Trigger1 = var(50) := 70101

Trigger2 = P2BodyDist x = [45,80]
Trigger2 = EnemyNear,StateType = A
Trigger2 = fvar(37) > 0
Trigger2 = EnemyNear,Vel y < 0
Trigger2 = EnemyNear,pos y <= -60
Trigger2 = var(50) := 70102

;闪避空中打逆向
Trigger3 = EnemyNear,MoveType = A && !EnemyNear,Ctrl
Trigger3 = EnemyNear,facing = facing && P2BodyDist X < 40
Trigger3 = EnemyNear,Vel X > 0 && EnemyNear,Vel Y > 0
Trigger3 = EnemyNear,Pos Y >= -45
Trigger3 = var(50) := 070103

value = 701
IgnoreHitPause = 1


[State -3,刚CD]
type = ChangeState
value = 291
TriggerAll = var(59)
TriggerAll = StateNo = 150 || StateNo = 152
TriggerAll = power >= 3500 || (EnemyNear,life < 50 && Power >= 1000)
TriggerAll = EnemyNear,animtime < -17
TriggerAll = !EnemyNear,Ctrl && EnemyNear,MoveType = A
;对空
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - fvar(37) * 17 = [-4, 60]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 17 + fvar(38) * 17 * (17 + 1) / 2 >= -70
Trigger1 = var(50) := 29101
;对地
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x - fvar(37) * 17 = [-4, 60]
Trigger2 = var(50) := 29102
IgnoreHitPause = 1


[State -3, 落地受身]
type = ChangeState
value = 702
triggerall = var(59) 
triggerall = alive
trigger1 = stateno = 5050
trigger1 = pos y >= -20
trigger1 = vel y > 0

;=================================================================================
;防御1
;=================================================================================
[State -1, 防御]
Type = ChangeState
Value = 120
TriggerAll = var(59) 
TriggerAll = RoundState = 2
TriggerAll = !EnemyNear, hitdefattr = SCA,AT
TriggerAll = var(2) = 1
Trigger1 = InGuardDist
Trigger1 = StateType != A || (StateType = A && Helper(33000),var(11) != 4)
Trigger1 = var(50) := 012011

Trigger2 = P2BodyDist X= [-50,50]
Trigger2 = NumHelper(33000)>0
Trigger2 = Helper(33000),InGuardDist
Trigger2 = Facing*EnemyNear,Facing!=-1 || P2Dist X<0
Trigger2 = var(50) := 012012
IgnoreHitPause = 1
