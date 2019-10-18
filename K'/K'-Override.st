;============================================================================
; 覆盖Common1.cns动作用
;============================================================================


;---------------------------------------------------------------------------
; 站立
[Statedef 0]
type = S
physics = N
sprpriority = 0
velset = 0,0

[State -2,防止乱转向]
type = AssertSpecial
trigger1 = EnemyNear,StateType = A
trigger1 = EnemyNear,Pos Y < -40
trigger1 = EnemyNear,MoveType = H
trigger1 = EnemyNear,Ctrl = 0
trigger1 = EnemyNear,BackEdgeBodyDist <= 0 || EnemyNear,FrontEdgeBodyDist <= 0
flag = NoAutoTurn

[State -3,STOP]
type = StopSnd
trigger1 = prevstateno = [191,194]
trigger1 = roundstate = 2
channel = 0

[State -3,STOP]
type = StopSnd
trigger1 = prevstateno = [191,194]
trigger1 = roundstate = 2
channel = 1

[State 0, 1]
type = ChangeAnim
trigger1 = Anim != 0 && Anim != 5
trigger2 = Anim = 5 && AnimTime = 0 ;Turn anim over
value = 0

[State 0, 2]
type = VelSet
trigger1 = Time = 0
y = 0

[State 0, 3] ;Stop moving if low velocity or 4 ticks pass
type = VelSet
trigger1 = abs(vel x) < 2
trigger2 = Time = 4
trigger3 = Time = 0
x = 0

[State 0, 4] ;Are you dead?
type = ChangeState
trigger1 = !alive
value = 5050 + 100*((Anim = 5120) || (Anim = 5150))

;---------------------------------------------------------------------------
; 站到蹲
[Statedef 10]
type    = C
physics = C
anim = 10

[State -1]
type = changeState
trigger1 = var(59)
value = 1

[State 10, 1]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 10, 1]
type = VelMul
trigger1 = Time = 0
x = .75

[State 10, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 11

;---------------------------------------------------------------------------
; 蹲
[Statedef 11]
type    = C
physics = C
anim = 11
sprpriority = 0

[State 10, 1]
type = AssertSpecial
trigger1 = Time = 0
trigger1 = Anim = 10
flag = NoAutoTurn

[State 11, 1] ;Change from turning animation
type = ChangeAnim
trigger1 = Anim = 6 && AnimTime = 0
value = 11

;---------------------------------------------------------------------------
; 蹲到站
[Statedef 12]
type    = S
physics = S
anim = 12

[State 12, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 0

;---------------------------------------------------------------------------
; 步行
[Statedef 20]
type    = S
physics = S
sprpriority = 0

[State 40]
type = changeState
trigger1 = time = 0
trigger1 = var(59)
value = 1

[State 20, 1]
type = VelSet
trigger1 = var(59) = 0
trigger1 = command = "holdfwd"
x = const(velocity.walk.fwd.x)

[State 20, 2]
type = VelSet
trigger1 = var(59) = 0
trigger1 = command = "holdback"
x = const(velocity.walk.back.x)

[State 20, 3]
type = ChangeAnim
triggerall = vel x > 0
trigger1 = Anim != 20 && Anim != 5
trigger2 = Anim = 5 && AnimTime = 0
value = 20

[State 20, 4]
type = ChangeAnim
triggerall = vel x < 0
trigger1 = Anim != 21 && Anim != 5
trigger2 = Anim = 5 && AnimTime = 0
value = 21

;---------------------------------------------------------------------------
; 起跳
[Statedef 40]
type = S
physics = S
ctrl = 0
velset = 0,0
facep2 = 1
sprpriority = 1

[State 40]
type = changeState
trigger1 = time = 0
trigger1 = var(59)
value = 1

[State 100, Kino]
type = VarSet
trigger1 = var(59) = 0
trigger1 = !time
var(4) = 0

[State 100, Karin]
type = VarSet
trigger1 = var(59) = 0
trigger1 = command = "x"
var(4) = 1

[State 100, Karin]
type = VarSet
trigger1 = var(59) = 0
trigger1 = command = "a"
var(4) = 2

[State 100, Karin]
type = VarSet
trigger1 = var(59) = 0
trigger1 = command = "y"
var(4) = 3

[State 100, Karin]
type = VarSet
trigger1 = var(59) = 0
trigger1 = command = "b"
var(4) = 4

[State 100, Karin]
type = VarSet
trigger1 = var(59) = 0
trigger1 = command = "z"
var(4) = 5

[State 100, Karin]
type = VarSet
trigger1 = var(59) = 0
trigger1 = command = "knock"
var(4) = 5

[State 40, ChangeAnim]
type = ChangeAnim
trigger1 = !time
value = 40

[State 40, 1]
type = VarSet
trigger1 = Time = 0
sysvar(1) = 0

[State 40, 2]
type = VarSet
trigger1 = var(59) = 0
trigger1 = command = "holdfwd"
sysvar(1) = 1

[State 40, 3]
type = VarSet
trigger1 = var(59) = 0
trigger1 = command = "holdback"
sysvar(1) = -1

[State 40, 1]
type = VarSet
trigger1 = var(59) = 0
triggerall = sysvar(1)
trigger1 = command = "hijump" && command != "chargedhijump"
trigger2 = PrevStateNo = 101 && sysvar(1) = 1
var(2) = 1

[State 40, 1]
type = VarSet
trigger1 = PrevStateNo = 101 && sysvar(1) = -1
var(2) = 0

[State 40, 4]
type = VarSet
trigger1 = Time = 0
var(3) = 0

[State 40, 5]
type = VarSet
trigger1 = command != "holdup"
var(3) = 2

[State 40, 6]
type = VelSet
triggerall = !var(2)
trigger1 = AnimTime = 0
trigger2 = var(4) && time > 0
x = ifelse(!sysvar(1), 0, ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))

;Hi jump X vel
[State 40, 7]
type = VelSet
triggerall = var(2)
trigger1 = AnimTime = 0
trigger2 = var(4) && time > 0
x = ifelse(!sysvar(1), 0, ifelse(sysvar(1)=1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))

;Short jump Y vel
[State 40, 8]
type = VelSet
trigger1 = AnimTime = 0
trigger2 = var(4) && time > 0
y = ifelse (var(3), -7.693359375, const(velocity.jump.y))

[State 40, PlaySnd]
type = PlaySnd
trigger1 = !animtime
trigger2 = var(4) && time > 0
value = 12,3+var(2)

[State 810, 1]
type = AfterImage
triggerall = var(2)
trigger1 = !animtime
trigger2 = var(4) && time > 0
time = -1
length = 4
framegap = 1
timegap = 6
trans = add1
palcontrast = 128,128,128
paladd = 0,0,0
palmul = 1,1,1


;--------------------------[APPROPIATE ATTACK STATE]----------------------------
;Jumping Light Punch
[State -1, Jumping Light Punch]
type = ChangeState
value = 600
trigger1 = var(4) = 1 && time > 0
;Jumping Light Kick
[State -1, Jumping Light Kick]
type = ChangeState
value = 700
trigger1 = var(4) = 2 && time > 0
;Jumping Hard Punch
[State -1, Jumping Hard Punch]
type = ChangeState
value = 610
trigger1 = var(4) = 3 && time > 0
;Jumping Hard Kick
[State -1, Jumping Light Kick]
type = ChangeState
value = 710
trigger1 = var(4) = 4 && time > 0
;Jumping CD Attack
[State -1, Jumping CD Attack]
type = ChangeState
value = 990
trigger1 = var(4) = 5 && time > 0
;-------------------------------------------------------------------------------

[State 40, 6]
type = ChangeState
trigger1 = AnimTime = 0 && command = "holdup"
value = 50
ctrl = 1

[State 40, 6]
type = ChangeState
trigger1 = AnimTime = 0 && Var(3) = 2
value = 41
ctrl = 1

;---------------------------------------------------------------------------
; Jump Up
[Statedef 50]
type = A
physics = N

[State 50, 1]
type = VarSet
trigger1 = Time = 1
sysvar(1) = 0

[State 50, 2]
type = ChangeAnim
trigger1 = Time = 0
value = ifelse((vel x)=0, 41, ifelse((vel x)>0, 42, 43))

[State 50, VelAdd]
type = VelAdd
trigger1 = time >= 0
y = const(movement.yaccel)

[State 50, 3]
type = ChangeAnim
trigger1 = Vel y > -2
trigger1 = SelfAnimExist(anim + 3)
persistent = 0
value = Anim + 3

[State 40, 6]
type = ChangeState
trigger1 = Pos Y + Vel Y >= 0
value = 52
ctrl = 1

;---------------------------------------------------------------------------
; 小跳
[Statedef 41]
type = A
physics = N

[State 1101, pos]
type = Veladd
trigger1 = time > 0
y = const(movement.yaccel)

[State 810, 1]
type = AfterImage
triggerall = !var(31)
trigger1 = !time && var(2) && sysvar(1)
time = -1
length = 4
framegap = 1
timegap = 6
trans = add1
palcontrast = 128,128,128
paladd = 0,0,0
palmul = 1,1,1

[State 810, 1]
type = AfterImage
triggerall = var(31)
trigger1 = !time && var(2) && sysvar(1)
time = 10
length = 9
framegap = 3
palcontrast = 256,256,256
paladd = 0,0,0
palmul = 1,1,1

[State 50, 1]
type = VarSet
trigger1 = Time = 1
sysvar(1) = 0

[State 50, 2]
type = ChangeAnim
trigger1 = Time = 0
value = ifelse((vel x)=0, 51, ifelse((vel x)>0, 52, 53))

[State 50, 3]
type = ChangeAnim
trigger1 = Vel y > -2
trigger1 = SelfAnimExist(anim + 3)
persistent = 0
value = Anim + 3

[State 40, 6]
type = ChangeState
trigger1 = Pos Y + Vel Y >= 0
value = 52
ctrl = 1

;---------------------------------------------------------------------------
; 落地
[Statedef 52]
type    = S
physics = S
ctrl = 0
anim = 47
velset = 0,0

[State 300, Land]
type = PlaySnd
trigger1 = !time
value = 12,2

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 52, 3]
type = CtrlSet
trigger1 = Time = 1
value = 1

