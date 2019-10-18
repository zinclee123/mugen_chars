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
; 起跳
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
y = -7.693359375

[State 40, 6]
type = VelSet
triggerall = AnimTime = 0
trigger1 = var(4) = 2
x = const(velocity.runjump.fwd.x)
y = -7.693359375

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
y = -7.693359375

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
y = -7.693359375

[State 40, 6]
type = VelSet
triggerall = AnimTime = 0
trigger1 = var(4) = 8
x = 0
y = const(velocity.jump.y)


[State 40, PlaySnd]
type = PlaySnd
trigger1 = !animtime
trigger2 = var(4) && time > 0
value = 12,3+(PrevStateNo = 101 || PrevStateNo = [104,105])

[State 810, 1]
type = AfterImage
triggerall = !animtime
trigger1 = var(4) = 2
trigger2 = var(4) = 4
time = -1
length = 4
framegap = 1
timegap = 6
trans = add1
palcontrast = 128,128,128
paladd = 0,0,0
palmul = 1,1,1


[State 40, 6]
type = ChangeState
triggerAll = AnimTime = 0
trigger1 = var(4) = 1
trigger2 = var(4) = 5
trigger3 = var(4) = 7
value = 42
ctrl = 1

[State 40, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;=================================================================================
; 小跳
;=================================================================================
[Statedef 42]
type = A
physics = N

[State 1101, pos]
type = Veladd
trigger1 = time > 0
y = const(movement.yaccel)

[State 810, 1]
type = AfterImage
trigger1 = !time && sysvar(1)
time = -1
length = 4
framegap = 1
timegap = 6
trans = add1
palcontrast = 128,128,128
paladd = 0,0,0
palmul = 1,1,1

[State 50, 1]
type = VarSet
trigger1 = Time = 1
sysvar(1) = 0

[State 50, 2]
type = ChangeAnim
trigger1 = Time = 0
value = ifelse((vel x)=0, 51, ifelse((vel x)>0, 52, 53))

[State 50, 3]
type = ChangeAnim
trigger1 = Vel y > -2
trigger1 = SelfAnimExist(anim + 3)
persistent = 0
value = Anim + 3

[State 40, 6]
type = ChangeState
trigger1 = Pos Y + Vel Y >= 0
value = 52
ctrl = 1

;=================================================================================
;AI用前跑
;=================================================================================
[Statedef 103]
type    = S
physics = S
anim = 99
ctrl = 0
velset = 0
sprpriority = 1

[State 220,2]
type = ChangeState
trigger1 = AnimTime = 0
value = 104

[Statedef 104]
type    = S
physics = S
anim = 100
ctrl = 0
velset = 0
sprpriority = 1

[State -3, dash]
type = PlaySnd
trigger1 = time = 1
value = 12,8
volume = 200
loop = 1
channel = 27

[State 100, 1]
type = VelSet
trigger1 = 1
x = const(velocity.run.fwd.x)

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
value = 108

[Statedef 108]
type    = S
physics = S
anim = 101
ctrl = 0
velset = 0,0
sprpriority = 1

[State 220,2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1





;=================================================================================
; -3 主要是AI相关
;=================================================================================
[Statedef -3]

[State -3]
type = Null;powerset
trigger1 = roundstate < 2
trigger1 = power != 1284
value = 1284

[State -3, Corner]
type = Velset
trigger1 = FrontEdgeDist < 10 && vel x > 0.1
x = 0.1

[State -3, hop]
type = PlaySnd
triggerall = time = 1
trigger1 = StateNo = 105
value = 12,12

[State -3, land]
type = PlaySnd
triggerall = time = 1
trigger1 = StateNo = 52
value =  12,2

[State -3, land]
type = PlaySnd
triggerall = time = 1
trigger1 = StateNo = 150
trigger2 = StateNo = 152
trigger3 = StateNo = 154
value =  12,2

[State -3,STOP]
type = StopSnd
trigger1 = stateno != 195
trigger1 = stateno != 0
channel = 19

[State -3, Hurt Sound]; Stolen from Warusaki.
type = PlaySnd
triggerall = Random < 500
triggerall = Time = 1
triggerall = Alive
trigger1 = StateNo = 5000 || StateNo = 5010 || StateNo = 5020 || StateNo = 5070 || StateNo = 5100
value = S5000,ifElse(StateNo = 5100||GetHitVar(animtype) = 2,2+(random%1),ifElse(GetHitVar(animtype) = 1,1+(random%1),0+(random%2)))
channel = 7

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
;1. 刚CD处理没加
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
;立回控制
;普通技能对地面全面限制
;1启用立回
;2关闭立回
;---------------------------------------------------------------------------------
[State -3]
type = varset
Trigger1 = 1
var(44) = 1
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;跳跃控制
;---------------------------------------------------------------------------------
[State -3]
type = varadd
Trigger1 = var(45) > 0
var(45) = -1

[State -3]
type = varadd
Trigger1 = helper(33000),var(13) = 39 && EnemyNear,MoveHit 
Trigger2 = EnemyNear,StateType != A && StateNo = [154,155]
var(45) = 60 

[State -3]
type = varadd
Trigger1 = helper(33000),var(13) = 50 && EnemyNear,MoveHit 
var(45) = 60 + EnemyNear,GetHitVar(damage)


;---------------------------------------------------------------------------------
;膝踢控制，防止无限连
;---------------------------------------------------------------------------------
[State -3]
type = varset
Triggerall = var(46)
Trigger1 = RoundState != 2
Trigger2 = EnemyNear,MoveType != H
Trigger3 = EnemyNear,StateType = L
Trigger4 = EnemyNear,Ctrl
var(46) = 0

;---------------------------------------------------------------------------------
;霸气深红/neoMax结束战斗用
;---------------------------------------------------------------------------------
[State -3]
type = varset
Triggerall = var(47)
Trigger1 = RoundState != 2
Trigger2 = EnemyNear,MoveType != H
Trigger3 = EnemyNear,StateType = L
Trigger4 = EnemyNear,Ctrl
var(47) = 0

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
trigger1 = var(51) = 0
fvar(39) = 1 * ifelse(EnemyNear,MoveType = A,1.2,1)
IgnoreHitPause = 1

[State -3]
type = VarSet
triggerAll = var(51) 
trigger1 = EnemyNear,MoveType != H 
trigger2 = EnemyNear,Ctrl 
fvar(39) = 0.6 * ifelse(EnemyNear,MoveType = A,1.2,1)
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
trigger1 = Ctrl || StateNo = 1 || StateNo = 18 || StateNo = 19 || (StateNo = [120,149]) || (StateNo = [103,104]) || StateNo = 108
trigger2 = (StateNo = 52 && AnimTime = 0) 
trigger3 = (StateNo = 1404 && AnimTime = 0)
var(11) = 1
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;对应特殊技取消条件
[State -3]
type = VarSet
trigger1 = StateNo = 205 && AnimElemTime(3) >= 1
trigger2 = StateNo = 215 && AnimElemTime(3) >= 1
trigger3 = StateNo = 315 && AnimElemTime(4) >= 1

trigger4 = StateNo = 200 && AnimElemTime(3) >= 1
trigger5 = StateNo = 210 && AnimElemTime(5) >= 1

trigger6 = StateNo = 400 && AnimElemTime(3) >= 1
trigger7 = StateNo = 500 && AnimElemTime(3) >= 1
trigger8 = StateNo = 405 && AnimElemTime(3) >= 1 
trigger9 = StateNo = 505 && AnimElemTime(4) >= 1 

trigger10 = StateNo = 980 && AnimElemTime(5) >= 1 
trigger11 = StateNo = 981 && AnimElemTime(5) >= 1 
var(11) = 2
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;对应必杀技的取消条件
[State -3]
type = VarSet
trigger1 = StateNo = 800 && AnimElemTime(6) >= 1
trigger2 = StateNo = 801 && AnimElemTime(6) >= 1
trigger3 = StateNo = 810 && AnimElemTime(5) >= 1
var(11) = 3
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;对应超杀技的取消条件
[State -3]
type = VarSet
Trigger1 = StateNo = 1200 && AnimElemTime(4) >= 1
Trigger2 = StateNo = 1205 && AnimElemTime(4) >= 1  
var(11) = 4
IgnoreHitPause = 1


;=================================================================================
;抢招9
;=================================================================================
[State -3,CL HP]
type = ChangeState
value = 215
TriggerAll = var(59)
TriggerAll = var(11) = 1
Triggerall = StateType != A
TriggerAll = Random < 200
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,StateNo < 1000
TriggerAll = EnemyNear,StateNo = Helper(33000),var(2)
triggerAll = enemynear,time < helper(33000),var(3) - 3
Triggerall = P2BodyDist X<= 30
;对地
Trigger1 = EnemyNear,StateType = S
Trigger1 = P2BodyDist x - fvar(37) * 5 < 26 
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
TriggerAll = EnemyNear,StateNo < 1000
TriggerAll = EnemyNear,StateNo = Helper(33000),var(2)
triggerAll = enemynear,time < helper(33000),var(3) - 4
;对地
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - fvar(37) * 4 < 45 
Trigger1 = var(50) := 40091
IgnoreHitPause = 1


[State -3,CR LK]
type = ChangeState
value = 500
TriggerAll = var(59)
TriggerAll = var(11) = 1
Triggerall = StateType != A
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,StateNo < 1000
TriggerAll = EnemyNear,StateType != A
TriggerAll = P2BodyDist x - fvar(37) * 4 < 51 
;对地
Trigger1 = EnemyNear,StateNo = Helper(33000),var(2)
trigger1 = enemynear,time < helper(33000),var(3) - 4
Trigger1 = var(50) := 50091
;对地
Trigger2 = EnemyNear,StateType = S
Trigger2 = EnemyNear,Time < 2
trigger2 = EnemyNear,AnimTime < -21
Trigger2 = var(50) := 50092
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
triggerAll = enemynear,time < helper(33000),var(3) - 3
Triggerall = P2BodyDist X<= 27
;对地
Trigger1 = EnemyNear,StateType = S
Trigger1 = P2BodyDist x - fvar(37) * 3 < 27 
Trigger1 = var(50) := 20591
IgnoreHitPause = 1

[State -3,CL LK]
type = ChangeState
value = 305
TriggerAll = var(59)
TriggerAll = var(11) = 1
Triggerall = StateType != A
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,StateNo < 1000
TriggerAll = EnemyNear,StateNo = Helper(33000),var(2)
triggerAll = enemynear,time < helper(33000),var(3) - 3
Triggerall = P2BodyDist X<= 26
;对地
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - fvar(37) * 4 < 27 
Trigger1 = var(50) := 30591
IgnoreHitPause = 1


[State -3,LP]
type = ChangeState
value = 200
TriggerAll = var(59)
TriggerAll = var(11) = 1
Triggerall = StateType != A
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,StateNo < 1000
TriggerAll = EnemyNear,StateNo = Helper(33000),var(2)
triggerAll = enemynear,time < helper(33000),var(3) - 3
Triggerall = P2BodyDist X>= 27
;对地
Trigger1 = EnemyNear,StateType = S
Trigger1 = P2BodyDist x - fvar(37) * 3 < 54 
Trigger1 = var(50) := 20591
IgnoreHitPause = 1

[State -3,LK]
type = ChangeState
value = 300
TriggerAll = var(59)
TriggerAll = var(11) = 1
Triggerall = StateType != A
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,StateNo < 1000
TriggerAll = EnemyNear,StateNo = Helper(33000),var(2)
triggerAll = enemynear,time < helper(33000),var(3) - 7
Triggerall = P2BodyDist X>= 26
;对地
Trigger1 = helper(33000),var(13) != 300
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - fvar(37) * 6 = [60,74] 
Trigger1 = var(50) := 30091
IgnoreHitPause = 1

;=================================================================================
;抓硬直8
;1.瞬刺速度快，可以抓硬直
;
;=================================================================================
[State -3,前行抓硬直]
type = ChangeState
TriggerAll = var(59)
TriggerAll = var(11) = 1
TriggerAll = StateNo != [103,105]
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
value = ifelse(P2BodyDist x >= 45, 103, 19)
IgnoreHitPause = 1

[State -3,抓破防]
type = ChangeState
TriggerAll = var(59)
TriggerAll = var(11) = 1
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo = 5700
Trigger1 = P2BodyDist x < 26 && EnemyNear,Time < 34
Trigger1 = var(54) := 215
Trigger1 = var(50) := 021581
Trigger2 = P2BodyDist x < 50 && EnemyNear,Time = [33,35]
Trigger2 = var(54) := 500
Trigger2 = var(50) := 050081
value = var(54)
IgnoreHitPause = 1


[State -3,普通抓硬直]
type = ChangeState
TriggerAll = var(59) 
TriggerAll = !inguarddist || EnemyNear,Facing = Facing || (EnemyNear,StateNo >= 1000 && EnemyNear,AnimTime >= -15)
TriggerAll = EnemyNear,StateNo = [200,4999]
TriggerAll = EnemyNear,MoveType = A || EnemyNear,MoveType = I 
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateType != L
TriggerAll = !(EnemyNear,StateNo >= 5000 && EnemyNear,MoveType = I)
TriggerAll = StateType != A 
TriggerAll = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
TriggerAll = EnemyNear,Time > 8 || EnemyNear,Facing = Facing
TriggerAll = !PlayerIdExist(Helper(33333333),var(3)) || abs(PlayerId(Helper(33333333),var(3)),pos x - pos x) > 50 
;近立Y
Trigger1 = var(11) = 1 
Trigger1 = EnemyNear,StateType = S
Trigger1 = EnemyNear,animtime < -5
Trigger1 = EnemyNear,StateNo < 1000 || EnemyNear,AnimTime = [-12, -7]
Trigger1 = P2BodyDist x = [-15, 15]
Trigger1 = var(54) := 215
Trigger1 = var(50) := 021571
;近立重脚
Trigger2 = var(11) = 1 
Trigger2 = EnemyNear,animtime < -7
Trigger2 = EnemyNear,StateNo < 1000 || EnemyNear,AnimTime = [-11, -9]
Trigger2 = P2BodyDist x = [-10, 10]
Trigger2 = var(54) := 315
Trigger2 = var(50) := 031571
;蹲A
Trigger3 = var(11) = 1 || (StateNo = 500 && AnimElemTime(3) > 0)||(StateNo = 400 && AnimElemTime(3) > 0)
Trigger3 = P2BodyDist x = [-50, 50]
Trigger3 = (EnemyNear,animtime = [-6,-3]) || (P2BodyDist x < 15 && EnemyNear,AnimTime <= -3)
Trigger3 = var(54) := 500
Trigger3 = var(50) := 050071
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
;蹲b非版边
Trigger1 = BackEdgeBodyDist >= 10
Trigger1 = fvar(11) = [5,7]
Trigger1 = P2BodyDist x = [-51,51]
Trigger1 = var(54) := 500
Trigger1 = var(50) := 050082
;蹲b版边
Trigger2 = BackEdgeBodyDist < 10
Trigger2 = fvar(11) = [5,7]
Trigger2 = P2BodyDist x < 51
Trigger2 = var(54) := 500
Trigger2 = var(50) := 050083
value = var(54)
IgnoreHitPause = 1

[State -3,第二型]
type = ChangeState
value = 1010
TriggerAll = var(59)
TriggerAll = EnemyNear,StateNo != 5040
TriggerAll = StateType != A
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType != A
triggerall = EnemyNear,StateNo = [120,159]
triggerall = !EnemyNear,Ctrl
triggerall = fvar(10) >= 8800
triggerall = (StateNo = 1000 && Animelem = 8,>0 && Animelem = 8,<=3) || (StateNo = 1015 && Animelem = 8,>0 && Animelem = 8,<=3)
trigger1 = P2BodyDist X < 65
trigger1 = var(50) := 101061

;=================================================================================
;切返7
;=================================================================================
;前滚后滚都放到后面，表示如果上述攻击手段都不行的时候，再使用AB闪避
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
Trigger1 = P2BodyDist x < 100
Trigger1 = var(50) := 75171
value = 750
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
Trigger1 = EnemyNear,MoveType = A && !EnemyNear,Ctrl
Trigger1 = helper(33000),var(11) != 3
Trigger1 = EnemyNear,facing != facing
Trigger1 = P2BodyDist x < 100
Trigger1 = EnemyNear,animtime < -30
Trigger1 = var(50) := 075071
value = 750


[State -3,隐藏2]
type = ChangeState
triggerall = var(59)
triggerall = inguarddist
triggerall = statetype != A 
triggerall = var(11) = [1,3]
triggerall = power >= 3000 || (var(51) > 0 && power >= 1000) 
triggerall = Life <= LifeMax*0.15
triggerall = EnemyNear,HitDefAttr = SCA,AA,AP,AT
triggerall = (RoundNo >= 2 && EnemyNear,Life < 300) || (EnemyNear,Life = [250,350]) || EnemyNear,StateNo >= 2000
;对空用
trigger1 = EnemyNear,StateType = A && EnemyNear,MoveType = A
trigger1 = EnemyNear,Facing != Facing
trigger1 = EnemyNear,Pos Y + EnemyNear,Vel Y * 11 + fvar(38) * 11 * (11 + 1) / 2 <= -60
trigger1 = P2BodyDist X - fvar(37) * 11 = [50, 70]
trigger1 = var(50) := 400072
value = 4000
IgnoreHitPause = 1

[State -3,霸气深红]
type = ChangeState
triggerall = var(59)
triggerall = inguarddist
triggerall = statetype != A 
triggerall = var(11) = [1,3]
triggerall = power >= 3000 || (var(51) > 0 && power >= 1000) 
triggerall = Life <= LifeMax*3
triggerall = EnemyNear,HitDefAttr = SCA,AA,AP,AT
triggerall = (EnemyNear,Life = [150,250]) || EnemyNear,StateNo >= 2000
;对空用
trigger1 = EnemyNear,StateType = A && EnemyNear,MoveType = A
trigger1 = EnemyNear,Facing != Facing
trigger1 = EnemyNear,Pos Y + EnemyNear,Vel Y * 7 + fvar(38) * 7 * (7 + 1) / 2 = [-50, -25]
trigger1 = P2BodyDist X - fvar(37) * 7 = [0, 40]
trigger1 = var(50) := 320071
;对地面
trigger2 = EnemyNear,StateType != A && EnemyNear,MoveType = A
trigger2 = EnemyNear,Facing != Facing
trigger2 = EnemyNear,Vel Y = 0
trigger2 = EnemyNear,Vel x >= 0
trigger2 = P2BodyDist X - fvar(37) * 7 < 50
trigger2 = EnemyNear,AnimTime < -12
trigger2 = var(50) := 320072

value = 3200
IgnoreHitPause = 1


[State -3,MAX链动]
type = ChangeState
triggerall = var(59)
triggerall = statetype != A 
triggerall = var(11) = [1,4]
triggerall = EnemyNear,HitDefAttr = SCA,AA,AP,AT
triggerall = power >= 3000 || (var(51) > 0 && power >= 1000) 
triggerall = Life < 200 || power >= 4500 || (EnemyNear,Life = [200,300]) || EnemyNear,AnimTime < -45 || EnemyNear,StateNo >= 2000
;切返用
trigger1 = P2BodyDist x >= 160
trigger1 = EnemyNear,Vel y = 0
Trigger1 = EnemyNear,StateType != C
trigger1 = EnemyNear,StateType != A && EnemyNear,MoveType = A
trigger1 = EnemyNear,Facing != Facing
trigger1 = EnemyNear,AnimTime < -(8 + P2BodyDist X/12.0) || EnemyNear,AnimTime < -38
trigger1 = EnemyNear,Vel x = 0
trigger1 = var(50) := 311071
value = 3110
IgnoreHitPause = 1

[State -3,升龙超杀]
type = ChangeState
triggerall = var(59)
triggerall = statetype != A 
triggerall = var(11) = [1,3]
triggerall = power >= 1000 || var(51) > 0 
triggerall = EnemyNear,HitDefAttr = SCA,AA,AP,AT || EnemyNear,StateType = A
triggerall = Life < 200 || Power >= 2800 || EnemyNear,Life < 200
Triggerall = P2BodyDist x < 50
Triggerall = EnemyNear,MoveType = A
Triggerall = EnemyNear,Facing != Facing
Triggerall = EnemyNear,Vel x >= 0
;空振对方超杀用
Trigger1 = EnemyNear,Vel y = 0
Trigger1 = EnemyNear,AnimTime < -4
trigger1 = EnemyNear,StateType != A 
trigger1 = inguarddist
trigger1 = EnemyNear,StateNo = [1000,4999]
trigger1 = var(50) := 330071
;一段对空
trigger2 = EnemyNear,StateNo = [200,4999]
trigger2 = EnemyNear,StateType = A 
trigger2 = P2BodyDist x - fvar(37) * 5 = [-5,30]
trigger2 = EnemyNear,Pos Y + EnemyNear,Vel Y * 5 + fvar(38) * 5 * (5 + 1) / 2 = [-55,-20]
trigger2 = var(50) := 330072
value = 3300
IgnoreHitPause = 1

[State -3,滑步出版边]
type = ChangeState
triggerall = var(59)
triggerall = statetype != A 
triggerall = var(11) = [2,3]
triggerall = !EnemyNear,NumProj && !PlayerIdExist(Helper(33333333),var(3)) 
trigger1 = P2BodyDist Y < -120
Trigger1 = (EnemyNear,StateNo >= 1000 && EnemyNear,MoveType = A) || EnemyNear,Ctrl || EnemyNear,Vel Y <= -1
Trigger1 = FrontEdgeBodyDist > 100
trigger1 = var(50) := 110571
value = 1105


;--------------------------------------------------------------------------
;大升龙不切返普通技能
;容易被对方空振
;--------------------------------------------------------------------------
[State -3,大升龙]
type = ChangeState
triggerall = var(59)
triggerall = statetype != A 
triggerall = var(11) = [1,3]
triggerall = EnemyNear,HitDefAttr = SCA,AA,AP,AT || EnemyNear,StateType = A
triggerall = EnemyNear,MoveType = A
triggerall = EnemyNear,Vel x >= 0 ;类似Bloo这种空振后退的
;凹对面必杀、超杀，可能有多段判定，所以必须第一个攻击判定能打到
trigger1 = EnemyNear,StateType != A
trigger1 = P2BodyDist x - fvar(37) * 8 < 44
trigger1 = EnemyNear,AnimTime <= -8 || EnemyNear,Time < 4
Trigger1 = EnemyNear,StateNo >= 1000
trigger1 = var(50) := 120571
;1段攻击凹对面普通技能
trigger2 = EnemyNear,StateType != A
trigger2 = P2BodyDist x - fvar(37) * 8 < 44
trigger2 = (Life < EnemyNear,Life -100 && Enemynear,StateType != C) || var(11) = [2,3]
Trigger2 = EnemyNear,StateNo >= 1000
trigger2 = EnemyNear,AnimTime <= -8 || EnemyNear,Time < 4
trigger2 = var(50) := 120572
;2段攻击凹对面普通技能
trigger3 = EnemyNear,StateType != A
trigger3 = P2BodyDist x = [-10,65]
trigger3 = var(11) = [2,3]
Trigger3 = EnemyNear,StateNo >= 1000
trigger3 = EnemyNear,AnimTime <= -17 || EnemyNear,StateType = A
trigger3 = var(50) := 120573
;1段对空
trigger4 = EnemyNear,StateType = A
trigger4 = (P2BodyDist Y < 35 && P2BodyDist x < 40) || P2BodyDist x - fvar(37) * 8 = [-15, 44]
trigger4 = EnemyNear,Pos Y + EnemyNear,Vel Y * 8 + fvar(38) * 8 * (8 + 1) / 2 = [-55,-20]
trigger4 = var(50) := 120574
value = 1205
IgnoreHitPause = 1


[State -3,小升龙]
type = ChangeState
triggerall = var(59)
triggerall = statetype != A 
triggerall = var(11) = [2,3]
Triggerall = EnemyNear,StateType != C
triggerall = EnemyNear,HitDefAttr = SCA,AA,AP,AT || EnemyNear,StateType = A
triggerall = EnemyNear,MoveType = A
triggerall = P2BodyDist x - fvar(37) * 3 < 45
triggerall = EnemyNear,StateNo < 2000
triggerall = EnemyNear,Vel x >= 0  ;类似Bloo这种空振后退的
trigger1 = EnemyNear,StateType != A
trigger1 = EnemyNear,AnimTime <= -4
Trigger1 = EnemyNear,StateNo >= 1000
trigger1 = var(50) := 120071

trigger2 = EnemyNear,StateType != A
Trigger2 = EnemyNear,StateNo = [200,999]
Trigger2 = EnemyNear,AnimTime <= -4
trigger2 = var(50) := 120072

trigger3 = EnemyNear,StateType != A
Trigger3 = EnemyNear,Time < 4
Trigger3 = EnemyNear,StateNo >= 1000
trigger3 = var(50) := 120073

trigger4 = EnemyNear,StateType = A
trigger4 = EnemyNear,Pos Y + EnemyNear,Vel Y * 3 + fvar(38) * 3 * (3 + 1) / 2 = [-55,-20]
trigger4 = (P2BodyDist Y < 35 && P2BodyDist x < 40) || P2BodyDist x - fvar(37) * 3 = [-15, 38]
trigger4 = var(50) := 120074

value = 1200
IgnoreHitPause = 1


[State -3,空中扳机]
type = ChangeState
triggerall = var(59)
triggerall = statetype = A 
triggerall = ctrl || (StateNo = 610 && animelemtime(3) > 0 && animelemtime(4) < 0) || (StateNo = 710 && animelemtime(4) > 0 && animelemtime(6) < 0) || StateNo = [120,149]
triggerall = EnemyNear,MoveType = A
triggerall = EnemyNear,StateType != A

trigger1 = P2BodyDist Y > 60
trigger1 = EnemyNear,Time < 4
trigger1 = EnemyNear,StateNo < 2000
trigger1 = P2BodyDist x > 10 
trigger1 = var(50) := 145071 

trigger2 = EnemyNear,StateNo >= 1000
trigger2 = P2BodyDist Y > 60
trigger2 = P2BodyDist x < 60
trigger2 = var(50) := 145072
value = ifelse(Vel Y <= 0 || P2BodyDist Y > 70, 1400, 1450)

[State -3,空中瞬刺]
type = ChangeState
value = 1320
triggerall = var(59)
triggerall = statetype = A
triggerall = P2BodyDist x = [-15, 70]
triggerall = (EnemyNear,StateNo = [2000,4999]) && EnemyNear,Time < 15
triggerall = EnemyNear,MoveType = A 
trigger1 = ctrl
trigger1 = var(50) := 132071
trigger2 = stateno = 610 && animelemtime(3) > 0 && animelemtime(4) < 0 
trigger2 = var(50) := 132072
trigger3 = stateno = 710 && animelemtime(4) > 0 && animelemtime(6) < 0 
trigger3 = var(50) := 132073

[State -3,滑步跑路]
type = ChangeState
value = ifelse(FrontEdgeBodyDist > 120,1025,1020)
TriggerAll = var(59)
Triggerall = StateType != A
triggerall = StateNo = 1000 || StateNo = 1015
triggerall = Animelem = 8,>0 && Animelem = 8,<=3

trigger1 = EnemyNear,MoveType = A
trigger1 = EnemyNear,StateNo >= 2000
;
trigger2 = EnemyNear,MoveType != H
trigger2 = EnemyNear,StateType = A || EnemyNear,Vel Y > 0
trigger2 = EnemyNear,Vel x > 0
trigger2 = P2BodyDist x - ((fvar(11) - 7) * EnemyNear,Vel x) < 50 


[State -3,第二击]
type = ChangeState
TriggerAll = var(59)
TriggerAll = (StateNo = 1015 && Animelem = 8,>0 && Animelem = 8,<=3) || (StateNo = 1000 && Animelem = 8,>0 && Animelem = 8,<=3)
TriggerAll = StateType != A
TriggerAll = EnemyNear,StateNo != 5700
trigger1 = EnemyNear,StateType = A
trigger1 = EnemyNear,Vel x < 0
trigger1 = EnemyNear,Pos Y < -60
trigger1 = P2BodyDist X > 70
trigger1 = var(50) := 100531

trigger2 = EnemyNear,StateType != A
trigger2 = P2BodyDist X > 75
trigger2 = EnemyNear,StateNo = [150,159]
trigger2 = EnemyNear,GetHitVar(Hittime) >= 8
trigger2 = var(50) := 100532
value = 1005

[State -3,切返投技]
type = ChangeState
TriggerAll = var(59)
triggerall = var(11) = 1
triggerall = StateType != A

trigger1 = EnemyNear,MoveType = A
Trigger1 = P2BodyDist x = [-60, 60]
trigger1 = Enemy,HitDefAttr = SCA,AT
trigger1 = var(50) := 390704
trigger1 = var(4) := 7
;对空
trigger2 = !inguarddist
Trigger2 = EnemyNear,MoveType != H
trigger2 = EnemyNear,StateType = A
trigger2 = P2BodyDist Y < -95
trigger2 = P2BodyDist x = [35, 90]
trigger2 = BackEdgeBodyDist >= 60
trigger2 = EnemyNear,Vel x >= 0
trigger2 = var(50) := 390705
trigger2 = var(4) := 6
value = 39

[State -3,瞬刺踢普通技能]
type = ChangeState
TriggerAll = var(59)
TriggerAll = var(11) = 1
TriggerAll = StateType != A
TriggerAll = EnemyNear,StateType != A
TriggeaAll = EnemyNear,Facing != Facing
TriggerAll = P2BodyDist x < 120
Triggerall = EnemyNear,AnimTime <= -15
Triggerall = EnemyNear,StateNo = [200,99]
Trigger1 = EnemyNear,StateType = S && EnemyNear,MoveType = A
trigger1 = enemynear,time = helper(33000),var(3) - 1
trigger1 = random < 100
value = 1300

[State -3,瞬刺直接踢了]
type = ChangeState
TriggerAll = var(59)
TriggerAll = var(11) = 1
TriggerAll = StateType != A
TriggerAll = EnemyNear,StateType != A
TriggeaAll = EnemyNear,Facing != Facing
TriggerAll = P2BodyDist x < 120
Triggerall = EnemyNear,AnimTime <= -16
Triggerall = EnemyNear,StateNo = [200,4999]
Trigger1 = EnemyNear,MoveType = A 
Trigger1 = PlayerIdExist(Helper(33333333),var(3)) &&  PlayerID(helper(33333333),var(3)), pos y < -100
Trigger1 = var(50) := 130575 
Trigger2 = EnemyNear,Vel x <= 0
Trigger2 = EnemyNear,MoveType = I && P2BodyDist x > 85
Trigger2 = var(50) := 130576
value = ifelse(Enemynear,AnimTime <= - 16 && EnemyNear,StateType = S,1305,1300)


[State -3,滑步跑路]
type = ChangeState
TriggerAll = var(59)
TriggerAll = var(11) = [2,3]
TriggerAll = StateType != A
TriggerAll = EnemyNear,StateType != A
TriggeaAll = EnemyNear,Facing != Facing
TriggerAll = EnemyNear,MoveType = A
Trigger1 = InGuardDist
Trigger1 = EnemyNear,StateNo = [2000,4999]
Trigger1 = EnemyNear,Time <= 8
Trigger1 = var(50) := 110075
;当身直接跑路
Trigger2 = EnemyNear,Time < 2
Trigger2 = EnemyNear,Vel x = 0
Trigger2 = !(EnemyNear,HitDefAttr = SCA,AA,AP,AT)
Trigger2 = var(50) := 110076
value = ifelse(FrontEdgeBodyDist > 90, 1105, 1100)

[State -3,对空跑路用]
type = ChangeState
TriggerAll = var(59)
TriggerAll = var(11) = 1
TriggerAll = StateType != A
TriggerAll = EnemyNear,StateType = A
TriggeaAll = EnemyNear,Facing != Facing
TriggerAll = EnemyNear,MoveType != H
Trigger1=  EnemyNear,Vel Y <= 0
Trigger1 = P2BodyDist Y < -75
Trigger1 = P2BodyDist X < 50
Trigger1 = var(50) := 110077
value = ifelse(FrontEdgeBodyDist > 90, 1105, 1100) 


;=================================================================================
;连段+连携6
;近A/近B 只能接扳机
;近C/近D 可以接一英寸/膝盖
;Far C可以接膝盖
;版边优先扳机 >> 第二型 （伤害高并且省气）未完成
;近C第二段只有BC中有用
;=================================================================================

;------------------------------------------------------------------------------------
;超杀结束战斗
;------------------------------------------------------------------------------------
[State -3,隐藏2]
type = ChangeState
value = 4000
triggerall = var(59)
triggerall = Life < LifeMax*0.15
triggerall = (var(51) > 0 && Power >= 1000) || Power >= 3000
triggerall = EnemyNear,Life < 300
triggerall = RoundNo >= 2
triggerall = statetype != A
triggerall = EnemyNear,MoveType = H 
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000
trigger1 = StateNo = 210 || StateNo = 215 || StateNo = 405 || StateNo = 315
trigger1 = moveHit
trigger1 = EnemyNear,StateType != A
trigger1 = var(50) := 400066

[State -3,隐藏1]
type = ChangeState
value = 3200
triggerall = var(59)
triggerall = Life < LifeMax*0.3
triggerall = (var(51) > 0 && Power >= 1000) || Power >= 3000
triggerall = EnemyNear,Life < 200
triggerall = RoundNo >= 2
triggerall = statetype != A
triggerall = EnemyNear,MoveType = H 
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000
trigger1 = StateNo = 210 || StateNo = 215 || StateNo = 405 || StateNo = 315
trigger1 = (MoveContact && EnemyNear,Power < 1000) || MoveHit
trigger1 = EnemyNear,StateType != A
trigger1 = var(50) := 311066

[State -3,MAX链动]
type = ChangeState
value = 3110
triggerall = var(59)
triggerall = (var(51) > 0 && Power >= 1000) || Power >= 3000
triggerall = EnemyNear,Life < 300
triggerall = RoundNo >= 2
triggerall = statetype != A
triggerall = EnemyNear,MoveType = H 
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000
trigger1 = StateNo = 1200 && MoveHit && AnimElem = 4
trigger1 = var(50) := 311064

trigger2 = StateNo = 1210 && MoveHit && AnimElem = 4
trigger2 = var(50) := 311065

trigger3 = StateNo = 210 || StateNo = 215 || StateNo = 405 || StateNo = 315
trigger3 = moveHit
trigger3 = EnemyNear,StateType != A
trigger3 = var(50) := 311066


[State -3,链动]
type = ChangeState
value = ifelse(Random < 200,3300,3100)
triggerall = var(59)
triggerall = (var(51) > 0) || Power >= 1000
triggerall = EnemyNear,Life < 200
triggerall = statetype != A
triggerall = EnemyNear,MoveType = H 
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000
trigger1 = (var(51) > 0) || Power >= 2000
trigger1 = StateNo = 1200 && MoveHit && AnimElem = 4
trigger1 = var(50) := 310064

trigger2 = (var(51) > 0) || Power >= 2000
trigger2 = StateNo = 1210 && MoveHit && AnimElem = 4
trigger2 = var(50) := 310065

trigger3 = StateNo = 210 || StateNo = 215 || StateNo = 405 || StateNo = 315
trigger3 = moveHit
trigger3 = EnemyNear,StateType != A
trigger3 = var(50) := 310066
;------------------------------------------------------------------------------------





[State -3,升龙派生]
type = ChangeState
triggerall = var(59)
triggerall = stateno = 1205 && animelem = 13
trigger1 = MoveContact
trigger1 = !EnemyNear,Ctrl && EnemyNear,StateNo >= 5000
trigger1 = EnemyNear,MoveType = H && EnemyNear,StateType = A
trigger1 = var(50) := 121061
value = 1210

[State -3,空中扳机]
type = ChangeState
value = 1400
triggerall = var(59)
triggerall = fvar(9) >= 3
triggerall = EnemyNear,Facing != Facing || P2BodyDist Y <= 38
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType != A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 || EnemyNear,StateNo = [120,159]
triggerall = EnemyNear,GetHitVar(Hittime) >= 10
triggerall = P2BodyDist X >= 12 || (EnemyNear,Facing = Facing) || Pos Y < 30
trigger1 = stateno = 610 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger1 = var(50) := 140061
trigger2 = stateno = 710 && animelemtime(4) > 0 && animelemtime(6) < 0 
trigger2 = var(50) := 140062
trigger3 = stateno = 810 && movecontact
trigger3 = var(50) := 140063

[State -3,新霸气深红]
type = ChangeState
triggerall = var(59)
triggerall = statetype != A 
triggerall = var(51) = 0
triggerall = power >= 3000 
triggerall = Life <= LifeMax*0.15
trigger1 = EnemyNear,MoveType = H
trigger1 = EnemyNear,StateNo = 13100 && EnemyNear,Time >= 12
trigger1 = StateNo = 3106
value = 4000

[State -3,霸气深红 连携代入]
type = ChangeState
triggerall = var(59)
triggerall = Life < LifeMax*0.3
triggerall = power >= 3000 || (var(51) > 0 && power >= 1000)
triggerall = (RoundNo >= 2 && EnemyNear,Life < 220) || EnemyNear,Life = [150,250]
triggerall = EnemyNear,Facing != Facing
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,MoveType = H
triggerall = EnemyNear,StateNo = [120,159]
triggerall = EnemyNear,StateType != A || EnemyNear,Pos Y + EnemyNear,Vel Y * 5 + fvar(38) * 5 * (5 + 1) / 2 = [-60,-25]
triggerall = p2bodydist x < 25
trigger1 = StateNo = 215 && MoveGuarded
trigger2 = StateNo = 315 && MoveGuarded
trigger3 = StateNo = 500 && MoveGuarded
trigger4 = StateNo = 400 && MoveGuarded
value = 3200

[State -3,BC]
type = ChangeState
value = 791
triggerall = var(59)
triggerall = var(51) = 0
triggerall = !numhelper(70001) && !numhelper(70002)
triggerall = EnemyNear,Life > 200
triggerall = power >= 2000
triggerall = statetype != A
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType != A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 
triggerall = MoveHit
trigger1 = 0
trigger1 = StateNo = 500 && enemynear,BackEdgeBodyDist < 10
trigger1 = P2BodyDist X < 50
trigger1 = var(50) := 79161
trigger2 = StateNo = 801
trigger2 = var(50) := 79162

[State -3,原地爆气接霸气深红/NEOMAX]
type = ChangeState
value = 790
triggerall = var(59)
triggerall = var(51) = 0
triggerall = power >= 2000
triggerall = roundno >= 2
triggerall = Enemynear,Life <= 250
triggerall = Life < LifeMax * 0.3
triggerall = statetype != A
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType = A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 
triggerall = NumTarget(1010)
triggerall = StateNo = 1010 && AnimTime = 0
trigger1 = EnemyNear,BackEdgeBodyDist < 32
trigger1 = P2BodyDist x < 60
trigger1 = var(47) := 790

[State -3,原地爆气]
type = ChangeState
value = 790
triggerall = var(59)
triggerall = var(51) = 0
triggerall = power >= 1000
triggerall = Enemynear,Life >= 100
triggerall = statetype != A
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType = A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 
triggerall = NumTarget(1010)
triggerall = StateNo = 1010 && AnimTime = 0

trigger1 = EnemyNear,BackEdgeBodyDist < 32
trigger1 = FrontEdgeBodyDist < 90 
trigger1 = var(50) := 79061

trigger2 = EnemyNear,Facing != Facing
trigger2 = EnemyNear,BackEdgeBodyDist < 32 && P2BodyDist x < 75
trigger2 = var(50) := 79062

trigger3 = P2BodyDist x < 75
trigger3 = EnemyNear,FrontEdgeBodyDist < 32
trigger3 = EnemyNear,Facing = Facing
trigger3 = var(50) := 79063



[State -3]
type = ChangeState
triggerall = var(59)
triggerall = statetype != A
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType != A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 
trigger1 = StateNo = 791 && AnimTime = 0
trigger1 = var(4) := 2
trigger1 = var(50) := 003961
value = 39

[State -3,]
type = ChangeState
triggerall = var(59)
triggerall = StateType != A
triggerall = !EnemyNear,Ctrl && EnemyNear,StateNo >= 5000
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType = A
trigger1 = EnemyNear,Pos Y + EnemyNear,Vel Y * 4 + fvar(38) * 4 * (4 + 1) / 2 = [-40,-25]
trigger1 = stateno = 205
trigger1 =  MoveHit
trigger1 = var(50) := 120061

trigger2 = P2BodyDist x - fvar(37)*4 = [0, 33]
trigger2 = EnemyNear,Pos Y + EnemyNear,Vel Y * 4 + fvar(38) * 4 * (4 + 1) / 2 = [-40,-25]
trigger2 = stateno = 410
trigger2 =  MoveHit
trigger2 = var(50) := 120062
value = 1200

[State -3,]
type = ChangeState
triggerall = var(59)
triggerall = StateType != A
triggerall = !EnemyNear,Ctrl && EnemyNear,StateNo >= 5000
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType = A
trigger1 = P2BodyDist x - fvar(37)*8 = [-18, 47]
trigger1 = EnemyNear,Pos Y + EnemyNear,Vel Y * 8 + fvar(38) * 8 * (8 + 1) / 2 = [-45,-25]
trigger1 = stateno = 410 || StateNo = 210
trigger1 =  MoveHit
trigger1 = var(50) := 120561
value = 1205
 
;------------------------------------------------------------------------------------------------
;BC连段
;------------------------------------------------------------------------------------------------
[State -3,Neomax隐藏]
type = ChangeState
value = 4000
triggerall = var(59)
triggerall = var(51) > 0
triggerall = Life < LifeMax*0.15
triggerall = power < 3000 || EnemyNear,Life < 300 ;大于3气走Dream Cancel
triggerall = power >= 1000 && var(51) = (0, 160]
triggerall = statetype != A
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType = A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000
trigger1 = var(11) = 1
trigger1 = Helper(33000),var(14) = 1200 || Helper(33000),var(14) = 1305 || Helper(33000),var(14) = 1310 || Helper(33000),var(14) = 1205
trigger1 = EnemyNear,BackEdgeBodyDist < 32
trigger1 = var(50) := 400061

[State -3,MAX链动]
type = ChangeState
value = 3110
triggerall = var(59)
triggerall = var(51) > 0
triggerall = power >= 1000 && (var(50) = 120063 || var(51) = (0, 160])
triggerall = statetype != A
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType = A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000
trigger1 = StateNo = 1200 && MoveHit
trigger1 = var(50) := 311061


[State -3,链动]
type = ChangeState
value = ifelse(Life > EnemyNear,Life && Random < 500,3300,3100)
triggerall = var(59)
triggerall = var(51) > 0
triggerall = var(50) = 120063 || var(51) = (0, 160]
triggerall = statetype != A
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType = A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000
trigger1 = StateNo = 1200 && MoveHit
trigger1 = var(50) := 310062

[State -3]
type = ChangeState
value = 1205
triggerall = var(59)
triggerall = var(47) = 0
triggerall = var(51) > 0
triggerall = statetype != A
triggerall = EnemyNear,MoveType = H
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000

trigger1 = EnemyNear,StateType != A
trigger1 = StateNo = 801 && MoveHit

trigger2 = var(11) = 1
trigger2 = EnemyNear,StateType = A
trigger2 = Helper(33000),var(14) = 1010 || NumTarget(1010)
trigger2 = EnemyNear,BackEdgeBodyDist < 10
trigger2 = P2BodyDist x < 60
trigger2 = EnemyNear,Pos Y + EnemyNear,Vel Y * 7 + fvar(38) * 7 * (7 + 1) / 2 = [-35,-20]


[State -3]
type = ChangeState
value = 1200
triggerall = var(59)
triggerall = var(47) = 0
triggerall = var(51) > 0
triggerall = statetype != A
triggerall = EnemyNear,MoveType = H
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000
triggerall = P2BodyDist X < 35

trigger1 = StateNo = 801 && MoveHit
trigger1 = var(50) := 120061

trigger2 = Helper(33000),var(14) = 1200 || Helper(33000),var(14) = 1305 || Helper(33000),var(14) = 1310 || Helper(33000),var(14) = 1205
trigger2 = EnemyNear,Pos Y + EnemyNear,Vel Y * 3 + fvar(38) * 3 * (3 + 1) / 2 = [-43,-20]
trigger2 = var(51) >= 160
trigger2 = var(11) = 1
trigger2 = var(50) := 120062


trigger3 = Helper(33000),var(14) = 1200 || Helper(33000),var(14) = 1305 || Helper(33000),var(14) = 1310 || Helper(33000),var(14) = 1205
trigger3 = var(51) < 160
trigger3 = var(11) = 1
trigger3 = EnemyNear,Pos Y + EnemyNear,Vel Y * 3 + fvar(38) * 3 * (3 + 1) / 2 = [-35,-20]
trigger3 = var(50) := 120063

trigger4 = EnemyNear,BackEdgeBodyDist >= 60
trigger4 = (StateNo = 215 || StateNo = 315) && MoveHit
trigger4 = var(50) := 120064

trigger5 = var(11) = 1
trigger5 = EnemyNear,Pos Y + EnemyNear,Vel Y * 3 + fvar(38) * 3 * (3 + 1) / 2 = [-50,-20]
trigger5 = EnemyNear,BackEdgeBodyDist < 20
trigger5 = NumTarget(1010)
trigger5 = var(50) := 120065

[State -3]
type = ChangeState
value = 1305
triggerall = var(59)
triggerall = var(51) > 0
triggerall = statetype != A
triggerall = EnemyNear,MoveType = H
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000
triggerall = var(50) != 120063
trigger1 = StateNo = 801 && MoveHit
trigger1 = var(50) := 130561
trigger2 = StateNo = 1200 && MoveHit && AnimElemTime(8) > 1
trigger2 = var(50) := 130562
trigger3 = StateNo = 1205 && MoveHit && AnimElemTime(8) > 1
trigger3 = var(50) := 130563

[State -1, 铲地派生]
type = ChangeState
value = 1310
triggerall = var(59)
triggerall = var(51) > 0
triggerall = statetype != A
triggerall = !EnemyNear,Ctrl
trigger1 = EnemyNear,MoveType = H
trigger1 = EnemyNear,StateNo >= 5000
trigger1 = stateno = 1305 && time > 4
trigger1 = var(50) := 131061
ignorehitpause = 1

;------------------------------------------------------------------------------------------------
;普通技连段
;------------------------------------------------------------------------------------------------
[State -3,CR LK]
type = ChangeState
value = 400
triggerall = var(59)
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType != A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 || EnemyNear,StateNo = [120,159]
triggerall = EnemyNear,GetHitVar(Hittime) >= 4
triggerall = StateNo = 400 && MoveContact
triggerall = !(EnemyNear,StateNo >= 5000 && MoveHit && Power >= 1000)

trigger1 = EnemyNear,BackEdgeBodyDist < 20
trigger1 = p2bodydist X < 30
trigger1 = var(50) := 40061

trigger2 = EnemyNear,BackEdgeBodyDist >= 20
trigger2 = p2bodydist X - fvar(37) * 5 < 38
trigger2 = var(50) := 40062

[State -3,CR LK]
type = ChangeState
value = 500
triggerall = var(59)
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType != A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 || EnemyNear,StateNo = [120,159]
triggerall = EnemyNear,GetHitVar(Hittime) >= 4
triggerall = StateNo = 500 && MoveContact
triggerall = !(EnemyNear,StateNo >= 5000 && MoveHit && Power >= 1000)

trigger1 = EnemyNear,BackEdgeBodyDist < 10
trigger1 = p2bodydist X < 25
trigger1 = var(50) := 50061

trigger2 = EnemyNear,BackEdgeBodyDist >= 10
trigger2 = p2bodydist X - fvar(37) * 5 < 38
trigger2 = var(50) := 50062

[State -3, CL LK]
type = ChangeState
value = 305
triggerall = var(59)
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType != A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 || EnemyNear,StateNo = [120,159]
triggerall = EnemyNear,GetHitVar(Hittime) >= 5
triggerall = P2BodyDist X <= 26
triggerall = (StateNo = 305 || StateNo = 205) && MoveContact
triggerall = !(EnemyNear,StateNo  >= 5000 && MoveHit && Power >= 1000)

trigger1 = EnemyNear,BackEdgeBodyDist < 20
trigger1 = p2bodydist X < 20
trigger1 = var(50) := 30565

trigger2 = EnemyNear,BackEdgeBodyDist >= 20
trigger2 = p2bodydist X - fvar(37) * 4 <= 30
trigger2 = var(50) := 30566


[State -3, 膝踢]
type = changestate
triggerall = var(59)
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType != A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 || EnemyNear,StateNo = [120,159]
triggerall = EnemyNear,GetHitVar(Hittime) >= 9
;远C唯一能连的，一英寸是追不上的
trigger1 = EnemyNear,BackEdgeBodyDist < 10
trigger1 = stateNo = 210 && MoveContact
trigger1 = var(50) := 81061
;近C，打大伤害用
trigger2 = EnemyNear,life > 600 
trigger2 = Power <= 1000
trigger2 = var(51) = 0
trigger2 = var(46) = 0
trigger2 = Life <= EnemyNear,Life 
trigger2 = stateNo = 215 || stateNo = 410 || StateNo = 315
trigger2 = MoveHit
trigger2 = var(50):= 81062
trigger2 = var(46):= 81001
value = 810

[State -3, 一英寸]
type = changestate
triggerall = var(59)
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType != A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000
;BC，近C一段
trigger1 = stateNo = 215 && MoveHit && AnimElemTime(3) > 0 && AnimElemTime(5) < 0
trigger1 = var(50) := 80161
;非BC，近C两段
trigger2 = 1
trigger2 = stateNo = 215 && MoveHit && AnimElemTime(5) > 1
trigger2 = var(50) := 80162
;近D
trigger3 = stateNo = 315 && MoveHit
trigger3 = var(50) := 80163
;蹲C
trigger4 = stateNo = 405 && MoveHit
trigger4 = var(50) := 80164
value = 801
;------------------------------------------------------------------------------------------------
;必杀技连段
;------------------------------------------------------------------------------------------------
[State -3,空中扳机]
type = ChangeState
triggerall = var(59)
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType != A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 || EnemyNear,StateNo = [120,159]
trigger1 = StateNo = 810 && MoveContact
trigger1 = var(50) := 140067
value = 1400

[State -3, 扳机]
type = ChangeState
value = ifelse(random<500,1000,1015)
triggerall = var(59)
triggerall = statetype != A
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType != A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 || ((EnemyNear,Power < 1000 || FrontEdgeBodyDist > 120) && EnemyNear,StateNo = [120,159])
triggerall = MoveContact
trigger1 = StateNo = 305
trigger1 = var(50) := 100063
trigger2 = StateNo = 205
trigger2 = var(50) := 100064
trigger3 = StateNo = 500
trigger3 = var(50) := 100065
trigger4 = StateNo = 400
trigger4 = var(50) := 100066
trigger5 = Life < EnemyNear,Life || Random < 400 || EnemyNear,BackEdgeBodyDist <= 20
trigger5 = (EnemyNear,BackEdgeBodyDist >= 20 && P2BodyDist x - fvar(37)*8 < 79) || (P2BodyDist x < 65)
trigger5 = StateNo = 801
trigger5 = var(50) := 100067
trigger6 = var(51) = 0
trigger6 = (StateNo = 215 || StateNo = 210) && Random < 500
trigger6 = var(50) := 100068

[State -3,瞬刺]
type = ChangeState
value = ifelse(EnemyNear,StateType = C,1300,1305)
triggerall = var(59)
triggerall = statetype != A
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType != A
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 
trigger1 = StateNo = 801
trigger1 = MoveHit
trigger1 = var(50) := 130063

[State -3,1030]
type = ChangeState
value = 1030
TriggerAll = var(59)
TriggerAll = EnemyNear,StateNo != 5040
TriggerAll = StateType != A
triggerall = EnemyNear,MoveType = H
triggerall = !EnemyNear,Ctrl
triggerall = (EnemyNear,Power < 1000 && EnemyNear,StateNo = [120,159])
triggerall = (StateNo = 1000 && Animelem = 8,>0 && Animelem = 8,<=3) || (StateNo = 1015 && Animelem = 8,>0 && Animelem = 8,<=3)
triggerall = EnemyNear,StateNo != 5700 && fvar(10) < 8800
triggerall = Helper(1001),NumTarget(1000) || Helper(1016),NumTarget(1015) 
trigger1 = P2BodyDist X < 50
trigger1 = random < 300
trigger1 = var(50) := 103061

[State -3,第二型]
type = ChangeState
value = 1010
TriggerAll = var(59)
TriggerAll = EnemyNear,StateNo != 5040
TriggerAll = StateType != A
triggerall = EnemyNear,MoveType = H
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 || (EnemyNear,Power < 1000 && EnemyNear,StateNo = [120,159])
triggerall = (StateNo = 1000 && Animelem = 8,>0 && Animelem = 8,<=3) || (StateNo = 1015 && Animelem = 8,>0 && Animelem = 8,<=3)
triggerall = Helper(1001),NumTarget(1000) || Helper(1016),NumTarget(1015) || EnemyNear,StateNo = 5700 || fvar(10) >= 8900
trigger1 = P2BodyDist X < 74
trigger1 = var(50) := 101061
trigger2 = P2BodyDist X < 80 && EnemyNear,BackEdgeBodyDist < 20
trigger2 = var(50) := 101062


;------------------------------------------------------------------------------------------------
;浮空追击连段
;------------------------------------------------------------------------------------------------
[State -3,MAX链动版中追击]
type = ChangeState
triggerall = var(59)
TriggerAll = (var(51) > 0 && Power >= 1000) || Power >= 3000
TriggerAll = var(11) = 1
TriggerAll = StateType != A
triggerall = EnemyNear,MoveType = H
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 && EnemyNear,StateType = A
triggerall = Life < 250 || EnemyNear,Life = [100,220]
trigger1 = EnemyNear,BackEdgeBodyDist > 32
trigger1 = NumTarget(1010)
trigger1 = fvar(11) = [14,17]
trigger1 = var(50) := 311061
value = 3110

[State -3,扳机挥空，为第二弹追击第二型做准备]
type = ChangeState
TriggerAll = var(59)
triggerall = var(47) = 0
TriggerAll = var(11) = 1
Triggerall=  var(51) = 0
TriggerAll = StateType != A
triggerall = EnemyNear,MoveType = H
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 && EnemyNear,StateType = A
trigger1 = FrontEdgeBodyDist > 50
trigger1 = NumTarget(1010)
trigger1 = (EnemyNear,Facing != Facing && EnemyNear,BackEdgeBodyDist <= 32) || (EnemyNear,Facing = Facing && EnemyNear,FrontEdgeBodyDist <= 32)
trigger1 = var(50) := 101561
value = 1015

[State -3,热动追击第二型]
type = ChangeState
TriggerAll = var(59)
TriggerAll = var(11) = 1
TriggerAll = StateType != A
triggerall = EnemyNear,MoveType = H
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 && EnemyNear,StateType = A
triggerall = !(Power >= 3000 && EnemyNear,Life = [100,220])
triggerall = Power >= 1000 || var(51) > 0
trigger1 = (EnemyNear,Facing != Facing && EnemyNear,BackEdgeBodyDist >= 32) || (EnemyNear,Facing = Facing && EnemyNear,FrontEdgeBodyDist >= 32)
trigger1 = NumTarget(1010) || NumTarget(981)
trigger1 = var(50) := 300061
value = 3000

[State -3,热动追击]
type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
triggerall = EnemyNear,MoveType = H
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 && EnemyNear,StateType = A
trigger1 = StateNo = 3001
trigger1 = fvar(11) = [((P2BodyDist x - 16)/10.0)+2,((P2BodyDist x - 16)/10.0)+5]
trigger1 = var(50) := 300261
value = 3002

[State -3]
type = ChangeState
TriggerAll = var(59)
Triggerall = var(11) = 1
TriggerAll = StateType != A
triggerall = EnemyNear,MoveType = H
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 && EnemyNear,StateType = A
triggerall = !(Power >= 3000 && EnemyNear,Life = [100,220])
trigger1 = Life - EnemyNear,Life <= 200 || P2BodyDist x > 120 || FrontEdgeBodyDist >= 70 || (EnemyNear,Life <= 200 && P2BodyDist x <= 30)
trigger1 = EnemyNear,HitFall
trigger1 = EnemyNear,StateNo != 5040
trigger1 = NumTarget(1010) || NumTarget(981)
trigger1 = EnemyNear,Pos Y + EnemyNear,Vel Y * 16 + fvar(38) * 16 * (16 + 1) / 2 = [-65, -25]
trigger1 = var(51) = 0
trigger1 = var(50) := 130566
value = 1305

[State -3]
type = ChangeState
TriggerAll = var(59)
Triggerall = var(11) = 1
triggerall = var(47) = 0
TriggerAll = StateType != A
triggerall = EnemyNear,MoveType = H
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 && EnemyNear,StateType = A
trigger1 = EnemyNear,HitFall
trigger1 = EnemyNear,StateNo != 5040
trigger1 = EnemyNear,BackEdgeBodyDist < 10 || (EnemyNear,Facing = Facing && FrontEdgeBodyDist < 60)
trigger1 = NumTarget(1305) || NumTarget(1310) || NumTarget(1010)
trigger1 = EnemyNear,Pos Y + EnemyNear,Vel Y * 8 + fvar(38) * 8 * (8 + 1) / 2 = [-40, -20]
trigger1 = P2BodyDist x < 50
trigger1 = var(50) := 120565
value = 1205

[State -3]
type = ChangeState
TriggerAll = var(59)
triggerall = var(47) = 0
Triggerall = var(11) = 1
TriggerAll = StateType != A
triggerall = EnemyNear,MoveType = H
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 && EnemyNear,StateType = A
trigger1 = EnemyNear,HitFall
trigger1 = EnemyNear,StateNo != 5040
trigger1 = NumTarget(1305) || NumTarget(1310) || NumTarget(1010)
trigger1 = EnemyNear,BackEdgeBodyDist < 10 || (EnemyNear,Facing = Facing && FrontEdgeBodyDist < 60)
trigger1 = EnemyNear,Pos Y + EnemyNear,Vel Y * 3 + fvar(38) * 3 * (3 + 1) / 2 = [-40, -20]
trigger1 = P2BodyDist x < 40
trigger1 = var(50) := 120065
value = 1200

[State -3,CD追击]
type = ChangeState
TriggerAll = var(59)
Triggerall = var(11) = 1
TriggerAll = StateType != A
triggerall = EnemyNear,MoveType = H
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 && EnemyNear,StateType = A
trigger1 = Power < 1000 || EnemyNear,Life < 100 ;给个丢眼镜的机会
trigger1 = EnemyNear,HitFall
trigger1 = EnemyNear,StateNo != 5040
trigger1 = P2BodyDist x < 52
trigger1 = enemynear,BackEdgeBodyDist < 20
trigger1 = EnemyNear,Pos Y + EnemyNear,Vel Y * 11 + fvar(38) * 11 * (11 + 1) / 2 = [-70, -25]
trigger1 = var(51) = 0
trigger1 = var(50) := 98061
value = 980

[State -3,第二弹]
type = ChangeState
TriggerAll = var(59)
TriggerAll = (StateNo = 1015 && Animelem = 8,>0 && Animelem = 8,<=3)
TriggerAll = StateType != A
triggerall = EnemyNear,MoveType = H
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 && EnemyNear,StateType = A
trigger1 = NumTarget(1010) || Helper(33000),var(14) = 1000 || Helper(33000),var(14) = 1010
trigger1 = var(50) := 100561
value = ifelse(p2bodydist x < 50,1005, 1030)

[State -3,深红追击第二弹]
type = ChangeState
triggerall = var(59)
triggerall = Life < LifeMax*0.3
triggerall = EnemyNear,Life < 250
TriggerAll = Power >= 3000 || (var(51) && power >= 1000)
TriggerAll = var(11) = 1
TriggerAll = StateType != A
triggerall = EnemyNear,MoveType = H
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 && EnemyNear,StateType = A

trigger1 = NumTarget(1005) || Helper(33000),var(14) = 1005
trigger1 = (fvar(11) - 5) * 5.0 > p2bodydist x
trigger1 = var(50) := 320066

trigger2 = (fvar(11) - 5) * 5.0 > p2bodydist x
trigger2 = (var(51) && power >= 1000)
trigger2 = NumTarget(1010)
trigger2 = var(50) := 320067
value = 3200


[State -3,链动追击]
type = ChangeState
;triggerall = var(59)
TriggerAll = Power >= 1000 || var(51)
TriggerAll = var(11) = 1
TriggerAll = StateType != A
triggerall = EnemyNear,MoveType = H
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 && EnemyNear,StateType = A
trigger1 = NumTarget(1005) || Helper(33000),var(14) = 1005 || NumTarget(1030) || Helper(33000),var(14) = 1030
trigger1 = EnemyNear,BackEdgeBodyDist < 32
trigger1 = p2bodydist x < 120
trigger1 = EnemyNear,Pos Y < -30
;trigger1 = EnemyNear,Pos Y + EnemyNear,Vel Y * 17 + fvar(38) * 17 * (17 + 1) / 2 = [-60, -25]
trigger1 = var(50) := 310061
value = 3100

[State -3,JCD]
type = ChangeState
TriggerAll = var(59)
TriggerAll = var(11) = 1
TriggerAll = StateType != A
triggerall = EnemyNear,MoveType = H
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000 && EnemyNear,StateType = A
;追击第二型
trigger1 = var(51) = 0
triggerall = !(Power >= 3000 && EnemyNear,Life = [100,220])
trigger1 = EnemyNear,Life < Life - 200 || EnemyNear,Life < 50
trigger1 = NumTarget(1010)
trigger1 = P2BodyDist x > 30
trigger1 = EnemyNear,Vel Y >= 0
trigger1 = EnemyNear,BackEdgeBodyDist >= 32
trigger1 = var(4) := 4
trigger1 = var(50) := 3961
;追击JCD打康
trigger2 = NumTarget(991)
trigger2 = var(4) := 2
trigger2 = var(50) := 3962
value = 39



[State -3,第二击（瞬刺）]
type = ChangeState
TriggerAll = var(59)
TriggerAll = EnemyNear,StateNo != 5040
TriggerAll = StateType != A
triggerall = EnemyNear,MoveType = H
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,StateNo >= 5000
triggerall = (StateNo = 1000 && Animelem = 8,>0 && Animelem = 8,<=3) || (StateNo = 1015 && Animelem = 8,>0 && Animelem = 8,<=3)
triggerall = Helper(1001),NumTarget(1000) || Helper(1016),NumTarget(1015)
triggerall = FrontEdgeBodyDist >= 80
trigger1 = EnemyNear,StateType = A
trigger1 = var(54) := 1045
trigger1 = var(50) := 103561
trigger2 = EnemyNear,StateType = S
trigger2 = var(54) := 1040
trigger2 = var(50) := 104062
trigger3 = EnemyNear,StateType = C
trigger3 = var(54) := 1035
value = var(54)


;------------------------------------------------------------------------------------------------
;MoveContact中
;有限C
;------------------------------------------------------------------------------------------------
[State -3]
type = ChangeState
TriggerAll = var(59)
TriggerAll = var(11) = 1
TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = EnemyNear,StateType != L
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000 || EnemyNear,StateNo = [120,159]
;优先近C，尤其是可以带入BC
Trigger1 = EnemyNear,StateType = S
Trigger1 = Power >= 2000 || (Random < 300 && var(46) = 0) || var(51) > 0 || fvar(10) >= 9800
Trigger1 = EnemyNear,StateNo >= 5000
Trigger1 = P2BodyDist x < 18
Trigger1 = EnemyNear,GetHitVar(HitTime) >= 6
Trigger1 = P2BodyDist x < 5 || EnemyNear,GetHitVar(HitTime) = [6,9]
Trigger1 = var(54) := 215
Trigger1 = var(50) := 21561
;再次近D，尤其是可以带入BC
Trigger2 = Power >= 2000 || (Random < 600 && var(46) = 0) || var(51) > 0 || fvar(10) >= 9800
Trigger2 = EnemyNear,StateNo >= 5000
Trigger2 = P2BodyDist x < 18
Trigger2 = EnemyNear,GetHitVar(HitTime) >= 8
Trigger2 = P2BodyDist x < 10 || EnemyNear,GetHitVar(HitTime) = [8,10]
Trigger2 = var(54) := 315
Trigger2 = var(50) := 31561
;近B
Trigger3 = Random < 200 || EnemyNear,StateType = S
Trigger3 = EnemyNear,GetHitVar(HitTime)>= 5
Trigger3 = P2BodyDist x - fvar(37) * 6 < 19
Trigger3 = (EnemyNear,StateNo = [150,159]) || EnemyNear,GetHitVar(HitTime) = [5,7]
Trigger3 = var(54) := 305
Trigger3 = var(50) := 30561
;近A,某些人会自动切到蹲，
Trigger4 = 0
Trigger4 = Random < 400
Trigger4 = EnemyNear,GetHitVar(HitTime)>= 4
Trigger4 = EnemyNear,StateType = S
Trigger4 = P2BodyDist x - fvar(37) * 4 < 27
Trigger4 = (EnemyNear,StateNo = [150,159]) || EnemyNear,GetHitVar(HitTime) = [4, 6]
Trigger4 = var(54) := 205
Trigger4 = var(50) := 20561
;蹲B
Trigger5 = EnemyNear,GetHitVar(HitTime)>= 4
Trigger5 = P2BodyDist x - ifelse(EnemyNear,BackEdgeBodyDist >= 20, fvar(37), 0)*4 < ifelse(EnemyNear,BackEdgeBodyDist >= 20, 51, 35)
Trigger5 = (EnemyNear,StateNo = [150,159]) || EnemyNear,GetHitVar(HitTime) =  [4, 6]
Trigger5 = var(54) := 500
Trigger5 = var(50) := 50061
;蹲B
Trigger6 = EnemyNear,GetHitVar(HitTime)>= 4
Trigger6 = P2BodyDist x < 50 && EnemyNear,Facing = Facing
Trigger6 = (EnemyNear,StateNo = [150,159]) || EnemyNear,GetHitVar(HitTime) =  [4, 6]
Trigger6 = var(54) := 500
Trigger6 = var(50) := 50062
value = var(54) 

;------------------------------------------------------------------------------------------------
;向前步行追击
;------------------------------------------------------------------------------------------------
[State -3]
type = ChangeState
triggerall = var(59)
triggerall = var(11) = 1
triggerall = (StateNo != [103,105]) && StateNo != 19
triggerall = statetype != A
triggerall = EnemyNear,MoveType = H 
triggerall = !EnemyNear,Ctrl
trigger1 = EnemyNear,StateType != A
trigger1 = EnemyNear,StateNo >= 5000 || EnemyNear,StateNo = [120,159]
trigger1 = EnemyNear,GetHitVar(HitTime) >= 8
trigger1 = P2BodyDist X >= 5
trigger1 = var(50) := 001961

trigger2 = EnemyNear,StateType = A
trigger2 = EnemyNear,HitFall 
trigger2 = EnemyNear,StateNo >= 5000 
trigger2 = fvar(11) > 15
trigger2 = P2BodyDist X >= 10
trigger2 = var(50) := 001962

trigger3 = EnemyNear,StateType = A
trigger3 = EnemyNear,HitFall 
trigger3 = EnemyNear,StateNo >= 5000 
trigger3 = NumTarget(1010)
trigger3 = P2BodyDist X >= 10
trigger3 = var(50) := 001963

value = 19

;=================================================================================
;移动5
;=================================================================================
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
Trigger1 = var(50) := 1050501
IgnoreHitPause = 1

[State -3, 前跑]
type = ChangeState
value = 103
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
Trigger4 = EnemyNear,StateType = L || EnemyNear,StateNo = 5120
Trigger4 = var(50) := 180504


IgnoreHitPause = 1

[State -3,跳跃]
type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = var(11) = 1
TriggerAll = Life >= 100
;前小跳躲投技
Trigger1 = P2BodyDist x < 90
Trigger1 = helper(33000),var(14) = 3
Trigger1 = var(4) := 1
Trigger1 = var(50) := 390501
;大跳起攻
Trigger2 = var(45) <= 0
Trigger2 = Time % 3 = 0 && EnemyNear,Vel X = 0
Trigger2 = EnemyNear,Ctrl
Trigger2 = !inguarddist
Trigger2 = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != A
Trigger2 = P2BodyDist x = [100, 110]
Trigger2 = var(45) := 200
Trigger2 = var(4) := 4
Trigger2 = var(50) := 390502
;1倍X速度大跳起攻
Trigger3 = 0
Trigger3 = EnemyNear,Ctrl
Trigger3 = !inguarddist
Trigger3 = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != A
Trigger3 = P2BodyDist x < 70 && EnemyNear,BackEdgeBodyDist < 30
Trigger3 = var(4) := 3
Trigger3 = var(50) := 390503
;起攻打可能有的飞行道具
Trigger4 = var(45) <= 0
Trigger4 = !EnemyNear,Ctrl 
Trigger4 = EnemyNear,MoveType = A && EnemyNear,AnimTime <= -27
Trigger4 = P2BodyDist X = [135,180]
Trigger4 = var(4) := ifelse(P2BodyDist X < 150, 3, 4)
Trigger4 = var(50) := 390504
;打版边
Trigger5 = !EnemyNear,Ctrl  && EnemyNear,StateNo = 5040
Trigger5 = Fvar(11) > 9
Trigger5 = P2BodyDist X < 60
Trigger5 = EnemyNear,BackEdgeBodyDist < 10
Trigger5 = var(4) := ifelse(P2BodyDist X < 80, 3, 4)
Trigger5 = var(50) := 390505
;起攻，可以用空中扳机骗对方升龙
Trigger6 = !inguarddist
Trigger6 = var(45) <= 0
Trigger6 = EnemyNear,MoveType != H && EnemyNear,StateType != A
Trigger6 = EnemyNear,Ctrl || EnemyNear,StateNo < 200
Trigger6 = P2BodyDist x = [90, 160]
Trigger6 = var(4) := ifelse(P2BodyDist x < 125, 3, 4)
Trigger6 = var(45) := 200
Trigger6 = var(50) := 390506

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
TriggerAll = var(11) = 1
;打起身
Trigger1 = P2BodyDist x = [55, 70]
Trigger1 = EnemyNear,StateNo = 5120 && EnemyNear,animtime = [-18, -12]
Trigger1 = var(4) := 3
Trigger1 = var(50) := 390701
;打起身对手版边
Trigger2 = EnemyNear,BackEdgeBodyDist < 10 || FrontEdgeBodyDist < 80
Trigger2 = P2BodyDist x < 90
Trigger2 = EnemyNear,StateNo = 5120 && EnemyNear,animtime = [-18, -9]
Trigger2 = var(4) := 3
Trigger2 = var(50) := 390702
;打落地受身
Trigger3 = EnemyNear,StateNo = 5050
Trigger3 = !EnemyNear,Ctrl && EnemyNear,MoveType = H
Trigger3 = EnemyNear,BackEdgeBodyDist < 20
Trigger3 = P2BodyDist X < 90
Trigger3 = EnemyNear,Pos Y > -20
Trigger3 = var(4) := 4
Trigger3 = var(50) := 390703

;打起身对手版边
Trigger4 = EnemyNear,BackEdgeBodyDist < 10 || FrontEdgeBodyDist < 80
Trigger4 = P2BodyDist x < 90
Trigger4 = EnemyNear,StateNo = 5120 && EnemyNear,animtime = [-3, -6]
Trigger4 = var(4) := 2
Trigger4 = var(50) := 390704

;打版中
Trigger5 = BackEdgeBodyDist >= 80
Trigger5 = P2BodyDist x < 15
Trigger5 = EnemyNear,StateNo = 5120 && EnemyNear,animtime = [-3, 0]
Trigger5 = var(4) := 6
Trigger5 = var(50) := 390705
value = 39
IgnoreHitPause = 1

;=================================================================================
;立回3
;增加扳机
;增加扳机派生第二弹
;增加滑步
;=================================================================================
[State -3,投技最速抓人]
type = ChangeState
value = ifelse(BackEdgeBodyDist < 60, 950, 956)
TriggerAll = var(59)
triggerall = var(11) = 1 || (StateNo = 19 && AnimTime = 0)
TriggerAll = StateType != A
triggerall = EnemyNear,MoveType != H && !EnemyNear,StateType = A
TriggerAll = EnemyNear,Vel Y = 0
Trigger1 = P2BodyDist X = [0,8] 
Trigger1 = EnemyNear,AnimTime = [-3,0]

;---------------------------------------------------------------------------------------
;距离275开始滑动
;225开始无敌
;135结束无敌
;无敌距离为50 - 140
;---------------------------------------------------------------------------------------
[State -3,滑步戏耍敌人]
type = ChangeState
value = 1105
triggerall = var(59)
triggerall = var(11) = [1, 3]
triggerall = statetype != A
triggerall = !inguarddist
Triggerall = Life > EnemyNear,Life
TriggerAll = Life > 500 || Life - EnemyNear,Life > 500
triggerall = !EnemyNear,NumProj && !PlayerIdExist(helper(33333333),var(3)) 
triggerall = EnemyNear,MoveType != H && EnemyNear,StateType != A
triggerall = EnemyNear,Ctrl && EnemyNear,StateNo <= 199
triggerall = EnemyNear,Vel x >= 0
triggerall = EnemyNear,Time > 1
trigger1 = P2BodyDist x = [100, 120]
trigger1 = EnemyNear,BackEdgeBodyDist >= 85
trigger1 = var(50) := 110531
ignorehitpause = 1

[State -3]
type = ChangeState
triggerall = var(59)
triggerall = var(11) = [1, 3]
triggerall = statetype != A
triggerall = FrontEdgeBodyDist > 90 || EnemyNear,BackEdgeBodyDist <= 5
triggerall = Life > EnemyNear,Life + 500 && Life > 250
;贴近用
trigger1 = P2BodyDist x < 10
trigger1 = FrontEdgeBodyDist > 100
trigger1 = EnemyNear,StateNo != 5120
trigger1 = !EnemyNear,Ctrl 
trigger1 = EnemyNear,MoveType = H
trigger1 = EnemyNear,StateType = L && EnemyNear,Time < 3
trigger1 = var(50) := 110031
trigger1 = var(54) := 1100
;贴近用
trigger2 = EnemyNear,StateNo != 5120
trigger2 = !EnemyNear,Ctrl 
trigger2 = EnemyNear,MoveType = H
trigger2 = EnemyNear,StateType = A && EnemyNear,StateNo = 5050
trigger2 = EnemyNear,HitFall
trigger2 = EnemyNear,Vel Y <= 0
trigger2 = P2BodyDist x > 120
trigger2 = var(50) := 110032
trigger2 = var(54) := 1100
;拉开距离用
trigger3 = P2BodyDist x < 20
trigger3 = FrontEdgeBodyDist > 150
trigger3 = EnemyNear,MoveType = H && EnemyNear,StateType = L
trigger3 = !EnemyNear,Ctrl
trigger3 = var(50) := 110033
trigger3 = var(54) := 1100
;
trigger4 = P2BodyDist x > 150
trigger4 = EnemyNear,Facing = Facing
trigger4 = EnemyNear,AnimTime < -28 || (EnemyNear,StateType = A && !EnemyNear,Ctrl && EnemyNear,Pos Y < -90)
trigger4 = var(50) := 110034
trigger4 = var(54) := 1100
value = var(54)


[State -3, 铲地派生]
type = ChangeState
value = 1310
triggerall = var(59)
triggerall = var(51) = 0
triggerall = statetype = A
trigger1 = EnemyNear,MoveType = H && EnemyNear,StateType = A
trigger1 = !EnemyNear,Ctrl
trigger1 = EnemyNear,StateNo >= 5000
trigger1 = NumTarget(1305)
trigger1 = stateno = 1305 && time > 4
trigger1 = var(50) := 131031
trigger2 = stateno = 1305 && AnimElemTime(9) > 0
trigger2 = var(50) := 131032
ignorehitpause = 1


[State -3,]
type = ChangeState
triggerall = var(59)
triggerall = StateType != A
triggerall = !EnemyNear,Ctrl && EnemyNear,StateNo >= 5000
triggerall = EnemyNear,MoveType = H && EnemyNear,StateType = A
trigger1 = stateno = 405 && MoveHit
trigger1 = var(54) := 1000
trigger1 = var(50) := 100031
trigger2 = stateno = 200 && MoveHit
trigger2 = var(54) := 1015
trigger2 = var(50) := 101532
trigger3 = stateno = 205 && MoveHit
trigger3 = var(54) := 1015
trigger3 = var(50) := 101533
value = var(54)

[State -3,第二弹]
type = ChangeState
TriggerAll = var(59)
TriggerAll = (StateNo = 1015 && Animelem = 8,>0 && Animelem = 8,<=3) || (StateNo = 1000 && Animelem = 8,>0 && Animelem = 8,<=3)
TriggerAll = StateType != A
triggerall = !(EnemyNear,StateNo = [30,40])
TriggerAll = EnemyNear,StateNo != 5700

trigger1 = EnemyNear,StateType = A
trigger1 = var(50) = 100061
trigger1 = fvar(37) < 0
trigger1 = EnemyNear,Vel y < 0
trigger1 = EnemyNear,Pos Y < -60
trigger1 = P2BodyDist X > 70
trigger1 = var(50) := 100531

trigger2 = EnemyNear,Power < 1000 || P2BodyDist x > 200 
trigger2 = EnemyNear,StateType != A
trigger2 = P2BodyDist X > 80
trigger2 = EnemyNear,StateNo = [150,159]
trigger2 = EnemyNear,GetHitVar(Hittime) >= 8
trigger2 = var(50) := 100532

trigger3 = !(EnemyNear,StateType = A && EnemyNear,Vel x > 0 && EnemyNear,Ctrl) 
trigger3 = P2BodyDist X > 180 || EnemyNear,NumProj || PlayerIdExist(helper(33333333),var(3)) 
trigger3 = EnemyNear,AnimTime < -12 || p2bodydist X > 180
trigger3 = var(50) := 100533
value = 1005

;------------------------------------------------------------------------------------------------
;空中扳机
;------------------------------------------------------------------------------------------------
[State -1, EX Air Trigger]
type = ChangeState
value = 1450
triggerall = var(59)
triggerall = StateType = A
triggerall = !MoveContact
triggerall = P2BodyDist Y > 65
triggerall = P2BodyDist X > 55
triggerall = EnemyNear,MoveType = A && EnemyNear,StateType != A
triggerall = EnemyNear,AnimTime < -(P2BodyDist x / 4)
triggerall = EnemyNear,AnimTime > -18
trigger1 = stateno = 610 && animelemtime(3) > 0 && animelemtime(4) < 0 
trigger1 = var(50) := 145036
trigger2 = stateno = 710 && animelemtime(4) > 0 && animelemtime(6) < 0
trigger2 = var(50) := 145037
trigger3 = Ctrl || StateNo = [120,149]
trigger3 = var(50) := 145038

;------------------------------------------------------------------------------------------------
;空中扳机
;------------------------------------------------------------------------------------------------
[State -1, EX Air Trigger]
type = ChangeState
value = 1400
triggerall = var(59)
triggerall = !inguarddist
triggerall = StateType = A
triggerall = !MoveContact
triggerall = EnemyNear,MoveType = I && EnemyNear,Vel x < 0
triggerall = EnemyNear,AnimTime < -22
trigger1 = stateno = 610 && animelemtime(3) > 0 && animelemtime(4) < 0 
trigger2 = stateno = 710 && animelemtime(4) > 0 && animelemtime(6) < 0

;------------------------------------------------------------------------------------------------
;滑步出墙角
;------------------------------------------------------------------------------------------------
[State -3]
type = ChangeState
value = 1105
TriggerAll = var(59)
TriggerAll = var(11) = 1
TriggerAll = !inguarddist
TriggerAll = EnemyNear,StateType = L
TriggerAll = StateType != A
Trigger1 = P2BodyDist x < 80
Trigger1 = BackEdgeBodyDist < 20
Trigger1 = EnemyNear,NumProj = 0 && !PlayerIdExist(helper(33333333),var(3)) 
Trigger1 = var(50) := 110533

;------------------------------------------------------------------------------------------------
;第二型对空
;------------------------------------------------------------------------------------------------
[State -3]
type = ChangeState
value = 1010
TriggerAll = var(59)
TriggerAll = EnemyNear,StateNo != 5040
TriggerAll = StateType != A
triggerall = P2StateType = A

TriggerAll = P2BodyDist X >= 60
Triggerall = EnemyNear,MoveType != H
triggerall = (StateNo = 1000 && Animelem = 8,>0 && Animelem = 8,<=3) || (StateNo = 1015 && Animelem = 8,>0 && Animelem = 8,<=3)
Trigger1 = P2BodyDist x - fvar(37) * 5 = [10, 79]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 5 + fvar(38) * 5 * (5 + 1) / 2 = [-85,-30]
Trigger1 = var(50) := 101031

Trigger2 = P2BodyDist x - fvar(37) * 11 = [35, 99]
Trigger2 = EnemyNear,pos y + EnemyNear,Vel Y * 11 + fvar(38) * 11 * (11 + 1) / 2 = [-100,-50]
Trigger2 = var(50) := 101031

;------------------------------------------------------------------------------------------------
;空中瞬刺弱对空
;------------------------------------------------------------------------------------------------
[State -3]
type = ChangeState
value = 1320
TriggerAll = var(59)
triggerall = Ctrl || StateNo = [120,149]
TriggerAll = EnemyNear,StateNo != 5040
TriggerAll = StateType = A
triggerall = P2StateType = A

Triggerall = EnemyNear,MoveType != H
Trigger1 = P2BodyDist x - fvar(37) * 15 = [77, 120]
Trigger1 = p2bodydist y + EnemyNear,Vel Y * 15 + fvar(38) * 15 * (15 + 1) / 2 = [-25,40]
Trigger1 = var(50) := 132031
;------------------------------------------------------------------------------------------------
;空中瞬刺强对空
;------------------------------------------------------------------------------------------------
[State -3]
type = ChangeState
value = 1325
TriggerAll = var(59)
triggerall = Ctrl || StateNo = [120,149]
TriggerAll = EnemyNear,StateNo != 5040
TriggerAll = StateType = A
triggerall = P2StateType = A
Triggerall = EnemyNear,MoveType != H
Trigger1 = P2BodyDist x - fvar(37) * 15 = [100, 150]
Trigger1 = p2bodydist y  + EnemyNear,Vel Y * 15 + fvar(38) * 15 * (15 + 1) / 2 = [-50,20]
Trigger1 = var(50) := 132531

;------------------------------------------------------------------------------------------------
;地面瞬刺弱对空
;------------------------------------------------------------------------------------------------
[State -3]
type = ChangeState
value = 1300
TriggerAll = var(59)
triggerall = var(11) = 1
triggerall = !inguarddist
TriggerAll = EnemyNear,StateNo != 5040
Triggerall = EnemyNear,MoveType != H
TriggerAll = StateType != A
triggerall = P2StateType = A
Trigger1 = P2BodyDist x - fvar(37) * 15 = [95, 148]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 15 + fvar(38) * 15 * (15 + 1) / 2 = [-45,-20]
Trigger1 = var(50) := 130031

;------------------------------------------------------------------------------------------------
;地面瞬刺强对空
;------------------------------------------------------------------------------------------------
[State -3]
type = ChangeState
value = 1305
TriggerAll = var(59)
triggerall = var(11) = 1
TriggerAll = EnemyNear,StateNo != 5040
TriggerAll = StateType != A
triggerall = P2StateType = A
Triggerall = !inguarddist
Triggerall = EnemyNear,MoveType != H

Trigger1 = P2BodyDist x - fvar(37) * 15 = [110, 160]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 15 + fvar(38) * 15 * (15 + 1) / 2 = [-40,-20]
Trigger1 = var(50) := 130531

;------------------------------------------------------------------------------------------------
;以下是投技，注意优先级不要比抓硬直高
;------------------------------------------------------------------------------------------------
[State -3,D投]
type = ChangeState
value = 956
TriggerAll = var(59)
triggerall = var(11) = 1
TriggerAll = StateType != A
TriggerAll = EnemyNear,Ctrl
triggerall = P2MoveType != H && !P2StateType = A
TriggerAll = P2BodyDist X = [-8,8]
TriggerAll = !(EnemyNear,StateNo >= 5000 && EnemyNear,MoveType = I)
Trigger1 = EnemyNear,Vel Y = 0
Trigger1 = BackEdgeBodyDist < 80
Trigger1 = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
Trigger1 = var(50) := 95631
Trigger2 = EnemyNear,StateNo = 52
Trigger2 = var(50) := 95632
IgnoreHitPause = 1

[State -3,C投]
type = ChangeState
value = 900
TriggerAll = var(59)
triggerall = var(11) = 1
TriggerAll = StateType != A
TriggerAll = EnemyNear,Ctrl
triggerall = P2MoveType != H && !P2StateType = A
TriggerAll = !(EnemyNear,StateNo >= 5000 && EnemyNear,MoveType = I)
TriggerAll = P2BodyDist X = [-8,8] 
Trigger1 = EnemyNear,Vel Y = 0
Trigger1 = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
Trigger1 = var(50) := 90031
Trigger2 = EnemyNear,StateNo = 52
Trigger2 = var(50) := 90032
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;空中
;下落时间N，需要硬直时间5，动作需要12触发，击中硬直13
;则 极限为 12 + 13 = N + 5 
;---------------------------------------------------------------------------------
[State -3, JCD]
type = ChangeState
value = 990
TriggerAll = var(59)
TriggerAll = Ctrl || StateNo = [120,149]
TriggerAll = StateType = A
TriggerAll = EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = fvar(9) >= 16
;对非版边地面
Trigger1 = 0
Trigger1 = EnemyNear,BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - Vel X * 15 - fvar(37) * 15 < 60
Trigger1 = P2BodyDist Y - Vel Y * 15 - const(movement.yaccel) * 15 * (15 + 1) / 2 <= ifelse(EnemyNear,StateType = C,50,70)
Trigger1 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 25) || fvar(9) <= 20
Trigger1 = var(50) := 99031
;对版边地面
Trigger2 = 0
Trigger2 = EnemyNear,BackEdgeBodyDist < 10 || EnemyNear,FrontEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x - Vel X * 15 - fvar(37) * 15  < 60
Trigger2 = P2BodyDist Y - Vel Y * 15 - const(movement.yaccel) * 15 * (15 + 1) / 2 <= ifelse(EnemyNear,StateType = C,50,70)
Trigger2 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 25) || fvar(9) <= 20
Trigger2 = var(50) := 99032
;对空
Trigger3 = EnemyNear,StateNo != 5040
Trigger3 = EnemyNear,StateType = A
Trigger3 = P2BodyDist x - Vel x * 14 - ifelse(EnemyNear,Facing != Facing,1,-1)*fvar(37) * 14 = [ifelse(EnemyNear,MoveType=H,-15,40), 65]
Trigger3 = P2BodyDist y - Vel Y * 14 - const(movement.yaccel) * 14 * (14 + 1) / 2 + EnemyNear,Vel Y * 14 + fvar(38) * 14 * (14 + 1) / 2 = [-40,45]
Trigger3 = var(50) := 99033

