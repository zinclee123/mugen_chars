;-----------------------Helper------------------------------------------
[Statedef 33000]

[State 33001]
type = playerpush
trigger1 = 1
value = 0

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
triggerall = var(12) != 1
trigger1 = root,Facing!=Helper(33001),Facing && helper(33001),rootdist x <= 100
trigger2 = root,Facing!=Helper(33002),Facing && helper(33002),rootdist x <= 100
var(12) = 1

[State -1, Border]
type = VarSet
triggerall = var(12) != -1
trigger1 = root,Facing = Helper(33001),Facing && helper(33001),rootdist x <= 60
trigger2 = root,Facing = Helper(33002),Facing && helper(33002),rootdist x <= 60
var(12) = -1

[State -1, Border]
type = VarSet
triggerall = var(12) != 0
trigger1 = helper(33001),rootdist x > 100
trigger1 = helper(33002),rootdist x > 100
trigger2 = var(12) = - 1
trigger2 = helper(33001),rootdist x > 60 && helper(33002),rootdist x > 60
var(12) = 0

[State -1, 直前行動]
type = VarSet
trigger1 = root,movetype = H
trigger1 = root,prevstateno != [5000,5799]
trigger1 = root,prevstateno != [120,159]
var(13) = root,prevstateno

[State -1, 直前行動]
type = VarSet
trigger1 = root,movetype = A 
var(14) = root,stateno

[State -1, Preview State]
type = VarSet
trigger1 = var(14) != 0
trigger1 = enemynear,movetype != H || enemynear,stateno = [150,159]
var(14) = 0

[State 32000]
type = varset
trigger1 = var(15) != 0
trigger1 = enemynear,movetype != H && root,movetype != A
var(15) = 0

[State 32000]
type = varset
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
type = playerpush
trigger1 = 1
value = 0

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
Trigger1 = Root,NumProjID(5555)=0
Trigger1 = time=0
Velocity = -10,0
ProjID = 5555
Projanim = 9999
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

[State 33001]
type = playerpush
trigger1 = 1
value = 0

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
Trigger1 = Root,NumProjID(6666)=0
Trigger1 = time=0
Velocity = -10,0
ProjID = 6666
Projanim = 9999
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


[Statedef 11990]

[State 11990]
Type = AssertSpecial
Trigger1 = IsHelper
flag = invisible

[State 33001]
type = playerpush
trigger1 = 1
value = 0

[State 11990]
Type = NotHitBy
Trigger1 = 1
Value = SCA
Time = 1
IgnoreHitPause = 1

[State 11990]
type = varadd
Triggerall = RoundState = 2
triggerall = !(EnemyNear,StateNo = 0 && Root,StateNo = 0 && !Root,Ctrl && !EnemyNear,Ctrl)
trigger1 = floor(Root,pos x) = var(0) 
trigger1 = floor(EnemyNear,pos x) = var(1) 
trigger1 = EnemyNear,MoveType != H
trigger1 = Root,MoveType != H
var(2) = 1

[State 11990,Rest]
type = varset
trigger1 = EnemyNear,MoveType = H
trigger2 = Root,MoveType = H
trigger3 = floor(Root,pos x) != var(0) 
trigger4 = floor(EnemyNear,pos x) != var(1) 
trigger5 = RoundState != 2
trigger6 = EnemyNear,StateType = A
trigger7 = Root,StateType = A
trigger8 = Root,StateNo >= 1000
trigger9 = EnemyNear,StateNo >= 1000
var(2) = 0

[State 11990 上一F自己的位置]
type = Varset
trigger1 = 1
var(0) = floor(Root,pos x)

[State 11990 上一F自己的位置]
type = Varset
trigger1 = 1
var(1) = floor(EnemyNear,pos x)


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

;--------------------------------------------------------
;最多升龙追击次数
[State 11990 ]
type = VarSet
Triggerall = ishelper
Trigger1 = Root,var(52) = 0
var(16) = 3 + ifelse(root,life < 300,1,0)
IgnoreHitPause = 1

[State 11990]
type = VarSet
Triggerall = ishelper
Trigger1 = Root,var(52) > 0
var(16) = 4
IgnoreHitPause = 1

;--------------------------------------------------------
;远距离赌AB
[State 11990 远AB距离初始化]
type = Varset
Triggerall = IsHelper
Trigger1 = var(15) = 0
var(17) = 135
IgnoreHitPause = 1