[State 52, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 前冲
[Statedef 100]
type    = S
physics = S
anim = 99
ctrl = 0
velset = 0
sprpriority = 1

[State 40]
type = changeState
trigger1 = time = 0
trigger1 = var(59)
value = 1

[State 100, Kino]
type = VarSet
trigger1 = !time
var(4) = 0
[State 100, Karin]
type = VarSet
trigger1 = var(59) = 0
trigger1 = command = "x"
var(4) = 1
[State 100, Karin]
type = VarSet
trigger1 = var(59) = 0
trigger1 = command = "a"
var(4) = 2
[State 100, Karin]
type = VarSet
trigger1 = var(59) = 0
trigger1 = command = "y"
var(4) = 3
[State 100, Karin]
type = VarSet
trigger1 = var(59) = 0
trigger1 = command = "b"
var(4) = 4
[State 100, Karin]
type = VarSet
trigger1 = var(59) = 0
trigger1 = command = "z"
var(4) = 5
[State 100, Karin]
type = VarSet
trigger1 = var(59) = 0
trigger1 = command = "knock"
var(4) = 5

[State 220,2]
type = ChangeState
trigger1 = AnimTime = 0
value = 101

[Statedef 101]
type    = S
physics = S
anim = 100
ctrl = 0
velset = 0
sprpriority = 1

[State -3, dash]
type = PlaySnd
trigger1 = time = 1
value = 12,8
volume = 200
loop = 1
channel = 27

[State 100, 1]
type = VelSet
trigger1 = 1
x = const(velocity.run.fwd.x)

[State 100, 2] ;Prevent run from canceling into walk
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 100, 3] ;Prevent from turning
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 100, VarSet]
type = VarSet
trigger1 = !time && prevstateno != 102
var(26) = 0

[State 100, VarSet]
type = VarSet
trigger1 = time > 10
var(26) = 1

;--------------------------[APPROPIATE ATTACK STATE]----------------------------
[State -1, Light Punch (Close)]
type = ChangeState
value = 205
triggerall = P2dist X < 39
trigger1 = time = 1 && var(4) = 1
[State -1, Light Punch (Far)]
type = ChangeState
value = 200
triggerall = P2dist X >= 39
trigger1 = time = 1 && var(4) = 1
[State -1, Light Kick]
type = ChangeState
value = 300
triggerall = P2dist X >= 39
trigger1 = time = 1 && var(4) = 2
[State -1, Light Kick (Close)]
type = ChangeState
value = 305
triggerall = P2dist X < 39
trigger1 = time = 1 && var(4) = 2
[State -1, Hard Punch]
type = ChangeState
value = 800
triggerall = P2dist X >= 80
trigger1 = time = 1 && var(4) = 3
[State -1, Hard Punch (Close)]
type = ChangeState
value = 810
triggerall = P2dist X < 80
trigger1 = time = 1 && var(4) = 3
[State -1, Hard Kick]
type = ChangeState
value = 310
triggerall = P2dist X >= 49
trigger1 = time = 1 && var(4) = 4
[State -1, Hard Kick (Close)]
type = ChangeState
value = 315
triggerall = P2dist X < 49
trigger1 = time = 1 && var(4) = 4
[State -1, CD Attack]
type = ChangeState
value = 980
trigger1 = time = 1 && var(4) = 5
;-------------------------------------------------------------------------------

