
;---------------------------------------------------------------------------
; AI前ジャンプ
[Statedef 30]
type    = S
physics = S
anim = 40
ctrl = 0
sprpriority = 1

[State 40, NotHitBy]
type = NotHitBy
trigger1 = 1
value = , NT, ST, HT

[State 40, 2]
type = VarSet
trigger1 = 1
sysvar(1) = 1

[State 40, 1]
type = VarSet
trigger1 = 1
var(4) = -1

[State 40, 4]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = Var(4) = -1
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, 4];小ジャンプ
type = VelSet
trigger1 = AnimTime = 0
trigger1 = Var(4) = 1
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = -7

[State 40, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;---------------------------------------------------------------------------
;後ろジャンプ
[Statedef 31]
type    = S
physics = S
anim = 40
ctrl = 0
sprpriority = 1

[State 40, NotHitBy]
type = NotHitBy
trigger1 = 1
value = , NT, ST, HT

[State 40, 2]
type = VarSet
trigger1 = 1
sysvar(1) = -1

[State 40, 1]
type = VarSet
trigger1 = 1
var(4) = 0

[State 40, 4]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = Var(4) = 0
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, 4];小ジャンプ
type = VelSet
trigger1 = AnimTime = 0
trigger1 = Var(4) = 1
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = -7

[State 40, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;---------------------------------------------------------------------------
;前小ジャンプ
[Statedef 32]
type    = S
physics = S
anim = 40
ctrl = 0
sprpriority = 1

[State 40, NotHitBy]
type = NotHitBy
trigger1 = 1
value = , NT, ST, HT

[State 40, 2]
type = VarSet
trigger1 = 1
sysvar(1) = 1

[State 40, 1]
type = VarSet
trigger1 = 1
var(4) = 1

[State 40, 4]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = Var(4) = 0
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, 4];小ジャンプ
type = VelSet
trigger1 = AnimTime = 0
trigger1 = Var(4) = 1
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = -6.5

[State 40, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;---------------------------------------------------------------------------
;後ろ小ジャンプ
[Statedef 33]
type    = S
physics = S
anim = 40
ctrl = 0
sprpriority = 1

[State 40, NotHitBy]
type = NotHitBy
trigger1 = 1
value = , NT, ST, HT

[State 40, 2]
type = VarSet
trigger1 = 1
sysvar(1) = -1

[State 40, 1]
type = VarSet
trigger1 = 1
var(4) = 1

[State 40, 4]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = Var(4) = 0
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, 4];小ジャンプ
type = VelSet
trigger1 = AnimTime = 0
trigger1 = Var(4) = 1
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = -6.5;4.5

[State 40, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;---------------------------------------------------------------------------
;前中ジャンプ
[Statedef 34]
type    = S
physics = S
anim = 40
ctrl = 0
sprpriority = 1

[State 40, NotHitBy]
type = NotHitBy
trigger1 = 1
value = , NT, ST, HT

[State 40, 2]
type = VarSet
trigger1 = 1
sysvar(1) = 1

[State 40, 1]
type = VarSet
trigger1 = 1
var(4) = 1

[State 40, 4]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = Var(4) = 0
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, 4];小ジャンプ
type = VelSet
trigger1 = AnimTime = 0
trigger1 = Var(4) = 1
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = -6.5

[State 40, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;---------------------------------------------------------------------------
;後ろ中ジャンプ
[Statedef 35]
type    = S
physics = S
anim = 40
ctrl = 0
sprpriority = 1

[State 40, NotHitBy]
type = NotHitBy
trigger1 = 1
value = , NT, ST, HT

[State 40, 2]
type = VarSet
trigger1 = 1
sysvar(1) = -1

[State 40, 1]
type = VarSet
trigger1 = 1
var(4) = 2

[State 40, 4]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = Var(4) = 0
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, 4];小ジャンプ
type = VelSet
trigger1 = AnimTime = 0
trigger1 = Var(4) = 2
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = -6.5

[State 40, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;---------------------------------------------------------------------------
;前大ジャンプ
[Statedef 36]
type    = S
physics = S
anim = 40
ctrl = 0
sprpriority = 1

[State 40, NotHitBy]
type = NotHitBy
trigger1 = 1
value = , NT, ST, HT

[State 40, 2]
type = VarSet
trigger1 = 1
sysvar(1) = 1

[State 40, 1]
type = VarSet
trigger1 = 1
var(4) = 0

[State 40, 4]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = Var(4) = 0
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, 4];小ジャンプ
type = VelSet
trigger1 = AnimTime = 0
trigger1 = Var(4) = 1
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = -7

[State 40, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;---------------------------------------------------------------------------
;後ろ大ジャンプ
[Statedef 37]
type    = S
physics = S
anim = 40
ctrl = 0
sprpriority = 1

[State 40, NotHitBy]
type = NotHitBy
trigger1 = 1
value = , NT, ST, HT

[State 40, 2]
type = VarSet
trigger1 = 1
sysvar(1) = -1

[State 40, 1]
type = VarSet
trigger1 = 1
var(4) = 0

[State 40, 4]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = Var(4) = 0
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.runjump.back.x)))
y = const(velocity.jump.y)

[State 40, 4];小ジャンプ
type = VelSet
trigger1 = AnimTime = 0
trigger1 = Var(4) = 1
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = -7

[State 40, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;---------------------------------------------------------------------------
;上ジャンプ
[Statedef 38]
type    = S
physics = S
anim = 40
ctrl = 0
sprpriority = 1

[State 40, NotHitBy]
type = NotHitBy
trigger1 = 1
value = , NT, ST, HT

[State 40, 2]
type = VarSet
trigger1 = 1
sysvar(1) = 0

[State 40, 1]
type = VarSet
trigger1 = 1
var(4) = 0

[State 40, 4]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = Var(4) = 0
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = -7;-8;const(velocity.jump.y)

[State 40, 4];小ジャンプ
type = VelSet
trigger1 = AnimTime = 0
trigger1 = Var(4) = 1
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = -7

[State 40, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;---------------------------------------------------------------------------
;垂直小ジャンプ
[Statedef 39]
type    = S
physics = S
anim = 40
ctrl = 0
sprpriority = 1

[State 40, NotHitBy]
type = NotHitBy
trigger1 = 1
value = , NT, ST, HT

[State 40, 2]
type = VarSet
trigger1 = 1
sysvar(1) = 0

[State 40, 1]
type = VarSet
trigger1 = 1
var(4) = 1

[State 40, 4]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = Var(4) = 0
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, 4];小ジャンプ
type = VelSet
trigger1 = AnimTime = 0
trigger1 = Var(4) = 1
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = -6.5

[State 40, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;=================================================================================
; -3 主要是AI相关
;=================================================================================
[Statedef -3]

[State -3, 防御する必要がない状況] ;不需要防守的?候，?人死了，或者是不在guarddist内
Type = VarSet
TriggerAll = !IsHelper
Trigger1 = NumEnemy = 0
Trigger2 = !InGuardDist
var(48) = 0
IgnoreHitPause = 1

;中下段??
[State -3, 立ち] ;站防，用var(48) = 2来代替
Type = VarSet
TriggerAll =!IsHelper
TriggerAll = NumEnemy
TriggerAll = NumHelper(31000+ID)
TriggerAll = StateType != A
TriggerAll = EnemyNear(var(58)),StateNo != 0
Trigger1 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(10)
Trigger2 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(11)
Trigger3 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(12)
Trigger4 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(13)
Trigger5 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(14)
var(48) = 2
IgnoreHitPause = 1

[State -3, しゃがみ] ;蹲防，用var(48) = 1来代替
Type = VarSet
TriggerAll =!IsHelper
TriggerAll = NumEnemy
TriggerAll = NumHelper(31000+ID)
TriggerAll = StateType != A
TriggerAll = EnemyNear(var(58)),StateNo != 0
Trigger1 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(20)
Trigger2 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(21)
Trigger3 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(22)
Trigger4 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(23)
Trigger5 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(24)
var(48) = 1
IgnoreHitPause = 1

[State -3, 立ち]
Type = VarSet
TriggerAll =!IsHelper
TriggerAll = NumEnemy
TriggerAll = NumHelper(31000+ID)
TriggerAll = StateType != A
TriggerAll = EnemyNear(var(58)),StateNo != Helper(31000+ID),var(20) ;不能是被破防的招式
TriggerAll = EnemyNear(var(58)),StateNo != Helper(31000+ID),var(21)
TriggerAll = EnemyNear(var(58)),StateNo != Helper(31000+ID),var(22)
TriggerAll = EnemyNear(var(58)),StateNo != Helper(31000+ID),var(23)
TriggerAll = EnemyNear(var(58)),StateNo != Helper(31000+ID),var(24)
Trigger1 = EnemyNear(var(58)),StateType = A
Trigger2 = EnemyNear(var(58)),StateType = S
Trigger2 = EnemyNear(var(58)),Time > 11 && EnemyNear(var(58)),StateNo < 1000
Trigger2 =!EnemyNear(var(58)),NumProj
var(48) = 2
IgnoreHitPause = 1

[State -3, しゃがみ]
Type = VarSet;VarSet
TriggerAll =!IsHelper
TriggerAll = NumEnemy
TriggerAll = NumHelper(31000+ID)
TriggerAll = StateType != A
TriggerAll = EnemyNear(var(58)),StateNo != Helper(31000+ID),var(10)
TriggerAll = EnemyNear(var(58)),StateNo != Helper(31000+ID),var(11)
TriggerAll = EnemyNear(var(58)),StateNo != Helper(31000+ID),var(12)
TriggerAll = EnemyNear(var(58)),StateNo != Helper(31000+ID),var(13)
TriggerAll = EnemyNear(var(58)),StateNo != Helper(31000+ID),var(14)
Trigger1 = EnemyNear(var(58)),StateType = C
Trigger2 = EnemyNear(var(58)),StateType = S
Trigger2 = EnemyNear(var(58)),Time <= 11 || EnemyNear(var(58)),StateNo > 1000
Trigger2 =!EnemyNear(var(58)),NumProj
Trigger3 = EnemyNear(var(58)),StateType = S
Trigger3 = EnemyNear(var(58)),NumProj
var(48) = 1
IgnoreHitPause = 1

[State -3, 立ち]
Type = VarSet
TriggerAll =!IsHelper
TriggerAll = NumEnemy
TriggerAll = NumHelper(31000+ID)
TriggerAll = StateType != A
TriggerAll = MoveType != H
Trigger1 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(10) ;破防以后?一个段位??招式
Trigger2 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(11)
Trigger3 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(12)
Trigger4 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(13)
Trigger5 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(14)
var(48) = 2
IgnoreHitPause = 1

[State -3, しゃがみ]
Type = VarSet
TriggerAll =!IsHelper
TriggerAll = NumEnemy
TriggerAll = NumHelper(31000+ID)
TriggerAll = StateType != A
TriggerAll = MoveType != H
Trigger1 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(20)
Trigger2 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(21)
Trigger3 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(22)
Trigger4 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(23)
Trigger5 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(24)
var(48) = 1
IgnoreHitPause = 1

[State -1, FRoll]
type = ChangeState
value = 750
triggerall = var(59) 
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 
triggerall = enemynear(var(58)),time >= 0   
triggerall = statetype != A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),movetype != H
triggerall = enemynear(var(58)),StateNo >= 200
triggerall =!enemynear(var(58)),HitDefAttr = SCA, AT
triggerall = enemynear(var(58)),facing != facing
triggerall = InGuardDist
triggerall = ctrl || (stateno = [20,22]) || (stateno = [100,101]) || (stateno = [120,149])
trigger1 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(15)
trigger2 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(16)
trigger3 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(17)
trigger4 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(18)
trigger5 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(19)
trigger6 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(25)
trigger7 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(26)
trigger8 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(27)
trigger9 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(28)
trigger10 = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(29)


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

[State -3, AI起動ヘルパー]
type = Helper
triggerall = var(59) = 0
triggerall = RoundState = 2
trigger1 =!NumHelper(30000)
trigger1 =!IsHelper
trigger1 = roundstate <= 2 && alive
Trigger1 =!ctrl && stateno=0
helpertype = normal
name = "AI"
stateno = 30000
ID = 30000
pos = 0,0
keyctrl = 1
pausemovetime = 9999999
supermovetime = 9999999
persistent = 0


[State -3, ガードチェックヘルパー]
Type = Helper
triggerall = var(59) = 1
triggerall = !((stateno = [358000,358006]) || alive = 0 || (prevstateno = [358000,358006]) || (stateno = [8900,8903]))
triggerall = RoundState = 2
trigger1 =!NumHelper(31000+id)
trigger1 =!IsHelper
HelperType = Normal
Name = "Guard"
PosType = left
StateNo = 31000
ID = 31000+id
PauseMoveTime = 0
pos=0,9999
pausemovetime=2147483647
supermovetime=2147483647
persistent = 0
IgnoreHitPause = 1
KeyCtrl = 0
Ownpal = 1

[State -3, 飛び道具確認ヘルパー]
Type = Helper
triggerall = var(59) = 1
triggerall = RoundState = 2
triggerall = !((stateno = [358000,358006]) || alive = 0 || (prevstateno = [358000,358006]) || (stateno = [8900,8903]))
trigger1 =!NumHelper(32000)
trigger1 =!ishelper
HelperType = Normal
Name = "TOBIDOUGU"
StateNo = 32000
ID = 32000
Pos = 9999,9999
KeyCtrl = 0
persistent = 0
pausemovetime=2147483647
supermovetime=2147483647

[State -3, 飛び道具確認ヘルパー]
Type = Helper
triggerall = var(59) = 1
triggerall = RoundState = 2
triggerall = !((stateno = [358000,358006]) || alive = 0 || (prevstateno = [358000,358006]) || (stateno = [8900,8903]))
trigger1 =!NumHelper(32500)
trigger1 =!ishelper
HelperType = Normal
Name = "TOBIDOUGU ITI A"
StateNo = 32500
ID = 32500
Pos = 9999,9999
KeyCtrl = 0
persistent = 0
pausemovetime=2147483647
supermovetime=2147483647

[State -3, 飛び道具確認ヘルパー]
Type = Helper
triggerall = var(59) = 1
triggerall = RoundState = 2
triggerall = !((stateno = [358000,358006]) || alive = 0 || (prevstateno = [358000,358006]) || (stateno = [8900,8903]))
trigger1 =!NumHelper(32501)
trigger1 =!ishelper
HelperType = Normal
Name = "TOBIDOUGU ITI B"
StateNo = 32500
ID = 32501
Pos = 9999,9999
KeyCtrl = 0
persistent = 0
pausemovetime=2147483647
supermovetime=2147483647

[State -3, helper型?道?算]
Type = Helper
TriggerAll = !ishelper
triggerall = !((stateno = [358000,358006]) || alive = 0 || (prevstateno = [358000,358006]) || (stateno = [8900,8903]))
trigger1 = !NumHelper(24000 + id)
Name = "TRAP HELPER"
PosType = p1
StateNo = 24000
ID = 24000 + id
Pos = 0, 0
KeyCtrl = 0
Ownpal = 0
Persistent = 0
IgnoreHitPause = 1
PauseMoveTime = 9999999
SuperMoveTime = 9999999


[State -3]
type = Helper
triggerall = !((stateno = [358000,358006]) || alive = 0 || (prevstateno = [358000,358006]) || (stateno = [8900,8903]))
trigger1 = !numhelper(999)
helpertype = normal
name = "AIhelper"
ID = 999
stateno = 999
pos = 9999,9999
pausemovetime = 2147483647
supermovetime = 2147483647
persistent = 0

[State -3, 画面端検出ヘルパー]
Type = Helper
Trigger1 =!NumHelper(20000+ID)
Trigger1 =!IsHelper
HelperType = Normal
Name = "Edge of Stage Right"
PosType = P1
StateNo = 20000
ID = 20000+ID
PauseMoveTime = 0
Persistent = 0
IgnoreHitPause = 1
KeyCtrl = 0
Ownpal = 1

[State -3, 画面端検出ヘルパー]
Type = Helper
Trigger1 =!NumHelper(20001+ID)
Trigger1 =!IsHelper
HelperType = Normal
Name = "Edge of Stage Left"
PosType = P1
StateNo = 20001
ID = 20001+ID
PauseMoveTime = 0
Persistent = 0
IgnoreHitPause = 1
KeyCtrl = 0
Ownpal = 1

[State -3]
Type = HelPer
triggerall = !((stateno = [358000,358006]) || alive = 0 || (prevstateno = [358000,358006]) || (stateno = [8900,8903]))
triggerall = RoundState = 2
Trigger1 = !NumHelper(25000+ID)
HelPerType = normal
Name = "bullet"
StateNo = 25000
ID = 25000+ID
OwnPal = 1
pos = -70, 0
postype = p1
PauseMoveTime = 99999999
SuperMoveTime = 99999999
IgnoreHitPause = 1

[State -3]
Type = HelPer
triggerall = !((stateno = [358000,358006]) || alive = 0 || (prevstateno = [358000,358006]) || (stateno = [8900,8903]))
triggerall = RoundState = 2
Trigger1 = !NumHelper(26000+ID)
HelPerType = normal
Name = "mekuri"
StateNo = 26000
ID = 26000+ID
OwnPal = 1
pos = 70, 0
postype = p1
facing = -1
PauseMoveTime = 99999999
SuperMoveTime = 99999999
IgnoreHitPause = 1


[State -3, 当身検出ヘルパー]
Type = Helper
triggerall = !((stateno = [358000,358006]) || alive = 0 || (prevstateno = [358000,358006]) || (stateno = [8900,8903]))
triggerall = RoundState = 2
trigger1 =!NumHelper(33700+id)
trigger1 =!IsHelper
HelperType = Normal
Name = "MoveReversedLV2"
PosType = p1
StateNo = 33700
ID = 33700+id
pos=0,0
pausemovetime=2147483647
supermovetime=2147483647
persistent = 1
IgnoreHitPause = 1
KeyCtrl = 0
Ownpal = 1

[State -3, AIhelper]
Type = HelPer
Trigger1 = !IsHelPer ;&& RoundState = 2
Trigger1 = !NumHelPer(35002);&& Var(59)
HelPerType = Normal
Name = "AI_Learning2"
StateNo = 35002
ID = 35002
OwnPal = 1
IgnoreHitPause = 1
PauseMoveTime = 2147483647
SuperMoveTime = 2147483647
;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
; 関係無いステートに行かないように
;---------------------------------------------------------------------------
[State -3, 関係無いステートに行かないように]
Type = ChangeState
Trigger1 = IsHelper
Trigger1 = IsHelper(20000+Root,ID)
Trigger1 = StateNo != 20000
Value = 20000

[State -3, 関係無いステートに行かないように]
Type = ChangeState
Trigger1 = IsHelper
Trigger1 = IsHelper(20001+Root,ID)
Trigger1 = StateNo != 20001
Value = 20001


[State -3, 関係無いステートに行かないように]
Type = ChangeState
Trigger1 = IsHelper
Trigger1 = IsHelper(25000+Root,ID)
Trigger1 = StateNo != 25000
Value = 25000

[State -3, 関係無いステートに行かないように]
Type = ChangeState
Trigger1 = IsHelper
Trigger1 = IsHelper(26000+Root,ID)
Trigger1 = StateNo != 26000
Value = 26000

[State -3, 関係無いステートに行かないように]
Type = ChangeState
Trigger1 = IsHelper
Trigger1 = IsHelper(33700+Root,ID)
Trigger1 = StateNo != 33700
Value = 33700

; ステージ前後方端までの距離
;-----------------------------------------------------------------------------
[State -3, ステージ前方端までの距離]
Type = VarSet
Trigger1 =(NumHelper(20000+ID) && NumHelper(20001+ID))
Trigger1 = TeamSide = 1
var(41) = floor(Abs(ifelse(Facing = 1,Helper(20000+ID),RootDist X,Helper(20001+ID),RootDist X)))
IgnoreHitPause = 1

[State -3, ステージ前方端までの距離]
Type = VarSet
Trigger1 =(NumHelper(20000+ID) && NumHelper(20001+ID))
Trigger1 = TeamSide = 2
var(41) = floor(Abs(ifelse(Facing = 1,Helper(20001+ID),RootDist X,Helper(20000+ID),RootDist X)))
IgnoreHitPause = 1

[State -3, ステージ後方端までの距離]
Type = VarSet
Trigger1 =(NumHelper(20000+ID) && NumHelper(20001+ID))
Trigger1 = TeamSide = 1
var(42) = floor(Abs(ifelse(Facing = 1,Helper(20001+ID),RootDist X,Helper(20000+ID),RootDist X)))
IgnoreHitPause = 1

[State -3, ステージ後方端までの距離]
Type = VarSet
Trigger1 =(NumHelper(20000+ID) && NumHelper(20001+ID))
Trigger1 = TeamSide = 2
var(42) = floor(Abs(ifelse(Facing = 1,Helper(20000+ID),RootDist X,Helper(20001+ID),RootDist X)))
IgnoreHitPause = 1



;---------------------------------------------------------------------------
[State -3, 関係無いステートに行かないように]
type = ChangeState
trigger1 = ishelper(30000)
trigger1 = stateno != 30000
value = 30000

[State -3, 関係無いステートに行かないように]
type = ChangeState
trigger1 = ishelper
trigger1 = ishelper(31000+root,id)
trigger1 = stateno != 31000
value = 31000

[State -3]
type = ChangeState
trigger1 = ishelper(999)
trigger1 = stateno!=999
value = 999

[State -3, 関係無いステートに行かないように]
type = SelfState
trigger1 = ishelper(32000)
trigger1 = stateno != 32000
value = 32000

[State -3, 関係無いステートに行かないように]
type = SelfState
trigger1 = ishelper(32500) || ishelper(32501)
trigger1 = stateno != 32500
value = 32500


;AIswich---------------------------------------------------------------------------
; AI swich -> ON
[State -1, AI]
type = VarSet;VarSet
triggerall = !ishelper || isHelper(30000)
triggerall = var(59) != 1
triggerall = RoundState = [1,2]
trigger1  = Command = "AI1"
trigger2  = Command = "AI2"
trigger3  = Command = "AI3"
trigger4  = Command = "AI4"
trigger5  = Command = "AI5"
trigger6  = Command = "AI6"
trigger7  = Command = "AI7"
trigger8  = Command = "AI8"
trigger9  = Command = "AI9"
trigger10 = Command = "AI10"
trigger11 = Command = "AI11"
trigger12 = Command = "AI12"
trigger13 = Command = "AI13"
trigger14 = Command = "AI14"
trigger15 = Command = "AI15"
trigger16 = Command = "AI16"
trigger17 = Command = "AI17"
trigger18 = Command = "AI18"
trigger19 = Command = "AI19"
trigger20 = Command = "AI20"
trigger21 = Command = "AI21"
trigger22 = Command = "AI22"
trigger23 = Command = "AI23"
trigger24 = Command = "AI24"
trigger25 = Command = "AI25"
trigger26 = NumHelper(30000)
trigger26 = Helper(30000),var(59)
trigger26 = Helper(30000),time > 5
trigger27 = 1 ;(AI swich ON)
var(59) = 1

;=================================================================================
;变量设置
;=================================================================================

[State -1, AI]
Type = VarSet
triggerall = var(59) = 1
trigger1 = RoundState = 4
trigger2 = Win = 1
trigger3 = Lose = 1
trigger4 = DrawGame = 1
V = 59
Value = -1

[State -1, AI]
Type = VarSet
triggerall = var(59) = -1
trigger1 = RoundState = 2
V = 59
Value = 1

;-----------------------------------------------------------------------------
;タッグ用生死判別
;-----------------------------------------------------------------------------
[State -1, VarSet]
Type = VarSet
Trigger1 = NumEnemy = 1
Trigger2 = NumEnemy = 2
Trigger2 = Enemynear,Life > 0
var(58) = 0
IgnoreHitPause = 1
SuperMoveTime = 9999
PauseMoveTime = 9999

[State -1, VarSet]
Type = VarSet
Trigger1 = NumEnemy > 1
Trigger1 = Enemynear,Life = 0
var(58) = 1
IgnoreHitPause = 1
SuperMoveTime = 9999
PauseMoveTime = 9999

;-----------------------------------------------------------------------------
[State -3,varset]
Type = varset
trigger1 = NumEnemy = 1
fvar(37) = 0

[State -3,varset]
Type = varset
trigger1 = NumEnemy = 2
trigger1 = EnemyNear(0),Alive
trigger1 = EnemyNear(1),Alive
fvar(37) = IfElse(((Abs(Pos X - EnemyNear(0),Pos X)) < (Abs(Pos X - EnemyNear(1),Pos X))),0,1)
ignorehitpause = 1

[State -3,varset]
Type = varset
trigger1 = NumEnemy = 2
trigger1 = !EnemyNear(0),Alive || !EnemyNear(1),Alive
fvar(37) = IfElse(EnemyNear(0),Alive,0,1)
ignorehitpause = 1

;-----------------------------------------------------------------------------
[State -3, GameTime]
type = VarSet
trigger1 = 1
v = 55
value = GameTime
ignorehitpause = 1
;-------------------------------------------------------------------

[State -3 ,movereversed]
type = varset
trigger1 = movereversed
v = 27
value = enemy,prevstateno
ignorehitpause = 1

[State -3 ,movereversed]
type = varset
trigger1 = movereversed
v = 28
value = enemy,stateno
ignorehitpause = 1

;硬直?制
[State -3,varadd]
Type = VarAdd
Trigger1 = StateNo = 610 && MoveContact = 1
Trigger2 = StateNo = 710 && MoveContact = 1
Trigger3 = StateNo = 990 && MoveContact = 1
Trigger4 = StateNo = 810 && MoveContact = 1
persistent = 0
V = 29
value = 5

[State -3,varset]
Type = VarSet
TriggerAll = var(29)
Trigger1 = (enemynear(var(58)),StateNo = [200,4999]) || enemynear,statetype = L  || stateno = 791;&&(enemynear(var(58)),!InGuardDist)
persistent = 0
var(29) = 0

[State -3,varadd]
Type = VarAdd
Trigger1 = StateNo = 205 && MoveContact = 1
Trigger2 = StateNo = 305 && MoveContact = 1
Trigger3 = StateNo = 400 && MoveContact = 1
Trigger4 = StateNo = 500 && MoveContact = 1
Trigger5 = StateNo = 205 && MoveContact = 1
Trigger6 = StateNo = 215 && MoveContact = 1
persistent = 0
V = 30
value = 5

[State -3,varset]
Type = VarSet
TriggerAll = var(30)
Trigger1 = enemynear,MoveType != H||(StateNo = [30,39])||StateNo = 791||StateNo = 810||StateNo = 100||partner,numhelper(1901) > 0||partner,numhelper(1910) > 0
persistent = 0
var(30) = 0

;---------------------------------------------------------------------------------
;AI跳?限制用
;---------------------------------------------------------------------------------

[State -2]
type = null
Trigger1 = helper(35002),var(48) = 1
Trigger1 = anim = 5040 && time = 1 || stateno = 5120 && time = 1 || stateno = 5201 && time = 1 || stateno = 5150 && time = 1
Trigger1 = var(33):= var(33) + helper(35002),var(49)
Trigger1 = 0

[State -2]
type = varadd
triggerALL = gametime % 5 = 0 && enemynear(var(58)),statetype != L
Trigger1 = var(33) > 0
Trigger1 = STATENO < 5000 && MOVETYPE != H
var(33) = ifelse(enemynear(var(58)),MOVEtype = H && gametime % 10 = 0,-5,-1)

[State 0, VarSet]
type = VarSet
trigger1 = var(33) < 0
var(33) = 0

[State Neko,防止乱跳]
type = ChangeState
value = 0
triggerall = var(59)
triggerall = var(33) > 0 && var(44) = 0 && var(49) = 0
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),MOVEtype != H 
triggerall = HELPER(35002),VAR(57) != 1
triggerall = statetype != A 
triggerall = roundstate = 2
triggerall = enemynear,hitdefattr != SC,AT
trigger1 = stateno = 34 ||stateno = 36
ctrl = 1 
IgnoreHitPause = 1 

