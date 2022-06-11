[Statedef 33334]

[State -2]
Type = NotHitBy
Trigger1 = 1
Value = SCA
Time = 1
IgnoreHitPause = 1

[State -2]
type=selfstate
trigger1=!ishelper
value=0

[State -2]
Type = AssertSpecial
Trigger1 = IsHelper
flag = invisible

;==================================================================================
;布尔类型集合
;2**0 耗气闪避判别
;2**1 落地受身判别
;2**2 升龙切返失败记录
;2**3 弹幕打点极高
;2**4 敌方厨弹幕记录
;2**5 鹤摘当身失败记录
;2**6 投技不中
;2**7 弹幕不可抵消
;2**8 空中技被当身记录
;2**9 2B被插动
;2**10 打逆失败
;2**11 空蛇失败
;==================================================================================
;---------------------------------------------------------------------------------
[State -2, 耗气闪避判别Reset]
Type = varSet
Triggerall = var(3)&2**2
Trigger1 = EnemyNear,MoveType = H
Trigger2 = EnemyNear,StateType = A
Trigger3 = EnemyNear,MoveType = A
Trigger4 = EnemyNear,StateType = L
Trigger5 = EnemyNear,Ctrl 
var(3) = var(3)^(2**0)
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
var(3) = var(3)|2**0
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
[State -2, 落地受身判别Reset]
Type = varSet
Triggerall = var(3)&2**1
TriggerAll = EnemyNear,PrevStateNo != 5050
Trigger1 = EnemyNear,MoveType = A
Trigger2 = EnemyNear,StateType = L
Trigger3 = EnemyNear,Ctrl 
Trigger4 = InGuardDist
var(3) = var(3) ^ 2**1
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
var(3) = var(3) | 2**1
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
[State -2, 脚升龙切返失败记录]
Type = varSet
Triggerall = Root,StateNo = 1025
Triggerall = Root,MoveType = A 
Triggerall = Root,AnimElemTime(3) > 0
Triggerall = Root,var(50) = 102574
Triggerall = EnemyNear,StateType != A
Trigger1 = P2BodyDist x = [-10,85]
Trigger1 = EnemyNear,MoveType != H
Trigger2 = EnemyNear,MoveType = H
Trigger2 = EnemyNear,StateNo = [120,159]
var(3) = var(3) | 2**2



;---------------------------------------------------------------------------------
;AB条件
;普通AB P2BodyDist x<64可以闪避到敌人身后
;跑步AB P2BodyDist x<95可以闪避到敌人身后
;加速规则 跑步启动2F+4F移动时间+跑步AB移动距离137足够闪避到敌人身后

[State -3,前AB可行 Reset]
Type = varSet
Triggerall = var(3)&2**8
Trigger1 = EnemyNear,MoveType = H
Trigger2 = EnemyNear,Ctrl
Trigger3 = EnemyNear,MoveType = I
Trigger4 = EnemyNear,StateType = L
Trigger5 = EnemyNear,MoveType=A&&EnemyNear,Time>=10
var(3) = var(3)^(2**8)
IgnoreHitPause = 1

[State -3,前AB可行 Reset]
Type = varSet
Triggerall = EnemyNear,StateType!=A
Triggerall = EnemyNear,MoveType=A
Triggerall = EnemyNear,Time<=2
Triggerall = EnemyNear,AnimTime<-33
Triggerall = EnemyNear,StateNo=[1000,1999]
Triggerall = Root,P2BodyDist x < 160
;已经在跑步模式
Trigger1 = Root,StateNo=[98,102]
Trigger1 = Root,P2BodyDist x - ((10-EnemyNear,Time-2)*6) < 95
;不在跑步模式，但是启动1F
Trigger2 = Root,P2BodyDist x - ((10-EnemyNear,Time-3)*6) < 95
;直接AB
Trigger3 = Root,P2BodyDist x < 64
var(3) = var(3)|2**8
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
[State -2, 打逆失败]
Type = varset
triggerall = MoveType = H
triggerall = StateNo != [150,155]
triggerall = (P2BodyDist x<= 0) || (EnemyNear,BackEdgeBodyDist<5 && P2BodyDist x<=0)
TriggerAll = StateType = A
TriggerAll = EnemyNear,StateNo = [200,1999]
triggerAll = enemynear,moveType = A || enemynear,moveType = I
Trigger1 = PrevStateNo = [600,645]
Trigger2 = (var(50)/100) = [600,645]
var(3) = var(3)|2**10

;---------------------------------------------------------------------------------
[State 11990,长距离攻击角色]
type = VarSet
Triggerall = ishelper
Trigger1 = P2BodyDist x > 100
Trigger1 = EnemyNear,StateType != A
Trigger1 = EnemyNear,MoveType = A
Trigger1 = EnemyNear,MoveContact
Trigger1 = EnemyNear,StateNo = [200,1999]
var(15) = 1
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;var(4) 援助限制
;---------------------------------------------------------------------------------
[State -3]
type = varset
Trigger1 = roundstate < 2
var(4) = 0

[State -3]
type = varset
Trigger1 = NumHelper(6050) = 1
var(4) = 960

[State -3]
type = varadd
Trigger1 = var(4) > 0
var(4) = -1

;---------------------------------------------------------------------------------
;var(5) 立回限制
;---------------------------------------------------------------------------------
[State -3]
type = varset
Triggerall = IsHelper(33334)
Trigger1 = roundstate < 2
var(5) = 120

[State -3]
type = varset
Triggerall = IsHelper(33334)
Trigger1 = Root,var(50) = 40031
Trigger2 = Root,var(50) = 40032
Trigger3 = Root,var(50) = 20031
var(5) = 180

[State -3]
type = varadd
Triggerall = IsHelper(33334)
Triggerall = RoundState = 2
Trigger1 = var(5) > 0
var(5) = -1

;---------------------------------------------------------------------------------
;var(6) 跳跃限制
;---------------------------------------------------------------------------------
[State -3]
type = varset
Triggerall = IsHelper(33334)
Trigger1 = RoundState!=2
Trigger2 = RoundState=2&&Root,StateNo=0&&!Root,Ctrl
var(6) = 180

[State -3]
type = varset
Triggerall = IsHelper(33334)
Trigger1 = Root,var(50) = 390409
Trigger1 = Root,MoveType = H
var(6) = 300

[State -3]
type = Null
Triggerall = IsHelper(33334)
Triggerall = Root,RoundState = 2
Trigger1 = var(6) > 0
Trigger1 = var(6) := var(6)-1

;---------------------------------------------------------------------------------
;var(57),对应root,var(57),播放选择音用
;---------------------------------------------------------------------------------
Type = VarSet
var(57) = var(57)
triggerall = IsHelper(33334)
trigger1 = RoundState = 1

;---------------------------------------------------------------------------------
;计算敌方X方向速度
;---------------------------------------------------------------------------------
[State -2]
Type = varset
triggerall = IsHelper(33334)
Trigger1 = !Root,MoveContact &&  EnemyNear,MoveType != H
Trigger1 = fvar(11) != EnemyNear,Vel x
fvar(11) = EnemyNear,Vel x
ignorehitpause = 1

[State -2]
Type = varset
triggerall = IsHelper(33334)
Trigger1 = Root,facing = -1
Trigger1 = Root,MoveContact || EnemyNear,MoveType = H
Trigger1 = fvar(11) != EnemyNear,gethitvar(xVel)
fvar(11) = EnemyNear,gethitvar(xVel)
ignorehitpause = 1


[State -2]
Type = varset
triggerall = IsHelper(33334)
Trigger1 = Root,facing = 1
Trigger1 = Root,MoveContact || EnemyNear,MoveType = H
Trigger1 = fvar(11) != -(EnemyNear,gethitvar(xVel))
fvar(11) = -(EnemyNear,gethitvar(xVel))
ignorehitpause = 1

;---------------------------------------------------------------------------------
;计算敌方重力加速度
;---------------------------------------------------------------------------------
[State -3]
Type = varSet
triggerall = IsHelper(33334)
Trigger1 = !Root,MoveContact || EnemyNear,MoveType != H
Trigger1 = EnemyNear,StateType = A
fvar(12) = EnemyNear,const(movement.yaccel)
IgnoreHitPause = 1

[State -3]
Type = varSet
triggerall = IsHelper(33334)
Trigger1 = Root,MoveContact || EnemyNear,MoveType = H
Trigger1 = EnemyNear,StateType = A
fvar(12) = EnemyNear,gethitvar(yaccel)
IgnoreHitPause = 1

[State -3]
Type = varSet
triggerall = IsHelper(33334)
Trigger1 = Root,MoveContact || EnemyNear,MoveType = H
Trigger1 = EnemyNear,StateType != A
fvar(12) = 0
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;计算自己落地时间
;---------------------------------------------------------------------------------
[State -3, 落地时间];t=(-v0+√(v0^2-2a(x0-x)))/a
Type = varSet
triggerall = IsHelper(33334)
Trigger1= 1
fvar(13)= (-Root,vel y+(Root,vel y**2-2*root,const(movement.yaccel)*IfElse(root,pos y>0,0,root,pos y-0))**.5)/root,const(movement.yaccel)
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
;计算敌人落地时间
;---------------------------------------------------------------------------------
[State -3, ];t=(-v0+√(v0^2-2a(x0-x)))/a
Type = varSet
triggerall = IsHelper(33334)
Trigger1= 1
fvar(14)= (-EnemyNear,vel y+(EnemyNear,vel y**2-2*fvar(12)*IfElse(EnemyNear,pos y>0,0,EnemyNear,pos y-0))**.5)/fvar(12)
IgnoreHitPause = 1
;---------------------------------------------------------------------------------

;---------------------------------------------------------------------------------
;前版边绝对距离
;---------------------------------------------------------------------------------
[State -3, ]
Type = varSet
triggerall = IsHelper(33334)
Trigger1= 1
fvar(15)= ifelse(root,Facing = 1, Helper(33002),RootDist x, Helper(33001),RootDist x)
IgnoreHitPause = 1
;---------------------------------------------------------------------------------
;后版边绝对距离
;---------------------------------------------------------------------------------
[State -3, ]
Type = varSet
triggerall = IsHelper(33334)
Trigger1= 1
fvar(16)= ifelse(root,Facing = -1, Helper(33001),RootDist x, Helper(33002),RootDist x)
IgnoreHitPause = 1




[Statedef 33000]

[State 33000]
type=selfstate
trigger1=!ishelper
value=0

[State 33000]
Type = AssertSpecial
Trigger1 = IsHelper
flag = invisible

[State 33000]
type = nothitby
triggerall = IsHelper(33000)
trigger1 = 1
value = sca


;めくりガード対応ヘルパー
[State 4444]
Type = PosSet
Trigger1 = 1
X = Ceil(EnemyNear,Pos X)-10*Facing
Y = Ceil(EnemyNear,Pos Y)
IgnoreHitPause = 1
SuperMoveTime = 9999
PauseMoveTime = 9999

[State 4444]
Type = Turn
Trigger1 = Facing = EnemyNear,Facing
IgnoreHitPause = 1
SuperMoveTime = 9999
PauseMoveTime = 9999

[State -1, Border]
type = VarSet
triggerall = IsHelper(33000)
triggerall = var(12) != 1
trigger1 = root,Facing!=Helper(33001),Facing && helper(33001),rootdist x <= 160
trigger2 = root,Facing!=Helper(33002),Facing && helper(33002),rootdist x <= 160
var(12) = 1

[State -1, Border]
type = VarSet
triggerall = IsHelper(33000)
triggerall = var(12) != -1
trigger1 = root,Facing = Helper(33001),Facing && helper(33001),rootdist x <= 120
trigger2 = root,Facing = Helper(33002),Facing && helper(33002),rootdist x <= 120
var(12) = -1

[State -1, Border]
type = VarSet
triggerall = IsHelper(33000)
triggerall = var(12) != 0
trigger1 = helper(33001),rootdist x > 160
trigger1 = helper(33002),rootdist x > 160
trigger2 = var(12) = - 1
trigger2 = helper(33001),rootdist x > 120 && helper(33002),rootdist x > 120
var(12) = 0

[State -1, 直前行動]
type = VarSet
triggerall = IsHelper(33000)
trigger1 = root,movetype = H
trigger1 = root,prevstateno != [5000,5799]
trigger1 = root,prevstateno != [120,159]
var(13) = root,prevstateno

[State -1, 直前行動]
type = VarSet
triggerall = IsHelper(33000)
trigger1 = root,movetype = A 
var(14) = root,stateno

[State -1, Preview State]
type = VarSet
triggerall = IsHelper(33000)
trigger1 = var(14) != 0
trigger1 = enemynear,movetype != H || enemynear,stateno = [150,159]
var(14) = 0

[State 32000]
type = varset
triggerall = IsHelper(33000)
trigger1 = var(15) != 0
trigger1 = enemynear,movetype != H && root,movetype != A
var(15) = 0

[State 32000]
type = varset
triggerall = IsHelper(33000)
trigger1 = var(15) = 0
trigger1 = enemynear,movetype = H || root,hitdefattr = sca,at
var(15) = root,time


[State -3]
Type = VarSet
Trigger1 = enemynear,movetype = A
Trigger1 = enemynear,time <= 1
trigger2 = enemynear,movetype != A
V = 0
value = 0
IgnoreHitPause = 1

[State -2]
Type = VarSet
Trigger1 = enemynear,movetype = A
Trigger1 = enemynear,hitdefattr = sca,aa,ap,at
trigger1 = var(0) = 0
v = 0
value = enemynear,time
IgnoreHitPause = 1

[State 7777,shield]
Type = VarSet
triggerall = var(1) != 0
Trigger1 = EnemyNear,time < 1
trigger2 = enemynear,movetype != A
var(1)=0
IgnoreHitPause=1

[State 7777,shield]
Type = VarAdd
Trigger1 = EnemyNear,MoveType=A
Trigger1 = EnemyNear,HitDefAttr = SCA,AA,AP,AT
var(1)=1
IgnoreHitPause=1

[State -2]
Type = VarSet
;TriggerAll = Root,var(59) > 0
TriggerAll = Enemy,TeamMode = Single || Enemy,TeamMode = Turns
Trigger1 = enemynear,movetype != A
V = 2
Value = 0
IgnoreHitPause = 1

[State -2]
Type = VarSet
;TriggerAll = Root,var(59) > 0
TriggerAll = Enemy,TeamMode = Single || Enemy,TeamMode = Turns
Trigger1 = enemynear,movetype != A
V = 3
Value = 0
IgnoreHitPause = 1

[State 33000]
Type = Null
;TriggerAll = Root,var(59) > 0
TriggerAll = Enemy,TeamMode = Single || Enemy,TeamMode = Turns
TriggerAll = Var(2) != Enemynear,Stateno
Trigger1 = helper(33001),Var(0) = Enemynear,Stateno
trigger1 = var(3) := helper(33002),var(0)
Trigger2 = helper(33001),Var(1) = Enemynear,Stateno
trigger2 = var(3) := helper(33002),var(1)
Trigger3 = helper(33001),Var(2) = Enemynear,Stateno
trigger3 = var(3) := helper(33002),var(2)
Trigger4 = helper(33001),Var(3) = Enemynear,Stateno
trigger4 = var(3) := helper(33002),var(3)
Trigger5 = helper(33001),Var(4) = Enemynear,Stateno
trigger5 = var(3) := helper(33002),var(4)
Trigger6 = helper(33001),Var(5) = Enemynear,Stateno
trigger6 = var(3) := helper(33002),var(5)
Trigger7 = helper(33001),Var(6) = Enemynear,Stateno
trigger7 = var(3) := helper(33002),var(6)
Trigger8 = helper(33001),Var(7) = Enemynear,Stateno
trigger8 = var(3) := helper(33002),var(7)
Trigger9 = helper(33001),Var(8) = Enemynear,Stateno
trigger9 = var(3) := helper(33002),var(8)
Trigger10 = helper(33001),Var(9) = Enemynear,Stateno
trigger10 = var(3) := helper(33002),var(9)
Trigger11 = helper(33001),Var(10) = Enemynear,Stateno
trigger11 = var(3) := helper(33002),var(10)
Trigger12 = helper(33001),Var(11) = Enemynear,Stateno
trigger12 = var(3) := helper(33002),var(11)
Trigger13 = helper(33001),Var(12) = Enemynear,Stateno
trigger13 = var(3) := helper(33002),var(12)
Trigger14 = helper(33001),Var(13) = Enemynear,Stateno
trigger14 = var(3) := helper(33002),var(13)
Trigger15 = helper(33001),Var(14) = Enemynear,Stateno
trigger15 = var(3) := helper(33002),var(14)
Trigger16 = helper(33001),Var(15) = Enemynear,Stateno
trigger16 = var(3) := helper(33002),var(15)
Trigger17 = helper(33001),Var(16) = Enemynear,Stateno
trigger17 = var(3) := helper(33002),var(16)
Trigger18 = helper(33001),Var(17) = Enemynear,Stateno
trigger18 = var(3) := helper(33002),var(17)
Trigger19 = helper(33001),Var(18) = Enemynear,Stateno
trigger19 = var(3) := helper(33002),var(18)
Trigger20 = helper(33001),Var(19) = Enemynear,Stateno
trigger20 = var(3) := helper(33002),var(19)
Trigger21 = helper(33001),Var(20) = Enemynear,Stateno
trigger21 = var(3) := helper(33002),var(20)
Trigger22 = helper(33001),Var(21) = Enemynear,Stateno
trigger22 = var(3) := helper(33002),var(21)
Trigger23 = helper(33001),Var(22) = Enemynear,Stateno
trigger23 = var(3) := helper(33002),var(22)
Trigger24 = helper(33001),Var(21) = Enemynear,Stateno
trigger24 = var(3) := helper(33002),var(21)
Trigger25 = helper(33001),Var(24) = Enemynear,Stateno
trigger25 = var(3) := helper(33002),var(24)
Trigger26 = helper(33001),Var(25) = Enemynear,Stateno
trigger26 = var(3) := helper(33002),var(25)
Trigger27 = helper(33001),Var(26) = Enemynear,Stateno
trigger27 = var(3) := helper(33002),var(26)
Trigger28 = helper(33001),Var(27) = Enemynear,Stateno
trigger28 = var(3) := helper(33002),var(27)
Trigger29 = helper(33001),Var(28) = Enemynear,Stateno
trigger29 = var(3) := helper(33002),var(28)
Trigger30 = helper(33001),Var(29) = Enemynear,Stateno
trigger30 = var(3) := helper(33002),var(29)
Trigger31 = helper(33001),Var(30) = Enemynear,Stateno
trigger31 = var(3) := helper(33002),var(30)
Trigger32 = helper(33001),Var(31) = Enemynear,Stateno
trigger32 = var(3) := helper(33002),var(31)
Trigger33 = helper(33001),Var(32) = Enemynear,Stateno
trigger33 = var(3) := helper(33002),var(32)
Trigger34 = helper(33001),Var(33) = Enemynear,Stateno
trigger34 = var(3) := helper(33002),var(33)
Trigger35 = helper(33001),Var(34) = Enemynear,Stateno
trigger35 = var(3) := helper(33002),var(34)
Trigger36 = helper(33001),Var(35) = Enemynear,Stateno
trigger36 = var(3) := helper(33002),var(35)
Trigger37 = helper(33001),Var(36) = Enemynear,Stateno
trigger37 = var(3) := helper(33002),var(36)
Trigger38 = helper(33001),Var(37) = Enemynear,Stateno
trigger38 = var(3) := helper(33002),var(37)
Trigger39 = helper(33001),Var(38) = Enemynear,Stateno
trigger39 = var(3) := helper(33002),var(38)
Trigger40 = helper(33001),Var(39) = Enemynear,Stateno
trigger40 = var(3) := helper(33002),var(39)
Trigger41 = helper(33001),Var(40) = Enemynear,Stateno
trigger41 = var(3) := helper(33002),var(40)
Trigger42 = helper(33001),Var(41) = Enemynear,Stateno
trigger42 = var(3) := helper(33002),var(41)
Trigger43 = helper(33001),Var(42) = Enemynear,Stateno
trigger43 = var(3) := helper(33002),var(42)
Trigger44 = helper(33001),Var(43) = Enemynear,Stateno
trigger44 = var(3) := helper(33002),var(43)
Trigger45 = helper(33001),Var(44) = Enemynear,Stateno
trigger45 = var(3) := helper(33002),var(44)
Trigger46 = helper(33001),Var(45) = Enemynear,Stateno
trigger46 = var(3) := helper(33002),var(45)
Trigger47 = helper(33001),Var(46) = Enemynear,Stateno
trigger47 = var(3) := helper(33002),var(46)
Trigger48 = helper(33001),Var(47) = Enemynear,Stateno
trigger48 = var(3) := helper(33002),var(47)
Trigger49 = helper(33001),Var(48) = Enemynear,Stateno
trigger49 = var(3) := helper(33002),var(48)
Trigger50 = helper(33001),Var(49) = Enemynear,Stateno
trigger50 = var(3) := helper(33002),var(49)
Trigger51 = helper(33001),Var(50) = Enemynear,Stateno
trigger51 = var(3) := helper(33002),var(50)
Trigger52 = helper(33001),Var(51) = Enemynear,Stateno
trigger52 = var(3) := helper(33002),var(51)
Trigger53 = helper(33001),Var(52) = Enemynear,Stateno
trigger53 = var(3) := helper(33002),var(52)
Trigger54 = helper(33001),Var(53) = Enemynear,Stateno
trigger54 = var(3) := helper(33002),var(53)
Trigger55 = helper(33001),Var(54) = Enemynear,Stateno
trigger55 = var(3) := helper(33002),var(54)
Trigger56 = helper(33001),Var(55) = Enemynear,Stateno
trigger56 = var(3) := helper(33002),var(55)
Trigger57 = helper(33001),Var(56) = Enemynear,Stateno
trigger57 = var(3) := helper(33002),var(56)
Trigger58 = helper(33001),Var(57) = Enemynear,Stateno
trigger58 = var(3) := helper(33002),var(57)
Trigger59 = helper(33001),Var(58) = Enemynear,Stateno
trigger59 = var(3) := helper(33002),var(58)
Trigger60 = helper(33001),Var(59) = Enemynear,Stateno
trigger60 = var(3) := helper(33002),var(59)
IgnoreHitPause = 1

[State -2]
Type = Null
;TriggerAll = Root,var(59) > 0
TriggerAll = Enemy,TeamMode = Single || Enemy,TeamMode = Turns
TriggerAll = Var(2) != Enemynear,Stateno
Trigger1 = helper(33001),Var(0) = Enemynear,Stateno
trigger1 = var(2) := helper(33001),var(0)
Trigger2 = helper(33001),Var(1) = Enemynear,Stateno
trigger2 = var(2) := helper(33001),var(1)
Trigger3 = helper(33001),Var(2) = Enemynear,Stateno
trigger3 = var(2) := helper(33001),var(2)
Trigger4 = helper(33001),Var(3) = Enemynear,Stateno
trigger4 = var(2) := helper(33001),var(3)
Trigger5 = helper(33001),Var(4) = Enemynear,Stateno
trigger5 = var(2) := helper(33001),var(4)
Trigger6 = helper(33001),Var(5) = Enemynear,Stateno
trigger6 = var(2) := helper(33001),var(5)
Trigger7 = helper(33001),Var(6) = Enemynear,Stateno
trigger7 = var(2) := helper(33001),var(6)
Trigger8 = helper(33001),Var(7) = Enemynear,Stateno
trigger8 = var(2) := helper(33001),var(7)
Trigger9 = helper(33001),Var(8) = Enemynear,Stateno
trigger9 = var(2) := helper(33001),var(8)
Trigger10 = helper(33001),Var(9) = Enemynear,Stateno
trigger10 = var(2) := helper(33001),var(9)
Trigger11 = helper(33001),Var(10) = Enemynear,Stateno
trigger11 = var(2) := helper(33001),var(10)
Trigger12 = helper(33001),Var(11) = Enemynear,Stateno
trigger12 = var(2) := helper(33001),var(11)
Trigger13 = helper(33001),Var(12) = Enemynear,Stateno
trigger13 = var(2) := helper(33001),var(12)
Trigger14 = helper(33001),Var(13) = Enemynear,Stateno
trigger14 = var(2) := helper(33001),var(13)
Trigger15 = helper(33001),Var(14) = Enemynear,Stateno
trigger15 = var(2) := helper(33001),var(14)
Trigger16 = helper(33001),Var(15) = Enemynear,Stateno
trigger16 = var(2) := helper(33001),var(15)
Trigger17 = helper(33001),Var(16) = Enemynear,Stateno
trigger17 = var(2) := helper(33001),var(16)
Trigger18 = helper(33001),Var(17) = Enemynear,Stateno
trigger18 = var(2) := helper(33001),var(17)
Trigger19 = helper(33001),Var(18) = Enemynear,Stateno
trigger19 = var(2) := helper(33001),var(18)
Trigger20 = helper(33001),Var(19) = Enemynear,Stateno
trigger20 = var(2) := helper(33001),var(19)
Trigger21 = helper(33001),Var(20) = Enemynear,Stateno
trigger21 = var(2) := helper(33001),var(20)
Trigger22 = helper(33001),Var(21) = Enemynear,Stateno
trigger22 = var(2) := helper(33001),var(21)
Trigger23 = helper(33001),Var(22) = Enemynear,Stateno
trigger23 = var(2) := helper(33001),var(22)
Trigger24 = helper(33001),Var(21) = Enemynear,Stateno
trigger24 = var(2) := helper(33001),var(21)
Trigger25 = helper(33001),Var(24) = Enemynear,Stateno
trigger25 = var(2) := helper(33001),var(24)
Trigger26 = helper(33001),Var(25) = Enemynear,Stateno
trigger26 = var(2) := helper(33001),var(25)
Trigger27 = helper(33001),Var(26) = Enemynear,Stateno
trigger27 = var(2) := helper(33001),var(26)
Trigger28 = helper(33001),Var(27) = Enemynear,Stateno
trigger28 = var(2) := helper(33001),var(27)
Trigger29 = helper(33001),Var(28) = Enemynear,Stateno
trigger29 = var(2) := helper(33001),var(28)
Trigger30 = helper(33001),Var(29) = Enemynear,Stateno
trigger30 = var(2) := helper(33001),var(29)
Trigger31 = helper(33001),Var(30) = Enemynear,Stateno
trigger31 = var(2) := helper(33001),var(30)
Trigger32 = helper(33001),Var(31) = Enemynear,Stateno
trigger32 = var(2) := helper(33001),var(31)
Trigger33 = helper(33001),Var(32) = Enemynear,Stateno
trigger33 = var(2) := helper(33001),var(32)
Trigger34 = helper(33001),Var(33) = Enemynear,Stateno
trigger34 = var(2) := helper(33001),var(33)
Trigger35 = helper(33001),Var(34) = Enemynear,Stateno
trigger35 = var(2) := helper(33001),var(34)
Trigger36 = helper(33001),Var(35) = Enemynear,Stateno
trigger36 = var(2) := helper(33001),var(35)
Trigger37 = helper(33001),Var(36) = Enemynear,Stateno
trigger37 = var(2) := helper(33001),var(36)
Trigger38 = helper(33001),Var(37) = Enemynear,Stateno
trigger38 = var(2) := helper(33001),var(37)
Trigger39 = helper(33001),Var(38) = Enemynear,Stateno
trigger39 = var(2) := helper(33001),var(38)
Trigger40 = helper(33001),Var(39) = Enemynear,Stateno
trigger40 = var(2) := helper(33001),var(39)
Trigger41 = helper(33001),Var(40) = Enemynear,Stateno
trigger41 = var(2) := helper(33001),var(40)
Trigger42 = helper(33001),Var(41) = Enemynear,Stateno
trigger42 = var(2) := helper(33001),var(41)
Trigger43 = helper(33001),Var(42) = Enemynear,Stateno
trigger43 = var(2) := helper(33001),var(42)
Trigger44 = helper(33001),Var(43) = Enemynear,Stateno
trigger44 = var(2) := helper(33001),var(43)
Trigger45 = helper(33001),Var(44) = Enemynear,Stateno
trigger45 = var(2) := helper(33001),var(44)
Trigger46 = helper(33001),Var(45) = Enemynear,Stateno
trigger46 = var(2) := helper(33001),var(45)
Trigger47 = helper(33001),Var(46) = Enemynear,Stateno
trigger47 = var(2) := helper(33001),var(46)
Trigger48 = helper(33001),Var(47) = Enemynear,Stateno
trigger48 = var(2) := helper(33001),var(47)
Trigger49 = helper(33001),Var(48) = Enemynear,Stateno
trigger49 = var(2) := helper(33001),var(48)
Trigger50 = helper(33001),Var(49) = Enemynear,Stateno
trigger50 = var(2) := helper(33001),var(49)
Trigger51 = helper(33001),Var(50) = Enemynear,Stateno
trigger51 = var(2) := helper(33001),var(50)
Trigger52 = helper(33001),Var(51) = Enemynear,Stateno
trigger52 = var(2) := helper(33001),var(51)
Trigger53 = helper(33001),Var(52) = Enemynear,Stateno
trigger53 = var(2) := helper(33001),var(52)
Trigger54 = helper(33001),Var(53) = Enemynear,Stateno
trigger54 = var(2) := helper(33001),var(53)
Trigger55 = helper(33001),Var(54) = Enemynear,Stateno
trigger55 = var(2) := helper(33001),var(54)
Trigger56 = helper(33001),Var(55) = Enemynear,Stateno
trigger56 = var(2) := helper(33001),var(55)
Trigger57 = helper(33001),Var(56) = Enemynear,Stateno
trigger57 = var(2) := helper(33001),var(56)
Trigger58 = helper(33001),Var(57) = Enemynear,Stateno
trigger58 = var(2) := helper(33001),var(57)
Trigger59 = helper(33001),Var(58) = Enemynear,Stateno
trigger59 = var(2) := helper(33001),var(58)
Trigger60 = helper(33001),Var(59) = Enemynear,Stateno
trigger60 = var(2) := helper(33001),var(59)
IgnoreHitPause = 1

[State -2]
Type = VarAdd
;TriggerAll = Root,var(59) > 0
TriggerAll = Enemy,TeamMode = Single || Enemy,TeamMode = Turns
Trigger1 = var(5) > 0 && var(0) != 0
v = 6
value = 1
IgnoreHitPause = 1

[State -2]
Type = VarSet
;TriggerAll = Root,var(59) > 0
Trigger1 = Var(5) > 0 && var(0) != 0
V = 5
Value = 0
IgnoreHitPause = 1

[State -2]
Type = VarSet
;TriggerAll = Root,var(59) > 0
TriggerAll = Enemy,TeamMode = Single || Enemy,TeamMode = Turns
TriggerAll = enemynear,movetype = A
TriggerAll = Var(2) != enemynear,stateno
Trigger1 = var(0) != 0
V = 2
Value = enemynear,stateno
IgnoreHitPause = 1

[State -2]
Type = VarSet
;TriggerAll = Root,var(59) > 0
TriggerAll = Enemy,TeamMode = Single || Enemy,TeamMode = Turns
TriggerAll = enemynear,movetype = A
TriggerAll = Var(2) = enemynear,stateno
Trigger1 = var(0) != 0
V = 3
Value = var(0)
IgnoreHitPause = 1

[State -2]
Type = VarSet
;TriggerAll = Root,var(59) > 0
TriggerAll = Enemy,TeamMode = Single || Enemy,TeamMode = Turns
TriggerAll = enemynear,movetype = A && var(0) != 0
TriggerAll = Var(6) <= 59
TriggerAll = helper(33001),var(0) != var(2)
TriggerAll = helper(33001),var(1) != var(2)
TriggerAll = helper(33001),var(2) != var(2)
TriggerAll = helper(33001),var(3) != var(2)
TriggerAll = helper(33001),var(4) != var(2)
TriggerAll = helper(33001),var(5) != var(2)
TriggerAll = helper(33001),var(6) != var(2)
TriggerAll = helper(33001),var(7) != var(2)
TriggerAll = helper(33001),var(8) != var(2)
TriggerAll = helper(33001),var(9) != var(2)
TriggerAll = helper(33001),var(10) != var(2)
TriggerAll = helper(33001),var(11) != var(2)
TriggerAll = helper(33001),var(12) != var(2)
TriggerAll = helper(33001),var(13) != var(2)
TriggerAll = helper(33001),var(14) != var(2)
TriggerAll = helper(33001),var(15) != var(2)
TriggerAll = helper(33001),var(16) != var(2)
TriggerAll = helper(33001),var(17) != var(2)
TriggerAll = helper(33001),var(18) != var(2)
TriggerAll = helper(33001),var(19) != var(2)
TriggerAll = helper(33001),var(20) != var(2)
TriggerAll = helper(33001),var(21) != var(2)
TriggerAll = helper(33001),var(22) != var(2)
TriggerAll = helper(33001),var(23) != var(2)
TriggerAll = helper(33001),var(24) != var(2)
TriggerAll = helper(33001),var(25) != var(2)
TriggerAll = helper(33001),var(26) != var(2)
TriggerAll = helper(33001),var(27) != var(2)
TriggerAll = helper(33001),var(28) != var(2)
TriggerAll = helper(33001),var(29) != var(2)
TriggerAll = helper(33001),var(30) != var(2)
TriggerAll = helper(33001),var(31) != var(2)
TriggerAll = helper(33001),var(32) != var(2)
TriggerAll = helper(33001),var(33) != var(2)
TriggerAll = helper(33001),var(34) != var(2)
TriggerAll = helper(33001),var(35) != var(2)
TriggerAll = helper(33001),var(36) != var(2)
TriggerAll = helper(33001),var(37) != var(2)
TriggerAll = helper(33001),var(38) != var(2)
TriggerAll = helper(33001),var(39) != var(2)
TriggerAll = helper(33001),var(40) != var(2)
TriggerAll = helper(33001),var(41) != var(2)
TriggerAll = helper(33001),var(42) != var(2)
TriggerAll = helper(33001),var(43) != var(2)
TriggerAll = helper(33001),var(44) != var(2)
TriggerAll = helper(33001),var(45) != var(2)
TriggerAll = helper(33001),var(46) != var(2)
TriggerAll = helper(33001),var(47) != var(2)
TriggerAll = helper(33001),var(48) != var(2)
TriggerAll = helper(33001),var(49) != var(2)
TriggerAll = helper(33001),var(50) != var(2)
TriggerAll = helper(33001),var(51) != var(2)
TriggerAll = helper(33001),var(52) != var(2)
TriggerAll = helper(33001),var(53) != var(2)
TriggerAll = helper(33001),var(54) != var(2)
TriggerAll = helper(33001),var(55) != var(2)
TriggerAll = helper(33001),var(56) != var(2)
TriggerAll = helper(33001),var(57) != var(2)
TriggerAll = helper(33001),var(58) != var(2)
TriggerAll = helper(33001),var(59) != var(2)
TriggerAll = var(5) = 0
Triggerall = Enemynear,Prevstateno != Enemynear,Stateno
trigger1 = enemynear,hitdefattr = sca,na,sa,np,sp,nt,st
var(5) = 1
IgnoreHitPause = 1


[State 60000,相手投げ記憶]
type = VarSet
trigger1 = !var(10)
trigger1 = Enemy,TeamMode = Single || Enemy,TeamMode = Turns || Enemy,TeamMode = Simul && (Enemy(0),Alive && !Enemy(NumEnemy=2),Alive || !Enemy(0),Alive && Enemy(NumEnemy=2),Alive)
trigger1 = EnemyNear,MoveType = A
trigger1 = EnemyNear,HitDefAttr = SCA,NT,ST,HT,AT
;trigger1 = EnemyNear,Time > 0
var(10) = EnemyNear,StateNo
ignorehitpause = 1

[State 60000,相手投げ記憶OFF]
type = VarSet
trigger1 = var(10)
trigger1 = EnemyNear,StateNo != var(10)
trigger1 = EnemyNear,MoveType != A
trigger1 = Root,StateType = L || EnemyNear,Ctrl
var(10) = 0
ignorehitpause = 1

