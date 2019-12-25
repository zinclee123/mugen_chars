[Statedef -2]

;---------------------------------------------------------------------------------
;AI跳跃限制用
;---------------------------------------------------------------------------------
[State -2]
type = varset
Trigger1 = RoundState != 2
var(44) = 300


[State -2]
type = varadd
Trigger1 = var(44) > 0
var(44) = -1

;限制跳跃
[State -2]
type = varadd
Triggerall = !ishelper
Triggerall = name = "Kusanagi XIII"
Triggerall = EnemyNear,StateType != A
TriggerAll = EnemyNear,MoveHit = 1 && Time = 1
TriggerAll = MoveType = H
;空中攻击被打
Trigger1 = var(50)/100 = [600,699]
;起跳被打
Trigger2 = var(50)/100 = 39
;被抓落地
Trigger3 = prevStateNo = 52
Trigger4 = var(50)/100 = 330
Trigger5 = var(50)/100 = 120 && StateType = A
Trigger6 = var(50)/10000 = 39
var(44) = 120 + EnemyNear,GetHitVar(damage)


;-----------------------------------------------------------
;打逆不可防用
[State -2, 打逆不可防用]
type = AssertSpecial
triggerall = StateNo = [200,4999]
triggerall = MoveType = A
trigger1 = Enemynear,P2Dist x < 0
flag = unguardable
IgnoreHitPause = 1

;-----------------------------------------------------------
;XIII 连击修正用
[State -2]
type = varset
triggerall = !isHelper
trigger1 = EnemyNear,Ctrl 
trigger2 = EnemyNear,MoveType = I
trigger3 = EnemyNear,MoveType = A
trigger4 = roundState != 2
fvar(39) = 1.0
IgnoreHitPause = 1

[State -2]
type = varadd
triggerall = !isHelper
triggerall = StateNo < 2000
trigger1 = MoveHit = 1 || ProjHit = 1,1
fvar(39) = -0.05

[State -2]
type = varadd
triggerall = !isHelper
trigger1 = fvar(39) < 0.2
fvar(39) = 0.2

[State -2]
type = AttackMulSet
triggerall = MoveType = A
trigger1 = StateNo = [200, 2000)
value = fvar(39)
ignorehitpause = 1

[State -2,超杀多修正到50%]
type = AttackMulSet
triggerall = MoveType = A
triggerall = StateNo >= 2000
trigger1 = !(StateNo = [2700,2799])
value = ifelse(fvar(39)<0.4, 0.4, fvar(39))
ignorehitpause = 1

[State -2,NEO MAX最多修正到50%]
type = AttackMulSet
triggerall = MoveType = A
trigger1 = StateNo = [2700,2799]
value = ifelse(fvar(39)<0.5, 0.5, fvar(39))
ignorehitpause = 1


;-----------------------------------------------------------
;开HD锁气
[State -2]
type = powerset
triggerall = !isHelper
triggerall = Name = "Kusanagi XIII"
trigger1 = var(20) > 0
trigger1 = var(24) > 0
value = var(24)
ignorehitpause = 1

;-----------------------------------------------------------
;破防计算用
[State -2, 防止小于0]
type = VarSet
TriggerAll = fvar(10) < 0
Trigger1 = 1
fvar(10) = 0
ignorehitpause = 1

[State -2, 自减]
type = VarAdd
TriggerAll = fvar(10) >= 1
Trigger1 = GameTime%37 = 0
fvar(10) = -100
ignorehitpause = 1

[State -2,破防重置]
type = VarSet
TriggerAll = fvar(10) != 0
Trigger1 = roundstate != 2
Trigger2 = enemy,StateNo = 5700
fvar(10) = 0
ignorehitpause = 1

[State -2]
type = VarAdd
TriggerAll = RoundState = 2
TriggerAll = EnemyNear,MoveType = H
TriggerAll = EnemyNear,time = 0
Trigger1 = !(ProjGuarded = 1)
Trigger1 = moveguarded = 1
fvar(10) = ifelse((StateNo = [200,999]),500,1200)
ignorehitpause = 1
persistent = 0

