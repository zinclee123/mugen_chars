;=================================================================================
;State0代替
;=================================================================================
[Statedef 1]
Type = S
physics = S
sprpriority = 2
velset = 0,0
ctrl = 0

[State 1]
Type = ChangeState
Trigger1 = RoundState != 2
Trigger2 = P2BodyDist x < 0
value = 0
Ctrl = 1
IgnoreHitPause = 1

[State -2]
Type = PosSet
Trigger1 = Time = 0
y = 0

[State -2]
Type = DestroySelf
Trigger1 = IsHelper
IgnoreHitPause = 1

[State 0, pause reset(intro)]
Type = Pause
Trigger1 = Time = 0
Trigger1 = PrevStateNo = 191
time = 0

[State -2];対フライング
Type = NotHitBy
Trigger1 = !var(7)
value = SCA
time = 1

[State 0, 1]
Type = ChangeAnim
Trigger1 = Anim != (0+(fvar(29)=3||fvar(29)=6)) && Anim != 5
Trigger2 = Anim = 5 && AnimTime = 0 ;Turn anim over
value = (0+(fvar(29)=3||fvar(29)=6))

[State 0, 2]
Type = VelSet
Trigger1 = Time = 0
y = 0

[State 0, 3] ;Stop moving if low velocity or 4 ticks pass
Type = VelSet
Trigger1 = abs(vel x) < 2
Trigger2 = Time = 4
x = 0

[State 0, 4] ;Are you dead?
Type = ChangeState
Trigger1 = !alive
value = 5050

;=================================================================================
;AI用前行
;=================================================================================
[Statedef 19]
Type    = S
physics = S
sprpriority = 2

[State 21, 1]
Type = Turn
Trigger1 = EnemyNear,MoveType != H
Trigger1 = P2Dist X < 0

[State 20]
Type = varSet
Trigger1 = Time = 0
Trigger1 = EnemyNear(var(2)),BackEdgeBodyDist <= 0
Trigger1 = EnemyNear(var(2)),StateType != A
Trigger1 = PrevStateNo = 52
fvar(1) = Vel X

[State 20]
Type = VelAdd
TriggerAll = fvar(1)
Trigger1 = Floor(fvar(1)*0.82**(Time)) < 0
x = Floor(fvar(1)*0.82**(Time))

[State 20, 1]
Type = VelSet
Trigger1 = 1
x = const(velocity.walk.fwd.x)*(1+(fvar(32)=2||!(fvar(29)=1||fvar(29)=4))*IfElse((fvar(29)=3||fvar(29)=6),0.5,0.3))

[State 20, 3]
Type = ChangeAnim
TriggerAll = vel x > 0
Trigger1 = Anim != 20 && Anim != 5
Trigger2 = Anim = 5 && AnimTime = 0
value = 20

[State 19, Exit]
Type = ChangeState
TriggerAll = Time >= 16
Trigger1 = RoundState != 2
Trigger1 = var(50) := 1111901
;
Trigger2 = EnemyNear,Ctrl
Trigger2 = P2BodyDist X <= 35
Trigger2 = var(50) := 1111902
;
Trigger3 = frontedgebodydist <= 20
Trigger3 = var(50) := 1111903
;
Trigger4 = InGuardDist
Trigger4 = EnemyNear,facing != facing
Trigger4 = var(50) := 1111904
;
Trigger5 = Time >= 120
Trigger5 = var(50) := 1111905
;
Trigger6 = EnemyNear,StateType != A
Trigger6 = EnemyNear,facing = facing 
Trigger6 = var(50) := 1111906
;为打起身做准备
Trigger7 = EnemyNear,StateType = L
Trigger7 = !EnemyNear,Ctrl
Trigger7 = P2BodyDist x <= 80
Trigger7 = var(50) := 1111907
;贴身打受击硬直
Trigger8 = EnemyNear,StateType != A
Trigger8 = EnemyNear,StateType != L
Trigger8 = EnemyNear,MoveType = H
Trigger8 = P2BodyDist X <= 5
Trigger8 = var(50) := 1111908
;敌人向我们飞来
Trigger9 = Fvar(12) > 0
Trigger9 = EnemyNear,StateType = A
Trigger9 = EnemyNear,MoveType = H
Trigger9 = P2BodyDist X <= 80
Trigger9 = var(50) := 1111909
;敌人远离我们飞走
Trigger10 = Fvar(12) < 0
Trigger10 = EnemyNear,StateType = A
Trigger10 = EnemyNear,MoveType = H
Trigger10 = P2BodyDist X <= 40
Trigger10 = var(50) := 1111910
value = IfElse(var(59)=0,0,1)
ctrl = IfElse(var(59)=0,1,0)


;=================================================================================
;AI用后退
;=================================================================================
[Statedef 18]
Type    = S
physics = S
sprpriority = 2

[State 20]
Type = varSet
Trigger1 = Time = 0
Trigger1 = EnemyNear(var(2)),BackEdgeBodyDist <= 0
Trigger1 = EnemyNear(var(2)),StateType != A
Trigger1 = PrevStateNo = 52
fvar(1) = Vel X

[State 20]
Type = VelAdd
TriggerAll = fvar(1)
Trigger1 = Floor(fvar(1)*0.82**(Time)) < 0
x = Floor(fvar(1)*0.82**(Time))


[State 20, 1]
Type = VelSet
Trigger1 = 1
x = const(velocity.walk.back.x)*(1+(fvar(32)=2||!(fvar(29)=1||fvar(29)=4))*IfElse((fvar(29)=3||fvar(29)=6),0.5,0.3))

[State 20, 4]
Type = ChangeAnim
TriggerAll = vel x < 0
Trigger1 = Anim != 21 && Anim != 5
Trigger2 = Anim = 5 && AnimTime = 0
value = 21

[State 18, Exit]
Type = ChangeState
TriggerAll = Time >= 12
;
Trigger1 = RoundState != 2
Trigger1 = var(50) := 1111801
;
Trigger2 = InGuardDist
Trigger2 = EnemyNear,facing != facing
Trigger2 = var(50) := 1111802
;
Trigger3 = Time >= 120
Trigger3 = var(50) := 1111803
;
Trigger4 = P2BodyDist X >= 180
Trigger4 = var(50) := 1111804
;
Trigger5 = BackEdgeBodyDist <= 20
Trigger5 = var(50) := 1111805
;
Trigger6 = EnemyNear,MoveType = A || EnemyNear,Ctrl
Trigger6 = EnemyNear,facing = facing 
Trigger6 = var(50) := 1111806
;为打起身做准备
Trigger7 = Time >= 12
Trigger7 = EnemyNear,StateType = L
Trigger7 = !EnemyNear,Ctrl
Trigger7 = P2BodyDist x >= 60
Trigger7 = var(50) := 1111807
;敌人向我们飞来
Trigger8 = Fvar(12) > 0
Trigger8 = EnemyNear,StateType = A
Trigger8 = EnemyNear,MoveType = H
Trigger8 = P2BodyDist x >= 90
Trigger8 = var(50) := 1111808
;敌人远离飞去
Trigger9 = Fvar(12) < 0
Trigger9 = EnemyNear,StateType = A
Trigger9 = EnemyNear,MoveType = H
Trigger9 = P2BodyDist x >= 50
Trigger9 = var(50) := 1111809

value = IfElse(var(59)=0,0,1)
ctrl = IfElse(var(59)=0,1,0)

;=================================================================================
; 起跳
;=================================================================================
[Statedef 39]
Type    = S
physics = S
anim = 40
ctrl = 0
velset = 0,0
sprpriority = 2

[State 40]
Type = NotHitBy
Trigger1 = 1
value = ,AT
time = 1

[State 40, turn]
Type = ChangeAnim
Trigger1 = Time = 0
Trigger1 = P2Dist X < -20
value = 45

[State 40, 1]
Type = varSet
Trigger1 = Time = 0
Trigger1 = var(4) = [1,4]
sysvar(1) = 1

[State 40, 3]
Type = varSet
Trigger1 = Time = 0
Trigger1 = var(4) = [5,8]
sysvar(1) = -1

[State 40, 1]
Type = varSet
Trigger1 = Time = 0
Trigger1 = var(4) = [9,10]
sysvar(1) = 0

[State 40, 前小跳]
Type = VelSet
Trigger1 = AnimTime = 0
Trigger1 = var(4) = 1
x = const(velocity.jump.fwd.x)
y = const(velocity.jump.y) * 0.75

[State 40, 前小影跳]
Type = VelSet
Trigger1 = AnimTime = 0
Trigger1 = var(4) = 2
x = const(velocity.runjump.fwd.x)
y = const(velocity.jump.y) * 0.75

[State 40, 前大跳]
Type = VelSet
Trigger1 = AnimTime = 0
Trigger1 = var(4) = 3
x = const(velocity.jump.fwd.x)
y = const(velocity.jump.y)

[State 40, 前大影跳]
Type = VelSet
Trigger1 = AnimTime = 0
Trigger1 = var(4) = 4
x = const(velocity.runjump.fwd.x)
y = const(velocity.jump.y)


[State 40, 后小跳]
Type = VelSet
Trigger1 = AnimTime = 0
Trigger1 = var(4) = 5
x = const(velocity.jump.back.x)
y = const(velocity.jump.y) * 0.75

[State 40, 后小影跳]
Type = VelSet
Trigger1 = AnimTime = 0
Trigger1 = var(4) = 6
x = const(velocity.runjump.back.x)
y = const(velocity.jump.y) * 0.75

[State 40, 后大跳]
Type = VelSet
Trigger1 = AnimTime = 0
Trigger1 = var(4) = 7
x = const(velocity.jump.back.x)
y = const(velocity.jump.y)

[State 40, 后大影跳]
Type = VelSet
Trigger1 = AnimTime = 0
Trigger1 = var(4) = 8
x = const(velocity.runjump.back.x)
y = const(velocity.jump.y)


[State 40, 垂直小跳]
Type = VelSet
Trigger1 = AnimTime = 0
Trigger1 = var(4) = 9
x = 0
y = const(velocity.jump.y) * 0.75

[State 40, 垂直大跳]
Type = VelSet
Trigger1 = AnimTime = 0
Trigger1 = var(4) = 10
x = 0
y = const(velocity.jump.y) 

[State 40, end]
Type = ChangeState
Trigger1 = AnimTime = 0
value = 38
ctrl = 1

;=================================================================================
; 空中
;=================================================================================
[Statedef 38]
Type    = A
physics = A

[State 50, turn]
Type = Turn
Trigger1 = Time = 0
Trigger1 = P2Dist X < -20

[State 50, snd]
Type = PlaySnd
Trigger1 = Time = 0
value = S0,(0+(var(3) > 0))

[State 50, 1]
Type = varSet
Trigger1 = Time = 0
sysvar(1) = 0

[State 50, 0]
Type = afterimage
TriggerAll = Time = 0
Trigger1 = var(4) = 2
Trigger2 = var(4) = 4
Trigger3 = var(4) = 6
Trigger4 = var(4) = 8
time = 25
length = 12
palinvertall = 0
palcontrast = 256, 256, 256
palbright = 0, 0, 0
palpostbright = -25, 0, 0
paladd = 0, 0, 0
palmul = 1, 1, 1
FrameGap = 3
IgnoreHitPause = 1

[State 50, 2]
Type = ChangeAnim
Trigger1 = Time = 0
value = IfElse(var(4)=1||var(4)=2||var(4)=5||var(4)=6||var(9),44,IfElse((vel x)=0, 41, IfElse((vel x)>0, 42, 43)))

[State 50, end]
Type = ChangeState
Trigger1 = Pos Y >= 0 && Vel Y > 0
value = 52

;=================================================================================
; 前跑
;=================================================================================
[Statedef 99]
Type    = S
physics = S
anim = 100
ctrl = 0
velset = 0,0
sprpriority = 2

[State 100, snd];要調整
Type = PlaySnd
Trigger1 = AnimElem = 2
value = S0,3
loop = 1
channel = 1

[State 100, 1];要調整
Type = VelSet
Trigger1 = AnimElem = 2, >= 0
x = const(velocity.run.fwd.x)*(1+(fvar(29)=3||fvar(29)=6)*0.5)

[State 100, 2] ;Prevent run from canceling into walk
Type = AssertSpecial
Trigger1 = 1
flag = NoWalk

[State 100, 3] ;Prevent from turning
Type = AssertSpecial
Trigger1 = 1
flag = NoAutoTurn

[State 101, 6]
Type = ChangeState
TriggerAll = Time >= 12
;
Trigger1 = AnimTime = 0
Trigger1 = var(50) := 1119901
;对方可控的情况下，不要跑太近
Trigger2 = P2BodyDist X <= 40
Trigger2 = P2BodyDist Y >= -120
Trigger2 = EnemyNear,MoveType != H && (EnemyNear,Ctrl || EnemyNear,StateNo < 200)
Trigger2 = EnemyNear,facing != facing || P2BodyDist X < 0
Trigger2 = var(50) := 1119902
;
Trigger3 = InGuardDist
Trigger3 = EnemyNear,facing != facing
Trigger3 = var(50) := 1119903
;
Trigger4 = !EnemyNear,Ctrl && EnemyNear,MoveType = I
Trigger4 = P2BodyDist x < 20
Trigger4 = var(50) := 1119904
;
Trigger5 = EnemyNear,StateType != L
Trigger5 = EnemyNear,StateType != A
Trigger5 = EnemyNear,MoveType = H
Trigger5 = P2BodyDist x <= 30
Trigger5 = var(50) := 1119905
;
Trigger6 = EnemyNear,MoveType = A && InGuardDist
Trigger6 = EnemyNear,Facing != Facing
Trigger6 = P2BodyDist x < 75
Trigger6 = var(50) := 1119906
;落地受身
Trigger7 = (var(16)&2**3)  = 1
Trigger7 = P2BodyDist x < 40
Trigger7 = var(50) := 1119907
;敌人向我们飞来
Trigger8 = Fvar(12) > 0
Trigger8 = EnemyNear,StateType = A
Trigger8 = EnemyNear,MoveType = H
Trigger8 = P2BodyDist x < 90
Trigger8 = var(50) := 1119908
;敌人飞离我们
Trigger9 = Fvar(12) < 0
Trigger9 = EnemyNear,StateType = A
Trigger9 = EnemyNear,MoveType = H
Trigger9 = P2BodyDist x < 50
Trigger9 = var(50) := 1119909
value = 101

[State 101, 6]
Type = ChangeState
TriggerAll = Time >= 6
;敌人飘到身后
Trigger1 = EnemyNear,StateType = A
Trigger1 = EnemyNear,MoveType = H
Trigger1 = P2BodyDist x < -30
Trigger1 = var(50) := 1119910
value = 101











































[Statedef -3]

;---------------------------------------------------------------------------------
;跳跃挤压处理
;拳皇体积框只到胸口位置，这里需要计算下
;---------------------------------------------------------------------------------
[State -3,]
Type = PlayerPush
Trigger1 = P2BodyDist x > 35
Trigger2 = StateType != A
Trigger3 = EnemyNear,MoveType = H
Trigger4 = MoveType = H
Trigger5 = StateType = L
Trigger6 = EnemyNear,Facing = Facing
Trigger6 = P2BodyDist x < 0
value = 1

[State -3,]
Type = PlayerPush
Trigger1 = P2BodyDist x < 35
Trigger1 = StateType = A
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist Y >= 20
Trigger1 = EnemyNear,MoveType != H
value = 0

;=================================================================================
;AI Helper
;=================================================================================
[State -3]
Type = Helper
Trigger1 = !numHelper(33000)
HelperType = normal
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
Type=ChangeState
Trigger1= isHelper(33000)
Trigger1= StateNo!=33000
value=33000

[State -3]
Type = Helper
Triggerall = !isHelper
Trigger1 = !numHelper(33001)
HelperType = normal
name = "AI Right"
ID = 33001
StateNo=33001
PosType = p1
Facing = -1
Pausemovetime = 0
Persistent = 0
IgnoreHitPause = 1
KeyCtrl = 0
Ownpal = 1

[State -3]
Type=ChangeState
Trigger1= isHelper(33001)
Trigger1= StateNo!=33001
value=33001

[State -3]
Type = Helper
Triggerall = !isHelper
Trigger1 = !numHelper(33002)
HelperType = normal
name = "AI left"
ID = 33002
StateNo=33002
PosType = p1
Facing = 1
Pausemovetime = 0
Persistent = 0
IgnoreHitPause = 1
KeyCtrl = 0
Ownpal = 1

[State -3]
Type=ChangeState
Trigger1= isHelper(33002)
Trigger1= StateNo!=33002
value=33002

[State -3]
Type = Helper
Trigger1 = !numHelper(11990)
HelperType = normal
name = "csx"
ID = 11990
StateNo=11990
PosType = p1
Facing = 1
KeyCtrl = 0
Ownpal = 1
supermovetime = 2147483647
pausemovetime = 2147483647
IgnoreHitPause = 1

[State -3]
Type=ChangeState
Trigger1= isHelper(11990)
Trigger1= StateNo!=11990
value=11990

[state -3, AI Detect Projectile System]
Type = Helper
Trigger1 = !numHelper(33333333)
name = "AI Detect Projectile System"
ID = 33333333
StateNo = 33333333
posType = p1
ownpal = 1
keyCtrl = 0
size.xscale = 1.0
size.yscale = 1.0
supermovetime = 2147483647
pausemovetime = 2147483647
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;白罗鞭尸
;---------------------------------------------------------------------------------
[State -3]
Type = ChangeState
TriggerAll = helper(33000),var(14) != 2400
TriggerAll = EnemyNear,Alive = 0
TriggerAll = WinKo
TriggerAll = RoundState = 3
TriggerAll = StateType != A
TriggerAll = var(9) = 0
TriggerAll = (EnemyNear,StateType = A && EnemyNear,Pos Y < -75) || (EnemyNear,StateType != A && MoveContact)
Trigger1 = ctrl
Trigger2 = StateNo = 1300
Trigger3 = StateNo = [200,499]
value = 2400

;=================================================================================
;变量设置
;=================================================================================

;---------------------------------------------------------------------------------
;AI Start
;1. 刚CD处理没加
;---------------------------------------------------------------------------------
[State -3]
Type = varSet
Trigger1 = RoundState = 2 && EnemyNear,alive && EnemyNear,life > 0
;Trigger1 = movehit || enemynear,moveType = h
var(59) = 1
IgnoreHitPause = 1

[State -3]
Type = varSet
Trigger1 = RoundState != 2 || EnemyNear,life = 0 || !EnemyNear,alive
var(59) = 0
IgnoreHitPause = 1


;---------------------------------------------------------------------------------
;距离前版边绝对距离计算
;---------------------------------------------------------------------------------
[State -3]
Type = varSet
TriggerAll = !isHelper
Trigger1 = !isHelper
fvar(15) = IfElse(Facing > 0, Helper(33001),rootdist x, Helper(33002),rootdist x)

;==================================================================================
;布尔类型集合
;2**0 剪刀脚切返失败记录 原var(16)
;2**1 绝情打击连段失败记录,一般因为对方身姿太低 原fvar(17)
;2**2 耗气闪避判别 原var(41)
;2**3 落地受身判别 原var(39)
;2**4 死亡突袭切返失败记录/凯撒波失败记录,原fvar(5)
;2**5 剪刀脚击中被对面高空受身/脱离，原fvar(19)
;2**6 投技不中
;2**7 刚CD判定
;2**8 前AB可行判定
;==================================================================================
[State -3,剪刀脚切返失败记录]
Type = varSet
Triggerall = StateNo = 1300
Triggerall = MoveType = A 
Triggerall = AnimElemTime(12) < 0
Triggerall = var(50) = 130072
Triggerall = EnemyNear,StateType != A
Trigger1 = P2BodyDist x = [-10,85]
Trigger1 = EnemyNear,MoveType != H
Trigger2 = EnemyNear,MoveType = H
Trigger2 = EnemyNear,StateNo = [120,159]
var(16) = var(16) | 2**0

;---------------------------------------------------------------------------------
[State -3,绝情打击连段失败记录，失败后改用毁灭压杀]
Type = varSet
Triggerall = var(50) = 145061
Trigger1= StateNo = 1450 && EnemyNear,MoveType != H
var(16) = var(16) | 2**1
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
[State -3,耗气闪避判别Reset]
Type = varSet
Triggerall = var(16)&2**2
Trigger1 = EnemyNear,MoveType = H
Trigger2 = EnemyNear,StateType = A
Trigger3 = EnemyNear,MoveType = A
Trigger4 = EnemyNear,StateType = L
Trigger5 = EnemyNear,Ctrl 
var(16) = var(16)^(2**2)
IgnoreHitPause = 1