[State 60000,Reset]
type = VarSet
triggerall = var(11) != 0
trigger1 = enemynear,stateno != var(21)
trigger1 = enemynear,stateno != var(22)
trigger1 = enemynear,stateno != var(23)
trigger1 = enemynear,stateno != var(24)
trigger1 = enemynear,stateno != var(25)
trigger1 = enemynear,stateno != var(26)
trigger1 = enemynear,stateno != var(27)
trigger1 = enemynear,stateno != var(28)
trigger1 = enemynear,stateno != var(29)
trigger1 = enemynear,stateno != var(30)
trigger1 = enemynear,stateno != var(31)
trigger1 = enemynear,stateno != var(32)
trigger1 = enemynear,stateno != var(33)
trigger1 = enemynear,stateno != var(35)
var(11) = 0
ignorehitpause = 1

[State 60000,下段]
type = VarSet
triggerall = var(11) != 1
trigger1 = var(21) > 0
trigger1 = enemynear,stateno = var(21)
trigger2 = var(22) > 0
trigger2 = enemynear,stateno = var(22)
trigger3 = var(23) > 0
trigger3 = enemynear,stateno = var(23)
var(11) = 1
ignorehitpause = 1

[State 60000,中段]
type = VarSet
triggerall = var(11) != 2
trigger1 = var(24) > 0
trigger1 = enemynear,stateno = var(24)
trigger2 = var(25) > 0
trigger2 = enemynear,stateno = var(25)
trigger3 = var(26) > 0
trigger3 = enemynear,stateno = var(26)
var(11) = 2
ignorehitpause = 1

[State 60000,投]
type = VarSet
triggerall = var(11) != 3
trigger1 = var(27) > 0
trigger1 = enemynear,stateno = var(27)
trigger2 = var(28) > 0
trigger2 = enemynear,stateno = var(28)
trigger3 = var(29) > 0
trigger3 = enemynear,stateno = var(29)
var(11) = 3
ignorehitpause = 1

[State 60000,空防不能]
type = VarSet
triggerall = var(11) != 4
trigger1 = var(30) > 0
trigger1 = enemynear,stateno = var(27)
trigger2 = var(31) > 0
trigger2 = enemynear,stateno = var(28)
trigger3 = var(32) > 0
trigger3 = enemynear,stateno = var(29)
var(11) = 4
ignorehitpause = 1

[State 60000,防御不能]
type = VarSet
triggerall = var(11) != 5
trigger1 = var(33) > 0
trigger1 = enemynear,stateno = var(33)
trigger2 = var(35) > 0
trigger2 = enemynear,stateno = var(35)
var(11) = 5
ignorehitpause = 1

[State 60000,立ちガード時学習用]
type = VarSet
trigger1 = Root,StateNo = [120,159]
trigger1 = Root,StateType = S
var(20) = 1
ignorehitpause = 1

[State 60000,下段ガード時学習用]
type = VarSet
trigger1 = Root,StateNo = [120,159]
trigger1 = Root,StateType = C
var(20) = 2
ignorehitpause = 1

[State 60000,空中ガード時学習用]
type = VarSet
trigger1 = Root,StateNo = [120,159]
trigger1 = Root,StateType = A
var(20) = 3
ignorehitpause = 1

[State 60000,リセット]
type = VarSet
triggerall = var(20)
triggerall = Root,StateNo != [120,155]
triggerall = Root,MoveType != H
trigger1 = Root,Ctrl || Root,StateNo < 200
trigger1 = (Root,StateNo != [35,52]) && (Root,StateNo != [100,119])
trigger2 = Root,MoveType = A || Root,StateNo = 7000
var(20) = 0
ignorehitpause = 1

[State 60000,下段学習]
type = VarSet
trigger1 = var(20) = 1
trigger1 = Enemy,TeamMode = Single || Enemy,TeamMode = Turns || Enemy,TeamMode = Simul && (Enemy(0),Alive && !Enemy(NumEnemy=2),Alive || !Enemy(0),Alive && Enemy(NumEnemy=2),Alive)
trigger1 = !var(21)
trigger1 = !var(33)||var(33)&&var(33)!=EnemyNear,StateNo
trigger1 = !var(35)||var(35)&&var(35)!=EnemyNear,StateNo
trigger1 = !var(10)
trigger1 = Root,MoveType = H
trigger1 = Root,StateNo >= 200
trigger1 = EnemyNear,MoveType = A
trigger1 = EnemyNear,HitDefAttr = SCA,AA || !(EnemyNear,HitDefAttr = SCA,AT)
trigger1 = !var(37)&&var(37):=var(37)+1
var(21) = EnemyNear,StateNo
ignorehitpause = 1

[State 60000,下段学習2]
type = VarSet
trigger1 = var(20) = 1
trigger1 = Enemy,TeamMode = Single || Enemy,TeamMode = Turns || Enemy,TeamMode = Simul && (Enemy(0),Alive && !Enemy(NumEnemy=2),Alive || !Enemy(0),Alive && Enemy(NumEnemy=2),Alive)
trigger1 = !var(22)
trigger1 = var(21)
trigger1 = var(21) != EnemyNear,StateNo
trigger1 = !var(33)||var(33)&&var(33)!=EnemyNear,StateNo
trigger1 = !var(35)||var(35)&&var(35)!=EnemyNear,StateNo
trigger1 = !var(10)
trigger1 = Root,MoveType = H
trigger1 = Root,StateNo >= 200
trigger1 = EnemyNear,MoveType = A
trigger1 = EnemyNear,HitDefAttr = SCA,AA || !(EnemyNear,HitDefAttr = SCA,AT)
trigger1 = !var(37)&&var(37):=var(37)+1
var(22) = EnemyNear,StateNo
ignorehitpause = 1

[State 60000,下段学習3]
type = VarSet
trigger1 = var(20) = 1
trigger1 = Enemy,TeamMode = Single || Enemy,TeamMode = Turns || Enemy,TeamMode = Simul && (Enemy(0),Alive && !Enemy(NumEnemy=2),Alive || !Enemy(0),Alive && Enemy(NumEnemy=2),Alive)
trigger1 = !var(23)
trigger1 = var(22)
trigger1 = var(22) != EnemyNear,StateNo && var(21) != EnemyNear,StateNo
trigger1 = !var(33)||var(33)&&var(33)!=EnemyNear,StateNo
trigger1 = !var(35)||var(35)&&var(35)!=EnemyNear,StateNo
trigger1 = !var(10)
trigger1 = Root,MoveType = H
trigger1 = Root,StateNo >= 200
trigger1 = EnemyNear,MoveType = A
trigger1 = EnemyNear,HitDefAttr = SCA,AA || !(EnemyNear,HitDefAttr = SCA,AT)
trigger1 = !var(37)&&var(37):=var(37)+1
var(23) = EnemyNear,StateNo
ignorehitpause = 1

[State 60000,中段学習]
type = VarSet
trigger1 = var(20) = 2
trigger1 = Enemy,TeamMode = Single || Enemy,TeamMode = Turns || Enemy,TeamMode = Simul && (Enemy(0),Alive && !Enemy(NumEnemy=2),Alive || !Enemy(0),Alive && Enemy(NumEnemy=2),Alive)
trigger1 = !var(24)
trigger1 = !var(33)||var(33)&&var(33)!=EnemyNear,StateNo
trigger1 = !var(35)||var(35)&&var(35)!=EnemyNear,StateNo
trigger1 = !var(10)
trigger1 = Root,MoveType = H
trigger1 = Root,StateNo >= 200
trigger1 = EnemyNear,MoveType = A
trigger1 = EnemyNear,HitDefAttr = SCA,AA || !(EnemyNear,HitDefAttr = SCA,AT)
trigger1 = !var(37)&&var(37):=var(37)+1
var(24) = EnemyNear,StateNo
ignorehitpause = 1

[State 60000,中段学習2]
type = VarSet
trigger1 = var(20) = 2
trigger1 = Enemy,TeamMode = Single || Enemy,TeamMode = Turns || Enemy,TeamMode = Simul && (Enemy(0),Alive && !Enemy(NumEnemy=2),Alive || !Enemy(0),Alive && Enemy(NumEnemy=2),Alive)
trigger1 = !var(25)
trigger1 = var(24)
trigger1 = var(24) != EnemyNear,StateNo
trigger1 = !var(33)||var(33)&&var(33)!=EnemyNear,StateNo
trigger1 = !var(35)||var(35)&&var(35)!=EnemyNear,StateNo
trigger1 = !var(10)
trigger1 = Root,MoveType = H
trigger1 = Root,StateNo >= 200
trigger1 = EnemyNear,MoveType = A
trigger1 = EnemyNear,HitDefAttr = SCA,AA || !(EnemyNear,HitDefAttr = SCA,AT)
trigger1 = !var(37)&&var(37):=var(37)+1
var(25) = EnemyNear,StateNo
ignorehitpause = 1

[State 60000,中段学習3]
type = VarSet
trigger1 = var(20) = 2
trigger1 = Enemy,TeamMode = Single || Enemy,TeamMode = Turns || Enemy,TeamMode = Simul && (Enemy(0),Alive && !Enemy(NumEnemy=2),Alive || !Enemy(0),Alive && Enemy(NumEnemy=2),Alive)
trigger1 = !var(26)
trigger1 = var(25)
trigger1 = var(25) != EnemyNear,StateNo && var(24) != EnemyNear,StateNo
trigger1 = !var(33)||var(33)&&var(33)!=EnemyNear,StateNo
trigger1 = !var(35)||var(35)&&var(35)!=EnemyNear,StateNo
trigger1 = !var(10)
trigger1 = Root,MoveType = H
trigger1 = Root,StateNo >= 200
trigger1 = EnemyNear,MoveType = A
trigger1 = EnemyNear,HitDefAttr = SCA,AA || !(EnemyNear,HitDefAttr = SCA,AT)
trigger1 = !var(37)&&var(37):=var(37)+1
var(26) = EnemyNear,StateNo
ignorehitpause = 1

[State 60000,投げ学習]
type = VarSet
trigger1 = var(20)
trigger1 = Enemy,TeamMode = Single || Enemy,TeamMode = Turns || Enemy,TeamMode = Simul && (Enemy(0),Alive && !Enemy(NumEnemy=2),Alive || !Enemy(0),Alive && Enemy(NumEnemy=2),Alive)
trigger1 = !var(27)
trigger1 = var(10)
trigger1 = Root,MoveType = H
trigger1 = Root,StateNo >= 200
var(27) = var(10)
ignorehitpause = 1

[State 60000,投げ学習2]
type = VarSet
trigger1 = var(20)
trigger1 = Enemy,TeamMode = Single || Enemy,TeamMode = Turns || Enemy,TeamMode = Simul && (Enemy(0),Alive && !Enemy(NumEnemy=2),Alive || !Enemy(0),Alive && Enemy(NumEnemy=2),Alive)
trigger1 = !var(28)
trigger1 = var(10)
trigger1 = var(27)
trigger1 = var(27) != var(10)
trigger1 = Root,MoveType = H
trigger1 = Root,StateNo >= 200
var(28) = var(10)
ignorehitpause = 1

[State 60000,投げ学習3]
type = VarSet
trigger1 = var(20)
trigger1 = Enemy,TeamMode = Single || Enemy,TeamMode = Turns || Enemy,TeamMode = Simul && (Enemy(0),Alive && !Enemy(NumEnemy=2),Alive || !Enemy(0),Alive && Enemy(NumEnemy=2),Alive)
trigger1 = !var(29)
trigger1 = var(10)
trigger1 = var(28)
trigger1 = var(28) != var(10) && var(27) != var(10)
trigger1 = Root,MoveType = H
trigger1 = Root,StateNo >= 200
var(29) = var(10)
ignorehitpause = 1

[State 60000,空中学習]
type = VarSet
trigger1 = var(20) = 3
trigger1 = Enemy,TeamMode = Single || Enemy,TeamMode = Turns || Enemy,TeamMode = Simul && (Enemy(0),Alive && !Enemy(NumEnemy=2),Alive || !Enemy(0),Alive && Enemy(NumEnemy=2),Alive)
trigger1 = !var(30)
trigger1 = !var(10)
trigger1 = Root,MoveType = H
trigger1 = Root,StateNo >= 200
trigger1 = EnemyNear,MoveType = A
trigger1 = EnemyNear,HitDefAttr = SCA,AA || !(EnemyNear,HitDefAttr = SCA,AT)
trigger1 = !var(37)&&var(37):=var(37)+1
var(30) = EnemyNear,StateNo
ignorehitpause = 1

[State 60000,空中学習2]
type = VarSet
trigger1 = var(20) = 3
trigger1 = Enemy,TeamMode = Single || Enemy,TeamMode = Turns || Enemy,TeamMode = Simul && (Enemy(0),Alive && !Enemy(NumEnemy=2),Alive || !Enemy(0),Alive && Enemy(NumEnemy=2),Alive)
trigger1 = !var(31)
trigger1 = var(30)
trigger1 = var(30) != EnemyNear,StateNo
trigger1 = !var(10)
trigger1 = Root,MoveType = H
trigger1 = Root,StateNo >= 200
trigger1 = EnemyNear,MoveType = A
trigger1 = EnemyNear,HitDefAttr = SCA,AA || !(EnemyNear,HitDefAttr = SCA,AT)
trigger1 = !var(37)&&var(37):=var(37)+1
var(31) = EnemyNear,StateNo
ignorehitpause = 1

[State 60000,空中学習3]
type = VarSet
trigger1 = var(20) = 3
trigger1 = Enemy,TeamMode = Single || Enemy,TeamMode = Turns || Enemy,TeamMode = Simul && (Enemy(0),Alive && !Enemy(NumEnemy=2),Alive || !Enemy(0),Alive && Enemy(NumEnemy=2),Alive)
trigger1 = !var(32)
trigger1 = var(31)
trigger1 = var(31) != EnemyNear,StateNo && var(30) != EnemyNear,StateNo
trigger1 = !var(10)
trigger1 = Root,MoveType = H
trigger1 = Root,StateNo >= 200
trigger1 = EnemyNear,MoveType = A
trigger1 = EnemyNear,HitDefAttr = SCA,AA || !(EnemyNear,HitDefAttr = SCA,AT)
trigger1 = !var(37)&&var(37):=var(37)+1
var(32) = EnemyNear,StateNo
ignorehitpause = 1

[State 60000,ガード不能学習]
type = VarSet
triggerall = !var(33)
trigger1 = var(21)>0
trigger1 = var(21) = var(24) || var(21) = var(25) || var(21) = var(26)
var(33) = var(21)
ignorehitpause = 1

[State 60000,ガード不能学習]
type = VarSet
triggerall = !var(33)
trigger1 = var(22)>0
trigger1 = var(22) = var(24) || var(22) = var(25) || var(22) = var(26)
var(33) = var(22)
ignorehitpause = 1

[State 60000,ガード不能学習]
type = VarSet
triggerall = !var(33)
trigger1 = var(23)>0
trigger1 = var(23) = var(24) || var(23) = var(25) || var(23) = var(26)
var(33) = var(23)
ignorehitpause = 1

[State 60000,ガード不能学習]
type = VarSet
triggerall = var(21)
trigger1 = var(33) = var(21)
var(21) = 0
ignorehitpause = 1

[State 60000,ガード不能学習]
type = VarSet
triggerall = var(21)
trigger1 = var(33) = var(22)
var(22) = 0
ignorehitpause = 1

[State 60000,ガード不能学習]
type = VarSet
triggerall = var(21)
trigger1 = var(33) = var(23)
var(23) = 0
ignorehitpause = 1

[State 60000,ガード不能学習]
type = VarSet
triggerall = var(21)
trigger1 = var(33) = var(24)
var(24) = 0
ignorehitpause = 1

[State 60000,ガード不能学習]
type = VarSet
triggerall = var(21)
trigger1 = var(33) = var(25)
var(25) = 0
ignorehitpause = 1

[State 60000,ガード不能学習]
type = VarSet
triggerall = var(21)
trigger1 = var(33) = var(26)
var(26) = 0
ignorehitpause = 1

[State 60000,ガード不能判定]
type = VarSet
triggerall = var(33)
triggerall = !var(34)
trigger1 = EnemyNear,MoveType = A
trigger1 = EnemyNear,StateNo = var(33)
trigger1 = !(EnemyNear,HitDefAttr=SCA,AA)
var(34) = -1
ignorehitpause = 1

[State 60000,ガード不能判定]
type = VarSet
triggerall = var(33)
triggerall = var(34) <= 0
trigger1 = EnemyNear,MoveType = A
trigger1 = EnemyNear,StateNo = var(33)
trigger1 = EnemyNear,HitDefAttr=SCA,AA
var(34) = 1
ignorehitpause = 1

[State 60000,ガード不能学習2]
type = VarSet
triggerall = !var(35)
triggerall = var(33)
trigger1 = var(21)>0
trigger1 = var(21) = var(24) || var(21) = var(25) || var(21) = var(26)
var(35) = ifelse(var(21)!=var(33),var(21),0)
ignorehitpause = 1

[State 60000,ガード不能学習2]
type = VarSet
triggerall = !var(35)
triggerall = var(33)
trigger1 = var(22)>0
trigger1 = var(22) = var(24) || var(22) = var(25) || var(22) = var(26)
var(35) = ifelse(var(21)!=var(33),var(22),0)
ignorehitpause = 1

[State 60000,ガード不能学習2]
type = VarSet
triggerall = !var(35)
triggerall = var(33)
trigger1 = var(23)>0
trigger1 = var(23) = var(24) || var(23) = var(25) || var(23) = var(26)
var(35) = ifelse(var(21)!=var(33),var(23),0)
ignorehitpause = 1

[State 60000,ガード不能学習]
type = VarSet
triggerall = var(21)
trigger1 = var(35) = var(21)
var(21) = 0
ignorehitpause = 1

[State 60000,ガード不能学習]
type = VarSet
triggerall = var(21)
trigger1 = var(35) = var(22)
var(22) = 0
ignorehitpause = 1

[State 60000,ガード不能学習]
type = VarSet
triggerall = var(21)
trigger1 = var(35) = var(23)
var(23) = 0
ignorehitpause = 1

[State 60000,ガード不能学習]
type = VarSet
triggerall = var(21)
trigger1 = var(35) = var(24)
var(24) = 0
ignorehitpause = 1

[State 60000,ガード不能学習]
type = VarSet
triggerall = var(21)
trigger1 = var(35) = var(25)
var(25) = 0
ignorehitpause = 1

[State 60000,ガード不能学習]
type = VarSet
triggerall = var(21)
trigger1 = var(35) = var(26)
var(26) = 0
ignorehitpause = 1

[State 60000,ガード不能判定2]
type = VarSet
triggerall = var(35)
triggerall = !var(36)
trigger1 = EnemyNear,MoveType = A
trigger1 = EnemyNear,StateNo = var(35)
trigger1 = !(EnemyNear,HitDefAttr=SCA,AA)
var(36) = -1
ignorehitpause = 1

[State 60000,ガード不能判定2]
type = VarSet
triggerall = var(35)
triggerall = var(36) <= 0
trigger1 = EnemyNear,MoveType = A
trigger1 = EnemyNear,StateNo = var(35)
trigger1 = EnemyNear,HitDefAttr=SCA,AA
var(36) = 1
ignorehitpause = 1

[State 60000,学習一時中断リセット]
type = VarSet
trigger1 = var(37)
trigger1 = Root,MoveType != H
trigger1 = Root,StateNo =5210 || Root,Ctrl
var(37) = 0
ignorehitpause = 1

[Statedef 33001]
Type = A
Ctrl = 0
Anim = 9999
Velset = -10,0
Movetype = I
Physics = N
Sprpriority = 1

[State 33001]
type=selfstate
trigger1=!ishelper
value=0

[State 33001]
Type = AssertSpecial
Trigger1 = IsHelper
flag = invisible

[state 33001]
type = nothitby
trigger1 = 1
value = sca

;ヘルパーと一緒に飛び道具を飛ばす
[State 5555]
Type=Projectile
Trigger1 = time=0
Velocity = -10,0
ProjID = 5555
Projanim = -1
Offset = 0,0
projstagebound = 0
Projedgebound = 100000
Projremovetime = -1
Projscale = 0,0

;飛び道具が消えたら止まる
[State 50000]
Type = velset
Trigger1 = Root,NumProjID(5555)=0
Trigger1 = time>0
x=0
y=0

[State -2]
Type = VarSet
;TriggerAll = Root,var(59) > 0
TriggerAll = Enemy,TeamMode = Single || Enemy,TeamMode = Turns
Trigger1 = helper(33000),var(5) = 1
V = helper(33000),var(6)
Value = helper(33000),var(2)
IgnoreHitPause = 1

[Statedef 33002]
Type = A
Ctrl = 0
Anim = 9999
Velset = -10,0
Movetype = I
Physics = N
Sprpriority = 1

[State 33002]
type=selfstate
trigger1=!ishelper
value=0

[State 33002]
Type = AssertSpecial
Trigger1 = IsHelper
flag = invisible

[state 33002]
type = nothitby
trigger1 = 1
value = sca

;ヘルパーと一緒に飛び道具を飛ばす
[State 6666]
Type = Projectile
Trigger1 = time=0
Velocity = -10,0
ProjID = 6666
Projanim = -1
Offset = 0,0
projstagebound = 0
Projedgebound = 100000
Projremovetime = -1
Projscale = 0,0

;飛び道具が消えたら止まる
[State 6666]
Type = velset
Trigger1 = Root,NumProjID(6666)=0
Trigger1 = time>0
x=0
y=0

[State -2]
Type = VarSet
;TriggerAll = Root,var(59) > 0
TriggerAll = Enemy,TeamMode = Single || Enemy,TeamMode = Turns
Trigger1 = helper(33000),var(5) = 1
V = helper(33000),var(6)
Value = helper(33000),var(3)
IgnoreHitPause = 1


;==========================================================================
;                Notes http://mugenguild.com/forum/topics/ai-detect-enemys-helper-projectile-system-179829.msg2352368.html#msg2352368
;==========================================================================
;notes:
;-Enemy projectile now has a PlayerID use PlayerID(helper(33333333),var(3)) as a redirect.
;
;base examples of trigger use: 
;
;;Enemy projectile helper distance from character.
;trigger1 = PlayerIDExist(helper(33333333),var(3))
;trigger1 = PlayerID(helper(33333333),var(3)), p2bodydist x 
;
;;Enemy projectile helper velocity.
;trigger1 = PlayerIDExist(helper(33333333),var(3))
;trigger1 = PlayerID(helper(33333333),var(3)), Vel X
;
;==========================================================================
;                Helper var usage.
;==========================================================================
; numhelper(33333333) Variable usage:
; This is a record of the variables that are used
;
; var(0) - highest playerid + 1
; var(3) - projectile player id while it exists
; 
;==========================================================================
[Statedef 33333333]
type = A
movetype = I
physics = N
ctrl = 0
velset = 0, 0
 
;==========================================================================
;                Config Section
;==========================================================================
anim = 9741                   ; blank animation
 
;==========================================================================
[state 33333333, Clipboard] 
type = DisplayToClipboard
trigger1 = 1
text = "Highest Playerid = %d , Projectile helper's PlayerId = %d\nBy Inktrebuchet"
params = var(0)-1, var(3)
 
;==========================================================================
;                Detect Enemy Projectile Helper
;==========================================================================
[State 33333333, 0]
type = Null
trigger1 = var(0) = 0
trigger1 = (var(0) := id)
ignorehitpause = 1

[State 33333333]
Type = AssertSpecial
Trigger1 = IsHelper
flag = invisible

[State 33333333]
Type = NotHitBy
Trigger1 = 1
Value = SCA
Time = 1
IgnoreHitPause = 1
 
[state 33333333, 1] 
type = varadd
trigger1 = PlayerIdExist(var(0)) 
trigger2 = PlayerIdExist(var(0)+1) 
trigger3 = PlayerIdExist(var(0)+2) 
trigger4 = PlayerIdExist(var(0)+3) 
trigger5 = PlayerIdExist(var(0)+4) 
trigger6 = PlayerIdExist(var(0)+5) 
trigger7 = PlayerIdExist(var(0)+6) 
trigger8 = PlayerIdExist(var(0)+7) 
trigger9 = PlayerIdExist(var(0)+8) 
trigger10 = PlayerIdExist(var(0)+9) 
trigger11 = PlayerIdExist(var(0)+10) 
trigger12 = PlayerIdExist(var(0)+11) 
trigger13 = PlayerIdExist(var(0)+12) 
trigger14 = PlayerIdExist(var(0)+13) 
trigger15 = PlayerIdExist(var(0)+14) 
trigger16 = PlayerIdExist(var(0)+15) 
trigger17 = PlayerIdExist(var(0)+16) 
trigger18 = PlayerIdExist(var(0)+17) 
trigger19 = PlayerIdExist(var(0)+18) 
trigger20 = PlayerIdExist(var(0)+19) 
trigger21 = PlayerIdExist(var(0)+20) 
trigger22 = PlayerIdExist(var(0)+21) 
trigger23 = PlayerIdExist(var(0)+22) 
trigger24 = PlayerIdExist(var(0)+23) 
trigger25 = PlayerIdExist(var(0)+24) 
trigger26 = PlayerIdExist(var(0)+25) 
v = 0
value = 1
ignorehitpause = 1
 
[State 33333333, 2]
type = Null
triggerall = PlayerIdExist(Root,ID)
trigger1 = PlayerIdExist(var(0)-1)
trigger1 = IfElse(root,teamside = 1, PlayerID(var(0)-1),teamside = 2, PlayerID(var(0)-1),teamside = 1)
trigger1 = PlayerID(var(0)-1),hitdefattr = ASC, AP, AA, AT
trigger1 = var(3) := (var(0)-1)
trigger2 = PlayerIdExist(var(0)-2)
trigger2 = IfElse(root,teamside = 1, PlayerID(var(0)-2),teamside = 2, PlayerID(var(0)-2),teamside = 1)
trigger2 = PlayerID(var(0)-2),hitdefattr = ASC, AP, AA, AT
trigger2 = var(3) := (var(0)-2)
trigger3 = PlayerIdExist(var(0)-3)
trigger3 = IfElse(root,teamside = 1, PlayerID(var(0)-3),teamside = 2, PlayerID(var(0)-3),teamside = 1)
trigger3 = PlayerID(var(0)-3),hitdefattr = ASC, AP, AA, AT 
trigger3 = var(3) := (var(0)-3)
trigger4 = PlayerIdExist(var(0)-4)
trigger4 = IfElse(root,teamside = 1, PlayerID(var(0)-4),teamside = 2, PlayerID(var(0)-4),teamside = 1)
trigger4 = PlayerID(var(0)-4),hitdefattr = ASC, AP, AA, AT
trigger4 = var(3) := (var(0)-4)
trigger5 = PlayerIdExist(var(0)-5)
trigger5 = IfElse(root,teamside = 1, PlayerID(var(0)-5),teamside = 2, PlayerID(var(0)-5),teamside = 1)
trigger5 = PlayerID(var(0)-5),hitdefattr = ASC, AP, AA, AT
trigger5 = var(3) := (var(0)-5)
trigger6 = PlayerIdExist(var(0)-6)
trigger6 = IfElse(root,teamside = 1, PlayerID(var(0)-6),teamside = 2, PlayerID(var(0)-6),teamside = 1)
trigger6 = PlayerID(var(0)-6),hitdefattr = ASC, AP, AA, AT
trigger6 = var(3) := (var(0)-6)
trigger7 = PlayerIdExist(var(0)-7)
trigger7 = IfElse(root,teamside = 1, PlayerID(var(0)-7),teamside = 2, PlayerID(var(0)-7),teamside = 1)
trigger7 = PlayerID(var(0)-7),hitdefattr = ASC, AP, AA, AT
trigger7 = var(3) := (var(0)-7)
trigger8 = PlayerIdExist(var(0)-8)
trigger8 = IfElse(root,teamside = 1, PlayerID(var(0)-8),teamside = 2, PlayerID(var(0)-8),teamside = 1)
trigger8 = PlayerID(var(0)-8),hitdefattr = ASC, AP, AA, AT
trigger8 = var(3) := (var(0)-8)
trigger9 = PlayerIdExist(var(0)-9)
trigger9 = IfElse(root,teamside = 1, PlayerID(var(0)-9),teamside = 2, PlayerID(var(0)-9),teamside = 1)
trigger9 = PlayerID(var(0)-9),hitdefattr = ASC, AP, AA, AT
trigger9 = var(3) := (var(0)-9)
trigger10 = PlayerIdExist(var(0)-10)
trigger10 = IfElse(root,teamside = 1, PlayerID(var(0)-10),teamside = 2, PlayerID(var(0)-10),teamside = 1)
trigger10 = PlayerID(var(0)-10),hitdefattr = ASC, AP, AA, AT
trigger10 = var(3) := (var(0)-10)
ignorehitpause = 1

[State 33333333, 2]
type = Null
triggerall = PlayerIdExist(Root,ID)
trigger1 = PlayerIdExist(var(3)-1)
trigger1 = IfElse(root,teamside = 1, PlayerID(var(3)-1),teamside = 2, PlayerID(var(3)-1),teamside = 1)
trigger1 = PlayerID(var(3)-1),hitdefattr = ASC, AP, AA, AT
trigger1 = var(4) := (var(3)-1)
trigger2 = PlayerIdExist(var(3)-2)
trigger2 = IfElse(root,teamside = 1, PlayerID(var(3)-2),teamside = 2, PlayerID(var(3)-2),teamside = 1)
trigger2 = PlayerID(var(3)-2),hitdefattr = ASC, AP, AA, AT
trigger2 = var(4) := (var(3)-2)
trigger3 = PlayerIdExist(var(3)-3)
trigger3 = IfElse(root,teamside = 1, PlayerID(var(3)-3),teamside = 2, PlayerID(var(3)-3),teamside = 1)
trigger3 = PlayerID(var(3)-3),hitdefattr = ASC, AP, AA, AT
trigger3 = var(4) := (var(3)-3)
trigger4 = PlayerIdExist(var(3)-4)
trigger4 = IfElse(root,teamside = 1, PlayerID(var(3)-4),teamside = 2, PlayerID(var(3)-4),teamside = 1)
trigger4 = PlayerID(var(3)-4),hitdefattr = ASC, AP, AA, AT
trigger4 = var(4) := (var(3)-4)
trigger5 = PlayerIdExist(var(3)-5)
trigger5 = IfElse(root,teamside = 1, PlayerID(var(3)-5),teamside = 2, PlayerID(var(3)-5),teamside = 1)
trigger5 = PlayerID(var(3)-5),hitdefattr = ASC, AP, AA, AT
trigger5 = var(4) := (var(3)-5)
trigger6 = PlayerIdExist(var(3)-6)
trigger6 = IfElse(root,teamside = 1, PlayerID(var(3)-6),teamside = 2, PlayerID(var(3)-6),teamside = 1)
trigger6 = PlayerID(var(3)-6),hitdefattr = ASC, AP, AA, AT 
trigger6 = var(4) := (var(3)-6)
trigger7 = PlayerIdExist(var(3)-7)
trigger7 = IfElse(root,teamside = 1, PlayerID(var(3)-7),teamside = 2, PlayerID(var(3)-7),teamside = 1)
trigger7 = PlayerID(var(3)-7),hitdefattr = ASC, AP, AA, AT
trigger7 = var(4) := (var(3)-7)
trigger8 = PlayerIdExist(var(3)-8)
trigger8 = IfElse(root,teamside = 1, PlayerID(var(3)-8),teamside = 2, PlayerID(var(3)-8),teamside = 1)
trigger8 = PlayerID(var(3)-8),hitdefattr = ASC, AP, AA, AT
trigger8 = var(4) := (var(3)-8)
trigger9 = PlayerIdExist(var(3)-9)
trigger9 = IfElse(root,teamside = 1, PlayerID(var(3)-9),teamside = 2, PlayerID(var(3)-9),teamside = 1)
trigger9 = PlayerID(var(3)-9),hitdefattr = ASC, AP, AA, AT
trigger9 = var(4) := (var(3)-9)
trigger10 = PlayerIdExist(var(3)-10)
trigger10 = IfElse(root,teamside = 1, PlayerID(var(3)-10),teamside = 2, PlayerID(var(3)-10),teamside = 1)
trigger10 = PlayerID(var(3)-10),hitdefattr = ASC, AP, AA, AT
trigger10 = var(4) := (var(3)-10)
ignorehitpause = 1


[State 33333333, BindToRoot]
type = BindToRoot
trigger1 = PlayerIdExist(Root,ID)
time = 1
facing = 1
pos =0,-2
ignorehitpause = 1 
var(59)=1





;===========================================================================
[Statedef -2]
;===========================================================================
;---------------------------------------------------------------------------------
;当身记录var(41)-var(47)
;---------------------------------------------------------------------------------
[state -2,对手当身技 记录]
Type = null
triggerall = !IsHelper
triggerall = MoveReversed = 1
triggerall = MoveType = H
triggerall = enemynear,moveType = A || enemynear,moveType = I
trigger1 = var(41) = 0
trigger1 = var(41) := EnemyNear,StateNo

trigger2 = var(41) != EnemyNear,StateNo
trigger2 = var(42) = 0
trigger2 = var(42) := EnemyNear,StateNo

trigger3 = var(41) != EnemyNear,StateNo 
trigger3 = var(42) != EnemyNear,StateNo
trigger3 = var(43) = 0
trigger3 = var(43) := EnemyNear,StateNo 

trigger4 = var(41) != EnemyNear,StateNo 
trigger4 = var(42) != EnemyNear,StateNo
trigger4 = var(43) != EnemyNear,StateNo 
trigger4 = var(44) = 0
trigger4 = var(44) := EnemyNear,StateNo

trigger5 = var(41) != EnemyNear,StateNo
trigger5 = var(42) != EnemyNear,StateNo
trigger5 = var(43) != EnemyNear,StateNo
trigger5 = var(44) != EnemyNear,StateNo 
trigger5 = var(45) = 0
trigger5 = var(45) := EnemyNear,StateNo 

trigger6 = var(41) != EnemyNear,StateNo 
trigger6 = var(42) != EnemyNear,StateNo
trigger6 = var(43) != EnemyNear,StateNo 
trigger6 = var(44) != EnemyNear,StateNo
trigger6 = var(45) != EnemyNear,StateNo 
trigger6 = var(46) = 0
trigger6 = var(46) := EnemyNear,StateNo
IgnoreHitPause = 1

[state 11990,对手正在使用当身技]
Type = VarSet
var(47) = 0
triggerall = !IsHelper
trigger1 = EnemyNear,MoveType!=A
IgnoreHitPause = 1


[state 11990,对手正在使用当身技]
Type = VarSet
var(47) = 1
triggerall = !IsHelper
trigger1 = var(41) && var(41) = EnemyNear,Stateno
trigger2 = var(42) && var(42) = EnemyNear,Stateno
trigger3 = var(43) && var(43) = EnemyNear,Stateno
trigger4 = var(44) && var(44) = EnemyNear,Stateno
trigger5 = var(45) && var(45) = EnemyNear,Stateno
trigger6 = var(46) && var(46) = EnemyNear,Stateno
IgnoreHitPause = 1









;--------------------------------------
;血量显示
[State -2,个位]
Type = Explod
trigger1 = !ishelper
trigger1 = roundState >= 2
anim = F310+life%10
pos = IfElse(TeamSide=1,122,204), 28
posType = Left
bindtime = -1
ownpal = 1
ontop = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1


[State -2,十位]
Type =  Explod
trigger1 = !ishelper
trigger1 = roundState >= 2
anim = F310+floor(life/10)%10
pos = IfElse(TeamSide=1,118,200), 28
posType = Left
bindtime = -1
ownpal = 1
ontop = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1


[State -2,百位]
Type =  Explod
trigger1 = !ishelper
trigger1 = roundState >= 2
anim = F310+floor(life/100)%10
pos = IfElse(TeamSide=1,114,196), 28
posType = Left
bindtime = -1
ownpal = 1
ontop = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1 


[State -2,千位]
Type =  Explod
trigger1 = !ishelper
trigger1 = roundState >= 2
anim = F310+floor(life/1000)%10
pos = IfElse(TeamSide=1,110,192), 28
posType = Left
bindtime = -1
ownpal = 1
ontop = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1

