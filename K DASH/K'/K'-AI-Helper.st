;被击中无动画
[Statedef 28036]
type    = U
movetype= I
physics = N
anim    = -1
ctrl    = 0
sprpriority = 5

[State 28036, 摧毁自身]
type = DestroySelf
trigger1 = 1
ignorehitpause = 1

;=======================================================================================================
[Statedef 24000, helper型?道?算]
type	     = U
MoveType     = I
Physics      = N
Anim 	     = 9999
velset       = 0, 0
Ctrl	     = 0

[State 24000, 无?]
type = NotHitBy
trigger1 = 1
value = SCA

[State 24000, 防推?]
type = PlayerPush
trigger1 = 1
value = 0

[State 24000, ?状?]
type = SelfState
trigger1 = !ishelper
value = 0

[State 24000, 不可?]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
flag2 = invisible

[State 24000, ?向]
type = Turn
trigger1 = facing != root, facing
ignorehitpause = 1

[State 24000, ?定本体]
type = BindToroot
trigger1 = 1
pos = 0, 0

;---------------------------------------------------
[State 24000, id??]
type = VarSet
TriggerAll = ROOT,Fvar(26) != 0
TriggerAll = PlayerIDExist(ROOT,Fvar(26))
trigger1 = var(1) = 0
v = 1
value = playerid(ROOT,Fvar(26)), id
ignorehitpause = 1

[State 24000, id消除]
type = VarSet
TriggerAll = !PlayerIDExist(ROOT,Fvar(26))
trigger1 = var(1) != 0
v = 1
value = 0
ignorehitpause = 1

;---------------------------------------------------
[State 24000, 普通来?：helper的hitdef攻?]
type = VarSet
TriggerAll = 1 || var(57) := 0
trigger1 = PlayerIDExist(var(1))
trigger1 = playerid(var(1)), ishelper
trigger1 = playerid(var(1)), teamside != teamside
trigger1 = playerid(var(1)), hitdefattr = SCA, AA, AT, AP
trigger1 = playerid(var(1)), MoveType = A
v = 57
value = 1
ignorehitpause = 1

[State 24000, 正面来?：前?型?道helper]
type = VarSet
trigger1 = PlayerIDExist(var(1))
trigger1 = playerid(var(1)), vel x > 0
trigger1 = playerid(var(1)), pos y > -10
trigger1 = playerid(var(1)), facing * facing = -1
trigger1 = playerid(var(1)), ishelper
trigger1 = playerid(var(1)), teamside != teamside
;trigger1 = playerid(var(1)), p2dist x = [-50, 100]
v = 57
value = 2
ignorehitpause = 1

[State 24000, 正面来?：后退型?道helper]
type = VarSet
trigger1 = PlayerIDExist(var(1))
trigger1 = playerid(var(1)), vel x < 0
trigger1 = playerid(var(1)), pos y > -10
trigger1 = playerid(var(1)), facing * facing = 1
trigger1 = playerid(var(1)), ishelper
trigger1 = playerid(var(1)), teamside != teamside
;trigger1 = playerid(var(1)), p2dist x = [-100, 50]
v = 57
value = 2
ignorehitpause = 1

[State 24000, 背面来?：前?型?道helper]
type = VarSet
trigger1 = PlayerIDExist(var(1))
trigger1 = playerid(var(1)), vel x > 0
trigger1 = playerid(var(1)), pos y > -10
trigger1 = playerid(var(1)), facing * facing = 1
trigger1 = playerid(var(1)), ishelper
trigger1 = playerid(var(1)), teamside != teamside
;trigger1 = playerid(var(1)), p2dist x = [-50, 100]
v = 57
value = 3
ignorehitpause = 1

[State 24000, 背面来?：后退型?道helper]
type = VarSet
trigger1 = PlayerIDExist(var(1))
trigger1 = playerid(var(1)), vel x < 0
trigger1 = playerid(var(1)), pos y > -10
trigger1 = playerid(var(1)), facing * facing = -1
trigger1 = playerid(var(1)), ishelper
trigger1 = playerid(var(1)), teamside != teamside
;strigger1 = playerid(var(1)), p2dist x = [-100, 50]
v = 57
value = 3
ignorehitpause = 1

[State 24000, 背面来?：后退型?道helper]
type = VarSet
trigger1 = PlayerIDExist(var(1))
trigger1 = playerid(var(1)),time <= 2
trigger1 = root,movetype != H
trigger1 = playerid(var(1)), ishelper
trigger1 = playerid(var(1)), teamside != teamside
;strigger1 = playerid(var(1)), p2dist x = [-100, 50]
v = 57
value = 4
ignorehitpause = 1

[State 24000, 正面来?：前?型?道helper]
type = VarSet
trigger1 = VAR(57) > 0
v = 54
value = floor((root,pos x-playerid(var(1)),pos x)*playerid(var(1)),facing)
ignorehitpause = 1

[State 24000, 正面来?：前?型?道helper]
type = VarSet
trigger1 = VAR(57) = 0
v = 54
value = 0
ignorehitpause = 1

;---------------------------------------------------
[state 24000, 摧?自身]
type = DestroySelf;DestroySelf
TriggerALL = ishelper
trigger1 = stateno != 24000
trigger2 = (root,stateno = [358000,358006])|| root,alive = 0 || (root,prevstateno = [358000,358006])
ignorehitpause = 1

;AIヘルパー
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[Statedef 20000]
type = A
movetype = I
physics = N
anim = 9999
velset = 10,0
ctrl = 0
sprpriority = 1

[State 20000, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
flag2 = invisible

[State 20000, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 20000, 間違いで本体が来たら立ちへ移行]
type = SelfState
trigger1 =!ishelper
value = 0

[State 20000, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 20000, Projectile]
type = Projectile
trigger1 = time = 0
velocity = 10,0
projID = 20000
projanim = 9999
offset = 0,100000
projstagebound = 0
projedgebound = 100000
projremovetime = -1

[State 20000, VelSet]
type = VelSet
trigger1 = Root,NumProjID(20000) = 0
trigger1 = time > 0
x = 0
y = 0

;-------------------------------------------------------------------------------------
[Statedef 20001]
type = A
movetype = I
physics = N
anim = 9999
velset = -10,0
ctrl = 0
sprpriority = 1

[State 20000, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
flag2 = invisible

[State 20000, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 20000, 間違いで本体が来たら立ちへ移行]
type = SelfState
trigger1 =!ishelper
value = 0

[State 20000, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 20000, Projectile]
type = Projectile
trigger1 = time = 0
velocity = -10,0
projID = 20001
projanim = 9999
offset = 0,100000
projstagebound = 0
projedgebound = 100000
projremovetime = -1

[State 20000, VelSet]
type = VelSet
trigger1 = Root,NumProjID(20001) = 0
trigger1 = time > 0
x = 0
y = 0

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 対飛び道具ヘルパー(兼?学習用ヘルパー)
[Statedef 25000]
type    = S
movetype= I
physics = N
ctrl = 0
anim = 0

[State 25000]
type = AssertSpecial
Trigger1 = 1
flag = noshadow
flag2 = invisible

[State 25000]
type = nothitby
Trigger1 = 1
value = SCA,AA,AT,AP

[State 25000]
type = selfstate
trigger1 = !ishelper
value = 0

[State 25000]
type = PlayerPush
Trigger1 = 1
value = 0

[State 25000]
type = VelAdd
Trigger1 = 1
y = 0.0

[State 25000]
type = BindToRoot
Trigger1 = 1
facing = 1
pos = -70,1000

[State 10000,]
Type = DestroySelf
trigger1 = (root,stateno = [358000,358006])|| root,alive = 0 || (root,prevstateno = [358000,358006]) || (root,stateno = [8900,8903])

[State -2, ??]
type= DisplaytoClipboard
trigger1= 1
text="kyo"
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; めくり対応ヘルパー(兼?AI殺し情報)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[Statedef 26000]
type    = S
movetype= I
physics = N
ctrl = 0
anim = 0

[State 26000]
type = AssertSpecial
Trigger1 = 1
flag = noshadow
flag2 = invisible

[State 26000]
type = nothitby
Trigger1 = 1
value = SCA

[State 26000]
type = selfstate
trigger1 = !ishelper
value = 0

[State 26000]
type = PlayerPush
Trigger1 = 1
value = 0

[State 26000]
type = VelAdd
Trigger1 = 1
y = 0.0

[State 26000]
type = BindToRoot
Trigger1 = 1
facing = 1
pos = 70,1000

[State 10000,]
Type = DestroySelf
trigger1 = (root,stateno = [358000,358006])|| root,alive = 0 || (root,prevstateno = [358000,358006]) || (root,stateno = [8900,8903])

;AI??---------------------------------------------------------------------------------------
[Statedef 30000]
anim = 0
ctrl = 0

[State 30000, AssertSpecial]
type = AssertSpecial
Trigger1 = 1
flag = NoShadow
flag2 = invisible

[State 30000, NotHitBy]
type = NotHitBy
Trigger1 = 1
value = SCA

[State 30000, ???????????????]
type=selfstate
trigger1=!ishelper
value=0

[State 30000, Turn]
type = Turn
Trigger1 = Facing*ifelse((EnemyNear,Pos X-Pos X)>=0,1,-1) < 0
IgnoreHitPause = 1
supermovetime = 99999999
pausemovetime = 99999999

[State 30000, ????乕??]
type = VarSet
trigger1 = command = "up" && root,command = "up"
trigger2 = command = "down" && root,command = "down"
trigger3 = command = "back" && root,command = "back"
trigger4 = command = "fwd" && root,command = "fwd"
trigger5 = command = "a" && root,command = "a"
trigger6 = command = "b" && root,command = "b"
trigger7 = command = "c" && root,command = "c"
trigger8 = command = "x" && root,command = "x"
trigger9 = command = "y" && root,command = "y"
trigger10 = command = "z" && root,command = "z"
trigger11 = command = "start" && root,command = "start"
var(59) = -1

[State 30000, ??????]
Type = DestroySelf
triggerAll = isHelper
Trigger1 = root,var(59) || var(59) = -1
trigger2 = command = "up" && root,command = "up"
trigger3 = command = "down" && root,command = "down"
trigger4 = command = "back" && root,command = "back"
trigger5 = command = "fwd" && root,command = "fwd"
trigger6 = command = "a" && root,command ="a"
trigger7 = command = "b" && root,command ="b"
trigger8 = command = "c" && root,command ="c"
trigger9 = command = "x" && root,command = "x"
trigger10 = command = "y" && root,command = "y"
trigger11 = command = "z" && root,command = "z"
trigger12 = command = "start" && root,command = "start"

[State 30000, ?儔?ON]
type = VarSet
triggerall = var(59) != -1
trigger1 = root,command = "up"
trigger2 = root,command = "down"
trigger3 = root,command = "back"
trigger4 = root,command = "fwd"
trigger5 = root,command = "a"
trigger6 = root,command = "b"
trigger7 = root,command = "c"
trigger8 = root,command = "x"
trigger9 = root,command = "y"
trigger10 = root,command = "z"
trigger11 = root,command = "start"
var(59) = 1

[State 0, 13]
Type = DestroySelf;DestroySelf
trigger1 = (root,stateno = [358000,358006])|| root,alive = 0 || (root,prevstateno = [358000,358006]) || (root,stateno = [8900,8903])

;------------------------------------------------------------------------------
;?乕??????儖?乕
;------------------------------------------------------------------------------
[Statedef 31000]
type = A
ctrl = 0
anim = 0
velset = 0,0
movetype = I
physics = N
sprpriority = 1

[State 31000]
type = assertspecial
trigger1 = 1
flag = invisible
flag2 = noshadow

[State 31000]
type = NotHitBy
value = SCA
trigger1 = 1

[State -2]
type = PlayerPush
trigger1 = 1
value = 0

[State 31000,間違いで本体が来たら立ちへ移行]
type=selfstate
trigger1=!ishelper
value=0

[State -3,目の前の敵が一番近い相手である]
type = varset
triggerall = roundstate = 2
trigger1 = numenemy <= 1
trigger2 = numenemy >= 2
trigger2 = enemy(0),life <= 0 || enemy(1),life <= 0
trigger2 = enemynear(0),life > 0
trigger3 = numenemy >= 2
trigger3 = enemy(0),life > 0 && enemy(1),life > 0
trigger3 = abs(root,pos x - enemynear(0),pos x) <= abs(root,pos x - enemynear(1),pos x) 
var(1) = 0
IgnoreHitPause = 1

[State -3,目の前の敵が一番近い相手ではない]
type = varset
triggerall = roundstate = 2
triggerall = numenemy >= 2
trigger1 = enemynear(0),life <= 0
trigger2 = numenemy >= 2
trigger2 = enemy(0),life <= 0 || enemy(1),life <= 0
trigger2 = enemynear(0),life <= 0
trigger3 = enemy(0),life > 0 && enemy(1),life > 0
trigger3 = abs(root,pos x - enemynear(0),pos x) > abs(root,pos x - enemynear(1),pos x) 
var(1) = 1
IgnoreHitPause = 1

;自分の後ろに設置　――――――――――――――――――――――――――――――――――――――――
[state 31000]
type = turn
trigger1 = facing*ifelse((enemynear(var(1)),pos x-pos x)>=0,1,-1) < 0
IgnoreHitPause = 1
supermovetime = 9999
pausemovetime = 9999

[state 31000]
type = varset
trigger1 = enemynear(var(1)),facing*ifelse((enemynear(var(1)),pos x-root,pos x)>=0,1,-1)<=0
trigger2 = !enemynear(var(1)),hitdefattr = A,NA,SA,HA
var(2) = 0
IgnoreHitPause = 1
supermovetime = 9999
pausemovetime = 9999

[state 31000]
type = varset
trigger1 = enemynear(var(1)),facing*ifelse((EnemyNear(var(1)),pos x-root,pos x)>=0,1,-1)>0
trigger1 = enemynear(var(1)),hitdefattr = A,NA,SA,HA
var(2) = 1
IgnoreHitPause = 1
supermovetime = 9999
pausemovetime = 9999

[state 31000]
type = posset
trigger1 = 1
x = root,pos x+ifelse((enemynear(var(1)),pos y<0&&var(2)=1),(enemynear(var(1)),const(size.attack.dist)),(enemynear(var(1)),const(size.proj.attack.dist)))*(enemynear(var(1)),facing)
IgnoreHitPause = 1
supermovetime = 9999
pausemovetime = 9999

[State 31000, リセット]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,StateNo != [120,155]
Trigger1 = Root,MoveType!= H
Trigger1 = Root,Ctrl = 1 && var(50) > 0
Trigger2 = Root,MoveType = H
Trigger2 = Root,Time > 1 && var(50) > 0
var(50) = 0
IgnoreHitPause = 1

;分??下来防御中站立，蹲下，空中（可有可无）情况

[State 31000, 立ちガード時学習用]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,StateNo = [120,155]
Trigger1 = Root,StateType = S
var(50) = 1
IgnoreHitPause = 1

[State 31000, 下段ガード時学習用]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,StateNo = [120,155]
Trigger1 = Root,StateType = C
var(50) = 2
IgnoreHitPause = 1

[State 31000, 空中ガード時学習用]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,StateNo = [120,155]
Trigger1 = Root,StateType = A
var(50) = 3
IgnoreHitPause = 1

;---------------------------------------------------------------------------
[State 31000, 没有防?量清零]
Type = VarSet
Trigger1 = Root,StateNo != [120,155]
Trigger1 = GAMETIME = ROOT,VAR(53)
var(51) = 0
IgnoreHitPause = 1

[State 31000, ?量数字代表防御属性]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,StateType != A
Trigger1 = Root,StateNo = [120,155]
var(51) = ifelse(Root,StateType = C,1,2)
IgnoreHitPause = 1

[State 31000, 被p2破防招式命中后?束?量清零]
Type = VarSet
Trigger1 = ROOT,HitShakeOver = 1 ;|| ROOT,HitShakeOver = 0 && ROOT,TIME > 1
var(52) = 0
IgnoreHitPause = 1

[State 31000, 被p2破防招式命中] ;重点在?里，??下本体被打并且不是站立也不是蹲下的情况
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = VAR(51) = [1,2]
Trigger1 = Root,MoveType = H && GAMETIME != Root,var(53) && (Root,StateNo != [120,155]) && EnemyNear(Root,var(58)),MOVEHIT && (Root,StateNo != [5000,5200])
var(52) = 1
IgnoreHitPause = 1


[State 31000, 中段記憶]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H && Root,Time <= 1
Triggerall = var(10) = 0
Trigger1 =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155]);?里??下特殊情况，下面也是一?
Trigger1 = EnemyNear(Root,var(58)),StateType != A && (Root,StateType = C || var(50) = 2)
Trigger2 = Root,StateNo >= 200 && var(52) = 1
Trigger2 = var(51) = 1
V = 10
Value = (EnemyNear(Root,var(58)),StateNo)
IgnoreHitPause = 1