[State -3,耗气闪避判别]
Type = varSet
Trigger1 = EnemyNear,PrevStateNo = [150,153]
Trigger1 = EnemyNear,MoveType = I
Trigger1 = EnemyNear,StateNo < 5000
Trigger1 = EnemyNear,StateType != A
Trigger1 = StateType != A
Trigger1 = MoveType = A
Trigger1 = P2BodyDist x = [-30,60]
Trigger1 = EnemyNear,Vel x = [0,9]
var(16) = var(16)|2**2
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
[State -3,落地受身判别Reset]
Type = varSet
Triggerall = var(16)&2**3
TriggerAll = EnemyNear,PrevStateNo != 5050
Trigger1 = EnemyNear,MoveType = A
Trigger2 = EnemyNear,StateType = L
Trigger3 = EnemyNear,Ctrl 
Trigger4 = InGuardDist
var(16) = var(16) ^ 2**3
IgnoreHitPause = 1

[State -3,落地受身设置]
Type = varSet
TriggerAll = !InGuardDist
;直接切状态
Trigger1 = EnemyNear,PrevStateNo = 5050 && EnemyNear,StateNo != 5100
Trigger1 = EnemyNear,Vel x != 0
;常用受身
Trigger2 = EnemyNear,StateNo = [5200,5203]
var(16) = var(16) | 2**3
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
[State -3,死亡突袭切返失败记录/凯撒波失败记录,说明对方能空振]
Type = varSet
Triggerall = EnemyNear,MoveType != H
Triggerall = EnemyNear,StateType != A

Trigger1 = AnimElemTime(11) > 2
Trigger1 = StateNo = 2250 
Trigger1 = var(50) = 225071

Trigger2 = AnimElemTime(11) > 2
Trigger2 = StateNo = 2300
Trigger2 = var(50) = 230071

Trigger3 = PrevStateNo = 1010
Trigger3 = MoveType = H
Trigger3 = !EnemyNear,MoveContact||P2BodyDist x>160
var(16) = var(16)|2**4
IgnoreHitPause = 1

;-----------------------------------------------------------
[State -3,剪刀脚击中被对面高空脱离/受身]
Type = varSet
Trigger1 = Numtarget(1300) || NumTarget(1301)
Trigger1 = EnemyNear,PrevStateNo = [1320,1321]
Trigger1 = EnemyNear,MoveType = I
Trigger1 = EnemyNear,Pos Y < -20
var(16) = var(16)|2**5
IgnoreHitPause = 1

;-----------------------------------------------------------
[State -3,投技不中]
Type = varSet
Trigger1 = StateNo = 235
Trigger1 = var(50) = [85031,85032]
Trigger2 = StateNo = 215
Trigger2 = var(50) = [80031,80032]
var(16) = var(16) | 2**6
IgnoreHitPause = 1

;-----------------------------------------------------------
[State -3,刚CD判定Reset]
Type = varSet
Trigger1 = EnemyNear,MoveType != A
Trigger2 = EnemyNear,StateType = L
Trigger3 = EnemyNear,Ctrl 
var(16) = var(16) ^ 2**7
IgnoreHitPause = 1

[State -3,刚CD判定]
Type = varSet
Trigger1 = EnemyNear,PrevStateNo=[150,155]
Trigger1 = Enemynear,MoveType=A&&EnemyNear,Time<=1
var(16) = var(16)|2**7
IgnoreHitPause = 1


;-----------------------------------------------------------
;AB条件
;普通AB P2BodyDist x<64可以闪避到敌人身后
;跑步AB P2BodyDist x<95可以闪避到敌人身后
;加速规则 跑步启动2F+4F移动时间+跑步AB移动距离137足够闪避到敌人身后

[State -3,前AB可行 Reset]
Type = varSet
Triggerall = var(16)&2**8
Trigger1 = EnemyNear,MoveType = H
Trigger2 = EnemyNear,Ctrl
Trigger3 = EnemyNear,MoveType = I
Trigger4 = EnemyNear,StateType = L
Trigger5 = EnemyNear,MoveType=A&&EnemyNear,Time>=10
var(16) = var(16)^(2**8)
IgnoreHitPause = 1


[State -3,前AB可行 Reset]
Type = varSet
Triggerall = EnemyNear,StateType!=A
Triggerall = EnemyNear,MoveType=A
Triggerall = EnemyNear,Time<=2
Triggerall = EnemyNear,AnimTime<-33
Triggerall = EnemyNear,StateNo=[1000,1999]
Triggerall = P2BodyDist x < 160
;已经在跑步模式
Trigger1 = StateNo=[99,101]
Trigger1 = P2BodyDist x - ((10-EnemyNear,Time-2)*5.1) < 95
;不在跑步模式，但是启动1F
Trigger2 = P2BodyDist x - ((10-EnemyNear,Time-3)*5.1) < 95
;直接AB
Trigger3 = P2BodyDist x < 64
var(16) = var(16)|2**8
IgnoreHitPause = 1



;==================================================================================
;攻击修正用
;非爆气状态			1
;原地爆气/BC断连 	0.6
;BC连中				0.4
;==================================================================================
[State -3]
Type = varSet
Trigger1 = var(52) = 0
fvar(39) = 1 * IfElse(EnemyNear,MoveType = A,1.06,1)
IgnoreHitPause = 1

[State -3]
Type = varSet
TriggerAll = var(52) 
Trigger1 = EnemyNear,MoveType != H 
Trigger2 = EnemyNear,Ctrl 
fvar(39) = 0.6 * IfElse(EnemyNear,MoveType = A,1.06,1)
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;计算敌方X方向速度
;---------------------------------------------------------------------------------
[State -3]
Type = varSet
TriggerAll = !isHelper
Trigger1 = EnemyNear,MoveType!=H
fvar(12) = -Facing*EnemyNear,Facing*EnemyNear,Vel x
IgnoreHitPause = 1

[State -3]
Type = varSet
TriggerAll = !isHelper
Trigger1 = EnemyNear,MoveType=H
fvar(12) = -Facing*EnemyNear,gethitvar(xVel)
IgnoreHitPause = 1

[State -3]
Type = varSet
TriggerAll = !isHelper
Trigger1 = EnemyNear,StateNo = 1471
Trigger1 = EnemyNear,MoveType = H
Trigger1 = EnemyNear,StateType = A
Trigger1 = EnemyNear,Time > 3
fvar(12) = EnemyNear,Vel x*EnemyNear,Facing*Facing
IgnoreHitPause = 1



;---------------------------------------------------------------------------------
;计算敌方重力加速度
;---------------------------------------------------------------------------------
[State -3]
Type = varSet
TriggerAll = !isHelper
Trigger1 = !MoveContact
Trigger1 = EnemyNear,StateType = A
fvar(13) = EnemyNear,const(movement.yaccel)
IgnoreHitPause = 1

[State -3]
Type = varSet
TriggerAll = !isHelper
Trigger1 = MoveContact
Trigger1 = EnemyNear,StateType = A
fvar(13) = EnemyNear,gethitvar(yaccel)
IgnoreHitPause = 1

[State -3]
Type = varSet
TriggerAll = !isHelper
Trigger1 = EnemyNear,StateNo = 1471
Trigger1 = EnemyNear,MoveType = H
Trigger1 = EnemyNear,StateType = A
Trigger1 = EnemyNear,Time > 3
fvar(13) = 0.55
IgnoreHitPause = 1

[State -3]
Type = varSet
TriggerAll = !isHelper
Trigger1 = EnemyNear,StateNo = 1321
Trigger1 = EnemyNear,MoveType = H
Trigger1 = EnemyNear,StateType = A
fvar(13) = 0.52
IgnoreHitPause = 1

[State -3]
Type = varSet
TriggerAll = !isHelper
Trigger1 = MoveContact
Trigger1 = EnemyNear,StateType != A
fvar(13) = 0
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;计算敌人落地时间
;---------------------------------------------------------------------------------
[State -3, ];t=(-v0+√(v0^2-2a(x0-x)))/a
Type = varSet
Trigger1= 1
TriggerAll = !isHelper
;fvar(9)= (-vel y+(vel y**2-2*const(movement.yaccel)*IfElse(pos y>0,0,pos y-0))**.5)/const(movement.yaccel)
fvar(11)= (-EnemyNear,vel y+(EnemyNear,vel y**2-2*fvar(13)*IfElse(EnemyNear,pos y>0,0,EnemyNear,pos y-0))**.5)/fvar(13)
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;计算自己落地时间
;---------------------------------------------------------------------------------
[State -3, 落地时间];t=(-v0+√(v0^2-2a(x0-x)))/a
Type = varSet
Trigger1= 1
TriggerAll = !isHelper
;fvar(9)= (-vel y+(vel y**2-2*const(movement.yaccel)*IfElse(pos y>0,0,pos y-0))**.5)/const(movement.yaccel)
fvar(9)= (-vel y+(vel y**2-2*const(movement.yaccel)*IfElse(pos y>0,0,pos y-0))**.5)/const(movement.yaccel)
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;升龙脚升了几次
;---------------------------------------------------------------------------------
[State -3, Reset]
Type = varSet
Trigger1 = Helper(33000),var(14) != 1300 && Helper(33000),var(14) != 1301 
Trigger2 = EnemyNear,MoveType != H
Trigger3 = RoundState != 2
Trigger4 = EnemyNear,Ctrl 
Trigger5 = StateNo = 2400
var(38) = 0

[State -3, ]
Type = varadd
TriggerAll = !isHelper
Trigger1 = StateNo = 1300 && HitCount = 1 && MoveHit = 1
var(38) = 1

;---------------------------------------------------------------------------------
;立回限制
;---------------------------------------------------------------------------------
[State -3]
Type = varadd
TriggerAll = !isHelper
Triggerall = RoundState = 2
Trigger1 = var(43) > 0
var(43) = -1
IgnoreHitPause = 1

[State -3]
Type = varadd
TriggerAll = !isHelper
Trigger1 = var(43) > 0
Trigger1 = StateNo = [150,153]
Trigger1 = EnemyNear,MoveHit = 1
Trigger1 = EnemyNear,StateType != A
Trigger1 = EnemyNear,StateNo = [200,500]
var(43) = -15

[State -3]
Type = varset
TriggerAll = !isHelper
Trigger1 = RoundState < 2
var(43)=180

[State -3]
Type = varset
TriggerAll = !isHelper
Trigger1 = var(43) < 0
var(43) = 0
IgnoreHitPause = 1

;===================================================================================
;可控
;===================================================================================
[State -3]
Type = varSet
Trigger1 = 1
var(17) = 0

;---------------------------------------------------------------------------------
;可控状态
[State -3]
Type = varSet
TriggerAll = StateType != A 
Trigger1 = Ctrl || StateNo = 1 || StateNo = 18 || StateNo = 19 || (StateNo = [120,149]) || (StateNo = [99,101]) || (StateNo = [10,12]) 
Trigger2 = StateNo = 52
var(17) = 1
IgnoreHitPause = 1
;---------------------------------------------------------------------------------
;可空振
[State -3]
Type = varSet
Trigger1 = StateNo = 205 && AnimElemTime(2) >= 1 
Trigger2 = StateNo = 210 && AnimElemTime(7) >= 1
Trigger3 = StateNo = 215 && AnimElemTime(4) >= 1
Trigger4 = StateNo = 220 && AnimElemTime(4) >= 1
Trigger5 = StateNo = 225 && AnimElemTime(3) >= 1
Trigger6 = StateNo = 235 && AnimElemTime(4) >= 1
Trigger7 = StateNo = 240 && AnimElemTime(4) >= 1
Trigger8 = StateNo = 245 && AnimElemTime(6) >= 1
Trigger9 = StateNo = 250 && AnimElemTime(5) >= 1
Trigger10 = StateNo = 260 && AnimElemTime(11) < 0
Trigger11 = StateNo = 400 && AnimElemTime(2) >= 1
Trigger12 = StateNo = 410 && AnimElemTime(5) >= 1
Trigger13 = StateNo = 420 && AnimElemTime(2) >= 1
Trigger14 = StateNo = 430 && AnimElemTime(6) >= 1
var(17) = 2
IgnoreHitPause = 1



;===================================================================================
:===================================================================================
;敌人识别
;===================================================================================
;===================================================================================

;1个敌人时

[State -2, EnemyNear]
Type = varSet
TriggerAll = !isHelper
TriggerAll = var(59)
Trigger1 = NumEnemy = 1
Trigger2 = NumEnemy > 1
Trigger2 = EnemyNear(1),Life = 0
var(2) = 0
IgnoreHitPause = 1

[State -2, EnemyNear]
Type = varSet
TriggerAll = !isHelper
TriggerAll = var(59)
Trigger1 = NumEnemy > 1
Trigger1 = EnemyNear(0),Life = 0
var(2) = 1
IgnoreHitPause = 1

;2个敌人时

[State -2, EnemyNear]
Type = varSet
TriggerAll = var(59)
TriggerAll = NumPartner > 0
TriggerAll = Partner,Life > 0
TriggerAll = NumEnemy > 1
TriggerAll = EnemyNear(0),Life > 0 && EnemyNear(1),Life > 0
Trigger1 = !(Partner,MoveType = A && Partner,NumTarget && EnemyNear(0),MoveType = H && EnemyNear(1),MoveType != H && !((EnemyNear(0),StateNo = [5000,5300]) || (EnemyNear(0),StateNo = [120,160])) && EnemyNear(0),GetHitvar(hitshaketime) = 0)
Trigger1 = !(Partner,MoveType = H && EnemyNear(0),NumTarget && EnemyNear(0),MoveType = A && !((Partner,StateNo = [5000,5300]) || (Partner,StateNo = [120,160])) && Partner,GetHitvar(hitshaketime) = 0)
var(2) = 0
IgnoreHitPause = 1

[State -2, EnemyNear]
Type = varSet
TriggerAll = var(59)
TriggerAll = NumPartner > 0
TriggerAll = Partner,Life > 0
TriggerAll = NumEnemy > 1
TriggerAll = EnemyNear(0),Life > 0 && EnemyNear(1),Life > 0
Trigger1 = (Partner,MoveType = A && Partner,NumTarget && EnemyNear(0),MoveType = H && EnemyNear(1),MoveType != H && !((EnemyNear(0),StateNo = [5000,5300]) || (EnemyNear(0),StateNo = [120,160])) && EnemyNear(0),GetHitvar(hitshaketime) = 0)
Trigger2 = (Partner,MoveType = H && EnemyNear(0),NumTarget && EnemyNear(0),MoveType = A && !((Partner,StateNo = [5000,5300]) || (Partner,StateNo = [120,160])) && Partner,GetHitvar(hitshaketime) = 0)
var(2) = 1
IgnoreHitPause = 1


;=================================================================================
;高优先级其他10
;=================================================================================
[State -3,打破僵局用]
Type = ChangeState
Triggerall = var(59)
Triggerall = var(17) = 1
Triggerall = StateType != A
Triggerall = helper(11990),var(2) > 120;超过两秒未移动
;很奇怪的现象，敌人一直在一个距离
Trigger1 = InGuardDist
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x<40
Trigger1 = EnemyNear,MoveType = A
Trigger1 = EnemyNear,StateNo=[200,999]
Trigger1 = var(54) := 400
Trigger1 = var(50) := 400101
;
Trigger2 = InGuardDist
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x < 90
Trigger2 = EnemyNear,MoveType = A
Trigger2 = EnemyNear,StateNo = [200,999]
Trigger2 = var(54) := 1300
Trigger2 = var(50) := 1300104
;
Trigger3 = !InGuardDist
Trigger3 = EnemyNear,StateNo < 100
Trigger3 = EnemyNear,StateType != A
Trigger3 = BackEdgeBodyDist>80
Trigger3 = var(54) := 105
Trigger3 = var(50) := 105104
value = var(54)

[State 980, 聚气结束]
Type = ChangeState
Triggerall = var(59)
Triggerall = AnimElem = 2, > 0
Triggerall = StateNo = 980
Triggerall = EnemyNear,StateType != L
;
Trigger1 = InGuardDist
Trigger1 = var(50):=981101
;
Trigger2 = EnemyNear,Ctrl 
Trigger2 = P2BodyDist x<120
Trigger2 = var(50):=981102
;
Trigger3 = EnemyNear,StateNo = 1321
Trigger3 = P2BodyDist x < 45
Trigger3 = EnemyNear,Pos Y >= -80
Trigger3 = var(50):=981103
;
Trigger4 = EnemyNear,StateNo<120&&EnemyNear,MoveType=I
Trigger4 = P2BodyDist x<130
Trigger4 = var(50):=981104
;
Trigger5 = EnemyNear,NumProj||(PlayerIdExist(Helper(33333333),var(3)) && PlayerId(Helper(33333333),var(3)),vel x > 0)
Trigger5 = var(50):=981105
;
Trigger6 = P2BodyDist x < 65
Trigger6 = EnemyNear,MoveType=I
Trigger6 = var(50):=981106
value = 981


[State -3,气AB/落地受身处理处理]
Type = ChangeState
value = 39
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = var(17) = 1
TriggerAll = EnemyNear,MoveType = I
TriggerAll = EnemyNear,AnimTime <= -4
;气AB
Trigger1 = var(16)&2**2
Trigger1 = EnemyNear,Vel x >= 0
Trigger1 = var(4) := 5
Trigger1 = var(50) := 39101
;落地受身
Trigger2 = var(16)&2**3 
Trigger2 = P2BodyDist x = [0, 40]
Trigger2 = (EnemyNear,Time = [2,4]) || EnemyNear,AnimTime = [-12,-8]
Trigger2 = var(4) := 1
Trigger2 = var(50) := 39102
IgnoreHitPause = 1


[State -3,凯撒波释放]
Type = ChangeState
Triggerall = var(59)
TriggerAll = ctrl = 0
TriggerAll = StateType != A
TriggerAll = StateNo = 1000
TriggerAll = Time != [36,40]
Triggerall = EnemyNear,StateType != L
;打地面最速追击，一般是追烈风拳
Trigger1 = (EnemyNear,StateType!=A)||(EnemyNear,StateType=A&&P2BodyDist x>150)
Trigger1 = EnemyNear,MoveType = H 
Trigger1 = var(50):=1010101
;追空
Trigger2 = EnemyNear,StateNo != 5040
Trigger2 = EnemyNear,StateType = A 
Trigger2 = (P2BodyDist x - 55) / 16 + 6 = [fvar(11)-4, fvar(11)-1]
Trigger2 = var(50):=1010102
;对地面 todo
Trigger3 = var(30) = 1
Trigger3 = EnemyNear,StateType != A && EnemyNear,MoveType != H
Trigger3 = EnemyNear,Vel X<8;防止滑步之类的
Trigger3 = P2BodyDist x<130
Trigger3 = var(50):=1010103
;对可控
Trigger4 = P2BodyDist x>=-10;否则就一直憋着了
Trigger4 = AnimElemTime(12)<0
Trigger4 = EnemyNear,StateType != A
Trigger4 = EnemyNear,Ctrl 
Trigger4 = var(50):=1010104
;对地面近身，因为无敌不免投
Trigger5 = EnemyNear,StateType != A && EnemyNear,MoveType != H
Trigger5 = EnemyNear,Ctrl || EnemyNear,StateNo < 100
Trigger5 = P2BodyDist x = [-20,20]
Trigger5 = var(50):=1010105
;对面放波了，释放
Trigger6 = AnimElemTime(12)<0
Trigger6 = EnemyNear,StateType!=A||P2BodyDist x>160
Trigger6 = EnemyNear,NumProj || (PlayerIdExist(Helper(33333333),var(3)) && PlayerId(Helper(33333333),var(3)),vel x > 0)
Trigger6 = var(50):=1010106
;
Trigger7 = AnimElemTime(12)<0
Trigger7 = EnemyNear,MoveType = A 
Trigger7 = var(50):=1010106
value = 1010