;对空版边
Trigger4 = EnemyNear,StateNo != 5040
Trigger4 = EnemyNear,StateType = A
Trigger4 = EnemyNear,BackEdgeBodyDist < 10
Trigger4 = P2BodyDist x - Vel x * 14 - ifelse(EnemyNear,Facing != Facing,1,-1)*fvar(37) * 14 < 65
Trigger4 = P2BodyDist y - Vel Y * 14 - const(movement.yaccel) * 14 * (14 + 1) / 2 + EnemyNear,Vel Y * 14 + fvar(38) * 14 * (14 + 1) / 2 = [-40,45]
Trigger4 = var(50) := 99034
IgnoreHitPause = 1

[State -3,空中扳机]
type = ChangeState
value = 1450
TriggerAll = var(59)
triggerall = Ctrl || (StateNo = 610 && animelemtime(3) > 0 && animelemtime(4) < 0) || (StateNo = 710 && animelemtime(4) > 0 && animelemtime(6) < 0) || StateNo = [120,149]
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = P2BodyDist Y > 40
;对地面
Trigger1 = Vel y <= -1
Trigger1 = EnemyNear,StateNo = [200,999]
Trigger1 = EnemyNear,MoveType = A && EnemyNear,Time <= 4
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x > 30
Trigger1 = var(50) := 145031
;跳过了
Trigger2 = Vel y <= 0
Trigger2 = EnemyNear,Vel x <= 5 ;太快了可能是滑步
Trigger2 = EnemyNear,MoveType = I || EnemyNear,Ctrl
Trigger2 = EnemyNear,Vel x > 0 || (EnemyNear,StateType = C && EnemyNear,StateNo = [0,29])
Trigger2 = P2BodyDist x = [0,20]
Trigger2 = P2BodyDist Y >= 77
Trigger2 = var(50) := 145032

