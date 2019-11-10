; Common state file for M.U.G.E.N beta 2002.04.14
;
; System variables usage
; ----------------------
; Var name    Type   Purpose
; --------    ----   -------
; sysvar(0)   Temp   Set by state 5081 (HITL_SLIDE) to 1 to prevent
;                    showing ground hit frame in state 5110 (HIT_LIEDOWN).
;                    Used by guarding states.
; sysvar(1)   Temp   Used by state 40 (Jump Start) amd 45 (Air Jump Start)
;                    to keep track of which way to jump.
;                    Used by state 5100 and 5110 to remember downward
;                    velocity of player just before hitting the ground.
;                    Used in state 5080 for storing the anim # to display.

; The following states have special handling within MUGEN, and should be
; overridden with caution:
; Jump Start (40): airjumping bookkeeping at time = 0
; All guard states (120-155): guard handling throughout state
; Hit_trip, shaking (5070): defence increases at time = 0
; Hit_bounce (5100): defence increases at time = 0, player becomes
;                    invincible if within 10 ticks of getting up
; Hit_liedown (5110): player changes to get-up state (5120) when ready
; Hit_getup (5120): player s defence is restored to normal at time = 0
; Hitfall_recover (5200): player s defence is restored at time = 0
; Hitfall_airrecover (5210): player s defence is restored at time = 0

;---------------------------------------------------------------------------
; Stand
[Statedef 0]
type = S
physics = S
sprpriority = 0

[State 0, 1]
type = ChangeAnim
triggerall = !var(21) 
trigger1 = Anim != 0 && Anim != 5
trigger2 = Anim = 5 && AnimTime = 0 ;Turn anim over
value = 0

[State 0, 1]
type = ChangeAnim
triggerall = var(21) 
trigger1 = Anim != 7 && Anim != 5
trigger2 = Anim = 5 && AnimTime = 0 ;Turn anim over
value = 7

[State 0, 2]
type = VelSet
trigger1 = Time = 0
y = 0

[State 0, 3] ;Stop moving if low velocity or 4 ticks pass
type = VelSet
trigger1 = abs(vel x) < 2
trigger2 = Time = 4
x = 0

[State 0, 4]; PosSet + 0 Para evitar errores de posicion
type = PosSet
trigger1 = 1
y = 0

[State 0, PalFX]
type = PalFX
trigger1 = time = 0
time = 1
ignorehitpause = 1

[State 0, AfterImage]
type = AfterImage
trigger1 = time = 0
time = 1
ignorehitpause = 1

[State 0, 3] ;Stop moving if low velocity or 4 ticks pass
type = VelSet
trigger1 = abs(vel x) < Const(movement.stand.friction.threshold)
trigger2 = Time = 4
x = 0

[State 0, 5] ;Are you dead?
type = ChangeState
trigger1 = !alive
value = 5050

;---------------------------------------------------------------------------
; Stand to Crouch
[Statedef 10]
type    = C
physics = C
anim = 10
facep2 = 1

[State 10, 1]
type = VelMul
trigger1 = Time = 0
x = .75

[State 10, 2] ;Stop moving if low velocity
type = VelSet
trigger1 = abs(vel x) < Const(movement.crouch.friction.threshold)
x = 0

[State 10, 2]; PosSet + 0 Para evitar errores de posicion
type = PosSet
trigger1 = 1
y = 0

[State 10, PalFX]
type = PalFX
trigger1 = time = 0
time = 1
ignorehitpause = 1

[State 10, AfterImage]
type = AfterImage
trigger1 = time = 0
time = 1
ignorehitpause = 1

[State 1000, HitBy]
type = HitBy
trigger1 = time = 0
value = SC, NT, ST, HT
time = 2

