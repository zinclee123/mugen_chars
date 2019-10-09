;=================================================================================
;State0代替
;=================================================================================
[Statedef 1]
type = S
physics = S
sprpriority = 0

[State 0]
type = changestate
Trigger1 = roundstate != 2
Trigger2 = P2BodyDist x < 0
value = 0
Ctrl = 1
ignorehitpause = 1

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
trigger1 = abs(vel x) < Const(movement.stand.friction.threshold)
trigger2 = Time = 4
x = 0

[State 0, 4] ;Are you dead?
type = ChangeState
trigger1 = !alive
value = 5050
ctrl = 0


[State 0, 5] ;Are you floating?
type = ChangeState
trigger1 = pos y < 0
value = 50

[State 0, 6]
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
type = changestate
TriggerAll = Time >= 16
Trigger1 = roundstate != 2
Trigger1 = var(50) := 1111901
;
Trigger2 = EnemyNear,Ctrl
Trigger2 = P2BodyDist X <= 45
Trigger2 = var(50) := 1111902
;
Trigger3 = frontedgebodydist <= 20
Trigger3 = var(50) := 1111903

Trigger4 = inguarddist
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
Trigger8 = P2BodyDist X <= 30
Trigger8 = var(50) := 1111908

value = 1


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
type = changestate
Trigger1 = roundstate != 2
Trigger1 = var(50) := 1111801

Trigger2 = inguarddist
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
value = 1


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

[State 36]
type = NotHitBy
trigger1 = Time = 0
value = ,AT
time = 4

[State 39, Var]
type = varset
Trigger1 = var(10) <= 4
sysvar(1) = 1

[State 39, Var]
type = varset
Trigger1 = var(10) = [5,8]
sysvar(1) = -1

[State 39, Var]
type = varset
Trigger1 = var(10) >= 8
sysvar(1) = 0

[State 39, Vel]
type = Velset
Trigger1 = !animtime
Trigger1 = var(10) = 1
x = const(Velocity.jump.fwd.x)
y = -6.02

[State 39, Vel]
type = Velset
Trigger1 = !animtime
Trigger1 = var(10) = 2
x = 1.5 * const(Velocity.jump.fwd.x)
y = -6.02

[State 39, Vel]
type = Velset
Trigger1 = !animtime
Trigger1 = var(10) = 3
x = const(Velocity.jump.fwd.x)
y = const(Velocity.jump.y)

[State 39, Vel]
type = Velset
Trigger1 = !animtime
Trigger1 = var(10) = 4
x = 1.5 * const(Velocity.jump.fwd.x)
y = const(Velocity.jump.y)


[State 39, Vel]
type = Velset
Trigger1 = !animtime
Trigger1 = var(10) = 5
x = const(Velocity.jump.back.x)
y = -6.02

[State 39, Vel]
type = Velset
Trigger1 = !animtime
Trigger1 = var(10) = 6
x = 1.5 * const(Velocity.jump.back.x)
y = -6.02

[State 39, Vel]
type = Velset
Trigger1 = !animtime
Trigger1 = var(10) = 7
x = const(Velocity.jump.back.x)
y = const(Velocity.jump.y)

[State 39, Vel]
type = Velset
Trigger1 = !animtime
Trigger1 = var(10) = 8
x = 1.5 * const(Velocity.jump.back.x)
y = const(Velocity.jump.y)


[State 39, Vel]
type = Velset
Trigger1 = !animtime
Trigger1 = var(10) = 9
x = const(Velocity.jump.neu.x)
y = -6.02

[State 39, Vel]
type = Velset
Trigger1 = !animtime
Trigger1 = var(10) = 10
x = const(Velocity.jump.neu.x)
y = const(Velocity.jump.y)


[State 39,]
type = VelSet
Trigger1 = (AnimTime = 0)
Trigger1 = (PrevStateNo = 100) || (PrevStateNo = 99)
Trigger1 = (sysvar(1) = 1)
Trigger1 = var(10) = 2 || var(10) = 4
x = const(Velocity.runjump.fwd.x)

[State 40,]
type = Turn
TriggerAll = (PrevStateNo = 52)
Trigger1 = (Time = 0) && (P2Dist X < 0)
Persistent = 0

[State 4600,9]
type = AfterImage
trigger1 = 1
time = 16
length = 4
frameGap = 1
timeGap = 2
PalAdd = 0,0,0
palmul = 1,1,1
PalBright = 0, 0, 0
PalContrast = 70,70,70
trans = add1

[State 40,PlaySnd]
type = PlaySnd
triggerall = AnimTime = 0
trigger1 = Var(10) = 2 || Var(10) = 4
value = 40, 1

[State 40,PlaySnd]
type = PlaySnd
triggerall = AnimTime = 0
trigger1 = Var(10) != 2 && Var(10) != 4
value = 40, 0

[State 4600,10]
type = ChangeState
trigger1 = AnimTime = 0
value = 59
Ctrl = 1

;---------------------------------------------------------------------------------
;跳跃空中的状态
;---------------------------------------------------------------------------------
[Statedef 59]
type    = A
physics = A

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
trigger1 = Vel y > Const720p(-8)
trigger1 = SelfAnimExist(anim + 3)
trigger1 = anim >= 41 && anim <= 43
persistent = 0
value = Anim + 3

;=================================================================================
;AI用前跑
;=================================================================================
[Statedef 99]
type    = S
movetype = I
physics = N
anim = 100
ctrl = 0

[State 100,0]
type = VelSet
trigger1 = AnimElem = 2
x = Const(velocity.run.fwd.x)

[State 100,1]
type = PlaySnd
trigger1 = TimeMod = 70, 0
value = 100, 0

[State 100,2]
type = PlaySnd
trigger1 = TimeMod = 70, 21
value = 100, 1

[State 100,3]
type = PlaySnd
trigger1 = TimeMod = 70, 47
value = 100, 2


[State 100, 3] ;Prevent from turning
type = AssertSpecial
Trigger1 = 1
flag = NoAutoTurn


[State 100, 4]
type = ChangeState

Trigger1 = time >= 12
Trigger1 = AnimTime = 0
Trigger1 = var(50) := 1119901
;对方可控的情况下，不要跑太近
Trigger2 = time >= 12
Trigger2 = P2BodyDist X <= var(51)
Trigger2 = P2BodyDist Y >= -120
Trigger2 = EnemyNear,MoveType != H && EnemyNear,Ctrl
Trigger2 = EnemyNear,facing != facing || P2BodyDist X < 0
Trigger2 = var(50) := 1119902

Trigger3 = time >= 12
Trigger3 = EnemyNear,StateType = L
Trigger3 = P2BodyDist X < var(51)
Trigger3 = var(50) := 1119903

Trigger4 = time >= 12
Trigger4 = inguarddist
Trigger4 = EnemyNear,facing != facing
Trigger4 = var(50) := 1119904

Trigger5 = time >= 12
Trigger5 = !EnemyNear,Ctrl && EnemyNear,MoveType = I
Trigger5 = P2BodyDist x < 30
Trigger5 = var(50) := 1119905

Trigger6 = EnemyNear,StateNo != 5608
Trigger6 = EnemyNear,MoveType = H
Trigger6 = P2BodyDist x <= 10
Trigger6 = var(50) := 1119906

Trigger7 = EnemyNear,StateNo = 5608
Trigger7 = EnemyNear,MoveType = H
Trigger7 = P2BodyDist x <= 100
Trigger7 = var(50) := 1119907

value = 101




[StateDef -3]
;=================================================================================
;AI Helper
;=================================================================================
[State -3]
type = Helper
Trigger1 = !numhelper(33000)
helpertype = normal
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
type=changestate
Trigger1= ishelper(33000)
Trigger1= StateNo!=33000
value=33000

[State -3]
type = Helper
Trigger1 = !numhelper(33001)
helpertype = normal
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
type=changestate
Trigger1= ishelper(33001)
Trigger1= StateNo!=33001
value=33001

[State -3]
type = Helper
Trigger1 = !numhelper(33002)
helpertype = normal
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
type=changestate
Trigger1= ishelper(33002)
Trigger1= StateNo!=33002
value=33002

[State -3, AI]
type=helper
TriggerAll =!ishelper
Trigger1=!NumHelper(11990)
helpertype=normal
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
type=changestate
Trigger1= ishelper(11990)
Trigger1= StateNo!=11990
value=11990


[state -3, AI Detect Projectile System]
type = helper
Trigger1 = !numhelper(33333333)
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
;突落敌人被砸地效果
;=================================================================================
[State -3]
type = Explod
trigger1 = EnemyNear,MoveType = H
trigger1 = EnemyNear,StateNo = 1402
trigger1 = EnemyNear,AnimElem = 1,1
anim = 6045
pos = 0,10
id = 12001
postype = p2
sprpriority = 2
ownpal = 1
ontop = 1
persistent = 0
ignorehitpause = 1

;=================================================================================
;打逆不可防用，拷贝自大师隆
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
;任务：
;1.1600 1610打康弹墙的目押
;---------------------------------------------------------------------------------
[State -3]
type = varset
Trigger1 = roundstate = 2 && EnemyNear,alive && EnemyNear,life > 0
;Trigger1 = movehit
var(59) = 0
IgnoreHitPause = 1

[State -3]
type = varset
Trigger1 = roundstate != 2 || EnemyNear,life = 0 || !EnemyNear,alive
var(59) = 0
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;打起身距离用，会在State 18 19 99中用到，也是发动的条件
;---------------------------------------------------------------------------------
[State -3]
type = varset
Trigger1 = 1
var(51) = 50
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;计算敌方X方向速度
;---------------------------------------------------------------------------------
[State -3]
type = varset
Trigger1 = !movecontact
Trigger1 = fvar(37) != EnemyNear,Vel x
fvar(37) = EnemyNear,Vel x
ignorehitpause = 1


