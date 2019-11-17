;=========================================================================================
; 破防用Helper
;=========================================================================================
[Statedef 6510]
type = A
movetype = I
physics = N
anim = 9999
velset = 0,0
ctrl = 0

[State 6510, 0]
type = EnvColor
trigger1 = time = 0
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 6510, VarSet]
type = VarSet
trigger1 = time = 0
var(34) = -52

[State 6510, VarAdd]
type = VarAdd
trigger1 = time < 10
var(34) = 10

[State 6510, VarAdd]
type = VarAdd
trigger1 = time > 59
var(34) = -10

[State 6510, Explod]
type = Explod
triggerall = TeamSide = 1
trigger1 = time < 10
trigger2 = time > 59
anim = 6510
id = 6510
ontop = 1
postype = left
pos = var(34),88
bindtime = -1
supermove = 1
pausemovetime = 99999999999999
ownpal = 1
scale = .5,.5

[State 6510, Explod]
type = Explod
triggerall = TeamSide = 1
trigger1 = time = 10
anim = 6511
id = 6510
ontop = 1
postype = left
pos = var(34),88
bindtime = -1
supermove = 1
pausemovetime = 99999999999999
ownpal = 1
scale = .5,.5

[State 6510, Explod]
type = Explod
triggerall = TeamSide = 2
trigger1 = time < 10
trigger2 = time > 59
anim = 6510
id = 6510
ontop = 1
postype = right
pos = -var(34),88
bindtime = -1
supermove = 1
pausemovetime = 99999999999999
ownpal = 1
scale = .5,.5

[State 6510, Explod]
type = Explod
triggerall = TeamSide = 2
trigger1 = time = 10
anim = 6511
id = 6510
ontop = 1
postype = right
pos = -var(34),88
bindtime = -1
supermove = 1
pausemovetime = 99999999999999
ownpal = 1
scale = .5,.5

[State 6510, DestroySelf]
type = DestroySelf
trigger1 = time = 70

;===============================================================
;ゲージ選択ヘルパー
[Statedef 20000]
physics = N
anim = 4650
sprpriority = 7

[State -2]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noFG

[State 20000]
type = DestroySelf
trigger1 = NumPartner = 1
trigger1 = Parent,var(56)
trigger1 = Parent,ID > Partner,ID

[State 20000]
type = VarSet
trigger1= Time = 0
var(50) = 0

[State 20000]
type = VarSet
triggerall = !var(50)
trigger1 = Parent,var(59)
trigger1 = Time > 0
trigger1 = Time%(30-(Parent,StateNo = 0)*20) = 0
var(50) = 3

[State 20000]
type = ChangeAnim
triggerall = Parent,var(59)
trigger1 = Time > 0
trigger1 = Time%(30-(Parent,StateNo = 0)*20) = 0
value = 4649+var(50)

[State 20000, snd]
type = PlaySnd
triggerall = Parent,var(59)
trigger1 = Time > 0
trigger1 = Time%(30-(Parent,StateNo = 0)*20) = 0
value = S8,4

[State 20000, snd]
type = PlaySnd
triggerall = Parent,var(59)
trigger1 = Anim = 4649+var(50)
trigger1 = Time > 0
trigger1 = Time%(50-(Parent,StateNo = 0)*35) = 0
value = S8,5

[State 20000, end]
type = ChangeState
triggerall = Parent,var(59)
trigger1 = Anim = 4649+var(50)
trigger1 = Time > 0
trigger1 = Time%(50-(Parent,StateNo = 0)*35) = 0
value = 20001 + Anim - 4650

[State 20000]
type = ChangeAnim
triggerall = !Parent,var(59)
trigger1 = Parent,Command = "up"
value = IfElse(Anim-1 < 4650,4652,Anim-1)

[State 20000]
type = ChangeAnim
triggerall = !Parent,var(59)
trigger1 = Parent,Command = "down"
value = IfElse(Anim+1 > 4652,4650,Anim+1)

[State 20000, snd]
type = PlaySnd
triggerall = !Parent,var(59)
trigger1 = Parent,Command = "up" || Parent,Command = "down"
value = S8,4

[State 20000, snd]
type = PlaySnd
triggerall = !Parent,var(59)
trigger1 = Parent,Command = "start" || Parent,Command = "fwd" || Parent,Command = "back"
value = S8,5

[State 20000, end]
type = ChangeState
triggerall = !Parent,var(59)
trigger1 = Parent,Command = "start" || Parent,Command = "fwd" || Parent,Command = "back"
value = 20001 + Anim - 4650

[State 20000]
type = PlaySnd
trigger1 = RoundState = 2
trigger1 = Parent,var(7)
value = S8,5

[State 20000]
type = ChangeState
trigger1 = RoundState = 2
trigger1 = Parent,var(7)
value = 20003


[Statedef 20001]
physics = N
anim = 4670
sprpriority = 7

[State -2]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noFG

[State -2]
type = ParentVarSet
trigger1 = Time = 0
fvar(32) = 1

[State -2]
type = ParentVarSet
trigger1 = Time = 0
fvar(33) = 1

[State -2]
type = ParentVarSet
trigger1 = Time = 0
fvar(34) = 1

[State 20001]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = Parent,var(7)


[Statedef 20002]
physics = N
anim = 4671
sprpriority = 7

[State -2]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noFG

[State -2]
type = ParentVarSet
trigger1 = Time = 0
fvar(32) = 2

[State -2]
type = ParentVarSet
trigger1 = Time = 0
fvar(33) = 2

[State -2]
type = ParentVarSet
trigger1 = Time = 0
fvar(34) = 2

[State 20002]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = Parent,var(7)

[Statedef 20003]
physics = N
anim = 4655
sprpriority = 7

[State -2]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noFG

[State 20003, explod]
type = Explod
trigger1 = Time = 0
anim = 4664
ID = 4664
pos = 0,0
bindtime = -1
ownpal = 1
sprpriority = 7

[State 20003, explod]
type = Explod
trigger1 = Time = 0
anim = 4669
ID = 4669
pos = 0,0
bindtime = -1
ownpal = 1
sprpriority = 7

[State 20003]
type = VarSet
trigger1= Time = 0
var(50) = 0

[State 20003]
type = VarRandom
triggerall = !var(50)
trigger1 = Parent,var(59)
trigger1 = Time > 0
trigger1 = Time%20 = 0
v = 50
range = 1,2

[State 20003]
type = ChangeAnim
triggerall = Parent,var(59)
trigger1 = Time%20 = 0
trigger1 = Time > 0
value = 4654+var(50)

[State 20003]
type = PlaySnd
triggerall = Parent,var(59)
trigger1 = Time%20 = 0
trigger1 = Time > 0
trigger1 = var(50) = 2
value = S8,4

[State 20003]
type = PlaySnd
triggerall = Parent,var(59)
trigger1 = Time%30 = 0
trigger1 = Time > 0
value = S8,5

[State 20003, end]
type = ChangeState
triggerall = Parent,var(59)
trigger1 = Time%30 = 0
trigger1 = Time > 0
value = 20004

[State 20003]
type = ChangeAnim
triggerall = !Parent,var(59)
trigger1 = Time > 5
trigger1 = Parent,Command = "up"
value = IfElse(Anim-1 < 4655,4656,Anim-1)

[State 20003]
type = ChangeAnim
triggerall = !Parent,var(59)
trigger1 = Time > 5
trigger1 = Parent,Command = "down"
value = IfElse(Anim+1 > 4656,4655,Anim+1)

[State 20003, snd]
type = PlaySnd
triggerall = !Parent,var(59)
trigger1 = Time > 5
trigger1 = Parent,Command = "up" || Parent,Command = "down"
value = S8,4

[State 20003, snd]
type = PlaySnd
triggerall = !Parent,var(59)
trigger1 = Time > 5
trigger1 = Parent,Command = "start" || Parent,Command = "fwd" || Parent,Command = "back"
value = S8,5

[State 20003]
type = ChangeAnim
trigger1 = RoundState = 2
trigger1 = Parent,var(7)
value = 4655 + Random%2

[State 20003, anim]
type = VarSet
trigger1 = 1
var(1) = Anim - 4655

[State 20003]
type = PlaySnd
trigger1 = RoundState = 2
trigger1 = Parent,var(7)
value = S8,5

[State 20003, end]
type = ChangeState
trigger1 = !Parent,var(59)
trigger1 = Time > 5
trigger1 = Parent,Command = "start" || Parent,Command = "fwd" || Parent,Command = "back"
trigger2 = RoundState = 2
trigger2 = Parent,var(7)
value = 20004


[Statedef 20004]
physics = N
anim = 4660
sprpriority = 7

[State -2]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noFG

[State -2]
type = ParentVarSet
trigger1 = Time = 0
fvar(32) = var(1) + 1

[State 20004]
type = RemoveExplod
trigger1 = Time = 0
ID = 4664

[State 20004, explod]
type = Explod
trigger1 = Time = 0
anim = 4657+var(1)
ID = 4657+var(1)
pos = 0,0
bindtime = -1
ownpal = 1
sprpriority = 7

[State 20004]
type = VarSet
trigger1= Time = 0
var(50) = 0

