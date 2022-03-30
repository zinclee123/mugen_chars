; I'm a litter monitor tell my master what's going on right now :)

;======= var info =========
;var(2) is the masters player ID
;var(3) is the moniting enemy ID
;var(4) is Enemy attack state	0 is not attack	1 is pose to attack 2 is attacking 3 is ending
;var(15) Parent Last Move State
;var(16) Do NOT repeat var
;var(31) System Player ID Base low limit
;var(32) System Player ID Upper limit
;var(33) attacking helper link -> with root var(45)
;var(45) The Attacking helper
;var(39)Enemy fast attack
;var(42)Enemy Evade StateNo
;var(43)Enemy last Power point
;var(44)Enemy Charging stateNo work with root var(47)
;var(45~47) Enemy Fireball stateno
;var(59) debug var

;======= tell parrent =======
; var(4) 	Reported by Monitor Enemy attack States.
; var(45)	Tell parent the player id of a helper which is a projectile.-> link with var(33)
; var(46) - 	Specal Info pushed to master


;=============== MONITOR HELPER ===========
[StateDef 32767]
type = A
physics = N
moveType = I
anim = 9741
ctrl = 0

[State Parent Check 1]
type = varset
trigger1 = var(2) = 0
trigger1 = PlayerIDExist(Const(size.proj.doscale))
var(2) = Const(size.proj.doscale)
ignoreHitPause = 1

[State Parent Check 2]
type = varset
trigger1 = var(2)
trigger1 = PlayerIDExist(Const(size.proj.doscale)) = 0
var(2) = 0
ignoreHitPause = 1

;======== Bind ==========
[State 32767, Bind to Enemynear]
type = posset
trigger1 = 1
x = Parent,Pos x + Abs(Parent,P2Dist x) * IfElse((Parent,pos x > Enemynear,pos x),-1,1)
y = 20
ignorehitpause = 1

[State 32767, Facing]
type = Turn
trigger1 = facing != Enemynear,facing
ignorehitpause = 1

[State 32767, Record current EnemyID]
type = varset
trigger1 = Enemynear,ID != var(3)
var(3) = Enemynear,ID
ignorehitpause = 1

;-------- Previous State -----------
[State 32767, Remember last StateNO]
type = varset
trigger1 = var(15) != Parent,PrevStateNo
trigger1 = Parent,PrevStateNo >= 160
var(15) = Parent,PrevStateNo
ignoreHitPause = 1

;-------- No Repeat ----------------
[State 32767, No Repeat set]
type = varset
trigger1 = Parent,fvar(16)
var(16) = Ceil(Parent,fvar(16))
ignoreHitPause = 1

[State 32767, Clear Parent var]
type = Parentvarset
trigger1 = Parent,fvar(16)
fvar(16) = 0
ignoreHitPause = 1

[State 32767, Run the timer]
type = varadd
trigger1 = var(16) > 0
var(16) = -1
ignoreHitPause = 1




;======== Censor ========
;Sense Attack --------------------

[State 32767, Enemy start attack]
type = varset
triggerall = var(4) = 0
trigger1 = P2MoveType = A && Enemynear,time <= 2
var(4) = 1
ignorehitpause = 1

[State 32767, Enemy attacking]
type = varset
triggerall = var(4) != 2
trigger1 = Enemynear, HitDefattr = SCA,AA,AP,AT
trigger2 = Enemynear, MoveType = A && (P2StateNo = [3000,4999]) && Enemynear,time < 2
var(4) = 2
ignorehitpause = 1

[State 32767, Enemy attacking ending]
type = varset
triggerall = var(4) = 2
trigger1 = !(Enemynear,Ctrl) && !(Enemynear, HitDefattr = SCA,AA,AP,AT)
trigger1 = IfElse(P2StateNo<3000,1,Enemynear,time>60)
trigger2 = abs(Enemynear,Animtime) < 10
var(4) = 3
ignorehitpause = 1

[State 32767, Enemy not attacking at all]
type = varset
triggerall = var(4)
trigger1 = Enemynear,ctrl
trigger2 = Enemynear,StateNo < 200
var(4) = 0
ignorehitpause = 1

[State 32767, tell parent the result]
type = parentvarset
trigger1 = parent,var(4) != var(4)
var(4) = var(4)
ignorehitpause = 1