[State -3]
type = varset
Trigger1 = facing = -1
Trigger1 = movecontact
Trigger1 = fvar(37) != EnemyNear,gethitvar(xVel)
fvar(37) = EnemyNear,gethitvar(xVel)
ignorehitpause = 1


[State -3]
type = varset
Trigger1 = facing = 1
Trigger1 = movecontact
Trigger1 = fvar(37) != -(EnemyNear,gethitvar(xVel))
fvar(37) = -(EnemyNear,gethitvar(xVel))
ignorehitpause = 1

;---------------------------------------------------------------------------------
;计算敌方重力加速度
;---------------------------------------------------------------------------------
[State -3]
type = varset
Trigger1 = !movecontact
Trigger1 = EnemyNear,StateType = A
fvar(38) = EnemyNear,const(movement.yaccel)
ignorehitpause = 1

[State -3]
type = varset
Trigger1 = movecontact
Trigger1 = EnemyNear,StateType = A
fvar(38) = EnemyNear,gethitvar(yaccel)
ignorehitpause = 1

[State -3]
type = varset
Trigger1 = movecontact
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
trigger1 = var(23) = 0
fvar(39) = 1 * ifelse(var(9)>0,1.2,1)
IgnoreHitPause = 1


[State -3]
type = VarSet
triggerAll = var(23) 
trigger1 = EnemyNear,MoveType != H 
trigger2 = EnemyNear,Ctrl 
fvar(39) = 0.6 * ifelse(var(9)>0,1.2,1)
IgnoreHitPause = 1


;---------------------------------------------------------------------------------
;可控判别
;---------------------------------------------------------------------------------
[State -3]
type = VarSet
trigger1 = 1
var(5) = 0
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;可控状态
[State -3]
type = VarSet
trigger1 = StateType != A
trigger1 = Ctrl || StateNo = 1 || StateNo = 18 || StateNo = 19 || StateNo = 99 || StateNo = 101 || StateNo = [120,149]
var(5) = 1
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;对应特殊技取消条件
[State -3]
type = VarSet
trigger1 = stateno = 200
trigger1 = AnimElem >= 3

trigger2 = stateno = 210
trigger2 = AnimElem >= 6

trigger3 = stateno = 220
trigger3 = AnimElem >= 3

trigger4 = stateno = 230
trigger4 = AnimElem >= 5

trigger5 = stateno = 300 
trigger5 = AnimElem >= 2

trigger6 = stateno = 310
trigger6 = AnimElem >= 8

var(5) = 2
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;对应必杀技的取消条件
[State -3]
type = VarSet
trigger1 = stateno = 700 && AnimElem >= 5
trigger2 = stateno = 760 && AnimElem >= 4
Trigger3 = stateno = 770 && AnimElem >= 4
Trigger4 = stateno = 730 && AnimElem >= 6
Trigger4 = stateno = 780 && AnimElem >= 4
var(5) = 3
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;对应超杀技的取消条件
[State -3]
type = VarSet
Trigger1 = StateNo = 1050 && AnimElem >= 4 
Trigger2 = Stateno = 1000 && AnimElem >= 4 
Trigger3 = StateNo = 1400 && AnimElem >= 4 
Trigger4 = StateNo = 1600 && AnimElem >= 9
Trigger5 = StateNo = 1610 && AnimElem >= 9
var(5) = 4
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;连段中上一个重复输出的普通技的，目前有2a>>2a,5x>>5x
;2a>>2a var(47)为X表示追击次数
;5x>>5x var(47)为X表示追击次数
;该变量既用来避免无限连，也避免2a>>2a之后目押再追2a>>2a,连段多样化
;
;---------------------------------------------------------------------------------
[State -3]
type = VarSet
TriggerAll = Var(47)
trigger1 = EnemyNear,Ctrl
trigger2 = EnemyNear,StateType = L
trigger3 = EnemyNear,MoveType = I
trigger4 = EnemyNear,MoveType != H
var(47) = 0
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;连段中上一个特殊技
;---------------------------------------------------------------------------------
[State -3]
type = VarSet
TriggerAll = Var(48)
trigger1 = EnemyNear,Ctrl
trigger2 = EnemyNear,StateType = L
trigger3 = EnemyNear,MoveType = I
trigger4 = EnemyNear,MoveType != H
var(48) = 0
IgnoreHitPause = 1

;=================================================================================
;抢招9
;=================================================================================
[State -3,立B]
type = ChangeState
value = 220
TriggerAll = var(59)
TriggerAll = var(5)
TriggerAll = EnemyNear,MoveType = A
TriggerAll = StateType = S
TriggerAll = EnemyNear,StateNo < 1000
TriggerAll = EnemyNear,StateNo = helper(33000),var(2)
TriggerAll = EnemyNear,time < helper(33000),var(3) - 3
;对地
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - fvar(39) * 3 < 35
Trigger1 = var(50) := 22091
IgnoreHitPause = 1

[State -3,立X]
type = ChangeState
value = 200
TriggerAll = var(59)
TriggerAll = var(5)
TriggerAll = EnemyNear,MoveType = A
TriggerAll = StateType = S
TriggerAll = EnemyNear,StateNo < 1000
TriggerAll = EnemyNear,StateNo = helper(33000),var(2)
TriggerAll = EnemyNear,time < helper(33000),var(3) - 4
;对地
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - fvar(39) * 4 < 31
Trigger1 = var(50) := 20091
;对空
Trigger2 = BackEdgeBodyDist >= 10
Trigger2 = EnemyNear,StateType = A
Trigger2 = P2BodyDist x - fvar(37) * 4 = [-14, 31]
Trigger2 = EnemyNear,pos y + EnemyNear,Vel Y * 4 + fvar(38) * 4 * (4 + 1) / 2 = [-45,-20]
Trigger2 = var(50) := 20092
;版边对空
Trigger3 = BackEdgeBodyDist < 10
Trigger3 = EnemyNear,StateType = A
Trigger3 = P2BodyDist x - fvar(37) * 4 < 31
Trigger3 = EnemyNear,pos y + EnemyNear,Vel Y * 4 + fvar(38) * 4 * (4 + 1) / 2 = [-45,-20]
Trigger3 = var(50) := 20093

IgnoreHitPause = 1

[State -3,蹲X]
type = ChangeState
value = 300
TriggerAll = var(59)
TriggerAll = var(5)
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,StateNo < 1000
TriggerAll = EnemyNear,StateNo = helper(33000),var(2)
;对地
Trigger1 = (EnemyNear,time < helper(33000),var(3)) || (GameTime - var(46) < 2)
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - fvar(39) * 2 < 34
Trigger1 = var(50) := 30091
;对空
Trigger2 = (EnemyNear,time < helper(33000),var(3)) || (GameTime - var(46) < 2) || !inguarddist
Trigger2 = EnemyNear,StateType = A
Trigger2 = P2BodyDist x - fvar(39) * 2 = [-5, 34]
Trigger2 = EnemyNear,Pos Y + EnemyNear,Vel Y * 1 + fvar(38) * 1 * (1 + 1) / 2 = [-23,-5]
Trigger2 = var(50) := 30092
IgnoreHitPause = 1

[State -3,蹲B]
type = ChangeState
value = 320
TriggerAll = var(59)
TriggerAll = var(5)
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,StateNo < 1000
TriggerAll = EnemyNear,StateNo = helper(33000),var(2)
TriggerAll = EnemyNear,time < helper(33000),var(3) - 5
;对地
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - fvar(39) * 5 < 40
Trigger1 = var(50) := 32091
IgnoreHitPause = 1

;=================================================================================
;抓硬直7
;=================================================================================
[State -3,投技能抓闪避]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = var(5) = 1
TriggerAll = !inguarddist
Trigger1 = EnemyNear,MoveType = I && !EnemyNear,Ctrl
Trigger1 = EnemyNear,AnimTime <= -1
Trigger1 = P2BodyDist X < 10
Trigger1 = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
Trigger1 = EnemyNear,Facing != Facing && EnemyNear,Vel x > 0 
Value = ifelse(BackEdgeBodyDist < 60, 950, 900)
IgnoreHitPause = 1


[State -3,前跳躲吸的技能，主要是大蛇的掏心]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = var(5) = 1
TriggerAll = (EnemyNear,MoveType = A || EnemyNear,MoveType = I) && !EnemyNear,Ctrl
TriggerAll = EnemyNear,AnimTime >= -4
TriggerAll = EnemyNear,StateNo >= 2000
TriggerAll = EnemyNear,Facing != Facing
TriggerAll = EnemyNear,StateType != A

Trigger1 = EnemyNear,BackEdgeBodyDist > 10
Trigger1 = P2Dist X = [50, 100]
Trigger1 = var(50) := 390701 
Trigger1 = var(10) := 4

Trigger2 = EnemyNear,BackEdgeBodyDist > 10
Trigger2 = P2Dist X <= 50
Trigger2 = var(50) := 3907012
Trigger2 = var(10) := 2

Trigger3 = EnemyNear,BackEdgeBodyDist <= 0
Trigger3 = P2Dist X < 80
Trigger3 = var(50) := 390703
Trigger3 = var(10) := 2

Value = 39
IgnoreHitPause = 1


[State -3,前跑抓硬直]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = var(5) = 1 && StateNo != 99
TriggerAll = EnemyNear,MoveType = H && !EnemyNear,Ctrl
Trigger1 = EnemyNear,Facing != Facing
Trigger1 = EnemyNear,StateType != A 
Trigger1 = EnemyNear,GetHitVar(HitTime) > 7
Trigger1 = P2BodyDist x > 10
;追击五轮突打康
Trigger2 = EnemyNear,StateNo = 5608
Trigger2 = P2BodyDist X > 100
Value = 99
IgnoreHitPause = 1