[State 31000, 中段記憶]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H && Root,Time <= 1
Triggerall = var(10) > 0
Triggerall = var(11) = 0
TriggerAll = EnemyNear(Root,var(58)),StateNo != var(10)
Trigger1 =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155]);?里??下特殊情况，下面也是一?
Trigger1 = EnemyNear(Root,var(58)),StateType != A && (Root,StateType = C || var(50) = 2)
Trigger2 = Root,StateNo >= 200 && var(52) = 1
Trigger2 = var(51) = 1
V = 11
Value = (EnemyNear(Root,var(58)),StateNo)
IgnoreHitPause = 1

[State 31000, 中段記憶]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H && Root,Time <= 1
Triggerall = var(11) > 0
Triggerall = var(12) = 0
TriggerAll = EnemyNear(Root,var(58)),StateNo != var(10)
TriggerAll = EnemyNear(Root,var(58)),StateNo != var(11)
Trigger1 =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155]);?里??下特殊情况，下面也是一?
Trigger1 = EnemyNear(Root,var(58)),StateType != A && (Root,StateType = C || var(50) = 2)
Trigger2 = Root,StateNo >= 200 && var(52) = 1
Trigger2 = var(51) = 1
V = 12
Value = (EnemyNear(Root,var(58)),StateNo)
IgnoreHitPause = 1

[State 31000, 中段記憶]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H && Root,Time <= 1
Triggerall = var(12) > 0
Triggerall = var(13) = 0
TriggerAll = EnemyNear(Root,var(58)),StateNo != var(10)
TriggerAll = EnemyNear(Root,var(58)),StateNo != var(11)
TriggerAll = EnemyNear(Root,var(58)),StateNo != var(12)
Trigger1 =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155]);?里??下特殊情况，下面也是一?
Trigger1 = EnemyNear(Root,var(58)),StateType != A && (Root,StateType = C || var(50) = 2)
Trigger2 = Root,StateNo >= 200 && var(52) = 1
Trigger2 = var(51) = 1
V = 13
Value = (EnemyNear(Root,var(58)),StateNo)
IgnoreHitPause = 1

[State 31000, 中段記憶]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H && Root,Time <= 1
Triggerall = var(13) > 0
Triggerall = var(14) = 0
TriggerAll = EnemyNear(Root,var(58)),StateNo != var(10)
TriggerAll = EnemyNear(Root,var(58)),StateNo != var(11)
TriggerAll = EnemyNear(Root,var(58)),StateNo != var(12)
TriggerAll = EnemyNear(Root,var(58)),StateNo != var(13)
Trigger1 =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155]);?里??下特殊情况，下面也是一?
Trigger1 = EnemyNear(Root,var(58)),StateType != A && (Root,StateType = C || var(50) = 2)
Trigger2 = Root,StateNo >= 200 && var(52) = 1
Trigger2 = var(51) = 1
V = 14
Value = (EnemyNear(Root,var(58)),StateNo)
IgnoreHitPause = 1

;---------------------------------------------------------------------------

[State 31000, 下段記憶]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H && Root,Time <= 1
Triggerall = var(20) = 0
Trigger1 =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155])
Trigger1 = EnemyNear(Root,var(58)),StateType != C && (Root,StateType = S || var(50) = 1)
Trigger2 = Root,StateNo >= 200 && var(52) = 1
Trigger2 = var(51) = 2
V = 20
Value = (EnemyNear(Root,var(58)),StateNo)
IgnoreHitPause = 1

[State 31000, 下段記憶]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H && Root,Time <= 1
Triggerall = var(20) > 0
Triggerall = var(21) = 0
TriggerAll = EnemyNear(Root,var(58)),StateNo != var(20)
Trigger1 =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155])
Trigger1 = EnemyNear(Root,var(58)),StateType != C && (Root,StateType = S || var(50) = 1)
Trigger2 = Root,StateNo >= 200 && var(52) = 1
Trigger2 = var(51) = 2
V = 21
Value = (EnemyNear(Root,var(58)),StateNo)
IgnoreHitPause = 1

[State 31000, 下段記憶]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H && Root,Time <= 1
Triggerall = var(21) > 0
Triggerall = var(22) = 0
TriggerAll = EnemyNear(Root,var(58)),StateNo != var(20)
TriggerAll = EnemyNear(Root,var(58)),StateNo != var(21)
Trigger1 =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155])
Trigger1 = EnemyNear(Root,var(58)),StateType != C && (Root,StateType = S || var(50) = 1)
Trigger2 = Root,StateNo >= 200 && var(52) = 1
Trigger2 = var(51) = 2
V = 22
Value = (EnemyNear(Root,var(58)),StateNo)
IgnoreHitPause = 1

[State 31000, 下段記憶]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H && Root,Time <= 1
Triggerall = var(22) > 0
Triggerall = var(23) = 0
TriggerAll = EnemyNear(Root,var(58)),StateNo != var(20)
TriggerAll = EnemyNear(Root,var(58)),StateNo != var(21)
TriggerAll = EnemyNear(Root,var(58)),StateNo != var(22)
Trigger1 =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155])
Trigger1 = EnemyNear(Root,var(58)),StateType != C && (Root,StateType = S || var(50) = 1)
Trigger2 = Root,StateNo >= 200 && var(52) = 1
Trigger2 = var(51) = 2
V = 23
Value = (EnemyNear(Root,var(58)),StateNo)
IgnoreHitPause = 1

[State 31000, 下段記憶]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H && Root,Time <= 1
Triggerall = var(23) > 0
Triggerall = var(24) = 0
TriggerAll = EnemyNear(Root,var(58)),StateNo != var(20)
TriggerAll = EnemyNear(Root,var(58)),StateNo != var(21)
TriggerAll = EnemyNear(Root,var(58)),StateNo != var(22)
TriggerAll = EnemyNear(Root,var(58)),StateNo != var(23)
Trigger1 =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155])
Trigger1 = EnemyNear(Root,var(58)),StateType != C && (Root,StateType = S || var(50) = 1)
Trigger2 = Root,StateNo >= 200 && var(52) = 1
Trigger2 = var(51) = 2
V = 24
Value = (EnemyNear(Root,var(58)),StateNo)
IgnoreHitPause = 1


;---------------------------------------------------------------------------

[State 31000, 中段記憶削除]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H
TriggerAll = EnemyNear(Root,var(58)),StateNo = var(10)
Triggerall = var(15) = 0 && VAR(10) > 0
Trigger1 =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155]) && Root,Time <= 1
Trigger1 = EnemyNear(Root,var(58)),StateType != A && (Root,StateType = S || var(50) = 1)
Trigger1 = GAMETIME = ROOT,VAR(53)
Trigger2 = Root,StateNo >= 200 && var(52) = 1 && Root,Time <= 1
Trigger2 = var(51) = 2
V = 15
Value = var(10)
IgnoreHitPause = 1

[State 31000, 中段記憶削除]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H
TriggerAll = EnemyNear(Root,var(58)),StateNo = var(10)
Triggerall = var(10) > 0
Trigger1 =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155]) && Root,Time <= 1
Trigger1 = EnemyNear(Root,var(58)),StateType != A && (Root,StateType = S || var(50) = 1)
Trigger2 = Root,StateNo >= 200 && var(52) = 1 && Root,Time <= 1
Trigger2 = var(51) = 2
V = 10
Value = 0
IgnoreHitPause = 1

[State 31000, 中段記憶削除]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H
TriggerAll = EnemyNear(Root,var(58)),StateNo = var(11)
Triggerall = var(16) = 0 && VAR(11) > 0
Trigger1 =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155]) && Root,Time <= 1
Trigger1 = EnemyNear(Root,var(58)),StateType != A && (Root,StateType = S || var(50) = 1)
Trigger1 = GAMETIME = ROOT,VAR(53)
Trigger2 = Root,StateNo >= 200 && var(52) = 1 && Root,Time <= 1
Trigger2 = var(51) = 2
V = 16
Value = var(11)
IgnoreHitPause = 1

[State 31000, 中段記憶削除]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H && Root,Time <= 1
TriggerAll =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155]) || Root,StateNo >= 200 && var(51) = 1
TriggerAll = EnemyNear(Root,var(58)),StateType != A && (Root,StateType = S || var(50) = 1)
TriggerAll = EnemyNear(Root,var(58)),StateNo = var(11)
Trigger1 = var(11) > 0
V = 11
Value = 0
IgnoreHitPause = 1

[State 31000, 中段記憶削除]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H
TriggerAll = EnemyNear(Root,var(58)),StateNo = var(12)
Triggerall = var(17) = 0 && VAR(12) > 0
Trigger1 =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155]) && Root,Time <= 1
Trigger1 = EnemyNear(Root,var(58)),StateType != A && (Root,StateType = S || var(50) = 1)
Trigger1 = GAMETIME = ROOT,VAR(53)
Trigger2 = Root,StateNo >= 200 && var(52) = 1 && Root,Time <= 1
Trigger2 = var(51) = 2
V = 17
Value = var(12)
IgnoreHitPause = 1

[State 31000, 中段記憶削除]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H && Root,Time <= 1
TriggerAll =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155]) || Root,StateNo >= 200 && var(51) = 1
TriggerAll = EnemyNear(Root,var(58)),StateType != A && (Root,StateType = S || var(50) = 1)
TriggerAll = EnemyNear(Root,var(58)),StateNo = var(12)
Trigger1 = var(12) > 0
V = 12
Value = 0
IgnoreHitPause = 1

[State 31000, 中段記憶削除]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H
TriggerAll = EnemyNear(Root,var(58)),StateNo = var(13)
Triggerall = var(18) = 0 && VAR(13) > 0
Trigger1 =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155]) && Root,Time <= 1
Trigger1 = EnemyNear(Root,var(58)),StateType != A && (Root,StateType = S || var(50) = 1)
Trigger1 = GAMETIME = ROOT,VAR(53)
Trigger2 = Root,StateNo >= 200 && var(52) = 1 && Root,Time <= 1
Trigger2 = var(51) = 2
V = 18
Value = var(13)
IgnoreHitPause = 1

[State 31000, 中段記憶削除]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H && Root,Time <= 1
TriggerAll =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155]) || Root,StateNo >= 200 && var(51) = 1
TriggerAll = EnemyNear(Root,var(58)),StateType != A && (Root,StateType = S || var(50) = 1)
TriggerAll = EnemyNear(Root,var(58)),StateNo = var(13)
Trigger1 = var(13) > 0
V = 13
Value = 0
IgnoreHitPause = 1

[State 31000, 中段記憶削除]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H
TriggerAll = EnemyNear(Root,var(58)),StateNo = var(14)
Triggerall = var(19) = 0 && VAR(14) > 0
Trigger1 =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155]) && Root,Time <= 1
Trigger1 = EnemyNear(Root,var(58)),StateType != A && (Root,StateType = S || var(50) = 1)
Trigger1 = GAMETIME = ROOT,VAR(53)
Trigger2 = Root,StateNo >= 200 && var(52) = 1 && Root,Time <= 1
Trigger2 = var(51) = 2
V = 19
Value = var(14)
IgnoreHitPause = 1

[State 31000, 中段記憶削除]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H && Root,Time <= 1
TriggerAll =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155]) || Root,StateNo >= 200 && var(51) = 1
TriggerAll = EnemyNear(Root,var(58)),StateType != A && (Root,StateType = S || var(50) = 1)
TriggerAll = EnemyNear(Root,var(58)),StateNo = var(14)
Trigger1 = var(14) > 0
V = 14
Value = 0
IgnoreHitPause = 1

;---------------------------------------------------------------------------

[State 31000, 下段記憶削除]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H
TriggerAll = EnemyNear(Root,var(58)),StateNo = var(20)
Triggerall = var(25) = 0
Trigger1 =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155]) && Root,Time <= 1
Trigger1 = EnemyNear(Root,var(58)),StateType != A && (Root,StateType = C || var(50) = 2)
Trigger1 = GAMETIME = ROOT,VAR(53)
Trigger2 = Root,StateNo >= 200 && var(52) = 1 && Root,Time <= 1
Trigger2 = var(51) = 1
V = 25
Value = var(20)
IgnoreHitPause = 1

[State 31000, 下段記憶削除]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H && Root,Time <= 1
TriggerAll =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155]) || Root,StateNo >= 200 && var(51) = 1
TriggerAll = EnemyNear(Root,var(58)),StateType != C && (Root,StateType = C || var(50) = 2)
TriggerAll = EnemyNear(Root,var(58)),StateNo = var(20)
Trigger1 = var(20) > 0
V = 20
Value = 0
IgnoreHitPause = 1

[State 31000, 下段記憶削除]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H
TriggerAll = EnemyNear(Root,var(58)),StateNo = var(21)
Triggerall = var(26) = 0
Trigger1 =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155]) && Root,Time <= 1
Trigger1 = EnemyNear(Root,var(58)),StateType != A && (Root,StateType = C || var(50) = 2)
Trigger1 = GAMETIME = ROOT,VAR(53)
Trigger2 = Root,StateNo >= 200 && var(52) = 1 && Root,Time <= 1
Trigger2 = var(51) = 1
V = 26
Value = var(21)
IgnoreHitPause = 1

[State 31000, 下段記憶削除]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H && Root,Time <= 1
TriggerAll =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155]) || Root,StateNo >= 200 && var(51) = 1
TriggerAll = EnemyNear(Root,var(58)),StateType != C && (Root,StateType = C || var(50) = 2)
TriggerAll = EnemyNear(Root,var(58)),StateNo = var(21)
Trigger1 = var(21) > 0
V = 21
Value = 0
IgnoreHitPause = 1

[State 31000, 下段記憶削除]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H
TriggerAll = EnemyNear(Root,var(58)),StateNo = var(22)
Triggerall = var(27) = 0
Trigger1 =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155]) && Root,Time <= 1
Trigger1 = EnemyNear(Root,var(58)),StateType != A && (Root,StateType = C || var(50) = 2)
Trigger1 = GAMETIME = ROOT,VAR(53)
Trigger2 = Root,StateNo >= 200 && var(52) = 1 && Root,Time <= 1
Trigger2 = var(51) = 1
V = 27
Value = var(22)
IgnoreHitPause = 1


[State 31000, 下段記憶削除]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H && Root,Time <= 1
TriggerAll =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155]) || Root,StateNo >= 200 && var(51) = 1
TriggerAll = EnemyNear(Root,var(58)),StateType != C && (Root,StateType = C || var(50) = 2)
TriggerAll = EnemyNear(Root,var(58)),StateNo = var(22)
Trigger1 = var(22) > 0
V = 22
Value = 0
IgnoreHitPause = 1

[State 31000, 下段記憶削除]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H
TriggerAll = EnemyNear(Root,var(58)),StateNo = var(23)
Triggerall = var(28) = 0
Trigger1 =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155]) && Root,Time <= 1
Trigger1 = EnemyNear(Root,var(58)),StateType != A && (Root,StateType = C || var(50) = 2)
Trigger1 = GAMETIME = ROOT,VAR(53)
Trigger2 = Root,StateNo >= 200 && var(52) = 1 && Root,Time <= 1
Trigger2 = var(51) = 1
V = 28
Value = var(23)
IgnoreHitPause = 1

[State 31000, 下段記憶削除]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H && Root,Time <= 1
TriggerAll =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155]) || Root,StateNo >= 200 && var(51) = 1
TriggerAll = EnemyNear(Root,var(58)),StateType != C && (Root,StateType = C || var(50) = 2)
TriggerAll = EnemyNear(Root,var(58)),StateNo = var(23)
Trigger1 = var(23) > 0
V = 23
Value = 0
IgnoreHitPause = 1

[State 31000, 下段記憶削除]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H
TriggerAll = EnemyNear(Root,var(58)),StateNo = var(24)
Triggerall = var(29) = 0
Trigger1 =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155]) && Root,Time <= 1
Trigger1 = EnemyNear(Root,var(58)),StateType != A && (Root,StateType = C || var(50) = 2)
Trigger1 = GAMETIME = ROOT,VAR(53)
Trigger2 = Root,StateNo >= 200 && var(52) = 1 && Root,Time <= 1
Trigger2 = var(51) = 1
V = 29
Value = var(24)
IgnoreHitPause = 1

[State 31000, 下段記憶削除]
Type = VarSet
TriggerAll = Root,var(59) = 1
TriggerAll = Root,MoveType = H && Root,Time <= 1
TriggerAll =(Root,StateNo != [120,155]) && (Root,PrevStateNo = [120,155]) || Root,StateNo >= 200 && var(51) = 1
TriggerAll = EnemyNear(Root,var(58)),StateType != C && (Root,StateType = C || var(50) = 2)
TriggerAll = EnemyNear(Root,var(58)),StateNo = var(24)
Trigger1 = var(24) > 0
V = 24
Value = 0
IgnoreHitPause = 1


;---------------------------------------------------------------------------

[State 31000, DisplayToClipBoard]
Type = DisplayToClipBoard
trigger1 = 1
Text = "var(10)=%d,var(11)=%d,var(12)=%d,var(13)=%d,var(14)=%d"
Params = var(10),var(11),var(12),var(13),var(14)
IgnoreHitPause = 1

[State 31000, AppendToClipboard]
type = AppendToClipboard
trigger1 = 1
text = "\nvar(20)=%d,var(21)=%d,var(22)=%d,var(23)=%d,var(24)=%d"
params = var(20),var(21),var(22),var(23),var(24)
IgnoreHitPause = 1