;Detect Hadouken -----------------------------
[State 32767, Enemy Hadoken 3]
type = varset
triggerall = var(45) && var(46)
triggerall = P2StateType != A && Enemynear,pos y >= 0
triggerall = (P2StateNo = [1000,4999])
triggerall = P2StateNo != var(45)
triggerall = P2StateNo != var(46)
triggerall = Enemynear, AnimelemTime(1)>= 35
trigger1 = Enemynear,NumProj
trigger2 = var(33)
var(47) = Enemynear, StateNo
ignorehitpause = 1

[State 32767, Enemy Hadoken 2]
type = varset
triggerall = var(45) && !var(46) && !var(47)
triggerall = P2StateType != A && Enemynear,pos y >= 0
triggerall = (P2StateNo = [1000,4999])
triggerall = P2StateNo != var(45)
triggerall = Enemynear, AnimelemTime(1)>= 35
trigger1 = Enemynear,NumProj
trigger2 = var(33)
var(46) = Enemynear, StateNo
ignorehitpause = 1

[State 32767, Enemy Hadoken 1]
type = varset
triggerall = !var(45) && !var(46) && !var(47)
triggerall = P2StateType != A && Enemynear,pos y >= 0
triggerall = (P2StateNo = [1000,4999])
triggerall = Enemynear, AnimelemTime(1)>= 35
trigger1 = Enemynear,NumProj
trigger2 = var(33)
var(45) = Enemynear, StateNo
ignorehitpause = 1

[State 32767, Enemy Hadokening end]
type = parentvarset
triggerall = Enemynear,var(32) != parent,ID	;not for beterhans char
triggerall = (parent,var(46) & 32)
triggerall = Enemynear,time < 2
trigger1 = Enemynear,StateNo != var(45)
trigger1 = Enemynear,StateNo != var(46)
trigger1 = Enemynear,StateNo != var(47)
trigger2 = Enemynear, Ctrl
var(46) = parent,var(46) - 32
ignorehitpause = 1

[State 32767, Enemy Hadokening]
type = parentvarset
triggerall = Enemynear,var(32) != parent,ID	;not for beterhans char
triggerall = Roundstate = 2
triggerall = !(parent,var(46) & 32)
triggerall = (P2StateNo = [1000,4999])
triggerall = Enemynear,time < 2
trigger1 = (P2StateNo = var(45)) || (P2StateNo = var(46)) || (P2StateNo = var(47))
trigger1 = var(59) := 76701
var(46) = parent,var(46) + 32
ignorehitpause = 1


;---------- Detect Charging ----------
[State 32767, Remember Enemy charging stateno]
type = varset
trigger1 = Enemynear,Power > var(43)
trigger1 = P2MoveType = I && P2StateNo >= 160 && P2StateNo < 3000
trigger1 = Enemynear,vel x = 0 && !(Enemynear,Ctrl)
trigger1 = var(44) != P2StateNo
var(44) = P2StateNo
ignoreHitPause = 1

[State 32767, Record P2Power]
type = varset
trigger1 = Enemynear,Power != var(43)
var(43) = Enemynear,Power
ignorehitpause = 1

[State 32767, Report parent Enemy is not Charging]
type = parentvarset
triggerall = Enemynear,var(32) != parent,ID
triggerall = (Parent,var(46) & 2)
trigger1 = var(44) && Enemynear,time < 2
trigger1 = var(44) != P2StateNo
var(46) = Parent,var(46) - 2
ignoreHitPause = 1

[State 32767, Report parent Enemy is Charging]
type = parentvarset
triggerall = Enemynear,var(32) != parent,ID
triggerall = !(Parent,var(46) & 2)
trigger1 = var(44) && Enemynear,time < 2
trigger1 = var(44) = P2StateNo
var(46) = Parent,var(46) + 2
ignoreHitPause = 1

;---------- Detect Evade ----------
[State 32767, Enemy Evade StateNo]
type = varset
triggerall = !var(42) && Enemynear,time
triggerall = !(P2StateNo = [120,159]) && !(P2StateNo = [180,199]) && !(P2StateNo = [200,499])
triggerall = P2StateType != A && P2MoveType = I && (P2StateNo = [110,2999])
triggerall = P2StateNo != var(44) && !(Enemynear,Ctrl)
trigger1 = Abs(ParentDist x) < 100 && Parent,MoveType = A && Parent,HitDefAttr = SCA,AA
trigger2  = Enemynear,vel x
var(42) = P2StateNo
ignoreHitPause = 1

