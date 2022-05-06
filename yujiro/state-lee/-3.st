;=================================================================================
;AI用前行
;=================================================================================
[Statedef 19]
Type    = S
physics = S
sprpriority = 2
ctrl = 0

[State 21, 1]
Type = Turn
Trigger1 = EnemyNear,MoveType != H
Trigger1 = P2Dist X < 0

[State 20, 1]
Type = VelSet
Trigger1 = 1
x = const(velocity.walk.fwd.x)

[State 20, 3]
Type = ChangeAnim
TriggerAll = vel x > 0
Trigger1 = Anim != 20 && Anim != 5
Trigger2 = Anim = 5 && AnimTime = 0
value = 20

[State 18, Exit]
Type = ChangeState
;
Trigger1 = inguarddist
value = 0
ctrl = 1

[State 19, Exit]
Type = ChangeState
TriggerAll = Time >= 16
Trigger1 = RoundState != 2
Trigger1 = var(11) := 1111901
;
Trigger2 = EnemyNear,Ctrl
Trigger2 = P2BodyDist X <= 35
Trigger2 = var(11) := 1111902
;
Trigger3 = frontedgebodydist <= 20
Trigger3 = var(11) := 1111903
;
Trigger4 = InGuardDist
Trigger4 = EnemyNear,facing != facing
Trigger4 = var(11) := 1111904
;
Trigger5 = Time >= 120
Trigger5 = var(11) := 1111905
;
Trigger6 = EnemyNear,StateType != A
Trigger6 = EnemyNear,facing = facing 
Trigger6 = var(11) := 1111906
;为打起身做准备
Trigger7 = EnemyNear,StateType = L
Trigger7 = !EnemyNear,Ctrl
Trigger7 = P2BodyDist x <= 80
Trigger7 = var(11) := 1111907
;贴身打受击硬直
Trigger8 = EnemyNear,StateType != A
Trigger8 = EnemyNear,StateType != L
Trigger8 = EnemyNear,MoveType = H
Trigger8 = P2BodyDist X <= 5
Trigger8 = var(11) := 1111908
;敌人向我们飞来
Trigger9 = Fvar(14) > 0
Trigger9 = EnemyNear,StateType = A
Trigger9 = EnemyNear,MoveType = H
Trigger9 = P2BodyDist X <= 80
Trigger9 = var(11) := 1111909
;敌人远离我们飞走
Trigger10 = Fvar(14) < 0
Trigger10 = EnemyNear,StateType = A
Trigger10 = EnemyNear,MoveType = H
Trigger10 = P2BodyDist X <= 40
Trigger10 = var(11) := 1111910
;太近了
Trigger11 = EnemyNear,Ctrl
Trigger11 = P2BodyDist x < 40
Trigger11 = var(11) := 1111911
value = 0
ctrl = 1

;=================================================================================
;AI用后退
;=================================================================================
[Statedef 18]
Type    = S
physics = S
sprpriority = 2
ctrl = 0

[State 20, 1]
Type = VelSet
Trigger1 = 1
x = const(velocity.walk.back.x)

[State 20, 4]
Type = ChangeAnim
TriggerAll = vel x < 0
Trigger1 = Anim != 21 && Anim != 5
Trigger2 = Anim = 5 && AnimTime = 0
value = 21


[State 18, Exit]
Type = ChangeState
Trigger1 = Time >= 6
Trigger1 = EnemyNear,StateType = A
Trigger1 = EnemyNear,MoveType = H
Trigger1 = EnemyNear,StateNo >= 5000
Trigger1 = P2BodyDist x > 20
;
Trigger2 = inguarddist
value = 0
ctrl = 1

[State 18, Exit]
Type = ChangeState
TriggerAll = Time >= 16
;
Trigger1 = RoundState != 2
Trigger1 = var(11) := 1111801
;
Trigger2 = InGuardDist
Trigger2 = EnemyNear,facing != facing
Trigger2 = var(11) := 1111802
;
Trigger3 = Time >= 120
Trigger3 = var(11) := 1111803
;
Trigger4 = P2BodyDist X >= 180
Trigger4 = var(11) := 1111804
;
Trigger5 = BackEdgeBodyDist <= 20
Trigger5 = var(11) := 1111805
;
Trigger6 = EnemyNear,MoveType = A || EnemyNear,Ctrl
Trigger6 = EnemyNear,facing = facing 
Trigger6 = var(11) := 1111806
;为打起身做准备
Trigger7 = Time >= 12
Trigger7 = EnemyNear,StateType = L
Trigger7 = !EnemyNear,Ctrl
Trigger7 = P2BodyDist x >= 65
Trigger7 = var(11) := 1111807
;敌人向我们飞来
Trigger8 = Fvar(14) > 0
Trigger8 = EnemyNear,StateType = A
Trigger8 = EnemyNear,MoveType = H
Trigger8 = P2BodyDist x >= 90
Trigger8 = var(11) := 1111808
;敌人远离飞去
Trigger9 = Fvar(14) < 0
Trigger9 = EnemyNear,StateType = A
Trigger9 = EnemyNear,MoveType = H
Trigger9 = P2BodyDist x >= 50
Trigger9 = var(11) := 1111809
value = 0
ctrl = 1

;=================================================================================
;AI用前跑
;=================================================================================
[Statedef 99]
type     = S
movetype = I
physics  = N
anim     = 100
ctrl     = 0
sprpriority = 1


[State 1000, 音を鳴らす]
type = PlaySnd
trigger1 = TimeMod = 20, 0
value = 0,20
channel = 1

[State 0,移動用砂埃]
type = Projectile
trigger1 = 1
Projscale = 0.5,0.5
ProjAnim = 3012
Projremanim = -1
Projremovetime = 10
Projpriority = 3
Projemisstime = 1
Offset = -25,0
velocity = 0, 0

[State 100, アニメ変更]
type = ChangeAnim
triggerall = (Time > 4)
trigger1 = var(0) = 0
trigger1 = (command != "holdfwd")
;对方可控的情况下，不要跑太近
Trigger2 = P2BodyDist X <= 60
Trigger2 = P2BodyDist Y >= -120
Trigger2 = EnemyNear,MoveType != H && (EnemyNear,Ctrl || EnemyNear,StateNo < 200)
Trigger2 = EnemyNear,facing != facing || P2BodyDist X < 0
Trigger2 = var(11) := 1119902
;
Trigger3 = InGuardDist
Trigger3 = EnemyNear,MoveType = A
Trigger3 = (EnemyNear,Time<-EnemyNear,AnimTime) || (EnemyNear,AnimTime>0 && Time<12)
Trigger3 = EnemyNear,facing != facing
Trigger3 = var(11) := 1119903
;
Trigger4 = !EnemyNear,Ctrl && EnemyNear,MoveType = I
Trigger4 = P2BodyDist x < 20
Trigger4 = var(11) := 1119904
;
Trigger5 = EnemyNear,StateType != L
Trigger5 = EnemyNear,StateType != A
Trigger5 = EnemyNear,MoveType = H
Trigger5 = P2BodyDist x <= 0
Trigger5 = var(11) := 1119905
;
Trigger6 = EnemyNear,MoveType = A && InGuardDist
Trigger6 = EnemyNear,Facing != Facing
Trigger6 = P2BodyDist x < 75
Trigger6 = var(11) := 1119906
;
Trigger7 = EnemyNear,StateType = A
Trigger7= EnemyNear,MoveType = H
Trigger7 = P2BodyDist x < 50
Trigger7 = var(11) := 1119909
value = 47
Persistent = 0

[State 100, 状態変更]
type = StateTypeSet
trigger1 = (Anim = 47)
Physics = S

[State 100, 特殊効果];コントロールが可能なダッシュステートはこのコントローラが必要（※１）
type = AssertSpecial
trigger1 = 1
flag = NoWalk      ;歩かない（前か後ろのキーを入力中コントロールが可能の時に勝手に[Statedef 20]にならない）
flag2= NoAutoTurn  ;自動で振り向かない

[State 100, 埃]
type = MakeDust
trigger1 = (Anim = 47)
pos = 0,0
spacing = 1
Persistent = 0

[State 100, 軸位置]
type = PosSet
trigger1 = 1
y = 0

[State 100, 移動速度]
type = VelSet
trigger1 = 1
y = 0

[State 100, 移動速度]
type = VelSet
trigger1 = var(1) != 1
trigger1 = (Anim != 47)
x = const(velocity.run.fwd.x)

[State 100, 移動速度]
type = VelSet
trigger1 = var(1) = 1
trigger1 = (Anim != 47)
x = const(velocity.run.fwd.x)*2

[State ]
type = NotHitby
trigger1 = var(1)=1
value = SCA,NA,SA,HA,NP,SP,HP
time = 1
ignorehitpause = 1

[State ]
type = Helper
trigger1 = var(1)=1
trigger1 = numhelper(26666)<1
name = "MyHelper"
ID = 26666
pos = 0,0
postype = p1
stateno = 26666
keyctrl = 0
supermovetime = 999999
pausemovetime = 999999

[State 1008, 画像の色]
type = PalFX
trigger1 = var(1)=1
trigger1 = helper(26666),gethitvar(damage)>0
time = 10
add = 250,20,40
sinadd = 22,5,364,3
pausemovetime = 99999999
IgnoreHitPause = 1

[state ];
type = lifeadd
trigger1 = var(1)=1
value = -(helper(26666),gethitvar(damage)*0.8)
IgnoreHitPause = 1

[State 100, ステート変更]
type = ChangeState
triggerall = (Anim = 47)
trigger1 = AnimTime = 0
value = 0
ctrl = 1



;=================================================================================
;-3 AI State
;=================================================================================
[Statedef -3]

[State -3]
type = Helper
trigger1 = !numhelper(33334)
helpertype = normal
name = "Other"
ID = 33334
stateno=33334
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
Trigger1= ishelper(33334)
Trigger1= stateno!=33334
value=33334

[State -3]
type = Helper
trigger1 = !numhelper(33000)
helpertype = normal
name = "AIconfig"
ID = 33000
stateno=33000
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
Trigger1= stateno!=33000
value=33000

[State -3]
type = Helper
trigger1 = !numhelper(33001)
helpertype = normal
name = "AI Right"
ID = 33001
stateno=33001
Postype = p1
Facing = 1
Pausemovetime = 0
Persistent = 0
Ignorehitpause = 1
Keyctrl = 0
Ownpal = 1