[State 10, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 11

;---------------------------------------------------------------------------
; Crouching
[Statedef 11]
type    = C
physics = C
anim = 11
sprpriority = 0

[State 0, 1]; PosSet + 0 Para evitar errores de posicion
type = PosSet
trigger1 = 1
y = 0

[State 10, PalFX]
type = PalFX
trigger1 = time = 0
time = 1
ignorehitpause = 1

[State 10, AfterImage]
type = AfterImage
trigger1 = time = 0
time = 1
ignorehitpause = 1

[State 11, 2] ;Stop moving if low velocity
type = VelSet
trigger1 = abs(vel x) < Const(movement.crouch.friction.threshold)
x = 0

[State 11, 3] ;Change from turning animation
type = ChangeAnim
trigger1 = Anim = 6 && AnimTime = 0
value = 11

;---------------------------------------------------------------------------
; Crouch to Stand
[Statedef 12]
type    = S
physics = S
anim = 12

[State 12, 1]; PosSet + 0 Para evitar errores de posicion
type = PosSet
trigger1 = 1
y = 0

[State 12, PalFX]
type = PalFX
trigger1 = time = 0
time = 1
ignorehitpause = 1

[State 12, AfterImage]
type = AfterImage
trigger1 = time = 0
time = 1
ignorehitpause = 1

[State 12, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0

;---------------------------------------------------------------------------
; Walk
[Statedef 20]
type    = S
physics = S
sprpriority = 0

[State 40]
type = changeState
trigger1 = time = 0
trigger1 = var(59)
value = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = 1
trigger1 = gametime%18 = 0
value = S3500,4

[State 0, 0]; PosSet + 0 Para evitar errores de posicion
type = PosSet
trigger1 = 1
y = 0

[State 20, 1]
type = VelSet
trigger1 = command = "holdfwd"
x = const(velocity.walk.fwd.x)

[State 20, 2]
type = VelSet
trigger1 = command = "holdback"
x = const(velocity.walk.back.x)

[State 20, PalFX]
type = PalFX
trigger1 = time = 0
time = 1
ignorehitpause = 1

[State 20, AfterImage]
type = AfterImage
trigger1 = time = 0
time = 1
ignorehitpause = 1

[State 20, NotHitBy]
type = NotHitBy
trigger1 = time = 0
value = SCA
time = 1

[State 20, VarSet]
type = VarSet
triggerall = prevstateno = 151
trigger1 = !time
v = 49
value = 10

[State 20, 3]
type = ChangeAnim
triggerall = vel x > 0
trigger1 = Anim != 20
trigger2 = Anim = 5
value = 20

[State 20, 4]
type = ChangeAnim
triggerall = vel x < 0
trigger1 = Anim != 21
trigger2 = Anim = 5
value = 21
;---------------------------------------------------------------------------
; Jump Start
[Statedef 40]
type    = S
physics = S
anim = 40
ctrl = 0
sprpriority = 1
facep2 = 1

[State 40, 1]
type = VarSet
trigger1 = Time = 0
sysvar(1) = 0

[State 40, 2]
type = VarSet
trigger1 = command = "holdfwd"
sysvar(1) = 1

[State 40, 3]
type = VarSet
trigger1 = command = "holdback"
sysvar(1) = -1

[State 40, 4]
type = VelSet
trigger1 = AnimTime = 0
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, 5]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = prevstateno = 100 ;RUN_FWD
trigger1 = sysvar(1) = 1
x = const(velocity.runjump.fwd.x)

[State 120, 5] ;Can t be thrown right after getting up
type = NotHitBy
trigger1 = time >= 0
value = , NT,ST,HT

[State 40, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1
;---------------------------------------------------------------------------
; Jump Up
[Statedef 50]
type    = A
physics = A

[State 50, 1]
type = VarSet
trigger1 = Time = 0
sysvar(1) = 0

[State 50, 2]
type = ChangeAnim
trigger1 = Time = 0
value = ifelse((vel x)=0, 41, ifelse((vel x)>0, 42, 43))

[State 50, 3]
type = ChangeAnim
trigger1 = Vel y > -2
trigger1 = SelfAnimExist(anim + 3)
persistent = 0
value = Anim + 3
;---------------------------------------------------------------------------
; Jump Down (empty state for compatibility)
[Statedef 51]
type    = A
physics = A

[State 51, 1]
type = Null
trigger1 = 1

;---------------------------------------------------------------------------
; Jump Land
[Statedef 52]
type    = S
physics = S
anim    = 47
ctrl    = 0
velset  = 0,0
;facep2  = 1

[State 52, VarSet]
type = VarSet
trigger1 = Time = 0
sysvar(3) = 0

[State 52, VarSet]
type = VarSet
trigger1 = prevstateno = 155 || prevstateno = 5040
sysvar(3) = 1

[State 52, ChangeState]
type = ChangeState
trigger1 = Time = 0
value = 53

;---------------------------------------------------------------------------
; Jump Land
[Statedef 53]
type    = S
physics = S
ctrl = 0
anim = 47

[State 53]
type = NotHitBy
trigger1 = 1
value = SCA,NT,HT

[State 52, ChangeAnim]
type = ChangeAnim
trigger1 = sysvar(3) != 1
trigger1 = Time = 0
trigger1 = p2dist x < 0
value = Anim+1

[State 52, Turn]
type = Turn
trigger1 = sysvar(3) != 1
trigger1 = Time = 0
trigger1 = p2dist x < 0

[State 52, NotHitBy]
type = NotHitBy
trigger1 = sysvar(3) = 1
value = SCA
time = 2

[State 52, 1]
type = VelSet
trigger1 = time = 0
y = 0
x = 0

[State 52, 2]
type = PosSet
trigger1 = time = 0
y = 0

[State 52, 3]
type = changestate
triggerall = var(59) = 0
trigger1 = time = 4 && command = "holdup"
value = 40
ctrl = 0

[State 52, CtrlSet]
type = CtrlSet
triggerall = var(59) = 0
triggerall = command != "holdup"
trigger1 = time = 0
value = 1

[State 52, 4]
type = VelSet
trigger1 = abs(vel x) < Const(movement.stand.friction.threshold)
x = 0

[state 52, CtrlSet]
type = CtrlSet
trigger1 = sysvar(3) != 1
trigger1 = time = 0
value = 1

[State 52, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 48
trigger1 = AnimTime = 0
value = 5

[State 52, ChangeState]
type = ChangeState
trigger1 = Anim != 48
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;---------------------------------------------------------------------------
; RUN_FWD
[Statedef 100]
type    = S
physics = S
anim = 100
sprpriority = 1

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

[State 0, 4]; PosSet + 0 Para evitar errores de posicion
type = PosSet
trigger1 = 1
y = 0

[State 100, 4]
type = ChangeState
trigger1 = command != "holdfwd"
value = 0
ctrl = 1
;---------------------------------------------------------------------------
; RUN_BACK
[Statedef 105]
type    = A
physics = A
ctrl = 0
anim = 105
sprpriority = 1

[State 105, 1]
type = VelSet
trigger1 = Time = 0
x = const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 105, 2]
type = CtrlSet
trigger1 = Time = 2
value = 1

[State 105, 3]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 106

;---------------------------------------------------------------------------
; RUN_BACK2 (land)
[Statedef 106]
type    = S
physics = S
ctrl = 0
anim = 47

[State 106, 1]
type = VelSet
trigger1 = Time = 0
y = 0

[State 106, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 106, 3]
type = MakeDust
trigger1 = Time = 2
pos = 0, 0
spacing = 1

[State 106, 4]
type = VelSet
trigger1 = abs(vel x) < Const(movement.stand.friction.threshold)
x = 0

[State 106, 4]
type = ChangeState
trigger1 = Time = 7
value = 0
ctrl = 1
;---------------------------------------------------------------------------
; GUARD (start)
[Statedef 120]
type = U    ;Leave state type unchanged
physics = U ;Leave physics unchanged

[State 120]
type = velset
trigger1 = time = 0
trigger1 = StateType != A
x = 0

[State 120, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 120 + (statetype = C) + (statetype = A)*2

[state 120, Turn]
type = Turn
trigger1 = var(59) = 1 && ctrl = 0
trigger1 = StateType = S || StateType = C
trigger1 = teammode = single || teammode = turns
trigger1 = p2dist x < 0

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
TriggerAll = statetype = S
trigger1 = var(59) = 0
trigger1 = statetype = S && command = "holddown"
trigger2 = var(59) 
trigger2 = helper(33000),var(11) != 2
trigger2 = EnemyNear,StateType != A
trigger2 = EnemyNear,MoveType = A
trigger2 = helper(33000),var(11) = 1 || EnemyNear,StateType = C || EnemyNear,AnimTime >= -20 || EnemyNear,NumProj || PlayerIdExist(helper(33333333),var(3)) 
trigger3 = var(59)
trigger3 = EnemyNear,MoveType = A
trigger3 = EnemyNear,StateType != A
trigger3 = EnemyNear,AnimTime >= -20
statetype = C
physics = C
IgnoreHitPause = 1

[State 120, Lo to Hi]
type = StateTypeSet
TriggerAll = StateType = C
trigger1 = var(59) = 0
trigger1 = statetype = C && command != "holddown"
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
statetype = S
physics = S
IgnoreHitPause = 1

[State AI fix]
type = ctrlset
trigger1 = var(59) && numenemy
value = (enemynear, time >= 120 || time >= 180)

[State 120, 5]
type = ChangeState
trigger1 = Time = 0 ;AnimTime = 0
value = 130 + (statetype = C) + (statetype = A)*2
IgnoreHitPause = 1

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
trigger6 = P2BodyDist x < 35
trigger6 = enemynear,time < helper(33000),var(3) - 3 ;一般最快的普通技是4f就这么写。    
trigger6 = enemy,teammode != simul ;双人战不记录
trigger6 = !EnemyNear,NumProj && !PlayerIdExist(helper(33333333),var(3))

trigger7 = !EnemyNear,NumProj && !PlayerIdExist(helper(33333333),var(3))
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
; Stand guard (guarding)
[Statedef 130]
type    = S
physics = S

[State 130, 1]
type = ChangeAnim
trigger1 = Anim != 130
value = 130

[state 120, Turn]
type = Turn
trigger1 = var(59) = 1 && ctrl = 0
trigger1 = StateType = S || StateType = C
trigger1 = teammode = single || teammode = turns
trigger1 = p2dist x < 0

[State AI fix]
type = ctrlset
trigger1 = var(59) && numenemy
value = (enemynear, time >= 120 || time >= 180)

[State 130, Hi to Lo]
type = ChangeState
TriggerAll = StateType = S
trigger1 = var(59) = 0
trigger1 = command = "holddown"
trigger2 = var(59) 
trigger2 = helper(33000),var(11) != 2
trigger2 = EnemyNear,StateType != A
trigger2 = EnemyNear,MoveType = A
trigger2 = helper(33000),var(11) = 1 || EnemyNear,StateType = C || EnemyNear,AnimTime >= -20 || EnemyNear,NumProj || PlayerIdExist(helper(33333333),var(3))
trigger3 = var(59)
trigger3 = helper(33000),var(11) != 2
trigger3 = EnemyNear,MoveType = A
trigger3 = EnemyNear,StateType != A
trigger3 = EnemyNear,AnimTime >= -20
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

trigger5 = !EnemyNear,NumProj && !PlayerIdExist(helper(33333333),var(3))
trigger5 = numhelper(33000)
trigger5 = P2BodyDist x < 35
trigger5 = enemynear,stateno = helper(33000),var(2)
trigger5 = enemynear,time < helper(33000),var(3) - 3 ;一般最快的普通技是4f就这么写。    
trigger5 = enemy,teammode != simul ;双人战不记录

trigger6 = !EnemyNear,NumProj && !PlayerIdExist(helper(33333333),var(3))
trigger6 = numhelper(33000)
trigger6 = helper(33000),var(1) > 1 ;对手判定已经过了，写 > 1比较保险。
trigger6 = time > 3 || enemynear,animtime >= -5 ;3F用来多段技警戒。而对手animtime >= -5的时候已经接近收招了，通常不会残余判定。
trigger6 = random <= 60*var(59) ;有些招持续时间还是很长的，必须加一个random保险。
trigger6 = enemy,teammode != simul ;双人战撤防很危险
trigger6 = enemynear,statetype != A || prevstateno = [150,159] ;空中攻击通常持续时间很长，但防御过后一般可以认为判定已经过去了。
trigger6 = prevstateno != 5120 || random%10 = 0 ;起身时少乱动，虽然也有可能中奖。
value = 140

;---------------------------------------------------------------------------
; Crouch guard (guarding)
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

[State AI fix]
type = ctrlset
trigger1 = var(59) && numenemy
value = (enemynear, time >= 120 || time >= 180)

[State 131, Lo to Hi]
type = ChangeState
TriggerAll = StateType = C
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
trigger3 = EnemyNear,MoveType = A
trigger3 = EnemyNear,StateType != C
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

trigger5 = !EnemyNear,NumProj && !PlayerIdExist(helper(33333333),var(3))
trigger5 = P2BodyDist x < 35
trigger5 = numhelper(33000)
trigger5 = enemynear,stateno = helper(33000),var(2)
trigger5 = enemynear,time < helper(33000),var(3) - 3 ;一般最快的普通技是4f就这么写。    
trigger5 = enemy,teammode != simul ;双人战不记录

trigger6 = !EnemyNear,NumProj && !PlayerIdExist(helper(33333333),var(3))
trigger6 = numhelper(33000)
trigger6 = helper(33000),var(1) > 1 ;对手判定已经过了，写 > 1比较保险。
trigger6 = time > 3 || enemynear,animtime >= -5 ;3F用来多段技警戒。而对手animtime >= -5的时候已经接近收招了，通常不会残余判定。
trigger6 = random <= 60*var(59) ;有些招持续时间还是很长的，必须加一个random保险。
trigger6 = enemy,teammode != simul ;双人战撤防很危险
trigger6 = enemynear,statetype != A || prevstateno = [150,159] ;空中攻击通常持续时间很长，但防御过后一般可以认为判定已经过去了。
trigger6 = prevstateno != 5120 || random%10 = 0 ;起身时少乱动，虽然也有可能中奖。
value = 140

;---------------------------------------------------------------------------
; Air guard (guarding)
[Statedef 132]
type    = A
physics = N

[State 132, 1]
type = ChangeAnim
trigger1 = Anim != 132
value = 132

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

[State AI fix]
type = ctrlset
trigger1 = var(59) && numenemy
value = (enemynear, time >= 120 || time >= 180)

[State 132, 6]
type = ChangeState
trigger1 = sysvar(0)
trigger1 = (var(59) = 0 && command = "holdback") || var(59)
trigger1 = inguarddist
value = 130

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
;AI helper带的撤防
trigger4 = numhelper(33000)
trigger4 = helper(33000),var(11) = [3,5] ;空中的话，直接写helper(33000),var(11) = [3,5]

trigger5 = !EnemyNear,NumProj && !PlayerIdExist(helper(33333333),var(3))
trigger5 = numhelper(33000)
trigger5 = enemynear,stateno = helper(33000),var(2)
trigger5 = enemynear,time < helper(33000),var(3) - 5 ;一般最快的普通技是4f就这么写。    
trigger5 = enemy,teammode != simul ;双人战不记录

trigger6 = !EnemyNear,NumProj && !PlayerIdExist(helper(33333333),var(3))
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
; Guard (end)
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
TriggerAll = StateType = S
trigger1 = var(59) = 0
trigger1 = statetype = S && command = "holddown"
trigger2 = var(59) 
trigger2 = helper(33000),var(11) != 2
trigger2 = EnemyNear,MoveType = A
trigger2 = EnemyNear,StateType != A
trigger2 = helper(33000),var(11) = 1 || EnemyNear,StateType = C || EnemyNear,AnimTime >= -20 || EnemyNear,NumProj || PlayerIdExist(helper(33333333),var(3))
trigger3 = var(59)
trigger3 = EnemyNear,MoveType = A
trigger3 = EnemyNear,StateType != A
trigger3 = EnemyNear,AnimTime >= -20
statetype = C
physics = C
IgnoreHitPause = 1

[State 140, Lo to Hi]
type = StateTypeSet
TriggerAll = StateType = C
trigger1 = var(59) = 0
trigger1 = statetype = C && command != "holddown"
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
statetype = S
physics = S
IgnoreHitPause = 1

;[State 140, 5] ;Implemented within engine
;type = ChangeState
;trigger1 = AnimTime = 0
;value = (statetype = C)*11 + (statetype = A)*51

;---------------------------------------------------------------------------
; Stand guard hit (shaking)
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
trigger2 = EnemyNear,MoveType = A
trigger2 = EnemyNear,StateType != A
trigger2 = helper(33000),var(11) = 1 || EnemyNear,StateType = C || EnemyNear,AnimTime >= -20 || EnemyNear,NumProj || PlayerIdExist(helper(33333333),var(3))
trigger3 = var(59)
trigger3 = EnemyNear,MoveType = A
trigger3 = EnemyNear,StateType != A
trigger3 = EnemyNear,AnimTime >= -20
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
statetype = S
physics = S
IgnoreHitPause = 1

[State 150, 3]
type = ForceFeedback
trigger1 = time = 0
waveform = square
time = 3

;---------------------------------------------------------------------------
; Stand guard hit (knocked back)
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
trigger1 = Time = GetHitvar(slidetime)
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
trigger2 = EnemyNear,MoveType = A
trigger2 = EnemyNear,StateType != A
trigger2 = helper(33000),var(11) = 1 || EnemyNear,StateType = C || EnemyNear,AnimTime >= -20 || EnemyNear,NumProj || PlayerIdExist(helper(33333333),var(3))
trigger3 = var(59)
trigger3 = EnemyNear,MoveType = A
trigger3 = EnemyNear,StateType != A
trigger3 = EnemyNear,AnimTime >= -20
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
; Crouch guard hit (shaking)
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
trigger2 = EnemyNear,MoveType = A
trigger2 = EnemyNear,StateType != A
trigger2 = helper(33000),var(11) = 1 || EnemyNear,StateType = C || EnemyNear,AnimTime >= -20 || EnemyNear,NumProj || PlayerIdExist(helper(33333333),var(3))
trigger3 = var(59)
trigger3 = EnemyNear,MoveType = A
trigger3 = EnemyNear,StateType != A
trigger3 = EnemyNear,AnimTime >= -20
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
statetype = S
physics = S
IgnoreHitPause = 1

[State 152, 4]
type = ForceFeedback
trigger1 = time = 0
waveform = square
time = 4

;---------------------------------------------------------------------------
; Crouch guard hit (knocked back)
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
trigger2 = EnemyNear,MoveType = A
trigger2 = EnemyNear,StateType != A
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
trigger2 = EnemyNear,StateType != C
trigger2 = EnemyNear,MoveType = A 
trigger2 = helper(33000),var(11) = 2 || EnemyNear,StateType = A 
;
trigger3 = var(59)
trigger3 = !EnemyNear,NumProj
trigger3 = !PlayerIdExist(helper(33333333),var(3))
trigger3 = EnemyNear,MoveType = A
trigger3 = EnemyNear,StateType != C
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
; Air guard hit (shaking)
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
; Air guard hit (knocked away)
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
trigger1 = command = "holdback"  || var(59)
trigger1 = inguarddist
value = 130

[State 155, 7]
type = ChangeState
trigger1 = sysvar(0)
value = 52

;---------------------------------------------------------------------------
; LOSE (Time over)
[Statedef 170]
type = S
ctrl = 0
anim = 170
velset = 0,0

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

;---------------------------------------------------------------------------
; Draw game (time over)
[Statedef 175]
type = S
ctrl = 0
velset = 0,0

[State 175, 1] ; If no anim, use go to lose state.
type = ChangeState
trigger1 = Time = 0
trigger1 = !SelfAnimExist(175)
value = 170

[State 175, 2]
type = ChangeAnim
trigger1 = Time = 0
value = 175

[State 175, 3]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1
;---------------------------------------------------------------------------
; PREINTRO
[Statedef 190]
type = S
ctrl = 0
velset = 0,0

[State 190, 1]
type = ChangeAnim
trigger1 = SelfAnimExist(190)
value = 190

[State 190, 2] ;Go straight to intro.
type = ChangeState
trigger1 = Time = 0
value = 191

;---------------------------------------------------------------------------
; INTRO (override this state to give character an intro)
[Statedef 191]
type = S
ctrl = 0

[State 191, 1]
type = ChangeState
trigger1 = Time = 0
value = 0

;---------------------------------------------------------------------------
; HITG_SHAKE
[Statedef 5000]
type    = S
movetype= H
physics = N
velset = 0,0

[State 5000, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = ifelse((GetHitVar(groundtype) = 1),5000,5010) + GetHitVar(animtype)

[State 5000, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030

[State 5000, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047 + GetHitVar(animtype) ;5051 - 4 + type

[State 5000, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 5000, 5] ;State type gets set to aerial if getting hit up
type = StateTypeSet
trigger1 = Time = 0
trigger1 = GetHitVar(yvel) != 0 || GetHitVar(fall)
trigger2 = Pos Y != 0
statetype = a

[State 5000, FFB Light]
type = ForceFeedback
trigger1 = anim = 5000
trigger2 = anim = 5010
persistent = 0
time = 6
waveform = square

[State 5000, FFB Medium]
type = ForceFeedback
trigger1 = anim = 5001
trigger2 = anim = 5011
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 5000, FFB Hard]
type = ForceFeedback
trigger1 = anim = 5012
trigger2 = anim = 5002
trigger3 = anim = 5030
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

[State 5000, 6]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) = 0 && !GetHitVar(fall)
value = 5001 ;Stand get-hit (knocked back)

[State 5000, 7]
type = ChangeState
trigger1 = HitShakeOver
value = 5030
;---------------------------------------------------------------------------
; HITG_SLIDE
[Statedef 5001]
type    = S
movetype= H
physics = S

[State 5001, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 5001, 2]
type = ChangeAnim
trigger1 = AnimTime = 0
value = 5005 + GetHitVar(animtype) + (GetHitVar(groundtype)=2)*10

[State 5001, 3] ;Stop sliding back
type = VelMul
trigger1 = Time >= GetHitVar(slidetime)
x = .6

[State 5001, 4]
type = VelSet
trigger1 = HitOver
x = 0

[State 5001, 5]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 5001, VarSet]
type = VarSet
trigger1 = HitOver
v = 49
value = 10

[State 5001, 7]
type = ChangeState
trigger1 = HitOver
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; HITC_SHAKE
[Statedef 5010]
type    = C
movetype= H
physics = N
velset = 0,0

[State 5010, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = 5020 + GetHitVar(animtype)

[State 5010, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030

[State 5010, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047 + GetHitVar(animtype) ;5051 - 4 + type

[State 5010, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 5010, 5] ;State type gets set to aerial if getting hit up
type = StateTypeSet
triggerall = Time = 0
trigger1 = GetHitVar(yvel) != 0 || GetHitVar(fall)
trigger2 = Pos Y != 0
statetype = a

[State 5010, 6]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) = 0 && !GetHitVar(fall)
value = 5011 ;HITC_SLIDE

[State 5010, 7]
type = ChangeState
trigger1 = HitShakeOver
value = 5030

[State 5010, FFB Light]
type = ForceFeedback
trigger1 = anim = 5020
persistent = 0
time = 6
waveform = square

[State 5010, FFB Medium]
type = ForceFeedback
trigger1 = anim = 5021
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 5010, FFB Hard]
type = ForceFeedback
trigger1 = anim = 5022
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

;---------------------------------------------------------------------------
; HITC_SLIDE
[Statedef 5011]
type    = C
movetype= H
physics = C

[State 5011, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 5011, 2]
type = ChangeAnim
trigger1 = AnimTime = 0
value = 5025 + GetHitVar(animtype)

[State 5011, 3] ;Stop sliding back
type = VelMul
trigger1 = Time >= GetHitVar(slidetime)
x = .6

[State 5011, 4]
type = VelSet
trigger1 = HitOver
x = 0

[State 5011, 5]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 5011, VarSet]
type = VarSet
trigger1 = HitOver
v = 49
value = 10

[State 5011, 6]
type = ChangeState
trigger1 = HitOver
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Air get-hit (shaking)
[Statedef 5020]
type    = A
movetype= H
physics = N
velset = 0,0

[State 5020, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = ifelse((GetHitVar(airtype) = 1),5000,5010) + GetHitVar(animtype)

[State 5020, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030

[State 5020, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047 + GetHitVar(animtype) ;5051 - 4 + type

[State 5020, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 5020, 5]
type = ChangeState
trigger1 = HitShakeOver
value = 5030

[State 5020, FFB Light]
type = ForceFeedback
trigger1 = anim = 5000
trigger2 = anim = 5010
persistent = 0
time = 6
waveform = square

[State 5020, FFB Medium]
type = ForceFeedback
trigger1 = anim = 5001
trigger2 = anim = 5011
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 5020, FFB Hard]
type = ForceFeedback
trigger1 = anim = 5012
trigger2 = anim = 5002
trigger3 = anim = 5030
trigger4 = anim = [5051,5059]
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

;---------------------------------------------------------------------------
; Air get-hit (knocked away)
[Statedef 5030]
type    = A
movetype= H
physics = N
ctrl = 0

[State 5030, 1]
type = ChangeAnim
trigger1 = Anim != [5000, 5199]
trigger1 = SelfAnimExist(5030)
value = 5030

[State 5030, 1]
type = VelAdd;Gravity
trigger1 = 1
y = GetHitVar(yaccel)

[State 5030, 2]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 5030, 5]
type = ChangeState
triggerall = anim = 5052
trigger1 = AnimTime = 0
value = 5055 ;HITA_UP (transition)

[State 5030, 3]
type = ChangeState
triggerall = anim != 5052
triggerall = !HitFall
trigger1 = HitOver
trigger2 = Vel Y > 0    ;Hit ground
trigger2 = Pos Y >= 10  ;.
value = 5040 ;HITA_RECOV

[State 5030, 4]
type = ChangeState
triggerall = anim != 5052
triggerall = HitFall
trigger1 = HitOver
trigger2 = Vel Y > 0    ;Hit ground
trigger2 = Pos Y >= 10  ;.
value = 5050 ;HITA_FALL

[State 5030, 5]
type = ChangeState
triggerall = anim != 5052
trigger1 = AnimTime = 0
value = 5035 ;HITA_UP (transition)
;---------------------------------------------------------------------------
; HITA_FALL (knocked up, falling)
[Statedef 5055]
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

[State 5050, recovery]
type = SelfState
triggerall = command = "recovery"
triggerall = alive = 1
trigger1 = pos y > 0
trigger1 = vel y > 0
value = 5201 ;HITFALL_RECOVER

[State 5050, 6]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= ifelse((anim = [5051,5059]) || (anim = [5061,5069]), 0, 25)
value = 5105 ;HIT_BOUNCE

;---------------------------------------------------------------------------
; HIT_BOUNCE (hit ground)
[Statedef 5105]
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

[State 5100, 8]
type = GameMakeAnim
trigger1 = Time = 1
value = 60 + (sysvar(1) > 5)
pos = 0, 0
under = sysvar(0) <= 5

[State 5100, PalFX]
type = PalFX
trigger1 = time = 0
time = 1

[State 5100, Helper]
type = Helper
trigger1 = Time = 0
trigger1 = (sysvar(1) > 14)
helpertype = normal
name = "Crater"
ID = 51000
stateno = 51000
pos = 0,0
postype = p1
facing = 1

[State 1000, LifeAdd]
type = LifeAdd
trigger1 = (sysvar(1) > 14)
trigger1 = Timemod = 3,0
value = -25
kill = 1

[State 5100, 11]
type = HitFallDamage
trigger1 = Time = 3

[State 5000, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = f7,ifelse(Stagevar(Info.name)!="Boss",1,7)
volumescale = 50

[State 5100, 13]
type = PosFreeze
trigger1 = 1

[State 5100, 14]
type = ChangeState
trigger1 = time = 5
value = 5102

[State 5105, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 5100, 15]
type = ForceFeedback
trigger1 = Time = 0
waveform = sinesquare
ampl = 128,-3,-.2,.005
time = 20

;---------------------------------------------------------------------------
; HIT_BOUNCE (bounce into air)
[Statedef 5102]
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
type = PosSet
trigger1 = Time = 0
y = 10

[State 5101, 5] ;Acceleration
type = Velset
triggerall = (sysvar(1) > 14)
trigger1 = time = 0
y = -9

[State 5101, 5] ;Acceleration
type = VelAdd
trigger1 = 1
y = .8

[State 5102, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 5101, 6] ;Hit ground
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 12
value = 5103
;-------------------------------------------------------------------------------
[Statedef 5103]
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

[State 5100, 11]
type = HitFallDamage
trigger1 = Time = 3

[State 5100, 13]
type = PosFreeze
trigger1 = 1

[State 5100, 15]
type = ForceFeedback
trigger1 = Time = 0
waveform = sinesquare
ampl = 128,-3,-.2,.005
time = 20

[State 5000, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = f7,ifelse(Stagevar(Info.name)!="Boss",1,7)
volumescale = 50

[State 5100, 8]
type = GameMakeAnim
trigger1 = Time = 1
value = 60 + (sysvar(1) > 5)
pos = 0, 0
under = sysvar(0) <= 5

[State 5100, 1]
type = changeanim
trigger1 = Time = 0 && selfanimexist(5111)
value = 5111

[State 5100, 1]
type = changeanim
trigger1 = Time = 0 && selfanimexist(5112)
value = 5112

[State 5100, 1]
type = changeanim
trigger1 = Time = 0 && selfanimexist(5113)
value = 5113

[State 5100, 1]
type = changeanim
trigger1 = Time = 0
trigger1 = !selfanimexist(5111)
trigger1 = !selfanimexist(5112)
trigger1 = !selfanimexist(5113)
value = 5110

[State 5103, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 1000, ChangeState]
type = ChangeState
trigger1 = time = 4
value = 5460
;---------------------------------------------------------------------------
; HITA_UP_T (transition)
[Statedef 5035]
type    = A
movetype= H
physics = N

[State 5035, 1]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = SelfAnimExist(5035)
trigger1 = Anim != [5051,5059] ;Not if in hit up anim
trigger1 = Anim != 5090 ;Not if hit off ground anim
value = 5035

[State 5035, 2]
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 5035, 3]
type = ChangeState
triggerall = !HitFall
trigger1 = HitOver  ;Hit is over
trigger2 = AnimTime = 0 ;Animation over
trigger3 = Vel Y > 0    ;Hit ground
trigger3 = Pos Y >= Const(movement.air.gethit.groundlevel)
trigger4 = Time = 0     ;No transition anim
trigger4 = Anim != 5035 ;.
value = 5040 ;Air get-hit (recovering in air, not falling)

[State 5035, 4]
type = ChangeState
triggerall = HitFall
trigger1 = HitOver  ;Hit is over
trigger2 = AnimTime = 0 ;Anim is over
trigger3 = Vel Y > 0    ;Hit ground
trigger3 = Pos Y >= Const(movement.air.gethit.groundlevel)
trigger4 = Time = 0     ;No transition anim
trigger4 = Anim != 5035 ;.
value = 5050 ;Air get-hit (falling)

;---------------------------------------------------------------------------
; HITA_RECOV (recovering in air, not falling)
[Statedef 5040]
type    = A
movetype= H
physics = N

[State 5040, PalFX]
type = PalFX
trigger1 = !time
time = 1

[State 5040, 1]
type = ChangeState
trigger1 = !Alive
value = 5050
ctrl = 0

[State 5040, 2]
type = ChangeAnim
trigger1 = AnimTime = 0
trigger1 = Anim != 5040
trigger2 = Time = 0
trigger2 = Anim != 5035
value = 5040

[State 5040, 5]
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

;[State 5040, 3]
;type = CtrlSet
;trigger1 = HitOver
;value = 1

[State 5040, 4]
type = StateTypeSet
trigger1 = HitOver
movetype = I

[State 1000, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 5120, 5] ;Can t be thrown right after getting up
type = NotHitBy
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value2 = SCA
time = 1

[State 5120, Turn]
type = Turn
trigger1 = Pos Y >= 0
trigger1 = P2Dist X < 0

[State 5040, 6]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 52 ;JUMPLAND

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
trigger1 = Vel Y >= ifelse(anim = 5050, Const720p(4), Const720p(-8))
trigger1 = SelfAnimExist(anim+10)
value = anim+10
persistent = 0

[State 5050, 3] ;Gravity
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

;[State 5050, recovery]
;type = SelfState
;triggerall = command = "recovery"
;triggerall = alive = 1
;trigger1 = pos y > 0
;trigger1 = vel y > 0
;value = 5201 ;HITFALL_RECOVER

[State 5050, 6]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= ifelse((anim = [5051,5059]) || (anim = [5061,5069]), 0, 25)
value = 5100 ;HIT_BOUNCE

;---------------------------------------------------------------------------
; HIT_TRIP (shaking)
[Statedef 5070]
type    = A
movetype= H
physics = N
velset = 0,0

[State 1000, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 5070, 1]
type = ChangeAnim 
trigger1 = 1
value = 5070

[State 5070, 2]
type = ChangeState
trigger1 = HitShakeOver
value = 5071

[State 5070, 3]
type = ForceFeedback
trigger1 = time = 0
time = 12
waveform = sinesquare
ampl = 140

;---------------------------------------------------------------------------
; HIT_TRIP2 (fall through air)
[Statedef 5071]
type    = A
movetype= H
physics = N

[State 1000, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 5071, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 5071, 2] ;Acceleration
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 5071, recovery]
type = SelfState
triggerall = command = "recovery"
triggerall = alive = 1
trigger1 = pos y > 0
trigger1 = vel y > 0
value = 5201 ;HITFALL_RECOVER

[State 5071, 3] ;Hit ground
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 15
type = ChangeState
value = 5100

;---------------------------------------------------------------------------
; Downed get-hit (shaking)
[Statedef 5080]
type    = L
movetype= H
physics = N
velset = 0,0

[State 5080, 1] ;Set default anim
type = VarSet
trigger1 = time = 0
sysvar(2) = ifelse (GetHitVar(yvel) = 0, 5080, 5090)

[State 5080, 2]
type = VarAdd
trigger1 = time = 0
trigger1 = (anim = [5081,5089]) || (anim = [5111,5119])
trigger1 = SelfAnimExist(sysvar(2) + (anim % 10))
sysvar(2) = anim % 10

[State 5080, 3] ;If 5090 doesn t exist, default to 5030
type = VarSet
trigger1 = time = 0
trigger1 = sysvar(2) = 5090
trigger1 = !SelfAnimExist(5090)
sysvar(2) = 5030

[State 5080, 3] ;Freeze
type = ChangeAnim
trigger1 = 1
value = sysvar(2)

[State 5080, 4]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) = 0
value = 5081 ;HITL_SLIDE

[State 5080, 5]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) != 0
value = 5030 ;HITA_UP

;---------------------------------------------------------------------------
; Downed get-hit (knocked back)
[Statedef 5081]
type    = L
movetype= H
physics = C

[State 5081, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 5081, 2]
type = VelSet
trigger1 = HitOver
x = 0

[State 5081, 3] ;Don t show hit ground frame
type = VarSet
trigger1 = Time = 0
sysvar(0) = 1

[State 5081, 4]
type = ChangeState
trigger1 = HitOver
value = 5110 ;HIT_LIEDOWN

;---------------------------------------------------------------------------
; Downed get-hit (hit ground from fall)
[Statedef 5100]
type    = L
movetype= H
physics = N

[State 30000, p2超重落地音效]
type = PlaySnd
TriggerAll        = Time = 0
TriggerAll        = Alive
Trigger1          = GetHitVar(YVel) < 7
Trigger2          = GETHITVAR(YACCEL) < 0.525
value = S3500,2

[State 30000, p2超重落地音效]
type = PlaySnd
ignorehitpause = 1
TriggerAll        = Time = 0
TriggerAll        = Alive
Trigger1          = GetHitVar(YVel) >= 7
Trigger2          = GETHITVAR(YACCEL) >= 0.525
value = S3500,10

[State EnvShake]
Type              = EnvShake
TriggerAll        = Time = 0
TriggerAll        = Alive
Trigger1          = GetHitVar(YVel) >= 7
Trigger2          = GETHITVAR(YACCEL) >= 0.525
Time              =  12
Ampl              = -18
Freq              =  120

[State Pause]
Type              = Pause
TriggerAll        = Time = [0,8]
TriggerAll        = Alive
Trigger1          = GetHitVar(YVel) >= 7
Trigger2          = GETHITVAR(YACCEL) >= 0.525
Time              = 1
MoveTime          = 0

[State 5100, 2004.04.14 behavior]
type = null;VelSet
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
trigger1 = vel x < -1
x = -1

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

[State 30000, 落地尘土]
type = Explod
trigger1 = time = 0
anim = 13021
pos = 0, 0
postype = p1
scale = 0.45,0.45
ontop = 1
pausemovetime = 999
supermovetime = 999

[State 30000, 底层]
type = Explod
trigger1 = time = 0
anim = 13020
postype = p1
scale = 0.45,0.45
under = 1
pausemovetime = 999
supermovetime = 999

[State 5100, PalFX]
type = PalFX
trigger1 = time = 0
time = 1

[State 1000, LifeAdd]
type = LifeAdd
trigger1 = (sysvar(1) > 14)
trigger1 = Timemod = 3,0
value = -25
kill = 1

[State 5100, 11]
type = HitFallDamage
trigger1 = Time = 3

[State 5000, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = f7,ifelse(Stagevar(Info.name)!="Boss",1,7)
volumescale = 50

[State 5100, 13]
type = PosFreeze
trigger1 = 1

[State 5100, 14]
type = ChangeState
trigger1 = time = 4
value = 5101

[State 5100, 15]
type = NotHitBy
trigger1 = 1
value = SCA

[State 5100, 16]
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
type = VelSet
trigger1 = Time = 0
y = -3.7

[State 5101, 4]
type = VelSet
trigger1 = (sysvar(1) > 14)
trigger1 = Time = 0
y = -7

[State 5101, 5] ;Acceleration
type = VelAdd
trigger1 = 1
y = 0.610

[State 5101, 6]
type = NotHitBy
trigger1 = 1
value = SCA

[State 5101, 7] ;Hit ground
type = ChangeState
trigger1 = Pos Y + Vel Y >= 0
value = 5110
;---------------------------------------------------------------------------
; HIT_LIEDOWN
[Statedef 5110]
type = L
movetype= H
physics = N

[State 5000, PlaySnd]
type = PlaySnd
triggerall = prevstateno != 5081
trigger1 = time = 0
value = f7,ifelse(Stagevar(Info.name)!="Boss",1,7)
volumescale = 50

[State 0, ChangeState]
type = ChangeState
trigger1 = !Time
value = 5111
ctrl = 0
;---------------------------------------------------------------------------
; HIT_LIEDOWN
[Statedef 5111]
type    = L
movetype= H
physics = N
ctrl    = 0

[State 30000, 底层]
type = Explod
trigger1 = time = 0
anim = 13020
postype = p1
scale = 0.45,0.45
trigger1 = fvar(20) = 0
under = 1
pausemovetime = 999
supermovetime = 999

[State 5110, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 5110, 1] ;For hit up/up-diag type (from state 5081)
type = ChangeAnim
persistent = 0
trigger1 = SelfAnimExist(5110 + (anim % 10))
trigger1 = anim = [5081,5089]
value = 5110 + (anim % 10)

[State 5110, 1] ;For hit up/up-diag type (from state 5081)
type = ChangeAnim
persistent = 0
trigger1 = SelfAnimExist(5110 + (anim % 10))
trigger1 = anim = [5091,5099]
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

[State 5110, 8]
type = VelSet
trigger1 = Time = 0
y = 0
x = 0

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

[State 5110, 12]
type = VarSet
trigger1 = SysVar(0)
trigger1 = Time = 0
sysvar(0) = 0

[State 5110, 12]
type = VarSet
trigger1 = !Time
sysvar(4) = Const(data.liedown.time)

[State 5110, ChangeState]
type = ChangeState
triggerall = alive
trigger1 = time = 10
value = 5120
ctrl = 0

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
; Downed get-hit (getting up)
[Statedef 5120]
type    = L
movetype= I
physics = N

[State PlaySnd]
Type              = PlaySnd
Triggerall          = random < 300
Trigger1          = Time = 2
Value             = S3500,8
Channel           = 0
VolumeScale       = 100

[State 5120, 1a] ;Get up anim (normal)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim != [5111,5119]
trigger2 = !SelfAnimExist(5120 + (anim % 10))
value = 5120

[State 5120, 1b] ;Get up anim (for hit up/diag-up)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim = [5111,5119]
trigger1 = SelfAnimExist(5120 + (anim % 10))
value = 5120 + (anim % 10)

[State 5120, 2]
type = VelSet
trigger1 = Time = 0
x = 0

[State 5120, 3]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 5120, 4]
type = HitFallSet
trigger1 = AnimTime = 0
value = 1

[State 52, VarSet]
type = VarSet
trigger1 = time = 0
v = 49
value = 20

[State 5120, 6] ;Can t be hit right after getting up (short time)
type = NotHitBy
trigger1 = AnimTime = 0
value2 = SCA
time = 3

[State 5120,7]
type = PalFX
trigger1 = time = 0
time = 1

[State 5120, 8]
type = SelfState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Downed get-hit (lying defeated)
[Statedef 5150]
type    = L
movetype= H
physics = N
sprpriority = -3
ctrl = 0

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
trigger1 = abs(Vel x) < Const(movement.down.friction.threshold)
persistent = 0
x = 0

[State 5150, 8]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1
;---------------------------------------------------------------------------
; Air get-hit (fall recovery on ground; still falling)
[Statedef 5200]
type    = A
movetype= H
physics = N

[State 5200, 1] ;Change anim if done with transition
type = ChangeAnim
trigger1 = Anim = 5035
trigger1 = AnimTime = 0
value = 5050

[State 5200, 2]
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 5200, 3]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= Const(movement.air.gethit.groundrecover.groundlevel)
value = 5201
;---------------------------------------------------------------------------
; Air get-hit (fall recovery on ground)
[Statedef 5201]
type    = A
movetype= H
physics = A
anim = 5200

[State 5201, 1] ;Turn if not facing opponent
type = Turn
trigger1 = Time = 0
trigger1 = p2dist X < Const720p(-20)

[State 5201, 2]
type = VelSet
trigger1 = Time = 0
x = Const(velocity.air.gethit.groundrecover.x)
y = Const(velocity.air.gethit.groundrecover.y)

[State 5201, 3]
type = PosSet
trigger1 = Time = 0
y = 0

[State 5201, 4]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 5201, 5] ;Blink white
type = PalFX
trigger1 = Time = 0
time = 3
add = 128,128,128 ;256,256,256