[State -2]
type = VarAdd
TriggerAll = RoundState = 2
TriggerAll = EnemyNear,MoveType = H
TriggerAll = EnemyNear,time = 0
Trigger1 = ProjGuarded = 1
fvar(10) = ifelse((StateNo = [200,999]),500,1200)
ignorehitpause = 1
persistent = 0

[State -2, TargetState]
type = TargetState
triggerall = numtarget
triggerall = target,alive
triggerall = fvar(10) >= 12000
triggerall = target,statetype = S || target,statetype = C
triggerall = target,movetype = H && target,stateno = [120,159]
trigger1 = moveguarded = 1
Trigger2 = ProjGuarded = 1
value = 5700

[state a];破防效果展示
type = Helper
triggerall = !NumHelper(12000)
trigger1 = numtarget
trigger1 = target,statetype = S || target,statetype = C
trigger1 = target,movetype = H && target,stateno = 5700
trigger1 = target,anim = 5700 && target,time = 1
id = 12000
name = "g"
sprpriority = 1
pos = 0,0
postype = p1
stateno = 12000
Helpertype = normal
keyctrl = 1 
ownpal = 1
ignorehitpause = 1




[State -2]
type = VarSet
trigger1 = 1
fv = 13
value = 1.5 
ignorehitpause = 1

[State Helper]
Type               = Helper 
Trigger1           = random < 30
Trigger1           = p2stateno = 177200
Name               = "Skill_Fire" 
ID                 = 7000 + ID
Pos                = 0,0
PosType            = P2 
StateNo            = 7000
OwnPal             = 1 
IgNoreHitPause     = 1 

[State -2,]
type = Explod
triggerall = NumExplod(5223) = 0
triggerall = EnemyNear,StateType != A
trigger1 = p2stateno = 177200
anim = 13049
pos = 0,0
id = 5223
postype = p2
sprpriority = 1
bindtime = -1
scale = 0.7,0.7
ownpal = 1
supermove = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = fvar(20) >= 900
triggerall = statetype !=a
value = 5255
ctrl = 0

[state MAX]
type = varset
trigger1 = var(21) = 1
v = 20
value = 2

[state MAX]
type = varset
trigger1 = fvar(20) >= 900
fv = 20
value = 0

[state MAX]
type = varadd
trigger1 = fvar(20) > 0
triggerall = fvar(20) != 0
fv = 20
value = -.7

[state MAX]
type = varadd
trigger1 = STATETYPE != C
trigger1 = STATETYPE != S
trigger1 = MOVETYPE = H
trigger1 = fvar(20) > 0
triggerall = fvar(20) != 0
fv = 20
value = -.4

[State MAX]
type = palfx
;triggerall = !var(21)
trigger1 = var(20) > 2
trigger1 = gametime % 2 = 0
trigger1 = GetHitVar(hittime) < 2
time = 1
add = 126,126,0
color = 1
ignorehitpause = 1

[State MAX]
type = Null;palfx
triggerall = var(21)
trigger1 = gametime % 2 = 0
trigger1 = alive
time = 1
add = 126,0,0
color = 1
ignorehitpause = 1

[State 0, LifeAdd]
type = LifeAdd
triggerall = var(21)
trigger1 = gametime % 3 = 0
value = -2
kill = 0

[State 0, powerAdd]
type = powerAdd
triggerall = var(21)
trigger1 = 1
value = 2

[State 0]
type = VarSet
triggerall = var(21)
trigger1 = 1
fv = 13
value = fvar(13) * 1.5
ignorehitpause = 1

[State -2,explods]
type = Explod
triggerall = var(21)
trigger1 = Random < 70
trigger1 = alive
anim = 13017
pos = 0,-50
postype = p1
sprpriority = 99999999
scale = 0.4,0.4
trans = add
bindtime = 1
random = 50,100
ownpal = 1
supermove = 1
ignorehitpause = 1

[State -2,explods]
type = Explod
triggerall = var(21)
trigger1 = Random < 70
trigger1 = alive
anim = 13018
pos = 0,-50
postype = p1
sprpriority = 99999999
scale = 0.2,0.2
trans = add
vel = -1,-.5
bindtime = 1
random = 50,100
ownpal = 1
supermove = 1
ignorehitpause = 1