;---------------------------------------------------------------------------
[State 31000, DestroySelf]
type = DestroySelf;DestroySelf
trigger1 = ishelper
trigger1 = roundstate >= 3
trigger1 = root,stateno != [120,159]
trigger2 = roundstate >= 4
trigger2 = ishelper
trigger2 = roundstate >= 3

;---------------------------------------------------------------------------
; ???嬶姶??儖?乕
;---------------------------------------------------------------------------
[Statedef 32000];???嬶
anim = 9999
ctrl = 0

[State 32000, AssertSpecial]
type = AssertSpecial
Trigger1 = 1
flag = NoShadow
flag2 = invisible

[State 32000, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 10000,???????????????]
type=selfstate
trigger1=!ishelper
value=0

[State -3, ]
type = VarSet
trigger1 = roundstate = 2
var(30) = enemynear,GetHitVar(hitshaketime)+enemynear,GetHitVar(hittime)
ignorehitpause = 1

[State -3]
Type = VarSet
TriggerAll = Var(1) = 0
Trigger1 = EnemyNear,NumHelper > 0
Trigger1 = RoundState <= 1 || (EnemyNear,movetype = H && EnemyNear,StateNo!=[120,159])
var(1) = (EnemyNear,NumHelper - NumEnemy) + 1

[State -3]
Type = VarSet
TriggerAll = Var(1) > EnemyNear,NumHelper
Trigger1 = RoundState = 2
var(1) = (EnemyNear,NumHelper - NumEnemy) + 1

[State -3]
type = VarSet
trigger1 = ishelper(32000)
var(2) = gametime
pausemovetime=0
supermovetime=0

[State 10000,]
Type = DestroySelf
trigger1 = roundstate > 2
trigger2 = (root,stateno = [358000,358006])|| root,alive = 0 || (root,prevstateno = [358000,358006]) || (root,stateno = [8900,8903])

;---------------------------------------------------------------------------
[Statedef 32500]
anim = 9999
ctrl = 0

[State 32500, AssertSpecial]
type = AssertSpecial
Trigger1 = 1
flag = NoShadow
flag2 = invisible

[State 32500, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 10000,???????????????]
type=selfstate
trigger1=!ishelper
value=0

[State 2, 2];??乕?乕
type = BindToroot
trigger1 = IsHelper
time = -1
facing = 1
pos = 50*(ifelse(IsHelper(32500),1.5,-2)) ,0
ignorehitpause = 1
pausemovetime=2147483647
supermovetime=2147483647

[State 825, 1]
type = Turn
trigger1 = root,facing != facing

[State -3, ]
type = parentVarSet
trigger1 = IsHelper(32500)
trigger1 = root,var(46) = 0
var(45) = 0
ignorehitpause = 1

[State -3, ]
type = parentVarSet
trigger1 = IsHelper(32500)
trigger1 = !inguarddist
var(45) = 1
ignorehitpause = 1

[State -3, ]
type = parentVarSet
trigger1 = IsHelper(32501)
trigger1 = !inguarddist
var(46) = 0
ignorehitpause = 1

[State -3, ]
type = parentVarSet
trigger1 = IsHelper(32501)
trigger1 = inguarddist
var(46) = 1
ignorehitpause = 1

[State 10000,]
Type = DestroySelf
trigger1 = roundstate > 2
trigger2 = (root,stateno = [358000,358006])|| root,alive = 0 || (root,prevstateno = [358000,358006]) || (root,stateno = [8900,8903])

;------------------------------------------------------------------------------
;敵に当身ステート記憶
;------------------------------------------------------------------------------
[Statedef 33500]
anim = 9999
ctrl = 0

[State 33500]
type=selfstate
trigger1=!ishelper
value=0

[State 33500]
Type = AssertSpecial
Trigger1 = IsHelper
flag = invisible

[State 33500]
type = Nothitby
trigger1 = 1
value = SCA

[State 33500]
type = BindToRoot
trigger1 = 1
time = 1
pos = 0,0
ignorehitpause = 1

[State 33500]
type = DisplayToClipboard
trigger1 = 1
text = "v14=%d,v15=%d,v16=%d,v17=%d,v18=%d,v19=%d\n"
params = var(14),var(15),var(16),var(17),var(18),var(19)
ignorehitpause = 1

[State 33500]
type = AppendToClipboard
trigger1 = 1
text = "root:rev=%d,time=%d,p2time=%d,p2stno=%d,p2prev=%d,reversed=%d"
params = root,movereversed,root,time,EnemyNear(root,var(58)),Time,EnemyNear(root,var(58)),StateNo,EnemyNear(Root,var(58)),PrevStateNo,root,movereversed
ignorehitpause = 1
;-------------------------------------------------------------
[State 敵に当身ステート記憶初期化]
Type = VarSet
Trigger1 = root,fvar(10)
Trigger1 = root,fvar(10)!=var(14)
V = 14
Value = root,fvar(10)
IgnoreHitPause = 1

[State 敵に当身ステート記憶初期化]
Type = VarSet
Trigger1 = root,fvar(11)
Trigger1 = root,fvar(11)!=var(15)
V = 15
Value = root,fvar(11)
IgnoreHitPause = 1

[State 敵に当身ステート記憶初期化]
Type = VarSet
Trigger1 = root,fvar(12)
Trigger1 = root,fvar(12)!=var(16)
V = 16
Value = root,fvar(12)
IgnoreHitPause = 1

[State 敵に当身ステート記憶初期化]
Type = VarSet
Trigger1 = root,fvar(13)
Trigger1 = root,fvar(13)!=var(17)
V = 17
Value = root,fvar(13)
IgnoreHitPause = 1

[State 敵に当身ステート記憶初期化]
Type = VarSet
Trigger1 = root,fvar(14)
Trigger1 = root,fvar(14)!=var(18)
V = 18
Value = root,fvar(14)
IgnoreHitPause = 1
;-------------------------------------------------------------
[State 敵に当身ステート記憶ON]
Type = VarSet
TriggerAll = EnemyNear(root,var(58)),StateNo >= 1000
TriggerAll = Root,MoveReversed||Root,NumHelper(33501)
Trigger1 = var(14) = 0
V = 19
Value = 1
IgnoreHitPause = 1

[State 敵に当身ステート記憶1]
Type = VarSet
TriggerAll = EnemyNear(root,var(58)),StateNo >= 1000
TriggerAll = EnemyNear(root,var(58)),Ctrl = 0
TriggerAll =(Root,StateNo != [120,159]) && (Root,StateNo != [5000,5500])
TriggerAll = var(19) = 1
TriggerAll = var(14) = 0
Trigger1 = Root,MoveType = H
Trigger1 = Root,Time = 1
Trigger2 = Root,MoveType!= H
v = 14
value = EnemyNear(Root,var(58)),PrevStateNo
ignorehitpause = 1

[State 敵に当身ステート記憶OFF]
Type = VarSet
TriggerAll = var(19) = 1
Trigger1 = var(14)!= 0
Trigger1 = var(15) = 0
Trigger1 = var(16) = 0
Trigger1 = var(17) = 0
Trigger1 = var(18) = 0
V = 19
Value = 0
IgnoreHitPause = 1
;-------------------------------------------------------------
[State 敵に当身ステート記憶ON]
Type = VarSet
TriggerAll = EnemyNear(root,var(58)),StateNo >= 1000
TriggerAll = MoveReversed = 1||Root,NumHelper(33501)
Trigger1 = var(14)!= 0
Trigger1 = var(15) = 0
V = 19
Value = 1
IgnoreHitPause = 1

[State 敵に当身ステート記憶2]
Type = VarSet
TriggerAll = EnemyNear(root,var(58)),StateNo >= 1000
TriggerAll = EnemyNear(root,var(58)),Ctrl = 0
TriggerAll =(Root,StateNo != [120,159]) && (Root,StateNo != [5000,5500])
TriggerAll = var(19) = 1
TriggerAll = var(14)!= 0
TriggerAll = var(15) = 0
Trigger1 = Root,MoveType = H
Trigger1 = Root,Time = 1
Trigger2 = Root,MoveType!= H
v = 15
value = EnemyNear(Root,var(58)),PrevStateNo
ignorehitpause = 1

[State 敵に当身ステート記憶OFF]
Type = VarSet
TriggerAll = var(19) = 1
Trigger1 = var(14)!= 0
Trigger1 = var(15)!= 0
Trigger1 = var(16) = 0
Trigger1 = var(17) = 0
Trigger1 = var(18) = 0
V = 19
Value = 0
IgnoreHitPause = 1

[State 敵に当身ステート記憶初期化]
Type = VarSet
Trigger1 = var(15) = var(14)
V = 15
Value = 0
IgnoreHitPause = 1
;-------------------------------------------------------------
[State 敵に当身ステート記憶ON]
Type = VarSet
TriggerAll = EnemyNear(root,var(58)),StateNo >= 1000
TriggerAll = MoveReversed = 1||Root,NumHelper(33501)
Trigger1 = var(14)!= 0
Trigger1 = var(15)!= 0
Trigger1 = var(16) = 0
V = 19
Value = 1
IgnoreHitPause = 1

[State 敵に当身ステート記憶3]
Type = VarSet
TriggerAll = EnemyNear(root,var(58)),StateNo >= 1000
TriggerAll = EnemyNear(root,var(58)),Ctrl = 0
TriggerAll =(Root,StateNo != [120,159]) && (Root,StateNo != [5000,5500])
TriggerAll = var(19) = 1
TriggerAll = var(14)!= 0
TriggerAll = var(15)!= 0
TriggerAll = var(16) = 0
Trigger1 = Root,MoveType = H
Trigger1 = Root,Time = 1
Trigger2 = Root,MoveType!= H
v = 16
value = EnemyNear(Root,var(58)),PrevStateNo
ignorehitpause = 1

[State 敵に当身ステート記憶OFF]
Type = VarSet
TriggerAll = var(19) = 1
Trigger1 = var(14)!= 0
Trigger1 = var(15)!= 0
Trigger1 = var(16)!= 0
Trigger1 = var(17) = 0
Trigger1 = var(18) = 0
V = 19
Value = 0
IgnoreHitPause = 1

[State 敵に当身ステート記憶初期化]
Type = VarSet
Trigger1 = var(16) = var(15)
Trigger2 = var(16) = var(14)
V = 16
Value = 0
IgnoreHitPause = 1
;-------------------------------------------------------------
[State 敵に当身ステート記憶ON]
Type = VarSet
TriggerAll = EnemyNear(root,var(58)),StateNo >= 1000
TriggerAll = MoveReversed = 1||Root,NumHelper(33501)
Trigger1 = var(14)!= 0
Trigger1 = var(15)!= 0
Trigger1 = var(16)!= 0
Trigger1 = var(17) = 0
V = 19
Value = 1
IgnoreHitPause = 1

[State 敵に当身ステート記憶4]
Type = VarSet
TriggerAll = EnemyNear(root,var(58)),StateNo >= 1000
TriggerAll = EnemyNear(root,var(58)),Ctrl = 0
TriggerAll =(Root,StateNo != [120,159]) && (Root,StateNo != [5000,5500])
TriggerAll = var(19) = 1
TriggerAll = var(14)!= 0
TriggerAll = var(15)!= 0
TriggerAll = var(16)!= 0
TriggerAll = var(17) = 0
Trigger1 = Root,MoveType = H
Trigger1 = Root,Time = 1
Trigger2 = Root,MoveType!= H
v = 17
value = EnemyNear(Root,var(58)),PrevStateNo
ignorehitpause = 1

[State 敵に当身ステート記憶OFF]
Type = VarSet
TriggerAll = var(19) = 1
Trigger1 = var(14)!= 0
Trigger1 = var(15)!= 0
Trigger1 = var(16)!= 0
Trigger1 = var(17)!= 0
Trigger1 = var(18) = 0
V = 19
Value = 0
IgnoreHitPause = 1

[State 敵に当身ステート記憶初期化]
Type = VarSet
Trigger1 = var(17) = var(16)
Trigger2 = var(17) = var(15)
Trigger3 = var(17) = var(14)
V = 17
Value = 0
IgnoreHitPause = 1
;-------------------------------------------------------------
[State 敵に当身ステート記憶ON]
Type = VarSet
TriggerAll = EnemyNear(root,var(58)),StateNo >= 1000
TriggerAll = MoveReversed = 1||Root,NumHelper(33501)
Trigger1 = var(14)!= 0
Trigger1 = var(15)!= 0
Trigger1 = var(16)!= 0
Trigger1 = var(17)!= 0
Trigger1 = var(18) = 0
V = 19
Value = 1
IgnoreHitPause = 1

[State 敵に当身ステート記憶5]
Type = VarSet
TriggerAll = EnemyNear(root,var(58)),StateNo >= 1000
TriggerAll = EnemyNear(root,var(58)),Ctrl = 0
TriggerAll =(Root,StateNo != [120,159]) && (Root,StateNo != [5000,5500])
TriggerAll = var(19) = 1
TriggerAll = var(14)!= 0
TriggerAll = var(15)!= 0
TriggerAll = var(16)!= 0
TriggerAll = var(17)!= 0
TriggerAll = var(18) = 0
Trigger1 = Root,MoveType = H
Trigger1 = Root,Time = 1
Trigger2 = Root,MoveType!= H
v = 18
value = EnemyNear(Root,var(58)),PrevStateNo
ignorehitpause = 1

[State 敵に当身ステート記憶OFF]s
Type = VarSet
TriggerAll = var(19) = 1
Trigger1 = var(14)!= 0
Trigger1 = var(15)!= 0
Trigger1 = var(16)!= 0
Trigger1 = var(17)!= 0
Trigger1 = var(18)!= 0
V = 19
Value = 0
IgnoreHitPause = 1

[State 敵に当身ステート記憶初期化]
Type = VarSet
Trigger1 = var(18) = var(17)
Trigger2 = var(18) = var(16)
Trigger3 = var(18) = var(15)
Trigger4 = var(18) = var(14)
V = 18
Value = 0
IgnoreHitPause = 1
;-------------------------------------------------------------
[State 敵に当身ステート記憶初期化]
type = null
Trigger1 = var(18) = var(17) || var(18) = var(16) || var(18) = var(15) || var(18) = var(14)
Trigger1 = var(18):= 0 || 1
Trigger2 = var(17) = var(16) || var(17) = var(15) || var(17) = var(14)
Trigger2 = var(17):= 0 || 1
Trigger3 = var(16) = var(15) || var(16) = var(14)
Trigger3 = var(16):= 0 || 1
Trigger4 = var(15) = var(14)
Trigger4 = var(15):= 0 || 1
ignorehitpause = 1
;-------------------------------------------------------------
[State 敵に当身ステート本体記憶]
type = ParentVarSet
trigger1 = var(14)
fv = 10
value = var(14)
ignorehitpause = 1

[State 敵に当身ステート本体記憶]
type = ParentVarSet
trigger1 = var(15)
fv = 11
value = var(15)
ignorehitpause = 1

[State 敵に当身ステート本体記憶]
type = ParentVarSet
trigger1 = var(16)
fv = 12
value = var(16)
ignorehitpause = 1

[State 敵に当身ステート本体記憶]
type = ParentVarSet
trigger1 = var(17)
fv = 13
value = var(17)
ignorehitpause = 1

[State 敵に当身ステート本体記憶]
type = ParentVarSet
trigger1 = var(18)
fv = 14
value = var(18)
ignorehitpause = 1

;敵に当身ステート記憶
[Statedef 33501]
Type = A
Ctrl = 0
Anim = 9999
Velset = 0,0
Movetype = I
Physics = N
Sprpriority = 1

[State 33501]
type=selfstate
trigger1=!ishelper
value=0

[State 33501]
Type = AssertSpecial
Trigger1 = IsHelper
flag = invisible

[State 33501]
type = Nothitby
trigger1 = 1
value = SCA

[State 33501]
type = BindToRoot
trigger1 = 1
time = 1
pos = 0,0
ignorehitpause = 1

[state 33501]
type=destroyself
trigger1=time=2
trigger2=gametime=root,var(55)
trigger3 = (root,stateno = [358000,358006])|| root,alive = 0 || (root,prevstateno = [358000,358006]) || (root,stateno = [8900,8903])

;---------------------------------------------------------------------------;当身記憶LV2
[Statedef 33700]
anim = 9999
ctrl = 0

[State 33500]
type=selfstate
trigger1=!ishelper
value=0

[State 33500]
Type = AssertSpecial
Trigger1 = IsHelper
flag = invisible

[State 33500]
type = Nothitby
trigger1 = 1
value = SCA

[State 33500]
type = BindToRoot
trigger1 = 1
time = 1
pos = 0,0
ignorehitpause = 1
;================================================初始化
[State 敵に当身ステート記憶初期化]
Type = VarSet
Trigger1 = root,fvar(0)
Trigger1 = root,fvar(0)!=fvar(0)
Fv = 0
Value = root,fvar(0)
IgnoreHitPause = 1