[State 5201, 6]
type = Explod
trigger1 = Time = 0
anim = F60
pos = 0, -floor(vel y)
sprpriority = -10
;-------------------------------------------------------------------------------
;Caer de rodillas KOFM
[Statedef 5250]
type    = S
movetype= H
physics = S

[State 1203, 5]
type = nothitby
trigger1 = 1
value = SCA

[State 153, 4]
type = statetypeset
trigger1 = animtime = 0
value = L

[State 870, PosSet]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1000, VelSet]
type = VelSet
trigger1 = Time = 0
y = 0

[State 1000, VelAdd]
type = VelAdd
trigger1 = Time = 0
y = 0

[State 870]
type = ChangeAnim
Trigger1 = Time = 0
trigger1 = SelfAnimExist(5250)
value = 5250

[State 870]
type = ChangeAnim2
Trigger1 = Time = 0
trigger1 = !SelfAnimExist(5250)
value = 1095

[State 870]
type = ChangeState
trigger1 = Animtime = 0
trigger1 = SelfAnimExist(5250)
value = 5251

[State 870]
type = SelfState
trigger1 = Animtime = 0
trigger1 = !SelfAnimExist(5250)
value = 5110
;-------------------------------------------------------------------------------
[Statedef 5251]
type    = L
movetype= H
physics = N