[State -3,A HK]
type = ChangeState
value = 1400
TriggerAll = var(59)
triggerall = Ctrl || (StateNo = 610 && animelemtime(3) > 0 && animelemtime(4) < 0) || (StateNo = 710 && animelemtime(4) > 0 && animelemtime(6) < 0) || StateNo = [120,149]
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = P2BodyDist Y > 40
;对地面
Trigger1 = Vel y >= -1
Trigger1 = EnemyNear,StateType != A
Trigger1 = (P2BodyDist Y / 4.0) * 3 = [-25, 30]
Trigger1 = var(50) := 140031
;对地面
Trigger2 = Vel y <= 0
Trigger2 = Vel x < 0
Trigger2 = EnemyNear,StateType != A
Trigger2 = (P2BodyDist Y / 4.0) * 3 = [-25, 60]
Trigger2 = var(50) := 140031


[State -3,A HK]
type = ChangeState
value = 710
TriggerAll = var(59)
TriggerAll = Ctrl || StateNo = [120,149]
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = fvar(9) >= 10
TriggerAll = Vel y >= -1
Triggerall = EnemyNear,BackEdgeBodyDist >= 10
TriggerAll = !(PlayerIdExist(helper(33333333),var(3)) && PlayerID(helper(33333333),var(3)), pos y < -60) || (PlayerIdExist(helper(33333333),var(3)) && PlayerID(helper(33333333),var(3)), pos x * PlayerID(helper(33333333),var(3)),Facing < Pos X * Facing ) 
;2段对非版边地面
Trigger1 = EnemyNear,BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - Vel X * 11 - fvar(37) * 11 = [-5, 53]
Trigger1 = P2BodyDist Y - Vel Y * 11 - const(movement.yaccel) * 11 * (11 + 1) / 2 <= ifelse(EnemyNear,StateType = C,65,90)
Trigger1 = var(50) := 71031
;2段对版边地面
Trigger2 = EnemyNear,BackEdgeBodyDist < 10 || EnemyNear,FrontEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x - Vel X * 11 - fvar(37) * 11  < 53
Trigger2 = P2BodyDist Y - Vel Y * 11 - const(movement.yaccel) * 11 * (11 + 1) / 2 <= ifelse(EnemyNear,StateType = C,65,90)
Trigger2 = var(50) := 71032
;1段对空
Trigger3 = EnemyNear,StateNo != 5040
Trigger3 = EnemyNear,StateType = A
Trigger3 = P2BodyDist x - Vel x * 8 - fvar(37) * 8 < 66
Trigger3 = P2BodyDist y - Vel Y * 8 - const(movement.yaccel) * 8 * (8 + 1) / 2 + EnemyNear,Vel Y * 8 + fvar(38) * 8 * (8 + 1) / 2 = [-45,55]
Trigger3 = var(50) := 71033
IgnoreHitPause = 1