[State -3,地面重力机器释放]
Type = ChangeState
TriggerAll = ctrl = 0
TriggerAll = StateType != A
TriggerAll = StateNo = 1700 || StateNo = 1720
TriggerAll = !(EnemyNear,StateType = A && EnemyNear,Vel x > 0 && P2BodyDist x < 140)
TriggerAll = !MoveGuarded
TriggerAll = Time >= 30
;
Trigger1 = EnemyNear,Ctrl
;
Trigger2 = EnemyNear,MoveType = A
;
Trigger3 = EnemyNear,StateNo = 5120
Trigger4 = InGuardDist
;可控
Trigger5 = EnemyNear,MoveType=I
Trigger5 = EnemyNear,StateNo<=120
value = 1701

[State -3,空中重力机器释放]
Type = ChangeState
Triggerall = var(59)
TriggerAll = ctrl = 0
TriggerAll = StateType = A
TriggerAll = StateNo = 1750 || StateNo = 1770
TriggerAll = Time >= 11
;对面放波了，释放
Trigger1 = EnemyNear,NumProj || (PlayerIdExist(Helper(33333333),var(3)) && PlayerId(Helper(33333333),var(3)),vel x > 0)
Trigger1 = var(50) := 1751101
;
Trigger2 = P2BodyDist x < -5 
Trigger2 = var(50) := 1751102
;击中对方了
Trigger3 = Numtarget(1700)
Trigger3 = EnemyNear,MoveType = H && !EnemyNear,Ctrl 
Trigger3 = EnemyNear,StateNo >= 5000
Trigger3 = var(50) := 1751103
;
Trigger4 = EnemyNear,MoveType = A
Trigger4 = EnemyNear,Time<-EnemyNear,AnimTime
Trigger4 = var(50) := 1751104
;
Trigger5 = EnemyNear,Ctrl||(EnemyNear,MoveType=I&&EnemyNear,StateNo<120)
Trigger5 = var(50) := 1751105
value = 1751

[State -3,刚CD]
Type = ChangeState
Triggerall = var(59)
TriggerAll = StateType != A
TriggerAll = RoundState = 2
TriggerAll = StateType != A
TriggerAll = (StateNo = 150 || StateNo = 152) && Power >= 1000
TriggerAll = EnemyNear,MoveType = A
Triggerall = P2BodyDist x > -5

Trigger1 = EnemyNear,StateType = A 
Trigger1 = EnemyNear,MoveContact 
Trigger1 = P2BodyDist x - fvar(12)* 6 = [5,38]
Trigger1 = EnemyNear,Pos Y + EnemyNear,Vel Y * 6 + fvar(13) * 6 * (6 + 1) / 2 = [-70, -15] 
Trigger1 = var(50) := 245101

Trigger2 = EnemyNear,StateType = A
Trigger2 = P2BodyDist Y >= -45
Trigger2 = P2BodyDist x - fvar(12)* 6 < 38
Trigger2 = EnemyNear,Pos Y + EnemyNear,Vel Y * 6 + fvar(13) * 6 * (6 + 1) / 2 = [-70, -15] 
Trigger2 = var(50) := 245102

Trigger3 = EnemyNear,StateType != A
Trigger3 = P2BodyDist x - fvar(12)* 6 = [-10,38]
Trigger3 = EnemyNear,StateNo = [1000,1999]
Trigger3 = var(50) := 245103
value = 245


[State -3,重力机器版边加气磨血]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H
TriggerAll = EnemyNear,GetHitvar(HitTime) >= 17
TriggerAll = !var(47)
Trigger1 = (StateNo = 215 || StateNo = 235) && MoveGuarded
Trigger1 = P2BodyDist x < 18
Trigger1 = EnemyNear,BackEdgeBodyDist < 5
Trigger1 = EnemyNear,Power < 500
Trigger1 = var(50) := 1720101
value = 1720

[State -3,超长硬直的时候先跑]
;Todo
Type = ChangeState
TriggerAll = var(59)
Triggerall = var(17) = 1
Triggerall = StateNo != 99 && StateNo != 101
TriggerAll = StateType != A
TriggerAll = P2BodyDist x > 75
Triggerall = !InGuardDist
Trigger1 = EnemyNear,MoveType = A
Trigger1 = EnemyNear,StateType != A
Trigger1 = EnemyNear,StateNo = [1000,1999]
Trigger1 = EnemyNear,Time < 10
Trigger1 = EnemyNear,AnimTime < -50
Trigger1 = var(50) := 991001
value = 99

;=================================================================================
;抢招9
;=================================================================================

[State -3,挥空用]
;Todo
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,Vel x = [0,2.8]
TriggerAll = EnemyNear,StateNo < 1000
Trigger1 = StateNo = 400 && AnimElemTime(2) > 0
Trigger1 = !MoveContact
Trigger1 = P2BodyDist x < 60
Trigger1 = EnemyNear,time <= 1
Trigger1 = var(50) := 100091
value = 1000


[State -3,CL LP]
Type = ChangeState
value = 205
TriggerAll = !isHelper
TriggerAll = var(59)
TriggerAll = var(17) = 1
TriggerAll = StateType != A
TriggerAll = Random < 200
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,StateNo < 1000
TriggerAll = EnemyNear,StateNo = Helper(33000),var(2)
TriggerAll = enemynear,time < Helper(33000),var(3) - 2
TriggerAll = (abs(P2BodyDist X) < 21)
;对地
Trigger1 = EnemyNear,StateType = S
Trigger1 = P2BodyDist x-fvar(12)*3<40 
Trigger1 = var(50) := 20591
IgnoreHitPause = 1

[State -3,CL LK]
Type = ChangeState
value = 225
TriggerAll = !isHelper
TriggerAll = var(59)
TriggerAll = var(17) = 1
TriggerAll = StateType != A
TriggerAll = Random < 200
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,StateNo < 1000
TriggerAll = EnemyNear,StateNo = Helper(33000),var(2)
TriggerAll = enemynear,time < Helper(33000),var(3) - 3
TriggerAll = (abs(P2BodyDist X) < 21)
;对地
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - fvar(12) * 3 < 50 
Trigger1 = var(50) := 22591
IgnoreHitPause = 1


[State -3,CR LP]
Type = ChangeState
value = 400
TriggerAll = !isHelper
TriggerAll = var(59)
TriggerAll = var(17) = 1
TriggerAll = StateType!=A
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,StateNo=[200,999]
;对地
Trigger1 = EnemyNear,StateNo = Helper(33000),var(2)
Trigger1 = enemynear,time<=Helper(33000),var(3)-2
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x-fvar(12)*2<40 
Trigger1 = var(50) := 40091
;对地
Trigger2 = EnemyNear,StateNo=Helper(33000),var(2)
Trigger2 = enemynear,time<=Helper(33000),var(3) - 2
Trigger2 = P2BodyDist x-fvar(12)*2<40 
Trigger2 = EnemyNear,StateType != A
Trigger2 = EnemyNear,Time < 6
Trigger2 = EnemyNear,AnimTime<-30
Trigger2 = var(50) := 40092
;没记录就直接抢
Trigger3 = Helper(33000),var(3)=0||Helper(33000),var(3)=1
Trigger3 = P2BodyDist x=[-50,50]
Trigger3 = EnemyNear,time<=2
Trigger3 = var(50) := 40093
IgnoreHitPause = 1

[State -3,CR LK]
Type = ChangeState
value = 420
TriggerAll = !isHelper
TriggerAll = var(59)
TriggerAll = var(17) = 1
TriggerAll = StateType != A
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,StateType != A
TriggerAll = EnemyNear,Vel x = [0,2.8]
TriggerAll = P2BodyDist x < 64 
TriggerAll = EnemyNear,StateNo=[200,999]
;对地
Trigger1 = EnemyNear,StateNo = Helper(33000),var(2)
Trigger1 = enemynear,time < Helper(33000),var(3) - 3
Trigger1 = var(50) := 42091
;对地
Trigger2 = EnemyNear,StateType != A
Trigger2 = EnemyNear,Time<=2
Trigger2 = EnemyNear,AnimTime<-30
Trigger2 = var(50) := 42092
;没记录就直接抢
Trigger3 = EnemyNear,Time - EnemyNear,AnimTime > 22
Trigger3 = P2BodyDist x = [40,64]
Trigger3 = EnemyNear,time <= 1
Trigger3 = var(50) := 42093
;没记录就直接抢
Trigger4 = Helper(33000),var(3)=0||Helper(33000),var(3)=1
Trigger4 = P2BodyDist x=[40,64]
Trigger4 = EnemyNear,time<=2
Trigger4 = var(50) := 42094
IgnoreHitPause = 1

[State -3]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = var(17) = 1
TriggerAll = StateType != A
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,StateNo < 1000
TriggerAll = EnemyNear,StateType != A
TriggerAll = EnemyNear,Vel x >= 0
TriggerAll = P2BodyDist x > 40
Trigger1 = EnemyNear,StateNo = Helper(33000),var(2)
Trigger1 = enemynear,time < Helper(33000),var(3) - 7
Trigger1 = var(50) := 100091
value = 1000

[State -3,D投]
Type = ChangeState
value = 850
TriggerAll = var(59)
TriggerAll = var(17) = 1
TriggerAll = StateType != A
TriggerAll = (abs(P2BodyDist X) <= 18)
TriggerAll = EnemyNear,StateNo != 52
TriggerAll = EnemyNear,StateNo != 5120
TriggerAll = EnemyNear,Vel Y=0
TriggerAll = (var(16)&2**6)=0
Triggerall = EnemyNear,Facing!=Facing
Triggerall = BackEdgeBodyDist < FrontEdgeBodyDist
;抢招
Trigger1 = EnemyNear,MoveType=A&&EnemyNear,Time<=2&&EnemyNear,StateNo=[200,999]
Trigger1 = var(50) := 85091
;抓硬直
Trigger2 = EnemyNear,StateNo=[200,4999]
Trigger2 = EnemyNear,MoveType=A||EnemyNear,MoveType=I
trigger2 = EnemyNear,AnimTime>=-2
Trigger2 = var(50) := 85092
IgnoreHitPause = 1

[State -3,C投]
Type = ChangeState
value = 800
TriggerAll = var(59)
TriggerAll = var(17) = 1
TriggerAll = StateType != A
TriggerAll = (abs(P2BodyDist X) <= 18)
TriggerAll = EnemyNear,StateNo != 52
TriggerAll = EnemyNear,StateNo != 5120
TriggerAll = EnemyNear,Vel Y=0
TriggerAll = (var(16)&2**6)=0
Triggerall = EnemyNear,Facing!=Facing
;抢招
Trigger1 = EnemyNear,MoveType=A&&EnemyNear,Time<=2&&EnemyNear,StateNo=[200,999]
Trigger1 = var(50) := 80091
;抓硬直
Trigger2 = EnemyNear,StateNo=[200,4999]
Trigger2 = EnemyNear,MoveType=A||EnemyNear,MoveType=I
trigger2 = EnemyNear,AnimTime>=-2
Trigger2 = var(50) := 80092
IgnoreHitPause = 1



;=================================================================================
;抓硬直8
;=================================================================================
[State -3,跳抓]
Type = ChangeState
TriggerAll = !isHelper
TriggerAll = var(59) 
Triggerall = !InGuardDist||EnemyNear,Facing=Facing||(!EnemyNear,NumProj&&!PlayerIdExist(Helper(33333333),var(3)))
TriggerAll = EnemyNear,Time>-EnemyNear,AnimTime
TriggerAll = EnemyNear,MoveType=A||EnemyNear,MoveType=I 
TriggerAll = EnemyNear,StateType=S
TriggerAll = !EnemyNear,Ctrl
TriggerAll = StateType!= A 
TriggerAll = (var(16)&2**2)=0 ;不能是气AB
Trigger1 = var(17) = 1
Trigger1 = EnemyNear,StateNo=[1000,1999]
Trigger1 = EnemyNear,StateType!=A
Trigger1 = EnemyNear,AnimTime<-18
Trigger1 = P2BodyDist x<90
Trigger1 = var(4):=2
Trigger1 = var(50):=3981 
value = 39

[State -3,普通抓硬直]
Type = ChangeState
TriggerAll = var(59) 
TriggerAll = !InGuardDist||EnemyNear,Facing=Facing||(EnemyNear,StateNo>=1000&&(EnemyNear,Time>-EnemyNear,AnimTime))
TriggerAll = !((EnemyNear,StateNo = [0,29]) || EnemyNear,StateNo = [69,102]) 
TriggerAll = EnemyNear,StateNo <= 4999||EnemyNear,Facing = Facing
TriggerAll = EnemyNear,MoveType = A||EnemyNear,MoveType = I 
TriggerAll = !EnemyNear,Ctrl
TriggerAll = !(EnemyNear,StateNo >= 5000 && EnemyNear,MoveType = I)
TriggerAll = StateType != A 
TriggerAll = EnemyNear,StateType != A&&EnemyNear,Vel Y=0
;不能是气AB和落地受身 都是全程无敌的
TriggerAll = (var(16)&2**2) = 0 && (var(16)&2**3) = 0
TriggerAll = EnemyNear,HitDefAttr != SCA,AT
;
TriggerAll = (!EnemyNear,NumProj&&!PlayerIdExist(Helper(33333333),var(3)))||!InGuardDist
;近重拳
Trigger1 = var(17) = 1 
Trigger1 = (abs(P2BodyDist X) < 21)
Trigger1 = EnemyNear,StateType = S
Trigger1 = EnemyNear,animtime<-6
Trigger1 = EnemyNear,StateNo<1000||EnemyNear,AnimTime=[-9,-6]
Trigger1 = P2BodyDist x = [-45, 45]
Trigger1 = var(54) := 215
Trigger1 = var(50) := 021571
;蹲轻拳
Trigger2 = var(17) = 1 || (StateNo = 420 && AnimElemTime(3) > 0)||(StateNo = 400 && AnimElemTime(3) > 0) 
Trigger2 = P2BodyDist x-fvar(12)*3=[-40,40]
Trigger2 = EnemyNear,animtime = [-7,-2]
Trigger2 = var(54) := 400
Trigger2 = var(50) := 040071
;蹲轻脚
Trigger3 = var(17) = 1 || (StateNo = 420 && AnimElemTime(3) > 0)||(StateNo = 400 && AnimElemTime(3) > 0)
Trigger3 = P2BodyDist x - fvar(12)*4=[-56,56]
Trigger3 = EnemyNear,animtime = [-7,-4]
Trigger3 = var(54) := 420
Trigger3 = var(50) := 042071 
value = var(54)



[State -3,普通破防硬直]
Type = ChangeState
TriggerAll = !isHelper
TriggerAll = var(59) 
TriggerAll = !InGuardDist
TriggerAll = EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo = 5700

Trigger1 = var(52) = 0 && Power >= 2000
Trigger1 = StateType != A
Trigger1 = var(17) = 2
Trigger1 = var(50) := 95171
Trigger1 = var(54) := 951

Trigger2 = StateType != A
Trigger2 = var(52) = 0
Trigger2 = var(17) = 2
Trigger2 = var(50) := 145071
Trigger2 = var(54) := IfElse(Random < 400, 1450, 1850)

;近重脚
Trigger3 = var(17) = 1 
Trigger3 = (abs(P2BodyDist X) < 29)
Trigger3 = EnemyNear,Time = [30,33]
Trigger3 = P2BodyDist x = [-45, 45]
Trigger3 = var(54) := 235
Trigger3 = var(50) := 023572
;近重拳
Trigger4 = var(17) = 1 
Trigger4 = (abs(P2BodyDist X) < 29)
Trigger4 = EnemyNear,Time = [30,33]
Trigger4 = P2BodyDist x = [-45, 45]
Trigger4 = var(54) := 215
Trigger4 = var(50) := 021572
;蹲轻拳
Trigger5 = var(17) = 1 || (StateNo = 420 && AnimElemTime(3) > 0)||(StateNo = 400 && AnimElemTime(3) > 0)
Trigger5 = EnemyNear,Time = [34,37]
Trigger5 = P2BodyDist x = [-30, 30]
Trigger5 = var(54) := 400
Trigger5 = var(50) := 040072
;蹲轻脚
Trigger6 = var(17) = 1 || (StateNo = 420 && AnimElemTime(3) > 0)||(StateNo = 400 && AnimElemTime(3) > 0)
Trigger6 = P2BodyDist x = [-56, 56]
Trigger6 = EnemyNear,Time = [33,36]
Trigger6 = var(54) := 420
Trigger6 = var(50) := 042072 
value = var(54)

[State -3]
Type = varSet
TriggerAll = !isHelper
Trigger1 = 1
fvar(14) = (P2BodyDist x - 20) / 16.0 + 8

[State -3,凯撒波移1段抓出招硬直]
Type = ChangeState
TriggerAll = !isHelper
TriggerAll = var(59) 
Triggerall = !var(47)
TriggerAll = !InGuardDist || EnemyNear,Facing = Facing || EnemyNear,AnimTime >= -12 || P2BodyDist x > 150
TriggerAll = !(EnemyNear,StateNo = [0,120]) || EnemyNear,StateType = A
TriggerAll = EnemyNear,StateNo <= 4999
TriggerAll = EnemyNear,MoveType = A || EnemyNear,MoveType = I 
TriggerAll = EnemyNear,StateType != L
TriggerAll = !EnemyNear,Ctrl
TriggerAll = !(EnemyNear,StateNo >= 5000 && EnemyNear,MoveType = I)
TriggerAll = StateType != A 
TriggerAll = (var(16)&2**2)=0 ;不能是气AB
;对空 
Trigger1 = var(17) = [1,2]
Trigger1 = P2BodyDist x>90
Trigger1 = EnemyNear,Pos Y + EnemyNear,Vel Y * fvar(14) + fvar(13) * fvar(14) * (fvar(14) + 1) / 2 = [-60, -10]
Trigger1 = var(50) := 100071 
;todo 增加弹幕不可抵消
Trigger2 = (var(16)&2**4)= 0
Trigger2 = var(17) = [1,2]
Trigger2 = EnemyNear,StateNo=[1000,1999]
Trigger2 = EnemyNear,StateType!=A
Trigger2 = P2BodyDist x>160
Trigger2 = EnemyNear,AnimTime<-Fvar(14)
Trigger2 = var(50) := 100072 
value = 1000

;=================================================================================
;切返7
;=================================================================================
[State -3,烈风拳对普通技能]
;Todo  这是干嘛的？
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = var(17)=[1,2]
TriggerAll = EnemyNear,StateNo = [200,999]
TriggerAll = EnemyNear,StateType!=A
TriggerAll = EnemyNear,MoveType=A
Trigger1 = enemynear,stateno=helper(33000),var(2)
Trigger1 = enemynear,time<helper(33000),var(3)-7
Trigger1 = P2BodyDist x>100 
value = 1000


[State -3,耗气前滚]
Type = changestate
TriggerAll = var(59)
TriggerAll = roundstate = 2
TriggerAll = StateType != A 
TriggerAll = Power >= 1000
TriggerAll = power >= 2500 || (Life < 200) || (EnemyNear,Life < 300 && Power >= 2000) || (EnemyNear,Life < 150) || EnemyNear,Life - Life > 350
TriggerAll = EnemyNear,StateType != A
TriggerAll = EnemyNear,MoveType = A && !EnemyNear,Ctrl
TriggerAll = StateNo = [150,152]
TriggerAll = EnemyNear,Vel x >= 0
;
Triggerall = EnemyNear,StateNo = [1000,4999]
Trigger1 = EnemyNear,AnimTime < -30 || (EnemyNear,AnimTime < -28 && Life < LifeMax*0.3)
Trigger1 = P2BodyDist x < 140
Trigger1 = var(50) := 90071
value = 900
IgnoreHitPause = 1

[State -3,前滚]
Type = changestate
TriggerAll = var(59)
TriggerAll = var(17) = 1
TriggerAll = roundstate = 2
TriggerAll = StateType != A 
TriggerAll = EnemyNear,Vel x >= 0
TriggerAll = EnemyNear,MoveType=A 
;攻击的前闪避
TriggerAll = EnemyNear,Time<-EnemyNear,AnimTime
;不能是投技
TriggerAll = !(EnemyNear,HitDefAttr = SCA, AT)
TriggerAll = Helper(33000),var(11) != 3
TriggerAll = EnemyNear,facing != facing
TriggerAll = EnemyNear,animtime<-33
;不能有弹幕
Triggerall = !EnemyNear,NumProj
Triggerall = !PlayerIdExist(Helper(33333333),var(3))
;穿敌人
TriggerAll = EnemyNear,MoveType=A||EnemyNear,MoveType=I
TriggerAll = EnemyNear,StateNo = [1000,1999]
;
Trigger1 = EnemyNear,Time<-EnemyNear,AnimTime || Enemynear,AnimTime=[-38,-34]
Trigger1 = StateNo=[99,101]
Trigger1 = P2BodyDist x<95
Trigger1 = var(50) := 090072
;
Trigger2 = EnemyNear,Time<-EnemyNear,AnimTime || Enemynear,AnimTime=[-38,-34]
Trigger2 = P2BodyDist x<65
Trigger2 = var(50) := 090073
value = 900