[State 11990 远AB距离调整]
type = VarAdd
Triggerall = IsHelper
Trigger1 = Root,PrevStateNo = 900
Trigger1 = Root,Time = 1
Trigger1 = Root,MoveType = H
Trigger1 = Root,StateNo != [120,159]
Trigger1 = var(15) >= 100
var(17) = -35
IgnoreHitPause = 1

;--------------------------------------------------------
;弹幕抵消
[state 11990,弹幕不可抵消]
type = varset
Triggerall = ishelper
Triggerall = Root,MoveType = H
Triggerall = Root,StateNo != [120,159]
Triggerall = !EnemyNear,MoveHit
Trigger1 = Root,PrevStateNo = 1700 && Root,Time >= 12
Trigger2 = Root,PrevStateNo = 1720 && Root,Time >= 12
Trigger3 = Root,PrevStateNo = 1701
Trigger4 = Root,PrevStateNo = 1010 && Root,Time >= 12
var(18) = 1
ignorehitpause = 1

;--------------------------------------------------------
;弹幕跳不过去
[state 11990]
type = varset
Triggerall = ishelper
Triggerall = Root,MoveType = H
Triggerall = Root,StateNo != [120,159]
Triggerall = Root,PrevStateNo = 38 || Root,PrevStateNo = 50 || (Root,PrevStateNo = [120,149]) || Root,PrevStateNo = [600,690]
Trigger1 = Root,Pos Y < -80 
Trigger1 = !EnemyNear,MoveHit
var(19) = 1
ignorehitpause = 1

;--------------------------------------------------------
;计算飞行道具出现判定的时间
[State 11990]
type = varset
trigger1 = EnemyNear,StateNo != [1000,1999]
trigger2 = EnemyNear,Ctrl
trigger3 = EnemyNear,MoveType = H
trigger4 = EnemyNear,StateType = L
trigger5 = EnemyNear,NumProj = 0 && !PlayerIdExist(Helper(33333333),var(3))
trigger6 = EnemyNear,AnimTime = 0
var(20) = 0
IgnoreHitPause = 1


[State 11990]
type = varset
triggerall = EnemyNear,StateNo = [1000,1999]
triggerall = Enemynear,MoveType = A || EnemyNear,MoveType = I
triggerall = EnemyNear,NumProj || PlayerIdExist(Helper(33333333),var(3))
triggerall = var(20) = 0

trigger1 = var(21) = 0
trigger1 = var(21) := EnemyNear,StateNo 
trigger1 = var(26) := EnemyNear,Time

trigger2 = var(21) != EnemyNear,StateNo 
trigger2 = var(22) = 0
trigger2 = var(22) := EnemyNear,StateNo
trigger2 = var(27) := EnemyNear,Time

trigger3 = var(21) != EnemyNear,StateNo
trigger3 = var(22) != EnemyNear,StateNo  
trigger3 = var(23) = 0
trigger3 = var(23) := EnemyNear,StateNo
trigger3 = var(28) := EnemyNear,Time

trigger4 = var(21) != EnemyNear,StateNo
trigger4 = var(22) != EnemyNear,StateNo  
trigger4 = var(23) != EnemyNear,StateNo 
trigger4 = var(24) = 0
trigger4 = var(24) := EnemyNear,StateNo
trigger5 = var(29) := EnemyNear,Time

trigger5 = var(21) != EnemyNear,StateNo
trigger5 = var(22) != EnemyNear,StateNo  
trigger5 = var(23) != EnemyNear,StateNo 
trigger5 = var(24) != EnemyNear,StateNo 
trigger5 = var(25) = 0
trigger5 = var(25) := EnemyNear,StateNo
trigger5 = var(30) := EnemyNear,Time

var(20) = 1
IgnoreHitPause = 1

[State 11990]
type = Null
triggerall = 1 || var(31) := 0
trigger1 = var(21) && var(21) = enemynear,Stateno
trigger1 = var(31) := var(26)
trigger2 = var(22) && var(22) = enemynear,Stateno
trigger2 = var(31) := var(27)
trigger3 = var(23) && var(23) = enemynear,Stateno
trigger3 = var(31) := var(28)
trigger4 = var(24) && var(24) = enemynear,Stateno
trigger4 = var(31) := var(29)
trigger5 = var(25) && var(25) = enemynear,Stateno
trigger5 = var(31) := var(30)
IgnoreHitPause = 1

;--------------------------------------------------------
;多个飞行道具同时出现
[State 11990]
type = varset
Triggerall = RoundState = 2
triggerall = EnemyNear,MoveType = A
Triggerall = EnemyNear,StateNo = [1000,1999]
trigger1 = EnemyNear,NumProj > 1
trigger2 = PlayerIdExist(Helper(33333333),var(3)) && PlayerIdExist(Helper(33333333),var(4))
var(32) = 1
ignorehitpause

