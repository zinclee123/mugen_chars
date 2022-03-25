[Statedef -2]

[State 当身???助]
type = Helper
trigger1 = movereversed
trigger1 = !numhelper(33501)
helpertype = normal ;player
name = "movereversed"
ID = 33501
stateno = 33501
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 999999
pausemovetime = 999999
ignorehitpause= 1

[State -2, helper型?道id上限?取]
Type = Helper
triggerall = !((stateno = [358000,358006]) || ALIVE = 0 || (prevstateno = [358000,358006]) || (stateno = [8900,8903]))
trigger1 = !ishelper
trigger1 = !NumHelper(28036 + id)
PosType = P1
StateNo = 28036
id = 28036 + id
PauseMoveTime = 0
Persistent = 0
IgnoreHitPause = 1
KeyCtrl = 0
Ownpal = 0
supermovetime = 999
pausemovetime = 999

[State -3, コマンドを入れたらVarをON] 
type = VarSet
triggerall = !var(59)
trigger1 = command = "jump"
trigger1 = ctrl
trigger2 = prevstateno = 100 
trigger2 = command = "holdfwd"
v = 3
value = 1

[State -3, sysvarを引継ぐ]
type = VarSet
trigger1 = Var(3) = 1
trigger1 = stateno = 40 ;ジャンプする前のステート
trigger1 = AnimTime = 0 ;ジャンプ方向を決めるsysvarがリセットされる寸前
var(3) = ifelse(sysvar(1) = 0, 2, ifelse(sysvar(1)=1, 3, 4))

[State -3, AI]
type = VarSet
trigger1 = (stateno = [34,37])
trigger1 = AnimTime = 0
var(3) = ifelse(sysvar(1) = 0, 2, ifelse(sysvar(1)=1, 3, 4))

[State -3, varをOFFにするステート]
type = VarSet
triggerall = Time = 2
trigger1 = stateno = 50
trigger2 = stateno != [40,59]
v = 3
value = 0

[State -3, 前にボタンを押してたら前にも加速]
type = VelAdd
trigger1 = var(3) = 3
trigger1 = stateno = 50
x = ifelse(var(51) > 700,3,1.8);1.8

[State -3, 後ろなら後ろに加速]
type = VelAdd
trigger1 = var(3) = 4
trigger1 = stateno = 50
x = -1.8

[State -3, 垂直ジャンプにveladdを使って上に加速]
type = VelAdd
trigger1 = var(3) = 2
trigger1 = stateno = 50 
y = -1.8

[State -3, 成功したときの残像]
type = AfterImage
trigger1 = var(3) >= 1
trigger1 = stateno = 50
time = 25
trans = add1
length = 4
timeGap = 3
frameGap = 1
palBright = 0, 0, 0
palContrast = 128, 128, 128
palAdd = 0, 0, 0
palMul = 1, 1, 1

;人物版??退速度-----------------------------------------------------------------------------
[State -2, 1]
Type = VarSet
Trigger1 = MoveContact = 1
FV = 18
Value = 0 ;?个?一下，因??取方式是从下?先的，所以默?条件相当于&&1那?，除了最下面的条件以外的触摸都是0，所以不能装-3下
ignorehitpause = 1

[State -2, 2]
Type = VarSet
Trigger1 = FVar(18) >= 0
Trigger2 = EnemyNear(Var(58)),StateNo != [154,155]
Trigger2 = EnemyNear(Var(58)),MoveType != H || EnemyNear(Var(58)),GetHitVar(HitTime) = 0
Trigger3 = FVar(18) = [-1,0]
Trigger4 = EnemyNear(Var(58)),StateNo = [154,155]
Trigger4 = EnemyNear(Var(58)),Ctrl
Trigger5 = EnemyNear(Var(58)),StateNo = [5100,5119]
Trigger6 = EnemyNear(Var(58)),StateNo = [5200,5219]
Trigger7 = EnemyNear(Var(58)),StateNo = 5001 || EnemyNear(Var(58)),StateNo = 5011
Trigger7 = EnemyNear(Var(58)),Time >= EnemyNear(Var(58)),GetHitVar(SlideTime)
FV = 18
Value = 0 ;?些是取消位移?的条件，不多?了，slidetime就是滑行??，hitdef里面的

[State -2, 3]
Type = PosAdd
TriggerAll = FVar(18) < 0
TriggerAll = StateType = S || StateType = C
TriggerAll = EnemyNear(Var(58)),GetHitVar(HitShakeTime) <= 0
Trigger1= EnemyNear(Var(58)),BackEdgeBodyDist <= 0 || EnemyNear(Var(58)),FrontEdgeBodyDist <= 0
X = (FVar(18)) ;在hitpausetime?束后来位移

[State -2, 4]
Type = VarSet
Trigger1 = FVar(18) < 0
Trigger1 = EnemyNear(Var(58)),GetHitVar(HitShakeTime) <= 0
FV = 18
Value = FVar(18) * ((EnemyNear(Var(58)),StateType = S || EnemyNear(Var(58)),StateType = C) * 0.85) ;一般是0.85的摩擦系数，?个可以根据自己的系数不同来改

[State -2, 5] 
Type = VarSet
Triggerall = MoveContact = 1
Trigger1 = STATENO = 610 || STATENO = 710 || STATENO = 801 || STATENO = 980 || STATENO = 990 || (STATENO = [200,500])
Trigger2 = STATENO = 3116
FV = 18
Value = -EnemyNear(Var(58)),GetHitVar(XVel)*Facing * (EnemyNear(Var(58)),StateType = S || EnemyNear(Var(58)),StateType = C);先?取一下?方的受?初速度
ignorehitpause = 1

;-----------------------------------------------------------------------------
;AI用重力加速度計測
;-----------------------------------------------------------------------------
[State -2, yaccel]
type = VarSet
trigger1 = fvar(20) != enemynear(var(58)),const(movement.yaccel)
trigger1 = enemynear(var(58)),stateno != [5000,5210]
trigger1 = enemynear(var(58)),stateno != [150,159]
trigger1 = (enemynear(var(58)),stateno != [290,293]) || enemynear(var(58)),movetype != H
trigger1 = enemynear(var(58)),Vel Y != 0
FV = 20
value = enemynear(var(58)),const(movement.yaccel)
ignorehitpause = 1

[State -2, yaccel]
type = VarSet
trigger1 = fvar(20) != enemynear(var(58)),GetHitVar(yaccel)
trigger1 = (enemynear(var(58)),stateno = [5000,5210])
trigger1 = enemynear(var(58)),Vel Y != 0
trigger1 = enemynear(var(58)),movetype = H
FV = 20
value = enemynear(var(58)),GetHitVar(yaccel);(打撃当てた時のyaccel値)
ignorehitpause = 1

[State -2, yaccel]
type = VarSet
trigger1 = fvar(20) != enemynear(var(58)),GetHitVar(yaccel)
trigger1 = (enemynear(var(58)),stateno = [150,159])
trigger1 = enemynear(var(58)),Vel Y != 0
trigger1 = enemynear(var(58)),movetype = H
FV = 20
value = enemynear(var(58)),GetHitVar(yaccel);(打撃当てた時のyaccel値)
ignorehitpause = 1

[State -2, yaccel]
type = VarSet
trigger1 = fvar(20) != enemynear(var(58)),GetHitVar(yaccel)
trigger1 = enemynear(var(58)),stateno = [290,293]
trigger1 = enemynear(var(58)),Vel Y != 0
trigger1 = enemynear(var(58)),movetype = H
FV = 20
value = enemynear(var(58)),GetHitVar(yaccel);(打撃当てた時のyaccel値)
ignorehitpause = 1

;敵が空中じゃない時
[State -2, yaccel]
type = VarSet
trigger1 = fvar(20) != 0
trigger1 = enemynear(var(58)),Vel Y = 0
FV = 20
value = 0;(打撃当てた時のyaccel値)
ignorehitpause = 1

[state -2,yaccel]
type = varset
trigger1 = fvar(30) != const(movement.yaccel)
trigger1 = stateno != [5000,5210]
fv = 30
value = const(movement.yaccel);(打撃当てた時のyaccel値)
ignorehitpause = 1

;敵が空中じゃない時
[state -2, yaccel]
type = varset
trigger1 = fvar(30) != 0
trigger1 = vel y = 0
fv = 30
value = 0;(打撃当てた時のyaccel値)
ignorehitpause = 1

;----------------------------------------------------

[State -2, AirGuard]
type = AssertSpecial;AssertSpecial
triggerall = roundstate = 2
triggerall = enemynear(var(58)),statetype = A
triggerALL = RANDOM <= 300
trigger1 = STATENO = [600,990]
trigger2 = STATENO = [200,450]
flag = unguardable

[State -2]
type = PowerAdd
triggerall = !var(51)
trigger1 = Time = 0 && StateNo = [150,154]
trigger2 = MoveType = H && Time = 0
value = floor(20 + Random%2 + (10*(stateno = [150,154])))
ignorehitpause = 1
persistent = 0

;---------------------------------------------------------------------------