[State Neko,防止乱跳]
type = ChangeState
value = 0
triggerall = var(59)
triggerall = enemynear(var(58)),name = "Gustab Munchausen" || helper(35002),var(46) >= 1000 && (p2name = "Orochi Eagrose Version" || p4name = "Orochi-EV" )
triggerall = enemynear(var(58)),MOVEtype != H 
triggerall = statetype != A 
triggerall = roundstate = 2
trigger1 = (stateno = [30,39]) || stateno = 105
ctrl = 1 
IgnoreHitPause = 1 

[State ,出招被投??]
type = ChangeState;ChangeState
value = 0
triggerall = var(59)
triggerall = enemynear(var(58)),MOVEtype = A 
triggerall = statetype != A 
triggerall = roundstate = 2
triggerALL = stateno = 400 && time <= 4 || stateno = 500 && time <= 4 || stateno = 205 && time <= 3 || stateno = 305 && time <= 4 || stateno = 215 && time <= 5
trigger1 = enemynear(var(58)), StateNo = Helper(35002), var(21)
trigger2 = enemynear(var(58)), StateNo = Helper(35002), var(22)
trigger3 = enemynear(var(58)), StateNo = Helper(35002), var(23)
trigger4 = enemynear(var(58)), StateNo = Helper(35002), var(24)
trigger5 = enemynear(var(58)), StateNo = Helper(35002), var(25)
ctrl = 1 
IgnoreHitPause = 1

[State ,出招被打??]
type = ChangeState;ChangeState
value = 0
triggerall = var(59)
triggerall = inguarddist
triggerall = enemynear(var(58)),statetype != A 
triggerall = enemynear(var(58)),time = [0,4]
triggerall = enemynear(var(58)),MOVEtype = A 
triggerall = statetype != A 
triggerall = roundstate = 2
triggerALL = stateno = 400 && time <= 4 || stateno = 500 && time <= 4 || stateno = 305 && time <= 4 || stateno = 205 && time <= 3
trigger1 = (enemynear(var(58)), StateNo = Helper(999), var(1)) && enemynear(var(58)), Time <= (4 - Helper(999), var(2))
trigger2 = (enemynear(var(58)), StateNo = Helper(999), var(3)) && enemynear(var(58)), Time <= (4 - Helper(999), var(4))
trigger3 = (enemynear(var(58)), StateNo = Helper(999), var(5)) && enemynear(var(58)), Time <= (4 - Helper(999), var(6))
trigger4 = (enemynear(var(58)), StateNo = Helper(999), var(7)) && enemynear(var(58)), Time <= (4 - Helper(999), var(8))
trigger5 = (enemynear(var(58)), StateNo = Helper(999), var(9)) && enemynear(var(58)), Time <= (4 - Helper(999), var(10))
trigger6 = (enemynear(var(58)), StateNo = Helper(999), var(11)) && enemynear(var(58)), Time <= (4 - Helper(999), var(12))
trigger7 = (enemynear(var(58)), StateNo = Helper(999), var(13)) && enemynear(var(58)), Time <= (4 - Helper(999), var(14))
trigger8 = (enemynear(var(58)), StateNo = Helper(999), var(15)) && enemynear(var(58)), Time <= (4 - Helper(999), var(16))
trigger9 = (enemynear(var(58)), StateNo = Helper(999), var(17)) && enemynear(var(58)), Time <= (4 - Helper(999), var(18))
trigger10 = (enemynear(var(58)), StateNo = Helper(999), var(19)) && enemynear(var(58)), Time <= (4 - Helper(999), var(20))
trigger11 = (enemynear(var(58)), StateNo = Helper(999), var(21)) && enemynear(var(58)), Time <= (4 - Helper(999), var(22))
trigger12 = (enemynear(var(58)), StateNo = Helper(999), var(23)) && enemynear(var(58)), Time <= (4 - Helper(999), var(24))
trigger13 = (enemynear(var(58)), StateNo = Helper(999), var(25)) && enemynear(var(58)), Time <= (4 - Helper(999), var(26))
trigger14 = (enemynear(var(58)), StateNo = Helper(999), var(27)) && enemynear(var(58)), Time <= (4 - Helper(999), var(28))
trigger15 = (enemynear(var(58)), StateNo = Helper(999), var(29)) && enemynear(var(58)), Time <= (4 - Helper(999), var(30))
trigger16 = (enemynear(var(58)), StateNo = Helper(999), var(31)) && enemynear(var(58)), Time <= (4 - Helper(999), var(32))
trigger17 = (enemynear(var(58)), StateNo = Helper(999), var(33)) && enemynear(var(58)), Time <= (4 - Helper(999), var(34))
trigger18 = (enemynear(var(58)), StateNo = Helper(999), var(35)) && enemynear(var(58)), Time <= (4 - Helper(999), var(36))
trigger19 = (enemynear(var(58)), StateNo = Helper(999), var(37)) && enemynear(var(58)), Time <= (4 - Helper(999), var(38))
trigger20 = (enemynear(var(58)), StateNo = Helper(999), var(39)) && enemynear(var(58)), Time <= (4 - Helper(999), var(40))
trigger21 = (enemynear(var(58)), StateNo = Helper(999), var(41)) && enemynear(var(58)), Time <= (4 - Helper(999), var(42))
trigger22 = (enemynear(var(58)), StateNo = Helper(999), var(43)) && enemynear(var(58)), Time <= (4 - Helper(999), var(44))
trigger23 = (enemynear(var(58)), StateNo = Helper(999), var(45)) && enemynear(var(58)), Time <= (4 - Helper(999), var(46))
trigger24 = (enemynear(var(58)), StateNo = Helper(999), var(47)) && enemynear(var(58)), Time <= (4 - Helper(999), var(48))
trigger25 = (enemynear(var(58)), StateNo = Helper(999), var(49)) && enemynear(var(58)), Time <= (4 - Helper(999), var(50))
trigger26 = (enemynear(var(58)), StateNo = Helper(999), var(51)) && enemynear(var(58)), Time <= (4 - Helper(999), var(52))
trigger27 = (enemynear(var(58)), StateNo = Helper(999), var(53)) && enemynear(var(58)), Time <= (4 - Helper(999), var(54))
trigger28 = (enemynear(var(58)), StateNo = Helper(999), var(55)) && enemynear(var(58)), Time <= (4 - Helper(999), var(56))
ctrl = 1 
IgnoreHitPause = 1 

[State ,出招被打??]
type = ChangeState;ChangeState
value = 0
triggerall = var(59)
triggerall = inguarddist
triggerall = enemynear(var(58)),statetype != A 
triggerall = enemynear(var(58)),time = [0,5]
triggerall = enemynear(var(58)),MOVEtype = A 
triggerall = statetype != A 
triggerall = roundstate = 2
triggerALL = stateno = 215 && time <= 5 || (stateno = [30,39]) && time <= 4
trigger1 = (enemynear(var(58)), StateNo = Helper(999), var(1)) && enemynear(var(58)), Time <= (5 - Helper(999), var(2))
trigger2 = (enemynear(var(58)), StateNo = Helper(999), var(3)) && enemynear(var(58)), Time <= (5 - Helper(999), var(4))
trigger3 = (enemynear(var(58)), StateNo = Helper(999), var(5)) && enemynear(var(58)), Time <= (5 - Helper(999), var(6))
trigger4 = (enemynear(var(58)), StateNo = Helper(999), var(7)) && enemynear(var(58)), Time <= (5 - Helper(999), var(8))
trigger5 = (enemynear(var(58)), StateNo = Helper(999), var(9)) && enemynear(var(58)), Time <= (5 - Helper(999), var(10))
trigger6 = (enemynear(var(58)), StateNo = Helper(999), var(11)) && enemynear(var(58)), Time <= (5 - Helper(999), var(12))
trigger7 = (enemynear(var(58)), StateNo = Helper(999), var(13)) && enemynear(var(58)), Time <= (5 - Helper(999), var(14))
trigger8 = (enemynear(var(58)), StateNo = Helper(999), var(15)) && enemynear(var(58)), Time <= (5 - Helper(999), var(16))
trigger9 = (enemynear(var(58)), StateNo = Helper(999), var(17)) && enemynear(var(58)), Time <= (5 - Helper(999), var(18))
trigger10 = (enemynear(var(58)), StateNo = Helper(999), var(19)) && enemynear(var(58)), Time <= (5 - Helper(999), var(20))
trigger11 = (enemynear(var(58)), StateNo = Helper(999), var(21)) && enemynear(var(58)), Time <= (5 - Helper(999), var(22))
trigger12 = (enemynear(var(58)), StateNo = Helper(999), var(23)) && enemynear(var(58)), Time <= (5 - Helper(999), var(24))
trigger13 = (enemynear(var(58)), StateNo = Helper(999), var(25)) && enemynear(var(58)), Time <= (5 - Helper(999), var(26))
trigger14 = (enemynear(var(58)), StateNo = Helper(999), var(27)) && enemynear(var(58)), Time <= (5 - Helper(999), var(28))
trigger15 = (enemynear(var(58)), StateNo = Helper(999), var(29)) && enemynear(var(58)), Time <= (5 - Helper(999), var(30))
trigger16 = (enemynear(var(58)), StateNo = Helper(999), var(31)) && enemynear(var(58)), Time <= (5 - Helper(999), var(32))
trigger17 = (enemynear(var(58)), StateNo = Helper(999), var(33)) && enemynear(var(58)), Time <= (5 - Helper(999), var(34))
trigger18 = (enemynear(var(58)), StateNo = Helper(999), var(35)) && enemynear(var(58)), Time <= (5 - Helper(999), var(36))
trigger19 = (enemynear(var(58)), StateNo = Helper(999), var(37)) && enemynear(var(58)), Time <= (5 - Helper(999), var(38))
trigger20 = (enemynear(var(58)), StateNo = Helper(999), var(39)) && enemynear(var(58)), Time <= (5 - Helper(999), var(40))
trigger21 = (enemynear(var(58)), StateNo = Helper(999), var(41)) && enemynear(var(58)), Time <= (5 - Helper(999), var(42))
trigger22 = (enemynear(var(58)), StateNo = Helper(999), var(43)) && enemynear(var(58)), Time <= (5 - Helper(999), var(44))
trigger23 = (enemynear(var(58)), StateNo = Helper(999), var(45)) && enemynear(var(58)), Time <= (5 - Helper(999), var(46))
trigger24 = (enemynear(var(58)), StateNo = Helper(999), var(47)) && enemynear(var(58)), Time <= (5 - Helper(999), var(48))
trigger25 = (enemynear(var(58)), StateNo = Helper(999), var(49)) && enemynear(var(58)), Time <= (5 - Helper(999), var(50))
trigger26 = (enemynear(var(58)), StateNo = Helper(999), var(51)) && enemynear(var(58)), Time <= (5 - Helper(999), var(52))
trigger27 = (enemynear(var(58)), StateNo = Helper(999), var(53)) && enemynear(var(58)), Time <= (5 - Helper(999), var(54))
trigger28 = (enemynear(var(58)), StateNo = Helper(999), var(55)) && enemynear(var(58)), Time <= (5 - Helper(999), var(56))
ctrl = 1 
IgnoreHitPause = 1 

;==============================================================================

[State -3]
type = Turn
triggerall = p2dist x < 0 && !time && var(59)
trigger1 = stateno = [150,154]