[State 20004]
type = VarRandom
triggerall = !var(50)
trigger1 = Parent,var(59)
trigger1 = Time > 0
trigger1 = Time%(20-(Parent,StateNo = 0)*15) = 0
v = 50
range = 1,2

[State 20004]
type = ChangeAnim
triggerall = Parent,var(59)
trigger1 = Time%(20-(Parent,StateNo = 0)*15) = 0
trigger1 = Time > 0
value = 4659+var(50)

[State 20004]
type = PlaySnd
triggerall = Parent,var(59)
trigger1 = Time%(20-(Parent,StateNo = 0)*15) = 0
trigger1 = Time > 0
trigger1 = var(50) = 2
value = S8,4

[State 20004]
type = PlaySnd
triggerall = Parent,var(59)
trigger1 = Time%(30-(Parent,StateNo = 0)*22) = 0
trigger1 = Time > 0
value = S8,5

[State 20004, end]
type = ChangeState
triggerall = Parent,var(59)
trigger1 = Time%(30-(Parent,StateNo = 0)*22) = 0
trigger1 = Time > 0
value = 20005

[State 20004, snd]
type = PlaySnd
triggerall = !Parent,var(59)
trigger1 = Time > 5
trigger1 = Parent,Command = "up" || Parent,Command = "down"
value = S8,4

[State 20004]
type = ChangeAnim
triggerall = !Parent,var(59)
trigger1 = Time > 5
trigger1 = Parent,Command = "up"
value = IfElse(Anim-1 < 4660,4661,Anim-1)

[State 20004]
type = ChangeAnim
triggerall = !Parent,var(59)
trigger1 = Time > 5
trigger1 = Parent,Command = "down"
value = IfElse(Anim+1 > 4661,4660,Anim+1)

[State 20004, snd]
type = PlaySnd
triggerall = !Parent,var(59)
trigger1 = Time > 5
trigger1 = Parent,Command = "up" || Parent,Command = "down"
value = S8,4

[State 20004, snd]
type = PlaySnd
triggerall = !Parent,var(59)
trigger1 = Time > 5
trigger1 = Parent,Command = "start" || Parent,Command = "fwd" || Parent,Command = "back"
value = S8,5

[State 20004]
type = ChangeAnim
trigger1 = RoundState = 2
trigger1 = Parent,var(7)
value = 4660 + Random%2

[State 20004, anim]
type = VarSet
trigger1 = 1
var(2) = Anim - 4660

[State 20004]
type = PlaySnd
trigger1 = RoundState = 2
trigger1 = Parent,var(7)
value = S8,5

[State 20004, end]
type = ChangeState
trigger1 = !Parent,var(59)
trigger1 = Time > 5
trigger1 = Parent,Command = "start" || Parent,Command = "fwd" || Parent,Command = "back"
trigger2 = RoundState = 2
trigger2 = Parent,var(7)
value = 20005


[Statedef 20005]
physics = N
anim = 4665
sprpriority = 7

[State -2]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noFG

[State -2]
type = ParentVarSet
trigger1 = Time = 0
fvar(33) = var(2) + 1

[State 20004]
type = RemoveExplod
trigger1 = Time = 0
ID = 4669

[State 20005, explod]
type = Explod
trigger1 = Time = 0
anim = 4662+var(2)
ID = 4662+var(2)
pos = 0,0
bindtime = -1
ownpal = 1
sprpriority = 7

[State 20005]
type = VarSet
trigger1= Time = 0
var(50) = 0

[State 20005]
type = VarRandom
triggerall = !var(50)
trigger1 = Parent,var(59)
trigger1 = Time > 0
trigger1 = Time%(20-(Parent,StateNo = 0)*15) = 0
v = 50
range = 1,2

[State 20005]
type = ChangeAnim
triggerall = Parent,var(59)
trigger1 = Time%(20-(Parent,StateNo = 0)*15) = 0
trigger1 = Time > 0
value = 4664+var(50)

[State 20005]
type = PlaySnd
triggerall = Parent,var(59)
trigger1 = Time%(20-(Parent,StateNo = 0)*15) = 0
trigger1 = Time > 0
trigger1 = var(50) = 2
value = S8,4

[State 20005]
type = PlaySnd
triggerall = Parent,var(59)
trigger1 = Time%(30-(Parent,StateNo = 0)*22) = 0
trigger1 = Time > 0
value = S8,5

[State 20005, end]
type = ChangeState
triggerall = Parent,var(59)
trigger1 = Time%(30-(Parent,StateNo = 0)*22) = 0
trigger1 = Time > 0
value = 20006

[State 20005]
type = ChangeAnim
triggerall = !Parent,var(59)
trigger1 = Time > 5
trigger1 = Parent,Command = "up"
value = IfElse(Anim-1 < 4665,4666,Anim-1)

[State 20005]
type = ChangeAnim
triggerall = !Parent,var(59)
trigger1 = Time > 5
trigger1 = Parent,Command = "down"
value = IfElse(Anim+1 > 4666,4665,Anim+1)

[State 20005, snd]
type = PlaySnd
triggerall = !Parent,var(59)
trigger1 = Time > 5
trigger1 = Parent,Command = "up" || Parent,Command = "down"
value = S8,4

[State 20005, snd]
type = PlaySnd
triggerall = !Parent,var(59)
trigger1 = Time > 5
trigger1 = Parent,Command = "start" || Parent,Command = "fwd" || Parent,Command = "back"
value = S8,5

[State 20005]
type = ChangeAnim
trigger1 = Parent,var(7)
value = 4665 + Random%2

[State 20005, anim]
type = VarSet
trigger1 = 1
var(3) = Anim - 4665

[State 20005]
type = PlaySnd
trigger1 = Parent,var(7)
value = S8,5

[State 20005, end]
type = ChangeState
trigger1 = !Parent,var(59)
trigger1 = Time > 5
trigger1 = Parent,Command = "start" || Parent,Command = "fwd" || Parent,Command = "back"
trigger2 = Parent,var(7)
value = 20006


[Statedef 20006]
physics = N
sprpriority = 7

[State -2]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noFG

[State 20006]
type = ChangeAnim
triggerall = Time = 0
trigger1 = !var(1) && !var(2) && !var(3)
value = 4670

[State 20006]
type = ChangeAnim
triggerall = Time = 0
trigger1 = var(1) && var(2) && var(3)
value = 4671

[State 20006]
type = ChangeAnim
triggerall = Time = 0
trigger1 = !(!var(1) && !var(2) && !var(3))
trigger1 = !(var(1) && var(2) && var(3))
value = 4672

[State 20006]
type = RemoveExplod
trigger1 = Time = 0
ID = 4657+var(1)

[State 20006]
type = RemoveExplod
trigger1 = Time = 0
ID = 4662+var(2)

[State -2]
type = ParentVarSet
trigger1 = Time = 0
fvar(32) = var(1) + 1

[State -2]
type = ParentVarSet
trigger1 = Time = 0
fvar(33) = var(2) + 1

[State -2]
type = ParentVarSet
trigger1 = Time = 0
fvar(34) = var(3) + 1

[State 20006]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = Parent,var(7)



;===============================================================
;パワーゲージシステム管理ヘルパー98UM
[Statedef 25000]
physics = N
movetype = I
anim = 9999
ctrl = 0

[State 25000, destroy]
type = DestroySelf
trigger1 = !Parent,fvar(30)


[State 25000, varset];モード判別(ADV)
type = VarSet
triggerall = Time >= 1
triggerall = Parent,fvar(29) = 4
trigger1 = Parent,fvar(32) = 1 && Parent,fvar(33) = 1 && Parent,fvar(34) = 1
var(1) = 1

[State 25000, varset];モード判別(EX)
type = VarSet
triggerall = Time >= 1
triggerall = Parent,fvar(29) = 4
trigger1 = Parent,fvar(32) = 2 && Parent,fvar(33) = 2 && Parent,fvar(34) = 2
var(1) = 2