;--------------------------------------

;--------------------------------------
;气量显示

[State -2,个位]
Type = Explod
trigger1 = !ishelper
trigger1 = roundState >= 2
anim = F300+Power%10
pos = IfElse(TeamSide=1,122,208), 4
posType = Left
bindtime = -1
ownpal = 1
ontop = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1


[State -2,十位]
Type =  Explod
trigger1 = !ishelper
trigger1 = roundState >= 2
anim = F300+floor(Power/10)%10
pos = IfElse(TeamSide=1,118,204), 4
posType = Left
bindtime = -1
ownpal = 1
ontop = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1


[State -2,百位]
Type =  Explod
trigger1 = !ishelper
trigger1 = roundState >= 2
anim = F300+floor(Power/100)%10
pos = IfElse(TeamSide=1,114,200), 4
posType = Left
bindtime = -1
ownpal = 1
ontop = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1 


[State -2,千位]
Type =  Explod
trigger1 = !ishelper
trigger1 = roundState >= 2
anim = F300+floor(Power/1000)%10
pos = IfElse(TeamSide=1,110,196), 4
posType = Left
bindtime = -1
ownpal = 1
ontop = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1


[State -2,万位]
Type =  Explod
trigger1 = !ishelper
trigger1 = roundState >= 2
anim = F300+floor(Power/10000)%10
pos = IfElse(TeamSide=1,106,192), 4
posType = Left
bindtime = -1
ownpal = 1
ontop = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1
;--------------------------------------

[State -2, Counter]
type = PlaySnd
triggerall = numenemy
triggerall = helper(10000),var(56) = 1
triggerall = enemy, movetype = h
trigger1 = movehit ;Move hits
trigger2 = projhit = 1 ;Projectile Hits
value = s200,1
ignorehitpause = 1

[state -2]
Type = Helper
triggerall = !isHelper
Trigger1 = !numHelper(33334)
name = "VAR_EX"
ID = 33334
StateNo = 33334
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

;-----------------------------------------------------------------------------
;空中防御判定
;原作空中自己不可防御，敌人一样不可防御
;-----------------------------------------------------------------------------
[State -2, AirGuard]
Type = AssertSpecial
triggerall = roundstate = 2
trigger1 = p2stateType = A
flag = unguardable

;-----------------------------------------------------------------------------
;击中无敌
;-----------------------------------------------------------------------------
[State -2, 无敌]
Type = Null;NotHitBy
Triggerall = !IsHelper
trigger1 = HitPauseTime
trigger1 = !(MoveReversed)
value = SCA
ignorehitpause = 1

;------------------------------------------------------------------------------------------------
;援助 李梅
;------------------------------------------------------------------------------------------------
[State -1]
Type       = Helper
triggerall = var(59)
Triggerall = ishelper=0&&roundstate=2
Triggerall   = numhelper(6000) = 0 && var(57) > 0
Triggerall   = numhelper(6010) = 0
Triggerall   = numhelper(6020) = 0
Triggerall   = numhelper(6030) = 0
Triggerall   = numhelper(6040) = 0
Triggerall   = numhelper(6050) = 0
Triggerall   = numhelper(6060) = 0
triggerall   = var(57) = 6
Triggerall   = Facing = 1
triggerall   = FrontEdgeBodyDist >= BackEdgeBodyDist
Triggerall   = MoveType=H&&StateNo!=[120,159]
Triggerall   = EnemyNear,Pos Y >= -50
Triggerall   = P2BodyDist x<60
Triggerall   = EnemyNear,MoveType=A&&EnemyNear,AnimTime<-8
Triggerall   = EnemyNear,StateNo=[200,1999]
Triggerall   = Helper(33334),var(4) = 0
;血量过低
Trigger1     = Life<100&&GetHitVar(HitCount)>=6
Trigger1     = var(50):=605321
;要被接爆发了
Trigger2     = EnemyNear,Power>=1000&&GetHitVar(HitCount)>=8
Trigger2     = var(50):=605322
;连没完了
Trigger3     = EnemyNear,StateNo<2000&&GetHitVar(HitCount)>=12
Trigger3     = var(50):=605323
Id         = 6050
Stateno    = 6053
Helpertype = normal
Ownpal     = 1
Bind       = -1
Postype    = left
pos = 0,0
name = "Maylee"

[State -1]
Type       = Helper
triggerall = var(59)
Triggerall = ishelper=0&&roundstate=2
Triggerall   = numhelper(6000) = 0 && var(57) > 0
Triggerall   = numhelper(6010) = 0
Triggerall   = numhelper(6020) = 0
Triggerall   = numhelper(6030) = 0
Triggerall   = numhelper(6040) = 0
Triggerall   = numhelper(6050) = 0
Triggerall   = numhelper(6060) = 0
triggerall   = var(57) = 6
Triggerall   = Facing = -1
triggerall   = FrontEdgeBodyDist >= BackEdgeBodyDist
Triggerall   = MoveType=H&&StateNo!=[120,159]
Triggerall   = EnemyNear,Pos Y >= -50
Triggerall   = P2BodyDist x<60
Triggerall   = EnemyNear,MoveType=A&&EnemyNear,AnimTime<-8
Triggerall   = EnemyNear,StateNo=[200,1999]
Triggerall   = Helper(33334),var(4) = 0
;血量过低
Trigger1     = Life<100&&GetHitVar(HitCount)>=6
Trigger1     = var(50):=605324
;要被接爆发了
Trigger2     = EnemyNear,Power>=1000&&GetHitVar(HitCount)>=8
Trigger2     = var(50):=605325
;连没完了
Trigger3     = EnemyNear,StateNo<2000&&GetHitVar(HitCount)>=12
Trigger3     = var(50):=605326
Id         = 6050
Stateno    = 6053
Helpertype = normal
Ownpal     = 1
Bind       = -1
Postype    = right
pos = 0,0
name = "Maylee"





;===========================================================================
[Statedef -3]
;===========================================================================
[state ]
type = palfx
time = 1
trigger1 = enemy,var(11) = [105000,105002]
trigger2 = enemy,var(11) = [115000,115002]
ignorehitpause = 1

[state ]
type = RemapPal
triggerall = helper(10000),var(47) = 1
triggerall = !ishelper
trigger1 = stateno = 5000
trigger2 = stateno = 5001
trigger3 = stateno = [5010,5011]
trigger4 = stateno = 5020
trigger5 = stateno = 5030
trigger6 = stateno = 5035
trigger7 = stateno = 5050
trigger8 = stateno = [5080,5081]
source = 1,1
;dest = 5000,1014-floor(gametime/3)%14
dest = 5000,1000+floor(gametime/3)%14
ignorehitpause = 1

[state ]
type = RemapPal
triggerall = helper(10000),var(47) = 2
triggerall = !ishelper
trigger1 = stateno = 5000
trigger2 = stateno = 5001
trigger3 = stateno = [5010,5011]
trigger4 = stateno = 5020
trigger5 = stateno = 5030
trigger6 = stateno = 5035
trigger7 = stateno = 5050
trigger8 = stateno = [5080,5081]
source = 1,1
;dest = 5001,1014-floor(gametime/3)%14
dest = 5001,1000+floor(gametime/3)%14
ignorehitpause = 1

[state ]
type = RemapPal
triggerall = helper(10000),var(47) = 0
triggerall = !ishelper
trigger1 = stateno != 5001
trigger1 = stateno != 5011
trigger1 = stateno != 5030
trigger1 = stateno != 5035
trigger1 = stateno != 5050
trigger2 = stateno = 5000
trigger3 = stateno = 5010
trigger4 = stateno = 5020
trigger5 = stateno = 5080
source = 1,1
dest = 1,palno
ignorehitpause = 1


;-------------------------
;------ afterimage -------
;-------------------------

[State -2]
type = Helper
triggerall = ishelper = 0
;triggerall = numhelper(55+helper(10000),var(43)) = 0
trigger1 = stateno = 40 && animtime = -1
trigger2 = helper(10000),var(43) = [1,12]
trigger2 = stateno != [360,362]
;
trigger3 = stateno = [360,362]
trigger3 = time < 14
;
trigger4 = stateno = 63 && animtime = -1
trigger5 = stateno = 64 && animtime = -1
trigger6 = stateno = 68 && animtime = -1
trigger7 = stateno = 69 && animtime = -1
name = "afterimage"
stateno = 55
ID = 55;+helper(10000),var(43)
helpertype = normal
pos = 0, 0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
sprpriority = -20 + helper(10000),var(43)
ignorehitpause = 1

;-----------------------------------------------
;kof99
[State -3, 简单]
type = HitOverride

triggerall = stateno != [120,155]
triggerall = helper(10000),var(4) = [1,2];1: kof99/2: kof2000
;
triggerall = statetype != A
;
triggerall = prevstateno != 2004
;------------------------------------------------kof99
triggerall = var(7) > 0
triggerall = alive
triggerall = animtime < 0
;
;trigger = stateno = 
trigger1 = stateno = 200
trigger2 = stateno = 205
trigger3 = stateno = 210
trigger4 = stateno = 215
trigger5 = stateno = 220
trigger6 = stateno = 225
trigger7 = stateno = 230
trigger8 = stateno = 235
trigger9 = stateno = 240
trigger10 = stateno = 241
trigger11 = stateno = 245
trigger12 = stateno = 400
trigger13 = stateno = 410
trigger14 = stateno = 420
trigger15 = stateno = 430
;
trigger16 = stateno = 1020
trigger17 = stateno = 1025
trigger18 = stateno = 1040
trigger19 = stateno = 1100
trigger20 = stateno = 1105
trigger21 = stateno = 1200
trigger22 = stateno = 1202
trigger23 = stateno = 1205
trigger24 = stateno = 1207
trigger25 = stateno = 1450
trigger26 = stateno = 1455
trigger27 = stateno = 1465
trigger28 = stateno = 1462
trigger29 = stateno = 1500
trigger30 = stateno = 1501
trigger31 = stateno =  1600
trigger32 = stateno =  1601
trigger33 = stateno =  1602
trigger34 = stateno =  1605
trigger35 = stateno =  1606
trigger36 = stateno =  1607
trigger37 = stateno =  1800
trigger38 = stateno =  1850
trigger39 = stateno =  1855
;
;time = 1
;slot = 2
attr = SCA,AA,AP
stateno = 2004
ignorehitpause = 1

;-----------------------------------------------
;kof99
[State -3, 简单]
type = HitOverride
triggerall = stateno != [120,155]
triggerall = helper(10000),var(4) = [1,2];1: kof99/2: kof2000
;
triggerall = statetype = A
;
triggerall = prevstateno != 2004
;------------------------------------------------kof99
triggerall = var(7) > 0
triggerall = alive
triggerall = animtime < 0
;
;trigger = stateno = 
trigger1 = stateno = 246
trigger2 = stateno = 310
trigger3 = stateno = 320
trigger4 = stateno = 1021
trigger5 = stateno = [1026,1027]
trigger6 = stateno = 1041
trigger7 = stateno = 1101
trigger8 = stateno = 1106
trigger9 = stateno = 1201
trigger10 = stateno = 1206
trigger11 = stateno = 1210
trigger12 = stateno = 1461
trigger13 = stateno = 1463
trigger14 = stateno = 1470
trigger15 = stateno = 1471
trigger16 = stateno =  1603
trigger17 = stateno =  1608
;
;time = 1
;slot = 2
attr = SCA,AA,AP
stateno = 2004
ignorehitpause = 1


;-----------------------------------------------
;kof99
[State -3, 简单]
type = HitOverride
triggerall = stateno != [120,155]
triggerall = helper(10000),var(4) = [1,2];1: kof99/2: kof2000
;
triggerall = statetype = A
;
triggerall = prevstateno != 2004
;------------------------------------------------kof99
triggerall = var(7) > 0
triggerall = alive
triggerall = animtime < 0 || time >= 1
;特殊情况
;trigger = stateno = 
trigger1 = stateno = 1300
trigger2 = stateno = 1301
trigger3 = stateno = 1305
trigger4 = stateno = 1380
;
;time = 1
;slot = 2
attr = SCA,AA,AP
stateno = 2004
ignorehitpause = 1

;-----------------------------------------------
;kof99
[State -3, 简单]
type = HitOverride
triggerall = stateno != [120,155]
triggerall = helper(10000),var(4) = [1,2];1: kof99/2: kof2000
;
triggerall = statetype = A
;
triggerall = prevstateno != 2004
;------------------------------------------------kof99
triggerall = var(7) > 0
triggerall = alive
;triggerall = animtime < 0 || time >= 1
;空中普通拳脚
;trigger = stateno = 
trigger1 = stateno = 600
trigger2 = stateno = 610
trigger3 = stateno = 620
trigger4 = stateno = 630
trigger5 = stateno = 640
trigger6 = stateno = 621
trigger7 = stateno = 615
trigger8 = stateno = 625
trigger9 = stateno = 636
trigger10 = stateno = 660
;
;time = 1
;slot = 2
attr = SCA,AA,AP
stateno = 2004
ignorehitpause = 1

[state -3]
type = varset
Triggerall = !isHelper
var(10) = stateno
trigger1 = stateno = 200
trigger2 = stateno = 205
trigger3 = stateno = 210
trigger4 = stateno = 215
trigger5 = stateno = 220
trigger6 = stateno = 225
trigger7 = stateno = 230
trigger8 = stateno = 235
trigger9 = stateno = 240
trigger10 = stateno = 241
trigger11 = stateno = 245
trigger12 = stateno = 400
trigger13 = stateno = 410
trigger14 = stateno = 420
trigger15 = stateno = 430
;
trigger16 = stateno = 1020
trigger17 = stateno = 1025
trigger18 = stateno = 1040
trigger19 = stateno = 1100
trigger20 = stateno = 1105
trigger21 = stateno = 1200
trigger22 = stateno = 1202
trigger23 = stateno = 1205
trigger24 = stateno = 1207
trigger25 = stateno = 1450
trigger26 = stateno = 1455
trigger27 = stateno = 1465
trigger28 = stateno = 1462
trigger29 = stateno = 1500
trigger30 = stateno = 1501
trigger31 = stateno =  1600
trigger32 = stateno =  1601
trigger33 = stateno =  1602
trigger34 = stateno =  1605
trigger35 = stateno =  1606
trigger36 = stateno =  1607
trigger37 = stateno =  1800
trigger38 = stateno =  1850
trigger39 = stateno =  1855
ignorehitpause = 1

[state -3]
type = varset
Triggerall = !isHelper
var(10) = stateno
trigger1 = stateno = 600
trigger2 = stateno = 610
trigger3 = stateno = 620
trigger4 = stateno = 630
trigger5 = stateno = 640
trigger6 = stateno = 621
trigger7 = stateno = 615
trigger8 = stateno = 625
trigger9 = stateno = 636
trigger10 = stateno = 660
ignorehitpause = 1

[state -3]
type = varset
Triggerall = !isHelper
var(10) = stateno
trigger1 = stateno = 246
trigger2 = stateno = 310
trigger3 = stateno = 320
trigger4 = stateno = 1021
trigger5 = stateno = [1026,1027]
trigger6 = stateno = 1041
trigger7 = stateno = 1101
trigger8 = stateno = 1106
trigger9 = stateno = 1201
trigger10 = stateno = 1206
trigger11 = stateno = 1210
trigger12 = stateno = 1461
trigger13 = stateno = 1463
trigger14 = stateno = 1470
trigger15 = stateno = 1471
trigger16 = stateno =  1603
trigger17 = stateno =  1608
ignorehitpause = 1

;特殊情况
[state -3]
type = varset
Triggerall = !isHelper
var(10) = stateno
trigger1 = stateno = 1300
trigger2 = stateno = 1301
trigger3 = stateno = 1305
trigger4 = stateno = 1380
ignorehitpause = 1



[State -3, 简单]
type = selfstate
value = 0
ctrl = 1
triggerall = stateno != [120,155]
triggerall = helper(10000),var(4) = 1;kof99
triggerall = statetype != A
;------------------------------------------------kof2000
triggerall = var(7) > 0
triggerall = alive
trigger1 = prevstateno = 2004 && time >= 10
ignorehitpause = 1


[State -3, 简单]
type = hitvelset
x = 1
triggerall = stateno != [120,155]
triggerall = helper(10000),var(4) = 1;kof99
triggerall = statetype != A
;------------------------------------------------kof2000
triggerall = var(7) > 0
triggerall = alive
trigger1 = prevstateno = 2004 && time = 1
ignorehitpause = 1

;------------------------

[state -3]
type = changestate
value = 5001
triggerall = helper(10000),var(4) = 1
;
triggerall = var(7) > 0
triggerall = statetype = S
trigger1 = stateno = 5000
trigger2 = stateno = 5010
trigger3 = stateno = 5070
ignorehitpause = 1

[state -3]
type = changestate
value = 5011
triggerall = helper(10000),var(4) = 1
;
triggerall = var(7) > 0
triggerall = statetype = C
trigger1 = stateno = 5000
trigger2 = stateno = 5010
trigger3 = stateno = 5070
ignorehitpause = 1

[state -3]
type = selfstate
value = 0
ctrl = 1
triggerall = helper(10000),var(4) = 1
;
triggerall = var(7) > 0
triggerall = time > gethitvar(slidetime)
triggerall = time > 0
trigger1 = stateno = 5001
trigger2 = stateno = 5011
trigger3 = stateno = 5071

;------------------------

;-------------------------

[state -3]
type = targetfacing
value = 1
trigger1 = target,stateno = 5000 || target,stateno = 940 || target,stateno = 5010
trigger1 = target,anim = [5,6]
trigger1 = target,statetype != A
;trigger1 = target,prevstateno != 997
trigger1 = movehit = 1
trigger1 = p2dist x > 0
ignorehitpause = 1

[state -3]
type = targetfacing
value = -1
trigger1 = target,stateno = 5000 || target,stateno = 940 || target,stateno = 5010
trigger1 = target,anim = [5,6]
trigger1 = target,statetype != A
;trigger1 = target,prevstateno != 997
trigger1 = movehit = 1
trigger1 = p2dist x <= 0
ignorehitpause = 1

[state -3]
type = statetypeset
movetype = H;I
;triggerall = movecontact
trigger1 = stateno = 600 && animelem = 3,>2
trigger2 = stateno = 610 && animelem = 3,>2
trigger3 = stateno = 620 && animelem = 4,>2
trigger4 = stateno = 630 && animelem = 6,>2
trigger5 = stateno = 640 && animelem = 6,>2
trigger6 = stateno = 615 && animelem = 6,>2
trigger7 = stateno = 625 && animelem = 3,>2
trigger8 = stateno = 636 && animelem = 6,>2
trigger9 = stateno = 621 && animelem = 8,>2
trigger10 = stateno = 1383 && 0
trigger11 = stateno = 1855 && animelem = 11,>2
trigger12 = stateno = 1800 && animelem = 25,>2
trigger13 = stateno = 1465 && animelem = 13,>2
trigger14 = stateno = 1463 && animelem = 3,>2
trigger15 = (stateno = 1603 && animelem = 5,>2) ||  (stateno = 1608 && animelem = 5,>2)
trigger16 = stateno = 1609
trigger17 = stateno = 1101 && animelem = 7,>2
trigger18 = stateno = 1106 && animelem = 12,>2
trigger19 = stateno = 622 && animelem = 9,>2
trigger20 = stateno = 1027 && animelem = 6,>2
trigger21 = stateno = 1500 && animelem = 5,>2
trigger22 = stateno = 1501 && animelem = 7,>2
trigger23 = stateno = 1021 && animelem = 4,>2
trigger24 = stateno = 1026 && animelem = 5,>2
trigger25 = stateno = 1202 && animelem = 2,>2
trigger26 = stateno = 1207 && animelem = 2,>2
trigger27 = stateno = 200 && animelem = 4,>2
trigger28 = stateno = 205 && animelem = 3,>2
trigger29 = stateno = 210 && animelem = 5,>2
trigger31 = stateno = 215 && anim = 215 && animelem = 4,>2
trigger32 = stateno = 215 && anim = 212 && animelem = 7,>2
trigger33 = stateno = 220 && animelem = 7,>2
trigger34 = stateno = 225 && animelem = 5,>2
trigger35 = stateno = 230 && animelem = 5,>2
trigger36 = stateno = 235 && anim = 235 && animelem = 3,>2
trigger37 = stateno = 235 && anim = 236 && animelem = 7,>2
trigger38 = stateno = 240 && animelem = 8,>2
trigger39 = stateno = 241 && animelem = 8,>2
trigger40 = stateno = 300 && animelem = 4,>2
trigger41 = stateno = 301 && animelem = 10,>2
trigger42 = stateno = 305 && animelem = 4,>2
trigger43 = stateno = 310 && animelem = 10,>2
trigger44 = stateno = 320 && animelem = 11,>2
trigger45 = stateno = 400 && animelem = 3,>2
trigger46 = stateno = 410 && animelem = 3,>2
trigger47 = stateno = 420 && anim = 420 && animelem = 5,>2
trigger48 = stateno = 420 && anim = 440 && animelem = 7,>2
trigger49 = stateno = 430 && animelem = 4,>2
ignorehitpausetime = 1


[state -3]
type = HitDef
trigger1 = stateno = [200,500]
trigger1 = p2movetype = H
trigger1 = enemynear,pos y > -27
attr = A,NA
hitflag = 
guardflag = 
guard.dist= 0

[state -3]
type = HitDef
trigger1 = stateno = 600 && animelem = 3
trigger2 = stateno = 610 && animelem = 3
trigger3 = stateno = 620 && animelem = 4
trigger4 = stateno = 630 && animelem = 6
trigger5 = stateno = 640 && animelem = 6
trigger6 = stateno = 615 && animelem = 6
trigger7 = stateno = 625 && animelem = 3
trigger8 = stateno = 636 && animelem = 6
trigger9 = stateno = 621 && animelem = 8
trigger10 = stateno = 1383
trigger11 = stateno = 1855 && animelem = 11
trigger12 = stateno = 1800 && animelem = 25
trigger13 = stateno = 1465 && animelem = 13
trigger14 = stateno = 1463 && animelem = 3
trigger15 = (stateno = 1603 && animelem = 5) || (stateno = 1608 && animelem = 5)
trigger16 = stateno = 1609
trigger17 = stateno = 1101 && animelem = 7
trigger18 = stateno = 1106 && animelem = 12
trigger19 = stateno = 622 && animelem = 9
trigger20 = stateno = 1027 && animelem = 6
trigger21 = stateno = 1500 && animelem = 5
trigger22 = stateno = 1501 && animelem = 7
trigger23 = stateno = 1021 && animelem = 4
trigger24 = stateno = 1026 && animelem = 5
trigger25 = stateno = 1202 && animelem = 2
trigger26 = stateno = 1207 && animelem = 2
trigger27 = stateno = 200 && animelem = 4
trigger28 = stateno = 205 && animelem = 3
trigger29 = stateno = 210 && animelem = 5
trigger31 = stateno = 215 && anim = 215 && animelem = 4
trigger32 = stateno = 215 && anim = 212 && animelem = 7
trigger33 = stateno = 220 && animelem = 7
trigger34 = stateno = 225 && animelem = 5
trigger35 = stateno = 230 && animelem = 5
trigger36 = stateno = 235 && anim = 235 && animelem = 3
trigger37 = stateno = 235 && anim = 236 && animelem = 7
trigger38 = stateno = 240 && animelem = 8
trigger39 = stateno = 241 && animelem = 8
trigger40 = stateno = 300 && animelem = 4
trigger41 = stateno = 301 && animelem = 10
trigger42 = stateno = 305 && animelem = 4
trigger43 = stateno = 310 && animelem = 10
trigger44 = stateno = 320 && animelem = 11
trigger45 = stateno = 400 && animelem = 3
trigger46 = stateno = 410 && animelem = 3
trigger47 = stateno = 420 && anim = 420 && animelem = 5
trigger48 = stateno = 420 && anim = 440 && animelem = 7
trigger49 = stateno = 430 && animelem = 4
attr = A,NP
hitflag = 
guardflag = 

[State -2,]
type = Explod
triggerall = var(7) > 0 && helper(10000),var(14) = 5
triggerall = stateno = 101
trigger1 = animelem = 3
trigger2 = animelem = 6
IgnoreHitPause = 1
anim = 7039
id = 7039
remove = 1
removetime = 19
sprpriority = 2
pos = -30,3
postype = p1
bindtime = 0
ownpal = 1
scale = 0.4,0.3
velocity = -2.5

[state -3]
type = ScreenBound
trigger1 = pos y < -100
trigger1 = movetype != H
trigger1 = numtarget
value = 1
movecamera = 0,1


[State -2,]
type = Explod
trigger1 = p2stateno = 60192
trigger1 = p2movetype = H
trigger1 = gametime%10 = 0
IgnoreHitPause = 1
anim = 60191
id = 60191
remove = 1
removetime = 12
sprpriority = 1
pos = -30+random%60,-40
postype = p2
bindtime = 0
ownpal = 1
;scale = 0.4,0.3
;velocity = -2.5

[State -2,]
type = Explod
trigger1 = p2stateno = 60192
trigger1 = p2movetype = H
trigger1 = gametime%20 = 0
IgnoreHitPause = 1
anim = 60192
id = 60191
remove = 1
removetime = 12
sprpriority = 1
pos = -30+random%60,-40
postype = p2
bindtime = 0
ownpal = 1

[State -2,]
type = Explod
trigger1 = p2stateno = 60193
trigger1 = p2movetype = H
trigger1 = numexplod(60193) = 0
IgnoreHitPause = 1
anim = 60193
id = 60193
remove = 1
removetime = 12
sprpriority = 1
pos = 40,0
postype = p2
bindtime = 0
ownpal = 1
facing = -1


;-----------------
;Saltos by Facu-96
;-----------------
[State -3,]
type = PlaySnd
triggerall = Time = 1
trigger1 = stateno = 50
trigger2 = stateno = 950
value = 0,(var(5)>0)

;==================================
;========  Config helper  =========
;==================================

[state -2]
type = helper
trigger1 = numhelper(10000) = 0
id = 10000
stateno = 10000
pos = 50,-100
helpertype = normal
ownpal = 1
bind = -1
postype = left
supermove = 1
supermovetime = 99999


;=====================================
;========  display for test  =========
;=====================================

[State -2,]
type = displaytoclipboard
trigger1 = 1
text = "DX=%d DY=%d P2ST=%d P2HT=%d P2T=%d P2AT=%d\n"
params = p2bodydist x, EnemyNear,Pos Y, EnemyNear,StateNo, EnemyNear,GetHitVar(hittime), EnemyNear,Time, EnemyNear,AnimTime
ignorehitpause = 1

[State -2,]
type = appendtoclipboard
trigger1 = 1
text = "TRACK=%d DD=%d V56=%d CTRL=%d DY=%d VX=%d"
params = var(50), Helper(33334),fvar(15),var(56),var(17), Pos Y, Vel x
ignorehitpause = 1

[State -2,]
type = appendtoclipboard
trigger1 = 1
text = " PROJ=%d"
params = EnemyNear,hitdefattr=SCA,AA,AT,AP
ignorehitpause = 1

[state -2]
type = varset
fvar(33) = ceil(p2bodydist x / p2bodydist y*10)
trigger1 = 1


;====================================
;========  Preinput helper  =========
;====================================

[state -2]
type = helper
trigger1 = var(59) = 0
trigger1 = numhelper(10002) = 0
trigger1 = ctrl = 0
id = 10002
stateno = 10002
pos = 50,-130
helpertype = normal
ownpal = 1
bind = -1
postype = left
keyctrl = 1
supermove = 1
movetime = 99999
supermovetime = 99999


;=================================
;========  Corner Width  =========
;=================================
[State 0, Width]
type = Width
triggerall = EnemyNear,MoveType != H
trigger1 = statetype = A
edge = -5,0

[State 0, Width]
type = Width
triggerall = EnemyNear,MoveType != H
trigger1 = teamside = 1
edge = 0,0

[state -2]
type = width
edge = 62,0
triggerall = EnemyNear,MoveType != H
trigger1 = prevstateno = [200,430]
trigger1 = stateno = 1450 && time = 1
trigger1 = !movecontact
trigger1 = frontedgedist < 40


[state -2]
type = width
edge = 50,0
triggerall = EnemyNear,MoveType != H
trigger1 = prevstateno = [200,430]
trigger1 = stateno = 1500
trigger1 = !movecontact
trigger1 = frontedgedist < 40

[State 0, Width]
type = Width
triggerall = EnemyNear,MoveType != H
trigger1 = stateno = 1855 && time  = 1
trigger1 = prevstateno = [200,500]
trigger1 = numtarget
edge = 80,0

;------------
;---backup---
;------------
[State -2]
type = AssertSpecial
triggerall = alive
trigger1 = roundstate = 3
trigger2 = roundstate = 4
trigger3 = WinKO
flag = NoBarDisplay
ignorehitpause = 1



;----------------------
;Explot K.O! by Facu-96
;----------------------

[State -2,]
type = Explod
triggerall = numexplod(8100) <= 0
trigger1 = WinKO
trigger1 = RoundState = 3
trigger1 = var(8) = 0
IgnoreHitPause = 1
anim = 8100
removetime = -2
id = 8100
sprpriority = -9
pos = 0,0
postype = left
bindtime = -1
ignorehitpause = 1
ownpal = 1

[state -2,]
type = playsnd
trigger1 = WinKO
trigger1 = RoundState = 3
trigger1 = var(8) = 0
IgnoreHitPause = 1
persistent = 0
value = 5200,0

[state -2,]
type = varset
Triggerall = !isHelper
trigger1 = RoundState = 3
IgnoreHitPause = 1
v = 8
value = 1

[state -2,]
type = varset
Triggerall = !isHelper
trigger1 = RoundState = 2
IgnoreHitPause = 1
v = 8
value = 0

;---------------------------------------------------------------

;============================================
;========  Stop Afterimage/StopSnd  =========
;============================================

[State 0, AfterImageTime]
type = AfterImageTime
trigger1 = movetype = H
time = 1

[State -2, run sound]
type = stopsnd
trigger1 = stateno != 101 && stateno != 1000 && stateno != 1011
channel = 1

[State -2, run sound]
type = stopsnd
trigger1 = movetype = H
trigger1 = stateno != [0,4999]
channel = 3

[State -2, run sound]
type = stopsnd
trigger1 = stateno != 2005
trigger1 = stateno != 2205
channel = 12

[State -2, run sound]
type = stopsnd
trigger1 = stateno != 2205
channel = 13

[State 105, StopSnd]
type = StopSnd
trigger1 = stateno != 9801
channel = 24

[State 102, StopSnd]
type = StopSnd
trigger1 = stateno != 9801
channel = 25



;-------------------------
;P2 Stateno Spark Suelo 1
;-------------------------

[State -2,]
type = Explod
;------------
;---backup---
;------------
;triggerall = var(10) = 0 && numexplod(921) = 0
;trigger1 = numtarget(1603) > 0
;trigger1 = target(1603),stateno = 1710 && target(1603),movetype = H
;trigger2 = numtarget(1608) > 0
;trigger2 = target(1608),stateno = 1710 && target(1608),movetype = H
;trigger3 = numtarget(2206) > 0
;trigger3 = target(2206),stateno = 1710 && target(2206),movetype = H
;-------------------------------------------------------------------
trigger1 = numtarget(1502) = 0
trigger1 = target,stateno = 1710 || target,stateno = 3063
trigger1 = target,movetype = H
trigger1 = target,time = 1
;-------------------------------------------------------------------
ignorehitpause =1 
persistent = 0
anim = 7035
ID = 921
postype = p2
pos = -15,24   
sprpriority = -1
shadow = 0  
ownpal = 1


;P2 Stateno Spark Suelo 2
[State -2,]
type = Explod
;------------
;---backup---
;------------
;triggerall = var(10) = 0 && numexplod(922) = 0
;trigger1 = numtarget(1603) > 0
;trigger1 = target(1603),stateno = 1710 && target(1603),movetype = H
;trigger2 = numtarget(1608) > 0
;trigger2 = target(1608),stateno = 1710 && target(1608),movetype = H
;trigger3 = numtarget(2206) > 0
;trigger3 = target(2206),stateno = 1710 && target(2206),movetype = H
;-------------------------------------------------------------------
trigger1 = numtarget(1502) = 0
trigger1 = target,stateno = 1710 || target,stateno = 3063
trigger1 = target,movetype = H
trigger1 = target,time = 1
;-------------------------------------------------------------------
anim = 7036
ID = 922
postype = p2
pos = -15,24    
sprpriority = 2
shadow = 0
ownpal = 1


;P2 Stateno Spark Suelo 2 stateno=1465
[State -2,]
type = Explod
;------------
;---backup---
;------------
;triggerall = var(10) = 0 && numexplod(922) = 0
;trigger1 = numtarget(1603) > 0
;trigger1 = target(1603),stateno = 1711 && target(1603),movetype = H
;trigger2 = numtarget(1608) > 0
;trigger2 = target(1608),stateno = 1711 && target(1608),movetype = H
;trigger3 = numtarget(2206) > 0
;trigger3 = target(2206),stateno = 1711 && target(2206),movetype = H
;-------------------------------------------------------------------
trigger1 = numtarget(1502) = 0
trigger1 = target,stateno = 1711 || target,stateno = 3063
trigger1 = target,movetype = H
trigger1 = target,time = 1
;-------------------------------------------------------------------
ignorehitpause = 1
persistent = 0
anim = 7036
ID = 922
postype = p2
pos = -15,24    
sprpriority = 2
shadow = 0
ownpal = 1

[State -2,]
type = Explod
trigger1 = target,time = 1
trigger1 = target,movetype = H
trigger1 = target(1471),stateno = 12100
ignorehitpause = 1
persistent = 0
anim = 7035
ID = 922
postype = p2
pos = -20,0
sprpriority = -1
shadow = 0
ownpal = 1

[State -2,]
type = Explod
trigger1 = target,time = 1
trigger1 = target,movetype = H
trigger1 = target(1471),stateno = 12100
ignorehitpause = 1
persistent = 0
anim = 7036
ID = 922
postype = p2
pos = -20,0
sprpriority = -1
shadow = 0
ownpal = 1

;---------------------------------------------

[State -2,]
type = Explod
triggerall = target,time = 1
triggerall = target,movetype = H
;trigger1 = target(1608),stateno = 931
trigger1 = target,stateno = 931
ignorehitpause = 1
persistent = 0
anim = 7035
ID = 922
postype = p2
pos = -20,0
sprpriority = -1
shadow = 0
ownpal = 1
facing = ifelse((facing != target,facing),1,-1)

[State -2,]
type = Explod
triggerall = target,time = 1
triggerall = target,movetype = H
;trigger1 = target(1608),stateno = 931
trigger1 = target,stateno = 931
ignorehitpause = 1
persistent = 0
anim = 7036
ID = 922
postype = p2
pos = -20,0
sprpriority = 2
shadow = 0
ownpal = 1
facing = ifelse((facing != target,facing),1,-1)


[State -2,]
type = Explod
triggerall = target,time = 1
triggerall = target,movetype = H
trigger1 = target,stateno = 911
ignorehitpause = 1
persistent = 0
anim = 7035
ID = 922
postype = p2
;pos = -10,-13
pos = 0,0
sprpriority = -1
shadow = 0
ownpal = 1
facing = ifelse((facing != target,facing),1,-1)

[State -2,]
type = Explod
triggerall = target,time = 1
triggerall = target,movetype = H
trigger1 = target,stateno = 911
ignorehitpause = 1
persistent = 0
anim = 7036
ID = 922
postype = p2
;pos = -10,-13
pos = 0,0
sprpriority = 2
shadow = 0
ownpal = 1
facing = ifelse((facing != target,facing),1,-1)


;------------
;---backup---
;------------
;[State -2,]
;type = RemoveExplod
;trigger1 = p2stateno = 1720
;trigger2 = p2movetype != H
;id = 921

;------------
;---backup---
;------------
;[State -2,]
;type = RemoveExplod
;trigger1 = p2stateno = 1720
;trigger1 = stateno != 1465
;trigger1 = stateno != 1855
;trigger2 = p2movetype != H
;id = 922



;--------------------------
;Max Mode Kof-98 by Facu-96
;--------------------------