;--------------------------------------------------------
;当身记录
[state 11990,对手当身技 记录]
type = null
triggerall = ishelper
triggerall = root,var(18) = [700,1999]

trigger1 = var(37) = 0
trigger1 = var(37) := root,var(18) 

trigger2 = var(37) != root,var(18) 
trigger2 = var(38) = 0
trigger2 = var(38) := root,var(18) 

trigger3 = var(37) != root,var(18) 
trigger3 = var(38) != root,var(18) 
trigger3 = var(39) = 0
trigger3 = var(39) := root,var(18) 

trigger4 = var(37) != root,var(18) 
trigger4 = var(38) != root,var(18) 
trigger4 = var(39) != root,var(18) 
trigger4 = var(40) = 0
trigger4 = var(40) := root,var(18) 

trigger5 = var(37) != root,var(18) 
trigger5 = var(38) != root,var(18) 
trigger5 = var(39) != root,var(18) 
trigger5 = var(40) != root,var(18) 
trigger5 = var(41) = 0
trigger5 = var(41) := root,var(18) 

trigger6 = var(37) != root,var(18) 
trigger6 = var(38) != root,var(18) 
trigger6 = var(39) != root,var(18) 
trigger6 = var(40) != root,var(18) 
trigger6 = var(41) != root,var(18) 
trigger6 = var(42) = 0
trigger6 = var(42) := root,var(18) 
IgnoreHitPause = 1

[state 11990,对手当身技 记录]
type = null
triggerall = ishelper
triggerall = root,var(19) = [700,1999]

trigger1 = var(37) = 0
trigger1 = var(37) := root,var(19) 

trigger2 = var(37) != root,var(19) 
trigger2 = var(38) = 0
trigger2 = var(38) := root,var(19) 

trigger3 = var(37) != root,var(19) 
trigger3 = var(38) != root,var(19) 
trigger3 = var(39) = 0
trigger3 = var(39) := root,var(19) 

trigger4 = var(37) != root,var(19) 
trigger4 = var(38) != root,var(19) 
trigger4 = var(39) != root,var(19) 
trigger4 = var(40) = 0
trigger4 = var(40) := root,var(19) 

trigger5 = var(37) != root,var(19) 
trigger5 = var(38) != root,var(19) 
trigger5 = var(39) != root,var(19) 
trigger5 = var(40) != root,var(19) 
trigger5 = var(41) = 0
trigger5 = var(41) := root,var(19) 

trigger6 = var(37) != root,var(19) 
trigger6 = var(38) != root,var(19) 
trigger6 = var(39) != root,var(19) 
trigger6 = var(40) != root,var(19) 
trigger6 = var(41) != root,var(19) 
trigger6 = var(42) = 0
trigger6 = var(42) := root,var(19) 
IgnoreHitPause = 1


[state 11990,对手正在使用当身技]
type = VarSet
var(43) = 1
triggerall = ishelper
triggerall = 1 || var(43) := 0
trigger1 = var(37) && var(37) = enemynear,Stateno
trigger2 = var(38) && var(38) = enemynear,Stateno
trigger3 = var(39) && var(39) = enemynear,Stateno
trigger4 = var(40) && var(40) = enemynear,Stateno
trigger5 = var(41) && var(41) = enemynear,Stateno
trigger6 = var(42) && var(42) = enemynear,Stateno
IgnoreHitPause = 1