[State -2, ?方helper型?道id??]
type = Null
TriggerAll = Numhelper(28036 + id)
TriggerAll = helper(28036 + id), id > 200
trigger1 = PlayerIDExist(helper(28036 + id), id - 1)
trigger1 = playerid(helper(28036 + id), id - 1), ishelper
trigger1 = playerid(helper(28036 + id), id - 1), teamside != teamside
trigger1 = playerid(helper(28036 + id), id - 1), MoveType = A
trigger1 = 1 || Fvar(26) := helper(28036 + id), id - 1
trigger2 = PlayerIDExist(helper(28036 + id), id - 2)
trigger2 = playerid(helper(28036 + id), id - 2), ishelper
trigger2 = playerid(helper(28036 + id), id - 2), teamside != teamside
trigger2 = playerid(helper(28036 + id), id - 2), MoveType = A
trigger2 = 1 || Fvar(26) := helper(28036 + id), id - 2
trigger3 = PlayerIDExist(helper(28036 + id), id - 3)
trigger3 = playerid(helper(28036 + id), id - 3), ishelper
trigger3 = playerid(helper(28036 + id), id - 3), teamside != teamside
trigger3 = playerid(helper(28036 + id), id - 3), MoveType = A
trigger3 = 1 || Fvar(26) := helper(28036 + id), id - 3
trigger4 = PlayerIDExist(helper(28036 + id), id - 4)
trigger4 = playerid(helper(28036 + id), id - 4), ishelper
trigger4 = playerid(helper(28036 + id), id - 4), teamside != teamside
trigger4 = playerid(helper(28036 + id), id - 4), MoveType = A
trigger4 = 1 || Fvar(26) := helper(28036 + id), id - 4
trigger5 = PlayerIDExist(helper(28036 + id), id - 5)
trigger5 = playerid(helper(28036 + id), id - 5), ishelper
trigger5 = playerid(helper(28036 + id), id - 5), teamside != teamside
trigger5 = playerid(helper(28036 + id), id - 5), MoveType = A
trigger5 = 1 || Fvar(26) := helper(28036 + id), id - 5
trigger6 = PlayerIDExist(helper(28036 + id), id - 6)
trigger6 = playerid(helper(28036 + id), id - 6), ishelper
trigger6 = playerid(helper(28036 + id), id - 6), teamside != teamside
trigger6 = playerid(helper(28036 + id), id - 6), MoveType = A
trigger6 = 1 || Fvar(26) := helper(28036 + id), id - 6
trigger7 = PlayerIDExist(helper(28036 + id), id - 7)
trigger7 = playerid(helper(28036 + id), id - 7), ishelper
trigger7 = playerid(helper(28036 + id), id - 7), teamside != teamside
trigger7 = playerid(helper(28036 + id), id - 7), MoveType = A
trigger7 = 1 || Fvar(26) := helper(28036 + id), id - 7
trigger8 = PlayerIDExist(helper(28036 + id), id - 8)
trigger8 = playerid(helper(28036 + id), id - 8), ishelper
trigger8 = playerid(helper(28036 + id), id - 8), teamside != teamside
trigger8 = playerid(helper(28036 + id), id - 8), MoveType = A
trigger8 = 1 || Fvar(26) := helper(28036 + id), id - 8
trigger9 = PlayerIDExist(helper(28036 + id), id - 9)
trigger9 = playerid(helper(28036 + id), id - 9), ishelper
trigger9 = playerid(helper(28036 + id), id - 9), teamside != teamside
trigger9 = playerid(helper(28036 + id), id - 9), MoveType = A
trigger9 = 1 || Fvar(26) := helper(28036 + id), id - 9
trigger10 = PlayerIDExist(helper(28036 + id), id - 10)
trigger10 = playerid(helper(28036 + id), id - 10), ishelper
trigger10 = playerid(helper(28036 + id), id - 10), teamside != teamside
trigger10 = playerid(helper(28036 + id), id - 10), MoveType = A
trigger10 = 1 || Fvar(26) := helper(28036 + id), id - 10
trigger11 = PlayerIDExist(helper(28036 + id), id - 11)
trigger11 = playerid(helper(28036 + id), id - 11), ishelper
trigger11 = playerid(helper(28036 + id), id - 11), teamside != teamside
trigger11 = playerid(helper(28036 + id), id - 11), MoveType = A
trigger11 = 1 || Fvar(26) := helper(28036 + id), id - 11
trigger12 = PlayerIDExist(helper(28036 + id), id - 12)
trigger12 = playerid(helper(28036 + id), id - 12), ishelper
trigger12 = playerid(helper(28036 + id), id - 12), teamside != teamside
trigger12 = playerid(helper(28036 + id), id - 12), MoveType = A
trigger12 = 1 || Fvar(26) := helper(28036 + id), id - 12
trigger13 = PlayerIDExist(helper(28036 + id), id - 13)
trigger13 = playerid(helper(28036 + id), id - 13), ishelper
trigger13 = playerid(helper(28036 + id), id - 13), teamside != teamside
trigger13 = playerid(helper(28036 + id), id - 13), MoveType = A
trigger13 = 1 || Fvar(26) := helper(28036 + id), id - 13
trigger14 = PlayerIDExist(helper(28036 + id), id - 14)
trigger14 = playerid(helper(28036 + id), id - 14), ishelper
trigger14 = playerid(helper(28036 + id), id - 14), teamside != teamside
trigger14 = playerid(helper(28036 + id), id - 14), MoveType = A
trigger14 = 1 || Fvar(26) := helper(28036 + id), id - 14
trigger15 = PlayerIDExist(helper(28036 + id), id - 15)
trigger15 = playerid(helper(28036 + id), id - 15), ishelper
trigger15 = playerid(helper(28036 + id), id - 15), teamside != teamside
trigger15 = playerid(helper(28036 + id), id - 15), MoveType = A
trigger15 = 1 || Fvar(26) := helper(28036 + id), id - 15
trigger16 = PlayerIDExist(helper(28036 + id), id - 16)
trigger16 = playerid(helper(28036 + id), id - 16), ishelper
trigger16 = playerid(helper(28036 + id), id - 16), teamside != teamside
trigger16 = playerid(helper(28036 + id), id - 16), MoveType = A
trigger16 = 1 || Fvar(26) := helper(28036 + id), id - 16
trigger17 = PlayerIDExist(helper(28036 + id), id - 17)
trigger17 = playerid(helper(28036 + id), id - 17), ishelper
trigger17 = playerid(helper(28036 + id), id - 17), teamside != teamside
trigger17 = playerid(helper(28036 + id), id - 17), MoveType = A
trigger17 = 1 || Fvar(26) := helper(28036 + id), id - 17
trigger18 = PlayerIDExist(helper(28036 + id), id - 18)
trigger18 = playerid(helper(28036 + id), id - 18), ishelper
trigger18 = playerid(helper(28036 + id), id - 18), teamside != teamside
trigger18 = playerid(helper(28036 + id), id - 18), MoveType = A
trigger18 = 1 || Fvar(26) := helper(28036 + id), id - 18
trigger19 = PlayerIDExist(helper(28036 + id), id - 19)
trigger19 = playerid(helper(28036 + id), id - 19), ishelper
trigger19 = playerid(helper(28036 + id), id - 19), teamside != teamside
trigger19 = playerid(helper(28036 + id), id - 19), MoveType = A
trigger19 = 1 || Fvar(26) := helper(28036 + id), id - 19
trigger20 = PlayerIDExist(helper(28036 + id), id - 20)
trigger20 = playerid(helper(28036 + id), id - 20), ishelper
trigger20 = playerid(helper(28036 + id), id - 20), teamside != teamside
trigger20 = playerid(helper(28036 + id), id - 20), MoveType = A
trigger20 = 1 || Fvar(26) := helper(28036 + id), id - 20
trigger21 = PlayerIDExist(helper(28036 + id), id - 21)
trigger21 = playerid(helper(28036 + id), id - 21), ishelper
trigger21 = playerid(helper(28036 + id), id - 21), teamside != teamside
trigger21 = playerid(helper(28036 + id), id - 21), MoveType = A
trigger21 = 1 || Fvar(26) := helper(28036 + id), id - 21
trigger22 = PlayerIDExist(helper(28036 + id), id - 22)
trigger22 = playerid(helper(28036 + id), id - 22), ishelper
trigger22 = playerid(helper(28036 + id), id - 22), teamside != teamside
trigger22 = playerid(helper(28036 + id), id - 22), MoveType = A
trigger22 = 1 || Fvar(26) := helper(28036 + id), id - 22
trigger23 = PlayerIDExist(helper(28036 + id), id - 23)
trigger23 = playerid(helper(28036 + id), id - 23), ishelper
trigger23 = playerid(helper(28036 + id), id - 23), teamside != teamside
trigger23 = playerid(helper(28036 + id), id - 23), MoveType = A
trigger23 = 1 || Fvar(26) := helper(28036 + id), id - 23
trigger24 = PlayerIDExist(helper(28036 + id), id - 24)
trigger24 = playerid(helper(28036 + id), id - 24), ishelper
trigger24 = playerid(helper(28036 + id), id - 24), teamside != teamside
trigger24 = playerid(helper(28036 + id), id - 24), MoveType = A
trigger24 = 1 || Fvar(26) := helper(28036 + id), id - 24
trigger25 = PlayerIDExist(helper(28036 + id), id - 25)
trigger25 = playerid(helper(28036 + id), id - 25), ishelper
trigger25 = playerid(helper(28036 + id), id - 25), teamside != teamside
trigger25 = playerid(helper(28036 + id), id - 25), MoveType = A
trigger25 = 1 || Fvar(26) := helper(28036 + id), id - 25
trigger26 = PlayerIDExist(helper(28036 + id), id - 26)
trigger26 = playerid(helper(28036 + id), id - 26), ishelper
trigger26 = playerid(helper(28036 + id), id - 26), teamside != teamside
trigger26 = playerid(helper(28036 + id), id - 26), MoveType = A
trigger26 = 1 || Fvar(26) := helper(28036 + id), id - 26
trigger27 = PlayerIDExist(helper(28036 + id), id - 27)
trigger27 = playerid(helper(28036 + id), id - 27), ishelper
trigger27 = playerid(helper(28036 + id), id - 27), teamside != teamside
trigger27 = playerid(helper(28036 + id), id - 27), MoveType = A
trigger27 = 1 || Fvar(26) := helper(28036 + id), id - 27
trigger28 = PlayerIDExist(helper(28036 + id), id - 28)
trigger28 = playerid(helper(28036 + id), id - 28), ishelper
trigger28 = playerid(helper(28036 + id), id - 28), teamside != teamside
trigger28 = playerid(helper(28036 + id), id - 28), MoveType = A
trigger28 = 1 || Fvar(26) := helper(28036 + id), id - 28
trigger29 = PlayerIDExist(helper(28036 + id), id - 29)
trigger29 = playerid(helper(28036 + id), id - 29), ishelper
trigger29 = playerid(helper(28036 + id), id - 29), teamside != teamside
trigger29 = playerid(helper(28036 + id), id - 29), MoveType = A
trigger29 = 1 || Fvar(26) := helper(28036 + id), id - 29
trigger30 = PlayerIDExist(helper(28036 + id), id - 30)
trigger30 = playerid(helper(28036 + id), id - 30), ishelper
trigger30 = playerid(helper(28036 + id), id - 30), teamside != teamside
trigger30 = playerid(helper(28036 + id), id - 30), MoveType = A
trigger30 = 1 || Fvar(26) := helper(28036 + id), id - 30
trigger31 = PlayerIDExist(helper(28036 + id), id - 31)
trigger31 = playerid(helper(28036 + id), id - 31), ishelper
trigger31 = playerid(helper(28036 + id), id - 31), teamside != teamside
trigger31 = playerid(helper(28036 + id), id - 31), MoveType = A
trigger31 = 1 || Fvar(26) := helper(28036 + id), id - 31
trigger32 = PlayerIDExist(helper(28036 + id), id - 32)
trigger32 = playerid(helper(28036 + id), id - 32), ishelper
trigger32 = playerid(helper(28036 + id), id - 32), teamside != teamside
trigger32 = playerid(helper(28036 + id), id - 32), MoveType = A
trigger32 = 1 || Fvar(26) := helper(28036 + id), id - 32
trigger33 = PlayerIDExist(helper(28036 + id), id - 33)
trigger33 = playerid(helper(28036 + id), id - 33), ishelper
trigger33 = playerid(helper(28036 + id), id - 33), teamside != teamside
trigger33 = playerid(helper(28036 + id), id - 33), MoveType = A
trigger33 = 1 || Fvar(26) := helper(28036 + id), id - 33
trigger34 = PlayerIDExist(helper(28036 + id), id - 34)
trigger34 = playerid(helper(28036 + id), id - 34), ishelper
trigger34 = playerid(helper(28036 + id), id - 34), teamside != teamside
trigger34 = playerid(helper(28036 + id), id - 34), MoveType = A
trigger34 = 1 || Fvar(26) := helper(28036 + id), id - 34
trigger35 = PlayerIDExist(helper(28036 + id), id - 35)
trigger35 = playerid(helper(28036 + id), id - 35), ishelper
trigger35 = playerid(helper(28036 + id), id - 35), teamside != teamside
trigger35 = playerid(helper(28036 + id), id - 35), MoveType = A
trigger35 = 1 || Fvar(26) := helper(28036 + id), id - 35
trigger36 = PlayerIDExist(helper(28036 + id), id - 36)
trigger36 = playerid(helper(28036 + id), id - 36), ishelper
trigger36 = playerid(helper(28036 + id), id - 36), teamside != teamside
trigger36 = playerid(helper(28036 + id), id - 36), MoveType = A
trigger36 = 1 || Fvar(26) := helper(28036 + id), id - 36
trigger37 = PlayerIDExist(helper(28036 + id), id - 37)
trigger37 = playerid(helper(28036 + id), id - 37), ishelper
trigger37 = playerid(helper(28036 + id), id - 37), teamside != teamside
trigger37 = playerid(helper(28036 + id), id - 37), MoveType = A
trigger37 = 1 || Fvar(26) := helper(28036 + id), id - 37
trigger38 = PlayerIDExist(helper(28036 + id), id - 38)
trigger38 = playerid(helper(28036 + id), id - 38), ishelper
trigger38 = playerid(helper(28036 + id), id - 38), teamside != teamside
trigger38 = playerid(helper(28036 + id), id - 38), MoveType = A
trigger38 = 1 || Fvar(26) := helper(28036 + id), id - 38
trigger39 = PlayerIDExist(helper(28036 + id), id - 39)
trigger39 = playerid(helper(28036 + id), id - 39), ishelper
trigger39 = playerid(helper(28036 + id), id - 39), teamside != teamside
trigger39 = playerid(helper(28036 + id), id - 39), MoveType = A
trigger39 = 1 || Fvar(26) := helper(28036 + id), id - 39
trigger40 = PlayerIDExist(helper(28036 + id), id - 40)
trigger40 = playerid(helper(28036 + id), id - 40), ishelper
trigger40 = playerid(helper(28036 + id), id - 40), teamside != teamside
trigger40 = playerid(helper(28036 + id), id - 40), MoveType = A
trigger40 = 1 || Fvar(26) := helper(28036 + id), id - 40
trigger41 = PlayerIDExist(helper(28036 + id), id - 41)
trigger41 = playerid(helper(28036 + id), id - 41), ishelper
trigger41 = playerid(helper(28036 + id), id - 41), teamside != teamside
trigger41 = playerid(helper(28036 + id), id - 41), MoveType = A
trigger41 = 1 || Fvar(26) := helper(28036 + id), id - 41
trigger42 = PlayerIDExist(helper(28036 + id), id - 42)
trigger42 = playerid(helper(28036 + id), id - 42), ishelper
trigger42 = playerid(helper(28036 + id), id - 42), teamside != teamside
trigger42 = playerid(helper(28036 + id), id - 42), MoveType = A
trigger42 = 1 || Fvar(26) := helper(28036 + id), id - 42
trigger43 = PlayerIDExist(helper(28036 + id), id - 43)
trigger43 = playerid(helper(28036 + id), id - 43), ishelper
trigger43 = playerid(helper(28036 + id), id - 43), teamside != teamside
trigger43 = playerid(helper(28036 + id), id - 43), MoveType = A
trigger43 = 1 || Fvar(26) := helper(28036 + id), id - 43
trigger44 = PlayerIDExist(helper(28036 + id), id - 44)
trigger44 = playerid(helper(28036 + id), id - 44), ishelper
trigger44 = playerid(helper(28036 + id), id - 44), teamside != teamside
trigger44 = playerid(helper(28036 + id), id - 44), MoveType = A
trigger44 = 1 || Fvar(26) := helper(28036 + id), id - 44
trigger45 = PlayerIDExist(helper(28036 + id), id - 45)
trigger45 = playerid(helper(28036 + id), id - 45), ishelper
trigger45 = playerid(helper(28036 + id), id - 45), teamside != teamside
trigger45 = playerid(helper(28036 + id), id - 45), MoveType = A
trigger45 = 1 || Fvar(26) := helper(28036 + id), id - 45
trigger46 = PlayerIDExist(helper(28036 + id), id - 46)
trigger46 = playerid(helper(28036 + id), id - 46), ishelper
trigger46 = playerid(helper(28036 + id), id - 46), teamside != teamside
trigger46 = playerid(helper(28036 + id), id - 46), MoveType = A
trigger46 = 1 || Fvar(26) := helper(28036 + id), id - 46
trigger47 = PlayerIDExist(helper(28036 + id), id - 47)
trigger47 = playerid(helper(28036 + id), id - 47), ishelper
trigger47 = playerid(helper(28036 + id), id - 47), teamside != teamside
trigger47 = playerid(helper(28036 + id), id - 47), MoveType = A
trigger47 = 1 || Fvar(26) := helper(28036 + id), id - 47
trigger48 = PlayerIDExist(helper(28036 + id), id - 48)
trigger48 = playerid(helper(28036 + id), id - 48), ishelper
trigger48 = playerid(helper(28036 + id), id - 48), teamside != teamside
trigger48 = playerid(helper(28036 + id), id - 48), MoveType = A
trigger48 = 1 || Fvar(26) := helper(28036 + id), id - 48
trigger49 = PlayerIDExist(helper(28036 + id), id - 49)
trigger49 = playerid(helper(28036 + id), id - 49), ishelper
trigger49 = playerid(helper(28036 + id), id - 49), teamside != teamside
trigger49 = playerid(helper(28036 + id), id - 49), MoveType = A
trigger49 = 1 || Fvar(26) := helper(28036 + id), id - 49
trigger50 = PlayerIDExist(helper(28036 + id), id - 50)
trigger50 = playerid(helper(28036 + id), id - 50), ishelper
trigger50 = playerid(helper(28036 + id), id - 50), teamside != teamside
trigger50 = playerid(helper(28036 + id), id - 50), MoveType = A
trigger50 = 1 || Fvar(26) := helper(28036 + id), id - 50
trigger51 = PlayerIDExist(helper(28036 + id), id - 51)
trigger51 = playerid(helper(28036 + id), id - 51), ishelper
trigger51 = playerid(helper(28036 + id), id - 51), teamside != teamside
trigger51 = playerid(helper(28036 + id), id - 51), MoveType = A
trigger51 = 1 || Fvar(26) := helper(28036 + id), id - 51
trigger52 = PlayerIDExist(helper(28036 + id), id - 52)
trigger52 = playerid(helper(28036 + id), id - 52), ishelper
trigger52 = playerid(helper(28036 + id), id - 52), teamside != teamside
trigger52 = playerid(helper(28036 + id), id - 52), MoveType = A
trigger52 = 1 || Fvar(26) := helper(28036 + id), id - 52
trigger53 = PlayerIDExist(helper(28036 + id), id - 53)
trigger53 = playerid(helper(28036 + id), id - 53), ishelper
trigger53 = playerid(helper(28036 + id), id - 53), teamside != teamside
trigger53 = playerid(helper(28036 + id), id - 53), MoveType = A
trigger53 = 1 || Fvar(26) := helper(28036 + id), id - 53
trigger54 = PlayerIDExist(helper(28036 + id), id - 54)
trigger54 = playerid(helper(28036 + id), id - 54), ishelper
trigger54 = playerid(helper(28036 + id), id - 54), teamside != teamside
trigger54 = playerid(helper(28036 + id), id - 54), MoveType = A
trigger54 = 1 || Fvar(26) := helper(28036 + id), id - 54
trigger55 = PlayerIDExist(helper(28036 + id), id - 55)
trigger55 = playerid(helper(28036 + id), id - 55), ishelper
trigger55 = playerid(helper(28036 + id), id - 55), teamside != teamside
trigger55 = playerid(helper(28036 + id), id - 55), MoveType = A
trigger55 = 1 || Fvar(26) := helper(28036 + id), id - 55
trigger56 = PlayerIDExist(helper(28036 + id), id - 56)
trigger56 = playerid(helper(28036 + id), id - 56), ishelper
trigger56 = playerid(helper(28036 + id), id - 56), teamside != teamside
trigger56 = playerid(helper(28036 + id), id - 56), MoveType = A
trigger56 = 1 || Fvar(26) := helper(28036 + id), id - 56
trigger57 = PlayerIDExist(helper(28036 + id), id - 57)
trigger57 = playerid(helper(28036 + id), id - 57), ishelper
trigger57 = playerid(helper(28036 + id), id - 57), teamside != teamside
trigger57 = playerid(helper(28036 + id), id - 57), MoveType = A
trigger57 = 1 || Fvar(26) := helper(28036 + id), id - 57
trigger58 = PlayerIDExist(helper(28036 + id), id - 58)
trigger58 = playerid(helper(28036 + id), id - 58), ishelper
trigger58 = playerid(helper(28036 + id), id - 58), teamside != teamside
trigger58 = playerid(helper(28036 + id), id - 58), MoveType = A
trigger58 = 1 || Fvar(26) := helper(28036 + id), id - 58
trigger59 = PlayerIDExist(helper(28036 + id), id - 59)
trigger59 = playerid(helper(28036 + id), id - 59), ishelper
trigger59 = playerid(helper(28036 + id), id - 59), teamside != teamside
trigger59 = playerid(helper(28036 + id), id - 59), MoveType = A
trigger59 = 1 || Fvar(26) := helper(28036 + id), id - 59
trigger60 = PlayerIDExist(helper(28036 + id), id - 60)
trigger60 = playerid(helper(28036 + id), id - 60), ishelper
trigger60 = playerid(helper(28036 + id), id - 60), teamside != teamside
trigger60 = playerid(helper(28036 + id), id - 60), MoveType = A
trigger60 = 1 || Fvar(26) := helper(28036 + id), id - 60
trigger61 = PlayerIDExist(helper(28036 + id), id - 61)
trigger61 = playerid(helper(28036 + id), id - 61), ishelper
trigger61 = playerid(helper(28036 + id), id - 61), teamside != teamside
trigger61 = playerid(helper(28036 + id), id - 61), MoveType = A
trigger61 = 1 || Fvar(26) := helper(28036 + id), id - 61
trigger62 = PlayerIDExist(helper(28036 + id), id - 62)
trigger62 = playerid(helper(28036 + id), id - 62), ishelper
trigger62 = playerid(helper(28036 + id), id - 62), teamside != teamside
trigger62 = playerid(helper(28036 + id), id - 62), MoveType = A
trigger62 = 1 || Fvar(26) := helper(28036 + id), id - 62
trigger63 = PlayerIDExist(helper(28036 + id), id - 63)
trigger63 = playerid(helper(28036 + id), id - 63), ishelper
trigger63 = playerid(helper(28036 + id), id - 63), teamside != teamside
trigger63 = playerid(helper(28036 + id), id - 63), MoveType = A
trigger63 = 1 || Fvar(26) := helper(28036 + id), id - 63
trigger64 = PlayerIDExist(helper(28036 + id), id - 64)
trigger64 = playerid(helper(28036 + id), id - 64), ishelper
trigger64 = playerid(helper(28036 + id), id - 64), teamside != teamside
trigger64 = playerid(helper(28036 + id), id - 64), MoveType = A
trigger64 = 1 || Fvar(26) := helper(28036 + id), id - 64
trigger65 = PlayerIDExist(helper(28036 + id), id - 65)
trigger65 = playerid(helper(28036 + id), id - 65), ishelper
trigger65 = playerid(helper(28036 + id), id - 65), teamside != teamside
trigger65 = playerid(helper(28036 + id), id - 65), MoveType = A
trigger65 = 1 || Fvar(26) := helper(28036 + id), id - 65
trigger66 = PlayerIDExist(helper(28036 + id), id - 66)
trigger66 = playerid(helper(28036 + id), id - 66), ishelper
trigger66 = playerid(helper(28036 + id), id - 66), teamside != teamside
trigger66 = playerid(helper(28036 + id), id - 66), MoveType = A
trigger66 = 1 || Fvar(26) := helper(28036 + id), id - 66
trigger67 = PlayerIDExist(helper(28036 + id), id - 67)
trigger67 = playerid(helper(28036 + id), id - 67), ishelper
trigger67 = playerid(helper(28036 + id), id - 67), teamside != teamside
trigger67 = playerid(helper(28036 + id), id - 67), MoveType = A
trigger67 = 1 || Fvar(26) := helper(28036 + id), id - 67
trigger68 = PlayerIDExist(helper(28036 + id), id - 68)
trigger68 = playerid(helper(28036 + id), id - 68), ishelper
trigger68 = playerid(helper(28036 + id), id - 68), teamside != teamside
trigger68 = playerid(helper(28036 + id), id - 68), MoveType = A
trigger68 = 1 || Fvar(26) := helper(28036 + id), id - 68
trigger69 = PlayerIDExist(helper(28036 + id), id - 69)
trigger69 = playerid(helper(28036 + id), id - 69), ishelper
trigger69 = playerid(helper(28036 + id), id - 69), teamside != teamside
trigger69 = playerid(helper(28036 + id), id - 69), MoveType = A
trigger69 = 1 || Fvar(26) := helper(28036 + id), id - 69
trigger70 = PlayerIDExist(helper(28036 + id), id - 70)
trigger70 = playerid(helper(28036 + id), id - 70), ishelper
trigger70 = playerid(helper(28036 + id), id - 70), teamside != teamside
trigger70 = playerid(helper(28036 + id), id - 70), MoveType = A
trigger70 = 1 || Fvar(26) := helper(28036 + id), id - 70
trigger71 = PlayerIDExist(helper(28036 + id), id - 71)
trigger71 = playerid(helper(28036 + id), id - 71), ishelper
trigger71 = playerid(helper(28036 + id), id - 71), teamside != teamside
trigger71 = playerid(helper(28036 + id), id - 71), MoveType = A
trigger71 = 1 || Fvar(26) := helper(28036 + id), id - 71
trigger72 = PlayerIDExist(helper(28036 + id), id - 72)
trigger72 = playerid(helper(28036 + id), id - 72), ishelper
trigger72 = playerid(helper(28036 + id), id - 72), teamside != teamside
trigger72 = playerid(helper(28036 + id), id - 72), MoveType = A
trigger72 = 1 || Fvar(26) := helper(28036 + id), id - 72
trigger73 = PlayerIDExist(helper(28036 + id), id - 73)
trigger73 = playerid(helper(28036 + id), id - 73), ishelper
trigger73 = playerid(helper(28036 + id), id - 73), teamside != teamside
trigger73 = playerid(helper(28036 + id), id - 73), MoveType = A
trigger73 = 1 || Fvar(26) := helper(28036 + id), id - 73
trigger74 = PlayerIDExist(helper(28036 + id), id - 74)
trigger74 = playerid(helper(28036 + id), id - 74), ishelper
trigger74 = playerid(helper(28036 + id), id - 74), teamside != teamside
trigger74 = playerid(helper(28036 + id), id - 74), MoveType = A
trigger74 = 1 || Fvar(26) := helper(28036 + id), id - 74
trigger75 = PlayerIDExist(helper(28036 + id), id - 75)
trigger75 = playerid(helper(28036 + id), id - 75), ishelper
trigger75 = playerid(helper(28036 + id), id - 75), teamside != teamside
trigger75 = playerid(helper(28036 + id), id - 75), MoveType = A
trigger75 = 1 || Fvar(26) := helper(28036 + id), id - 75
trigger76 = PlayerIDExist(helper(28036 + id), id - 76)
trigger76 = playerid(helper(28036 + id), id - 76), ishelper
trigger76 = playerid(helper(28036 + id), id - 76), teamside != teamside
trigger76 = playerid(helper(28036 + id), id - 76), MoveType = A
trigger76 = 1 || Fvar(26) := helper(28036 + id), id - 76
trigger77 = PlayerIDExist(helper(28036 + id), id - 77)
trigger77 = playerid(helper(28036 + id), id - 77), ishelper
trigger77 = playerid(helper(28036 + id), id - 77), teamside != teamside
trigger77 = playerid(helper(28036 + id), id - 77), MoveType = A
trigger77 = 1 || Fvar(26) := helper(28036 + id), id - 77
trigger78 = PlayerIDExist(helper(28036 + id), id - 78)
trigger78 = playerid(helper(28036 + id), id - 78), ishelper
trigger78 = playerid(helper(28036 + id), id - 78), teamside != teamside
trigger78 = playerid(helper(28036 + id), id - 78), MoveType = A
trigger78 = 1 || Fvar(26) := helper(28036 + id), id - 78
trigger79 = PlayerIDExist(helper(28036 + id), id - 79)
trigger79 = playerid(helper(28036 + id), id - 79), ishelper
trigger79 = playerid(helper(28036 + id), id - 79), teamside != teamside
trigger79 = playerid(helper(28036 + id), id - 79), MoveType = A
trigger79 = 1 || Fvar(26) := helper(28036 + id), id - 79
trigger80 = PlayerIDExist(helper(28036 + id), id - 80)
trigger80 = playerid(helper(28036 + id), id - 80), ishelper
trigger80 = playerid(helper(28036 + id), id - 80), teamside != teamside
trigger80 = playerid(helper(28036 + id), id - 80), MoveType = A
trigger80 = 1 || Fvar(26) := helper(28036 + id), id - 80
trigger81 = PlayerIDExist(helper(28036 + id), id - 81)
trigger81 = playerid(helper(28036 + id), id - 81), ishelper
trigger81 = playerid(helper(28036 + id), id - 81), teamside != teamside
trigger81 = playerid(helper(28036 + id), id - 81), MoveType = A
trigger81 = 1 || Fvar(26) := helper(28036 + id), id - 81
trigger82 = PlayerIDExist(helper(28036 + id), id - 82)
trigger82 = playerid(helper(28036 + id), id - 82), ishelper
trigger82 = playerid(helper(28036 + id), id - 82), teamside != teamside
trigger82 = playerid(helper(28036 + id), id - 82), MoveType = A
trigger82 = 1 || Fvar(26) := helper(28036 + id), id - 82
trigger83 = PlayerIDExist(helper(28036 + id), id - 83)
trigger83 = playerid(helper(28036 + id), id - 83), ishelper
trigger83 = playerid(helper(28036 + id), id - 83), teamside != teamside
trigger83 = playerid(helper(28036 + id), id - 83), MoveType = A
trigger83 = 1 || Fvar(26) := helper(28036 + id), id - 83
trigger84 = PlayerIDExist(helper(28036 + id), id - 84)
trigger84 = playerid(helper(28036 + id), id - 84), ishelper
trigger84 = playerid(helper(28036 + id), id - 84), teamside != teamside
trigger84 = playerid(helper(28036 + id), id - 84), MoveType = A
trigger84 = 1 || Fvar(26) := helper(28036 + id), id - 84
trigger85 = PlayerIDExist(helper(28036 + id), id - 85)
trigger85 = playerid(helper(28036 + id), id - 85), ishelper
trigger85 = playerid(helper(28036 + id), id - 85), teamside != teamside
trigger85 = playerid(helper(28036 + id), id - 85), MoveType = A
trigger85 = 1 || Fvar(26) := helper(28036 + id), id - 85
trigger86 = PlayerIDExist(helper(28036 + id), id - 86)
trigger86 = playerid(helper(28036 + id), id - 86), ishelper
trigger86 = playerid(helper(28036 + id), id - 86), teamside != teamside
trigger86 = playerid(helper(28036 + id), id - 86), MoveType = A
trigger86 = 1 || Fvar(26) := helper(28036 + id), id - 86
trigger87 = PlayerIDExist(helper(28036 + id), id - 87)
trigger87 = playerid(helper(28036 + id), id - 87), ishelper
trigger87 = playerid(helper(28036 + id), id - 87), teamside != teamside
trigger87 = playerid(helper(28036 + id), id - 87), MoveType = A
trigger87 = 1 || Fvar(26) := helper(28036 + id), id - 87
trigger88 = PlayerIDExist(helper(28036 + id), id - 88)
trigger88 = playerid(helper(28036 + id), id - 88), ishelper
trigger88 = playerid(helper(28036 + id), id - 88), teamside != teamside
trigger88 = playerid(helper(28036 + id), id - 88), MoveType = A
trigger88 = 1 || Fvar(26) := helper(28036 + id), id - 88
trigger89 = PlayerIDExist(helper(28036 + id), id - 89)
trigger89 = playerid(helper(28036 + id), id - 89), ishelper
trigger89 = playerid(helper(28036 + id), id - 89), teamside != teamside
trigger89 = playerid(helper(28036 + id), id - 89), MoveType = A
trigger89 = 1 || Fvar(26) := helper(28036 + id), id - 89
trigger90 = PlayerIDExist(helper(28036 + id), id - 90)
trigger90 = playerid(helper(28036 + id), id - 90), ishelper
trigger90 = playerid(helper(28036 + id), id - 90), teamside != teamside
trigger90 = playerid(helper(28036 + id), id - 90), MoveType = A
trigger90 = 1 || Fvar(26) := helper(28036 + id), id - 90
trigger91 = PlayerIDExist(helper(28036 + id), id - 91)
trigger91 = playerid(helper(28036 + id), id - 91), ishelper
trigger91 = playerid(helper(28036 + id), id - 91), teamside != teamside
trigger91 = playerid(helper(28036 + id), id - 91), MoveType = A
trigger91 = 1 || Fvar(26) := helper(28036 + id), id - 91
trigger92 = PlayerIDExist(helper(28036 + id), id - 92)
trigger92 = playerid(helper(28036 + id), id - 92), ishelper
trigger92 = playerid(helper(28036 + id), id - 92), teamside != teamside
trigger92 = playerid(helper(28036 + id), id - 92), MoveType = A
trigger92 = 1 || Fvar(26) := helper(28036 + id), id - 92
trigger93 = PlayerIDExist(helper(28036 + id), id - 93)
trigger93 = playerid(helper(28036 + id), id - 93), ishelper
trigger93 = playerid(helper(28036 + id), id - 93), teamside != teamside
trigger93 = playerid(helper(28036 + id), id - 93), MoveType = A
trigger93 = 1 || Fvar(26) := helper(28036 + id), id - 93
trigger94 = PlayerIDExist(helper(28036 + id), id - 94)
trigger94 = playerid(helper(28036 + id), id - 94), ishelper
trigger94 = playerid(helper(28036 + id), id - 94), teamside != teamside
trigger94 = playerid(helper(28036 + id), id - 94), MoveType = A
trigger94 = 1 || Fvar(26) := helper(28036 + id), id - 94
trigger95 = PlayerIDExist(helper(28036 + id), id - 95)
trigger95 = playerid(helper(28036 + id), id - 95), ishelper
trigger95 = playerid(helper(28036 + id), id - 95), teamside != teamside
trigger95 = playerid(helper(28036 + id), id - 95), MoveType = A
trigger95 = 1 || Fvar(26) := helper(28036 + id), id - 95
trigger96 = PlayerIDExist(helper(28036 + id), id - 96)
trigger96 = playerid(helper(28036 + id), id - 96), ishelper
trigger96 = playerid(helper(28036 + id), id - 96), teamside != teamside
trigger96 = playerid(helper(28036 + id), id - 96), MoveType = A
trigger96 = 1 || Fvar(26) := helper(28036 + id), id - 96
trigger97 = PlayerIDExist(helper(28036 + id), id - 97)
trigger97 = playerid(helper(28036 + id), id - 97), ishelper
trigger97 = playerid(helper(28036 + id), id - 97), teamside != teamside
trigger97 = playerid(helper(28036 + id), id - 97), MoveType = A
trigger97 = 1 || Fvar(26) := helper(28036 + id), id - 97
trigger98 = PlayerIDExist(helper(28036 + id), id - 98)
trigger98 = playerid(helper(28036 + id), id - 98), ishelper
trigger98 = playerid(helper(28036 + id), id - 98), teamside != teamside
trigger98 = playerid(helper(28036 + id), id - 98), MoveType = A
trigger98 = 1 || Fvar(26) := helper(28036 + id), id - 98
trigger99 = PlayerIDExist(helper(28036 + id), id - 99)
trigger99 = playerid(helper(28036 + id), id - 99), ishelper
trigger99 = playerid(helper(28036 + id), id - 99), teamside != teamside
trigger99 = playerid(helper(28036 + id), id - 99), MoveType = A
trigger99 = 1 || Fvar(26) := helper(28036 + id), id - 99
trigger100 = PlayerIDExist(helper(28036 + id), id - 100)
trigger100 = playerid(helper(28036 + id), id - 100), ishelper
trigger100 = playerid(helper(28036 + id), id - 100), teamside != teamside
trigger100 = playerid(helper(28036 + id), id - 100), MoveType = A
trigger100 = 1 || Fvar(26) := helper(28036 + id), id - 100
trigger101 = PlayerIDExist(helper(28036 + id), id - 101)
trigger101 = playerid(helper(28036 + id), id - 101), ishelper
trigger101 = playerid(helper(28036 + id), id - 101), teamside != teamside
trigger101 = playerid(helper(28036 + id), id - 101), MoveType = A
trigger101 = 1 || Fvar(26) := helper(28036 + id), id - 101
trigger102 = PlayerIDExist(helper(28036 + id), id - 102)
trigger102 = playerid(helper(28036 + id), id - 102), ishelper
trigger102 = playerid(helper(28036 + id), id - 102), teamside != teamside
trigger102 = playerid(helper(28036 + id), id - 102), MoveType = A
trigger102 = 1 || Fvar(26) := helper(28036 + id), id - 102
trigger103 = PlayerIDExist(helper(28036 + id), id - 103)
trigger103 = playerid(helper(28036 + id), id - 103), ishelper
trigger103 = playerid(helper(28036 + id), id - 103), teamside != teamside
trigger103 = playerid(helper(28036 + id), id - 103), MoveType = A
trigger103 = 1 || Fvar(26) := helper(28036 + id), id - 103
trigger104 = PlayerIDExist(helper(28036 + id), id - 104)
trigger104 = playerid(helper(28036 + id), id - 104), ishelper
trigger104 = playerid(helper(28036 + id), id - 104), teamside != teamside
trigger104 = playerid(helper(28036 + id), id - 104), MoveType = A
trigger104 = 1 || Fvar(26) := helper(28036 + id), id - 104
trigger105 = PlayerIDExist(helper(28036 + id), id - 105)
trigger105 = playerid(helper(28036 + id), id - 105), ishelper
trigger105 = playerid(helper(28036 + id), id - 105), teamside != teamside
trigger105 = playerid(helper(28036 + id), id - 105), MoveType = A
trigger105 = 1 || Fvar(26) := helper(28036 + id), id - 105
trigger106 = PlayerIDExist(helper(28036 + id), id - 106)
trigger106 = playerid(helper(28036 + id), id - 106), ishelper
trigger106 = playerid(helper(28036 + id), id - 106), teamside != teamside
trigger106 = playerid(helper(28036 + id), id - 106), MoveType = A
trigger106 = 1 || Fvar(26) := helper(28036 + id), id - 106
trigger107 = PlayerIDExist(helper(28036 + id), id - 107)
trigger107 = playerid(helper(28036 + id), id - 107), ishelper
trigger107 = playerid(helper(28036 + id), id - 107), teamside != teamside
trigger107 = playerid(helper(28036 + id), id - 107), MoveType = A
trigger107 = 1 || Fvar(26) := helper(28036 + id), id - 107
trigger108 = PlayerIDExist(helper(28036 + id), id - 108)
trigger108 = playerid(helper(28036 + id), id - 108), ishelper
trigger108 = playerid(helper(28036 + id), id - 108), teamside != teamside
trigger108 = playerid(helper(28036 + id), id - 108), MoveType = A
trigger108 = 1 || Fvar(26) := helper(28036 + id), id - 108
trigger109 = PlayerIDExist(helper(28036 + id), id - 109)
trigger109 = playerid(helper(28036 + id), id - 109), ishelper
trigger109 = playerid(helper(28036 + id), id - 109), teamside != teamside
trigger109 = playerid(helper(28036 + id), id - 109), MoveType = A
trigger109 = 1 || Fvar(26) := helper(28036 + id), id - 109
trigger110 = PlayerIDExist(helper(28036 + id), id - 110)
trigger110 = playerid(helper(28036 + id), id - 110), ishelper
trigger110 = playerid(helper(28036 + id), id - 110), teamside != teamside
trigger110 = playerid(helper(28036 + id), id - 110), MoveType = A
trigger110 = 1 || Fvar(26) := helper(28036 + id), id - 110
trigger111 = PlayerIDExist(helper(28036 + id), id - 111)
trigger111 = playerid(helper(28036 + id), id - 111), ishelper
trigger111 = playerid(helper(28036 + id), id - 111), teamside != teamside
trigger111 = playerid(helper(28036 + id), id - 111), MoveType = A
trigger111 = 1 || Fvar(26) := helper(28036 + id), id - 111
trigger112 = PlayerIDExist(helper(28036 + id), id - 112)
trigger112 = playerid(helper(28036 + id), id - 112), ishelper
trigger112 = playerid(helper(28036 + id), id - 112), teamside != teamside
trigger112 = playerid(helper(28036 + id), id - 112), MoveType = A
trigger112 = 1 || Fvar(26) := helper(28036 + id), id - 112
trigger113 = PlayerIDExist(helper(28036 + id), id - 113)
trigger113 = playerid(helper(28036 + id), id - 113), ishelper
trigger113 = playerid(helper(28036 + id), id - 113), teamside != teamside
trigger113 = playerid(helper(28036 + id), id - 113), MoveType = A
trigger113 = 1 || Fvar(26) := helper(28036 + id), id - 113
trigger114 = PlayerIDExist(helper(28036 + id), id - 114)
trigger114 = playerid(helper(28036 + id), id - 114), ishelper
trigger114 = playerid(helper(28036 + id), id - 114), teamside != teamside
trigger114 = playerid(helper(28036 + id), id - 114), MoveType = A
trigger114 = 1 || Fvar(26) := helper(28036 + id), id - 114
trigger115 = PlayerIDExist(helper(28036 + id), id - 115)
trigger115 = playerid(helper(28036 + id), id - 115), ishelper
trigger115 = playerid(helper(28036 + id), id - 115), teamside != teamside
trigger115 = playerid(helper(28036 + id), id - 115), MoveType = A
trigger115 = 1 || Fvar(26) := helper(28036 + id), id - 115
trigger116 = PlayerIDExist(helper(28036 + id), id - 116)
trigger116 = playerid(helper(28036 + id), id - 116), ishelper
trigger116 = playerid(helper(28036 + id), id - 116), teamside != teamside
trigger116 = playerid(helper(28036 + id), id - 116), MoveType = A
trigger116 = 1 || Fvar(26) := helper(28036 + id), id - 116
trigger117 = PlayerIDExist(helper(28036 + id), id - 117)
trigger117 = playerid(helper(28036 + id), id - 117), ishelper
trigger117 = playerid(helper(28036 + id), id - 117), teamside != teamside
trigger117 = playerid(helper(28036 + id), id - 117), MoveType = A
trigger117 = 1 || Fvar(26) := helper(28036 + id), id - 117
trigger118 = PlayerIDExist(helper(28036 + id), id - 118)
trigger118 = playerid(helper(28036 + id), id - 118), ishelper
trigger118 = playerid(helper(28036 + id), id - 118), teamside != teamside
trigger118 = playerid(helper(28036 + id), id - 118), MoveType = A
trigger118 = 1 || Fvar(26) := helper(28036 + id), id - 118
trigger119 = PlayerIDExist(helper(28036 + id), id - 119)
trigger119 = playerid(helper(28036 + id), id - 119), ishelper
trigger119 = playerid(helper(28036 + id), id - 119), teamside != teamside
trigger119 = playerid(helper(28036 + id), id - 119), MoveType = A
trigger119 = 1 || Fvar(26) := helper(28036 + id), id - 119
trigger120 = PlayerIDExist(helper(28036 + id), id - 120)
trigger120 = playerid(helper(28036 + id), id - 120), ishelper
trigger120 = playerid(helper(28036 + id), id - 120), teamside != teamside
trigger120 = playerid(helper(28036 + id), id - 120), MoveType = A
trigger120 = 1 || Fvar(26) := helper(28036 + id), id - 120
trigger121 = PlayerIDExist(helper(28036 + id), id - 121)
trigger121 = playerid(helper(28036 + id), id - 121), ishelper
trigger121 = playerid(helper(28036 + id), id - 121), teamside != teamside
trigger121 = playerid(helper(28036 + id), id - 121), MoveType = A
trigger121 = 1 || Fvar(26) := helper(28036 + id), id - 121
trigger122 = PlayerIDExist(helper(28036 + id), id - 122)
trigger122 = playerid(helper(28036 + id), id - 122), ishelper
trigger122 = playerid(helper(28036 + id), id - 122), teamside != teamside
trigger122 = playerid(helper(28036 + id), id - 122), MoveType = A
trigger122 = 1 || Fvar(26) := helper(28036 + id), id - 122
trigger123 = PlayerIDExist(helper(28036 + id), id - 123)
trigger123 = playerid(helper(28036 + id), id - 123), ishelper
trigger123 = playerid(helper(28036 + id), id - 123), teamside != teamside
trigger123 = playerid(helper(28036 + id), id - 123), MoveType = A
trigger123 = 1 || Fvar(26) := helper(28036 + id), id - 123
trigger124 = PlayerIDExist(helper(28036 + id), id - 124)
trigger124 = playerid(helper(28036 + id), id - 124), ishelper
trigger124 = playerid(helper(28036 + id), id - 124), teamside != teamside
trigger124 = playerid(helper(28036 + id), id - 124), MoveType = A
trigger124 = 1 || Fvar(26) := helper(28036 + id), id - 124
trigger125 = PlayerIDExist(helper(28036 + id), id - 125)
trigger125 = playerid(helper(28036 + id), id - 125), ishelper
trigger125 = playerid(helper(28036 + id), id - 125), teamside != teamside
trigger125 = playerid(helper(28036 + id), id - 125), MoveType = A
trigger125 = 1 || Fvar(26) := helper(28036 + id), id - 125
trigger126 = PlayerIDExist(helper(28036 + id), id - 126)
trigger126 = playerid(helper(28036 + id), id - 126), ishelper
trigger126 = playerid(helper(28036 + id), id - 126), teamside != teamside
trigger126 = playerid(helper(28036 + id), id - 126), MoveType = A
trigger126 = 1 || Fvar(26) := helper(28036 + id), id - 126
trigger127 = PlayerIDExist(helper(28036 + id), id - 127)
trigger127 = playerid(helper(28036 + id), id - 127), ishelper
trigger127 = playerid(helper(28036 + id), id - 127), teamside != teamside
trigger127 = playerid(helper(28036 + id), id - 127), MoveType = A
trigger127 = 1 || Fvar(26) := helper(28036 + id), id - 127
trigger128 = PlayerIDExist(helper(28036 + id), id - 128)
trigger128 = playerid(helper(28036 + id), id - 128), ishelper
trigger128 = playerid(helper(28036 + id), id - 128), teamside != teamside
trigger128 = playerid(helper(28036 + id), id - 128), MoveType = A
trigger128 = 1 || Fvar(26) := helper(28036 + id), id - 128
trigger129 = PlayerIDExist(helper(28036 + id), id - 129)
trigger129 = playerid(helper(28036 + id), id - 129), ishelper
trigger129 = playerid(helper(28036 + id), id - 129), teamside != teamside
trigger129 = playerid(helper(28036 + id), id - 129), MoveType = A
trigger129 = 1 || Fvar(26) := helper(28036 + id), id - 129
trigger130 = PlayerIDExist(helper(28036 + id), id - 130)
trigger130 = playerid(helper(28036 + id), id - 130), ishelper
trigger130 = playerid(helper(28036 + id), id - 130), teamside != teamside
trigger130 = playerid(helper(28036 + id), id - 130), MoveType = A
trigger130 = 1 || Fvar(26) := helper(28036 + id), id - 130
trigger131 = PlayerIDExist(helper(28036 + id), id - 131)
trigger131 = playerid(helper(28036 + id), id - 131), ishelper
trigger131 = playerid(helper(28036 + id), id - 131), teamside != teamside
trigger131 = playerid(helper(28036 + id), id - 131), MoveType = A
trigger131 = 1 || Fvar(26) := helper(28036 + id), id - 131
trigger132 = PlayerIDExist(helper(28036 + id), id - 132)
trigger132 = playerid(helper(28036 + id), id - 132), ishelper
trigger132 = playerid(helper(28036 + id), id - 132), teamside != teamside
trigger132 = playerid(helper(28036 + id), id - 132), MoveType = A
trigger132 = 1 || Fvar(26) := helper(28036 + id), id - 132
trigger133 = PlayerIDExist(helper(28036 + id), id - 133)
trigger133 = playerid(helper(28036 + id), id - 133), ishelper
trigger133 = playerid(helper(28036 + id), id - 133), teamside != teamside
trigger133 = playerid(helper(28036 + id), id - 133), MoveType = A
trigger133 = 1 || Fvar(26) := helper(28036 + id), id - 133
trigger134 = PlayerIDExist(helper(28036 + id), id - 134)
trigger134 = playerid(helper(28036 + id), id - 134), ishelper
trigger134 = playerid(helper(28036 + id), id - 134), teamside != teamside
trigger134 = playerid(helper(28036 + id), id - 134), MoveType = A
trigger134 = 1 || Fvar(26) := helper(28036 + id), id - 134
trigger135 = PlayerIDExist(helper(28036 + id), id - 135)
trigger135 = playerid(helper(28036 + id), id - 135), ishelper
trigger135 = playerid(helper(28036 + id), id - 135), teamside != teamside
trigger135 = playerid(helper(28036 + id), id - 135), MoveType = A
trigger135 = 1 || Fvar(26) := helper(28036 + id), id - 135
trigger136 = PlayerIDExist(helper(28036 + id), id - 136)
trigger136 = playerid(helper(28036 + id), id - 136), ishelper
trigger136 = playerid(helper(28036 + id), id - 136), teamside != teamside
trigger136 = playerid(helper(28036 + id), id - 136), MoveType = A
trigger136 = 1 || Fvar(26) := helper(28036 + id), id - 136
trigger137 = PlayerIDExist(helper(28036 + id), id - 137)
trigger137 = playerid(helper(28036 + id), id - 137), ishelper
trigger137 = playerid(helper(28036 + id), id - 137), teamside != teamside
trigger137 = playerid(helper(28036 + id), id - 137), MoveType = A
trigger137 = 1 || Fvar(26) := helper(28036 + id), id - 137
trigger138 = PlayerIDExist(helper(28036 + id), id - 138)
trigger138 = playerid(helper(28036 + id), id - 138), ishelper
trigger138 = playerid(helper(28036 + id), id - 138), teamside != teamside
trigger138 = playerid(helper(28036 + id), id - 138), MoveType = A
trigger138 = 1 || Fvar(26) := helper(28036 + id), id - 138
trigger139 = PlayerIDExist(helper(28036 + id), id - 139)
trigger139 = playerid(helper(28036 + id), id - 139), ishelper
trigger139 = playerid(helper(28036 + id), id - 139), teamside != teamside
trigger139 = playerid(helper(28036 + id), id - 139), MoveType = A
trigger139 = 1 || Fvar(26) := helper(28036 + id), id - 139
trigger140 = PlayerIDExist(helper(28036 + id), id - 140)
trigger140 = playerid(helper(28036 + id), id - 140), ishelper
trigger140 = playerid(helper(28036 + id), id - 140), teamside != teamside
trigger140 = playerid(helper(28036 + id), id - 140), MoveType = A
trigger140 = 1 || Fvar(26) := helper(28036 + id), id - 140
trigger141 = PlayerIDExist(helper(28036 + id), id - 141)
trigger141 = playerid(helper(28036 + id), id - 141), ishelper
trigger141 = playerid(helper(28036 + id), id - 141), teamside != teamside
trigger141 = playerid(helper(28036 + id), id - 141), MoveType = A
trigger141 = 1 || Fvar(26) := helper(28036 + id), id - 141
trigger142 = PlayerIDExist(helper(28036 + id), id - 142)
trigger142 = playerid(helper(28036 + id), id - 142), ishelper
trigger142 = playerid(helper(28036 + id), id - 142), teamside != teamside
trigger142 = playerid(helper(28036 + id), id - 142), MoveType = A
trigger142 = 1 || Fvar(26) := helper(28036 + id), id - 142
trigger143 = PlayerIDExist(helper(28036 + id), id - 143)
trigger143 = playerid(helper(28036 + id), id - 143), ishelper
trigger143 = playerid(helper(28036 + id), id - 143), teamside != teamside
trigger143 = playerid(helper(28036 + id), id - 143), MoveType = A
trigger143 = 1 || Fvar(26) := helper(28036 + id), id - 143
trigger144 = PlayerIDExist(helper(28036 + id), id - 144)
trigger144 = playerid(helper(28036 + id), id - 144), ishelper
trigger144 = playerid(helper(28036 + id), id - 144), teamside != teamside
trigger144 = playerid(helper(28036 + id), id - 144), MoveType = A
trigger144 = 1 || Fvar(26) := helper(28036 + id), id - 144
trigger145 = PlayerIDExist(helper(28036 + id), id - 145)
trigger145 = playerid(helper(28036 + id), id - 145), ishelper
trigger145 = playerid(helper(28036 + id), id - 145), teamside != teamside
trigger145 = playerid(helper(28036 + id), id - 145), MoveType = A
trigger145 = 1 || Fvar(26) := helper(28036 + id), id - 145
trigger146 = PlayerIDExist(helper(28036 + id), id - 146)
trigger146 = playerid(helper(28036 + id), id - 146), ishelper
trigger146 = playerid(helper(28036 + id), id - 146), teamside != teamside
trigger146 = playerid(helper(28036 + id), id - 146), MoveType = A
trigger146 = 1 || Fvar(26) := helper(28036 + id), id - 146
trigger147 = PlayerIDExist(helper(28036 + id), id - 147)
trigger147 = playerid(helper(28036 + id), id - 147), ishelper
trigger147 = playerid(helper(28036 + id), id - 147), teamside != teamside
trigger147 = playerid(helper(28036 + id), id - 147), MoveType = A
trigger147 = 1 || Fvar(26) := helper(28036 + id), id - 147
trigger148 = PlayerIDExist(helper(28036 + id), id - 148)
trigger148 = playerid(helper(28036 + id), id - 148), ishelper
trigger148 = playerid(helper(28036 + id), id - 148), teamside != teamside
trigger148 = playerid(helper(28036 + id), id - 148), MoveType = A
trigger148 = 1 || Fvar(26) := helper(28036 + id), id - 148
trigger149 = PlayerIDExist(helper(28036 + id), id - 149)
trigger149 = playerid(helper(28036 + id), id - 149), ishelper
trigger149 = playerid(helper(28036 + id), id - 149), teamside != teamside
trigger149 = playerid(helper(28036 + id), id - 149), MoveType = A
trigger149 = 1 || Fvar(26) := helper(28036 + id), id - 149
trigger150 = PlayerIDExist(helper(28036 + id), id - 150)
trigger150 = playerid(helper(28036 + id), id - 150), ishelper
trigger150 = playerid(helper(28036 + id), id - 150), teamside != teamside
trigger150 = playerid(helper(28036 + id), id - 150), MoveType = A
trigger150 = 1 || Fvar(26) := helper(28036 + id), id - 150
trigger151 = PlayerIDExist(helper(28036 + id), id - 151)
trigger151 = playerid(helper(28036 + id), id - 151), ishelper
trigger151 = playerid(helper(28036 + id), id - 151), teamside != teamside
trigger151 = playerid(helper(28036 + id), id - 151), MoveType = A
trigger151 = 1 || Fvar(26) := helper(28036 + id), id - 151
trigger152 = PlayerIDExist(helper(28036 + id), id - 152)
trigger152 = playerid(helper(28036 + id), id - 152), ishelper
trigger152 = playerid(helper(28036 + id), id - 152), teamside != teamside
trigger152 = playerid(helper(28036 + id), id - 152), MoveType = A
trigger152 = 1 || Fvar(26) := helper(28036 + id), id - 152
trigger153 = PlayerIDExist(helper(28036 + id), id - 153)
trigger153 = playerid(helper(28036 + id), id - 153), ishelper
trigger153 = playerid(helper(28036 + id), id - 153), teamside != teamside
trigger153 = playerid(helper(28036 + id), id - 153), MoveType = A
trigger153 = 1 || Fvar(26) := helper(28036 + id), id - 153
trigger154 = PlayerIDExist(helper(28036 + id), id - 154)
trigger154 = playerid(helper(28036 + id), id - 154), ishelper
trigger154 = playerid(helper(28036 + id), id - 154), teamside != teamside
trigger154 = playerid(helper(28036 + id), id - 154), MoveType = A
trigger154 = 1 || Fvar(26) := helper(28036 + id), id - 154
trigger155 = PlayerIDExist(helper(28036 + id), id - 155)
trigger155 = playerid(helper(28036 + id), id - 155), ishelper
trigger155 = playerid(helper(28036 + id), id - 155), teamside != teamside
trigger155 = playerid(helper(28036 + id), id - 155), MoveType = A
trigger155 = 1 || Fvar(26) := helper(28036 + id), id - 155
trigger156 = PlayerIDExist(helper(28036 + id), id - 156)
trigger156 = playerid(helper(28036 + id), id - 156), ishelper
trigger156 = playerid(helper(28036 + id), id - 156), teamside != teamside
trigger156 = playerid(helper(28036 + id), id - 156), MoveType = A
trigger156 = 1 || Fvar(26) := helper(28036 + id), id - 156
trigger157 = PlayerIDExist(helper(28036 + id), id - 157)
trigger157 = playerid(helper(28036 + id), id - 157), ishelper
trigger157 = playerid(helper(28036 + id), id - 157), teamside != teamside
trigger157 = playerid(helper(28036 + id), id - 157), MoveType = A
trigger157 = 1 || Fvar(26) := helper(28036 + id), id - 157
trigger158 = PlayerIDExist(helper(28036 + id), id - 158)
trigger158 = playerid(helper(28036 + id), id - 158), ishelper
trigger158 = playerid(helper(28036 + id), id - 158), teamside != teamside
trigger158 = playerid(helper(28036 + id), id - 158), MoveType = A
trigger158 = 1 || Fvar(26) := helper(28036 + id), id - 158
trigger159 = PlayerIDExist(helper(28036 + id), id - 159)
trigger159 = playerid(helper(28036 + id), id - 159), ishelper
trigger159 = playerid(helper(28036 + id), id - 159), teamside != teamside
trigger159 = playerid(helper(28036 + id), id - 159), MoveType = A
trigger159 = 1 || Fvar(26) := helper(28036 + id), id - 159
trigger160 = PlayerIDExist(helper(28036 + id), id - 160)
trigger160 = playerid(helper(28036 + id), id - 160), ishelper
trigger160 = playerid(helper(28036 + id), id - 160), teamside != teamside
trigger160 = playerid(helper(28036 + id), id - 160), MoveType = A
trigger160 = 1 || Fvar(26) := helper(28036 + id), id - 160
trigger161 = PlayerIDExist(helper(28036 + id), id - 161)
trigger161 = playerid(helper(28036 + id), id - 161), ishelper
trigger161 = playerid(helper(28036 + id), id - 161), teamside != teamside
trigger161 = playerid(helper(28036 + id), id - 161), MoveType = A
trigger161 = 1 || Fvar(26) := helper(28036 + id), id - 161
trigger162 = PlayerIDExist(helper(28036 + id), id - 162)
trigger162 = playerid(helper(28036 + id), id - 162), ishelper
trigger162 = playerid(helper(28036 + id), id - 162), teamside != teamside
trigger162 = playerid(helper(28036 + id), id - 162), MoveType = A
trigger162 = 1 || Fvar(26) := helper(28036 + id), id - 162
trigger163 = PlayerIDExist(helper(28036 + id), id - 163)
trigger163 = playerid(helper(28036 + id), id - 163), ishelper
trigger163 = playerid(helper(28036 + id), id - 163), teamside != teamside
trigger163 = playerid(helper(28036 + id), id - 163), MoveType = A
trigger163 = 1 || Fvar(26) := helper(28036 + id), id - 163
trigger164 = PlayerIDExist(helper(28036 + id), id - 164)
trigger164 = playerid(helper(28036 + id), id - 164), ishelper
trigger164 = playerid(helper(28036 + id), id - 164), teamside != teamside
trigger164 = playerid(helper(28036 + id), id - 164), MoveType = A
trigger164 = 1 || Fvar(26) := helper(28036 + id), id - 164
trigger165 = PlayerIDExist(helper(28036 + id), id - 165)
trigger165 = playerid(helper(28036 + id), id - 165), ishelper
trigger165 = playerid(helper(28036 + id), id - 165), teamside != teamside
trigger165 = playerid(helper(28036 + id), id - 165), MoveType = A
trigger165 = 1 || Fvar(26) := helper(28036 + id), id - 165
trigger166 = PlayerIDExist(helper(28036 + id), id - 166)
trigger166 = playerid(helper(28036 + id), id - 166), ishelper
trigger166 = playerid(helper(28036 + id), id - 166), teamside != teamside
trigger166 = playerid(helper(28036 + id), id - 166), MoveType = A
trigger166 = 1 || Fvar(26) := helper(28036 + id), id - 166
trigger167 = PlayerIDExist(helper(28036 + id), id - 167)
trigger167 = playerid(helper(28036 + id), id - 167), ishelper
trigger167 = playerid(helper(28036 + id), id - 167), teamside != teamside
trigger167 = playerid(helper(28036 + id), id - 167), MoveType = A
trigger167 = 1 || Fvar(26) := helper(28036 + id), id - 167
trigger168 = PlayerIDExist(helper(28036 + id), id - 168)
trigger168 = playerid(helper(28036 + id), id - 168), ishelper
trigger168 = playerid(helper(28036 + id), id - 168), teamside != teamside
trigger168 = playerid(helper(28036 + id), id - 168), MoveType = A
trigger168 = 1 || Fvar(26) := helper(28036 + id), id - 168
trigger169 = PlayerIDExist(helper(28036 + id), id - 169)
trigger169 = playerid(helper(28036 + id), id - 169), ishelper
trigger169 = playerid(helper(28036 + id), id - 169), teamside != teamside
trigger169 = playerid(helper(28036 + id), id - 169), MoveType = A
trigger169 = 1 || Fvar(26) := helper(28036 + id), id - 169
trigger170 = PlayerIDExist(helper(28036 + id), id - 170)
trigger170 = playerid(helper(28036 + id), id - 170), ishelper
trigger170 = playerid(helper(28036 + id), id - 170), teamside != teamside
trigger170 = playerid(helper(28036 + id), id - 170), MoveType = A
trigger170 = 1 || Fvar(26) := helper(28036 + id), id - 170
trigger171 = PlayerIDExist(helper(28036 + id), id - 171)
trigger171 = playerid(helper(28036 + id), id - 171), ishelper
trigger171 = playerid(helper(28036 + id), id - 171), teamside != teamside
trigger171 = playerid(helper(28036 + id), id - 171), MoveType = A
trigger171 = 1 || Fvar(26) := helper(28036 + id), id - 171
trigger172 = PlayerIDExist(helper(28036 + id), id - 172)
trigger172 = playerid(helper(28036 + id), id - 172), ishelper
trigger172 = playerid(helper(28036 + id), id - 172), teamside != teamside
trigger172 = playerid(helper(28036 + id), id - 172), MoveType = A
trigger172 = 1 || Fvar(26) := helper(28036 + id), id - 172
trigger173 = PlayerIDExist(helper(28036 + id), id - 173)
trigger173 = playerid(helper(28036 + id), id - 173), ishelper
trigger173 = playerid(helper(28036 + id), id - 173), teamside != teamside
trigger173 = playerid(helper(28036 + id), id - 173), MoveType = A
trigger173 = 1 || Fvar(26) := helper(28036 + id), id - 173
trigger174 = PlayerIDExist(helper(28036 + id), id - 174)
trigger174 = playerid(helper(28036 + id), id - 174), ishelper
trigger174 = playerid(helper(28036 + id), id - 174), teamside != teamside
trigger174 = playerid(helper(28036 + id), id - 174), MoveType = A
trigger174 = 1 || Fvar(26) := helper(28036 + id), id - 174
trigger175 = PlayerIDExist(helper(28036 + id), id - 175)
trigger175 = playerid(helper(28036 + id), id - 175), ishelper
trigger175 = playerid(helper(28036 + id), id - 175), teamside != teamside
trigger175 = playerid(helper(28036 + id), id - 175), MoveType = A
trigger175 = 1 || Fvar(26) := helper(28036 + id), id - 175
trigger176 = PlayerIDExist(helper(28036 + id), id - 176)
trigger176 = playerid(helper(28036 + id), id - 176), ishelper
trigger176 = playerid(helper(28036 + id), id - 176), teamside != teamside
trigger176 = playerid(helper(28036 + id), id - 176), MoveType = A
trigger176 = 1 || Fvar(26) := helper(28036 + id), id - 176
trigger177 = PlayerIDExist(helper(28036 + id), id - 177)
trigger177 = playerid(helper(28036 + id), id - 177), ishelper
trigger177 = playerid(helper(28036 + id), id - 177), teamside != teamside
trigger177 = playerid(helper(28036 + id), id - 177), MoveType = A
trigger177 = 1 || Fvar(26) := helper(28036 + id), id - 177
trigger178 = PlayerIDExist(helper(28036 + id), id - 178)
trigger178 = playerid(helper(28036 + id), id - 178), ishelper
trigger178 = playerid(helper(28036 + id), id - 178), teamside != teamside
trigger178 = playerid(helper(28036 + id), id - 178), MoveType = A
trigger178 = 1 || Fvar(26) := helper(28036 + id), id - 178
trigger179 = PlayerIDExist(helper(28036 + id), id - 179)
trigger179 = playerid(helper(28036 + id), id - 179), ishelper
trigger179 = playerid(helper(28036 + id), id - 179), teamside != teamside
trigger179 = playerid(helper(28036 + id), id - 179), MoveType = A
trigger179 = 1 || Fvar(26) := helper(28036 + id), id - 179
trigger180 = PlayerIDExist(helper(28036 + id), id - 180)
trigger180 = playerid(helper(28036 + id), id - 180), ishelper
trigger180 = playerid(helper(28036 + id), id - 180), teamside != teamside
trigger180 = playerid(helper(28036 + id), id - 180), MoveType = A
trigger180 = 1 || Fvar(26) := helper(28036 + id), id - 180
trigger181 = PlayerIDExist(helper(28036 + id), id - 181)
trigger181 = playerid(helper(28036 + id), id - 181), ishelper
trigger181 = playerid(helper(28036 + id), id - 181), teamside != teamside
trigger181 = playerid(helper(28036 + id), id - 181), MoveType = A
trigger181 = 1 || Fvar(26) := helper(28036 + id), id - 181
trigger182 = PlayerIDExist(helper(28036 + id), id - 182)
trigger182 = playerid(helper(28036 + id), id - 182), ishelper
trigger182 = playerid(helper(28036 + id), id - 182), teamside != teamside
trigger182 = playerid(helper(28036 + id), id - 182), MoveType = A
trigger182 = 1 || Fvar(26) := helper(28036 + id), id - 182
trigger183 = PlayerIDExist(helper(28036 + id), id - 183)
trigger183 = playerid(helper(28036 + id), id - 183), ishelper
trigger183 = playerid(helper(28036 + id), id - 183), teamside != teamside
trigger183 = playerid(helper(28036 + id), id - 183), MoveType = A
trigger183 = 1 || Fvar(26) := helper(28036 + id), id - 183
trigger184 = PlayerIDExist(helper(28036 + id), id - 184)
trigger184 = playerid(helper(28036 + id), id - 184), ishelper
trigger184 = playerid(helper(28036 + id), id - 184), teamside != teamside
trigger184 = playerid(helper(28036 + id), id - 184), MoveType = A
trigger184 = 1 || Fvar(26) := helper(28036 + id), id - 184
trigger185 = PlayerIDExist(helper(28036 + id), id - 185)
trigger185 = playerid(helper(28036 + id), id - 185), ishelper
trigger185 = playerid(helper(28036 + id), id - 185), teamside != teamside
trigger185 = playerid(helper(28036 + id), id - 185), MoveType = A
trigger185 = 1 || Fvar(26) := helper(28036 + id), id - 185
trigger186 = PlayerIDExist(helper(28036 + id), id - 186)
trigger186 = playerid(helper(28036 + id), id - 186), ishelper
trigger186 = playerid(helper(28036 + id), id - 186), teamside != teamside
trigger186 = playerid(helper(28036 + id), id - 186), MoveType = A
trigger186 = 1 || Fvar(26) := helper(28036 + id), id - 186
trigger187 = PlayerIDExist(helper(28036 + id), id - 187)
trigger187 = playerid(helper(28036 + id), id - 187), ishelper
trigger187 = playerid(helper(28036 + id), id - 187), teamside != teamside
trigger187 = playerid(helper(28036 + id), id - 187), MoveType = A
trigger187 = 1 || Fvar(26) := helper(28036 + id), id - 187
trigger188 = PlayerIDExist(helper(28036 + id), id - 188)
trigger188 = playerid(helper(28036 + id), id - 188), ishelper
trigger188 = playerid(helper(28036 + id), id - 188), teamside != teamside
trigger188 = playerid(helper(28036 + id), id - 188), MoveType = A
trigger188 = 1 || Fvar(26) := helper(28036 + id), id - 188
trigger189 = PlayerIDExist(helper(28036 + id), id - 189)
trigger189 = playerid(helper(28036 + id), id - 189), ishelper
trigger189 = playerid(helper(28036 + id), id - 189), teamside != teamside
trigger189 = playerid(helper(28036 + id), id - 189), MoveType = A
trigger189 = 1 || Fvar(26) := helper(28036 + id), id - 189
trigger190 = PlayerIDExist(helper(28036 + id), id - 190)
trigger190 = playerid(helper(28036 + id), id - 190), ishelper
trigger190 = playerid(helper(28036 + id), id - 190), teamside != teamside
trigger190 = playerid(helper(28036 + id), id - 190), MoveType = A
trigger190 = 1 || Fvar(26) := helper(28036 + id), id - 190
trigger191 = PlayerIDExist(helper(28036 + id), id - 191)
trigger191 = playerid(helper(28036 + id), id - 191), ishelper
trigger191 = playerid(helper(28036 + id), id - 191), teamside != teamside
trigger191 = playerid(helper(28036 + id), id - 191), MoveType = A
trigger191 = 1 || Fvar(26) := helper(28036 + id), id - 191
trigger192 = PlayerIDExist(helper(28036 + id), id - 192)
trigger192 = playerid(helper(28036 + id), id - 192), ishelper
trigger192 = playerid(helper(28036 + id), id - 192), teamside != teamside
trigger192 = playerid(helper(28036 + id), id - 192), MoveType = A
trigger192 = 1 || Fvar(26) := helper(28036 + id), id - 192
trigger193 = PlayerIDExist(helper(28036 + id), id - 193)
trigger193 = playerid(helper(28036 + id), id - 193), ishelper
trigger193 = playerid(helper(28036 + id), id - 193), teamside != teamside
trigger193 = playerid(helper(28036 + id), id - 193), MoveType = A
trigger193 = 1 || Fvar(26) := helper(28036 + id), id - 193
trigger194 = PlayerIDExist(helper(28036 + id), id - 194)
trigger194 = playerid(helper(28036 + id), id - 194), ishelper
trigger194 = playerid(helper(28036 + id), id - 194), teamside != teamside
trigger194 = playerid(helper(28036 + id), id - 194), MoveType = A
trigger194 = 1 || Fvar(26) := helper(28036 + id), id - 194
trigger195 = PlayerIDExist(helper(28036 + id), id - 195)
trigger195 = playerid(helper(28036 + id), id - 195), ishelper
trigger195 = playerid(helper(28036 + id), id - 195), teamside != teamside
trigger195 = playerid(helper(28036 + id), id - 195), MoveType = A
trigger195 = 1 || Fvar(26) := helper(28036 + id), id - 195
trigger196 = PlayerIDExist(helper(28036 + id), id - 196)
trigger196 = playerid(helper(28036 + id), id - 196), ishelper
trigger196 = playerid(helper(28036 + id), id - 196), teamside != teamside
trigger196 = playerid(helper(28036 + id), id - 196), MoveType = A
trigger196 = 1 || Fvar(26) := helper(28036 + id), id - 196
trigger197 = PlayerIDExist(helper(28036 + id), id - 197)
trigger197 = playerid(helper(28036 + id), id - 197), ishelper
trigger197 = playerid(helper(28036 + id), id - 197), teamside != teamside
trigger197 = playerid(helper(28036 + id), id - 197), MoveType = A
trigger197 = 1 || Fvar(26) := helper(28036 + id), id - 197
trigger198 = PlayerIDExist(helper(28036 + id), id - 198)
trigger198 = playerid(helper(28036 + id), id - 198), ishelper
trigger198 = playerid(helper(28036 + id), id - 198), teamside != teamside
trigger198 = playerid(helper(28036 + id), id - 198), MoveType = A
trigger198 = 1 || Fvar(26) := helper(28036 + id), id - 198
trigger199 = PlayerIDExist(helper(28036 + id), id - 199)
trigger199 = playerid(helper(28036 + id), id - 199), ishelper
trigger199 = playerid(helper(28036 + id), id - 199), teamside != teamside
trigger199 = playerid(helper(28036 + id), id - 199), MoveType = A
trigger199 = 1 || Fvar(26) := helper(28036 + id), id - 199
trigger200 = PlayerIDExist(helper(28036 + id), id - 200)
trigger200 = playerid(helper(28036 + id), id - 200), ishelper
trigger200 = playerid(helper(28036 + id), id - 200), teamside != teamside
trigger200 = playerid(helper(28036 + id), id - 200), MoveType = A
trigger200 = 1 || Fvar(26) := helper(28036 + id), id - 200
ignorehitpause = 1