;起き攻め
;---------------------------------------------------------------------------
[State -3, 起き攻め選択]
type = VarSet
triggerall = var(44) = 0
triggerall = roundstate = 2
triggerall = enemynear(var(58)),statetype = L && enemynear(var(58)),movetype != A
triggerall = enemynear(var(58)),ctrl = 0
triggerall = enemynear(var(58)),stateno != 5120 || enemynear(var(58)),animtime < -4
trigger1 = statetype != L && movetype != H
var(44) = 1 + ifelse(Random <=666,Ifelse(random<=500,1,2),0)

[State -3, リセット]
type = varset
triggerall = var(44) != 0
trigger1 = roundstate != 2 || movetype = H || movetype = A && var(50) = 0 || statetype = L
var(44) = 0

[State -3];上のリセット
type = varset
triggerall = var(44) != 0
trigger1 = var(44) = 1 && enemynear(var(58)),stateno = 5120
trigger1 = enemynear(var(58)),animtime = 0
trigger2 = var(44) = 2 && enemynear(var(58)),stateno = 5120
trigger2 = enemynear(var(58)),animtime > -6
trigger2 = !((stateno = [30,39]) || statetype = A)
trigger3 = var(44) = 3 && enemynear(var(58)),stateno = 5120
trigger3 = enemynear(var(58)),animtime > -5
trigger3 = !((stateno = [30,39]) || statetype = A)
trigger4 = var(44) = 4 && enemynear(var(58)),stateno = 5120
trigger4 = enemynear(var(58)),animtime > -4
var(44) = 10


[State -3, VarSet]
Type = VarSet
Trigger1 = var(49) != 0
V = 49
Value = 0
IgnoreHitPause = 1

[State -3, ヒット硬直時間]
Type = VarSet
TriggerAll = EnemyNear(var(58)),Ctrl = 0
TriggerAll = EnemyNear(var(58)),StateType != A
TriggerAll = EnemyNear(var(58)),StateType != L
TriggerAll = EnemyNear(var(58)),MoveType = H
Trigger1 = EnemyNear(var(58)),StateNo = [120,160)
Trigger2 = EnemyNear(var(58)),StateNo = [5000,5100)
Trigger3 = EnemyNear(var(58)),StateNo = 5700
V = 49
Value = EnemyNear(var(58)),GetHitVar(hittime) + 1 ;?里也是一?的道理
IgnoreHitPause = 1

;-----------------------------------------------------------------------------------

[State -1, ヒット確認]
type = VarSet
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
triggerall = enemynear(var(58)),statetype = A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),movetype = H
trigger1 = stateno = 1010 && movehit
var(50) = 1

[State -1, ヒット確認]
type = VarSet
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
triggerall = enemynear(var(58)),statetype = A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),movetype = H
trigger1 = helper(1007),numtarget(1005)
var(50) = 2

[State -1, ヒット確認]
type = VarSet
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),movetype = H
trigger1 = stateno = 810 && movehit
var(50) = 3

[State -1, ヒット確認]
type = VarSet
triggerall = VAR(51) > 0 && POWER < 1000
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
triggerall = enemynear(var(58)),statetype = A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),movetype = H
trigger1 = stateno = 1205 && MOVEHIT
var(50) = 4 + RANDOM%3

[State -1, ヒット確認]
type = VarSet
triggerall = VAR(51) > 0 && POWER >= 1000
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
triggerall = enemynear(var(58)),statetype = A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),movetype = H
trigger1 = stateno = 1205 && MOVEHIT
var(50) = IFELSE(POWER >= 2000,7,8)

[State -1, ヒット確認]
type = VarSet
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
triggerall = enemynear(var(58)),statetype = A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),movetype = H
triggerall = enemynear(var(58)),stateno >= 5000
trigger1 = prevstateno = [5000,5100]
var(50) = 26

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

;--------------------------------------------------------------------------------------------

[State -1, Stand Strong Punch]
type = ChangeState
value = var(57)
triggerall = var(59) = 1
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),movetype = H
triggerall = var(29) > 0
trigger1 = stateno = 99 && enemynear(var(58)),stateno = [5000,5100)
trigger1 = (p2bodydist x <= 5 && var(49) <= 10 || P2BodyDist x <= 40 && var(49) <= 6)
trigger1 = var(57):= ifelse(var(49) <= 6,400,ifelse(random<=500,ifelse(random<=500,400,305),ifelse(random<=500,215,205)))
trigger2 = stateno = 99 && enemynear(var(58)),stateno = 5700
trigger2 = (p2bodydist x <= 5 && enemynear(var(58)),time >= 16 || P2BodyDist x <= 40 && enemynear(var(58)),time >= 20)
trigger2 = var(57):= ifelse(enemynear(var(58)),time >= 20,400,ifelse(random<=500,ifelse(random<=500,400,305),ifelse(random<=500,215,205)))
trigger3 = stateno = 52 || stateno = 1404 && animtime = 0
trigger3 = enemynear(var(58)),stateno >= 5000
trigger3 = var(49) > 6
trigger3 = var(57):= 99

[State -1, Stand Strong Punch]
type = ChangeState
value = var(57)
triggerall = var(59) = 1
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),movetype = H
triggerall = enemynear(var(58)),stateno >= 5000
triggerall = stateno = 100
trigger1 = (p2bodydist x <= 5 && var(49) <= 10 || P2BodyDist x <= 40 && var(49) <= 6)
trigger1 = var(57):= ifelse(var(49) <= 6,400,ifelse(random<=500,ifelse(random<=500,400,305),ifelse(random<=500,215,205)))
trigger2 = enemynear(var(58)),stateno = 5700
trigger2 = (p2bodydist x <= 5 && enemynear(var(58)),time >= 16 || P2BodyDist x <= 40 && enemynear(var(58)),time >= 20)
trigger2 = var(57):= ifelse(enemynear(var(58)),time >= 20,400,ifelse(random<=500,ifelse(random<=500,400,305),ifelse(random<=500,215,205)))

;相杀后行动--------------------------------------------------------------------------------

[State -1, 停止用]
type = ChangeState
value = 22
triggerall = var(59)
triggerall = RoundState = 2
triggerall = statetype != A
triggerall = enemynear(var(58)),statetype = A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),movetype = H
trigger1 = var(50) = 26
trigger1 = ctrl || (stateno = [99,101])|| (stateno = [120,149]) || stateno >= 5000 && time >= 10
trigger1 = P2BodyDist x <= 50

[State -1, 前中ジャンプ]
Type = ChangeState
value = var(57)
triggerall = var(59)
triggerall = alive
triggerall = var(50) = 26
triggerall = RoundState = 2
triggerall = statetype != A
triggerall = statetype != L
triggerall = enemynear(var(58)),statetype = A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),movetype = H
trigger1 = enemynear(var(58)),stateno >= 5000
trigger1 = ctrl || (stateno = [120,149]) || stateno >= 5000 && time >= 10
trigger1 = var(57):= 99
trigger2 = ctrl || (stateno = [20,22]) || (stateno = [99,101]) || (stateno = [120,149])
trigger2 = p2bodydist y = [-20-floor(16*(enemynear(var(58)),vel y)+(16*(16+1)/2)*fvar(20)),20-floor(16*(enemynear(var(58)),vel y)+(16*(16+1)/2)*fvar(20))]
trigger2 = var(57):= 1305


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;飛び道具対策
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

;前転(飛び道具対策)
[State -1, FRoll]
type = ChangeState
value = 750
triggerall = var(59) = 1
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
triggerall = Random <= 800
triggerall = statetype != A
triggerall = enemynear(var(58)),MoveType != H
triggerall = InGuardDist
triggerall = ctrl || (stateno = [20,22]) || (stateno = [100,101]) || (stateno = [120,149])
trigger1 = p2bodydist x >= 125
trigger1 = (Enemy,NumHelper > 0&&Enemy,NumHelper > Helper(32000),var(1))||Enemy,Numproj != 0
trigger1 = var(45) = 1
trigger2 = (enemynear(var(58)),AnimTime <= -34 && !enemynear(var(58)),Ctrl)
trigger2 = (Enemy,NumHelper > 0&&Enemy,NumHelper > Helper(32000),var(1))||Enemy,Numproj != 0
trigger2 = var(45) = 1

;攻撃避け
[State -1, 攻撃避け]
type = ChangeState
value = 760
triggerall = var(59) = 1
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
triggerall = Random > 800
triggerall = statetype != A
triggerall = enemynear(var(58)),MoveType != H
triggerall = InGuardDist
triggerall = ctrl || (stateno = [20,22]) || (stateno = [100,101]) || (stateno = [120,149])
trigger1 = P2bodydist X >= 125
trigger1 = (Enemy,NumHelper > 0&&Enemy,NumHelper > Helper(32000),var(1))||Enemy,Numproj != 0
trigger1 = var(45) = 1
trigger2 = (enemynear(var(58)),AnimTime <= -34 && !enemynear(var(58)),Ctrl)
trigger2 = (Enemy,NumHelper > 0&&Enemy,NumHelper > Helper(32000),var(1))||Enemy,Numproj != 0
trigger2 = var(45) = 1

;攻撃避け
[State -1, 攻撃避け]
type = ChangeState;ChangeState
value = 750
triggerall = var(59) = 1
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
triggerall = Random <= 800
triggerall = statetype != A
triggerall = enemynear(var(58)),MoveType != H
triggerall = ctrl || (stateno = [20,22]) || (stateno = [100,101]) || stateno = 115 || (stateno = [120,149])
triggerall = P2bodydist X >= 150
triggerall = (Enemy,NumHelper > 0&&Enemy,NumHelper > Helper(32000),var(1))||Enemy,Numproj != 0
trigger1 = (enemynear(var(58)), StateNo = Helper(999), var(1)) && enemynear(var(58)), Time = (Helper(999), var(2) - 1)
trigger2 = (enemynear(var(58)), StateNo = Helper(999), var(3)) && enemynear(var(58)), Time = (Helper(999), var(4) - 1)
trigger3 = (enemynear(var(58)), StateNo = Helper(999), var(5)) && enemynear(var(58)), Time = (Helper(999), var(6) - 1)
trigger4 = (enemynear(var(58)), StateNo = Helper(999), var(7)) && enemynear(var(58)), Time = (Helper(999), var(8) - 1)
trigger5 = (enemynear(var(58)), StateNo = Helper(999), var(9)) && enemynear(var(58)), Time = (Helper(999), var(10) - 1)
trigger6 = (enemynear(var(58)), StateNo = Helper(999), var(11)) && enemynear(var(58)), Time = (Helper(999), var(12) - 1)
trigger7 = (enemynear(var(58)), StateNo = Helper(999), var(13)) && enemynear(var(58)), Time = (Helper(999), var(14) - 1)
trigger8 = (enemynear(var(58)), StateNo = Helper(999), var(15)) && enemynear(var(58)), Time = (Helper(999), var(16) - 1)
trigger9 = (enemynear(var(58)), StateNo = Helper(999), var(17)) && enemynear(var(58)), Time = (Helper(999), var(18) - 1)
trigger10 = (enemynear(var(58)), StateNo = Helper(999), var(19)) && enemynear(var(58)), Time = (Helper(999), var(20) - 1)
trigger11 = (enemynear(var(58)), StateNo = Helper(999), var(21)) && enemynear(var(58)), Time = (Helper(999), var(22) - 1)
trigger12 = (enemynear(var(58)), StateNo = Helper(999), var(23)) && enemynear(var(58)), Time = (Helper(999), var(24) - 1)
trigger13 = (enemynear(var(58)), StateNo = Helper(999), var(25)) && enemynear(var(58)), Time = (Helper(999), var(26) - 1)
trigger14 = (enemynear(var(58)), StateNo = Helper(999), var(27)) && enemynear(var(58)), Time = (Helper(999), var(28) - 1)
trigger15 = (enemynear(var(58)), StateNo = Helper(999), var(29)) && enemynear(var(58)), Time = (Helper(999), var(30) - 1)
trigger16 = (enemynear(var(58)), StateNo = Helper(999), var(31)) && enemynear(var(58)), Time = (Helper(999), var(32) - 1)
trigger17 = (enemynear(var(58)), StateNo = Helper(999), var(33)) && enemynear(var(58)), Time = (Helper(999), var(34) - 1)
trigger18 = (enemynear(var(58)), StateNo = Helper(999), var(35)) && enemynear(var(58)), Time = (Helper(999), var(36) - 1)
trigger19 = (enemynear(var(58)), StateNo = Helper(999), var(37)) && enemynear(var(58)), Time = (Helper(999), var(38) - 1)
trigger20 = (enemynear(var(58)), StateNo = Helper(999), var(39)) && enemynear(var(58)), Time = (Helper(999), var(40) - 1)
trigger21 = (enemynear(var(58)), StateNo = Helper(999), var(41)) && enemynear(var(58)), Time = (Helper(999), var(42) - 1)
trigger22 = (enemynear(var(58)), StateNo = Helper(999), var(43)) && enemynear(var(58)), Time = (Helper(999), var(44) - 1)
trigger23 = (enemynear(var(58)), StateNo = Helper(999), var(45)) && enemynear(var(58)), Time = (Helper(999), var(46) - 1)
trigger24 = (enemynear(var(58)), StateNo = Helper(999), var(47)) && enemynear(var(58)), Time = (Helper(999), var(48) - 1)
trigger25 = (enemynear(var(58)), StateNo = Helper(999), var(49)) && enemynear(var(58)), Time = (Helper(999), var(50) - 1)
trigger26 = (enemynear(var(58)), StateNo = Helper(999), var(51)) && enemynear(var(58)), Time = (Helper(999), var(52) - 1)
trigger27 = (enemynear(var(58)), StateNo = Helper(999), var(53)) && enemynear(var(58)), Time = (Helper(999), var(54) - 1)
trigger28 = (enemynear(var(58)), StateNo = Helper(999), var(55)) && enemynear(var(58)), Time = (Helper(999), var(56) - 1)

[State -3,後転 AttackDist無効通常技回避]
Type = ChangeState
value = IFELSE(VAR(42) < 150,ifelse(random<=500,1100,1105),760)
TriggerAll = var(59) = 1
TriggerAll = BackEdgeBodyDist >= 20
TriggerAll = RoundState = 2
triggerall = Random <= 10||Life <= ceil(lifemax/3) && Random <= 100||helper(35002),var(40) >= 5
TriggerAll = StateType != A
TriggerAll = P2BodyDist X <= 25 && EnemyNear(var(58)),AnimTime > -5 || P2BodyDist X > 25
TriggerAll = EnemyNear(var(58)),StateNo = [200,699]
TriggerAll = EnemyNear(var(58)),MoveType = A
TriggerAll =!EnemyNear(var(58)),HitDefAttr = SCA, NT, ST, HT
TriggerAll = EnemyNear(var(58)),Time <= 5
TriggerAll = EnemyNear(var(58)),facing != facing
TriggerAll =!InGuardDist
TriggerAll = Ctrl || (StateNo = [20,22]) || (StateNo = [120,149]) || StateNo = 100
Trigger1 = P2BodyDist X <= 45 && EnemyNear(var(58)),AnimTime >= -5
Trigger2 = P2BodyDist X <= 55 && EnemyNear(var(58)),AnimTime >= -16 || P2BodyDist X <= 65 && EnemyNear(var(58)),AnimTime >= -17
Trigger3 = P2BodyDist X <= 75 && EnemyNear(var(58)),AnimTime >= -18 || P2BodyDist X <= 85 && EnemyNear(var(58)),AnimTime >= -19
Trigger4 = P2BodyDist X <= 95 && EnemyNear(var(58)),AnimTime >= -20

;落点最低攻?-------------------------------------------------------------------------------

[State -3, ??用]
Type = null;;ChangeState
Value = 30
TriggerAll = RoundState = 2
TriggerAll = StateType != A
TriggerAll = P2BodyDist x < 200
Trigger1 = stateno = 100

[state -1]
Type = ChangeState
value = IFELSE(RANDOM<=500 && VAR(41) < 50,710,610) 
TriggerAll = var(59) = 1
TriggerAll = var(4) = -1
TriggerAll = RoundState = 2
TriggerAll = StateType = A
TriggerAll = EnemyNear(var(58)),StateType != L || var(44)
TriggerAll = Ctrl || StateNo = [120,149]
Trigger1 = Vel Y = [1,2]
Trigger1 = var(34):= 64113

[state -1]
Type = ChangeState
value = ifelse(P2BodyDist x < 25,ifelse(random<=500 && P2BodyDist x > 0,710,610),710)
;TriggerAll = var(59) = 1
TriggerAll = vel x > 0
TriggerAll = RoundState = 2
TriggerAll = StateType = A
TriggerAll = EnemyNear(var(58)),StateType != L || var(44)
triggerall = P2BodyDist X = [-200+floor(7*(EnemyNear(floor(fvar(37))),vel X)+floor(7*vel X)),200+floor(7*(EnemyNear(floor(fvar(37))),vel X)+floor(7*vel X))]
TriggerAll = Ctrl || StateNo = [120,149]
Trigger1 = Vel Y > 0 && Pos Y > -34 || Vel Y > 0 && (Pos Y = [-85,-80])
Trigger1 = var(34):= 64111

[state -1]
Type = ChangeState
value = ifelse((Vel Y = [-4,-3]),990,ifelse(random<=500 && P2BodyDist x > 0 || P2BodyDist x > 25,710,610))
;TriggerAll = var(59) = 1
TriggerAll = vel x = 0
TriggerAll = RoundState = 2
TriggerAll = StateType = A
TriggerAll = EnemyNear(var(58)),StateType != L
triggerall = P2BodyDist X <= 100
TriggerAll = Ctrl || StateNo = [120,149]
Trigger1 = (Vel Y = [-4,-3]) && var(4) = 1 && random <= 250 || Vel Y > 0 && var(4) = 1
Trigger1 = var(34):= 64112

[State -1, 前中ジャンプ(中段)]
type = ChangeState
value = 30
triggerall = var(59) = 1
triggerall = var(41) > 100
triggerall = var(33) = 0
Triggerall = HELPER(35002),VAR(57) != 1
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 
triggerall = StateType != A
triggerall = !(enemynear(var(58)),stateno >= 200 && enemynear(var(58)),vel x > 0)
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),facing != facing
triggerall = enemynear(var(58)),movetype = I || ((enemynear(var(58)),stateno = [120,159]) && random <= 150)
triggerall =!InGuardDist
triggerall = p2bodydist x = [30,40]
triggerall = ctrl || (stateno = [20,22]) || (stateno = [100,101]) || (stateno = [120,149])
trigger1 = random <= 150 && ifelse(enemynear(var(58)),statetype = C,1,random <= 150)
trigger2 = TeamMode = simul
trigger2 = numpartner
trigger2 = partner,alive
trigger2 = partner,movetype = A
trigger2 = random <= 200 && ifelse(enemynear(var(58)),statetype = C,1,random <= 250)


[State -1, 前中ジャンプ(中段)]
type = ChangeState
value = 34;ifelse(random<=500 || p2bodydist x <= 45,107,34)
triggerall = var(59) = 1
triggerall = var(33) = 0
Triggerall = HELPER(35002),VAR(57) != 1
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 
triggerall = StateType != A
triggerall = !(enemynear(var(58)),stateno >= 200 && enemynear(var(58)),vel x > 0)
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),facing != facing
triggerall = enemynear(var(58)),movetype = I || ((enemynear(var(58)),stateno = [120,159]) && random <= 150)
triggerall =!InGuardDist
triggerall = p2bodydist x = [70,80]
triggerall = ctrl || (stateno = [20,22]) || (stateno = [100,101]) || (stateno = [120,149])
trigger1 = random <= 150 && ifelse(enemynear(var(58)),statetype = C,1,random <= 150)
Trigger1 = var(34) := 3409
trigger2 = TeamMode = simul
trigger2 = numpartner
trigger2 = partner,alive
trigger2 = partner,movetype = A
trigger2 = random <= 200 && ifelse(enemynear(var(58)),statetype = C,1,random <= 250)