[State 25000, varset];モード判別(ULT ダッシュ＆避け＆アドバンスドゲージ）
type = VarSet
triggerall = Time >= 1
triggerall = Parent,fvar(29) = 4
trigger1 = Parent,fvar(32) = 1 && Parent,fvar(33) = 2 && Parent,fvar(34) = 1
var(1) = 3

[State 25000, varset];モード判別(ULT ステップ＆緊急回避＆アドバンスドゲージ）
type = VarSet
triggerall = Time >= 1
triggerall = Parent,fvar(29) = 4
trigger1 = Parent,fvar(32) = 2 && Parent,fvar(33) = 1 && Parent,fvar(34) = 1
var(1) = 4

[State 25000, varset];モード判別(ULT ステップ＆緊急回避＆アドバンスドゲージ）
type = VarSet
triggerall = Time >= 1
triggerall = Parent,fvar(29) = 4
trigger1 = Parent,fvar(32) = 2 && Parent,fvar(33) = 2 && Parent,fvar(34) = 1
var(1) = 5

[State 25000, varset];モード判別(ULT ダッシュ＆緊急回避＆エキストラゲージ）
type = VarSet
triggerall = Time >= 1
triggerall = Parent,fvar(29) = 4
trigger1 = Parent,fvar(32) = 1 && Parent,fvar(33) = 1 && Parent,fvar(34) = 2
var(1) = 6

[State 25000, varset];モード判別(ULT ダッシュ＆避け＆エキストラゲージ）
type = VarSet
triggerall = Time >= 1
triggerall = Parent,fvar(29) = 4
trigger1 = Parent,fvar(32) = 1 && Parent,fvar(33) = 2 && Parent,fvar(34) = 2
var(1) = 7

[State 25000, varset];モード判別(ULT ステップ＆緊急回避＆エキストラゲージ）
type = VarSet
triggerall = Time >= 1
triggerall = Parent,fvar(29) = 4
trigger1 = Parent,fvar(32) = 2 && Parent,fvar(33) = 1 && Parent,fvar(34) = 2
var(1) = 8

[State 25000, varset];モード判別(S)
type = VarSet
triggerall = Time >= 1
trigger1 = Parent,fvar(29) != 4
trigger1 = Parent,fvar(32) = 1 && Parent,fvar(33) = 1 && Parent,fvar(34) = 1
var(1) = 9

[State 25000, Gauge];ゲージ本体1P
type = Explod
triggerall = TeamSide = 1
triggerall = Parent,NumHelper(20000) = 0
trigger1 = var(1)
trigger1 = NumExplod(4000+(var(1)-1)*5) = 0
ID = 4000+(var(1)-1)*5
anim = 4000+(var(1)-1)*5
pos = 5,228
postype = left
facing = 1
bindtime = -1
removetime = -1
ownpal = 1
sprpriority = 5
pausemovetime = 2147483647
supermovetime = 2147483647


[State 25000, stock];ADVストック1P
type = Explod
triggerall = TeamSide = 1
trigger1 = var(1)
trigger1 = NumExplod(4200) = 0
trigger1 = NumExplod(4000+(var(1)-1)*5)
trigger1 = Parent,fvar(34) = 1
trigger1 = Parent,Power < 1000
ID = 4200
anim = 4200
pos = 5,228
postype = left
facing = 1
bindtime = -1
removetime = -1
ownpal = 1
sprpriority = 7
pausemovetime = 2147483647
supermovetime = 2147483647

[State 25000]
type = RemoveExplod
trigger1 = !(Parent,Power < 1000)
ID = 4200

[State 25000, stock];ADVストック1P
type = Explod
triggerall = TeamSide = 1
trigger1 = var(1)
trigger1 = NumExplod(4201) = 0
trigger1 = NumExplod(4000+(var(1)-1)*5)
trigger1 = Parent,fvar(34) = 1
trigger1 = Parent,Power = [1000,2000)
ID = 4201
anim = 4201
pos = 5,228
postype = left
facing = 1
bindtime = -1
removetime = -1
ownpal = 1
sprpriority = 7
pausemovetime = 2147483647
supermovetime = 2147483647

[State 25000]
type = RemoveExplod
trigger1 = !(Parent,Power = [1000,2000))
ID = 4201

[State 25000, stock];ADVストック1P
type = Explod
triggerall = TeamSide = 1
trigger1 = var(1)
trigger1 = NumExplod(4202) = 0
trigger1 = NumExplod(4000+(var(1)-1)*5)
trigger1 = Parent,fvar(34) = 1
trigger1 = Parent,Power = [2000,3000)
ID = 4202
anim = 4202
pos = 5,228
postype = left
facing = 1
bindtime = -1
removetime = -1
ownpal = 1
sprpriority = 7
pausemovetime = 2147483647
supermovetime = 2147483647

[State 25000]
type = RemoveExplod
trigger1 = !(Parent,Power = [2000,3000))
ID = 4202

[State 25000, stock];ADVストック1P
type = Explod
triggerall = TeamSide = 1
trigger1 = var(1)
trigger1 = NumExplod(4203) = 0
trigger1 = NumExplod(4000+(var(1)-1)*5)
trigger1 = Parent,fvar(34) = 1
trigger1 = Parent,Power = [3000,4000)
ID = 4203
anim = 4203
pos = 5,228
postype = left
facing = 1
bindtime = -1
removetime = -1
ownpal = 1
sprpriority = 7
pausemovetime = 2147483647
supermovetime = 2147483647

[State 25000]
type = RemoveExplod
trigger1 = !(Parent,Power = [3000,4000))
ID = 4203

[State 25000, stock];ADVストック1P
type = Explod
triggerall = TeamSide = 1
trigger1 = var(1)
trigger1 = NumExplod(4204) = 0
trigger1 = NumExplod(4000+(var(1)-1)*5)
trigger1 = Parent,fvar(34) = 1
trigger1 = Parent,Power = [4000,5000)
ID = 4204
anim = 4204
pos = 5,228
postype = left
facing = 1
bindtime = -1
removetime = -1
ownpal = 1
sprpriority = 7
pausemovetime = 2147483647
supermovetime = 2147483647

[State 25000]
type = RemoveExplod
trigger1 = !(Parent,Power = [4000,5000))
ID = 4204

[State 25000, stock];ADVストック1P
type = Explod
triggerall = TeamSide = 1
trigger1 = var(1)
trigger1 = NumExplod(4205) = 0
trigger1 = NumExplod(4000+(var(1)-1)*5)
trigger1 = Parent,fvar(34) = 1
trigger1 = Parent,Power >= 5000
ID = 4205
anim = 4205
pos = 5,228
postype = left
facing = 1
bindtime = -1
removetime = -1
ownpal = 1
sprpriority = 7
pausemovetime = 2147483647
supermovetime = 2147483647

[State 25000]
type = RemoveExplod
trigger1 = !(Parent,Power >= 5000)
ID = 4205


[State 25000, stock];EXストック1P
type = Explod
triggerall = TeamSide = 1
trigger1 = var(1)
trigger1 = NumExplod(4206) = 0
trigger1 = NumExplod(4000+(var(1)-1)*5)
trigger1 = Parent,fvar(34) = 2
trigger1 = Parent,Power < 1000
ID = 4206
anim = 4206
pos = 5,228
postype = left
facing = 1
bindtime = -1
removetime = -1
ownpal = 1
ontop = 1
pausemovetime = 2147483647
supermovetime = 2147483647

[State 25000]
type = RemoveExplod
trigger1 = Parent,Power >= 1000
ID = 4206

[State 25000];ADVパワーバー1P
type = Explod
triggerall = TeamSide = 1
trigger1 = var(1)
trigger1 = NumExplod(4050) = 0
trigger1 = NumExplod(4000+(var(1)-1)*5)
trigger1 = Parent,fvar(34) = 1
ID = 4050
anim = 4050
pos = 18,225
postype = left
facing = 1
bindtime = -1
removetime = -1
ownpal = 1
ontop = 1
pausemovetime = 2147483647
supermovetime = 2147483647

[State 25000]
type = ModifyExplod
trigger1 = 1
ID = 4050
scale = IfElse(Power%1000 = 0,0,(Power%1000)/1000.0),1

[State 25000];EXパワーバー1P
type = Explod
triggerall = TeamSide = 1
trigger1 = var(1)
trigger1 = NumExplod(4050) = 0
trigger1 = NumExplod(4000+(var(1)-1)*5)
trigger1 = Parent,fvar(34) = 2
ID = 4050
anim = 4051
pos = 18,225
postype = left
facing = 1
bindtime = -1
removetime = -1
ownpal = 1
ontop = 1
pausemovetime = 2147483647
supermovetime = 2147483647


[State 25000];MAX発動ゲージ1P
type = Explod
triggerall = TeamSide = 1
trigger1 = var(1)
trigger1 = NumExplod(4250) = 0
trigger1 = Parent,var(52)
ID = 4250
anim = 4250
pos = 5-(Parent,fvar(34)=2)*13,228
postype = left
facing = 1
bindtime = -1
removetime = -1
ownpal = 1
ontop = 1
pausemovetime = 2147483647
supermovetime = 2147483647

[State 25000]
type = RemoveExplod
trigger1 = !Parent,var(52)
ID = 4250

[State 25000];MAX発動バー1P
type = Explod
triggerall = TeamSide = 1
trigger1 = var(1)
trigger1 = NumExplod(4250) = 1
trigger1 = NumExplod(4251) = 0
trigger1 = Parent,var(52)
ID = 4251
anim = 4251
pos = 44-(Parent,fvar(34)=2)*13,215
postype = left
facing = 1
bindtime = -1
removetime = -1
ownpal = 1
sprpriority = 6
pausemovetime = 2147483647
supermovetime = 2147483647

[State 25000]
type = ModifyExplod
trigger1 = 1
ID = 4251
scale = IfElse((Parent,var(52) > 1080),1,((Parent,var(52))/1080.0)),1

[State 25000]
type = RemoveExplod
trigger1 = !Parent,var(52)
ID = 4251

[State 25000];MAX発動バー1P
type = Explod
triggerall = TeamSide = 1
trigger1 = var(1)
trigger1 = NumExplod(4250) = 1
trigger1 = NumExplod(4252) = 0
trigger1 = Parent,var(52) > 1080
ID = 4252
anim = 4252
pos = 44-(Parent,fvar(34)=2)*13,215
postype = left
facing = 1
bindtime = -1
removetime = -1
ownpal = 1
sprpriority = 7
pausemovetime = 2147483647
supermovetime = 2147483647

[State 25000]
type = ModifyExplod
trigger1 = 1
ID = 4252
scale = (Parent,var(52)-1080)/2160.0,1

[State 25000]
type = RemoveExplod
trigger1 = Parent,var(52) <= 1080
ID = 4252

;============================================================
;2P側ゲージ

[State 25000, Gauge];ゲージ本体2P
type = Explod
triggerall = TeamSide = 2
trigger1 = var(1)
trigger1 = NumExplod(4100+(var(1)-1)*5) = 0
trigger1 = Parent,NumHelper(20000) = 0
ID = 4100+(var(1)-1)*5
anim = 4100+(var(1)-1)*5
pos = -5,228
postype = right
facing = 1
bindtime = -1
removetime = -1
ownpal = 1
sprpriority = 5
pausemovetime = 2147483647
supermovetime = 2147483647

[State 25000, stock];ADVストック2P
type = Explod
triggerall = TeamSide = 2
trigger1 = var(1)
trigger1 = NumExplod(4210) = 0
trigger1 = NumExplod(4100+(var(1)-1)*5)
trigger1 = Parent,fvar(34) = 1
trigger1 = Parent,Power < 1000
ID = 4210
anim = 4210
pos = -5,228
postype = right
facing = 1
bindtime = -1
removetime = -1
ownpal = 1
ontop = 1
pausemovetime = 2147483647
supermovetime = 2147483647

[State 25000]
type = RemoveExplod
trigger1 = !(Parent,Power < 1000)
ID = 4210

[State 25000, stock];ADVストック2P
type = Explod
triggerall = TeamSide = 2
trigger1 = var(1)
trigger1 = NumExplod(4211) = 0
trigger1 = NumExplod(4100+(var(1)-1)*5)
trigger1 = Parent,fvar(34) = 1
trigger1 = Parent,Power = [1000,2000)
ID = 4211
anim = 4211
pos = -5,228
postype = right
facing = 1
bindtime = -1
removetime = -1
ownpal = 1
ontop = 1
pausemovetime = 2147483647
supermovetime = 2147483647

[State 25000]
type = RemoveExplod
trigger1 = !(Parent,Power = [1000,2000))
ID = 4211

[State 25000, stock];ADVストック2P
type = Explod
triggerall = TeamSide = 2
trigger1 = var(1)
trigger1 = NumExplod(4212) = 0
trigger1 = NumExplod(4100+(var(1)-1)*5)
trigger1 = Parent,fvar(34) = 1
trigger1 = Parent,Power = [2000,3000)
ID = 4212
anim = 4212
pos = -5,228
postype = right
facing = 1
bindtime = -1
removetime = -1
ownpal = 1
ontop = 1
pausemovetime = 2147483647
supermovetime = 2147483647

[State 25000]
type = RemoveExplod
trigger1 = !(Parent,Power = [2000,3000))
ID = 4212

[State 25000, stock];ADVストック2P
type = Explod
triggerall = TeamSide = 2
trigger1 = var(1)
trigger1 = NumExplod(4213) = 0
trigger1 = NumExplod(4100+(var(1)-1)*5)
trigger1 = Parent,fvar(34) = 1
trigger1 = Parent,Power = [3000,4000)
ID = 4213
anim = 4213
pos = -5,228
postype = right
facing = 1
bindtime = -1
removetime = -1
ownpal = 1
ontop = 1
pausemovetime = 2147483647
supermovetime = 2147483647

[State 25000]
type = RemoveExplod
trigger1 = !(Parent,Power = [3000,4000))
ID = 4213

[State 25000, stock];ADVストック2P
type = Explod
triggerall = TeamSide = 2
trigger1 = var(1)
trigger1 = NumExplod(4214) = 0
trigger1 = NumExplod(4100+(var(1)-1)*5)
trigger1 = Parent,fvar(34) = 1
trigger1 = Parent,Power = [4000,5000)
ID = 4214
anim = 4214
pos = -5,228
postype = right
facing = 1
bindtime = -1
removetime = -1
ownpal = 1
ontop = 1
pausemovetime = 2147483647
supermovetime = 2147483647

[State 25000]
type = RemoveExplod
trigger1 = !(Parent,Power = [4000,5000))
ID = 4214

[State 25000, stock];ADVストック2P
type = Explod
triggerall = TeamSide = 2
trigger1 = var(1)
trigger1 = NumExplod(4215) = 0
trigger1 = NumExplod(4100+(var(1)-1)*5)
trigger1 = Parent,fvar(34) = 1
trigger1 = Parent,Power >= 5000
ID = 4215
anim = 4215
pos = -5,228
postype = right
facing = 1
bindtime = -1
removetime = -1
ownpal = 1
ontop = 1
pausemovetime = 2147483647
supermovetime = 2147483647

[State 25000]
type = RemoveExplod
trigger1 = !(Parent,Power >= 5000)
ID = 4215

[State 25000, stock];EXストック2P
type = Explod
triggerall = TeamSide = 2
trigger1 = var(1)
trigger1 = NumExplod(4216) = 0
trigger1 = NumExplod(4100+(var(1)-1)*5)
trigger1 = Parent,fvar(34) = 2
trigger1 = Parent,Power < 1000
ID = 4216
anim = 4216
pos = -5,228
postype = right
facing = 1
bindtime = -1
removetime = -1
ownpal = 1
ontop = 1
pausemovetime = 2147483647
supermovetime = 2147483647

[State 25000]
type = RemoveExplod
trigger1 = Parent,Power >= 1000
ID = 4216

[State 25000];ADVパワーバー2P
type = Explod
triggerall = TeamSide = 2
trigger1 = var(1)
trigger1 = NumExplod(4150) = 0
trigger1 = NumExplod(4100+(var(1)-1)*5)
trigger1 = Parent,fvar(34) = 1
ID = 4150
anim = 4150
pos = -17,225
postype = right
facing = 1
bindtime = -1
removetime = -1
ownpal = 1
ontop = 1
pausemovetime = 2147483647
supermovetime = 2147483647

[State 25000]
type = ModifyExplod
trigger1 = 1
ID = 4150
scale = IfElse(Power%1000 = 0,0,(Power%1000)/1000.0),1

[State 25000];EXパワーバー2P
type = Explod
triggerall = TeamSide = 2
trigger1 = var(1)
trigger1 = NumExplod(4150) = 0
trigger1 = NumExplod(4100+(var(1)-1)*5)
trigger1 = Parent,fvar(34) = 2
ID = 4150
anim = 4151
pos = -17,225
postype = right
facing = 1
bindtime = -1
removetime = -1
ownpal = 1
ontop = 1
pausemovetime = 2147483647
supermovetime = 2147483647


[State 25000];MAX発動ゲージ2P
type = Explod
triggerall = TeamSide = 2
trigger1 = var(1)
trigger1 = NumExplod(4260) = 0
trigger1 = Parent,var(52)
ID = 4260
anim = 4260
pos = -5+(Parent,fvar(34)=2)*13,228
postype = right
facing = 1
bindtime = -1
removetime = -1
ownpal = 1
ontop = 1
pausemovetime = 2147483647
supermovetime = 2147483647

[State 25000]
type = RemoveExplod
trigger1 = !Parent,var(52)
ID = 4260

[State 25000];MAX発動バー2P
type = Explod
triggerall = TeamSide = 2
trigger1 = var(1)
trigger1 = NumExplod(4260) = 1
trigger1 = NumExplod(4261) = 0
trigger1 = Parent,var(52)
ID = 4261
anim = 4261
pos = -43+(Parent,fvar(34)=2)*13,215
postype = right
facing = 1
bindtime = -1
removetime = -1
ownpal = 1
sprpriority = 6
pausemovetime = 2147483647
supermovetime = 2147483647

[State 25000]
type = ModifyExplod
trigger1 = 1
ID = 4261
scale = IfElse((Parent,var(52) > 1080),1,((Parent,var(52))/1080.0)),1

[State 25000]
type = RemoveExplod
trigger1 = !Parent,var(52)
ID = 4261

[State 25000];MAX発動バー2P
type = Explod
triggerall = TeamSide = 2
trigger1 = var(1)
trigger1 = NumExplod(4260) = 1
trigger1 = NumExplod(4262) = 0
trigger1 = Parent,var(52) > 1080
ID = 4262
anim = 4262
pos = -43+(Parent,fvar(34)=2)*13,215
postype = right
facing = 1
bindtime = -1
removetime = -1
ownpal = 1
sprpriority = 7
pausemovetime = 2147483647
supermovetime = 2147483647

[State 25000]
type = ModifyExplod
trigger1 = 1
ID = 4262
scale = (Parent,var(52)-1080)/2160.0,1

[State 25000]
type = RemoveExplod
trigger1 = Parent,var(52) <= 1080
ID = 4262



[State 25000, remove]
type = RemoveExplod
trigger1 = (4000+(var(1)-1)*5)+(Parent,TeamSide = 2)*100 != 4000
ID = 4000

[State 25000, remove]
type = RemoveExplod
trigger1 = (4000+(var(1)-1)*5)+(Parent,TeamSide = 2)*100 != 4005
ID = 4005

[State 25000, remove]
type = RemoveExplod
trigger1 = (4000+(var(1)-1)*5)+(Parent,TeamSide = 2)*100 != 4010
ID = 4010

[State 25000, remove]
type = RemoveExplod
trigger1 = (4000+(var(1)-1)*5)+(Parent,TeamSide = 2)*100 != 4015
ID = 4015

[State 25000, remove]
type = RemoveExplod
trigger1 = (4000+(var(1)-1)*5)+(Parent,TeamSide = 2)*100 != 4020
ID = 4020

[State 25000, remove]
type = RemoveExplod
trigger1 = (4000+(var(1)-1)*5)+(Parent,TeamSide = 2)*100 != 4025
ID = 4025

[State 25000, remove]
type = RemoveExplod
trigger1 = (4000+(var(1)-1)*5)+(Parent,TeamSide = 2)*100 != 4030
ID = 4030

[State 25000, remove]
type = RemoveExplod
trigger1 = (4000+(var(1)-1)*5)+(Parent,TeamSide = 2)*100 != 4035
ID = 4035

[State 25000, remove]
type = RemoveExplod
trigger1 = (4000+(var(1)-1)*5)+(Parent,TeamSide = 2)*100 != 4040
ID = 4040

[State 25000, remove]
type = RemoveExplod
trigger1 = (4000+(var(1)-1)*5)+(Parent,TeamSide = 2)*100 != 4100
ID = 4100

[State 25000, remove]
type = RemoveExplod
trigger1 = (4000+(var(1)-1)*5)+(Parent,TeamSide = 2)*100 != 4105
ID = 4105

[State 25000, remove]
type = RemoveExplod
trigger1 = (4000+(var(1)-1)*5)+(Parent,TeamSide = 2)*100 != 4110
ID = 4110

[State 25000, remove]
type = RemoveExplod
trigger1 = (4000+(var(1)-1)*5)+(Parent,TeamSide = 2)*100 != 4115
ID = 4115

[State 25000, remove]
type = RemoveExplod
trigger1 = (4000+(var(1)-1)*5)+(Parent,TeamSide = 2)*100 != 4120
ID = 4120

[State 25000, remove]
type = RemoveExplod
trigger1 = (4000+(var(1)-1)*5)+(Parent,TeamSide = 2)*100 != 4125
ID = 4125

[State 25000, remove]
type = RemoveExplod
trigger1 = (4000+(var(1)-1)*5)+(Parent,TeamSide = 2)*100 != 4130
ID = 4130

[State 25000, remove]
type = RemoveExplod
trigger1 = (4000+(var(1)-1)*5)+(Parent,TeamSide = 2)*100 != 4135
ID = 4135

[State 25000, remove]
type = RemoveExplod
trigger1 = (4000+(var(1)-1)*5)+(Parent,TeamSide = 2)*100 != 4140
ID = 4140


;===============================================================
;パワーゲージシステム管理ヘルパー2002
[Statedef 25500]
physics = N
movetype = I
anim = 9999
ctrl = 0

[State 25500, destroy]
type = DestroySelf
trigger1 = !Parent,fvar(30)


[State 25500];1P側ゲージ本体
type = Explod
triggerall = TeamSide = 1
trigger1 = NumExplod(IfElse(power >= 5000,4505,4500+Floor(Power/1000))) = 0
anim = IfElse(power > 5000,4505,4500+Floor(Power/1000))
ID = IfElse(power > 5000,4505,4500+Floor(Power/1000))
bindtime = -1
removetime = -1
pos = 2,205
postype = left
facing = 1
ownpal = 1
ontop = 1
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State 25500];2P側ゲージ本体
type = Explod
triggerall = TeamSide = 2
trigger1 = NumExplod(IfElse(power >= 5000,4515,4510+Floor(Power/1000))) = 0
anim = IfElse(power >= 5000,4515,4510+Floor(Power/1000))
ID = IfElse(power >= 5000,4515,4510+Floor(Power/1000))
bindtime = -1
removetime = -1
pos = -88,205
postype = right
facing = 1
ownpal = 1
ontop = 1
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = !Parent,fvar(30)
trigger2 = power != [0,1000)
ID = IfElse(TeamSide = 1,4500,4510)

[State -2]
type = RemoveExplod
trigger1 = !Parent,fvar(30)
trigger2 = power != [1000,2000)
ID = IfElse(TeamSide = 1,4501,4511)

[State -2]
type = RemoveExplod
trigger1 = !Parent,fvar(30)
trigger2 = power != [2000,3000)
ID = IfElse(TeamSide = 1,4502,4512)

[State -2]
type = RemoveExplod
trigger1 = !Parent,fvar(30)
trigger2 = power != [3000,4000)
ID = IfElse(TeamSide = 1,4503,4513)

[State -2]
type = RemoveExplod
trigger1 = !Parent,fvar(30)
trigger2 = power != [4000,5000)
ID = IfElse(TeamSide = 1,4504,4514)

[State -2]
type = RemoveExplod
trigger1 = !Parent,fvar(30)
trigger2 = power < 5000
ID = IfElse(TeamSide = 1,4505,4515)


[State 25500];1Pパワーバー枠
type = Explod
triggerall = TeamSide = 1
trigger1 = NumExplod(4524) = 0
anim = 4524
ID = 4524
bindtime = -1
removetime = -1
pos = 82,221
postype = left
facing = -1
ownpal = 1
sprpriority = 7
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State 25500, 1P側パワーバーA]
type = Explod
triggerall = TeamSide = 1
triggerall = NumExplod(4530) = 0
trigger1 = Power < 1000 || Power = [3000,PowerMax)
anim = 4530
ID = 4530
bindtime = -1
removetime = -1
pos = 17,221
postype = left
facing = 1
ownpal = 1
ontop = 1
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State 25500, 1P側パワーバーB]
type = Explod
triggerall = TeamSide = 1
triggerall = NumExplod(4531) = 0
trigger1 = Power = [1000,2000)
anim = 4531
ID = 4531
bindtime = -1
removetime = -1
pos = 17,221
postype = left
facing = 1
ownpal = 1
ontop = 1
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State 25500, 1P側パワーバーC]
type = Explod
triggerall = TeamSide = 1
triggerall = NumExplod(4532) = 0
trigger1 = Power = [2000,3000)
anim = 4532
ID = 4532
bindtime = -1
removetime = -1
pos = 17,221
postype = left
facing = 1
ownpal = 1
ontop = 1
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State 25500];1P側パワーバー(MAXIMUM)
type = Explod
triggerall = TeamSide = 1
triggerall = NumExplod(4527) = 0
trigger1 = Power = PowerMax
anim = 4527
ID = 4527
bindtime = -1
removetime = -1
pos = 17,221
postype = left
facing = 1
ownpal = 1
ontop = 1
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1



[State 25500];2Pパワーバー枠
type = Explod
triggerall = TeamSide = 2
trigger1 = NumExplod(4524) = 0
anim = 4524
ID = 4524
bindtime = -1
removetime = -1
pos = -82,221
postype = right
facing = 1
ownpal = 1
sprpriority = 7
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State 25500, 2P側パワーバーA]
type = Explod
triggerall = TeamSide = 2
triggerall = NumExplod(4530) = 0
trigger1 = Power < 1000 || Power = [3000,PowerMax)
anim = 4535
ID = 4530
bindtime = -1
removetime = -1
pos = -16,221
postype = right
facing = 1
ownpal = 1
ontop = 1
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State 25500, 2P側パワーバーB]
type = Explod
triggerall = TeamSide = 2
triggerall = NumExplod(4531) = 0
trigger1 = Power = [1000,2000)
anim = 4536
ID = 4531
bindtime = -1
removetime = -1
pos = -16,221
postype = right
facing = 1
ownpal = 1
ontop = 1
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State 25500, 2P側パワーバーC]
type = Explod
triggerall = TeamSide = 2
triggerall = NumExplod(4532) = 0
trigger1 = Power = [2000,3000)
anim = 4537
ID = 4532
bindtime = -1
removetime = -1
pos = -16,221
postype = right
facing = 1
ownpal = 1
ontop = 1
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State 25500];2P側パワーバー(MAXIMUM)
type = Explod
triggerall = TeamSide = 2
triggerall = NumExplod(4528) = 0
trigger1 = Power = PowerMax
anim = 4528
ID = 4528
bindtime = -1
removetime = -1
pos = -17,221
postype = right
facing = -1
ownpal = 1
ontop = 1
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State -2]
type = ModifyExplod
trigger1 = 1
ID = 4530
scale = (power%1000)/1000.0,1