[State -3,A HP]
type = ChangeState
value = 610
TriggerAll = var(59)
TriggerAll = Ctrl || StateNo = [120,149]
TriggerAll = StateType = A
TriggerAll = EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = fvar(9) >= 8
TriggerAll = Vel y >= -1
;对非版边地面
Trigger1 = EnemyNear,BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - Vel X * 6 - fvar(37) * 6 < 21
Trigger1 = P2BodyDist Y - Vel Y * 6 - const(movement.yaccel) * 6 * (6 + 1) / 2 <= ifelse(EnemyNear,StateType = C,65,85)
Trigger1 = var(50) := 61031
;对版边地面
Trigger2 = EnemyNear,BackEdgeBodyDist < 10 || EnemyNear,FrontEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x - Vel X * 6 - fvar(37) * 6  < 21
Trigger2 = P2BodyDist Y - Vel Y * 6 - const(movement.yaccel) * 6 * (6 + 1) / 2 <= ifelse(EnemyNear,StateType = C,65,85)
Trigger2 = var(50) := 61032
;1段对空
Trigger3 = EnemyNear,StateNo != 5040
Trigger3 = EnemyNear,StateType = A
Trigger3 = P2BodyDist x - Vel x * 6 - fvar(37) * 6 < 21
Trigger3 = P2BodyDist y - Vel Y * 6 - const(movement.yaccel) * 6 * (6 + 1) / 2 + EnemyNear,Vel Y * 6 + fvar(38) * 6 * (6 + 1) / 2 = [-10,45]
Trigger3 = var(50) := 61033
IgnoreHitPause = 1