[State 220,2]
type = ChangeState
trigger1 = var(59) = 0
trigger1 = command = "holdup"
value = 40

[State 101, 6]
type = ChangeState
trigger1 = Time > 9
trigger1 = var(59) = 0
trigger1 = command != "holdfwd"
value = 102

[Statedef 102]
type    = S
physics = S
anim = 101
ctrl = 0
velset = 0
sprpriority = 1

[State 100, 4]
type = ChangeState
triggerall = var(26)
trigger1 = var(59) = 0
trigger1 = command = "holdfwd"
value = 101

[State 220,2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 后撤
[Statedef 105]
type    = S
physics = S
ctrl = 0
anim = 105
sprpriority = 1

[State 105, 3]
type = ChangeState
trigger1 = animtime = 0
value = 106

;---------------------------------------------------------------------------
; RUN_BACK
[Statedef 106]
type    = A
physics = N
ctrl = 0
anim = 106
sprpriority = 1

[State 105, 1]
type = VelSet
trigger1 = time = 0
x = -9.4140625

[State 105, 1]
type = VelSet
trigger1 = !time
y = -1.75

[State 0, VelMul]
type = VelMul
trigger1 = time > 0
x = 0.94140625

[State 105, VelAdd]
type = VelAdd
trigger1 = time > 0
y = 0.29296875

[State 105, 3]
type = ChangeState
trigger1 = Vel Y + Pos Y >= 0
value = 107

;---------------------------------------------------------------------------
; RUN_BACK2 (land)
[Statedef 107]
type    = S
physics = S
ctrl = 0
anim = 107

[State -3, land]
type = PlaySnd
trigger1 = !time
value =  2+(1*10),2

[State 106, 1]
type = VelSet
trigger1 = Time = 0
x = 0
y = 0

[State 107, CtrlSet]
type = CtrlSet
trigger1 = time = 2
value = 1

[State 106, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 106, 4]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1


;---------------------------------------------------------------------------
; GUARD (start)
[Statedef 120]
type = U    ;Leave state type unchanged
physics = U ;Leave physics unchanged

[State 120, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 120 + (statetype = C) + (statetype = A)*2

[state 120, Turn]
type = Turn
trigger1 = var(59) && ctrl = 0
trigger1 = StateType = S || StateType = C
trigger1 = teammode = single || teammode = turns
trigger1 = p2dist x < 0

[State 120]
type = velset
trigger1 = time = 0
trigger1 = StateType != A
x = 0

[State 120, 2]
type = StateTypeSet
trigger1 = Time = 0 && statetype = S
physics = S

[State 120, 3]
type = StateTypeSet
trigger1 = Time = 0 && statetype = C
physics = C

[State 120, 4]
type = StateTypeSet
trigger1 = Time = 0 && statetype = A
physics = A

[State 120, Hi to Lo]
type = StateTypeSet
triggerall = statetype = S
trigger1 = var(59) = 0
trigger1 = statetype = S && command = "holddown"
trigger2 = var(59) 
trigger2 = helper(33000),var(11) != 2
trigger2 = EnemyNear,StateTYpe != A
trigger2 = EnemyNear,MoveType = A
trigger2 = helper(33000),var(11) = 1 || EnemyNear,StateType = C || EnemyNear,AnimTime >= -20 || EnemyNear,NumProj || PlayerIdExist(helper(33333333),var(3))
statetype = C
physics = C

[State 120, Lo to Hi]
type = StateTypeSet
triggerall = statetype = C
trigger1 = var(59) = 0
trigger1 = statetype = C && command != "holddown"
;中段切站
trigger2 = var(59)
trigger2 = EnemyNear,MoveType = A 
trigger2 = helper(33000),var(11) = 2 || EnemyNear,StateType = A 
;
trigger3 = var(59)
trigger3 = !EnemyNear,NumProj
trigger3 = !PlayerIdExist(helper(33333333),var(3))
trigger3 = EnemyNear,MoveType = A
trigger3 = helper(33000),var(11) = 0 && EnemyNear,AnimTime < -20
statetype = S
physics = S

[State AI fix]
type = ctrlset
trigger1 = var(59) && numenemy
value = (enemynear, time >= 120 || time >= 180)

[State 120, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 130 + (statetype = C) + (statetype = A)*2

[State 120, Stop Guarding]
type = ChangeState
trigger1 = var(59) = 0
trigger1 = command != "holdback"
trigger2 = !inguarddist
trigger2 = !(numhelper(33000) && Helper(33000),InGuardDist && (Facing*EnemyNear,Facing!=-1 || P2Dist X<0))
trigger3 = var(59) && numenemy
trigger3 = enemynear, hitdefattr = SCA, AT
;AI helper带的撤防
trigger4 = enemynear,hitdefattr = ,at 
trigger5 = numhelper(33000)
trigger5 = helper(33000),var(11) = 3 || helper(33000),var(11) = 5 ;空中的话，直接写helper(33000),var(11) = [3,5]
trigger6 = numhelper(33000)
trigger6 = enemynear,stateno = helper(33000),var(2)
trigger6 = P2BodyDist x < 52
trigger6 = enemynear,time < helper(33000),var(3) - 5 ;一般最快的普通技是4f就这么写。    
trigger6 = enemy,teammode != simul ;双人战不记录
trigger7 = numhelper(33000)
trigger7 = helper(33000),var(1) > 1 ;对手判定已经过了，写 > 1比较保险。
trigger7 = time > 3 || enemynear,animtime >= -5 ;3F用来多段技警戒。而对手animtime >= -5的时候已经接近收招了，通常不会残余判定。
trigger7 = random <= 60*var(59) ;有些招持续时间还是很长的，必须加一个random保险。
trigger7 = enemy,teammode != simul ;双人战撤防很危险
trigger7 = enemynear,statetype != A || prevstateno = [150,159] ;空中攻击通常持续时间很长，但防御过后一般可以认为判定已经过去了。
trigger7 = prevstateno != 5120 || random%10 = 0 ;起身时少乱动，虽然也有可能中奖。
;自身在空中，对方发C类型的攻击
trigger8 = statetype = A
trigger8 = enemynear,hitdefattr = c ,aa
value = 140

;---------------------------------------------------------------------------
; STAND GUARD (guarding)
[Statedef 130]
type    = S
physics = S

[state 130, Turn]
type = Turn
trigger1 = var(59) && ctrl = 0
trigger1 = StateType = S || StateType = C
trigger1 = teammode = single || teammode = turns
trigger1 = p2dist x < 0

[State 130, 1]
type = ChangeAnim
trigger1 = Anim != 130
value = 130

[State 130, Hi to Lo]
type = ChangeState
triggerall = statetype = S
trigger1 = var(59) = 0
trigger1 = command = "holddown"
trigger2 = var(59) 
trigger2 = helper(33000),var(11) != 2
trigger2 = EnemyNear,MoveType = A
trigger2 = EnemyNear,StateTYpe != A
trigger2 = helper(33000),var(11) = 1 || EnemyNear,StateType = C || EnemyNear,AnimTime >= -20 || EnemyNear,NumProj || PlayerIdExist(helper(33333333),var(3))
value = 131
IgnoreHitPause = 1

[State 130, Stop Guarding]
type = ChangeState
trigger1 = var(59) = 0
trigger1 = command != "holdback"
trigger2 = !inguarddist
trigger2 = !(numhelper(33000) && Helper(33000),InGuardDist && (Facing*EnemyNear,Facing!=-1 || P2Dist X<0))
trigger3 = var(59) && numenemy
trigger3 = enemynear, hitdefattr = , AT
;AI helper带的撤防
trigger4 = numhelper(33000)
trigger4 = helper(33000),var(11) = 3 || helper(33000),var(11) = 5 ;空中的话，直接写helper(33000),var(11) = [3,5]
trigger5 = numhelper(33000)
trigger5 = P2BodyDist x < 50
trigger5 = enemynear,stateno = helper(33000),var(2)
trigger5 = enemynear,time < helper(33000),var(3) - 5 ;一般最快的普通技是4f就这么写。    
trigger5 = enemy,teammode != simul ;双人战不记录
trigger6 = numhelper(33000)
trigger6 = helper(33000),var(1) > 1 ;对手判定已经过了，写 > 1比较保险。
trigger6 = time > 3 || enemynear,animtime >= -5 ;3F用来多段技警戒。而对手animtime >= -5的时候已经接近收招了，通常不会残余判定。
trigger6 = random <= 60*var(59) ;有些招持续时间还是很长的，必须加一个random保险。
trigger6 = enemy,teammode != simul ;双人战撤防很危险
trigger6 = enemynear,statetype != A || prevstateno = [150,159] ;空中攻击通常持续时间很长，但防御过后一般可以认为判定已经过去了。
trigger6 = prevstateno != 5120 || random%10 = 0 ;起身时少乱动，虽然也有可能中奖。
value = 140

;---------------------------------------------------------------------------
; CROUCH GUARD (guarding)
[Statedef 131]
type    = C
physics = C

[State 131, 1]
type = ChangeAnim
trigger1 = Anim != 131
value = 131

[state 120, Turn]
type = Turn
trigger1 = var(59) = 1 && ctrl = 0
trigger1 = StateType = S || StateType = C
trigger1 = teammode = single || teammode = turns
trigger1 = p2dist x < 0

[State 131, Lo to Hi]
type = ChangeState
triggerall = statetype = C

trigger1 = var(59) = 0
trigger1 = command != "holddown"

;中段切站
trigger2 = var(59)
trigger2 = EnemyNear,StateType != C
trigger2 = EnemyNear,MoveType = A 
trigger2 = helper(33000),var(11) = 2 || EnemyNear,StateType = A 
;
trigger3 = var(59)
trigger3 = !EnemyNear,NumProj
trigger3 = !PlayerIdExist(helper(33333333),var(3))
trigger3 = EnemyNear,StateType != C
trigger3 = EnemyNear,MoveType = A
trigger3 = helper(33000),var(11) = 0 && EnemyNear,AnimTime < -20
value = 130
IgnoreHitPause = 1

[State 131, Stop Guarding]
type = ChangeState
trigger1 = var(59) = 0
trigger1 = command != "holdback"
trigger2 = !inguarddist
trigger2 = !(numhelper(33000) && Helper(33000),InGuardDist && (Facing*EnemyNear,Facing!=-1 || P2Dist X<0))
trigger3 = var(59) && numenemy
trigger3 = enemynear, hitdefattr = SCA, AT
;AI helper带的撤防
trigger4 = numhelper(33000)
trigger4 = helper(33000),var(11) = 3 || helper(33000),var(11) = 5 ;空中的话，直接写helper(33000),var(11) = [3,5]
trigger5 = P2BodyDist x < 50
trigger5 = numhelper(33000)
trigger5 = enemynear,stateno = helper(33000),var(2)
trigger5 = enemynear,time < helper(33000),var(3) - 5 ;一般最快的普通技是4f就这么写。    
trigger5 = enemy,teammode != simul ;双人战不记录
trigger6 = numhelper(33000)
trigger6 = helper(33000),var(1) > 1 ;对手判定已经过了，写 > 1比较保险。
trigger6 = time > 3 || enemynear,animtime >= -5 ;3F用来多段技警戒。而对手animtime >= -5的时候已经接近收招了，通常不会残余判定。
trigger6 = random <= 60*var(59) ;有些招持续时间还是很长的，必须加一个random保险。
trigger6 = enemy,teammode != simul ;双人战撤防很危险
trigger6 = enemynear,statetype != A || prevstateno = [150,159] ;空中攻击通常持续时间很长，但防御过后一般可以认为判定已经过去了。
trigger6 = prevstateno != 5120 || random%10 = 0 ;起身时少乱动，虽然也有可能中奖。
value = 140

;---------------------------------------------------------------------------
; AIR GUARD (guarding)
[Statedef 132]
type    = A
physics = N

[State 132, 1]
type = ChangeAnim
trigger1 = Anim != 132
value = 132

[State AI fix]
type = ctrlset
trigger1 = var(59) && numenemy
value = (enemynear, time >= 120 || time >= 180)

[State 132, 2]
type = VelAdd
trigger1 = 1
y = Const(movement.yaccel)

[State 132, 3]
type = VarSet
trigger1 = 1
sysvar(0) = (pos y >= 0) && (vel y > 0)

[State 132, 4]
type = VelSet
trigger1 = sysvar(0)
y = 0

[State 132, 5]
type = PosSet
trigger1 = sysvar(0)
y = 0

[State 132, 6]
type = ChangeState
trigger1 = sysvar(0)
trigger1 = (var(59) = 0 && command = "holdback") || var(59)
trigger1 = inguarddist
value = 130
IgnoreHitPause = 1

[State 132, 7]
type = ChangeState
trigger1 = sysvar(0)
value = 52

[State 132, Stop Guarding]
type = ChangeState
trigger1 = var(59) = 0
trigger1 = command != "holdback"
trigger2 = !inguarddist
trigger2 = !(numhelper(33000) && Helper(33000),InGuardDist && (Facing*EnemyNear,Facing!=-1 || P2Dist X<0))
trigger3 = var(59) && numenemy
trigger3 = enemynear, hitdefattr = , AT
;AI helper带的扯防
trigger4 = numhelper(33000)
trigger4 = helper(33000),var(11) = [3,5] ;空中的话，直接写helper(33000),var(11) = [3,5]
trigger5 = numhelper(33000)
trigger5 = enemynear,stateno = helper(33000),var(2)
trigger5 = enemynear,time < helper(33000),var(3) - 6 ;一般最快的普通技是4f就这么写。    
trigger5 = enemy,teammode != simul ;双人战不记录
trigger6 = numhelper(33000)
trigger6 = helper(33000),var(1) > 1 ;对手判定已经过了，写 > 1比较保险。
trigger6 = time > 3 || enemynear,animtime >= -5 ;3F用来多段技警戒。而对手animtime >= -5的时候已经接近收招了，通常不会残余判定。
trigger6 = random <= 60*var(59) ;有些招持续时间还是很长的，必须加一个random保险。
trigger6 = enemy,teammode != simul ;双人战撤防很危险
trigger6 = enemynear,statetype != A || prevstateno = [150,159] ;空中攻击通常持续时间很长，但防御过后一般可以认为判定已经过去了。
trigger6 = prevstateno != 5120 || random%10 = 0 ;起身时少乱动，虽然也有可能中奖。
;自身在空中，对方发C类型的攻击
trigger7 = statetype = A
trigger7 = enemynear,hitdefattr = c ,aa
value = 140

;---------------------------------------------------------------------------
; GUARD (end)
[Statedef 140]
type = U    ;Leave state type unchanged
physics = U ;Leave physics unchanged
ctrl = 1

[State 140, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 140 + (statetype = C) + (statetype = A)*2

[State 140, 2]
type = StateTypeSet
trigger1 = Time = 0 && statetype = S
physics = S

[State 140, 3]
type = StateTypeSet
trigger1 = Time = 0 && statetype = C
physics = C

[State 140, 4]
type = StateTypeSet
trigger1 = Time = 0 && statetype = A
physics = A

[State 140, Hi to Lo]
type = StateTypeSet
triggerall = statetype = S
trigger1 = var(59) = 0
trigger1 = statetype = S && command = "holddown"
trigger2 = var(59) 
trigger2 = helper(33000),var(11) != 2
trigger2 = EnemyNear,StateTYpe != A
trigger2 = EnemyNear,MoveType = A
trigger2 = helper(33000),var(11) = 1 || EnemyNear,StateType = C || EnemyNear,AnimTime >= -20 || EnemyNear,NumProj || PlayerIdExist(helper(33333333),var(3))
statetype = C
physics = C
IgnoreHitPause = 1

[State 140, Lo to Hi]
type = StateTypeSet
triggerall = statetype = C
trigger1 = var(59) = 0
trigger1 = statetype = C && command != "holddown"
;中段切站
trigger2 = var(59)
trigger2 = EnemyNear,MoveType = A 
trigger2 = helper(33000),var(11) = 2 || EnemyNear,StateType = A 
;
trigger3 = var(59)
trigger3 = !EnemyNear,NumProj
trigger3 = !PlayerIdExist(helper(33333333),var(3))
trigger3 = EnemyNear,MoveType = A
trigger3 = helper(33000),var(11) = 0 && EnemyNear,AnimTime < -20
statetype = S
physics = S
IgnoreHitPause = 1

;[State 140, 5] ;Implemented within engine
;type = ChangeState
;trigger1 = AnimTime = 0
;value = (statetype = C)*11 + (statetype = A)*51

;---------------------------------------------------------------------------
; SGUARDHIT (shaking)
[Statedef 150]
type    = S
movetype= H
physics = N
velset = 0,0

[State 150, 1]
type = ChangeAnim
trigger1 = 1
value = 150

[State 150, 2]
type = ChangeState
trigger1 = HitShakeOver
value = 151 + 2 * ((!var(59) && command = "holddown") || (var(59) && (enemynear, movetype = A) && (enemynear, statetype = C)))


[State 150, Hi to Lo]
type = StateTypeSet
TriggerAll = StateType = S
trigger1 = var(59) = 0
trigger1 = statetype = S && command = "holddown"
trigger2 = var(59) 
trigger2 = helper(33000),var(11) != 2
trigger2 = EnemyNear,StateType != A
trigger2 = EnemyNear,MoveType = A
trigger2 = helper(33000),var(11) = 1 || EnemyNear,StateType = C || EnemyNear,AnimTime >= -20 || EnemyNear,NumProj || PlayerIdExist(helper(33333333),var(3))
statetype = C
physics = C
IgnoreHitPause = 1

[State 150, Lo to Hi]
type = StateTypeSet
TriggerAll = StateType = C
trigger1 = var(59) = 0
trigger1 = statetype = C && command != "holddown"
;中段切站
trigger2 = var(59)
trigger2 = EnemyNear,MoveType = A 
trigger2 = helper(33000),var(11) = 2 || EnemyNear,StateType = A 
;
trigger3 = var(59)
trigger3 = !EnemyNear,NumProj
trigger3 = !PlayerIdExist(helper(33333333),var(3))
trigger3 = EnemyNear,MoveType = A
trigger3 = helper(33000),var(11) = 0 && EnemyNear,AnimTime < -20
statetype = S
physics = S
IgnoreHitPause = 1

[State 150, 3]
type = ForceFeedback
trigger1 = time = 0
waveform = square
time = 3

;---------------------------------------------------------------------------
; SGUARDHIT2 (knocked back)
[Statedef 151]
type    = S
movetype= H
physics = S
anim = 150

[State 151, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 151, 2]
type = VelSet
trigger1 = Time = GetHitVar(slidetime)
trigger2 = HitOver
x = 0

[State 151, 3]
type = CtrlSet
trigger1 = Time = GetHitVar(ctrltime)
value = 1

[State 151, Hi to Lo]
type = StateTypeSet
TriggerAll = StateType = S
trigger1 = var(59) = 0
trigger1 = statetype = S && command = "holddown"
trigger2 = var(59) 
trigger2 = helper(33000),var(11) != 2
trigger2 = EnemyNear,StateTYpe != A
trigger2 = EnemyNear,MoveType = A
trigger2 = helper(33000),var(11) = 1 || EnemyNear,StateType = C || (EnemyNear,StateType = S && Random < 500)
trigger3 = var(59)
trigger3 = EnemyNear,StateTYpe != A
trigger3 = EnemyNear,MoveType = A
trigger3 = EnemyNear,NumProj || PlayerIdExist(helper(33333333),var(3))
statetype = C
physics = C
IgnoreHitPause = 1

[State 151, Lo to Hi]
type = StateTypeSet
TriggerAll = StateType = C
trigger1 = var(59) = 0
trigger1 = statetype = C && command != "holddown"
;中段切站
trigger2 = var(59)
trigger2 = EnemyNear,MoveType = A 
trigger2 = helper(33000),var(11) = 2 || EnemyNear,StateType = A 
;
trigger3 = var(59)
trigger3 = !EnemyNear,NumProj
trigger3 = !PlayerIdExist(helper(33333333),var(3))
trigger3 = EnemyNear,MoveType = A
trigger3 = helper(33000),var(11) = 0 && EnemyNear,AnimTime < -20
statetype = S
physics = S
IgnoreHitPause = 1

[State 151, 5]
type = NotHitBy
trigger1 = HitOver
trigger2 = Time = GetHitVar(ctrltime)
value = SCA
time = 1
persistent = 0

[State 151, 4]
type = ChangeState
trigger1 = HitOver
value = 130
ctrl = 1

;---------------------------------------------------------------------------
; CGUARDHIT (shaking)
[Statedef 152]
type    = C
movetype= H
physics = N
velset = 0,0

[State 152, 1]
type = ChangeAnim
trigger1 = 1
value = 151

[State 152, 3]
type = ChangeState
trigger1 = HitShakeOver
value = 151 + 2 * ((!var(59) && command = "holddown") || (var(59) && (enemynear, movetype = A) && (enemynear, statetype = C)))

[State 152, Hi to Lo]
type = StateTypeSet
TriggerAll = StateType = S
trigger1 = var(59) = 0
trigger1 = statetype = S && command = "holddown"
trigger2 = var(59) 
trigger2 = helper(33000),var(11) != 2
trigger2 = EnemyNear,StateType != A
trigger2 = EnemyNear,MoveType = A
trigger2 = helper(33000),var(11) = 1 || EnemyNear,StateType = C || (EnemyNear,StateType = S && Random < 500) || EnemyNear,AnimTime >= -20 || EnemyNear,NumProj || PlayerIdExist(helper(33333333),var(3))
statetype = C
physics = C
IgnoreHitPause = 1

[State 152, Lo to Hi]
type = StateTypeSet
TriggerAll = StateType = C
trigger1 = var(59) = 0
trigger1 = statetype = C && command != "holddown"
;中段切站
trigger2 = var(59)
trigger2 = EnemyNear,MoveType = A 
trigger2 = helper(33000),var(11) = 2 || EnemyNear,StateType = A 
;
trigger3 = var(59)
trigger3 = !EnemyNear,NumProj
trigger3 = !PlayerIdExist(helper(33333333),var(3))
trigger3 = EnemyNear,MoveType = A
trigger3 = helper(33000),var(11) = 0 && EnemyNear,AnimTime < -20
statetype = S
physics = S
IgnoreHitPause = 1

[State 152, 4]
type = ForceFeedback
trigger1 = time = 0
waveform = square
time = 4

;---------------------------------------------------------------------------
; CGUARDHIT2 (knocked back)
[Statedef 153]
type    = C
movetype= H
physics = C
anim = 151

[State 153, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 153, 2]
type = VelSet
trigger1 = Time = GetHitVar(slidetime)
trigger2 = HitOver
x = 0

[State 153, 3]
type = CtrlSet
trigger1 = Time = GetHitVar(ctrltime)
value = 1

[State 153, Hi to Lo]
type = StateTypeSet
TriggerAll = StateType = S
trigger1 = var(59) = 0
trigger1 = statetype = S && command = "holddown"
trigger2 = var(59) 
trigger2 = helper(33000),var(11) != 2
trigger2 = EnemyNear,StateType != A
trigger2 = EnemyNear,MoveType = A
trigger2 = helper(33000),var(11) = 1 || EnemyNear,StateType = C || EnemyNear,AnimTime >= -20 || EnemyNear,NumProj || PlayerIdExist(helper(33333333),var(3))
statetype = C
physics = C
IgnoreHitPause = 1

[State 153, Lo to Hi]
type = StateTypeSet
TriggerAll = StateType = C
trigger1 = var(59) = 0
trigger1 = statetype = C && command != "holddown"
;中段切站
trigger2 = var(59)
trigger2 = EnemyNear,MoveType = A 
trigger2 = helper(33000),var(11) = 2 || EnemyNear,StateType = A 
;
trigger3 = var(59)
trigger3 = !EnemyNear,NumProj
trigger3 = !PlayerIdExist(helper(33333333),var(3))
trigger3 = EnemyNear,MoveType = A
trigger3 = helper(33000),var(11) = 0 && EnemyNear,AnimTime < -20
statetype = S
physics = S
IgnoreHitPause = 1

[State 151, 5]
type = NotHitBy
trigger1 = HitOver
trigger2 = Time = GetHitVar(ctrltime)
value = SCA
time = 1
persistent = 0

[State 153, 4]
type = ChangeState
trigger1 = HitOver
value = 131
ctrl = 1

;---------------------------------------------------------------------------
; AGUARDHIT (shaking)
[Statedef 154]
type    = A
movetype= H
physics = N
velset = 0,0

[State 154, 1]
type = ChangeAnim
trigger1 = 1
value = 152

[State 154, 2]
type = ChangeState
trigger1 = HitShakeOver
value = 155 ;AGUARDHIT2

[State 154, 3]
type = ForceFeedback
trigger1 = time = 0
waveform = square
time = 4

;---------------------------------------------------------------------------
; AGUARDHIT2 (knocked away)
[Statedef 155]
type    = A
movetype= H
physics = N
anim = 152

[State 155, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 155, 2]
type = VelAdd
trigger1 = 1
y = Const(movement.yaccel)

[State 155, 3]
type = CtrlSet
trigger1 = Time = GetHitVar(ctrltime)
value = 1

[State 155, 4]
type = VarSet
trigger1 = 1
sysvar(0) = (pos y >= 0) && (vel y > 0)

[State 155, 5]
type = VelSet
trigger1 = sysvar(0)
y = 0

[State 155, 6]
type = PosSet
trigger1 = sysvar(0)
y = 0

[State 155, 6]
type = ChangeState
trigger1 = sysvar(0)
trigger1 = command = "holdback" || var(59)
trigger1 = inguarddist
value = 130

[State 155, 7]
type = ChangeState
trigger1 = sysvar(0)
value = 52











;---------------------------------------------------------------------------
; HITA_FALL (knocked up, falling)
[Statedef 5050]
type    = A
movetype= H
physics = N

[State 5050, 1] ;Change anim when done with transition
type = ChangeAnim
trigger1 = AnimTime = 0
trigger1 = Anim = 5035
trigger2 = Time = 0     ;If no transition anim
trigger2 = Anim != 5035
trigger2 = (Anim != [5051, 5059]) && (Anim != [5061, 5069])
trigger2 = Anim != 5090 ;Not if hit off ground anim
value = 5050

[State 5050, 2] ;Coming down anim
type = ChangeAnim
trigger1 = anim = [5050,5059]
trigger1 = Vel Y >= ifelse(anim = 5050, 1, -2)
trigger1 = SelfAnimExist(anim+10)
value = anim+10
persistent = 0

[State 5050, 3] ;Gravity
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 5050, 4]
type = VarSet
trigger1 = Time = 0
var(4) = 0

[State 5050, 4]
type = VarSet
trigger1 = Vel Y > 0
trigger1 = (Vel Y + Pos Y) >= -32
trigger1 = command = "recovery2"||Random < var(59)*200
var(4) = 1

[State 5050, 6]
type = ChangeState
triggerall = CanRecover
trigger1 = Time > 0
trigger1 = Vel Y + Pos Y >= 0
trigger1 = var(4)
trigger1 = Life > 0
value = 5201

[State 5050, 6]
type = ChangeState
trigger1 = Vel Y + Pos Y >= 0
value = 5100 ;HIT_BOUNCE

;---------------------------------------------------------------------------
; HIT_TRIP2 (fall through air)
[Statedef 5071]
type    = A
movetype= H
physics = N

[State 5071, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 5071, 2] ;Acceleration
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 5050, 4]
type = VarSet
trigger1 = Time = 0
var(4) = 0

[State 5050, 4]
type = VarSet
trigger1 = Vel Y > 0
trigger1 = (Vel Y + Pos Y) >= -32
trigger1 = command = "recovery2"||Random < var(59)*200
var(4) = 1

[State 5050, 6]
type = ChangeState
trigger1 = Time > 0
trigger1 = Vel Y + Pos Y >= 0
trigger1 = var(4)
trigger1 = Life > 0
value = 5201

[State 5071, 3] ;Hit ground
trigger1 = Vel Y + Pos Y >= 0
type = ChangeState
value = 5100

;---------------------------------------------------------------------------
; HIT_BOUNCE (hit ground)
[Statedef 5100]
type    = L
movetype= H
physics = N

[State 5100, 1]
type = VelSet
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
trigger1 = vel x > 1
x = 1

[State 5100, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 5100, Var] ;Save fall velocity
type = VarSet
trigger1 = Time = 0
sysvar(1) = floor(vel y)

[State 5100, 2] ;Hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
trigger1 = (anim != [5051,5059]) && (anim != [5061,5069])
trigger2 = !SelfAnimExist(5100 + (anim % 10))
value = 5100

[State 5100, 3] ;Hit ground anim (for hit up)
type = ChangeAnim
trigger1 = time = 0
trigger1 = (anim = [5051,5059]) || (anim = [5061,5069])
trigger1 = SelfAnimExist(5100 + (anim % 10))
value = 5100 + (anim % 10)

[State 5100, 4]
type = PosSet
trigger1 = Time = 0
y = 0

[State 5100, 5]
type = VelSet
trigger1 = Time = 0
y = 0

[State 5100, 6] ;Reduce speed
type = VelMul
trigger1 = Time = 0
x = 0.75

[State 5100, 7]
type = ChangeState
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
value = 5110 ;HIT_LIEDOWN

[State 5100, Explod]
type = Explod
trigger1 = !time && (sysvar(1) >= 14)
anim = 12001+(var(31)*10000)
pos = 0,0
postype = p1  ;p2,front,back,left,right
sprpriority = 2

[State 5100, Explod]
type = Explod
trigger1 = !time && (sysvar(1) >= 14)
anim = 12002+(var(31)*10000)
pos = 0,0
postype = p1  ;p2,front,back,left,right
sprpriority = 0
ownpal = 1

[State 5100, Explod]
type = Explod
trigger1 = !time && (sysvar(1) < 14)
anim = 12000
pos = 0,0
postype = p1  ;p2,front,back,left,right
sprpriority = -4
ownpal = 1

[State 5100, 9]
type = HitFallDamage
trigger1 = Time = 3

[State 5100, 10]
type = PlaySnd
trigger1 = Time = 1
value = S2+(1*10),9

[State 5100, 11]
type = PosFreeze
trigger1 = 1

[State 5100, 12]
type = ChangeState
trigger1 = AnimTime = 0
value = 5101

[State 5100, 13]
type = ForceFeedback
trigger1 = Time = 0
waveform = sinesquare
ampl = 128,-3,-.2,.005
time = 20

;---------------------------------------------------------------------------
; HIT_BOUNCE (bounce into air)
[Statedef 5101]
type    = L
movetype= H
physics = N

[State 5101, 1] ;Coming hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim != [5101,5109]
trigger2 = !SelfAnimExist(5160 + (anim % 10))
value = 5160

[State 5101, 2] ;Coming hit ground anim (for hit up)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim = [5101,5109]
trigger1 = SelfAnimExist(5160 + (anim % 10))
value = 5160 + (anim % 10)

[State 5101, 3]
type = HitFallVel
trigger1 = Time = 0

[State 5101, 4]
type = Null;PosSet
trigger1 = Time = 0
y = 20

[State 5101, 4]
type = VelSet
trigger1 = Time = 0
y = -3

[State 5101, 5] ;Acceleration
type = VelAdd
trigger1 = time > 0
y = gethitvar(yaccel)

[State 5101, 6] ;Hit ground
trigger1 = Pos Y + Vel Y >= 0
type = ChangeState
value = 5110


;---------------------------------------------------------------------------
; HIT_LIEDOWN
[Statedef 5110]
type    = L
movetype= H
physics = N
[State 5110, 0]
type = ChangeState
trigger1 = 1
value = 5111
;---------------------------------------------------------------------------
; HIT_LIEDOWN
[Statedef 5111]
type    = L
movetype= H
physics = N
velset = 0,0

[State 5110, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 5110, 1] ;For hit up/up-diag type (from state 5081)
type = ChangeAnim
persistent = 0
trigger1 = SelfAnimExist(5110 + (anim % 10))
trigger1 = anim = [5081,5089]
value = 5110 + (anim % 10)

[State 5110, 2] ;Hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119] ;Not already changed anim
trigger1 = anim != [5161,5169]
trigger2 = !SelfAnimExist(5170 + (anim % 10))
value = 5170

[State 5110, 3] ;Hit ground anim (for hit up)
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119] ;Not already changed anim
trigger1 = anim = [5161,5169]
trigger1 = SelfAnimExist(5170 + (anim % 10))
value = 5170 + (anim % 10)