[State -1, 前中ジャンプ(中段)]
type = ChangeState
value = 36
triggerall = var(59) = 1
triggerall = var(33) = 0
Triggerall = HELPER(35002),VAR(57) != 1
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 
triggerall = StateType != A
triggerall = !(enemynear(var(58)),stateno >= 200 && enemynear(var(58)),vel x > 0)
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),facing != facing
triggerall = enemynear(var(58)),movetype = I || ((enemynear(var(58)),stateno = [120,159]) && random <= 150)
triggerall =!InGuardDist
triggerall = p2bodydist x = [115,120]
triggerall = ctrl || (stateno = [20,22]) || (stateno = [100,101]) || (stateno = [120,149])
trigger1 = random <= 150 && ifelse(enemynear(var(58)),statetype = C,1,random <= 150)
Trigger1 = var(34) := 3609
trigger2 = TeamMode = simul
trigger2 = numpartner
trigger2 = partner,alive
trigger2 = partner,movetype = A
trigger2 = random <= 200 && ifelse(enemynear(var(58)),statetype = C,1,random <= 250)

[State -3,中ジャンプ 飛び込み]
Type = ChangeState;ChangeState
Value = 1000
;TriggerAll = var(59)
TriggerAll = RoundState = 2 && EnemyNear(var(58)),life > 0 && fvar(22) = 0
TriggerAll = StateType != A
TriggerAll = EnemyNear(var(58)),StateType != A || EnemyNear(var(58)),StateNo < 1000
TriggerAll = EnemyNear(var(58)),StateNo < 2000 || EnemyNear(var(58)),MoveType = I
TriggerAll = InGuardDist
TriggerAll = !Helper(25000+ID),InGuardDist
TriggerAll = Ctrl || (StateNo = [20,22]) || (StateNo = [100,101]) || (StateNo = [120,149])
Trigger1 = Enemy,NumProj || helper(24000 + id),var(57) > 0 && helper(24000 + id),var(54) < 110
Trigger1 = EnemyNear(var(58)),facing != facing
Trigger1 = P2bodyDist X >= 100

[State -3,中ジャンプ 飛び込み]
Type = ChangeState;ChangeState
Value = IFELSE(random<=500,1020,1025)
;TriggerAll = var(59)
TriggerAll = RoundState = 2 && EnemyNear(var(58)),life > 0 && fvar(22) = 0
TriggerAll = StateType != A
Triggerall = stateno = 1000 && Animelem = 8,>0
Trigger1 = Enemy,NumProj || helper(24000 + id),var(57) > 0 && helper(24000 + id),var(54) < 110
Trigger2 = enemynear(var(58)),facing != facing
Trigger2 = p2bodydist X < 0 - floor(enemynear(var(58)),AnimTime*(enemynear(var(58)),vel x))
Trigger3 = EnemyNear(var(58)),stateno >= 200 && EnemyNear(var(58)),prevstateno = [150,159]
Trigger4 = target(506),StateType = A
Trigger5 = EnemyNear(var(58)),stateno >= 2000
Trigger5 = EnemyNear(var(58)),MOVETYPE = A
Trigger6 = p2bodydist X < 100
Trigger6 = EnemyNear(var(58)),stateno != [150,159]

[State -3,中ジャンプ 飛び込み]
Type = ChangeState;ChangeState
Value = IFELSE(!(p2bodydist y = [-60-floor(11*(enemynear(var(58)),vel y)+(11*(11+1)/2)*fvar(20)),-30-floor(11*(enemynear(var(58)),vel y)+(11*(11+1)/2)*fvar(20))]) || !(p2bodydist x = [0+floor(11*(enemynear(var(58)),vel x)),40+floor(11*(enemynear(var(58)),vel x))]),IFELSE(random<=500,1020,1025),1010)
TriggerAll = var(59)
TriggerAll = RoundState = 2 && EnemyNear(var(58)),life > 0 && fvar(22) = 0
TriggerAll = StateType != A
TriggerALL = enemynear(var(58)),facing != facing
TriggerAll = EnemyNear(var(58)),StateType = A
TriggerAll = EnemyNear(var(58)),MoveType != H
Trigger1 = stateno = 1000 && Animelem = 8,>0


[State -3,中ジャンプ 飛び込み]
Type = ChangeState
Value = 36
;TriggerAll = var(59)
TriggerAll = helper(35002),var(46) = 0
triggerall = var(33) = 0
TriggerAll = RoundState = 2 && EnemyNear(var(58)),life > 0 && fvar(22) = 0
TriggerAll = StateType != A
TriggerAll = EnemyNear(var(58)),StateType != A || EnemyNear(var(58)),Vel X < 2
TriggerAll = EnemyNear(var(58)),StateNo < 2000 || EnemyNear(var(58)),MoveType = I
TriggerAll = EnemyNear(var(58)),StateNo < 1000
TriggerAll = Helper(26000+ID),InGuardDist
TriggerAll = !Helper(25000+ID),InGuardDist
TriggerAll = Ctrl || (StateNo = [20,22]) || (StateNo = [100,101]) || (StateNo = [120,149])
Trigger1 = Enemy,NumProj || helper(24000 + id),var(57) = 2; && EnemyNear(var(58)),MOVEType = A
Trigger1 = EnemyNear(var(58)),facing != facing
Trigger1 = P2bodyDist X = [140,250]
Trigger1 = random >= 500

[State -3,大ジャンプ 飛び込み]
Type = ChangeState
Value = 36
;TriggerAll = var(59)
TriggerAll = helper(35002),var(46) = 0
triggerall = var(33) = 0
TriggerAll = RoundState = 2 && EnemyNear(var(58)),life > 0 && fvar(22) = 0
TriggerAll = StateType != A
TriggerAll = EnemyNear(var(58)),StateType != A || EnemyNear(var(58)),StateNo < 1000
TriggerAll = EnemyNear(var(58)),StateNo < 2000 || EnemyNear(var(58)),MoveType = I
TriggerAll = Helper(26000+ID),InGuardDist
TriggerAll = !Helper(25000+ID),InGuardDist
TriggerAll = Ctrl || (StateNo = [20,22]) || (StateNo = [100,101]) || (StateNo = [120,149])
Trigger1 = P2bodyDist X = [140,250]
Trigger1 = Enemy,NumProj || helper(24000 + id),var(57) = 2; && EnemyNear(var(58)),MOVEType = A
Trigger1 = EnemyNear(var(58)),facing != facing
Trigger1 = Random < 500

[State -1, Stand Strong Punch]
type = ChangeState;ChangeState
value = 1205
triggerall = var(59)
triggerall = power >= 500
triggerall = Random <= 100|| Life <= ceil(lifemax/3) && Random <= 300||helper(35002),var(40) >= 10 && Random <= 500
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 
triggerall = statetype != A
triggerall = enemynear(var(58)),ctrl = 0
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),movetype = A
triggerall = enemynear(var(58)),PrevStateno = [150,155]
triggerall = enemynear(var(58)),hitdefattr = SCA,AA
TriggerAll = enemynear(var(58)),facing != facing
triggerall = enemynear(var(58)),animtime <= -8
triggerall = enemy,numproj = 0
Trigger1 = Stateno = 215
Trigger2 = Stateno = 305
Trigger3 = Stateno = 400
Trigger4 = Stateno = 505

[State -1, Dash]
type = ChangeState;ChangeState
value = ifelse((P2BodyDist X = [100,150]) && enemynear(var(58)),animtime <= -15,34,100)
triggerall = var(59) = 1
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
triggerall = statetype != A
triggerall = EnemyNear(var(58)),statetype != A
TriggerAll = playerid(helper(33700+id),var(1)),stateno = fvar(0) || playerid(helper(33700+id),var(1)),stateno = fvar(1) || playerid(helper(33700+id),var(1)),stateno = fvar(2) || playerid(helper(33700+id),var(1)),stateno = fvar(3) || playerid(helper(33700+id),var(1)),stateno = fvar(4)
TriggerAll = (playerid(helper(33700+id),var(1)),stateno != [358000,358006]) && playerid(helper(33700+id),var(1)),stateno != 5150
triggerall = ctrl || (stateno = [20,22]) || stateno = 52 || (stateno = [120,149])
trigger1 = enemynear(var(58)),animtime >= -4
trigger1 = P2BodyDist X < 30
trigger1 = var(34):= 10021
trigger2 = enemynear(var(58)),animtime >= -10
trigger2 = P2BodyDist X = [30,60]
trigger2 = var(34):= 10022
trigger3 = enemynear(var(58)),animtime >= -15
trigger3 = P2BodyDist X = [60,100]
trigger3 = var(34):= 10023
trigger4 = enemynear(var(58)),animtime >= -20
trigger4 = P2BodyDist X > 100
trigger4 = var(34):= 10024


[State -3]
type = ChangeState
Value = ifelse(enemynear(var(58)),animtime < -34,ifelse(random<=500,ifelse(random <= 900,120,ifelse(P2BodyDist x < 30 && random <= 500,ifelse(random<=500,1100,750),750)),120),120)
IgnoreHitPause = 1
triggerall = enemynear(var(58)),name = "Gustab Munchausen"
triggerall = enemynear(var(58)),animtime < -34 || (enemynear(var(58)),animtime = [-34,-4)) && P2BodyDist X <= 30 || (enemynear(var(58)),animtime = [-34,-10)) && (P2BodyDist X = [30,60]) || (enemynear(var(58)),animtime = [-34,-15)) && (P2BodyDist X = [60,100]) || (enemynear(var(58)),animtime = [-34,-20)) && P2BodyDist X > 100
triggerall = HitPauseTime = 0
triggerall = var(59)
triggerall = EnemyNear(var(58)),facing != facing
triggerall = statetype != A && pos y = 0
triggerall = Roundstate = 2
triggerall = EnemyNear(var(58)),statetype != A
triggerall = P2bodydist X = [0+floor(EnemyNear(var(58)),vel X),70+floor(EnemyNear(var(58)),vel X)]
triggerall = EnemyNear(var(58)),movetype = A
triggerall = ctrl || stateno = 0 || (stateno = [20,22]) || stateno = 52 || (stateno = [100,101]) || (stateno = [120,149])|| (stateno = [200,1999]) && (stateno != [750,760])
trigger1 = EnemyNear(var(58)),animtime < -6
trigger2 = EnemyNear(var(58)),animtime < -6
Trigger2 = StateNo = [200,1999]
Trigger3 = enemynear(var(58)),stateno = [200,499]
Trigger4 = enemynear(var(58)),StateNo = 1110

[State -3,バックステップ 投げ外し]
Type = ChangeState;ChangeState
Value = ifelse(enemynear(var(58)),animtime < -34,ifelse(random<=500,ifelse(random <= 900,120,ifelse(P2BodyDist x < 30 && random <= 500,ifelse(random<=500,1100,750),750)),120),120)
TriggerAll = var(59) = 1
triggerall = enemynear(var(58)),animtime < -34 || (enemynear(var(58)),animtime = [-34,-4)) && P2BodyDist X <= 30 || (enemynear(var(58)),animtime = [-34,-10)) && (P2BodyDist X = [30,60]) || (enemynear(var(58)),animtime = [-34,-15)) && (P2BodyDist X = [60,100]) || (enemynear(var(58)),animtime = [-34,-20)) && P2BodyDist X > 100
TriggerAll = RoundState = 2
TriggerAll = StateType != A
TriggerAll = Enemynear(var(58)),stateno >= 1000
TriggerAll = playerid(helper(33700+id),var(1)),stateno = fvar(0) || playerid(helper(33700+id),var(1)),stateno = fvar(1) || playerid(helper(33700+id),var(1)),stateno = fvar(2) || playerid(helper(33700+id),var(1)),stateno = fvar(3) || playerid(helper(33700+id),var(1)),stateno = fvar(4)
TriggerAll = (playerid(helper(33700+id),var(1)),stateno != [358000,358006]) && playerid(helper(33700+id),var(1)),stateno != 5150
TriggerAll = Movetype = A && stateno >= 200 || movetype = I
TriggerAll = Enemynear(var(58)),ctrl = 0
TriggerAll = Enemynear(var(58)),movetype != H
trigger1 = ctrl || (stateno = [20,22]) || stateno = 52 || (stateno = [120,149])
Trigger2 = Stateno = [200,505]; && Animelem = 2,> 0
Trigger3 = Stateno = [980,981]
IgnoreHitPause = 1

[State -3,バックステップ 投げ外し]
Type = ChangeState;ChangeState
Value = ifelse(enemynear(var(58)),animtime < -34,ifelse(random<=500,ifelse(random <= 900,120,ifelse(P2BodyDist x < 30 && random <= 500,ifelse(random<=500,1100,750),750)),120),120)
TriggerAll = var(59) = 1
triggerall = enemynear(var(58)),animtime < -34 || (enemynear(var(58)),animtime = [-34,-4)) && P2BodyDist X <= 30 || (enemynear(var(58)),animtime = [-34,-10)) && (P2BodyDist X = [30,60]) || (enemynear(var(58)),animtime = [-34,-15)) && (P2BodyDist X = [60,100]) || (enemynear(var(58)),animtime = [-34,-20)) && P2BodyDist X > 100
TriggerAll = RoundState = 2
TriggerAll = StateType != A
TriggerAll = Enemynear(var(58)),movetype != H
TriggerAll = Enemynear(var(58)),stateno >= 1000
TriggerAll = playerid(helper(33700+id),var(1)),stateno = fvar(0) || playerid(helper(33700+id),var(1)),stateno = fvar(1) || playerid(helper(33700+id),var(1)),stateno = fvar(2) || playerid(helper(33700+id),var(1)),stateno = fvar(3) || playerid(helper(33700+id),var(1)),stateno = fvar(4)
TriggerAll = (playerid(helper(33700+id),var(1)),stateno != [358000,358006]) && playerid(helper(33700+id),var(1)),stateno != 5150
TriggerAll = Movetype = A && stateno >= 200 || movetype = I
TriggerAll = Enemynear(var(58)),ctrl = 0
TriggerAll = p2name != "Gustab Munchausen" && p4name != "Gustab Munchausen"
Trigger1 = ctrl || (stateno = [20,22]) || stateno = 52 || (stateno = [120,149])
Trigger1 = (PrevStateNo = [200,440]) || (PrevStateNo = [700,720]) || (PrevStateNo = [5000,5270]) || PrevStateNo = 52000
Trigger2 = Stateno = [200,505]; && Animelem = 2,> 0
Trigger3 = Stateno = [980,981]
IgnoreHitPause = 1

[State -3,バックステップ 投げ外し]
Type = ChangeState;ChangeState
Value = ifelse(enemynear(var(58)),animtime < -34,ifelse(random<=500,ifelse(random <= 900,120,ifelse(P2BodyDist x < 30 && random <= 500,ifelse(random<=500,1100,750),750)),120),120)
TriggerAll = var(59) = 1
TriggerAll = RoundState = 2
TriggerAll = StateType != A
triggerall = enemynear(var(58)),animtime < -34 || (enemynear(var(58)),animtime = [-34,-4)) && P2BodyDist X <= 30 || (enemynear(var(58)),animtime = [-34,-10)) && (P2BodyDist X = [30,60]) || (enemynear(var(58)),animtime = [-34,-15)) && (P2BodyDist X = [60,100]) || (enemynear(var(58)),animtime = [-34,-20)) && P2BodyDist X > 100
TriggerAll = ctrl || (stateno = [20,22]) || stateno = 52 || (stateno = [120,149])
TriggerAll = Enemynear(var(58)),stateno >= 1000
TriggerAll = playerid(helper(33700+id),var(1)),stateno = fvar(0) || playerid(helper(33700+id),var(1)),stateno = fvar(1) || playerid(helper(33700+id),var(1)),stateno = fvar(2) || playerid(helper(33700+id),var(1)),stateno = fvar(3) || playerid(helper(33700+id),var(1)),stateno = fvar(4)
TriggerAll = playerid(helper(33700+id),var(1)),stateno != 358002 && playerid(helper(33700+id),var(1)),stateno != 5150
TriggerAll = p2name != "Gustab Munchausen" && p4name != "Gustab Munchausen"
TriggerAll = Enemynear(var(58)),movetype != H
Trigger1 = Movetype = A && stateno >= 200 || movetype = I
Trigger1 = Enemynear(var(58)),ctrl = 0
Trigger2 = p2stateno >= 1000
Trigger2 = p2MoveType = I && !Enemynear(var(58)),NumProj
Trigger3 = p2stateno >= 1000
Trigger3 = p2stateno != [5000,5500]
Trigger3 = p2MoveType = H && !NumTarget

[State -1,ブラックアウト 空キャン]
Type = ChangeState;ChangeState
Value = ifelse(random<=500,1100,750)
TriggerAll = var(59)
TriggerAll = RoundState = 2 && enemynear(var(58)),life > 0 
TriggerAll = EnemyNear(var(58)),facing != facing
TriggerAll = StateType != A
TriggerAll = MoveType != H
TriggerAll = EnemyNear(var(58)),MoveType = A
TriggerAll = EnemyNear(var(58)),stateno != [5000,5500]
TriggerAll = (StateNo = [200,440])
Trigger1 = Enemy,StateNo = var(26)
Trigger1 = (var(27) != [0,1])
Trigger2 = Enemy,StateNo = var(27)
Trigger2 = (var(28) != [0,1])
IgnoreHitPause = 1

[State -1,ブラックアウト 空キャン]
Type = ChangeState
Value = ifelse(random<=500,1100,750)
TriggerAll = var(59)
TriggerAll = RoundState = 2 && enemynear(var(58)),life > 0 
TriggerAll = EnemyNear(var(58)),facing != facing
TriggerAll = StateType != A
TriggerAll = MoveType != H
TriggerAll = EnemyNear(var(58)),stateno != [5000,5500]
TriggerAll = (StateNo = [200,440]) && MoveReversed
TriggerAll = (p2bodydist x = [0,100])
Trigger1 = Enemy,prevStateNo = var(26)
Trigger1 = Enemy,movetype = A
Trigger2 = Enemy,prevStateNo = var(27)
Trigger2 = Enemy,movetype = A
IgnoreHitPause = 1

;?制--------------------------------------------------------------------------------

[State -1, RUN]
Type = ChangeState
Value = ifelse(random<=333 && P2BodyDist X <= 60 && (stateno != [200,490]),810,ifelse(random<=500 && var(41) > 100 && P2BodyDist X <= 40 && var(49) > 15,30,34))
TriggerAll = var(59) 
TriggerAll = var(49) > 4  
TriggerAll = RoundState = 2
TriggerAll = random <= 500
TriggerAll = StateType != A
TriggerAll = EnemyNear(var(58)),StateType != A
TriggerAll = EnemyNear(var(58)),StateType != L
TriggerAll = EnemyNear(var(58)),MoveType = H
TriggerAll = EnemyNear(var(58)),stateno != [5000,5199]
TriggerAll = Abs(EnemyNear(var(58)),Pos X - Pos X) <= 150 ;大概多少距?自己算，??内部AI里面要保??面在被打（防御和真被打）情况下一直?而不停
TriggerAll =!InGuardDist
Trigger1 = stateno = 52 && time = 1 || (stateno = [200,490]) && animtime = 0 || stateno = 1000 && animtime = 0 || stateno = 1404 && animtime = 0


[State -1, しゃがみ弱キック 下段起き攻め]
type = ChangeState
value = ifelse(var(44) = 1,ifelse(random<=500,400,500),ifelse(random<=500,205,305))
triggerall = var(59) = 1
triggerall = var(44) = 1
triggerall = RoundState = 2
triggerall = StateType != A
triggerall = P2BodyDist X = [-20,20]
triggerall = ctrl || (stateno = [20,22]) || (stateno = [100,101]) || (stateno = [120,149])
trigger1 = enemynear(var(58)),stateno = 5120
trigger1 = enemynear(var(58)),animtime = -1