[State -2]
type = ModifyExplod
trigger1 = 1
ID = 4531
scale = (power%1000)/1000.0,1

[State -2]
type = ModifyExplod
trigger1 = 1
ID = 4532
scale = (power%1000)/1000.0,1

[State -2];パワーバー枠消去
type = RemoveExplod
trigger1 = !Parent,fvar(30)
ID = 4524
ignorehitpause = 1

[State -2];パワーバーA消去
type = RemoveExplod
trigger1 = !(Power < 1000 || Power = [3000,PowerMax))
trigger2 = !Parent,fvar(30)
ID = 4530

[State -2];パワーバーB消去
type = RemoveExplod
trigger1 = !(Power = [1000,2000))
trigger2 = !Parent,fvar(30)
ID = 4531

[State -2];パワーバーC消去
type = RemoveExplod
trigger1 = !(Power = [2000,3000))
trigger2 = !Parent,fvar(30)
ID = 4532

[State -2];1Pパワーバー(MAXIMUM)消去
type = RemoveExplod
triggerall = TeamSide = 1
trigger1 = !(Power = PowerMax)
trigger2 = !Parent,fvar(30)
ID = 4527

[State -2];2Pパワーバー(MAXIMUM)消去
type = RemoveExplod
triggerall = TeamSide = 2
trigger1 = !(Power = PowerMax)
trigger2 = !Parent,fvar(30)
ID = 4528