[State -2, ?方helper型?道id??]
type = Null
TriggerAll = Numhelper(28036 + id)
TriggerAll = helper(28036 + id), id > 200
trigger1 = PlayerIDExist(helper(28036 + id), id - 1)
trigger1 = playerid(helper(28036 + id), id - 1), ishelper
trigger1 = playerid(helper(28036 + id), id - 1), teamside = teamside
trigger1 = playerid(helper(28036 + id), id - 1), MoveType = A
trigger1 = 1 || Fvar(27) := helper(28036 + id), id - 1
trigger2 = PlayerIDExist(helper(28036 + id), id - 2)
trigger2 = playerid(helper(28036 + id), id - 2), ishelper
trigger2 = playerid(helper(28036 + id), id - 2), teamside = teamside
trigger2 = playerid(helper(28036 + id), id - 2), MoveType = A
trigger2 = 1 || Fvar(27) := helper(28036 + id), id - 2
trigger3 = PlayerIDExist(helper(28036 + id), id - 3)
trigger3 = playerid(helper(28036 + id), id - 3), ishelper
trigger3 = playerid(helper(28036 + id), id - 3), teamside = teamside
trigger3 = playerid(helper(28036 + id), id - 3), MoveType = A
trigger3 = 1 || Fvar(27) := helper(28036 + id), id - 3
trigger4 = PlayerIDExist(helper(28036 + id), id - 4)
trigger4 = playerid(helper(28036 + id), id - 4), ishelper
trigger4 = playerid(helper(28036 + id), id - 4), teamside = teamside
trigger4 = playerid(helper(28036 + id), id - 4), MoveType = A
trigger4 = 1 || Fvar(27) := helper(28036 + id), id - 4
trigger5 = PlayerIDExist(helper(28036 + id), id - 5)
trigger5 = playerid(helper(28036 + id), id - 5), ishelper
trigger5 = playerid(helper(28036 + id), id - 5), teamside = teamside
trigger5 = playerid(helper(28036 + id), id - 5), MoveType = A
trigger5 = 1 || Fvar(27) := helper(28036 + id), id - 5
trigger6 = PlayerIDExist(helper(28036 + id), id - 6)
trigger6 = playerid(helper(28036 + id), id - 6), ishelper
trigger6 = playerid(helper(28036 + id), id - 6), teamside = teamside
trigger6 = playerid(helper(28036 + id), id - 6), MoveType = A
trigger6 = 1 || Fvar(27) := helper(28036 + id), id - 6
trigger7 = PlayerIDExist(helper(28036 + id), id - 7)
trigger7 = playerid(helper(28036 + id), id - 7), ishelper
trigger7 = playerid(helper(28036 + id), id - 7), teamside = teamside
trigger7 = playerid(helper(28036 + id), id - 7), MoveType = A
trigger7 = 1 || Fvar(27) := helper(28036 + id), id - 7
trigger8 = PlayerIDExist(helper(28036 + id), id - 8)
trigger8 = playerid(helper(28036 + id), id - 8), ishelper
trigger8 = playerid(helper(28036 + id), id - 8), teamside = teamside
trigger8 = playerid(helper(28036 + id), id - 8), MoveType = A
trigger8 = 1 || Fvar(27) := helper(28036 + id), id - 8
trigger9 = PlayerIDExist(helper(28036 + id), id - 9)
trigger9 = playerid(helper(28036 + id), id - 9), ishelper
trigger9 = playerid(helper(28036 + id), id - 9), teamside = teamside
trigger9 = playerid(helper(28036 + id), id - 9), MoveType = A
trigger9 = 1 || Fvar(27) := helper(28036 + id), id - 9
trigger10 = PlayerIDExist(helper(28036 + id), id - 10)
trigger10 = playerid(helper(28036 + id), id - 10), ishelper
trigger10 = playerid(helper(28036 + id), id - 10), teamside = teamside
trigger10 = playerid(helper(28036 + id), id - 10), MoveType = A
trigger10 = 1 || Fvar(27) := helper(28036 + id), id - 10
trigger11 = PlayerIDExist(helper(28036 + id), id - 11)
trigger11 = playerid(helper(28036 + id), id - 11), ishelper
trigger11 = playerid(helper(28036 + id), id - 11), teamside = teamside
trigger11 = playerid(helper(28036 + id), id - 11), MoveType = A
trigger11 = 1 || Fvar(27) := helper(28036 + id), id - 11
trigger12 = PlayerIDExist(helper(28036 + id), id - 12)
trigger12 = playerid(helper(28036 + id), id - 12), ishelper
trigger12 = playerid(helper(28036 + id), id - 12), teamside = teamside
trigger12 = playerid(helper(28036 + id), id - 12), MoveType = A
trigger12 = 1 || Fvar(27) := helper(28036 + id), id - 12
trigger13 = PlayerIDExist(helper(28036 + id), id - 13)
trigger13 = playerid(helper(28036 + id), id - 13), ishelper
trigger13 = playerid(helper(28036 + id), id - 13), teamside = teamside
trigger13 = playerid(helper(28036 + id), id - 13), MoveType = A
trigger13 = 1 || Fvar(27) := helper(28036 + id), id - 13
trigger14 = PlayerIDExist(helper(28036 + id), id - 14)
trigger14 = playerid(helper(28036 + id), id - 14), ishelper
trigger14 = playerid(helper(28036 + id), id - 14), teamside = teamside
trigger14 = playerid(helper(28036 + id), id - 14), MoveType = A
trigger14 = 1 || Fvar(27) := helper(28036 + id), id - 14
trigger15 = PlayerIDExist(helper(28036 + id), id - 15)
trigger15 = playerid(helper(28036 + id), id - 15), ishelper
trigger15 = playerid(helper(28036 + id), id - 15), teamside = teamside
trigger15 = playerid(helper(28036 + id), id - 15), MoveType = A
trigger15 = 1 || Fvar(27) := helper(28036 + id), id - 15
trigger16 = PlayerIDExist(helper(28036 + id), id - 16)
trigger16 = playerid(helper(28036 + id), id - 16), ishelper
trigger16 = playerid(helper(28036 + id), id - 16), teamside = teamside
trigger16 = playerid(helper(28036 + id), id - 16), MoveType = A
trigger16 = 1 || Fvar(27) := helper(28036 + id), id - 16
trigger17 = PlayerIDExist(helper(28036 + id), id - 17)
trigger17 = playerid(helper(28036 + id), id - 17), ishelper
trigger17 = playerid(helper(28036 + id), id - 17), teamside = teamside
trigger17 = playerid(helper(28036 + id), id - 17), MoveType = A
trigger17 = 1 || Fvar(27) := helper(28036 + id), id - 17
trigger18 = PlayerIDExist(helper(28036 + id), id - 18)
trigger18 = playerid(helper(28036 + id), id - 18), ishelper
trigger18 = playerid(helper(28036 + id), id - 18), teamside = teamside
trigger18 = playerid(helper(28036 + id), id - 18), MoveType = A
trigger18 = 1 || Fvar(27) := helper(28036 + id), id - 18
trigger19 = PlayerIDExist(helper(28036 + id), id - 19)
trigger19 = playerid(helper(28036 + id), id - 19), ishelper
trigger19 = playerid(helper(28036 + id), id - 19), teamside = teamside
trigger19 = playerid(helper(28036 + id), id - 19), MoveType = A
trigger19 = 1 || Fvar(27) := helper(28036 + id), id - 19
trigger20 = PlayerIDExist(helper(28036 + id), id - 20)
trigger20 = playerid(helper(28036 + id), id - 20), ishelper
trigger20 = playerid(helper(28036 + id), id - 20), teamside = teamside
trigger20 = playerid(helper(28036 + id), id - 20), MoveType = A
trigger20 = 1 || Fvar(27) := helper(28036 + id), id - 20
trigger21 = PlayerIDExist(helper(28036 + id), id - 21)
trigger21 = playerid(helper(28036 + id), id - 21), ishelper
trigger21 = playerid(helper(28036 + id), id - 21), teamside = teamside
trigger21 = playerid(helper(28036 + id), id - 21), MoveType = A
trigger21 = 1 || Fvar(27) := helper(28036 + id), id - 21
trigger22 = PlayerIDExist(helper(28036 + id), id - 22)
trigger22 = playerid(helper(28036 + id), id - 22), ishelper
trigger22 = playerid(helper(28036 + id), id - 22), teamside = teamside
trigger22 = playerid(helper(28036 + id), id - 22), MoveType = A
trigger22 = 1 || Fvar(27) := helper(28036 + id), id - 22
trigger23 = PlayerIDExist(helper(28036 + id), id - 23)
trigger23 = playerid(helper(28036 + id), id - 23), ishelper
trigger23 = playerid(helper(28036 + id), id - 23), teamside = teamside
trigger23 = playerid(helper(28036 + id), id - 23), MoveType = A
trigger23 = 1 || Fvar(27) := helper(28036 + id), id - 23
trigger24 = PlayerIDExist(helper(28036 + id), id - 24)
trigger24 = playerid(helper(28036 + id), id - 24), ishelper
trigger24 = playerid(helper(28036 + id), id - 24), teamside = teamside
trigger24 = playerid(helper(28036 + id), id - 24), MoveType = A
trigger24 = 1 || Fvar(27) := helper(28036 + id), id - 24
trigger25 = PlayerIDExist(helper(28036 + id), id - 25)
trigger25 = playerid(helper(28036 + id), id - 25), ishelper
trigger25 = playerid(helper(28036 + id), id - 25), teamside = teamside
trigger25 = playerid(helper(28036 + id), id - 25), MoveType = A
trigger25 = 1 || Fvar(27) := helper(28036 + id), id - 25
trigger26 = PlayerIDExist(helper(28036 + id), id - 26)
trigger26 = playerid(helper(28036 + id), id - 26), ishelper
trigger26 = playerid(helper(28036 + id), id - 26), teamside = teamside
trigger26 = playerid(helper(28036 + id), id - 26), MoveType = A
trigger26 = 1 || Fvar(27) := helper(28036 + id), id - 26
trigger27 = PlayerIDExist(helper(28036 + id), id - 27)
trigger27 = playerid(helper(28036 + id), id - 27), ishelper
trigger27 = playerid(helper(28036 + id), id - 27), teamside = teamside
trigger27 = playerid(helper(28036 + id), id - 27), MoveType = A
trigger27 = 1 || Fvar(27) := helper(28036 + id), id - 27
trigger28 = PlayerIDExist(helper(28036 + id), id - 28)
trigger28 = playerid(helper(28036 + id), id - 28), ishelper
trigger28 = playerid(helper(28036 + id), id - 28), teamside = teamside
trigger28 = playerid(helper(28036 + id), id - 28), MoveType = A
trigger28 = 1 || Fvar(27) := helper(28036 + id), id - 28
trigger29 = PlayerIDExist(helper(28036 + id), id - 29)
trigger29 = playerid(helper(28036 + id), id - 29), ishelper
trigger29 = playerid(helper(28036 + id), id - 29), teamside = teamside
trigger29 = playerid(helper(28036 + id), id - 29), MoveType = A
trigger29 = 1 || Fvar(27) := helper(28036 + id), id - 29
trigger30 = PlayerIDExist(helper(28036 + id), id - 30)
trigger30 = playerid(helper(28036 + id), id - 30), ishelper
trigger30 = playerid(helper(28036 + id), id - 30), teamside = teamside
trigger30 = playerid(helper(28036 + id), id - 30), MoveType = A
trigger30 = 1 || Fvar(27) := helper(28036 + id), id - 30
trigger31 = PlayerIDExist(helper(28036 + id), id - 31)
trigger31 = playerid(helper(28036 + id), id - 31), ishelper
trigger31 = playerid(helper(28036 + id), id - 31), teamside = teamside
trigger31 = playerid(helper(28036 + id), id - 31), MoveType = A
trigger31 = 1 || Fvar(27) := helper(28036 + id), id - 31
trigger32 = PlayerIDExist(helper(28036 + id), id - 32)
trigger32 = playerid(helper(28036 + id), id - 32), ishelper
trigger32 = playerid(helper(28036 + id), id - 32), teamside = teamside
trigger32 = playerid(helper(28036 + id), id - 32), MoveType = A
trigger32 = 1 || Fvar(27) := helper(28036 + id), id - 32
trigger33 = PlayerIDExist(helper(28036 + id), id - 33)
trigger33 = playerid(helper(28036 + id), id - 33), ishelper
trigger33 = playerid(helper(28036 + id), id - 33), teamside = teamside
trigger33 = playerid(helper(28036 + id), id - 33), MoveType = A
trigger33 = 1 || Fvar(27) := helper(28036 + id), id - 33
trigger34 = PlayerIDExist(helper(28036 + id), id - 34)
trigger34 = playerid(helper(28036 + id), id - 34), ishelper
trigger34 = playerid(helper(28036 + id), id - 34), teamside = teamside
trigger34 = playerid(helper(28036 + id), id - 34), MoveType = A
trigger34 = 1 || Fvar(27) := helper(28036 + id), id - 34
trigger35 = PlayerIDExist(helper(28036 + id), id - 35)
trigger35 = playerid(helper(28036 + id), id - 35), ishelper
trigger35 = playerid(helper(28036 + id), id - 35), teamside = teamside
trigger35 = playerid(helper(28036 + id), id - 35), MoveType = A
trigger35 = 1 || Fvar(27) := helper(28036 + id), id - 35
trigger36 = PlayerIDExist(helper(28036 + id), id - 36)
trigger36 = playerid(helper(28036 + id), id - 36), ishelper
trigger36 = playerid(helper(28036 + id), id - 36), teamside = teamside
trigger36 = playerid(helper(28036 + id), id - 36), MoveType = A
trigger36 = 1 || Fvar(27) := helper(28036 + id), id - 36
trigger37 = PlayerIDExist(helper(28036 + id), id - 37)
trigger37 = playerid(helper(28036 + id), id - 37), ishelper
trigger37 = playerid(helper(28036 + id), id - 37), teamside = teamside
trigger37 = playerid(helper(28036 + id), id - 37), MoveType = A
trigger37 = 1 || Fvar(27) := helper(28036 + id), id - 37
trigger38 = PlayerIDExist(helper(28036 + id), id - 38)
trigger38 = playerid(helper(28036 + id), id - 38), ishelper
trigger38 = playerid(helper(28036 + id), id - 38), teamside = teamside
trigger38 = playerid(helper(28036 + id), id - 38), MoveType = A
trigger38 = 1 || Fvar(27) := helper(28036 + id), id - 38
trigger39 = PlayerIDExist(helper(28036 + id), id - 39)
trigger39 = playerid(helper(28036 + id), id - 39), ishelper
trigger39 = playerid(helper(28036 + id), id - 39), teamside = teamside
trigger39 = playerid(helper(28036 + id), id - 39), MoveType = A
trigger39 = 1 || Fvar(27) := helper(28036 + id), id - 39
trigger40 = PlayerIDExist(helper(28036 + id), id - 40)
trigger40 = playerid(helper(28036 + id), id - 40), ishelper
trigger40 = playerid(helper(28036 + id), id - 40), teamside = teamside
trigger40 = playerid(helper(28036 + id), id - 40), MoveType = A
trigger40 = 1 || Fvar(27) := helper(28036 + id), id - 40
trigger41 = PlayerIDExist(helper(28036 + id), id - 41)
trigger41 = playerid(helper(28036 + id), id - 41), ishelper
trigger41 = playerid(helper(28036 + id), id - 41), teamside = teamside
trigger41 = playerid(helper(28036 + id), id - 41), MoveType = A
trigger41 = 1 || Fvar(27) := helper(28036 + id), id - 41
trigger42 = PlayerIDExist(helper(28036 + id), id - 42)
trigger42 = playerid(helper(28036 + id), id - 42), ishelper
trigger42 = playerid(helper(28036 + id), id - 42), teamside = teamside
trigger42 = playerid(helper(28036 + id), id - 42), MoveType = A
trigger42 = 1 || Fvar(27) := helper(28036 + id), id - 42
trigger43 = PlayerIDExist(helper(28036 + id), id - 43)
trigger43 = playerid(helper(28036 + id), id - 43), ishelper
trigger43 = playerid(helper(28036 + id), id - 43), teamside = teamside
trigger43 = playerid(helper(28036 + id), id - 43), MoveType = A
trigger43 = 1 || Fvar(27) := helper(28036 + id), id - 43
trigger44 = PlayerIDExist(helper(28036 + id), id - 44)
trigger44 = playerid(helper(28036 + id), id - 44), ishelper
trigger44 = playerid(helper(28036 + id), id - 44), teamside = teamside
trigger44 = playerid(helper(28036 + id), id - 44), MoveType = A
trigger44 = 1 || Fvar(27) := helper(28036 + id), id - 44
trigger45 = PlayerIDExist(helper(28036 + id), id - 45)
trigger45 = playerid(helper(28036 + id), id - 45), ishelper
trigger45 = playerid(helper(28036 + id), id - 45), teamside = teamside
trigger45 = playerid(helper(28036 + id), id - 45), MoveType = A
trigger45 = 1 || Fvar(27) := helper(28036 + id), id - 45
trigger46 = PlayerIDExist(helper(28036 + id), id - 46)
trigger46 = playerid(helper(28036 + id), id - 46), ishelper
trigger46 = playerid(helper(28036 + id), id - 46), teamside = teamside
trigger46 = playerid(helper(28036 + id), id - 46), MoveType = A
trigger46 = 1 || Fvar(27) := helper(28036 + id), id - 46
trigger47 = PlayerIDExist(helper(28036 + id), id - 47)
trigger47 = playerid(helper(28036 + id), id - 47), ishelper
trigger47 = playerid(helper(28036 + id), id - 47), teamside = teamside
trigger47 = playerid(helper(28036 + id), id - 47), MoveType = A
trigger47 = 1 || Fvar(27) := helper(28036 + id), id - 47
trigger48 = PlayerIDExist(helper(28036 + id), id - 48)
trigger48 = playerid(helper(28036 + id), id - 48), ishelper
trigger48 = playerid(helper(28036 + id), id - 48), teamside = teamside
trigger48 = playerid(helper(28036 + id), id - 48), MoveType = A
trigger48 = 1 || Fvar(27) := helper(28036 + id), id - 48
trigger49 = PlayerIDExist(helper(28036 + id), id - 49)
trigger49 = playerid(helper(28036 + id), id - 49), ishelper
trigger49 = playerid(helper(28036 + id), id - 49), teamside = teamside
trigger49 = playerid(helper(28036 + id), id - 49), MoveType = A
trigger49 = 1 || Fvar(27) := helper(28036 + id), id - 49
trigger50 = PlayerIDExist(helper(28036 + id), id - 50)
trigger50 = playerid(helper(28036 + id), id - 50), ishelper
trigger50 = playerid(helper(28036 + id), id - 50), teamside = teamside
trigger50 = playerid(helper(28036 + id), id - 50), MoveType = A
trigger50 = 1 || Fvar(27) := helper(28036 + id), id - 50
trigger51 = PlayerIDExist(helper(28036 + id), id - 51)
trigger51 = playerid(helper(28036 + id), id - 51), ishelper
trigger51 = playerid(helper(28036 + id), id - 51), teamside = teamside
trigger51 = playerid(helper(28036 + id), id - 51), MoveType = A
trigger51 = 1 || Fvar(27) := helper(28036 + id), id - 51
trigger52 = PlayerIDExist(helper(28036 + id), id - 52)
trigger52 = playerid(helper(28036 + id), id - 52), ishelper
trigger52 = playerid(helper(28036 + id), id - 52), teamside = teamside
trigger52 = playerid(helper(28036 + id), id - 52), MoveType = A
trigger52 = 1 || Fvar(27) := helper(28036 + id), id - 52
trigger53 = PlayerIDExist(helper(28036 + id), id - 53)
trigger53 = playerid(helper(28036 + id), id - 53), ishelper
trigger53 = playerid(helper(28036 + id), id - 53), teamside = teamside
trigger53 = playerid(helper(28036 + id), id - 53), MoveType = A
trigger53 = 1 || Fvar(27) := helper(28036 + id), id - 53
trigger54 = PlayerIDExist(helper(28036 + id), id - 54)
trigger54 = playerid(helper(28036 + id), id - 54), ishelper
trigger54 = playerid(helper(28036 + id), id - 54), teamside = teamside
trigger54 = playerid(helper(28036 + id), id - 54), MoveType = A
trigger54 = 1 || Fvar(27) := helper(28036 + id), id - 54
trigger55 = PlayerIDExist(helper(28036 + id), id - 55)
trigger55 = playerid(helper(28036 + id), id - 55), ishelper
trigger55 = playerid(helper(28036 + id), id - 55), teamside = teamside
trigger55 = playerid(helper(28036 + id), id - 55), MoveType = A
trigger55 = 1 || Fvar(27) := helper(28036 + id), id - 55
trigger56 = PlayerIDExist(helper(28036 + id), id - 56)
trigger56 = playerid(helper(28036 + id), id - 56), ishelper
trigger56 = playerid(helper(28036 + id), id - 56), teamside = teamside
trigger56 = playerid(helper(28036 + id), id - 56), MoveType = A
trigger56 = 1 || Fvar(27) := helper(28036 + id), id - 56
trigger57 = PlayerIDExist(helper(28036 + id), id - 57)
trigger57 = playerid(helper(28036 + id), id - 57), ishelper
trigger57 = playerid(helper(28036 + id), id - 57), teamside = teamside
trigger57 = playerid(helper(28036 + id), id - 57), MoveType = A
trigger57 = 1 || Fvar(27) := helper(28036 + id), id - 57
trigger58 = PlayerIDExist(helper(28036 + id), id - 58)
trigger58 = playerid(helper(28036 + id), id - 58), ishelper
trigger58 = playerid(helper(28036 + id), id - 58), teamside = teamside
trigger58 = playerid(helper(28036 + id), id - 58), MoveType = A
trigger58 = 1 || Fvar(27) := helper(28036 + id), id - 58
trigger59 = PlayerIDExist(helper(28036 + id), id - 59)
trigger59 = playerid(helper(28036 + id), id - 59), ishelper
trigger59 = playerid(helper(28036 + id), id - 59), teamside = teamside
trigger59 = playerid(helper(28036 + id), id - 59), MoveType = A
trigger59 = 1 || Fvar(27) := helper(28036 + id), id - 59
trigger60 = PlayerIDExist(helper(28036 + id), id - 60)
trigger60 = playerid(helper(28036 + id), id - 60), ishelper
trigger60 = playerid(helper(28036 + id), id - 60), teamside = teamside
trigger60 = playerid(helper(28036 + id), id - 60), MoveType = A
trigger60 = 1 || Fvar(27) := helper(28036 + id), id - 60
trigger61 = PlayerIDExist(helper(28036 + id), id - 61)
trigger61 = playerid(helper(28036 + id), id - 61), ishelper
trigger61 = playerid(helper(28036 + id), id - 61), teamside = teamside
trigger61 = playerid(helper(28036 + id), id - 61), MoveType = A
trigger61 = 1 || Fvar(27) := helper(28036 + id), id - 61
trigger62 = PlayerIDExist(helper(28036 + id), id - 62)
trigger62 = playerid(helper(28036 + id), id - 62), ishelper
trigger62 = playerid(helper(28036 + id), id - 62), teamside = teamside
trigger62 = playerid(helper(28036 + id), id - 62), MoveType = A
trigger62 = 1 || Fvar(27) := helper(28036 + id), id - 62
trigger63 = PlayerIDExist(helper(28036 + id), id - 63)
trigger63 = playerid(helper(28036 + id), id - 63), ishelper
trigger63 = playerid(helper(28036 + id), id - 63), teamside = teamside
trigger63 = playerid(helper(28036 + id), id - 63), MoveType = A
trigger63 = 1 || Fvar(27) := helper(28036 + id), id - 63
trigger64 = PlayerIDExist(helper(28036 + id), id - 64)
trigger64 = playerid(helper(28036 + id), id - 64), ishelper
trigger64 = playerid(helper(28036 + id), id - 64), teamside = teamside
trigger64 = playerid(helper(28036 + id), id - 64), MoveType = A
trigger64 = 1 || Fvar(27) := helper(28036 + id), id - 64
trigger65 = PlayerIDExist(helper(28036 + id), id - 65)
trigger65 = playerid(helper(28036 + id), id - 65), ishelper
trigger65 = playerid(helper(28036 + id), id - 65), teamside = teamside
trigger65 = playerid(helper(28036 + id), id - 65), MoveType = A
trigger65 = 1 || Fvar(27) := helper(28036 + id), id - 65
trigger66 = PlayerIDExist(helper(28036 + id), id - 66)
trigger66 = playerid(helper(28036 + id), id - 66), ishelper
trigger66 = playerid(helper(28036 + id), id - 66), teamside = teamside
trigger66 = playerid(helper(28036 + id), id - 66), MoveType = A
trigger66 = 1 || Fvar(27) := helper(28036 + id), id - 66
trigger67 = PlayerIDExist(helper(28036 + id), id - 67)
trigger67 = playerid(helper(28036 + id), id - 67), ishelper
trigger67 = playerid(helper(28036 + id), id - 67), teamside = teamside
trigger67 = playerid(helper(28036 + id), id - 67), MoveType = A
trigger67 = 1 || Fvar(27) := helper(28036 + id), id - 67
trigger68 = PlayerIDExist(helper(28036 + id), id - 68)
trigger68 = playerid(helper(28036 + id), id - 68), ishelper
trigger68 = playerid(helper(28036 + id), id - 68), teamside = teamside
trigger68 = playerid(helper(28036 + id), id - 68), MoveType = A
trigger68 = 1 || Fvar(27) := helper(28036 + id), id - 68
trigger69 = PlayerIDExist(helper(28036 + id), id - 69)
trigger69 = playerid(helper(28036 + id), id - 69), ishelper
trigger69 = playerid(helper(28036 + id), id - 69), teamside = teamside
trigger69 = playerid(helper(28036 + id), id - 69), MoveType = A
trigger69 = 1 || Fvar(27) := helper(28036 + id), id - 69
trigger70 = PlayerIDExist(helper(28036 + id), id - 70)
trigger70 = playerid(helper(28036 + id), id - 70), ishelper
trigger70 = playerid(helper(28036 + id), id - 70), teamside = teamside
trigger70 = playerid(helper(28036 + id), id - 70), MoveType = A
trigger70 = 1 || Fvar(27) := helper(28036 + id), id - 70
trigger71 = PlayerIDExist(helper(28036 + id), id - 71)
trigger71 = playerid(helper(28036 + id), id - 71), ishelper
trigger71 = playerid(helper(28036 + id), id - 71), teamside = teamside
trigger71 = playerid(helper(28036 + id), id - 71), MoveType = A
trigger71 = 1 || Fvar(27) := helper(28036 + id), id - 71
trigger72 = PlayerIDExist(helper(28036 + id), id - 72)
trigger72 = playerid(helper(28036 + id), id - 72), ishelper
trigger72 = playerid(helper(28036 + id), id - 72), teamside = teamside
trigger72 = playerid(helper(28036 + id), id - 72), MoveType = A
trigger72 = 1 || Fvar(27) := helper(28036 + id), id - 72
trigger73 = PlayerIDExist(helper(28036 + id), id - 73)
trigger73 = playerid(helper(28036 + id), id - 73), ishelper
trigger73 = playerid(helper(28036 + id), id - 73), teamside = teamside
trigger73 = playerid(helper(28036 + id), id - 73), MoveType = A
trigger73 = 1 || Fvar(27) := helper(28036 + id), id - 73
trigger74 = PlayerIDExist(helper(28036 + id), id - 74)
trigger74 = playerid(helper(28036 + id), id - 74), ishelper
trigger74 = playerid(helper(28036 + id), id - 74), teamside = teamside
trigger74 = playerid(helper(28036 + id), id - 74), MoveType = A
trigger74 = 1 || Fvar(27) := helper(28036 + id), id - 74
trigger75 = PlayerIDExist(helper(28036 + id), id - 75)
trigger75 = playerid(helper(28036 + id), id - 75), ishelper
trigger75 = playerid(helper(28036 + id), id - 75), teamside = teamside
trigger75 = playerid(helper(28036 + id), id - 75), MoveType = A
trigger75 = 1 || Fvar(27) := helper(28036 + id), id - 75
trigger76 = PlayerIDExist(helper(28036 + id), id - 76)
trigger76 = playerid(helper(28036 + id), id - 76), ishelper
trigger76 = playerid(helper(28036 + id), id - 76), teamside = teamside
trigger76 = playerid(helper(28036 + id), id - 76), MoveType = A
trigger76 = 1 || Fvar(27) := helper(28036 + id), id - 76
trigger77 = PlayerIDExist(helper(28036 + id), id - 77)
trigger77 = playerid(helper(28036 + id), id - 77), ishelper
trigger77 = playerid(helper(28036 + id), id - 77), teamside = teamside
trigger77 = playerid(helper(28036 + id), id - 77), MoveType = A
trigger77 = 1 || Fvar(27) := helper(28036 + id), id - 77
trigger78 = PlayerIDExist(helper(28036 + id), id - 78)
trigger78 = playerid(helper(28036 + id), id - 78), ishelper
trigger78 = playerid(helper(28036 + id), id - 78), teamside = teamside
trigger78 = playerid(helper(28036 + id), id - 78), MoveType = A
trigger78 = 1 || Fvar(27) := helper(28036 + id), id - 78
trigger79 = PlayerIDExist(helper(28036 + id), id - 79)
trigger79 = playerid(helper(28036 + id), id - 79), ishelper
trigger79 = playerid(helper(28036 + id), id - 79), teamside = teamside
trigger79 = playerid(helper(28036 + id), id - 79), MoveType = A
trigger79 = 1 || Fvar(27) := helper(28036 + id), id - 79
trigger80 = PlayerIDExist(helper(28036 + id), id - 80)
trigger80 = playerid(helper(28036 + id), id - 80), ishelper
trigger80 = playerid(helper(28036 + id), id - 80), teamside = teamside
trigger80 = playerid(helper(28036 + id), id - 80), MoveType = A
trigger80 = 1 || Fvar(27) := helper(28036 + id), id - 80
trigger81 = PlayerIDExist(helper(28036 + id), id - 81)
trigger81 = playerid(helper(28036 + id), id - 81), ishelper
trigger81 = playerid(helper(28036 + id), id - 81), teamside = teamside
trigger81 = playerid(helper(28036 + id), id - 81), MoveType = A
trigger81 = 1 || Fvar(27) := helper(28036 + id), id - 81
trigger82 = PlayerIDExist(helper(28036 + id), id - 82)
trigger82 = playerid(helper(28036 + id), id - 82), ishelper
trigger82 = playerid(helper(28036 + id), id - 82), teamside = teamside
trigger82 = playerid(helper(28036 + id), id - 82), MoveType = A
trigger82 = 1 || Fvar(27) := helper(28036 + id), id - 82
trigger83 = PlayerIDExist(helper(28036 + id), id - 83)
trigger83 = playerid(helper(28036 + id), id - 83), ishelper
trigger83 = playerid(helper(28036 + id), id - 83), teamside = teamside
trigger83 = playerid(helper(28036 + id), id - 83), MoveType = A
trigger83 = 1 || Fvar(27) := helper(28036 + id), id - 83
trigger84 = PlayerIDExist(helper(28036 + id), id - 84)
trigger84 = playerid(helper(28036 + id), id - 84), ishelper
trigger84 = playerid(helper(28036 + id), id - 84), teamside = teamside
trigger84 = playerid(helper(28036 + id), id - 84), MoveType = A
trigger84 = 1 || Fvar(27) := helper(28036 + id), id - 84
trigger85 = PlayerIDExist(helper(28036 + id), id - 85)
trigger85 = playerid(helper(28036 + id), id - 85), ishelper
trigger85 = playerid(helper(28036 + id), id - 85), teamside = teamside
trigger85 = playerid(helper(28036 + id), id - 85), MoveType = A
trigger85 = 1 || Fvar(27) := helper(28036 + id), id - 85
trigger86 = PlayerIDExist(helper(28036 + id), id - 86)
trigger86 = playerid(helper(28036 + id), id - 86), ishelper
trigger86 = playerid(helper(28036 + id), id - 86), teamside = teamside
trigger86 = playerid(helper(28036 + id), id - 86), MoveType = A
trigger86 = 1 || Fvar(27) := helper(28036 + id), id - 86
trigger87 = PlayerIDExist(helper(28036 + id), id - 87)
trigger87 = playerid(helper(28036 + id), id - 87), ishelper
trigger87 = playerid(helper(28036 + id), id - 87), teamside = teamside
trigger87 = playerid(helper(28036 + id), id - 87), MoveType = A
trigger87 = 1 || Fvar(27) := helper(28036 + id), id - 87
trigger88 = PlayerIDExist(helper(28036 + id), id - 88)
trigger88 = playerid(helper(28036 + id), id - 88), ishelper
trigger88 = playerid(helper(28036 + id), id - 88), teamside = teamside
trigger88 = playerid(helper(28036 + id), id - 88), MoveType = A
trigger88 = 1 || Fvar(27) := helper(28036 + id), id - 88
trigger89 = PlayerIDExist(helper(28036 + id), id - 89)
trigger89 = playerid(helper(28036 + id), id - 89), ishelper
trigger89 = playerid(helper(28036 + id), id - 89), teamside = teamside
trigger89 = playerid(helper(28036 + id), id - 89), MoveType = A
trigger89 = 1 || Fvar(27) := helper(28036 + id), id - 89
trigger90 = PlayerIDExist(helper(28036 + id), id - 90)
trigger90 = playerid(helper(28036 + id), id - 90), ishelper
trigger90 = playerid(helper(28036 + id), id - 90), teamside = teamside
trigger90 = playerid(helper(28036 + id), id - 90), MoveType = A
trigger90 = 1 || Fvar(27) := helper(28036 + id), id - 90
trigger91 = PlayerIDExist(helper(28036 + id), id - 91)
trigger91 = playerid(helper(28036 + id), id - 91), ishelper
trigger91 = playerid(helper(28036 + id), id - 91), teamside = teamside
trigger91 = playerid(helper(28036 + id), id - 91), MoveType = A
trigger91 = 1 || Fvar(27) := helper(28036 + id), id - 91
trigger92 = PlayerIDExist(helper(28036 + id), id - 92)
trigger92 = playerid(helper(28036 + id), id - 92), ishelper
trigger92 = playerid(helper(28036 + id), id - 92), teamside = teamside
trigger92 = playerid(helper(28036 + id), id - 92), MoveType = A
trigger92 = 1 || Fvar(27) := helper(28036 + id), id - 92
trigger93 = PlayerIDExist(helper(28036 + id), id - 93)
trigger93 = playerid(helper(28036 + id), id - 93), ishelper
trigger93 = playerid(helper(28036 + id), id - 93), teamside = teamside
trigger93 = playerid(helper(28036 + id), id - 93), MoveType = A
trigger93 = 1 || Fvar(27) := helper(28036 + id), id - 93
trigger94 = PlayerIDExist(helper(28036 + id), id - 94)
trigger94 = playerid(helper(28036 + id), id - 94), ishelper
trigger94 = playerid(helper(28036 + id), id - 94), teamside = teamside
trigger94 = playerid(helper(28036 + id), id - 94), MoveType = A
trigger94 = 1 || Fvar(27) := helper(28036 + id), id - 94
trigger95 = PlayerIDExist(helper(28036 + id), id - 95)
trigger95 = playerid(helper(28036 + id), id - 95), ishelper
trigger95 = playerid(helper(28036 + id), id - 95), teamside = teamside
trigger95 = playerid(helper(28036 + id), id - 95), MoveType = A
trigger95 = 1 || Fvar(27) := helper(28036 + id), id - 95
trigger96 = PlayerIDExist(helper(28036 + id), id - 96)
trigger96 = playerid(helper(28036 + id), id - 96), ishelper
trigger96 = playerid(helper(28036 + id), id - 96), teamside = teamside
trigger96 = playerid(helper(28036 + id), id - 96), MoveType = A
trigger96 = 1 || Fvar(27) := helper(28036 + id), id - 96
trigger97 = PlayerIDExist(helper(28036 + id), id - 97)
trigger97 = playerid(helper(28036 + id), id - 97), ishelper
trigger97 = playerid(helper(28036 + id), id - 97), teamside = teamside
trigger97 = playerid(helper(28036 + id), id - 97), MoveType = A
trigger97 = 1 || Fvar(27) := helper(28036 + id), id - 97
trigger98 = PlayerIDExist(helper(28036 + id), id - 98)
trigger98 = playerid(helper(28036 + id), id - 98), ishelper
trigger98 = playerid(helper(28036 + id), id - 98), teamside = teamside
trigger98 = playerid(helper(28036 + id), id - 98), MoveType = A
trigger98 = 1 || Fvar(27) := helper(28036 + id), id - 98
trigger99 = PlayerIDExist(helper(28036 + id), id - 99)
trigger99 = playerid(helper(28036 + id), id - 99), ishelper
trigger99 = playerid(helper(28036 + id), id - 99), teamside = teamside
trigger99 = playerid(helper(28036 + id), id - 99), MoveType = A
trigger99 = 1 || Fvar(27) := helper(28036 + id), id - 99
trigger100 = PlayerIDExist(helper(28036 + id), id - 100)
trigger100 = playerid(helper(28036 + id), id - 100), ishelper
trigger100 = playerid(helper(28036 + id), id - 100), teamside = teamside
trigger100 = playerid(helper(28036 + id), id - 100), MoveType = A
trigger100 = 1 || Fvar(27) := helper(28036 + id), id - 100
trigger101 = PlayerIDExist(helper(28036 + id), id - 101)
trigger101 = playerid(helper(28036 + id), id - 101), ishelper
trigger101 = playerid(helper(28036 + id), id - 101), teamside = teamside
trigger101 = playerid(helper(28036 + id), id - 101), MoveType = A
trigger101 = 1 || Fvar(27) := helper(28036 + id), id - 101
trigger102 = PlayerIDExist(helper(28036 + id), id - 102)
trigger102 = playerid(helper(28036 + id), id - 102), ishelper
trigger102 = playerid(helper(28036 + id), id - 102), teamside = teamside
trigger102 = playerid(helper(28036 + id), id - 102), MoveType = A
trigger102 = 1 || Fvar(27) := helper(28036 + id), id - 102
trigger103 = PlayerIDExist(helper(28036 + id), id - 103)
trigger103 = playerid(helper(28036 + id), id - 103), ishelper
trigger103 = playerid(helper(28036 + id), id - 103), teamside = teamside
trigger103 = playerid(helper(28036 + id), id - 103), MoveType = A
trigger103 = 1 || Fvar(27) := helper(28036 + id), id - 103
trigger104 = PlayerIDExist(helper(28036 + id), id - 104)
trigger104 = playerid(helper(28036 + id), id - 104), ishelper
trigger104 = playerid(helper(28036 + id), id - 104), teamside = teamside
trigger104 = playerid(helper(28036 + id), id - 104), MoveType = A
trigger104 = 1 || Fvar(27) := helper(28036 + id), id - 104
trigger105 = PlayerIDExist(helper(28036 + id), id - 105)
trigger105 = playerid(helper(28036 + id), id - 105), ishelper
trigger105 = playerid(helper(28036 + id), id - 105), teamside = teamside
trigger105 = playerid(helper(28036 + id), id - 105), MoveType = A
trigger105 = 1 || Fvar(27) := helper(28036 + id), id - 105
trigger106 = PlayerIDExist(helper(28036 + id), id - 106)
trigger106 = playerid(helper(28036 + id), id - 106), ishelper
trigger106 = playerid(helper(28036 + id), id - 106), teamside = teamside
trigger106 = playerid(helper(28036 + id), id - 106), MoveType = A
trigger106 = 1 || Fvar(27) := helper(28036 + id), id - 106
trigger107 = PlayerIDExist(helper(28036 + id), id - 107)
trigger107 = playerid(helper(28036 + id), id - 107), ishelper
trigger107 = playerid(helper(28036 + id), id - 107), teamside = teamside
trigger107 = playerid(helper(28036 + id), id - 107), MoveType = A
trigger107 = 1 || Fvar(27) := helper(28036 + id), id - 107
trigger108 = PlayerIDExist(helper(28036 + id), id - 108)
trigger108 = playerid(helper(28036 + id), id - 108), ishelper
trigger108 = playerid(helper(28036 + id), id - 108), teamside = teamside
trigger108 = playerid(helper(28036 + id), id - 108), MoveType = A
trigger108 = 1 || Fvar(27) := helper(28036 + id), id - 108
trigger109 = PlayerIDExist(helper(28036 + id), id - 109)
trigger109 = playerid(helper(28036 + id), id - 109), ishelper
trigger109 = playerid(helper(28036 + id), id - 109), teamside = teamside
trigger109 = playerid(helper(28036 + id), id - 109), MoveType = A
trigger109 = 1 || Fvar(27) := helper(28036 + id), id - 109
trigger110 = PlayerIDExist(helper(28036 + id), id - 110)
trigger110 = playerid(helper(28036 + id), id - 110), ishelper
trigger110 = playerid(helper(28036 + id), id - 110), teamside = teamside
trigger110 = playerid(helper(28036 + id), id - 110), MoveType = A
trigger110 = 1 || Fvar(27) := helper(28036 + id), id - 110
trigger111 = PlayerIDExist(helper(28036 + id), id - 111)
trigger111 = playerid(helper(28036 + id), id - 111), ishelper
trigger111 = playerid(helper(28036 + id), id - 111), teamside = teamside
trigger111 = playerid(helper(28036 + id), id - 111), MoveType = A
trigger111 = 1 || Fvar(27) := helper(28036 + id), id - 111
trigger112 = PlayerIDExist(helper(28036 + id), id - 112)
trigger112 = playerid(helper(28036 + id), id - 112), ishelper
trigger112 = playerid(helper(28036 + id), id - 112), teamside = teamside
trigger112 = playerid(helper(28036 + id), id - 112), MoveType = A
trigger112 = 1 || Fvar(27) := helper(28036 + id), id - 112
trigger113 = PlayerIDExist(helper(28036 + id), id - 113)
trigger113 = playerid(helper(28036 + id), id - 113), ishelper
trigger113 = playerid(helper(28036 + id), id - 113), teamside = teamside
trigger113 = playerid(helper(28036 + id), id - 113), MoveType = A
trigger113 = 1 || Fvar(27) := helper(28036 + id), id - 113
trigger114 = PlayerIDExist(helper(28036 + id), id - 114)
trigger114 = playerid(helper(28036 + id), id - 114), ishelper
trigger114 = playerid(helper(28036 + id), id - 114), teamside = teamside
trigger114 = playerid(helper(28036 + id), id - 114), MoveType = A
trigger114 = 1 || Fvar(27) := helper(28036 + id), id - 114
trigger115 = PlayerIDExist(helper(28036 + id), id - 115)
trigger115 = playerid(helper(28036 + id), id - 115), ishelper
trigger115 = playerid(helper(28036 + id), id - 115), teamside = teamside
trigger115 = playerid(helper(28036 + id), id - 115), MoveType = A
trigger115 = 1 || Fvar(27) := helper(28036 + id), id - 115
trigger116 = PlayerIDExist(helper(28036 + id), id - 116)
trigger116 = playerid(helper(28036 + id), id - 116), ishelper
trigger116 = playerid(helper(28036 + id), id - 116), teamside = teamside
trigger116 = playerid(helper(28036 + id), id - 116), MoveType = A
trigger116 = 1 || Fvar(27) := helper(28036 + id), id - 116
trigger117 = PlayerIDExist(helper(28036 + id), id - 117)
trigger117 = playerid(helper(28036 + id), id - 117), ishelper
trigger117 = playerid(helper(28036 + id), id - 117), teamside = teamside
trigger117 = playerid(helper(28036 + id), id - 117), MoveType = A
trigger117 = 1 || Fvar(27) := helper(28036 + id), id - 117
trigger118 = PlayerIDExist(helper(28036 + id), id - 118)
trigger118 = playerid(helper(28036 + id), id - 118), ishelper
trigger118 = playerid(helper(28036 + id), id - 118), teamside = teamside
trigger118 = playerid(helper(28036 + id), id - 118), MoveType = A
trigger118 = 1 || Fvar(27) := helper(28036 + id), id - 118
trigger119 = PlayerIDExist(helper(28036 + id), id - 119)
trigger119 = playerid(helper(28036 + id), id - 119), ishelper
trigger119 = playerid(helper(28036 + id), id - 119), teamside = teamside
trigger119 = playerid(helper(28036 + id), id - 119), MoveType = A
trigger119 = 1 || Fvar(27) := helper(28036 + id), id - 119
trigger120 = PlayerIDExist(helper(28036 + id), id - 120)
trigger120 = playerid(helper(28036 + id), id - 120), ishelper
trigger120 = playerid(helper(28036 + id), id - 120), teamside = teamside
trigger120 = playerid(helper(28036 + id), id - 120), MoveType = A
trigger120 = 1 || Fvar(27) := helper(28036 + id), id - 120
trigger121 = PlayerIDExist(helper(28036 + id), id - 121)
trigger121 = playerid(helper(28036 + id), id - 121), ishelper
trigger121 = playerid(helper(28036 + id), id - 121), teamside = teamside
trigger121 = playerid(helper(28036 + id), id - 121), MoveType = A
trigger121 = 1 || Fvar(27) := helper(28036 + id), id - 121
trigger122 = PlayerIDExist(helper(28036 + id), id - 122)
trigger122 = playerid(helper(28036 + id), id - 122), ishelper
trigger122 = playerid(helper(28036 + id), id - 122), teamside = teamside
trigger122 = playerid(helper(28036 + id), id - 122), MoveType = A
trigger122 = 1 || Fvar(27) := helper(28036 + id), id - 122
trigger123 = PlayerIDExist(helper(28036 + id), id - 123)
trigger123 = playerid(helper(28036 + id), id - 123), ishelper
trigger123 = playerid(helper(28036 + id), id - 123), teamside = teamside
trigger123 = playerid(helper(28036 + id), id - 123), MoveType = A
trigger123 = 1 || Fvar(27) := helper(28036 + id), id - 123
trigger124 = PlayerIDExist(helper(28036 + id), id - 124)
trigger124 = playerid(helper(28036 + id), id - 124), ishelper
trigger124 = playerid(helper(28036 + id), id - 124), teamside = teamside
trigger124 = playerid(helper(28036 + id), id - 124), MoveType = A
trigger124 = 1 || Fvar(27) := helper(28036 + id), id - 124
trigger125 = PlayerIDExist(helper(28036 + id), id - 125)
trigger125 = playerid(helper(28036 + id), id - 125), ishelper
trigger125 = playerid(helper(28036 + id), id - 125), teamside = teamside
trigger125 = playerid(helper(28036 + id), id - 125), MoveType = A
trigger125 = 1 || Fvar(27) := helper(28036 + id), id - 125
trigger126 = PlayerIDExist(helper(28036 + id), id - 126)
trigger126 = playerid(helper(28036 + id), id - 126), ishelper
trigger126 = playerid(helper(28036 + id), id - 126), teamside = teamside
trigger126 = playerid(helper(28036 + id), id - 126), MoveType = A
trigger126 = 1 || Fvar(27) := helper(28036 + id), id - 126
trigger127 = PlayerIDExist(helper(28036 + id), id - 127)
trigger127 = playerid(helper(28036 + id), id - 127), ishelper
trigger127 = playerid(helper(28036 + id), id - 127), teamside = teamside
trigger127 = playerid(helper(28036 + id), id - 127), MoveType = A
trigger127 = 1 || Fvar(27) := helper(28036 + id), id - 127
trigger128 = PlayerIDExist(helper(28036 + id), id - 128)
trigger128 = playerid(helper(28036 + id), id - 128), ishelper
trigger128 = playerid(helper(28036 + id), id - 128), teamside = teamside
trigger128 = playerid(helper(28036 + id), id - 128), MoveType = A
trigger128 = 1 || Fvar(27) := helper(28036 + id), id - 128
trigger129 = PlayerIDExist(helper(28036 + id), id - 129)
trigger129 = playerid(helper(28036 + id), id - 129), ishelper
trigger129 = playerid(helper(28036 + id), id - 129), teamside = teamside
trigger129 = playerid(helper(28036 + id), id - 129), MoveType = A
trigger129 = 1 || Fvar(27) := helper(28036 + id), id - 129
trigger130 = PlayerIDExist(helper(28036 + id), id - 130)
trigger130 = playerid(helper(28036 + id), id - 130), ishelper
trigger130 = playerid(helper(28036 + id), id - 130), teamside = teamside
trigger130 = playerid(helper(28036 + id), id - 130), MoveType = A
trigger130 = 1 || Fvar(27) := helper(28036 + id), id - 130
trigger131 = PlayerIDExist(helper(28036 + id), id - 131)
trigger131 = playerid(helper(28036 + id), id - 131), ishelper
trigger131 = playerid(helper(28036 + id), id - 131), teamside = teamside
trigger131 = playerid(helper(28036 + id), id - 131), MoveType = A
trigger131 = 1 || Fvar(27) := helper(28036 + id), id - 131
trigger132 = PlayerIDExist(helper(28036 + id), id - 132)
trigger132 = playerid(helper(28036 + id), id - 132), ishelper
trigger132 = playerid(helper(28036 + id), id - 132), teamside = teamside
trigger132 = playerid(helper(28036 + id), id - 132), MoveType = A
trigger132 = 1 || Fvar(27) := helper(28036 + id), id - 132
trigger133 = PlayerIDExist(helper(28036 + id), id - 133)
trigger133 = playerid(helper(28036 + id), id - 133), ishelper
trigger133 = playerid(helper(28036 + id), id - 133), teamside = teamside
trigger133 = playerid(helper(28036 + id), id - 133), MoveType = A
trigger133 = 1 || Fvar(27) := helper(28036 + id), id - 133
trigger134 = PlayerIDExist(helper(28036 + id), id - 134)
trigger134 = playerid(helper(28036 + id), id - 134), ishelper
trigger134 = playerid(helper(28036 + id), id - 134), teamside = teamside
trigger134 = playerid(helper(28036 + id), id - 134), MoveType = A
trigger134 = 1 || Fvar(27) := helper(28036 + id), id - 134
trigger135 = PlayerIDExist(helper(28036 + id), id - 135)
trigger135 = playerid(helper(28036 + id), id - 135), ishelper
trigger135 = playerid(helper(28036 + id), id - 135), teamside = teamside
trigger135 = playerid(helper(28036 + id), id - 135), MoveType = A
trigger135 = 1 || Fvar(27) := helper(28036 + id), id - 135
trigger136 = PlayerIDExist(helper(28036 + id), id - 136)
trigger136 = playerid(helper(28036 + id), id - 136), ishelper
trigger136 = playerid(helper(28036 + id), id - 136), teamside = teamside
trigger136 = playerid(helper(28036 + id), id - 136), MoveType = A
trigger136 = 1 || Fvar(27) := helper(28036 + id), id - 136
trigger137 = PlayerIDExist(helper(28036 + id), id - 137)
trigger137 = playerid(helper(28036 + id), id - 137), ishelper
trigger137 = playerid(helper(28036 + id), id - 137), teamside = teamside
trigger137 = playerid(helper(28036 + id), id - 137), MoveType = A
trigger137 = 1 || Fvar(27) := helper(28036 + id), id - 137
trigger138 = PlayerIDExist(helper(28036 + id), id - 138)
trigger138 = playerid(helper(28036 + id), id - 138), ishelper
trigger138 = playerid(helper(28036 + id), id - 138), teamside = teamside
trigger138 = playerid(helper(28036 + id), id - 138), MoveType = A
trigger138 = 1 || Fvar(27) := helper(28036 + id), id - 138
trigger139 = PlayerIDExist(helper(28036 + id), id - 139)
trigger139 = playerid(helper(28036 + id), id - 139), ishelper
trigger139 = playerid(helper(28036 + id), id - 139), teamside = teamside
trigger139 = playerid(helper(28036 + id), id - 139), MoveType = A
trigger139 = 1 || Fvar(27) := helper(28036 + id), id - 139
trigger140 = PlayerIDExist(helper(28036 + id), id - 140)
trigger140 = playerid(helper(28036 + id), id - 140), ishelper
trigger140 = playerid(helper(28036 + id), id - 140), teamside = teamside
trigger140 = playerid(helper(28036 + id), id - 140), MoveType = A
trigger140 = 1 || Fvar(27) := helper(28036 + id), id - 140
trigger141 = PlayerIDExist(helper(28036 + id), id - 141)
trigger141 = playerid(helper(28036 + id), id - 141), ishelper
trigger141 = playerid(helper(28036 + id), id - 141), teamside = teamside
trigger141 = playerid(helper(28036 + id), id - 141), MoveType = A
trigger141 = 1 || Fvar(27) := helper(28036 + id), id - 141
trigger142 = PlayerIDExist(helper(28036 + id), id - 142)
trigger142 = playerid(helper(28036 + id), id - 142), ishelper
trigger142 = playerid(helper(28036 + id), id - 142), teamside = teamside
trigger142 = playerid(helper(28036 + id), id - 142), MoveType = A
trigger142 = 1 || Fvar(27) := helper(28036 + id), id - 142
trigger143 = PlayerIDExist(helper(28036 + id), id - 143)
trigger143 = playerid(helper(28036 + id), id - 143), ishelper
trigger143 = playerid(helper(28036 + id), id - 143), teamside = teamside
trigger143 = playerid(helper(28036 + id), id - 143), MoveType = A
trigger143 = 1 || Fvar(27) := helper(28036 + id), id - 143
trigger144 = PlayerIDExist(helper(28036 + id), id - 144)
trigger144 = playerid(helper(28036 + id), id - 144), ishelper
trigger144 = playerid(helper(28036 + id), id - 144), teamside = teamside
trigger144 = playerid(helper(28036 + id), id - 144), MoveType = A
trigger144 = 1 || Fvar(27) := helper(28036 + id), id - 144
trigger145 = PlayerIDExist(helper(28036 + id), id - 145)
trigger145 = playerid(helper(28036 + id), id - 145), ishelper
trigger145 = playerid(helper(28036 + id), id - 145), teamside = teamside
trigger145 = playerid(helper(28036 + id), id - 145), MoveType = A
trigger145 = 1 || Fvar(27) := helper(28036 + id), id - 145
trigger146 = PlayerIDExist(helper(28036 + id), id - 146)
trigger146 = playerid(helper(28036 + id), id - 146), ishelper
trigger146 = playerid(helper(28036 + id), id - 146), teamside = teamside
trigger146 = playerid(helper(28036 + id), id - 146), MoveType = A
trigger146 = 1 || Fvar(27) := helper(28036 + id), id - 146
trigger147 = PlayerIDExist(helper(28036 + id), id - 147)
trigger147 = playerid(helper(28036 + id), id - 147), ishelper
trigger147 = playerid(helper(28036 + id), id - 147), teamside = teamside
trigger147 = playerid(helper(28036 + id), id - 147), MoveType = A
trigger147 = 1 || Fvar(27) := helper(28036 + id), id - 147
trigger148 = PlayerIDExist(helper(28036 + id), id - 148)
trigger148 = playerid(helper(28036 + id), id - 148), ishelper
trigger148 = playerid(helper(28036 + id), id - 148), teamside = teamside
trigger148 = playerid(helper(28036 + id), id - 148), MoveType = A
trigger148 = 1 || Fvar(27) := helper(28036 + id), id - 148
trigger149 = PlayerIDExist(helper(28036 + id), id - 149)
trigger149 = playerid(helper(28036 + id), id - 149), ishelper
trigger149 = playerid(helper(28036 + id), id - 149), teamside = teamside
trigger149 = playerid(helper(28036 + id), id - 149), MoveType = A
trigger149 = 1 || Fvar(27) := helper(28036 + id), id - 149
trigger150 = PlayerIDExist(helper(28036 + id), id - 150)
trigger150 = playerid(helper(28036 + id), id - 150), ishelper
trigger150 = playerid(helper(28036 + id), id - 150), teamside = teamside
trigger150 = playerid(helper(28036 + id), id - 150), MoveType = A
trigger150 = 1 || Fvar(27) := helper(28036 + id), id - 150
trigger151 = PlayerIDExist(helper(28036 + id), id - 151)
trigger151 = playerid(helper(28036 + id), id - 151), ishelper
trigger151 = playerid(helper(28036 + id), id - 151), teamside = teamside
trigger151 = playerid(helper(28036 + id), id - 151), MoveType = A
trigger151 = 1 || Fvar(27) := helper(28036 + id), id - 151
trigger152 = PlayerIDExist(helper(28036 + id), id - 152)
trigger152 = playerid(helper(28036 + id), id - 152), ishelper
trigger152 = playerid(helper(28036 + id), id - 152), teamside = teamside
trigger152 = playerid(helper(28036 + id), id - 152), MoveType = A
trigger152 = 1 || Fvar(27) := helper(28036 + id), id - 152
trigger153 = PlayerIDExist(helper(28036 + id), id - 153)
trigger153 = playerid(helper(28036 + id), id - 153), ishelper
trigger153 = playerid(helper(28036 + id), id - 153), teamside = teamside
trigger153 = playerid(helper(28036 + id), id - 153), MoveType = A
trigger153 = 1 || Fvar(27) := helper(28036 + id), id - 153
trigger154 = PlayerIDExist(helper(28036 + id), id - 154)
trigger154 = playerid(helper(28036 + id), id - 154), ishelper
trigger154 = playerid(helper(28036 + id), id - 154), teamside = teamside
trigger154 = playerid(helper(28036 + id), id - 154), MoveType = A
trigger154 = 1 || Fvar(27) := helper(28036 + id), id - 154
trigger155 = PlayerIDExist(helper(28036 + id), id - 155)
trigger155 = playerid(helper(28036 + id), id - 155), ishelper
trigger155 = playerid(helper(28036 + id), id - 155), teamside = teamside
trigger155 = playerid(helper(28036 + id), id - 155), MoveType = A
trigger155 = 1 || Fvar(27) := helper(28036 + id), id - 155
trigger156 = PlayerIDExist(helper(28036 + id), id - 156)
trigger156 = playerid(helper(28036 + id), id - 156), ishelper
trigger156 = playerid(helper(28036 + id), id - 156), teamside = teamside
trigger156 = playerid(helper(28036 + id), id - 156), MoveType = A
trigger156 = 1 || Fvar(27) := helper(28036 + id), id - 156
trigger157 = PlayerIDExist(helper(28036 + id), id - 157)
trigger157 = playerid(helper(28036 + id), id - 157), ishelper
trigger157 = playerid(helper(28036 + id), id - 157), teamside = teamside
trigger157 = playerid(helper(28036 + id), id - 157), MoveType = A
trigger157 = 1 || Fvar(27) := helper(28036 + id), id - 157
trigger158 = PlayerIDExist(helper(28036 + id), id - 158)
trigger158 = playerid(helper(28036 + id), id - 158), ishelper
trigger158 = playerid(helper(28036 + id), id - 158), teamside = teamside
trigger158 = playerid(helper(28036 + id), id - 158), MoveType = A
trigger158 = 1 || Fvar(27) := helper(28036 + id), id - 158
trigger159 = PlayerIDExist(helper(28036 + id), id - 159)
trigger159 = playerid(helper(28036 + id), id - 159), ishelper
trigger159 = playerid(helper(28036 + id), id - 159), teamside = teamside
trigger159 = playerid(helper(28036 + id), id - 159), MoveType = A
trigger159 = 1 || Fvar(27) := helper(28036 + id), id - 159
trigger160 = PlayerIDExist(helper(28036 + id), id - 160)
trigger160 = playerid(helper(28036 + id), id - 160), ishelper
trigger160 = playerid(helper(28036 + id), id - 160), teamside = teamside
trigger160 = playerid(helper(28036 + id), id - 160), MoveType = A
trigger160 = 1 || Fvar(27) := helper(28036 + id), id - 160
trigger161 = PlayerIDExist(helper(28036 + id), id - 161)
trigger161 = playerid(helper(28036 + id), id - 161), ishelper
trigger161 = playerid(helper(28036 + id), id - 161), teamside = teamside
trigger161 = playerid(helper(28036 + id), id - 161), MoveType = A
trigger161 = 1 || Fvar(27) := helper(28036 + id), id - 161
trigger162 = PlayerIDExist(helper(28036 + id), id - 162)
trigger162 = playerid(helper(28036 + id), id - 162), ishelper
trigger162 = playerid(helper(28036 + id), id - 162), teamside = teamside
trigger162 = playerid(helper(28036 + id), id - 162), MoveType = A
trigger162 = 1 || Fvar(27) := helper(28036 + id), id - 162
trigger163 = PlayerIDExist(helper(28036 + id), id - 163)
trigger163 = playerid(helper(28036 + id), id - 163), ishelper
trigger163 = playerid(helper(28036 + id), id - 163), teamside = teamside
trigger163 = playerid(helper(28036 + id), id - 163), MoveType = A
trigger163 = 1 || Fvar(27) := helper(28036 + id), id - 163
trigger164 = PlayerIDExist(helper(28036 + id), id - 164)
trigger164 = playerid(helper(28036 + id), id - 164), ishelper
trigger164 = playerid(helper(28036 + id), id - 164), teamside = teamside
trigger164 = playerid(helper(28036 + id), id - 164), MoveType = A
trigger164 = 1 || Fvar(27) := helper(28036 + id), id - 164
trigger165 = PlayerIDExist(helper(28036 + id), id - 165)
trigger165 = playerid(helper(28036 + id), id - 165), ishelper
trigger165 = playerid(helper(28036 + id), id - 165), teamside = teamside
trigger165 = playerid(helper(28036 + id), id - 165), MoveType = A
trigger165 = 1 || Fvar(27) := helper(28036 + id), id - 165
trigger166 = PlayerIDExist(helper(28036 + id), id - 166)
trigger166 = playerid(helper(28036 + id), id - 166), ishelper
trigger166 = playerid(helper(28036 + id), id - 166), teamside = teamside
trigger166 = playerid(helper(28036 + id), id - 166), MoveType = A
trigger166 = 1 || Fvar(27) := helper(28036 + id), id - 166
trigger167 = PlayerIDExist(helper(28036 + id), id - 167)
trigger167 = playerid(helper(28036 + id), id - 167), ishelper
trigger167 = playerid(helper(28036 + id), id - 167), teamside = teamside
trigger167 = playerid(helper(28036 + id), id - 167), MoveType = A
trigger167 = 1 || Fvar(27) := helper(28036 + id), id - 167
trigger168 = PlayerIDExist(helper(28036 + id), id - 168)
trigger168 = playerid(helper(28036 + id), id - 168), ishelper
trigger168 = playerid(helper(28036 + id), id - 168), teamside = teamside
trigger168 = playerid(helper(28036 + id), id - 168), MoveType = A
trigger168 = 1 || Fvar(27) := helper(28036 + id), id - 168
trigger169 = PlayerIDExist(helper(28036 + id), id - 169)
trigger169 = playerid(helper(28036 + id), id - 169), ishelper
trigger169 = playerid(helper(28036 + id), id - 169), teamside = teamside
trigger169 = playerid(helper(28036 + id), id - 169), MoveType = A
trigger169 = 1 || Fvar(27) := helper(28036 + id), id - 169
trigger170 = PlayerIDExist(helper(28036 + id), id - 170)
trigger170 = playerid(helper(28036 + id), id - 170), ishelper
trigger170 = playerid(helper(28036 + id), id - 170), teamside = teamside
trigger170 = playerid(helper(28036 + id), id - 170), MoveType = A
trigger170 = 1 || Fvar(27) := helper(28036 + id), id - 170
trigger171 = PlayerIDExist(helper(28036 + id), id - 171)
trigger171 = playerid(helper(28036 + id), id - 171), ishelper
trigger171 = playerid(helper(28036 + id), id - 171), teamside = teamside
trigger171 = playerid(helper(28036 + id), id - 171), MoveType = A
trigger171 = 1 || Fvar(27) := helper(28036 + id), id - 171
trigger172 = PlayerIDExist(helper(28036 + id), id - 172)
trigger172 = playerid(helper(28036 + id), id - 172), ishelper
trigger172 = playerid(helper(28036 + id), id - 172), teamside = teamside
trigger172 = playerid(helper(28036 + id), id - 172), MoveType = A
trigger172 = 1 || Fvar(27) := helper(28036 + id), id - 172
trigger173 = PlayerIDExist(helper(28036 + id), id - 173)
trigger173 = playerid(helper(28036 + id), id - 173), ishelper
trigger173 = playerid(helper(28036 + id), id - 173), teamside = teamside
trigger173 = playerid(helper(28036 + id), id - 173), MoveType = A
trigger173 = 1 || Fvar(27) := helper(28036 + id), id - 173
trigger174 = PlayerIDExist(helper(28036 + id), id - 174)
trigger174 = playerid(helper(28036 + id), id - 174), ishelper
trigger174 = playerid(helper(28036 + id), id - 174), teamside = teamside
trigger174 = playerid(helper(28036 + id), id - 174), MoveType = A
trigger174 = 1 || Fvar(27) := helper(28036 + id), id - 174
trigger175 = PlayerIDExist(helper(28036 + id), id - 175)
trigger175 = playerid(helper(28036 + id), id - 175), ishelper
trigger175 = playerid(helper(28036 + id), id - 175), teamside = teamside
trigger175 = playerid(helper(28036 + id), id - 175), MoveType = A
trigger175 = 1 || Fvar(27) := helper(28036 + id), id - 175
trigger176 = PlayerIDExist(helper(28036 + id), id - 176)
trigger176 = playerid(helper(28036 + id), id - 176), ishelper
trigger176 = playerid(helper(28036 + id), id - 176), teamside = teamside
trigger176 = playerid(helper(28036 + id), id - 176), MoveType = A
trigger176 = 1 || Fvar(27) := helper(28036 + id), id - 176
trigger177 = PlayerIDExist(helper(28036 + id), id - 177)
trigger177 = playerid(helper(28036 + id), id - 177), ishelper
trigger177 = playerid(helper(28036 + id), id - 177), teamside = teamside
trigger177 = playerid(helper(28036 + id), id - 177), MoveType = A
trigger177 = 1 || Fvar(27) := helper(28036 + id), id - 177
trigger178 = PlayerIDExist(helper(28036 + id), id - 178)
trigger178 = playerid(helper(28036 + id), id - 178), ishelper
trigger178 = playerid(helper(28036 + id), id - 178), teamside = teamside
trigger178 = playerid(helper(28036 + id), id - 178), MoveType = A
trigger178 = 1 || Fvar(27) := helper(28036 + id), id - 178
trigger179 = PlayerIDExist(helper(28036 + id), id - 179)
trigger179 = playerid(helper(28036 + id), id - 179), ishelper
trigger179 = playerid(helper(28036 + id), id - 179), teamside = teamside
trigger179 = playerid(helper(28036 + id), id - 179), MoveType = A
trigger179 = 1 || Fvar(27) := helper(28036 + id), id - 179
trigger180 = PlayerIDExist(helper(28036 + id), id - 180)
trigger180 = playerid(helper(28036 + id), id - 180), ishelper
trigger180 = playerid(helper(28036 + id), id - 180), teamside = teamside
trigger180 = playerid(helper(28036 + id), id - 180), MoveType = A
trigger180 = 1 || Fvar(27) := helper(28036 + id), id - 180
trigger181 = PlayerIDExist(helper(28036 + id), id - 181)
trigger181 = playerid(helper(28036 + id), id - 181), ishelper
trigger181 = playerid(helper(28036 + id), id - 181), teamside = teamside
trigger181 = playerid(helper(28036 + id), id - 181), MoveType = A
trigger181 = 1 || Fvar(27) := helper(28036 + id), id - 181
trigger182 = PlayerIDExist(helper(28036 + id), id - 182)
trigger182 = playerid(helper(28036 + id), id - 182), ishelper
trigger182 = playerid(helper(28036 + id), id - 182), teamside = teamside
trigger182 = playerid(helper(28036 + id), id - 182), MoveType = A
trigger182 = 1 || Fvar(27) := helper(28036 + id), id - 182
trigger183 = PlayerIDExist(helper(28036 + id), id - 183)
trigger183 = playerid(helper(28036 + id), id - 183), ishelper
trigger183 = playerid(helper(28036 + id), id - 183), teamside = teamside
trigger183 = playerid(helper(28036 + id), id - 183), MoveType = A
trigger183 = 1 || Fvar(27) := helper(28036 + id), id - 183
trigger184 = PlayerIDExist(helper(28036 + id), id - 184)
trigger184 = playerid(helper(28036 + id), id - 184), ishelper
trigger184 = playerid(helper(28036 + id), id - 184), teamside = teamside
trigger184 = playerid(helper(28036 + id), id - 184), MoveType = A
trigger184 = 1 || Fvar(27) := helper(28036 + id), id - 184
trigger185 = PlayerIDExist(helper(28036 + id), id - 185)
trigger185 = playerid(helper(28036 + id), id - 185), ishelper
trigger185 = playerid(helper(28036 + id), id - 185), teamside = teamside
trigger185 = playerid(helper(28036 + id), id - 185), MoveType = A
trigger185 = 1 || Fvar(27) := helper(28036 + id), id - 185
trigger186 = PlayerIDExist(helper(28036 + id), id - 186)
trigger186 = playerid(helper(28036 + id), id - 186), ishelper
trigger186 = playerid(helper(28036 + id), id - 186), teamside = teamside
trigger186 = playerid(helper(28036 + id), id - 186), MoveType = A
trigger186 = 1 || Fvar(27) := helper(28036 + id), id - 186
trigger187 = PlayerIDExist(helper(28036 + id), id - 187)
trigger187 = playerid(helper(28036 + id), id - 187), ishelper
trigger187 = playerid(helper(28036 + id), id - 187), teamside = teamside
trigger187 = playerid(helper(28036 + id), id - 187), MoveType = A
trigger187 = 1 || Fvar(27) := helper(28036 + id), id - 187
trigger188 = PlayerIDExist(helper(28036 + id), id - 188)
trigger188 = playerid(helper(28036 + id), id - 188), ishelper
trigger188 = playerid(helper(28036 + id), id - 188), teamside = teamside
trigger188 = playerid(helper(28036 + id), id - 188), MoveType = A
trigger188 = 1 || Fvar(27) := helper(28036 + id), id - 188
trigger189 = PlayerIDExist(helper(28036 + id), id - 189)
trigger189 = playerid(helper(28036 + id), id - 189), ishelper
trigger189 = playerid(helper(28036 + id), id - 189), teamside = teamside
trigger189 = playerid(helper(28036 + id), id - 189), MoveType = A
trigger189 = 1 || Fvar(27) := helper(28036 + id), id - 189
trigger190 = PlayerIDExist(helper(28036 + id), id - 190)
trigger190 = playerid(helper(28036 + id), id - 190), ishelper
trigger190 = playerid(helper(28036 + id), id - 190), teamside = teamside
trigger190 = playerid(helper(28036 + id), id - 190), MoveType = A
trigger190 = 1 || Fvar(27) := helper(28036 + id), id - 190
trigger191 = PlayerIDExist(helper(28036 + id), id - 191)
trigger191 = playerid(helper(28036 + id), id - 191), ishelper
trigger191 = playerid(helper(28036 + id), id - 191), teamside = teamside
trigger191 = playerid(helper(28036 + id), id - 191), MoveType = A
trigger191 = 1 || Fvar(27) := helper(28036 + id), id - 191
trigger192 = PlayerIDExist(helper(28036 + id), id - 192)
trigger192 = playerid(helper(28036 + id), id - 192), ishelper
trigger192 = playerid(helper(28036 + id), id - 192), teamside = teamside
trigger192 = playerid(helper(28036 + id), id - 192), MoveType = A
trigger192 = 1 || Fvar(27) := helper(28036 + id), id - 192
trigger193 = PlayerIDExist(helper(28036 + id), id - 193)
trigger193 = playerid(helper(28036 + id), id - 193), ishelper
trigger193 = playerid(helper(28036 + id), id - 193), teamside = teamside
trigger193 = playerid(helper(28036 + id), id - 193), MoveType = A
trigger193 = 1 || Fvar(27) := helper(28036 + id), id - 193
trigger194 = PlayerIDExist(helper(28036 + id), id - 194)
trigger194 = playerid(helper(28036 + id), id - 194), ishelper
trigger194 = playerid(helper(28036 + id), id - 194), teamside = teamside
trigger194 = playerid(helper(28036 + id), id - 194), MoveType = A
trigger194 = 1 || Fvar(27) := helper(28036 + id), id - 194
trigger195 = PlayerIDExist(helper(28036 + id), id - 195)
trigger195 = playerid(helper(28036 + id), id - 195), ishelper
trigger195 = playerid(helper(28036 + id), id - 195), teamside = teamside
trigger195 = playerid(helper(28036 + id), id - 195), MoveType = A
trigger195 = 1 || Fvar(27) := helper(28036 + id), id - 195
trigger196 = PlayerIDExist(helper(28036 + id), id - 196)
trigger196 = playerid(helper(28036 + id), id - 196), ishelper
trigger196 = playerid(helper(28036 + id), id - 196), teamside = teamside
trigger196 = playerid(helper(28036 + id), id - 196), MoveType = A
trigger196 = 1 || Fvar(27) := helper(28036 + id), id - 196
trigger197 = PlayerIDExist(helper(28036 + id), id - 197)
trigger197 = playerid(helper(28036 + id), id - 197), ishelper
trigger197 = playerid(helper(28036 + id), id - 197), teamside = teamside
trigger197 = playerid(helper(28036 + id), id - 197), MoveType = A
trigger197 = 1 || Fvar(27) := helper(28036 + id), id - 197
trigger198 = PlayerIDExist(helper(28036 + id), id - 198)
trigger198 = playerid(helper(28036 + id), id - 198), ishelper
trigger198 = playerid(helper(28036 + id), id - 198), teamside = teamside
trigger198 = playerid(helper(28036 + id), id - 198), MoveType = A
trigger198 = 1 || Fvar(27) := helper(28036 + id), id - 198
trigger199 = PlayerIDExist(helper(28036 + id), id - 199)
trigger199 = playerid(helper(28036 + id), id - 199), ishelper
trigger199 = playerid(helper(28036 + id), id - 199), teamside = teamside
trigger199 = playerid(helper(28036 + id), id - 199), MoveType = A
trigger199 = 1 || Fvar(27) := helper(28036 + id), id - 199
trigger200 = PlayerIDExist(helper(28036 + id), id - 200)
trigger200 = playerid(helper(28036 + id), id - 200), ishelper
trigger200 = playerid(helper(28036 + id), id - 200), teamside = teamside
trigger200 = playerid(helper(28036 + id), id - 200), MoveType = A
trigger200 = 1 || Fvar(27) := helper(28036 + id), id - 200
ignorehitpause = 1