[State -2,]
type = VarSet
Triggerall = !isHelper
trigger1 = var(30) = 0
trigger1 = Pos X < 0
v = 30
value = 1

[State -2,]
type = VarSet
Triggerall = !isHelper
trigger1 = var(30) = 0
trigger1 = Pos X >= 0
v = 30
value = 2


;=============================
;========  Max Mode  =========
;=============================

;-------------------------------
;--- var(7) set for Max Mode ---
;-------------------------------
[State -2,]
type = VarSet
Triggerall = !isHelper
trigger1 = var(7) < 0
trigger2 = roundstate = 1
var(7) = 0
ignorehitpause = 1

[State -2,]
type = PalFX
triggerall = IsHelper != 1
triggerall = timemod = 2,0
triggerall = movetype != H
trigger1 = var(7) > 0
trigger1 = helper(10000),var(14) = 1 || helper(10000),var(14) = 3
time = 1
add = 55,55,55
ignorehitpause = 1

[State -2,]
type = PalFX
triggerall = IsHelper != 1
triggerall = timemod = 2,0
triggerall = movetype != H
trigger1 = var(7) > 0
trigger1 = helper(10000),var(14) = 2
time = 1
add = 110,-10,-30
color = 1;90
ignorehitpause = 1

[State -2,]
type = PalFX
triggerall = IsHelper != 1
triggerall = timemod = 2,0
triggerall = movetype != H
trigger1 = var(7) > 0
trigger1 = helper(10000),var(14) = 4
time = 1
add = 80,80,-50
color = 1;90
ignorehitpause = 1

[State -2,]
type = PalFX
triggerall = IsHelper != 1
triggerall = timemod = 2,0
triggerall = movetype != H
trigger1 = var(7) > 0
trigger1 = helper(10000),var(14) = 5
time = 1
add = 80,80,80
;color = 1;90
ignorehitpause = 1

[State -2,]
type = VarAdd
Triggerall = !isHelper
trigger1 = var(7) > 0
v = 7
value = -1
ignorehitpause = 1

[State -2,]
type = PalFX
Triggerall = !isHelper
triggerall = timemod = 2,0
trigger1 = stateno = 4201 && anim != 4201
;trigger1 = target,gethitvar(hitshaketime) <= 8
trigger1 = target,gethitvar(hitshaketime)%2 = 0
;
time = 1
add = 0,0,200
mul = 150,150,255
color = 1
ignorehitpause = 1

[State -2,]
type = PalFX
Triggerall = !isHelper
triggerall = timemod = 2,0
triggerall = movetype != H
trigger1 = stateno = [20400,22999]
trigger1 = root,var(7) > 0
time = 1
add = 80,80,80
;color = 1;90
ignorehitpause = 1

[State -2];どこキャン時点滅
type = PalFX
Triggerall = !isHelper
trigger1 = stateno = 21505 && movehit
time = 2
add = 256,256,256
color = 1
ignorehitpause = 1

[State -2];どこキャン時点滅
type = PalFX
Triggerall = !isHelper
triggerall = time < 7
trigger1 = stateno = 23100
trigger1 = timemod = 2,0
time = 1
;add = 255,255,255
;mul = 255,255,255
add = 255,255,255
mul = 255,255,255
ignorehitpausetime = 1

;--------------
;--- effect ---
;--------------


[State -2,]
type = ModifyExplod
Triggerall = !isHelper
trigger1 = Var(7) != 0
ID = 4102
scale = (1100 - Var(7)) / 1100.0,1
ontop = 1


;-------------------
;--- Remove Anim ---
;-------------------
[State -2,]
type = Explod
Triggerall = !isHelper
trigger1 = Var(7) <= 0 && Var(30) = 1 && NumExplod(4100) != 0
anim = 4101
postype = left
pos = 3 + helper(10000),var(32),200 + helper(10000),var(33)
ontop = 1
supermove = 1
ignorehitpause = 1
ignoresuperpause = 1
bindtime = 30
ownpal = 1

[State -2,]
type = Explod
Triggerall = !isHelper
trigger1 = Var(7) <= 0 && Var(30) = 2 && NumExplod(4100) != 0
anim = 4106
postype = right
pos = -94 - helper(10000),var(32),200 + helper(10000),var(33)
ontop = 1
supermove = 1
ignorehitpause = 1
ignoresuperpause = 1
bindtime = 30
ownpal = 1

[State -2,]
type = RemoveExplod
Triggerall = !isHelper
trigger1 = Var(7) <= 0 && NumExplod(4100) != 0
id = 4102

[State -2,]
type = RemoveExplod
Triggerall = !isHelper
trigger1 = Var(7) <= 0 & NumExplod(4100) != 0
id = 4100

[State -2,]
type = RemoveExplod
Triggerall = !isHelper
trigger1 = stateno != [1040,1041]
id = 1040

;=================================
;========  Hack-version  =========
;=================================

[State -2,]
type = VarSet
Triggerall = !isHelper
trigger1 = stateno = 2200
trigger2 = stateno = 2210
trigger3 = stateno = 2300
v = 7
value = 0
ignorehitpause = 1


[state -2]
type = varadd
var(7) = -80
Triggerall = !isHelper
triggerall = var(7) > 1
triggerall = time = 1
;triggerall = (prevstateno != [0,700]) && prevstateno != 4000
triggerall = (prevstateno != [0,950]) && prevstateno != 4000
trigger1 = stateno = 1020
trigger2 = stateno = 1025
trigger3 = stateno = 1100
trigger4 = stateno = 1105
trigger4 = prevstateno != [1450,1465]
trigger5 = stateno = 1200
trigger6 = stateno = 1205
trigger7 = stateno = 1210
trigger8 = stateno = 1450
trigger9 = stateno = 1305
trigger10 = stateno = 1300
trigger11 = stateno = 1380
trigger12 = stateno = 1600
trigger13 = stateno = 1605
trigger14 = stateno = 1500
trigger15 = stateno = 1501
trigger16 = stateno = 1800
trigger17 = stateno = 1850
ignorehitpause = 1


[state -2]
type = varadd
var(7) = -80
Triggerall = !isHelper
trigger1 = helper(4250),stateno = 21110
trigger1 = helper(4250),time = 1
trigger1 = helper(4250),prevstateno = 21505

;-------------------------------------------------------------------------

;----------------------------
;Grito de Golpeado by Facu-96
;----------------------------

[State -3,]
type = VarRandom
Triggerall = !isHelper
triggerall = Time = 1
trigger1 = stateno = 5000
trigger2 = stateno = 5010
trigger3 = stateno = 5020
v = 4
range = 0,8

[State -3,]
type = PlaySnd
triggerall = Time = 1
triggerall = Var(4) = [0,2]
triggerall = alive = 1
trigger1 = stateno = 5000
trigger2 = stateno = 5010
trigger3 = stateno = 5020
value = 5000,0

[State -3,]
type = PlaySnd
triggerall = Time = 1
triggerall = Var(4) = [3,5]
triggerall = alive = 1
trigger1 = stateno = 5000
trigger2 = stateno = 5010
trigger3 = stateno = 5020
value = 5000,1



;-------------------------
;-------------------------
;------ Fatal fury -------
;-------------------------

[State 2000,]
type = Explod
Triggerall = !isHelper
triggerall = roundstate = 1
trigger1 = helper(10000),var(22) = 3
anim = 13041
id = 13041
remove = 0
reomvetime = -1
pos = 0,-30
postype = p1
ownpal = 1
supermove = 1
sprpriority = 4
ontop = 1
scale = .25,.25
ignorehitpausetime = 1

[state ]
type = RemoveExplod
id = 13041
Triggerall = !isHelper
trigger1 = roundstate != 1
trigger2 = helper(10000),var(22) != 3

;--------------------------------------------------------------------------;パワーゲージ
;--------------------
;------ kof99 -------
;--------------------
[state -3]
type = helper
triggerall = ishelper = 0
triggerall = numhelper(7500) = 0
triggerall = teamside = 1
;
trigger1 = helper(10000),var(3) = 2
trigger1 = var(7) > 0
;
trigger2 = helper(10000),var(4) > 0
trigger2 = var(7) > 0
;
trigger3 = helper(10000),var(5) > 0
;trigger3 = helper(10000),var(23) = 1
;
id = 7500
stateno = 7501
pos = 50,-100
helpertype = normal
ownpal = 1
bind = -1
postype = left
supermove = 1
supermovetime = 99999


[state -3]
type = helper
triggerall = ishelper = 0
triggerall = numhelper(7500) = 0
triggerall = teamside = 2
;
trigger1 = helper(10000),var(3) = 2
trigger1 = var(7) > 0
;
trigger2 = helper(10000),var(4) > 0
trigger2 = var(7) > 0
;
trigger3 = helper(10000),var(5) > 0
;trigger3 = helper(10000),var(23) = 1
;
id = 7500
stateno = 7511
pos = 50,-100
helpertype = normal
ownpal = 1
bind = -1
postype = left
supermove = 1
supermovetime = 99999

;--------------------------------------------------------------------------;パワーゲージ表示 by ikaruga
;--------------------------------------------------------------------------
[State -2, アドヴァンスト - 1P]
type = Helper
triggerall = roundstate >= 1
triggerall =!IsHelper
;------------------------
;triggerall = var(12) = 0
;------------------------
triggerall =!NumHelper(7600)
trigger1 = teamside = 1
trigger1 = helper(10000),var(23) = 1
ID = 7600
name = "ADV-1P"
pos = 0,0
postype = left
stateno = 7600
persistent = 0
keyctrl = 0
ownpal = 1
Ignorehitpause = 1

[State -2, アドヴァンスト - 2P]
type = Helper
triggerall = roundstate >= 1 && numhelper(7600) = 0
triggerall =!IsHelper
;------------------------
;triggerall = var(12) = 0
;------------------------
triggerall =!NumHelper(7600)
trigger1 = teamside = 2
trigger1 = helper(10000),var(23) = 1
ID = 7600
name = "ADV-2P"
pos = 0,0
postype = left
stateno = 7610
persistent = 0
keyctrl = 0
ownpal = 1
Ignorehitpause = 1


;KOF2002UM

[state -3]
type = helper
triggerall = ishelper = 0
trigger1 = helper(10000),var(23) = 2
trigger1 = numhelper(7800) = 0
trigger1 = teamside = 1
id = 7800
stateno = 7800
pos = 50,-100
helpertype = normal
ownpal = 1
bind = -1
postype = left
supermove = 1
supermovetime = 99999

[state -3]
type = helper
triggerall = ishelper = 0
trigger1 = helper(10000),var(23) = 2
trigger1 = numhelper(7800) = 0
trigger1 = teamside = 2
id = 7800
stateno = 7820
pos = 50,-100
helpertype = normal
ownpal = 1
bind = -1
postype = left
supermove = 1
supermovetime = 99999

;===================================================================
;========  helper(10000),var(7)set for target 5710 スタン  =========
;===================================================================

[state ]
type = targetstate
value = 1033
triggerall = helper(10000),var(5) > 0
trigger1 = numtarget(3061) || numtarget(3035)
trigger1 = p2stateno = 911 || p2stateno = 932
;trigger1 = p2movetype = H
ignorehitpause = 1

;スタン
[State -2, ピヨリ音]
type = playsnd
trigger1 = p2statetype = S || p2statetype = C
trigger1 = p2movetype = I && p2stateno = 5715
trigger1 = enemy,anim = 5300 && enemy,time = 1
value = s8,2

[State -2, TargetState]
type = TargetState
triggerall = numtarget
triggerall = target,alive
triggerall = helper(10000),var(7) >= 104;208
triggerall = target,movetype = H
triggerall = target,statetype != L
triggerall = target,stateno != 5610
triggerall = target,stateno != 930
trigger1 = movehit = 1
value = 5710
ignorehitpausetime = 1

[State -2, TargetState]
type = TargetState
triggerall = numtarget
triggerall = target,alive
triggerall = helper(10000),var(7) >= 104;208
triggerall = target,movetype = H
trigger1 = target,stateno = 920
trigger1 = target,animtime = -1
trigger2 = target,stateno = 5110
value = 5713
ignorehitpausetime = 1

;========================================================
;========  var(16),var(17) set for guard crush  =========
;========================================================

;ガードクラッシュ
[State -2, TargetState]
type = TargetState
triggerall = numtarget
triggerall = target,alive
triggerall = helper(10000),var(9) >= 104;208
triggerall = target,statetype != A
triggerall = target,movetype = H
triggerall = target,stateno = [120,159]
trigger1 = moveguarded = [1,2]
value = 5700

[State -2, CRUSH!]
type = helper
triggerall = numhelper(6510) = 0
trigger1 = numtarget
trigger1 = target,statetype = S || target,statetype = C
trigger1 = target,movetype = H && target,stateno = 5700
trigger1 = target,anim = 5700 && target,time = 1
name="crush"
id = 6510
pos = 0,0
postype = back
stateno = 6510
helpertype = normal
ownpal = 1
keyctrl = 0
size.xscale = 1
size.yscale = 1
persistent = 0
ignorehitpause = 1
supermovetime = 999
pausemovetime = 999

;=========================================================================
;========  helper(10002),var(3) set for supercancel [2000,2300]  =========
;=========================================================================
;-------------------------------------------
[State -2];どこキャン時点滅
type = PalFX
triggerall = var(7) > 0 && helper(10000),var(14) = 5
triggerall = prevstateno != [0,999]
triggerall = stateno = [1000,1999]
triggerall = time < 1;5
trigger1 = stateno = 1100
trigger2 = stateno = 1105
trigger3 = stateno = 1200
trigger4 = stateno = 1205
trigger5 = stateno = 1300
trigger6 = stateno = 1305
trigger7 = stateno = 1380
trigger8 = stateno = 1450
trigger9 = stateno = 1500
trigger10 = stateno = 1501
trigger11 = stateno = 1600
trigger12 = stateno = 1605
trigger13 = stateno = 1800
trigger14 = stateno = 1850
time = 2
add = 256,256,256
color = 1
ignorehitpause = 1


[State -2];どこキャン時点滅
type = PalFX
triggerall = prevstateno = [1000,1999]
triggerall = (var(7) > 0 && helper(10000),var(14) = 3) || (stateno = [2000,2999])
triggerall = time < 7
triggerall = timemod = 2,0
trigger1 = stateno = 1850
trigger2 = stateno = 1800
trigger3 = stateno = 1450
trigger4 = stateno = 1100
trigger5 = stateno = 1105
trigger6 = stateno = 1600
trigger7 = stateno = 1605
trigger8 = stateno = 1380
trigger9 = stateno = 1020
trigger10 = stateno = 1025
trigger11 = stateno = 1200
trigger12 = stateno = 1205
trigger13 = stateno = 1500
trigger14 = stateno = 1501
trigger15 = stateno = 1305
trigger16 = stateno = 1300
trigger17 = stateno = 1900
;
trigger18 = stateno = 2000
trigger19 = stateno = 2015
trigger20 = stateno = 2001
trigger21 = stateno = 2200
trigger22 = stateno = 2210
trigger23 = stateno = 2060
trigger24 = stateno = 2100
trigger25 = stateno = 2300
trigger26 = stateno = 2450
trigger27 = stateno = 2460
trigger28 = stateno = 2500
;
time = 1
;add = 255,255,255
;mul = 255,255,255
add = 255,255,255
mul = 255,255,255
ignorehitpausetime = 1

[state -2]
type = varset
var(49) = 1
Triggerall = !isHelper
triggerall = helper(10000),var(14) = 3 || helper(10000),var(14) = 5
triggerall = helper(10002),var(4) > 0
triggerall = movecontact
trigger1 = stateno = 1021
trigger2 = stateno = [1025,1026]
trigger3 = stateno = 1101
trigger4 = stateno = 1106
trigger5 = stateno = [1201,1202]
trigger6 = stateno = [1206,1207]
trigger7 = stateno = [1455,1456]
trigger8 = stateno = [1500,1501]
trigger9 = stateno = 1601
trigger10 = stateno = 1603
trigger11 = stateno = 1606
trigger12 = stateno = 1608
ignorehitpause = 1



[state -2]
type = varset
var(49) = 0
Triggerall = !isHelper
trigger1 = helper(10002),var(4) = 0
trigger2 = movecontact > 3

;===========================================================================
;---------------------------------------------------------------------------
; 敵空中喰らい行動不能再現用奪取ステート

[State -3, TargetState]
type = TargetState
triggerall = numtarget(10)
triggerall = target(10),alive
triggerall = stateno != 410
trigger1 = target(10),stateno = 5020 || target(10),stateno = 5030
trigger1 = target(10),statetype = A
trigger1 = target(10),movetype = H
value = 290

;---------------------------------------------------------------------------

[State -3, TargetState]
type = TargetState
triggerall = numtarget(11)
triggerall = target(11),alive
triggerall = stateno = 410 && movehit
trigger1 = target(11),stateno = 5020
trigger1 = target(11),statetype = A
trigger1 = target(11),movetype = H
trigger1 = target(11),prevstateno != [5003,5200]
value = 5002
ignorehitpause = 1


;------------------
;Critical by Ohgaki
;------------------

[State 230, 1]
type = explod
triggerall = numexplod(6520) < 1
triggerall = teamside = 1
trigger1 = movehit = 1
trigger1 = stateno = [3060,3061]
anim = 6520
id = 6520
postype = left
bindtime = -1
ownpal = 1
ontop = 1
pos = 50,110
ignorehitpause = 1 
persistent = 0
pausemovetime = 123456789
supermovetime = 123456789

[State 230, 1]
type = explod
triggerall = numexplod(6520) < 1
triggerall = teamside = 2
trigger1 = movehit = 1
trigger1 = stateno = [3060,3061]
anim = 6521
id = 6520
postype = right
bindtime = -1
ownpal = 1
ontop = 1
pos = -50,110
ignorehitpause = 1 
persistent = 0
pausemovetime = 123456789
supermovetime = 123456789


;================================================================================
; ------- COUNTER HIT (Vans  Code, Based on Sander s Method) --------
;===============================================================================

;kof98
[State -2, Explod];Counter Explod for P2 Side.
type = RemoveExplod
id = 8000
triggerall = numenemy
triggerall = helper(10000),var(56) = 1
triggerall = enemy, movetype = h ;Enemy was indeed HIT, otherwise this d be retarded.
;check
trigger1 = movehit ;Move hits
trigger2 = projhit = 1 ;Projectile Hits
ignorehitpause = 1

;kof98
[State -2, Explod];Counter Explod for P1 Side.
type = Explod
triggerall = helper(10000),var(23) = 1
triggerall = numenemy
triggerall = helper(10000),var(56) = 1 && teamside = 1 ;Counter Ok, Explod has not played, P1 Side
triggerall = enemy, movetype = h ;Enemy was indeed HIT, otherwise this d be retarded.
;check
trigger1 = movehit ;Move hits
trigger2 = projhit = 1 ;Projectile Hits
;
anim = 8000
pos = 10,90
postype = left  ;p2,front,back,left,right
removetime = -2
supermove = 1
sprpriority = 0
id = 8000
bindtime = -1
ontop = 1
ownpal = 1
ignorehitpause = 1
pausemovetime = -1

;kof98
[State -2, Explod];Counter Explod for P2 Side.
type = Explod
triggerall = helper(10000),var(23) = 1
triggerall = numenemy
triggerall = helper(10000),var(56) = 1 && teamside = 2 ;Counter Ok, Explod has not played, P2 Side
triggerall = enemy, movetype = h ;Enemy was indeed HIT, otherwise this d be retarded.
;check
trigger1 = movehit ;Move hits
trigger2 = projhit = 1 ;Projectile Hits
;
anim = 8001
pos = -10,90
postype = right  ;p2,front,back,left,right
facing = -1
removetime = -2
supermove = 1
sprpriority = 0
id = 8000
bindtime = -1
ontop = 1
ownpal = 1
ignorehitpause = 1
pausemovetime = -1


;kof2002um
[State -2, Explod];Counter Explod for P1 Side.
type = Explod
triggerall = helper(10000),var(23) != 1
triggerall = numenemy
triggerall = helper(10000),var(56) = 1 && teamside = 1 ;Counter Ok, Explod has not played, P1 Side
triggerall = enemy, movetype = h ;Enemy was indeed HIT, otherwise this d be retarded.
;check
trigger1 = movehit ;Move hits
trigger2 = projhit = 1 ;Projectile Hits
;
anim = 7816
pos = 50,88
postype = left  ;p2,front,back,left,right
removetime = -2
supermove = 1
sprpriority = 0
id = 8000
bindtime = -1
ontop = 1
ownpal = 1
ignorehitpause = 1
pausemovetime = -1
scale = .5,.5

;kof2002um
[State -2, Explod];Counter Explod for P2 Side.
type = Explod
triggerall = helper(10000),var(23) != 1
triggerall = numenemy
triggerall = helper(10000),var(56) = 1 && teamside = 2 ;Counter Ok, Explod has not played, P2 Side
triggerall = enemy, movetype = h ;Enemy was indeed HIT, otherwise this d be retarded.
;check
trigger1 = movehit ;Move hits
trigger2 = projhit = 1 ;Projectile Hits
;
anim = 7818
pos = -50,88
postype = right  ;p2,front,back,left,right
facing = -1
removetime = -2
supermove = 1
sprpriority = 0
id = 8000
bindtime = -1
ontop = 1
ownpal = 1
ignorehitpause = 1
pausemovetime = -1
scale = .5,.5


;闪光flash
[State -2, EnvColor];This will produce a flash a la KOF2K2
type = EnvColor
triggerall = numenemy
triggerall = helper(10000),var(56) = 1 && teamside = 1 ;Counter Ok, Explod has not played, P1 Side
triggerall = enemy, movetype = h ;Enemy was indeed HIT, otherwise this d be retarded.
;check
trigger1 = movehit ;Move hits
trigger2 = projhit = 1 ;Projectile Hits
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1


;kof98 超重击 重置 JUGGLE用
[State -2, Explod];Counter Explod for P1 Side.
type = Explod
triggerall = numenemy
triggerall = helper(10000),var(56) = 1 ;Counter Ok, Explod has not played, P1 Side
;
trigger1 = numexplod(8009) = 0
trigger1 = stateno = 300 || stateno = 301 || stateno = 640
;430 check 
trigger1 = movehit = 1
;
id = 8009
anim = 9999
pos = 0,0
postype = p2  ;p2,front,back,left,right
;facing = -1
remove = 0
removetime = -1
supermove = 1
sprpriority = 0
bindtime = -1
ontop = 1
ownpal = 1
ignorehitpause = 1
pausemovetime = -1

[state ]
type = assertspecial
trigger1 = numexplod(8009)
flag = nojugglecheck
ignorehitpause = 1

[state ]
type = removeexplod
id = 8009
trigger1 = numexplod(8009)
trigger1 = movehit != 1
ignorehitpause = 1

;-----------------------

[state -3]
type = screenbound
value = 1
trigger1 = pos y > 100
ignorehitpause = 1

[State -2, TargetState]
type = TargetState
triggerall = numtarget
triggerall = target,movetype = H
trigger1 = target,stateno = 12110
trigger1 = target,anim = [5110,5112]
trigger1 = helper(10000),var(12) <= 0
value = 12111


;================================
;========  Corner Push  =========
;================================
;-----------------------------------------------------------------------------
;画面端ノックバック
;-----------------------------------------------------------------------------
[State -2, 1]
Type = VarSet
Triggerall = !isHelper
Trigger1 = MoveContact = 1
FV = 18
Value = 0
ignorehitpause = 1

[State -2, 2]
Type = VarSet
Triggerall = !isHelper
Trigger1 = FVar(18) >= 0
Trigger2 = EnemyNear,StateNo != [154,155]
Trigger2 = EnemyNear,MoveType != H || EnemyNear,GetHitVar(HitTime) = 0
Trigger3 = FVar(18) = [-1,0]
Trigger4 = EnemyNear,StateNo = [154,155]
Trigger4 = EnemyNear,Ctrl
Trigger5 = EnemyNear,StateNo = [5100,5119]
Trigger6 = EnemyNear,StateNo = [5200,5219]
Trigger7 = EnemyNear,StateNo = 5001 || EnemyNear,StateNo = 5011
Trigger7 = EnemyNear,Time >= EnemyNear,GetHitVar(SlideTime)
trigger8 = stateno = 4201
FV = 18
Value = 0

[State -2, 3]
Type = PosAdd
Triggerall = !isHelper
;TriggerAll = var(11) = 0
TriggerAll = FVar(18) < 0
TriggerAll = StateType = S || StateType = C
TriggerAll = EnemyNear,GetHitVar(HitShakeTime) <= 0
;
triggerall = enemynear,movetype = H && enemynear,statetype = S || enemynear,statetype = C
;
Trigger1= EnemyNear,BackEdgeBodyDist <= 0 || EnemyNear,FrontEdgeBodyDist <= 0
;
trigger1 = !(var(7) = 0 && stateno = 2000 && animelem =4,<0)
trigger1 = !(var(7) = 0 && stateno = 2015 && animelem =4,<0)
trigger1 = !(var(7) = 0 && stateno = 2060 && animelem =2,<0)
trigger1 = !(var(7) = 0 && stateno = 2200 && animelem =4,<0)
trigger1 = !(var(7) = 0 && stateno = 2450 && animelem =3,<0)
trigger1 = !(var(7) = 0 && stateno = 2500 && animelem =2,<0)
;
X = (FVar(18))

[State -2, 4]
Type = VarSet
Triggerall = !isHelper
;Trigger1 = var(11) = 0
Trigger1 = FVar(18) < 0
Trigger1 = EnemyNear,GetHitVar(HitShakeTime) <= 0
;
trigger1 = !(var(7) = 0 && stateno = 2000 && animelem =4,<0)
trigger1 = !(var(7) = 0 && stateno = 2015 && animelem =4,<0)
trigger1 = !(var(7) = 0 && stateno = 2060 && animelem =2,<0)
trigger1 = !(var(7) = 0 && stateno = 2200 && animelem =4,<0)
trigger1 = !(var(7) = 0 && stateno = 2450 && animelem =3,<0)
trigger1 = !(var(7) = 0 && stateno = 2500 && animelem =2,<0)
;
FV = 18
Value = FVar(18) * ((EnemyNear,StateType = S || EnemyNear,StateType = C) * 0.85)

[State -2, 5] 
Type = VarSet
Triggerall = !isHelper
Trigger1 = MoveContact = 1
FV = 18
Value = -EnemyNear,GetHitVar(XVel)*Facing * (EnemyNear,StateType = S || EnemyNear,StateType = C)
ignorehitpause = 1

;--------------------------------

[State -2,]
type = Explod
Triggerall = !isHelper
triggerall = target,time = 1
trigger1 = target(1471),stateno != 12100
trigger1 = target,stateno = 12100
trigger2 = target,stateno = 12110
trigger3 = target,stateno = 1720 || target,stateno = 3064
trigger4 = target,stateno = 920
trigger5 = target,stateno = 931
trigger6 = target,stateno = 5712
trigger7 = target,stateno = 5713
anim = 7017
ID = 7017
postype = p2
pos = 0,0    
sprpriority = -2
shadow = 0
ownpal = 1
ignorehitpause = 1

[State -2,]
type = PlaySnd
triggerall = target,time = 1
trigger1 = target,stateno = 920
trigger2 = target,stateno = 5712
trigger3 = target,stateno = 5713
value = 7,0
ignorehitpause = 1

[State -2,]
type = Explod
trigger1 = p2stateno = 60193
trigger1 = p2statetype = A
anim = 7017
ID = 7017
postype = p2
pos = 0,0    
sprpriority = -2
shadow = 0
ownpal = 1
ignorehitpause = 1

[State -2,]
type = Explod
trigger1 = p2stateno = 946
trigger1 = target,time = 1
anim = 7437
ID = 7437
postype = p2
pos = 0,0    
sprpriority = -2
facing = -1
shadow = 0
ownpal = 1
ignorehitpause = 1

[State -2,]
type = PlaySnd
trigger1 = p2stateno = 60193
trigger1 = p2statetype = A
value = 7,0
ignorehitpause = 1
channel = 7

[State -2,]
type = PlaySnd
triggerall = target,time = 1
trigger1 = target,stateno = 12100
trigger2 = target,stateno = 12110
trigger3 = target,stateno = 1710 || target,stateno = 3063
trigger4 = target,stateno = 1720 || target,stateno = 3064
trigger5 = target,stateno = 931
trigger6 = target,stateno = 911
trigger7 = target,stateno = 1034
value = 7,2;0
ignorehitpause = 1
channel = 7

[State -2,]
type = PlaySnd
triggerall = target,time = 1
trigger1 = target,stateno = 2022
value = 7,2;0
ignorehitpause = 1
channel = 7

[State -2]
type = playsnd
;弃用
trigger1 = p2stateno = 946
trigger1 = numtarget
trigger1 = target,time = 1
value = s7,4
channel = 7

;----------------------
;------  Pause  -------
;----------------------

[State -2, Pause]
type = Pause
triggerall = movecontact = 0
triggerall = gameTime % 2 = 0
triggerall = p2stateno = [5000,5099]
;待定
trigger1 = var(7) = [980,1000]
trigger1 = p2statetype != A
trigger1 = p2movetype = H
trigger1 = p2stateno != [120,160]
;
trigger2 = var(7) = [980,1000]
trigger2 = p2statetype = A
trigger2 = p2movetype = H
trigger2 = p2stateno != [120,160]
;
time = 1
movetime = 1


;=================================================================================
;=================================================================================
;AI Start
;当身应对最后要记得加
;5300对应要测试
;=================================================================================
;=================================================================================
;---------------------------------------------------------------------------------
;援助固定
;---------------------------------------------------------------------------------
[state ]
type = playsnd
value = 14,0
triggerall = !IsHelper
triggerall = roundstate = 0
triggerall = 0
trigger1 = var(57) = 0
;trigger1 = var(59) = 1
trigger1 = var(57) := 6

;-------------------------------------------------------
[State -3, AI switch]
type = VarSet
Triggerall = !ishelper
Trigger1 = RoundState > 2
Trigger2 = Life = 0
var(59) = 0

[State -3, AI switch]
type = VarSet
Triggerall = !ishelper
Trigger1 = RoundState <= 2
Trigger1 = Life > 0
;trigger1 = MoveHit || EnemyNear,MoveType=H
var(59) = 1


;---------------------------------------------------------------------------------
;可控/空振 var(17)
;---------------------------------------------------------------------------------
[State -3]
Type = varSet
triggerall = !IsHelper
Trigger1 = 1
var(17) = 0
IgnoreHitPause = 1

;-------------------------------------------------------
;可控状态
[State -3]
Type = varSet
triggerall = !IsHelper
Trigger1 = Ctrl 
Trigger2 = StateNo = 18  || (StateNo = 52 && animelem = 1, >= 1)
Trigger3 = StateNo = 19 || (StateNo = [98,102]) || (StateNo = [10,12]) 
Trigger4 = StateNo = 1002 && AnimTime = -1;最速用，不切换到state0
Trigger5 = StateNo = 1310 && AnimTime = -1;最速用，不切换到state0
Trigger6 = StateNo = 52
Trigger7 = StateNo = 1302 && AnimTime = -1
Trigger8 = StateNo = [120,149]
Trigger9 = StateNo = 361 && AnimTime = -1
Trigger10= StateNo = 1501 && AnimTime = -1
Trigger11= StateNo = 1855 && AnimTime = -1
Trigger12= StateNo = 5201 && AnimTime = -1
Trigger13= StateNo = 5120 && AnimTime = -1
var(17) = 1
IgnoreHitPause = 1

;-------------------------------------------------------
;普通技能
[State -3]
Type = varSet
triggerall = !IsHelper
Triggerall = MoveType != H
Trigger1 = StateNo = 205 && AnimElemTime(2) >= 1 
Trigger2 = StateNo = 210 && anim = 211 && AnimElemTime(4) >= 1
Trigger3 = StateNo = 215 && AnimElemTime(3) >= 1
Trigger4 = StateNo = 220 && AnimElemTime(6) >= 1
;近重拳命中
Trigger5 = 0;太容易不命中了
Trigger5 = MoveContact 
Trigger5 = StateNo = 225 && AnimElemTime(4) >= 1
;近重拳未命中
Trigger6 = StateNo = 225 && AnimElemTime(2) >= 1
;
Trigger7 = StateNo = 230 && AnimElemTime(5) >= 1
Trigger8 = StateNo = 235 && AnimElemTime(5) >= 1
Trigger9 = StateNo = 400 && AnimElemTime(2) >= 1 
Trigger10= StateNo = 420 && AnimElemTime(5) >= 1 
trigger11= stateno = 430 && animelemTime(3) >= 1
var(17) = 2
IgnoreHitPause = 1
;-------------------------------------------------------
;特殊技
[State -3]
Type = varSet
triggerall = !IsHelper
Triggerall = MoveType != H
Trigger1 = StateNo = 364 && AnimElemTime(4) >= 1
trigger2 = anim = 302
trigger2 = stateno = 300 && animelemTime(9) >= 0
trigger3 = stateno = 301 && animelemTime(7) >= 0
Trigger4 = StateNo = 240 && Animelem = 7,>0
Trigger5 = StateNo = 241 && Animelem = 7,>0
var(17) = 3
IgnoreHitPause = 1
;-------------------------------------------------------
;空中技能
[State -3]
Type = varSet
triggerall = !IsHelper
Triggerall = MoveType != H
Trigger1 = StateNo = 246 && AnimElemTime(1) >= 1
Trigger2 = StateNo = 600 && AnimElemTime(2) >= 1
;
Trigger3 = StateNo = 610 && AnimElemTime(2) >= 1
Trigger3 = Anim = 611
;
Trigger4 = StateNo = 620 && AnimElemTime(7) >= 1
Trigger4 = Anim = 627
;
Trigger5 = StateNo = 630 && AnimElemTime(5) >= 1
;
Trigger6 = StateNo = 640 && AnimElemTime(4) >= 1
Trigger6 = Anim = 641
;
Trigger7 = StateNo = 310 && AnimElemTime(9) >= 1
Trigger8 = StateNo = 320 && AnimElemTime(10) >= 1
var(17) = 4
IgnoreHitPause = 1
;-------------------------------------------------------
;DC可能
[State -3]
Type = varSet
triggerall = !IsHelper
Triggerall = MoveType != H
;空中乱舞
Trigger1 = stateno = 2009 && animelem = 64,>0 && movehit
;地面乱舞 重脚版
Trigger2 = stateno = 2008 && animelem = 46,>0
;空中MAX乱舞
Trigger3 = stateno = 2208 && animelem = 73,>=2 && movehit
;地面max乱舞
Trigger4 = stateno = 2206
;地面乱舞 轻脚版
Trigger5 = stateno = 2006
var(17) = 5
IgnoreHitPause = 1

;空中可控
[State -3]
Type = varSet
triggerall = !IsHelper
Triggerall = MoveType != H
TriggerAll = StateType = A 
Trigger1 = Ctrl
Trigger2 = stateno = 50
Trigger3 = stateno = 950
var(17) = 6
IgnoreHitPause = 1

[State -3]
Type = varSet
triggerall = !IsHelper
Trigger1 = MoveType = H
Trigger2 = StateType = L
Trigger3 = StateNo = [150,155]
var(17) = 0
IgnoreHitPause = 1

;---------------------------------------------------------------------------------
[State -3,霸气/飞翔脚次数重置用]
type = VarSet
Triggerall = !ishelper
Trigger1 = EnemyNear,MoveType = I
Trigger2 = EnemyNear,StateType = L
Trigger3 = EnemyNear,MoveType != H
Trigger4 = EnemyNear,Ctrl
var(15) = 0

[State -3, BUG, 不知道什么代码会给CtrlSet]
type = CtrlSet
Triggerall = var(59)
Triggerall = RoundState = 2
Triggerall = !ishelper
Triggerall = StateNo = 0
Trigger1 = InGuardDist
Trigger2 = EnemyNear,MoveType = H
Trigger3 = EnemyNear,StateType = A
Trigger4 = EnemyNear,StateType = L
Trigger5 = EnemyNear,StateNo = [200,4999]
Trigger6 = EnemyNear,MoveType = A
Trigger7 = EnemyNear,Ctrl
Trigger8 = EnemyNear,StateType=C
Trigger9 = EnemyNear,Vel x != 0
Trigger10= EnemyNear,Vel y != 0
value = 1
IgnoreHitPause = 1