;MAXゲージ
[State -2];MAX発動1P
type = Explod
triggerall = TeamSide = 1
triggerall = NumExplod(4520) = 0
trigger1 = Root,var(52) = 780
anim = 4520
ID = 4520
bindtime = -1
pos = 2,205
postype = left
facing = 1
ownpal = 1
ontop = 1
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State -2];MAX発動ゲージ1P
type = Explod
triggerall = TeamSide = 1
triggerall = NumExplod(4520) = 0
triggerall = NumExplod(4521) = 0
trigger1 = Root,var(52) > 0
anim = 4521
ID = 4521
bindtime = -1
pos = 2,205
postype = left
facing = 1
ownpal = 1
ontop = 1
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State -2];MAX発動バー1P
type = Explod
triggerall = TeamSide = 1
triggerall = NumExplod(4521) > 0
triggerall = NumExplod(4526) = 0
trigger1 = Root,var(52) > 0
anim = 4526
ID = 4526
bindtime = -1
removetime = -1
pos = 41,217
postype = left
facing = 1
ownpal = 1
ontop = 1
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State -2];MAX発動2P
type = Explod
triggerall = TeamSide = 2
triggerall = NumExplod(4522) = 0
trigger1 = Root,var(52) = 780
anim = 4522
ID = 4522
bindtime = -1
pos = -88,205
postype = right
facing = 1
ownpal = 1
ontop = 1
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State -2];MAX発動ゲージ2P
type = Explod
triggerall = TeamSide = 2
triggerall = NumExplod(4522) = 0
triggerall = NumExplod(4523) = 0
trigger1 = Root,var(52) > 0
anim = 4523
ID = 4523
bindtime = -1
pos = -88,205
postype = right
facing = 1
ownpal = 1
ontop = 1
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State -2];MAX発動バー2P
type = Explod
triggerall = TeamSide = 2
triggerall = NumExplod(4523) > 0
triggerall = NumExplod(4526) = 0
trigger1 = Root,var(52) > 0
anim = 4529
ID = 4526
bindtime = -1
removetime = -1
pos = -40,217
postype = right
facing = 1
ownpal = 1
ontop = 1
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State -2]
type = ModifyExplod
trigger1 = 1
ID = 4526
scale = IfElse(Root,var(52) <= 0,0,(Root,var(52)/780.0)),1