[State -3,劲霸男装，用来浪的]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = var(17) = [1,2]
TriggerAll = EnemyNear,StateNo = [1000,1999]
TriggerAll = EnemyNear,StateType != A
TriggerAll = EnemyNear,MoveType = A
TriggerAll = Helper(11990),var(31)>0;发波类的应用
TriggerAll = Helper(11990),var(19)=0;能跳过去的，大蛇那种波跳不过去的
Triggerall = Life-EnemyNear,Life>500
Triggerall = EnemyNear,BackEdgeBodyDist < 5
TriggerAll = Helper(11990),var(44) = 1
;
Trigger1 = P2BodyDist x<140
Trigger1 = EnemyNear,Life < 300
Trigger1 = Power>=3000||(var(52)&&power>=1000)
Trigger1 = EnemyNear,AnimTime<-22
Trigger1 = var(50) := 280071
Trigger1 = var(54) := 2800
;
Trigger2 = P2BodyDist x < 120
Trigger2 = Power >= 1000 || var(52)
Trigger2 = EnemyNear,AnimTime < -22
Trigger2 = var(50) := 270071
Trigger2 = var(54) := 2750
value = var(54)

[State -3,死亡突袭]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,StateType != A
TriggerAll = EnemyNear,StateNo = [1000,1999]
Triggerall = P2BodyDist x > 0
TriggerAll = P2BodyDist x = [180,220]
TriggerAll = (fvar(15) > 200 && EnemyNear,AnimTime<-18) || EnemyNear,AnimTime = [-26,-18)
TriggerAll = var(17) = [1,2]
TriggerAll = Life>LifeMax*0.3
Triggerall = EnemyNear,NumProj = 0
TriggerAll = !PlayerIdExist(Helper(33333333),var(3))
Triggerall = EnemyNear,Vel x=0
Triggerall = Helper(11990),var(43)=0
Triggerall = Life-EnemyNear,Life>600;必须是大优势，否则破绽大被打爆
;Max版本
Trigger1 = EnemyNear,Life<150
Trigger1 = Power >= 3000 || (var(52) && Power >= 1000)
Trigger1 = var(54) := 2300
Trigger1 = var(50) := 230071
;普通版本
Trigger2 = EnemyNear,Life<70
Trigger2 = Power >= 1000 || var(52)
Trigger2 = var(54) := 2250
Trigger2 = var(50) := 225071
value = var(54)

[State -3,白罗灭精]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = Power >= 1000 || var(52) > 0
TriggerAll = var(17) = [1,2]
TriggerAll = PlayerIdExist(Helper(33333333),var(3))||NumProj||P2BodyDist x>160
;判定为带飞行道具，超长硬直时间,躲对方超绝杀用
Trigger1 = InGuardDist || EnemyNear,MoveType = A
Trigger1 = EnemyNear,StateNo = [2000,4999]
Trigger1 = EnemyNear,AnimTime = [-100, -50]
Trigger1 = var(50) := 240071
;
Trigger2 = Helper(11990),var(43)!=1;当身技能尝试抓硬直
Trigger2 = EnemyNear,StateNo = [1000,4999]
Trigger2 = EnemyNear,MoveType = A
Trigger2 = EnemyNear,AnimTime < -26
Trigger2 = var(50) := 240072
;
Trigger3 = Life<LifeMax*0.3
Trigger3 = var(17)=2
Trigger3 = EnemyNear,StateNo = [1000,4999]
Trigger3 = EnemyNear,StateType != A
Trigger3 = P2BodyDist x - fvar(12)*7 < 80
Trigger3 = Enemynear,Time<-EnemyNear,AnimTime
Trigger3 = EnemyNear,Time>=2
Trigger3 = var(50) := 240073
;被刚CD了
Trigger4 = var(17) = 2
Trigger4 = var(16)&2**7
Trigger4 = EnemyNear,Time <= 4
Trigger4 = EnemyNear,StateNo = [200,4999]
Trigger4 = EnemyNear,MoveType = A
Trigger4 = EnemyNear,StateType != A
Trigger4 = EnemyNear,MoveType != H
Trigger4 = P2BodyDist x < 80
Trigger4 = var(50) := 240074
value = 2400


[State -3,对方气AB]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = var(17) = 2
TriggerAll = EnemyNear,MoveType != H
TriggerAll = EnemyNear,Facing != Facing
Trigger1 = (var(16)&2**2) = 1
Trigger1 = P2Dist x <= 0
Trigger1 = EnemyNear,AnimTime >= -3
Trigger1 = abs(P2BodyDist x ) < 60
Trigger1 = var(50) := 140077
value = IfElse(BackEdgeBodyDist>180,1800,1400)


[State -3,后小跳多投技]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = var(17) = 1
TriggerAll = EnemyNear,MoveType!=H
TriggerAll = EnemyNear,Facing!=Facing
;防投技
Trigger1 = Helper(33000),var(14) = 3 || EnemyNear,HitDefAttr = SCA,AT
Trigger1 = P2BodyDist x < 45
Trigger1 = EnemyNear,Time < -EnemyNear,AnimTime
Trigger1 = var(50) := 3971
Trigger1 = var(4) := IfElse(BackEdgeBodyDist >= 60, 9, 1) 
value = 39


[State -3,烈风拳]
Type = changestate
TriggerAll = var(59)
TriggerAll = stateType != A 
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,StateType != A
TriggerAll = EnemyNear,Facing != Facing

Trigger1 = var(17) = [1,2]
Trigger1 = !EnemyNear,HitDefAttr = SCA,AA,AP,AT
Trigger1 = Helper(11990),var(43) = 1
Trigger1 = EnemyNear,StateNo = [200, 4999]
Trigger1 = EnemyNear,StateType != A
Trigger1 = EnemyNear,AnimTime <= -12
Trigger1 = var(50) := 115071

Trigger2 = EnemyNear,Vel x = 0
Trigger2 = Helper(11990),var(43) = 1
Trigger2 = Helper(11990),var(37) != 0
Trigger2 = !EnemyNear,HitDefAttr = SCA,AA,AP,AT
Trigger2 = EnemyNear,StateNo = [1000,1999]
Trigger2 = P2BodyDist x < 52
Trigger2 = (StateNo = 400 || StateNo = 420) && AnimElemTime(2) > 0 && EnemyNear,MoveType != H
Trigger2 = var(50) := 115072
value = 1150

[State -3,切返2A不能抢的招式]
Type = changestate
TriggerAll = var(59)
TriggerAll = stateType != A 
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,Vel x >= 0 ;类似Bloo这种空振后退的
TriggerAll = EnemyNear,Facing != Facing
TriggerAll = Helper(11990),var(44) = 2
TriggerAll = var(17) = 1
;足够近直接用投
Trigger1 = enemynear,stateno = helper(33000),var(2)
Trigger1 = EnemyNear,Time < helper(33000),var(3)
Trigger1 = (abs(P2BodyDist X) <= 18)
Trigger1 = var(54) := ifelse(FrontEdgeBodyDist > BackEdgeBodyDist, 850, 800)
;否则用投
Trigger2 = enemynear,stateno=helper(33000),var(2)
Trigger2 = EnemyNear,Time<helper(33000),var(3)
Trigger2 = (abs(P2BodyDist X) >= 18)
Trigger2 = var(54) := 930
value = var(54)

[State -3,灭族切割]
Type = changestate
TriggerAll = var(59)
TriggerAll = stateType != A 
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,Vel x >= 0 ;类似Bloo这种空振后退的
TriggerAll = EnemyNear,Facing != Facing
TriggerAll = Helper(11990),var(44) = 1
TriggerAll = InGuardDist
;空振切返必杀/超杀
Trigger1 = var(17) = 2
Trigger1 = EnemyNear,StateNo = [1000,4999]
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - fvar(12)*7 < 80
Trigger1 = EnemyNear,AnimTime <= -8 || EnemyNear,AnimTime > 0
Trigger1 = Enemynear,Time < -EnemyNear,AnimTime
Trigger1 = EnemyNear,Time>=((EnemyNear,Time-Enemynear,AnimTime)/5)
Trigger1 = var(50) := 130071
;切返普通技能
;Todo
Trigger2 = (var(16)&2**0) = 0 
Trigger2 = var(17) = 1
Trigger2 = EnemyNear,StateNo = [200,999]
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x = [65,75]
Trigger2 = EnemyNear,Time<=1
Trigger2 = EnemyNear,AnimTime <= -8 || EnemyNear,AnimTime > 0
Trigger2 = var(50) := 130072
;1段对空
;Todo
Trigger3 = var(17) = [1,2]
Trigger3 = EnemyNear,StateType = A && EnemyNear,StateNo != 5040
Trigger3 = P2BodyDist x - fvar(12)*7 = [-10, 74]
Trigger3 = EnemyNear,Pos Y + EnemyNear,Vel Y * 7 + fvar(13) * 7 * (7 + 1) / 2 = [-70, -10]
Trigger3 = var(50) := 130073
;2段对空
;Todo
Trigger4 = var(17) = [1,2]
Trigger4 = EnemyNear,StateType = A && EnemyNear,StateNo != 5040
Trigger4 = P2BodyDist x - fvar(12)*11 = [-10, 90]
Trigger4 = EnemyNear,Pos Y + EnemyNear,Vel Y * 11 + fvar(13) * 11 * (11 + 1) / 2 = [-100, -20]
Trigger4 = var(50) := 130074
;1段防止被抓硬直
Trigger5 = var(17) = 2
Trigger5 = Helper(11990),var(43)!=1;当身技能尝试抓硬直
Trigger5 = EnemyNear,Time <= 4
Trigger5 = EnemyNear,StateNo = [200,999]
Trigger5 = EnemyNear,MoveType = A
Trigger5 = EnemyNear,StateType != A
Trigger5 = EnemyNear,MoveType != H
Trigger5 = P2BodyDist x < 80
Trigger5 = var(50) := 130077
;被刚CD了
Trigger6 = var(17) = 2
Trigger6 = var(16)&2**7
Trigger6 = EnemyNear,Time <= 4
Trigger6 = EnemyNear,StateNo = [200,4999]
Trigger6 = EnemyNear,MoveType = A
Trigger6 = EnemyNear,StateType != A
Trigger6 = EnemyNear,MoveType != H
Trigger6 = P2BodyDist x < 80
Trigger6 = var(50) := 13008
value = 1300


[State -3,MAX惊异的死亡终结]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = stateType != A 
TriggerAll = EnemyNear,HitDefAttr = SCA,AA,AP,AT || EnemyNear,StateType = A
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,Vel x >= 0 ;类似Bloo这种空振后退的
TriggerAll = Power >= 3000 || (var(52)>0 && power >= 1000)
TriggerAll = EnemyNear,Facing != Facing
TriggerAll = EnemyNear,Time < -EnemyNear,AnimTime
;切返
Trigger1 = Helper(11990),var(43)!=1;当身技能尝试抓硬直
Trigger1 = Helper(11990),var(44) = 1
Trigger1 = var(17) = 2
Trigger1 = EnemyNear,StateNo = [1000, 4999]
Trigger1 = EnemyNear,StateType = S
Trigger1 = P2BodyDist x - fvar(11)*5 = [-5,116]
Trigger1 = EnemyNear,AnimTime <= -6
Trigger1 = var(50) := 260071
;对空
Trigger2 = var(17) = 1
Trigger2 = EnemyNear,StateType = A && EnemyNear,StateNo != 5040
Trigger2 = P2BodyDist x - fvar(12)*5 = [20,116]
Trigger2 = EnemyNear,Pos Y + EnemyNear,Vel Y * 6 + fvar(13) * 6 * (6 + 1) / 2 = [-50, ifelse(EnemyNear,StateNo = 115040,-10,-33)]
Trigger2 = var(50) := 260072
value = 2600
IgnoreHitPause = 1

[State -3,惊异的死亡终结]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = stateType != A 
TriggerAll = EnemyNear,HitDefAttr = SCA,AA,AP,AT || EnemyNear,StateType = A
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,Vel x >= 0 ;类似Bloo这种空振后退的
TriggerAll = !(Power >= 3000 || (var(52) > 0 && Power >= 1000))
TriggerAll = Power >= 1000 || var(52) > 0
TriggerAll = EnemyNear,Facing != Facing
;切返
Trigger1 = Helper(11990),var(43)!=1;当身技能尝试抓硬直
Trigger1 = Life > LifeMax*0.3
Trigger1 = Helper(11990),var(44) = 1
Trigger1 = var(17) = 2
Trigger1 = EnemyNear,StateNo = [1000, 4999]
Trigger1 = EnemyNear,StateType = S
Trigger1 = P2BodyDist x - fvar(12)*5 = [-5,116]
Trigger1 = EnemyNear,AnimTime <= -6
Trigger1 = var(50) := 250071
;对空
Trigger2 = var(17) = 1
Trigger2 = EnemyNear,StateType = A && EnemyNear,StateNo != 5040
Trigger2 = P2BodyDist x - fvar(12)*5 = [20,116]
Trigger2 = EnemyNear,Pos Y + EnemyNear,Vel Y * 6 + fvar(13) * 6 * (6 + 1) / 2 = [-50, ifelse(EnemyNear,StateNo = 115040,-10,-33)]
Trigger2 = var(50) := 250072
value = 2500
IgnoreHitPause = 1

[State -3,后撤]
Type = ChangeState
value = 105
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = var(17) = 1
TriggerAll = BackEdgeBodyDist > 80
TriggerAll = EnemyNear,Vel x <= 0
;
Trigger1 = EnemyNear,StateNo = 5120 && EnemyNear,AnimTime >= -5
Trigger1 = P2BodyDist x < 15
Trigger1 = var(50) := 10571
;
Trigger2 = (Var(16)&2**8)=0
Trigger2 = EnemyNear,StateNo = [1000,1999]
Trigger2 = EnemyNear,NumProj = 0 && !PlayerIdExist(Helper(33333333),var(3))
Trigger2 = InGuardDist
Trigger2 = P2BodyDist x = [80, 140]
Trigger2 = EnemyNear,MoveType = A && EnemyNear,AnimTime < -40
Trigger2 = var(50) := 10572
;
Trigger3 = var(17)=1
Trigger3 = StateNo!=[99,101]
Trigger3 = StateNo!=19
Trigger3 = Vel x>0
Trigger3 = EnemyNear,MoveType=A&&EnemyNear,StateNo>=2000
Trigger3 = var(50) := 10573
IgnoreHitPause = 1

;=================================================================================
;连段+连携6
;已知连段类型有
;6B >> D发绝情打击 >> N连剪刀脚 >> 超杀/D发剪刀脚收尾
;6B >> C发毁灭压杀 >> N连剪刀脚 >> 超杀/D发剪刀脚收尾
;剪刀脚 >> 暗黑屏障 >> 搬运/超杀
;
;=================================================================================
;---------------------------------------------------------------------------------
;空中重力机器连携、连段
[State -3]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = EnemyNear,MoveType = H
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000 || Enemynear,StateNo = [150,159] 
TriggerAll = StateNo = 610 || StateNo = 615 || StateNo = 630 || StateNo = 635 || StateNo = 640
TriggerAll = MoveContact
Trigger1 = fvar(11) >= 11
Trigger1 = MoveHit && EnemyNear,GetHitvar(Hittime) >= 9
Trigger1 = Fvar(15) < 60
value = 1770


;---------------------------------------------------------------------------------
;原地爆气的应用场景
;1.版边鞭尸炮击飞并且还有2气，可以爆气连两下再接鞭尸炮(天秀)或者MAX死亡终结
;2.D发绝情打击之后
;---------------------------------------------------------------------------------
[State -3]
Type = ChangeState 
TriggerAll = var(59) 
TriggerAll = var(17) = 1
TriggerAll = StateType != A
TriggerAll = Power >= 2000
TriggerAll = var(52) = 0
;追击隐藏
Trigger1 = Helper(33000),var(14) = 3020 || Helper(33000),var(14) = 3021 || EnemyNear,StateNo = 3056 || EnemyNear,StateNo = 3055
Trigger1 = P2BodyDist x < 120
Trigger1 = fvar(11) > 62
Trigger1 = EnemyNear,MoveType = H && EnemyNear,StateType = A
Trigger1 = var(50) := 95061
;
Trigger2 = EnemyNear,Life >= 250
Trigger2 = P2BodyDist x > 130
Trigger2 = EnemyNear,MoveType = H
Trigger2 = EnemyNear,StateType = A
Trigger2 = !EnemyNear,Ctrl 
Trigger2 = Numtarget(1453) = 1
Trigger2 = var(50) := 95062
;剪刀脚追击隐藏
Trigger3 = Life < LifeMax*0.3
Trigger3 = NumTarget(1302)
Trigger3 = EnemyNear,MoveType = H
Trigger3 = EnemyNear,StateType = A
Trigger3 = !EnemyNear,Ctrl 
Trigger3 = var(50) := 95063
value = 950

;----------------------------------------------------------------------------------
;刚CD取消到剪刀脚
;----------------------------------------------------------------------------------
[State -3]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = var(9) = 0
TriggerAll = StateType != A
TriggerAll = EnemyNear,MoveType = H
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo = 1321 
TriggerAll = NumTarget(245)
;剪刀脚
Trigger1 = 0
Trigger1 = StateNo = 245 && MoveHit
Trigger1 = EnemyNear,StateType != A || EnemyNear,Pos Y >= -10 || EnemyNear,Life - Life >= LifeMax*0.4
Trigger1 = var(54) := 1300
Trigger1 = var(50) := 130069
;接毁灭压杀
Trigger2 = (StateNo = 245 && AnimElemTime(5) > 1) || var(17) = 1
Trigger2 = P2BodyDist x > 130 || !(Helper(33000),var(14) = [1850,1851])
Trigger2 = (P2BodyDist x + 40 - fvar(12)*7)/15.0 + 12 = [fvar(11)-8, fvar(11)-5]
Trigger2 = var(54) := 1850
Trigger2 = var(50) := 185069 
value = var(54)


;----------------------------------------------------------------------------------
;烈风拳需要在BC之前
;----------------------------------------------------------------------------------
[State -3]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = !var(47)
TriggerAll = EnemyNear,MoveType = H
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000 
TriggerAll = var(52) = 0
;
Trigger1 = P2BodyDist x < 20
Trigger1 = StateNo = 260 && MoveHit
Trigger1 = var(50) := 115061
;
Trigger2 = P2BodyDist x < 10
Trigger2 = Fvar(15)<=83
Trigger2 = StateNo = 215 && MoveHit && AnimElemTime(4)>=1
Trigger2 = var(50) := 115062
value = 1150

[State -3]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = !var(47)
TriggerAll = EnemyNear,MoveType = H
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000 
TriggerAll = var(52) = 0
;
Trigger1 = Power<2000
Trigger1 = P2BodyDist x >= 56
Trigger1 = StateNo = 215 && AnimElem = 6, > 0 && MoveHit
Trigger1 = var(50) := 100063
value = 1000

;


;----------------------------------------------------------------------------------
;BC
;----------------------------------------------------------------------------------
[State -3]
Type = ChangeState
TriggerAll = var(59) 
TriggerAll = ctrl = 0
TriggerAll = power >= 2000
TriggerAll = var(52) = 0
TriggerAll = !InGuardDist
TriggerAll = EnemyNear,StateType != L
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000 
TriggerAll = StateNo = 260 && MoveHit
Trigger1 = Power >= 5000
Trigger1 = var(50) := 95161
Trigger2 = Power >= 3000 && Life - EnemyNear,Life*EnemyNear,const(data.defence)/100.0 > EnemyNear,LifeMax*0.4
Trigger2 = var(50) := 95162
Trigger3 = EnemyNear,Life*EnemyNear,const(data.defence)/100.0 = [250, 380]
Trigger3 = var(50) := 95163
Trigger4 = P2BodyDist x >= 56
Trigger4 = StateNo = 215 && AnimElem = 6, > 0 && MoveHit
Trigger4 = var(50) := 95164
value = 951