;=================================================================================
;抢招9
;=================================================================================
[State -3,近隐藏凤凰脚]
Type = ChangeState
value = 2650
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
triggerall = power >= 2000 || (power >= 1000 && prevstateno != [0,1999])
triggerall = statetype != A
TriggerAll = Ctrl
TriggerAll = EnemyNear,MoveType = A
Triggerall = p2bodydist x = [-28,28]
;对地
Trigger1 = EnemyNear,Life <= 300
Trigger1 = EnemyNear,StateNo = [200,999]
Trigger1 = EnemyNear,time <= 2
Trigger1 = var(50) := 265091
IgnoreHitPause = 1

[State -3,C投]
Type = ChangeState
value = 800
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 1
TriggerAll = StateNo != 99
TriggerAll = StateType != A
TriggerAll = EnemyNear,MoveType != H && EnemyNear,StateType != A && EnemyNear,StateType != L
TriggerAll = (abs(P2BodyDist X) <= 20)
TriggerAll = EnemyNear,StateNo != 52
TriggerAll = EnemyNear,StateNo != [5000,5999]
TriggerAll = EnemyNear,Vel Y = 0
;抢普通技能
Trigger1 = EnemyNear,MoveType = A
Trigger1 = EnemyNear,Time <= 2 && EnemyNear,StateNo = [200,999]
Trigger1 = var(50) := 80031
;抓不到的硬直
Trigger2 = EnemyNear,MoveType = A || EnemyNear,MoveType = I
Trigger2 = EnemyNear,AnimTime >= -2
Trigger2 = var(50) := 80032
;抢当身技能
Trigger3 = EnemyNear,MoveType = A
Trigger3 = var(47) = 1
Trigger3 = EnemyNear,Time <= 2 
Trigger3 = var(50) := 80031
;
Trigger4 = EnemyNear,MoveType=I
Trigger4 = EnemyNear,StateNo=[0,30)
Trigger4 = P2BodyDist x<20
Trigger4 = var(50) := 80032
IgnoreHitPause = 1


[State -3,近重拳抢招]
Type = ChangeState
value = 225
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = Ctrl
TriggerAll = StateType != A
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,StateType != A
Triggerall = p2bodydist x = [-58,28]
Triggerall = var(47)=0;不能是当身
;对地
Trigger1 = EnemyNear,StateNo = [200,999]
Trigger1 = EnemyNear,StateNo = Helper(33000),var(2)
Trigger1 = enemynear,time < Helper(33000),var(3)-1
Trigger1 = var(50) := 22591
;没记录就直接抢
Trigger2 = EnemyNear,StateNo = [200,999]
Trigger2 = EnemyNear,Time-EnemyNear,AnimTime>22
Trigger2 = EnemyNear,time <= 1
Trigger2 = var(50) := 22592
;没记录就直接抢
Trigger3 = EnemyNear,StateNo=[200,999]
Trigger3 = EnemyNear,time<=2
Trigger3 = var(50) := 22593
;没记录就直接抢
Trigger4 = EnemyNear,StateNo=[1000,1999]
Trigger4 = EnemyNear,time=[2,3]
Trigger4 = var(50) := 22594
IgnoreHitPause = 1

[State -3,蹲轻拳抢招]
Type = ChangeState
value = 400
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = Ctrl
TriggerAll = StateType != A
TriggerAll = EnemyNear,MoveType = A
Triggerall = p2bodydist x < 43
Triggerall = var(47)=0;不能是当身
;对地
Trigger1 = EnemyNear,StateType != A
Trigger1 = EnemyNear,StateNo = [200,999]
Trigger1 = EnemyNear,StateNo = Helper(33000),var(2)
Trigger1 = enemynear,time < Helper(33000),var(3)-5
Trigger1 = var(50) := 40091
IgnoreHitPause = 1

[State -3,轻拳抢招]
Type = ChangeState
value = 200
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = Ctrl
TriggerAll = StateType != A
TriggerAll = EnemyNear,MoveType = A
Triggerall = p2bodydist x < 76
Triggerall = var(47)=0;不能是当身
;对地
Trigger1 = EnemyNear,StateType != A
Trigger1 = EnemyNear,StateNo = [1000,1999]
Trigger1 = EnemyNear,StateNo = Helper(33000),var(2)
Trigger1 = enemynear,time < Helper(33000),var(3)-5
Trigger1 = EnemyNear,Vel x = 0
Trigger1 = var(50) := 20091
IgnoreHitPause = 1

;=================================================================================
;抓硬直8
;=================================================================================
[State -3]
type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 1
TriggerAll = StateType != A 
Triggerall = !InGuardDist||EnemyNear,Facing=Facing||(!EnemyNear,NumProj&&!PlayerIdExist(Helper(33333333),var(3)))
Trigger1 = P2BodyDist x<135
Trigger1 = EnemyNear,StateNo=[1000,1999]
Trigger1 = EnemyNear,Time>-EnemyNear,AnimTime
Trigger1 = EnemyNear,MoveType=A||EnemyNear,MoveType=I 
Trigger1 = EnemyNear,AnimTime<-18
value = ifelse(P2BodyDist x >= 80, 68, 63)

[State -3,普通抓硬直]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2 
TriggerAll = !IsHelper
TriggerAll = var(17)=1
TriggerAll = StateType != A 
TriggerAll = !InGuardDist || EnemyNear,Facing = Facing || (EnemyNear,Time>(-EnemyNear,AnimTime*2))
TriggerAll = !((EnemyNear,StateNo = [0,29]) || EnemyNear,StateNo = [69,102]) 
TriggerAll = !EnemyNear,Ctrl
TriggerAll = EnemyNear,MoveType != H
TriggerAll = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
TriggerAll = !PlayerIdExist(Helper(33333333),var(3)) || abs(PlayerId(Helper(33333333),var(3)),pos x-pos x) > 50 || EnemyNear,Facing = Facing
TriggerAll = (Helper(33334),var(3)&2**0) = 0 && (Helper(33334),var(3)&2**1) = 0 ;不能是落地受身/气AB
TriggerAll = EnemyNear,StateNo != 5120
Triggerall = EnemyNear,StateNo>=1000
;近重拳
Trigger1 = P2BodyDist X=[0,28]
Trigger1 = EnemyNear,animtime <= -2
Trigger1 = var(54) := 225
Trigger1 = var(50) := 22581
;蹲轻拳
Trigger2 = P2BodyDist x=[0,42]
Trigger2 = EnemyNear,animtime = [-6,-5]
Trigger2 = var(54) := 400
Trigger2 = var(50) := 40081 
;
Trigger3 = !(PlayerIdExist(Helper(33333333),var(3))||EnemyNear,NumProj)
Trigger3 = P2BodyDist x=[0,76]
Trigger3 = EnemyNear,animtime = [-6,-5]
Trigger3 = var(54) := 200
Trigger3 = var(50) := 20081 
;蹲重脚
Trigger4 = !(PlayerIdExist(Helper(33333333),var(3))||EnemyNear,NumProj)
Trigger4 = var(17) = 1
Trigger4 = EnemyNear,AnimTime = [-8,-7]
Trigger4 = P2BodyDist x = [48,75]
Trigger4 = var(54) := 430
Trigger4 = var(50) := 43081
value = var(54)

[State -3,破防硬直]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2 
TriggerAll = !IsHelper
TriggerAll = !InGuardDist
TriggerAll = EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo = 5700
TriggerAll = StateType != A
;BC接破防
Trigger1 = var(17) = 2
Trigger1 = var(7) = 0 && Power >= 2000
Trigger1 = var(50) := 400081
Trigger1 = var(54) := 4000
;近重拳
Trigger2 = var(17) = 1 
Trigger2 = (abs(P2BodyDist X) <= 28)
Trigger2 = EnemyNear,Time < 20
Trigger2 = var(54) := 225
Trigger2 = var(50) := 22582
;蹲轻拳
Trigger3 = var(17) = [1,2]
Trigger3 = EnemyNear,Time = [16,18]
Trigger3 = P2BodyDist x < 72
Trigger3 = var(54) := 200
Trigger3 = var(50) := 20082
value = var(54)




[State -3,补充，一切不被考虑情况]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2 
TriggerAll = !IsHelper
TriggerAll = !InGuardDist
TriggerAll = EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo = 5700
TriggerAll = StateType != A
Triggerall = var(17) = 1
;
Trigger1 = !InGuardDist
Trigger1 = !EnemyNear,Ctrl
Trigger1 = EnemyNear,StateType=S||EnemyNear,StateType=C
Trigger1 = EnemyNear,StateNo>=200
Trigger1 = P2BodyDist X=[0,28]
value = 225

;=================================================================================
;切返7
;原地闪避没写
;=================================================================================
[State -3]
type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 1
Triggerall = EnemyNear,HitDefAttr = SCA, AT
;
Trigger1 = EnemyNear,Time<-EnemyNear,AnimTime||EnemyNear,AnimTime>0
Trigger1 = EnemyNear,StateType!=A
Trigger1 = var(50):=6071
value = 60


[State -3]
Type = changestate
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 1
Triggerall = StateNo!=[98,102]
TriggerAll = StateType != A 
TriggerAll = EnemyNear,Vel x>=0
Triggerall = EnemyNear,NumProj=0
;先前跑，为后面闪避准备
Trigger1 = EnemyNear,StateNo=[1000,1999]
Trigger1 = EnemyNear,MoveType=A&&EnemyNear,Time<=2
Trigger1 = P2BodyDist x > 75
value = 99

[State -3,前滚]
Type = changestate
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 1
TriggerAll = StateType != A 
TriggerAll = EnemyNear,Vel x >= 0
TriggerAll = EnemyNear,facing != facing
;攻击的前闪避
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,Time<-EnemyNear,AnimTime 
;不能是投技
TriggerAll = !(EnemyNear,HitDefAttr = SCA, AT)
TriggerAll = Helper(33000),var(11) != 3
Triggerall = EnemyNear,animtime<-36
;穿敌人 非弹幕技能
Trigger1 = !(PlayerIdExist(Helper(33333333),var(3))||EnemyNear,NumProj)
Trigger1 = P2BodyDist x <= 165
Trigger1 = EnemyNear,StateNo = [1000,4999]
Trigger1 = var(50) := 36171
;穿敌人 弹幕技能
Trigger2 = PlayerIdExist(Helper(33333333),var(3))||EnemyNear,NumProj
Trigger2 = P2BodyDist x <= ifelse((StateNo=[98,102]),100,60)
Trigger2 = EnemyNear,StateNo = [1000,4999]
Trigger2 = var(50) := 36172
;穿对面跳跃
Trigger3 = EnemyNear,Facing!=Facing
Trigger3 = EnemyNear,MoveType=A
Trigger3 = EnemyNear,Vel Y<0
Trigger3 = Helper(33334),Fvar(14)>34
Trigger3 = EnemyNear,Vel X>0
Trigger3 = Helper(33334),fvar(15)>120
Trigger3 = P2BodyDist x<60
Trigger3 = var(50) := 36173
value = 361

[State -3,前滚]
Type = changestate
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 1
TriggerAll = StateType != A 
TriggerAll = EnemyNear,Vel x >= 0
TriggerAll = EnemyNear,facing != facing
Trigger1 = EnemyNear,MoveType=A
Trigger1 = EnemyNear,Pos Y<-75
Trigger1 = EnemyNear,Vel Y <0
Trigger1 = P2BodyDist x<35
Trigger1 = var(50) := 36176
value = 361

[State -3,耗气前滚]
Type = changestate
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A 
TriggerAll = Power >= 1000
TriggerAll = power >= 2500 || (Life < 200) || (EnemyNear,Life < 300 && Power >= 2000) || (EnemyNear,Life < 150) || EnemyNear,Life-Life > 350
TriggerAll = EnemyNear,StateType != A
TriggerAll = EnemyNear,MoveType = A && !EnemyNear,Ctrl
TriggerAll = StateNo = [150,152]
TriggerAll = EnemyNear,Vel x >= 0
;
Triggerall = EnemyNear,StateNo=[1000,4999]
Trigger1 = EnemyNear,AnimTime<-25
Trigger1 = P2BodyDist x<60
Trigger1 = var(50) := 36175
value = 361
IgnoreHitPause = 1


[State -3]
Type = Null;changestate
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 1
TriggerAll = StateType != A 
TriggerAll = EnemyNear,Vel x>=0
TriggerAll = EnemyNear,facing!=facing
Triggerall = EnemyNear,StateType!=A
;攻击的前闪避
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,Time<-EnemyNear,AnimTime 
;不能是投技
TriggerAll = !(EnemyNear,HitDefAttr = SCA, AT)
TriggerAll = Helper(33000),var(11) != 3
Triggerall = InguardDist
Triggerall = P2BodyDist x <= 120
Triggerall = EnemyNear,animtime<-37
;穿敌人
Trigger1 = EnemyNear,StateNo = [1000,4999]
Trigger1 = var(50) := 36371
value = 363

[State -3,飞燕斩 脚升龙]
Type = changestate
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A 
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,Vel x >= 0 ;类似Bloo这种空振后退的
TriggerAll = !(PlayerIdExist(Helper(33333333),var(3))||EnemyNear,NumProj)
;不能是骗当身
Triggerall = var(50) != 40032
;1段对空
Trigger1 = EnemyNear,Facing != Facing
Trigger1 = var(17) = [1,3]
Trigger1 = EnemyNear,StateType = A&&EnemyNear,StateNo != 5040
Trigger1 = P2BodyDist x-Helper(33334),fvar(11)*6 = [-20,30]
Trigger1 = EnemyNear,Pos Y+EnemyNear,Vel Y*6+Helper(33334),fvar(12)*6*(6+1)/2 = [-25, -1]
Trigger1 = var(50) := 102572
;切返普通技能
Trigger2 = EnemyNear,Facing != Facing
Trigger2 = (EnemyNear,Time<-EnemyNear,AnimTime)||EnemyNear,AnimTime > 0
Trigger2 = EnemyNear,StateType != C
Trigger2 = (Helper(33334),var(3)&2**2) = 0	;切返普通技能失败记录
Trigger2 = var(17) = [1,3]
Trigger2 = EnemyNear,StateNo = [200, 900]
Trigger2 = EnemyNear,Time <= 1
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x < 30
Trigger2 = EnemyNear,AnimTime <= -6 || EnemyNear,AnimTime > 0
Trigger2 = var(50) := 102574				;AI-Helper会使用到此值
;1段对空 版边
Trigger3 = EnemyNear,Facing != Facing
Trigger3 = var(17) = [1,3]
Trigger3 = EnemyNear,StateType = A && EnemyNear,StateNo != 5040
Trigger3 = BackEdgeBodyDist<=2
Trigger3 = P2BodyDist x-Helper(33334),fvar(11)*6<35
Trigger3 = EnemyNear,Pos Y+EnemyNear,Vel Y*6+Helper(33334),fvar(12)*6*(6+1)/2=[-30, -2]
Trigger3 = var(50) := 102572
;防止被抓硬直
Trigger4 = (EnemyNear,Time<-EnemyNear,AnimTime) || EnemyNear,AnimTime > 0
Trigger4 = var(17)=[2,3]
Trigger4 = EnemyNear,Time=[2,6]
Trigger4 = EnemyNear,StateNo=[200,4999]
Trigger4 = EnemyNear,StateType!=A
Trigger4 = P2BodyDist x<20
Trigger4 = var(50) := 102574
value = 1025

[State -3,飞燕斩 CD升龙]
Type = changestate
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A 
TriggerAll = EnemyNear,MoveType=A
TriggerAll = EnemyNear,Vel x >= 0 ;类似Bloo这种空振后退的
TriggerAll = !(PlayerIdExist(Helper(33333333),var(3))||EnemyNear,NumProj)
;不能是骗当身
Triggerall = var(50) != 40032
;切返必杀技技能
Trigger1 = EnemyNear,Facing != Facing
Trigger1 = (EnemyNear,Time<-EnemyNear,AnimTime) || EnemyNear,AnimTime > 0
Trigger1 = var(17) = [1,3]
Trigger1 = (EnemyNear,StateNo = [1000, 1999]) || EnemyNear,PrevStateNo = [150,153]
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x-Helper(33334),fvar(11)*9 < 45
Trigger1 = EnemyNear,Time>=6
Trigger1 = EnemyNear,AnimTime <= -9||EnemyNear,AnimTime > 0
Trigger1 = var(50) := 104071
;1段对空
Trigger2 = EnemyNear,Facing != Facing
Trigger2 = var(17) = [1,3]
Trigger2 = EnemyNear,StateType = A && EnemyNear,StateNo != 5040
Trigger2 = P2BodyDist x-Helper(33334),fvar(11)*9 = [-15, 50]
Trigger2 = EnemyNear,Pos Y + EnemyNear,Vel Y * 9 + Helper(33334),fvar(12) * 9 * (9 + 1) / 2 = [-60, -10]
Trigger2 = var(50) := 104072
;切返超杀技技能
Trigger3 = var(17) = [2,3]
Trigger3 = EnemyNear,StateNo >= 2000
Trigger3 = EnemyNear,StateType != A
Trigger3 = P2BodyDist x-Helper(33334),fvar(11)*9 < 65
Trigger3 = EnemyNear,Time>=4
Trigger3 = EnemyNear,AnimTime <= -6||EnemyNear,AnimTime>0
Trigger3 = var(50) := 104074
value = 1040

[State -3,飞燕斩 脚升龙 防止被抓硬直]
Type = changestate
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A 
TriggerAll = EnemyNear,MoveType = A
Trigger1 = EnemyNear,StateType!=A
;不能是骗当身
Triggerall = var(50) != 40032
Triggerall = (EnemyNear,Time<-EnemyNear,AnimTime) || EnemyNear,AnimTime > 0
Triggerall = EnemyNear,StateNo=[200,4999]
Triggerall = var(17)=[2,3]
Triggerall = EnemyNear,Time=[2,6]
;CD升龙
Trigger1 = P2BodyDist x<60
Trigger1 = var(50) := 104074
Trigger1 = var(54) := 1040
value = var(54)


[State -3,拳升龙]
Type = changestate
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A 
TriggerAll = EnemyNear,MoveType = A
TriggerAll = EnemyNear,Vel x >= 0 ;类似Bloo这种空振后退的
TriggerAll = EnemyNear,Facing != Facing
TriggerAll = (EnemyNear,Time < -EnemyNear,AnimTime) || EnemyNear,AnimTime > 0
TriggerAll = !(PlayerIdExist(Helper(33333333),var(3))||EnemyNear,NumProj)
;不能是骗当身
Triggerall = var(50) != 40032
;1段对空
Trigger1 = var(17) = [1,3]
Trigger1 = EnemyNear,StateNo=[1000,1999]
Trigger1 = EnemyNear,StateType!=A
Trigger1 = EnemyNear,Time>=6&&EnemyNear,Vel x=0&&EnemyNear,Vel Y=0
Trigger1 = EnemyNear,AnimTime<-10
Trigger1 = P2BodyDist x = [35,60]
Trigger1 = var(50) := 110571
value = 1105


[State -3,空中超杀]
Type = changestate
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType = A 
TriggerAll = EnemyNear,Vel x >= 0
TriggerAll = EnemyNear,Facing != Facing
TriggerAll = (EnemyNear,Time < -EnemyNear,AnimTime) || EnemyNear,AnimTime > 0
Triggerall = var(17)=6
;
Triggerall = Var(7)>0||Power>=1000
;
Trigger1 = InGuardDist
Trigger1 = EnemyNear,MoveType = A
Trigger1 = P2BodyDist x = [20,60]
Trigger1 = Pos Y=[-70,-50]
Trigger1 = EnemyNear,StateNo>=1000
Trigger1 = EnemyNear,AnimTime<-6
Trigger1 = var(50):=210071
value = 2100


;=================================================================================
;连段6
;强制倒地 追加小跳在用倒地追加试试
;=================================================================================

;-----------------------------------------------------------------------
;类似Dream Cancel
;空中乱舞不可以接 近隐藏
;-----------------------------------------------------------------------
[state -1];MAX 2 接续
type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2 
triggerall = !ishelper
triggerall = power >= 1000
triggerall = var(17) = 5
;xiii neo max伤害最高，可以直接终结
trigger1 = Life < EnemyNear,Life || EnemyNear,Life < 250
trigger1 = var(54) := 2800
;空中超杀，max超杀只能接远距离max2
trigger2 = stateno = 2208 || stateno = 2009
trigger2 = var(54) := ifelse(random%2=0,2800,2600)
;
trigger3 = stateno != 2208 && stateno != 2009
trigger3 = var(54) := ifelse(random < 200, 2800, ifelse(random < 750, 2600, 2650))
value = var(54)

;-----------------------------------------------------------------------
;超杀收尾
;-----------------------------------------------------------------------
[State -3,空中]
type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2 
triggerall = !ishelper
triggerall = (power >= 2000 && var(7) = 0) || (Power >= 1000 && var(7) > 0)
Triggerall = EnemyNear,Life < 250
Triggerall = StateType = A
Triggerall = MoveHit
Triggerall = EnemyNear,StateType = A
Triggerall = EnemyNear,MoveType = H
Trigger1 = StateNo = 1461 && AnimElemTime(10) >= 1
Trigger1 = var(54) := 2210
Trigger2 = StateNo = 1381&&AnimElemTime(13) >= 1
Trigger2 = var(54) := 2300
value = var(54)

[State -3,空中]
type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2 
triggerall = !ishelper
triggerall = (power >= 1000 && var(7) = 0) || (var(7) > 0)
triggerall = EnemyNear,Life < 100
triggerall = StateType = A
triggerall = MoveHit
triggerall = EnemyNear,StateType = A
triggerall = EnemyNear,MoveType = H
Trigger1 = StateNo = 1461 && AnimElemTime(10) >= 1
Trigger1 = var(54) := 2001
Trigger2 = StateNo = 1381&&AnimElemTime(13) >= 1
Trigger2 = var(54) := 2100
value = var(54)


[State -3]
type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2 
triggerall = !ishelper
triggerall = (power >= 2000 && var(7) = 0) || (Power >= 1000 && var(7) > 0)
Trigger1 = EnemyNear,Life < 250
Trigger1 = StateType != A
Trigger1 = MoveHit
Trigger1 = EnemyNear,StateType != L
Trigger1 = EnemyNear,GetHitVar(Hittime) >= 15
Trigger1 = StateNo = [200,1999]
value = ifelse(EnemyNear,Life<150&&EnemyNear,StateType!=A,2600,ifelse(Random%2=0,2200,2800))

[State -3]
type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2 
triggerall = !ishelper
triggerall = (power >= 1000 && var(7) = 0) || (var(7) > 0)
Triggerall = var(7) = 0
Trigger1 = EnemyNear,Life < 100
Trigger1 = StateType != A
Trigger1 = MoveHit
Trigger1 = EnemyNear,GetHitVar(Hittime) >= 15
Trigger1 = StateNo = [200,1999]
Trigger1 = EnemyNear,StateType != L
value = ifelse(Random%2=0,2015,2060)


[State -3, 追地容易失败]
type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2 
triggerall = !ishelper
triggerall = numhelper(6510);crush
Triggerall = var(7) = 0 && Power >= 1000
Trigger1 = StateType != A
Trigger1 = MoveHit
Trigger1 = StateNo = 1850 && AnimElemTime(1) >= 1
Trigger1 = EnemyNear,StateType != A
Trigger1 = var(56) := ifelse(Power>=500,500,200)
value = ifelse(Helper(33334),fvar(15)<83,2060,2015)


;-----------------------------------------------------------------------
;BC连段1xxx
;非版边限定
;近C -> 三连击300连段 -> 重脚升龙 -> 流星落 -> 半月斩 -> 三连击301(有两段空挥) -> 空中乱舞/MAX乱舞
;-----------------------------------------------------------------------
;-----------------------------------------------------------------------
;BC连段2xxx
;非版边限定
;近C -> 脚升龙 -> 霸气脚 -> 灼火襲 -> 半月斩 -> 三连击一段 -> 半月斩 -> 拳升龙 
 -> 最后一段飞翔脚落地 -> 前行 -> 脚升龙 -> 最后一段02飞翔脚 -> 660快速落地
 -> 脚升龙 -> 最后一段02飞翔脚 -> 超杀
;-----------------------------------------------------------------------
;-----------------------------------------------------------------------
;BC连段3xxx 版边限定
;近C -> 霸气脚 -> 灼火襲 -> 三连击（1450->1455） -> 重半月斩 ->  空中的时候直接取消飞翔脚
-> 落地蹲重脚 -> 重半月斩 -> 重脚升龙（下降那个派生)循环几次之后 目押超杀
;这个超杀可以是地面乱舞、空中乱舞、地面飞天脚，地面飞天脚可以进入无限飞翔脚连段
;-----------------------------------------------------------------------
;-----------------------------------------------------------------------
;BC连段4xxx 比较单一
;触发条件
;4000
;近C -> 三连击300 -> 升龙 -> 三连击 -> 半月斩 -> 飞天脚 -> 跳浮空追击
;4001
;近C -> 三连击300 -> 升龙 -> 三连击 -> 1461接空中超杀
;-----------------------------------------------------------------------
;-----------------------------------------------------------------------
;BC连段5xxx 
;红BC -> 三连击目押 -> 飞翔脚 循环 最后超杀
;-----------------------------------------------------------------------
;-----------------------------------------------------------------------
;1xx
;空中普通技能->02飞翔脚->空中下C->非版边 地面半月斩
;							  ->版边   三连击 var(56)切换至3xx
;-----------------------------------------------------------------------
;-----------------------------------------------------------------------
;2xx 版边限定
;飞天脚->无限轻飞翔脚->02飞翔脚（没气）var(56)变更1xx
;					 ->空中超杀
;-----------------------------------------------------------------------
;-----------------------------------------------------------------------
;各种三连击 3xx
;三连击   1)   ↓←     +     X/Y      1450（EX Version XY）
;
;			2)   ↓←     +     X/Y      1455
;				-3)   ↓←     +     X        1465
;               -3)   ↓←     +     Y        1462
;               	-4)   ↓←     +     X/Y      1461   (MIX)hvar(5) > 0
;
;           2)   ↗       +     A/B      1470   (MIX)hvar(5) > 0
;               -3)   ↓      +     A/B      1471
;               -3)   ↓←     +     X/Y      1461


;var(56)=300 1450 -> 1455 -> 1465 -> 1461 伤害最高
;var(56)=301 1450 -> 1455 -> 1462 -> 1461
;var(56)=302 1450 -> 1470 -> 1471
;var(56)=303 1450 -> 1470 -> 1461
;-----------------------------------------------------------------------
;-----------------------------------------------------------------------
;4xx 无限霸气脚
;
;-----------------------------------------------------------------------
;-----------------------------------------------------------------------
;5xx 全勋踩头
;-----------------------------------------------------------------------
;-----------------------------------------------------------------------
;简单连段
;6xx  02飞翔脚->660
;7xx  空置中
;8xx  轻攻击->重升龙取消->地面重半月斩
;-----------------------------------------------------------------------
;-----------------------------------------------------------------------
;浮空追击1X
;11 脚升龙追击
;12 拳升龙追击
;13 三连击追击
;14 近重拳
;15 全勋超杀追击
;16 半月斩追击浮空


;
;-----------------------------------------------------------------------


[State -3, Reset]
type = varset
trigger1 = roundstate < 2
Trigger2 = EnemyNear,MoveType != H
var(56) = 0

[State -3, 连段选择]
type = Null
TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = !isHelper
triggerall = EnemyNear,MoveType = H
Triggerall = var(56) = 0
;无限霸气脚
Trigger1 = var(17)=2&&MoveHit
Trigger1 = !(StateNo=225&&AnimElemTime(3)>=1)
Trigger1 = P2BodyDist x-helper(33334),fvar(11)*9<55||Helper(33334),fvar(15)<83||(P2BodyDist x < 52 && EnemyNear,BackEdgeBodyDist <= 1)
Trigger1 = EnemyNear,StateType != A
Trigger1 = Power<1000
Trigger1 = Life<=EnemyNear,Life
Trigger1 = var(56) := 400
;红BC
Trigger2 = StateNo=660&&MoveHit
Trigger2 = StateType=A
Trigger2 = EnemyNear,Life>400
Trigger2 = Life<200
Trigger2 = var(56) := ifelse(Helper(33334),Fvar(15)<83,ifelse(Power>=500,500,200),12)
;BC连段3xxx 版边限定
;版边,血量差距极大的时候3xxx用霸气脚收尾，转其他无限连
Trigger3 = StateNo = 225 && MoveHit
Trigger3 = StateType != A
Trigger3 = EnemyNear,StateType != A
Trigger3 = Helper(33334),fvar(15) < 180
Trigger3 = Power >= 2000
Trigger3 = var(56) := ifelse(Random<500,2000,3000)
;BC连段4xxx 比较单一
;远离版边且血/气量远大于对方
Trigger4 = Power >= 2000
Trigger4 = EnemyNear,Power < 500 && EnemyNear,Life < Life-500
Trigger4 = StateNo = 225 && MoveHit
Trigger4 = StateType != A
Trigger4 = EnemyNear,StateType != A
Trigger4 = Helper(33334),fvar(15) >= 135
Trigger4 = var(56) := 4001
;BC连段1xxx 前版边距离足够长
Trigger5 = Power >= 2000
Trigger5 = StateNo = 225 && MoveHit
Trigger5 = StateType != A
Trigger5 = EnemyNear,StateType != A
Trigger5 = Helper(33334),fvar(15) >= 300
Trigger5 = var(56) := ifelse(Life-EnemyNear,Life>=400,4001,1000)
;BC连段1xxx，BC兜底用
Trigger6 = Power >= 2000
Trigger6 = StateNo = 225 && MoveHit
Trigger6 = StateType != A
Trigger6 = EnemyNear,StateType != A
Trigger6 = var(56) := 1000
;版边三连击->飞天脚
Trigger7 = Power = [900,2000)
Trigger7 = Helper(33334),fvar(15) < 100
Trigger7 = EnemyNear,Life >= 300
Trigger7 = StateNo = 225 && MoveHit
Trigger7 = StateType != A
Trigger7 = EnemyNear,StateType != A
Trigger7 = var(56) := 305
;3xx 三连击
;版边可以用302，非版边随机
Trigger8 = StateNo = 225 && MoveHit
Trigger8 = StateType != A
Trigger8 = EnemyNear,StateType != A
Trigger8 = P2BodyDist x <= 40
Trigger8 = P2BodyDist x-Helper(33334),fvar(11)*9<55
Trigger8 = var(56) := Ifelse(EnemyNear,StateType=C,300,ifelse(Helper(33334),fvar(15)<120,302,(300+random%4)))
;3xx 三连击
Trigger9 = P2BodyDist x <= 40
Trigger9 = P2BodyDist x-Helper(33334),fvar(11)*9<60 || EnemyNear,StateType = C
Trigger9 = Helper(33334),fvar(15) >= 90
Trigger9 = (StateNo = 400 || StateNo = 205) && MoveHit
Trigger9 = StateType != A
Trigger9 = EnemyNear,StateType != A
Trigger9 = var(56) := Ifelse(EnemyNear,StateType=C,300,ifelse(Helper(33334),fvar(15)<120,300,(300+random%4)))
;太远了就流星落
Trigger10 = var(17) = [2,3]
Trigger10 = MoveHit && EnemyNear,GetHitVar(Hittime) >= 17
Trigger10 = StateType != A
Trigger10 = EnemyNear,StateType != A
Trigger10 = var(56) := 700
;660对应
Trigger11 = StateNo=660&&MoveHit
Trigger11 = StateType=A
Trigger11 = EnemyNear,Life>400
Trigger11 = Life<200
Trigger11 = var(56) := ifelse(Helper(33334),Fvar(15)<83,ifelse(Power>=500,500,200),12)
;320对应，太远就接不上目押近重拳了,接空中半月斩
Trigger12 = EnemyNear,StateType != A && EnemyNear,MoveType = H
Trigger12 = StateNo = 320 && AnimElemTime(4)>=0 && MoveHit
Trigger12 = Helper(33334),Fvar(15) >= 78 && P2BodyDist x >= 20 
Trigger12 = var(56) := 900
;辅助击飞
Trigger13 = EnemyNear,StateType = A && EnemyNear,MoveType = H
Trigger13 = EnemyNear,StateNo=6006
Trigger13 = var(56) := 13
;李梅命中
Trigger14 = EnemyNear,MoveType = H && Helper(6050),MoveHit
Trigger14 = var(56) := 902
IgnoreHitPause = 1

[State -3,补充BUG用]
type = Null
TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = !isHelper
triggerall = EnemyNear,MoveType = H
;
Trigger1 = var(56) = 0
Trigger1 = NumTarget(2060)&&Helper(33334),Fvar(15)<90
Trigger1 = var(56):=200
;
Trigger2 = StateNo=4000
Trigger2 = var(56)<1000
Trigger2 = var(56):=ifelse(Helper(33334),fvar(15)<83,3000, ifelse(EnemyNear,Life<Life,4000,(1000+1000*(random%2))))
;
Trigger3 = var(56) = 0
Trigger3 = var(7) > 0
Trigger3 = MoveHit
Trigger3 = var(56):= 4001
IgnoreHitPause = 1

[State -3, BC中超杀取消时机]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = !isHelper
triggerall = EnemyNear,MoveType = H
Triggerall = MoveHit && StateNo=[1000,1999]
Triggerall = var(7)=(0,100]
;
Trigger1 = StateType=A
Trigger1 = Power>=2000
Trigger1 = var(54) := 2210
;
Trigger2 = StateType=A
Trigger2 = Power>=1000
Trigger2 = StateNo = 1381 && Movehit && AnimElemTime(13) >= 1
Trigger2 = var(54) := ifelse(random < 500, 2300, 2001)
;
Trigger3 = StateType=A
Trigger3 = Power<1000
Trigger3 = StateNo = 1381 && Movehit && AnimElemTime(13) >= 1
Trigger3 = var(54) := ifelse(random < 500, 2100, 2001)
;
Trigger4 = StateType=A
Trigger4 = Power>=1000
Trigger4 = var(54) := ifelse(random < 500, 2210, 2001)
;
Trigger5 = StateType=A
Trigger5 = Power<1000
Trigger5 = var(54) := 2001
;
Trigger6 = StateType!=A
Trigger6 = Power>=2000
Trigger6 = var(54) := 2200
;
Trigger7 = StateType!=A
Trigger7 = Power>=1000
Trigger7 = Helper(33334),fvar(15) < 100
Trigger7 = var(54) := 2060
Trigger7 = var(56) := 5000
;
Trigger8 = StateType!=A
Trigger8 = Power>=1000
Trigger8 = Helper(33334),fvar(15) >= 100
Trigger8 = var(54) := ifelse(random < 500, 2015, 2200)
Trigger8 = var(56) := 5000
;
Trigger9 = StateType!=A
Trigger9 = Power<1000
Trigger9 = Helper(33334),fvar(15) < 100
Trigger9 = var(54) := 2060
Trigger9 = var(56) := 200
;
Trigger10 = StateType!=A
Trigger10 = Power<1000
Trigger10 = Helper(33334),fvar(15) >= 100
Trigger10 = var(54) := ifelse(random < 500, 2015, 2060)
;
Trigger11 = StateType!=A
Trigger11 = var(54):= 2000
;
Trigger12 = StateType=A
Trigger12 = var(54):= 2001
value = var(54)

[State -3,连段test用]
type = varset
Triggerall = var(59) = 0
trigger1 = roundstate < 2
Trigger2 = EnemyNear,MoveType != H
var(56) = 2000



;-----------------------------------------------------------------------
;轻拳轻脚用
;-----------------------------------------------------------------------
[State -3]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = !isHelper
Triggerall = EnemyNear,MoveType = H
Triggerall = EnemyNear,StateType != A
Triggerall = (StateNo = 400 || StateNo = 410) && MoveGuarded
;
Trigger1 = P2BodyDist x-5*Helper(33334),fvar(11) < 45 
Trigger1 = var(50) := 41061
;
value = 410