[State -3]
type=changestate
Trigger1= ishelper(33001)
Trigger1= stateno!=33001
value=33001

[State -3]
type = Helper
trigger1 = !numhelper(33002)
helpertype = normal
name = "AI left"
ID = 33002
stateno=33002
Postype = p1
Facing = -1
Pausemovetime = 0
Persistent = 0
Ignorehitpause = 1
Keyctrl = 0
Ownpal = 1

[State -3]
type=changestate
Trigger1= ishelper(33002)
Trigger1= stateno!=33002
value=33002

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

[State -3]
type=changestate
Trigger1= ishelper(33333333)
Trigger1= stateno!=33333333
value=33333333


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;变量设置
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[State -3,开关]
Type = varSet
Trigger1 = RoundState = 2 && EnemyNear,alive && EnemyNear,life > 0
;Trigger1 = movehit || enemynear,moveType = h
var(0) = 1
IgnoreHitPause = 1

[State -3]
Type = varSet
Trigger1 = RoundState != 2 || EnemyNear,life = 0 || !EnemyNear,alive
var(0) = 0

[State -3, ]
type = varset
trigger1 = EnemyNear,MoveType != H
var(12) = 0

;===================================================================================
; AI相关
;===================================================================================

;==================================================================================
;布尔类型集合
;2**0 耗气闪避判别
;2**1 落地受身判别
;2**2 270压起身失败记录
;2**3 240抢招失败记录
;2**4 留气过年判别
;2**5 2002架招失败记录
;==================================================================================
;---------------------------------------------------------------------------------
[State -2, 耗气闪避判别Reset]
Type = varSet
Triggerall = var(4)&2**2
Trigger1 = EnemyNear,MoveType = H
Trigger2 = EnemyNear,StateType = A
Trigger3 = EnemyNear,MoveType = A
Trigger4 = EnemyNear,StateType = L
Trigger5 = EnemyNear,Ctrl 
var(4) = var(4)^(2**0)
IgnoreHitPause = 1

[State -2, 耗气闪避判别]
Type = varSet
Trigger1 = EnemyNear,PrevStateNo = [150,153]
Trigger1 = EnemyNear,MoveType = I
Trigger1 = EnemyNear,StateNo < 5000
Trigger1 = EnemyNear,StateType != A
Trigger1 = StateType != A
Trigger1 = MoveType = A
Trigger1 = P2BodyDist x = [-30,60]
Trigger1 = EnemyNear,Vel x = [0,9]
var(4) = var(4)|2**0
IgnoreHitPause = 1
;---------------------------------------------------------------------------------
[State -2, 落地受身判别Reset]
Type = varSet
Triggerall = var(4)&2**1
TriggerAll = EnemyNear,PrevStateNo != 5050
Trigger1 = EnemyNear,MoveType = A
Trigger2 = EnemyNear,StateType = L
Trigger3 = EnemyNear,Ctrl 
Trigger4 = InGuardDist
var(4) = var(4) ^ 2**1
IgnoreHitPause = 1

[State -2, 落地受身设置]
Type = varSet
TriggerAll = !InGuardDist
;直接切状态
Trigger1 = EnemyNear,PrevStateNo = 5050 && EnemyNear,StateNo != 5100
Trigger1 = EnemyNear,StateType != A
Trigger1 = EnemyNear,StateType != L
;常用受身
Trigger2 = EnemyNear,StateNo = [5200,5203]
var(4) = var(4) | 2**1
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
[State -2, 270压起身失败记录]
Type = varSet
Trigger1 = MoveType = H
Trigger1 = var(11) = 27051
var(4) = var(4) | 2**2

;---------------------------------------------------------------------------------
[State -2, 240抢招失败记录]
Type = varSet
Trigger1 = MoveType = H
Trigger1 = var(11) = 24081
var(4) = var(4) | 2**3

;---------------------------------------------------------------------------------

[State -2, ]
Type = varSet
Trigger1 = RoundState = 2
trigger1 = var(0)
var(4) = var(4) ^ 2**4


;不留气过年的场景
[State -2, ]
Type = varSet
Triggerall = !(Life<LifeMax/2 && EnemyNear,Life > 500 && Power=[2000,2999) )
Trigger1 = Life < 200 
Trigger2 = EnemyNear,Life < 100 && Power >= 1000
Trigger3 = EnemyNear,Life < 200 && Power >= 2000
var(4) = var(4) | 2**4

;---------------------------------------------------------------------------------
;架招失败记录
[State -2, 240抢招失败记录]
Type = varSet
Trigger1 = MoveType = H
Trigger1 = var(11) = 200273
var(4) = var(4) | 2**5

;---------------------------------------------------------------------------------
[State -2, 普通技立回\压起身被当身记录, 这个代码在-2也有]
Type = varset
triggerall = MoveReversed = 1
triggerall = MoveType = H
triggerall = enemynear,moveType = A || enemynear,moveType = I
triggerall = EnemyNear,StateNo < 2000
trigger1 = var(11)/100 = [200,999]
var(4) = var(4) | 2**6
ignorehitpause = 1


;---------------------------------------------------------------------------------
[State -1, 超杀弹幕抓硬直可行标志]
type = varset
triggerall = var(0)
triggerall = StateNo = 0
triggerall = EnemyNear,StateNo >= 2000
trigger1 = EnemyNear,NumProj || PlayerIdExist(helper(33333333),var(3))
var(4) = var(4) | 2**7
ignorehitpause = 1

[State -1, Reset]
type = varset
triggerall = var(0)
triggerall = var(4) & 2**7
trigger1 = !EnemyNear,NumProj
trigger2 = !PlayerIdExist(helper(33333333),var(3))
trigger3 = EnemyNear,MoveType = H
trigger4 = EnemyNear,StateType = L
trigger5 = MoveType = H
trigger6 = StateType = L
var(4) = var(4) ^ 2**7
ignorehitpause = 1

;---------------------------------------------------------------------------------
;1000冲弹幕失败
[State -2, 240抢招失败记录]
Type = varSet
Trigger1 = MoveType = H
Trigger1 = var(11) = 100071
var(4) = var(4) | 2**8





;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;终结用9
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[State -1, 鬼背]
type = ChangeState
triggerall = var(0)
triggerall = power >= 3000
triggerall = Life < (LifeMax/2)
triggerall = (StateType != A)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && Time > 8)
triggerall = P2BodyDist x = [-30, 35] 
Triggerall = EnemyNear,StateType != A
;
trigger1 = EnemyNear,StateNo = 15002
trigger1 = var(11) := 358091
;
trigger2 = NumTarget(1015)
trigger2 = var(11) := 358092
;
trigger3 = EnemyNear,StateNo = 5300
trigger3 = var(11) := 35093
;
value = 3580

[State -1, 抱杀]
type = ChangeState
triggerall = var(0)
triggerall = power >= 3000
triggerall = Life < (LifeMax/2)
triggerall = (StateType != A)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && time > 8)
triggerall = EnemyNear,MoveType = A
triggerall = EnemyNear,StateType != A
triggerall = EnemyNear,AnimTime <= -5
triggerall = EnemyNear,Vel Y = 0
triggerall = fvar(14) >= 0
triggerall = EnemyNear,Facing != Facing
triggerall = P2BodyDist x = [-30, 30]
;普通技能,要在其攻击帧出来之前
trigger1 = EnemyNear,StateNo = [200,999]
trigger1 = enemynear,stateno = helper(33000),var(2)
trigger1 = helper(33000),var(3) - enemynear,time >= 5
trigger1 = var(11) := 358094
;超级技能
trigger2 = EnemyNear,StateNo >= 1000
trigger2 = enemynear,stateno = helper(33000),var(2)
trigger2 = helper(33000),var(3) - enemynear,time = [5,10]
trigger2 = var(11) := 358095
;
trigger3 = EnemyNear,StateNo = [1000,1999]
trigger3 = helper(33000),var(2) = 0
trigger3 = enemynear,time > 8
trigger3 = var(11) := 358096
value = 3580


[State -1, 全屏杀]
type = ChangeState
triggerall = var(0)
triggerall = power >= 2000
triggerall = EnemyNear,Life < 200
triggerall = (StateType != A)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && Time > 8)
;
trigger1 = EnemyNear,StateNo = 15002
trigger1 = var(11) := 350091
;
trigger2 = NumTarget(1015)
trigger2 = var(11) := 350092
;
trigger3 = EnemyNear,StateNo = 5300
trigger3 = var(11) := 350093
;
trigger4 = EnemyNear,StateType = A && EnemyNear,MoveType = H && EnemyNear,StateNo >= 5000
trigger4 = enemynear,pos Y + enemynear,vel Y*12 + fvar(15)*12*13*0.5 < -30
trigger4 = var(11) := 350094
value = 3500


[State -1, 礼服]
type = ChangeState
triggerall = var(0)
triggerall = power >= 1000
triggerall = EnemyNear,Life < 250
triggerall = (StateType != A)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && Time > 8)
triggerall = P2BodyDist x < 55
;
trigger1 = EnemyNear,StateNo = 15002
trigger1 = var(11) := 222691
;
trigger2 = NumTarget(1015)
trigger2 = var(11) := 222692
;
trigger3 = EnemyNear,StateNo = 5300
trigger3 = var(11) := 222693
value = 2226

[State -1, 四方乱舞]
type = ChangeState
triggerall = var(0)
triggerall = power >= 2000
triggerall = EnemyNear,Life < 350
triggerall = (StateType != A)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && Time > 8)
triggerall = P2BodyDist x = [55,120]
;
trigger1 = EnemyNear,StateNo = 15002
trigger1 = var(11) := 201491
;
trigger2 = NumTarget(1015)
trigger2 = var(11) := 201492
;
trigger3 = EnemyNear,StateNo = 5300
trigger3 = var(11) := 201493
;
trigger4 = EnemyNear,StateType != A
trigger4 = Fvar(14) = 0
trigger4 = EnemyNear,MoveType = A
trigger4 = EnemyNear,StateNo = [1000,1999]
trigger4 = EnemyNear,Vel Y = 0
trigger4 = var(11) := 201494
value = 2014