[State -3,]
type = changestate
TriggerAll = var(59)
TriggerAll = var(5) = 1
TriggerAll = !inguarddist || (Helper(33000),var(1) > 1 && EnemyNear,StateNo >= 1000 && AnimTime = [-6,-1])
TriggerAll = P2MoveType = A || (P2MoveType = I && !EnemyNear,Ctrl) 
TriggerAll = P2StateType != L
TriggerAll = P2StateNo != 5200 && P2StateNo != 5210 && P2StateNo != 5201
TriggerAll = StateType != A 
TriggerAll = (P2BodyDist x >= 0 && EnemyNear,Facing != Facing) || (P2BodyDist x <= 0 && EnemyNear,Facing = Facing)
TriggerAll = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
;立Y
Trigger1 = EnemyNear,StateNo < 1000
Trigger1 = P2BodyDist x - fvar(37)*6 = [-30, 30]
Trigger1 = EnemyNear,animtime < -6
Trigger1 = var(54) := 210
Trigger1 = var(50) := 021071
;立X
Trigger2 = var(44) != 200
Trigger2 = P2BodyDist x - fvar(37)*4 = [-26, 26]
Trigger2 = EnemyNear,animtime < -4
Trigger2 = var(54) := 200
Trigger2 = var(50) := 020071
Trigger2 = var(44) := 200
;蹲X
Trigger3 = var(44) != 300
Trigger3 = P2BodyDist x - fvar(37)*2 = [-30, 30] 
Trigger3 = EnemyNear,animtime < -2
Trigger3 = var(54) := 300
Trigger3 = var(50) := 030071
Trigger3 = var(44) := 300
;蹲A
Trigger4 = P2BodyDist x - fvar(37)*5 = [-40, 40]
Trigger4 = EnemyNear,animtime < -5
Trigger4 = var(54) := 320
Trigger4 = var(50) := 032071
Trigger4 = var(44) := 320
;立A
Trigger5 = EnemyNear,StateType = S
Trigger5 = P2BodyDist x - fvar(37)*3 = [-50, 50]
Trigger5 = EnemyNear,animtime < -3
Trigger5 = var(54) := 220
Trigger5 = var(50) := 022071
Trigger5 = var(44) := 220
value = var(54)
IgnoreHitPause = 1


[State -3,抓空中落地]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = var(5) = 1
TriggerAll = !inguarddist
TriggerAll = StateType != A 
TriggerAll = P2BodyDist x >= 0
TriggerAll = EnemyNear,StateNo <= 5000 && EnemyNear,MoveType != H
TriggerAll = !EnemyNear,NumProj && !PlayerIdExist(helper(33333333),var(3)) 

;立Y非版边
Trigger1 = fvar(11) = [4,8]
Trigger1 = P2BodyDist x = [-10,30]
Trigger1 = var(54) := 210
Trigger1 = var(50) := 021072

;蹲X非版边
Trigger2 = BackEdgeBodyDist >= 10
Trigger2 = fvar(11) = [1,3]
Trigger2 = P2BodyDist x = [-10,30]
Trigger2 = var(54) := 300
Trigger2 = var(50) := 030072
;蹲X版边
Trigger3 = BackEdgeBodyDist < 10
Trigger3 = fvar(11) = [1,3]
Trigger3 = P2BodyDist x < 30
Trigger3 = var(54) := 300
Trigger3 = var(50) := 030073
;蹲A非版边
Trigger4 = BackEdgeBodyDist >= 10
Trigger4 = fvar(11) = [4,6]
Trigger4 = P2BodyDist x = [0,40]
Trigger4 = var(54) := 320
Trigger4 = var(50) := 032072
;蹲A版边
Trigger5 = BackEdgeBodyDist < 10
Trigger5 = fvar(11) = [4,6]
Trigger5 = P2BodyDist x < 40
Trigger5 = var(54) := 320
Trigger5 = var(50) := 032073
;蹲B非版边
Trigger6 = BackEdgeBodyDist >= 10
Trigger6 = fvar(11) = [6,9]
Trigger6 = P2BodyDist x - fvar(37) * 7 = [55,70]
Trigger6 = var(54) := 330
Trigger6 = var(50) := 033072
;蹲B版边
Trigger7 = BackEdgeBodyDist < 10
Trigger7 = fvar(11) = [6,9]
Trigger7 = P2BodyDist x =[36,70]
Trigger7 = var(54) := 330
Trigger7 = var(50) := 033073
value = var(54)
IgnoreHitPause = 1

[State -3,小手投投抓闪避]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = var(5) = [1, 3]
Trigger1 = EnemyNear,MoveType = I && !EnemyNear,Ctrl
Trigger1 = (EnemyNear,AnimTime = [-4, -1])
Trigger1 = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
Trigger1 = EnemyNear,Facing != Facing && EnemyNear,Vel x > 0 
Trigger1 = P2BodyDist X = [0, 35]
Value = 1300
IgnoreHitPause = 1

;=================================================================================
;切返8
;=================================================================================
[State -3, HSDM]
type = ChangeState
TriggerAll = var(59)
TriggerAll = EnemyNear,Facing != Facing
TriggerAll = StateType != A 
TriggerAll = var(5)
TriggerAll = !EnemyNear,NumProj && !PlayerIdExist(helper(33333333),var(3)) 
TriggerAll = EnemyNear,Life = [250,350]
TriggerAll = Life < (LifeMax*0.3)
TriggerAll = (var(23) > 0 && Power >= 1000) || (Power >= 3000)
TriggerAll = P2BodyDist X - fvar(37) * 22 = [30, 78]   
;对地面
Trigger1 = EnemyNear,MoveType = A 
Trigger1 = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
Trigger1 = !EnemyNear,Ctrl
Trigger1 = EnemyNear,animtime < -22 
Trigger1 = var(50) := 350041
;对空中
Trigger2 = EnemyNear,StateNo != 5040
Trigger2 = EnemyNear,StateType = A
Trigger2 = fvar(11) = [21,23]
value = 3500
IgnoreHitPause = 1

[State -3, MAX合掌扭]
type = ChangeState
TriggerAll = var(59)
TriggerAll = EnemyNear,Facing != Facing
TriggerAll = StateType != A 
TriggerAll = var(5) = [1, 3]
TriggerAll = !EnemyNear,NumProj && !PlayerIdExist(helper(33333333),var(3)) 
TriggerAll = EnemyNear,AnimTime < -17
TriggerAll = EnemyNear,MoveType = A
TriggerAll = (var(23) > 0 && Power >= 1000) || (Power >= 3000)
TriggerAll = P2BodyDist X - fvar(37) * 22 = [0, 100] 
TriggerAll = EnemyNear,Life < 250  
;假设招式攻击F是20F，已经过去是Time是1，还有19，不符合
TriggerAll = helper(33000),var(3) - enemynear,time < 9
;对地面
Trigger1 = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
Trigger1 = !EnemyNear,Ctrl
Trigger1 = var(50) := 330041
value = 3100
IgnoreHitPause = 1

[State -3, 合掌扭]
type = ChangeState
TriggerAll = var(59)
TriggerAll = EnemyNear,Facing != Facing
TriggerAll = StateType != A 
TriggerAll = !EnemyNear,NumProj && !PlayerIdExist(helper(33333333),var(3)) 
TriggerAll = var(5) = [1, 3]
TriggerAll = EnemyNear,AnimTime < -19
TriggerAll = EnemyNear,MoveType = A
TriggerAll = var(23) > 0 || Power >= 1000
TriggerAll = P2BodyDist X - fvar(37) * 22 = [0, 100]   
TriggerAll = EnemyNear,Life < 100  
TriggerAll = enemynear,stateno = helper(33000),var(2)
;假设招式攻击F是20F，已经过去是Time是1，还有19，不符合
TriggerAll = helper(33000),var(3) - enemynear,time < 11

;对地面
Trigger1 = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
Trigger1 = !EnemyNear,Ctrl
Trigger1 = EnemyNear,animtime < -19 
Trigger1 = var(50) := 330041
value = 3000
IgnoreHitPause = 1





[State -3, 突落]
type = ChangeState
TriggerAll = var(59)
TriggerAll = EnemyNear,Facing != Facing
TriggerAll = StateType != A 
TriggerAll = var(5)  
TriggerAll = EnemyNear,MoveType = A 
TriggerAll = P2BodyDist x - fvar(37) * 13 = [-10, 57]
;对地面
Trigger1 = EnemyNear,StateType != A
Trigger1 = EnemyNear,StateNo = helper(33000),var(2)
Trigger1 = EnemyNear,time = helper(33000),var(3) - 5 
Trigger1 = EnemyNear,animtime < -13 
Trigger1 = var(50) := 140081
;对空中
Trigger2 = EnemyNear,time = helper(33000),var(3) - 5 
Trigger2 = EnemyNear,StateType = A
Trigger2 = fvar(11) > 13
Trigger2 = EnemyNear,Pos Y  + EnemyNear,Vel Y * 13 + fvar(38) * 13 * (13 + 1) / 2 >= -70

value = 1400
IgnoreHitPause = 1

[State -3, 寄切]
type = ChangeState
TriggerAll = var(59)
TriggerAll = var(5) = [1, 3] 
;先注释掉，被人打背一样空振
;TriggerAll = EnemyNear,Facing != Facing
TriggerAll = StateType != A 
TriggerAll = EnemyNear,MoveType = A 
TriggerAll = (!EnemyNear,NumProj && !PlayerIdExist(helper(33333333),var(3))) || (P2BodyDist X < 54)
;抢招不会抢大于1000的招式，容易被凹
TriggerAll = EnemyNear,StateNo >= 1000
Triggerall = EnemyNear,HitDefAttr = SCA,AA,AT,AP

;空振躲大招用 
Trigger1 = InguardDist  || (EnemyNear,Time <= 15)
Trigger1 = (NumHelper(33000) && Helper(33000),var(1) <= 1) || (EnemyNear,Time <= 15)
Trigger1 = EnemyNear,StateType != A ;&& EnemyNear,Vel y = 0
Trigger1 = P2BodyDist x - fvar(37) * 23 < 54
Trigger1 = var(50) := 120081
value = 1200
IgnoreHitPause = 1