[State -2,防止乱转向]
type = AssertSpecial
trigger1 = EnemyNear,StateType = A
trigger1 = EnemyNear,Pos Y < -40
trigger1 = EnemyNear,MoveType = H
trigger1 = EnemyNear,Ctrl = 0
trigger1 = EnemyNear,BackEdgeBodyDist <= 0 || EnemyNear,FrontEdgeBodyDist <= 0
flag = NoAutoTurn

[State -2,版边防挤压变向]
type = posadd
trigger1 = FrontEdgeBodyDist < 2
trigger1 = EnemyNear,StateType = A
trigger1 = EnemyNear,Pos Y < -20
trigger1 = EnemyNear,MoveType = H
trigger1 = EnemyNear,Ctrl = 0
trigger1 = EnemyNear,BackEdgeBodyDist <= 0 || EnemyNear,FrontEdgeBodyDist <= 0
x = -10

[State x]
type = Helper
triggerall = !NumHelper(1900)
triggerall = movetype != H
trigger1 = stateno = 1800 && Time = 1
trigger2 = !var(59)
trigger2 = stateno = [200,2000)
trigger2 = power >= 1000 && Command = "a" && Command = "y"
helpertype = normal
name = "Kula"
ID = 1900
stateno = 1900
pos = -30,0
postype = back
keyctrl = 0
ownpal = 1
scale = 1,1
sprpriority = 1
ignorehitpause = 1