[State -2]
type = RemoveExplod
triggerall = TeamSide = 1
trigger1 = !Root,var(52)
ID = 4521

[State -2]
type = RemoveExplod
triggerall = TeamSide = 2
trigger1 = !Root,var(52)
ID = 4523

[State -2]
type = RemoveExplod
trigger1 = !Root,var(52)
ID = 4526


;===============================================================
;パワーゲージシステム管理ヘルパー2002UM
[Statedef 25600]
pkysics = N
anim = 9999
ctrl = 0

[State 25600, destroy]
type = DestroySelf
trigger1 = !Root,fvar(30)

[State 25600];ゲージ本体1P
type = Explod
triggerall = TeamSide = 1
trigger1 = NumExplod(IfElse(power >= 5000,4305,4300+Floor(Power/1000))) = 0
anim = IfElse(power > 5000,4305,4300+Floor(Power/1000))
ID = IfElse(power > 5000,4305,4300+Floor(Power/1000))
bindtime = -1
removetime = -1
pos = 2,228
postype = left
facing = 1
ownpal = 1
sprpriority = 7
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1


[State 25600];ゲージ本体2P
type = Explod
triggerall = TeamSide = 2
trigger1 = NumExplod(IfElse(power >= 5000,4315,4310+Floor(Power/1000))) = 0
anim = IfElse(power > 5000,4315,4310+Floor(Power/1000))
ID = IfElse(power > 5000,4315,4310+Floor(Power/1000))
bindtime = -1
removetime = -1
pos = -2,228
postype = right
facing = 1
ownpal = 1
sprpriority = 7
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = !Parent,fvar(30)
trigger2 = power != [0,1000)
ID = IfElse(TeamSide = 1,4300,4310)

[State -2]
type = RemoveExplod
trigger1 = !Parent,fvar(30)
trigger2 = power != [1000,2000)
ID = IfElse(TeamSide = 1,4301,4311)

[State -2]
type = RemoveExplod
trigger1 = !Parent,fvar(30)
trigger2 = power != [2000,3000)
ID = IfElse(TeamSide = 1,4302,4312)

[State -2]
type = RemoveExplod
trigger1 = !Parent,fvar(30)
trigger2 = power != [3000,4000)
ID = IfElse(TeamSide = 1,4303,4313)

[State -2]
type = RemoveExplod
trigger1 = !Parent,fvar(30)
trigger2 = power != [4000,5000)
ID = IfElse(TeamSide = 1,4304,4314)

[State -2]
type = RemoveExplod
trigger1 = !Parent,fvar(30)
trigger2 = power < 5000
ID = IfElse(TeamSide = 1,4305,4315)



[State 25600, パワーバー1P]
type = Explod
triggerall = TeamSide = 1
triggerall = NumExplod(IfElse(power>4000,4344,4340+Floor(Power/1000))) = 0
trigger1 = Power < PowerMax
anim = IfElse(power>4000,4344,4340+Floor(Power/1000))
ID = IfElse(power>4000,4344,4340+Floor(Power/1000))
bindtime = -1
removetime = -1
pos = 32,225
postype = left
facing = 1
ownpal = 1
ontop = 1
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State 25600, パワーバー2P]
type = Explod
triggerall = TeamSide = 2
triggerall = NumExplod(IfElse(power>4000,4344,4340+Floor(Power/1000))) = 0
trigger1 = Power < PowerMax
anim = IfElse(power>4000,4344,4340+Floor(Power/1000))
ID = IfElse(power>4000,4344,4340+Floor(Power/1000))
bindtime = -1
removetime = -1
pos = -32,225
postype = right
facing = -1
ownpal = 1
ontop = 1
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State -2]
type = ModifyExplod
trigger1 = 1
ID = 4340
scale = (power%1000)/1000.0,1

[State -2]
type = ModifyExplod
trigger1 = 1
ID = 4341
scale = (power%1000)/1000.0,1

[State -2]
type = ModifyExplod
trigger1 = 1
ID = 4342
scale = (power%1000)/1000.0,1

[State -2]
type = ModifyExplod
trigger1 = 1
ID = 4343
scale = (power%1000)/1000.0,1

[State -2]
type = ModifyExplod
trigger1 = 1
ID = 4344
scale = (power%1000)/1000.0,1

[State -2]
type = RemoveExplod
trigger1 = !(Power < 1000)
ID = 4340

[State -2]
type = RemoveExplod
trigger1 = !(Power = [1000,2000))
ID = 4341

[State -2]
type = RemoveExplod
trigger1 = !(Power = [2000,3000))
ID = 4342

[State -2]
type = RemoveExplod
trigger1 = !(Power = [3000,4000))
ID = 4343

[State -2]
type = RemoveExplod
trigger1 = !(Power = [4000,PowerMax))
ID = 4344


[State 25600];パワーバー1P(MAXIMUM)
type = Explod
triggerall = TeamSide = 1
triggerall = NumExplod(4330) = 0
trigger1 = Power = PowerMax
anim = 4330
ID = 4330
bindtime = -1
removetime = -1
pos = 31,225
postype = left
facing = 1
ownpal = 1
ontop = 1
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State 25600];パワーバー1P(MAXIMUM)
type = Explod
triggerall = TeamSide = 2
triggerall = NumExplod(4330) = 0
trigger1 = Power = PowerMax
anim = 4331
ID = 4330
bindtime = -1
removetime = -1
pos = -31,225
postype = right
facing = 1
ownpal = 1
ontop = 1
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = !(Power = PowerMax)
ID = 4330