[state MAX]
type = Null;Helper
trigger1 = numhelper(7552) = 0
id = 7552
name = "ground"
sprpriority = 1
pos = 0,0
postype = p1
stateno = 7552
helpertype = normal
pausemovetime = 99999999
supermovetime = 99999999
keyctrl = 0 
ownpal = 0

[state MAX]
type = Helper
trigger1 = numhelper(7550) = 0
id = 7550
name = "MAX"
sprpriority = 1
pos = 0,0
postype = p1
stateno = 7550
helpertype = normal
pausemovetime = 99999999
supermovetime = 99999999
keyctrl = 0 
ownpal = 0

[state MAX]
type = varadd
trigger1 = var(20) > 0
v = 20
value = -1

[state MAX]
type = varset
trigger1 = var(20) < 0
v = 20
value = 0

[State -2]
type = Helper
TriggerAll =enemynear,pos y > 0 && enemynear,vel y > 0
trigger1 = enemynear,stateno = 1472
trigger2 = enemynear,stateno = 116050
trigger3 = enemynear,stateno = 177201
helpertype = normal
name = "fire_earth"
ID = 30000
stateno = 30000
pos = 0, 0
postype = p2
ownpal = 1

[State -2]
type = Helper
TriggerAll = IsHelper(30001) = 0
TriggerAll = enemynear,vel y > 0 && enemynear,pos y > 0
trigger1 = enemynear,stateno = 2320
trigger2 = enemynear,stateno = 1551
helpertype = normal
name = "fire_earth"
ID = 30001
stateno = 30001
pos = 0, 0
postype = p2
ownpal = 1

[state 2]
type = removeexplod
trigger1 = stateno != 2500
id = 25000

[state 2]
type = varset
trigger1 = Enemynear,ctrl = 1
var(17) = 0

[State 1000, VarSet]
type = VarSet
triggerall = roundstate != 2
trigger1 = p2name = "Sinobu Amou"
trigger1 = stateno = [190,199]
v = 51
value = 1


;-------------------------------------------------------------------------------
;Extra Carteles KOF MEMORIAL LEVEL 2
;-------------------------------------------------------------------------------


[State 1000, RemoveExplod]
type = RemoveExplod
triggerall = numhelper(10000) = 1
trigger1 = 1
id = 7010
;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
;Inpedir Recover en el piso
[State -2, VarSet]
type = VarSet
trigger1 = movetype = H
trigger1 = stateno = [5100,5111]
v = 48
value = 1

[State -2, VarSet]
type = VarSet
trigger1 = stateno = 5120
trigger1 = movetype = I
v = 48
value = 0

[State -2, VarSet]
type = VarSet
trigger1 = movetype = H
v = 16
value = 0
;-------------------------------------------------------------------------------
[State -2, VarSet]
type = VarSet
trigger1 = stateno = [200,699]
trigger1 = enemy,movetype = H && enemy,statetype = A
trigger1 = var(19) = 0 && numexplod(4150) <= 0
v = 15
value = 1
ignorehitpause = 1

[State -2, VarSet]
type = VarSet
trigger1 = enemy,movetype != H
trigger2 = stateno = [1200,1250]
v = 15
value = 0
;-------------------------------------------------------------------------------

;No Pasar Atras del Oponente (KOF Style)
[State -2, Width]
type = Width
trigger1 = Movetype != H
edge = 20-(Statetype = A)*3,0
ignorehitpause =1
;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
[State -2, AssertSpecial]
type = AssertSpecial
triggerall = roundno = 1
trigger1 = stateno = [190,199]
trigger1 = stateno != 195
flag = nomusic

[State -2, AssertSpecial]
type = AssertSpecial
trigger1 = gametime%2 = 0
flag = noshadow
ignorehitpause = 1
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
;Counter Hits
[State -2, Counter Hit1]
type = VarSet
triggerall = prevstateno != [120,152]
trigger1 = enemy, movetype = A
ignorehitpause = 1
var(19) = 1