[State 3005, ContactSpark]
type = Explod
trigger1 = ProjHit1930 = 1
anim = 27002
ID = 27000
pos = 0,-50
postype = p2
facing = 1
bindtime = 1
removetime = -2
sprpriority = 4
shadow = 0,0,0
ownpal = 1
persistent = 0

[State 3005, ContactSpark]
type = Explod
trigger1 = ProjGuarded1930 = 1
anim = 27502
ID = 27000
pos = 0,-50
postype = p2
facing = 1
bindtime = 1
removetime = -2
sprpriority = 4
shadow = 0,0,0
ownpal = 1
persistent = 0

[State -3, Cybaster fix]
type = StopSnd
trigger1 = !NumHelper(1900)
channel = 28

;----------------
;Heat Drive Edge Detector
[State 0, VarAdd]
type = VarAdd
trigger1 = name = "K'"
trigger1 = var(40)>0
v = 40
value = -1

;================================================================================
; ------- Front corner fix --------
;===============================================================================
;To prevent switching sides while making combos.
[State -2, Width]
type = Width
triggerall = numenemy
trigger1 = facing != enemynear, facing
trigger1 = movetype != H
edge = 8,0
ignorehitpause = 1

;================================================================================
; ------- Basic Move Auto Recover --------
;===============================================================================
[State -2, Aerial Hit]
type = VarSet
triggerall = P2MoveType = H && P2StateType = A
triggerall = MoveHit = 1
triggerall = stateno != 505
trigger1 = (StateNo = [200,710])
fvar(34) = 1
ignorehitpause = 1