[State 5110, 4]
type = HitFallDamage
trigger1 = Time = 0

[State 5110, 5]
type = PosSet
trigger1 = Time = 0
y = 0

[State 5110, Var] ;Get fall velocity
type = VarSet
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) != 0
sysvar(1) = floor(vel y)

[State 5100, 10]
type = PlaySnd
trigger1 = Time = 1
value = S2+(1*10),5
channel = 1

[State 5100, Explod]
type = Explod
trigger1 = !time && (sysvar(1) < 14)
anim = 12000
pos = 0,0
postype = p1  ;p2,front,back,left,right
sprpriority = -4
ownpal = 1

[State 5110, 8]
type = VelSet
trigger1 = Time = 0
y = 0

[State 5110, 9] ;For hit up type
type = ChangeAnim
persistent = 0
triggerall = anim = [5171,5179]
triggerall = SelfAnimExist(5110 + (anim % 10))
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground anim
value = 5110 + (anim % 10)

[State 5110, 10] ;For normal
type = ChangeAnim
persistent = 0
triggerall = Anim != [5111,5119]
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
value = 5110

[State 5110, 11] ;If just died
type = ChangeState
triggerall = !alive
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
trigger3 = Anim = [5110,5119]
value = 5150

[State 5110, 11] ;If just died
type = ChangeState
trigger1 = time = const(data.liedown.time) + 4*(anim=5111||anim=5112)
value = 5120