[State 敵に当身ステート記憶初期化]
Type = VarSet
Trigger1 = root,fvar(1)
Trigger1 = root,fvar(1)!=fvar(1)
Fv = 1
Value = root,fvar(1)
IgnoreHitPause = 1

[State 敵に当身ステート記憶初期化]
Type = VarSet
Trigger1 = root,fvar(2)
Trigger1 = root,fvar(2)!=fvar(2)
Fv = 2
Value = root,fvar(2)
IgnoreHitPause = 1

[State 敵に当身ステート記憶初期化]
Type = VarSet
Trigger1 = root,fvar(3)
Trigger1 = root,fvar(3)!=fvar(3)
Fv = 3
Value = root,fvar(3)
IgnoreHitPause = 1

[State 敵に当身ステート記憶初期化]
Type = VarSet
Trigger1 = root,fvar(4)
Trigger1 = root,fvar(4)!=fvar(4)
Fv = 4
Value = root,fvar(2)
IgnoreHitPause = 1
;================================================?方ID
[State 0, VarSet]
type = VarSet
trigger1 =!var(1)
v = 1
value = enemynear(0),id
ignorehitpause = 1

[State 0, VarSet]
type = VarSet
triggerall = numenemy = 2
trigger1 = var(1)
trigger1 =!var(2)
v = 2
value = enemynear(1),id
ignorehitpause = 1
;================================================按????方状?和?画
[State 33500]
type = Null
triggerall = roundstate = 2
trigger1 = 1||var(19):= var(18)
trigger1 = 1||var(18):= var(17)
trigger1 = 1||var(17):= var(16)
trigger1 = 1||var(16):= var(15)
trigger1 = 1||var(15):= var(14)
trigger1 = 1||var(14):= var(13)
trigger1 = 1||var(13):= var(12)
trigger1 = 1||var(12):= var(11)
trigger1 = 1||var(11):= var(10)
trigger1 = 1||var(10):= playerid(var(1)),stateno
ignorehitpause = 1

[State 33500]
type = Null
triggerall = roundstate = 2
trigger1 = 1||var(29):= var(28)
trigger1 = 1||var(28):= var(27)
trigger1 = 1||var(27):= var(26)
trigger1 = 1||var(26):= var(25)
trigger1 = 1||var(25):= var(24)
trigger1 = 1||var(24):= var(23)
trigger1 = 1||var(23):= var(22)
trigger1 = 1||var(22):= var(21)
trigger1 = 1||var(21):= var(20)
trigger1 = 1||var(20):= playerid(var(2)),stateno
ignorehitpause = 1

[State 33500]
type = Null
triggerall = roundstate = 2
trigger1 = 1||var(39):= var(38)
trigger1 = 1||var(38):= var(37)
trigger1 = 1||var(37):= var(36)
trigger1 = 1||var(36):= var(35)
trigger1 = 1||var(35):= var(34)
trigger1 = 1||var(34):= var(33)
trigger1 = 1||var(33):= var(32)
trigger1 = 1||var(32):= var(31)
trigger1 = 1||var(31):= var(30)
trigger1 = 1||var(30):= playerid(var(1)),anim
ignorehitpause = 1

[State 33500]
type = Null
triggerall = roundstate = 2
trigger1 = 1||var(49):= var(48)
trigger1 = 1||var(48):= var(47)
trigger1 = 1||var(47):= var(46)
trigger1 = 1||var(46):= var(45)
trigger1 = 1||var(45):= var(44)
trigger1 = 1||var(44):= var(43)
trigger1 = 1||var(43):= var(42)
trigger1 = 1||var(42):= var(41)
trigger1 = 1||var(41):= var(40)
trigger1 = 1||var(40):= playerid(var(2)),anim
ignorehitpause = 1
;================================================???助
[State 33500]
type = VarAdd
trigger1 = Root,NumHelper(33501)
trigger2 = var(3)
v = 3
value = 1
ignorehitpause = 1

[State 33500]
type = VarSet
trigger1 = var(3) > 30
v = 3
value = 0
ignorehitpause = 1

[State 33500]
type = VarSet
trigger1 = 1
v = 4
value = (fvar(0)>0)+(fvar(1)>0)+(fvar(2)>0)+(fvar(3)>0)+(fvar(4)>0)
ignorehitpause = 1

[State 33500]
type = VarSet
trigger1 = 1
v = 5
value = (fvar(5)>0)+(fvar(6)>0)+(fvar(7)>0)+(fvar(8)>0)+(fvar(9)>0)
ignorehitpause = 1

[State 33500]
type = VarSet
trigger1 = 1
v = 6
value = (fvar(10)>0)+(fvar(11)>0)+(fvar(12)>0)+(fvar(13)>0)+(fvar(14)>0)
ignorehitpause = 1

[State 33500]
type = VarSet
trigger1 = 1
v = 7
value = (fvar(15)>0)+(fvar(16)>0)+(fvar(17)>0)+(fvar(18)>0)+(fvar(19)>0)
ignorehitpause = 1
;================================================当身??
[State 33500]
type = VarSet
Triggerall = var(4) < 5
Triggerall = fvar(0+var(4)) = 0
Trigger1 = var(3) = 1
fv = 0+var(4)
value = var(11)
ignorehitpause = 1

[State 33500]
type = VarSet
Triggerall = var(5) < 5
Triggerall = fvar(5+var(5)) = 0
Trigger1 = var(3) = 1
fv = 5+var(5)
value = var(21)
ignorehitpause = 1

[State 33500]
type = VarSet
Triggerall = var(6) < 5
Triggerall = fvar(10+var(6)) = 0
Trigger1 = var(3) = 1
fv = 10+var(6)
value = var(31)
ignorehitpause = 1

[State 33500]
type = VarSet
Triggerall = var(7) < 5
Triggerall = fvar(15+var(7)) = 0
Trigger1 = var(3) = 1
fv = 15+var(7)
value = var(41)
ignorehitpause = 1
;================================================清除重?
[State 33500]
type = Varrangeset
Trigger1 = fvar(1)=fvar(0)&&var(4)=1
Trigger2 = fvar(2)=fvar(0)&&var(4)=2
Trigger3 = fvar(2)=fvar(1)&&var(4)=2
Trigger4 = fvar(3)=fvar(0)&&var(4)=3
Trigger5 = fvar(3)=fvar(1)&&var(4)=3
Trigger6 = fvar(3)=fvar(2)&&var(4)=3
Trigger7 = fvar(4)=fvar(0)&&var(4)=4
Trigger8 = fvar(4)=fvar(1)&&var(4)=4
Trigger9 = fvar(4)=fvar(2)&&var(4)=4
Trigger10= fvar(4)=fvar(3)&&var(4)=4
first = 0+var(4)
last = 4
fvalue = 0
ignorehitpause = 1

[State 33500]
type = Varrangeset
Trigger1 = fvar(6)=fvar(5)&&var(5)=1
Trigger2 = fvar(7)=fvar(5)&&var(5)=2
Trigger3 = fvar(7)=fvar(6)&&var(5)=2
Trigger4 = fvar(8)=fvar(5)&&var(5)=3
Trigger5 = fvar(8)=fvar(6)&&var(5)=3
Trigger6 = fvar(8)=fvar(7)&&var(5)=3
Trigger7 = fvar(9)=fvar(5)&&var(5)=4
Trigger8 = fvar(9)=fvar(6)&&var(5)=4
Trigger9 = fvar(9)=fvar(7)&&var(5)=4
Trigger10= fvar(9)=fvar(8)&&var(5)=4
first = 5+var(5)
last = 9
fvalue = 0
ignorehitpause = 1

[State 33500]
type = Varrangeset
Trigger1 = fvar(11)=fvar(10)&&var(6)=1
Trigger2 = fvar(12)=fvar(10)&&var(6)=2
Trigger3 = fvar(12)=fvar(11)&&var(6)=2
Trigger4 = fvar(13)=fvar(10)&&var(6)=3
Trigger5 = fvar(13)=fvar(11)&&var(6)=3
Trigger6 = fvar(13)=fvar(12)&&var(6)=3
Trigger7 = fvar(14)=fvar(10)&&var(6)=4
Trigger8 = fvar(14)=fvar(11)&&var(6)=4
Trigger9 = fvar(14)=fvar(12)&&var(6)=4
Trigger10= fvar(14)=fvar(13)&&var(6)=4
first = 10+var(6)
last = 14
fvalue = 0
ignorehitpause = 1

[State 33500]
type = Varrangeset
Trigger1 = fvar(16)=fvar(15)&&var(7)=1
Trigger2 = fvar(17)=fvar(15)&&var(7)=2
Trigger3 = fvar(17)=fvar(16)&&var(7)=2
Trigger4 = fvar(18)=fvar(15)&&var(7)=3
Trigger5 = fvar(18)=fvar(16)&&var(7)=3
Trigger6 = fvar(18)=fvar(17)&&var(7)=3
Trigger7 = fvar(19)=fvar(15)&&var(7)=4
Trigger8 = fvar(19)=fvar(16)&&var(7)=4
Trigger9 = fvar(19)=fvar(17)&&var(7)=4
Trigger10= fvar(19)=fvar(18)&&var(7)=4
first = 15+var(7)
last = 19
fvalue = 0
ignorehitpause = 1
;================================================当身??到本体
[State 33500]
type = ParentVarSet
Triggerall = parent,fvar(0+var(4)) = 0
Trigger1 = fvar(0+var(4))!= 0
fv = 0+var(4)
value = fvar(0+var(4))
ignorehitpause = 1
;================================================DEBUG
[State 33500]
type = DisplayToClipboard
trigger1 = 1
text = "fv0=%d,fv1=%d,fv2=%d,fv3=%d,fv4=%d,v3=%d\n"
params = fvar(0),fvar(1),fvar(2),fvar(3),fvar(4),var(3)
ignorehitpause = 1

[State 33500]
type = AppendToClipboard
trigger1 = 1
text = "fv10=%d,fv11=%d,fv12=%d,fv13=%d,fv14=%d,v4=%d\n"
params = fvar(10),fvar(11),fvar(12),fvar(13),fvar(14),var(4)
ignorehitpause = 1

[State 33500]
type = AppendToClipboard
trigger1 = 0
text = "v10=%d,v11=%d,v12=%d,v13=%d,v14=%d,v4=%d\n"
params = var(10),var(11),var(12),var(13),var(14),var(4)
ignorehitpause = 1

[State 33500]
type = AppendToClipboard
trigger1 = 0
text = "v30=%d,v31=%d,v32=%d,v33=%d,v34=%d,v6=%d\n"
params = var(30),var(31),var(32),var(33),var(34),var(6)
ignorehitpause = 1

[State 10000,]
Type = DestroySelf
trigger1 = (root,stateno = [358000,358006])|| root,alive = 0 || (root,prevstateno = [358000,358006]) || (root,stateno = [8900,8903])

;---------------------------------------------------------------------------
[statedef 999]
ctrl = 0

[State 999]
type = nothitby
trigger1 = 1
value = sca

[State 999]
type = selfstate
trigger1 = !ishelper
value = 0

[State 999]
type = varset
triggerall = enemynear, StateNo >= 200 && enemynear,MoveType=A
triggerall = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
trigger1 = var(1) = 0
V = 1
Value  = (enemynear, StateNo)
IgnoreHitPause = 1