[State -2, PowerReset]
type = VarSet
trigger1 = !NumTarget
trigger2 = P2MoveType != H
fvar(34) = 0
ignorehitpause = 1

[State 901, Throw]
type = TargetState
triggerall = NumTarget
triggerall = fVar(34)
trigger1 = target,StateNo = 5050
trigger1 = target,alive
value =  840

;================================================================================
; ------- Movehit Helper --------
;===============================================================================
[State -2, 0]
type = Helper
triggerall = !NumHelper(247)
trigger1 = !Time
helpertype = normal
name = "Movehit"
ID = 247
pos = 0,0
postype = p1
stateno = 247
keyctrl = 0

;P2 Safe Fall
[State -2, P2 Safe Fall]
type= targetstate
trigger1= numtarget=1; Just to prevent Simul mode shenanigans
trigger1= target,command="recovery"
trigger1= target,pos y>=-20 && target,vel y>0
trigger1= target,alive && target,hitfall && target,gethitvar(fall.recover)
trigger1= target,stateno=5030 || target,stateno=5035 || target,stateno=5050 || target,stateno=5071
value= 5205
ignorehitpause= 1

;================================================================================
; ------- Hitsounds and Explods --------
;===============================================================================
[State 3303, Explod]
type = Explod
triggerall = numenemy
triggerall = enemynear, animelemtime(1) = 1
trigger1 = P2Stateno = 1252 && P2MoveType = H
trigger2 = P2Stateno = 1255 && P2MoveType = H
anim = 12001+(1*10000)
pos = 0,0
postype = p2  ;p2,front,back,left,right
sprpriority = 2
ownpal = 1
persistent = 0