[State -3,BC连用,剪刀脚 >> 绝情打击]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = EnemyNear,MoveType = H
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000 || EnemyNear,StateNo = 1320
TriggerAll = EnemyNear,StateType != A
TriggerAll = var(52) > 0
Trigger1 = StateNo = 1300 && MoveHit
Trigger1 = var(50) := 145069
value = 1450

[State -3,BC连用,剪刀脚 >> 绝情打击]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = EnemyNear,MoveType = H
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000
TriggerAll = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
TriggerAll = var(52) > 0
Trigger1 = StateNo = 260 && MoveHit
Trigger1 = var(50) := 130069
value = 1300

[State -3]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = EnemyNear,MoveType = H
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000 || Enemynear,StateNo = [150,159]
TriggerAll = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
TriggerAll = StateNo = 400 && MoveContact && AnimElem = 3, > 0
TriggerAll = P2BodyDist x < 25
Triggerall = EnemyNear,GetHitvar(HitCount)<=3
Trigger1 = EnemyNear,BackEdgeBodyDist < 10
Trigger1 = P2BodyDist x - Vel X * 3 < 40
Trigger1 = var(50) := 40061
Trigger2 = EnemyNear,BackEdgeBodyDist >= 10
Trigger2 = P2BodyDist x - fvar(12) * 3 < 40
Trigger2 = var(50) := 40062
value = 400

[State -3]
Type = ChangeState
TriggerAll = !isHelper
;TriggerAll = var(59)
TriggerAll = EnemyNear,MoveType = H
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000 || Enemynear,StateNo = [150,159]
TriggerAll = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
TriggerAll = (StateNo = 400 || StateNo = 420) && MoveContact &&  AnimElem = 3, > 0
Triggerall = EnemyNear,GetHitvar(HitCount)<=3
Trigger1 = EnemyNear,BackEdgeBodyDist < 10
Trigger1 = P2BodyDist x - Vel X * 4 < 45
Trigger1 = var(50) := 42061
Trigger2 = EnemyNear,BackEdgeBodyDist >= 10
Trigger2 = P2BodyDist x - fvar(12) * 4 < 55
Trigger2 = var(50) := 42062
value = 420

[State -3]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = EnemyNear,MoveType = H
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000 ||((EnemyNear,Power < 1000 || EnemyNear,BackEdgeBodyDist > 100) && Enemynear,StateNo = [150,159]) 
TriggerAll = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
TriggerAll = P2BodyDist x < 56
TriggerAll = EnemyNear,GetHitvar(Hittime) >= 7
Trigger1 = (StateNo = 400 || StateNo = 420) && MoveContact = [1,5]
Trigger1 = P2BodyDist x - fvar(12) * 4 > 55 || P2BodyDist x - Vel X * 4 > 55 || P2BodyDist x < 15 && EnemyNear,BackEdgeBodyDist<5
Trigger1 = P2BodyDist x < 75
Trigger1 = var(50) := 26161
Trigger2 = StateNo = 235 && MoveContact
Trigger2 = var(50) := 26162
Trigger3 = StateNo = 215 && AnimElem = 6, > 0 && MoveContact
Trigger3 = var(50) := 26163
Trigger4 = (EnemyNear,BackEdgeBodyDist < 5 && P2BodyDist x - vel x*6 < 85) || (P2BodyDist x - fvar(12)*6 < 85)
Trigger4 = StateNo = 220 && MoveContact
Trigger4 = var(50) := 26164
value = 261

[State -3]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = EnemyNear,MoveType = H
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000
Trigger1 = StateNo = 260 && MoveHit
Trigger1 = var(50) := 145061
value = IfElse(EnemyNear,StateType = S && (var(16)&2**1) = 0, 1450, 1850)

[State -3,220接不上6B就直接升龙脚]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = EnemyNear,MoveType = H
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000
TriggerAll = P2BodyDist x = [56,65]
Trigger1 = StateNo = 220 && AnimElem = 4,> 0 && MoveHit
Trigger1 = var(50) := 130063
Trigger2 = StateNo = 420 && AnimElem = 3,> 0 && MoveHit
Trigger2 = var(50) := 130062
value = 1300

;------------------------------------------------------------------------------------------------
;MoveContact中
;------------------------------------------------------------------------------------------------
[State -3]
Type = ChangeState
TriggerAll = !isHelper
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !InGuardDist || EnemyNear,Facing = Facing
TriggerAll = EnemyNear,StateType != L
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000 || EnemyNear,StateNo = [120,159]
TriggerAll = (var(16)&2**2) = 0 && (var(16)&2**3)  = 0
;版边近D接烈风拳无限连
Trigger1 = var(17) = 1 
Trigger1 = Helper(33000),var(14) != 1150
Trigger1 = EnemyNear,StateNo >= 5000
Trigger1 = EnemyNear,BackEdgeBodyDist < 5 || P2BodyDist x < 20
Trigger1 = (abs(P2BodyDist X) < 24)
Trigger1 = EnemyNear,GetHitvar(HitTime) >= 5
Trigger1 = var(54) := 235
Trigger1 = var(50) := 23566
;近C
Trigger2 = var(17) = 1 
Trigger2 = EnemyNear,StateType = S
Trigger2 = (abs(P2BodyDist X) < 29)
Trigger2 = EnemyNear,StateNo >= 5000
Trigger2 = P2BodyDist x - fvar(12) * 6 < 50 || (EnemyNear,BackEdgeBodyDist < 5 && P2BodyDist x - Vel X*5 < 50)
Trigger2 = EnemyNear,GetHitvar(HitTime) = [5,6]
Trigger2 = var(54) := 215
Trigger2 = var(50) := 21566
;2A
Trigger3 = var(17) = 1 
Trigger3 = EnemyNear,GetHitvar(HitTime) = [2,4]
Trigger3 = P2BodyDist x = [-35, 35]
Trigger3 = var(54) := 400
Trigger3 = var(50) := 40066
;2B
Trigger4 = var(17) = 1 
Trigger4 = EnemyNear,GetHitvar(HitTime) = [3,5]
Trigger4 = P2BodyDist x = [-55, 55]
Trigger4 = var(54) := 420
Trigger4 = var(50) := 42066
;6B
Trigger5 = EnemyNear,StateNo >= 5000
Trigger5 = var(17) = 1 
Trigger5 = EnemyNear,GetHitvar(HitTime) = [5,8]
Trigger5 = P2BodyDist x = [55, 68]
Trigger5 = var(54) := 260
Trigger5 = var(50) := 26066

value = var(54)

;---------------------------------------------------------------------------------
;隐藏浮空追击
[State -3]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = var(9) = 1
TriggerAll = var(17) = 1
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,MoveType = H
TriggerAll = Life < LifeMax*0.3
TriggerAll = power >= 3000 || (var(52) > 0 && power >= 1000)
TriggerAll = !((var(52) = 0 && power >= 4000) || (var(52) > 0 && power >= 2000));能MAX死亡终结 >> 搬运的，不要隐藏
TriggerAll = EnemyNear,Life*EnemyNear,const(data.defence)/100.0 > 400 || EnemyNear,Life*EnemyNear,const(data.defence)/100.0 < 300
;追击剪刀脚
Trigger1 = NumTarget(1302) || EnemyNear,StateNo = 5050 || EnemyNear,StateNo = 1321
Trigger1 = var(50) := 300061
;追击C投
Trigger2 = EnemyNear,StateNo = 823 
Trigger2 = var(50) := 300062
;追击5A
Trigger3 = Numtarget(200) || NumTarget(205) 
Trigger3 = var(50) := 300063
;追击剪刀脚
Trigger4 = Numtarget(1302)
Trigger4 = var(50) := 300064
value = 3000

;---------------------------------------------------------------------------------
;白罗浮空取消追击
[State -3]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = var(9) = 0 
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,MoveType = H
;最后一下剪刀脚
Trigger1 = (var(52) = 0 && Power = [2000,2820)) || (var(52) > 0 && Power < 1000)
Trigger1 = var(38) = Helper(11990),var(16)
Trigger1 = fvar(15) < 180
Trigger1 = EnemyNear,StateType = A
Trigger1 = StateNo = 1300 && MoveHit
Trigger1 = StateType != A
Trigger1 = var(50) := 240061
;补刀用
Trigger2 = var(50) = 135063
Trigger2 = EnemyNear,Life > 0
Trigger2 = (var(52) = 0 && Power >= 2000) || (var(52) > 0 && Power < 1000)
Trigger2 = EnemyNear,StateType = A
Trigger2 = StateNo = 1305 && MoveHit
Trigger2 = StateType != A
Trigger2 = var(50) := 240062
value = 2400

;---------------------------------------------------------------------------------
;搬运浮空追击
[State -3]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = var(9) = 0 
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,MoveType = H && EnemyNear,StateType = A
TriggerAll = var(17) = 1
Triggerall = power < 1000 && var(52) = 0
Triggerall = Helper(33000),var(14) = [1300,1301]
Trigger1 = EnemyNear,StateNo = 1321
Trigger1 = EnemyNear,Pos Y + EnemyNear,Vel Y * 11 + fvar(13) * 11 * (11 + 1) / 2 = [-65, -34)
Trigger1 = P2BodyDist X = [-5,40]
Trigger1 = var(50) := 125061
value = 1250

;---------------------------------------------------------------------------------
;剪刀脚浮空追击
[State -3,D发剪刀脚收尾]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = var(9) = 0 
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,MoveType = H && EnemyNear,StateType = A
TriggerAll = var(17) = 1
TriggerAll = var(52) = 0
TriggerAll = EnemyNear,StateNo = 1321
TriggerAll = EnemyNear,Pos Y + EnemyNear,Vel Y * 8 + fvar(13) * 8 * (8 + 1) / 2 = [-65, -11)
TriggerAll = P2BodyDist X = [-15, 70]
Triggerall = !(Life<250&&Power>=1000)
;收尾用
Trigger1 = EnemyNear,Life * EnemyNear,Const(data.defence)/100.0 < 60
Trigger1 = var(50) := 135061

Trigger2 = var(52) = 0
Trigger2 = Power < 790 || (EnemyNear,Life * EnemyNear,Const(data.defence)/100.0 > 240 && Power = [1000, 1790])
Trigger2 = var(38) = (Helper(11990),var(16) - 1)
Trigger2 = var(50) := 135062

Trigger3 = var(52) = 0
Trigger3 = (EnemyNear,Life * EnemyNear,Const(data.defence)/100.0 > 430 && Power = [2000, 2790])
Trigger3 = var(38) = (Helper(11990),var(16) - 1)
Trigger3 = var(50) := 135063

value = 1350

[State -3]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = var(9) = 0 
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,MoveType = H && EnemyNear,StateType = A
TriggerAll = var(17) = 1
TriggerAll = var(38) = (Helper(11990),var(16) - 1) || (EnemyNear,Life*EnemyNear,const(data.defence)/100.0 < 300 && (Power>=3000 ||(var(52)>0 && power >= 1000)) && Life < LifeMax*0.3)
TriggerAll = EnemyNear,StateNo = 1321
TriggerAll = P2BodyDist X = [-15, 70]
;对面不会高空受身
Trigger1 = (var(16)&2**5) = 0
Trigger1 = EnemyNear,Pos Y + EnemyNear,Vel Y * 8 + fvar(13) * 8 * (8 + 1) / 2 = [-25, -11]
Trigger1 = var(50) := 130064
;对面会高空受身
Trigger2 = (var(16)&2**5) = 1
Trigger2 = EnemyNear,Pos Y + EnemyNear,Vel Y * 8 + fvar(13) * 8 * (8 + 1) / 2 = [-50, -35)
Trigger2 = var(50) := 130065
value = 1300

[State -3]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = var(9) = 0 
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,MoveType = H && EnemyNear,StateType = A
TriggerAll = var(17) = 1
TriggerAll = var(38) < (Helper(11990),var(16) - 1)
Trigger1 = EnemyNear,Pos Y + EnemyNear,Vel Y * 8 + fvar(13) * 8 * (8 + 1) / 2 = [-50, -11)
Trigger1 = (P2BodyDist X - fvar(12) * 8 = [-10, 75]) || (EnemyNear,BackEdgeBodyDist < 5 && P2BodyDist X = [0, 75]) 
Trigger1 = var(50) := 130061
;针对隐藏，因为受击框打，可以再远点接升龙
Trigger2 = EnemyNear,StateNo = 3056
Trigger2 = EnemyNear,Pos Y + EnemyNear,Vel Y * 8 + fvar(13) * 8 * (8 + 1) / 2 = [-50, -10)
Trigger2 = P2BodyDist X = [0, 87]
Trigger2 = var(50) := 130062
;针对隐藏，因为受击框打，可以再远点接升龙
Trigger3 = EnemyNear,StateNo = 3056
Trigger3 = EnemyNear,Pos Y + EnemyNear,Vel Y * 10 + fvar(13) * 10 * (10 + 1) / 2 = [-120, -75]
Trigger3 = (P2BodyDist X - fvar(12) * 10 = [0, 103])  || (EnemyNear,BackEdgeBodyDist < 5 && P2BodyDist X = [0, 103]) 
Trigger3 = var(50) := 130063
;追击JCD 
value = 1300


[State -3,追击绝情打击]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = var(9) = 0 
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,MoveType = H && EnemyNear,StateType = A
TriggerAll = var(17) = 1
TriggerAll = EnemyNear,StateNo = 1471 && EnemyNear,MoveType = H
Trigger1 = EnemyNear,Facing != Facing
Trigger1 = EnemyNear,Pos Y + EnemyNear,Vel Y * 7 + fvar(13) * 7 * (7 + 1) / 2 = [-50, -20)
Trigger1 = (P2BodyDist X = [-30, -8]) || (P2BodyDist X = [8, 70])
Trigger1 = var(50) := 130066
value = 1300

;---------------------------------------------------------------------------------
;MAX搬运浮空追击
[State -3]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = var(9) = 1
TriggerAll = var(17) = [1,2]
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,MoveType = H && EnemyNear,StateType = A
TriggerAll = (var(52)=0 && Power < 4000) || (var(52)>0 && power >= 3000)
TriggerAll = Power >= 3000 || (var(52) > 0 && power >= 1000)
Triggerall = !(Power>=4000||(Power>=2000&&var(52)>0))
TriggerAll = Life > EnemyNear,Life && (EnemyNear,Life > 400 || EnemyNear,Life < 320)
Trigger1 = (((P2BodyDist X-fvar(12)*5)/8.0) + 5) = [fvar(11)-6, fvar(11)-3]
Trigger1 = var(50) := 210061
;追剪刀脚，计算总是有问题
Trigger2 = EnemyNear,StateNo = 1321
Trigger2 = EnemyNear,StateType = A
Trigger2 = Power < 4000
Trigger2 = fvar(11) = [7,11]
Trigger2 = var(50) := 210062
value = 2100

;---------------------------------------------------------------------------------
;搬运浮空追击
[State -3]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = var(9) = 1
TriggerAll = var(17) = [1, 2]
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,MoveType = H
TriggerAll = Power >= 1000 || var(52) > 0
Triggerall = Helper(11990),var(18) = 0 || EnemyNear,Life < 150

;4气或者BC状态2气可以使用max死亡终结->搬运
Trigger1 = !(Power >= 4000 || (var(52) > 0 && Power >= 2000))
Trigger1 = !(Power>=3000||(var(52)>0&&power>=1000))
Trigger1 = P2BodyDist x < 90
Trigger1 = EnemyNear,StateType = A
Trigger1 = Life > EnemyNear,Life && (EnemyNear,Life > 240 || EnemyNear,Life < 150)
Trigger1 = EnemyNear,Pos Y < -50
Trigger1 = (((P2BodyDist X - fvar(12) * 5) / 8.0) + 5.0) = [fvar(11)-5, fvar(11)-2]
Trigger1 = var(50) := 200061
;能用max超杀用max超杀
Trigger2 = !(Power >= 3000 || (var(52) > 0 && Power >= 1000))
Trigger2 = EnemyNear,StateNo = 1321
Trigger2 = EnemyNear,StateType = A
Trigger2 = Life > EnemyNear,Life && (EnemyNear,Life > 240 || EnemyNear,Life < 120)
Trigger2 = Power < 3000
Trigger2 = fvar(11) = [9,11]
Trigger2 = var(50) := 200062

;追击MAX死亡终结
Trigger3 = EnemyNear,StateNo = [3000,3100]
value = 2000

;---------------------------------------------------------------------------------
;死亡突袭追击烈风拳
[State -3]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = var(17) = [1,2]
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,MoveType = H 
TriggerAll = ProjHit1150 = 1, > 0 || ProjHit1100 = 1, > 0
TriggerAll = P2BodyDist x < 135

Trigger1 = Power >= 3000 || (var(52) > 0 && Power >= 1000)
Trigger1 = EnemyNear,StateType != A
Trigger1 = EnemyNear,Life = [220, 400]
Trigger1 = EnemyNear,GetHitvar(HitTime) >= 18
Trigger1 = P2BodyDist x >= 100
Trigger1 = var(54) := 2300
Trigger1 = var(50) := 230061

Trigger2 = Power >= 1000 || var(52) > 0
Trigger2 = EnemyNear,StateType != A
Trigger2 = EnemyNear,GetHitvar(HitTime) >= 18
Trigger2 = P2BodyDist x >= 100
Trigger2 = var(54) := 2250
Trigger2 = var(50) := 225061

value = var(54)

;---------------------------------------------------------------------------------
;MAX死亡终结追击
[State -3]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = var(17) = [1,2]
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,MoveType = H 
TriggerAll = Power >= 3000 || (var(52) > 0 && Power >= 1000)
Trigger1 = EnemyNear,Vel Y != 0
Trigger1 = var(9) = 1
Trigger1 = EnemyNear,StateType = A && EnemyNear,StateNo != 5040
Trigger1 = P2BodyDist x = [-5,116]
Trigger1 = EnemyNear,Pos Y + EnemyNear,Vel Y * 6 + fvar(13) * 6 * (6 + 1) / 2 = [-45, -25)
Trigger1 = var(50) := 260061
;D投抓墙角
Trigger2 = P2BodyDist x < 90
Trigger2 = EnemyNear,BackEdgeBodyDist < 5
Trigger2 = EnemyNear,StateNo = 872
Trigger2 = var(50) := 260062
;裂风拳追击
Trigger3 = EnemyNear,StateType != A
Trigger3 = EnemyNear,GetHitvar(hitcount)>=6 || EnemyNear,Life = [220, 400]
Trigger3 = ProjHit1150 = 1, > 0
Trigger3 = EnemyNear,GetHitvar(HitTime) >= 6
Trigger3 = P2BodyDist x < 100
Trigger3 = var(50) := 260063
;近A追击
value = 2600

;---------------------------------------------------------------------------------
;死亡终结追击
[State -3]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = var(17) = [1,2]
TriggerAll = EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = Power < 3000
TriggerAll = Power >= 1000 || var(52) > 0

Trigger1 = EnemyNear,Vel Y != 0
Trigger1 = var(9) = 1
Trigger1 = EnemyNear,StateType = A
Trigger1 = EnemyNear,StateNo != 5040
Trigger1 = P2BodyDist x = [-5,116]
Trigger1 = EnemyNear,Pos Y + EnemyNear,Vel Y * 6 + fvar(13) * 6 * (6 + 1) / 2 = [-45, -25)
Trigger1 = var(50) := 250061
;D投抓墙角
Trigger2 = P2BodyDist x < 90
Trigger2 = EnemyNear,BackEdgeBodyDist < 5
Trigger2 = EnemyNear,StateNo = 872
Trigger2 = var(50) := 250062
;裂风拳追击
Trigger3 = EnemyNear,GetHitvar(hitcount)>=6 || EnemyNear,Life = [50, 220]
Trigger3 = ProjHit1150 = 1, > 0
Trigger3 = EnemyNear,StateType != A
Trigger3 = EnemyNear,GetHitvar(HitTime) >= 6
Trigger3 = P2BodyDist x < 100
Trigger3 = var(50) := 250063
value = 2500

;---------------------------------------------------------------------------------
;毁灭压杀
[State -3]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = var(9) = 0 
TriggerAll = var(52) = 0
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,MoveType = H && EnemyNear,StateType = A
TriggerAll = var(17) = 1
;正常追击
Trigger1 = Fvar(15)<220
Trigger1 = P2BodyDist x>130||!(Helper(33000),var(14)=[1850,1851])
Trigger1 = (P2BodyDist x + 30 - fvar(12)*7)/15.0 + 12 = [fvar(11)-6, fvar(11)-3]
Trigger1 = var(50) := 185067
value = 1850