[State -3,A HK]
type = ChangeState
value = 700
TriggerAll = var(59)
TriggerAll = Ctrl || StateNo = [120,149]
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = fvar(9) >= 7
TriggerAll = Random < 300
;对非版边地面
Trigger1 = EnemyNear,BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - Vel X * 5 - fvar(37) * 5 < 53
Trigger1 = P2BodyDist Y - Vel Y * 5 - const(movement.yaccel) * 6 * (6 + 1) / 2 <= ifelse(EnemyNear,StateType = C,50,70)
Trigger1 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 19) || fvar(9) <= 15
Trigger1 = var(50) := 70031
;对版边地面
Trigger2 = EnemyNear,BackEdgeBodyDist < 10 || EnemyNear,FrontEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x - Vel X * 5 - fvar(37) * 5  < 53
Trigger2 = P2BodyDist Y - Vel Y * 5 - const(movement.yaccel) * 5 * (5 + 1) / 2 <= ifelse(EnemyNear,StateType = C,50,70)
Trigger2 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 19) || fvar(9) <= 15
Trigger2 = var(50) := 70032
;1段对空
Trigger3 = EnemyNear,StateNo != 5040
Trigger3 = EnemyNear,StateType = A
Trigger3 = P2BodyDist x - Vel x * 5 - fvar(37) * 5 < 60
Trigger3 = P2BodyDist y - Vel Y * 5 - const(movement.yaccel) * 5 * (5 + 1) / 2 + EnemyNear,Vel Y * 5 + fvar(38) * 5 * (5 + 1) / 2 = [-55,55]
Trigger3 = var(50) := 70033
IgnoreHitPause = 1