[State -1, 捶地]
type = ChangeState
triggerall = var(0)
triggerall = power >= 1000
triggerall = EnemyNear,Life < 150
triggerall = (StateType != A)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && Time > 8)
triggerall = P2BodyDist x > 120
;
trigger1 = EnemyNear,StateNo = 15002
trigger1 = var(11) := 201591
;
trigger2 = NumTarget(1015)
trigger2 = var(11) := 201592
;
trigger3 = EnemyNear,StateNo = 5300
trigger3 = var(11) := 201593
value = 2015

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;抢招8
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[State -3, 2A]
type = ChangeState
triggerall = var(0)
triggerall = (StateType != A)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && Time > 8)
triggerall = EnemyNear,StateType != A && EnemyNear,Vel Y = 0 && fvar(14) = 0
triggerall = EnemyNear,MoveType = A
triggerall = P2BodyDist x < 80
;抢弹幕
trigger1 = EnemyNear,StateNo = [1000, 1999]
trigger1 = EnemyNear,AnimTime < -30
trigger1 = EnemyNear,Time <= 1
trigger1 = var(11) := 43081
;抢普通技
trigger2 = EnemyNear,StateNo = [200,999]
trigger2 = enemynear,stateno = helper(33000),var(2)
trigger2 = enemynear,time < helper(33000),var(3) - 5
trigger2 = var(11) := 43082
value = 430


[State -3, Y]
type = ChangeState
triggerall = var(0)
triggerall = (StateType != A)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && Time > 8)
triggerall = EnemyNear,StateType != A && EnemyNear,Vel Y = 0 && fvar(14) = 0
triggerall = EnemyNear,MoveType = A
triggerall = P2BodyDist x < 103
;抢弹幕
trigger1 = EnemyNear,StateNo = [1000, 1999]
trigger1 = EnemyNear,AnimTime < -30
trigger1 = EnemyNear,Time <= 1
trigger1 = var(11) := 25081
;抢普通技
trigger2 = EnemyNear,StateNo = [200,999]
trigger2 = enemynear,stateno = helper(33000),var(2)
trigger2 = enemynear,time < helper(33000),var(3) - 8
trigger2 = var(11) := 25082
value = 250


[State -3, 6B]
type = ChangeState
triggerall = var(0)
triggerall = (var(4) & 2**3) = 0
triggerall = (StateType != A)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && Time > 8)
triggerall = EnemyNear,StateType != A && EnemyNear,Vel Y = 0 && fvar(14) = 0
trigger1 = EnemyNear,MoveType = A
trigger1 = EnemyNear,StateNo = [200, 1999]
trigger1 = EnemyNear,AnimTime < -16
trigger1 = P2BodyDist x = [92, 112] 
trigger1 = EnemyNear,Time <= 1
trigger1 = var(11) := 24081
value = 240


[State -3, A]
type = ChangeState
triggerall = var(0)
triggerall = (StateType != A)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && Time > 8)
triggerall = EnemyNear,StateType != A && EnemyNear,Vel Y = 0 && fvar(14) = 0
trigger1 = EnemyNear,MoveType = A
trigger1 = EnemyNear,StateNo = [200, 999]
trigger1 = EnemyNear,AnimTime < -1
trigger1 = enemynear,stateno = helper(33000),var(2)
trigger1 = enemynear,time < helper(33000),var(3) - 1
trigger1 = P2BodyDist x = [-1, 45] 
trigger1 = var(11) := 23081
value = 230


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;切返7
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[State -1, 鬼背]
type = ChangeState
triggerall = var(0)
Triggerall = Helper(33334),var(59) = 0; 不能是全程无敌的招式
triggerall = (Power > 2999)
triggerall = (StateType != A)
triggerall = life < ((lifemax)/2)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && time > 8)
triggerall = EnemyNear,StateType != A && EnemyNear,Vel Y = 0 && EnemyNear,StateType != L
triggerall = EnemyNear,MoveType = A || EnemyNear,MoveType = I
triggerall = EnemyNear,AnimTime < -4
triggerall = P2BodyDist x = [-10, 35] 
triggerall = fvar(14) = 0
;对必杀
trigger1 = EnemyNear,StateNo = [1000,1999]
trigger1 = EnemyNear,Time >= 6
trigger1 = var(11) := 358071
;对普通技
trigger2 = EnemyNear,StateNo = [200,999]
trigger2 = EnemyNear,Time <= 1
trigger2 = var(11) := 358072
;对超杀
trigger3 = EnemyNear,StateNo >= 2000
trigger3 = EnemyNear,AnimTime = [-6, -4]
trigger3 = var(11) := 358073
value = 3580

[State -1, 全屏杀]
type = ChangeState
triggerall = var(0)
Triggerall = Helper(33334),var(59) = 0; 不能是全程无敌的招式
triggerall = power >= 2000
triggerall = (StateType != A)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && time > 8)
triggerall = EnemyNear,MoveType = A || inguarddist
Triggerall = EnemyNear,StateType != A
triggerall = EnemyNear,AnimTime < -12
;远程道具
trigger1 = var(4)&2**4
trigger1 = EnemyNear,NumProj || (PlayerIdExist(helper(33333333),var(3)) && PlayerId(helper(33333333),var(3)),p2dist x > 0 && EnemyNear,StateNo = [1000,4999])
trigger1 = P2BodyDist x > 180
trigger1 = var(11) := 350071
;秒杀对方
trigger2 = !(EnemyNear,Life > 500 && Life < LifeMax/2);不足以秒杀对方则留气准备鬼背
trigger2 = EnemyNear,Life < 150
trigger2 = EnemyNear,StateNo >= 1000;普通技容易被空振取消掉
trigger2 = Power < 3000 || P2BodyDist x > 120
trigger2 = var(11) := 350072
;
tirgger3 = inguarddist
trigger3 = EnemyNear,AnimTime < -80
trigger3 = var(11) := 350073
;
trigger4 = EnemyNear,Life < 200
trigger4 = P2BodyDist x > 85
trigger4 = var(11) := 350074
value = 3500

[State -1, チョップ]
type = ChangeState
triggerall = var(0)
Triggerall = Helper(33334),var(59) = 0; 不能是全程无敌的招式
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && time > 8)
triggerall = EnemyNear,Facing != Facing
triggerall = EnemyNear,NumProj = 0
triggerall = !PlayerIdExist(helper(33333333),var(3))
triggerall = EnemyNear,Vel Y = 0
triggerall = P2BodyDist x = [0, 70]
triggerall = EnemyNear,StateType != A
trigger1 = EnemyNear,MoveType = A && !EnemyNear,Ctrl
trigger1 = enemynear,stateno = helper(33000),var(2)
trigger1 = helper(33000),var(3) - enemynear,time = [14, 27]
trigger1 = var(11) := 27071
value = 270

[State -1, 猛兽连击]
type = ChangeState
triggerall = var(0)
Triggerall = Helper(33334),var(59) = 0; 不能是全程无敌的招式
triggerall = !(EnemyNear,Life > 600 && Life < LifeMax/2)
triggerall = power >= 2000
triggerall = (StateType != A)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && time > 8)
triggerall = EnemyNear,MoveType = A
triggerall = EnemyNear,AnimTime < -6
triggerall = EnemyNear,StateType = S
triggerall = EnemyNear,Time < -EnemyNear,AnimTime
;秒杀对方
trigger1 = Frontedgebodydist < 200; 最后一下击飞可以带入后续连段
trigger1 = EnemyNear,StateNo >= 1000;普通技容易被空振取消掉
trigger1 = P2BodyDist x < 65
trigger1 = var(11) := 201471
value = 2014


[State -1, 捶地]
type = ChangeState
triggerall = var(0)
triggerall = (var(4) & 2**4)
triggerall = power >= 1000
triggerall = (StateType != A)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && time > 8)
triggerall = EnemyNear,MoveType = A
Triggerall = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
triggerall = EnemyNear,Time < -EnemyNear,AnimTime
;捶必杀
trigger1 = EnemyNear,StateNo = [1000,1999]
trigger1 = EnemyNear,AnimTime < -6
trigger1 = P2BodyDist x > 160
trigger1 = var(11) := 201571
;捶超杀
trigger2 = EnemyNear,StateNo >= 1999
trigger2 = EnemyNear,AnimTime = [-16,-6]
trigger2 = P2BodyDist x > 160
trigger2 = var(11) := 201572
value = 2015


[State -1, 礼服]
type = ChangeState
triggerall = var(0)
triggerall = power >= 1000
triggerall = (StateType != A)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && time > 8)
triggerall = EnemyNear,MoveType = A && EnemyNear,StateNo >= 1000
Triggerall = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
triggerall = EnemyNear,Time < -EnemyNear,AnimTime
;近程
Trigger1 = Helper(33334),var(11) = 0
trigger1 = EnemyNear,AnimTime < -6
trigger1 = EnemyNear,Time >= 6
trigger1 = P2BodyDist x < 55
trigger1 = var(11) := 222671
value = 2226

[State -1, 下劈]
type = ChangeState
triggerall = var(0)
triggerall = (var(4) & 2**4)
Triggerall = Helper(33334),var(59) = 0; 不能是全程无敌的招式
triggerall = power >= 1000
triggerall = (StateType != A)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && time > 8)
triggerall = EnemyNear,StateNo = [200,999]
triggerall = EnemyNear,MoveType = A
triggerall = EnemyNear,Time < 2
triggerall = EnemyNear,Time < -EnemyNear,AnimTime
;近程
trigger1 = P2BodyDist Y >= -120
trigger1 = P2BodyDist x = [-5, 60]
trigger1 = var(11) := 100571
value = 1005

[State -1, 鼓膜破裂,不准确]
type = ChangeState
triggerall = var(0)
triggerall = (StateType != A)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && time > 8)
triggerall = EnemyNear,StateNo >= 200
triggerall = EnemyNear,MoveType = A
;不存在弹幕
triggerall = EnemyNear,NumProj = 0
triggerall = !PlayerIdExist(helper(33333333),var(3))
;近程
trigger1 = enemynear,stateno = helper(33000),var(2)
trigger1 = helper(33000),var(3) - enemynear,time = [7, 15]
trigger1 = fvar(14) >= 0
trigger1 = P2BodyDist x = [-5, 125]
trigger1 = Facing != EnemyNear,Facing || (P2BodyDist x = [-10, 80])
trigger1 = var(11) := 100971
value = 1009