[State 999]
type = varset
trigger1 = var(1) != 0
trigger1 = var(2) = 0
trigger1 = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
V = 2
Value = (enemynear, Time)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = enemynear, StateNo >= 200 && enemynear,MoveType=A
triggerall = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
triggerall = var(1)
triggerall = enemynear, StateNo != var(1)
trigger1 = var(3) = 0
V = 3
Value  = (enemynear, StateNo)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = var(2)
trigger1 = var(3) != 0
trigger1 = var(4) = 0
trigger1 = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
V= 4
Value = (enemynear, Time)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = enemynear, StateNo >= 200 && enemynear,MoveType=A
triggerall = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
triggerall = var(3)
triggerall = enemynear, StateNo != var(1)
triggerall = enemynear, StateNo != var(3)
trigger1 = var(5) = 0
V = 5
Value  = (enemynear, StateNo)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = var(4)
trigger1 = var(5) != 0
trigger1 = var(6) = 0
trigger1 = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
V= 6
Value = (enemynear, Time)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = enemynear, StateNo >= 200 && enemynear,MoveType=A
triggerall = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
triggerall = var(5)
triggerall = enemynear, StateNo != var(1)
triggerall = enemynear, StateNo != var(3)
triggerall = enemynear, StateNo != var(5)
trigger1 = var(7) = 0
V = 7
Value  = (enemynear, StateNo)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = var(6)
trigger1 = var(7) != 0
trigger1 = var(8) = 0
trigger1 = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
V= 8
Value = (enemynear, Time)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = enemynear, StateNo >= 200 && enemynear,MoveType=A
triggerall = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
triggerall = var(7)
triggerall = enemynear, StateNo != var(1)
triggerall = enemynear, StateNo != var(3)
triggerall = enemynear, StateNo != var(5)
triggerall = enemynear, StateNo != var(7)
trigger1 = var(9) = 0
V = 9
Value  = (enemynear, StateNo)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = var(8)
trigger1 = var(9) != 0
trigger1 = var(10) = 0
trigger1 = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
V= 10
Value = (enemynear, Time)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = enemynear, StateNo >= 200 && enemynear,MoveType=A
triggerall = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
triggerall = var(9)
triggerall = enemynear, StateNo != var(1)
triggerall = enemynear, StateNo != var(3)
triggerall = enemynear, StateNo != var(5)
triggerall = enemynear, StateNo != var(7)
triggerall = enemynear, StateNo != var(9)
trigger1 = var(11) = 0
V = 11
Value  = (enemynear, StateNo)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = var(10)
trigger1 = var(11) != 0
trigger1 = var(12) = 0
trigger1 = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
V= 12
Value = (enemynear, Time)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = enemynear, StateNo >= 200 && enemynear,MoveType=A
triggerall = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
triggerall = var(11)
triggerall = enemynear, StateNo != var(1)
triggerall = enemynear, StateNo != var(3)
triggerall = enemynear, StateNo != var(5)
triggerall = enemynear, StateNo != var(7)
triggerall = enemynear, StateNo != var(9)
triggerall = enemynear, StateNo != var(11)
trigger1 = var(13) = 0
V = 13
Value  = (enemynear, StateNo)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = var(12)
trigger1 = var(13) != 0
trigger1 = var(14) = 0
trigger1 = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
V= 14
Value = (enemynear, Time)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = enemynear, StateNo >= 200 && enemynear,MoveType=A
triggerall = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
triggerall = var(13)
triggerall = enemynear, StateNo != var(1)
triggerall = enemynear, StateNo != var(3)
triggerall = enemynear, StateNo != var(5)
triggerall = enemynear, StateNo != var(7)
triggerall = enemynear, StateNo != var(9)
triggerall = enemynear, StateNo != var(11)
triggerall = enemynear, StateNo != var(13)
trigger1 = var(15) = 0
V = 15
Value  = (enemynear, StateNo)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = var(14)
trigger1 = var(15) != 0
trigger1 = var(16) = 0
trigger1 = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
V= 16
Value = (enemynear, Time)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = enemynear, StateNo >= 200 && enemynear,MoveType=A
triggerall = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
triggerall = var(15)
triggerall = enemynear, StateNo != var(1)
triggerall = enemynear, StateNo != var(3)
triggerall = enemynear, StateNo != var(5)
triggerall = enemynear, StateNo != var(7)
triggerall = enemynear, StateNo != var(9)
triggerall = enemynear, StateNo != var(11)
triggerall = enemynear, StateNo != var(13)
triggerall = enemynear, StateNo != var(15)
trigger1 = var(17) = 0
V = 17
Value  = (enemynear, StateNo)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = var(16)
trigger1 = var(17) != 0
trigger1 = var(18) = 0
trigger1 = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
V= 18
Value = (enemynear, Time)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = enemynear, StateNo >= 200 && enemynear,MoveType=A
triggerall = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
triggerall = var(17)
triggerall = enemynear, StateNo != var(1)
triggerall = enemynear, StateNo != var(3)
triggerall = enemynear, StateNo != var(5)
triggerall = enemynear, StateNo != var(7)
triggerall = enemynear, StateNo != var(9)
triggerall = enemynear, StateNo != var(11)
triggerall = enemynear, StateNo != var(13)
triggerall = enemynear, StateNo != var(15)
triggerall = enemynear, StateNo != var(17)
trigger1 = var(19) = 0
V = 19
Value  = (enemynear, StateNo)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = var(18)
trigger1 = var(19) != 0
trigger1 = var(20) = 0
trigger1 = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
V= 20
Value = (enemynear, Time)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = enemynear, StateNo >= 200 && enemynear,MoveType=A
triggerall = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
triggerall = var(19)
triggerall = enemynear, StateNo != var(1)
triggerall = enemynear, StateNo != var(3)
triggerall = enemynear, StateNo != var(5)
triggerall = enemynear, StateNo != var(7)
triggerall = enemynear, StateNo != var(9)
triggerall = enemynear, StateNo != var(11)
triggerall = enemynear, StateNo != var(13)
triggerall = enemynear, StateNo != var(15)
triggerall = enemynear, StateNo != var(17)
triggerall = enemynear, StateNo != var(19)
trigger1 = var(21) = 0
V = 21
Value  = (enemynear, StateNo)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = var(20)
trigger1 = var(21) != 0
trigger1 = var(22) = 0
trigger1 = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
V= 22
Value = (enemynear, Time)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = enemynear, StateNo >= 200 && enemynear,MoveType=A
triggerall = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
triggerall = var(21)
triggerall = enemynear, StateNo != var(1)
triggerall = enemynear, StateNo != var(3)
triggerall = enemynear, StateNo != var(5)
triggerall = enemynear, StateNo != var(7)
triggerall = enemynear, StateNo != var(9)
triggerall = enemynear, StateNo != var(11)
triggerall = enemynear, StateNo != var(13)
triggerall = enemynear, StateNo != var(15)
triggerall = enemynear, StateNo != var(17)
triggerall = enemynear, StateNo != var(19)
triggerall = enemynear, StateNo != var(21)
trigger1 = var(23) = 0
V = 23
Value  = (enemynear, StateNo)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = var(22)
trigger1 = var(23) != 0
trigger1 = var(24) = 0
trigger1 = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
V= 24
Value = (enemynear, Time)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = enemynear, StateNo >= 200 && enemynear,MoveType=A
triggerall = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
triggerall = var(23)
triggerall = enemynear, StateNo != var(1)
triggerall = enemynear, StateNo != var(3)
triggerall = enemynear, StateNo != var(5)
triggerall = enemynear, StateNo != var(7)
triggerall = enemynear, StateNo != var(9)
triggerall = enemynear, StateNo != var(11)
triggerall = enemynear, StateNo != var(13)
triggerall = enemynear, StateNo != var(15)
triggerall = enemynear, StateNo != var(17)
triggerall = enemynear, StateNo != var(19)
triggerall = enemynear, StateNo != var(21)
triggerall = enemynear, StateNo != var(23)
trigger1 = var(25) = 0
V = 25
Value  = (enemynear, StateNo)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = var(24)
trigger1 = var(25) != 0
trigger1 = var(26) = 0
trigger1 = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
V= 26
Value = (enemynear, Time)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = enemynear, StateNo >= 200 && enemynear,MoveType=A
triggerall = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
triggerall = var(25)
triggerall = enemynear, StateNo != var(1)
triggerall = enemynear, StateNo != var(3)
triggerall = enemynear, StateNo != var(5)
triggerall = enemynear, StateNo != var(7)
triggerall = enemynear, StateNo != var(9)
triggerall = enemynear, StateNo != var(11)
triggerall = enemynear, StateNo != var(13)
triggerall = enemynear, StateNo != var(15)
triggerall = enemynear, StateNo != var(17)
triggerall = enemynear, StateNo != var(19)
triggerall = enemynear, StateNo != var(21)
triggerall = enemynear, StateNo != var(23)
triggerall = enemynear, StateNo != var(25)
trigger1 = var(27) = 0
V = 27
Value  = (enemynear, StateNo)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = var(26)
trigger1 = var(27) != 0
trigger1 = var(28) = 0
trigger1 = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
V= 28
Value = (enemynear, Time)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = enemynear, StateNo >= 200 && enemynear,MoveType=A
triggerall = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
triggerall = var(27)
triggerall = enemynear, StateNo != var(1)
triggerall = enemynear, StateNo != var(3)
triggerall = enemynear, StateNo != var(5)
triggerall = enemynear, StateNo != var(7)
triggerall = enemynear, StateNo != var(9)
triggerall = enemynear, StateNo != var(11)
triggerall = enemynear, StateNo != var(13)
triggerall = enemynear, StateNo != var(15)
triggerall = enemynear, StateNo != var(17)
triggerall = enemynear, StateNo != var(19)
triggerall = enemynear, StateNo != var(21)
triggerall = enemynear, StateNo != var(23)
triggerall = enemynear, StateNo != var(25)
triggerall = enemynear, StateNo != var(27)
trigger1 = var(29) = 0
V = 29
Value  = (enemynear, StateNo)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = var(28)
trigger1 = var(29) != 0
trigger1 = var(30) = 0
trigger1 = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
V= 30
Value = (enemynear, Time)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = enemynear, StateNo >= 200 && enemynear,MoveType=A
triggerall = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
triggerall = var(29)
triggerall = enemynear, StateNo != var(1)
triggerall = enemynear, StateNo != var(3)
triggerall = enemynear, StateNo != var(5)
triggerall = enemynear, StateNo != var(7)
triggerall = enemynear, StateNo != var(9)
triggerall = enemynear, StateNo != var(11)
triggerall = enemynear, StateNo != var(13)
triggerall = enemynear, StateNo != var(15)
triggerall = enemynear, StateNo != var(17)
triggerall = enemynear, StateNo != var(19)
triggerall = enemynear, StateNo != var(21)
triggerall = enemynear, StateNo != var(23)
triggerall = enemynear, StateNo != var(25)
triggerall = enemynear, StateNo != var(27)
triggerall = enemynear, StateNo != var(29)
trigger1 = var(31) = 0
V = 31
Value  = (enemynear, StateNo)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = var(30)
trigger1 = var(31) != 0
trigger1 = var(32) = 0
trigger1 = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
V= 32
Value = (enemynear, Time)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = enemynear, StateNo >= 200 && enemynear,MoveType=A
triggerall = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
triggerall = var(31)
triggerall = enemynear, StateNo != var(1)
triggerall = enemynear, StateNo != var(3)
triggerall = enemynear, StateNo != var(5)
triggerall = enemynear, StateNo != var(7)
triggerall = enemynear, StateNo != var(9)
triggerall = enemynear, StateNo != var(11)
triggerall = enemynear, StateNo != var(13)
triggerall = enemynear, StateNo != var(15)
triggerall = enemynear, StateNo != var(17)
triggerall = enemynear, StateNo != var(19)
triggerall = enemynear, StateNo != var(21)
triggerall = enemynear, StateNo != var(23)
triggerall = enemynear, StateNo != var(25)
triggerall = enemynear, StateNo != var(27)
triggerall = enemynear, StateNo != var(29)
triggerall = enemynear, StateNo != var(31)
trigger1 = var(33) = 0
V = 33
Value  = (enemynear, StateNo)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = var(32)
trigger1 = var(33) != 0
trigger1 = var(34) = 0
trigger1 = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
V= 34
Value = (enemynear, Time)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = enemynear, StateNo >= 200 && enemynear,MoveType=A
triggerall = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
triggerall = var(33)
triggerall = enemynear, StateNo != var(1)
triggerall = enemynear, StateNo != var(3)
triggerall = enemynear, StateNo != var(5)
triggerall = enemynear, StateNo != var(7)
triggerall = enemynear, StateNo != var(9)
triggerall = enemynear, StateNo != var(11)
triggerall = enemynear, StateNo != var(13)
triggerall = enemynear, StateNo != var(15)
triggerall = enemynear, StateNo != var(17)
triggerall = enemynear, StateNo != var(19)
triggerall = enemynear, StateNo != var(21)
triggerall = enemynear, StateNo != var(23)
triggerall = enemynear, StateNo != var(25)
triggerall = enemynear, StateNo != var(27)
triggerall = enemynear, StateNo != var(29)
triggerall = enemynear, StateNo != var(31)
triggerall = enemynear, StateNo != var(33)
trigger1 = var(35) = 0
V = 35
Value  = (enemynear, StateNo)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = var(34)
trigger1 = var(35) != 0
trigger1 = var(36) = 0
trigger1 = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
V= 36
Value = (enemynear, Time)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = enemynear, StateNo >= 200 && enemynear,MoveType=A
triggerall = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
triggerall = var(35)
triggerall = enemynear, StateNo != var(1)
triggerall = enemynear, StateNo != var(3)
triggerall = enemynear, StateNo != var(5)
triggerall = enemynear, StateNo != var(7)
triggerall = enemynear, StateNo != var(9)
triggerall = enemynear, StateNo != var(11)
triggerall = enemynear, StateNo != var(13)
triggerall = enemynear, StateNo != var(15)
triggerall = enemynear, StateNo != var(17)
triggerall = enemynear, StateNo != var(19)
triggerall = enemynear, StateNo != var(21)
triggerall = enemynear, StateNo != var(23)
triggerall = enemynear, StateNo != var(25)
triggerall = enemynear, StateNo != var(27)
triggerall = enemynear, StateNo != var(29)
triggerall = enemynear, StateNo != var(31)
triggerall = enemynear, StateNo != var(33)
triggerall = enemynear, StateNo != var(35)
trigger1 = var(37) = 0
V = 37
Value  = (enemynear, StateNo)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = var(36)
trigger1 = var(37) != 0
trigger1 = var(38) = 0
trigger1 = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
V= 38
Value = (enemynear, Time)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = enemynear, StateNo >= 200 && enemynear,MoveType=A
triggerall = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
triggerall = var(37)
triggerall = enemynear, StateNo != var(1)
triggerall = enemynear, StateNo != var(3)
triggerall = enemynear, StateNo != var(5)
triggerall = enemynear, StateNo != var(7)
triggerall = enemynear, StateNo != var(9)
triggerall = enemynear, StateNo != var(11)
triggerall = enemynear, StateNo != var(13)
triggerall = enemynear, StateNo != var(15)
triggerall = enemynear, StateNo != var(17)
triggerall = enemynear, StateNo != var(19)
triggerall = enemynear, StateNo != var(21)
triggerall = enemynear, StateNo != var(23)
triggerall = enemynear, StateNo != var(25)
triggerall = enemynear, StateNo != var(27)
triggerall = enemynear, StateNo != var(29)
triggerall = enemynear, StateNo != var(31)
triggerall = enemynear, StateNo != var(33)
triggerall = enemynear, StateNo != var(35)
triggerall = enemynear, StateNo != var(37)
trigger1 = var(39) = 0
V = 39
Value  = (enemynear, StateNo)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = var(38)
trigger1 = var(39) != 0
trigger1 = var(40) = 0
trigger1 = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
V= 40
Value = (enemynear, Time)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = enemynear, StateNo >= 200 && enemynear,MoveType=A
triggerall = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
triggerall = var(39)
triggerall = enemynear, StateNo != var(1)
triggerall = enemynear, StateNo != var(3)
triggerall = enemynear, StateNo != var(5)
triggerall = enemynear, StateNo != var(7)
triggerall = enemynear, StateNo != var(9)
triggerall = enemynear, StateNo != var(11)
triggerall = enemynear, StateNo != var(13)
triggerall = enemynear, StateNo != var(15)
triggerall = enemynear, StateNo != var(17)
triggerall = enemynear, StateNo != var(19)
triggerall = enemynear, StateNo != var(21)
triggerall = enemynear, StateNo != var(23)
triggerall = enemynear, StateNo != var(25)
triggerall = enemynear, StateNo != var(27)
triggerall = enemynear, StateNo != var(29)
triggerall = enemynear, StateNo != var(31)
triggerall = enemynear, StateNo != var(33)
triggerall = enemynear, StateNo != var(35)
triggerall = enemynear, StateNo != var(37)
triggerall = enemynear, StateNo != var(39)
trigger1 = var(41) = 0
V = 41
Value  = (enemynear, StateNo)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = var(40)
trigger1 = var(41) != 0
trigger1 = var(42) = 0
trigger1 = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
V= 42
Value = (enemynear, Time)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = enemynear, StateNo >= 200 && enemynear,MoveType=A
triggerall = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
triggerall = var(41)
triggerall = enemynear, StateNo != var(1)
triggerall = enemynear, StateNo != var(3)
triggerall = enemynear, StateNo != var(5)
triggerall = enemynear, StateNo != var(7)
triggerall = enemynear, StateNo != var(9)
triggerall = enemynear, StateNo != var(11)
triggerall = enemynear, StateNo != var(13)
triggerall = enemynear, StateNo != var(15)
triggerall = enemynear, StateNo != var(17)
triggerall = enemynear, StateNo != var(19)
triggerall = enemynear, StateNo != var(21)
triggerall = enemynear, StateNo != var(23)
triggerall = enemynear, StateNo != var(25)
triggerall = enemynear, StateNo != var(27)
triggerall = enemynear, StateNo != var(29)
triggerall = enemynear, StateNo != var(31)
triggerall = enemynear, StateNo != var(33)
triggerall = enemynear, StateNo != var(35)
triggerall = enemynear, StateNo != var(37)
triggerall = enemynear, StateNo != var(39)
triggerall = enemynear, StateNo != var(41)
trigger1 = var(43) = 0
V = 43
Value  = (enemynear, StateNo)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = var(42)
trigger1 = var(43) != 0
trigger1 = var(44) = 0
trigger1 = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
V= 44
Value = (enemynear, Time)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = enemynear, StateNo >= 200 && enemynear,MoveType=A
triggerall = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
triggerall = var(43)
triggerall = enemynear, StateNo != var(1)
triggerall = enemynear, StateNo != var(3)
triggerall = enemynear, StateNo != var(5)
triggerall = enemynear, StateNo != var(7)
triggerall = enemynear, StateNo != var(9)
triggerall = enemynear, StateNo != var(11)
triggerall = enemynear, StateNo != var(13)
triggerall = enemynear, StateNo != var(15)
triggerall = enemynear, StateNo != var(17)
triggerall = enemynear, StateNo != var(19)
triggerall = enemynear, StateNo != var(21)
triggerall = enemynear, StateNo != var(23)
triggerall = enemynear, StateNo != var(25)
triggerall = enemynear, StateNo != var(27)
triggerall = enemynear, StateNo != var(29)
triggerall = enemynear, StateNo != var(31)
triggerall = enemynear, StateNo != var(33)
triggerall = enemynear, StateNo != var(35)
triggerall = enemynear, StateNo != var(37)
triggerall = enemynear, StateNo != var(39)
triggerall = enemynear, StateNo != var(41)
triggerall = enemynear, StateNo != var(43)
trigger1 = var(45) = 0
V = 45
Value  = (enemynear, StateNo)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = var(44)
trigger1 = var(45) != 0
trigger1 = var(46) = 0
trigger1 = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
V= 46
Value = (enemynear, Time)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = enemynear, StateNo >= 200 && enemynear,MoveType=A
triggerall = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
triggerall = var(45)
triggerall = enemynear, StateNo != var(1)
triggerall = enemynear, StateNo != var(3)
triggerall = enemynear, StateNo != var(5)
triggerall = enemynear, StateNo != var(7)
triggerall = enemynear, StateNo != var(9)
triggerall = enemynear, StateNo != var(11)
triggerall = enemynear, StateNo != var(13)
triggerall = enemynear, StateNo != var(15)
triggerall = enemynear, StateNo != var(17)
triggerall = enemynear, StateNo != var(19)
triggerall = enemynear, StateNo != var(21)
triggerall = enemynear, StateNo != var(23)
triggerall = enemynear, StateNo != var(25)
triggerall = enemynear, StateNo != var(27)
triggerall = enemynear, StateNo != var(29)
triggerall = enemynear, StateNo != var(31)
triggerall = enemynear, StateNo != var(33)
triggerall = enemynear, StateNo != var(35)
triggerall = enemynear, StateNo != var(37)
triggerall = enemynear, StateNo != var(39)
triggerall = enemynear, StateNo != var(41)
triggerall = enemynear, StateNo != var(43)
triggerall = enemynear, StateNo != var(45)
trigger1 = var(47) = 0
V = 47
Value  = (enemynear, StateNo)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = var(46)
trigger1 = var(47) != 0
trigger1 = var(48) = 0
trigger1 = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
V= 48
Value = (enemynear, Time)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = enemynear, StateNo >= 200 && enemynear,MoveType=A
triggerall = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
triggerall = var(47)
triggerall = enemynear, StateNo != var(1)
triggerall = enemynear, StateNo != var(3)
triggerall = enemynear, StateNo != var(5)
triggerall = enemynear, StateNo != var(7)
triggerall = enemynear, StateNo != var(9)
triggerall = enemynear, StateNo != var(11)
triggerall = enemynear, StateNo != var(13)
triggerall = enemynear, StateNo != var(15)
triggerall = enemynear, StateNo != var(17)
triggerall = enemynear, StateNo != var(19)
triggerall = enemynear, StateNo != var(21)
triggerall = enemynear, StateNo != var(23)
triggerall = enemynear, StateNo != var(25)
triggerall = enemynear, StateNo != var(27)
triggerall = enemynear, StateNo != var(29)
triggerall = enemynear, StateNo != var(31)
triggerall = enemynear, StateNo != var(33)
triggerall = enemynear, StateNo != var(35)
triggerall = enemynear, StateNo != var(37)
triggerall = enemynear, StateNo != var(39)
triggerall = enemynear, StateNo != var(41)
triggerall = enemynear, StateNo != var(43)
triggerall = enemynear, StateNo != var(45)
triggerall = enemynear, StateNo != var(47)
trigger1 = var(49) = 0
V = 49
Value  = (enemynear, StateNo)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = var(48)
trigger1 = var(49) != 0
trigger1 = var(50) = 0
trigger1 = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
V= 50
Value = (enemynear, Time)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = enemynear, StateNo >= 200 && enemynear,MoveType=A
triggerall = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
triggerall = var(49)
triggerall = enemynear, StateNo != var(1)
triggerall = enemynear, StateNo != var(3)
triggerall = enemynear, StateNo != var(5)
triggerall = enemynear, StateNo != var(7)
triggerall = enemynear, StateNo != var(9)
triggerall = enemynear, StateNo != var(11)
triggerall = enemynear, StateNo != var(13)
triggerall = enemynear, StateNo != var(15)
triggerall = enemynear, StateNo != var(17)
triggerall = enemynear, StateNo != var(19)
triggerall = enemynear, StateNo != var(21)
triggerall = enemynear, StateNo != var(23)
triggerall = enemynear, StateNo != var(25)
triggerall = enemynear, StateNo != var(27)
triggerall = enemynear, StateNo != var(29)
triggerall = enemynear, StateNo != var(31)
triggerall = enemynear, StateNo != var(33)
triggerall = enemynear, StateNo != var(35)
triggerall = enemynear, StateNo != var(37)
triggerall = enemynear, StateNo != var(39)
triggerall = enemynear, StateNo != var(41)
triggerall = enemynear, StateNo != var(43)
triggerall = enemynear, StateNo != var(45)
triggerall = enemynear, StateNo != var(47)
triggerall = enemynear, StateNo != var(49)
trigger1 = var(51) = 0
V = 51
Value  = (enemynear, StateNo)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = var(50)
trigger1 = var(51) != 0
trigger1 = var(52) = 0
trigger1 = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
V= 52
Value = (enemynear, Time)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = enemynear, StateNo >= 200 && enemynear,MoveType=A
triggerall = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
triggerall = var(51)
triggerall = enemynear, StateNo != var(1)
triggerall = enemynear, StateNo != var(3)
triggerall = enemynear, StateNo != var(5)
triggerall = enemynear, StateNo != var(7)
triggerall = enemynear, StateNo != var(9)
triggerall = enemynear, StateNo != var(11)
triggerall = enemynear, StateNo != var(13)
triggerall = enemynear, StateNo != var(15)
triggerall = enemynear, StateNo != var(17)
triggerall = enemynear, StateNo != var(19)
triggerall = enemynear, StateNo != var(21)
triggerall = enemynear, StateNo != var(23)
triggerall = enemynear, StateNo != var(25)
triggerall = enemynear, StateNo != var(27)
triggerall = enemynear, StateNo != var(29)
triggerall = enemynear, StateNo != var(31)
triggerall = enemynear, StateNo != var(33)
triggerall = enemynear, StateNo != var(35)
triggerall = enemynear, StateNo != var(37)
triggerall = enemynear, StateNo != var(39)
triggerall = enemynear, StateNo != var(41)
triggerall = enemynear, StateNo != var(43)
triggerall = enemynear, StateNo != var(45)
triggerall = enemynear, StateNo != var(47)
triggerall = enemynear, StateNo != var(49)
triggerall = enemynear, StateNo != var(51)
trigger1 = var(53) = 0
V = 53
Value  = (enemynear, StateNo)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = var(52)
trigger1 = var(53) != 0
trigger1 = var(54) = 0
trigger1 = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
V= 54
Value = (enemynear, Time)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = enemynear, StateNo >= 200 && enemynear,MoveType=A
triggerall = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
triggerall = var(53)
triggerall = enemynear, StateNo != var(1)
triggerall = enemynear, StateNo != var(3)
triggerall = enemynear, StateNo != var(5)
triggerall = enemynear, StateNo != var(7)
triggerall = enemynear, StateNo != var(9)
triggerall = enemynear, StateNo != var(11)
triggerall = enemynear, StateNo != var(13)
triggerall = enemynear, StateNo != var(15)
triggerall = enemynear, StateNo != var(17)
triggerall = enemynear, StateNo != var(19)
triggerall = enemynear, StateNo != var(21)
triggerall = enemynear, StateNo != var(23)
triggerall = enemynear, StateNo != var(25)
triggerall = enemynear, StateNo != var(27)
triggerall = enemynear, StateNo != var(29)
triggerall = enemynear, StateNo != var(31)
triggerall = enemynear, StateNo != var(33)
triggerall = enemynear, StateNo != var(35)
triggerall = enemynear, StateNo != var(37)
triggerall = enemynear, StateNo != var(39)
triggerall = enemynear, StateNo != var(41)
triggerall = enemynear, StateNo != var(43)
triggerall = enemynear, StateNo != var(45)
triggerall = enemynear, StateNo != var(47)
triggerall = enemynear, StateNo != var(49)
triggerall = enemynear, StateNo != var(51)
triggerall = enemynear, StateNo != var(53)
trigger1 = var(55) = 0
V = 55
Value  = (enemynear, StateNo)
IgnoreHitPause = 1