[State -2, Counter Hit2]
type = VarSet
trigger1 = enemy, movetype = I || var(22) >= 1
ignorehitpause = 1
var(19) = 0

[State -2, Counter Hit3]
type = VarSet
trigger1 = var(22) > 10 && enemy, movetype = H
ignorehitpause = 1
var(19) = 0

[State -2, Counter Hit4]
type = VarSet
trigger1 = var(19) = 1 && movehit
ignorehitpause = 1
var(22) = 1

[State -2, Counter Hit5]
type = Varadd
trigger1 = var(22) >= 1
ignorehitpause = 1
var(22) = 1

[State -2, Counter Hit6]
type = VarSet
trigger1 = p2movetype != H
trigger2 = var(22) > 22
trigger3 = p2statetype = L
trigger4 = var(22) > 30 && movehit
ignorehitpause = 1
var(22) = 0

[State -2, Counter Hit7]
type = Assertspecial
trigger1 = var(19) = 1 && numexplod(4150) <= 1
flag = Nojugglecheck

[State -2, EnvColor]
type = EnvColor
trigger1 = var(22) = [1,2]
value = 255,255,255
time = 1
ignorehitpause = 1
under = 1

;-------------------------------------------------------------------------------
[State -2, NotHitBy]
type = NotHitBy
triggerall = Roundstate != 2
trigger1 = stateno = [5050,5999]
value = SCA
ignorehitpause = 1
;-------------------------------------------------------------------------------
;KO Flash Effect
[State -2, Helper]
type = Helper
triggerall = numhelper(9910) <= 0
trigger1 = winKo = 1 && movehit && stateno = [899,4999]
trigger2 = winKo = 1 && Projhittime(1000) >= 0 && Projhittime(1000) <= 1
trigger3 = winKo = 1 && Projhittime(2200) >= 0 && Projhittime(2200) <= 1
trigger4 = winKo = 1 && Projhittime(3000) >= 0 && Projhittime(3000) <= 1
trigger5 = winKo = 1 && Projhittime(3100) >= 0 && Projhittime(3100) <= 1
trigger6 = winKo = 1 && stateno = 3000 && p2stateno = [5000,5050]
trigger7 = winKo = 1 && stateno = 2305 && p2stateno = [5000,5050]
trigger8 = winKo = 1 && stateno = 3110 && p2stateno = [5000,5050]
helpertype = normal
name = "KO Flash"
Id = 9910
stateno = 9910
pos = 0,0
postype = p1
facing = 1
ignorehitpause = 1
supermove = 1
pausemove = 1
pausemovetime = 99999
supermovetime = 99999
ownpal = 1

[state -2, PlaySound]
type = playsnd
trigger1 = WinKO
trigger1 = RoundState = 3
trigger1 = var(12) = 0
IgnoreHitPause = 1
persistent = 0
value = f5200,0
volumescale = 255

[state -2, varset]
type = varset
trigger1 = RoundState = 3
IgnoreHitPause = 1
v = 12
value = 1

[state -2, varset]
type = varset
trigger1 = RoundState = 2
IgnoreHitPause = 1
v = 12
value = 0

;Pausa de ataques
[State -3, Slow Down]
type = Pause
triggerall = RoundState = 2
trigger1 = ProjHitTime(1000) = [12,20]
time = 1
movetime = 0
ignorehitpause = 1

[State -2, EnvColor]
type = EnvColor
trigger1 = Projhittime(3100) >= 0 && Projhittime(3100) <= 1
value = 255,255,255
time = 1
under = 1

;-------------------------------------------------------------------------------

[State 1000, VarSet]
type = VarSet
trigger1 = p2movetype != H
v = 23
value = 0
persistent = 0

;-------------------------------------------------------------------------------
;Intro and K.O. no Lifebars
[State -2]
type = assertspecial
trigger1 = roundstate != 2
;trigger2 = Ctrl = 0 && (Anim = [0,2]) && MoveType != H
flag = NoBarDisplay
ignorehitpause = 1
;----------------------------------------------------------------------------

[State -2, No sound in Guanding KO]
type = AssertSpecial
triggerall = prevstateno = [120,152]
trigger1 = stateno = 5000 || stateno = 5010 || stateno = 5070
trigger1 = statetype != A
flag = Nokosnd
ignorehitpause = 1