[State -1, 抱杀]
type = ChangeState
triggerall = var(0)
triggerall = (StateType != A)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && time > 8)
triggerall = EnemyNear,MoveType = A
triggerall = EnemyNear,StateType != A
triggerall = EnemyNear,AnimTime <= -5
triggerall = EnemyNear,Vel Y = 0
triggerall = fvar(14) >= 0
triggerall = EnemyNear,Facing != Facing
triggerall = P2BodyDist x = [-30, 30]
;普通技能,要在其攻击帧出来之前
trigger1 = EnemyNear,StateNo = [200,999]
trigger1 = enemynear,stateno = helper(33000),var(2)
trigger1 = helper(33000),var(3) - enemynear,time >= 5
trigger1 = var(11) := 200371
;超级技能
trigger2 = EnemyNear,StateNo >= 1000
trigger2 = enemynear,stateno = helper(33000),var(2)
trigger2 = helper(33000),var(3) - enemynear,time = [5,10]
trigger2 = var(11) := 200372
;
trigger3 = EnemyNear,StateNo = [1000,1999]
trigger3 = helper(33000),var(2) = 0
trigger3 = enemynear,time > 8
trigger3 = var(11) := 200373
value = 2003

[State -1, 架招]
type = ChangeState
triggerall = var(0)
triggerall = (StateType != A)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && Time > 8)
triggerall = EnemyNear,StateNo >= 200
triggerall = EnemyNear,MoveType = A
triggerall = !EnemyNear,Ctrl
Triggerall = EnemyNear,HitDefAttr != SCA,AT,AP
triggerall = EnemyNear,Time < -EnemyNear,AnimTime
Triggerall = EnemyNear,Time - EnemyNear,AnimTime < 29;否则就是弹幕技能了
triggerall = fvar(14) >= 0 
Triggerall = EnemyNear,Pos Y >= -55
;不存在弹幕
triggerall = EnemyNear,NumProj = 0
triggerall = !PlayerIdExist(helper(33333333),var(3))
;
trigger1 = P2BodyDist x = [-75, 130]
trigger1 = enemynear,stateno = helper(33000),var(2)
trigger1 = helper(33000),var(3) - enemynear,time = [1,7] ;3-7,大于等于7的交给鼓膜破裂
trigger1 = var(11) := 200271
;普通技
trigger2 = P2BodyDist x = [-75, 75]
trigger2 = EnemyNear,StateNo = [200,999]
trigger2 = EnemyNear,Time <= 2
trigger2 = helper(33000),var(2) = 0 || helper(33000),var(3) - enemynear,time < 0;AI Helper未记录
trigger2 = var(11) := 200272
;近程特殊技等
trigger3 = EnemyNear,Facing != Facing
trigger3 = (var(4) & 2**5) = 0
trigger3 = P2BodyDist x = [-5, 85]
trigger3 = EnemyNear,StateNo >= 1000
trigger3 = EnemyNear,Time = [3,7]
trigger3 = var(11) := 200273
;普通技
trigger4 = P2BodyDist x = [-75, 75]
trigger4 = EnemyNear,StateNo = [200,999]
trigger4 = EnemyNear,Time <= 4
trigger4 = var(11) := 200274
value = 2002

[State -1, 冲杀]
type = ChangeState
triggerall = var(0)
triggerall = (StateType != A)
Triggerall = Helper(33334),var(59) = 0; 不能是全程无敌的招式
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && time > 8)
triggerall = EnemyNear,MoveType = A || EnemyNear,MoveType = I
triggerall = !EnemyNear,Ctrl
Triggerall = P2BodyDist x > 90
;远程
trigger1 = EnemyNear,StateType != A
trigger1 = EnemyNear,StateNo = [1000,1999]
trigger1 = EnemyNear,AnimTime <= -22 - (P2BodyDist x/60)
trigger1 = EnemyNear,Vel Y = 0
trigger1 = fvar(14) = 0
trigger1 = P2BodyDist x = [180,220]
trigger1 = var(11) := 100771
;
trigger2 = EnemyNear,StateType != A
trigger2 = EnemyNear,StateNo >= 2000 && EnemyNear,StateNo != [5000,5999]
trigger2 = EnemyNear,AnimTime =[-22 - (P2BodyDist x/60) -3, -22 - (P2BodyDist x/60)]
trigger2 = EnemyNear,Vel Y = 0
trigger2 = fvar(14) = 0
trigger2 = P2BodyDist x = [180,220]
trigger2 = var(11) := 100772
;
trigger3 = EnemyNear,MoveType = A
trigger3 = EnemyNear,StateType = A
trigger3 = P2BodyDist x = [180,220]
trigger3 = EnemyNear,AnimTime =[-22 - (P2BodyDist x/60) -3, -22 - (P2BodyDist x/60)]
trigger3 = EnemyNear,Pos Y <= -55
trigger3 = var(11) := 100773
value = 1007

[State -3, 空闪]
type = ChangeState
triggerall = var(0)
triggerall = (StateType != A)
triggerall = Ctrl || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && Time > 8)
triggerall = EnemyNear,MoveType = A || EnemyNear,MoveType = I
triggerall = EnemyNear,StateType != A
triggerall = EnemyNear,Facing != Facing
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,AnimTime <= -9;
;直接闪到其身后
trigger1 = EnemyNear,StateNo = [200,1999]
trigger1 = fvar(14) >= 0 
trigger1 = P2BodyDist x < 70
trigger1 = var(11) := 101171
;弹幕技能
trigger2 = EnemyNear,AnimTime = [-19,-9]
trigger2 = P2BodyDist x < 180
trigger2 = EnemyNear,StateNo = [1000,1999]
trigger2 = EnemyNear,NumProj || PlayerIdExist(helper(33333333),var(3))
trigger2 = var(11) := 101172

;超杀技能
Trigger3 = inguarddist
trigger3 = EnemyNear,AnimTime < -9
trigger3 = P2BodyDist x < 75
trigger3 = EnemyNear,Time < -EnemyNear,AnimTime
Trigger3 = EnemyNear,StateNo >= 1000
Trigger3 = EnemyNear,StateNo != [5000,5999]
trigger3 = var(11) := 101173
value = 1011