[State 999]
type = varset
triggerall = var(54)
trigger1 = var(55) != 0
trigger1 = var(56) = 0
trigger1 = enemynear,MoveContact || root,MOVETYPE = H && root,HitShakeOver = 0
V= 56
Value = (enemynear, Time)
IgnoreHitPause = 1

[State 10000,]
Type = DestroySelf
trigger1 = (root,stateno = [358000,358006])|| root,alive = 0 || (root,prevstateno = [358000,358006]) || (root,stateno = [8900,8903])

[State -2, ??]
type= DisplaytoClipboard;
trigger1= 1
text="var(1): %d | var(2): %d | var(3): %d | var(4): %d| var(5): %d| var(6): %d"
params= var(1),var(2),var(3),var(4),var(5),var(6)

;-------------------------------------------------------------------------------
[StateDef 35002]
anim = 9999
ctrl = 0

[State 35002]
type = nothitby
trigger1 = 1
value = sca

[State 35002]
type = selfstate
trigger1 = !ishelper
value = 0

[State 0]
Type = Null
Triggerall = !Time
Trigger1 = var(1) := -8
Trigger1 = var(2) := -8
Trigger1 = var(3) := -8
Trigger1 = var(4) := -8
Trigger1 = var(5) := -8
Trigger1 = var(6) := -8
Trigger1 = var(7) := -8
Trigger1 = var(8) := -8
Trigger1 = var(9) := -8
Trigger1 = var(10) := -8
Trigger1 = var(11) := -8
Trigger1 = var(12) := -8
Trigger1 = var(13) := -8
Trigger1 = var(14) := -8
Trigger1 = var(15) := -8
Trigger1 = var(16) := -8
Trigger1 = var(17) := -8
Trigger1 = var(18) := -8
Trigger1 = var(19) := -8
Trigger1 = var(20) := -8
IgnoreHitPause = 1

[State 0]
Type = Null
Triggerall = Numenemy = 2
Triggerall = EnemyNear(var(0)),Alive = 0
Trigger1 = var(1) := -8
Trigger1 = var(2) := -8
Trigger1 = var(3) := -8
Trigger1 = var(4) := -8
Trigger1 = var(5) := -8
Trigger1 = var(6) := -8
Trigger1 = var(7) := -8
Trigger1 = var(8) := -8
Trigger1 = var(9) := -8
Trigger1 = var(10) := -8
Trigger1 = var(11) := -8
Trigger1 = var(12) := -8
Trigger1 = var(13) := -8
Trigger1 = var(14) := -8
Trigger1 = var(15) := -8
Trigger1 = var(16) := -8
Trigger1 = var(17) := -8
Trigger1 = var(18) := -8
Trigger1 = var(19) := -8
Trigger1 = var(20) := -8
IgnoreHitPause = 1

[State 0, 9]
type = Null
trigger1 = !InGuardDist || (Enemy(0),numproj = 0 && Enemy(1),numproj = 0)
trigger1 = var(58) := 0
trigger2 = InGuardDist
trigger2 = Enemy(0),numproj = 1 || Enemy(1),numproj = 1
trigger2 = var(58) := 1
trigger3 = (Enemy(0),numproj = [2,4]) || (Enemy(1),numproj = [2,4])
trigger3 = var(58) := 2
trigger4 = Enemy(0),numproj > 4 || Enemy(1),numproj > 4
trigger4 = var(58) := 3
IgnoreHitPause = 1

;-----------------------------------------------------------------------------
;??受身?? 
;-----------------------------------------------------------------------------

[State -1, VarSet]
Type = Varset
triggerall = var(57) = 0
trigger1 = enemynear(var(0)),PREVSTATENO >= 5000
trigger1 = enemynear(var(0)),pos y = 0
trigger1 = enemynear(var(0)),STATENO != [5000,5200)
trigger1 = enemynear(var(0)),vel x != 0
V = 57
Value = 1
IgnoreHitPause = 1

[State -1, VarSet]
Type = Varset
triggerall = var(57) = 1
trigger1 = enemynear(var(0)),STATENO = [5000,5200)
trigger2 = enemynear(var(0)),anim = [5000,5200)
trigger3 = enemynear(var(0)),CTRL
V = 57
Value = 0
IgnoreHitPause = 1


[State -1, VarSet]
Type = Varadd
;trigger1 = (enemynear(var(0)),stateno = [5200,5299]) || (enemynear(var(0)),stateno = [52000,52999]) || (enemynear(var(0)),stateno = [0,999])
trigger1 = VAR(57) = 1
trigger1 = enemynear(var(0)),movetype = I || enemynear(var(0)),movetype = H
V = 56
Value = 1
IgnoreHitPause = 1

[State -1, VarSet]
Type = Varset
triggerall = var(56) > 0;var(55) = 0
trigger1 = enemynear(var(0)),CTRL ;&& (enemynear(var(0)),stateno != [5200,5299]) && (enemynear(var(0)),stateno != [52000,52999]) && (enemynear(var(0)),stateno != [0,999])
V = 55
Value = var(56)
IgnoreHitPause = 1

[State -1, VarSet]
Type = varset;varset
triggerall = var(56) > 0
trigger1 = enemynear(var(0)),CTRL ;&& (enemynear(var(0)),stateno != [5200,5299]) && (enemynear(var(0)),stateno != [52000,52999]) && (enemynear(var(0)),stateno != [0,999])
V = 56
Value = 0
IgnoreHitPause = 1


[State -1, VarSet]
Type = Varadd
triggerall = var(55) > 0
trigger1 = VAR(57) = 1
trigger1 = enemynear(var(0)),movetype = I || enemynear(var(0)),movetype = H
V = 55
Value = -1
IgnoreHitPause = 1
;-----------------------------------------------------------------------------

[State -1, ヒット確認]
type = VarSet
triggerall = var(54) = 0
triggerall = enemynear(var(0)),movetype = H
trigger1 = root,stateno = 1615 && ROOT,movehit
trigger2 = root,stateno = 1620 && ROOT,movehit
trigger3 = root,stateno = 1950 && ROOT,movehit && ROOT,time = 14 && random <= 300
trigger4 = root,stateno = 1320 && ROOT,movehit
trigger5 = root,stateno = 2150 && ROOT,movehit
trigger6 = root,stateno = 215 && ROOT,movehit
trigger7 = root,stateno = 1800 && ROOT,movehit = 1 && root,var(50) = 2 && random <= 300
trigger8 = root,stateno = 1201 && ROOT,movehit && root,var(50) = 2
trigger9 = root,stateno = 1600 && ROOT,movehit && root,var(50) = 19 && root,var(40) = 0
var(54) = ifelse(random <= 500,1,2)

[State -1, Hitr];リセット
type = VarSet
triggerall = var(54)
trigger1 = enemynear(var(0)),movetype = A ;|| stateno = 2600
trigger2 = enemynear(var(0)),stateno = [0,159]
trigger3 = enemynear(var(0)),ctrl=1
trigger4 = roundstate != 2
trigger5 = (root,stateno = [8900,8999])
trigger6 = root,stateno = 3800 
trigger7 = root,stateno = 1700 && ROOT,movehit
trigger8 = root,stateno = 2101 && ROOT,movehit
trigger9 = root,stateno = 645 && ROOT,movehit
trigger10 = root,stateno = 1210 && ROOT,movehit
trigger11 = root,stateno = 1200 && ROOT,var(50) = 2
trigger12 = root,stateno = 2101 && ROOT,var(41) < 150
trigger13 = root,stateno = 1200
var(54) = 0

;-----------------------------------------------------------------------------
;??起身??
;-----------------------------------------------------------------------------
[State -1, VarSet]
Type = Varadd
trigger1 = root,var(50) = 21
trigger1 = enemynear(var(0)),stateno = [5110,5120]
trigger1 = enemynear(var(0)),statetype = L
V = 53
Value = 1
IgnoreHitPause = 1

[State -1, VarSet]
Type = Varset
triggerall = var(53) > 0
trigger1 = enemynear(var(0)),statetype != L && (enemynear(var(0)),stateno != [5110,5120])
V = 52
Value = var(53)
IgnoreHitPause = 1

[State -1, VarSet]
Type = varset;varset
triggerall = var(53) > 0
trigger1 = enemynear(var(0)),statetype != L
V = 53
Value = 0
IgnoreHitPause = 1


[State -1, VarSet]
Type = Varadd
trigger1 = root,var(50) = 21
triggerall = var(52) > 0
trigger1 = enemynear(var(0)),stateno >= 5110
trigger1 = enemynear(var(0)),statetype = L
V = 52
Value = -1
IgnoreHitPause = 1

;打逆??-----------------------------------------------------------------------------

[State -1, ヒット確認]
type = VarSet
trigger1 = root,TIME = 1 && (root,STATENO = 50 || root,STATENO = 61)
var(51) = 1 + (random % 2)

;-----------------------------------------------------------------------------
;??跳?被打血量

[state -2]
type = null
Trigger1 = VAR(48) = 0
Trigger1 = ROOT,HitShakeOver = 0
Trigger1 = ROOT,time = 1
Trigger1 = ROOT,stateno != [120,159]
Trigger1 = var(48):= IFELSE(ROOT,StateType = A && root,pos y < -10,1,2)
Trigger1 = 0
Trigger2 = ROOT,MOVETYPE = H
Trigger2 = var(48) = 1 || var(43) > 0
Trigger2 = var(49):= VAR(50) - ROOT,LIFE
Trigger2 = 0
Trigger3 = ROOT,MOVETYPE != H
Trigger3 = var(48) = 0
Trigger3 = var(50):= ROOT,LIFE
Trigger3 = 0
Trigger4 = ROOT,MOVETYPE != H
Trigger4 = var(48) > 0
Trigger4 = ROOT,stateno < 5000
Trigger4 = var(48):= 0
Trigger4 = 0

;-----------------------------------------------------------------------------
;?行道具被打血量
[state -2]
type = null
;Trigger1 = VAR(43) = 0
Trigger1 = (ROOT,stateno = [1000,1010]) && ROOT,TIME = 1 || (ROOT,stateno = [1600,1700]) && ROOT,TIME = 1|| (ROOT,stateno = [1300,1320]) && ROOT,TIME = 1 || ROOT,stateno = 1110 && ROOT,TIME = 10
Trigger1 = var(43):= ifelse((ROOT,stateno = [1000,1010]),40,ifelse((ROOT,stateno = [1600,1700]),40,ifelse(ROOT,stateno = 1110,38,43)))
Trigger1 = 0
Trigger2 = VAR(43) > 0
Trigger2 = gametime % 1 = 0
Trigger2 = ROOT,MOVETYPE != H && enemynear(0),HitShakeOver = 1
Trigger2 = var(43):= var(43) - 1
Trigger2 = 0
Trigger3 = VAR(43) < 0
Trigger3 = var(43):= 0
Trigger3 = 0
Trigger4 = VAR(43) > 0
Trigger4 = root,anim = 5040 && root,time = 1 || root,anim = 5120 && root,time = 1 || root,anim = 5120 && root,time = 1 || root,anim = 5201 && root,time = 1 || root,anim = 5150 && root,time = 1
Trigger4 = var(42):= var(42) + var(49)
Trigger4 = 0
Trigger5 = gametime % 5 = 0 && enemynear(var(58)),statetype != L
Trigger5 = var(42) > 0
Trigger5 = root,STATENO < 5000 && root,MOVETYPE != H
Trigger5 = var(42):= var(42) - ifelse(enemynear(0),MOVEtype = H && gametime % 10 = 0,5,1)
Trigger5 = 0
Trigger6 = VAR(42) < 0
Trigger6 = var(42):= 0
Trigger6 = 0

;?人速度?整-----------------------------------------------------------------------------

[State 0, VarSet]
type = VarSet
triggerall = var(47) = 0 
trigger1 = root,stateno = 358003 && root,time = 1
trigger2 = root,prevstateno = 358003 && root,time = 1
v = 47
value = root,vel x
IgnoreHitPause = 1

[State 0, VarSet]
type = VarSet
triggerall = var(47) > 0 
trigger1 = root,statetype != A
v = 47
value = 0
IgnoreHitPause = 1

;?策---------------------------------------------------------------------------------

[State 0, VarSet]
type = VarSet
Trigger1 = RoundState = 2
trigger1 = p2name = "Orochi Eagrose Version" || p2name = "Orochi-EV"
v = 46   
value = EnemyNear(var(0)),fvar(5)

