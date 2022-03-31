[Statedef -2]

;---------------------------------------------------------------------------------
;跳跃控制
;---------------------------------------------------------------------------------
[State -3]
type = varadd
Trigger1 = var(45) > 0
var(45) = -1

[State -3]
type = varadd
Trigger1 = helper(33000),var(13) = 39 && EnemyNear,MoveHit 
Trigger2 = EnemyNear,StateType != A && StateNo = [154,155]
var(45) = 60 

[State -3]
type = varadd
Trigger1 = helper(33000),var(13) = 50 && EnemyNear,MoveHit 
Trigger2 = MoveType = H
Trigger2 = var(50)/100 = [600,699]
Trigger2 = EnemyNear,MoveHit
Trigger2 = StateNo != [150,159]
Trigger
var(45) = 300 + EnemyNear,GetHitVar(damage)













[State -2,当身相关,前AB]
type = ChangeState
value = 750
triggerall = var(59)
triggerall =!Ishelper
triggerall = roundstate = 2
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = (stateno = [200,999]) && movereversed = 1

[State -2, 无敌]
type = NotHitBy
trigger1 = HitPauseTime
trigger1 = !(MoveReversed)
value = SCA
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
; ------- Jump stuff --------
;===============================================================================
[State 50, reset]
type = VarSet
trigger1 = stateno != [40,50]
var(2) = 0

;================================================================================
; ------- Enemy Taunt --------
;===============================================================================
[State -2, Taunt]
type = PowerAdd
triggerall = numenemy
trigger1 = (p2stateno = 195) && (enemy, statetime < 20)
trigger1 = var(1) != 1
value = 11

;================================================================================
; ------- Throw Limitation by OrochiKOF97 --------
;===============================================================================
[State -2, Guard Var]
type = VarSet
trigger1 = stateno = [200,505] ; Non-Air basic moves states.
trigger1 = moveguarded > 0 ; This is the key : checks if opponent has guarded a basic attack
trigger2 = stateno = [600,710] ; Air Basic Moves
trigger2 = movecontact > 0 ; This includes both moveguarded & movehit as well
v = 19
value = 30
persistent = 0
ignorehitpause = 1

[State -2, Guard Var 2]
type = VarAdd
triggerall =!var(6)
trigger1 = var(19) > 0
var(19) = -1
ignorehitpause = 1

[State -2, Guard Var 3]
type = VarSet
triggerall = !var(6)
trigger1 = var(19) < 0
var(19) = 0
persistent = 0
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
trigger1 = stateno != 101
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
; ------- Tick Fix --------
;===============================================================================

[State -2, CtrlSet]
type = CtrlSet
;Gethits
trigger1 = (stateno=52 || stateno=102 || stateno=107 || stateno=5120) && !animtime
trigger2 = (stateno=5001 || stateno=5011 || stateno=151 || stateno=153) && hitover
value = 1


[State -2, CtrlSet]
type = CtrlSet
triggerall = !animtime
;Basic moves
trigger1 = (stateno = [200,599])
;System moves
trigger2 = (stateno = [750,760])
;Command moves
trigger3 =  stateno = 800
trigger4 =  stateno = 801
;Special moves
trigger5 =  anim = 1000 && !animtime
value = 1

;================================================================================
; ------- KOF Cornerpush System by Vans --------
;===============================================================================
[State -2, Superpause Check]
type = VarAdd
trigger1 = Var(6)
var(6) = -1

[State -2, Reset Time counter]
type = VarSet
trigger1 = movecontact = 1
var(12) = 0

[State -2, Accel]
type = VarSet
triggerall = roundstate = 2
triggerall = Var(6) <= 0
triggerall = numtarget >= 1
trigger1 = target, hitshakeover
fvar(6) = (target, gethitvar(xvel)*exp((-0.1886)*((var(12)))))

[State -2, Push]
type = PosAdd
triggerall = StateNo != 1010
triggerall = roundstate = 2
triggerall = !var(6)
triggerall = numtarget >= 1
triggerall = (target, BackEdgeBodyDist <= 0) || (target, FrontEdgeBodyDist <= 0)
triggerall = ProjContact = 0, < 50
triggerall = stateno != [900,949]
triggerall = stateno != [956,979]
triggerall = numenemy
triggerall = enemynear,statetype != A
trigger1 = Statetype != A
x = ifelse(facing = -1,fvar(6),-fvar(6))

[State -2, Increase]
type = VarSet
triggerall = numtarget >= 1
triggerall = target, hitshakeover
trigger1 = Var(6) <= 0
trigger1 = var(12)
var(12) = var(12)+1

[State -2, Time counter]
type = VarSet
trigger1 = !var(12)
trigger1 = fvar(6)
var(12) = 1

[State -2, Freeze Pos During Superpause]
type = PosFreeze
trigger1 = Var(6)
value = 1

[State -2, Drop]
type = VarSet
triggerall = fvar(6)
trigger1 = !numtarget
trigger2 = projcontact = 1
trigger3 = movecontact = 1
fvar(6) = 0
ignorehitpause = 1

[State -2, Drop]
type = VarSet
triggerall = fvar(8)
trigger1 = !numtarget
trigger2 = projcontact = 1
trigger3 = numtarget >= 1 && target, gethitvar(xvel) = 0
var(17) = 0