;这个切返只能抓普通级技能，无敌时间太短
[State -3, 挂投]
type = ChangeState
TriggerAll = var(59)
TriggerAll = var(5) = [1, 3] 
TriggerAll = StateType != A 
TriggerAll = InguardDist
TriggerAll = EnemyNear,MoveType = A 
TriggerAll = EnemyNear,StateType != A
Trigger1 = EnemyNear,StateNo = [200,999]
Trigger1 = EnemyNear,AnimTime <= -1
Trigger1 = (EnemyNear,Facing != Facing && (P2BodyDist X = [34, 40])) || (EnemyNear,Facing = Facing && (P2BodyDist X = [-40, -34])) 
Trigger1 = var(50) := 130081
value = 1300
IgnoreHitPause = 1

;=================================================================================
;连段+连携6
;=================================================================================

;----------------------------------------------------------
;①
;连段类型,以下是拳皇的按键，对应Mugen要转换 A->X | B->A | C->Y | D->B
;可以的目押有:
;1. 6B >> B >> 5B
;2. 6B >> 2B
;3. 6A >> C >> 6B >> B >> 5B, C到6B也是目押,常见于BC中
;4. 6B >> 5A
;BC之后统一接6A
;非BC和BC连段中，均以3x前叩收尾 

;2A必须接3A前叩，无其他连段
;5B必须接3A前叩，无其他连段
;2B必须结束字后接5B，再接其他的
;A可以接5B
;5C || 2C 也可以接突张！
;张手千代只能再BC连第一下追加，其他都追不上。。


;----------------------------------------------------------
;MAX超杀技终结
;----------------------------------------------------------
[State -3,Max合掌扭收尾]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000
TriggerAll = StateNo != 200 && StateNo != 300 && StateNo != 220 && StateNo != 320
TriggerAll = MoveHit
Trigger1 = var(5) = [2, 3]
Trigger1 = var(23) = 0 && Power >= 3000
Trigger1 = EnemyNear,Life <= 300 && Random < 100
value = 3100


;----------------------------------------------------------
[State -3,BC]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = statetype != A
TriggerAll = power >= 2000
TriggerAll = var(23) = 0
TriggerAll = EnemyNear,Life > 150
;3A 1段BC
Trigger1 = EnemyNear,MoveType = H && EnemyNear,StateNo >= 5000
Trigger1 = EnemyNear,StateType != A
Trigger1 = StateNo = 730 && MoveHit
Trigger1 = fvar(39) := 0.5
value = 70199

;----------------------------------------------------------
;超杀技终结
;----------------------------------------------------------
[State -3,合掌扭收尾]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000
TriggerAll = StateNo != 200 && StateNo != 300 && StateNo != 220 && StateNo != 320
;BC中直接收尾，不走下面的连段
Trigger1 = Var(23) > 0 && EnemyNear,Life < 150
Trigger1 = MoveHit && var(5) = [2,3] 
;非BC中直接结束
Trigger2 = Power >= 1000 && Var(23) = 0
Trigger2 = EnemyNear,Life < 150 && var(5) = 3 && MoveHit
Trigger2 = StateNo >= 700
value = 3000

;----------------------------------------------------------
;普通技连段
;----------------------------------------------------------
[State -3,立x]
type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = P2BodyDist x - ifelse(EnemyNear,BackEdgeBodyDist > 10, fvar(37) * 5, 0) - ifelse(EnemyNear,BackEdgeBodyDist < 10,Vel x * 5, 0)< 25
;蹲a >> 蹲a
Trigger1 = var(47) < 20001
Trigger1 = StateNo = 200 && MoveHit
Trigger1 = var(47) := ifelse(var(47)/100 != 200,20000,var(47)+1)
Trigger1 = var(50) := 0200061
value = 200


[State -3,蹲a]
type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = P2BodyDist x - ifelse(EnemyNear,BackEdgeBodyDist > 10, fvar(37) * 5, 0) - ifelse(EnemyNear,BackEdgeBodyDist < 10,Vel x * 5, 0)< 25
;蹲a >> 蹲a
Trigger1 = var(47) < 32001
Trigger1 = StateNo = 320 && MoveContact
Trigger1 = var(47) := ifelse(var(47)/100 != 320,32000,var(47)+1)
Trigger1 = var(50) := 032061
value = 320

[State -3,5A]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
Trigger1 = StateNo = 200 && MoveContact
Trigger1 = var(50) := 022061
Trigger2 = StateNo = 320 && MoveContact
Trigger2 = var(50) := 022062
value = 220

;----------------------------------------------------------
;特殊技连段
;----------------------------------------------------------

;----------------------------------------------------------
;2A,5B最后的接3X
[State -3,3X前叩]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
Trigger1 = (StateNo = 300 || StateNo = 220) && MoveHit
Trigger1 = var(50) := 073061
Trigger1 = var(48) := 730

Trigger2 = var(44) != 730
Trigger2 = (StateNo = 300 || StateNo = 220) && MoveGuarded
Trigger2 = var(50) := 073062
Trigger2 = var(48) := 730
Trigger2 = var(44) := 730
value = 730

;----------------------------------------------------------
;突张
[State -3,6A突张]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
Trigger1 = var(48) != 740
Trigger1 = (StateNo = 210 || StateNo = 310) && MoveContact
Trigger1 = var(50) := 074061
Trigger1 = var(48) := 740
Trigger2 = var(44) := 740

Trigger2 = var(23) > 0
Trigger2 = (StateNo = 210 || StateNo = 310) && MoveHit
Trigger2 = var(50) := 074062
Trigger2 = var(48) := 740
Trigger2 = var(44) := 740

Trigger3 = StateNo = 720 && MoveHit && EnemyNear,GetHitVar(HitTime) = [11,13]
Trigger3 = EnemyNear,StateNo >= 5000
Trigger3 = var(44) := 740

value = 740

[State -3,突张派生]
type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
Trigger1 = EnemyNear,Life > Life || random < 300
Trigger1 = StateNo = 740 && AnimElem = 7 && MoveContact 
Trigger1 = var(50) := 075061
value = 750

;----------------------------------------------------------
;张手只能BC第一下接，其他任务取消都接不上原作
[State -3,前x 张手千代]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = P2BodyDist x - ifelse(EnemyNear,BackEdgeBodyDist > 10, fvar(37) * 14, 0) - ifelse(EnemyNear,BackEdgeBodyDist < 10,Vel x * 14, 0) < 50
;BC第一下
Trigger1 = var(23) > 0
Trigger1 = var(5) = 1
Trigger1 = EnemyNear,StateNo >= 5000
Trigger1 = EnemyNear,GetHitVar(HitTime) >= 14 
Trigger1 = var(50) := 070062
Trigger1 = var(48) := 700
Trigger1 = var(44) := 700
value = 700

[State -3,前x 张手千代派生]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
; 张手只派生y，因为派生Y可以接突张
Trigger1 = StateNo = 700 && MoveHit && AnimElem >= 11 
Trigger1 = var(54) := 720
Trigger1 = var(50) := 072061
value = var(54)


;----------------------------------------------------------
;喉轮只在压制的时候用，目前没调研
[State -3,3Y喉轮]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = P2BodyDist x - ifelse(EnemyNear,BackEdgeBodyDist > 10, fvar(37) * 10, 0) - ifelse(EnemyNear,BackEdgeBodyDist < 10,Vel x * 10, 0) < 69
Trigger1 = var(5) = 2 && MoveGuarded
Trigger1 = var(50) := 076061
Trigger1 = var(48) := 760
Trigger1 = var(44) := 760
value = 760

[State -3,喉轮派生]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl && EnemyNear,Vel Y = 0
Trigger1 = EnemyNear,StateType = S
Trigger1 = P2BodyDist X - fvar(37) * 4 < 70
Trigger1 = StateNo = 760 && AnimElem = 10
Trigger1 = MoveContact || (EnemyNear,Facing != Facing && P2BodyDist x = [0, 40]) || (EnemyNear,Facing = Facing && P2BodyDist x = [-40, 0])
Trigger1 = var(50) := 077061
value = 770

;----------------------------------------------------------
;必杀技连段
;----------------------------------------------------------
[State -3,突出]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000
;只在BC连中使用突出强
Trigger1 = var(23) > 0
Trigger1 = StateNo = 730 && MoveHit
Trigger1 = var(50) := 105061

Trigger2 = var(49) = 1
Trigger2 = Stateno = 700 && MoveHit
value = 1050

[State -3,挂投]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000
Trigger1 = Life - EnemyNear,Life > 650 && random < 100
Trigger1 = var(23) = 0
Trigger1 = StateNo = 760 || StateNo = 700 || StateNo = 730
Trigger1 = MoveHit
Trigger1 = var(50) := 130061
value = 1300


[State -3,小手投]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000
;对地
Trigger1 = EnemyNear,StateType != A
Trigger1 = BackEdgeBodyDist < 80 || (random < 100 && FrontEdgeBodyDist > 90 && Life - EnemyNear,Life > 200)
Trigger1 = var(23) = 0
Trigger1 = StateNo = 760 || StateNo = 700 || StateNo = 730
Trigger1 = MoveHit
Trigger1 = var(50) := 110061
;对空
Trigger2 = EnemyNear,StateType = A
Trigger2 = var(5) = 2 && MoveHit
;Trigger2 = P2BodyDist x - fvar(37) * 7 = [10, 70]
Trigger2 = EnemyNear,pos y + EnemyNear,Vel Y * 7 + fvar(38) * 7 * (7 + 1) / 2 = [-55,-20]
Trigger2 = var(50) := 110062
value = 1100