[State 3303, Explod]
type = Explod
triggerall = numenemy
triggerall = enemynear, animelemtime(1) = 1
trigger1 = P2Stateno = 1252 && P2MoveType = H
trigger2 = P2Stateno = 1255 && P2MoveType = H
anim = 12002+(1*10000)
pos = 0,0
postype = p2  ;p2,front,back,left,right
sprpriority = 0
ownpal = 1
persistent = 0

[State 300, Land]
type = PlaySnd
triggerall = numenemy
triggerall = enemynear, animelemtime(1) = 1
trigger1 = P2Stateno = 10802 && P2MoveType = H
value = 12,11
persistent = 0

[State 300, Land]
type = PlaySnd
triggerall = numenemy
triggerall = enemynear, animelemtime(1) = 1
trigger1 = P2Stateno = 10904 && P2MoveType = H
value = 12,9
persistent = 0

[State 300, Land]
type = PlaySnd
triggerall = numenemy
triggerall = enemynear, animelemtime(1) = 1
trigger1 = P2Stateno = 1252 && P2MoveType = H
trigger2 = P2Stateno = 1255 && P2MoveType = H
value = 12,9
persistent = 0

[State -2, PlaySnd]
type = PlaySnd
trigger1 = numenemy
trigger1 = p2stateno = 10902 && p2movetype = h
trigger1 = enemynear, animelemtime(1) = 1
value = 5,8
volume = 200