[State -2, TargetDrop]
type = TargetDrop
trigger1 = numhelper(1050)
trigger1 = helper(1050), numtarget
trigger2 = numhelper(1021)
trigger2 = helper(1021), numtarget


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
[State -2, 3]
type = ChangeState
trigger1 = !Alive
trigger1 = PrevStateNo = 130 || PrevStateNo = 131 || PrevStateNo = [150,153]
trigger1 = Stateno = [5000,5050]
value = 5950

[State -2,KO]
type = Varset
triggerall = StateNo = [120,159]
trigger1 = StateType = S
ignorehitpause = 1
fvar(1) = 0

[State -2,KO]
type = Varset
triggerall = StateNo = [120,159]
trigger1 = StateType = C
ignorehitpause = 1
fvar(1) = 1

[State -2,KO]
type = Varset
triggerall = StateNo = [120,159]
trigger1 = StateType = A
ignorehitpause = 1
fvar(1) = 2

;----------------------------------------------------------------------------------
; KO Voice
[State -2,AI]
type = VarSet
trigger1 = 1
ignorehitpause = 1
fvar(2) = 0

[State -2,AI]
type = VarSet
trigger1 = Anim = 5950 || StateNo = 5950
ignorehitpause = 1
fvar(2) = 1

[State -2,AI]
type = VarSet
trigger1 = movetype != H
trigger1 = roundstate = 2
ignorehitpause = 1
fvar(35) = 0

[State -2,AI]
type = VarSet
trigger1 = StateNo = 5000 || StateNo = 5020 || StateNo = 5070 || StateNo = 5080
trigger1 = roundstate = 2
trigger1 = Time = 0
ignorehitpause = 1
fvar(35) = GetHitVar(hitshaketime)

[State -2, KO]
type = PlaySnd
triggerall = roundstate = 3
trigger1 = !FVar(2) && !FVar(0)
trigger1 = FVar(36) = ifElse(!FVar(35),1,ifelse(FVar(35)>20,20,FVar(35)))
ignorehitpause = 1
value = S111, 0

[State -2, KO]
type = PlaySnd
triggerall = roundstate = 3
triggerall = FVar(2)
trigger1 = Anim = 5950 && AnimElemTime(1) = 2
ignorehitpause = 1
value = S5950, 0

[State -2,KO]
type = Varadd
trigger1 = !Alive
ignorehitpause = 1
fvar(36) = 1

[State -2,KO]
type = Varset
trigger1 = Alive
ignorehitpause = 1
fvar(36) = 0

[State -2, 1]
type = VarSet
triggerall = numenemy
trigger1 = (enemynear,authorname="warusaki3"&&enemynear,name="cvsgouki"&&enemynear,var(13))
trigger2 = (enemynear,authorname="SUMI"&&enemynear,name="Destrudo Ryu"&&enemynear,var(16)=1)
trigger3 = (enemynear,authorname="warusaki3"&&enemynear,name="cvsrugal"&&enemynear,var(13))
trigger4 = (enemynear,authorname="warusaki3"&&enemynear,name="cvsryu"&&enemynear,var(13))
trigger5 = (enemynear,authorname="warusaki3"&&enemynear,name="cvsg_rugal"&&enemynear,var(13))
trigger6 = (enemynear,authorname="warusaki3"&&enemynear,name="cvsgeese"&&enemynear,var(13))
trigger7 = (enemynear,authorname="warusaki3"&&enemynear,name="cvssakura"&&enemynear,var(13))
fvar(0) = 1

[State -2, 1]
type = VarSet
triggerall = numenemy
trigger1 = (enemynear,authorname="warusaki3"&&enemynear,name="cvsgouki"&&enemynear,var(13)=0)
trigger2 = (enemynear,authorname="SUMI"&&enemynear,name="Destrudo Ryu"&&enemynear,var(16)=0)
trigger3 = (enemynear,authorname="warusaki3"&&enemynear,name="cvsrugal"&&enemynear,var(13)=0)
trigger4 = (enemynear,authorname="warusaki3"&&enemynear,name="cvsryu"&&enemynear,var(13)=0)
trigger5 = (enemynear,authorname="warusaki3"&&enemynear,name="cvsg_rugal"&&enemynear,var(13)=0)
trigger6 = (enemynear,authorname="warusaki3"&&enemynear,name="cvsgeese"&&enemynear,var(13)=0)
trigger7 = (enemynear,authorname="warusaki3"&&enemynear,name="cvssakura"&&enemynear,var(13)=0)
fvar(0) = 0


;===========================================================================
; Power Bar
;===========================================================================
[state -2,]
type = Null;Helper
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
[State -2, Debug]
type = displaytoclipboard
Trigger1 = 1
text = "P2StateNo = %d p2HitTime = %d X = %d, Y = %d  hittime = %d"
params = P2StateNo, EnemyNear,GetHitVar(hittime), P2BodyDist x,  P2BodyDist y, GetHitVar(hittime)
ignorehitpause = 1

[State -2, Debug]
type = appendtoclipboard
Trigger1 = 1
text="\nTRACE %d, p2pos x = %d prevHit = %d vel var(47) = %d EnemyNear,animtime = %d"  
params= var(50), EnemyNear,Pos x, var(47), Helper(1001),NumTarget(1000), EnemyNear,animtime
ignorehitpause = 1 