[State -3,五轮突强]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000
Trigger1 = EnemyNear,BackEdgeBodyDist > 80 && Life > (EnemyNear,Life + 200)
Trigger1 = var(23) = 0
Trigger1 = StateNo = 760 || StateNo = 700 || StateNo = 730
Trigger1 = MoveHit
Trigger1 = var(50) := 161061
value = 1610

[State -3,五轮突弱 连携]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
Trigger1 = (StateNo = 760 && AnimElem = 10) || StateNo = 700 || StateNo = 730
Trigger1 = MoveGuarded
Trigger1 = EnemyNear,Power < 1000
Trigger1 = var(50) := 160061
value = 1600

[State -3,突落]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000
Trigger1 = var(23) = 0
Trigger1 = StateNo = 760 || StateNo = 700 || (StateNo = 730 && AnimElem = 7,>0)
Trigger1 = MoveHit
Trigger1 = var(50) := 140061
;BC中收尾突出1段
Trigger2 = var(23) > 0
Trigger2 = StateNo = 1050 && MoveHit && AnimElem = 26, >0
Trigger2 = var(50) := 140062
value = 1400

;----------------------------------------------------------
;超杀技连段
;----------------------------------------------------------
[State -3,合掌扭收尾BC]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000
TriggerAll = var(23) > 0
TriggerAll = StateNo = 1400 && Movehit
Trigger1 = power >= 1000
Trigger1 = var(54) := 3100
Trigger2 = power < 1000
Trigger2 = var(54) := 3000
value = var(54)


;-----------------------------------------------------------
;movehit中的连段，通常是空中的攻击击中等等
;-----------------------------------------------------------
[State -3]
type = ChangeState
TriggerAll = var(59)
TriggerAll = var(5) = 1
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = EnemyNear,StateType != L
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000 || EnemyNear,StateNo = [120,159]

;蹲Y
Trigger1 = EnemyNear,StateNo >= 5000
Trigger1 = helper(33000),var(14) != [700,799] ;Hittime控制不好会出现无限连
Trigger1 = P2BodyDist x - fvar(37)*12 < 50
Trigger1 = EnemyNear,gethitvar(hittime) >= 12 || (EnemyNear,StateNo = 5700 && EnemyNear,time = 28)
Trigger1 = var(54) := 310
Trigger1 = var(50) := 031061

;立Y
Trigger2 = EnemyNear,StateType = S || Random < 200
Trigger2 = EnemyNear,StateNo >= 5000 || (Life > EnemyNear,Life && EnemyNear,Power < 1000)
Trigger2 = helper(33000),var(14) != [700,799] ;Hittime控制不好会出现无限连
Trigger2 = P2BodyDist x - fvar(37)*6 < 30 
Trigger2 = EnemyNear,gethitvar(hittime) >= 6 || (EnemyNear,StateNo = 5700 && EnemyNear,time = 34)
Trigger2 = var(54) := 210
Trigger2 = var(50) := 021061

;蹲A
Trigger3 = var(44) != 320
Trigger3 = Random < 200
Trigger3 = Helper(33000),var(14) != 750
Trigger3 = Helper(33000),var(14) != [1600,1610]
Trigger3 = var(47)%100 != 320
Trigger3 = EnemyNear,gethitvar(hittime) >= 5 || (EnemyNear,StateNo = 5700 && EnemyNear,time = 35)
Trigger3 = P2BodyDist x - ifelse(EnemyNear,BackEdgeBodyDist > 10, fvar(37) * 5, 0) - ifelse(EnemyNear,BackEdgeBodyDist < 10,Vel x * 5, 0)< 40
Trigger3 = var(54) := 320
Trigger3 = var(50) := 032061
Trigger3 = var(44) := 320


;立X
Trigger4 = var(44) != 200
Trigger4 = Helper(33000),var(14) != 750
Trigger4 = var(47)%100 != 200
Trigger4 = EnemyNear,gethitvar(hittime) >= 4 || (EnemyNear,StateNo = 5700 && EnemyNear,time = 36)
Trigger4 = P2BodyDist x - ifelse(EnemyNear,BackEdgeBodyDist > 10, fvar(37) * 4, 0) - ifelse(EnemyNear,BackEdgeBodyDist < 10,Vel x * 4, 0)< 30
Trigger4 = var(54) := 200
Trigger4 = var(50) := 020061
Trigger4 = var(44) := 200

;立A
Trigger5 = var(44) != 220
Trigger5 = EnemyNear,gethitvar(hittime) = 3 || (EnemyNear,StateNo = 5700 && EnemyNear,time <=37)
Trigger5 = P2BodyDist x - ifelse(EnemyNear,BackEdgeBodyDist > 10, fvar(37) * 3, 0) - ifelse(EnemyNear,BackEdgeBodyDist < 10,Vel x * 3, 0)< 53
Trigger5 = var(54) := 220
Trigger5 = var(50) := 022061
Trigger5 = var(44) := 220

;蹲X
Trigger6 = var(44) != 300
Trigger6 = EnemyNear,gethitvar(hittime) = 2 || (EnemyNear,StateNo = 5700 && EnemyNear,time = 38)
Trigger6 = P2BodyDist x - ifelse(EnemyNear,BackEdgeBodyDist > 10, fvar(37) * 2, 0) - ifelse(EnemyNear,BackEdgeBodyDist < 10,Vel x * 2, 0)< 32
Trigger6 = var(54) := 300
Trigger6 = var(50) := 030061
Trigger6 = var(44) := 300

value = var(54)


[State -3,小手投连蹲轻拳]
type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateType = A
TriggerAll = Enemynear,StateNo >= 5000
Trigger1 = StateNo = 300 || StateNo = 310 || StateNo = 210 || StateNo = 220
Trigger1 = MoveHit
Trigger1 = var(50) := 110066
value = 1100
IgnoreHitPause = 1

;-----------------------------------------------------------
;浮空追击
;-----------------------------------------------------------
[State -3,四股踏]
type = ChangeState
TriggerAll = var(59)
TriggerAll = var(5) = 1
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = !NumTarget(1500) && !NumTarget(1510)
;突落 >> 四股踏
Trigger1 = EnemyNear,StateNo != [120,159]
Trigger1 = EnemyNear,MoveType = H && !EnemyNear,Ctrl
Trigger1 = NumTarget(1400)
Trigger1 = EnemyNear,StateNo = 1404 && EnemyNear,Time < 12
Trigger1 = EnemyNear,StateType != A
Trigger1 = var(50) := 150061
; 五轮突 >> 四股踏
Trigger2 = EnemyNear,StateNo != [120,159]
Trigger2 = EnemyNear,MoveType = H && !EnemyNear,Ctrl
Trigger2 = NumTarget(1600) || NumTarget(1610)
Trigger2 = var(50) := 150064
; 追击空中落地的
Trigger3 = !NumTarget(1601) && !NumTarget(1611)
Trigger3 = P2BodyDist x - fvar(37) * 19 > 90
Trigger3 = EnemyNear,StateType = A
Trigger3 = fvar(11) = [21,22)
Trigger3 = var(50) := 150063
; 打飞行道具的
Trigger4 = P2StateNo >= 200
Trigger4 = P2BodyDist x > 170
Trigger4 = !EnemyNear,Ctrl
Trigger4 = EnemyNear,StateType != A && EnemyNear,StateType != L && EnemyNear,Vel Y = 0
Trigger4 = EnemyNear,MoveType = A || EnemyNear,MoveType = I
Trigger4 = EnemyNear,AnimTime < -23
Trigger4 = var(50) := 150064
; 喉轮（派生）  >> 四股踏
Trigger5 = NumTarget(770)
Trigger5 = EnemyNear,StateNo >= 5000
Trigger5 = EnemyNear,MoveType = H && !EnemyNear,Ctrl
Trigger5 = EnemyNear,StateType != A
Trigger5 = var(50) := 150065
value = 1500
IgnoreHitPause = 1

[State -3,喉轮追击五轮突打康]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = var(5) = 1
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateType = A
Trigger1 = NumTarget(1601) || NumTarget(1611)
Trigger1 = P2BodyDist x + fvar(37) * 10 = [25, 70]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 10 + fvar(38) * 10 * (10 + 1) / 2 = [-50,-25]
Trigger1 = var(50) := 076061
value = 760
IgnoreHitPause = 1


[State -3,小手投追击五轮突打康]
type = ChangeState
TriggerAll = var(59)
TriggerAll = var(5) = 1
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateType = A
Trigger1 = NumTarget(1601) || NumTarget(1611)
Trigger1 = P2BodyDist x + fvar(37) * 7 = [-5, 70]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 7 + 0.55 * 7 * (7 + 1) / 2 = [-50,-20]
Trigger1 = var(50) := 110063

Trigger2 = EnemyNear,StateNo != 5040
Trigger2 = !NumTarget(1601) && !NumTarget(1611)
Trigger2 = P2BodyDist x - fvar(37) * 7 = [-5, 70]
Trigger2 = EnemyNear,pos y + EnemyNear,Vel Y * 7 + fvar(38) * 7 * (7 + 1) / 2 = [-50,-20]
Trigger2 = var(50) := 110064

value = 1100
IgnoreHitPause = 1

[State -3,JCD追击五轮突打康]
type = ChangeState
TriggerAll = var(59)
TriggerAll = var(5) = 1
TriggerAll = StateType != A
TriggerAll = EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateType = A
Trigger1 = NumTarget(1601) || NumTarget(1611)
Trigger1 = FrontEdgeBodyDist < 100
Trigger1 = var(10) := 10
Trigger1 = var(50) := 003961
Trigger2 = NumTarget(611)
Trigger2 = var(10) := 3
Trigger2 = var(50) := 003962
value = 39
IgnoreHitPause = 1