[State -1, しゃがみ弱キック 下段起き攻め]
type = ChangeState
value = ifelse(random<=500 && P2BodyDist X >= 40,30,34)
triggerall = var(59) = 1
triggerall = var(44) = 2
triggerall = RoundState = 2
triggerall = StateType != A
triggerall = P2BodyDist X = [-20,60]
triggerall = ctrl || (stateno = [20,22]) || (stateno = [100,101]) || (stateno = [120,149])
trigger1 = enemynear(var(58)),stateno = 5120
trigger1 = enemynear(var(58)),animtime = [-20,0]

[State -1, しゃがみ弱キック 下段起き攻め]
type = ChangeState
value = 810
triggerall = var(59) = 1
triggerall = var(44) = 3
triggerall = RoundState = 2
triggerall = StateType != A
triggerall = P2BodyDist X = [-20,60]
triggerall = ctrl || (stateno = [20,22]) || (stateno = [100,101]) || (stateno = [120,149])
trigger1 = enemynear(var(58)),stateno = 5120
trigger1 = enemynear(var(58)),animtime = [-10,0]


[State -1, バックステップ／ハイジャンプ 起き攻め放棄]
type = ChangeState
value = 1105
triggerall = var(59) = 1
triggerall = helper(35002),var(57) != 1
triggerall = var(44)
triggerall = RoundState = 2
triggerall = StateType != A
triggerall = ctrl || (stateno = [20,22]) || (stateno = [100,101]) || (stateno = [120,149])
trigger1 = BackEdgeBodyDist <= 20
trigger1 = enemynear(var(58)),statetype = L && p2bodydist X <= 80 && !Inguarddist
trigger1 = enemynear(var(58)),stateno != 5120

;?反-----------------------------------------------------------------------------

[State -1, Stand Strong Punch]
type = ChangeState
value = 205
triggerall = var(59) = 1
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
triggerall = statetype != A
triggerall = enemynear(var(58)),ctrl = 0
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),movetype != I
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),movetype != H
triggerall = enemynear(var(58)),stateno >= 200
triggerall = enemynear(var(58)),animtime <= -4
triggerall = enemy,numproj = 0 && helper(24000 +id),var(57) = 0 || !Helper(25000+ID),InGuardDist
triggerall =!InGuardDist || enemynear(var(58)),facing = facing || enemynear(var(58)),AnimTime = -4 && (PrevStateNo = [130,155]) || enemynear(var(58)),AnimTime = -4 && (prevstateno = [750,760])
triggerall = p2bodydist X < 15
triggerall = ctrl || (stateno = [20,22]) || stateno = 52 || (stateno = [100,101]) || (stateno = [120,149])
trigger1 = VAR(34):= 20501

[State -1, Stand Strong Punch]
type = ChangeState;ChangeState
value = ifelse(random <= 500,400,500)
triggerall = var(59) = 1
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
triggerall = statetype != A
triggerall = enemynear(var(58)),ctrl = 0
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),movetype != I
triggerall = enemynear(var(58)),movetype != H
triggerall = enemynear(var(58)),stateno >= 200
triggerall = enemynear(var(58)),animtime <= -5
triggerall = enemy,numproj = 0 && helper(24000 +id),var(57) = 0 || !Helper(25000+ID),InGuardDist
triggerall =!InGuardDist || enemynear(var(58)),facing = facing || enemynear(var(58)),AnimTime = -5 && (PrevStateNo = [130,155]) || enemynear(var(58)),AnimTime = -5 && (prevstateno = [750,760])
triggerall = p2bodydist X < 30
triggerall = ctrl || (stateno = [20,22]) || stateno = 52 || (stateno = [100,101]) || (stateno = [120,149])
trigger1 = VAR(34):= 20502

[State -1, Stand Strong Punch]
type = ChangeState;ChangeState
value = 505
triggerall = var(59) = 1
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
triggerall = statetype != A
triggerall = enemynear(var(58)),ctrl = 0
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),movetype != H
triggerall = enemynear(var(58)),facing != facing
triggerall = enemynear(var(58)),stateno >= 200
triggerall = helper(35002),var(57) != 1
triggerall = enemynear(var(58)),animtime = -8
triggerall = enemy,numproj = 0 && helper(24000 +id),var(57) = 0 || !Helper(25000+ID),InGuardDist
triggerall =!InGuardDist || enemynear(var(58)),facing = facing || enemynear(var(58)),AnimTime = -8 && (PrevStateNo = [130,155]) || enemynear(var(58)),AnimTime = -8 && (prevstateno = [750,760])
triggerall = ctrl || (stateno = [20,22]) || stateno = 52 || (stateno = [100,101]) || (stateno = [120,149])
trigger1 = p2bodydist x = [30,70]
trigger1 = VAR(34):= 21503

[State -1, Crouching Light Punch]
type = ChangeState
value = ifelse(Random <= 500 && P2BodyDist X < 10,205,ifelse(random<=500,500,400))
triggerall = var(59)
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = helper(35002),var(57) != 1
triggerall = !(P2stateno >= 200 && P2movetype = I && (EnemyNear(var(58)),ANIMTIME = [-12,-6]))
triggerall = !(enemynear(var(58)),facing = facing && enemynear(var(58)),statetype = A)
triggerall = ctrl || stateno = 20|| stateno = 21|| stateno = 22|| stateno = 100
triggerall = P2BodyDist X = [-20+floor(4*(EnemyNear(floor(fvar(37))),vel X)),35+floor(4*(EnemyNear(floor(fvar(37))),vel X))]
triggerall = P2BodyDist Y = [-10-floor(4*(EnemyNear(floor(fvar(37))),vel Y)+(4*(4+1)/2)*fvar(20)),0-floor(4*(EnemyNear(floor(fvar(37))),vel Y)+(4*(4+1)/2)*fvar(20))]
triggerall = P2statetype != L
triggerall = P2statetype != A
triggerall = P2movetype != H
triggerall = !InGuardDist
triggerall = P2movetype != A
TriggerAll = Random <= 150||(life<ceil(lifemax/3)) && Random <= 250||helper(35002),var(40)>=10 && Random <= 500||P2stateno >= 1000
trigger1 = VAR(34):= 40002

[State -1, Crouching Light Kick]
type = ChangeState
value = 305
triggerall = var(59)
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = helper(35002),var(57) != 1
triggerall = !(P2stateno >= 200 && P2movetype = I && (EnemyNear(var(58)),ANIMTIME = [-17,-7]))
triggerall = !(enemynear(var(58)),facing = facing && enemynear(var(58)),statetype = A)
triggerall = ctrl || stateno = 20|| stateno = 21|| stateno = 22|| stateno = 100
triggerall = P2BodyDist X = [-5,10]
triggerall = P2BodyDist Y >= 0--floor(6*(EnemyNear(floor(fvar(37))),vel Y)+(6*(6+1)/2)*fvar(20))
triggerall = P2statetype != L
triggerall = P2statetype != A
triggerall = P2movetype != H
triggerall = P2statetype != C
triggerall = !InGuardDist
trigger1 = VAR(34):= 40003

[State -1, Crouching Light Kick]
type = ChangeState
value = 505
triggerall = var(59)
Triggerall = HELPER(35002),VAR(57) = 1
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = ctrl || stateno = 20|| stateno = 21|| stateno = 22|| stateno = 100
triggerall = P2BodyDist X <= 70
triggerall = enemynear(var(58)),animtime >= -8 && time >= 8 && P2BodyDist X >= 40
triggerall = !InGuardDist
Trigger1 = Random <= 1000

[State -1, Crouching Light Kick]
type = ChangeState
value = ifelse(random<=500,400,500)
triggerall = var(59)
Triggerall = HELPER(35002),VAR(57) = 1
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = ctrl || stateno = 20|| stateno = 21|| stateno = 22|| stateno = 100
triggerall = (enemynear(var(58)),animtime = [-4,0]) && P2BodyDist X <= 40
triggerall = !InGuardDist
Trigger1 = Random <= 1000

[State -1, Crouching Light Kick]
type = ChangeState;ChangeState
value = ifelse(Random <= 500 && P2BodyDist X < 10,ifelse(random<=666,ifelse(random<=500,205,305),215),ifelse(random<=500,400,500))
triggerall = var(59)
Triggerall = HELPER(35002),VAR(57) != 1
triggerall = var(29) = 0
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = ctrl || stateno = 20|| stateno = 21|| stateno = 22|| stateno = 100
triggerall = P2BodyDist X = [-5,35]
triggerall = P2BodyDist Y >= 0
triggerall = P2statetype != L
triggerall = P2movetype = H
triggerall = P2statetype != A
triggerall = !InGuardDist
Trigger1 = Random <= 150
trigger1 = VAR(34):= 40004

[State -1, Crouching Light Kick]
type = ChangeState
value = ifelse(Random <= 500 && P2BodyDist X < 10,ifelse(random<=666,ifelse(random<=500,205,305),215),ifelse(random<=500,400,500))
triggerall = var(59)
triggerall = fvar(18) > -1
triggerall = var(29) > 0
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = ctrl || stateno = 20|| stateno = 21|| stateno = 22|| stateno = 100
triggerall = P2BodyDist X = [-5,15]
triggerall = P2BodyDist Y >= 0
triggerall = P2statetype != L
triggerall = P2movetype = H
triggerall = P2statetype != A
triggerall = !InGuardDist
Trigger1 = Random <= 1000
trigger1 = VAR(34):= 40005

[State -1, Standing Strong Kick]
type = ChangeState
value = 505
triggerall = var(59)
triggerall = helper(35002),var(45) = 0
triggerall = helper(35002),var(57) != 1
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = ctrl || (stateno = [20,22])|| (stateno = [100,101]) || stateno = 53 || (stateno = [120,149])
triggerall = P2BodyDist X = [40,60]
triggerall = p2bodydist y = [IFELSE((enemynear(var(58)),prevstateno = 293 || enemynear(var(58)),stateno = 293),30,10)-floor(8*(enemynear(var(58)),vel y)+(8*(8+1)/2)*fvar(20)),200-floor(8*(enemynear(var(58)),vel y)+(8*(8+1)/2)*fvar(20))]
triggerall = enemynear(var(58)),facing != facing
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),movetype != H || (enemynear(var(58)),stateno = [120,159]) || enemynear(var(58)),stateno = 5040 || enemynear(var(58)),stateno = 293
triggerall =!helper(31000+id),inguarddist
Trigger1 = Random <= 1000
trigger1 = VAR(34):= 43001

[State -1, Standing Strong Kick]
type = ChangeState
value = 500
triggerall = var(59)
triggerall = helper(35002),var(45) = 0
triggerall = helper(35002),var(57) != 1
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = ctrl || (stateno = [20,22])|| (stateno = [100,101]) || stateno = 53 || (stateno = [120,149])
triggerall = P2BodyDist X = [-25,40]
triggerall = p2bodydist y = [IFELSE((enemynear(var(58)),prevstateno = 293 || enemynear(var(58)),stateno = 293),30,10)-floor(5*(enemynear(var(58)),vel y)+(5*(5+1)/2)*fvar(20)),200-floor(5*(enemynear(var(58)),vel y)+(5*(5+1)/2)*fvar(20))]
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),movetype != H || (enemynear(var(58)),stateno = [120,159]) || enemynear(var(58)),stateno = 5040 || enemynear(var(58)),stateno = 293
triggerall =!helper(31000+id),inguarddist
Trigger1 = Random <= 1000
trigger1 = VAR(34):= 43001


;抓硬直-----------------------------------------------------------------------------
;ダッシュ(隙突き)
[State -1, Dash]
type = ChangeState
value = 100
triggerall = var(59) = 1
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
triggerall = statetype != A
TriggerAll =!InGuardDist && !(helper(31000+id),inguarddist && (helper(24000 + id),var(57) > 0 || enemy,NumProj > 0))
Triggerall = P2BodyDist X > 0
triggerall = ctrl || (stateno = [20,22]) || stateno = 52 || (stateno = [120,149])
trigger1 = p2bodydist x > 120 || enemynear(var(58)),facing = facing
trigger1 = enemynear(var(58)),statetype = A
trigger1 = enemynear(var(58)),MoveType = A
trigger1 = !enemynear(var(58)),HitDefAttr = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT
trigger1 = enemynear(var(58)),Time >= 60
trigger1 = var(34):= 10001
trigger2 = !helper(31000+id),inguarddist
trigger2 = enemynear(var(58)),MoveType != H
trigger2 = enemynear(var(58)),StateType = A
trigger2 = !enemynear(var(58)),Ctrl
trigger2 = enemynear(var(58)),facing = facing
trigger2 = var(34):= 10002
Trigger3 = EnemyNear(var(58)),MoveType != H
Trigger3 = EnemyNear(var(58)),StateType != A
Trigger3 = !EnemyNear(var(58)),Ctrl
Trigger3 = EnemyNear(var(58)),facing = facing
Trigger3 = EnemyNear(var(58)),HitDefAttr = SC, NA, SA, HA
trigger3 = var(34):= 10003

[State -3, Stand Strong Punch]
type = ChangeState
value = 205
triggerall = var(59)
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
triggerall = statetype != A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),movetype = A
triggerall = enemynear(var(58)),ctrl = 0
triggerall = enemynear(var(58)),stateno = [200,1000)
triggerall = p2bodydist X = [-5,15]
triggerall = ctrl || (stateno = [20,22]) || stateno = 52 || (stateno = [100,101]) || (stateno = [120,149])
trigger1 = (enemynear(var(58)), StateNo = Helper(999), var(1)) && enemynear(var(58)), Time < (Helper(999), var(2) - 4)
trigger2 = (enemynear(var(58)), StateNo = Helper(999), var(3)) && enemynear(var(58)), Time < (Helper(999), var(4) - 4)
trigger3 = (enemynear(var(58)), StateNo = Helper(999), var(5)) && enemynear(var(58)), Time < (Helper(999), var(6) - 4)
trigger4 = (enemynear(var(58)), StateNo = Helper(999), var(7)) && enemynear(var(58)), Time < (Helper(999), var(8) - 4)
trigger5 = (enemynear(var(58)), StateNo = Helper(999), var(9)) && enemynear(var(58)), Time < (Helper(999), var(10) - 4)
trigger6 = (enemynear(var(58)), StateNo = Helper(999), var(11)) && enemynear(var(58)), Time < (Helper(999), var(12) - 4)
trigger7 = (enemynear(var(58)), StateNo = Helper(999), var(13)) && enemynear(var(58)), Time < (Helper(999), var(14) - 4)
trigger8 = (enemynear(var(58)), StateNo = Helper(999), var(15)) && enemynear(var(58)), Time < (Helper(999), var(16) - 4)
trigger9 = (enemynear(var(58)), StateNo = Helper(999), var(17)) && enemynear(var(58)), Time < (Helper(999), var(18) - 4)
trigger10 = (enemynear(var(58)), StateNo = Helper(999), var(19)) && enemynear(var(58)), Time < (Helper(999), var(20) - 4)
trigger11 = (enemynear(var(58)), StateNo = Helper(999), var(21)) && enemynear(var(58)), Time < (Helper(999), var(22) - 4)
trigger12 = (enemynear(var(58)), StateNo = Helper(999), var(23)) && enemynear(var(58)), Time < (Helper(999), var(24) - 4)
trigger13 = (enemynear(var(58)), StateNo = Helper(999), var(25)) && enemynear(var(58)), Time < (Helper(999), var(26) - 4)
trigger14 = (enemynear(var(58)), StateNo = Helper(999), var(27)) && enemynear(var(58)), Time < (Helper(999), var(28) - 4)
trigger15 = (enemynear(var(58)), StateNo = Helper(999), var(29)) && enemynear(var(58)), Time < (Helper(999), var(30) - 4)
trigger16 = (enemynear(var(58)), StateNo = Helper(999), var(31)) && enemynear(var(58)), Time < (Helper(999), var(32) - 4)
trigger17 = (enemynear(var(58)), StateNo = Helper(999), var(33)) && enemynear(var(58)), Time < (Helper(999), var(34) - 4)
trigger18 = (enemynear(var(58)), StateNo = Helper(999), var(35)) && enemynear(var(58)), Time < (Helper(999), var(36) - 4)
trigger19 = (enemynear(var(58)), StateNo = Helper(999), var(37)) && enemynear(var(58)), Time < (Helper(999), var(38) - 4)
trigger20 = (enemynear(var(58)), StateNo = Helper(999), var(39)) && enemynear(var(58)), Time < (Helper(999), var(40) - 4)
trigger21 = (enemynear(var(58)), StateNo = Helper(999), var(41)) && enemynear(var(58)), Time < (Helper(999), var(42) - 4)
trigger22 = (enemynear(var(58)), StateNo = Helper(999), var(43)) && enemynear(var(58)), Time < (Helper(999), var(44) - 4)
trigger23 = (enemynear(var(58)), StateNo = Helper(999), var(45)) && enemynear(var(58)), Time < (Helper(999), var(46) - 4)
trigger24 = (enemynear(var(58)), StateNo = Helper(999), var(47)) && enemynear(var(58)), Time < (Helper(999), var(48) - 4)
trigger25 = (enemynear(var(58)), StateNo = Helper(999), var(49)) && enemynear(var(58)), Time < (Helper(999), var(50) - 4)
trigger26 = (enemynear(var(58)), StateNo = Helper(999), var(51)) && enemynear(var(58)), Time < (Helper(999), var(52) - 4)
trigger27 = (enemynear(var(58)), StateNo = Helper(999), var(53)) && enemynear(var(58)), Time < (Helper(999), var(54) - 4)
trigger28 = (enemynear(var(58)), StateNo = Helper(999), var(55)) && enemynear(var(58)), Time < (Helper(999), var(56) - 4)

;bc?段---------------------------------------------------------------------------

[State -1, クイックMAX]
type = ChangeState
value = 791
triggerall = var(59) = 1
triggerall = power >= 2000 && var(51) = 0
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
triggerall = statetype != A
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),movetype = H
triggerall = EnemyNear(var(58)),LIFE>CEIL(LIFEMAX/3)
triggerall = movehit
trigger1 = stateno = 801 && movehit = 3

;MAX発動
[State -1, MAX発動]
type = ChangeState
value = 790
triggerall = var(59)
triggerall = var(50) = 1
triggerall = power >= 1000 && var(51) = 0
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
triggerall = statetype != A
triggerall = enemynear(var(58)),statetype = A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),movetype = H
triggerall = VAR(41) <= 125
trigger1 = stateno = 1010 && animtime = 0


[State -1, Stand Strong Punch]
type = ChangeState
value = 215
triggerall = var(59)
triggerall = var(41) > 100 || var(51) > 0
triggerall = P2bodydist X <= 25
triggerall = statetype != A
triggerall = var(50) = 3
trigger1 = VAR(49) <= 11
trigger1 = stateno = 99
trigger1 = p2statetype!=A&&p2statetype!=L

[State -1, Stand Strong Punch]
type = ChangeState
value = ifelse(random<=500,610,710)
triggerall = var(59)
triggerall = statetype = A
triggerall = var(51) > 700
trigger1 = stateno = 50 && time = 2 && vel y < 0
trigger1 = p2statetype!=A&&p2statetype!=L