;--------------------------------------------------------
;切返条件判定
;飞行道具不切返，因为K系列会空振滑步
;普通招式只切返比我们最快最远的招式开快的招式
[State -3]
type = Null
triggerall = ishelper
triggerall = 1 || var(44) := 0
Triggerall = EnemyNear,MoveType != I
Triggerall = var(43) = 0 || EnemyNear,Time - EnemyNear,AnimTime < 30
Triggerall = !((EnemyNear,StateNo = [200,1999]) && EnemyNear,Time > -EnemyNear,AnimTime) || EnemyNear,AnimTime > 0
;2A都不能抢的普通招式
Trigger1 = EnemyNear,MoveType = A
trigger1 = EnemyNear,StateNo = [200,999]
trigger1 = helper(33000),var(3) != [0,1] ;这种是Time=0的Hitdef
trigger1 = Enemynear,StateType != A
trigger1 = Root,P2BodyDist x = [-40, 40]
trigger1 = enemynear,stateno = helper(33000),var(2)
trigger1 = helper(33000),var(3) <= 3
trigger1 = var(44) := 2
;2B都不能抢的普通招式
Trigger2 = EnemyNear,MoveType = A
trigger2 = EnemyNear,StateNo = [200,999]
trigger2 = helper(33000),var(3) != [0,1] ;这种是Time=0的Hitdef
trigger2 = Enemynear,StateType != A
trigger2 = Root,P2BodyDist x = [-65, 65]
trigger2 = enemynear,stateno = helper(33000),var(2)
trigger2 = helper(33000),var(3) < 5
trigger2 = var(44) := 1
;必杀技
trigger3 = EnemyNear,StateNo = [1000,1999]
trigger3 = Enemynear,StateType != A
trigger3 = EnemyNear,MoveType = A
trigger3 = var(44) := 1
;超杀
trigger4 = EnemyNear,StateNo = [2000,4999]
trigger4 = Enemynear,StateType != A
trigger4 = EnemyNear,MoveType = A
trigger4 = var(44) := 1
;超远的普通技能
trigger5 = EnemyNear,StateNo = [200,999]
trigger5 = Enemynear,StateType != A
trigger5 = EnemyNear,Life - Life > 500 || Root,P2BodyDist x = [70,120]
trigger5 = EnemyNear,MoveType = A
trigger5 = var(44) := 1
IgnoreHitPause = 1

[state 1091100,敌人当身技记录 显示]
type = displaytoclipboard
triggerall = ishelper
trigger1 = 1
text = "V37=%d V38=%d V39=%d V40=%d V41=%d V42=%d"
params = var(37),var(38),var(39),var(40),var(41),var(42)

[state 1091100,敌人正在使用当身技 显示]
type = Appendtoclipboard
triggerall = ishelper
trigger1 = 0
text = "\nv17=%d"
params = var(17)









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
trigger1 = PlayerID(var(0)-1),hitdefattr = ASC, AP, AA
trigger1 = var(3) := (var(0)-1)
trigger2 = PlayerIdExist(var(0)-2)
trigger2 = IfElse(root,teamside = 1, PlayerID(var(0)-2),teamside = 2, PlayerID(var(0)-2),teamside = 1)
trigger2 = PlayerID(var(0)-2),hitdefattr = ASC, AP, AA
trigger2 = var(3) := (var(0)-2)
trigger3 = PlayerIdExist(var(0)-3)
trigger3 = IfElse(root,teamside = 1, PlayerID(var(0)-3),teamside = 2, PlayerID(var(0)-3),teamside = 1)
trigger3 = PlayerID(var(0)-3),hitdefattr = ASC, AP, AA
trigger3 = var(3) := (var(0)-3)
trigger4 = PlayerIdExist(var(0)-4)
trigger4 = IfElse(root,teamside = 1, PlayerID(var(0)-4),teamside = 2, PlayerID(var(0)-4),teamside = 1)
trigger4 = PlayerID(var(0)-4),hitdefattr = ASC, AP, AA
trigger4 = var(3) := (var(0)-4)
trigger5 = PlayerIdExist(var(0)-5)
trigger5 = IfElse(root,teamside = 1, PlayerID(var(0)-5),teamside = 2, PlayerID(var(0)-5),teamside = 1)
trigger5 = PlayerID(var(0)-5),hitdefattr = ASC, AP, AA
trigger5 = var(3) := (var(0)-5)
trigger6 = PlayerIdExist(var(0)-6)
trigger6 = IfElse(root,teamside = 1, PlayerID(var(0)-6),teamside = 2, PlayerID(var(0)-6),teamside = 1)
trigger6 = PlayerID(var(0)-6),hitdefattr = ASC, AP, AA
trigger6 = var(3) := (var(0)-6)
trigger7 = PlayerIdExist(var(0)-7)
trigger7 = IfElse(root,teamside = 1, PlayerID(var(0)-7),teamside = 2, PlayerID(var(0)-7),teamside = 1)
trigger7 = PlayerID(var(0)-7),hitdefattr = ASC, AP, AA
trigger7 = var(3) := (var(0)-7)
trigger8 = PlayerIdExist(var(0)-8)
trigger8 = IfElse(root,teamside = 1, PlayerID(var(0)-8),teamside = 2, PlayerID(var(0)-8),teamside = 1)
trigger8 = PlayerID(var(0)-8),hitdefattr = ASC, AP, AA
trigger8 = var(3) := (var(0)-8)
trigger9 = PlayerIdExist(var(0)-9)
trigger9 = IfElse(root,teamside = 1, PlayerID(var(0)-9),teamside = 2, PlayerID(var(0)-9),teamside = 1)
trigger9 = PlayerID(var(0)-9),hitdefattr = ASC, AP, AA
trigger9 = var(3) := (var(0)-9)
trigger10 = PlayerIdExist(var(0)-10)
trigger10 = IfElse(root,teamside = 1, PlayerID(var(0)-10),teamside = 2, PlayerID(var(0)-10),teamside = 1)
trigger10 = PlayerID(var(0)-10),hitdefattr = ASC, AP, AA
trigger10 = var(3) := (var(0)-10)
ignorehitpause = 1