;MAXゲージ
[State -2];MAX発動1P
type = Explod
triggerall = TeamSide = 1
triggerall = NumExplod(4320) = 0
trigger1 = Root,var(52) = 780
anim = 4320
ID = 4320
bindtime = -1
pos = 2,228
postype = left
facing = 1
ownpal = 1
sprpriority = 7
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State -2];MAX発動ゲージ1P
type = Explod
triggerall = TeamSide = 1
triggerall = NumExplod(4320) = 0
triggerall = NumExplod(4325) = 0
trigger1 = Root,var(52) > 0
anim = 4325
ID = 4325
bindtime = -1
pos = 2,228
postype = left
facing = 1
ownpal = 1
sprpriority = 7
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State -2];MAX発動2P
type = Explod
triggerall = TeamSide = 2
triggerall = NumExplod(4320) = 0
trigger1 = Root,var(52) = 780
anim = 4321
ID = 4320
bindtime = -1
pos = -2,228
postype = right
facing = 1
ownpal = 1
sprpriority = 7
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State -2];MAX発動ゲージ2P
type = Explod
triggerall = TeamSide = 2
triggerall = NumExplod(4320) = 0
triggerall = NumExplod(4325) = 0
trigger1 = Root,var(52) > 0
anim = 4326
ID = 4325
bindtime = -1
pos = -2,228
postype = right
facing = 1
ownpal = 1
sprpriority = 7
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = !Root,var(52)
ID = 4320

[State -2]
type = RemoveExplod
trigger1 = !Root,var(52)
ID = 4325

[State -2];MAX発動バー1P
type = Explod
triggerall = TeamSide = 1
triggerall = NumExplod(4325) = 1
triggerall = NumExplod(4350) = 0
trigger1 = Root,var(52) > 0
anim = 4350
ID = 4350
bindtime = -1
removetime = -1
pos = 52,215
postype = left
facing = 1
ownpal = 1
ontop = 1
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State -2];MAX発動バー2P
type = Explod
triggerall = TeamSide = 2
triggerall = NumExplod(4325) = 1
triggerall = NumExplod(4350) = 0
trigger1 = Root,var(52) > 0
anim = 4351
ID = 4350
bindtime = -1
removetime = -1
pos = -52,215
postype = right
facing = 1
ownpal = 1
ontop = 1
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State -2]
type = ModifyExplod
trigger1 = 1
ID = 4350
scale = IfElse(Root,var(52) <= 0,0,(Root,var(52)/780.0)),1

[State -2]
type = RemoveExplod
trigger1 = !Root,var(52)
ID = 4350

;================================================================
;状態監視ヘルパー
[Statedef 26000]
physics = N
anim = 9999
ctrl = 0

[State 26000]
type = AssertSpecial
trigger1 = 1
flag = noautoturn

[State 26000]
type = PlaySnd
triggerall = Parent,fvar(34) = 2
trigger1 = Parent,var(7)
trigger1 = Parent,Power >= 1000
trigger1 = var(1) = [1,2]
value = S8,3
volume = 255

[State 26000]
type = VarSet
triggerall = Parent,fvar(34) = 2
trigger1 = !var(1)
trigger1 = Parent,var(7)
trigger1 = Parent,Power >= 1000
var(1) = 1

[State 26000]
type = VarAdd
triggerall = Parent,fvar(34) = 2
trigger1 = var(1)
var(1) = 1

[State 26000]
type = VarSet
triggerall = Parent,fvar(34) = 2
trigger1 = Parent,var(7)
trigger1 = Parent,Power < 1000
trigger2 = RoundState != 2
var(1) = 0

[State 26000];パワー監視
type = VarSet
trigger1 = Time%2 = 0
var(10) = Parent,Power
ignorehitpause = 1

[State 26000];パワー監視
type = VarSet
trigger1 = Time%2 = 1
var(11) = Parent,Power
ignorehitpause = 1

[State 26000]
type = ParentVarSet
trigger1 = 1
var(54) = abs(var(10) - var(11))
ignorehitpause = 1

[State 26000];ライフ監視
type = VarSet
trigger1 = Time%2 = 0
var(12) = Parent,Life
ignorehitpause = 1

[State 26000];ライフ監視
type = VarSet
trigger1 = Time%2 = 1
var(13) = Parent,Life
ignorehitpause = 1

[State 26000]
type = ParentVarSet
trigger1 = 1
var(55) = abs(var(12) - var(13))
ignorehitpause = 1

[State 26000, winsnd];KOサウンド
type = PlaySnd
trigger1 = WinKo
trigger1 = Root,NumTarget || Root,ProjContactTime(0) >= 0
value = S8,6
volume = 255
abspan = 0
persistent = 0

[State 26000, lose];死亡判定用
type = VarSet
trigger1 = Root,Life > 0
var(30) = 0

[State 26000, lose];死亡判定用
type = VarAdd
trigger1 = Root,Life = 0
var(30) = 1

[State 26000, lose];敗北時
type = PlaySnd
trigger1 = var(30) = [1,2]
value = S11,(0+(Root,fvar(29)=[1,3])*3+(Root,fvar(29)=4)*1+(Root,fvar(29)=[5,6])*2+(Root,fvar(26)=1)*1)
volume = 255
pan = floor(abs(ParentDist X))
channel = 20
lowpriority = 1

[State 26000, end]
type = DestroySelf
trigger1 = !IsHelper

;================================================================
;MAX発動監視ヘルパー
[Statedef 27000]
physics = N
anim = 9999
ctrl = 0

[State 27000]
type = ChangeState
trigger1 = !Parent,var(52)
value = 27001

[Statedef 27001]
physics = N
anim = 9999
ctrl = 0

[State 27001]
type = DestroySelf
trigger1 = Time > 1


;===============================================================
;先行入力受付ヘルパー
[Statedef 12000]
type = S
anim = 9999
ctrl = 0

[State 12000]
type = AssertSpecial
trigger1 = 1
flag = noautoturn

[State 12000, destroy]
type = DestroySelf
trigger1 = Root,var(59)


;【コマンド設定】
;============================================================
;CMDのコマンド順を推奨

;MAX2超必殺技（1～10）

[State 12000,command];MAXギガンテックプレッシャー
type = ParentVarSet
triggerall = !Root,Ctrl && !Root,var(12)
triggerall = !(abs(Root,var(22) - Root,var(23)) > 1)
trigger1 = !(Root,StateNo = 3000)
trigger1 = Root,Command = "カイザーフェニックス"
trigger1 = Root,var(58) && (Root,Life*100/Root,LifeMax) < 25
var(12) = 1

;MAX超必殺技（11～20）

[State 12000,command];MAXギガンテックプレッシャー
type = ParentVarSet
triggerall = !Root,Ctrl && !Root,var(12)
triggerall = !(abs(Root,var(22) - Root,var(23)) > 1)
trigger1 = !(Root,StateNo = 2100)
trigger1 = Root,Command = "MAXギガンテックプレッシャー"
trigger1 = Root,var(58)
var(12) = 11

[State 12000,command];MAXルガールエクスキュージョン
type = ParentVarSet
triggerall = !Root,Ctrl && !Root,var(12)
triggerall = !(abs(Root,var(22) - Root,var(23)) > 1)
trigger1 = !(Root,StateNo = 2300)
trigger1 = Root,Command = "MAXルガールエクスキュージョン"
trigger1 = Root,var(58)
var(12) = 12

[State 12000,command];MAXディストラクションオメガ
type = ParentVarSet
triggerall = !Root,Ctrl && !Root,var(12)
triggerall = !(abs(Root,var(22) - Root,var(23)) > 1)
trigger1 = !(Root,StateNo = 2600 || Root,StateNo = 2800)
trigger1 = Root,Command = "MAXディストラクションオメガ"
trigger1 = Root,var(58)
var(12) = 13