[State -1, bc1]
type = ChangeState;ChangeState
value = var(57)
;triggerall = var(59) = 1
triggerall = RoundState = 2 && enemynear(var(58)),life > 0
triggerall = var(51) > 0
triggerall = statetype != A || stateno = 1305
triggerall = enemynear(var(58)),statetype = A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),movetype = H
triggerall = enemynear(var(58)),stateno >= 5000
trigger1 = stateno = 1205 && movehit && TIME >= 19
trigger1 = var(57):= IFELSE(var(51) < 200,3000,1305)
trigger2 = var(51) >= 200 || VAR(50) = 4 || VAR(50) = 7 && power < 3000
trigger2 = ctrl || stateno = 0 || (stateno = [19,22]) || (stateno = [99,101]) || (stateno = [120,149]) 
trigger2 = p2bodydist y = [-10-floor(8*(enemynear(var(58)),vel y)+(8*(8+1)/2)*fvar(20)),50-floor(8*(enemynear(var(58)),vel y)+(8*(8+1)/2)*fvar(20))]
trigger2 = var(57):= 1205
trigger3 = var(51) < 200 && VAR(50) = 5
trigger3 = ctrl || stateno = 0 || (stateno = [19,22]) || (stateno = [99,101]) || (stateno = [120,149]) 
trigger3 = p2bodydist y = [-20-floor(14*(enemynear(var(58)),vel y)+(14*(14+1)/2)*fvar(20)),20-floor(14*(enemynear(var(58)),vel y)+(14*(14+1)/2)*fvar(20))]
trigger3 = var(57):= 3100
trigger4 = var(51) < 200 && VAR(50) = 6
trigger4 = ctrl || stateno = 0 || (stateno = [19,22]) || (stateno = [99,101]) || (stateno = [120,149])
trigger4 = p2bodydist y = [-30-floor(4*(enemynear(var(58)),vel y)+(4*(4+1)/2)*fvar(20)),20-floor(4*(enemynear(var(58)),vel y)+(4*(4+1)/2)*fvar(20))]
trigger4 = var(57):= 3300
trigger5 = var(51) < 200 && (VAR(50) = 8 && power >= 1000 || VAR(50) = 7 && power >= 3000)
trigger5 = ctrl || stateno = 0 || (stateno = [19,22]) || (stateno = [99,101]) || (stateno = [120,149]) 
trigger5 = p2bodydist y = [-20-floor(7*(enemynear(var(58)),vel y)+(7*(7+1)/2)*fvar(20)),20-floor(7*(enemynear(var(58)),vel y)+(7*(7+1)/2)*fvar(20))]
trigger5 = var(57):= ifelse(random<=500,3200,3110)
trigger6 = stateno = 1310 && movehit
trigger6 = var(57):= 1205
trigger7 = stateno = 1305 && time >= 7
trigger7 = var(57):= 1310

[State -1, bc1]
type = ChangeState;ChangeState
value = var(57)
;triggerall = var(59) = 1
triggerall = RoundState = 2 && enemynear(var(58)),life > 0
triggerall = var(51) > 0
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),movetype = H
triggerall = enemynear(var(58)),stateno >= 5000
trigger1 = stateno = 610 && movehit || stateno = 710 && movehit
trigger1 = var(57):= 1400
trigger2 = stateno = 801 && movehit = 3
trigger2 = var(57):= 1205
trigger3 = stateno = 1305 && time >= 7
trigger3 = var(57):= 1310


;ab-------------------------------------------------------------------------------

[State -1, BB]
Type = ChangeState
Value = ifelse(var(41) <= 100,760,750)
TriggerAll = var(59)
TriggerAll = roundstate = 2 && EnemyNear(var(58)),life > 0 && fvar(22) = 0
TriggerAll = StateNo = 5120 && AnimTime = [-1,0]
TriggerAll = Abs(EnemyNear(var(58)),Pos X - Pos X) = [0,80]
trigger1 = Random <= 10|| Life <= ceil(lifemax/3)&& Random <= 100


[State -1, GCFRoll]
type = ChangeState
value = 750
triggerall = var(59) 
triggerall = RoundState = 2
triggerall = power >= 1000
triggerall = Random <= 10|| Life <= ceil(lifemax/3) && Random <= 100||helper(35002),var(40) >= 10
triggerall = StateType != A
triggerall = (stateno = 150 || stateno = 152) && HitShakeOver
trigger1 = p2bodydist x = [0,100]
trigger1 = enemynear(var(58)),StateNo >= 200
trigger1 = enemynear(var(58)),statetype != A
trigger1 = enemynear(var(58)),MoveType = A
trigger1 = enemynear(var(58)),AnimTime <= -30

[State -1, GC_Q]
type = ChangeState
value = 750
triggerall = var(59)
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = Power >= 1000
triggerall = Random <= 10 || Life <= ceil(lifemax/3)&& Random <= 100||helper(35002),var(40) >= 10
triggerall = EnemyNear(var(58)),statetype != L
triggerall = EnemyNear(var(58)),statetype != A
triggerall = EnemyNear(var(58)),StateNo >= 200
triggerall = !EnemyNear(var(58)),Ctrl 
TriggerAll = EnemyNear(var(58)),facing + facing = 0
triggerall = StateNo = 150 || StateNo = 151 || StateNo = 152
trigger1 = P2BodyDist X = [-10,160]
trigger1 = EnemyNear(var(58)),HitDefAttr = SCA,NP,SP,HP||EnemyNear(var(58)),numproj
trigger1 = EnemyNear(var(58)),AnimTime<=-29
trigger2 = P2BodyDist X = [-10,100]
trigger2 = EnemyNear(var(58)),AnimTime<=-30

;前転
[State -1, FRoll]
type = ChangeState
value = ifelse(random<=500,1100,750)
triggerall = var(59) 
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 
triggerall = enemynear(var(58)),time >= 0   
triggerall = Random <= 10|| Life <= ceil(lifemax/3) && Random <= 100||helper(35002),var(40) >= 10
triggerall = statetype != A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),movetype != H
triggerall = enemynear(var(58)),StateNo >= 200
triggerall =!enemynear(var(58)),HitDefAttr = SCA, AT
triggerall = enemynear(var(58)),facing != facing
triggerall = InGuardDist
triggerall = ctrl || (stateno = [20,22]) || (stateno = [100,101]) || (stateno = [120,149])
trigger1 = p2bodydist X = [0,150]
trigger1 = enemynear(var(58)),animtime <= -34


[state -1,回り込み、後 切り返し]
Type = ChangeState
value = IFELSE(VAR(42) < 150,ifelse(random<=500,1100,1105),760)
TriggerAll = var(59) = 1
TriggerAll = RoundState = 2
triggerall = Random <= 10||Life <= ceil(lifemax/3) && Random <= 100
TriggerAll = StateType != A
TriggerAll = BackEdgeBodyDist >= 40
TriggerAll =!Enemy,Numproj
TriggerAll = EnemyNear(var(58)),MoveType = A && EnemyNear(var(58)),StateNo >= 200
TriggerAll = EnemyNear(var(58)),StateType != A
TriggerAll =!EnemyNear(var(58)),HitDefAttr = SC, NT, ST, HT
TriggerAll = EnemyNear(var(58)),Time >= 0
TriggerAll = EnemyNear(var(58)),facing != facing
TriggerAll = InGuardDist
TriggerAll = Ctrl || (StateNo = [120,149]) || StateNo = 100
Trigger1 =(P2BodyDist X = [-5,50]) &&  EnemyNear(var(58)),AnimTime > -3
Trigger2 =(P2BodyDist X = [30,70]) &&  EnemyNear(var(58)),AnimTime > -30


;後転
[State -1, BRoll]
type = ChangeState
value = IFELSE(VAR(42) < 150,ifelse(random<=500,1100,1105),760)
triggerall = var(59) = 1
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
triggerall = enemynear(var(58)),time >= 0
triggerall = Random <= 10||Life <= ceil(lifemax/3) && Random <= 100
triggerall = statetype != A
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),Vel X <= 0
triggerall = enemynear(var(58)),StateNo >= 200
triggerall = enemynear(var(58)),MoveType = A
triggerall =!enemynear(var(58)),HitDefAttr = SCA, NT, ST, HT
triggerall = enemynear(var(58)),facing != facing
triggerall = p2bodydist x <= 25 && enemynear(var(58)),AnimTime > -5 || p2bodydist x > 25
triggerall = BackEdgeBodyDist >= 20
triggerall = InGuardDist
triggerall =!enemy,numproj
triggerall = ctrl || (stateno = [20,22]) || stateno = 52 || (stateno = [100,101]) || (stateno = [120,149])
trigger1 = p2bodydist x <= 45 && enemynear(var(58)),AnimTime >= -5
trigger2 = p2bodydist x <= 55 && enemynear(var(58)),AnimTime >= -16
trigger3 = p2bodydist x <= 65 && enemynear(var(58)),AnimTime >= -17
trigger4 = p2bodydist x <= 75 && enemynear(var(58)),AnimTime >= -18
trigger5 = p2bodydist x <= 85 && enemynear(var(58)),AnimTime >= -19
trigger6 = p2bodydist x <= 95 && enemynear(var(58)),AnimTime >= -20

[State -1, 中ジャンプ(対投げ用)]
type = ChangeState
value = ifelse(enemynear(var(58)),AnimTime <= -20,34,105)
triggerall = var(59) = 1
triggerall = EnemyNear(var(58)),facing != facing
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
triggerall = StateType != A
triggerall = ctrl || (stateno = [20,22]) || stateno = 52 || (stateno = [100,101]) || (stateno = [120,149]) || (stateno = [750,760]) && animtime = 0
trigger1 = p2bodydist x = [-20,100]
trigger1 = enemynear(var(58)),statetype != A
trigger1 = enemynear(var(58)),HitDefAttr = SC, NT, ST, HT

;架招写在防御上面----------------------------------------------------------------------------

[State -1, Stand Strong Punch]
type = ChangeState
value = 1200
;triggerall = var(59)
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 
triggerall = statetype != A
triggerall=  enemynear(var(58)),movetype = A
triggerall=  enemynear(var(58)),statetype = A
triggerall=  enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),time >= 0
triggerall = p2bodydist x = [-45+floor(4*(enemynear(var(58)),vel x)),45+floor(4*(enemynear(var(58)),vel x))]
triggerall = p2bodydist y = [-50-floor(4*(enemynear(var(58)),vel y)+(4*(4+1)/2)*fvar(20)),30-floor(4*(enemynear(var(58)),vel y)+(4*(4+1)/2)*fvar(20))]
;TriggerAll = Random <= 150||(life<ceil(lifemax/3))&& Random <= 300 || helper(35002),var(40) >= 5
TriggerAll = Ctrl || (stateno = [19,22]) || (stateno = [100,101]) || (stateno = [120,149])|| (stateno = [150,159]) && HitShakeOver = 1 && time >= 15 && helper(35002),var(40) >= 10 || (stateno = [200,440])
trigger1 = (enemynear(var(58)), StateNo = Helper(999), var(1)) && enemynear(var(58)), Time = (Helper(999), var(2) - 3)
trigger2 = (enemynear(var(58)), StateNo = Helper(999), var(3)) && enemynear(var(58)), Time = (Helper(999), var(4) - 3)
trigger3 = (enemynear(var(58)), StateNo = Helper(999), var(5)) && enemynear(var(58)), Time = (Helper(999), var(6) - 3)
trigger4 = (enemynear(var(58)), StateNo = Helper(999), var(7)) && enemynear(var(58)), Time = (Helper(999), var(8) - 3)
trigger5 = (enemynear(var(58)), StateNo = Helper(999), var(9)) && enemynear(var(58)), Time = (Helper(999), var(10) - 3)
trigger6 = (enemynear(var(58)), StateNo = Helper(999), var(11)) && enemynear(var(58)), Time = (Helper(999), var(12) - 3)
trigger7 = (enemynear(var(58)), StateNo = Helper(999), var(13)) && enemynear(var(58)), Time = (Helper(999), var(14) - 3)
trigger8 = (enemynear(var(58)), StateNo = Helper(999), var(15)) && enemynear(var(58)), Time = (Helper(999), var(16) - 3)
trigger9 = (enemynear(var(58)), StateNo = Helper(999), var(17)) && enemynear(var(58)), Time = (Helper(999), var(18) - 3)
trigger10 = (enemynear(var(58)), StateNo = Helper(999), var(19)) && enemynear(var(58)), Time = (Helper(999), var(20) - 3)
trigger11 = (enemynear(var(58)), StateNo = Helper(999), var(21)) && enemynear(var(58)), Time = (Helper(999), var(22) - 3)
trigger12 = (enemynear(var(58)), StateNo = Helper(999), var(23)) && enemynear(var(58)), Time = (Helper(999), var(24) - 3)
trigger13 = (enemynear(var(58)), StateNo = Helper(999), var(25)) && enemynear(var(58)), Time = (Helper(999), var(26) - 3)
trigger14 = (enemynear(var(58)), StateNo = Helper(999), var(27)) && enemynear(var(58)), Time = (Helper(999), var(28) - 3)
trigger15 = (enemynear(var(58)), StateNo = Helper(999), var(29)) && enemynear(var(58)), Time = (Helper(999), var(30) - 3)
trigger16 = (enemynear(var(58)), StateNo = Helper(999), var(31)) && enemynear(var(58)), Time = (Helper(999), var(32) - 3)
trigger17 = (enemynear(var(58)), StateNo = Helper(999), var(33)) && enemynear(var(58)), Time = (Helper(999), var(34) - 3)
trigger18 = (enemynear(var(58)), StateNo = Helper(999), var(35)) && enemynear(var(58)), Time = (Helper(999), var(36) - 3)
trigger19 = (enemynear(var(58)), StateNo = Helper(999), var(37)) && enemynear(var(58)), Time = (Helper(999), var(38) - 3)
trigger20 = (enemynear(var(58)), StateNo = Helper(999), var(39)) && enemynear(var(58)), Time = (Helper(999), var(40) - 3)
trigger21 = (enemynear(var(58)), StateNo = Helper(999), var(41)) && enemynear(var(58)), Time = (Helper(999), var(42) - 3)
trigger22 = (enemynear(var(58)), StateNo = Helper(999), var(43)) && enemynear(var(58)), Time = (Helper(999), var(44) - 3)
trigger23 = (enemynear(var(58)), StateNo = Helper(999), var(45)) && enemynear(var(58)), Time = (Helper(999), var(46) - 3)
trigger24 = (enemynear(var(58)), StateNo = Helper(999), var(47)) && enemynear(var(58)), Time = (Helper(999), var(48) - 3)
trigger25 = (enemynear(var(58)), StateNo = Helper(999), var(49)) && enemynear(var(58)), Time = (Helper(999), var(50) - 3)
trigger26 = (enemynear(var(58)), StateNo = Helper(999), var(51)) && enemynear(var(58)), Time = (Helper(999), var(52) - 3)
trigger27 = (enemynear(var(58)), StateNo = Helper(999), var(53)) && enemynear(var(58)), Time = (Helper(999), var(54) - 3)
trigger28 = (enemynear(var(58)), StateNo = Helper(999), var(55)) && enemynear(var(58)), Time = (Helper(999), var(56) - 3)

[State -1, Stand Strong Punch]
type = ChangeState
value = 1200;ifelse(random <= 500,1100,1175)
triggerall = var(59)
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 
triggerall = statetype != A
triggerall=  enemynear(var(58)),movetype = A
triggerall=  enemynear(var(58)),statetype = A
triggerall=  enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),time >= 0
triggerall = p2bodydist x = [-45+floor(4*(enemynear(var(58)),vel x)),45+floor(4*(enemynear(var(58)),vel x))]
triggerall = p2bodydist y = [-50-floor(4*(enemynear(var(58)),vel y)+(4*(4+1)/2)*fvar(20)),30-floor(4*(enemynear(var(58)),vel y)+(4*(4+1)/2)*fvar(20))]
TriggerAll = Ctrl || (stateno = [19,22]) || (stateno = [100,101]) || (stateno = [120,149])|| (stateno = [150,159]) && HitShakeOver = 1 && time >= 15 && var(54) >= 10 || (stateno = [200,440]) ;&& stateno != 305
TriggerALL = EnemyNear(var(58)),StateNo = Helper(31000+ID),var(10) || EnemyNear(var(58)),StateNo = Helper(31000+ID),var(11) || EnemyNear(var(58)),StateNo = Helper(31000+ID),var(12) || EnemyNear(var(58)),StateNo = Helper(31000+ID),var(13) || EnemyNear(var(58)),StateNo = Helper(31000+ID),var(14)
trigger1 = (enemynear(var(58)), StateNo = Helper(999), var(1)) && enemynear(var(58)), Time = (Helper(999), var(2) - 3)
trigger2 = (enemynear(var(58)), StateNo = Helper(999), var(3)) && enemynear(var(58)), Time = (Helper(999), var(4) - 3)
trigger3 = (enemynear(var(58)), StateNo = Helper(999), var(5)) && enemynear(var(58)), Time = (Helper(999), var(6) - 3)
trigger4 = (enemynear(var(58)), StateNo = Helper(999), var(7)) && enemynear(var(58)), Time = (Helper(999), var(8) - 3)
trigger5 = (enemynear(var(58)), StateNo = Helper(999), var(9)) && enemynear(var(58)), Time = (Helper(999), var(10) - 3)
trigger6 = (enemynear(var(58)), StateNo = Helper(999), var(11)) && enemynear(var(58)), Time = (Helper(999), var(12) - 3)
trigger7 = (enemynear(var(58)), StateNo = Helper(999), var(13)) && enemynear(var(58)), Time = (Helper(999), var(14) - 3)
trigger8 = (enemynear(var(58)), StateNo = Helper(999), var(15)) && enemynear(var(58)), Time = (Helper(999), var(16) - 3)
trigger9 = (enemynear(var(58)), StateNo = Helper(999), var(17)) && enemynear(var(58)), Time = (Helper(999), var(18) - 3)
trigger10 = (enemynear(var(58)), StateNo = Helper(999), var(19)) && enemynear(var(58)), Time = (Helper(999), var(20) - 3)
trigger11 = (enemynear(var(58)), StateNo = Helper(999), var(21)) && enemynear(var(58)), Time = (Helper(999), var(22) - 3)
trigger12 = (enemynear(var(58)), StateNo = Helper(999), var(23)) && enemynear(var(58)), Time = (Helper(999), var(24) - 3)
trigger13 = (enemynear(var(58)), StateNo = Helper(999), var(25)) && enemynear(var(58)), Time = (Helper(999), var(26) - 3)
trigger14 = (enemynear(var(58)), StateNo = Helper(999), var(27)) && enemynear(var(58)), Time = (Helper(999), var(28) - 3)
trigger15 = (enemynear(var(58)), StateNo = Helper(999), var(29)) && enemynear(var(58)), Time = (Helper(999), var(30) - 3)
trigger16 = (enemynear(var(58)), StateNo = Helper(999), var(31)) && enemynear(var(58)), Time = (Helper(999), var(32) - 3)
trigger17 = (enemynear(var(58)), StateNo = Helper(999), var(33)) && enemynear(var(58)), Time = (Helper(999), var(34) - 3)
trigger18 = (enemynear(var(58)), StateNo = Helper(999), var(35)) && enemynear(var(58)), Time = (Helper(999), var(36) - 3)
trigger19 = (enemynear(var(58)), StateNo = Helper(999), var(37)) && enemynear(var(58)), Time = (Helper(999), var(38) - 3)
trigger20 = (enemynear(var(58)), StateNo = Helper(999), var(39)) && enemynear(var(58)), Time = (Helper(999), var(40) - 3)
trigger21 = (enemynear(var(58)), StateNo = Helper(999), var(41)) && enemynear(var(58)), Time = (Helper(999), var(42) - 3)
trigger22 = (enemynear(var(58)), StateNo = Helper(999), var(43)) && enemynear(var(58)), Time = (Helper(999), var(44) - 3)
trigger23 = (enemynear(var(58)), StateNo = Helper(999), var(45)) && enemynear(var(58)), Time = (Helper(999), var(46) - 3)
trigger24 = (enemynear(var(58)), StateNo = Helper(999), var(47)) && enemynear(var(58)), Time = (Helper(999), var(48) - 3)
trigger25 = (enemynear(var(58)), StateNo = Helper(999), var(49)) && enemynear(var(58)), Time = (Helper(999), var(50) - 3)
trigger26 = (enemynear(var(58)), StateNo = Helper(999), var(51)) && enemynear(var(58)), Time = (Helper(999), var(52) - 3)
trigger27 = (enemynear(var(58)), StateNo = Helper(999), var(53)) && enemynear(var(58)), Time = (Helper(999), var(54) - 3)
trigger28 = (enemynear(var(58)), StateNo = Helper(999), var(55)) && enemynear(var(58)), Time = (Helper(999), var(56) - 3)
;斜めジャンプ強キック
[State -1, Jump Strong Kick]
type = ChangeState;ChangeState
value = IFELSE((Vel Y = [-4,-3]),990,ifelse(P2BodyDist x < 0,610,710))
;triggerall = var(59) = 1
triggerall = RoundState = 2 && enemynear(var(58)),life > 0
triggerall = statetype = A
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),stateno != [5020,5040]
triggerall = ctrl || stateno = [120,149]
trigger1 = vel X < 0 && (Vel Y = [-4,-3]) && var(4) = 1 && P2BodyDist x > 0
trigger2 = vel X < 0 && Vel Y > 0 && pos y > -34 &&  var(4) = 1