;---------------------------------------------------------------------------------
;近轻拳追击浮空
[State -3]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = var(9) = 0 
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,MoveType = H && EnemyNear,StateType = A
TriggerAll = var(17) = 1
TriggerAll = (abs(P2BodyDist X) < 24)
TriggerAll = var(38)= Helper(11990),var(16) || EnemyNear,Pos Y+EnemyNear,Vel Y*8+fvar(13)*8*(8+1)/2>= -10
Trigger1 = EnemyNear,Pos Y+EnemyNear,Vel Y*3+fvar(13)*3*(3+1)/2=[-45,-20)
value = 205

;---------------------------------------------------------------------------------
;远轻拳追击浮空
[State -3]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = var(9) = 0 
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,MoveType = H && EnemyNear,StateType = A
TriggerAll = var(17) = 1
TriggerAll = (abs(P2BodyDist X) >= 24)
TriggerAll = var(38)= Helper(11990),var(16) || EnemyNear,Pos Y + EnemyNear,Vel Y * 8 + fvar(13) * 8 * (8 + 1) / 2 >= -10
Trigger1 = P2BodyDist x - fvar(12)*6 < 64
Trigger1 = EnemyNear,Pos Y + EnemyNear,Vel Y * 6 + fvar(13) * 6 * (6 + 1) / 2 = [-35,-20)
value = 200

;---------------------------------------------------------------------------------
;凯撒波追击浮空
[State -3]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,MoveType = H && EnemyNear,StateType = A
TriggerAll = var(17) = 1
;追击
Trigger1 = P2BodyDist x > 150
Trigger1 = (P2BodyDist x - 35)/16.0 + 6 = [fvar(11)-3,fvar(11)]
Trigger1 = var(50):=100067
;
Trigger2 = Fvar(12)<0
Trigger2 = P2BodyDist x > 170
Trigger2 = EnemyNear,Pos Y < -100
Trigger2 = EnemyNear,StateNo>=5000||EnemyNear,StateNo=1021
Trigger2 = var(50):=100068
value = 1000

;------------------------------------------------------------------------------------------------
;凯撒波追击
;------------------------------------------------------------------------------------------------
[State -3]
Type = ChangeState
TriggerAll = !isHelper
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = EnemyNear,MoveType = H
Triggerall = EnemyNear,StateType != L
TriggerAll = EnemyNear,StateType != A
TriggerAll = P2BodyDist x > 70
TriggerAll = var(17) = 1
;凯撒波最速接烈风拳
Trigger1 = ProjHit1150 = 1,>0
Trigger1 = var(50) := 100061
;
Trigger2 = ProjHit1100 = 1,>0
Trigger2 = var(50) := 100062
value = 1000


[State -3,凯撒波追击 蓄力凯撒波]
Type = ChangeState
TriggerAll = !isHelper
TriggerAll = var(59)
Triggerall = var(47) = 0
Triggerall = var(9) = 0
Triggerall = var(30) > 0
TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = EnemyNear,MoveType = H
TriggerAll = EnemyNear,StateType = A
TriggerAll = var(17) = 1
;
Trigger1 = P2BodyDist x > 135
Trigger1 = ProjHit1000 =1 ,>0
Trigger1 = var(50) := 100063
value = 1000


;---------------------------------------------------------------------------------
;连携
;---------------------------------------------------------------------------------
[State -3,必杀连携用]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = EnemyNear,MoveType = H
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo = [150,155]
TriggerAll = StateNo = 260 && MoveGuarded 
;毁灭压杀
Trigger1 = var(27) != 1850 || EnemyNear,Power >= 1000
Trigger1 = var(54) := IfElse(EnemyNear,BackEdgeBodyDist > 100 && P2BodyDist x < 30, 1850, 1800)
Trigger1 = var(50) := 185066
Trigger1 = var(27) := 1850
;裂风拳
Trigger2 = var(27) = 1850
Trigger2 = var(54) := 1150
Trigger2 = var(50) := 115066
Trigger2 = var(27) := 1150
value = var(54)

[State -3,260挥空]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = !EnemyNear,Ctrl
Triggerall = StateType != A
Trigger1 = var(16)&2**2
Trigger1 = var(17) = 2
Trigger1 = EnemyNear,MoveType != H
Trigger1 = var(50) := 180064
;毁灭压杀
value = 1800

[State -3,挥空]
Type = ChangeState
TriggerAll = var(59)
Triggerall = StateType != A
Trigger1 = var(17) = 2
Trigger1 = AnimTime <= -4
Trigger1 = EnemyNear,MoveType = A || EnemyNear,Ctrl
Trigger1 = P2Dist x = [-40,0]
Trigger1 = var(50) := 130064
;剪刀脚
value = 1300


[State -3]
Type = ChangeState
value = 1950
TriggerAll = var(59)
TriggerAll = (StateNo = [600,640]) && MoveHit
TriggerAll = StateType = A
Trigger1 = Fvar(15) >= 80
Trigger1 = EnemyNear,MoveType = H
Trigger1 = EnemyNear,StateType = A
Trigger1 = Fvar(11) >= 10
Trigger1 = var(50) := 195061


;=================================================================================
;移动5
;=================================================================================

[State -3,后撤]
Type = ChangeState
value = 105
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = var(17) = 1
TriggerAll = BackEdgeBodyDist > 80
;
Trigger1 = P2BodyDist x > 0
Trigger1 = EnemyNear,MoveType = H && EnemyNear,StateType = A
Trigger1 = Fvar(12) > 0
Trigger1 = Fvar(11) > 28
Trigger1 = P2BodyDist x - (Fvar(11) - 15)*Fvar(12) < 0
Trigger1 = var(50) := 10551


[State -3,前行抓硬直]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = var(17) = 1
TriggerAll = StateType != A
TriggerAll = EnemyNear,NumProj = 0
TriggerAll = !PlayerIdExist(Helper(33333333),var(3)) || abs(PlayerId(Helper(33333333),var(3)),pos x - pos x) > 80 
;跑步抓出招硬直
Trigger1 = EnemyNear,Time > -EnemyNear,AnimTime
Trigger1 = EnemyNear,StateNo = [200,4999]
Trigger1 = EnemyNear,StateType != L
Trigger1 = !InGuardDist || EnemyNear,Facing = Facing
Trigger1 = EnemyNear,MoveType = A || EnemyNear,MoveType = I
Trigger1 = EnemyNear,AnimTime < -8
Trigger1 = P2BodyDist X > 75
Trigger1 = EnemyNear,Vel x <= 0
Trigger1 = StateNo != 99 && StateNo != 101
Trigger1 = var(54) := 99
Trigger1 = var(50) := 009981
;前行抓出招硬直
Trigger2 = EnemyNear,Time > -EnemyNear,AnimTime
Trigger2 = EnemyNear,StateNo = [200,4999]
Trigger2 = EnemyNear,StateType != L
Trigger2 = !InGuardDist || EnemyNear,Facing = Facing
Trigger2 = EnemyNear,MoveType = A || EnemyNear,MoveType = I
Trigger2 = EnemyNear,AnimTime < -8
Trigger2 = EnemyNear,Vel x <= 0
Trigger2 = P2BodyDist X = [0, 55]
Trigger2 = StateNo != 19
Trigger2 = var(54) := 19
Trigger2 = var(50) := 001982
;跑步抓5700
Trigger3 = StateNo != 99 && StateNo != 101
Trigger3 = EnemyNear,StateNo = 5700
Trigger3 = P2BodyDist X > 45
Trigger3 = var(54) := 99
Trigger3 = var(50) := 009983
;前行抓5700
Trigger4 = StateNo != 19
Trigger4 = EnemyNear,StateNo = 5700
Trigger4 = P2BodyDist X = [0,45]
Trigger4 = var(50) := 001984
Trigger4 = var(54) := 19
;跑步贴近抓防御硬直
Trigger5 = !InGuardDist
Trigger5 = EnemyNear,StateType!=L
Trigger5 = EnemyNear,StateType!=A
Trigger5 = EnemyNear,MoveType = H
Trigger5 = EnemyNear,GetHitvar(HitTime) >= 6
Trigger5 = P2BodyDist X > 55
Trigger5 = StateNo != 99 && StateNo != 101
Trigger5 = var(54) := 99
Trigger5 = var(50) := 9985
;前行贴近抓防御硬直
Trigger6 = !InGuardDist
Trigger6 = EnemyNear,StateType != A
Trigger6 = EnemyNear,MoveType = H
Trigger6 = EnemyNear,GetHitvar(HitTime) >= 6
Trigger6 = P2BodyDist x = [30,55]
Trigger6 = StateNo != 19 && StateNo != 99
Trigger6 = var(54) := 19
Trigger6 = var(50) := 001986
value = var(54)
IgnoreHitPause = 1

[State -3,前跑尽量贴近对方]
Type = ChangeState
TriggerAll = var(59) 
TriggerAll = var(17) = 1
TriggerAll = StateNo != 99
Trigger1 = P2BodyDist x > 140
Trigger1 = EnemyNear,MoveType = A 
Trigger1 = PlayerIdExist(Helper(33333333),var(3)) 
Trigger1 = PlayerId(Helper(33333333),var(3)),P2BodyDist x > 50
Trigger1 = EnemyNear,Time < -EnemyNear,AnimTime 
Trigger1 = EnemyNear,AnimTime < -30
value = 99


[State -3,前跑 通用]
Type = ChangeState
TriggerAll = var(59) 
TriggerAll = var(17) = 1 && (StateNo != [99,101])
TriggerAll = !EnemyNear,NumProj
TriggerAll = !PlayerIdExist(Helper(33333333),var(3))
;抓后背
Trigger1 = EnemyNear,Facing=Facing
Trigger1 = P2BodyDist x>50
Trigger1 = EnemyNear,StateNo>=200
Trigger1 = EnemyNear,MoveType=A||EnemyNear,MoveType=I
Trigger1 = EnemyNear,AnimTime<-6||EnemyNear,StateType=A
Trigger1 = var(50) := 990501
;打系统眩晕状态
Trigger2 = P2BodyDist x >= 50
Trigger2 = EnemyNear,StateNo = 5300
Trigger2 = var(50) := 990502
;隐藏追击
Trigger3 = P2BodyDist x > 50
Trigger3 = EnemyNear,StateNo = [3000,3100]
Trigger3 = EnemyNear,MoveType = H
Trigger3 = EnemyNear,StateType = A
Trigger3 = var(50) := 990503
;通用地面追击 Todo 改成前行
Trigger4 = EnemyNear,StateType != A
Trigger4 = P2BodyDist x>35
Trigger4 = EnemyNear,MoveType = H && !EnemyNear,Ctrl
Trigger4 = EnemyNear,StateNo >= 5000
Trigger4 = EnemyNear,GetHitvar(HitTime)>5||EnemyNear,StateNo=5700
Trigger4 = var(50) := 990504
;抓对面出招硬直
Trigger4 = !EnemyNear,Ctrl
Trigger4 = EnemyNear,MoveType != H
Trigger4 = EnemyNear,StateNo != 5120
Trigger4 = P2BodyDist x > 45
Trigger4 = EnemyNear,AnimTime<-6
Trigger4 = (EnemyNear,MoveType=A||EnemyNear,MoveType=I)&&EnemyNear,Time>-EnemyNear,AnimTime
Trigger4 = EnemyNear,StateNo>=200
Trigger4 = var(50) := 990504
;道具掩护前冲
Trigger5 = P2BodyDist x > 80
Trigger5 = numHelper(1710)||numHelper(1711)||numHelper(1731)||NumProjID(1100)||NumProjID(1150)
Trigger5 = var(50) := 990505
;敌人飞来,版边不够后退了
Trigger6 = Fvar(12) > 0
Trigger6 = EnemyNear,MoveType = H
Trigger6 = EnemyNear,StateType = A
Trigger6 = BackEdgeBodyDist < 45
Trigger6 = Fvar(11) > 20
Trigger6 = P2BodyDist x - (Fvar(11)-15)*Fvar(12) < 5
Trigger6 = var(50) := 990506
;敌人飞来
Trigger7 = Fvar(12) > 0
Trigger7 = EnemyNear,MoveType = H
Trigger7 = EnemyNear,StateType = A
Trigger7 = P2BodyDist x > 120 
Trigger7 = var(50) := 990507
;敌人飞走
Trigger8 = Fvar(12) < 0
Trigger8 = EnemyNear,MoveType = H
Trigger8 = EnemyNear,StateType = A
Trigger8 = P2BodyDist x = [50, 180]
Trigger8 = var(50) := 990508
;敌人飞来
Trigger9 = Fvar(12) > 0
Trigger9 = EnemyNear,MoveType = H
Trigger9 = EnemyNear,StateType = A
Trigger9 = Fvar(15) < 100
Trigger9 = Fvar(11) > 20
Trigger9 = P2BodyDist x - (Fvar(11)-15)*Fvar(12) < 5
Trigger9 = var(50) := 990509
;敌人必杀技
;AB距离不够闪到身后的
Trigger10 = (var(16)&2**8)
Trigger10 = EnemyNear,MoveType=A
Trigger10 = EnemyNear,StateNo=[1000,1999]
Trigger10 = EnemyNear,Time<=2
Trigger10 = P2BodyDist x = [65,130]
Trigger10 = var(50) := 990510
value = 99
IgnoreHitPause = 1


[State -3,前跑 无当身Todo ]
Type = ChangeState
TriggerAll = var(59) 
TriggerAll = var(17) = 1 && (StateNo != [99,101])
TriggerAll = !InGuardDist
TriggerAll = !EnemyNear,NumProj
TriggerAll = !PlayerIdExist(Helper(33333333),var(3))
;大于110必定前跑
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x >= 110
Trigger1 = var(50) := 990511
;大于80随机前跑
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x = [80,110]
Trigger2 = Random <= 100
Trigger2 = var(50) := 990512
;移动到合适的位置打敌人起身
Trigger3 = EnemyNear,StateType = L
Trigger3 = var(50) := 990513
value = 99
IgnoreHitPause = 1


[State -3,前进 通用]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = (Ctrl || StateNo = 1) || (StateNo = 18 && Time >= 20)
TriggerAll = EnemyNear,StateType != L
TriggerAll = EnemyNear,StateNo != [5120,5299]
TriggerAll = (PrevStateNo != [140,155]) || P2BodyDist X > 65
TriggerAll = !InGuardDist
TriggerAll = !enemy,numproj && !PlayerIdExist(Helper(33333333),var(3)) 
;追打可能的落地受身 todo 改为前行
Trigger1 = P2BodyDist x=[35,60]
Trigger1 = Fvar(12)<0
Trigger1 = EnemyNear,MoveType=H&&EnemyNear,StateType=A 
Trigger1 = P2BodyDist Y < -20
Trigger1 = var(50) := 190501
;对面受击中
Trigger2 = Fvar(12)<=0
Trigger2 = EnemyNear,StateNo>=5000 
Trigger2 = EnemyNear,MoveType=H&&EnemyNear,StateType!=L
Trigger2 = EnemyNear,GetHitvar(HitTime)>=3
Trigger2 = P2BodyDist x=[0,90]
Trigger2 = var(50) := 190502
;抓出招硬直
Trigger3 = !InGuardDist
Trigger3 = EnemyNear,StateNo = [200,4999]
Trigger3 = P2BodyDist x=[15,60]
Trigger3 = !EnemyNear,Ctrl
Trigger3 = EnemyNear,MoveType = A||EnemyNear,MoveType = I
Trigger3 = var(50) := 190503
;抓后背
Trigger4 = !InGuardDist
Trigger4 = EnemyNear,Facing = Facing
Trigger4 = P2BodyDist x = [30,70]
Trigger4 = EnemyNear,MoveType = A || EnemyNear,MoveType = I
Trigger4 = EnemyNear,AnimTime < -6
Trigger4 = var(50) := 190504
value = 19
IgnoreHitPause = 1

[State -3,前进 无当身]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = (Ctrl || StateNo = 1) || (StateNo = 18 && Time >= 20)
TriggerAll = EnemyNear,StateType != L
TriggerAll = EnemyNear,StateNo != [5120,5299]
TriggerAll = (PrevStateNo != [140,155]) || P2BodyDist X > 65
TriggerAll = !InGuardDist
Triggerall = EnemyNear,MoveType!=A
TriggerAll = !enemy,numproj && !PlayerIdExist(Helper(33333333),var(3)) 
TriggerAll = Helper(11990),var(37)=0;无当身技能
;随机前行
Trigger1 = EnemyNear,MoveType != H
Trigger1 =(P2BodyDist X = [35,120])
Trigger1 = Random <= 75
Trigger1 = var(50) := 190511
;随机前行
Trigger2 = EnemyNear,MoveType != H
Trigger2 = P2BodyDist X > 140
Trigger2 = Random <= 100
Trigger2 = var(50) := 190512
;移动到合适的位置打敌人起身
Trigger3 = P2BodyDist x > 55
Trigger3 = EnemyNear,StateType = L
Trigger3 = var(50) := 190513
value = 19
IgnoreHitPause = 1


[State -3,后退]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = Ctrl || StateNo = 1 || (StateNo = 99 && Time >= 12) || (StateNo = 19 && Time >= 12) || StateNo = [120,149]
TriggerAll = !(EnemyNear,MoveType = A ||(EnemyNear,MoveType = I && EnemyNear,StateNo < 5000))
TriggerAll = BackEdgeBodyDist > 30
;移动到合适的位置打敌人起身
Trigger1 = !InGuardDist
Trigger1 = P2BodyDist x < 40
Trigger1 = EnemyNear,StateNo = 5120
Trigger1 = var(50) := 180501
;
Trigger2 = !InGuardDist
Trigger2 = EnemyNear,StateType != A
Trigger2 = !(EnemyNear,MoveType = H || (EnemyNear,StateNo = [120,159]))
Trigger2 = P2BodyDist X < 40
Trigger2 = var(50) := 180502
;
Trigger3 = !InGuardDist
Trigger3 = EnemyNear,Ctrl
Trigger3 = P2BodyDist x < 40
Trigger3 = var(50) := 180503
;敌人飞过来
Trigger4 = fvar(12) > 0
Trigger4 = EnemyNear,MoveType = H && EnemyNear,StateType = A
Trigger4 = P2BodyDist x = [20,60]
Trigger4 = var(50) := 180504
;敌人飞走
Trigger5 = fvar(12) < 0
Trigger5 = EnemyNear,MoveType = H && EnemyNear,StateType = A
Trigger5 = P2BodyDist x < 20
Trigger5 = var(50) := 180505
value = 18
IgnoreHitPause = 1

[State -3,后退]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = Ctrl || StateNo = 1 || (StateNo = 99 && Time >= 12) || (StateNo = 19 && Time >= 12) || StateNo = [120,149]
TriggerAll = (EnemyNear,MoveType=I&&EnemyNear,StateNo<120)
TriggerAll = BackEdgeBodyDist > 30
;敌人有当身 保持一个长距离
Triggerall = !InGuardDist
Trigger1 = Helper(11990),var(37)!=0
Trigger1 = EnemyNear,Ctrl||EnemyNear,StateNo<200
Trigger1 = EnemyNear,MoveType=I
Trigger1 = P2BodyDist x < 90
Trigger1 = var(50) := 180506
value = 18
IgnoreHitPause = 1