[State 6010, PlaySound]
type = PlaySnd
trigger1 = time = 0
value = f7,1
volumescale = 50

[State 6010, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 10
freq = 110
ampl = -4

[State 899]
type = ChangeAnim
persistent = 0
trigger1 = SelfAnimExist(5111)
value = 5111

[State 5251]
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119]
trigger1 = anim != [5161,5169]
trigger2 = !SelfAnimExist(5170 + (anim % 10))
value = 5170

[State 5251]
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119]
trigger1 = anim = [5161,5169]
trigger1 = SelfAnimExist(5170 + (anim % 10))
value = 5170 + (anim % 10)

[State 5251]
type = PosSet
trigger1 = Time = 0
y = 0

[State 5251]
type = VelSet
trigger1 = Time = 0
y = 0

[State 5251]
type = ChangeAnim
persistent = 0
triggerall = anim = [5171,5179]
triggerall = SelfAnimExist(5111)
trigger1 = AnimTime = 0
trigger2 = SysVar(0)
value = 5111

[State 5251]
type = ChangeAnim
persistent = 0
triggerall = Anim != [5111,5119]
trigger1 = AnimTime = 0
trigger2 = SysVar(0)
value = 5110

[State 5251]
type = VarSet
trigger1 = SysVar(0)
trigger1 = Time = 0
sysvar(0) = 0

[State 5251]
type = ForceFeedback
trigger1 = alive
trigger1 = Time = 0
time = 8
ampl = 240
waveform = sine

[State 5251]
type = ForceFeedback
trigger1 = !alive
trigger1 = Time = 0
ampl = 200, 7, -.467
time = 30
waveform = sine

[State 3680]
type = selfstate
trigger1 = alive
trigger1 = Time = 70
value = 5120

[State 5251]
type = selfstate
trigger1 = !alive
trigger1 = Time = 10
value = 5150
;-------------------------------------------------------------------------------
;Guard Crush KOFM
[Statedef 5255]
type    = S
movetype= H
physics = N
velset = 0,0

[State 151, 2]
type = Varset
trigger1 = Time = 0
fv = 20
value = 0

[State 5255, 1]
type = PosSet
trigger1 = 1
y = 0

[State 5255, 5]
type = ChangeAnim
trigger1 = 1
value = anim

[State 5255, 6]
type = ChangeAnim
Trigger1 = Time = 0
trigger1 = SelfAnimExist(5255)
value = 5255

[State 5255, 7]
type = ChangeAnim2
Trigger1 = Time = 0
trigger1 = !SelfAnimExist(5255)
value = 5256

;---------------------------------------------------------
;Guard Crush Effect 1  -------------------------------------------------------------------------
[State 1000, Explod]
type = Explod
triggerall = facing = 1
trigger1 = time = 0
anim = 7120
pos = 0,80
postype = left
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 7
ownpal = 1

[State 1000, Explod]
type = Explod
triggerall = facing = 1
trigger1 = time = 0
anim = 7133
pos = 80,80
postype = left
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 8
ownpal = 1

[State 1000, Explod]
type = Explod
triggerall = facing = 1
trigger1 = time = 0
anim = 7134
pos = 80,80
postype = left
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 8
ownpal = 1

;Guard Crush Effect -1 -------------------------------------------------------------------------
[State 1000, Explod]
type = Explod
triggerall = facing = -1
trigger1 = time = 0
facing = -1
anim = 7120
pos = 0,80
postype = right
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 7
ownpal = 1

[State 1000, Explod]
type = Explod
triggerall = facing = -1
trigger1 = time = 0
anim = 7133
pos = -80,80
postype = right
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 8
ownpal = 1

[State 1000, Explod]
type = Explod
triggerall = facing = -1
trigger1 = time = 0
anim = 7134
pos = -80,80
postype = right
bindtime = -1
supermove = 1
pausemove = 1
scale = .5,.5
pausemovetime = 99999
supermovetime = 99999
sprpriority = 8
ownpal = 1
;---------------------------------------------------------

;Guard Crush Cartel
[State 5255, Critical Hits]
type = Explod
trigger1 = TIME = 0
ignorehitpause = 1
persistent = 0
anim = 7135
id = 4195
pos = 4,-70
postype = p1
bindtime = 0
ontop = 1
ownpal = 1
supermove = 1
scale = .5,.5
pausemove = 1
pausemovetime = 99999
supermovetime = 99999
sprpriority = 999

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S3600,22

[State 5255, 8]
type = NotHitBy
trigger1 = 1
value = SCA

[State 5255, 9]
type = ChangeState
trigger1 = HitShakeOver
value = 5256
;-------------------------------------------------------------------------------
;Guard Crush KOFM
[Statedef 5256]
type    = S
movetype= H
physics = N
velset = 0,0

[State 5255, 2]
type = EnvColor
trigger1 = time = 0
value = 255,255,255
time = 1
under = 1
persistent = 0

[State 5255, 3]
type = Explod
trigger1 = time = [1,5]
anim = f4
id = 4195
pos = 10,-70
random = 50,50
postype = p1
bindtime = 1
ontop = 1
ownpal = 1
pausemove = 1
ignorehitpause = 1

[State 5255, 4]
type = PlaySnd
trigger1 = time = 0
value = f5200,3
persistent = 0
ignorehitpause = 1
volumescale = 50

[State 1000, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 5255, VelSet]
type = VelSet
trigger1 = time = 0
x = -4.8

[State 5255, VelAdd]
type = VelAdd
trigger1 = time > 0
x = .15

[State 5255, VelSet]
type = VelSet
trigger1 = animtime = 0
x = 0

[State 5255, ChangeAnim]
type = ChangeAnim
Trigger1 = Time = 0
trigger1 = SelfAnimExist(5255)
value = 5255