[State 32767, remote var(42) if its wrong]
type = varset
triggerall = var(42) = P2StateNo
trigger1 = P2MoveType = A
trigger2 = P2StateType = A
var(42) = 0
ignoreHitPause = 1

[State 32767, Report parent Enemy is not evading]
type = parentvarset;
triggerall = (Parent,var(46) & 1)
triggerall = Enemynear,var(32) != parent,ID
trigger1 = Enemynear,time < 2
trigger1 = var(42)
trigger1 = (Parent,var(46) & 1)
trigger1 = Abs(var(42) - P2StateNo) > 20
trigger2 = !((P2StateNo > 5120 && P2StateNo < 5999) && !(P2StateNo = [5300,5319]) && P2StateType != A && Enemynear,vel x != 0)
var(46) = Parent,var(46) - 1
ignoreHitPause = 1

[State 32767, Report parent Enemy is evading]
type = parentvarset
triggerall = !(Parent,var(46) & 1)
triggerall = Enemynear,var(32) != parent,ID
trigger1 = Enemynear,time < 2
trigger1 = var(42)
trigger1 = Abs(var(42) - P2StateNo) <= 20
trigger2 = ((P2StateNo > 5120 && P2StateNo < 5999) && !(P2StateNo = [5300,5319]) && P2StateType != A && Enemynear,vel x != 0)
var(46) = Parent,var(46) + 1
ignoreHitPause = 1



;------- Detect fastest attack state -----
[State 32767, reset enemy attack state record]
type = varset
trigger1 = P2MoveType != A && var(39) 
var(39) = 0
ignoreHitPause = 1

[State 32767, Record enemy attack state 1]
type = varset
triggerall = var(39) = 0
triggerall = P2MoveType = A && P2StateType != A
triggerall = P2StateNo = [200,999]
trigger1 = Enemynear,time = 1
trigger1 = Abs(Enemynear,AnimTime) <= 12
trigger1 = var(59):= 76739
var(39) = P2StateNo

[State 32767, tell parent enemy is not attacking fast]
type = parentvarset
triggerall = Enemynear,var(32) != parent,ID
triggerall = (Parent,var(46) & 16)
trigger1 = P2MoveType != A || var(39)
var(46) = Parent,var(46) - 16
ignoreHitPause = 1

[State 32767, tell parent enemy is attacking fast]
type = parentvarset
triggerall = Enemynear,var(32) != parent,ID
triggerall = !(Parent,var(46) & 16)
trigger1 = var(39)
var(46) = Parent,var(46) + 16
ignoreHitPause = 1

;--- Copy Beterhans Character announcement ----
[State 32767, copy beterhans char var(44)]
type = parentvarset
trigger1 = Enemynear,AuthorName = "BeterHans"
trigger2 = Enemynear,var(32) = Parent,ID
trigger2 = Parent,var(46) != Enemynear,var(44)
var(46) = Enemynear,var(44)
ignoreHitPause = 1

;--- Detect helper ID -----
[State 32767, find system 1st Helper ID 1]
type = varset
trigger1 = !time
trigger1 = PlayerIDExist(57)
trigger1 = PlayerID(57),IsHelper = 0
var(31) = 58
ignorehitpause = 1

[State 32767, find system 1st Helper ID 2]
type = varadd
trigger1 = time < 6
trigger1 = PlayerIDExist(var(31))
trigger1 = PlayerID(var(31)),IsHelper = 0
var(31) = 1
ignorehitpause = 1

[State 32767, Find attachking helper]
type = Helper
triggerall = !NumHelper(32769)
trigger1 = var(32) = 0 && !time
trigger2 = P2MoveType = A && P2StateNo >= 1000
stateno = 32769
ID = 32769
name = "Dummy Helper ID"
facing = -1
postype = P2
pos = 40,4
ownpal = 1
supermovetime = 65535
pausemovetime = 65535
size.xScale = Const(Size.xScale)
size.yScale = Const(Size.yScale)
size.proj.doscale = ID; Give Parent ID to Child
persistent = 1
ignorehitpause = 1