[State -3]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = !isHelper
Triggerall = EnemyNear,MoveType = H
Triggerall = EnemyNear,StateType != A
Triggerall = StateNo = 410 && MoveGuarded
;
Trigger1 = P2BodyDist x-5*Helper(33334),fvar(11) < 72
Trigger1 = var(50) := 20061
;
value = 200

[State -3]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = !isHelper
Triggerall = EnemyNear,MoveType = H
Triggerall = EnemyNear,StateType != A
Triggerall = (StateNo = 400 || StateNo = 410) && MoveContact
;
Trigger1 = P2BodyDist x-5*Helper(33334),fvar(11) < 40 
Trigger1 = var(50) := 40061
;
value = 400

;-----------------------------------------------------------------------
;-----------------------------------------------------------------------
;BC连段
;-----------------------------------------------------------------------
;-----------------------------------------------------------------------
[State -3]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A 
TriggerAll = EnemyNear,MoveType = H && EnemyNear,StateType != A
TriggerAll = EnemyNear,StateNo >= 5000
Triggerall = MoveHit
;不能是李梅援助攻击命中，容易击飞断连
Triggerall = !(Helper(6050),MoveHit)
Triggerall = Power >= 2000 && var(7) <= 0
Trigger1 = StateNo = 241 && AnimElemTime(7) >= 1
;
Trigger2 = var(17) = 2 && MoveHit && EnemyNear,GetHitVar(Hittime) >= 12
Trigger2 = P2BodyDist x >= 55
;
Trigger3 = StateNo=225&&AnimElemTime(2)>=1&&P2BodyDist x>25&&Helper(33334),Fvar(15)>83
value = 4000

[State -3,小跳]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A 
TriggerAll = EnemyNear,MoveType = H && EnemyNear,StateType != A
TriggerAll = EnemyNear,StateNo >= 5000
Triggerall = EnemyNear,StateType=S||Helper(33334),Fvar(15)<73
Triggerall = var(17) = 1
Trigger1 = var(7) >= 990
Trigger1 = var(50) := 6361
value = 63

[State -3,JD]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType = A 
TriggerAll = EnemyNear,MoveType = H && EnemyNear,StateType != A
TriggerAll = EnemyNear,StateNo >= 5000
Triggerall = Ctrl || StateNo = 50 || StateNo = 950 || var(17)=6
Triggerall = Helper(33334),Fvar(13)>8
Triggerall = P2BodyDist x-vel x*8-Helper(33334),fvar(11)*8 < 40 || EnemyNear,BackEdgeBodyDist <= 1 || FrontEdgeBodyDist < 63
Triggerall = Vel Y >= 0
Trigger1 = EnemyNear,GetHitVar(HitTime) = [8,10]
Trigger1 = var(50):=63062
Trigger2 = pos Y+vel y*8+const(movement.yaccel)*8*9/2>=-50
Trigger2 = var(50):=63061
value = 630
;-----------------------------------------------------------------------
;BC连段1xxx
;非版边限定
;近C -> 三连击300连段 -> 重脚升龙 -> 流星落 -> 半月斩 -> 三连击301(有两段空挥) -> 空中乱舞/MAX乱舞
;-----------------------------------------------------------------------
[State -3, 三连击300]
type = varset
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 1
Trigger1 = StateNo = 225 && MoveHit
Trigger1 = var(7) > 0
var(56) = 1300
IgnoreHitPause = 1

[State -3, 1465->重升龙]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 1
Trigger1 = StateNo = 1465 && MoveHit
Trigger1 = var(7) > 0
value = 1025

[State -3, 重升龙->流星落]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 1
Trigger1 = StateNo = 1025 && Movehit
Trigger1 = var(7) > 0
value = 1605

[State -3, 流星落->半月斩]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 1
Trigger1 = StateNo = 1606 && Movehit
Trigger1 = var(7) > 0
value = 1205

[State -3, 半月斩->三连击空挥]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 1
Trigger1 = StateNo = 1207 && AnimElemTime(2) >= 1
Trigger1 = var(7) > 0
value = 1450

[State -3, 三连击300]
type = varset
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 1
Trigger1 = StateNo = 1207 && MoveHit
Trigger1 = var(7) > 0
var(56) = 1303
IgnoreHitPause = 1

[State -3,三连击->空中乱舞]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 1
Triggerall = (StateNo=1461&&MoveHit&&AnimElemTime(10)>=1)||(StateNo=1470&&MoveHit&&AnimElemTime(7)>=1)
Triggerall = var(7) > 0
Triggerall = StateType=A
;
Trigger1 = Power >= 2000; 必然max乱舞->max2
Trigger1 = var(54) := 2210
;
Trigger2 = Power >= 1000
Trigger2 = var(54) := ifelse(random < 500, 2210, 2001)
;
Trigger3 = Power < 1000
Trigger3 = var(54) := 2001
value = var(54)

;-----------------------------------------------------------------------
;BC连段2xxx
;非版边限定
;近C -> 脚升龙 -> 霸气脚 -> 灼火襲 -> 半月斩 -> 三连击一段 -> 半月斩 -> 拳升龙 
 -> 最后一段飞翔脚落地 -> 前行 -> 脚升龙 -> 最后一段02飞翔脚 -> 660快速落地
 -> 脚升龙 -> 最后一段02飞翔脚 -> 超杀
;-----------------------------------------------------------------------
[State -3, 重脚升龙]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 2
Triggerall = var(7) > 0
Triggerall = StateType != A
;取消
Trigger1 = StateNo = 225 && MoveHit
;目押
Trigger2 = var(17) = 1
Trigger2 = EnemyNear,MoveType = H && EnemyNear,StateType = A
Trigger2 = (P2BodyDist x-Helper(33334),fvar(11)*12 = [0, 70])||(Helper(33334),Fvar(11)>0&&BackEdgeBodyDist<=2)
Trigger2 = EnemyNear,pos y+EnemyNear,Vel Y*12+helper(33334),fvar(12)*12*(12+1)/2=[-65,-25)
;
Trigger3 = var(17) = 1
Trigger3 = EnemyNear,MoveType = H && EnemyNear,StateType = A
Trigger3 = (P2BodyDist x-Helper(33334),fvar(11)*6 = [-10, 45])||(Helper(33334),Fvar(11)>0&&BackEdgeBodyDist<=2)
Trigger3 = EnemyNear,pos y+EnemyNear,Vel Y*6+helper(33334),fvar(12)*6*(6+1)/2=[-35,-20)
value = 1025

[State -3, 重升龙->霸气脚]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 2
Triggerall = var(7) > 0
Trigger1 = EnemyNear,StateType != A
Trigger1 = StateNo = 1025 && Movehit
value = 1500

[State -3, 霸气脚->灼火襲]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 2
Triggerall = var(7) > 0
Trigger1 = EnemyNear,StateType != A
Trigger1 = StateNo = 1500 && Movehit
value = 1800

[State -3, 半月斩]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 2
Triggerall = var(7) > 0
;取消灼火襲
Trigger1 = StateNo = 1800 && Movehit && AnimElemTime(15) >= 1
Trigger1 = var(54) := 1200
;三连击
Trigger2 = StateNo = 1450 && Movehit
Trigger2 = var(54) := 1205
value = var(54)

[State -3, 三连击]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 2
Triggerall = var(7) > 0
;取消半月斩
Trigger1 = StateNo = 1202 && Movehit
value = 1450

[State -3, 拳升龙]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 2
Triggerall = var(7) > 0
;取消三连击
Trigger1 = StateNo = 1207 && AnimElemTime(1)>=1
value = 1105


[State -3, 02飞翔脚]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 2
Triggerall = var(7) > 0
;取消拳升龙，摸到就取消
Trigger1 = StateNo = 1106 && Movehit && AnimElemTime(10) >= 1
;取消脚升龙最后一段
Trigger2 = StateNo = 1026 && AnimElemTime(3) >= 1
value = 1380

[State -3]
type = ChangeState 
;TriggerAll = var(59)
Triggerall = StateNo !=[98,101]
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 2
Triggerall = var(7) > 0
Triggerall = var(17) = 1
trigger1 = EnemyNear,MoveType = H && EnemyNear,StateType = A
trigger1 = P2BodyDist x >= 10
value = 99

[State -3]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 2
Triggerall = StateNo = 1381 && Movehit && AnimElemTime(13) >= 1
Triggerall = var(7) > 0
Triggerall = FrontEdgeBodyDist<63 || var(7) = (0,100]
;
Trigger1 = Power >= 2000; 必然max乱舞->max2
Trigger1 = var(54) := 2210
;
Trigger2 = Power >= 1000
Trigger2 = var(54) := 2001;ifelse(random < 500, 2210, 2001)
;
Trigger3 = Power < 1000
Trigger3 = var(54) := 2001
value = var(54)

[State -3]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 2
Triggerall = StateNo = 1026 && Movehit
Triggerall = var(7) = (0,100]
;
Trigger1 = Power >= 2000; 必然max乱舞->max2
Trigger1 = var(54) := 2210
;
Trigger2 = Power >= 1000
Trigger2 = var(54) := 2001;ifelse(random < 500, 2210, 2001)
;
Trigger3 = Power < 1000
Trigger3 = var(54) := 2001
value = var(54)

;-----------------------------------------------------------------------
;BC连段3xxx 版边限定
;近C -> 霸气脚 -> 灼火襲 -> 三连击（1450->1455） -> 重半月斩 ->  空中的时候直接取消飞翔脚
-> 落地蹲重脚 -> 重半月斩 -> 重脚升龙（下降那个派生)循环几次之后 目押超杀
;这个超杀可以是地面乱舞、空中乱舞、地面飞天脚，地面飞天脚可以进入无限飞翔脚连段

;3000 金家潘超杀
;3001 全勋超杀
;3002 全勋+金家潘隐藏
;-----------------------------------------------------------------------
[State -3, 霸气脚]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 3
Triggerall = var(7) > 0
Trigger1 = EnemyNear,StateType != A
Trigger1 = StateNo = 225 && Movehit
value = 1500

[State -3, 灼火襲]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 3
Triggerall = var(7) > 0
Trigger1 = EnemyNear,StateType != A
Trigger1 = StateNo = 1500 && Movehit
value = 1800

[State -3, 三连击]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 3
Triggerall = var(7) > 0
;取消灼火襲，300连段
Trigger1 = StateNo = 1800 && Movehit && AnimElemTime(15) >= 1
value = 1450

[State 220, 3]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A
Trigger1 = var(56)/1000 = 3
trigger1 = StateNo = 1450
trigger1 = AnimElem = 5, >=2
trigger1 = moveHit || (EnemyNear,MoveType = H && EnemyNear,StateType = A)
value = 1455

[State -3, 重半月斩]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 3
Triggerall = var(7) > 0
;取消灼火襲，300连段
Trigger1 = StateNo = 1455 && Movehit
;
Trigger2 = StateNo = 430 && MoveHit
value = 1205

[State -3, 飞翔脚]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 3
Triggerall = var(7) > 0
;取消半月斩
Trigger1 = EnemyNear,StateType != A
Trigger1 = StateNo = 1206 && Movehit && AnimElemTime(5) >= 1
value = 1305

[State -3,2D抓硬直]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 3
Triggerall = StateType != A
Triggerall = EnemyNear,StateType != A
;抓飞翔脚
Trigger1 = var(17) = 1
Trigger1 = p2bodydist X < 75
Trigger1 = EnemyNear,GetHitVar(Hittime) >= 7
Trigger1 = NumTarget(1300)
value = 430

[State -3, 重脚升龙]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 3
Triggerall = var(7) > 0
Triggerall = StateType != A
;取消半月斩
Trigger1 = StateNo = 1207 && AnimElemTime(1) >= 1
;目押
Trigger2 = var(15) < 2
Trigger2 = var(17) = 1
Trigger2 = EnemyNear,MoveType = H && EnemyNear,StateType = A
Trigger2 = EnemyNear,pos y + EnemyNear,Vel Y * 11 + helper(33334),fvar(12) * 11 * (11 + 1) / 2 = [-70,-35)
Trigger2 = var(50) := 102562
value = 1025

[State -3,02飞翔脚]
type = changestate
value = 1380
;TriggerAll = var(59)
TriggerAll = RoundState = 2 
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 3
;
Trigger1 = var(15) < 1
Trigger1 = StateNo = 1026 && MoveHit
Trigger1 = var(15) := var(15) + 1
Trigger1 = var(50) := 138061
;
Trigger2 = var(15) = 1
Trigger2 = StateNo = 1026 && MoveHit && AnimElemTime(5) >= 1
Trigger2 = var(50) := 138062
Trigger2 = var(15) := var(15) + 1

[State -3,超杀选择]
type = Null
;TriggerAll = var(59)
TriggerAll = !IsHelper
TriggerAll = StateType != A
Triggerall = var(56) = 3000
Triggerall = var(7) = (0,100]
;
Trigger1 = Power>=1000
Trigger1 = EnemyNear,Life<300
Trigger1 = var(56):=3002
;
Trigger2 = Power<1000
Trigger2 = EnemyNear,Life<80||Life-EnemyNear,Life>250
Trigger2 = var(56):=3001


[State -3,全勋超杀]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = !IsHelper
TriggerAll = StateType != A
Triggerall = var(56) = 3001
Triggerall = var(7) = (0,100]
Triggerall = (Power>=1000&&EnemyNear,Life<=130) || EnemyNear,Life<60 || Life-EnemyNear,Life>400
;
trigger1 = var(17) = 1
trigger1 = EnemyNear,StateType = A && EnemyNear,MoveType = H
trigger1 = EnemyNear,pos y < -20
Trigger1 = EnemyNear,pos y+EnemyNear,Vel Y*16+helper(33334),fvar(12)*16*(16+1)/2 = [-40,-25)
value = ifelse(power>=1000,2460,2450)


[State -3,全勋+金家潘超杀]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = !IsHelper
TriggerAll = StateType != A
Triggerall = var(56) = 3002
Triggerall = var(7) = (0,100]
Triggerall = Power>=1000
;
trigger1 = var(17) = 1
trigger1 = EnemyNear,StateType = A && EnemyNear,MoveType = H
Trigger1 = EnemyNear,pos y+EnemyNear,Vel Y*3+helper(33334),fvar(12)*3*(3+1)/2 = [-55,-30)
value = 2700


[State -3, 地面超杀目押]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)=3000
Triggerall = var(7) > 0
Triggerall = StateType != A
Triggerall = var(15) = 2 || var(7) < 100
;目押
Triggerall = var(17) = 1
Triggerall = EnemyNear,MoveType = H && EnemyNear,StateType = A
Triggerall = FrontEdgeBodyDist < 63
Triggerall = EnemyNear,pos y+EnemyNear,Vel Y*9+helper(33334),fvar(12)*9*(9+1)/2=[-55,-30)
;没气且血量差距大，用飞天脚然后根据气量大小转，气量小用无限飞翔脚，气量打用踩头
Trigger1 = Power < 1000 && EnemyNear,Life-Life > 300
Trigger1 = var(56) := ifelse(Power >= 500, 500, 200)
Trigger1 = var(54) := 2060
;气很多,可以max超杀 -> max2
Trigger2 = Power >= 2000
Trigger2 = var(54) := 2200
;大于1气，可以max 可以1气超杀->max2
Trigger3 = Power >= 1000
Trigger3 = var(54) := ifelse(random%2=0,2200,2000)
;
Trigger4 = Power < 1000
Trigger4 = var(54) := 2000
value = var(54)

;-----------------------------------------------------------------------
;BC连段4xxx 比较单一
;触发条件
;4000
;近C -> 三连击300 -> 升龙 -> 三连击 -> 半月斩 -> 飞天脚 -> 跳浮空追击
;4001
;近C -> 三连击300 -> 升龙 -> 三连击 -> 1461接空中超杀
;-----------------------------------------------------------------------
[State -3, 三连击]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 4
Triggerall = var(7) > 0
;取消近C，300连段
Trigger1 = StateNo = 225 && Movehit
Trigger1 = var(56) := 4300
Trigger1 = var(15) := 1
;取消升龙
Trigger2 = StateNo = 1025 && Movehit
Trigger2 = var(56) := 4303
Trigger2 = var(59) := 1
Trigger2 = var(15) := 2
value = 1450

[State -3, 脚升龙]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 4
Triggerall = var(7) > 0
;升龙->脚升龙
Trigger1 = var(15) < 2
Trigger1 = StateNo = 1465 && Movehit && AnimElemTime(7) >= 1
value = 1025


[State -3, 半月斩, 不半月斩可以1461最后一下接空中超杀]
type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 4
Triggerall = var(7) > 0
Triggerall = var(15) = 2
Trigger1 = Helper(33334),fvar(15) < 83
Trigger1 = EnemyNear,Life >= 250
Trigger1 = StateNo = 1455 && MoveHit
value = 1205

[State -3, 不半月斩1461最后一下接空中超杀]
type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 4
Triggerall = var(7) > 0
Triggerall = MoveHit
Triggerall = (StateNo = 1381&&AnimElemTime(13) >= 1) || (StateNo = 1461&&AnimElemTime(10) > 0)
;大于2气
Trigger1 = Power>=2000
Trigger1 = var(54):=2210

;大于1气
Trigger2 = Power>=1000
Trigger2 = EnemyNear,Life>Life
Trigger2 = var(54):=2001
;大于1气
Trigger3 = Power>=1000
Trigger3 = EnemyNear,Life<Life
Trigger3 = var(54):=ifelse(Random%2=0,2210,2300)
;
Trigger4 = var(54):=ifelse(Random%2=0,2001,2100)
value = var(54)

[State -3, 飞天脚]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 4
Triggerall = var(7) > 0
Triggerall = var(15) = 2
Trigger1 = StateNo = 1207 && MoveHit
Trigger1 = var(56) := ifelse(EnemyNear,Life >= 150,ifelse(Power>=500,500,200),11)
value = 2060

;-----------------------------------------------------------------------
;BC连段5xxx 
;红BC -> 三连击目押 -> 飞翔脚 循环 最后超杀
; 为完成
;-----------------------------------------------------------------------
[State -3]
type = varset
Triggerall = var(56)/1000 = 5
trigger1 = var(15) >= 4
trigger1 = var(56) := 15 ;跳转到全勋超杀
var(15) = 0
ignorehitpause = 1

[State -3]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = var(56)/1000 = 5
Triggerall = var(7) = 0
Triggerall = StateType != A
Triggerall = var(17) = 1
Trigger1 = EnemyNear,MoveType = H && EnemyNear,StateType = A
Trigger1 = NumTarget(1026)||NumTarget(2060)||NumTarget(660)||EnemyNear,StateNo=60192
Trigger1 = EnemyNear,Vel Y <= 0
Trigger1 = var(50) := 400065
value = 4000

[State -3,三连击追击]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = var(56)/1000 = 5
Triggerall = var(15)%2 = 0
Triggerall = var(15) < 4
Triggerall = var(7) > 0
TriggerAll = !IsHelper
TriggerAll = StateType != A 
TriggerAll = var(17) = 1
TriggerAll = EnemyNear,MoveType = H
TriggerAll = EnemyNear,StateNo >= 5000
TriggerAll = Helper(33334),fvar(15) < 82
TriggerAll = EnemyNear,StateType = A
TriggerAll = EnemyNear,pos y + EnemyNear,Vel Y * 9 + helper(33334),fvar(12) * 9 * (9 + 1) / 2 = [-35,-20)
Trigger1 = NumTarget(1026)||NumTarget(2060)||NumTarget(660)||EnemyNear,StateNo=60192
value = 1450

[State 220, 3]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A
Triggerall = EnemyNear,pos y+EnemyNear,Vel Y*9+helper(33334),fvar(12)*9*(9+1)/2 = [-40,-20)
Triggerall = EnemyNear,MoveType = H && EnemyNear,StateType = A
trigger1 = StateNo = 1450
trigger1 = AnimElem = 5, >=2
trigger2 = StateNo = 1451
value = 1455

[State -3, 重脚升龙]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = var(56)/1000 = 5
Triggerall = var(15)%2 = 1
Triggerall = var(15) < 4
Triggerall = var(7) > 0
TriggerAll = !IsHelper
TriggerAll = StateType != A 
TriggerAll = var(17) = 1
TriggerAll = EnemyNear,MoveType = H
TriggerAll = EnemyNear,StateNo >= 5000
TriggerAll = Helper(33334),fvar(15) < 82
TriggerAll = EnemyNear,StateType = A
TriggerAll = EnemyNear,pos y+EnemyNear,Vel Y*6+helper(33334),fvar(12)*6*(6+1)/2 = [-40,-25)
Trigger1 = NumTarget(2060)||NumTarget(660)||EnemyNear,StateNo=60192
value = 1025


[State -3,飞天脚]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/1000 = 5
TriggerAll = StateType != A
Triggerall = var(7) > 0
Triggerall = var(15) < 4
;取消三连击
trigger1 = StateNo = 1455
trigger1 = moveHit
trigger1 = var(15) := var(15) + 1
;追升龙
trigger2 = StateNo = 1025
trigger2 = moveHit
trigger2 = var(15) := var(15) + 1
value = 2060


;-----------------------------------------------------------------------
;红BC 
;6xxx 未完成
;-----------------------------------------------------------------------
[State -3]
type = varset
Triggerall = var(56)/1000 = 6
trigger1 = var(7) = (0,150]
trigger1 = var(56) := 15 ;跳转到全勋超杀
Trigger1 = StateType != A
var(15) = 0
ignorehitpause = 1


[State -3]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = var(56)/1000 = 6
Triggerall = var(7) = 0
Triggerall = StateType != A
Triggerall = var(17) = 1
Trigger1 = EnemyNear,MoveType = H && EnemyNear,StateType = A
Trigger1 = EnemyNear,Vel Y <= 0
Trigger1 = var(50) := 400065
value = 4000

[State -3,三连击追击]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = var(56)/1000 = 6
Triggerall = var(15)%2 = 0
Triggerall = var(7) > 0
TriggerAll = !IsHelper
TriggerAll = StateType != A 
TriggerAll = EnemyNear,MoveType = H
TriggerAll = EnemyNear,StateNo >= 5000

Trigger1 = var(17) = 1
Trigger1 = EnemyNear,StateType = A
Trigger1 = FrontEdgeBodyDist < 63||P2BodyDist x-helper(33334),Fvar(11)*9 = [-5,55]
Trigger1 = EnemyNear,pos y+EnemyNear,Vel Y*9+helper(33334),fvar(12)*9*(9+1)/2=[-35,-20)

Trigger2 = StateNo = 225 && MoveHit
value = 1450

[State 220, 3]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = var(56)/1000 = 6
TriggerAll = !IsHelper
TriggerAll = StateType != A
Triggerall = EnemyNear,pos y+EnemyNear,Vel Y*9+helper(33334),fvar(12)*9*(9+1)/2 = [-40,-20)
Triggerall = EnemyNear,MoveType = H && EnemyNear,StateType = A
trigger1 = StateNo = 1450
trigger1 = AnimElem = 5, >=2
trigger2 = StateNo = 1451
value = 1455

[State 220, 3]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = var(56)/1000 = 6
TriggerAll = !IsHelper
TriggerAll = StateType != A
Triggerall = EnemyNear,MoveType = H && EnemyNear,StateType != A
trigger1 = StateNo = 1450
trigger1 = AnimElem = 5, >=2
value = 1455

[State -3, 重脚升龙]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = var(56)/1000 = 6
Triggerall = var(15)%2 = 1
Triggerall = var(7) > 0
TriggerAll = !IsHelper
TriggerAll = StateType != A 
TriggerAll = var(17) = 1
TriggerAll = EnemyNear,MoveType = H
TriggerAll = EnemyNear,StateNo >= 5000
TriggerAll = EnemyNear,StateType = A
Trigger1 = FrontEdgeBodyDist<63||P2BodyDist x-helper(33334),fvar(11)*6=[-5,48]
Trigger1 = EnemyNear,pos y+EnemyNear,Vel Y*6+helper(33334),fvar(12)*6*(6+1)/2 = [-40,-25)
value = 1025


[State -3,飞天脚]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = var(56)/1000 = 6
TriggerAll = !IsHelper
TriggerAll = StateType != A
Triggerall = var(7) > 0
;取消三连击
trigger1 = StateNo = 1455
trigger1 = moveHit
trigger1 = var(15) := var(15) + 1
value = 2060


[State -3,空中飞天脚]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = var(56)/1000 = 6
TriggerAll = !IsHelper
TriggerAll = StateType = A
Triggerall = var(7) > 0
;取消升龙
trigger1 = StateNo = 1026 && AnimElemTime(3) >= 2
trigger1 = moveHit
trigger1 = var(15) := var(15) + 1
value = 2510






;-----------------------------------------------------------------------
;-----------------------------------------------------------------------
;普通连段开始
;-----------------------------------------------------------------------
;-----------------------------------------------------------------------

;-----------------------------------------------------------------------
;1xx 置空
;-----------------------------------------------------------------------



;-----------------------------------------------------------------------
;2xx 版边限定
;飞天脚->无限轻飞翔脚->02飞翔脚（没气）var(56)变更1xx
;					 ->空中超杀
;					 ->无限踩头
;-----------------------------------------------------------------------
[State -3,原地跳]
Type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = var(56)/100 = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A 
Triggerall = var(17) = 1
TriggerAll = EnemyNear,MoveType = H && EnemyNear,StateType = A
Triggerall = P2BodyDist x >= 38
Trigger1 = EnemyNear,Vel Y < 0
value = 66


[State -3,原地跳]
Type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = var(56)/100 = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A 
Triggerall = var(17) = 1
TriggerAll = EnemyNear,MoveType = H && EnemyNear,StateType = A
Triggerall = FrontEdgeBodyDist < 63
Triggerall = P2BodyDist x < 38
Trigger1 = EnemyNear,Vel Y < 0
value = 65

[State -3,飞翔脚]
Type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = var(56)/100 = 2
Triggerall = var(15) < 6
TriggerAll = !IsHelper
TriggerAll = StateType = A 
Triggerall = Ctrl || StateNo = 50
TriggerAll = EnemyNear,MoveType = H && EnemyNear,StateType = A
;Triggerall = FrontEdgeBodyDist < 63
Triggerall = P2BodyDist x < 38
;
Trigger1 = Helper(33334),fvar(14) >= 14
Trigger1 = P2BodyDist y+EnemyNear,Vel Y*11+Helper(33334),fvar(12)*11*(11+1)/2=[12,25]
Trigger1 = var(15) := var(15)+1
trigger1 = var(50) := 130561
value = 1305

[State -3,02飞翔脚]
Type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = var(56)/100 = 2
TriggerAll = !IsHelper
TriggerAll = StateType = A 
Triggerall = Ctrl || StateNo = 50
TriggerAll = EnemyNear,MoveType = H && EnemyNear,StateType = A
Triggerall = FrontEdgeBodyDist < 63
Trigger1 = P2BodyDist x < 38
Trigger1 = P2BodyDist y+EnemyNear,Vel Y*2+Helper(33334),fvar(12)*2*(2+1)/2=[40,60]
value = 1380

[State -3,空中 凤凰天舞脚 转圈]
Type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = var(56)/100 = 2
Triggerall = Power >= 1000
TriggerAll = !IsHelper
TriggerAll = StateType = A 
TriggerAll = EnemyNear,MoveType = H && EnemyNear,StateType = A
;取消飞翔脚
Trigger1 = StateNo = 1381
Trigger1 = AnimElemTime(13) >= 1
value = ifelse(Power>=2000,2300,2100)

[State -3]
type = Null
;TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = var(56)/100 = 2
Triggerall = P2BodyDist x < 10
Trigger1 = Power>=600
Trigger1 = var(56) := 500
Trigger1 = var(15) := 0


;-----------------------------------------------------------------------
;各种三连击 3xx
;三连击   1)   ↓←     +     X/Y      1450（EX Version XY）
;
;			2)   ↓←     +     X/Y      1455
;				-3)   ↓←     +     X        1465
;               -3)   ↓←     +     Y        1462
;               	-4)   ↓←     +     X/Y      1461   (MIX)hvar(5) > 0
;
;           2)   ↗       +     A/B      1470   (MIX)hvar(5) > 0
;               -3)   ↓      +     A/B      1471
;               -3)   ↓←     +     X/Y      1461


;var(56)=300 1450 -> 1455 -> 1465 -> 1461 伤害最高
;var(56)=301 1450 -> 1455 -> 1462 -> 1461
;var(56)=302 1450 -> 1470 -> 1471
;var(56)=303 1450 -> 1470 -> 1461
;var(56)=304 1450 -> 1455 -> 1465 -> 1461->空中超杀
;var(56)=305 1450 -> 1455 -> 飞天脚 -> 拳升龙/飞翔脚/踩头
;-----------------------------------------------------------------------
[State -3]
Type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A 
Triggerall = var(56)/100 = 3 || (var(56)%1000)/100 = 3
TriggerAll = EnemyNear,MoveType = H && EnemyNear,StateType != A
TriggerAll = EnemyNear,StateNo >= 5000 
TriggerAll = MoveHit
Trigger1 = StateNo = 225 && MoveHit
Trigger2 = StateNo = 241 && animelem = 7,>0 && MoveHit
;特殊技连不上了
Trigger3 = var(17) = 2
value = 1450


[state -1]
type = changestate
value = 1470
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A 
Trigger1 = var(56) = 302 || var(56) = 303 || (var(56)%1000) = 302 || (var(56)%1000) = 303 
trigger1 = stateno = 1450 && animelem = 4,>0

[State 220, 3]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A
Trigger1 = var(56) = 300 || var(56) = 301 || (var(56)%1000) = 300 || (var(56)%1000) = 301 ||var(56)=304||var(56)=305
trigger1 = StateNo = 1450
trigger1 = AnimElem = 5, >=2
trigger1 = moveHit || (EnemyNear,MoveType = H && EnemyNear,StateType = A)
value = 1455

[state -1]
type = changestate
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType = A 
Trigger1 = var(56) = 302 || (var(56)%1000) = 302 
trigger1 = stateno = 1470 && MoveHit && animelem = 10
value = 1471


[state -1]
type = changestate
value = 1465
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Trigger1 = var(56) = 300 || (var(56)%1000) = 300 ||var(56)=304
trigger1 = stateno = 1455
trigger1 = MoveHit || (EnemyNear,MoveType = H && EnemyNear,StateType = A)

[state -1]
type = changestate
value = 1462
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Trigger1 = var(56) = 301 || (var(56)%1000) = 301 
trigger1 = stateno = 1456

[State -1]
type = ChangeState
value = 1461
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
trigger1 = stateno = 1470 && MoveHit && animelem = 10
trigger2 = stateno = 1465 && MoveHit
trigger2 = animelem = 11,>0
trigger3 = stateno = 1463
trigger3 = animelem = 2,>1
trigger3 = MoveHit
ignorehitpausetime = 1

[State -3]
type = ChangeState
value = ifelse(Random%2=0,2100,2001)
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(56)=304
Triggerall = var(7)=0&&Power>=1000
Trigger1 = StateNo = 1461 && Movehit && AnimElemTime(10) >= 1
Trigger1 = EnemyNear,StateType=A&&EnemyNear,MoveType=H

[State -3]
type = ChangeState
value = 2060
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(56)=305
Triggerall = var(7)=0&&Power>=1000
Triggerall = Helper(33334),Fvar(15)<83
Trigger1 = StateNo = 1455 && Movehit && AnimElemTime(5) >= 1
Trigger1 = EnemyNear,StateType!=A&&EnemyNear,MoveType=H
Trigger1 = var(56):=200

[State -3]
type = varset
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)!=304
Trigger1 = var(56)/100 = 3
Trigger1 = StateNo = 1461
var(56) = 11


;-----------------------------------------------------------------------
;4xx 无限霸气脚
;-----------------------------------------------------------------------
[State -3]
type = PalFx
triggerall = StateNo = 1500
triggerall = var(7) = 0
triggerall = movehit
Trigger1 = Power<1000
time = 1
add = 256,256,256
mul = 256,256,256
sinadd = 256,256,256,1
invertall = 0
color = 256
ignorehitpausetime = 1

[State -3,要不就打一下，要不就打满]
Type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A 
TriggerAll = EnemyNear,MoveType = H && EnemyNear,StateType != A
Triggerall = StateNo = 225 && MoveHit
Triggerall = var(56)/100 = 4
;大于1气必须转
Trigger1 = Power >= 1000 || var(7)>0
Trigger1 = var(54) := 1450
Trigger1 = var(56) := 304
;留情直接转
;灼火襲 重
Trigger2 = var(15)=1&&EnemyNear,Life-Life<500&&Life>150
Trigger2 = Random%4=0
Trigger2 = var(54) := 1800
;转三连击
Trigger3 = var(15)=1&&EnemyNear,Life-Life<500&&Life>150
Trigger3 = Random%4=1
Trigger3 = var(54) := 1450
Trigger3 = var(56) := 302
;转前前拳->空中飞翔脚
Trigger4 = var(15)=1&&EnemyNear,Life-Life<500&&Life>150
Trigger4 = EnemyNear,StateType=S
Trigger4 = Random%4=2
Trigger4 = var(54) := 320
Trigger4 = var(56) := 900
;重升龙取消->地面重半月斩
Trigger5 = var(15)=1&&EnemyNear,Life-Life<500&&Life>150
Trigger5 = EnemyNear,StateType=S
Trigger5 = var(54) := 1025
Trigger5 = var(56) := 903
value = var(54)

[State -3]
Type = varset
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/100 = 4
Trigger1 = Power >= 1000
var(15) = 0
IgnoreHitPause = 1

[State -3,转三连击]
Type = Null
;TriggerAll = var(59)
Triggerall = 0
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/100 = 4
;转三连击->超杀
Trigger1 = NumTarget(1450)
Trigger1 = var(56) := 304
;转前前拳->空中半月斩

;重升龙取消->地面重半月斩

;灼火襲 重
IgnoreHitPause = 1

[State -3]
Type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/100 = 4
TriggerAll = StateType != A 
TriggerAll = EnemyNear,MoveType = H && EnemyNear,StateType != A
TriggerAll = EnemyNear,StateNo >= 5000 
Triggerall = MoveHit
;特殊技连不上了
Trigger1 = var(17) = 2 || StateNo = 225
Trigger1 = var(15) := var(15) + 1
value = 1500

[State -3, 霸气脚恢复控制]
Type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Trggerall = Power < 1000
Trigger1 = StateNo = 1500 && MoveContact
value = 0
ctrl = 1

[State -3,霸气脚专用]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A 
Triggerall = var(56)/100 = 4
TriggerAll = EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateType != L 
Triggerall = var(17) = 1
Triggerall = NumTarget(1500)
;近重拳
Trigger1 = p2bodydist x = [-58,28]
Trigger1 = EnemyNear,GetHitVar(Hittime) = [2,4]
Trigger1 = var(50) := 22563
Trigger1 = var(54) := 225
;近重拳
Trigger2 = p2bodydist x-Helper(33334),fvar(11)*5<45
Trigger2 = EnemyNear,GetHitVar(Hittime) = [5,6]
Trigger2 = var(50) := 40061
Trigger2 = var(54) := 400
value = var(54)

[State -3]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A 
Triggerall = var(56)/100 = 4
Triggerall = var(17) = 1
Triggerall = StateNo != [98,101]
Trigger1 = P2BodyDist x >= 0
Trigger1 = NumTarget(1500)
value = 99

;-----------------------------------------------------------------------
;5xx 全勋踩头
;-----------------------------------------------------------------------
[State -3]
Type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = var(56)/100 = 5
TriggerAll = !IsHelper
TriggerAll = StateType != A 
TriggerAll = EnemyNear,MoveType = H && EnemyNear,StateType = A
Triggerall = P2BodyDist x >= 8
Trigger1 = StateNo != 19 && StateNo != [99,102]
Trigger1 = var(17) = 1
value = 19

[State -3,原地跳]
Type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = var(56)/100 = 5
TriggerAll = !IsHelper
TriggerAll = StateType != A 
TriggerAll = EnemyNear,MoveType = H && EnemyNear,StateType = A
Triggerall = P2BodyDist x <= 10
Trigger1 = var(17) = 1
value = 65