[State -3,A HK]
type = ChangeState
value = 600
TriggerAll = var(59)
TriggerAll = Ctrl || StateNo = [120,149]
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = fvar(9) >= 7
;对非版边地面
Trigger1 = EnemyNear,BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - Vel X * 5 - fvar(37) * 5 < 53
Trigger1 = P2BodyDist Y - Vel Y * 5 - const(movement.yaccel) * 6 * (6 + 1) / 2 <= ifelse(EnemyNear,StateType = C,50,70)
Trigger1 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 19) || fvar(9) <= 15
Trigger1 = var(50) := 60031
;对版边地面
Trigger2 = EnemyNear,BackEdgeBodyDist < 10 || EnemyNear,FrontEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x - Vel X * 5 - fvar(37) * 5  < 53
Trigger2 = P2BodyDist Y - Vel Y * 5 - const(movement.yaccel) * 5 * (5 + 1) / 2 <= ifelse(EnemyNear,StateType = C,50,70)
Trigger2 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 19) || fvar(9) <= 15
Trigger2 = var(50) := 60032
;1段对空
Trigger3 = EnemyNear,StateNo != 5040
Trigger3 = EnemyNear,StateType = A
Trigger3 = P2BodyDist x - Vel x * 5 - fvar(37) * 5 < 60
Trigger3 = P2BodyDist y - Vel Y * 5 - const(movement.yaccel) * 5 * (5 + 1) / 2 + EnemyNear,Vel Y * 5 + fvar(38) * 5 * (5 + 1) / 2 = [-55,55]
Trigger3 = var(50) := 60033
IgnoreHitPause = 1