[State -3,空CD追击]
type = ChangeState
value = 610
TriggerAll = var(59)
TriggerAll = Ctrl
TriggerAll = StateType = A
TriggerAll = EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - Vel x * 8 - fvar(37) * 8  < 29
Trigger1 = P2BodyDist y - Vel Y * 8 - const(movement.yaccel) * 8 * (8 + 1) / 2 + EnemyNear,Vel Y * 8 + fvar(38) * 8 * (8 + 1) / 2 = [-20,40]
Trigger1 = fvar(9) > 8
Trigger1 = var(50) := 61061
IgnoreHitPause = 1

[State -3,五轮突强追击五轮突打康]
type = ChangeState
TriggerAll = var(59)
TriggerAll = var(5) = 1
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateType = A
TriggerAll = Life < EnemyNear,Life
;五轮突打康
Trigger1 = NumTarget(1601) || NumTarget(1611)
;这里的速度读取是反的
Trigger1 = P2BodyDist x + fvar(37) * 19 = [20, 100]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 19 + 0.55 * 19 * (19 + 1) / 2 = [-65,-20]
Trigger1 = var(50) := 161065
value = 1610
IgnoreHitPause = 1

[State -3,五轮突弱追击五轮突打康]
type = ChangeState
TriggerAll = var(59)
TriggerAll = var(5) = 1
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateType = A
TriggerAll = Life < EnemyNear,Life
;五轮突打康
Trigger1 = NumTarget(1601) || NumTarget(1611)
;这里的速度读取是反的
Trigger1 = P2BodyDist x + fvar(37) * 17 = [-5, 60]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 17 + 0.55 * 17 * (17 + 1) / 2 = [-65,-20]
Trigger1 = var(50) := 160065
value = 1600
IgnoreHitPause = 1


;=================================================================================
;移动5
;=================================================================================
[State -3,原地跳跃抢空]
type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = var(5) = 1
TriggerAll = !InguardDist
Trigger1 = EnemyNear,Ctrl
Trigger1 = P2BodyDist X < 60 && fvar(37) > 0
Trigger1 = P2BodyDist Y = [-50, 0]
Trigger1 = EnemyNear,Vel Y < 0
Trigger1 = var(10) := 10
value = 39
IgnoreHitPause = 1

[State -3,后撤]
type = ChangeState
value = 105
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = var(5) = 1
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
TriggerAll = !(EnemyNear,StateType = L && P2BodyDist x < var(51))
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
Trigger7 = P2BodyDist x > 30
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

Trigger1 =(P2BodyDist X = [35,120]) || EnemyNear,facing = facing
Trigger1 = Random <= 50
Trigger1 = var(50) := 190501

Trigger2 = P2BodyDist X > 140
Trigger2 = Random <= 100
Trigger2 = var(50) := 190502

Trigger3 = BackEdgeBodyDist <= 20
Trigger3 = var(50) := 190503

;移动到合适的位置打敌人起身
Trigger4 = P2BodyDist x > 65
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
Trigger6 = P2BodyDist X >= var(51) && P2BodyDist X <= 95
IgnoreHitPause = 1

[State -3, 后退]
type = ChangeState
value = 18
TriggerAll = var(59) 
TriggerAll = RoundState = 2
TriggerAll = StateType != A
TriggerAll = BackEdgeBodyDist > 20
TriggerAll = !inguarddist
TriggerAll = !enemy,numproj
TriggerAll = Ctrl || StateNo = 1 || (StateNo = 19 && Time >= 12) || (StateNo = 99 && Time >= 12)
TriggerAll = !(EnemyNear,MoveType = H && EnemyNear,StateNo = [300,400]) 
TriggerAll = !(EnemyNear,StateType = L && P2BodyDist x > var(51))
TriggerAll = EnemyNear,Facing != Facing

Trigger1 = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159]))
Trigger1 = P2BodyDist X < 30
Trigger1 = var(50) := 180501

Trigger2 =(PrevStateNo = [140,155]) && P2BodyDist X <= 120
Trigger2 = Random <= 50
Trigger2 = var(50) := 180502

Trigger3 = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,Ctrl
Trigger3 = P2BodyDist x < 30
Trigger3 = var(50) := 180503

;移动到合适的位置打敌人起身
Trigger4 = !NumTarget(1400)
Trigger4 = P2BodyDist x < var(51)
Trigger4 = EnemyNear,StateType = L || EnemyNear,StateNo = 5120
Trigger4 = var(50) := 180504

IgnoreHitPause = 1


;-----------------------------------------------------------
;跳跃 
;-----------------------------------------------------------
[State -3,跳跃]
type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = var(5) = 1
TriggerAll = !inguarddist 
TriggerAll = Life >= 100
;前小跳躲投技
Trigger1 = P2BodyDist x < 90
Trigger1 = helper(33000),var(14) = 3
Trigger1 = var(10) := 1
Trigger1 = var(50) := 390501
;大跳起攻
Trigger2 = Time % 3 = 0 && EnemyNear,Vel X = 0
Trigger2 = EnemyNear,Ctrl
Trigger2 = !inguarddist
Trigger2 = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != A
Trigger2 = P2BodyDist x = [95, 110]
Trigger2 = var(10) := 4
Trigger2 = var(50) := 390502
;1倍X速度大跳起攻
Trigger3 = 0
Trigger3 = EnemyNear,Ctrl
Trigger3 = !inguarddist
Trigger3 = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != A
Trigger3 = P2BodyDist x < 80 && EnemyNear,BackEdgeBodyDist < 30
Trigger3 = var(10) := 3
Trigger3 = var(50) := 390503
;起攻打可能有的飞行道具
Trigger4 = !EnemyNear,Ctrl 
Trigger4 = EnemyNear,MoveType = A && EnemyNear,AnimTime <= -30
Trigger4 = P2BodyDist X < 125
Trigger4 = var(10) := ifelse(P2BodyDist X < 80, 3, 4)
Trigger4 = var(50) := 390504

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
TriggerAll = var(5) = 1
;打起身
Trigger1 = P2BodyDist x = [50, 90]
Trigger1 = EnemyNear,StateNo = 5120 && EnemyNear,animtime = [-19, -12]
Trigger1 = var(10) := 4
Trigger1 = var(50) := 390701
;打起身对手版边
Trigger2 = EnemyNear,BackEdgeBodyDist < 10 || FrontEdgeBodyDist < 80
Trigger2 = P2BodyDist x < 90
Trigger2 = EnemyNear,StateNo = 5120 && EnemyNear,animtime = [-19, -8]
Trigger2 = var(10) := 4
Trigger2 = var(50) := 390702
value = 39
IgnoreHitPause = 1

;=================================================================================
;立回3
;=================================================================================
[State -3,空Y]
type = ChangeState
value = 510
TriggerAll = var(59)
TriggerAll = Ctrl || StateNo = [120,149]
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对非版边地面
Trigger1 = EnemyNear,BackEdgeBodyDist >= 10 
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - Vel X * 5 = [-20, 22]
Trigger1 = P2BodyDist Y - Vel Y * 5 - const(movement.yaccel) * 5 * (5 + 1) / 2 <= ifelse(EnemyNear,StateType = C,55,70)
Trigger1 = (EnemyNear,MoveType = A && InguardDist) || fvar(9) = (5, 16]
Trigger1 = var(50) := 51031
;对版边地面
Trigger2 = EnemyNear,BackEdgeBodyDist < 10  || FrontEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x - Vel X * 5 < 22
Trigger2 = P2BodyDist Y - Vel Y * 5 - const(movement.yaccel) * 5 * (5 + 1) / 2 <= ifelse(EnemyNear,StateType = C,55,70)
Trigger2 = (EnemyNear,MoveType = A && InguardDist) || fvar(9) = (5, 16]
Trigger2 = var(50) := 51032
IgnoreHitPause = 1

[State -3,空B]
type = ChangeState
value = 530
TriggerAll = var(59)
TriggerAll = Ctrl || StateNo = [120,149]
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对非版边地面
Trigger1 = EnemyNear,BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - Vel X * 4 = [0, 40]
Trigger1 = P2BodyDist Y - Vel Y * 4 - const(movement.yaccel) * 4 * (4 + 1) / 2 <= ifelse(EnemyNear,StateType = C,55,70)
Trigger1 = fvar(9) = (4, 16]
Trigger1 = var(50) := 53031
;对版边地面
Trigger2 = EnemyNear,BackEdgeBodyDist < 10 || FrontEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x - Vel X * 4 < 40
Trigger2 = P2BodyDist Y - Vel Y * 4 - const(movement.yaccel) * 4 * (4 + 1) / 2 <= ifelse(EnemyNear,StateType = C,55,70)
Trigger2 = (EnemyNear,MoveType = A && InguardDist) || fvar(9) = (4, 16]
Trigger2 = var(50) := 53032
;对空
Trigger3 = EnemyNear,StateNo != 5040
Trigger3 = EnemyNear,StateType = A
Trigger3 = P2BodyDist x - Vel x * 4 - fvar(37) * 4 < 40
Trigger3 = P2BodyDist y - Vel Y * 4 - const(movement.yaccel) * 4 * (4 + 1) / 2 + EnemyNear,Vel Y * 4 + fvar(38) * 4 * (4 + 1) / 2 = [-40,45]
Trigger3 = (EnemyNear,MoveType = A && InguardDist) || fvar(9) > 4
Trigger3 = var(50) := 53033
IgnoreHitPause = 1