[State -3]`
type = ChangeState
TriggerAll = var(0)
triggerall = Ctrl || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && Time > 8)
TriggerAll = !IsHelper
TriggerAll = StateType != A 
trigger1 = EnemyNear,StateNo >= 1000
trigger1 = EnemyNear,StateType = A || EnemyNear,Pos Y < 0 || EnemyNear,Vel Y < 0
trigger1 = EnemyNear,MoveType = A 
trigger1 = inguarddist
trigger1 = var(11) := 101173
value = ifelse(BackEdgeBodyDist > 120, 105, 1011)

[State -1, 剪刀脚]
type = ChangeState
triggerall = var(0)
Triggerall = Helper(33334),var(59) = 0; 不能是全程无敌的招式
triggerall = (StateType != A)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && Time > 8)
triggerall = EnemyNear,MoveType = A
Triggerall = EnemyNear,StateType != A
triggerall = EnemyNear,AnimTime <= -6
triggerall = P2BodyDist x - fvar(14)*6 = [-10,83]
;切返普通技
trigger1 = EnemyNear,StateNo = [200,999]
trigger1 = enemynear,stateno = helper(33000),var(2)
trigger1 = enemynear,time <= helper(33000),var(3) - 6
trigger1 = var(11) := 100271
;切返超杀
trigger2 = EnemyNear,StateNo = [1000,1999]
trigger2 = EnemyNear,Time = [4,10]
trigger2 = var(11) := 100272
value = 1002


[State -1, 搬运]
type = ChangeState
triggerall = var(0)
triggerall = var(4) & 2**8 = 0
Triggerall = Helper(33334),var(59) = 0; 不能是全程无敌的招式
triggerall = (StateType != A)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && Time > 8)
triggerall = EnemyNear,MoveType = A
Triggerall = EnemyNear,StateType != A
triggerall = EnemyNear,StateNo = [1000,1999]
triggerall = EnemyNear,AnimTime < - 16 - (P2BodyDist x / 20)
;
trigger1 = EnemyNear,Vel Y = 0
trigger1 = P2BodyDist x > 90
trigger1 = var(11) := 100071
value = 1000



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;抓硬直6
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[State -3, 2A]
type = ChangeState
triggerall = var(0)
triggerall = (var(4)&2**1) = 0 ;不能是落地受身
Triggerall = Helper(33334),var(59) = 0; 不能是全程无敌的招式
triggerall = random < 250 || (var(4)&2**6) 
triggerall = (StateType != A)
TriggerAll = !InGuardDist || EnemyNear,Facing = Facing || (EnemyNear,StateNo >= 1000 && (EnemyNear,Time > -EnemyNear,AnimTime))
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && Time > 8)
Triggerall = EnemyNear,StateNo < 5000
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,MoveType = A || EnemyNear,MoveType = I
triggerall = EnemyNear,StateType != A
triggerall = EnemyNear,StateType != L
triggerall = P2BodyDist x = [-5, 81]
triggerall = fvar(14) = 0
Trigger1 = EnemyNear,NumProj = 0 || EnemyNear,StateNo < 2000
Trigger1 = !PlayerIdExist((Helper(33333333),var(3))) || PlayerId((Helper(33333333),var(3))),p2bodydist x > 100
Trigger1 = EnemyNear,AnimTime = [-13, -5]
trigger1 = var(11) := 43061
value = 430


[State -3, Y]
type = ChangeState
triggerall = var(0)
triggerall = (var(4)&2**1) = 0 ;不能是落地受身
Triggerall = Helper(33334),var(59) = 0; 不能是全程无敌的招式
triggerall = random < 500 || (var(4)&2**6) 
triggerall = (StateType != A)
TriggerAll = !InGuardDist || EnemyNear,Facing = Facing || (EnemyNear,StateNo >= 1000 && (EnemyNear,Time > -EnemyNear,AnimTime))
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && Time > 8)
Triggerall = EnemyNear,StateNo < 5000
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,MoveType = A || EnemyNear,MoveType = I
triggerall = EnemyNear,StateType = S
triggerall = EnemyNear,StateType != L
triggerall = P2BodyDist x = [-5, 90]
triggerall = fvar(14) = 0
Trigger1 = EnemyNear,NumProj = 0 || EnemyNear,StateNo < 2000
Trigger1 = !PlayerIdExist((Helper(33333333),var(3))) || PlayerId((Helper(33333333),var(3))),p2bodydist x > 100
Trigger1 = EnemyNear,AnimTime = [-13, -8]
trigger1 = var(11) := 25061
value = 250


[State -3, ]
type = Null;ChangeState
triggerall = var(0)
triggerall = (var(4)&2**1) = 0 ;不能是落地受身
Triggerall = (var(4)&2**6) = 0 ;不能是当身起手的人物
Triggerall = Helper(33334),var(59) = 0; 不能是全程无敌的招式
triggerall = (StateType != A)
TriggerAll = !InGuardDist || EnemyNear,Facing = Facing || (EnemyNear,StateNo >= 1000 && (EnemyNear,Time > -EnemyNear,AnimTime))
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && Time > 8)
Triggerall = EnemyNear,StateNo < 5000
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,MoveType = A || EnemyNear,MoveType = I
triggerall = EnemyNear,StateType != A
triggerall = EnemyNear,StateType != L
triggerall = P2BodyDist x = [-5, 83]
triggerall = fvar(14) = 0
;
Trigger1 = EnemyNear,AnimTime = [-12, -9]
trigger1 = EnemyNear,Facing = Facing
trigger1 = var(11) := 21061
;
Trigger2 = EnemyNear,Facing != Facing
Trigger2 = EnemyNear,AnimTime = [-12, -9]
trigger2 = var(11) := 21062
value = 210


[State -3, ]
type = ChangeState
triggerall = var(0)
triggerall = (var(4)&2**1) = 0 ;不能是落地受身
Triggerall = (var(4)&2**6) = 0 ;不能是当身起手的人物
Triggerall = Helper(33334),var(59) = 0; 不能是全程无敌的招式
triggerall = (StateType != A)
TriggerAll = !InGuardDist || EnemyNear,Facing = Facing || (EnemyNear,StateNo >= 1000 && (EnemyNear,Time > -EnemyNear,AnimTime))
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && Time > 8)
triggerall = EnemyNear,StateNo >= 200
Triggerall = EnemyNear,StateNo < 5000
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,MoveType = A || EnemyNear,MoveType = I
triggerall = EnemyNear,StateType != A 
triggerall = EnemyNear,StateType != L
triggerall = fvar(14) = 0
Triggerall = EnemyNear,NumProj = 0 || EnemyNear,StateNo < 2000
Triggerall = !PlayerIdExist((Helper(33333333),var(3))) || PlayerId((Helper(33333333),var(3))),p2bodydist x > 100
;
trigger1 = EnemyNear,AnimTime = [-10, -8]
trigger1 = (EnemyNear,StateNo = [1000,1999])
trigger1 = P2BodyDist x - fvar(14)*8 = [-5, 90]
trigger1 = var(11) := 25062
value = ifelse(EnemyNear,StateType = S, 250, 240)


[State -3, 立A]
type = ChangeState
triggerall = var(0)
triggerall = (var(4)&2**1) = 0 ;不能是落地受身
Triggerall = (var(4)&2**6) = 0 ;不能是当身起手的人物
Triggerall = Helper(33334),var(59) = 0; 不能是全程无敌的招式
triggerall = (StateType != A)
TriggerAll = !InGuardDist || EnemyNear,Facing = Facing || (EnemyNear,StateNo >= 1000 && (EnemyNear,Time > -EnemyNear,AnimTime))
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && Time > 8)
Triggerall = EnemyNear,StateNo < 5000
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,MoveType = A || EnemyNear,MoveType = I
triggerall = EnemyNear,StateType != A
triggerall = EnemyNear,StateType != L
triggerall = P2BodyDist x = [-5, 45]
triggerall = fvar(14) = 0
Trigger1 = EnemyNear,NumProj = 0 || EnemyNear,StateNo < 2000
Trigger1 = !PlayerIdExist((Helper(33333333),var(3))) || PlayerId((Helper(33333333),var(3))),p2bodydist x > 100
Trigger1 = EnemyNear,AnimTime = [-4, -2]
trigger1 = var(11) := 23061
value = 230


[State -3,投]
Type = ChangeState
value = 800
TriggerAll = var(0)
TriggerAll = !IsHelper
Triggerall = Helper(33334),var(59) = 0; 不能是全程无敌的招式
TriggerAll = !InGuardDist || EnemyNear,Facing = Facing || (EnemyNear,StateNo >= 1000 && (EnemyNear,Time > -EnemyNear,AnimTime))
Triggerall = StateType != A
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && Time > 8)
triggerall = EnemyNear,StateNo >= 200
Triggerall = EnemyNear,StateNo < 5000
triggerall = EnemyNear,AnimTime < -2
triggerall = !EnemyNear,Ctrl
triggerall = EnemyNear,MoveType = A || EnemyNear,MoveType = I
triggerall = EnemyNear,StateType != A 
triggerall = EnemyNear,StateType != L
;抓普通技
trigger1 = EnemyNear,StateNo = [200,999]
trigger1 = EnemyNear,AnimTime = [-4, -1]
Trigger1 = P2BodyDist x < 30
Trigger1 = var(11) := 80061
;抓位移技能
trigger2 = EnemyNear,StateNo = [200,1999]
trigger2 = EnemyNear,AnimTime < -1
trigger2 = EnemyNear,Vel x >= 5
Trigger2 = P2BodyDist x < 30
Trigger2 = var(11) := 80062
IgnoreHitPause = 1


[State -3, ]
type = ChangeState
triggerall = var(0)
triggerall = (var(4)&2**1) = 0 ;不能是落地受身
Triggerall = Helper(33334),var(59) = 0; 不能是全程无敌的招式
triggerall = (StateType != A)
TriggerAll = !InGuardDist
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && Time > 8)
triggerall = EnemyNear,StateNo = 15002
triggerall = EnemyNear,Time < 150
triggerall = !EnemyNear,Ctrl
triggerall = fvar(14) = 0
Triggerall = EnemyNear,NumProj = 0 || EnemyNear,StateNo < 2000
Triggerall = !PlayerIdExist((Helper(33333333),var(3))) || PlayerId((Helper(33333333),var(3))),p2bodydist x > 100
;
trigger1 = P2BodyDist x = [-5, 83]
trigger1 = var(11) := 21063
value = ifelse(random <500 || EnemyNear,Life > 300 || Life < EnemyNear,Life, 410, 210)

[State -3, ]
type = ChangeState
triggerall = var(0)
triggerall = (var(4)&2**1) = 0 ;不能是落地受身
Triggerall = Helper(33334),var(59) = 0; 不能是全程无敌的招式
triggerall = (StateType != A)
triggerall = Ctrl || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && Time > 8)
;抓攻击硬直
trigger1 = EnemyNear,StateNo = [1000,1999]
trigger1 = EnemyNear,AnimTime < -7
trigger1 = EnemyNear,MoveType = A
trigger1 = EnemyNear,StateType != A
trigger1 = EnemyNear,Facing != Facing
trigger1 = P2BodyDist x = [100,180]
trigger1 = var(11) := 101161
;追击眩晕状态
trigger2 = EnemyNear,StateNo = 15002
trigger2 = EnemyNear,Time < 140
trigger2 = P2BodyDist x > 85
trigger2 = var(11) := 101162
;追击空中
trigger3 = EnemyNear,MoveType = H
Trigger3 = EnemyNear,StateType = A
trigger3 = EnemyNear,StateNo = [5000,5999]
trigger3 = P2BodyDist x > 40
trigger3 = fvar(14) > 0
trigger3 = EnemyNear,Pos Y < -150 || EnemyNear,Vel y < 0
trigger3 = var(11) := 101163
;
trigger4 = EnemyNear,AnimTime < -6
trigger4 = StateNo = 701 && Time > 8
trigger4 = !EnemyNear,Ctrl
trigger4 = EnemyNear,MoveType != H
Trigger4 = EnemyNear,StateNo = [1000,1999]
trigger4 = P2BodyDist x > 160
trigger4 = var(11) := 101164 
value = 1011

[State -3, ]
type = ChangeState
triggerall = var(0)
triggerall = (var(4)&2**1) = 0 ;不能是落地受身
Triggerall = Helper(33334),var(59) = 0; 不能是全程无敌的招式
triggerall = (StateType != A)
triggerall = !EnemyNear,Ctrl
Triggerall = EnemyNear,MoveType != H
Triggerall = EnemyNear,StateType != L
triggerall = EnemyNear,Facing != Facing
;弹幕击中追击
trigger1 = Ctrl || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && Time > 8)
trigger1 = Fvar(14) = 0
trigger1 = P2BodyDist x > 75
trigger1 = EnemyNear,AnimTime < -7
Trigger1 = PlayerIdExist((Helper(33333333),var(3))) 
Trigger1 = PlayerId((Helper(33333333),var(3))),p2bodydist x < 60
Trigger1 = inguarddist
trigger1 = var(11) := 101165
;弹幕击中追击
trigger2 = EnemyNear,AnimTime < -6
Trigger2 = EnemyNear,NumProj || PlayerIdExist((Helper(33333333),var(3))) 
Trigger2 = StateNo = 701 && Time > 8
Trigger2 = P2BodyDist x < 40
Trigger2 = EnemyNear,BackEdgeBodyDist > 80
trigger2 = var(11) := 101166
value = 1011


[State -3, 后撤]
type = ChangeState
triggerall = var(0)
triggerall = (StateType != A)
triggerall = Ctrl || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && Time > 8)
triggerall = BackEdgeBodyDist > 100
;
Trigger1 = Helper(33334),var(59) = 1; 不能是全程无敌的招式
trigger1 = var(11) := 10561
value = 105


[State -3, 后撤]
type = ChangeState
triggerall = var(0)
triggerall = (StateType != A)
triggerall = Ctrl || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && Time > 8) 
Trigger1 = P2BodyDist x < 32
Trigger1 = EnemyNear,StateNo = 5120 && EnemyNear,AnimTime = -1
trigger1 = var(11) := 10562
value = ifelse(BackEdgeBodyDist > 100,105,1011)

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;起攻5
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[State -1, チョップ]
type = ChangeState
triggerall = var(0)
triggerall = (var(4)&2**2) = 0
triggerall = (var(4)&2**6) = 0 ;不能是当身起手的
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 701 && Time > 8)
triggerall = P2BodyDist x = [-10, 92]
Triggerall = EnemyNear,NumProj = 0
Triggerall = !PlayerIdExist((Helper(33333333),var(3))) || PlayerId((Helper(33333333),var(3))),p2bodydist x > 100 
trigger1 = !EnemyNear,Ctrl
trigger1 = EnemyNear,StateNo = 5120 && EnemyNear,AnimTime = [-17, -13]
trigger1 = var(11) := 27051
value = 270

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;连段4
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[State -3, 冲拳]
type = ChangeState
triggerall = var(0)
triggerall = (StateType != A)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149])
triggerall = EnemyNear,MoveType = H
triggerall = !EnemyNear,Ctrl
;追击重拳
trigger1 = NumTarget(1015) && EnemyNear,StateNo >= 5000
trigger1 = var(11) := 100741
;眩晕状态
trigger2 = EnemyNear,StateNo = 5300
trigger2 = var(11) := 100742
value = ifelse(P2BodyDist x < 85, ifelse(P2BodyDist x < 50, 410, 210) , 1007)


[State -1, 剪刀脚]
type = ChangeState
triggerall = var(0)
triggerall = StateType != A
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149])
triggerall = EnemyNear,StateType = A
triggerall = EnemyNear,MoveType = H 
triggerall = EnemyNear,StateNo >= 5000
triggerall = !EnemyNear,Ctrl
trigger1 = !NumTarget(1002)
trigger1 = (p2bodydist X - fvar(14)*6 = [-5,85]) || (Frontedgebodydist < 60) || (EnemyNear,BackEdgeBodyDist < 20 && P2BodyDist x < 85)
trigger1 = enemynear,pos Y + enemynear,vel Y*6 + fvar(15)*6*7*0.5 = [-110,-30]
trigger1 = var(11) := 100241
value = 1002

[State -1, 猛兽连击 浮空追击]
type = ChangeState
triggerall = var(0)
triggerall = power >= 2000
triggerall = (StateType != A)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149])
triggerall = EnemyNear,StateType = A
triggerall = EnemyNear,MoveType = H
triggerall = !EnemyNear,Ctrl
triggerall = var(12) != 2014
;秒杀对方
trigger1 = (p2bodydist X - fvar(14)*5 = [-5,60]) || (Frontedgebodydist < 60)
trigger1 = enemynear,pos Y + enemynear,vel Y*5 + fvar(15)*5*6*0.5 = [-80,-20]
trigger1 = var(11) := 201441
trigger1 = var(12) := 2014
value = 2014

[State -1, 下劈]
type = ChangeState
triggerall = var(0)
triggerall = (var(4) & 2**4)
triggerall = power >= 1000
triggerall = (StateType != A)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149])
triggerall = EnemyNear,StateType = A
triggerall = EnemyNear,MoveType = H
triggerall = !EnemyNear,Ctrl
;
trigger1 = (p2bodydist X -  fvar(14)*1 = [-10,60]) || (Frontedgebodydist < 60)
trigger1 = enemynear,pos Y + enemynear,vel Y*1 + fvar(15)*1*2*0.5 = [-70,-30]
trigger1 = var(11) := 100541
value = 1005

[State -1, 立A]
type = ChangeState
triggerall = var(0)
triggerall = (StateType != A)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149])
triggerall = EnemyNear,StateType = A
triggerall = EnemyNear,MoveType = H
triggerall = !EnemyNear,Ctrl
triggerall = !InGuardDist
;追击浮空
trigger1 = (p2bodydist X - fvar(14)*2 = [-10,40]) || (Frontedgebodydist < 60)
trigger1 = enemynear,pos Y + enemynear,vel Y*2 + fvar(15)*2*3*0.5 = [-50,-30]
trigger1 = var(11) := 23041
value = 230


[State -1, 立B]
type = ChangeState
triggerall = var(0)
triggerall = (StateType != A)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149])
triggerall = EnemyNear,StateType = A
triggerall = EnemyNear,MoveType = H
triggerall = !EnemyNear,Ctrl
triggerall = !InGuardDist
;追击浮空
trigger1 = (p2bodydist X - fvar(14)*5 = [-10,40]) || (Frontedgebodydist < 60)
trigger1 = enemynear,pos Y + enemynear,vel Y*5 + fvar(15)*5*6*0.5 = [-65,-30]
trigger1 = var(11) := 26041
value = 260


[State -1, 2A追击倒地]
type = ChangeState
triggerall = var(0)
triggerall = (StateType != A)
triggerall = !InGuardDist
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149])
triggerall = EnemyNear,MoveType = H
triggerall = !EnemyNear,Ctrl
triggerall = !NumTarget(430)
triggerall = !NumTarget(400)
triggerall = (p2bodydist X - fvar(14)*1 = [-10,70]) || (Frontedgebodydist < 60)
trigger1 = EnemyNear,StateNo = 5101 || enemynear,Stateno = 5100
trigger1 = var(11) := 43041
value = ifelse(P2BodyDist x < 57 && random < 400, 400, 430)

[State -1, 按地锤]
type = ChangeState
triggerall = var(0)
triggerall = (Power > 1999)
trigger1 = EnemyNear,MoveType = H && !EnemyNear,Ctrl
trigger1 = (StateNo = 1006) && (MoveHit)
trigger1 = EnemyNear,Vel Y > 0
trigger1 = var(11) := 160041
value = 1600

[State -1, 全屏杀 浮空追击]
type = ChangeState
triggerall = var(0)
triggerall = power >= 2000
triggerall = Power < 3000
triggerall = EnemyNear,Life < 150;直接秒，否则留气到鬼背
triggerall = (StateType != A)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149])
triggerall = EnemyNear,StateType = A
triggerall = EnemyNear,MoveType = H
triggerall = !EnemyNear,Ctrl
triggerall = enemynear,pos Y + enemynear,vel Y*12 + fvar(15)*12*13*0.5 < -30
;秒杀对方
trigger1 = EnemyNear,Life < 300
trigger1 = var(11) := 350041
;其他招式连不上了
trigger2 = P2BodyDist x > 80
trigger2 = EnemyNear,BackEdgeBodyDist > 60
trigger2 = var(11) := 350042
;连段中已经有其他大招了
trigger3 = var(12) != 0
trigger3 = var(11) := 350043
value = 3500


[State -3, ]
type = ChangeState
triggerall = var(0)
triggerall = (StateType != A)
triggerall = Ctrl || (StateNo = [18,19]) || (StateNo = [120,149])
triggerall = EnemyNear,StateNo >= 5000
triggerall = EnemyNear,MoveType = H
Triggerall = !EnemyNear,Ctrl
;
trigger1 = EnemyNear,StateType = A
trigger1 = P2BodyDist x > 85
trigger1 = var(11) := 101141
value = 1011

[State -3]
type = ChangeState
triggerall = var(0)
triggerall = (StateType != A)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || (StateNo = 200 && (MoveContact || Time > 8))
triggerall = EnemyNear,MoveType = H
triggerall = EnemyNear,StateType = A
;
trigger1 = (p2bodydist X - fvar(14)*4 = [-10,79]) || (Frontedgebodydist < 60)
trigger1 = enemynear,pos Y + enemynear,vel Y*4 + fvar(15)*4*5*0.5 = [-66, -35]
trigger1 = var(11) := 20041
value = 200


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;立回3
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[State -3, 立Y]
Type = ChangeState
triggerall = var(0)
TriggerAll = !IsHelper
TriggerAll = StateType != A
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149])
TriggerAll = (abs(P2BodyDist X) > 25)
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = !PlayerIdExist(Helper(33333333),var(3)) || abs(PlayerId(Helper(33333333),var(3)),P2BodyDist x) > 60
TriggerAll = EnemyNear,Facing != Facing
;对空
Trigger1 = (EnemyNear,MoveType = A && EnemyNear,Time < 4) || EnemyNear,MoveType = I
Trigger1 = EnemyNear,StateType = A
trigger1 = (p2bodydist X - fvar(14)*8 = [35,90]) || (Frontedgebodydist < 60)
trigger1 = enemynear,pos Y + enemynear,vel Y*8 + fvar(15)*8*9*0.5 = [-55,-35]
Trigger1 = var(11) := 25031
Value = 250


[State -3,2Y]
Type = changestate
triggerall = var(0)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149])
TriggerAll = StateType != A 
TriggerAll = EnemyNear,MoveType != H
TriggerAll = EnemyNear,Facing != Facing
;不存在弹幕
triggerall = EnemyNear,NumProj = 0
triggerall = !PlayerIdExist(helper(33333333),var(3))
;对空
Trigger1 = P2BodyDist x > 40
Trigger1 = EnemyNear,StateType = A
trigger1 = (p2bodydist X - fvar(14)*10 = [-15,30]) || (Frontedgebodydist < 60)
trigger1 = enemynear,pos Y + enemynear,vel Y*10 + fvar(15)*10*11*0.5 = [-100,-60]
trigger1 = var(11) := 41031
value = 410

[State -3,6X]
Type = changestate
triggerall = var(0)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149])
TriggerAll = StateType != A 
TriggerAll = EnemyNear,MoveType != H
TriggerAll = EnemyNear,Facing != Facing
;不存在弹幕
triggerall = EnemyNear,NumProj = 0
triggerall = !PlayerIdExist(helper(33333333),var(3))
;对空
Triggerall = EnemyNear,StateType = A
Triggerall = EnemyNear,StateNo < 1000
Triggerall = (p2bodydist X - fvar(14)*9 = [-20,90]) || (Frontedgebodydist < 60)
Triggerall = enemynear,pos Y + enemynear,vel Y*9 + fvar(15)*9*9*0.5 = [-110,-35]
Triggerall = P2BodyDist x >= 40
;抢招
Trigger1 = EnemyNear,MoveType = A
trigger1 = enemynear,stateno = helper(33000),var(2)
trigger1 = enemynear,time < helper(33000),var(3) - 9
trigger1 = var(11) := 21031
;
trigger2 = !InGuardDist
trigger2 = var(11) := 21032
value = 210


[State -3,剪刀脚]
Type = changestate
TriggerAll = var(0)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149])
TriggerAll = StateType != A 
TriggerAll = EnemyNear,MoveType != H
;不存在弹幕
;triggerall = EnemyNear,NumProj = 0
;triggerall = !PlayerIdExist(helper(33333333),var(3))
;对空
Trigger1 = (EnemyNear,StateNo = [0,999]) || EnemyNear,Vel Y > 0
Trigger1 = EnemyNear,StateType = A
trigger1 = (p2bodydist X - fvar(14)*6 = [-10,85]) || (Frontedgebodydist < 60) || (EnemyNear,BackEdgeBodyDist < 20 && P2BodyDist x < 85)
trigger1 = enemynear,pos Y + enemynear,vel Y*6 + fvar(15)*6*7*0.5 = [-110,-30]
trigger1 = var(11) := 100231
value = 1002


[State -3,空闪]
Type = changestate
TriggerAll = var(0)
triggerall = Ctrl || (StateNo = [18,19]) || (StateNo = [120,149])
TriggerAll = !IsHelper
TriggerAll = StateType != A 
Triggerall = Frontedgebodydist > 150
;被压版边
Trigger1 = EnemyNear,MoveType = A || EnemyNear,Ctrl || inguarddist
Trigger1 = BackEdgeBodyDist < 30
Trigger1 = EnemyNear,MoveType != H
Trigger1 = P2BodyDist x < 30
Trigger1 = fvar(14) >= 0
Trigger1 = enemynear,pos Y < -50
Trigger1 = var(11) := 101131
;被压版边
Trigger2 = BackEdgeBodyDist < 30
Trigger2 = P2BodyDist x < 30
Trigger2 = EnemyNear,Ctrl || EnemyNear,StateNo < 200
Trigger2 = var(11) := 101132
value = 1011


[State -3,后撤]
Type = changestate
triggerall = var(0)
triggerall = Ctrl
TriggerAll = !IsHelper
TriggerAll = StateType != A 
TriggerAll = BackEdgeBodyDist >= 60
;对方攻击的距离大于我们能攻击到的最大距离，就后撤一下
Trigger1 = InGuardDist
Trigger1 = EnemyNear,MoveType = A && !EnemyNear,Ctrl
Trigger1 = EnemyNear,StateNo = [200,999]
Trigger1 = Life >= 200
Trigger1 = Random < 100
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x = [85,110]
Trigger1 = fvar(14) <= 0
Trigger1 = enemynear,stateno = helper(33000),var(2)
Trigger1 = helper(33000),var(3) - enemynear,time < 7
Trigger1 = var(11) := 10531
;闪避空中的攻击
Trigger2 = EnemyNear,MoveType != H
Trigger2 = EnemyNear,StateType = A
Trigger2 = Life >= 200
Trigger2 = Random = [100,200]
Trigger2 = EnemyNear,P2BodyDist x = [-10,0]
Trigger2 = EnemyNear,Facing != Facing
Trigger2 = fvar(14) > 0
Trigger2 = enemynear,pos Y + enemynear,vel Y*6 + fvar(15)*6*7*0.5 < 0
Trigger2 = var(11) := 10532
value = 105

[State -3, 2A]
Type = ChangeState
TriggerAll = var(0)
Triggerall = var(16) = 0
Triggerall = !inguarddist && EnemyNear,MoveType != A
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149])
TriggerAll = !IsHelper
TriggerAll = RoundState = 2
TriggerAll = Random < 150
TriggerAll = StateType != A
TriggerAll = (abs(P2BodyDist X) = [55,81])
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = !PlayerIdExist(Helper(33333333),var(3)) || abs(PlayerId(Helper(33333333),var(3)),P2BodyDist x) > 50
;对地
trigger1 = (var(4)&2**6) || Random < 50;是当身起手的
Trigger1 = EnemyNear,Power < 1000 || P2BodyDist x > 76
Trigger1 = EnemyNear,StateNo < 200
Trigger1 = EnemyNear,StateType != A
Trigger1 = EnemyNear,Vel x >= 0
Trigger1 = var(11) := 43031
Trigger1 = var(16) := var(16) + ifelse(Life >= EnemyNear,Life, 20, 40)
value = 430

[State -3, 6X]
Type = ChangeState
TriggerAll = var(0)
Triggerall = var(16) = 0
Triggerall = !inguarddist && EnemyNear,MoveType != A
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149])
TriggerAll = !IsHelper
TriggerAll = RoundState = 2
TriggerAll = Random < 100
TriggerAll = StateType != A
TriggerAll = (abs(P2BodyDist X) = [75,86])
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = !PlayerIdExist(Helper(33333333),var(3)) || abs(PlayerId(Helper(33333333),var(3)),P2BodyDist x) > 50
;对地
trigger1 = (var(4)&2**6) = 0 ;不能是当身起手的
Trigger1 = EnemyNear,StateNo < 200
Trigger1 = EnemyNear,StateType != A
Trigger1 = EnemyNear,Vel x >= 0
Trigger1 = var(11) := 21033
Trigger1 = var(16) := var(16) + ifelse(Life >= EnemyNear,Life, 20, 40)
value = 210


[State -3, 6B]
Type = ChangeState
TriggerAll = var(0)
Triggerall = !inguarddist && EnemyNear,MoveType != A
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149])
TriggerAll = !IsHelper
Triggerall = !inguarddist
TriggerAll = RoundState = 2
TriggerAll = Random = [200, 400]
TriggerAll = StateType != A
TriggerAll = (abs(P2BodyDist X) = [75,120])
Triggerall = EnemyNear,Vel Y = 0
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = !PlayerIdExist(Helper(33333333),var(3)) || abs(PlayerId(Helper(33333333),var(3)),P2BodyDist x) > 50
;对地
Trigger1 = EnemyNear,Power < 1000
Trigger1 = EnemyNear,StateType != A
Trigger1 = EnemyNear,Vel x >= 0
Trigger1 = var(11) := 24031
Trigger1 = var(16) := var(16) + ifelse(Life >= EnemyNear,Life, 30, 60)
value = ifelse(random<300 || var(16) = 0, 240, 1011)

[State -3, X]
Type = ChangeState
TriggerAll = var(0)
Triggerall = !inguarddist && EnemyNear,MoveType != A
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149])
TriggerAll = !IsHelper
Triggerall = !inguarddist
TriggerAll = RoundState = 2
TriggerAll = Random = [400, 500]
TriggerAll = StateType != A
TriggerAll = (abs(P2BodyDist X) = [30,75])
Triggerall = EnemyNear,Vel Y = 0
Triggerall = EnemyNear,MoveType != A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = !PlayerIdExist(Helper(33333333),var(3)) || abs(PlayerId(Helper(33333333),var(3)),P2BodyDist x) > 50
;对地
trigger1 = (var(4)&2**6) = 0;不是当身起手的
Trigger1 = EnemyNear,Power < 1000
Trigger1 = EnemyNear,StateType = S
Trigger1 = EnemyNear,Vel x >= 0
Trigger1 = var(11) := 20031
Trigger1 = var(16) := var(16) + ifelse(Life >= EnemyNear,Life, 30, 60)
value = ifelse(random<450 || var(16) = 0, 200, 1011)

[State -1, チョップ]
type = ChangeState
triggerall = var(0)
Triggerall = var(16) = 0
Triggerall = !inguarddist && EnemyNear,MoveType != A
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149])
triggerall = EnemyNear,Facing != Facing
triggerall = EnemyNear,NumProj = 0
triggerall = !PlayerIdExist(helper(33333333),var(3))
triggerall = EnemyNear,Vel Y = 0
trigger1 = Random = [800,850]
trigger1 = P2BodyDist x = [85, 95]
trigger1 = EnemyNear,StateType != A
trigger1 = EnemyNear,Ctrl
trigger1 = var(11) := 27041
Trigger1 = var(16) := var(16) + ifelse(Life >= EnemyNear,Life, 30, 60)
value = 270

[State -3,JA]
Type = ChangeState
value = 630
TriggerAll = var(0)
TriggerAll = !IsHelper
TriggerAll = Ctrl || StateNo = [120,149]
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对非版边地面
Trigger1 = !InGuardDist
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - Vel X * 3 - fvar(14) * 3 = [0, 45]
Trigger1 = P2BodyDist Y - Vel Y * 3 - const(movement.yaccel) * 3 * (3 + 1) / 2 <= 70
Trigger1 = var(11) := 63041


[State -3,JB]
Type = ChangeState
value = 640
TriggerAll = var(0)
TriggerAll = !IsHelper
TriggerAll = Ctrl || StateNo = [120,149]
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对非版边地面
Trigger1 = !InGuardDist
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x - Vel X * 6 - fvar(14) * 6 = [0, 65]
Trigger1 = P2BodyDist Y - Vel Y * 6 - const(movement.yaccel) * 6 * (6 + 1) / 2 <= 50
Trigger1 = var(11) := 64041
;对空
Trigger2 = EnemyNear,StateNo != 5040
Trigger2 = EnemyNear,StateType = A
Trigger2 = P2BodyDist x - Vel x * 6 - fvar(14) * 6 = [0, 50]
Trigger2 = P2BodyDist y - Vel Y * 6 - const(movement.yaccel) * 6 * (6 + 1) / 2 + EnemyNear,Vel Y * 6 + fvar(15) * 6 * (6 + 1) / 2 = [-15,50]
Trigger2 = var(11) := 64032


[State -3,JX]
Type = ChangeState
value = 600
TriggerAll = var(0)
TriggerAll = !IsHelper
TriggerAll = Ctrl || StateNo = [120,149]
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = P2BodyDist x = [-10, 30]
TriggerAll = P2BodyDist y = [-20,20]
Triggerall = EnemyNear,StateNo != 5040
;对空/对地一起写 0F触发
Trigger1 = InGuardDist
Trigger1 = enemynear,stateno = helper(33000),var(2)
Trigger1 = enemynear,time < helper(33000),var(3) - 1
Trigger1 = var(11) := 60041
;
Trigger2 = !InGuardDist
Trigger2 = var(11) := 60042


[State -3,投]
Type = ChangeState
value = 800
TriggerAll = var(0)
TriggerAll = !IsHelper
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149])
TriggerAll = StateType != A
TriggerAll = EnemyNear,MoveType != H && EnemyNear,StateType != A
TriggerAll = (abs(P2BodyDist X) <= 30)
TriggerAll = EnemyNear,StateNo != 52
TriggerAll = EnemyNear,StateNo != 5120
TriggerAll = fvar(14) = 0
;距离够近，对方可控,注释掉，暂时不用
Trigger1 = 0
Trigger1 = EnemyNear,Vel Y = 0
Trigger1 = EnemyNear,MoveType != H && EnemyNear,StateType != L
Trigger1 = EnemyNear,Ctrl || (EnemyNear,StateNo < 200 && EnemyNear,StateNo = [31,59])
Trigger1 = var(11) := 80041
;剩余时间不多
Trigger2 = EnemyNear,MoveType = A
Trigger2 = EnemyNear,StateNo = [200,1999]
Trigger2 = EnemyNear,AnimTime = [-2, -1]
Trigger2 = var(11) := 80042
;抢招用，对方招式速度快，无可用招式可以抢招
Trigger3 = EnemyNear,MoveType = A
Trigger3 = EnemyNear,StateNo = [200,999]
trigger3 = enemynear,stateno = helper(33000),var(2)
trigger3 = helper(33000),var(3) - enemynear,time < 4
Trigger3 = var(11) := 80043
;抓落地
Trigger4 = EnemyNear,Vel Y = 0
Trigger4 = EnemyNear,MoveType != H && EnemyNear,StateType != L
Trigger4 = !EnemyNear,Ctrl
Trigger4 = EnemyNear,StateNo = 52
Trigger4 = var(11) := 80044
IgnoreHitPause = 1


[State -3,立a]
Type = changestate
TriggerAll = var(0)
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149])
TriggerAll = StateType != A 
TriggerAll = EnemyNear,MoveType != H
;不存在弹幕
Triggerall = !inguarddist
;triggerall = EnemyNear,NumProj = 0
;triggerall = !PlayerIdExist(helper(33333333),var(3))
;对空
Trigger1 = EnemyNear,StateType = A
trigger1 = P2BodyDist x = [-20, 45]
trigger1 = enemynear,pos Y + enemynear,vel Y*1 + fvar(15)*1*2*0.5 = [-55,-30]
trigger1 = var(11) := 23031
value = 230


[State -3,投]
Type = ChangeState
value = 800
TriggerAll = var(0)
TriggerAll = !IsHelper
triggerall = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149])
TriggerAll = StateType != A
TriggerAll = EnemyNear,MoveType != H && EnemyNear,StateType != A
TriggerAll = (abs(P2BodyDist X) <= 30)
TriggerAll = EnemyNear,StateNo != 52
TriggerAll = EnemyNear,StateNo != 5120
Trigger1 = fvar(14) > 0
Trigger1 = EnemyNear,MoveType = I
Trigger1 = var(11) := 80031
IgnoreHitPause = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;移动2
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[State -3,空闪]
Type = ChangeState
TriggerAll = var(0)
TriggerAll = !IsHelper
TriggerAll = StateType != A
TriggerAll = Ctrl
;
Trigger1 = EnemyNear,MoveType = H
Trigger1 = EnemyNear,StateNo = [5000,6000)
Trigger1 = P2BodyDist x > 120
Trigger1 = EnemyNear,StateType != A
Trigger1 = var(11) := 101121
;
Trigger2 = !inguarddist && EnemyNear,MoveType != A
trigger2 = BackEdgeBodyDist < 20
trigger2 = P2BodyDist x < 40
trigger2 = EnemyNear,StateType = L
trigger2 = var(11) := 101122
;
Trigger3 = !inguarddist && EnemyNear,MoveType != A
trigger3 = P2BodyDist x > 110
trigger3 = EnemyNear,MoveType = I
Trigger3 = EnemyNear,StateNo = [200,999]
Trigger3 = EnemyNear,AnimTime < -15 || P2BodyDist x > 200
trigger3 = var(11) := 101123
;
Trigger4 = !inguarddist && EnemyNear,MoveType != A
trigger4 = BackEdgeBodyDist < 20
trigger4 = P2BodyDist x = [0,55]
trigger4 = EnemyNear,MoveType = I
Trigger4 = EnemyNear,StateNo < 200
trigger4 = var(11) := 101124
value = 1011 

[State -3,后撤]
Type = changestate
triggerall = var(0)
triggerall = Ctrl || StateNo = 19
TriggerAll = !IsHelper
TriggerAll = StateType != A 
Triggerall = !inguarddist && EnemyNear,MoveType != A
Trigger1 = P2BodyDist x < 60
Trigger1 = BackEdgeBodyDist >= 60
Trigger1 = EnemyNear,StateNo = 5120
Trigger1 = EnemyNear,AnimTime > -8
value = 105

[State -3,空闪]
Type = changestate
triggerall = var(0)
triggerall = Ctrl || StateNo = 19
TriggerAll = !IsHelper
TriggerAll = StateType != A 
Triggerall = !inguarddist && EnemyNear,MoveType != A
Trigger1 = P2BodyDist x < 60
Trigger1 = BackEdgeBodyDist < 60
Trigger1 = EnemyNear,StateNo = 5120
Trigger1 = EnemyNear,AnimTime = [-10, -6]
value = 1011


[State -3,前进]
Type = ChangeState
TriggerAll = var(0)
TriggerAll = !IsHelper
TriggerAll = StateType != A
TriggerAll = Ctrl || (StateNo = 18 && Time > 18)
Triggerall = !inguarddist && EnemyNear,MoveType != A
TriggerAll = !enemy,numproj && !PlayerIdExist(Helper(33333333),var(3)) 
;对面受击中
Trigger1 = Fvar(14) <= 0
Trigger1 = EnemyNear,StateNo >= 5000 
Trigger1 = EnemyNear,MoveType = H && EnemyNear,StateType != L
Trigger1 = EnemyNear,GetHitvar(HitTime) >= 3
Trigger1 = P2BodyDist x = [50,90]
Trigger1 = var(11) := 1921
;随机前行
Trigger2 = EnemyNear,MoveType = I
Trigger2 = P2BodyDist X > 55
Trigger2 = Random <= 250
Trigger2 = var(11) := 1922
;随机前行
Trigger3 = EnemyNear,MoveType != H
Trigger3 = P2BodyDist X > 140
Trigger3 = Random <= 350
Trigger3 = var(11) := 1923
;离开版边
Trigger4 = EnemyNear,MoveType != H
Trigger4 = EnemyNear,StateType != A
Trigger4 = P2BodyDist x > 70
Trigger4 = BackEdgeBodyDist <= 20
Trigger4 = var(11) := 1924
;移动到合适的位置打敌人起身
Trigger5 = P2BodyDist x > 50
Trigger5 = EnemyNear,StateType = L
Trigger5 = var(11) := 1952
;
Trigger6 = EnemyNear,Pos Y < -120
Trigger6 = EnemyNear,Vel x < 0
Trigger6 = P2BodyDist x > 80
Trigger6 = EnemyNear,MoveType = H && EnemyNear,StateType = A
Trigger6 = var(11) := 1926
;
trigger7 = P2BodyDist x > 110
trigger7 = EnemyNear,MoveType = I
Trigger7 = EnemyNear,StateNo = [200,999]
Trigger7 = P2BodyDist x = [83, 200]
trigger7 = var(11) := 1927
;
trigger8 = P2BodyDist x > 65
trigger8 = EnemyNear,MoveType = H || EnemyNear,StateType = L
trigger8 = var(11) := 1928
value = 19
IgnoreHitPause = 1

[State -3,后退]
Type = ChangeState
TriggerAll = var(0)
TriggerAll = Ctrl || (StateNo = 19 && Time > 12)
TriggerAll = !IsHelper
TriggerAll = StateType != A
TriggerAll = Ctrl || StateNo = 1 || (StateNo = 19 && Time >= 12) || StateNo = [120,149]
TriggerAll = !(EnemyNear,MoveType = A || (EnemyNear,MoveType = I && EnemyNear,StateNo = [5000,5999]))
TriggerAll = BackEdgeBodyDist > 30
;移动到合适的位置打敌人起身
Trigger1 = !InGuardDist
Trigger1 = P2BodyDist x < 70
Trigger1 = EnemyNear,StateNo = 5120
Trigger1 = var(11) := 1821
;
Trigger2 = !InGuardDist
Trigger2 = EnemyNear,StateType != A
Trigger2 = !(EnemyNear,MoveType = H || (EnemyNear,StateNo = [120,159]))
Trigger2 = P2BodyDist X < 70
Trigger2 = var(11) := 1822
;
Trigger3 = !InGuardDist
Trigger3 = EnemyNear,Ctrl
Trigger3 = P2BodyDist x < 70
Trigger3 = var(11) := 1823
value = 18
IgnoreHitPause = 1

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;防御1
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;
[State -3, 地面精防]
type = varset
trigger1 = var(0)
trigger1 = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || StateNo = 0
v = 56
value = 16
IgnoreHitPause = 1

[State -3, 空中精防]
type = varset
trigger1 = var(0)
trigger1 = Ctrl || ((StateNo = 1011) && (time > 6)) || (StateNo = [18,19]) || (StateNo = [120,149]) || StateNo = 0
v = 57
value = 16
IgnoreHitPause = 1

[State -1, guard]
type = changestate
value = 120
triggerall = var(0) && roundstate = 2
triggerall = !enemynear, hitdefattr = SCA,AT
TriggerAll = Ctrl ||((StateNo = [18,19]) || (StateNo = [120,149]))
trigger1 = inguarddist
trigger1 = var(11) := 12001

Trigger2 = P2BodyDist X=[-50,50]
Trigger2 = NumHelper(33000)>0
Trigger2 = Helper(33000),InguardDist
Trigger2 = Facing*EnemyNear,Facing!=-1 || P2Dist X<0
trigger2 = var(11) := 12002
IgnoreHitPause = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;补充0
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[State -3,空闪]
Type = changestate
TriggerAll = var(0)
triggerall = (RoundState = 2)
TriggerAll = !IsHelper
TriggerAll = StateType != A 
;不存在弹幕
Triggerall = !inguarddist
;
trigger1 = StateNo = 0 && Time > 90
Trigger1 = Frontedgebodydist > 120
Trigger1 = P2BodyDist x = [0,55]
Trigger1 = Random = [200,300]
Trigger1 = var(11) := 101101
value = 1011

[State -3,空闪]
Type = changestate
TriggerAll = var(0)
triggerall = (RoundState = 2)
TriggerAll = !IsHelper
TriggerAll = StateType != A 
;不存在弹幕
Triggerall = !inguarddist
;
trigger1 = StateNo = 0 && Time > 25
Trigger1 = BackEdgeBodyDist > 70
Trigger1 = P2BodyDist x < 65
Trigger1 = Random < 100
Trigger1 = var(11) := 10501
value = 105
