;=================================================================================
;State0代替
;=================================================================================
[Statedef 1]
type = S
physics = S
sprpriority = 2
velset = 0,0
ctrl = 0

[State 1]
type = ChangeState
Trigger1 = RoundState != 2
Trigger2 = P2BodyDist x < 0
value = 0
Ctrl = 1
ignorehitpause = 1

[State -2]
type = PosSet
trigger1 = Time = 0
y = 0

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State 0, pause reset(intro)]
type = Pause
trigger1 = Time = 0
trigger1 = PrevStateNo = 191
time = 0

[State -2];対フライング
type = NotHitBy
trigger1 = !var(7)
value = SCA
time = 1

[State 0, 1]
type = ChangeAnim
trigger1 = Anim != (0+(fvar(29)=3||fvar(29)=6)) && Anim != 5
trigger2 = Anim = 5 && AnimTime = 0 ;Turn anim over
value = (0+(fvar(29)=3||fvar(29)=6))

[State 0, 2]
type = VelSet
trigger1 = Time = 0
y = 0

[State 0, 3] ;Stop moving if low velocity or 4 ticks pass
type = VelSet
trigger1 = abs(vel x) < 2
trigger2 = Time = 4
x = 0

[State 0, 4] ;Are you dead?
type = ChangeState
trigger1 = !alive
value = 5050

;=================================================================================
;AI用前行
;=================================================================================
[Statedef 19]
type    = S
physics = S
sprpriority = 2

[State 21, 1]
Type = Turn
trigger1 = EnemyNear,MoveType != H
Trigger1 = P2Dist X < 0

[State 20]
type = VarSet
trigger1 = Time = 0
trigger1 = EnemyNear(var(2)),BackEdgeBodyDist <= 0
trigger1 = EnemyNear(var(2)),StateType != A
trigger1 = PrevStateNo = 52
fvar(1) = Vel X

[State 20]
type = VelAdd
triggerall = fvar(1)
trigger1 = Floor(fvar(1)*0.82**(Time)) < 0
x = Floor(fvar(1)*0.82**(Time))

[State 20, 1]
type = VelSet
trigger1 = 1
x = const(velocity.walk.fwd.x)*(1+(fvar(32)=2||!(fvar(29)=1||fvar(29)=4))*IfElse((fvar(29)=3||fvar(29)=6),0.5,0.3))



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
sprpriority = 2

[State 20]
type = VarSet
trigger1 = Time = 0
trigger1 = EnemyNear(var(2)),BackEdgeBodyDist <= 0
trigger1 = EnemyNear(var(2)),StateType != A
trigger1 = PrevStateNo = 52
fvar(1) = Vel X

[State 20]
type = VelAdd
triggerall = fvar(1)
trigger1 = Floor(fvar(1)*0.82**(Time)) < 0
x = Floor(fvar(1)*0.82**(Time))


[State 20, 1]
type = VelSet
trigger1 = 1
x = const(velocity.walk.back.x)*(1+(fvar(32)=2||!(fvar(29)=1||fvar(29)=4))*IfElse((fvar(29)=3||fvar(29)=6),0.5,0.3))

[State 20, 4]
type = ChangeAnim
triggerall = vel x < 0
trigger1 = Anim != 21 && Anim != 5
trigger2 = Anim = 5 && AnimTime = 0
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
type    = S
physics = S
anim = 40
ctrl = 0
velset = 0,0
sprpriority = 2

[State 40]
type = NotHitBy
trigger1 = 1
value = ,AT
time = 1

[State 40, turn]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = P2Dist X < -20
value = 45


[State 40, 1]
type = VarSet
trigger1 = Time = 0
trigger1 = var(4) = [1,4]
sysvar(1) = 1

[State 40, 3]
type = VarSet
trigger1 = var(59) = 0
trigger1 = var(4) = [5,8]
sysvar(1) = -1

[State 40, 1]
type = VarSet
trigger1 = Time = 0
trigger1 = var(4) = [9,10]
sysvar(1) = 0

[State 40, 前小跳]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = var(4) = 1
x = const(velocity.jump.fwd.x)
y = const(velocity.jump.y) * 0.75

[State 40, 前小影跳]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = var(4) = 2
x = const(velocity.runjump.fwd.x)
y = const(velocity.jump.y) * 0.75

[State 40, 前大跳]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = var(4) = 3
x = const(velocity.jump.fwd.x)
y = const(velocity.jump.y)