[State -3,空CD]
type = ChangeState
value = 610
TriggerAll = var(59)
TriggerAll = Ctrl || StateNo = [120,149]
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对非版边地面
Trigger1 = EnemyNear,MoveType != I ;抓硬直还是给JC/JD
Trigger1 = EnemyNear,BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - Vel X * 8 = [-25, 29]
Trigger1 = P2BodyDist Y - Vel Y * 8 - const(movement.yaccel) * 8 * (8 + 1) / 2 <= ifelse(EnemyNear,StateType = C,55,70)
Trigger1 = (EnemyNear,MoveType = A && InguardDist) || fvar(9) = [8, 16)
Trigger1 = var(50) := 61031
;对版边地面
Trigger2 = EnemyNear,MoveType != I ;抓硬直还是给JC/JD
Trigger2 = EnemyNear,BackEdgeBodyDist < 10 || FrontEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x - Vel X * 8 < 29
Trigger2 = P2BodyDist Y - Vel Y * 8 - const(movement.yaccel) * 8 * (8 + 1) / 2 <= ifelse(EnemyNear,StateType = C,55,70)
Trigger2 = (EnemyNear,MoveType = A && InguardDist) || fvar(9) = [8, 16)
Trigger2 = var(50) := 61032
;对空
Trigger3 = EnemyNear,StateNo != 5040
Trigger3 = EnemyNear,StateType = A
Trigger3 = P2BodyDist x - Vel x * 8 - fvar(37) * 8  < 29
Trigger3 = P2BodyDist y - Vel Y * 8 - const(movement.yaccel) * 8 * (8 + 1) / 2 + EnemyNear,Vel Y * 8 + fvar(38) * 8 * (8 + 1) / 2 = [-20,45]
Trigger3 = fvar(9) > 8
Trigger3 = var(50) := 61033
IgnoreHitPause = 1




[State -3,空A]
type = ChangeState
value = 520
TriggerAll = var(59)
TriggerAll = Ctrl || StateNo = [120,149]
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对非版边地面
Trigger1 = EnemyNear,BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist X - Vel X * 4 = [-10, 40]
Trigger1 = P2BodyDist Y - Vel Y * 4 - const(movement.yaccel) * 4 * (4 + 1) / 2 <= ifelse(EnemyNear,StateType = C,55,70)
Trigger1 = (EnemyNear,MoveType = A && InguardDist) || fvar(9) = (4, 6]
Trigger1 = var(50) := 52031
;对版边地面
Trigger2 = EnemyNear,BackEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x - Vel X * 4 < 40
Trigger2 = P2BodyDist y - Vel Y * 4 - const(movement.yaccel) * 4 * (4 + 1) / 2 <= ifelse(EnemyNear,StateType = C,55,70)
Trigger2 = (EnemyNear,MoveType = A && InguardDist) || fvar(9) = (4, 6]
Trigger2 = var(50) := 52032
;对空
Trigger3 = EnemyNear,StateNo != 5040
Trigger3 = EnemyNear,StateType = A
Trigger3 = P2BodyDist x - Vel x * 4 - fvar(37) * 4 < 40
Trigger3 = P2BodyDist y - Vel Y * 4 - const(movement.yaccel) * 4 * (4 + 1) / 2 + EnemyNear,Vel Y * 4 + fvar(38) * 4 * (4 + 1) / 2 = [-30,45]
Trigger3 = fvar(9) > 4
Trigger3 = var(50) := 52033
IgnoreHitPause = 1

[State -3,空X]
type = ChangeState
value = 500
TriggerAll = var(59)
TriggerAll = Ctrl || StateNo = [120,149]
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对非版边地面
Trigger1 = EnemyNear,BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - Vel X * 3 = [0, 50]
Trigger1 = P2BodyDist Y - Vel Y * 3 - const(movement.yaccel) * 3 * (3 + 1) / 2 <= ifelse(EnemyNear,StateType = C,60,80)
Trigger1 = (EnemyNear,MoveType = A && InguardDist) || fvar(9) = (3, 6]
Trigger1 = var(50) := 50031
;对版边地面
Trigger2 = EnemyNear,BackEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x - Vel X * 3 < 50
Trigger2 = P2BodyDist Y - Vel Y * 3 - const(movement.yaccel) * 3 * (3 + 1) / 2 <= ifelse(EnemyNear,StateType = C,60,80)
Trigger2 = (EnemyNear,MoveType = A && InguardDist) || fvar(9) = (4, 6]
Trigger2 = var(50) := 50032
;对空
Trigger3 = EnemyNear,StateNo != 5040
Trigger3 = EnemyNear,StateType = A
Trigger3 = P2BodyDist x - Vel x * 3 - fvar(37) * 3 < 43
Trigger3 = P2BodyDist y - Vel Y * 3 - const(movement.yaccel) * 3 * (3 + 1) / 2 + EnemyNear,Vel Y * 3 + fvar(38) * 3 * (3 + 1) / 2 = [-30,45]
Trigger3 = fvar(9) > 4
Trigger3 = var(50) := 50033
IgnoreHitPause = 1


[State -3,寄切]
type = ChangeState
value = 1200
TriggerAll = var(59)
TriggerAll = var(5) = [1,3]
TriggerAll = StateType != A
TriggerAll = EnemyNear,Facing != Facing
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = EnemyNear,NumProj = 0 && !PlayerIdExist(helper(33333333),var(3)) 
TriggerAll = EnemyNear,BackEdgeBodyDist >= 60
;对空
Trigger1 = EnemyNear,StateNo != 5040
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - fvar(37) * 23 = [-10, 54]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 23 + fvar(38) * 23 * (23 + 1) / 2 = [-2,1]
Trigger1 = var(50) := 120031
IgnoreHitPause = 1


;---------------------------------------------------------------------
; D投
[State -1]
type = ChangeState
value = 950
TriggerAll = var(59)
triggerall = var(5) = 1
TriggerAll = !inguarddist
TriggerAll = StateType != A
triggerall = P2MoveType != H && !P2StateType = A
TriggerAll = (EnemyNear,Facing != Facing && (P2BodyDist X = [0,15])) || (EnemyNear,Facing = Facing && (P2BodyDist X = [-15,0])) 

Trigger1 = EnemyNear,Vel Y = 0
Trigger1 = BackEdgeBodyDist < 80
Trigger1 = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120

Trigger2 = EnemyNear,StateNo = 52
IgnoreHitPause = 1

;---------------------------------------------------------------------
; C投
[State -1]
type = ChangeState
value = 900
TriggerAll = var(59)
triggerall = var(5) = 1
TriggerAll = !inguarddist
TriggerAll = StateType != A
triggerall = P2MoveType != H && !P2StateType = A
TriggerAll = (EnemyNear,Facing != Facing && (P2BodyDist X = [0,15])) || (EnemyNear,Facing = Facing && (P2BodyDist X = [-15,0])) 
Trigger1 = EnemyNear,Vel Y = 0
Trigger1 = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120

Trigger2 = EnemyNear,StateNo = 52
IgnoreHitPause = 1

;---------------------------------------------------------------------
; 挂投 指令投
[State -3]
type = ChangeState
value = 1300
TriggerAll = var(59)
TriggerAll = !inguarddist
TriggerAll = StateType != A
TriggerAll = EnemyNear,MoveType != I
triggerall = P2MoveType != H && P2StateType != A && P2StateType != L
TriggerAll = EnemyNear,StateNo != [150,155]
TriggerAll = (EnemyNear,Facing != Facing && (P2BodyDist X = [0,40])) || (EnemyNear,Facing = Facing && (P2BodyDist X = [-40,0])) 
TriggerAll = EnemyNear,Vel Y = 0
Trigger1 = var(5) = 1
Trigger1 = var(50) := 130031

Trigger2 = var(5) = [2, 3]
Trigger2 = EnemyNear,HitDefAttr = SCA,AT || helper(33000),var(11) = 3
Trigger2 = var(50) := 130032
IgnoreHitPause = 1

[State -3,五轮突弱]
type = ChangeState
value = 1600
TriggerAll = var(59)
TriggerAll = var(5) = [1,3]
TriggerAll = EnemyNear,Facing != Facing
TriggerAll = StateType != A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对空
Trigger1 = EnemyNear,StateNo != 5040
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - fvar(37) * 17 = [42, 57]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 17 + fvar(38) * 17 * (17 + 1) / 2 = [-25,-5]
Trigger1 = var(50) := 160031
;破飞行道具
;Trigger2 = P2BodyDist X < 80
Trigger2 = PlayerIdExist(helper(33333333),var(3)) 
Trigger2 = PlayerID(helper(33333333),var(3)), pos y > -100
Trigger2 = PlayerID(helper(33333333),var(3)), vel x != 0 
;distance / velocity = time >= startup time
Trigger2= (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) / (PlayerId(helper(33333333),var(3)),vel x) = [17, 25] ;5= startup time

IgnoreHitPause = 1

[State -3,五轮突强]
type = ChangeState
value = 1610
TriggerAll = var(59)
TriggerAll = var(5) = [1,3]
TriggerAll = StateType != A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对空
Trigger1 = EnemyNear,StateNo != 5040
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - fvar(37) * 19 = [45, 85]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 19 + fvar(38) * 19 * (19 + 1) / 2 = [-45,-20]
Trigger1 = var(50) := 161031
IgnoreHitPause = 1


[State -3,立Y]
type = ChangeState
value = 210
TriggerAll = var(59)
TriggerAll = var(5) = 1
TriggerAll = EnemyNear,Facing != Facing
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对空
Trigger1 = EnemyNear,StateNo != 5040
Trigger1 = BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - fvar(37) * 6 = [-13, 33]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 6 + fvar(38) * 6 * (6 + 1) / 2 = [-65,-20]
Trigger1 = var(50) := 021031
;版边对空
Trigger2 = EnemyNear,StateNo != 5040
Trigger2 = BackEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType = A
Trigger2 = P2BodyDist x - fvar(37) * 6 < 33
Trigger2 = EnemyNear,pos y + EnemyNear,Vel Y * 6 + fvar(38) * 6 * (6 + 1) / 2 = [-6,-20]
Trigger2 = var(50) := 021032
IgnoreHitPause = 1