[State 5255, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time = 0
trigger1 = !SelfAnimExist(5255)
value = 5256

[State 5255]
type = SelfState
trigger1 = Animtime = 0
value = 0
ctrl = 1
;-------------------------------------------------------------------------------
;Cancelled Grasp p1
[Statedef 5260]
type    = S
movetype= H
physics = N
velset = 0,0
facep2  = 1

[State 1000, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 1000, TargetState]
type = TargetState
trigger1 = time = 0
value = 5261
ctrl = 0

[State 1000, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1000, PosAdd]
type = PosAdd
trigger1 = 1
y = 0

[State 1000, PalFX]
type = PalFX
trigger1 = time = 0
time = 1

[State 5255, VelSet]
type = VelSet
trigger1 = time = 0
x = 0

[State 5255, VelSet]
type = VelSet
trigger1 = time = 1
x = -5.6

[State 5255, VelSet]
type = VelSet
trigger1 = time = 15
x = 0

[State 5255, ChangeAnim]
type = ChangeAnim
Trigger1 = Time = 0
trigger1 = SelfAnimExist(5255)
value = 5255

[State 5255, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time = 0
trigger1 = !SelfAnimExist(5255)
value = 5256

[State 1000, CtrlSet]
type = CtrlSet
trigger1 = animtime = 0
value = 1

[State 5255]
type = SelfState
trigger1 = Animtime = 0
value = 0
ctrl = 1
;-------------------------------------------------------------------------------
;Cancelled Grasp p2
[Statedef 5261]
type    = S
movetype= H
physics = N
velset  = 0,0
facep2  = 1

[State 5261, Explod]
type = Explod
trigger1 = time = 3
anim = f80
pos = 25,-60
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
sprpriority = 9

[State 5255, EnvColor]
type = EnvColor
trigger1 = time = 0
value = 255,255,255
time = 1
under = 1
persistent = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = f5200,2
volumescale = 50

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = f7,6
volumescale = 50

[State 1000, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 1000, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1000, PosAdd]
type = PosAdd
trigger1 = 1
y = 0

[State 5255, EnvColor]
type = EnvColor
trigger1 = time = 0
value = 255,255,255
time = 1
under = 1
persistent = 0

[State 5255, ChangeAnim]
type = ChangeAnim
Trigger1 = Time = 0
trigger1 = SelfAnimExist(5260)
value = 5260

[State 5255, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time = 0
trigger1 = !SelfAnimExist(5260)
value = 5255

[State 1000, PosAdd]
type = PosAdd
trigger1 = time = 0
x = 0

[State 1000, VelSet]
type = VelSet
triggerall = FrontEdgeBodyDist <= 50
trigger1 = time = 0
x = -7

[State 1000, PalFX]
type = PalFX
trigger1 = time = 0
time = 1

[State 5255, VelSet]
type = VelSet
trigger1 = time = 10
x = 0

[State 1000, CtrlSet]
type = CtrlSet
trigger1 = animtime = 0
value = 1

[State 5255]
type = SelfState
trigger1 = Animtime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
; Continue screen animation
[Statedef 5500]
type = S
ctrl = 0
anim = 170
velset = 0,0

[State 5500, 1] ;Use continue animation if available
type = ChangeAnim
trigger1 = time = 0
trigger1 = SelfAnimExist(5500)
value = 5500

;---------------------------------------------------------------------------
; Initialize (at the start of the round)
[Statedef 5900]
type = S

[State 5900, 1] ;Clear all int variables
type = VarRangeSet
trigger1 = roundsexisted = 0
value = 0

[State 5900, 2] ;Clear all float variables
type = VarRangeSet
trigger1 = roundsexisted = 0
fvalue = 0

[State 5900, 3] ;Change palette
type = RemapPal
trigger1 = 1
source = 1,1
dest = 1,palno

[State 5900, 3] ;Intro for round 1
type = ChangeState
trigger1 = roundno = 1
value = 190
;-------------------------------------------------------------------------------
;Crater
[Statedef 51000]
type = S
ctrl = 0
anim = 999

[State 1000, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 20
freq = 100
ampl = -4

[State 1000, EnvColor]
type = EnvColor
trigger1 = time = 0
value = 255,255,255
time = 2
under = 1

;-------------------------------------------------------------------------------
;Efecto Crater
[State 1000, Explod]
type = Explod
triggerall = Stagevar(Info.name)!="Boss"
trigger1 = Time = 0
anim = f62
pos = 0,0
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
sprpriority = 9
removeongethit = 0
ontop = 1

[State 1000, Explod]
type = Explod
triggerall = Stagevar(Info.name)!="Boss"
trigger1 = Time = 0
anim = f63
Id = 100
pos = 0,0
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
sprpriority = -9
removeongethit = 0

[State 1000, Explod]
type = Explod
triggerall = Stagevar(Info.name)!="Boss"
trigger1 = time = [0,5]
anim = f68
pos = 0,15
postype = p1
facing = 1
vfacing = 1
bindtime = 1
vel = 1.7,-5
accel = 0,0.2
random = 100,50
removetime = -2
sprpriority = 99

[State 1000, Explod]
type = Explod
triggerall = Stagevar(Info.name)!="Boss"
trigger1 = time = [0,5]
anim = f68
pos = 0,15
postype = p1
facing = -1
vfacing = 1
bindtime = 1
vel = -1.8,-5
accel = 0,0.2
random = 100,50
removetime = -2
sprpriority = 8

[State 1000, Helper]
type = Helper
triggerall = Stagevar(Info.name)!="Boss"
triggerall = numhelper(51000) <= 25
trigger1 = time = [0,10]
helpertype = normal
name = "Fragmentos-1"
stateno = 51001
id = 51000
pos = -25,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1

[State 1000, Helper]
type = Helper
triggerall = Stagevar(Info.name)!="Boss"
triggerall = numhelper(51000) <= 25
trigger1 = time = [0,10]
helpertype = normal
name = "Fragmentos-2"
stateno = 51004
id = 51000
pos = -50,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1

[State 1000, Helper]
type = Helper
triggerall = Stagevar(Info.name)!="Boss"
triggerall = numhelper(51000) <= 25
trigger1 = time = [0,10]
helpertype = normal
name = "Fragmentos-3"
stateno = 51006
id = 51000
pos = -50,5
postype = p1
facing = 1
keyctrl = 0
ownpal = 1

[State 51000, Explod]
type = Explod
triggerall = Stagevar(Info.name)!="Boss"
trigger1 = gametime%10 = 0
trigger1 = time = [0,10]
anim = f69
pos = 50,5
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
random = 100,50
sprpriority = 9
ontop = 1

[State 51000, Explod]
type = Explod
triggerall = Stagevar(Info.name)!="Boss"
trigger1 = gametime%10 = 0
trigger1 = time = [0,10]
anim = f69
pos = -50,5
postype = p1
facing = -1
vfacing = 1
bindtime = 1
removetime = -2
random = 100,50
sprpriority = 9
ontop = 1

[State 51000, Explod]
type = Explod
triggerall = Stagevar(Info.name)!="Boss"
trigger1 = gametime%10 = 0
trigger1 = time = [0,10]
anim = f69
pos = 50,5
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
random = 100,50
sprpriority = -1

[State 51000, Explod]
type = Explod
triggerall = Stagevar(Info.name)!="Boss"
trigger1 = gametime%10 = 0
trigger1 = time = [0,10]
anim = f69
pos = -50,5
postype = p1
facing = -1
vfacing = 1
bindtime = 1
removetime = -2
random = 100,50
sprpriority = -1

[State 5100, 12]
type = PlaySnd
triggerall = Stagevar(Info.name)!="Boss"
trigger1 = Time = 1
value = F7,2
volumescale = 50
;-------------------------------------------------------------------------------
;Efecto Estampada Normal (No creater)
[State 1000, Explod]
type = Explod
triggerall = Stagevar(Info.name)="Boss"
trigger1 = Time = 0
anim = f64
pos = 0,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
sprpriority = -1
removeongethit = 0

[State 1000, Explod]
type = Explod
triggerall = Stagevar(Info.name)="Boss"
trigger1 = Time = 0
anim = f65
pos = 0,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
sprpriority = 9
removeongethit = 0

[State 5100, 12]
type = PlaySnd
triggerall = Stagevar(Info.name)="Boss"
trigger1 = Time = 1
value = F7,8
volumescale = 50
;-------------------------------------------------------------------------------

[State 1000, Pause]
type = Pause
triggerall = RoundState = 2
trigger1 = time = [5,25]
time = 1
movetime = 1
ignorehitpause = 1

[State 1000, DestroySelf]
type = DestroySelf
trigger1 = time = 1027
;-------------------------------------------------------------------------------
;Fragmentos-1
[Statedef 51001]
type = S
ctrl = 0
anim = 999
velset = 0,0

[State 1000, PosSet]
type = Posadd
trigger1 = time = 0
x = 0+random%-100

[State 1000, PosSet]
type = Posadd
trigger1 = time = 0
y = 1+random%10

[State 1000, VelSet]
type = VelSet
trigger1 = time = 0
x = 1+random%1
y = -7+random%5

[State 1000, VelAdd]
type = VelAdd
trigger1 = time = [5,99]
y = .35

[State 1000, Explod]
type = Explod
trigger1 = time = 0
anim = f66
id = 51000
pos = 0,15
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
sprpriority = 8

[State 1000, RemoveExplod]
type = RemoveExplod
trigger1 = Vel Y > 0 && Pos Y >= 0
id = 51000

[State 1000, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 10
value = 51002
;-------------------------------------------------------------------------------
;Rebote
[Statedef 51002]
type = S
ctrl = 0
anim = 999
velset = 0,0

[State 1000, VelSet]
type = VelSet
trigger1 = time = 2
x = 2+random%2
y = -2.3

[State 1000, VelAdd]
type = VelAdd
trigger1 = time = [10,99]
y = .45

[State 1000, Explod]
type = Explod
trigger1 = time = 0
anim = f66
id = 51000
pos = 0,15
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
sprpriority = 8

[State 1000, RemoveExplod]
type = RemoveExplod
trigger1 = Vel Y > 0 && Pos Y >= 0
id = 51000

[State 1000, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 51003
;-------------------------------------------------------------------------------
;Fragmentos-2
[Statedef 51004]
type = S
ctrl = 0
anim = 999
velset = 0,0

[State 1000, PosSet]
type = Posadd
trigger1 = time = 0
x = 0+random%-100

[State 1000, PosSet]
type = Posadd
trigger1 = time = 0
y = 1+random%10

[State 1000, VelSet]
type = VelSet
trigger1 = time = 0
x = -1+random%1
y = -7+random%5

[State 1000, VelAdd]
type = VelAdd
trigger1 = time = [5,99]
y = .35

[State 1000, Explod]
type = Explod
trigger1 = time = 0
anim = f66
id = 51000
pos = 0,15
postype = p1
facing = -1
vfacing = 1
bindtime = -1
removetime = -1
sprpriority = 8

[State 1000, RemoveExplod]
type = RemoveExplod
trigger1 = Vel Y > 0 && Pos Y >= 0
id = 51000

[State 1000, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 10
value = 51005
;-------------------------------------------------------------------------------
;Rebote
[Statedef 51005]
type = S
ctrl = 0
anim = 999
velset = 0,0

[State 1000, VelSet]
type = VelSet
trigger1 = time = 2
x = -2+random%2
y = -2.3

[State 1000, VelAdd]
type = VelAdd
trigger1 = time = [10,99]
y = .45

[State 1000, Explod]
type = Explod
trigger1 = time = 0
anim = f66
id = 51000
pos = 0,15
postype = p1
facing = -1
vfacing = 1
bindtime = -1
removetime = -1
sprpriority = 8

[State 1000, RemoveExplod]
type = RemoveExplod
trigger1 = Vel Y > 0 && Pos Y >= 0
id = 51000

[State 1000, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 51003
;-------------------------------------------------------------------------------
;Fragmentos-3
[Statedef 51006]
type = S
ctrl = 0
anim = 999
velset = 0,0

[State 1000, PosSet]
type = Posadd
trigger1 = time = 0
x = 0+random%-100

[State 1000, PosSet]
type = Posadd
trigger1 = time = 0
y = 1+random%10

[State 1000, VelSet]
type = VelSet
trigger1 = time = 0
y = -8+random%5

[State 1000, VelAdd]
type = VelAdd
trigger1 = time = [5,99]
y = .35

[State 1000, Explod]
type = Explod
trigger1 = time = 0
anim = f66
id = 51000
pos = 0,15
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
sprpriority = 8

[State 1000, RemoveExplod]
type = RemoveExplod
trigger1 = Vel Y > 0 && Pos Y >= 0
id = 51000

[State 1000, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 10
value = 51007
;-------------------------------------------------------------------------------
;Rebote
[Statedef 51007]
type = S
ctrl = 0
anim = 999
velset = 0,0

[State 1000, VelSet]
type = VelSet
trigger1 = time = 2
y = -2.3

[State 1000, VelAdd]
type = VelAdd
trigger1 = time = [10,99]
y = .45

[State 1000, Explod]
type = Explod
trigger1 = time = 0
anim = f66
id = 51000
pos = 0,15
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
sprpriority = 8

[State 1000, RemoveExplod]
type = RemoveExplod
trigger1 = Vel Y > 0 && Pos Y >= 0
id = 51000

[State 1000, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 51003
;-------------------------------------------------------------------------------
;Final
[Statedef 51003]
type = S
ctrl = 0
anim = 999
velset = 0,0

[State 1000, PosSet]
type = Posadd
trigger1 = time = 0
y = 0+random%-5

[State 1000, Explod]
type = Explod
trigger1 = time = 0
anim = f67
pos = 0,15
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = 110
sprpriority = 8

[State 1000, DestroySelf]
type = DestroySelf
trigger1 = time = 110
;---------------------------------------------------------------------------
; HITG_SHAKE
[Statedef 5270]
type    = S
movetype= H
physics = N
velset = 0,0

[State 5000, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = ifelse((GetHitVar(groundtype) = 1),5000,5010) + GetHitVar(animtype)

[State 5000, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030

[State 5000, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047 + GetHitVar(animtype) ;5051 - 4 + type

[State 5000, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 5000, 5] ;State type gets set to aerial if getting hit up
type = StateTypeSet
trigger1 = Time = 0
trigger1 = GetHitVar(yvel) != 0 || GetHitVar(fall)
trigger2 = Pos Y != 0
statetype = a

[State 5000, 6]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) = 0 && !GetHitVar(fall)
value = 5380 ;HITG_SLIDE

[State 5000, 7]
type = ChangeState
trigger1 = HitShakeOver
value = 5271

[State 5000, FFB Light]
type = ForceFeedback
trigger1 = anim = 5000
trigger2 = anim = 5010
persistent = 0
time = 6
waveform = square

[State 5000, FFB Medium]
type = ForceFeedback
trigger1 = anim = 5001
trigger2 = anim = 5011
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 5000, FFB Hard]
type = ForceFeedback
trigger1 = anim = 5012
trigger2 = anim = 5002
trigger3 = anim = 5030
persistent = 0
time = 15
waveform = sinesquare
ampl = 140
;-------------------------------------------------------------------------------
[Statedef 5280]
type    = S
movetype= H
physics = N
velset = 0,0

[State 5000, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = ifelse((GetHitVar(groundtype) = 1),5000,5010) + GetHitVar(animtype)

[State 5000, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030

[State 5000, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047 + GetHitVar(animtype) ;5051 - 4 + type

[State 5000, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 5000, 5] ;State type gets set to aerial if getting hit up
type = StateTypeSet
trigger1 = Time = 0
trigger1 = GetHitVar(yvel) != 0 || GetHitVar(fall)
trigger2 = Pos Y != 0
statetype = a

[State 5000, 6]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) = 0 && !GetHitVar(fall)
value = 5380 ;HITG_SLIDE

[State 5000, 7]
type = ChangeState
trigger1 = HitShakeOver
value = 5271

[State 5000, FFB Light]
type = ForceFeedback
trigger1 = anim = 5000
trigger2 = anim = 5010
persistent = 0
time = 6
waveform = square

[State 5000, FFB Medium]
type = ForceFeedback
trigger1 = anim = 5001
trigger2 = anim = 5011
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 5000, FFB Hard]
type = ForceFeedback
trigger1 = anim = 5012
trigger2 = anim = 5002
trigger3 = anim = 5030
persistent = 0
time = 15
waveform = sinesquare
ampl = 140
;-------------------------------------------------------------------------------
[Statedef 5271]
type    = A
movetype= H
physics = N
ctrl = 0

[State 2120]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 5030, 2]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 5040, 4]
type = StateTypeSet
trigger1 = HitOver
movetype = I

[State 5030, 1]
type = VelAdd;Gravity
trigger1 = 1
y = GetHitVar(yaccel)

[State 5210, 1]
type = changeanim
trigger1 = Time = 0
value = 5050

[State 1830]
type = SelfState
triggerall = alive = 1
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 5272

[State 1000, ChangeState]
type = SelfState
triggerall = alive = 0
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 5100
;---------------------------------------------------------------------------
[Statedef 5272]
type    = A
movetype= H
physics = N
facep2  = 1

[State 1000, HitBy]
type = HitBy
triggerall = enemy,stateno != [1630,1640]
trigger1 = 1
value = SCA

[State 1000, PosSet]
type = PosSet
trigger1 = time = [0,4]
y = -20

[State 1000, VelSet]
type = VelSet
trigger1 = time = [0,4]
x = 0

[State 1000, Explod]
type = Explod
trigger1 = time = 0
anim = f65
pos = 0,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
sprpriority = 9

[State 1000, Explod]
type = Explod
trigger1 = time = 0
anim = f64
pos = 0,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
sprpriority = -1

[State 5000, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = f7,ifelse(Stagevar(Info.name)!="Boss",1,7)
volumescale = 50

[State 1000, Pause]
type = Pause
trigger1 = time = [5,10]
time = 1
movetime = 1
ignorehitpause = 1

[State 2120]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 52, 1]
type = VelSet
trigger1 = time = 5
x = -1.7
y = -5

[State 52, 2]
type = Veladd
trigger1 = AnimElemtime(3) >= 0
y = .50

[State 1830]
type = ChangeAnim
Trigger1 = Time = 0
value = 5272

[State 1830]
type = SelfState
triggerall = AnimElemtime(5) >= 0
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 5110
;---------------------------------------------------------------------------
[Statedef 5273]
type    = L
movetype= H
physics = N
velset = 0,0

[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 5100

[State 2100, 堏摦]
type = PosSet
trigger1 = 1
y = 0

[State 2100, 堏摦廔椆]
type = VelSet
trigger1 = time = 22
x = 0

[State 2100,]
type = MakeDust
trigger1 = vel x < 0
spacing = 4

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = f7,6
volumescale = 50

[State 1000, VelSet]
type = VelSet
triggerall = FrontEdgeBodyDist <= 70
triggerall = p2bodydist x <= 0
trigger1 = time = 0
x = 4

[State 1000, VelSet]
type = VelSet
triggerall = FrontEdgeBodyDist >= 70
triggerall = p2bodydist x >= 0
trigger1 = time = 0
x = -4

[State 820, 1]
type = SelfState
trigger1 = time = 23
value = 5150
;-------------------------------------------------------------------------------
;Winpose
[Statedef 9920]
type = S
ctrl = 0
anim = 999
velset = 0,0

[State 1000, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = nomusic
flag2 = nobg
flag3 = nofg
ignorehitpause = 1

[State 1000, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = nobardisplay
ignorehitpause = 1

[State 1000, Sp Finish]
type = Explod
trigger1 = time = 0
anim = f9920
sprpriority = -10
pos = 0,0
postype = left
bindtime = -1
supermove = 1
pausemove = 1
pausemovetime = 99999
supermovetime = 99999
removetime = -2
ignorehitpause = 1
ownpal = 1

[State 1000, Sp Finish]
type = Explod
trigger1 = time = 0
anim = f9920
sprpriority = 999
pos = 0,0
postype = left
bindtime = -1
supermove = 1
pausemove = 1
pausemovetime = 99999
supermovetime = 99999
removetime = -2
ignorehitpause = 1
ownpal = 1

[State 1000, DestroySelf]
type = DestroySelf
trigger1 = time = 999
;-------------------------------------------------------------------------------
;Player Winpose
[Statedef 9925]
type = S
ctrl = 0
anim = 999
sprpriority = 999

[State 1000, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = nomusic
flag2 = nobg
flag3 = nofg
ignorehitpause = 1

[State 1000, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = nobardisplay
ignorehitpause = 1

[State 1000, Sp Finish]
type = Explod
trigger1 = time = 0
anim = f9925
sprpriority = 999
pos = 0,0
postype = left
removetime = -2
bindtime = -1
ownpal = 1
ontop = 1

[State 181, AssertSpecial]
type = AssertSpecial
trigger1 = time = [0,50]
flag = roundnotover
;---------------------------------------------------------------------------
; HITG_SHAKE
[Statedef 8000]
type    = S
movetype= H
physics = N
velset = 0,0

[State 5000, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = ifelse((GetHitVar(groundtype) = 1),5000,5010) + GetHitVar(animtype)

[State 5000, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030

[State 5000, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047 + GetHitVar(animtype) ;5051 - 4 + type

[State 5000, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 5000, 5] ;State type gets set to aerial if getting hit up
type = StateTypeSet
trigger1 = Time = 0
trigger1 = GetHitVar(yvel) != 0 || GetHitVar(fall)
trigger2 = Pos Y != 0
statetype = a

[State 5000, 6]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) = 0 && !GetHitVar(fall)
value = 8001 ;HITG_SLIDE

[State 5000, 7]
type = ChangeState
trigger1 = HitShakeOver
value = 8030

[State 5000, FFB Light]
type = ForceFeedback
trigger1 = anim = 5000
trigger2 = anim = 5010
persistent = 0
time = 6
waveform = square

[State 5000, FFB Medium]
type = ForceFeedback
trigger1 = anim = 5001
trigger2 = anim = 5011
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 5000, FFB Hard]
type = ForceFeedback
trigger1 = anim = 5012
trigger2 = anim = 5002
trigger3 = anim = 5030
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

;---------------------------------------------------------------------------
; HITG_SLIDE
[Statedef 8001]
type    = S
movetype= H
physics = S

[State 5001, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 5001, 2]
type = ChangeAnim
trigger1 = AnimTime = 0
value = 5005 + GetHitVar(animtype) + (GetHitVar(groundtype)=2)*10

[State 5001, 3] ;Stop sliding back
type = VelMul
trigger1 = Time >= GetHitVar(slidetime)
x = .6

[State 5001, 4]
type = VelSet
trigger1 = HitOver
x = 0

[State 5001, 5]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 5001, 6]
type = Selfstate
trigger1 = HitOver
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; HITC_SHAKE
[Statedef 8010]
type    = C
movetype= H
physics = N
velset = 0,0

[State 5010, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = 5020 + GetHitVar(animtype)

[State 5010, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030

[State 5010, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047 + GetHitVar(animtype) ;5051 - 4 + type

[State 5010, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 5010, 5] ;State type gets set to aerial if getting hit up
type = StateTypeSet
triggerall = Time = 0
trigger1 = GetHitVar(yvel) != 0 || GetHitVar(fall)
trigger2 = Pos Y != 0
statetype = a

[State 5010, 6]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) = 0 && !GetHitVar(fall)
value = 8011 ;HITC_SLIDE

[State 5010, 7]
type = ChangeState
trigger1 = HitShakeOver
value = 8030

[State 5010, FFB Light]
type = ForceFeedback
trigger1 = anim = 5020
persistent = 0
time = 6
waveform = square

[State 5010, FFB Medium]
type = ForceFeedback
trigger1 = anim = 5021
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 5010, FFB Hard]
type = ForceFeedback
trigger1 = anim = 5022
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

;---------------------------------------------------------------------------
; HITC_SLIDE
[Statedef 8011]
type    = C
movetype= H
physics = C

[State 5011, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 5011, 2]
type = ChangeAnim
trigger1 = AnimTime = 0
value = 5025 + GetHitVar(animtype)

[State 5011, 3] ;Stop sliding back
type = VelMul
trigger1 = Time >= GetHitVar(slidetime)
x = .6

[State 5011, 4]
type = VelSet
trigger1 = HitOver
x = 0

[State 5011, 5]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 5011, 6]
type = ChangeState
trigger1 = HitOver
value = 11
ctrl = 1
;---------------------------------------------------------------------------
; HITA_SHAKE
[Statedef 8020]
type    = A
movetype= H
physics = N
velset = 0,0

[State 5020, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = ifelse((GetHitVar(airtype) = 1),5000,5010) + GetHitVar(animtype)

[State 5020, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030

[State 5020, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047 + GetHitVar(animtype) ;5051 - 4 + type

[State 5020, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 5020, 5]
type = ChangeState
trigger1 = HitShakeOver
value = 8030

[State 5020, FFB Light]
type = ForceFeedback
trigger1 = anim = 5000
trigger2 = anim = 5010
persistent = 0
time = 6
waveform = square

[State 5020, FFB Medium]
type = ForceFeedback
trigger1 = anim = 5001
trigger2 = anim = 5011
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 5020, FFB Hard]
type = ForceFeedback
trigger1 = anim = 5012
trigger2 = anim = 5002
trigger3 = anim = 5030
trigger4 = anim = [5051,5059]
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

;---------------------------------------------------------------------------
; HITA_UP (initial going up)
[Statedef 8030]
type    = A
movetype= H
physics = N
ctrl = 0

[State 5030, 1]
type = VelAdd;Gravity
trigger1 = 1
y = GetHitVar(yaccel)

[State 5030, 2]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 5030, 5]
type = ChangeState
triggerall = anim = 5052
trigger1 = AnimTime = 0
value = 8055 ;HITA_UP (transition)

[State 5030, 3]
type = ChangeState
triggerall = anim != 5052
triggerall = !HitFall
trigger1 = HitOver
trigger2 = Vel Y > 0    ;Hit ground
trigger2 = Pos Y >= 10  ;.
value = 8040 ;HITA_RECOV

[State 5030, 4]
type = ChangeState
triggerall = anim != 5052
triggerall = HitFall
trigger1 = HitOver
trigger2 = Vel Y > 0    ;Hit ground
trigger2 = Pos Y >= 10  ;.
value = 8050 ;HITA_FALL

[State 5030, 5]
type = ChangeState
triggerall = anim != 5052
trigger1 = AnimTime = 0
value = 8035 ;HITA_UP (transition)
;---------------------------------------------------------------------------
; HITA_FALL (knocked up, falling)
[Statedef 8055]
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

[State 5050, 6]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= ifelse((anim = [5051,5059]) || (anim = [5061,5069]), 0, 25)
value = 5105 ;HIT_BOUNCE
;---------------------------------------------------------------------------
; HITA_UP_T (transition)
[Statedef 8035]
type    = A
movetype= H
physics = N

[State 5035, 1]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = SelfAnimExist(5035)
trigger1 = Anim != [5051,5059] ;Not if in hit up anim
trigger1 = Anim != 5090 ;Not if hit off ground anim
value = 5035

[State 5035, 2]
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 5035, 3]
type = ChangeState
triggerall = !HitFall
trigger1 = HitOver  ;Hit is over
trigger2 = AnimTime = 0 ;Animation over
trigger3 = Vel Y > 0    ;Hit ground
trigger3 = Pos Y >= 10  ;.
trigger4 = Time = 0     ;No transition anim
trigger4 = Anim != 5035 ;.
value = 5040 ;HITA_RECOV

[State 5035, 4]
type = ChangeState
triggerall = HitFall
trigger1 = HitOver  ;Hit is over
trigger2 = AnimTime = 0 ;Anim is over
trigger3 = Vel Y > 0    ;Hit ground
trigger3 = Pos Y >= 10  ;.
trigger4 = Time = 0     ;No transition anim
trigger4 = Anim != 5035 ;.
value = 8050 ;HITA_FALL
;---------------------------------------------------------------------------
; HITA_FALL (knocked up, falling)
[Statedef 8050]
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

[State 5050, 6]
type = selfstate
trigger1 = Vel Y > 0
trigger1 = Pos Y >= ifelse((anim = [5051,5059]) || (anim = [5061,5069]), 0, 25)
value = 5100 ;HIT_BOUNCE
;-------------------------------------------------------------------------------
[Statedef 5380]
type    = S
movetype= H
physics = N
velset = 0,0

[State 5380, Explod]
type = Explod
trigger1 = time = 1
anim = f65
pos = -10,-20
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
sprpriority = 9

[State 5380, Explod]
type = Explod
trigger1 = time = 1
anim = f64
pos = -10,-20
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
sprpriority = -1

[State 5380, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = f7,5
volumescale = 50

[State 5380, Pause]
type = Pause
trigger1 = time = [2,10]
time = 1
movetime = 1
ignorehitpause = 1

[State 5380, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 20
freq = 100
ampl = -4

[State 2120]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 1000, PosAdd]
type = PosAdd
trigger1 = time = 0
y = 20

[State 5210, 1]
type = changeanim
trigger1 = Time = 0 && selfanimexist(5161)
value = 5161

[State 5210, 1]
type = changeanim
trigger1 = Time = 0 && selfanimexist(5162)
value = 5162

[State 5210, 1]
type = changeanim
trigger1 = Time = 0 && selfanimexist(5163)
value = 5163

[State 5210, 1]
type = changeanim
trigger1 = Time = 0
trigger1 = !selfanimexist(5161)
trigger1 = !selfanimexist(5162)
trigger1 = !selfanimexist(5163)
value = 5161

[State 1000, ChangeState]
type = ChangeState
trigger1 = time = 8
value = 5390
;-------------------------------------------------------------------------------
[Statedef 5390]
type    = L
movetype= H
physics = N

[State 5110, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 5110, 5]
type = PosSet
trigger1 = Time = 0
y = 0

[State 5110, 8]
type = VelSet
trigger1 = Time = 0
y = 0

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

[State 1000, PalFX]
type = PalFX
trigger1 = time = 3
time = 1

[State 5210, 1]
type = changeanim
trigger1 = Time = 0 && selfanimexist(5111)
value = 5111

[State 5210, 1]
type = changeanim
trigger1 = Time = 0 && selfanimexist(5112)
value = 5112

[State 5210, 1]
type = changeanim
trigger1 = Time = 0 && selfanimexist(5113)
value = 5113

[State 5210, 1]
type = changeanim
trigger1 = Time = 0
trigger1 = !selfanimexist(5111)
trigger1 = !selfanimexist(5112)
trigger1 = !selfanimexist(5113)
value = 5110

[State 1000, ChangeState]
type = ChangeState
trigger1 = time = 8
value = 5410
;-------------------------------------------------------------------------------
[Statedef 5410]
type    = L
movetype= H
physics = N

[State 1000, PosSet]
type = PosSet
trigger1 = time = 0
y = 17

[State 5410, VelSet]
type = VelSet
trigger1 = time = 0
y = -2.7

[State 5410, VelAdd]
type = VelAdd
trigger1 = time > 0
y = .75

[State 5210, 1]
type = changeanim
trigger1 = Time = 0 && selfanimexist(5091)
value = 5091

[State 5210, 1]
type = changeanim
trigger1 = Time = 0 && selfanimexist(5092)
value = 5092

[State 5210, 1]
type = changeanim
trigger1 = Time = 0 && selfanimexist(503)
value = 5093

[State 5210, 1]
type = changeanim
trigger1 = Time = 0
trigger1 = !selfanimexist(5091)
trigger1 = !selfanimexist(5092)
trigger1 = !selfanimexist(5093)
value = 5091

[State 1000, 僗僥乕僩曄峏]
type = ChangeState
trigger1 = time = 7
value = 5420
;-------------------------------------------------------------------------------
[Statedef 5420]
type    = L
movetype= H
physics = N

[State 5110, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 5110, 5]
type = PosSet
trigger1 = 1
y = 0

[State 5110, 8]
type = VelSet
trigger1 = 1
y = 0
x = 0

[State 5420, NotHitBy]
type = NotHitBy
triggerall = prevstateno != 5410
trigger1 = 1
value = SCA

[State 5380, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = f7,0
volumescale = 50

[State 5100, 8]
type = GameMakeAnim
trigger1 = Time = 1
value = 60 + (sysvar(1) > 5)
pos = 0, 0
under = sysvar(0) <= 5

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

[State 5210, 1]
type = changeanim
trigger1 = Time = 0 && selfanimexist(5111)
value = 5111

[State 5210, 1]
type = changeanim
trigger1 = Time = 0 && selfanimexist(5112)
value = 5112

[State 5210, 1]
type = changeanim
trigger1 = Time = 0 && selfanimexist(5113)
value = 5113

[State 5210, 1]
type = changeanim
trigger1 = Time = 0
trigger1 = !selfanimexist(5111)
trigger1 = !selfanimexist(5112)
trigger1 = !selfanimexist(5113)
value = 5110

[State 5110, 4]
type = HitFallDamage
trigger1 = Time = 0

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

[State 5240, ChangeState]
type = Selfstate
triggerall = alive = 1
trigger1 = time = 21
value = 5120

[State 5240, ChangeState]
type = Selfstate
triggerall = alive = 0
trigger1 = time = 21
value = 5150
;-------------------------------------------------------------------------------
;Estampada KOF98 Style Segundo Ataque By Zelgadis
[Statedef 5430]
type    = S
movetype= H
physics = N
velset = 0,0

[State 5000, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = ifelse((GetHitVar(groundtype) = 1),5000,5440) + GetHitVar(animtype)

[State 5000, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 5430

[State 5000, 6]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) = 0 && !GetHitVar(fall)
value = 5440

[State 5000, 7]
type = ChangeState
trigger1 = HitShakeOver
value = 5440

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

[State 5380, Explod]
type = Explod
trigger1 = time = 5
anim = f65
pos = -10,-20
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
sprpriority = 9

[State 5380, Explod]
type = Explod
trigger1 = time = 5
anim = f64
pos = -10,-20
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
sprpriority = -1

[State 5380, PlaySnd]
type = PlaySnd
trigger1 = time = 5
value = f7,5
volumescale = 50

[State 5380, Pause]
type = Pause
trigger1 = time = [2,10]
time = 1
movetime = 1
ignorehitpause = 1

[State 5380, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 20
freq = 100
ampl = -4
;-------------------------------------------------------------------------------
[Statedef 5440]
type    = A
movetype= H
physics = N
velset = 0,0

[State 5030, 2]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 1000, PosSet]
type = PosSet
trigger1 = time = 0
y = 17

[State 5410, VelSet]
type = VelSet
trigger1 = time = 0
y = -3.7

[State 5410, VelAdd]
type = VelAdd
trigger1 = time > 0
y = .45

[State 5210, 1]
type = changeanim
trigger1 = Time = 0 && selfanimexist(5091)
value = 5091

[State 5210, 1]
type = changeanim
trigger1 = Time = 0 && selfanimexist(5092)
value = 5092

[State 5210, 1]
type = changeanim
trigger1 = Time = 0 && selfanimexist(503)
value = 5093

[State 5210, 1]
type = changeanim
trigger1 = Time = 0
trigger1 = !selfanimexist(5091)
trigger1 = !selfanimexist(5092)
trigger1 = !selfanimexist(5093)
value = 5091

[State 1000, 僗僥乕僩曄峏]
type = ChangeState
trigger1 = time = 17
value = 5450
;-------------------------------------------------------------------------------
[Statedef 5450]
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

[State 5100, 11]
type = HitFallDamage
trigger1 = Time = 3

[State 5100, 13]
type = PosFreeze
trigger1 = 1

[State 5100, 15]
type = ForceFeedback
trigger1 = Time = 0
waveform = sinesquare
ampl = 128,-3,-.2,.005
time = 20

[State 5100, 8]
type = GameMakeAnim
trigger1 = Time = 1
value = 60 + (sysvar(1) > 5)
pos = 0, 0
under = sysvar(0) <= 5

[State 5380, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = f7,0
volumescale = 50

[State 5210, 1]
type = changeanim
trigger1 = Time = 0 && selfanimexist(5111)
value = 5111

[State 5210, 1]
type = changeanim
trigger1 = Time = 0 && selfanimexist(5112)
value = 5112

[State 5210, 1]
type = changeanim
trigger1 = Time = 0 && selfanimexist(5113)
value = 5113

[State 5210, 1]
type = changeanim
trigger1 = Time = 0
trigger1 = !selfanimexist(5111)
trigger1 = !selfanimexist(5112)
trigger1 = !selfanimexist(5113)
value = 5110

[State 1000, ChangeState]
type = ChangeState
trigger1 = time = 4
value = 5460

;-------------------------------------------------------------------------------
[Statedef 5460]
type    = L
movetype= H
physics = N

[State 5101, 3]
type = HitFallVel
trigger1 = Time = 0

[State 1000, PosSet]
type = PosSet
trigger1 = time = 0
y = 10

[State 5101, 3]
type = HitFallVel
trigger1 = Time = 0

[State 5410, VelSet]
type = VelSet
trigger1 = time = 0
y = -2.3

[State 5410, VelAdd]
type = VelAdd
trigger1 = time > 0
y = .75

[State 5210, 1]
type = changeanim
trigger1 = Time = 0 && selfanimexist(5091)
value = 5091

[State 5210, 1]
type = changeanim
trigger1 = Time = 0 && selfanimexist(5092)
value = 5092

[State 5210, 1]
type = changeanim
trigger1 = Time = 0 && selfanimexist(503)
value = 5093

[State 5210, 1]
type = changeanim
trigger1 = Time = 0
trigger1 = !selfanimexist(5091)
trigger1 = !selfanimexist(5092)
trigger1 = !selfanimexist(5093)
value = 5091

[State 5102, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 1000, 僗僥乕僩曄峏]
type = Changestate
trigger1 = time = 7
value = 5110
;-------------------------------------------------------------------------------
; HITG_SHAKE
[Statedef 17000]
type    = S
movetype= H
physics = N
velset = 0,0

[State 7000, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = ifelse((GetHitVar(groundtype) = 1),5000,5010) + GetHitVar(animtype)

[State 7000, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030

[State 7000, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047 + GetHitVar(animtype) ;5051 - 4 + type

[State 7000, 3] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 7000, 4] ;State type gets set to aerial if getting hit up
type = StateTypeSet
trigger1 = Time = 0
trigger1 = GetHitVar(yvel) != 0 && GetHitVar(fall)
trigger2 = Pos Y != 0
value = a

[State 7000, NotHitBy] ;Invulnerabilidad P2
type = NotHitBy
trigger1 = 1
value = SCA
ignorehitpause = 1

[State 7000, 5]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) = 0
trigger1 = pos y = 0
value = 17001 ;HITG_SLIDE

[State 7000, 6]
type = ChangeState
trigger1 = HitShakeOver
value = 17030

[State 7000, FFB Light]
type = ForceFeedback
trigger1 = anim = 5000
trigger2 = anim = 5010
persistent = 0
time = 6
waveform = square

[State 7000, FFB Medium]
type = ForceFeedback
trigger1 = anim = 5001
trigger2 = anim = 5011
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 7000, FFB Hard]
type = ForceFeedback
trigger1 = anim = 5012
trigger2 = anim = 5002
trigger3 = anim = 5030
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

;---------------------------------------------------------------------------
; HITG_SLIDE
[Statedef 17001]
type    = S
movetype= H
physics = S

[State 7001, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 7001, 2]
type = ChangeAnim
trigger1 = AnimTime = 0
value = 5005 + GetHitVar(animtype) + (GetHitVar(groundtype)=2)*10

[State 7001, 3] ;Stop sliding back
type = VelMul
trigger1 = Time >= GetHitVar(slidetime)
x = .6

[State 7001, 4]
type = VelSet
trigger1 = HitOver
x = 0

[State 7001, 5]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 7000, NotHitBy] ;Invulnerabilidad P2
type = NotHitBy
trigger1 = 1
value = SCA
ignorehitpause = 1

[State 7001, 6]
type = SelfState
trigger1 = HitOver
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; HITC_SHAKE
[Statedef 17010]
type    = C
movetype= H
physics = N
velset = 0,0

[State 7010, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = 5020 + GetHitVar(animtype)

[State 7010, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030

[State 7010, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047 + GetHitVar(animtype) ;5051 - 4 + type

[State 7010, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 7000, NotHitBy] ;Invulnerabilidad P2
type = NotHitBy
trigger1 = 1
value = SCA
ignorehitpause = 1

[State 7010, 5]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) = 0
value = 17011 ;HITC_SLIDE

[State 7010, 6]
type = ChangeState
trigger1 = HitShakeOver
value = 17030

[State 7010, FFB Light]
type = ForceFeedback
trigger1 = anim = 5020
persistent = 0
time = 6
waveform = square

[State 7010, FFB Medium]
type = ForceFeedback
trigger1 = anim = 5021
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 7010, FFB Hard]
type = ForceFeedback
trigger1 = anim = 5022
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

;---------------------------------------------------------------------------
; HITC_SLIDE
[Statedef 17011]
type    = C
movetype= H
physics = C

[State 7011, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 7011, 2]
type = ChangeAnim
trigger1 = AnimTime = 0
value = 5025 + GetHitVar(animtype)

[State 7011, 3] ;Stop sliding back
type = VelMul
trigger1 = Time >= GetHitVar(slidetime)
x = .6

[State 7011, 4]
type = VelSet
trigger1 = HitOver
x = 0

[State 7011, 5]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 7000, NotHitBy] ;Invulnerabilidad P2
type = NotHitBy
trigger1 = 1
value = SCA
ignorehitpause = 1

[State 7011, 6]
type = SelfState
trigger1 = HitOver
value = 11
ctrl = 1
;---------------------------------------------------------------------------
; HITA_SHAKE
[Statedef 17020]
type    = A
movetype= H
physics = N
velset = 0,0

[State 7020, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = ifelse((GetHitVar(airtype) = 1),5000,5010) + GetHitVar(animtype)

[State 7020, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030

[State 7020, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047 + GetHitVar(animtype) ;5051 - 4 + type

[State 7020, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 7000, NotHitBy] ;Invulnerabilidad P2
type = NotHitBy
trigger1 = 1
value = SCA
ignorehitpause = 1

[State 7020, 5]
type = ChangeState
trigger1 = HitShakeOver
value = 17030

[State 7020, FFB Light]
type = ForceFeedback
trigger1 = anim = 5000
trigger2 = anim = 5010
persistent = 0
time = 6
waveform = square

[State 7020, FFB Medium]
type = ForceFeedback
trigger1 = anim = 5001
trigger2 = anim = 5011
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 7020, FFB Hard]
type = ForceFeedback
trigger1 = anim = 5012
trigger2 = anim = 5002
trigger3 = anim = 5030
trigger4 = anim = [5051,5059]
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

;---------------------------------------------------------------------------
; HITA_UP (initial going up)
[Statedef 17030]
type    = A
movetype= H
physics = N
ctrl = 0

[State 7030, 1]
type = VelAdd;Gravity
trigger1 = 1
y = GetHitVar(yaccel)

[State 7030, 2]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 7000, NotHitBy] ;Invulnerabilidad P2
type = NotHitBy
trigger1 = 1
value = SCA
ignorehitpause = 1

[State 7030, 3]
type = SelfState
triggerall = !HitFall
trigger1 = HitOver
trigger2 = Vel Y > 0    ;Hit ground
trigger2 = Pos Y >= 10  ;.
value = 5040 ;HITA_RECOV

[State 7030, 4]
type = ChangeState
triggerall = HitFall
trigger1 = HitOver
trigger2 = Vel Y > 0    ;Hit ground
trigger2 = Pos Y >= 10  ;.
value = 17050 ;HITA_FALL

[State 7030, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 17035 ;HITA_UP (transition)

;---------------------------------------------------------------------------
; HITA_UP_T (transition)
[Statedef 17035]
type    = A
movetype= H
physics = N

[State 7000, NotHitBy] ;Invulnerabilidad P2
type = NotHitBy
trigger1 = 1
value = SCA
ignorehitpause = 1

[State 7035, 1]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = SelfAnimExist(5035)
trigger1 = Anim != [5051,5059] ;Not if in hit up anim
trigger1 = Anim != 5090 ;Not if hit off ground anim
value = 5035

[State 7035, 2]
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 7035, 3]
type = SelfState
triggerall = !HitFall
trigger1 = HitOver  ;Hit is over
trigger2 = AnimTime = 0 ;Animation over
trigger3 = Vel Y > 0    ;Hit ground
trigger3 = Pos Y >= 10  ;.
trigger4 = Time = 0     ;No transition anim
trigger4 = Anim != 5035 ;.
value = 5040 ;HITA_RECOV

[State 7035, 4]
type = ChangeState
triggerall = HitFall
trigger1 = HitOver  ;Hit is over
trigger2 = AnimTime = 0 ;Anim is over
trigger3 = Vel Y > 0    ;Hit ground
trigger3 = Pos Y >= 10  ;.
trigger4 = Time = 0     ;No transition anim
trigger4 = Anim != 5035 ;.
value = 17050 ;HITA_FALL

;---------------------------------------------------------------------------
; HITA_FALL (knocked up, falling)
[Statedef 17050]
type    = A
movetype= H
physics = N

[State 7000, NotHitBy] ;Invulnerabilidad P2
type = NotHitBy
trigger1 = 1
value = SCA
ignorehitpause = 1

[State 7050, 1] ;Change anim when done with transition
type = ChangeAnim
trigger1 = AnimTime = 0
trigger1 = Anim = 5035
trigger2 = Time = 0     ;If no transition anim
trigger2 = Anim != 5035
trigger2 = (Anim != [5051, 5059]) && (Anim != [5061, 5069])
trigger2 = Anim != 5090 ;Not if hit off ground anim
value = 5050

[State 7050, 2] ;Coming down anim
type = ChangeAnim
trigger1 = anim = [5050,5059]
trigger1 = Vel Y >= ifelse(anim = 5050, 1, -2)
trigger1 = SelfAnimExist(anim+10)
value = anim+10
persistent = 0

[State 7050, 3] ;Gravity
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 7050, 6]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= ifelse((anim = [5051,5059]) || (anim = [5061,5069]), 0, 25)
value = 5105 ;HIT_BOUNCE
;-------------------------------------------------------------------------------
;KO Flash Effect
[Statedef 9910]
type = S
ctrl = 0
anim = 999

[State 2000, 挻昁嶦媄敪摦偺帪娫掆巭]
type = SuperPause
trigger1 = time = 0
anim = -1
poweradd = 0
movetime = -1
time = 30
darken = 0

[State 1000, Sp Finish]
type = Explod
trigger1 = time = 0
anim = f9910
removetime = -2
id = 9910
sprpriority = -9
pos = 0,0
postype = left
bindtime = -1
ignorehitpause = 1
supermove = 1
pausemove = 1
pausemovetime = 99999
supermovetime = 99999
ownpal = 1

[State 1000, AllPalFX]
type = AllPalFX
trigger1 = time = 0
time = 51
add = 0,0,0
sinadd = 90,90,90,100
invertall = 0
color = 256

[State 1000, DestroySelf]
type = DestroySelf
trigger1 = time = 999
ignorehitpause = 1
persistent = 0
;-------------------------------------------------------------------------------
;Colicion Extra En Movetype H
[Statedef 5350]
type = S
ctrl = 0
anim = 5350

[State 5350, BindToParent]
type = BindToParent
trigger1 = root,stateno = [5070,5071]
facing = 0
pos = 0,0

[State 5350, BindToParent]
type = BindToParent
trigger1 = root,stateno = [5030,5050]
facing = 0
pos = 0,-30

[State 5350, BindToParent]
type = BindToParent
trigger1 = root,stateno = [8030,8050]
facing = 0
pos = 0,-30

[State 5350, BindToParent]
type = BindToParent
trigger1 = root,stateno = [17030,17050]
facing = 0
pos = 0,-30

[State 5350, BindToParent]
type = BindToParent
trigger1 = root,stateno = 5100
facing = 0
pos = 0,0

[State 5350, BindToParent]
type = BindToParent
trigger1 = root,stateno = [5101,5105]
facing = 0
pos = 0,-10

[State 5350, BindToParent]
type = BindToParent
trigger1 = root,stateno = 5055
facing = 0
pos = 0,-30

[State 5350, BindToParent]
type = BindToParent
trigger1 = root,stateno = [5110,5175]
facing = 0
pos = 0,0

[State 5350, BindToParent]
type = BindToParent
trigger1 = root,stateno = [5370,5460]
facing = 0
pos = 0,-10

[State 5350, BindToParent]
type = BindToParent
trigger1 = root,stateno = 5250
facing = 0
pos = 0,0

[State 5350, BindToParent]
type = BindToParent
trigger1 = root,stateno = [5080,5081]
facing = 0
pos = 0,0

[State 5350, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 5350, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 1

[State 5350, DestroySelf]
type = DestroySelf
trigger1 = root,stateno != [5030,5170]
trigger1 = root,stateno != [7030,7050]
trigger1 = root,stateno != [8030,8050]
trigger1 = root,stateno != [5370,5460]
trigger1 = root,stateno != [17030,17050]
trigger1 = root,stateno != 5250
trigger2 = root,life = 0
ignorehitpause = 1
persistent = 0

;---------------------------------------------------------------------------
;Warning
[Statedef 9950]
type = S
ctrl = 0
anim = 999
velset = 0,0

[State 1000, Explod]
type = Explod
trigger1 = time = 1
anim = f7050
ID = 7050
pos = 0,0
postype = back
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
sprpriority = 9
ontop = 1
ownpal = 1

[State 1000, Explod]
type = Explod
triggerall = partner,numexplod(7051) <= 0
trigger1 = time = 1 && teamside = 1
anim = f7051
ID = 7051
pos = -86,110
postype = back
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
sprpriority = 999
ontop = 1
ownpal = 1

[State 1000, Explod]
type = Explod
triggerall = partner,numexplod(7051) <= 0
trigger1 = time = 1 && teamside = 2
anim = f7051
ID = 7051
pos = -86,110
postype = front
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
sprpriority = 999
ontop = 1
ownpal = 1

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = time = 1
trigger2 = time = 70
value = f5200,4
volumescale = 255
channel = 10

[State 1000, DestroySelf]
type = null;DestroySelf
trigger1 = time = 99999999999

;-------------------------------------------------------------------------------
;Unlock Characters Kusanagi
[Statedef 10000]
type = S
ctrl = 0
anim = 999
velset = 0,0

[State 1000, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = roundnotover

[State 1000, ChangeState]
type = ChangeState
trigger1 = time = 350
value = 10005
;-------------------------------------------------------------------------------
;Unlock Characters Kusanagi
[Statedef 10005]
type = S
ctrl = 0
anim = 999
velset = 0,0

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = -1
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 1
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 2
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 3
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 4
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 5
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 6
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 7
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 8
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 9
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 10
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 11
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 12
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 13
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 14
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 15
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 16
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 17
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 18
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 19
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 20
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 21
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 22
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 23
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 24
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 25
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 26
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 27
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 28
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 2
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 29
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 30
ignorehitpause = 1

;Fondo Negro
[State 1000, Explod]
type = Explod
trigger1 = time = 0
anim = f8015
pos = 0,0
facing = 1
vfacing = 1
postype = back
bindtime = -1
removetime = -1
sprpriority = 99
ontop = 1
ownpal = 1

;Fondo LV2
[State 1000, Explod]
type = Explod
trigger1 = time = 50
anim = f8000
ID = 8010
pos = 0,0
postype = back
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
sprpriority = 99
ontop = 1
ownpal = 1

;Carteles "Unlock"
[State 1000, Explod]
type = Explod
trigger1 = time = 50
anim = f8001
pos = 140,150
postype = back
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
sprpriority = 9999
ontop = 1
ownpal = 1

;Carteles "Unlock" 2
[State 1000, Explod]
type = Explod
trigger1 = time = 90
anim = f8001
pos = 20,50
postype = back
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
sprpriority = 9999
ontop = 1
ownpal = 1

;Carteles "Unlock" 3
[State 1000, Explod]
type = Explod
trigger1 = time = 130
anim = f8001
pos = 0,125
postype = back
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
sprpriority = 9999
ontop = 1
ownpal = 1

;Carteles "Unlock" 4
[State 1000, Explod]
type = Explod
trigger1 = time = 160
anim = f8001
pos = 200,60
postype = back
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
sprpriority = 9999
ontop = 1
ownpal = 1

;Carteles "Congratulations"
[State 1000, Explod]
type = Explod
trigger1 = time = 60
anim = f8002
pos = 114,167
postype = back
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
sprpriority = 99999
ontop = 1
ownpal = 1

;Characters Images
[State 1000, Explod]
type = Explod
trigger1 = time = 400
anim = f8003
pos = 160,160
postype = back
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
sprpriority = 99999
ontop = 1
ownpal = 1

;Pass
[State 1000, Explod]
type = Explod
trigger1 = time = 700
anim = f8010
pos = 133,180
postype = back
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
sprpriority = 99999
ontop = 1
ownpal = 1

[State 1000, AssertSpecial]
type = AssertSpecial
trigger1 = time = [0,3000]
flag = roundnotover
flag2 = nomusic

[State 1000, DestroySelf]
type = DestroySelf
trigger1 = time = 9999

;-------------------------------------------------------------------------------
;Unlock Characters Minase Yuka
[Statedef 10010]
type = S
ctrl = 0
anim = 999
velset = 0,0

[State 1000, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = roundnotover

[State 1000, ChangeState]
type = ChangeState
trigger1 = time = 350
value = 10015
;-------------------------------------------------------------------------------
;Unlock Characters Minase Yuka
[Statedef 10015]
type = S
ctrl = 0
anim = 999
velset = 0,0

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = -1
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 1
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 2
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 3
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 4
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 5
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 6
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 7
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 8
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 9
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 10
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 11
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 12
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 13
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 14
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 15
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 16
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 17
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 18
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 19
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 20
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 21
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 22
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 23
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 24
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 25
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 26
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 27
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 28
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 2
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 29
ignorehitpause = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 30
ignorehitpause = 1

;Fondo Negro
[State 1000, Explod]
type = Explod
trigger1 = time = 0
anim = f8015
pos = 0,0
facing = 1
vfacing = 1
postype = back
bindtime = -1
removetime = -1
sprpriority = 99
ontop = 1
ownpal = 1

;Fondo LV2
[State 1000, Explod]
type = Explod
trigger1 = time = 50
anim = f8000
ID = 8010
pos = 0,0
postype = back
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
sprpriority = 99
ontop = 1
ownpal = 1

;Carteles "Unlock"
[State 1000, Explod]
type = Explod
trigger1 = time = 50
anim = f8001
pos = 140,150
postype = back
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
sprpriority = 9999
ontop = 1
ownpal = 1

;Carteles "Unlock" 2
[State 1000, Explod]
type = Explod
trigger1 = time = 90
anim = f8001
pos = 20,50
postype = back
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
sprpriority = 9999
ontop = 1
ownpal = 1

;Carteles "Unlock" 3
[State 1000, Explod]
type = Explod
trigger1 = time = 130
anim = f8001
pos = 0,125
postype = back
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
sprpriority = 9999
ontop = 1
ownpal = 1

;Carteles "Unlock" 4
[State 1000, Explod]
type = Explod
trigger1 = time = 160
anim = f8001
pos = 200,60
postype = back
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
sprpriority = 9999
ontop = 1
ownpal = 1

;Carteles "Congratulations"
[State 1000, Explod]
type = Explod
trigger1 = time = 60
anim = f8002
pos = 114,167
postype = back
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
sprpriority = 99999
ontop = 1
ownpal = 1

;Characters Images
[State 1000, Explod]
type = Explod
trigger1 = time = 400
anim = f8004
pos = 160,160
postype = back
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
sprpriority = 99999
ontop = 1
ownpal = 1

;Pass
[State 1000, Explod]
type = Explod
trigger1 = time = 700
anim = f8011
pos = 133,180
postype = back
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
sprpriority = 99999
ontop = 1
ownpal = 1

[State 1000, AssertSpecial]
type = AssertSpecial
trigger1 = time = [0,3000]
flag = roundnotover
flag2 = nomusic

[State 1000, DestroySelf]
type = DestroySelf
trigger1 = time = 9999