[State -2, Guarding KO]
type = ChangeState
trigger1 = prevstateno = [120,152]
trigger1 = !alive
value = 6010
ignorehitpause = 1
;----------------------------------------------------------------------------
[State 100, StopSnd]
type = StopSnd
trigger1 = stateno != 910 && stateno != 911
channel = 11

[State 100, StopSnd]
type = StopSnd
trigger1 = stateno != 910 && stateno != 911
channel = 12

[State 100, StopSnd]
type = StopSnd
trigger1 = stateno != 2100 && stateno != 2150
channel = 10

[State 100, StopSnd]
type = StopSnd
trigger1 = movetype = H
channel = 4
ignorehitpause = 1
;-----------------------------------------------------------------------------

[State -2, 二人目のイントロ]
type = ChangeState
value = 190
triggerall = TeamMode = Turns
trigger1 = stateno = 5900

[State -2, ライフ確認]
type = VarSet
triggerall = RoundState = [0,1]
trigger1 = RoundNo = 1
trigger2 = TeamMode = Turns
trigger2 = RoundsExisted = 0
v = 22
value = Life

[State -2, ライフ取得?ス対策]
type = VarSet
triggerall = Var(22) = [0,100]
triggerall = Time = 1
trigger1 = RoundNo = 1
trigger2 = RoundsExisted = 0
v = 22
value = const(data.life)
;----------------------------------------------------------------------------
;-------------------------------------------------------------------------------
[State -2, 4]
type = VarRandom
triggerall = Time = 1
trigger1 = stateno = 5000
trigger2 = stateno = 5010
trigger3 = stateno = 5020
v = 4
range = 0,40

[State -2, 5]
type = PlaySnd
triggerall = Time = 1
triggerall = Var(4) = [0,3]
triggerall = alive = 1
trigger1 = stateno = 5000
trigger2 = stateno = 5010
trigger3 = stateno = 5020
value = s5000,0
channel = 0

[State -2, 6]
type = PlaySnd
triggerall = Time = 1
triggerall = Var(4) = [4,7]
triggerall = alive = 1
trigger1 = stateno = 5000
trigger2 = stateno = 5010
trigger3 = stateno = 5020
value = s5000,1
channel = 0

[State -2, 6]
type = PlaySnd
triggerall = Time = 1
triggerall = Var(4) = [8,11]
triggerall = alive = 1
trigger1 = stateno = 5000
trigger2 = stateno = 5010
trigger3 = stateno = 5020
value = s5000,2
channel = 0

[State -2, 6]
type = PlaySnd
triggerall = Time = 1
triggerall = Var(4) = [12,40]
triggerall = alive = 1
trigger1 = stateno = 5000
trigger2 = stateno = 5010
trigger3 = stateno = 5020
value = s5000,3
channel = 0

[State -2]
type = PlaySnd
Triggerall = Alive = 1
triggerall = Time = 1
trigger1 = (stateno = 5100) && (anim = 5100 || anim = 5101 || anim = 5102)
value = S5000,3

;-------------------------------------------------------------------------------
[State 1000, ]
type = Varset
trigger1 = Enemy,Stateno = 5100
var(10) = 0

[State -2, AfterImage]
type = AfterImage
trigger1 = movetype = H
time = 0

[State -2,]
type = StopSnd
trigger1 = Anim != 100
trigger2 = Movetype = H
channel = 6




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

[State -2, Debug]
type = displaytoclipboard
Trigger1 = 1
text = "P2StateNo = %d p2HitTime = %d hittime = %d X = %d, Y = %d facing = %d"
params = P2StateNo, EnemyNear,GetHitVar(hittime), GetHitVar(hittime), P2BodyDist x,  P2BodyDist y, facing
ignorehitpause = 1

[State -2, Debug]
type = appendtoclipboard
Trigger1 = 1
text="\nTRACE = %d preHit = %d fvar(37) = %f p2AnimTime = %d"  
params= var(50), helper(33000),var(14) , fvar(37), EnemyNear,AnimTime
ignorehitpause = 1 