[State 33333333, 2]
type = Null
triggerall = PlayerIdExist(Root,ID)
trigger1 = PlayerIdExist(var(3)-1)
trigger1 = IfElse(root,teamside = 1, PlayerID(var(3)-1),teamside = 2, PlayerID(var(3)-1),teamside = 1)
trigger1 = PlayerID(var(3)-1),hitdefattr = ASC, AP, AA
trigger1 = var(4) := (var(3)-1)
trigger2 = PlayerIdExist(var(3)-2)
trigger2 = IfElse(root,teamside = 1, PlayerID(var(3)-2),teamside = 2, PlayerID(var(3)-2),teamside = 1)
trigger2 = PlayerID(var(3)-2),hitdefattr = ASC, AP, AA
trigger2 = var(4) := (var(3)-2)
trigger3 = PlayerIdExist(var(3)-3)
trigger3 = IfElse(root,teamside = 1, PlayerID(var(3)-3),teamside = 2, PlayerID(var(3)-3),teamside = 1)
trigger3 = PlayerID(var(3)-3),hitdefattr = ASC, AP, AA
trigger3 = var(4) := (var(3)-3)
trigger4 = PlayerIdExist(var(3)-4)
trigger4 = IfElse(root,teamside = 1, PlayerID(var(3)-4),teamside = 2, PlayerID(var(3)-4),teamside = 1)
trigger4 = PlayerID(var(3)-4),hitdefattr = ASC, AP, AA
trigger4 = var(4) := (var(3)-4)
trigger5 = PlayerIdExist(var(3)-5)
trigger5 = IfElse(root,teamside = 1, PlayerID(var(3)-5),teamside = 2, PlayerID(var(3)-5),teamside = 1)
trigger5 = PlayerID(var(3)-5),hitdefattr = ASC, AP, AA
trigger5 = var(4) := (var(3)-5)
trigger6 = PlayerIdExist(var(3)-6)
trigger6 = IfElse(root,teamside = 1, PlayerID(var(3)-6),teamside = 2, PlayerID(var(3)-6),teamside = 1)
trigger6 = PlayerID(var(3)-6),hitdefattr = ASC, AP, AA
trigger6 = var(4) := (var(3)-6)
trigger7 = PlayerIdExist(var(3)-7)
trigger7 = IfElse(root,teamside = 1, PlayerID(var(3)-7),teamside = 2, PlayerID(var(3)-7),teamside = 1)
trigger7 = PlayerID(var(3)-7),hitdefattr = ASC, AP, AA
trigger7 = var(4) := (var(3)-7)
trigger8 = PlayerIdExist(var(3)-8)
trigger8 = IfElse(root,teamside = 1, PlayerID(var(3)-8),teamside = 2, PlayerID(var(3)-8),teamside = 1)
trigger8 = PlayerID(var(3)-8),hitdefattr = ASC, AP, AA
trigger8 = var(4) := (var(3)-8)
trigger9 = PlayerIdExist(var(3)-9)
trigger9 = IfElse(root,teamside = 1, PlayerID(var(3)-9),teamside = 2, PlayerID(var(3)-9),teamside = 1)
trigger9 = PlayerID(var(3)-9),hitdefattr = ASC, AP, AA
trigger9 = var(4) := (var(3)-9)
trigger10 = PlayerIdExist(var(3)-10)
trigger10 = IfElse(root,teamside = 1, PlayerID(var(3)-10),teamside = 2, PlayerID(var(3)-10),teamside = 1)
trigger10 = PlayerID(var(3)-10),hitdefattr = ASC, AP, AA
trigger10 = var(4) := (var(3)-10)
ignorehitpause = 1




 
[State 33333333, BindToRoot]
type = BindToRoot
trigger1 = PlayerIdExist(Root,ID)
time = 1
facing = 1
pos =0,-2
ignorehitpause = 1 