[State -1,踩头]
type = ChangeState
value = 625
;TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = var(56)/100 = 5
TriggerAll = !IsHelper
Triggerall = StateType = A
TriggerAll = EnemyNear,MoveType = H
TriggerAll = EnemyNear,StateType = A
Triggerall = Helper(33334),fvar(14) >= 7
Triggerall = EnemyNear,BackEdgeBodyDist <= 10 && P2BodyDist x < 35
Triggerall = var(15)<6
;
Trigger1 = var(17) = 6
Trigger1 = P2BodyDist y-Vel Y*5-const(movement.yaccel)*5*(5+1)/2+EnemyNear,Vel Y*5+Helper(33334),fvar(12)*5*(5+1)/2=[10,30]
Trigger1 = var(50) := 62561
Trigger1 = var(15) := var(15)+1
;
Trigger2 = StateNo = 627 && Ctrl
Trigger2 = Time = 9
Trigger2 = var(50) := 62562
Trigger2 = var(15) := var(15)+1

[State -3]
type = ChangeState
value = ifelse(power>=2000,2300,ifelse(Power>=1000,2100,660))
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/100 = 5
Triggerall = StateType = A
Triggerall = var(15)>=6
Trigger1 = EnemyNear,StateType = A && EnemyNear,MoveType = H
Trigger1 = var(17) = 6

[State -3]
type = varset
triggerall = var(15) >= 2
trigger1 = var(56)/100 = 5
trigger1 = StateNo=660
var(56) = 12

;-----------------------------------------------------------------------
;简单连段
;6xx  轻攻击->重升龙取消->地面重半月斩
;7xx  流星落 重
;8xx  SC飞天脚
;9xx
;900  320一段接空中飞翔脚
;901  投技辅助击飞
;902  2A->拳升龙
;903  重升龙取消+半月斩
;-----------------------------------------------------------------------
[State -3,重脚升龙]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56)/100 = 6
TriggerAll = StateType != A 
TriggerAll = EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateType != A 
;
Trigger1 = var(17) = 2
Trigger1 = MoveHit
Trigger1 = var(50) := 102561
value = 1025

[State -3,重脚升龙派生2，取消接拳升龙]
type = changestate
value = 1028
;TriggerAll = var(59)
TriggerAll = RoundState = 2 
Triggerall = !isHelper
Triggerall = var(56)/100 = 6
TriggerAll = !IsHelper
Trigger1 = StateNo = 1026 && MoveHit
Trigger1 = animelem = 2,<=2
Trigger1 = var(56) := 16

[State -3,流星落 重]
type = changestate
value = 1605
;TriggerAll = var(59)
TriggerAll = RoundState = 2 
Triggerall = !isHelper
Triggerall = var(56)/100 = 7
TriggerAll = !IsHelper
Trigger1 = StateNo = 225 && AnimElemTime (4) >= 1 && MoveHit

[State -3,飞翔脚]
type = changestate
value = var(54)
;TriggerAll = var(59)
TriggerAll = RoundState = 2 
Triggerall = !isHelper
Triggerall = StateType = A
Triggerall = StateNo = 320
Triggerall = var(56)=900||Helper(33334),Fvar(15)>93||Power<1900
;
Trigger1 = AnimElemTime(4)=1&&Helper(33334),Fvar(15)<93
Trigger1 = var(54):=1305
Trigger1 = var(56):=302
Trigger1 = var(50):=138066
;
Trigger2 = AnimElemTime(10)>=1
Trigger2 = var(54):=1380
Trigger2 = var(56):=302
Trigger2 = var(50):=138067


[State -3,三连击追击]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A 
TriggerAll = var(17) = 1
Triggerall = var(56) = 901
TriggerAll = EnemyNear,MoveType = H
TriggerAll = EnemyNear,StateNo = 6006
TriggerAll = FrontEdgeBodyDist<63||P2BodyDist x-helper(33334),Fvar(11)*9 = [-5,55]
TriggerAll = EnemyNear,StateType = A
Triggerall = EnemyNear,Vel Y>0
TriggerAll = EnemyNear,pos y+EnemyNear,Vel Y*9+helper(33334),fvar(12)*9*(9+1)/2=[-20,-10)
;
trigger1 = var(50) := 145063
Trigger1 = var(56) := 302
value = 1450

[State -3,重拳升龙追击]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A 
Triggerall = var(56) = 902
TriggerAll = EnemyNear,MoveType = H
TriggerAll = EnemyNear,StateNo >= 5000
;
Trigger1 = StateNo = 241 && MoveHit && AnimElemTime(7)>=1
trigger1 = var(50) := 110561
value = 1105

[State -3,重半月斩]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A 
TriggerAll = EnemyNear,MoveType = H
TriggerAll = EnemyNear,StateNo >= 5000
;
Trigger1 = var(56) = 903
Trigger1 = NumTarget(1025)||NumTarget(1026)
Trigger1 = var(17)=1
Trigger1 = var(50) := 120561
Trigger1 = var(56) := 800
;半月斩衔接蹲重脚
Trigger2 = EnemyNear,StateType = A
Trigger2 = StateNo = 430 && MoveHit
Trigger2 = var(50) := 120562
Trigger2 = var(56) := 800
value = 1205

[State -3]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A 
TriggerAll = EnemyNear,MoveType = H
TriggerAll = EnemyNear,StateNo >= 5000
Triggerall = var(56)/100 = 8
Triggerall = var(7)>0||Power>=1000
Trigger1 = StateNo=1207&&Helper(33334),Fvar(15)<93
Trigger1 = var(50) := 206061
Trigger1 = var(56) := ifelse(Power>=2000,4000,200)
value = 2060



;-----------------------------------------------------------------------
;特殊技追
;-----------------------------------------------------------------------
[State -3, 特殊技]
Type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A 
TriggerAll = EnemyNear,MoveType = H && EnemyNear,StateType != A
TriggerAll = EnemyNear,StateNo >= 5000
TriggerAll = MoveHit
TriggerAll = var(17) = 2
TriggerAll = var(7) <= 0; BC中直接接必杀技
;
Trigger1 = EnemyNear,StateType != C
Trigger1 = P2BodyDist x < 55
Trigger1 = P2BodyDist x > 15 || var(56)/100 = 8
Trigger1 = var(54) := 320
Trigger1 = var(50) := 32061
;重拳版本击退距离太远，衔接不上
Trigger2 = StateNo = 205 || StateNo = 400 || StateNo = 210 || StateNo = 215
Trigger2 = P2BodyDist x <= 15
Trigger2 = var(54) := 241
Trigger2 = var(50) := 24161
;重拳版本接BC
Trigger3 = StateNo = 225 && Power >= 2000 && var(7) = 0
Trigger3 = P2BodyDist x <= 15
Trigger3 = var(54) := 241
Trigger3 = var(50) := 24162
;接三连击
Trigger4 = P2BodyDist x >= 55
Trigger4 = var(54) := 1450
Trigger4 = var(56) := 302
value = var(54)


;-----------------------------------------------------------------------
;普通技追
;-----------------------------------------------------------------------
[State -3,跳跃]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A 
TriggerAll = EnemyNear,MoveType = H && !EnemyNear,Ctrl && EnemyNear,StateType != A
TriggerAll = EnemyNear,StateType != L 
Triggerall = var(17) = 1 || StateNo = 52
Triggerall = EnemyNear,Facing != Facing
;
Trigger1 = EnemyNear,Power>=800&&Power>=1000;不能霸气脚无责任连携
Trigger1 = EnemyNear,StateNo = [150,153]
Trigger1 = EnemyNear,GetHitVar(Hittime) <= 3
Trigger1 = p2bodydist x < 60
Trigger1 = var(50) := 6362
Value = 63

[State -3,地面普通技]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A 
TriggerAll = EnemyNear,MoveType = H && !EnemyNear,Ctrl && EnemyNear,StateType != A
TriggerAll = EnemyNear,StateType != L 
Triggerall = var(17) = 1 || StateNo = 52
Triggerall = NumTarget(1500) = 0
;近重拳
Trigger1 = EnemyNear,StateNo >= 5000 || EnemyNear,Power < 800 || Power < 1000; Power<1000接霸气脚然后恢复可控
Trigger1 = p2bodydist x = [-58,28]
Trigger1 = EnemyNear,GetHitVar(Hittime) = (0,9]
Trigger1 = var(54) := 225
Trigger1 = var(50) := 22562
;蹲轻拳
Trigger2 = p2bodydist x-Helper(33334),fvar(11)*5 < 48 || FrontEdgeBodyDist < 63 || (P2BodyDist x < 48 && EnemyNear,BackEdgeBodyDist <= 1)
Trigger2 = EnemyNear,GetHitVar(Hittime) = [4,5]
Trigger2 = var(54) := 400
Trigger2 = var(50) := 40063
;站重脚
Trigger3 = (p2bodydist x-Helper(33334),fvar(11)*8 = [48,65]) || FrontEdgeBodyDist < 63 || (P2BodyDist x < 65 && EnemyNear,BackEdgeBodyDist <= 1)
Trigger3 = P2BodyDist x > 35
Trigger3 = EnemyNear,GetHitVar(Hittime) = [8,9]
Trigger3 = var(54) := 430
Trigger3 = var(50) := 43063
;站轻拳
Trigger4 = var(7) = 0
Trigger4 = (p2bodydist x-Helper(33334),fvar(11)*5 = [48,70]) || FrontEdgeBodyDist < 63 || (P2BodyDist x < 70 && EnemyNear,BackEdgeBodyDist <= 1)
Trigger4 = EnemyNear,GetHitVar(Hittime) = [3,4]
Trigger4 = var(54) := 200
Trigger4 = var(50) := 20063
;近重拳
Trigger5 = EnemyNear,StateNo >= 5000 || EnemyNear,Power < 800
Trigger5 = p2bodydist x<=5
Trigger5 = EnemyNear,GetHitVar(Hittime)>0
Trigger5 = var(54) := 225
Trigger5 = var(50) := 22565
value = var(54)

[State -3,地面普通技连特殊状态]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A 
TriggerAll = EnemyNear,StateNo = 5622 && EnemyNear,Time < 110
TriggerAll = EnemyNear,StateType != L 
Triggerall = var(17) = 1
Triggerall = NumTarget(1500) = 0
;近重拳
Trigger1 = p2bodydist x = [-58,28]
Trigger1 = MoveHit
Trigger1 = var(54) := 225
Trigger1 = var(50) := 22564
;蹲轻拳
Trigger2 = p2bodydist x-Helper(33334),fvar(11)*5 < 48 || FrontEdgeBodyDist < 60 || (P2BodyDist x < 48 && EnemyNear,BackEdgeBodyDist <= 1)
Trigger2 = EnemyNear,Time = [112, 115]
Trigger2 = var(54) := 400
Trigger2 = var(50) := 40064
;站轻拳
Trigger3 = (p2bodydist x-Helper(33334),fvar(11)*5 = [48,70]) || FrontEdgeBodyDist < 60 || (P2BodyDist x < 70 && EnemyNear,BackEdgeBodyDist <= 1)
Trigger3 = EnemyNear,Time = [116, 117]
Trigger3 = var(54) := 200
Trigger3 = var(50) := 20064
value = var(54)

[State -3,地面普通技取消]
Type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A 
TriggerAll = EnemyNear,MoveType = H && !EnemyNear,Ctrl
Trigger1 = stateno = 410 && MoveHit
Trigger1 = time > 6
value = ifelse(EnemyNear,StateType = C, 400, 210)

;-----------------------------------------------------------------------
;倒地追击
;空中半月斩不能追击，追不上
;-----------------------------------------------------------------------
[State -3, 小跳闪避]
type = ChangeState
value = 362
;TriggerAll = var(59)
TriggerAll = RoundState = 2 
TriggerAll = !IsHelper
TriggerAll = StateType != A
Triggerall = var(17) = 1 
triggerall = EnemyNear,MoveType = H && !EnemyNear,Ctrl
Triggerall = !NumTarget(1210)
trigger1 = EnemyNear,stateno = [910,911]
trigger1 = P2BodyDist x >= 50
;
trigger2 = EnemyNear,stateno = [920,950]
trigger2 = P2BodyDist x >= 75

[State -1,EX霸气脚追地]
type = ChangeState
value = 3020
TriggerAll = var(59)
TriggerAll = RoundState = 2 
TriggerAll = !IsHelper
TriggerAll = StateType != A
Triggerall = var(17) = 1 
Triggerall = Power >= 1000
Triggerall = !NumTarget(1210)
triggerall = EnemyNear,MoveType = H && !EnemyNear,Ctrl
triggerall = (EnemyNear,stateno = [910,950])
triggerall = P2BodyDist x < 75
Triggerall = Power>=3000||Life<150||EnemyNear,Life<150||EnemyNear,Life-Life>350
;
Trigger1 = Helper(33334),Fvar(15)>=83
Trigger1 = Power>=3000
Trigger1 = var(56):=ifelse(Random%2,1000,2000);BC连
;
Trigger2 = Helper(33334),Fvar(15)>=83
Trigger2 = Power>=2000
Trigger2 = var(56):=304;三连击->SC空中超杀
;
Trigger3 = Power<2000
Trigger3 = var(56):=400;无限霸气脚
;
Trigger4 = Power>=2000
Trigger4 = var(56):=1000


[State -1,霸气脚追地]
type = ChangeState
value = 1501
;TriggerAll = var(59)
TriggerAll = RoundState = 2 
TriggerAll = !IsHelper
TriggerAll = StateType != A
Triggerall = var(17) = 1 
trigger1 = EnemyNear,MoveType = H && !EnemyNear,Ctrl
trigger1 = (EnemyNear,stateno = [910,950])
trigger1 = P2BodyDist x < 75



;-----------------------------------------------------------------------
;浮空追击1X
;11 脚升龙追击
;12 拳升龙追击
;13 三连击追击
;14 近重拳
;15 全勋超杀追击
;16 半月斩追击浮空
;-----------------------------------------------------------------------
[State -3,重脚升龙追击]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A 
TriggerAll = var(17) = 1
TriggerAll = EnemyNear,MoveType = H
TriggerAll = EnemyNear,StateNo >= 5000
TriggerAll = EnemyNear,StateType = A
Trigger1 = var(56) = 11
Trigger1 = FrontEdgeBodyDist<63||P2BodyDist x-helper(33334),fvar(11)*6=[2,48]
Trigger1 = EnemyNear,pos y+EnemyNear,Vel Y*6 + helper(33334),fvar(12)*6*(6+1)/2=[-35,-20)
trigger1 = var(50) := 102561
;
Trigger2 = var(56) = 11
Trigger2 = FrontEdgeBodyDist<63||P2BodyDist x-helper(33334),fvar(11)*12=[2,68]
Trigger2 = EnemyNear,pos y+EnemyNear,Vel Y*12 + helper(33334),fvar(12)*12*(12+1)/2=[-40,-20)
Trigger2 = var(56) := 12
trigger2 = var(50) := 102562
;
Trigger3 = var(56) = 0 
Trigger3 = FrontEdgeBodyDist<63||P2BodyDist x-helper(33334),fvar(11)*6=[2,48]
Trigger3 = EnemyNear,pos y+EnemyNear,Vel Y*6 + helper(33334),fvar(12)*6*(6+1)/2=[-35,-20)
trigger3 = var(50) := 102563
value = 1025

[State -3,三连击追击]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A 
TriggerAll = var(17) = 1
TriggerAll = EnemyNear,MoveType = H
TriggerAll = EnemyNear,StateNo >= 5000
TriggerAll = FrontEdgeBodyDist < 63||P2BodyDist x-helper(33334),Fvar(11)*9 = [-5,55]
TriggerAll = EnemyNear,StateType = A
Triggerall = EnemyNear,Vel Y>0
TriggerAll = EnemyNear,pos y+EnemyNear,Vel Y*9+helper(33334),fvar(12)*9*(9+1)/2=[-35,-20)
;
Trigger1 = var(56) = 13
trigger1 = var(50) := 145061
Trigger1 = var(56) := 302
;
Trigger2 = var(56) = 0
trigger2 = var(50) := 145062
Trigger2 = var(56) := 302
value = 1450

[State -3,重拳升龙追击]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A 
TriggerAll = var(17) = 1
TriggerAll = EnemyNear,MoveType = H
TriggerAll = EnemyNear,StateNo >= 5000
TriggerAll = FrontEdgeBodyDist < 63||P2BodyDist x-helper(33334),fvar(11)*6=[0,70]
TriggerAll = EnemyNear,StateType = A
TriggerAll = EnemyNear,pos y+EnemyNear,Vel Y*9+helper(33334),fvar(12)*9*(9+1)/2=[-60,-20)
;
Trigger1 = var(56) = 12
trigger1 = var(50) := 110561
;
Trigger2 = var(56) = 0
trigger2 = var(50) := 110562
;
Trigger3 = var(56) = 902
trigger3 = var(50) := 110563
value = 1105

[State -3, 近重拳]
Type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = var(56) = 14 || var(56) = 0
TriggerAll = !IsHelper
TriggerAll = StateType != A 
TriggerAll = EnemyNear,MoveType = H
TriggerAll = EnemyNear,StateNo >= 5000
TriggerAll = Ctrl
;浮空追击
Trigger1 = P2BodyDist x < 28
Trigger1 = EnemyNear,StateType = A
Trigger1 = FrontEdgeBodyDist < 45 || EnemyNear,BackEdgeBodyDist < 2 || P2BodyDist x-helper(33334),fvar(11)*2 < 28 
Trigger1 = EnemyNear,pos y+EnemyNear,Vel Y*2+helper(33334),fvar(12)*2*(2+1)/2=[-35,-20]
trigger1 = var(56) := 0;重置用
trigger1 = var(50) := 22561
value = 225

[State -3,全勋超杀]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56) = 15
TriggerAll = StateType != A
Triggerall = var(7) > 0 || (var(7) = 0 && Power >= 1000)
;
trigger1 = var(17) = 1
trigger1 = EnemyNear,StateType = A && EnemyNear,MoveType = H
trigger1 = EnemyNear,pos y < -20
Trigger1 = EnemyNear,pos y+EnemyNear,Vel Y*16+helper(33334),fvar(12)*16*(16+1)/2 = [-40,-25)
value = ifelse(power>=1000,2460,2450)

[State -3,飞天脚]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56) = 0
TriggerAll = StateType != A
Triggerall = var(7) > 0 || (var(7) = 0 && Power >= 1000)
;
Trigger1 = Helper(33334),fvar(15) < 82
trigger1 = var(17) = 1
trigger1 = EnemyNear,StateType = A && EnemyNear,MoveType = H
trigger1 = EnemyNear,StateNo >= 5000
Trigger1 = EnemyNear,pos y+EnemyNear,Vel Y*10+helper(33334),fvar(12)*10*(10+1)/2 = [-60,-30)
Trigger1 = var(56) := ifelse(Power>=500,500,200)
value = 2060

[State -3, 半月斩]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
Triggerall = var(56) = 16
TriggerAll = StateType != A 
triggerall = var(17) = 1
;
trigger1 = EnemyNear,StateType = A && EnemyNear,MoveType = H
trigger1 = P2BodyDist x < 60
Trigger1 = EnemyNear,pos y<-100
value = 1205



;-----------------------------------------------------------------------
;派生技能
;-----------------------------------------------------------------------
[State -3,重拳升龙派生]
type = ChangeState
value = 231
;TriggerAll = var(59)
TriggerAll = RoundState = 2 
TriggerAll = !IsHelper
TriggerAll = StateType = A 
Triggerall = var(7) = 0
trigger1 = stateno = 1106
trigger1 = animelem = 11,>0
trigger1 = movecontact

[State -1,232派生]
type = ChangeState
value = 622
;TriggerAll = var(59)
TriggerAll = RoundState = 2 
TriggerAll = !IsHelper
TriggerAll = StateType = A 
trigger1 = stateno = 232 && movecontact

[State -3,重脚升龙派生]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2 
Triggerall = !isHelper
triggerall = var(56) < 1000
TriggerAll = !IsHelper
Triggerall = StateNo = 1026 && MoveHit
trigger1 = animelem = 4,=2
trigger2 = anim = 1046
trigger2 = animelem = 6
value = 1027

[State -3,重脚升龙派生2，取消接拳升龙]
type = changestate
value = 1028
;TriggerAll = var(59)
TriggerAll = RoundState = 2 
Triggerall = !isHelper
triggerall = var(56) < 1000 
TriggerAll = !IsHelper
TriggerAll = StateNo = 1026 && MoveHit
TriggerAll = animelem = 2,<=2
Trigger1 = var(56) = 903

[State 200, CD脚升龙]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2 
Triggerall = !isHelper
triggerall = StateNo = 1041
trigger1 = animelem = 4,=2
trigger2 = anim = 1046
trigger2 = animelem = 6
value = 1027

[State 3000, 9]
type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2 
Triggerall = !isHelper
Triggerall = var(56) = 0 || EnemyNear,Life <= 150 || Helper(33334),fvar(15)>=100
TriggerAll = !IsHelper
trigger1 = StateNo = 2060 && movehit
trigger1 = animelem = 7,<=0
value = 2061

[State -3,追击02飞翔脚]
Type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType = A 
Triggerall = EnemyNear,MoveType = H
;取消飞翔脚
Trigger1 = StateNo = 1381
Trigger1 = AnimElemTime(13) >= 2
Trigger1 = var(50) := 66061
;置空时间过长
Trigger2 = StateNo = 627 && Ctrl && Time >= 30
Trigger2 = EnemyNear,StateType = A
Trigger2 = var(50) := 66062
value = 660


;-----------------------------------------------------------------------
;连携
;-----------------------------------------------------------------------
[State -3]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = !isHelper
Triggerall = EnemyNear,MoveType = H
Triggerall = var(17) = 4
;todo
Trigger1 = 0
Trigger1 = EnemyNear,Power>=1000&&Power>=900
Trigger1 = EnemyNear,StateType != A
Trigger1 = MoveGuarded
;
Trigger2 = EnemyNear,StateType = A
Trigger2 = MoveContact
Trigger2 = var(50) := 138066
value = 1380

[State -3]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = !isHelper
Triggerall = StateNo = 1382
Triggerall = !MoveHit
Triggerall = Helper(33334),fvar(13) >= 10
;对地非版边
Trigger1 = EnemyNear,StateType != A
Trigger1 = EnemyNear,BackEdgeBodyDist >= 2
Trigger1 = P2BodyDist x-Vel X * 8-fvar(11) * 8 < 50
Trigger1 = P2BodyDist Y-Vel Y * 8-const(movement.yaccel) * 8 * (8 + 1) / 2 <= 50
Trigger1 = var(50) := 63601
;对地版边
Trigger2 = EnemyNear,StateType != A
Trigger2 = EnemyNear,BackEdgeBodyDist <= 2
Trigger2 = P2BodyDist x-Vel X * 8 < 50
Trigger2 = P2BodyDist Y-Vel Y * 8-const(movement.yaccel) * 8 * (8 + 1) / 2 <= 50
Trigger2 = var(50) := 63602
;对空
Trigger3 = EnemyNear,StateType = A
Trigger3 = P2BodyDist x-Vel X * 8 < 50
Trigger3 = P2BodyDist Y-Vel Y * 8-const(movement.yaccel) * 8 * (8 + 1) / 2 = [-15, 30]
Trigger3 = var(50) := 63603
value = 636

[State -3]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = !isHelper
Triggerall = EnemyNear,MoveType = H
Triggerall = EnemyNear,StateType != A
Triggerall = Power<1000
Triggerall = EnemyNear,Power>=1000 || Random%3=0
Trigger1 = StateNo = 225 && AnimElemTime(4) >= 1
Trigger1 = MoveGuarded
;
value = 1500

[State -3]
type = ChangeState
;TriggerAll = var(59)
TriggerAll = RoundState = 2
Triggerall = !isHelper
Triggerall = EnemyNear,MoveType = H
Triggerall = EnemyNear,StateType != A
Triggerall = EnemyNear,Power < 850
Trigger1 = StateNo = 225 && AnimElemTime(4) >= 1
Trigger1 = MoveGuarded
;
value = 1850


;=================================================================================
;打起身5
;=================================================================================
[State -3,跳跃]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 1
TriggerAll = !InGuardDist
TriggerAll = StateType != A
TriggerAll = EnemyNear,StateNo = 5120
;大影跳
Trigger1 = Helper(33334),Fvar(15)<110||P2BodyDist x = [45,120]
Trigger1 = EnemyNear,AnimTime = [-16,-8]
Trigger1 = var(54) := 68
Trigger1 = var(50) := 390501
;大跳
Trigger2= EnemyNear,AnimTime = [-16,-8]
Trigger2 = P2BodyDist x=[10,45]
Trigger2 = var(54) := 66
Trigger2 = var(50) := 390502
;小影跳
Trigger3 = Helper(33334),Fvar(15)<110||P2BodyDist x = [25,50]
Trigger3 = EnemyNear,AnimTime = [-12,-8]
Trigger3 = var(54) := 63
Trigger3 = var(50) := 390503
;小跳
Trigger4 = P2BodyDist x<25
Trigger4 = EnemyNear,AnimTime = [-12,-8]
Trigger4 = var(54) := 61
Trigger4 = var(50) := 390504
value = var(54)
IgnoreHitPause = 1


[State -3,跳跃]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 1 || StateNo = 52
TriggerAll = !InGuardDist
TriggerAll = StateType != A
;打293
Trigger1 = !EnemyNear,Ctrl
Trigger1 = EnemyNear,StateNo = [290,293]
Trigger1 = EnemyNear,StateType = A && EnemyNear,MoveType = H
Trigger1 = var(54) := ifelse(P2BodyDist x < 75,ifelse(P2BodyDist x<30,63,66),68)
Trigger1 = var(50) := 390505
;打受身
Trigger2 = !EnemyNear,Ctrl
Trigger2 = (Helper(33334),var(3)&2**1) || (EnemyNear,PrevStateNo=5050&&EnemyNear,StateType!=A&&EnemyNear,StateType!=L)
Trigger2 = EnemyNear,Vel x != 0
Trigger2 = EnemyNear,AnimTime = [-14,-8]
Trigger2 = P2BodyDist x < 85
Trigger2 = var(54) := 63
Trigger2 = var(50) := 390506
;打硬直
Trigger3 = !EnemyNear,Ctrl
Trigger3 = EnemyNear,StateNo=[150,153]
Trigger3 = EnemyNear,GetHitVar(Hittime)=(0,4]
Trigger3 = P2BodyDist x > 40
Trigger3 = var(54) := 63
Trigger3 = var(50) := 390507
value = var(54)
IgnoreHitPause = 1


;=================================================================================
;移动4 未完成
;=================================================================================
[State -3, 蓄气 Todo]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2 
TriggerAll = !IsHelper
TriggerAll = var(17) = 1
TriggerAll = var(7) = 0
TriggerAll = !InGuardDist
TriggerAll = Power < 4500
TriggerAll = StateType != A
TriggerAll = P2BodyDist x >= 20
;不能被追击
TriggerAll = !NumTarget(660)
TriggerAll = !NumTarget(2060) 
TriggerAll = !NumTarget(1025)
TriggerAll = !NumTarget(1026)
TriggerAll = EnemyNear,StateNo != 5120
Triggerall = EnemyNear,StateNo != [900,939]
;
Trigger1 = P2BodyDist x = [20,50]
Trigger1 = EnemyNear,StateType = L
Trigger1 = var(50) := 980041
;
Trigger2 = EnemyNear,StateNo=5120
Trigger2 = EnemyNear,AnimTime<-20
value = 9800

[State -3,前行抓硬直]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 1
TriggerAll = StateType != A
TriggerAll = !(PlayerIdExist(Helper(33333333),var(3))||EnemyNear,NumProj)
;跑步抓出招硬直
Trigger1 = EnemyNear,Time>-EnemyNear,AnimTime
Trigger1 = EnemyNear,StateNo = [200,4999]
Trigger1 = EnemyNear,StateType != L
Trigger1 = !InGuardDist || EnemyNear,Facing = Facing
Trigger1 = EnemyNear,MoveType = A || EnemyNear,MoveType = I
Trigger1 = EnemyNear,AnimTime < -8
Trigger1 = P2BodyDist X >= 60
Trigger1 = Helper(33334),Fvar(11) <= 0
Trigger1 = StateNo != [98,101]
Trigger1 = var(54) := 99
Trigger1 = var(50) := 10041
;前行抓出招硬直
Trigger2 = EnemyNear,Time > -EnemyNear,AnimTime
Trigger2 = EnemyNear,StateNo = [200,4999]
Trigger2 = EnemyNear,StateType != L
Trigger2 = !InGuardDist || EnemyNear,Facing = Facing
Trigger2 = EnemyNear,MoveType = A || EnemyNear,MoveType = I
Trigger2 = EnemyNear,AnimTime < -8
Trigger2 = Helper(33334),Fvar(11) <= 0
Trigger2 = P2BodyDist X = [0, 60]
Trigger2 = StateNo != 19 && StateNo != [98,101]
Trigger2 = var(54) := 19
Trigger2 = var(50) := 1942
;跑步抓5700
Trigger3 = StateNo != [98,101]
Trigger3 = EnemyNear,StateNo = 5700
Trigger3 = P2BodyDist X >= 45
Trigger3 = var(54) := 99
Trigger3 = var(50) := 10043
;前行抓5700
Trigger4 = StateNo != 19
Trigger4 = EnemyNear,StateNo = 5700
Trigger4 = P2BodyDist X = [0,45]
Trigger4 = var(50) := 001944
Trigger4 = var(54) := 19
;跑步贴近抓防御硬直
Trigger5 = !InGuardDist
Trigger5 = EnemyNear,StateType != A
Trigger5 = EnemyNear,MoveType = H
Trigger5 = EnemyNear,GetHitvar(HitTime) >= 6
Trigger5 = P2BodyDist X >= 60
Trigger5 = StateNo != [98,101]
Trigger5 = var(54) := 99
Trigger5 = var(50) := 10045
;前行贴近抓防御硬直
Trigger6 = !InGuardDist
Trigger6 = EnemyNear,StateType != A
Trigger6 = EnemyNear,MoveType = H
Trigger6 = EnemyNear,GetHitvar(HitTime) >= 6
Trigger6 = P2BodyDist x = [20,60]
Trigger6 = StateNo != 19 && StateNo != [98,101]
Trigger6 = var(54) := 19
Trigger6 = var(50) := 1946
;
Trigger7 = StateNo != [98,101]
Trigger7 = !InGuardDist
Trigger7 = !EnemyNear,Ctrl
Trigger7 = EnemyNear,StateType=S||EnemyNear,StateType=C
Trigger7 = EnemyNear,StateNo>=200
Trigger7 = P2BodyDist x > 10
Trigger7 = var(54) := 99
Trigger7 = var(50) := 99417
value = var(54)

[State -3,前跑]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2 
TriggerAll = !IsHelper
TriggerAll = (var(17) = 1) && (StateNo != [98,101])
TriggerAll = !(PlayerIdExist(Helper(33333333),var(3))||EnemyNear,NumProj)
Triggerall = StateType != A
;大于110必定前跑
Trigger1 = !InGuardDist
Trigger1 = EnemyNear,MoveType!=A
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x >= 110
Trigger1 = var(50) := 9941
;大于80随机前跑
Trigger2 = !InGuardDist
Trigger2 = EnemyNear,MoveType!=A
Trigger2 = EnemyNear,StateType != A
Trigger2 = P2BodyDist x = [75,110]
Trigger2 = Random <= 100
Trigger2 = var(50) := 9942
;抓后背
Trigger3 = !InGuardDist
Trigger3 = EnemyNear,Facing = Facing
Trigger3 = P2BodyDist x > 20
Trigger3 = EnemyNear,StateNo = [200,4999]
Trigger3 = EnemyNear,MoveType = A || EnemyNear,MoveType = I
Trigger3 = EnemyNear,AnimTime < -6
Trigger3 = var(50) := 9943
;打系统眩晕状态
Trigger4 = !InGuardDist
Trigger4 = P2BodyDist x >= 20
Trigger4 = EnemyNear,StateNo = 5300
Trigger4 = var(50) := 9944
;通用地面追击
Trigger5 = !InGuardDist
Trigger5 = EnemyNear,StateType != A
Trigger5 = P2BodyDist x >= 20
Trigger5 = EnemyNear,MoveType = H && !EnemyNear,Ctrl
Trigger5 = EnemyNear,StateNo >= 5000
Trigger5 = EnemyNear,GetHitvar(HitTime) >= 5 || EnemyNear,StateNo = 5700
Trigger5 = var(50) := 9945
;移动到合适的位置打敌人起身
Trigger6 = !InGuardDist
Trigger6 = P2BodyDist x >= 75
Trigger6 = EnemyNear,StateType = L
Trigger6 = var(50) := 9946
;抓对面出招硬直
Trigger7 = !EnemyNear,Ctrl
Trigger7 = EnemyNear,MoveType != H
Trigger7 = EnemyNear,StateNo != 5120
Trigger7 = P2BodyDist x >= 20
Trigger7 = EnemyNear,AnimTime < -6
Trigger7 = (EnemyNear,MoveType = A &&EnemyNear,Time>(-EnemyNear,AnimTime*2)) || EnemyNear,MoveType = I
Trigger7 = EnemyNear,StateNo >= 200
Trigger7 = EnemyNear,NumProj = 0 && PlayerIdExist(Helper(33333333),var(3)) = 0
Trigger7 = var(50) := 99427
;追打可能的落地受身
Trigger8 = P2BodyDist x > 35
Trigger8 = EnemyNear,MoveType = H && !EnemyNear,Ctrl
Trigger8 = EnemyNear,StateNo = 5040
Trigger8 = P2BodyDist Y < -20
Trigger8 = var(50) := 9949
;敌人飞走
Trigger9 = EnemyNear,StateNo >= 5000
Trigger9 = EnemyNear,MoveType = H
Trigger9 = EnemyNear,StateType = A
Trigger9 = P2BodyDist x = (40, 180]
Trigger9 = var(50) := 99411
value = 99

[State -3,前跑]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2 
TriggerAll = !IsHelper
TriggerAll = (var(17) = 1) && (StateNo != [98,101])
Triggerall = StateType != A
TriggerAll = !(PlayerIdExist(Helper(33333333),var(3))||EnemyNear,NumProj)||!InGuardDist
;攻击判定不出
Trigger1 = EnemyNear,StateType != A
Trigger1 = EnemyNear,MoveType=A
Trigger1 = EnemyNear,Time-Enemy,AnimTime>=28
Trigger1 = EnemyNear,Time<=2
Trigger1 = P2BodyDist x>=28
value = 99