[State 32767, clear attacking helper id]
type = VarSet
triggerall = var(33)
trigger1 = PlayerIDExist(var(33)) = 0
trigger2 = PlayerIDExist(var(33)) = 1
trigger2 = !(PlayerID(var(33)),HitDefAttr = SCA,AA,AT,AP)
var(33) = 0
ignorehitpause = 1

[State 32767, clear attacking helper id]
type = ParentVarSet
triggerall = Parent,var(45)
trigger1 = PlayerIDExist(Parent,var(45)) = 0
trigger2 = PlayerIDExist(Parent,var(45)) = 1
trigger2 = !(PlayerID(Parent,var(45)),HitDefAttr = SCA,AA,AT,AP)
var(45) = 0
ignorehitpause = 1

[State 32767, clear attacking helper id]
type = ParentVarSet
triggerall = Parent,var(45) = 0 && var(33)
trigger1 = PlayerIDExist(var(33))
trigger1 = (PlayerID(var(33)),HitDefAttr = SCA,AA,AT,AP)
var(45) = var(33)
ignorehitpause = 1

;======== Debug Info ============
[State 32767, Debug]
type = displaytoclipboard
trigger1 = 1
text = "Player:%d's Enemy Monitor, Moniting Player:%d, V45=%d | V46=%d | V47=%d"
params = var(2) , var(3), var(45), var(46),var(47)
ignorehitpause = 1

[State 32767, Debug]
type = appendtoclipboard
trigger1 = 1
text = "\nNumHelper=%d | var(31)%d var(39)%d var(33)%d debug=%d"
params = NumHelper,var(31), var(39), var(33),var(59)
ignorehitpause = 1

;======== Safe exit =============
[State 32767, Safe 1]
type = SelfState
trigger1 = !IsHelper
value = 0
ctrl = 1
ignoreHitPause = 1

[State 32767, Safe 2]
type = Destroyself
trigger1 = NumHelper(32767) > 2
trigger2 = !NumEnemy || RoundState > 2
trigger3 = !var(2)
trigger4 = Root,AILevel = 0; remember to remove
trigger5 = time > 65535
ignoreHitPause = 1





;=============== HELPER's Helper ===========
[StateDef 32769]
type = A
physics = N
moveType = I
anim = 9741
ctrl = 0

[State 32769];enemy init helper number
type = varset
trigger1 = !time
var(21) = Enemynear,NumHelper
ignoreHitPause = 1

[State 32769];enemy init helper number
type = varset
trigger1 = !time
var(31) = Parent,var(31)
ignoreHitPause = 1

[State 32769];guess it
type = varset
trigger1 = time
trigger1 = var(21) != Enemynear,NumHelper
trigger1 = var(21):= Enemynear,NumHelper
trigger1 = var(59):= 1
var(22) = IFElse(var(22),var(22),ID) + 3
ignoreHitPause = 1

[State 32769]; range 1
type = varset
trigger1 = var(22) && var(59) = 1
var(23) = var(22)
ignoreHitPause = 1

[State 32769]; test it out
type = Parentvarset
trigger1 = var(23)
trigger1 = PlayerIDExist(var(23))
trigger1 = PlayerID(var(23)),HitDefAttr = SCA,AA,AT,AP
trigger1 = PlayerID(var(23)),vel x > 0
trigger1 = var(59):= -1
var(33) = var(23)
ignorehitpause = 1

[State 32769]
type = DestroySelf
triggerall = time > 1
trigger1 = P2MoveType != A
trigger2 = var(59) = -1
trigger3 = var(23) && var(31) && var(59)
trigger3 = var(23) < var(31)
ignoreHitPause = 1


; var(21) enemy init helper number
; var(22) Guessed highest ID
; var(23) range point
; var(31) helper lower id
; var(59) trigger finish

[State 32769, Debug]
type = displaytoclipboard
trigger1 = 1
text = "EHelper=%d | highid=%d | lowid=%d | select=%d | var(59)=%d"
params = var(21), var(22), var(31),var(23),var(59)
ignorehitpause = 1

[State 32769]; range decrease
type = varset
trigger1 = var(23) >= var(31) && var(23) <= var(22)
trigger1 = var(22) && var(59) >= 1
trigger1 = var(59):= var(59) + 1
var(23) = var(23) - 1
ignoreHitPause = 1