;起身限制-----------------------------------------------------------------------

[State -1, ヒット確認]
type = VarSet
triggerall = var(45) = 0
trigger1 = root,statetype = L
var(45) = 30

[State -1, ヒット確認]
type = Varadd
triggerall = var(45) > 0
trigger1 = root,statetype != L
var(45) = -1

;??被打----------------------------------------------------------------------------------------------

[State -1, ?乕?????]
type = Null
TriggerAll = RoundState=2
Trigger1 = enemynear(var(0)),MoveContact = 1 || enemynear(var(0)),ProjContactTime(0) = 1 || helper(24000 + root,id),var(1) > 0
Trigger1 = ROOT,HitShakeOver = 0 || partner,HitShakeOver = 0
Trigger1 = ROOT,STATETYPE != L && ROOT,STATENO < 358000 || ROOT,STATETYPE != L && partner,STATETYPE != L
Trigger1 = ROOT,MOVETYPE = H && ROOT,TIME = 1 || partner,MOVETYPE = H && partner,TIME = 1
Trigger1 = var(40):=1+var(40)
Trigger1 = 0
Trigger2 = ROOT,HitShakeOver = 1 || (ROOT,HitShakeOver = 1 && partner,HitShakeOver = 1)
Trigger2 = var(40) >= 1
trigger2 = gametime % IFELSE(enemynear(var(0)),MOVETYPE = H,10,20) = 0
Trigger2 = ROOT,MOVETYPE = A && TeamMode = single || (ROOT,MOVETYPE = A || partner,MOVETYPE = A)
Trigger2 = ROOT,MOVETYPE != H && TeamMode = single || ROOT,MOVETYPE != H && partner,MOVETYPE != H 
Trigger2 = ROOT,STATETYPE != L && TeamMode = single || ROOT,STATETYPE != L && partner,STATETYPE != L
Trigger2 = var(40):=var(40) - 1
Trigger2 = 0
Trigger3 = var(40) < 0
Trigger3 = var(40):= 0
Ignorehitpause=1

;-----------------------------------------------------------------------------------------
[State 0, 0]
Type = VarSet
trigger1 = var(0) != Root,var(58)
var(0) = Root,var(58)

[State 0, 1]
Type = VarSet
Trigger1 = EnemyNear(var(0)),NumProj = 1 
Trigger1 = EnemyNear(var(0)),Ctrl = 0
Trigger1 = EnemyNear(var(0)),MoveType = A
Trigger2 = helper(24000 + root,id),var(57) > 0
Trigger2 = EnemyNear(var(0)),Ctrl = 0
Trigger2 = helper(24000 + root,id),var(57) = 4
Triggerall = Helper(35002),var(1) = -8
Triggerall = EnemyNear(var(0)),StateNo >= 1000
var(1) = EnemyNear(var(0)),StateNo
IgnoreHitPause = 1

[State 0, 2]
Type = VarSet
Trigger1 = EnemyNear(var(0)),NumProj = 1
Trigger1 = EnemyNear(var(0)),Ctrl = 0
Trigger1 = EnemyNear(var(0)),MoveType = A
Trigger2 = helper(24000 + root,id),var(57) > 0
Trigger2 = EnemyNear(var(0)),Ctrl = 0
Trigger2 = helper(24000 + root,id),var(57) = 4
Triggerall = EnemyNear(var(0)),StateNo >= 1000
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(1)
Triggerall = Helper(35002),var(1) != -8
Triggerall = Helper(35002),var(2)  = -8
var(2) = EnemyNear(var(0)),StateNo
IgnoreHitPause = 1

[State 0, 3]
Type = VarSet
Trigger1 = EnemyNear(var(0)),NumProj = 1
Trigger1 = EnemyNear(var(0)),Ctrl = 0
Trigger1 = EnemyNear(var(0)),MoveType = A
Trigger2 = helper(24000 + root,id),var(57) > 0
Trigger2 = EnemyNear(var(0)),Ctrl = 0
Trigger2 = helper(24000 + root,id),var(57) = 4
Triggerall = EnemyNear(var(0)),StateNo >= 1000
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(1)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(2)
Triggerall = Helper(35002),var(1) != -8
Triggerall = Helper(35002),var(2) != -8
Triggerall = Helper(35002),var(3)  = -8
var(3) = EnemyNear(var(0)),StateNo
IgnoreHitPause = 1

[State 0, 4]
Type = VarSet
Trigger1 = EnemyNear(var(0)),NumProj = 1
Trigger1 = EnemyNear(var(0)),Ctrl = 0
Trigger1 = EnemyNear(var(0)),MoveType = A
Trigger2 = helper(24000 + root,id),var(57) > 0
Trigger2 = EnemyNear(var(0)),Ctrl = 0
Trigger2 = helper(24000 + root,id),var(57) = 4
Triggerall = EnemyNear(var(0)),StateNo >= 1000
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(1)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(2)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(3)
Triggerall = Helper(35002),var(1) != -8
Triggerall = Helper(35002),var(2) != -8
Triggerall = Helper(35002),var(3) != -8
Triggerall = Helper(35002),var(4)  = -8
var(4) = EnemyNear(var(0)),StateNo
IgnoreHitPause = 1

[State 0, 4]
Type = VarSet
Trigger1 = EnemyNear(var(0)),NumProj = 1
Trigger1 = EnemyNear(var(0)),Ctrl = 0
Trigger1 = EnemyNear(var(0)),MoveType = A
Trigger2 = helper(24000 + root,id),var(57) > 0
Trigger2 = EnemyNear(var(0)),Ctrl = 0
Trigger2 = helper(24000 + root,id),var(57) = 4
Triggerall = EnemyNear(var(0)),StateNo >= 1000
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(1)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(2)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(3)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(4)
Triggerall = Helper(35002),var(1) != -8
Triggerall = Helper(35002),var(2) != -8
Triggerall = Helper(35002),var(3) != -8
Triggerall = Helper(35002),var(4) != -8
Triggerall = Helper(35002),var(5) = -8
var(5) = EnemyNear(var(0)),StateNo
IgnoreHitPause = 1

[State 0, 4]
Type = VarSet
Trigger1 = EnemyNear(var(0)),NumProj = 1 
Trigger1 = EnemyNear(var(0)),Ctrl = 0
Trigger1 = EnemyNear(var(0)),MoveType = A
Trigger2 = helper(24000 + root,id),var(57) > 0
Trigger2 = EnemyNear(var(0)),Ctrl = 0
Trigger2 = helper(24000 + root,id),var(57) = 4
Triggerall = EnemyNear(var(0)),StateNo >= 1000
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(1)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(2)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(3)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(4)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(5)
Triggerall = Helper(35002),var(1) != -8
Triggerall = Helper(35002),var(2) != -8
Triggerall = Helper(35002),var(3) != -8
Triggerall = Helper(35002),var(4) != -8
Triggerall = Helper(35002),var(5) != -8
Triggerall = Helper(35002),var(6) = -8
var(6) = EnemyNear(var(0)),StateNo
IgnoreHitPause = 1

[State 0, 4]
Type = VarSet
Trigger1 = EnemyNear(var(0)),NumProj = 1
Trigger1 = EnemyNear(var(0)),Ctrl = 0
Trigger1 = EnemyNear(var(0)),MoveType = A
Trigger2 = helper(24000 + root,id),var(57) > 0
Trigger2 = EnemyNear(var(0)),Ctrl = 0
Trigger2 = helper(24000 + root,id),var(57) = 4
Triggerall = EnemyNear(var(0)),StateNo >= 1000
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(1)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(2)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(3)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(4)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(5)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(6)
Triggerall = Helper(35002),var(1) != -8
Triggerall = Helper(35002),var(2) != -8
Triggerall = Helper(35002),var(3) != -8
Triggerall = Helper(35002),var(4) != -8
Triggerall = Helper(35002),var(5) != -8
Triggerall = Helper(35002),var(6) != -8
Trigger1 = Helper(35002),var(7) = -8
var(7) = EnemyNear(var(0)),StateNo
IgnoreHitPause = 1

[State 0, 4]
Type = VarSet
Trigger1 = EnemyNear(var(0)),NumProj = 1 
Trigger1 = EnemyNear(var(0)),Ctrl = 0
Trigger1 = EnemyNear(var(0)),MoveType = A
Trigger2 = helper(24000 + root,id),var(57) > 0
Trigger2 = EnemyNear(var(0)),Ctrl = 0
Trigger2 = helper(24000 + root,id),var(57) = 4
Triggerall = EnemyNear(var(0)),StateNo >= 1000
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(1)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(2)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(3)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(4)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(5)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(6)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(7)
Triggerall = Helper(35002),var(1) != -8
Triggerall = Helper(35002),var(2) != -8
Triggerall = Helper(35002),var(3) != -8
Triggerall = Helper(35002),var(4) != -8
Triggerall = Helper(35002),var(5) != -8
Triggerall = Helper(35002),var(6) != -8
Triggerall = Helper(35002),var(7) != -8
Triggerall = Helper(35002),var(8) = -8
var(8) = EnemyNear(var(0)),StateNo
IgnoreHitPause = 1

[State 0, 4]
Type = VarSet
Trigger1 = EnemyNear(var(0)),NumProj = 1 
Trigger1 = EnemyNear(var(0)),Ctrl = 0
Trigger1 = EnemyNear(var(0)),MoveType = A
Trigger2 = helper(24000 + root,id),var(57) > 0
Trigger2 = EnemyNear(var(0)),Ctrl = 0
Trigger2 = helper(24000 + root,id),var(57) = 4
Triggerall = EnemyNear(var(0)),StateNo >= 1000
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(1)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(2)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(3)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(4)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(5)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(6)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(7)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(8)
Triggerall = Helper(35002),var(1) != -8
Triggerall = Helper(35002),var(2) != -8
Triggerall = Helper(35002),var(3) != -8
Triggerall = Helper(35002),var(4) != -8
Triggerall = Helper(35002),var(5) != -8
Triggerall = Helper(35002),var(6) != -8
Triggerall = Helper(35002),var(7) != -8
Triggerall = Helper(35002),var(8) != -8
Triggerall = Helper(35002),var(9) = -8
var(9) = EnemyNear(var(0)),StateNo
IgnoreHitPause = 1

[State 0, 4]
Type = VarSet
Trigger1 = EnemyNear(var(0)),NumProj = 1 
Trigger1 = EnemyNear(var(0)),Ctrl = 0
Trigger1 = EnemyNear(var(0)),MoveType = A
Trigger2 = helper(24000 + root,id),var(57) > 0
Trigger2 = EnemyNear(var(0)),Ctrl = 0
Trigger2 = helper(24000 + root,id),var(57) = 4
Triggerall = EnemyNear(var(0)),StateNo >= 1000
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(1)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(2)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(3)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(4)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(5)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(6)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(7)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(8)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(9)
Triggerall = Helper(35002),var(1) != -8
Triggerall = Helper(35002),var(2) != -8
Triggerall = Helper(35002),var(3) != -8
Triggerall = Helper(35002),var(4) != -8
Triggerall = Helper(35002),var(5) != -8
Triggerall = Helper(35002),var(6) != -8
Triggerall = Helper(35002),var(7) != -8
Triggerall = Helper(35002),var(8) != -8
Triggerall = Helper(35002),var(9) != -8
Triggerall = Helper(35002),var(10) = -8
var(10) = EnemyNear(var(0)),StateNo
IgnoreHitPause = 1

[State 0, 4]
Type = VarSet
Trigger1 = EnemyNear(var(0)),NumProj = 1 
Trigger1 = EnemyNear(var(0)),Ctrl = 0
Trigger1 = EnemyNear(var(0)),MoveType = A
Trigger2 = helper(24000 + root,id),var(57) > 0
Trigger2 = EnemyNear(var(0)),Ctrl = 0
Trigger2 = helper(24000 + root,id),var(57) = 4
Triggerall = EnemyNear(var(0)),StateNo >= 1000
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(1)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(2)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(3)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(4)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(5)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(6)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(7)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(8)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(9)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(10)
Triggerall = Helper(35002),var(1) != -8
Triggerall = Helper(35002),var(2) != -8
Triggerall = Helper(35002),var(3) != -8
Triggerall = Helper(35002),var(4) != -8
Triggerall = Helper(35002),var(5) != -8
Triggerall = Helper(35002),var(6) != -8
Triggerall = Helper(35002),var(7) != -8
Triggerall = Helper(35002),var(8) != -8
Triggerall = Helper(35002),var(9) != -8
Triggerall = Helper(35002),var(10)!= -8
Triggerall = Helper(35002),var(11) = -8
var(11) = EnemyNear(var(0)),StateNo
IgnoreHitPause = 1

[State 0, 4]
Type = VarSet
Trigger1 = EnemyNear(var(0)),NumProj = 1 
Trigger1 = EnemyNear(var(0)),Ctrl = 0
Trigger1 = EnemyNear(var(0)),MoveType = A
Trigger2 = helper(24000 + root,id),var(57) > 0
Trigger2 = EnemyNear(var(0)),Ctrl = 0
Trigger2 = helper(24000 + root,id),var(57) = 4
Triggerall = EnemyNear(var(0)),StateNo >= 1000
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(1)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(2)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(3)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(4)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(5)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(6)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(7)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(8)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(9)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(10)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(11)
Triggerall = Helper(35002),var(1) != -8
Triggerall = Helper(35002),var(2) != -8
Triggerall = Helper(35002),var(3) != -8
Triggerall = Helper(35002),var(4) != -8
Triggerall = Helper(35002),var(5) != -8
Triggerall = Helper(35002),var(6) != -8
Triggerall = Helper(35002),var(7) != -8
Triggerall = Helper(35002),var(8) != -8
Triggerall = Helper(35002),var(9) != -8
Triggerall = Helper(35002),var(10) != -8
Triggerall = Helper(35002),var(11) != -8
Triggerall = Helper(35002),var(12) = -8
var(12) = EnemyNear(var(0)),StateNo
IgnoreHitPause = 1

[State 0, 4]
Type = VarSet
Trigger1 = EnemyNear(var(0)),NumProj = 1 
Trigger1 = EnemyNear(var(0)),Ctrl = 0
Trigger1 = EnemyNear(var(0)),MoveType = A
Trigger2 = helper(24000 + root,id),var(57) > 0
Trigger2 = EnemyNear(var(0)),Ctrl = 0
Trigger2 = helper(24000 + root,id),var(57) = 4
Triggerall = EnemyNear(var(0)),StateNo >= 1000
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(1)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(2)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(3)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(4)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(5)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(6)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(7)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(8)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(9)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(10)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(11)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(12)
Triggerall = Helper(35002),var(1) != -8
Triggerall = Helper(35002),var(2) != -8
Triggerall = Helper(35002),var(3) != -8
Triggerall = Helper(35002),var(4) != -8
Triggerall = Helper(35002),var(5) != -8
Triggerall = Helper(35002),var(6) != -8
Triggerall = Helper(35002),var(7) != -8
Triggerall = Helper(35002),var(8) != -8
Triggerall = Helper(35002),var(9) != -8
Triggerall = Helper(35002),var(10) != -8
Triggerall = Helper(35002),var(11) != -8
Triggerall = Helper(35002),var(12) != -8
Triggerall = Helper(35002),var(13) = -8
var(13) = EnemyNear(var(0)),StateNo
IgnoreHitPause = 1

[State 0, 4]
Type = VarSet
Trigger1 = EnemyNear(var(0)),NumProj = 1 
Trigger1 = EnemyNear(var(0)),Ctrl = 0
Trigger1 = EnemyNear(var(0)),MoveType = A
Trigger2 = helper(24000 + root,id),var(57) > 0
Trigger2 = EnemyNear(var(0)),Ctrl = 0
Trigger2 = helper(24000 + root,id),var(57) = 4
Triggerall = EnemyNear(var(0)),StateNo >= 1000
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(1)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(2)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(3)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(4)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(5)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(6)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(7)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(8)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(9)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(10)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(11)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(12)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(13)
Triggerall = Helper(35002),var(1) != -8
Triggerall = Helper(35002),var(2) != -8
Triggerall = Helper(35002),var(3) != -8
Triggerall = Helper(35002),var(4) != -8
Triggerall = Helper(35002),var(5) != -8
Triggerall = Helper(35002),var(6) != -8
Triggerall = Helper(35002),var(7) != -8
Triggerall = Helper(35002),var(8) != -8
Triggerall = Helper(35002),var(9) != -8
Triggerall = Helper(35002),var(10) != -8
Triggerall = Helper(35002),var(11) != -8
Triggerall = Helper(35002),var(12) != -8
Triggerall = Helper(35002),var(13) != -8
Triggerall = Helper(35002),var(14) = -8
var(14) = EnemyNear(var(0)),StateNo
IgnoreHitPause = 1