;超必殺技(21～40）

[State 12000,command];ギガンテックプレッシャーX
type = ParentVarSet
triggerall = !Root,Ctrl && !Root,var(12)
triggerall = !(abs(Root,var(22) - Root,var(23)) > 1)
trigger1 = !(Root,StateNo = 2000 || Root,StateNo = 2100)
trigger1 = Root,Command = "ギガンテックプレッシャーX"
Trigger1 = Root,var(58)
var(12) = 21

[State 12000,command];ギガンテックプレッシャーY
type = ParentVarSet
triggerall = !Root,Ctrl && !Root,var(12)
triggerall = !(abs(Root,var(22) - Root,var(23)) > 1)
trigger1 = !(Root,StateNo = 2050 || Root,StateNo = 2100)
trigger1 = Root,Command = "ギガンテックプレッシャーY"
Trigger1 = Root,var(58)
var(12) = 22

[State 12000,command];ルガールエクスキュージョンX
type = ParentVarSet
triggerall = !Root,Ctrl && !Root,var(12)
triggerall = !(abs(Root,var(22) - Root,var(23)) > 1)
trigger1 = !(Root,StateNo = 2200 || Root,StateNo = 2300)
trigger1 = Root,Command = "ルガールエクスキュージョンX"
Trigger1 = Root,var(58)
var(12) = 23

[State 12000,command];ルガールエクスキュージョンY
type = ParentVarSet
triggerall = !Root,Ctrl && !Root,var(12)
triggerall = !(abs(Root,var(22) - Root,var(23)) > 1)
trigger1 = !(Root,StateNo = 2250 || Root,StateNo = 2300)
trigger1 = Root,Command = "ルガールエクスキュージョンY"
Trigger1 = Root,var(58)
var(12) = 24

[State 12000,command];ディストラクションオメガA
type = ParentVarSet
triggerall = !Root,Ctrl && !Root,var(12)
triggerall = !(abs(Root,var(22) - Root,var(23)) > 1)
trigger1 = !(Root,StateNo = 2500 || Root,StateNo = 2600 || Root,StateNo = 2700 || Root,StateNo = 2800)
trigger1 = Root,Command = "ディストラクションオメガA"
Trigger1 = Root,var(58)
var(12) = 25

[State 12000,command];ディストラクションオメガB
type = ParentVarSet
triggerall = !Root,Ctrl && !Root,var(12)
triggerall = !(abs(Root,var(22) - Root,var(23)) > 1)
trigger1 = !(Root,StateNo = 2550 || Root,StateNo = 2600 || Root,StateNo = 2750 || Root,StateNo = 2800)
trigger1 = Root,Command = "ディストラクションオメガB"
Trigger1 = Root,var(58)
var(12) = 26

[State 12000,command];白羅滅精A
type = ParentVarSet
triggerall = !Root,Ctrl && !Root,var(12)
triggerall = !(abs(Root,var(22) - Root,var(23)) > 1)
trigger1 = !(Root,StateNo = 2400)
trigger1 = Root,Command = "白羅滅精A"
Trigger1 = Root,var(58)
var(12) = 27

[State 12000,command];白羅滅精B
type = ParentVarSet
triggerall = !Root,Ctrl && !Root,var(12)
triggerall = !(abs(Root,var(22) - Root,var(23)) > 1)
trigger1 = !(Root,StateNo = 2400)
trigger1 = Root,Command = "白羅滅精B"
Trigger1 = Root,var(58)
var(12) = 28

必殺技(41～100）

[State 12000,command]
type = ParentVarSet
triggerall = !Root,Ctrl && !Root,var(12)
triggerall = !(abs(Root,var(22) - Root,var(23)) > 1)
trigger1 = !(Root,StateNo = 1000)
trigger1 = Root,Command = "カイザーウェイブX"
var(12) = 41

[State 12000,command]
type = ParentVarSet
triggerall = !Root,Ctrl && !Root,var(12)
triggerall = !(abs(Root,var(22) - Root,var(23)) > 1)
trigger1 = !(Root,StateNo = 1000)
trigger1 = Root,Command = "カイザーウェイブY"
var(12) = 42

[State 12000,command]
type = ParentVarSet
triggerall = !Root,Ctrl && !Root,var(12)
triggerall = !(abs(Root,var(22) - Root,var(23)) > 1)
trigger1 = !(Root,StateNo = 1200 || Root,StateNo = 1800)
trigger1 = Root,Command = "ゴッドプレスX"
var(12) = 45

[State 12000,command]
type = ParentVarSet
triggerall = !Root,Ctrl && !Root,var(12)
triggerall = !(abs(Root,var(22) - Root,var(23)) > 1)
trigger1 = !(Root,StateNo = 1250 || Root,StateNo = 1850)
trigger1 = Root,Command = "ゴッドプレスY"
var(12) = 46

[State 12000,command]
type = ParentVarSet
triggerall = !Root,Ctrl && !Root,var(12)
triggerall = !(abs(Root,var(22) - Root,var(23)) > 1)
trigger1 = !(Root,StateNo = 1400)
trigger1 = Root,Command = "ビースデストラクションA"
var(12) = 49

[State 12000,command]
type = ParentVarSet
triggerall = !Root,Ctrl && !Root,var(12)
triggerall = !(abs(Root,var(22) - Root,var(23)) > 1)
trigger1 = !(Root,StateNo = 1450)
trigger1 = Root,Command = "ビースデストラクションB"
var(12) = 50

[State 12000,command]
type = ParentVarSet
triggerall = !Root,Ctrl && !Root,var(12)
triggerall = !(abs(Root,var(22) - Root,var(23)) > 1)
trigger1 = !(Root,StateNo = 1300 || Root,StateNo = 1305)
trigger1 = Root,Command = "ジェノサイドカッターA"
var(12) = 53

[State 12000,command]
type = ParentVarSet
triggerall = !Root,Ctrl && !Root,var(12)
triggerall = !(abs(Root,var(22) - Root,var(23)) > 1)
trigger1 = !(Root,StateNo = 1350 || Root,StateNo = 1355)
trigger1 = Root,Command = "ジェノサイドカッターB"
var(12) = 54

[State 12000,command]
type = ParentVarSet
triggerall = !Root,Ctrl && !Root,var(12)
triggerall = !(abs(Root,var(22) - Root,var(23)) > 1)
trigger1 = !(Root,StateNo = 1100 || Root,StateNo = 1700 || Root,StateNo = 1750)
trigger1 = Root,Command = "烈風拳X"
var(12) = 57

[State 12000,command]
type = ParentVarSet
triggerall = !Root,Ctrl && !Root,var(12)
triggerall = !(abs(Root,var(22) - Root,var(23)) > 1)
trigger1 = !(Root,StateNo = 1150 || Root,StateNo = 1720 || Root,StateNo = 1770)
trigger1 = Root,Command = "烈風拳Y"
var(12) = 58

[State 12000,command]
type = ParentVarSet
triggerall = !Root,Ctrl && !Root,var(12)
triggerall = !(abs(Root,var(22) - Root,var(23)) > 1)
trigger1 = !(Root,StateNo = 1500 || Root,StateNo = 1900 || Root,StateNo = 1950)
trigger1 = Root,Command = "ダークバリヤーA"
var(12) = 61

[State 12000,command]
type = ParentVarSet
triggerall = !Root,Ctrl && !Root,var(12)
triggerall = !(abs(Root,var(22) - Root,var(23)) > 1)
trigger1 = !(Root,StateNo = 1550 || Root,StateNo = 1900 || Root,StateNo = 1950)
trigger1 = Root,Command = "ダークバリヤーB"
var(12) = 62

;通常技（101～

[State 12000, command];ダブルトマホーク
type = ParentVarSet
triggerall = !Root,Ctrl && !Root,var(12)
triggerall = !(abs(Root,var(22) - Root,var(23)) > 1)
trigger1 = !(Root,StateNo = 260)
trigger1 = Root,Command = "holdfwd" && Root,Command = "a" && !Root,Command = "holddown"
var(12) = 101

;============================================================

[State 12000]
type = ParentVarSet
triggerall = Root,var(12)
trigger1 = Root,var(12) = 101 && Root,StateNo = 260
var(12) = 0

[State 12000]
type = varset
trigger1 = !var(1)
trigger1 = Root,var(12)
trigger1 = var(1) != Root,var(12)
var(1) = Root,var(12)

[State 12000,timer]
type = VarAdd
trigger1 = var(1)
var(2) = 1

[State 12000,timer]
type = VarAdd
triggerall = var(2) > 2
triggerall = !(Root,Command = "holdx")
trigger1 = Root,var(12) = 1
trigger2 = Root,var(12) = 11
trigger3 = Root,var(12) = 12
trigger4 = Root,var(12) = 21
trigger5 = Root,var(12) = 23
trigger6 = Root,var(12) = 41
trigger7 = Root,var(12) = 45
trigger8 = Root,var(12) = 57
var(2) = 15

[State 12000,timer]
type = VarAdd
triggerall = var(2) > 2
triggerall = !(Root,Command = "holdy")
trigger1 = Root,var(12) = 1
trigger2 = Root,var(12) = 11
trigger3 = Root,var(12) = 12
trigger4 = Root,var(12) = 22
trigger5 = Root,var(12) = 24
trigger6 = Root,var(12) = 42
trigger7 = Root,var(12) = 46
trigger8 = Root,var(12) = 58
var(2) = 15

[State 12000,timer]
type = VarAdd
triggerall = var(2) > 2
triggerall = !(Root,Command = "holda")
trigger1 = Root,var(12) = 13
trigger2 = Root,var(12) = 25
trigger3 = Root,var(12) = 27
trigger4 = Root,var(12) = 49
trigger5 = Root,var(12) = 53
trigger6 = Root,var(12) = 61
trigger7 = Root,var(12) = 101
var(2) = 15

[State 12000,timer]
type = VarAdd
triggerall = var(2) > 2
triggerall = !(Root,Command = "holdb")
trigger1 = Root,var(12) = 13
trigger2 = Root,var(12) = 26
trigger3 = Root,var(12) = 28
trigger4 = Root,var(12) = 50
trigger5 = Root,var(12) = 54
trigger6 = Root,var(12) = 62
var(2) = 15

[State 12000,timerreset]
type = varset
trigger1 = !(var(12) > 100)
trigger1 = var(2) > 15
trigger2 = var(12) > 100
trigger2 = var(2) > 10
var(1) = 0

[State 12000]
type = ParentVarSet
trigger1 = !(var(12) > 100)
trigger1 = var(2) > 15
trigger2 = var(12) > 100
trigger2 = var(2) > 10
var(12) = 0

[State 12000,timerreset]
type = varset
trigger1 = !(var(12) > 100)
trigger1 = var(2) > 15
trigger2 = var(12) > 100
trigger2 = var(2) > 10
var(2) = 0

;=================================================================