;================================================================================
; ------- Slowmotion System By CCIronMugen & Scal --------
;===============================================================================
[State -2]
type = VarAdd
trigger1 = var(16) != 0
trigger1 = (gametime%2) = 0
var(16) = -1
ignorehitpause = 1

[State -2]
type = Pause
triggerall = (gametime%2) = 0
trigger1 = var(16) != 0
time = 1
movetime = 0
ignorehitpause = 1
;================================================================================
; ------- Explosion System --------
;===============================================================================
[State 1000: Helper]
type = Helper ;This is too much.
triggerall = numenemy
triggerall = enemynear, movetype = H
triggerall = numhelper(247)
triggerall = !NumHelper(12501)
trigger1 = numtarget(3116) && helper(247), var(1) = 1
trigger2 = stateno = 3202 && animelem = 15
helpertype = Normal
name = "Double Expl"
id = 12500
pos = 0, 0 ;50
postype = p2
facing = 1
stateno = 12500
keyctrl = 0
ownpal = 1
supermovetime = 9999999999999999
pausemovetime = 9999999999999999
persistent = 0
ignorehitpause = 1


[State 1000: Helper]
type = Helper
triggerall = numenemy
triggerall = enemynear, movetype = H
triggerall = numhelper(247)
triggerall = !NumHelper(12501)
trigger1 = numhelper(1001)
trigger1 = helper(1001), var(1) = 1
trigger2 = numhelper(1007)
trigger2 = helper(1007), var(1) = 1
trigger3 = numtarget(1010) && var(1) = 1
trigger4 = numhelper(1016)
trigger4 = helper(1016), var(1) = 1
trigger5 = numtarget(1030) && helper(247), var(1) = 1
trigger6 = numtarget(1200) && helper(247), var(1) = 1
trigger7 = numtarget(1201) && helper(247), var(1) = 1
trigger8 = numtarget(1202) && helper(247), var(1) = 1
trigger9 = numtarget(1210) && helper(247), var(1) = 1
trigger10 = stateno = 3004
trigger11 = numtarget(3116) && helper(247), var(1) = 1
trigger12 = stateno = 3202 && animelem = 15
helpertype = Normal
name = "Normal Expl"
id = 12501
pos = 0, 0 ;50
postype = p2
facing = 1
stateno = 12501
keyctrl = 0
ownpal = 1
supermovetime = 9999999999999999
pausemovetime = 9999999999999999
persistent = 0
ignorehitpause = 1


[State 1000: Helper]
type = Helper
triggerall = numenemy
triggerall = enemynear, movetype = H
triggerall = numhelper(247)
triggerall = !NumHelper(12502)
trigger1 = numhelper(1001)
trigger1 = helper(1001), var(1) = 1
trigger2 = numhelper(1007)
trigger2 = helper(1007), var(1) = 1
trigger3 = numtarget(1010) && var(1) = 1
trigger4 = numhelper(1016)
trigger4 = helper(1016), var(1) = 1
trigger5 = numtarget(1030) && helper(247), var(1) = 1
trigger6 = numtarget(1200) && helper(247), var(1) = 1
trigger7 = numtarget(1201) && helper(247), var(1) = 1
trigger8 = numtarget(1202) && helper(247), var(1) = 1
trigger9 = numtarget(1210) && helper(247), var(1) = 1
trigger10 = stateno = 3004
trigger11 = numtarget(3116) && helper(247), var(1) = 1
trigger12 = stateno = 3202 && animelem = 15
helpertype = Normal
name = "Pyro Expl"
id = 12502
pos = 0, 0 ;50
postype = p2
facing = 1
stateno = 12502
keyctrl = 0
ownpal = 1
supermovetime = 9999999999999999
pausemovetime = 9999999999999999
persistent = 0
ignorehitpause = 1


[State 1000: Helper]
type = Helper
triggerall = numenemy
triggerall = enemynear, movetype = H
triggerall = numhelper(247)
triggerall = !NumHelper(12503)
trigger1 = numhelper(1001)
trigger1 = helper(1001), var(1) = 1
trigger2 = numhelper(1007)
trigger2 = helper(1007), var(1) = 1
trigger3 = numtarget(1010) && var(1) = 1
trigger4 = numhelper(1016)
trigger4 = helper(1016), var(1) = 1
trigger5 = numtarget(1030) && helper(247), var(1) = 1
trigger6 = numtarget(1200) && helper(247), var(1) = 1
trigger7 = numtarget(1201) && helper(247), var(1) = 1
trigger8 = numtarget(1202) && helper(247), var(1) = 1
trigger9 = numtarget(1210) && helper(247), var(1) = 1
trigger10 = stateno = 3004
trigger11 = numtarget(3116) && helper(247), var(1) = 1
trigger12 = stateno = 3202 && animelem = 15
helpertype = Normal
name = "Multi Small Expl"
id = 12503
pos = 0, 0 ;50
postype = p2
facing = 1
stateno = 12503
keyctrl = 0
ownpal = 1
supermovetime = 9999999999999999
pausemovetime = 9999999999999999
persistent = 0
ignorehitpause = 1


[State 1000: Helper]
type = Helper
triggerall = numenemy
triggerall = enemynear, movetype = H
triggerall = numhelper(247)
triggerall = !NumHelper(12504)
trigger1 = numhelper(1001)
trigger1 = helper(1001), var(1) = 1
trigger2 = numhelper(1007)
trigger2 = helper(1007), var(1) = 1
trigger3 = numtarget(1010) && var(1) = 1
trigger4 = numhelper(1016)
trigger4 = helper(1016), var(1) = 1
trigger5 = numtarget(1030) && helper(247), var(1) = 1
trigger6 = numtarget(1200) && helper(247), var(1) = 1
trigger7 = numtarget(1201) && helper(247), var(1) = 1
trigger8 = numtarget(1202) && helper(247), var(1) = 1
trigger9 = numtarget(1210) && helper(247), var(1) = 1
trigger10 = stateno = 3004
trigger11 = numtarget(3116) && helper(247), var(1) = 1
trigger12 = stateno = 3202 && animelem = 15
helpertype = Normal
name = "Small Expl"
id = 12504
pos = 0, 0 ;50
postype = p2
facing = 1
stateno = 12504
keyctrl = 0
ownpal = 1
supermovetime = 9999999999999999
pausemovetime = 9999999999999999
persistent = 0
ignorehitpause = 1



;================================================================================
; ------- 02 UM MAX Mode System by Vans --------
;================================================================================

[State -2, VarSet]
type = VarSet
trigger1 = var(51) < 0
var(51) =  0
ignorehitpause = 1

[State -2, VarAdd]
type = VarAdd
trigger1 = var(51)
var(51) =  -1
ignorehitpause = 1

[State -2, PalFX]
type = PalFX
trigger1 = numhelper(70001)
trigger1 =(GameTime%2) = 0
trigger1 = GetHitVar(hittime) < 2
time = 1
add = 126,126,0
color = 1
ignorehitpause = 1

[State -2, PalFX]
type = PalFX
trigger1 = numhelper(70002)
trigger1 =(GameTime%2) = 0
trigger1 = GetHitVar(hittime) < 2
time = 1
add = 126,0,0
color = 1
ignorehitpause = 1


;================================================================================
; ------- KOF K.O. System by Vans --------
;===============================================================================
[State -2, Helper]
type = Helper
triggerall = !numhelper(50000) && !numhelper(50001)
triggerall = WinKO ;&& var(24)
triggerall = movehit
trigger1 = stateno = [200,999]
trigger2 = stateno = [1300,1350]
helpertype = normal
name = "K.O."
ID = 50000
stateno = 50000
pos = 160,120
postype = left    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 999999999999
pausemovetime = 999999999999
ignorehitpause = 1

[State -2, Helper]
type = Helper
triggerall = !numhelper(50000) && !numhelper(50001)
triggerall = WinKO ;&& var(24)
triggerall = movehit
trigger1 = stateno = [1000,1299]
trigger2 = stateno = [3000,3099]
trigger3 = stateno = 3116
trigger4 = stateno = 3202
helpertype = normal
name = "K.O."
ID = 50001
stateno = 50000
pos = 160,120
postype = left    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 999999999999
pausemovetime = 999999999999
ignorehitpause = 1

;================================================================================
; ------- KOF Lifebar Display by OrochiKOF97 --------
;===============================================================================
[State -2, Special]
type = AssertSpecial
trigger1 = roundstate = [0,1]
flag = NoBarDisplay
ignorehitpause = 1

;================================================================================
; ---- Afterimage Remove Code by Warusaki, slightly modified by Mr. Fong ----
;===============================================================================
[State -2, Afterimage Remover]
type = AfterImageTime
triggerall = 1
trigger1 = MoveType = H
trigger2 = StateNo = [0,40]
trigger3 = StateNo = [52,199]
trigger4 = (StateNo = [200,749]) && PrevstateNo != 50 && Prevstateno != 40
trigger5 = Stateno = [5000,5999]
time = 0

;================================================================================
; ------- Cybaster Fix --------
;===============================================================================
[State -3, Cybaster fix]
type = StopSnd
trigger1 = anim != 100
trigger1 = stateno != 3100
channel = 27

;================================================================================
; ------- 2002 Only / WLS NEO --------
;===============================================================================
;      - I do _not_ make myself responsible for the changes made here -
;Compatibility with XI has been completely dropped do _not_ ask me to add it
;back.

[State -2, Mode]
type = null
trigger1 = (var(25) := 0)

;================================================================================
; ------- KOF Juggle System By Kira and L --------
;===============================================================================
[State -2, AirGuard]
type = AssertSpecial
trigger1 = 1
flag = NoJuggleCheck 
IgnoreHitPause = 1

;================================================================================
; ------- Cheap K.O. system By Warusaki3 --------
;===============================================================================
[State -3, 5950] 
type = ChangeState
triggerall = teammode = single || teammode = turns
trigger1 = !alive
trigger1 = var(18) = 1
trigger1 = prevstateno = [120,159]
trigger1 = Stateno = [5000,5999]
value = 5950

[State -3, TargetState]
type = TargetState
triggerall = numtarget(200)
triggerall = target(200),alive
trigger1 = target(200),stateno = 5020
trigger1 = target(200),statetype = A
trigger1 = target(200),movetype = H
value = 290

;---------------------------------------------------------------------------
;ダメージボイス
;---------------------------------------------------------------------------
[State -2,]
type = StopSnd
trigger1 = Movetype = H
channel = 10
ignorehitpause = 1

[State -2, PlaySnd]
type = PlaySnd
triggerall = alive = 1
triggerall = random <= 250
triggerall = time = 1
trigger1 = stateno = 5000
trigger1 = anim = 5000 || anim = 5001 || anim = 5010 || anim = 5011
trigger2 = stateno = 5010
trigger2 = anim = 5020 || anim = 5021
value = s5000,ifelse(random <= 500,0,1)

[State -2, PlaySnd]
type = PlaySnd
triggerall = alive = 1
triggerall = random <= 250
triggerall = time = 1
trigger1 = stateno = 5000
trigger1 = anim = 5002 || anim = 5003 || anim = 5012 || anim = 5013
trigger2 = stateno = 5010
trigger2 = anim = 5022 || anim = 5023
value = s5000,2

[State -2, PlaySnd]
type = PlaySnd
triggerall = alive = 1
triggerall = random <= 250
triggerall = time = 1
trigger1 = stateno = 5101
value = s5000,ifelse(random <= 500,2,3)

;生存判定
[State -2, ];崩れＫＯ用
type = VarSet
triggerall = var(18) = 0 && alive
trigger1 = statetype != A
var(18) = 1

[State -2, ];崩れＫＯ用
type = VarSet
triggerall = var(18) != 0 && alive
trigger1 = statetype = A
var(18) = 0

[State -2, KOボイス]
type = PlaySnd
trigger1 = !alive && life <= 0
trigger1 = var(19) = 0
trigger1 = stateno != 5950
trigger1 = var(19) := 1
value = S111, 0

[State -2, ]
type = VarSet
triggerall = var(19) = 1
trigger1 = alive
var(19) = 0

;===========================================================================
; Power Bar
;===========================================================================
[state -2,]
type = Helper
trigger1 = numhelper(7500) = 0
id = 7500
name = "g"
sprpriority = 1
pos = 0,0
postype = p1
stateno = 7500
helpertype = normal
pausemovetime = 99999999
supermovetime = 99999999
keyctrl = 0 
ownpal = 1

;===========================================================================
; Guard Crush Calculation
;===========================================================================
[State -2]
type = TargetState
TriggerAll = numtarget
TriggerAll = target,alive
TriggerAll = fvar(10) >= 10000
TriggerAll = target,StateType = S || target,StateType = C
TriggerAll = target,MoveType = H && target,StateNo = [120,159]
Trigger1 = MoveGuarded = 1
Trigger2 = ProjGuarded = 1
value = 5700

[State -2]
type = VarSet
TriggerAll = fvar(10) < 0
Trigger1 = 1
fvar(10) = 0
ignorehitpause = 1

[State -2]
type = VarAdd
TriggerAll = fvar(10) >= 1
Trigger1 = GameTime%37 = 0
fvar(10) = -100
ignorehitpause = 1

[State -2]
type = VarSet
TriggerAll = fvar(10) != 0
Trigger1 = roundstate != 2
Trigger2 = enemy,StateNo = 5700
fvar(10) = 0
ignorehitpause = 1

[State -2]
type = VarAdd
TriggerAll = RoundState = 2
TriggerAll = P2MoveType = H
TriggerAll = EnemyNear,time = 0
Trigger1 = moveguarded = 1
Trigger2 = ProjGuarded = 1
fvar(10) = ifelse(stateno < 1000, 500, 1200)
ignorehitpause = 1
persistent = 0

[State -2,]
type = Helper
triggerall = NumHelper(6510) = 0
trigger1 = p2stateno = 5700 && enemy,time = 1
trigger1 = p2movetype = H
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
supermovetime = 999
pausemovetime = 999

;===========================================================================
; Counter Related
;===========================================================================
[State -2, Counter]
type = VarSet
trigger1 = P2MoveType = A
var(56) = 1

[State -2, Counter Time Add]
type = VarAdd
trigger1 = P2MoveType != A
trigger1 = var(56) >= 1
var(56) = 1

[State -2, Counter Time Reset]
type = VarSet
trigger1 = var(56) > 3
var(56) = 0
ignorehitpause = 1

[State -2]
type = Helper
triggerall = RoundState = 2
triggerall = Numhelper(6500) = 0
triggerall = var(56) >= 1
triggerall = p2movetype = H
trigger1 = MoveHit = 1
trigger2 = ProjHit = 1
name = "counter"
id = 6500
pos = 0,0
postype = left
stateno = 6500
helpertype = normal
ownpal = 1
keyctrl = 0
size.xscale = 1
size.yscale = 1
persistent = 0
ignorehitpause = 1
supermovetime = 999
pausemovetime = 999




;--------------------------------------
;显血
[State -2,]
type = Explod
trigger1 = roundState = 2
anim = F310+life%10
pos = IfElse(TeamSide=1,122,204), 28
postype = Left
bindtime = -1
ownpal = 1
ontop = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1


[State -2,]
type = Explod
trigger1 = roundState = 2
anim = F310+floor(life/10)%10
pos = IfElse(TeamSide=1,118,200), 28
postype = Left
bindtime = -1
ownpal = 1
ontop = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1


[State -2,]
type =  Explod
trigger1 = roundState = 2
anim = F310+floor(life/100)%10
pos = IfElse(TeamSide=1,114,196), 28
postype = Left
bindtime = -1
ownpal = 1
ontop = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1 


[State -2,]
type =  Explod
trigger1 = roundState = 2
anim = F310+floor(life/1000)%10
pos = IfElse(TeamSide=1,110,192), 28
postype = Left
bindtime = -1
ownpal = 1
ontop = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1

;--------------------------------------
;显气

[State -2,]
type = Explod
trigger1 = roundState = 2
anim = F300+Power%10
pos = IfElse(TeamSide=1,122,208), 4
postype = Left
bindtime = -1
ownpal = 1
ontop = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1

[State -2,]
type =  Explod
trigger1 = roundState = 2
anim = F300+floor(Power/10)%10
pos = IfElse(TeamSide=1,118,204), 4
postype = Left
bindtime = -1
ownpal = 1
ontop = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1

[State -2,]
type =  Explod
trigger1 = roundState = 2
anim = F300+floor(Power/100)%10
pos = IfElse(TeamSide=1,114,200), 4
postype = Left
bindtime = -1
ownpal = 1
ontop = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1 

[State -2,]
type =  Explod
trigger1 = roundState = 2
anim = F300+floor(Power/1000)%10
pos = IfElse(TeamSide=1,110,196), 4
postype = Left
bindtime = -1
ownpal = 1
ontop = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1

[State -2,]
type =  Explod
trigger1 = roundState = 2
anim = F300+floor(Power/10000)%10
pos = IfElse(TeamSide=1,106,192), 4
postype = Left
bindtime = -1
ownpal = 1
ontop = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1
;--------------------------------------

;================================================================================
; ------- DTC --------
;===============================================================================
[State -2, ??]
type= DisplaytoClipboard;
trigger1= 1
text="p2bodydist x: %d | p2bodydist y: %d | p2dist x: %d | helper(24000 + id),var(54): %d| Helper(25000+ID),InGuardDist: %d| var(51): %d"
params= p2bodydist x,p2bodydist y,p2dist x, helper(24000 + id),var(54),Helper(25000+ID),InGuardDist,var(51)

[State -2, Debug]
type = appendtoclipboard;
Trigger1 = 1
text="\nTRACE = %d vel x = %d vel Y = %d pos y = %d enemynear(var(58)),animtime = %d var(49) = %d"  
params= var(34), vel x, vel Y , pos y , enemynear(var(58)),animtime,var(49)
ignorehitpause = 1 