;斜めジャンプ強キック
[State -1, Jump Strong Kick]
type = ChangeState
value = 1400
triggerall = var(59) = 1
triggerall = RoundState = 2 && enemynear(var(58)),life > 0
triggerall = statetype = A
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),stateno < 200 || enemynear(var(58)),movetype = A || enemynear(var(58)),HitDefAttr = SC, NT, ST, HT || helper(35002),var(57) = 1
triggerall = enemynear(var(58)),stateno != [5020,5040]
triggerall = ctrl || stateno = [120,149]
trigger1 = vel X < 0 && Vel Y < 0 && var(4) = 2
trigger1 = P2BodyDist x <= 100
trigger1 = var(34) := 64502

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;防御(ガード等)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

;ガード
[State -1, Guard]
type = ChangeState;ChangeState
value = 120
triggerall = var(59) = 1
triggerall = RoundState = 2
triggerall = stateno != [120,159]
triggerall = ctrl || stateno = 0 || (stateno = [20,22]) || (stateno = [100,101]) || stateno = 107
trigger1 = inguarddist
trigger2 = inguarddist
trigger2 = p2bodydist x > 90 || enemynear(var(58)),time > 50
trigger3 = inguarddist
trigger3 = enemynear(var(58)),numhelper > 0 || enemy,numproj > 0
trigger4 = enemynear(var(58)),movetype = A
trigger4 = !enemynear(var(58)),hitdefattr = SCA, NT, ST, HT
trigger4 = stateno != 100 || stateno = 100 && p2dist y > -45 || numenemy >= 2
trigger4 = p2bodydist x < 0
trigger4 = p2dist x > 0 || p2dist x < 0
trigger5 = inguarddist
trigger5 = numenemy > 1
trigger5 = enemy(0),numhelper+enemy(1),numhelper > 0 || enemy(0),numproj+enemy(1),numproj > 0
trigger6 = numhelper(31000+id)
trigger6 = helper(31000+id),inguarddist && enemynear(var(58)),statetype = A || enemynear(var(58)),facing != facing && helper(31000+id),inguarddist && enemynear(var(58)),statetype != A || enemynear(var(58)),facing = facing && inguarddist && enemynear(var(58)),statetype != A || helper(31000+id),inguarddist && helper(24000 + id),var(57) > 0
trigger6 = !enemynear(var(58)),hitdefattr = SCA, NT, ST, HT


[State -1,蹲防]
type = ChangeState
value = 131 ;蹲防的stateno
triggerall = var(59) && statetype !=A ;ai??且自身不在空中
triggerall = p2statetype = C
triggerall = !EnemyNear,hitdefattr = SCA,AT,ST,NT ;?手不能出投技
triggerall = ctrl && p2statetype !=A ;?里加一个?手不在空中保?起?。
trigger1 = inguarddist ;inguarddist之前已?提到?了，大家仔?看的可能会注意到，不?待会?会?
trigger1 = facing !=EnemyNear,facing ;facing 和 enemynear,facing的?系:enemynear,facing = facing?不面??手，反之面?
trigger2 = p2bodydist x < 0 && p2movetype = A ;当?手在?背后?不算在inguarddist内
;---------------------------------------------------------------------------
[State -1,立防]
type = ChangeState
value = 130 ;站防stateno
triggerall = var(59) && statetype !=A
triggerall = p2statetype != C
triggerall = !EnemyNear,hitdefattr = SCA,AT,ST,NT ;?手不能出投技
triggerall = ctrl
trigger1 = inguarddist
trigger1 = facing!= EnemyNear,facing ;面??手，并且inguarddist
trigger2 = facing!= EnemyNear,facing
trigger2 = p2dist x > 0
trigger2 = p2bodydist x = [-60,60] ;距?
trigger2 = p2movetype = A ;不面??手，但是?面?个?候可能是打逆的，最好使用站防
trigger3 = p2bodydist x < 0 && p2movetype = A ;同上
;---------------------------------------------------------------------------
[State -1,空防]
type = ChangeState
value = 132 ;空防stateno
triggerall = var(59)
triggerall = ctrl && statetype = A ;自身在空中
trigger1 = inguarddist
trigger1 = var(34) := 12010
trigger2 = p2bodydist x < 0 && p2movetype = A ;同上
trigger2 = var(34) := 12011

;?制--------------------------------------------------------------------------

[State -1, Stand Strong Punch]
type = ChangeState
value = 200
triggerall = var(59) = 1
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
TriggerAll = Random <= 100||(life<ceil(lifemax/3))&& Random <= 300||var(41) < 200 && Random <= 500 ||helper(35002),var(40)>=10
triggerall = StateType != A
triggerall = enemynear(var(58)),StateType = A
Triggerall = enemynear(var(58)),StateType != L
triggerall = enemynear(var(58)),movetype != H
triggerall = enemynear(var(58)),stateno != [5020,5040]
triggerall = enemynear(var(58)),facing != facing
triggerall =!helper(31000+id),inguarddist
triggerall = ctrl || (stateno = [20,22]) || (stateno = [100,101]) || (stateno = [120,149])
trigger1 = p2bodydist x = [0+floor(4*(enemynear(var(58)),vel x)),40+floor(4*(enemynear(var(58)),vel x))]
trigger1 = p2bodydist y = [-50-floor(4*(enemynear(var(58)),vel y)+(4*(4+1)/2)*fvar(20)),-25-floor(4*(enemynear(var(58)),vel y)+(4*(4+1)/2)*fvar(20))]

;しゃがみ強パンチ
[State -1, Crouching Strong Punch]
type = ChangeState
value = 405
triggerall = var(59) = 1
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
TriggerAll = Random <= 100||(life<ceil(lifemax/3))&& Random <= 300||var(41) < 200 && Random <= 500 ||helper(35002),var(40)>=10
triggerall = statetype != A
triggerall = enemynear(var(58)),StateType = A
Triggerall = enemynear(var(58)),StateType != L
triggerall = enemynear(var(58)),movetype != H
triggerall = enemynear(var(58)),stateno != [5020,5040]
triggerall = enemynear(var(58)),facing != facing
triggerall =!helper(31000+id),inguarddist
triggerall = ctrl || (stateno = [20,22]) || (stateno = [100,101]) || (stateno = [120,149])
trigger1 = p2bodydist x = [-10+floor(12*(enemynear(var(58)),vel x)),30+floor(12*(enemynear(var(58)),vel x))]
trigger1 = p2bodydist y = [-70-floor(12*(enemynear(var(58)),vel y)+(12*(12+1)/2)*fvar(20)),-35-floor(12*(enemynear(var(58)),vel y)+(12*(12+1)/2)*fvar(20))]

;遠距離立ち弱パンチ
[State -1, Stand Light Punch]
type = ChangeState
value = 215
triggerall = var(59) = 1
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
TriggerAll = Random <= 100||(life<ceil(lifemax/3))&& Random <= 300||var(41) < 200 && Random <= 500 || helper(35002),var(40)>=10
triggerall = statetype != A
triggerall = enemynear(var(58)),StateType = A
Triggerall = enemynear(var(58)),StateType != L
triggerall = enemynear(var(58)),movetype != H
triggerall = enemynear(var(58)),stateno != [5020,5040]
triggerall = enemynear(var(58)),facing != facing
triggerall =!helper(31000+id),inguarddist
triggerall = ctrl || (stateno = [20,22]) || (stateno = [100,101]) || (stateno = [120,149])
trigger1 = p2bodydist x = [-18,15]
trigger1 = abs(enemynear(var(58)),Pos Y - Pos Y) = [0,40]

;?行道具---------------------------------------------------------------------------

[state -1,L YAMIBARI]
Type = ChangeState
Value = 1100
TriggerAll = var(59) = 1
TriggerAll = RoundState = 2
TriggerAll = EnemyNear(var(58)),StateType = A
TriggerAll = Numproj = 0
TriggerAll = StateType != A
TriggerAll = EnemyNear(var(58)),MoveType = H
TriggerAll = EnemyNear(var(58)),StateNo != [5100,5299]
Trigger1 = StateNo = 405 && MoveContact
Trigger1 = VAR(41) > 150
Trigger1 = EnemyNear(var(58)),StateType = A
Trigger2 = StateNo = 215 && MoveContact
Trigger2 = VAR(41) > 150
Trigger2 = EnemyNear(var(58)),StateType = A

;弱 百八式・闇払い
[State -1, L YAMIBARAI]
type = ChangeState
value = ifelse(stateno = 1000,1005,1000)
triggerall = var(59) = 1
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
triggerall = Random <= 600
triggerall = StateType != A
triggerall = p2bodydist x >= 160
triggerall = enemynear(var(58)),movetype = H
triggerall = enemynear(var(58)),stateno != [5710,5715]
triggerall = enemynear(var(58)),StateType = L
trigger1 = ctrl || (stateno = [20,22]) || (stateno = [100,101]) || (stateno = [120,149])
Trigger2 = stateno = 1000 && Animelem = 8,>5

;弱 百八式・闇払い
[State -1, L YAMIBARAI]
type = ChangeState
value = ifelse(stateno = 1000,1005,1000)
triggerall = var(59) = 1
triggerall = RoundState = 2 && enemynear(var(58)),life > 0; && fvar(22) = 0
triggerall = statetype != A
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),movetype != H
Triggerall = EnemyNear(var(58)),facing != facing
triggerall = enemynear(var(58)),stateno != [5710,5715]
Triggerall = numhelper(1007) = 0
Triggerall = !inguarddist
triggerALL = p2bodydist X >= 100
trigger1 = ctrl || (stateno = [20,22]) || (stateno = [100,101]) || (stateno = [120,149])
trigger1 = random <= 100
Trigger2 = stateno = 1000 && Animelem = 8,>5

;普通?段------------------------------------------------------------

[State -1, HE]
type = ChangeState
value = 4000
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = power >= 2000
trigger1 = stateno = 3004 && enemynear(var(58)),stateno = 3009
trigger2 = stateno = 3400 && enemynear(var(58)),stateno = 3009

[State -1,近距?目?]
Type = ChangeState;ChangeState
value = var(57)
;triggerall = var(59)
triggerall = var(51) = 0
triggerall = var(50) = [1,2]
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 
triggerall = statetype != A
triggerall = enemynear(var(58)),statetype = A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),Movetype = H
trigger1 = Target(1010),statetype = A
trigger1 = var(41) <= 150
trigger1 = stateno = 1010 && animtime = 0
trigger1 = p2bodydist y <= -20-floor(16*(enemynear(var(58)),vel y)+(16*(16+1)/2)*fvar(20))
trigger1 = var(57) := 1015
trigger2 = Target(1010),statetype = A
trigger2 = stateno = 1015 && Animelem = 9,> 0
trigger2 = p2bodydist y = [-20-floor(10*(enemynear(var(58)),vel y)+(10*(10+1)/2)*fvar(20)),200-floor(10*(enemynear(var(58)),vel y)+(10*(10+1)/2)*fvar(20))]
trigger2 = var(57) := 1005
trigger3 = var(50) = 2 && var(41) <= 150
trigger3 = ctrl || (stateno = [20,22]) || (stateno = [100,101]) || (stateno = [120,149])
trigger3 = p2bodydist y = [-20-floor(12*(enemynear(var(58)),vel y)+(12*(12+1)/2)*fvar(20)),0-floor(12*(enemynear(var(58)),vel y)+(12*(12+1)/2)*fvar(20))]
trigger3 = var(57) := 980
trigger4 = Target(1010),statetype = A
trigger4 = ctrl || (stateno = [20,22]) || (stateno = [100,101]) || (stateno = [120,149])
trigger4 = p2bodydist y = [-20-floor(16*(enemynear(var(58)),vel y)+(16*(16+1)/2)*fvar(20)),20-floor(16*(enemynear(var(58)),vel y)+(16*(16+1)/2)*fvar(20))]
trigger4 = var(57) := 1305


[State -1,近距?目?]
Type = ChangeState;ChangeState
value = var(57)
;triggerall = var(59)
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),Movetype = H
trigger1 = stateno = 810 && MoveContact = 2
trigger1 = var(57) := 1400
trigger2 = stateno = 801 && movehit = 3
trigger2 = var(57) := 1015
trigger3 = stateno = 1205 && movehit && animelem = 13
trigger3 = var(57) := 1210
trigger4 = !Target(1010),statetype = A
trigger4 = stateno = 1015 && Animelem = 9,>0
trigger4 = var(57) := 1010
trigger5 = stateno = 980 && MoveContact = 2
trigger5 = var(57) := ifelse(movehit = 2,1100,1000)
trigger6 = stateno = 1305 && movehit
trigger6 = var(57) := 1310
trigger7 = stateno = 610 && MoveContact = 1 || stateno = 710 && MoveContact = 1
trigger7 = enemynear(var(58)),statetype != A
trigger7 = P2BodyDist x > -10
trigger7 = (var(4) != - 1 || VAR(41) < 50) && random <= 500
trigger7 = var(57) := 1400
trigger8 = stateno = 505 && movehit = 2
trigger8 = var(57) := 1000

;目?-------------------------------------------------------------------------------

[State -1,近距?目?]
Type = ChangeState;ChangeState
value = var(57)
;triggerall = var(59)
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 
triggerall = statetype != A
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),statetype != L
trigger1 = (stateno = 400 || stateno = 500) && movehit = 2
trigger1 = P2BodyDist x > 30 || var(30) > 10
trigger1 = var(57) := ifelse(random<=500 && var(50) != 3,810,1015)
trigger2 = stateno = 215 && AnimElemTime(5) > 5 && movehit
trigger2 = var(57) := 801

[State -1,近距?目?]
Type = ChangeState;ChangeState
value = var(57)
;triggerall = var(59)
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 
triggerall = statetype != A
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),statetype != L
triggerall = movehit = 2
trigger1 = stateno = 205 || stateno = 305
trigger1 = var(30) = 5
trigger1 = var(57) := ifelse(random<=333 && P2BodyDist x < 20,305,ifelse(random<=500,400,500))
trigger2 = stateno = 400
trigger2 = var(30) = 5
trigger2 = var(57) := ifelse(random<=333 && P2BodyDist x < 20,305,ifelse(random<=500,400,500))
trigger3 = stateno = 500
trigger3 = var(30) = 5
trigger3 = var(57) := ifelse(random<=333 && P2BodyDist x < 20,305,ifelse(random<=500,400,500))
trigger4 = stateno = 400 || stateno = 500
trigger4 = var(30) = 10
trigger4 = var(57) := ifelse(random<=500 && P2BodyDist x <= 25,400,500)
trigger5 = stateno = 305
trigger5 = var(30) = 10
trigger5 = var(57) := ifelse(random<=500 && P2BodyDist x <= 25,400,500)

;?攻?被防-----------------------------------------------------------------

[State -1,近距?目?]
Type = ChangeState;ChangeState
value = var(57)
TriggerAll = var(59)
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 
triggerall = statetype != A
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),movetype = H
triggerall = MoveContact
trigger1 = stateno = 215 && AnimElemTime(5) > 5
trigger1 = enemynear(var(58)),STATENO = 5700
trigger1 = var(57) := 801
trigger2 = stateno = 400 || stateno = 500 || stateno = 205
trigger2 = animtime = -1
trigger2 = enemynear(var(58)),STATENO = 5700
trigger2 = var(57) := 100
trigger3 = stateno = 505
trigger3 = enemynear(var(58)),STATENO = 5700
trigger3 = var(57) := 1015

[State -1,空震]
Type = ChangeState;ChangeState
value = var(57)
TriggerAll = var(59)
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 
triggerall = statetype != A
triggerall = enemynear(var(58)),MOVEtype != H
trigger1 = (stateno = 505 && AnimElemTime(5) >= 0)
trigger1 = var(57) := 1000

[State -1,??寛愴????幃 ??曉?]
Type = ChangeState;ChangeState
value = var(57)
TriggerAll = var(59)
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 
triggerall = statetype != A
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),stateno = [120,159]
triggerall = MoveGuarded
trigger1 = stateno = 215 && AnimElemTime(5) > 5
trigger1 = var(57) := 801
trigger2 = stateno = 801 && MoveGuarded = 2
trigger2 = var(57) := 1000
trigger3 = stateno = 505 && MoveGuarded = 2
trigger3 = var(57) := 1000
trigger4 = stateno = 400 || stateno = 500 || stateno = 305
trigger4 = var(30) = 15 || P2BodyDist x > 30
trigger4 = random <= 333 && MoveGuarded = 1
trigger4 = var(57) := ifelse(random<=500,1000,810)


[State -1,近距?目?]
Type = ChangeState
value = var(57)
triggerall = var(59)
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 
triggerall = statetype != A
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),stateno = [120,159]
triggerall = MoveGuarded = 2
trigger1 = stateno = 205 || stateno = 305
trigger1 = var(30) = 5 && P2BodyDist x <= 20
trigger1 = var(57) := ifelse(random<=333 && P2BodyDist x < 20,305,ifelse(random<=500,400,500))
trigger2 = stateno = 400
trigger2 = var(30) = 5 && P2BodyDist x <= 20
trigger2 = var(57) := ifelse(random<=333 && P2BodyDist x < 20,305,ifelse(random<=500,400,500))
trigger3 = stateno = 500
trigger3 = var(30) = 5 && P2BodyDist x <= 20
trigger3 = var(57) := ifelse(random<=333 && P2BodyDist x < 20,305,ifelse(random<=500,400,500))
trigger4 = stateno = 400 || stateno = 500
trigger4 = var(30) = 10 && P2BodyDist x <= 30
trigger4 = var(57) := ifelse(random<=500 && P2BodyDist x <= 25,400,500)
trigger5 = stateno = 305
trigger5 = var(30) = 10 && P2BodyDist x <= 30
trigger5 = var(57) := ifelse(random<=500 && P2BodyDist x <= 25,400,500)

;裸凹--------------------------------------------------------------------

[State AI]
type = ChangeState
value = ifelse(p2bodydist x >= 100,36,34)
triggerall = var(59)
triggerall = p2bodydist x <= 150
triggerall = p2bodydist x >= 50
triggerall = random <= 100
triggerall = var(41) > 150
triggerall = roundstate = 2
triggerall = statetype != A
Triggerall = !inguarddist
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),movetype != A
triggerall = enemynear(var(58)),STATENO >= 200
triggerall = enemynear(var(58)),vel x < 0 && enemynear(var(58)),facing != facing || enemynear(var(58)),vel x > 0 && enemynear(var(58)),facing = facing
triggerall = (enemynear(var(58)),animtime = [-20,-15]) || (enemynear(var(58)),animtime = [-30,-20]) && p2bodydist x >= 100
Triggerall = !Enemy,NumProj && helper(24000 + id),var(57) = 0
trigger1 = Ctrl || stateno = 19 || stateno = 20 || stateno = 21 || (stateno = 52) || (stateno = [100,101]) || (stateno = [120,149])