[State 0, 4]
Type = VarSet
Trigger1 = EnemyNear(var(0)),NumProj = 1 
Trigger1 = EnemyNear(var(0)),Ctrl = 0
Trigger1 = EnemyNear(var(0)),MoveType = A
Trigger2 = helper(24000 + root,id),var(57) > 0
Trigger2 = EnemyNear(var(0)),Ctrl = 0
Trigger2 = helper(24000 + root,id),var(57) = 4
Triggerall = EnemyNear(var(0)),StateNo >= 1000
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(1)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(2)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(3)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(4)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(5)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(6)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(7)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(8)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(9)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(10)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(11)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(12)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(13)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(14)
Triggerall = Helper(35002),var(1) != -8
Triggerall = Helper(35002),var(2) != -8
Triggerall = Helper(35002),var(3) != -8
Triggerall = Helper(35002),var(4) != -8
Triggerall = Helper(35002),var(5) != -8
Triggerall = Helper(35002),var(6) != -8
Triggerall = Helper(35002),var(7) != -8
Triggerall = Helper(35002),var(8) != -8
Triggerall = Helper(35002),var(9) != -8
Triggerall = Helper(35002),var(10) != -8
Triggerall = Helper(35002),var(11) != -8
Triggerall = Helper(35002),var(12) != -8
Triggerall = Helper(35002),var(13) != -8
Triggerall = Helper(35002),var(14) != -8
Triggerall = Helper(35002),var(15) = -8
var(15) = EnemyNear(var(0)),StateNo
IgnoreHitPause = 1

[State 0, 4]
Type = VarSet
Trigger1 = EnemyNear(var(0)),NumProj = 1 
Trigger1 = EnemyNear(var(0)),Ctrl = 0
Trigger1 = EnemyNear(var(0)),MoveType = A
Trigger2 = helper(24000 + root,id),var(57) > 0
Trigger2 = EnemyNear(var(0)),Ctrl = 0
Trigger2 = helper(24000 + root,id),var(57) = 4
Triggerall = EnemyNear(var(0)),StateNo >= 1000
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(1)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(2)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(3)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(4)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(5)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(6)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(7)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(8)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(9)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(10)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(11)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(12)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(13)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(14)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(15)
Triggerall = Helper(35002),var(1) != -8
Triggerall = Helper(35002),var(2) != -8
Triggerall = Helper(35002),var(3) != -8
Triggerall = Helper(35002),var(4) != -8
Triggerall = Helper(35002),var(5) != -8
Triggerall = Helper(35002),var(6) != -8
Triggerall = Helper(35002),var(7) != -8
Triggerall = Helper(35002),var(8) != -8
Triggerall = Helper(35002),var(9) != -8
Triggerall = Helper(35002),var(10) != -8
Triggerall = Helper(35002),var(11) != -8
Triggerall = Helper(35002),var(12) != -8
Triggerall = Helper(35002),var(13) != -8
Triggerall = Helper(35002),var(14) != -8
Triggerall = Helper(35002),var(15) != -8
Triggerall = Helper(35002),var(16) = -8
var(16) = EnemyNear(var(0)),StateNo
IgnoreHitPause = 1

[State 0, 4]
Type = VarSet
Trigger1 = EnemyNear(var(0)),NumProj = 1 
Trigger1 = EnemyNear(var(0)),Ctrl = 0
Trigger1 = EnemyNear(var(0)),MoveType = A
Trigger2 = helper(24000 + root,id),var(57) > 0
Trigger2 = EnemyNear(var(0)),Ctrl = 0
Trigger2 = helper(24000 + root,id),var(57) = 4
Triggerall = EnemyNear(var(0)),StateNo >= 1000
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(1)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(2)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(3)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(4)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(5)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(6)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(7)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(8)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(9)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(10)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(11)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(12)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(13)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(14)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(15)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(16)
Triggerall = Helper(35002),var(1) != -8
Triggerall = Helper(35002),var(2) != -8
Triggerall = Helper(35002),var(3) != -8
Triggerall = Helper(35002),var(4) != -8
Triggerall = Helper(35002),var(5) != -8
Triggerall = Helper(35002),var(6) != -8
Triggerall = Helper(35002),var(7) != -8
Triggerall = Helper(35002),var(8) != -8
Triggerall = Helper(35002),var(9) != -8
Triggerall = Helper(35002),var(10) != -8
Triggerall = Helper(35002),var(11) != -8
Triggerall = Helper(35002),var(12) != -8
Triggerall = Helper(35002),var(13) != -8
Triggerall = Helper(35002),var(14) != -8
Triggerall = Helper(35002),var(15) != -8
Triggerall = Helper(35002),var(16) != -8
Triggerall = Helper(35002),var(17) = -8
var(17) = EnemyNear(var(0)),StateNo
IgnoreHitPause = 1

[State 0, 4]
Type = VarSet
Trigger1 = EnemyNear(var(0)),NumProj = 1 
Trigger1 = EnemyNear(var(0)),Ctrl = 0
Trigger1 = EnemyNear(var(0)),MoveType = A
Trigger2 = helper(24000 + root,id),var(57) > 0
Trigger2 = EnemyNear(var(0)),Ctrl = 0
Trigger2 = helper(24000 + root,id),var(57) = 4
Triggerall = EnemyNear(var(0)),StateNo >= 1000
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(1)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(2)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(3)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(4)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(5)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(6)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(7)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(8)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(9)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(10)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(11)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(12)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(13)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(14)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(15)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(16)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(17)
Triggerall = Helper(35002),var(1) != -8
Triggerall = Helper(35002),var(2) != -8
Triggerall = Helper(35002),var(3) != -8
Triggerall = Helper(35002),var(4) != -8
Triggerall = Helper(35002),var(5) != -8
Triggerall = Helper(35002),var(6) != -8
Triggerall = Helper(35002),var(7) != -8
Triggerall = Helper(35002),var(8) != -8
Triggerall = Helper(35002),var(9) != -8
Triggerall = Helper(35002),var(10) != -8
Triggerall = Helper(35002),var(11) != -8
Triggerall = Helper(35002),var(12) != -8
Triggerall = Helper(35002),var(13) != -8
Triggerall = Helper(35002),var(14) != -8
Triggerall = Helper(35002),var(15) != -8
Triggerall = Helper(35002),var(16) != -8
Triggerall = Helper(35002),var(17) != -8
Triggerall = Helper(35002),var(18) = -8
var(18) = EnemyNear(var(0)),StateNo
IgnoreHitPause = 1

[State 0, 4]
Type = VarSet
Trigger1 = EnemyNear(var(0)),NumProj = 1 
Trigger1 = EnemyNear(var(0)),Ctrl = 0
Trigger1 = EnemyNear(var(0)),MoveType = A
Trigger2 = helper(24000 + root,id),var(57) > 0
Trigger2 = EnemyNear(var(0)),Ctrl = 0
Trigger2 = helper(24000 + root,id),var(57) = 4
Triggerall = EnemyNear(var(0)),StateNo >= 1000
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(1)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(2)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(3)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(4)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(5)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(6)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(7)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(8)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(9)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(10)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(11)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(12)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(13)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(14)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(15)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(16)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(17)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(18)
Triggerall = Helper(35002),var(1) != -8
Triggerall = Helper(35002),var(2) != -8
Triggerall = Helper(35002),var(3) != -8
Triggerall = Helper(35002),var(4) != -8
Triggerall = Helper(35002),var(5) != -8
Triggerall = Helper(35002),var(6) != -8
Triggerall = Helper(35002),var(7) != -8
Triggerall = Helper(35002),var(8) != -8
Triggerall = Helper(35002),var(9) != -8
Triggerall = Helper(35002),var(10) != -8
Triggerall = Helper(35002),var(11) != -8
Triggerall = Helper(35002),var(12) != -8
Triggerall = Helper(35002),var(13) != -8
Triggerall = Helper(35002),var(14) != -8
Triggerall = Helper(35002),var(15) != -8
Triggerall = Helper(35002),var(16) != -8
Triggerall = Helper(35002),var(17) != -8
Triggerall = Helper(35002),var(18) != -8
Triggerall = Helper(35002),var(19) = -8
var(19) = EnemyNear(var(0)),StateNo
IgnoreHitPause = 1

[State 0, 4]
Type = VarSet
Trigger1 = EnemyNear(var(0)),NumProj = 1 
Trigger1 = EnemyNear(var(0)),Ctrl = 0
Trigger1 = EnemyNear(var(0)),MoveType = A
Trigger2 = helper(24000 + root,id),var(57) > 0
Trigger2 = EnemyNear(var(0)),Ctrl = 0
Trigger2 = helper(24000 + root,id),var(57) = 4
Triggerall = EnemyNear(var(0)),StateNo >= 1000
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(1)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(2)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(3)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(4)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(5)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(6)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(7)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(8)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(9)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(10)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(11)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(12)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(13)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(14)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(15)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(16)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(17)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(18)
Triggerall = EnemyNear(var(0)),StateNo != Helper(35002),var(19)
Triggerall = Helper(35002),var(1) != -8
Triggerall = Helper(35002),var(2) != -8
Triggerall = Helper(35002),var(3) != -8
Triggerall = Helper(35002),var(4) != -8
Triggerall = Helper(35002),var(5) != -8
Triggerall = Helper(35002),var(6) != -8
Triggerall = Helper(35002),var(7) != -8
Triggerall = Helper(35002),var(8) != -8
Triggerall = Helper(35002),var(9) != -8
Triggerall = Helper(35002),var(10) != -8
Triggerall = Helper(35002),var(11) != -8
Triggerall = Helper(35002),var(12) != -8
Triggerall = Helper(35002),var(13) != -8
Triggerall = Helper(35002),var(14) != -8
Triggerall = Helper(35002),var(15) != -8
Triggerall = Helper(35002),var(16) != -8
Triggerall = Helper(35002),var(17) != -8
Triggerall = Helper(35002),var(18) != -8
Triggerall = Helper(35002),var(19) != -8
Triggerall = Helper(35002),var(20) = -8
var(20) = EnemyNear(var(0)),StateNo
IgnoreHitPause = 1

[State 999]
type = null
trigger1 = var(21) < 200
trigger1 = root,stateno = 400 && root,time <= 4 || root,stateno = 500 && root,time <= 4 || root,stateno = 215 && root,time <= 5 || root,stateno = 305 && root,time <= 4 || root,stateno = 205 && root,time <= 3
trigger1 = var(21) := 1
trigger1 = 0
trigger2 = var(21) < 200
trigger2 = root,stateno = 400 && root,time > 4 || root,stateno = 500 && root,time > 4 || root,stateno = 215 && root,time > 5 || root,stateno = 305 && root,time > 4 || root,stateno = 205 && root,time > 3 || root,stateno = [0,159]
trigger2 = var(21) := 2
trigger2 = 0
trigger3 = EnemyNear(var(0)),StateNo >= 200 && EnemyNear(var(0)),MoveType=A && EnemyNear(var(0)),HitDefAttr = SCA,NT,ST,HT
trigger3 = var(21) = 1 && root,movetype = H && root,stateno != [120,159]
trigger3 = var(21) := EnemyNear(var(0)),StateNo
trigger3 = 0

[State 999]
type = null
trigger1 = var(21) >= 200 && var(22) < 200
trigger1 = root,stateno = 400 && root,time <= 4 || root,stateno = 500 && root,time <= 4 || root,stateno = 215 && root,time <= 5 || root,stateno = 305 && root,time <= 4 || root,stateno = 205 && root,time <= 3
trigger1 = var(22) := 1
trigger1 = 0
trigger2 = var(21) >= 200 && var(22) < 200
trigger2 = root,stateno = 400 && root,time > 4 || root,stateno = 500 && root,time > 4 || root,stateno = 215 && root,time > 5 || root,stateno = 305 && root,time > 4 || root,stateno = 205 && root,time > 3 || root,stateno = [0,159]
trigger2 = var(22) := 2
trigger2 = 0
trigger3 = EnemyNear(var(0)),StateNo >= 200 && EnemyNear(var(0)),MoveType=A && EnemyNear(var(0)),HitDefAttr = SCA,NT,ST,HT
trigger3 = var(22) = 1 && root,movetype = H && root,stateno != [120,159]
trigger3 = var(21) >= 200
trigger3 = EnemyNear(var(0)),StateNo != var(21)
trigger3 = var(22) := EnemyNear(var(0)),StateNo
trigger3 = 0

[State 999]
type = null
trigger1 = var(21) >= 200 && var(22) >= 200 && var(23) < 200
trigger1 = root,stateno = 400 && root,time <= 4 || root,stateno = 500 && root,time <= 4 || root,stateno = 215 && root,time <= 5 || root,stateno = 305 && root,time <= 4 || root,stateno = 205 && root,time <= 3
trigger1 = var(23) := 1
trigger1 = 0
trigger2 = var(21) >= 200 && var(22) >= 200 && var(23) < 200
trigger2 = root,stateno = 400 && root,time > 4 || root,stateno = 500 && root,time > 4 || root,stateno = 215 && root,time > 5 || root,stateno = 305 && root,time > 4 || root,stateno = 205 && root,time > 3 || root,stateno = [0,159]
trigger2 = var(23) := 2
trigger2 = 0
trigger3 = EnemyNear(var(0)),StateNo >= 200 && EnemyNear(var(0)),MoveType=A && EnemyNear(var(0)),HitDefAttr = SCA,NT,ST,HT
trigger3 = var(23) = 1 && root,movetype = H && root,stateno != [120,159]
trigger3 = var(21) >= 200 && var(22) >= 200
trigger3 = EnemyNear(var(0)),StateNo != var(21)
trigger3 = EnemyNear(var(0)),StateNo != var(22)
trigger3 = var(23) := EnemyNear(var(0)),StateNo
trigger3 = 0

[State 999]
type = null
trigger1 = var(21) >= 200 && var(22) >= 200 && var(23) >= 200 && var(24) < 200
trigger1 = root,stateno = 400 && root,time <= 4 || root,stateno = 500 && root,time <= 4 || root,stateno = 215 && root,time <= 5 || root,stateno = 305 && root,time <= 4 || root,stateno = 205 && root,time <= 3
trigger1 = var(24) := 1
trigger1 = 0
trigger2 = var(21) >= 200 && var(22) >= 200 && var(23) >= 200 && var(24) < 200
trigger2 = root,stateno = 400 && root,time > 4 || root,stateno = 500 && root,time > 4 || root,stateno = 215 && root,time > 5 || root,stateno = 305 && root,time > 4 || root,stateno = 205 && root,time > 3 || root,stateno = [0,159]
trigger2 = var(24) := 2
trigger2 = 0
trigger3 = EnemyNear(var(0)),StateNo >= 200 && EnemyNear(var(0)),MoveType=A && EnemyNear(var(0)),HitDefAttr = SCA,NT,ST,HT
trigger3 = var(24) = 1 && root,movetype = H
trigger3 = var(21) >= 200 && var(22) >= 200 && var(23) >= 200
trigger3 = EnemyNear(var(0)),StateNo != var(21)
trigger3 = EnemyNear(var(0)),StateNo != var(22)
trigger3 = EnemyNear(var(0)),StateNo != var(23)
trigger3 = var(24) := EnemyNear(var(0)),StateNo
trigger3 = 0

[State 999]
type = null
trigger1 = var(21) >= 200 && var(22) >= 200 && var(23) >= 200 && var(24) >= 200 && var(25) < 200
trigger1 = root,stateno = 400 && root,time <= 4 || root,stateno = 500 && root,time <= 4 || root,stateno = 215 && root,time <= 5 || root,stateno = 305 && root,time <= 4 || root,stateno = 205 && root,time <= 3
trigger1 = var(25) := 1
trigger1 = 0
trigger2 = var(21) >= 200 && var(22) >= 200 && var(23) >= 200 && var(24) >= 200 && var(25) < 200
trigger2 = root,stateno = 400 && root,time > 4 || root,stateno = 500 && root,time > 4 || root,stateno = 215 && root,time > 5 || root,stateno = 305 && root,time > 4 || root,stateno = 205 && root,time > 3 || root,stateno = [0,159]
trigger2 = var(25) := 2
trigger2 = 0
trigger3 = EnemyNear(var(0)),StateNo >= 200 && EnemyNear(var(0)),MoveType=A && EnemyNear(var(0)),HitDefAttr = SCA,NT,ST,HT
trigger3 = var(25) = 1 && root,movetype = H
trigger3 = var(21) >= 200 && var(22) >= 200 && var(23) >= 200 && var(24) >= 200
trigger3 = EnemyNear(var(0)),StateNo != var(21)
trigger3 = EnemyNear(var(0)),StateNo != var(22)
trigger3 = EnemyNear(var(0)),StateNo != var(23)
trigger3 = EnemyNear(var(0)),StateNo != var(24)
trigger3 = var(25) := EnemyNear(var(0)),StateNo
trigger3 = 0


[State 0, DisplayToClipBoard]
Type = DisplayToClipBoard
trigger1 = IsHelper
Text = "(10)=%d,(11)=%d,(50)=%d,(54)=%d,(57)=%d"
Params = var(10),var(11),var(50),var(54),var(57)
IgnoreHitPause = 1

[State 0, AppendToClipboard]
type = AppendToClipboard
trigger1 = IsHelper
text = "\n(1)=%d,(2)=%d,(3)=%d,(4)=%d,(5)=%d"
params = var(1),var(2),var(3),var(4),var(5)
ignorehitpause = 1

;-------------------------------------------------------------------------------