;---------------------------------------------------------------------------------
;蹲

[State -3,CR LP]
type = ChangeState
value = 400
TriggerAll = var(59)
TriggerAll = var(11) = 1
TriggerAll = StateType != A
TriggerAll = (EnemyNear,Ctrl || EnemyNear,StateNo <= 199)
TriggerAll = !InGuardDist
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对地
Trigger1 = var(44)
Trigger1 = (P2BodyDist x >= 0 && EnemyNear,Facing != Facing) || (P2BodyDist x <= 0 && EnemyNear,Facing = Facing)
Trigger1 = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
Trigger1 = EnemyNear,Vel x >= 0
Trigger1 = P2BodyDist x = [-37, 37]
Trigger1 = var(50) := 040031
IgnoreHitPause = 1

[State -3,CR LK]
type = ChangeState
value = 500
TriggerAll = var(59)
TriggerAll = var(11) = 1
TriggerAll = StateType != A
TriggerAll = (EnemyNear,Ctrl || EnemyNear,StateNo <= 199)
TriggerAll = !InGuardDist
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对地
Trigger1 = var(44)
Trigger1 = (P2BodyDist x >= 0 && EnemyNear,Facing != Facing) || (P2BodyDist x <= 0 && EnemyNear,Facing = Facing)
Trigger1 = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
Trigger1 = (P2BodyDist x + ifelse((EnemyNear,StateNo = [18,24]),0,fvar(37))*4 = [-49, -40]) || P2BodyDist x - ifelse((EnemyNear,StateNo = [18,40]),0,fvar(37))*4 < 49
Trigger1 = var(50) := 050031
IgnoreHitPause = 1