[State -3,跳跃]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = var(17) = 1
TriggerAll = Life >= 100
TriggerAll = EnemyNear,Facing != Facing
;前小跳躲投技
Trigger1 = P2BodyDist x < 90
Trigger1 = Helper(33000),var(14) = 3
Trigger1 = var(4) := 1
Trigger1 = var(50) := 390501
;起攻打蹲
Trigger2 = var(44) <= 0
Trigger2 = !EnemyNear,Ctrl 
Trigger2 = EnemyNear,StateType = C
Trigger2 = EnemyNear,MoveType = A && EnemyNear,AnimTime <= -27
Trigger2 = P2BodyDist X = [60,120]
Trigger2 = var(4) := 2
Trigger2 = var(50) := 390502
;起攻打可能有的飞行道具/援助
Trigger3 = helper(11990),var(19) = 0
;AB距离不够闪到身后的
Trigger3 = (var(16)&2**8)=0
Trigger3 = !EnemyNear,Ctrl 
Trigger3 = EnemyNear,StateNo = [1000,1999]
Trigger3 = EnemyNear,StateType = S
Trigger3 = (EnemyNear,MoveType=A||EnemyNear,MoveType=I)&&EnemyNear,AnimTime<=-35
Trigger3 = EnemyNear,Time<=6
Trigger3 = P2BodyDist X = [60,135]
Trigger3 = var(4) := IfElse(P2BodyDist X < 85 && StateNo != 99, 3, 4)
Trigger3 = var(50) := 390503
;起攻打可能有的飞行道具/援助
Trigger4 = helper(11990),var(19) = 0
;AB距离不够闪到身后的
Trigger4 = (var(16)&2**8)=0
Trigger4 = !EnemyNear,Ctrl 
Trigger4 = EnemyNear,StateNo = [1000,1999]
Trigger4 = EnemyNear,StateType = S
Trigger4 = (EnemyNear,MoveType=A||EnemyNear,MoveType=I)&&EnemyNear,AnimTime<=-28
Trigger4 = Enemynear,Time<=4
Trigger4 = P2BodyDist X = [40,160]
Trigger4 = var(4) := ifelse(P2BodyDist x>25,4,2)
Trigger4 = var(50) := 390504
;打5040
Trigger5 = !EnemyNear,Ctrl && EnemyNear,StateNo = 5040
Trigger5 = fvar(11) > 9
Trigger5 = P2BodyDist X < 60
Trigger5 = var(4) := IfElse(P2BodyDist X < 80 && StateNo != 99, 1, 2)
Trigger5 = var(50) := 390505
;打5040
Trigger6 = !EnemyNear,Ctrl && EnemyNear,StateNo = 115040 && Power < 1000
Trigger6 = fvar(11) = [1,3]
Trigger6 = P2BodyDist X < 60
Trigger6 = var(4) := IfElse(P2BodyDist X < 80 && StateNo != 99, 1, 2)
Trigger6 = var(50) := 390506
;后跳对空
Trigger7 = BackEdgeBodyDist > 60
Trigger7 = EnemyNear,StateType = A
Trigger7 = EnemyNear,MoveType = A || EnemyNear,Ctrl
Trigger7 = Fvar(12) > 0
Trigger7 = Fvar(11) > 20
Trigger7 = P2BodyDist x - (Fvar(11) - 9)*Fvar(12) < 13
Trigger7 = P2BodyDist x > 50
Trigger7 = var(4) := 6
Trigger7 = var(50) := 390507
;起攻
Trigger8 = var(43)=0
Trigger8 = !InGuardDist
Trigger8 = P2BodyDist x = [95,115]
Trigger8 = EnemyNear,Vel x <= 0
Trigger8 = EnemyNear,StateType!=L&&EnemyNear,MoveType!=H
Trigger8 = EnemyNear,Ctrl||(EnemyNear,MoveType=I&&EnemyNear,StateNo<200)
Trigger8 = var(4) := 4
Trigger8 = var(50) := 390508
Trigger8 = var(43):=var(43)+120
;起攻
Trigger9 = !InGuardDist
Trigger9 = P2BodyDist x = [70,90]
Trigger9 = EnemyNear,MoveType=H&&EnemyNear,StateNo=[150,155]
Trigger9 = EnemyNear,GetHitvar(Hittime)>=7
Trigger9 = var(4) := 4
Trigger9 = var(50) := 390509

value = 39
IgnoreHitPause = 1


;=================================================================================
;打起身4
;=================================================================================
[State -3,烈风拳打起身]
Type = ChangeState
TriggerAll = !isHelper
TriggerAll = var(59)
TriggerAll = !InGuardDist
TriggerAll = StateType != A
TriggerAll = var(17) = 1
TriggerAll = EnemyNear,StateNo = 5120
Triggerall = P2BodyDist x >= 60
Trigger1 = -EnemyNear,AnimTime=[(P2BodyDist x/7)+6,(P2BodyDist x/7)+8]
Trigger1 = var(50):=115041
Trigger1 = var(54):=1150
;
Trigger2 = -EnemyNear,AnimTime=[(P2BodyDist x/4)+6,(P2BodyDist x/4)+8]
Trigger2 = var(50):=115042
Trigger2 = var(54):=1100
value = var(54)

[State -3,跳跃]
Type = ChangeState
TriggerAll = !isHelper
TriggerAll = var(59)
TriggerAll = !InGuardDist
TriggerAll = StateType != A
TriggerAll = var(17) = 1
;小影跳打起身(非版边)
Trigger1 = EnemyNear,AnimTime = [-18,-8]
Trigger1 = EnemyNear,BackEdgeBodyDist > 10
Trigger1 = EnemyNear,StateNo = 5120
Trigger1 = P2BodyDist x < 75
Trigger1 = var(4) := ifelse(P2BodyDist x < 45 && Random < 400, 1, 2)
Trigger1 = var(50) := 390401
;小影跳打起身 版边
Trigger2 = EnemyNear,AnimTime = [-18,-6]
Trigger2 = EnemyNear,BackEdgeBodyDist <= 10||Fvar(15)<93
Trigger2 = EnemyNear,StateNo = 5120
Trigger2 = P2BodyDist x < 85
Trigger2 = var(4) := 2
Trigger2 = var(50) := 390402
;大影跳打起身(版边)
Trigger3 = P2BodyDist x < 135
Trigger3 = EnemyNear,AnimTime = [-22,-12]
Trigger3 = EnemyNear,BackEdgeBodyDist <= 10
Trigger3 = EnemyNear,StateNo = 5120
Trigger3 = var(4) := 4
Trigger3 = var(50) := 390403
;打版边落地受身
Trigger4 = var(16)&2**3
Trigger4 = !EnemyNear,Ctrl
Trigger4 = EnemyNear,BackEdgeBodyDist <= 10
Trigger4 = P2BodyDist X < 50
Trigger4 = EnemyNear,Pos Y >= -10
Trigger4 = var(4) := ifelse(Fvar(12)>=0,6,2)
Trigger4 = var(50) := 390404
;打版中落地受身
Trigger5 = var(16)&2**3
Trigger5 = !EnemyNear,Ctrl
Trigger5 = EnemyNear,BackEdgeBodyDist > 10
Trigger5 = P2BodyDist X < 70
Trigger5 = EnemyNear,Pos Y >= -10
Trigger5 = var(4) := ifelse(P2BodyDist x<50&&Fvar(12)>=0,6,2)
Trigger5 = var(50) := 390405
;道具打中直接走
Trigger6 = NumTarget(1700) || NumTarget(1710)
Trigger6 = EnemyNear,MoveType = H
Trigger6 = P2BodyDist x > 160
Trigger6 = var(50) := 390406
Trigger6 = var(4) := 4
;大影跳打起身非版边
Trigger7 = P2BodyDist x=[55,95]
Trigger7 = EnemyNear,AnimTime = [-22,-14]
Trigger7 = EnemyNear,BackEdgeBodyDist>10
Trigger7 = EnemyNear,StateNo = 5120
Trigger7 = var(4) := 4
Trigger7 = var(50) := 390407
;大跳打起身非版边
Trigger8 = P2BodyDist x<55
Trigger8 = EnemyNear,AnimTime = [-22,-14]
Trigger8 = EnemyNear,BackEdgeBodyDist>10
Trigger8 = EnemyNear,StateNo = 5120
Trigger8 = var(4) := 3
Trigger8 = var(50) := 390408
value = 39
IgnoreHitPause = 1


[State -3,重力机器最速追剪刀脚]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = var(17) = 1
TriggerAll = Power < 1000
TriggerAll = !var(47)

Trigger1 = EnemyNear,StateType = L
Trigger1 = P2BodyDist x > 150 && EnemyNear,BackEdgeBodyDist >= 5
Trigger1 = var(9) = 1
Trigger1 = Helper(33000),var(14) = 1300
Trigger1 = var(50) := 172041
value = 1720


;=================================================================================
;立回3
;=================================================================================
[State -3]
Type = ChangeState
value = 1950
TriggerAll = var(59)
TriggerAll = Ctrl || StateNo = 105 || (StateNo = [120,149]) || (StateNo = [600,640])
TriggerAll = StateType = A
TriggerAll = EnemyNear,MoveType != H
;敌人在空中,非版边
Trigger1 = EnemyNear,StateType = A
Trigger1 = EnemyNear,StateNo != 5040
Trigger1 = P2BodyDist x - fvar(12) * 10 = [25, 125]
Trigger1 = P2BodyDist y + EnemyNear,Vel Y * 10 + fvar(13) * 10 * (10 + 1) / 2 = [-80,80]
Trigger1 = fvar(11) > 12
Trigger1 = var(50) := 195031
;对地面
Trigger2 = EnemyNear,StateNo>=200
Trigger2 = !PlayerIdExist(Helper(33333333),var(3)) || Helper(11990),var(19) = 1
Trigger2 = P2BodyDist x - (Vel x+fvar(12))*3 > -5;保证跳不过去,跳过去了还是用JB
Trigger2 = EnemyNear,MoveType = A
Trigger2 = EnemyNear,StateType != A
Trigger2 = EnemyNear,StateNo = [200,4999]
Trigger2 = EnemyNear,Time<-EnemyNear,AnimTime 
Trigger2 = P2BodyDist x = [15, 135]
Trigger2 = Pos Y=[-70,-20]
Trigger2 = Fvar(12)>=0
Trigger2 = var(50) := 195032
;切返地面超杀
Trigger3 = StateNo = 610 || StateNo = 615 || StateNo = 630 ||StateNo = 635 || StateNo = 640 
Trigger3 = MoveContact
Trigger3 = EnemyNear,MoveType = A 
Trigger3 = EnemyNear,StateNo = [1000,4999]
Trigger3 = EnemyNear,StateType != A
Trigger3 = EnemyNear,Time <= 3
Trigger3 = var(50) := 195033
IgnoreHitPause = 1

[State -3,空中重力机器对地面普通技]
Type = ChangeState
value = 1750
TriggerAll = var(59)
TriggerAll = Ctrl || StateNo = [120,149]
TriggerAll = StateType = A
;对地面
Trigger1 = EnemyNear,StateNo=[1000, 4999]
Trigger1 = EnemyNear,MoveType=A&&EnemyNear,Time<(-EnemyNear,AnimTime)
Trigger1 = EnemyNear,StateType!=A
Trigger1 = P2BodyDist Y > 80
Trigger1 = P2BodyDist x > 30
Trigger1 = var(50) := 175031
;对地面 防当身
Trigger2 = P2BodyDist x > 30
Trigger2 = EnemyNear,StateNo = [200, 4999]
Trigger2 = Helper(11990),var(43) = 1
Trigger2 = EnemyNear,StateType != A
Trigger2 = var(50) := 175032
;对地面 追不到了
Trigger3 = Vel Y>0
Trigger3 = P2BodyDist x>100 
Trigger3 = EnemyNear,StateType!=A
Trigger3 = EnemyNear,StateType!=L
Trigger3 = EnemyNear,MoveType!=H
Trigger3 = var(50) := 175033
;对地面 追不到了
Trigger4 = Vel Y>1
Trigger4 = Pos Y = [-60,-55]
Trigger4 = P2BodyDist x>50&&EnemyNear,vel X<0 
Trigger4 = EnemyNear,BackEdgeBodyDist>=10
Trigger4 = EnemyNear,StateType!=A
Trigger4 = EnemyNear,StateType!=L
Trigger4 = EnemyNear,MoveType!=H
Trigger4 = var(50) := 175034



[State -3,JCD]
Type = ChangeState
value = 640
TriggerAll = !isHelper
TriggerAll = var(59)
TriggerAll = Ctrl || StateNo = [120,149]
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = fvar(9) >= 13
TriggerAll = EnemyNear,StateType = C
Triggerall = !EnemyNear,Ctrl
;对非版边地面
Trigger1 = EnemyNear,BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - Vel X * 12 - fvar(12) * 12 = [20, 55]
Trigger1 = P2BodyDist Y - Vel Y * 12 - const(movement.yaccel) * 12 * (12 + 1) / 2 <= 45
Trigger1 = var(50) := 64031
;对版边地面
Trigger2 = EnemyNear,BackEdgeBodyDist < 10 || EnemyNear,FrontEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x - Vel X * 12 - fvar(12) * 12  < 55
Trigger2 = P2BodyDist Y - Vel Y * 12 - const(movement.yaccel) * 12 * (12 + 1) / 2 <= 45
Trigger2 = var(50) := 64032

[State -3,JB]
Type = ChangeState
value = 625
TriggerAll = !isHelper
TriggerAll = var(59)
TriggerAll = Ctrl || StateNo = [120,149]
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = Vel x != 0 || var(4) = 9
TriggerAll = fvar(9) >= 6
;对非版边地面
Trigger1 = EnemyNear,BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - Vel X * 5 - fvar(12) * 5 < 45
Trigger1 = P2BodyDist Y - Vel Y * 5 - const(movement.yaccel) * 5 * (5 + 1) / 2 <= 65
Trigger1 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 12) || fvar(9) <= 11
Trigger1 = var(50) := 62531
;对版边地面
Trigger2 = EnemyNear,BackEdgeBodyDist < 10 || EnemyNear,FrontEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x - Vel X * 5 - fvar(12) * 5  < 45
Trigger2 = P2BodyDist Y - Vel Y * 5 - const(movement.yaccel) * 5 * (5 + 1) / 2 <= 65
Trigger2 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 12) || fvar(9) <= 11
Trigger2 = var(50) := 62532
;对空
Trigger3 = EnemyNear,StateNo != 5040
Trigger3 = EnemyNear,StateType = A
Trigger3 = P2BodyDist x - Vel x * 5 - fvar(12) * 5 = [-35, 60]
Trigger3 = P2BodyDist y - Vel Y * 5 - const(movement.yaccel) * 5 * (5 + 1) / 2 + EnemyNear,Vel Y * 5 + fvar(13) * 5 * (5 + 1) / 2 = [-30,60]
Trigger3 = var(50) := 62533
IgnoreHitPause = 1


[State -3,JD]
Type = ChangeState
value = 635
TriggerAll = !isHelper
TriggerAll = var(59)
TriggerAll = Ctrl || StateNo = [120,149]
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = Vel x != 0 || var(4) = 9
TriggerAll = fvar(9) >= 7
;对非版边地面
Trigger1 = EnemyNear,StateType != C
Trigger1 = EnemyNear,BackEdgeBodyDist >= 10
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - Vel X * 6 - fvar(12) * 6 = [-23, 60]
Trigger1 = P2BodyDist Y - Vel Y * 6 - const(movement.yaccel) * 6 * (6 + 1) / 2 <= 50
Trigger1 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 15) || fvar(9) <= 11
Trigger1 = var(50) := 63531
;对版边地面
Trigger2 = EnemyNear,StateType != C
Trigger2 = EnemyNear,BackEdgeBodyDist < 10 || EnemyNear,FrontEdgeBodyDist < 10
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x - Vel X*6 = [15,70]
Trigger2 = P2BodyDist Y - Vel Y * 6 - const(movement.yaccel) * 6 * (6 + 1) / 2 <= 50
Trigger2 = (EnemyNear,MoveType = A && InGuardDist && fvar(9) < 15) || fvar(9) <= 11
Trigger2 = var(50) := 63532
;对空
Trigger3 = EnemyNear,StateNo != 5040
Trigger3 = EnemyNear,StateType = A
Trigger3 = P2BodyDist x - Vel x * 6 - IfElse(EnemyNear,Facing != Facing,1,-1)*fvar(12) * 14 = [-10, 45]
Trigger3 = P2BodyDist y - Vel Y * 6 - const(movement.yaccel) * 6 * (6 + 1) / 2 + EnemyNear,Vel Y * 6 + fvar(13) * 6 * (6 + 1) / 2 = [-35,40]
Trigger3 = var(50) := 63533
;对空版边
Trigger4 = EnemyNear,StateNo != 5040
Trigger4 = EnemyNear,StateType = A
Trigger4 = EnemyNear,BackEdgeBodyDist < 10
Trigger4 = P2BodyDist x - Vel x * 6 - IfElse(EnemyNear,Facing != Facing,1,-1)*fvar(12) * 6 < 75
Trigger4 = P2BodyDist y - Vel Y * 6 - const(movement.yaccel) * 6 * (6 + 1) / 2 + EnemyNear,Vel Y * 6 + fvar(13) * 6 * (6 + 1) / 2 = [-10,40]
Trigger4 = var(50) := 63504

;------------------------------------------------------------------------------------------------
;以下是投技，注意优先级不要比抓硬直高
;------------------------------------------------------------------------------------------------
[State -3,D投]
Type = ChangeState
value = 850
TriggerAll = var(59)
TriggerAll = var(17) = 1
TriggerAll = StateNo != 99
TriggerAll = StateType != A
TriggerAll = EnemyNear,MoveType != H && EnemyNear,StateType != A
TriggerAll = (abs(P2BodyDist X) <= 18)
TriggerAll = EnemyNear,StateNo != 52
TriggerAll = BackEdgeBodyDist < FrontEdgeBodyDist
TriggerAll = EnemyNear,StateNo != 5120
TriggerAll = (var(16)&2**6)=0
;
Trigger1 = EnemyNear,Vel Y = 0
Trigger1 = EnemyNear,MoveType=I
Trigger1 = EnemyNear,Ctrl || (EnemyNear,StateNo < 200 && EnemyNear,StateNo != [31,59])
Trigger1 = var(50) := 85031
;
Trigger2 = (EnemyNear,StateNo < 1000 && EnemyNear,MoveType = A) || EnemyNear,MoveType = I
Trigger2 = EnemyNear,AnimTime >= -2
Trigger2 = var(50) := 85032
IgnoreHitPause = 1

[State -3,C投]
Type = ChangeState
value = 800
TriggerAll = var(59)
TriggerAll = var(17) = 1
TriggerAll = StateNo != 99
TriggerAll = StateType != A
TriggerAll = EnemyNear,MoveType != H && EnemyNear,StateType != A
TriggerAll = (abs(P2BodyDist X) <= 18)
TriggerAll = EnemyNear,StateNo != 52
TriggerAll = EnemyNear,StateNo != 5120
TriggerAll = (var(16)&2**6) = 0

Trigger1 = EnemyNear,Vel Y = 0
Trigger1 = EnemyNear,MoveType=I
Trigger1 = EnemyNear,Ctrl || (EnemyNear,StateNo < 200 && EnemyNear,StateNo != [31,59])
Trigger1 = var(50) := 80031

Trigger2 =  (EnemyNear,StateNo < 1000 && EnemyNear,MoveType = A) || EnemyNear,MoveType = I
Trigger2 = EnemyNear,AnimTime >= -2
Trigger2 = var(50) := 80032
IgnoreHitPause = 1

;--------------------------------------------------------------------------------------------------
;站立技能
[State -3, 近轻拳]
Type = ChangeState
TriggerAll = !isHelper
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = StateType != A
TriggerAll = (abs(P2BodyDist X) < 24)
TriggerAll = var(17) = 1
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = !PlayerIdExist(Helper(33333333),var(3)) || abs(PlayerId(Helper(33333333),var(3)),P2BodyDist x) > 50
TriggerAll = EnemyNear,Facing != Facing
;一段对空
Trigger1 = !InGuardDist
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x-fvar(12)*4=[-5,10]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 4 + fvar(13) * 4 * (4 + 1) / 2 = [-80,-57]
Trigger1 = var(50) := 020531
;一段抢空
Trigger2 = EnemyNear,MoveType = A
Trigger2 = EnemyNear,StateType = A
Trigger2 = EnemyNear,stateno = Helper(33000),var(2)
Trigger2 = EnemyNear,time < Helper(33000),var(3) - 2
Trigger2 = P2BodyDist x - fvar(12) * 2 = [ifelse(EnemyNear,Pos Y >= -35 && EnemyNear,Vel Y >=0,-100,-5),25]
Trigger2 = EnemyNear,pos y + EnemyNear,Vel Y * 2 + fvar(13) * 2 * (2 + 1) / 2 = [-65,-30]
Trigger2 = var(50) := 020532
;一段对空 版边或者很近
Trigger3 = !InGuardDist
Trigger3 = EnemyNear,StateType = A
Trigger3 = P2BodyDist x-fvar(12)*3<10
Trigger3 = BackEdgeBodyDist<5||(EnemyNear,Pos Y>=-60&&EnemyNear,Vel Y>0)
Trigger3 = EnemyNear,pos y + EnemyNear,Vel Y*3 + fvar(13)*3 *(3+1)/2=[-80,-57]
Trigger3 = var(50) := 020533