[State -3,前进]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A
TriggerAll = !(StateNo = 18 && Time < 20)
Triggerall = Ctrl || StateNo = 18
TriggerAll = EnemyNear,StateType != L
TriggerAll = EnemyNear,StateNo != [5120,5299]
TriggerAll = (PrevStateNo != [140,155]) || P2BodyDist X > 35
TriggerAll = !InGuardDist
TriggerAll = !(PlayerIdExist(Helper(33333333),var(3))||EnemyNear,NumProj)
;对面受击中
Trigger1 = Helper(33334),Fvar(11)<=0
Trigger1 = EnemyNear,StateNo>=5000 
Trigger1 = EnemyNear,MoveType = H && EnemyNear,StateType != L
Trigger1 = EnemyNear,GetHitvar(HitTime)>=3
Trigger1 = P2BodyDist x = [15,90]
Trigger1 = var(50) := 19411
;随机前行
Trigger2 = EnemyNear,MoveType != H
Trigger2 =(P2BodyDist X = [ifelse(var(41)=0,40,90),120])
Trigger2 = Random <= 250
Trigger2 = var(50) := 19412
;随机前行
Trigger3 = EnemyNear,MoveType != H
Trigger3 = P2BodyDist X > 140
Trigger3 = Random <= 350
Trigger3 = var(50) := 19413
;离开版边
Trigger4 = EnemyNear,MoveType != H
Trigger4 = EnemyNear,StateType != A
Trigger4 = P2BodyDist x > 50
Trigger4 = BackEdgeBodyDist <= 20
Trigger4 = var(50) := 19414
;移动到合适的位置打敌人起身
Trigger5 = P2BodyDist x > 55
Trigger5 = EnemyNear,StateType = L
Trigger5 = var(50) := 19415
;抓出招硬直
Trigger6 = EnemyNear,StateNo = [200,4999]
Trigger6 = EnemyNear,StateNo != 5040
Trigger6 = EnemyNear,StateNo != 5120
Trigger6 = P2BodyDist x > 15
Trigger6 = !EnemyNear,Ctrl
Trigger6 = EnemyNear,MoveType = A || EnemyNear,MoveType = I
Trigger6 = var(50) := 19416
;抓后背
Trigger7 = EnemyNear,Facing = Facing
Trigger7 = P2BodyDist x = [25,70]
Trigger7 = EnemyNear,MoveType = A || EnemyNear,MoveType = I
Trigger7 = EnemyNear,AnimTime < -6
Trigger7 = var(50) := 19417
;敌人飞走
Trigger8 = Helper(33334),Fvar(11)<0
Trigger8 = EnemyNear,StateNo >= 5000
Trigger8 = EnemyNear,MoveType = H
Trigger8 = EnemyNear,StateType = A
Trigger8 = P2BodyDist x = [8,40]
Trigger8 = var(50) := 19418
;敌人远距离攻击
Trigger9 = P2BodyDist x >= 130
Trigger9 = EnemyNear,MoveType=A&&EnemyNear,Time<=1
Trigger9 = EnemyNear,AnimTime<-20
Trigger9 = var(50) := 19419
value = 19

[State -3,后退]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = StateType != A
Triggerall = !(StateNo = 99 && Time < 12)
Triggerall = !(StateNo = 19 && Time < 12)
TriggerAll = Ctrl || (StateNo = [98,102]) || StateNo = 19|| StateNo = [120,149]
TriggerAll = !(EnemyNear,MoveType = A || (EnemyNear,MoveType = I && EnemyNear,StateNo < 5000))
TriggerAll = BackEdgeBodyDist > 30
;移动到合适的位置打敌人起身
Trigger1 = !InGuardDist
Trigger1 = P2BodyDist x < 40
Trigger1 = Helper(33334),Fvar(15)>100
Trigger1 = EnemyNear,StateNo = 5120
Trigger1 = var(50) := 18511
;
Trigger2 = !InGuardDist
Trigger2 = EnemyNear,Ctrl || (EnemyNear,MoveType=I&&EnemyNear,StateNo<200)
Trigger2 = P2BodyDist x < 20
Trigger2 = var(50) := 18513
;版边处理
Trigger3 = EnemyNear,MoveType = H && EnemyNear,StateType = A
Trigger3 = EnemyNear,BackEdgeBodyDist < 10 || EnemyNear,FrontEdgeBodyDist < 10  
Trigger3 = P2BodyDist x < 0
Trigger3 = var(50) := 18514
;
Trigger4 = EnemyNear,MoveType = H && EnemyNear,StateType = A
Trigger4 = Helper(33334),fvar(11) > 0
Trigger4 = P2BodyDist x < 20
Trigger4 = var(50) := 18514
;
Trigger5 = !InGuardDist
Trigger5 = P2BodyDist x < 20
Trigger5 = EnemyNear,StateType=L||(EnemyNear,StateNo=5120&&EnemyNear,AnimTime<-16)
Trigger5 = var(50) := 18515
;
value = 18

[State -3,跳跃]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 1
TriggerAll = StateType != A
TriggerAll = Life >= 100
TriggerAll = EnemyNear,Facing!=Facing
TriggerAll = EnemyNear,MoveType!=H
;前小跳 躲投技
Trigger1 = P2BodyDist x < 90
Trigger1 = Helper(33000),var(14) = 3
Trigger1 = var(54) := 61
Trigger1 = var(50) := 390401
;前小影跳 起攻打蹲
Trigger2 = !EnemyNear,Ctrl 
Trigger2 = EnemyNear,StateType=C
Trigger2 = EnemyNear,MoveType=A&&EnemyNear,AnimTime<=-27
Trigger2 = P2BodyDist X = [35,95]
Trigger2 = var(54) := 63
Trigger2 = var(50) := 390402
;起攻打可能有的飞行道具/援助
Trigger3 = (Var(16)&2**8)=0
Trigger3 = EnemyNear,Time<=ifelse(EnemyNear,Time-EnemyNear,AnimTime>=40,4,1)
Trigger3 = !EnemyNear,Ctrl 
Trigger3 = EnemyNear,StateNo=[1000,1999]
Trigger3 = EnemyNear,MoveType=A&&(EnemyNear,Time-EnemyNear,AnimTime)>28
Trigger3 = P2BodyDist X = [45,160]
Trigger3 = var(54) := ifelse(P2BodyDist x<50,66,68)
Trigger3 = var(50) := 390403
;打5040
Trigger4 = P2BodyDist x < 45
Trigger4 = EnemyNear,Time <= 3
Trigger4 = EnemyNear,StateType = A
Trigger4 = EnemyNear,StateNo = 5040
Trigger4 = var(54) := 63
Trigger4 = var(50) := 390404
;打蹲技能
Trigger5 = EnemyNear,StateType != C
Trigger5 = EnemyNear,MoveType=A
Trigger5 = EnemyNear,StateNo=[200,999]
Trigger5 = (P2BodyDist x=[60,100])&&EnemyNear,Time<=1
Trigger5 = var(54) := ifelse(P2BodyDist x>80,63,68)
Trigger5 = var(50) := 390405
;前跳对空
Trigger6 = !InguardDist
Trigger6 = EnemyNear,StateType = A
Trigger6 = EnemyNear,Ctrl
Trigger6 = P2BodyDist X < 60 && Helper(33334),fvar(11) > 0
Trigger6 = P2BodyDist Y = [-50, 0]
Trigger6 = EnemyNear,Vel Y < 0
Trigger6 = var(54) := 65
Trigger6 = var(50) := 390406
;打落地受身
Trigger7 = EnemyNear,StateType != A
Trigger7 = EnemyNear,StateType != L
Trigger7 = EnemyNear,PrevStateNo = 5050
Trigger7 = EnemyNear,Time >= 15
Trigger7 = P2BodyDist x < 90
Trigger7 = var(54) := ifelse(P2BodyDist x < 45, 61, 63)
Trigger7 = var(50) := 390407
;打落地受身2
Trigger8 = EnemyNear,StateType != A
Trigger8 = EnemyNear,MoveType = I
Trigger8 = EnemyNear,PrevStateNo = 5050
Trigger8 = P2BodyDist x = [90, 130]
Trigger8 = var(54) := 68
Trigger8 = var(50) := 390408
;起攻
Trigger9 = Life>=200
Trigger9 = !InGuardDist
Trigger9 = Helper(33334),var(6)=0
Trigger9 = EnemyNear,StateType!=A
Trigger9 = P2BodyDist x = [70,130]
Trigger9 = Helper(33334),Fvar(11) <= 0
Trigger9 = var(54) := ifelse(P2BodyDist x<90,66,68)
Trigger9 = var(50) := 390409
;前跳对空
Trigger10 = !InguardDist
Trigger10 = EnemyNear,StateType = A
Trigger10 = EnemyNear,Ctrl
Trigger10 = P2BodyDist X < 60 && Helper(33334),fvar(11) > 0
Trigger10 = P2BodyDist Y = [-50, 0]
Trigger10 = EnemyNear,Vel Y >= 0
Trigger10 = BackEdgeBodyDist >= 60
Trigger10 = var(54) := 64
Trigger10 = var(50) := 390410
;起攻打硬直时间长的
Trigger11 = (Var(16)&2**8)=0
Trigger11 = EnemyNear,MoveType = A
Trigger11 = EnemyNear,StateNo = [200,1999]
Trigger11 = EnemyNear,StateType = S
Trigger11 = EnemyNear,Time-EnemyNear,AnimTime>=30
Trigger11 = EnemyNear,Time<=2
Trigger11 = P2BodyDist X=[70,150]
Trigger11 = var(54) := ifelse(P2BodyDist x>85,68,63)
Trigger11 = var(50) := 390411
;起攻打普通攻击
Trigger12 = !EnemyNear,Ctrl 
Trigger12 = EnemyNear,StateNo=[200,999]
Trigger12 = EnemyNear,StateType != A
Trigger12 = EnemyNear,Time <= 2
Trigger12 = EnemyNear,MoveType = A&&EnemyNear,AnimTime<=-28
Trigger12 = P2BodyDist x<=110
Trigger12 = P2BodyDist X>=ifelse(EnemyNear,StateType=C,60,80)
Trigger12 = var(54) := 68
Trigger12 = var(50) := 390412
;原地跳对空
Trigger13 = !InguardDist
Trigger13 = EnemyNear,StateType = A
Trigger13 = EnemyNear,Ctrl
Trigger13 = EnemyNear,Vel x>0
Trigger13 = P2BodyDist x<70&&EnemyNear,StateNo=50&&EnemyNear,Time<=2
Trigger13 = var(54) := 65
Trigger13 = var(50) := 390413
;起攻打常态
Trigger14 = Helper(33334),var(6) = 0
Trigger14 = EnemyNear,Ctrl||EnemyNear,MoveType=I
Trigger14 = EnemyNear,StateNo=[0,29]
Trigger14 = !InGuardDist
Trigger14 = P2BodyDist X = [75,120]
Trigger14 = var(54) := 68
Trigger14 = var(50) := 390414
value = var(54)


[State -3,补充，防止原地发愣]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 1
TriggerAll = StateType != A
TriggerAll = Life >= 100
TriggerAll = EnemyNear,Facing!=Facing
TriggerAll = !InGuardDist
TriggerAll = EnemyNear,StateType!=A&&EnemyNear,MoveType=I
TriggerAll = StateNo=0&&Time>=12&&P2BodyDist x<30
;
Trigger1 = BackEdgeBodyDist>20
Trigger1 = var(54):=18
Trigger1 = var(50):=18516
;
Trigger2 = BackEdgeBodyDist<20
Trigger2 = var(54):=19
Trigger2 = var(50):=19516
value = var(54)

;=================================================================================
;立回3
;待完成：
;1.版边需要再加trigger
;2.02飞翔脚空挥攒气
;=================================================================================
[State -1]
type = ChangeState
value = 625
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 6 || (stateno = 627 && ctrl)
Triggerall = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
Triggerall = Helper(33334),fvar(13) >= 6
;对空 
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist X- Vel X*5-Helper(33334),fvar(11)*5 = [-10,10]
Trigger1 = P2BodyDist y-Vel Y*5-const(movement.yaccel)*5*(5+1)/2+EnemyNear,Vel Y*5+Helper(33334),fvar(12)*5*(5+1)/2=[-5,55]
Trigger1 = var(50) := 62531
;对地 
Trigger2 = EnemyNear,Facing=Facing
Trigger2 = EnemyNear,StateType != A
Trigger2 = EnemyNear,MoveType=A&&(EnemyNear,StateNo=[1000,1999])&&EnemyNear,Time<=2
Trigger2 = (P2BodyDist X- Vel X*5-Helper(33334),fvar(11)*5 = [-10,10])||Helper(33334),Fvar(15)<85
Trigger2 = pos Y + vel y*5+const(movement.yaccel)*5*6/2 = [-70,-50]
Trigger2 = var(50) := 62532


[State -3, 百合折]
Type = ChangeState
value = 615
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 6
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = Helper(33334),fvar(13) >= 8
;对地
Trigger1 = P2BodyDist x < -10
Trigger1 = EnemyNear,BackEdgeBodyDist > 35
Trigger1 = EnemyNear,StateType != A
Trigger1 = Vel Y > 0 || (P2BodyDist x < -15 && EnemyNear,Vel x > 0)
Trigger1 = P2BodyDist X-Vel X*9 < -5
Trigger1 = Helper(33334),fvar(13) = [9,ifelse(EnemyNear,StateType=C,15,18)]
Trigger1 = var(50) := 61531

[State -3, JA]
Type = ChangeState
value = 600
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 6
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对地
Trigger1 = EnemyNear,StateType != A
Trigger1 = Vel Y > 0
Trigger1 = P2BodyDist X-Vel X*5=[-35, 35]
Trigger1 = Helper(33334),fvar(13) = [6,12]
Trigger1 = var(50) := 60031

[State -3, JB]
Type = ChangeState
value = 610
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 6
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = Helper(33334),fvar(13) >= 5
;对空
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist X- Vel X*3-Helper(33334),fvar(11)*3 = [0, 50]
Trigger1 = P2BodyDist y-Vel Y*3-const(movement.yaccel)*3*(3+1)/2+EnemyNear,Vel Y*3+Helper(33334),fvar(12)*3*(3+1)/2=[-55,25]
Trigger1 = var(50) := 61031

[State -3, JC]
Type = ChangeState
value = 620
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 6
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = Helper(33334),fvar(13) >= 5
;原地JC对空 anim 623
Trigger1 = Helper(33334),fvar(13) >= 5
Trigger1 = vel X = 0
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist X- Vel X*4-Helper(33334),fvar(11)*4 = [25, 35]
Trigger1 = P2BodyDist y-Vel Y*4-const(movement.yaccel)*4*(4+1)/2+EnemyNear,Vel Y*4+Helper(33334),fvar(12)*4*(4+1)/2=[-15,25]
Trigger1 = var(50) := 62031
;Todo 发挥不稳定，出招太慢了，有速度JC对空 anim 627
Trigger2 = 0
Trigger2 = vel X != 0
Trigger2 = Helper(33334),fvar(13) >= 15
Trigger2 = EnemyNear,StateType = A
Trigger2 = P2BodyDist X- Vel X*14-Helper(33334),fvar(11)*14 = [25, 45]
Trigger2 = P2BodyDist y-Vel Y*14-const(movement.yaccel)*14*(14+1)/2+EnemyNear,Vel Y*14+Helper(33334),fvar(12)*14*(14+1)/2=[-25,25]
Trigger2 = var(50) := 62032


[State -3, JD, ANIM 636]
Type = ChangeState
value = 630
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 6
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = Helper(33334),fvar(13) >= 9
Triggerall = vel X != 0
;对空 
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist X- Vel X*8-Helper(33334),fvar(11)*8 = [30, 45]
Trigger1 = P2BodyDist y-Vel Y*8-const(movement.yaccel)*8*(8+1)/2+EnemyNear,Vel Y*8+Helper(33334),fvar(12)*8*(8+1)/2=[-5,35]
Trigger1 = var(50) := 63031
;对地
Trigger2 = EnemyNear,StateType != A
Trigger2 = Vel Y > 0
Trigger2 = EnemyNear,Pos Y < -45
Trigger2 = P2BodyDist X-Vel X*8-Helper(33334),fvar(11)*8 = [30, 45]
Trigger2 = P2BodyDist Y-Vel Y*5-const(movement.yaccel)*5*(5+1)/2<=ifelse(EnemyNear,StateType=C,35,55)
Trigger2 = var(50) := 63032


[State -3, JCD, ANIM 641]
Type = ChangeState
value = 640
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 6
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = Helper(33334),fvar(13) >= 12
;对空 
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist X- Vel X*11-Helper(33334),fvar(11)*11 = [25, 60]
Trigger1 = P2BodyDist y-Vel Y*11-const(movement.yaccel)*11*(11+1)/2+EnemyNear,Vel Y*11+Helper(33334),fvar(12)*11*(11+1)/2=[-15,35]
Trigger1 = var(50) := 64031
;对地
Trigger2 = EnemyNear,StateType != A
Trigger2 = Vel Y > 0
Trigger2 = P2BodyDist X-Vel X*11=[25, 55]
Trigger2 = P2BodyDist Y-Vel Y*11-const(movement.yaccel)*11*(11+1)/2<=ifelse(EnemyNear,StateType=C,35,50)
Trigger2 = var(50) := 64032

[State -3, 02飞翔脚]
Type = ChangeState
value = 1380
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 6
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = Helper(33334),fvar(13) >= 2
;对空 
Trigger1 = EnemyNear,StateType=A
Trigger1 = P2BodyDist X-Helper(33334),fvar(11)*2 = [-15, 20]
Trigger1 = P2BodyDist y+EnemyNear,Vel Y*2+Helper(33334),fvar(12)*2*(2+1)/2=[-5,35]
Trigger1 = var(50) := 138031
;对地
Trigger2 = EnemyNear,StateType!=A
Trigger2 = EnemyNear,StateNo = [200,999]
Trigger2 = EnemyNear,MoveType=A&&EnemyNear,Time<=ifelse((EnemyNear,Time-EnemyNear,AnimTime>=28),6,3)
Trigger2 = P2BodyDist x = [-5, 85]
Trigger2 = Pos Y < -30
Trigger2 = var(50) := 138032
;对地 抢招
Trigger3 = InGuardDist
Trigger3 = EnemyNear,Time<-EnemyNear,AnimTime
Trigger3 = EnemyNear,Facing!=Facing
Trigger3 = EnemyNear,StateType!=A
Trigger3 = EnemyNear,StateNo>=1000
Trigger3 = EnemyNear,MoveType=A
Trigger3 = EnemyNear,Time>=4
Trigger3 = Pos Y < -85
Trigger3 = P2BodyDist x = [10,65]
Trigger3 = Helper(33334),Fvar(11)>=0
Trigger3 = var(50) := 138033

[State -3, 变速]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 6
TriggerAll = StateType = A
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
;对地 抢招
Trigger1 = EnemyNear,Facing=Facing
Trigger1 = EnemyNear,StateType!=A
Trigger1 = EnemyNear,StateNo>=1000
Trigger1 = EnemyNear,MoveType=A
Trigger1 = EnemyNear,Time=[1,6]
Trigger1 = P2BodyDist x = [-10, 10]
Trigger1 = Pos Y < -50
Trigger1 = var(50) := 130034
Trigger1 = var(54) := 1300
;对地 躲招
Trigger2 = EnemyNear,Facing!=Facing
Trigger2 = EnemyNear,StateType!=A
Trigger2 = EnemyNear,StateNo>=1000
Trigger2 = EnemyNear,MoveType=A
Trigger2 = EnemyNear,Time=[1,4]
Trigger2 = P2BodyDist x<0
Trigger2 = Helper(33334),Fvar(15)<40
Trigger2 = Pos Y < -50
Trigger2 = Vel Y >= 0
Trigger2 = var(50) := 130035
Trigger2 = var(54) := 625
value = var(54)


[State -1]
type = ChangeState
value = 850
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 6
Triggerall = StateType = A
Triggerall = StateNo != 950
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
Triggerall = EnemyNear,StateType = A
Trigger1 = P2BodyDist x = [-5, 10]
Trigger1 = P2BodyDist Y = [-5, 20]

;------------------------------------------------------------------------------------------------
;以下是投技，注意优先级不要比抓硬直高
;------------------------------------------------------------------------------------------------
[State -3,D投]
Type = ChangeState
value = 801
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 1
TriggerAll = StateNo != 99
TriggerAll = StateType != A
TriggerAll = EnemyNear,MoveType != H && EnemyNear,StateType != A && EnemyNear,StateType != L
TriggerAll = (abs(P2BodyDist X) <= 10)
TriggerAll = EnemyNear,StateNo != 52
TriggerAll = BackEdgeBodyDist < FrontEdgeBodyDist
TriggerAll = EnemyNear,StateNo != [5000,5999]
TriggerAll = EnemyNear,Vel x = 0
Triggerall = EnemyNear,Vel Y = 0
;抢普通技能
Trigger1 = EnemyNear,MoveType = A
Trigger1 = EnemyNear,Time <= 2 && EnemyNear,StateNo = [200,999]
Trigger1 = var(50) := 80131
;抓不到的硬直
Trigger2 = EnemyNear,MoveType = A || EnemyNear,MoveType = I
Trigger2 = EnemyNear,AnimTime >= -2
Trigger2 = var(50) := 80132
IgnoreHitPause = 1
;------------------------------------------------------------------------------------------------
;站普通技
;------------------------------------------------------------------------------------------------
[State -3, 远重脚 Anim=211]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 1
Triggerall = !InGuardDist
TriggerAll = StateType != A
TriggerAll = (abs(P2BodyDist X) > 28)
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = !PlayerIdExist(Helper(33333333),var(3)) || abs(PlayerId(Helper(33333333),var(3)),P2BodyDist x) > 50
TriggerAll = EnemyNear,Facing != Facing
TriggerAll = !(PlayerIdExist(Helper(33333333),var(3))||EnemyNear,NumProj)
;封起跳
Trigger1 = EnemyNear,MoveType = I
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - Helper(33334),fvar(11) * 8 = [15,80]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 8 + Helper(33334),fvar(12) * 8 * (8 + 1) / 2 = [-60,-35]
Trigger1 = var(50) := 23001
Value = 230

[State -3, 近轻拳]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 1
Triggerall = !InGuardDist
TriggerAll = StateType != A
TriggerAll = (abs(P2BodyDist X) < 28)
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = !PlayerIdExist(Helper(33333333),var(3)) || abs(PlayerId(Helper(33333333),var(3)),P2BodyDist x) > 50
TriggerAll = EnemyNear,Facing != Facing
TriggerAll = !(PlayerIdExist(Helper(33333333),var(3))||EnemyNear,NumProj)
;封起跳
Trigger1 = EnemyNear,MoveType = I
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x - Helper(33334),fvar(11) * 5 = [-5,28]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 5 + Helper(33334),fvar(12) * 5 * (5 + 1) / 2 = [-60,-35]
Trigger1 = var(50) := 20531
Value = 205

[State -3, 远轻脚 Anim=211]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 1
Triggerall = !InGuardDist
TriggerAll = StateType != A
TriggerAll = (abs(P2BodyDist X) > 28)
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = !PlayerIdExist(Helper(33333333),var(3)) || abs(PlayerId(Helper(33333333),var(3)),P2BodyDist x) > 50
TriggerAll = EnemyNear,Facing != Facing
TriggerAll = !(PlayerIdExist(Helper(33333333),var(3))||EnemyNear,NumProj)
;封起跳
Trigger1 = EnemyNear,MoveType = I
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x-Helper(33334),fvar(11)*7 = [-5,38]
Trigger1 = EnemyNear,pos y+EnemyNear,Vel Y*7+Helper(33334),fvar(12)*7*(7+1)/2=[-50,-35]
Trigger1 = var(50) := 21031
Value = 210

[State -3, 远轻拳]
Type = Null;ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 1
TriggerAll = RoundState = 2
TriggerAll = StateType != A
TriggerAll = (abs(P2BodyDist X) >= 28)
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = !PlayerIdExist(Helper(33333333),var(3)) || abs(PlayerId(Helper(33333333),var(3)),P2BodyDist x) > 50 
Triggerall = var(41) = 0 ;无当身技能
TriggerAll = !(PlayerIdExist(Helper(33333333),var(3))||EnemyNear,NumProj)
Triggerall = helper(33334),var(5) <= 0
;对地
Trigger1 = !InGuardDist
Trigger1 = Random < 50
Trigger1 = EnemyNear,StateType != A
Trigger1 = EnemyNear,Vel x >= 0
Trigger1 = p2bodydist x-ifelse(EnemyNear,StateNo >= 200,Helper(33334),fvar(11)*5, 0) = [65,75]
Trigger1 = var(50) := 20031
Value = 200

;------------------------------------------------------------------------------------------------
;蹲普通技
;------------------------------------------------------------------------------------------------
[State -3, 2D抓落地硬直]
Type = ChangeState
value = 430
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 1
TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = !(PlayerIdExist(Helper(33333333),var(3))||EnemyNear,NumProj)
;
Triggerall = EnemyNear,Facing != Facing
Trigger1 = EnemyNear,StateType = A && EnemyNear,StateNo != 5040
Trigger1 = EnemyNear,MoveType != H
Trigger1 = P2BodyDist x = [10,80]
Trigger1 = Helper(33334),Fvar(14) = (7,8]
Trigger1 = var(50) := 43031

[State -3,下重拳 Anim 440]
Type = ChangeState
value = 420
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 1
TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = !(PlayerIdExist(Helper(33333333),var(3))||EnemyNear,NumProj)
TriggerAll = EnemyNear,Facing != Facing
;对空
Trigger1 = EnemyNear,StateType = A && EnemyNear,StateNo != 5040
Trigger1 = EnemyNear,MoveType != H
Trigger1 = P2BodyDist x-Helper(33334),fvar(11) * 10 = [5,28]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 10 + Helper(33334),fvar(12) * 10 * (10 + 1) / 2 = [-55,-25)
Trigger1 = var(50) := 42031
IgnoreHitPause = 1


[State -3,蹲轻拳]
Type = ChangeState
value = 400
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 1
TriggerAll = StateType != A
TriggerAll = (EnemyNear,Ctrl || EnemyNear,StateNo <= 199)
TriggerAll = !InGuardDist
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = !PlayerIdExist(Helper(33333333),var(3)) || abs(PlayerId(Helper(33333333),var(3)),P2BodyDist x) > 50 
TriggerAll = !(PlayerIdExist(Helper(33333333),var(3))||EnemyNear,NumProj)
;对地
Trigger1 = helper(33334),var(5) <= 0
Trigger1 = var(41) = 0
Trigger1 = !PlayerIdExist(Helper(33333333),var(3)) || abs(PlayerId(Helper(33333333),var(3)),P2BodyDist x) > 50 
Trigger1 = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
Trigger1 = EnemyNear,Vel x >= 0
Trigger1 = P2BodyDist x = [40, 50]
Trigger1 = var(50) := 40031
;骗当身
Trigger2 = helper(33334),var(5) <= 0 
Trigger2 = Random < 50 || (var(41) > 0 && random<200)
Trigger2 = (P2BodyDist x >= 0 && EnemyNear,Facing != Facing) || (P2BodyDist x <= 0 && EnemyNear,Facing = Facing)
Trigger2 = EnemyNear,StateType != A && EnemyNear,Vel Y = 0
Trigger2 = EnemyNear,Vel x >= 0
Trigger2 = P2BodyDist x = [82, 100]
Trigger2 = var(50) := 40032
;抓落地硬直
Trigger3 = Helper(33334),fvar(14) = [4,6]
Trigger3 = P2BodyDist x - Helper(33334),fvar(14)*Helper(33334),fvar(11) = [0, 40]
Trigger3 = var(50) := 40033
IgnoreHitPause = 1

;------------------------------------------------------------------------------------------------
;必杀技
;------------------------------------------------------------------------------------------------
[State -3,三连击]
Type = ChangeState
value = 1450
;TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = [1,3]
TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = !PlayerIdExist(Helper(33333333),var(3)) && !EnemyNear,NumProj 
;1段对空
Trigger1 = Fvar(14) > 13
Trigger1 = EnemyNear,StateType = A
Trigger1 = P2BodyDist x-Helper(33334),fvar(11) * 9 = [40,70]
Trigger1 = EnemyNear,pos y + EnemyNear,Vel Y * 9 + Helper(33334),fvar(12) * 9 * (9 + 1) / 2 = [-40,-20)
Trigger1 = var(50) := 145031

[State -3,三连击]
Type = varset
Triggerall = var(50) = 145031
Trigger1 = StateNo = 1450 && MoveHit
Trigger1 = EnemyNear,MoveType = H && EnemyNear,StateNo >= 5000
var(56) = ifelse(EnemyNear,StateType = A, 302, 301)

[State -3,飞燕斩 CD升龙]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = [1,3]
TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = (EnemyNear,MoveType != H || (EnemyNear,StateNo = [120,159])) && EnemyNear,StateType != L && EnemyNear,StateNo != 5120
TriggerAll = !PlayerIdExist(Helper(33333333),var(3)) && !EnemyNear,NumProj
TriggerAll = EnemyNear,StateType = A && EnemyNear,StateNo != 5040
;1段对空
Trigger1 = EnemyNear,Facing != Facing
Trigger1 = P2BodyDist x-Helper(33334),fvar(11) * 9 = [0,45]
Trigger1 = EnemyNear,pos y+EnemyNear,Vel Y*9+Helper(33334),fvar(12)*9*(9+1)/2=[-35,-10]
Trigger1 = var(50) := 104031
;2段对空
Trigger2 = EnemyNear,Facing != Facing
Trigger2 = P2BodyDist x-Helper(33334),fvar(11)*11 = [0,50]
Trigger2 = EnemyNear,pos y+EnemyNear,Vel Y*11 + Helper(33334),fvar(12)*11*(11+1)/2=[-95,-35]
Trigger2 = var(50) := 111032
;1段对空 版边
Trigger3 = BackEdgeBodyDist <= 2
Trigger3 = P2BodyDist x-Helper(33334),fvar(11)*9<45
Trigger3 = EnemyNear,pos y+EnemyNear,Vel Y*9+Helper(33334),fvar(12)*9*(9+1)/2=[-35,-10]
Trigger3 = var(50) := 104033
value = 1040

[State -3]
Type = ChangeState
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = Ctrl || StateNo = 50 || StateNo = 950
TriggerAll = StateType = A
TriggerAll = InGuardDist
Trigger1 = EnemyNear,MoveType != H
Trigger1 = EnemyNear,MoveType=A||EnemyNear,MoveType=I
Trigger1 = P2BodyDist x>=100 && Helper(33334),Fvar(11)<0
Trigger1 = Vel Y > 0 && Pos Y >= -80
value = 1210

;=================================================================================
;其他2
;=================================================================================
[State -3, 02飞翔脚]
Type = ChangeState
value = 1380
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 6
TriggerAll = StateType = A
;
Trigger1 = Vel x < 0
Trigger1 = Helper(33334),Fvar(11)<0
Trigger1 = P2BodyDist x > 40
Trigger1 = 138021
;
Trigger2 = !InGuardDist
Trigger2 = Vel x < 0
Trigger2 = P2BodyDist x >= 120
Trigger2 = 138023

[State -3,后滚]
Type = changestate
TriggerAll = var(59)
TriggerAll = RoundState = 2
TriggerAll = !IsHelper
TriggerAll = var(17) = 1
TriggerAll = StateType != A 
TriggerAll = BackEdgeBodyDist >= 90
TriggerAll = !(EnemyNear,numproj || PlayerIdExist(Helper(33333333),var(3)))
;对方攻击的距离大于我们能攻击到的最大距离，就后撤一下
Trigger1 = (var(3)&2**8) = 0
Trigger1 = EnemyNear,MoveType = A && !EnemyNear,Ctrl
Trigger1 = Helper(33000),var(11) != 3
Trigger1 = InGuardDist
Trigger1 = EnemyNear,StateNo = [200,999]
Trigger1 = Life >= 200
Trigger1 = Random < 100
Trigger1 = EnemyNear,StateType != A
Trigger1 = P2BodyDist x = [85,110]
Trigger1 = EnemyNear,Vel X <= 0
Trigger1 = EnemyNear,animtime = [-23, -10]
Trigger1 = var(50) := 36021
value = 360

[State -1, 落地受身]
type = ChangeState
value = 5200
TriggerAll = var(59)
TriggerAll = RoundState = 2
triggerall = !Ishelper
triggerall = roundstate = 2
triggerall = alive = 1
triggerall = StateNo = 5050 || StateNo = 5071
triggerall = anim != 5052 && anim != 5062
trigger1 = Vel Y > 0
trigger1 = Pos Y >= -20

;=================================================================================
;防御1
;=================================================================================
[State -3, 防御]
Type = ChangeState
Value = 120
TriggerAll = var(59)
TriggerAll = RoundState = 2 
TriggerAll = !IsHelper
TriggerAll = var(17) = 1
Triggerall = StateNo != [120,159]
Triggerall = !(EnemyNear,Time-EnemyNear,AnimTime>=40&&EnemyNear,Time<9&&P2BodyDist x>120)
Triggerall = !(EnemyNear,Time-EnemyNear,AnimTime>=28&&EnemyNear,Time<6&&P2BodyDist x>120)
Triggerall = !(EnemyNear,Facing=Facing&&P2BodyDist x>60)
Triggerall = !(EnemyNear,Time<=10&&EnemyNear,Time-EnemyNear,AnimTime>=36&&EnemyNear,StateNo=[1000,1999])
;
Trigger1 = EnemyNear,MoveType=A&&(EnemyNear,Time<-EnemyNear,AnimTime||EnemyNear,AnimTime>0)
Trigger1 = StateType != A
Trigger1 = var(50) := 012011
;
Trigger2 = P2BodyDist X = [-55,80]
Trigger2 = NumHelper(33000)>0
Trigger2 = Helper(33000),InGuardDist
Trigger2 = Facing*EnemyNear,Facing!=-1 || P2Dist X<0
Trigger2 = var(50) := 012012
IgnoreHitPause = 1


;S0,0 普通跳
;S0,1 影跳

;60 中跳 (低
;61 前跳 (低
;62 后跳 (低
;63 前跳 (低 影
;64 后跳 (低 影
;65 中跳
;66 前跳
;67 后跳
;68 前跳 影
;69 后跳 影




;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
; Run forward
[Statedef 99]
type    = S
physics = S
anim = 100
sprpriority = 1
movetype = I
velset = 0
ctrl = 0

[State 100, 2] ;Prevent run from canceling into walk
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 100, 3] ;Prevent from turning
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[state 100]
type = velset
trigger1 = time <= 2
x = 0

[State 100, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 98
;---------------------------------------------------------------------------
[Statedef 98]
type = S
movetype = I
physics = N
anim = 101
ctrl = 0


[State 100, 1]
type = VelSet
trigger1 = 1
x = const(velocity.run.fwd.x)

[State 100, 0]
type = PlaySnd
trigger1 = AnimElem = 1
value = 0,3
loop = 1
channel = 1


[State 100, 5.2]
type = ChangeState
triggerall = AnimElem = 3,>= 3
Trigger1 = EnemyNear,Ctrl
Trigger1 = P2BodyDist x <= 30
;
Trigger2 = EnemyNear,StateType != L
Trigger2 = P2BodyDist x < 10
;
Trigger3 = Helper(33334),Fvar(11) > 0
Trigger3 = P2BodyDist x <= 40
;
Trigger4 = P2BodyDist x <= 20 && EnemyNear,BackEdgeBodyDist >= 2
value = 102

;---------------------------------------------------------------------------
; AI Walk Foward
[Statedef 19]
type    = S
physics = N
sprpriority = 0

[State 21, 1]
Type = Turn
Trigger1 = EnemyNear,MoveType != H
Trigger1 = P2Dist X < 0

[State 20, 1]
type = VelSet
trigger1 = 1
x = const(velocity.walk.fwd.x)

[State 20, 3]
type = ChangeAnim
triggerall = var(7) = 0 
trigger1 = Anim != 20 && Anim != 5
trigger2 = Anim = 5 && AnimTime = 0
value = 20

[State 20, 3]
type = ChangeAnim
triggerall = var(7) > 0
trigger1 = Anim != 22 && Anim != 5
trigger2 = Anim = 5 && AnimTime = 0
value = 22

[State 19, Exit]
Type = ChangeState
Triggerall = Time>=12
Trigger1 = RoundState != 2
;
Trigger2 = P2BodyDist x <= ifelse(EnemyNear,MoveType=H,5,10)
;
Trigger3 = EnemyNear,Ctrl||EnemyNear,MoveType=I&&EnemyNear,Stateno=[0,29]
Trigger3 = P2bodydist x <= ifelse(EnemyNear,Facing=Facing,10,30)
value = 0
ctrl =1

;---------------------------------------------------------------------------
; AI Walk Back
[Statedef 18]
type    = S
physics = N;S
sprpriority = 0

[State 20, 2]
type = VelSet
trigger1 = 1
x = const(velocity.walk.back.x)

[State 20, 4]
type = ChangeAnim
triggerall = !(var(7) > 0) 
trigger1 = Anim != 21 && Anim != 5
trigger2 = Anim = 5 && AnimTime = 0
value = 21

[State 20, 4]
type = ChangeAnim
triggerall = var(7) > 0
trigger1 = Anim != 23 && Anim != 5
trigger2 = Anim = 5 && AnimTime = 0
value = 23

[State 19, Exit]
Type = ChangeState
TriggerAll = Time >= 16
Trigger1 = RoundState != 2
;
Trigger2 = P2BodyDist x >= 40
;
value = 0
ctrl =1