[State 5110, 12]
type = VarSet
trigger1 = SysVar(0)
trigger1 = Time = 0
sysvar(0) = 0

[State 5110, 13] ;Friction
type = VelMul
trigger1 = 1
x = 0.85

[State 5110, 14]
type = ForceFeedback
trigger1 = alive
trigger1 = Time = 0
time = 8
ampl = 240
waveform = sine

[State 5110, 15]
type = ForceFeedback
trigger1 = !alive
trigger1 = Time = 0
ampl = 200, 7, -.467
time = 30
waveform = sine

;---------------------------------------------------------------------------
; HIT_LIEDEAD
[Statedef 5150]
type    = L
movetype= H
physics = N
sprpriority = -3

[State 5150, 1] ;Normal anim
type = ChangeAnim
triggerall = Time = 0
triggerall = SelfAnimExist(5140)
trigger1 = (anim != [5111,5119]) && (anim != [5171,5179])
trigger2 = !SelfAnimExist(5140 + (anim % 10))
value = 5140

[State 5150, 3] ;Hit up type anim
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (anim = [5111,5119]) || (anim = [5171,5179])
trigger1 = SelfAnimExist(5140 + (anim % 10))
value = 5140 + (anim % 10)

[State 5150, 4] ;Match over anim
type = ChangeAnim
persistent = 0
;trigger1 = Time = 0
trigger1 = MatchOver = 1
trigger1 = Anim = [5140,5149]
trigger1 = SelfAnimExist(anim+10)
value = anim+10