[State -3,立X]
type = ChangeState
value = 200
TriggerAll = var(59)
TriggerAll = var(5) = 1
TriggerAll = EnemyNear,Facing != Facing
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对空
Trigger1 = EnemyNear,StateNo != 5040
Trigger1 = BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - fvar(37) * 4 = [-14, 31]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 4 + fvar(38) * 4 * (4 + 1) / 2 = [-45,-20]
Trigger1 = var(50) := 020031
;版边对空
Trigger2 = BackEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType = A
Trigger2 = P2BodyDist x - fvar(37) * 4 < 31
Trigger2 = EnemyNear,pos y + EnemyNear,Vel Y * 4 + fvar(38) * 4 * (4 + 1) / 2 = [-45,-20]
Trigger2 = var(50) := 020032
IgnoreHitPause = 1


[State -3,立A]
type = ChangeState
value = 220
TriggerAll = var(59)
TriggerAll = var(5) = 1
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对空
Trigger1 = EnemyNear,StateNo != 5040
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - fvar(37) * 4 =[0, 53]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 4 + fvar(38) * 4 * (4 + 1) / 2 = [-45,-20]
Trigger1 = var(50) := 022031
;对地
Trigger2 = var(44) != 220
Trigger2 = BackEdgeBodyDist > 30
Trigger2 = (P2BodyDist x >= 0 && EnemyNear,Facing != Facing) || (P2BodyDist x <= 0 && EnemyNear,Facing = Facing)
Trigger2 = Time % 4 = 0
Trigger2 = EnemyNear,StateType = S
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x - fvar(37) * 4 =[-53, 53]
Trigger2 = var(50) := 022032
Trigger2 = var(44) := 220
IgnoreHitPause = 1

[State -3,蹲X]
type = ChangeState
value = 300
TriggerAll = var(59)
TriggerAll = var(5) = 1
TriggerAll = StateType != A
TriggerAll = !inguarddist || (GameTime - var(46) < 2)
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对地
Trigger1 = var(44) != 300
Trigger1 = (P2BodyDist x >= 0 && EnemyNear,Facing != Facing) || (P2BodyDist x <= 0 && EnemyNear,Facing = Facing)
Trigger1 = Time % 5 = 0
Trigger1 = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
Trigger1 = P2BodyDist x = [-28, 28]
Trigger1 = var(50) := 030031
Trigger1 = var(44) := 300
IgnoreHitPause = 1

[State -3,蹲A]
type = ChangeState
value = 320
TriggerAll = var(59)
TriggerAll = var(5) = 1
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对地
Trigger1 = var(44) != 320
Trigger1 = BackEdgeBodyDist > 30 || random < 100
Trigger1 = (P2BodyDist x >= 0 && EnemyNear,Facing != Facing) || (P2BodyDist x <= 0 && EnemyNear,Facing = Facing)
Trigger1 = Time % 6 = 0
Trigger1 = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
Trigger1 = P2BodyDist x - fvar(37) * 5 = [-35, 35]
Trigger1 = var(50) := 032031
Trigger1 = var(44) := 320
IgnoreHitPause = 1


[State -3,蹲Y]
type = ChangeState
value = 310
TriggerAll = var(59)
TriggerAll = var(5) = 1
TriggerAll = EnemyNear,Facing != Facing
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对空
Trigger1 = EnemyNear,StateNo != 5040
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - fvar(37) * 12 = [40, 75]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 12 + fvar(38) * 12 * (12 + 1) / 2 = [-70,-20]
Trigger1 = var(50) := 031031
IgnoreHitPause = 1


;中途可以取消到必杀技！
[State -3,喉轮]
type = ChangeState
value = 760
TriggerAll = var(59)
TriggerAll = var(5) = 1
TriggerAll = EnemyNear,Facing != Facing
TriggerAll = StateType != A
TriggerAll = !inguarddist
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对地
Trigger1 = Life > EnemyNear,Life
Trigger1 = var(44) != 760
Trigger1 = Time % 3 = 0
Trigger1 = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
Trigger1 = P2BodyDist x  = [55, 65]
Trigger1 = var(50) := 076031
Trigger1 = var(44) := 760
;对空
Trigger2 = EnemyNear,StateType = A 
Trigger2 = P2BodyDist x - fvar(37) * 10 = [50, 70]
Trigger2 = EnemyNear,pos y + EnemyNear,Vel Y * 10 + fvar(38) * 10 * (10 + 1) / 2 = [-50,-20]
Trigger2 = var(50) := 076032

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
TriggerAll = power >= 1000
TriggerAll = stateno = [150,152]
TriggerAll = EnemyNear,MoveType = A && !EnemyNear,Ctrl
TriggerAll = helper(33000),var(11) != 3
TriggerAll = EnemyNear,facing != facing
TriggerAll = StateNo = [150,152]
TriggerAll = frontedgebodydist >= 60
;
Trigger1 = EnemyNear,life < 200 || life < 100 || power >= 2500 || EnemyNear,AnimTime < -36
Trigger1 = P2BodyDist x < 110
Trigger1 = EnemyNear,animtime < -23
Trigger1 = var(50) := 40000201
value = 4000
IgnoreHitPause = 1


[State -3,前滚]
type = changestate
TriggerAll = var(59)
TriggerAll = var(5) = 1
TriggerAll = roundstate = 2
TriggerAll = StateType != A 
TriggeaAll = FrontEdgeBodyDist >= 60
;攻击的前闪避
Trigger1 = inguarddist
Trigger1 = (EnemyNear,MoveType = A  || EnemyNear,MoveType = I)&& !EnemyNear,Ctrl
Trigger1 = helper(33000),var(11) != 3
Trigger1 = EnemyNear,facing != facing
Trigger1 = P2BodyDist x < 130
Trigger1 = EnemyNear,animtime < -33
Trigger1 = var(50) := 40500201
;闪避空中攻击
Triggea2 = FrontEdgeBodyDist >= 100
Trigger2 = fvar(11) > 17
Trigger2 = P2BodyDist x < 60
Trigger2 = EnemyNear,StateType = A 
Trigger2 = EnemyNear,Facing != Facing
Trigger2 = P2BodyDist x - fvar(37) * 8 < 0
Trigger2 = var(50) := 40500202
;闪避飞行道具
Trigger3 = EnemyNear,animtime < -33 || P2BodyDist X > 160
Trigger3 = EnemyNear,MoveType = A
Trigger3 = inguarddist
Trigger3 = PlayerIdExist(helper(33333333),var(3)) 
Trigger3 = ifelse(facing = 1, PlayerID(helper(33333333),var(3)), pos x > pos x, PlayerID(helper(33333333),var(3)), pos x < pos x)
Trigger3 = PlayerID(helper(33333333),var(3)), Vel x > 0
;distance / Velocity = time = startup time + active 
Trigger3 = (((PlayerID(helper(33333333),var(3)), pos x - pos x )* facing) - const(size.ground.front) - PlayerID(helper(33333333),var(3)),const(size.ground.front)) < 60
Trigger3 = var(50) := 40500203
value = 4050
IgnoreHitPause = 1

[State -3,后滚]
type = changestate
TriggerAll = var(59)
TriggerAll = roundstate = 2
TriggerAll = StateType != A 
TriggerAll = Ctrl || StateNo = 1 || StateNo = 18 || StateNo = 19 || StateNo = 99 || StateNo = 101
TriggerAll = EnemyNear,MoveType = A && !EnemyNear,Ctrl
TriggerAll = helper(33000),var(11) != 3
TriggerAll = EnemyNear,facing != facing
TriggerAll = BackEdgeBodyDist >= 60
TriggerAll = inguarddist
TriggerAll = !EnemyNear,numproj && !PlayerIdExist(helper(33333333),var(3))
;对方攻击的距离大于我们能攻击到的最大距离，就后撤一下
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x > 60
Trigger1 = EnemyNear,animtime = [-30, -6]
Trigger1 = var(50) := 41500201

Trigger2 = P2BodyDist x = [45,80]
Trigger2 = EnemyNear,StateType = A
Trigger2 = fvar(37) > 0
Trigger2 = EnemyNear,Vel y < 0
Trigger2 = EnemyNear,pos y <= -60
Trigger2 = var(50) := 41500202

value = 4150
IgnoreHitPause = 1


[State -3,刚CD]
type = ChangeState
value = 4500
TriggerAll = var(59)
TriggerAll = StateNo = 150 || StateNo = 152
TriggerAll = power >= 4000 || EnemyNear,life < 50 
TriggerAll = EnemyNear,animtime < -11
TriggerAll = !EnemyNear,Ctrl && EnemyNear,MoveType = A
;对空
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - fvar(37) * 8 = [-4, 40]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 8 + fvar(38) * 8 * (8 + 1) / 2 >= -60
Trigger1 = var(50) := 45000201
;对地
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x - fvar(37) * 8 = [-4, 40]
Trigger2 = var(50) := 45000202
IgnoreHitPause = 1

[State -3, 落地受身]
type = ChangeState
value = 5200
TriggerAll = Alive
TriggerAll = Life >= 1
TriggerAll = pos y >= -20
Trigger1 = StateNo = 5050
Trigger2 = StateNo = 5071
IgnoreHitPause = 1

;=================================================================================
;防御1
;=================================================================================
[State -1, guard]
type = changestate
value = 120
TriggerAll = var(59) 
TriggerAll = roundstate = 2
TriggerAll = !EnemyNear, hitdefattr = SCA,AT
TriggerAll = Ctrl || StateNo = 1 || StateNo = 99 || StateNo = 19 || StateNo = 18 || StateNo = 101
Trigger1 = inguarddist
Trigger1 = StateType != A || (StateType = A && helper(33000),var(11) != 4)
Trigger1 = var(50) := 012011

Trigger2 = P2BodyDist X=[-50,50]
Trigger2 = NumHelper(33000)>0
Trigger2 = Helper(33000),InguardDist
Trigger2 = Facing*EnemyNear,Facing!=-1 || P2Dist X<0
Trigger2 = var(50) := 012012
IgnoreHitPause = 1