Value = 205

[State -3, 近轻脚]
Type = ChangeState
TriggerAll = !isHelper
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = var(17) = 1
TriggerAll = Random < 200
TriggerAll = StateType != A
TriggerAll = (abs(P2BodyDist X) < 24)
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = !PlayerIdExist(Helper(33333333),var(3)) || abs(PlayerId(Helper(33333333),var(3)),P2BodyDist x) > 50
;无当身技能
Triggerall = Helper(11990),var(37) = 0
;对地
Trigger1 = !InGuardDist
Trigger1 = var(42) != 225
Trigger1 = EnemyNear,StateType != A
Trigger1 = EnemyNear,Vel x >= 0
Trigger1 = p2bodydist x = [55, 72]
Trigger1 = var(50) := 022531
Trigger1 = var(43) := var(43) + 60
Trigger1 = var(42) := 225
value = 225

[State -3, 远轻脚]
Type = ChangeState
TriggerAll = !isHelper
TriggerAll = var(59)
TriggerAll = var(17) = 1
TriggerAll = RoundState = 2
TriggerAll = StateType != A
TriggerAll = (abs(P2BodyDist X) >= 21)
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = !PlayerIdExist(Helper(33333333),var(3)) || abs(PlayerId(Helper(33333333),var(3)),P2BodyDist x) > 50 
;无当身技能
Triggerall = Helper(11990),var(37) = 0
;对地
Trigger1 = !InGuardDist
Trigger1 = Random < 200
Trigger1 = var(42) != 220
Trigger1 = EnemyNear,StateType != A
Trigger1 = EnemyNear,Vel x >= 0
Trigger1 = p2bodydist x - ifelse(EnemyNear,StateNo >= 200,fvar(12)*7, 0) = [55,60]
Trigger1 = var(50) := 022031
Trigger1 = var(43) := var(43) + 60
Trigger1 = var(42) := 220
Value = 220

;--------------------------------------------------------------------------------------------------
;蹲技能

[State -3,2A]
Type = ChangeState
value = 400
TriggerAll = !isHelper
TriggerAll = var(59)
TriggerAll = var(17) = 1
TriggerAll = var(43) < 60
TriggerAll = StateType != A
TriggerAll = (EnemyNear,Ctrl || EnemyNear,StateNo <= 199)
TriggerAll = !InGuardDist
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
Triggerall = !PlayerIdExist(Helper(33333333),var(3)) || abs(PlayerId(Helper(33333333),var(3)),P2BodyDist x) > 50 
;对地
Trigger1 = Helper(11990),var(37) = 0;无当身技能
Trigger1 = (P2BodyDist x >= 0 && EnemyNear,Facing != Facing) || (P2BodyDist x <= 0 && EnemyNear,Facing = Facing)
Trigger1 = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
Trigger1 = EnemyNear,Vel x >= 0
Trigger1 = P2BodyDist x - ifelse((EnemyNear,StateNo = [200,4999]),fvar(12)*3,0)= [-45, 45]
Trigger1 = var(50) := 040031
Trigger1 = var(43) := var(43) + 90
Trigger1 = var(42) := 400
;骗当身
Trigger2 = Helper(11990),var(37)>0;有当身技能
Trigger2 = (P2BodyDist x >= 0 && EnemyNear,Facing != Facing) || (P2BodyDist x <= 0 && EnemyNear,Facing = Facing)
Trigger2 = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
Trigger2 = EnemyNear,Vel x >= 0
Trigger2 = P2BodyDist x = [80, 95]
Trigger2 = var(50) := 040032
Trigger2 = var(43) := var(43) + 240
Trigger2 = var(42) := 400
IgnoreHitPause = 1

[State -3,2B]
Type = ChangeState
value = 420
TriggerAll = !isHelper
TriggerAll = var(59)
TriggerAll = var(17) = 1
TriggerAll = var(42) != 420 || var(43) = 0
TriggerAll = StateType != A
TriggerAll = (EnemyNear,Ctrl || EnemyNear,StateNo <= 199)
TriggerAll = !InGuardDist
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对地
Trigger1 = Helper(11990),var(37) = 0;无当身技能
Trigger1 = !PlayerIdExist(Helper(33333333),var(3)) || abs(PlayerId(Helper(33333333),var(3)),P2BodyDist x) > 50 
Trigger1 = (P2BodyDist x >= 0 && EnemyNear,Facing != Facing) || (P2BodyDist x <= 0 && EnemyNear,Facing = Facing)
Trigger1 = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
Trigger1 = abs(P2BodyDist x - ifelse((EnemyNear,StateNo = [200,4999]),fvar(12)*4,0))= [40, 64]
Trigger1 = var(50) := 042031
Trigger1 = var(43) := var(43) + 120
Trigger1 = var(42) := 420
IgnoreHitPause = 1


;--------------------------------------------------------------------------------------------------
;必杀技
[State -3,A发毁灭压杀对空]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = var(17) = [1,2]
TriggerAll = StateType != A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对空
Trigger1 = EnemyNear,Facing != Facing
Trigger1 = EnemyNear,StateType = A
Trigger1 = Fvar(11) > 25
Trigger1 = P2BodyDist x > 120
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y*((P2BodyDist x - 25)/15.0 + 10) + fvar(13) * ((P2BodyDist x - 25)/15.0 + 10) * (((P2BodyDist x - 25)/15.0 + 10) + 1) / 2 = [-50,-5) 
Trigger1 = var(50) := 180031
value = 1800


[State -3,剪刀脚对空]
Type = ChangeState
value = 1300
TriggerAll = var(59)
TriggerAll = var(17) = [1,2]
TriggerAll = StateType != A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;一段对空
Trigger1 = EnemyNear,Facing != Facing
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - fvar(12) * 9 = [5,40]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 9 + fvar(13) * 9 * (9 + 1) / 2 = [-40,-0)
Trigger1 = var(50) := 130031
;二段对空
Trigger2 = EnemyNear,Facing != Facing
Trigger2 = EnemyNear,StateType = A
Trigger2 = P2BodyDist x - fvar(12) * 11 = [5,80]
Trigger2 = EnemyNear,pos y + EnemyNear,Vel Y * 11 + fvar(13) * 11 * (11 + 1) / 2 = [-75,-0)
Trigger2 = var(50) := 130032
IgnoreHitPause = 1

[State -3,毁灭压杀跑路]
Type = ChangeState
value = 1800
TriggerAll = !isHelper
TriggerAll = var(59)
TriggerAll = var(17) = [1,2]
TriggerAll = StateType != A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;一段对空
Trigger1 = StateNo = 220 && AnimElemTime(4) > 0
Trigger1 = EnemyNear,MoveType != H
Trigger1 = EnemyNear,StateType = A 
Trigger1 = P2BodyDist x - fvar(12) * 9 < 5
IgnoreHitPause = 1



[State -3,凯撒波1段对空]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = !isHelper 
TriggerAll = var(17) = [1,2]
Triggerall = !var(47)
TriggerAll = EnemyNear,StateNo <= 4999
TriggerAll = EnemyNear,MoveType != H
TriggerAll = StateType != A 
TriggerAll = EnemyNear,StateType = A
TriggerAll = (var(16)&2**2) = 0
;
Trigger1 = !InGuardDist || EnemyNear,Facing = Facing
Trigger1 = P2BodyDist x > 100
Trigger1 = P2BodyDist x - fvar(12) * 8 > 100
Trigger1 = fvar(11) - ((P2BodyDist x - 20 - fvar(12)*8) /16 + 8) = (1,4]
Trigger1 = var(50) := 100031
;
Trigger2 = EnemyNear,MoveType=A
Trigger2 = P2BodyDist x > 180
Trigger2 = Fvar(12)<=0
Trigger2 = EnemyNear,vel Y <= 0
Trigger2 = var(50) := 100032
value = 1000
IgnoreHitPause = 1

[State -3,凯撒波对地面]
Type = ChangeState
TriggerAll = var(59) 
Triggerall = var(47)=0
TriggerAll = !InGuardDist || EnemyNear,Facing = Facing
TriggerAll = var(17) = [1,2]
TriggerAll = StateType != A 
TriggerAll = EnemyNear,StateType != A
TriggerAll = EnemyNear,StateNo<5000&&(var(16)&2**3)=0
;超绝弹幕不要去对
TriggerAll = Helper(11990),var(18) = 0
Triggerall = EnemyNear,StateNo < 2000
;对弹幕
Trigger1 = EnemyNear,StateNo >= 200
Trigger1 = EnemyNear,MoveType = A
Trigger1 = P2BodyDist x>180
Trigger1 = EnemyNear,AnimTime<-30 
Trigger1 = EnemyNear,Time < IfElse(P2BodyDist x > 220, 6, 3)
Trigger1 = var(54) := 1700
Trigger1 = var(50) := 170031
;对类似聚气的操作以及收招动作
Trigger2 = !InGuardDist
Trigger2 = (var(16)&2**2)  = 0
Trigger2 = EnemyNear,StateNo >= 200
Trigger2 = EnemyNear,MoveType=I||EnemyNear,MoveType=A
Trigger2 = P2BodyDist x>180
Trigger2 = EnemyNear,Vel x <= 0
Trigger2 = !PlayerIdExist(Helper(33333333),var(3)) && EnemyNear,NumProj = 0
Trigger2 = (P2BodyDist x /16 + 8 < -EnemyNear,AnimTime)|| EnemyNear,AnimTime>0
Trigger2 = var(54) := 1000
Trigger2 = var(50) := 100032
value = var(54)

[State -3,凯撒波对波]
Type = ChangeState
TriggerAll = var(59) 
Triggerall = var(47)=0
TriggerAll = var(17) = [1,2]
TriggerAll = StateType != A 
TriggerAll = EnemyNear,StateType != A
TriggerAll = EnemyNear,StateNo<5000&&(var(16)&2**3)=0
;超绝弹幕不要去对
TriggerAll = Helper(11990),var(18) = 0
Triggerall = EnemyNear,StateNo=[1000,1999]
;有弹幕
Triggerall = EnemyNear,NumProj||PlayerIdExist(Helper(33333333),var(3))
;对弹幕
Trigger1 = (var(16)&2**4)=0
Trigger1 = EnemyNear,StateNo >= 1000
Trigger1 = EnemyNear,MoveType=A||Enemynear,MoveType=I
Trigger1 = P2BodyDist x>180
Trigger1 = EnemyNear,AnimTime<-30 
Trigger1 = EnemyNear,Time<IfElse(P2BodyDist x>220,6,3)
Trigger1 = var(50) := 100033
value = 1000

[State -3,暗黑屏障反波]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = var(17) = [1,2]
TriggerAll = StateType != A
TriggerAll = EnemyNear,StateType != A
TriggerAll = EnemyNear,StateNo = [1000,4999] 
TriggerAll = EnemyNear,MoveType = A || EnemyNear,MoveType = I
TriggerAll = Helper(11990),var(18) = 0
;超绝弹幕不要去对，对不过
TriggerAll = !(EnemyNear,StateNo >= 2000 && EnemyNear,MoveType = A && PlayerIdExist(Helper(33333333),var(3)))
;对地
Trigger1 = PlayerIdExist(Helper(33333333),var(3))
Trigger1 = PlayerId(Helper(33333333),var(3)),P2BodyDist x > 60
Trigger1 = PlayerId(Helper(33333333),var(3)),Pos Y >= -80
Trigger1 = PlayerId(Helper(33333333),var(3)),P2BodyDist x / PlayerId(Helper(33333333),var(3)),Vel x = [14, 21]
Trigger1 = IfElse(P2BodyDist x > 160, EnemyNear,AnimTime < -10, EnemyNear,AnimTime < -28)
Trigger1 = var(50) := 150031
value = 1500

[State -3,烈风拳立回]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = var(17) = 1 
TriggerAll = StateType != A
TriggerAll = !var(47)
;超绝弹幕不要去对，对不过
TriggerAll = Helper(11990),var(18) = 0
TriggerAll = EnemyNear,StateNo < 2000
TriggerAll = EnemyNear,Power < 1000
TriggerAll = !(PlayerIdExist(Helper(33333333),var(3)) && PlayerId(Helper(33333333),var(3)),p2bodydist x < 120)
Triggerall = (var(16)&2**4)=0
; 
Trigger1 = !InGuardDist
Trigger1 = EnemyNear,MoveType != H
Trigger1 = Random < 50 + (LifeMax - Life)/10 + Helper(11990),var(15)*100
Trigger1 = EnemyNear,Vel x <= 4
Trigger1 = P2BodyDist x > 180
Trigger1 = EnemyNear,StateType != A && EnemyNear,Vel y = 0
Trigger1 = var(54) := IfElse(EnemyNear,StateType = L,1100,1150)
Trigger1 = var(50) := 110031
;
Trigger2 = !InGuardDist
Trigger2 = EnemyNear,Power < 950
Trigger2 = EnemyNear,MoveType != H
Trigger2 = Random < 50 + (LifeMax - Life)/9 + Helper(11990),var(15)*100
Trigger2 = P2BodyDist x > 210
Trigger2 = EnemyNear,StateType != A && EnemyNear,Vel y = 0
Trigger2 = var(54) := 1700
Trigger2 = var(50) := 170032
;对波Proj类型
Trigger3 = EnemyNear,Time<=6
Trigger3 = EnemyNear,StateNo >= 1000
Trigger3 = EnemyNear,NumProj
Trigger3 = P2BodyDist x > 190
Trigger3 = EnemyNear,Time < -EnemyNear,AnimTime
Trigger3 = EnemyNear,AnimTime < -25
Trigger3 = var(54) := 1700
Trigger3 = var(50) := 170033
;对波Proj类型
Trigger4 = EnemyNear,Time < 12
Trigger4 = EnemyNear,StateNo >= 1000
Trigger4 = EnemyNear,NumProj
Trigger4 = P2BodyDist x > 160
Trigger4 = EnemyNear,Time < -EnemyNear,AnimTime
Trigger4 = EnemyNear,AnimTime < -25
Trigger4 = var(54) := 1150
Trigger4 = var(50) := 115034
;对波Proj类型
Trigger5 = EnemyNear,StateNo >= 1000
Trigger5 = EnemyNear,NumProj
Trigger5 = P2BodyDist x>235
Trigger5 = EnemyNear,Time<-EnemyNear,AnimTime
Trigger5 = EnemyNear,AnimTime<-25
Trigger5 = var(54) := 1150
Trigger5 = var(50) := 115035

value = var(54)
IgnoreHitPause = 1



;=================================================================================
;其他2
;=================================================================================
[State -3,蓄气]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = roundstate = 2
TriggerAll = StateType != A 
TriggerAll = var(17) = 1
Triggerall = !var(52)
Triggerall = Power < PowerMax*0.9
Triggerall = Helper(11990),var(18)=1||(Power<1000&&EnemyNear,Life<100&&EnemyNear,Power>=1000&&P2BodyDist x>160)||Helper(11990),var(37)!=0
Triggerall = !InGuardDist
Triggerall = P2BodyDist x > 90
;
Trigger1 = EnemyNear,StateType = L
Trigger1 = var(50):=98001
;
Trigger2 = EnemyNear,StateNo = 5120
Trigger2 = EnemyNear,AnimTime < -20
Trigger2 = var(50):=98002
;
Trigger3 = Fvar(12)<0
Trigger3 = !EnemyNear,Ctrl && EnemyNear,MoveType = H && P2BodyDist x > 180
Trigger3 = var(50):=98003
;
Trigger4 = P2BodyDist x >= 200
Trigger4 = var(16)&2**4
Trigger4 = EnemyNear,MoveType=H
Trigger4 = var(50):=98004
value = 980

[State -3,蓄气]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = roundstate = 2
TriggerAll = StateType != A 
TriggerAll = var(17) = 1
Triggerall = !var(52)
Triggerall = Power < PowerMax*0.9
Trigger1 = P2BodyDist x > 90
Trigger1 = var(9) = 1 
Trigger1 = Power < 1000
Trigger1 = EnemyNear,StateNo = 1321
Trigger1 = var(50):=98004
value = 980

[State -3,后滚]
Type = changestate
TriggerAll = var(59)
TriggerAll = roundstate = 2
TriggerAll = StateType != A 
TriggerAll = var(17) = 1
TriggerAll = EnemyNear,MoveType=A&&!EnemyNear,Ctrl
TriggerAll = Helper(33000),var(11) != 3
TriggerAll = BackEdgeBodyDist >= 60
TriggerAll = InGuardDist
TriggerAll = !(EnemyNear,numproj||PlayerIdExist(Helper(33333333),var(3)))||EnemyNear,AnimTime <= -20
TriggerAll = EnemyNear,AnimTime <= -24
;对方攻击的距离大于我们能攻击到的最大距离，就后撤一下
Trigger1 = EnemyNear,Time<-EnemyNear,AnimTime
Trigger1 = EnemyNear,StateNo=[1000,1999]
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x = [30,110]
Trigger1 = EnemyNear,Vel X <= 0
Trigger1 = EnemyNear,animtime=[-32,-20]
Trigger1 = var(50) := 91021
;
Trigger2 = P2BodyDist x = [85,140]
Trigger2 = EnemyNear,StateType = A
Trigger2 = fvar(12) > 0
Trigger2 = EnemyNear,Vel y < -1
Trigger2 = EnemyNear,pos y <= -60
Trigger2 = var(50) := 91022
;躲对面压起身
Trigger3 = (var(16)&2**8)=0
Trigger3 = Helper(11990),var(43)!=1
Trigger3 = P2BodyDist x>=45
Trigger3 = EnemyNear,Facing!=Facing
Trigger3 = EnemyNear,StateType!=A
Trigger3 = fvar(12)<=0
Trigger3 = Enemynear,StateNo=[1000,1999]
Trigger3 = EnemyNear,Time<-Enemynear,AnimTime
Trigger3 = EnemyNear,Time>=8
Trigger3 = var(50) := 91023
value = 910

[State -3,后撤]
Type = ChangeState
value = 105
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = var(17) = 1
TriggerAll = BackEdgeBodyDist > 80
TriggerAll = EnemyNear,Vel x <= 0
;
Trigger1 = Helper(11990),var(37)!=0
Trigger1 = EnemyNear,Facing!=Facing
Trigger1 = !InGuardDist
Trigger1 = P2BodyDist x=[0,90]
Trigger1 = EnemyNear,MoveType=I
Trigger1 = EnemyNear,StateType!=A
Trigger1 = EnemyNear,StateNo<120
Trigger1 = EnemyNear,Vel x > 0
Trigger1 = var(50) := 10521


[State -3, 落地受身]
Type = ChangeState
value = 5200
TriggerAll = var(59) 
TriggerAll = alive
Trigger1 = stateno = 5050
Trigger1 = pos y >= -20
Trigger1 = vel y > 0
Trigger1 = var(50) := 520021
IgnoreHitPause = 1
;=================================================================================
;防御1
;=================================================================================
[State -1, 防御]
Type = ChangeState
Value = 120
TriggerAll = var(59) 
TriggerAll = RoundState = 2
Triggerall = Ctrl||(StateNo=[99,101])||(StateNo=[18,19])
Triggerall = StateNo!=[120,159]
Triggerall = !(EnemyNear,Time-EnemyNear,AnimTime>=40&&EnemyNear,Time<9&&P2BodyDist x>120)
Triggerall = !(EnemyNear,Time-EnemyNear,AnimTime>=28&&EnemyNear,Time<6&&P2BodyDist x>120)
Triggerall = !(EnemyNear,Facing=Facing&&P2BodyDist x>60)
Triggerall = !(EnemyNear,Time<=10&&EnemyNear,Time-EnemyNear,AnimTime>=36&&EnemyNear,StateNo=[1000,1999])
;
Trigger1 = EnemyNear,MoveType=A&&(EnemyNear,Time<-EnemyNear,AnimTime||EnemyNear,AnimTime>0)
Trigger1 = StateType != A
Trigger1 = var(50) := 012011
;
Trigger2 = P2BodyDist X= [-75,80]
Trigger2 = NumHelper(33000)>0
Trigger2 = Helper(33000),InGuardDist
Trigger2 = Facing*EnemyNear,Facing!=-1 || P2Dist X<0
Trigger2 = var(50) := 012012
;
Trigger3 = (EnemyNear,numproj||PlayerIdExist(Helper(33333333),var(3)))
Trigger3 = var(50) := 012013
;
IgnoreHitPause = 1