[State -3,CR HP]
type = ChangeState
value = 405
TriggerAll = var(59)
TriggerAll = var(11) = 1
TriggerAll = StateType != A
TriggerAll = (EnemyNear,Ctrl || EnemyNear,StateNo <= 199)
TriggerAll = !InGuardDist
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对空
Trigger1 = P2BodyDist x - fvar(37) * 5 = [5, 42]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 5 + fvar(38) * 5 * (5 + 1) / 2 = [-55,-29]
Trigger1 = var(50) := 040531
;对空
Trigger2 = P2BodyDist x - fvar(37) * 11 = [5, 46]
Trigger2 = EnemyNear,pos y + EnemyNear,Vel Y * 11 + fvar(38) * 11 * (11 + 1) / 2 = [-70,-29]
Trigger2 = var(50) := 040532
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;近立


[State -3,CL LP]
type = ChangeState
value = 205
TriggerAll = var(59)
TriggerAll = var(11) = 1

TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
triggerall = p2bodydist x <= 27
TriggerAll = (EnemyNear,Ctrl || EnemyNear,StateNo <= 22)
;对空
Trigger1 = EnemyNear,StateNo != 5040
Trigger1 = BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - fvar(37) * 3 = [-5, 27]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 3 + fvar(38) * 3 * (3 + 1) / 2 = [-60,-37]
Trigger1 = var(50) := 020531
;版边对空
Trigger2 = BackEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType = A
Trigger2 = P2BodyDist x - fvar(37) * 3 < 27
Trigger2 = EnemyNear,pos y + EnemyNear,Vel Y * 3 + fvar(38) * 3 * (3 + 1) / 2 = [-60,-37]
Trigger2 = var(50) := 020532
;对地
Trigger3 = var(44)
Trigger3 = EnemyNear,StateType = S
Trigger3 = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
Trigger3 = var(50) := 020533
IgnoreHitPause = 1

[State -3,CL LK]
type = ChangeState
value = 305
TriggerAll = var(59)
TriggerAll = var(11) = 1

TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
triggerall = (EnemyNear,Facing != Facing && P2BodyDist x >= 0) || (EnemyNear,Facing = Facing && P2BodyDist x <= 0)
triggerall = p2bodydist x - 4 *fvar(37) = (10,25]
TriggerAll = (EnemyNear,Ctrl || EnemyNear,StateNo <= 22)
;对地
Trigger1 = var(44)
Trigger1 = EnemyNear,StateType = S || Random < 500
Trigger1 = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
Trigger1 = var(50) := 030531
IgnoreHitPause = 1


;---------------------------------------------------------------------------------
;远立

[State -3,LP]
type = ChangeState
value = 200
TriggerAll = var(59)
TriggerAll = var(11) = 1

TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
triggerall = p2bodydist x > 27
TriggerAll = (EnemyNear,Ctrl || EnemyNear,StateNo <= 22)
;对空
Trigger1 = EnemyNear,StateNo != 5040
Trigger1 = BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - fvar(37) * 3 = [-5, 54]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 3 + fvar(38) * 3 * (3 + 1) / 2 = [-60,-37]
Trigger1 = var(50) := 020031
;版边对空
Trigger2 = BackEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType = A
Trigger2 = P2BodyDist x - fvar(37) * 3 < 54
Trigger2 = EnemyNear,pos y + EnemyNear,Vel Y * 3 + fvar(38) * 3 * (3 + 1) / 2 = [-60,-37]
Trigger2 = var(50) := 020032
;对地
Trigger3 = var(44)
Trigger3 = P2BodyDist X < 50
Trigger3 = EnemyNear,StateType = S
Trigger3 = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
Trigger3 = var(50) := 020033
IgnoreHitPause = 1

[State -3,LK]
type = Null;ChangeState
value = 300
TriggerAll = var(59)
TriggerAll = var(11) = 1

TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
triggerall = p2bodydist x > 27
TriggerAll = (EnemyNear,Ctrl || EnemyNear,StateNo <= 199)
TriggerAll = Life > 300
;对地
Trigger1 = P2BodyDist X = [70, 74]
Trigger1 = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
Trigger1 = var(50) := 030031
IgnoreHitPause = 1


[State -3,HK]
type = ChangeState
value = 310
TriggerAll = var(59)
TriggerAll = var(11) = 1
TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
triggerall = p2bodydist x > 27
TriggerAll = (EnemyNear,Ctrl || EnemyNear,StateNo <= 199)
TriggerAll = EnemyNear,Power < 1000
TriggerAll = EnemyNear,Pos Y >= -140
;对空
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - fvar(37) * 13 = [45, 90]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 13 + fvar(38) * 13 * (13 + 1) / 2 = [-65,-37]
Trigger1 = var(50) := 031031
IgnoreHitPause = 1


;---------------------------------------------------------------------------------
;升龙对空
[State -3,]
type = ChangeState
value = 1200
TriggerAll = var(59)
TriggerAll = var(11) = [1,3]

TriggerAll = StateType != A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = (EnemyNear,Ctrl || EnemyNear,StateNo <= 22)
;对空
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - fvar(37) * 3 = [-6, 45]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 3 + fvar(38) * 3 * (3 + 1) / 2 = [-50,-5]
Trigger1 = var(50) := 120031

;2段对空
trigger2 = EnemyNear,StateType = A
trigger2 = P2BodyDist x - fvar(37) * 11 = [0, 55]
trigger2 = EnemyNear,Pos Y + EnemyNear,Vel Y * 11 + fvar(38) * 11 * (11 + 1) / 2 = [-65,-15]
trigger2 = var(50) := 120032

;3段对空
trigger3 = EnemyNear,StateType = A
trigger3 = P2BodyDist x - fvar(37) * 14 = [-10, 5]
trigger3 = EnemyNear,Pos Y + EnemyNear,Vel Y * 14 + fvar(38) * 14 * (14 + 1) / 2 = [-92,-15]
trigger3 = var(50) := 120032

IgnoreHitPause = 1

[State -3,]
type = ChangeState
value = 1205
TriggerAll = var(59)
TriggerAll = var(11) = [1,3]
TriggerAll = StateType != A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = (EnemyNear,Ctrl || EnemyNear,StateNo <= 22)
TriggerAll = EnemyNear,pos y + EnemyNear,Vel Y * 7 + fvar(38) * 7 * (7 + 1) / 2 = [-50,-20]
TriggerAll = EnemyNear,StateType = A
;对空
Trigger1 = EnemyNear,Facing != Facing
Trigger1 = P2BodyDist x - fvar(37) * 7 = [-8, 55]
Trigger1 = var(50) := 120531

Trigger2 = EnemyNear,Facing = Facing
Trigger2 = P2BodyDist x + fvar(37) * 7 = [-8, 45]
Trigger2 = var(50) := 120532

;2段对空
trigger3 = EnemyNear,StateType = A
trigger3 = P2BodyDist x - fvar(37) * 17 = [-15, 60]
trigger3 = EnemyNear,Pos Y + EnemyNear,Vel Y * 17 + fvar(38) * 17 * (17 + 1) / 2 = [-82,-10]
trigger3 = var(50) := 120533

IgnoreHitPause = 1


;---------------------------------------------------------------------------------
;扳机派生滑步跑路
[State -3,]
type = ChangeState
value = 1020
TriggerAll = var(59)
Triggerall = StateType != A
triggerall = StateNo = 1000 || StateNo = 1015
triggerall = Animelem = 8,>0 && Animelem = 8,<=3

trigger1 = EnemyNear,Vel x > 0
trigger1 = p2bodydist x < 90 || EnemyNear,Vel x >= 8
trigger1 = var(50) := 102031

trigger2 = P2BodyDist x < 70
trigger2 = EnemyNear,StateType != A
trigger2 = EnemyNear,MoveType = I 
trigger2 = var(50) := 102032

trigger3 = P2BodyDist x < 75
trigger3 = EnemyNear,StateType != A
trigger3 = StateNo >= 1000
trigger3 = EnemyNear,MoveType = A
trigger3 = var(50) := 102033

trigger4 = !EnemyNear,NumProj && !PlayerIdExist(helper(33333333),var(3))
trigger4 = EnemyNear,StateType = A
trigger4 = EnemyNear,Ctrl || EnemyNear,MoveType = A
trigger4 = EnemyNear,Vel Y <= 0
trigger4 = P2BodyDist x < 160 || (fvar(11) - 5)*fvar(37) < 60

trigger5 = EnemyNear,MoveType = A
trigger5 = EnemyNear,StateNo >= 2000

;---------------------------------------------------------------------------------
;扳机立回
[State -3,]
type = ChangeState
TriggerAll = var(59)
TriggerAll = var(11) = 1
TriggerAll = StateType != A
;对地
Trigger1 = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
Trigger1 = (EnemyNear,Ctrl || EnemyNear,StateNo <= 22)
Trigger1 = FrontEdgeBodyDist > 95 && EnemyNear,BackEdgeBodyDist > 90
Trigger1 = EnemyNear,StateType != A && EnemyNear,Vel y = 0
Trigger1 = P2BodyDist x - EnemyNear,Vel x * 6 = [67, 93]
Trigger1 = var(54) := 1015
Trigger1 = var(50) := 101534
; 
Trigger2 = Random < 50 + (LifeMax - Life)/10
Trigger2 = P2BodyDist x > 180
Trigger2 = EnemyNear,StateType != A && EnemyNear,Vel y = 0
Trigger2 = var(54) := ifelse(EnemyNear,StateType = L,1000,1015)
Trigger2 = var(50) := 101532
;对波Proj类型
Trigger3 = EnemyNear,NumProj
Trigger3 = P2BodyDist x > 100
Trigger3 = EnemyNear,AnimTime < -20
Trigger3 = var(54) := 1015
Trigger3 = var(50) := 101533
value = var(54)
IgnoreHitPause = 1

;=================================================================================
;其他2
;=================================================================================
[State -3,前滚]
type = changestate
TriggerAll = var(59)
TriggerAll = var(11) = 1
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
Trigger1 = var(50) := 075021
;闪避空中攻击
Trigger2 = EnemyNear,MoveType = A
Triggea2 = FrontEdgeBodyDist >= 120
Trigger2 = fvar(11) > 17
Trigger2 = P2BodyDist x < 60
Trigger2 = EnemyNear,StateType = A 
Trigger2 = EnemyNear,Facing != Facing
Trigger2 = P2BodyDist x - fvar(37) * 8 < 0
Trigger2 = var(50) := 075022
;闪避飞行道具
Trigger3 = EnemyNear,AnimTime < -15
Trigger3 = EnemyNear,animtime < -33 || P2BodyDist X > 150
Trigger3 = EnemyNear,MoveType = A
Trigger3 = inguarddist
Trigger3 = PlayerIdExist(helper(33333333),var(3)) 
Trigger3 = ifelse(facing = 1, PlayerID(helper(33333333),var(3)), pos x > pos x, PlayerID(helper(33333333),var(3)), pos x < pos x)
Trigger3 = PlayerID(helper(33333333),var(3)), Vel x > 0
;distance / Velocity = time = startup time + active 
Trigger3 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) < 60
Trigger3 = var(50) := 075023
;攻击的前升龙
Trigger4 = inguarddist
Trigger4 = EnemyNear,MoveType = A && !EnemyNear,Ctrl
Trigger4 = helper(33000),var(11) != 3
Trigger4 = EnemyNear,facing != facing
Trigger4 = P2BodyDist x < 60
Trigger4 = EnemyNear,animtime < -15
Trigger4 = EnemyNear,Vel X > 0 && EnemyNear,Vel Y < 0
Trigger4 = EnemyNear,StateNo >= 1000
Trigger4 = var(50) := 075024
value = 750
IgnoreHitPause = 1

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
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x = [53,75]
Trigger1 = EnemyNear,Vel X <= 0
Trigger1 = EnemyNear,animtime = [-25, -10]
Trigger1 = var(50) := 76021

Trigger2 = P2BodyDist x = [45,80]
Trigger2 = EnemyNear,StateType = A
Trigger2 = fvar(37) > 0
Trigger2 = EnemyNear,Vel y < 0
Trigger2 = EnemyNear,pos y <= -60
Trigger2 = var(50) := 76022

;闪避空中打逆向
Trigger3 = EnemyNear,MoveType = A && !EnemyNear,Ctrl
Trigger3 = EnemyNear,facing = facing && P2BodyDist X < 40
Trigger3 = EnemyNear,Vel X > 0 && EnemyNear,Vel Y > 0
Trigger3 = EnemyNear,Pos Y >= -45
Trigger3 = var(50) := 76023

value = 760
IgnoreHitPause = 1

[State -3,刚CD]
type = ChangeState
value = 981
TriggerAll = var(59)
TriggerAll = StateNo = [150,152]
TriggerAll = power >= 3500 || (EnemyNear,life < 50 && Power >= 1000)
TriggerAll = EnemyNear,animtime < -6
TriggerAll = !EnemyNear,Ctrl && EnemyNear,MoveType = A
TriggerAll = EnemyNear,StateNo = [1000,2000)
;对空
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - fvar(37) * 6 = [-4, 50]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 6 + fvar(38) * 6 * (6 + 1) / 2 >= -70
Trigger1 = var(50) := 98101
;对地
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x - fvar(37) * 6 = [-4, 50]
Trigger2 = var(50) := 98102

[State -3, 落地受身]
type = ChangeState
value = 5200
triggerall = var(59) 
triggerall = alive
trigger1 = stateno = 5050
trigger1 = pos y >= -20
trigger1 = vel y > 0

[State -3, 空中受身]
type = ChangeState
value = 5210
triggerall = 0
triggerall = var(59) 
triggerall = alive
triggerall = CanRecover
trigger1 = stateno = 5050
trigger1 = pos y < -20
trigger1 = vel y > -1

;=================================================================================
;防御1
;=================================================================================
[State -1, 防御]
Type = ChangeState
Value = 120
TriggerAll = var(59) 
TriggerAll = RoundState = 2
TriggerAll = EnemyNear, hitdefattr = SCA,AA,AP
TriggerAll = var(11) = 1 

Trigger1 = InGuardDist
Trigger1 = StateType != A || (StateType = A && Helper(33000),var(11) != 4)
Trigger1 = var(50) := 012011

Trigger2 = P2BodyDist X= [-50,50]
Trigger2 = NumHelper(33000)>0
Trigger2 = Helper(33000),InGuardDist
Trigger2 = Facing*EnemyNear,Facing!=-1 || P2Dist X<0
Trigger2 = var(50) := 012012
IgnoreHitPause = 1