[State AI]
type = ChangeState
value = 1005
triggerall = var(59)
triggerall = roundstate = 2
triggerall = statetype != A
Triggerall = !inguarddist
Triggerall = !Enemy,NumProj && helper(24000 + id),var(57) = 0
Triggerall = stateno = 1000 && Animelem = 8,>5
trigger1 = p2bodydist x >= 100
trigger2 = EnemyNear(var(58)),stateno = [150,159]
trigger3 = helper(35002),var(57) = 1

[State -1, S ONIYAKI]
type = ChangeState
value = 1205
triggerall = var(59) = 1
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
triggerall = enemynear(var(58)),time >= 0
triggerall = Random <= 100|| Life <= ceil(lifemax/3) && Random <= 300||helper(35002),var(40) >= 10 && Random <= 500
triggerall = statetype != A
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),MoveType = A
triggerall = enemynear(var(58)),StateNo >= 200
triggerall = enemynear(var(58)),facing != facing
triggerall = InGuardDist
triggerall = ctrl || (stateno = [20,22]) || (stateno = [100,101]) || (stateno = [120,149]) ;|| (var(1) = [1,2]) && !movecontact && movetype != H
trigger1 = p2bodydist x = [-5,40]
trigger1 = enemynear(var(58)),animtime <= -8

[State -1, S ONI]
type = ChangeState
value = 1205
triggerall = var(59) = 1
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
triggerall = statetype != A
triggerall = EnemyNear(var(58)),MoveType = H
triggerall = EnemyNear(var(58)),StateType = A
triggerall = EnemyNear(var(58)),StateType != L
triggerall = !numtarget && var(50) != 2
triggerall = ctrl || (stateno = [20,22]) || (stateno = [100,101]) || (stateno = [120,149])
trigger1 = p2bodydist x = [-5,40]
trigger1 = p2bodydist y = [-20-floor(8*(enemynear(var(58)),vel y)+(8*(8+1)/2)*fvar(20)),20-floor(8*(enemynear(var(58)),vel y)+(8*(8+1)/2)*fvar(20))]

[state -1, combo]
type = ChangeState
value = 3300
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = power >= 1000 && var(40) = 0 || var(40) > 0
triggerall = statetype != A
triggerall = enemynear(var(58)),statetype = A
triggerall = enemynear(var(58)),movetype != H
triggerall = p2bodydist x = [0+floor(4*(enemynear(var(58)),vel x)),50+floor(4*(enemynear(var(58)),vel x))]
triggerall = p2bodydist y = [-30-floor(4*(enemynear(var(58)),vel y)+(4*(4+1)/2)*fvar(20)),-15-floor(4*(enemynear(var(58)),vel y)+(4*(4+1)/2)*fvar(20))]
trigger1 = ctrl || stateno = 0 || (stateno = [19,22]) || (stateno = [99,101]) || (stateno = [120,149])


[state -1,最終決戦奥義　無式 切り返し]
Type = ChangeState
value = ifelse(EnemyNear(var(58)),AnimTime <= -11 && random<=500,4000,3200)
TriggerAll = var(59) = 1
triggerall = Random <= 100 || Life <= ceil(lifemax/3) && Random <= 300||helper(35002),var(40) >= 10 && Random <= 500
TriggerAll = RoundState = 2
TriggerAll = var(51) = 0 && power >= 3000
TriggerAll = StateType != A
TriggerAll = P2BodyDist X = [-30,50]
triggerall = enemynear(var(58)),facing != facing
TriggerAll = EnemyNear(var(58)),AnimTime <= -6
TriggerAll = EnemyNear(var(58)),Time >= 0
TriggerAll = Ctrl || (stateno = [19,22]) || (stateno = [100,101]) || (stateno = [120,149])
Trigger1 = EnemyNear(var(58)),StateType != A
Trigger1 = EnemyNear(var(58)),MoveType = A && EnemyNear(var(58)),StateNo >= 200
Trigger2 = Enemy,HitDefAttr = SC,AT || EnemyNear(var(58)),HitDefAttr = SC,AT
Trigger2 = Enemy,Vel X > 0 || EnemyNear(var(58)),Vel X > 0

[state -1,最終決戦奥義　無式 切り返し]
Type = ChangeState
value = 3300
TriggerAll = var(59) = 1
triggerall = Random <= 100 || Life <= ceil(lifemax/3) && Random <= 300||helper(35002),var(40) >= 10 && Random <= 500
TriggerAll = RoundState = 2
TriggerAll = power >= 1000
TriggerAll = StateType != A
TriggerAll = P2BodyDist X = [-30,50]
triggerall = enemynear(var(58)),facing != facing
TriggerAll = EnemyNear(var(58)),AnimTime <= -4
TriggerAll = EnemyNear(var(58)),Time >= 0
TriggerAll = Ctrl || (stateno = [19,22]) || (stateno = [100,101]) || (stateno = [120,149])
Trigger1 = EnemyNear(var(58)),StateType != A
Trigger1 = EnemyNear(var(58)),MoveType = A && EnemyNear(var(58)),StateNo >= 200
Trigger2 = Enemy,HitDefAttr = SC,AT || EnemyNear(var(58)),HitDefAttr = SC,AT
Trigger2 = Enemy,Vel X > 0 || EnemyNear(var(58)),Vel X > 0

[State -1,投げ]
Type = ChangeState
Value = ifelse(var(42) < 200,956,900)
TriggerAll = var(59)
TriggerAll = StateType != A
triggerall = RoundState=2
triggerall = EnemyNear(var(58)),facing != facing
triggerall = EnemyNear(var(58)),statetype != L
triggerall = (EnemyNear(var(58)),statetype = S)||(EnemyNear(var(58)),statetype=C)
triggerall = EnemyNear(var(58)),movetype != H||EnemyNear(var(58)),stateno=[120,140]
TriggerAll = EnemyNear(var(58)),StateNo != [5100,5299]
triggerall = helper(35002),var(57) != 1
triggerall = p2bodydist X <= 20
TriggerAll = P2BodyDist X = [-5,20]
triggerall = ctrl||stateno=21||stateno=22||(stateno=[100,101])||(stateno=[120,149])||stateno=52
triggerall = Random <= 100|| Life <= ceil(lifemax/3) && Random <= 300||helper(35002),var(40) >= 10 && Random <= 500
Trigger1 = EnemyNear(var(58)),MoveType=I||floor(EnemyNear(var(58)),GetHitVar(hittime))<0
Trigger2 = EnemyNear(var(58)),facing!=facing||(EnemyNear(var(58)),stateno=[50,55])||(EnemyNear(var(58)),stateno=[120,159])&&floor(EnemyNear(var(58)),GetHitVar(hittime))<0

[State AI]
type = ChangeState
value = 5200
triggerall = var(59) = 1
triggerall = alive
triggerall = helper(35002),var(40) >= 10 || helper(35002),var(40) = 1 || (helper(35002),var(40) = [2,9]) && random<=500
trigger1 = StateNo = 5050 || StateNo = 5071
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0


;ガードキャンセルふっとばし攻撃
[State -1, GCA]
type = ChangeState
value = 981
triggerall = var(59) = 1
triggerall = enemynear(var(58)),name != "Gustab Munchausen"
triggerall = RoundState = 2
triggerall = Random <= 10||Life <= ceil(lifemax/3) && Random <= 100||helper(35002),var(40) >= 15
triggerall = power >= 1000
triggerall = StateType != A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),MoveType = A
triggerall = enemynear(var(58)),StateNo >= 200
triggerall = p2bodydist x = [-5,50]
triggerall = (stateno = 150 || stateno = 152) && HitShakeOver
trigger1 = enemynear(var(58)),statetype != A
trigger2 = enemynear(var(58)),statetype = A
trigger2 = p2bodydist y = [-10-floor(6*(enemynear(var(58)),vel y)+(6*(6+1)/2)*fvar(20)),0-floor(6*(enemynear(var(58)),vel y)+(6*(6+1)/2)*fvar(20))]

;浮かせからの連続技
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[State -1, Hitr];リセット
type = VarSet
triggerall = var(50)
trigger1 = enemynear(var(58)),movetype = A ;|| stateno = 2600
trigger2 = enemynear(var(58)),stateno = [0,159]
trigger3 = enemynear(var(58)),ctrl=1
trigger4 = roundstate != 2
trigger5 = stateno = [3000,4000]
trigger6 = stateno = 5900
trigger7 = alive = 0
trigger8 = (var(50) =1) && P2BodyDist y >= 0
var(50) = 0

;---------------------------------------------------------------------------
;位置取り
;---------------------------------------------------------------------------
;ダッシュ 起き攻め位置取り
[State -1, Dash]
Type = ChangeState
Value = 100
triggerall = var(59) = 1
triggerall = var(50) != 1
triggerall = RoundState = 2
triggerall = StateType != A
triggerall =!inguarddist
triggerall =!enemy,numproj
triggerall = p2bodydist x >= 60 || p2bodydist x > 0 && ((enemynear(var(58)),StateNo = [5020,5040]) || (enemynear(var(58)),StateNo = [290,293]))
triggerall = ctrl || (stateno = [20,22]) || (stateno = [120,149])
trigger1 = enemynear(var(58)),StateType = A
trigger1 = enemynear(var(58)),StateNo = [5000,5100]
trigger1 = var(34):= 10004
trigger2 = enemynear(var(58)),StateType = L
trigger2 = var(34):= 10005
trigger3 = enemynear(var(58)),StateNo = [290,293]
trigger3 = enemynear(var(58)),StateType = A
trigger3 = var(34):= 10007

;ダッシュ
[state -1]
Type = ChangeState
Value = 100
TriggerAll = var(59) = 1
TriggerAll = RoundState = 2
TriggerAll = StateType != A
TriggerAll = EnemyNear(var(58)),MoveType != A || EnemyNear(var(58)),facing = facing
TriggerAll =!InGuardDist && !(helper(31000+id),inguarddist && (helper(24000 + id),var(57) > 0 || enemy,NumProj > 0))
TriggerAll = Ctrl || (stateno = [20,22])|| StateNo = [120,149]
Triggerall = P2BodyDist X > 0
Trigger1 = EnemyNear(var(58)),StateType != L
Trigger1 = EnemyNear(var(58)),StateType != A
Trigger1 = EnemyNear(var(58)),MoveType = I
trigger1 = var(34):= 10008
Trigger2 = P2BodyDist X > 45 && var(44) != 3 && var(50) != [20,21] 
Trigger2 = EnemyNear(var(58)),StateType = L
trigger2 = var(34):= 10009
Trigger3 = P2BodyDist X > 140 || EnemyNear(var(58)),facing = facing && !helper(31000+id),inguarddist
Trigger3 = EnemyNear(var(58)),StateType = A
Trigger3 = EnemyNear(var(58)),MoveType = A && EnemyNear(var(58)),StateNo >= 200
Trigger3 =!EnemyNear(var(58)),HitDefAttr = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT
trigger3 = var(34):= 10010
trigger4 = !helper(31000+id),inguarddist
Trigger4 = EnemyNear(var(58)),MoveType != H
Trigger4 = EnemyNear(var(58)),StateType = A
Trigger4 =!EnemyNear(var(58)),Ctrl
Trigger4 = EnemyNear(var(58)),facing = facing
trigger4 = var(34):= 10011


;歩き(起き攻め位置取り)
[State -1, Walk]
type = ChangeState
value = 22
;triggerall = var(59) = 1
triggerall = RoundState = 2
triggerall = StateType != A
triggerall = stateno != 22
triggerall = ctrl || (stateno = [20,22])
trigger1 = enemynear(var(58)),StateType = L
trigger2 = enemynear(var(58)),StateNo = 5622
trigger3 = enemynear(var(58)),StateType = A
trigger3 = VAR(50) > 0

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;立ち回り、技振り(地上)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[State -1, 後小ジャンプ 空対空]
Type = ChangeState
Value = ifelse(p2bodydist x >= 50,39,33)
;triggerall = var(59) = 1
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
triggerall = StateType != A
triggerall =!Enemy,NumProj
Triggerall = EnemyNear(var(58)),STATENO >= 200
triggerall = enemynear(var(58)),MoveType != A
Triggerall = (EnemyNear(var(58)),animtime = [-15,-10]) && var(42) < 40 || (EnemyNear(var(58)),animtime = [-20,-15]) && var(42) > 40
triggerall = enemynear(var(58)),vel x > 0 && enemynear(var(58)),facing != facing || enemynear(var(58)),vel x < 0 && enemynear(var(58)),facing = facing
triggerall =!InGuardDist
triggerall = ctrl || (stateno = [20,22]) || (stateno = [100,101]) || (stateno = [120,149])
trigger1 = p2bodydist x <= 60
trigger1 = enemynear(var(58)),Vel X <= 10

[State -1, 後小ジャンプ 空対空]
Type = ChangeState
value = IFELSE(VAR(42) < 150,ifelse(random<=500,1100,1105),ifelse(random<=500,ifelse(random<=500,1100,1105),ifelse(random<=500,35,105)))
triggerall = var(59) = 1
TriggerAll = Random <= 100||(life<ceil(lifemax/3))&& Random <= 300||helper(35002),var(40)>=10
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
triggerall = StateType != A
triggerall =!Enemy,NumProj
triggerall = enemynear(var(58)),StateType != A
triggerall = enemynear(var(58)),MoveType != H
Triggerall = EnemyNear(var(58)),STATENO < 200
Triggerall = EnemyNear(var(58)),TIME >= 5
triggerall = enemynear(var(58)),vel x > 0 && enemynear(var(58)),facing != facing
triggerall =!InGuardDist
triggerall = ctrl || (stateno = [20,22]) || (stateno = [100,101]) || (stateno = [120,149])
trigger1 = p2bodydist x <= 50
trigger1 = enemynear(var(58)),Vel X = [4,10]

[State -1, 後中ジャンプ 空対空]
Type = ChangeState
value = IFELSE(VAR(42) < 150,ifelse(random<=500,1100,1105),ifelse(random<=500,ifelse(random<=500,1100,1105),105))
triggerall = var(59) = 1
triggerall = RoundState = 2 && enemynear(var(58)),life > 0 && fvar(22) = 0
TriggerAll = Random <= 100||(life<ceil(lifemax/3))&& Random <= 300||helper(35002),var(40)>=10 || var(42) < 200
triggerall = StateType != A
triggerall =!Enemy,NumProj
triggerall = enemynear(var(58)),Vel X > 0
triggerall = enemynear(var(58)),Vel Y < 0
triggerall = enemynear(var(58)),MoveType != H
triggerall = enemynear(var(58)),StateType = A
triggerall = enemynear(var(58)),facing != facing
triggerall =!InGuardDist
triggerall = ctrl || (stateno = [20,22]) || (stateno = [100,101]) || (stateno = [120,149])
trigger1 = p2bodydist x = [0,160]
trigger1 = enemynear(var(58)),Vel X <= 6

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;立ち回り、技振り(空中)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[State -3, ??用]
Type = null;;ChangeState
Value = 34
TriggerAll = RoundState = 2
TriggerAll = StateType != A
TriggerAll = P2BodyDist x < 200
Trigger1 = stateno = 100

[State -3, Jump Strong Kick]
type = ChangeState;ChangeState
value = 710
triggerall = var(59)
triggerall = roundstate = 2 || WINKO
triggerall = statetype = A
triggerall = ctrl && FrontEdgeBodyDist > 20
triggerall = P2BodyDist X = [-30+floor(9*(EnemyNear(floor(fvar(37))),vel X)+floor(10*vel X)),150+floor(9*(EnemyNear(floor(fvar(37))),vel X)+floor(9*vel X))]
triggerall = P2BodyDist Y = [-30-floor(9*(EnemyNear(floor(fvar(37))),vel Y)+(9*(9+1)/2)*fvar(30)-floor(9*vel Y)-(9*(9+1)/2)*0.54),30-floor(9*(EnemyNear(floor(fvar(37))),vel Y)+(9*(9+1)/2)*fvar(30)-floor(9*vel Y)-(9*(9+1)/2)*0.54)]
triggerall = enemynear(var(58)),statetype = A
triggerall = P2statetype != L
trigger1 = random <= 1000
trigger1 = var(34) := 61002

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;移動
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;ダッシュ
[State -1, RUN]
type = ChangeState;ChangeState
value = 100
triggerall = var(59) = 1
triggerall = var(50) != 1
triggerall = RoundState = 2
triggerall = statetype != A
Triggerall = !Enemy,NumProj && helper(24000 + id),var(57) = 0
triggerall = !helper(31000+id),inguarddist
triggerall = ctrl || (stateno = [20,22]) || (stateno = [120,149])
trigger1 = var(49) > 4 && enemynear(var(58)),StateType != A
trigger1 = var(50) != 22
trigger1 = var(34):= 10015
trigger2 = enemynear(var(58)),stateno = 5700
trigger2 = var(34):= 10016

;歩き
[State -1, Walk]
type = ChangeState
value = 21
triggerall = var(59) = 1
triggerall = RoundState = 2
triggerall = StateType != A
triggerall = enemynear(var(58)),StateType != L
triggerall = enemynear(var(58)),StateNo != [5120,5299]
triggerall = stateno != 21
triggerall = ctrl || (stateno = [20,22])
trigger1 = p2bodydist x = [0,140]
trigger1 = enemynear(var(58)),facing != facing && !inguarddist || enemynear(var(58)),facing = facing && !helper(31000+id),inguarddist
trigger2 = p2bodydist x > 180

;バックステップ
[state -1]
Type = ChangeState;ChangeState
Value = 105
TriggerAll = var(59) = 1
TriggerAll = EnemyNear(var(58)),vel x > 0 && enemynear(var(58)),facing != facing || EnemyNear(var(58)),vel x < 0 && enemynear(var(58)),facing = facing
TriggerAll = RoundState = 2
TriggerAll = StateType != A
TriggerAll = BackEdgeBodyDist >= 30
TriggerAll = p2bodydist x <= 30
TriggerAll = Ctrl || (StateNo = [20,22])||(StateNo = [100,101])||(StateNo = [200,440])|| StateNo = [120,149] 
Trigger1 = P2BodyDist X < 80 || FrontEdgeBodyDist < 80
Trigger1 = HELPER(35002),VAR(57) = 1
Trigger1 = enemynear(var(58)),animtime = [-30,-4]
Trigger1 = EnemyNear(var(58)),vel x != 0
trigger1 =!Enemy,NumProj

;バックステップ
[state -1]
Type = ChangeState
Value = ifelse((enemynear(var(58)),animtime = [-15,-10]),980,ifelse((enemynear(var(58)),animtime = [-20,-15]),39,35))
TriggerAll = var(59) = 1
TriggerAll = var(41) <= 100
TriggerAll = RoundState = 2
TriggerAll = StateType != A
TriggerAll = BackEdgeBodyDist >= 30
TriggerAll = p2bodydist x <= 30
TriggerAll = Ctrl || (StateNo = [20,22])||(StateNo = [100,101])||(StateNo = [200,440])|| StateNo = [120,149] 
Trigger1 = P2BodyDist X < 80 || FrontEdgeBodyDist < 80
Trigger1 = HELPER(35002),VAR(57) = 1
Trigger1 = enemynear(var(58)),animtime = [-30,-10]
Trigger1 = EnemyNear(var(58)),vel x != 0
trigger1 =!Enemy,NumProj

;バックステップ
[State -1]
Type = ChangeState
Value = 105
TriggerAll = var(59) = 1
TriggerAll = RoundState = 2
TriggerAll = StateType != A
TriggerAll = EnemyNear(var(58)),MoveType = I
TriggerAll = EnemyNear(var(58)),facing != facing
TriggerAll =!Enemy,NumProj
TriggerAll = Ctrl || StateNo = [120,149]
Trigger1 = P2BodyDist X = [100,140]
Trigger1 = Random < 30