[State 40, 前大影跳]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = var(4) = 4
x = const(velocity.runjump.fwd.x)
y = const(velocity.jump.y)


[State 40, 后小跳]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = var(4) = 5
x = const(velocity.jump.back.x)
y = const(velocity.jump.y) * 0.75

[State 40, 后小影跳]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = var(4) = 6
x = const(velocity.runjump.back.x)
y = const(velocity.jump.y) * 0.75

[State 40, 后大跳]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = var(4) = 7
x = const(velocity.jump.back.x)
y = const(velocity.jump.y)

[State 40, 后大影跳]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = var(4) = 8
x = const(velocity.runjump.back.x)
y = const(velocity.jump.y)


[State 40, 垂直小跳]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = var(4) = 9
x = 0
y = const(velocity.jump.y) * 0.75

[State 40, 垂直大跳]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = var(4) = 10
x = 0
y = const(velocity.jump.y) 

[State 40, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 38
ctrl = 1

;=================================================================================
; 空中
;=================================================================================
[Statedef 38]
type    = A
physics = A

[State 50, turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < -20

[State 50, snd]
type = PlaySnd
trigger1 = Time = 0
value = S0,(0+(var(3) > 0))

[State 50, 1]
type = VarSet
trigger1 = Time = 0
sysvar(1) = 0

[State 50, 0]
type = afterimage
triggerall = Time = 0
trigger1 = var(4) = 2
trigger2 = var(4) = 4
trigger3 = var(4) = 6
trigger4 = var(4) = 8
time = 20
length = 8
palinvertall = 0
palcontrast = 256, 256, 256
palbright = 0, 0, 0
palpostbright = -25, 0, 0
paladd = 0, 0, 0
palmul = 1, 1, 1
FrameGap = 3
ignorehitpause = 1

[State 50, 2]
type = ChangeAnim
trigger1 = Time = 0
value = IfElse(var(4)=1||var(4)=2||var(4)=5||var(4)=6||var(9),44,ifelse((vel x)=0, 41, ifelse((vel x)>0, 42, 43)))

[State 50, end]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 52

;=================================================================================
; 前跑
;=================================================================================
[Statedef 99]
type    = S
physics = S
anim = 100
ctrl = 0
velset = 0,0
sprpriority = 2

[State 100, snd];要調整
type = PlaySnd
trigger1 = AnimElem = 2
value = S0,3
loop = 1
channel = 1

[State 100, 1];要調整
type = VelSet
trigger1 = AnimElem = 2, >= 0
x = const(velocity.run.fwd.x)*(1+(fvar(29)=3||fvar(29)=6)*0.5)

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
value = 101












































[Statedef -3]

;---------------------------------------------------------------------------------
;跳跃挤压处理
;拳皇体积框只到胸口位置，这里需要计算下
;---------------------------------------------------------------------------------
[State -3,]
type = PlayerPush
trigger1 = P2BodyDist x > 35
trigger2 = StateType != A
trigger3 = EnemyNear,MoveType = H
trigger4 = MoveType = H
trigger5 = StateType = L
value = 1


[State -3,]
type = PlayerPush
trigger1 = P2BodyDist x < 35
trigger1 = StateType = A
trigger1 = EnemyNear,StateType != A
trigger1 = P2BodyDist Y >= 20
Trigger1 = EnemyNear,MoveType != H
value = 0

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
var(59) = 0
IgnoreHitPause = 1

[State -3]
type = varset
Trigger1 = RoundState != 2 || EnemyNear,life = 0 || !EnemyNear,alive
var(59) = 0
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;攻击修正用
;非爆气状态			1
;原地爆气/BC断连 	0.6
;BC连中				0.4
;---------------------------------------------------------------------------------
[State -3]
type = VarSet
trigger1 = var(52) = 0
fvar(39) = 1 * ifelse(EnemyNear,MoveType = A,1.2,1)
IgnoreHitPause = 1

[State -3]
type = VarSet
triggerAll = var(52) 
trigger1 = EnemyNear,MoveType != H 
trigger2 = EnemyNear,Ctrl 
fvar(39) = 0.6 * ifelse(EnemyNear,MoveType = A,1.2,1)
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;计算敌方X方向速度
;---------------------------------------------------------------------------------
[State -3]
type = varset
Trigger1 = !MoveContact
Trigger1 = fvar(12) != EnemyNear,Vel x
fvar(12) = EnemyNear,Vel x
ignorehitpause = 1


[State -3]
type = varset
Trigger1 = facing = -1
Trigger1 = MoveContact
Trigger1 = fvar(12) != EnemyNear,gethitvar(xVel)
fvar(12) = EnemyNear,gethitvar(xVel)
ignorehitpause = 1


[State -3]
type = varset
Trigger1 = facing = 1
Trigger1 = MoveContact
Trigger1 = fvar(12) != -(EnemyNear,gethitvar(xVel))
fvar(12) = -(EnemyNear,gethitvar(xVel))
ignorehitpause = 1

;---------------------------------------------------------------------------------
;计算敌方重力加速度
;---------------------------------------------------------------------------------
[State -3]
type = varset
Trigger1 = !MoveContact
Trigger1 = EnemyNear,StateType = A
fvar(13) = EnemyNear,const(movement.yaccel)
ignorehitpause = 1

[State -3]
type = varset
Trigger1 = MoveContact
Trigger1 = EnemyNear,StateType = A
fvar(13) = EnemyNear,gethitvar(yaccel)
ignorehitpause = 1

[State -3]
type = varset
Trigger1 = MoveContact
Trigger1 = EnemyNear,StateType != A
fvar(13) = 0
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


;===================================================================================
:===================================================================================
;敌人识别
;===================================================================================
;===================================================================================

;1个敌人时

[State -2, EnemyNear]
type = VarSet
triggerall = (var(59) || fvar(39))
trigger1 = NumEnemy = 1
trigger2 = NumEnemy > 1
trigger2 = EnemyNear(1),Life = 0
var(2) = 0
ignorehitpause = 1

[State -2, EnemyNear]
type = VarSet
triggerall = (var(59) || fvar(39))
trigger1 = NumEnemy > 1
trigger1 = EnemyNear(0),Life = 0
var(2) = 1
ignorehitpause = 1

;2个敌人时

[State -2, EnemyNear]
type = VarSet
triggerall = var(59)
triggerall = NumPartner > 0
triggerall = Partner,Life > 0
triggerall = NumEnemy > 1
triggerall = EnemyNear(0),Life > 0 && EnemyNear(1),Life > 0
trigger1 = !(Partner,MoveType = A && Partner,NumTarget && EnemyNear(0),MoveType = H && EnemyNear(1),MoveType != H && !((EnemyNear(0),StateNo = [5000,5300]) || (EnemyNear(0),StateNo = [120,160])) && EnemyNear(0),GetHitVar(hitshaketime) = 0)
trigger1 = !(Partner,MoveType = H && EnemyNear(0),NumTarget && EnemyNear(0),MoveType = A && !((Partner,StateNo = [5000,5300]) || (Partner,StateNo = [120,160])) && Partner,GetHitVar(hitshaketime) = 0)
var(2) = 0
ignorehitpause = 1

[State -2, EnemyNear]
type = VarSet
triggerall = var(59)
triggerall = NumPartner > 0
triggerall = Partner,Life > 0
triggerall = NumEnemy > 1
triggerall = EnemyNear(0),Life > 0 && EnemyNear(1),Life > 0
trigger1 = (Partner,MoveType = A && Partner,NumTarget && EnemyNear(0),MoveType = H && EnemyNear(1),MoveType != H && !((EnemyNear(0),StateNo = [5000,5300]) || (EnemyNear(0),StateNo = [120,160])) && EnemyNear(0),GetHitVar(hitshaketime) = 0)
trigger2 = (Partner,MoveType = H && EnemyNear(0),NumTarget && EnemyNear(0),MoveType = A && !((Partner,StateNo = [5000,5300]) || (Partner,StateNo = [120,160])) && Partner,GetHitVar(hitshaketime) = 0)
var(2) = 1
ignorehitpause = 1


;=================================================================================
;抢招9
;=================================================================================

;=================================================================================
;抓硬直8
;=================================================================================

;=================================================================================
;切返7
;=================================================================================

;=================================================================================
;连段+连携6
;=================================================================================

;=================================================================================
;移动5
;=================================================================================

;=================================================================================
;打起身4
;=================================================================================

;=================================================================================
;立回3
;=================================================================================

;=================================================================================
;其他2
;=================================================================================

;=================================================================================
;防御1
;=================================================================================