[State 5150, 5] ;Switch to 5110 if liedead anim does not exist
type = ChangeAnim
trigger1 = PrevStateno != 5950
trigger1 = Time = 0
trigger1 = Anim != [5140,5159]
trigger1 = Anim != [5110,5119]
value = 5110

[State 5150, 6] ;Friction
type = VelMul
trigger1 = 1
x = 0.85

[State 5150, 7] ;Friction
type = VelSet
trigger1 = Vel x < .05
persistent = 0
x = 0

[State 5150, 8]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

;---------------------------------------------------------------------------
; HIT_FALLRECOVER (on the ground)
[Statedef 5201]
type    = S
movetype= H
physics = N
anim = 5200

[State 1300, PlaySnd]
type = PlaySND
trigger1 = animelem = 1
value = 5200,0

[State 5201, 1] ;Turn if not facing opponent
type = Turn
trigger1 = Time = 0
trigger1 = p2dist X < -5

[State 5201, 3]
type = PosSet
trigger1 = Time = 0
y = 0

[State 5201, VelSet]
type = VelSet
trigger1 = !time
x =-11.5
y = 0

[State 5201, VelSet]
type = VelSet
trigger1 = time = 1
x = -7.921875

[State 5201, VelMul]
type = VelMul
trigger1 = 1
x = 0.8125

[State 750, Push]
type = PlayerPush
trigger1 = 1
value = 0

[State 5201, 4]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 5201, 6]
type = GameMakeAnim
trigger1 = Time = 1
value = 60
pos = 0, 0
under = 1

[State 705, 1]
type = SelfState
trigger1 = Animtime = 0
value = 0
ctrl = 1


;-----------------
[Statedef 5205]
type= A
physics= N
movetype= H

[State 5205, End]; Sends character back to his own recovery states
type= selfstate
trigger1= 1
value= ifelse(pos y<-20, 5210, 5200)


;---------------------------------------------------------------------------
; HITA_RECOV (recovering in air, not falling)
[Statedef 840]
type    = A
movetype= H
physics = N

[State 5040, 1]
type = SelfState
trigger1 = !Alive
value = 5050
[State 5040, SelfRecover]
type = SelfState
trigger1 = !time
value = 5040

;----------------------------------------------------------------------------------
; Cheap KO
[Statedef 5950]
physics = S
movetype = H
ctrl = 0
velset = 0,0

[State 5950, 1]
type = HitVelSet
trigger1 = Time = 0
x = 2

[State 5950, 4]
type = VelSet
trigger1 = HitOver
x = 0

[State 5950, 4]
type = NotHitBy
trigger1 = 1
value = SCA

[State 5950, 4]
type = ChangeAnim
trigger1 = !HitOver
value = ifElse(FVar(1)=0,5010,5020)

[State 190, 4]
type = ChangeAnim
trigger1 = HitOver
value = 5950
persistent = 0

[State 1100, ChangeState]
type = ChangeState
trigger1 = AnimElem = 7
value = 5150

;===========================================================================
; Guard Crash
;===========================================================================
[Statedef 5700]
type     = S
movetype = H
physics  = N
sprpriority = -1
facep2 = 1

[State 5700, ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 5700

[State 5700, PosSet]
type = PosSet
trigger1 = Time = 0
y = 0

[State 5700, VelSet]
type = VelSet
trigger1 = time = 0
x = -10

[State 5700, VelMul]
type = VelMul
trigger1 = 1
x = .85

[State 5700, SelfState]
type = SelfState
trigger1 = time >= 40
value = 0
ctrl = 1
