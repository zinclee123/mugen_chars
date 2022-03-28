;=====================================================
; 远轻拳
;=====================================================
[Statedef 200]
type = S
movetype = A
physics = S
anim = 200
velset = 0,0
ctrl = 0
facep2 = 1

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = time = 0
value = 5,0

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = !time && random <= 700
value = 200,0
channel = 0

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 4
movetype = I

[State 205, 1]
type = HitDef
trigger1 = AnimElem = 3
attr = S, NA
damage = 40 * fvar(39)
animtype = Light
air.animtype = Back
ground.type = High
guardflag = M
hitflag = MAF
sparkno = s27000
sparkxy = -10, -75
hitsound = s5,1
guardsound = s5, 12
guard.sparkno = s27500
priority = 6, Hit
pausetime = 12,13
guard.pausetime = 11,11
ground.slidetime = 9
ground.hittime = 9
guard.hittime = 9
guard.slidetime = 9
guard.ctrltime = 16
ground.velocity = -5.796875
air.velocity = -4.5,-6.5
air.juggle = 0
getpower = 47,47
givepower = 16,16
air.fall = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
id = 200

[State 200,1]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;=====================================================
; 远轻拳
;=====================================================
[Statedef 205]
type = S
movetype = A
physics = S
anim = 205
velset = 0,0
ctrl = 0
facep2 = 1

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = time = 0
value = 5,0

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = !time && random <= 700
value = 200,0
channel = 0

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 4
movetype = I

[State 200, Hit Def]
type = HitDef
trigger1 = AnimElem = 3
attr = S, NA
damage = 30 * fvar(39)
animtype = Light
air.animtype = Back
ground.type = High
guardflag = M
hitflag = MAF
priority = 6, Hit
sparkno = s27000
sparkxy = -10 , -80
hitsound = s5,1
guardsound = s5, 12
guard.sparkno = s27500
pausetime = 12,13
guard.pausetime = 11,11
ground.slidetime = 9
ground.hittime = 9
guard.hittime = 9
guard.slidetime = 9
guard.ctrltime = 16
ground.velocity = -4
air.velocity = -4.5,-6.5
air.juggle = 0
getpower = 47,47
givepower = 16,16
air.fall = 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
id = 200

[State 205,2]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;=====================================================
; 远重拳
;=====================================================
[Statedef 210]
type = S
movetype = A
physics = S
anim = 210
velset = 0,0
ctrl = 0
facep2 = 1

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = time = 0
value = 5,2

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = !time && random <= 700
value = 210,0
channel = 0

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 7
movetype = I

[State 210, 1]
type = HitDef
trigger1 = animelem = 5
attr = S, NA
damage = 100 * fvar(39)
animtype = Hard
air.animtype = Back
ground.type = High
guardflag = M
hitflag = MAF
priority = 5, Hit
sparkno = s27001
sparkxy = -10, -90
hitsound = s5,3
guardsound = s5, 12
guard.sparkno = s27501
pausetime = 12,13
guard.pausetime = 11,11
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 28
ground.velocity = -11.1796875
air.type = High
air.velocity = -4.5,-6.5
air.hittime = 13
air.juggle = 0
getpower = 94,94
givepower = 16,16
air.fall = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5

[State 210,2]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;=====================================================
; 近重拳
;=====================================================
[Statedef 215]
type = S
movetype = A
physics = N
anim = 215
velset = 0,0
ctrl = 0
facep2 = 1

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = time = 0
value = 5,2

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = !time && random <= 700
value = 210,0
channel = 0

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 6
movetype = I

[State 210, 1]
type = HitDef
trigger1 = AnimElem = 3
attr = S, NA
damage = 50 * fvar(39)
animtype = Hard
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 5, Hit
sparkno = s27001
sparkxy = -20, -60
hitsound = s5,3
guardsound = s5, 12
guard.sparkno = s27501
pausetime = 12,13
guard.pausetime = 11,11
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 28
ground.velocity = 0
air.type = High
air.velocity = -4.5,-6.5
air.hittime = 13
air.juggle = 0
getpower = 94,94
givepower = 16,16
id = 200
air.fall = 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5

[State 210, 1]
type = HitDef
trigger1 = AnimElem = 5
attr = S, NA
damage = 30 * fvar(39)
animtype = Hard
air.animtype = Back
ground.type = High
guardflag = M
hitflag = MAF
priority = 5, Hit
sparkno = s27001
sparkxy = -20, -100
hitsound = s5,3
guardsound = s5, 12
guard.sparkno = s27501
pausetime = 12,13
guard.pausetime = 11,11
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 28
ground.velocity = -5
air.type = High
air.velocity = -4.5,-6.5
air.hittime = 13
air.juggle = 0
getpower = 94,94
givepower = 16,16
id = 200
air.fall = 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5

[State 1000, ステート変更]
type = ChangeState
trigger1 = Animelem = 8,>= 6
value = 0
ctrl = 1
;=====================================================
; 远轻脚
;=====================================================
[Statedef 300]
type = S
movetype = A
physics = N
anim = 300
velset = 0,0
ctrl = 0
facep2 = 1

[State 300, Kick Attempt Sound]
type = PlaySnd
trigger1 = time = 0
value = 5,4

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = !time && random <= 700
value = 200,0
channel = 0

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 4
movetype = I

[State 205, 1]
type = HitDef
trigger1 = animelem = 3
attr = S, NA
damage = 41 * fvar(39)
animtype = Light
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
sparkno = s27000
sparkxy = -10, -40
hitsound = s5,5
guardsound = s5, 12
guard.sparkno = s27500
priority = 6, Hit
pausetime = 12,13
guard.pausetime = 11,11
ground.slidetime = 9
ground.hittime = 9
guard.hittime = 10
guard.slidetime = 10
guard.ctrltime = 17
ground.velocity = -5.796875
air.velocity = -4.5,-6.5
air.hittime = 13
air.juggle = 0
getpower = 47,47
givepower = 16,16
air.fall = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5

[State 300,2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;=====================================================
; 近轻脚
;=====================================================
[Statedef 305]
type = S
movetype = A
physics = N
anim = 305
velset = 0,0
ctrl = 0
facep2 = 1

[State 300, Kick Attempt Sound]
type = PlaySnd
trigger1 = time = 0
value = 5,4

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = !time && random <= 700
value = 210,0
channel = 0

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 4
movetype = I

[State 205, 1]
type = HitDef
trigger1 = animelem = 3
attr = S, NA
damage = 33 * fvar(39)
animtype = Light
air.animtype = Back
ground.type = Low
guardflag = L
hitflag = MAF
sparkno = s27000
sparkxy = -20, -30
hitsound = s5,5
guardsound = s5, 12
guard.sparkno = s27500
priority = 6, Hit
pausetime = 12,13
guard.pausetime = 11,11
ground.slidetime = 12
ground.hittime = 12
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
ground.velocity = -4
air.velocity = -4.5,-6.5
air.hittime = 13
air.juggle = 0
getpower = 47,47
givepower = 16,16
air.fall = 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5

[State 1000, ステート変更]
type = ChangeState
trigger1 = Animelem = 6,>= 4
value = 0
ctrl = 1

;=====================================================
; 远重脚
;=====================================================
[Statedef 310]
type = S
movetype = A
physics = S
anim = 310
velset = 0,0
ctrl = 0
facep2 = 1

[State 300, Kick Attempt Sound]
type = PlaySnd
trigger1 = time = 0
value = 3+(1*2),6

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = !time && random <= 700
value = 210,0
channel = 0

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 8
movetype = I

[State 210, 1]
type = HitDef
trigger1 = animelem = 5
attr = S, NA
damage = 108 * fvar(39)
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 5, Hit
sparkno = s27001
sparkxy = -20, -90
hitsound = s5,7
guardsound = s5, 12
guard.sparkno = s27501
ground.type = High
pausetime = 12,13
guard.pausetime = 11,11
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 28
ground.velocity = -11.1796875
air.type = High
air.velocity = -4.5,-6.5
air.hittime = 13
air.juggle = 0
getpower = 94,94
givepower = 16,16
id = 310
air.fall = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5


[State 320,2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;=====================================================
; 近重脚
;=====================================================
[Statedef 315]
type = S
movetype = A
physics = N
anim = 315
velset = 0,0
ctrl = 0
facep2 = 1

[State 300, Kick Attempt Sound]
type = PlaySnd
trigger1 = time = 0
value = 5,6

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = !time && random <= 700
value = 210,0
channel = 0

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 5
movetype = I

[State 210, 1]
type = HitDef
trigger1 = animelem = 4
attr = S, NA
damage = 80 * fvar(39)
animtype = Hard
air.animtype = back
guardflag = L
hitflag = MAF
priority = 5, Hit
sparkno = s27001
sparkxy = -20, -20
hitsound = s5,7
guardsound = s5, 12
guard.sparkno = s27501
ground.type = Low
pausetime = 8,16
guard.pausetime = 12,11
ground.slidetime = 17
ground.hittime = 20
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 28
ground.velocity = -10
air.type = High
air.velocity = -4.5,-6.5
air.hittime = 13
air.juggle = 0
getpower = 94,94
givepower = 16,16
air.fall = 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5

[State 320,2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;=====================================================
; 蹲轻拳
;=====================================================
[Statedef 400]
type = C
movetype = A
physics = N
anim = 400
ctrl = 0
velset = 0,0
facep2 = 1

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = time = 0
value = 3+(1*2),0

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = !time && random <= 700
value = 200,0
channel = 0

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 4
movetype = I

[State 200, Hit Def]
type = HitDef
trigger1 = animelem = 3
attr = C, NA
damage = 25 * fvar(39)
animtype = Light
air.animtype = back
guardflag = M
hitflag = MAF
priority = 6, Hit
sparkno = s27000
sparkxy = -10, -50
hitsound = s5,1
guardsound = s5, 12
guard.sparkno = s27500
ground.type = low
priority = 6, Hit
pausetime = 12,13
guard.pausetime = 11,11
ground.slidetime = 12
ground.hittime = 12
guard.hittime = 16
guard.slidetime = 16
guard.ctrltime = 16
ground.velocity = -5
air.velocity = -4.5,-6.5
air.juggle = 0
getpower = 47,47
givepower = 16,16
air.fall = 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5

[State 400,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1


;=====================================================
; 蹲重拳
;=====================================================
[Statedef 405]
type = C
movetype = A
physics = N
anim = 405
ctrl = 0
velset = 0,0
facep2 = 1

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = time = 0
value = 5,2

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = !time && random <= 700
value = 210,0
channel = 0

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 6
movetype = I

[State 210, 1]
type = HitDef
trigger1 = animelem = 3
attr = C, NA
damage = 108 * fvar(39)
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 5, Hit
sparkno = s27001
sparkxy = -10, -60
hitsound = s5,3
guardsound = s5, 12
guard.sparkno = s27501
ground.type = High
pausetime = 12,13
guard.pausetime = 11,11
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 28
ground.velocity = -11.1796875
air.type = High
air.velocity = -4.5,-6.5
air.hittime = 13
air.juggle = 0
getpower = 94,94
givepower = 16,16
air.fall = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
id = 200


[State 210, 1]
type = HitDef
trigger1 = hitcount = 0
trigger1 = animelem = 5
attr = C, NA
damage = 108 * fvar(39)
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 5, Hit
sparkno = s27001
sparkxy = -10, -75
hitsound = s5,3
guardsound = s5, 12
guard.sparkno = s27501
ground.type = High
pausetime = 12,13
guard.pausetime = 11,11
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 28
ground.velocity = -11.1796875
air.type = High
air.velocity = -4.5,-6.5
air.hittime = 13
air.juggle = 0
getpower = 94,94
givepower = 16,16
air.fall = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
id = 200


[State 405,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1


;=====================================================
; 蹲轻脚
;=====================================================
[Statedef 500];Ok
type = c
movetype = A
physics = N
anim = 500
ctrl = 0
velset = 0,0
facep2 = 1

[State 300, Kick Attempt Sound]
type = PlaySnd
trigger1 = time = 0
value = 5,4

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = !time && random <= 700
value = 200,0
channel = 0

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 4
movetype = I

[State 200, Hit Def]
type = HitDef
trigger1 = animelem = 3
attr = C, NA
damage = 25 * fvar(39)
animtype = Light
air.animtype = back
guardflag = L
hitflag = M
priority = 6, Hit
sparkno = s27000
sparkxy = -10, -10
hitsound = s5,5
guardsound = s5, 12
guard.sparkno = s27500
ground.type = low
priority = 7, Hit
pausetime = 12,13
guard.pausetime = 11,11
ground.slidetime = 12
ground.hittime = 12
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
ground.velocity = -5
air.velocity = -4.5,-6.5
air.hittime = 13
air.juggle = 0
getpower = 47,47
givepower = 16,16
air.fall = 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5

[State 500,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1


;=====================================================
; 蹲重脚
;=====================================================
[Statedef 505];Ok
type = c
movetype = A
physics = C
anim = 505
ctrl = 0
velset = 0,0
facep2 = 1

[State 300, Kick Attempt Sound]
type = PlaySnd
trigger1 = time = 0
value = 5,6

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = !time && random <= 700
value = 210,0
channel = 0

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 5
movetype = I

[State 210, 1]
type = HitDef
trigger1 = animelem = 4
attr = C, NA
damage = 100 * fvar(39)
animtype = Hard
air.animtype = back
guardflag = L
hitflag = MAF
priority = 5, Hit
sparkno = s27001
sparkxy = -10, -20
hitsound = s5,7
guardsound = s5, 12
guard.sparkno = s27501
ground.type = Trip
pausetime = 12,13
guard.pausetime = 11,11
ground.slidetime = 27
ground.hittime = 27
guard.hittime = 18
guard.slidetime = 18
guard.ctrltime = 29
ground.velocity = -1.75,-10.25341796875
guard.velocity = -11.1796875
air.type = High
air.velocity = -5.5,-8.5
air.hittime = 13
air.juggle = 0
getpower = 94,94
givepower = 16,16
fall = 1
fall.recover = 1
fall.recovertime = 120
id = 506
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.807692307692307692307692307692308

[State 510,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1


;=====================================================
; 空中轻拳
;=====================================================
[Statedef 600]
type = A
movetype = A
physics = N
anim = 600
ctrl = 0

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = time = 0
value = 5,0

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = !time && random <= 700
value = 200,0
channel = 0

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 4
movetype = I

[State 50, Gravity]
type = Gravity
trigger1 = prevstateno != 40
trigger2 = prevstateno = 40 && time > 0

[State 600, 1]
type = HitDef
trigger1 = animelem = 3
attr = A, NA
damage = 50 * fvar(39)
animtype = Medium
guardflag = H
hitflag = MAF
priority = 6, Hit
sparkno = s27000
sparkxy = -10, -40
hitsound = s5,1
guardsound = s5, 12
guard.sparkno = s27500
pausetime = 12,13
guard.pausetime = 11,11
ground.slidetime = 9
ground.hittime = 9
guard.hittime = 9
guard.slidetime = 9
guard.ctrltime = 17
ground.type = low
ground.velocity = -5.796875
air.velocity = -4.5,-6.5
air.juggle = 0
getpower = 47,47
givepower = 16,16
air.fall = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5

[State 40, 6]
type = ChangeState
trigger1 = Pos Y + Vel Y >= 0
value = 52

;=====================================================
; 空中重拳
;=====================================================
[Statedef 610]
type = A
movetype = A
physics = N
anim = 610
ctrl = 0
juggle = 8

[State 100, 3] ;Prevent from turning
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = time = 0
value = 5,2

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = !time && random <= 700
value = 210,0
channel = 0

[State 50, Gravity]
type = Gravity
trigger1 = prevstateno != 40
trigger2 = prevstateno = 40 && time > 0

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = anim = 610 && AnimElem = 5
trigger2 = anim = 615 && AnimElem = 4
movetype = I

[State 600, 1]
type = HitDef
trigger1 = anim = 610 && AnimElem = 3
attr = A, NA
damage = 80 * fvar(39)
animtype = medium
guardflag = H
hitflag = MAF
priority = 5, Hit
sparkno = s27001
sparkxy = -10, -50
hitsound = s5,3
guardsound = s5,12
guard.sparkno = s27501
ground.type = Low
pausetime = 11,13
guard.pausetime = 12,12
ground.slidetime = 12
ground.hittime = 15
guard.hittime = 22
guard.slidetime = 22
guard.ctrltime = 22
ground.velocity = -5.796875
guard.velocity = -11.1796875
air.velocity = -4.5,-6.5
air.juggle = 0
getpower = 94,94
givepower = 16,16
air.fall = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
persistent = 0
id = 200

[State 600, 1]
type = HitDef
trigger1 = anim = 615 && AnimElem = 3
attr = A, NA
damage = 98 * fvar(39)
animtype = m
guardflag = H
hitflag = MAF
priority = 5, Hit
sparkno = s27001
sparkxy = -10, -60
hitsound = s5,3
guardsound = s5,12
guard.sparkno = s27501
ground.type = Low
pausetime = 12,13
guard.pausetime = 12,12
ground.slidetime = 12
ground.hittime = 15
guard.hittime = 13
guard.slidetime = 10
guard.ctrltime = 22
ground.velocity = -5.796875
guard.velocity = -11.1796875
air.velocity = -4.5,-6.5
air.juggle = 0
getpower = 94,94
givepower = 16,16
air.fall = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
persistent = 0
id = 200


[State 40, 6]
type = ChangeState
trigger1 = Pos Y + Vel Y >= 0
value = 52



;=====================================================
; 空中轻脚
;=====================================================
[Statedef 700]
type = A
movetype = A
physics = N
anim = 700+ ifelse((Vel X != 0),5,0)
ctrl = 0

[State 300, Kick Attempt Sound]
type = PlaySnd
trigger1 = time = 0
value = 3+(1*2),4

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = !time && random <= 700
value = 200,0
channel = 0

[State 50, Gravity]
type = Gravity
trigger1 = prevstateno != 40
trigger2 = prevstateno = 40 && time > 0

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = anim = 700 && AnimElem = 11
trigger2 = anim = 705 && AnimElem = 16
movetype = I

[State 600, 1]
type = HitDef
trigger1 = anim = 700 && AnimElem = 3
attr = A, NA
damage = 58 * fvar(39)
animtype = m
guardflag = H
hitflag = MAF
priority = 6, Hit
sparkno = s27000
sparkxy = -10, -40
hitsound = s5,5
guardsound = s5,12
guard.sparkno = s27500
ground.type = Low
pausetime = 12,13
guard.pausetime = 12,12
ground.slidetime = 9
ground.hittime = 9
guard.hittime = 9
guard.slidetime = 9
guard.ctrltime = 17
ground.velocity = -5.796875
air.velocity = -4.5,-6.5
air.juggle = 0
getpower = 47,47
givepower = 16,16
air.fall = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
persistent = 0

[State 600, 1]
type = HitDef
trigger1 = anim = 705 && AnimElem = 4
attr = A, NA
damage = 41 * fvar(39)
animtype = m
guardflag = H
hitflag = MAF
priority = 6, Hit
sparkno = s27000
sparkxy = -10, -40
hitsound = s5,5
guardsound = s5,12
guard.sparkno = s27500
ground.type = Low
pausetime = 12,13
guard.pausetime = 12,12
ground.slidetime = 9
ground.hittime = 9
guard.hittime = 9
guard.slidetime = 9
guard.ctrltime = 17
ground.velocity = -5.796875
air.velocity = -4.5,-6.5
air.juggle = 0
getpower = 47,47
givepower = 16,16
air.fall = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
persistent = 0

[State 40, 6]
type = ChangeState
trigger1 = Pos Y + Vel Y >= 0
value = 52


;=====================================================
; 空中重脚
;=====================================================
[Statedef 710]
type = A
movetype = A
physics = N
anim = 710
ctrl = 0

[State 100, 3] ;Prevent from turning
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = time = 0
value = 3+(1*2),2

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = !time && random <= 700
value = 210,0
channel = 0

[State 50, Gravity]
type = Gravity
trigger1 = prevstateno != 40
trigger2 = prevstateno = 40 && time > 0

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 6
movetype = I

[State 600, 1]
type = HitDef
triggerall = MoveContact = 0
trigger1 = animelem = 4
trigger2 = animelem = 5
attr = A, NA
damage = 83 * fvar(39)
animtype = m
guardflag = HA
hitflag = MAF
priority = 5, Hit
sparkno = s27001
sparkxy = -10, -70
hitsound = s5,7
guardsound = s5, 12
guard.sparkno = s27501
ground.type = Low
pausetime = 12,13
guard.pausetime = 12,12
ground.slidetime = 12
ground.hittime = 15
guard.hittime = 22
guard.slidetime = 22
guard.ctrltime = 22
ground.velocity = -5.796875
guard.velocity = -5.796875
air.velocity = -4.5,-6.5
air.juggle = 0
getpower = 94,94
givepower = 16,16
air.fall = 0
nochainid = 710
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
id = 200

[State 40, 6]
type = ChangeState
trigger1 = Pos Y + Vel Y >= 0
value = 52



;=====================================================
; 前AB
;=====================================================
[Statedef 750]
type = S
movetype= I
physics = N
velset = 0,0
ctrl = 0
anim = ifelse((prevstateno=[150,152]),751,750)

[State 3000, 超必殺技発動の時間停止]
type = SuperPause
trigger1 = (prevstateno=[150,152]) && AnimElem = 1
anim = -1
movetime = 10
time = 10
p2defmul = 1.0
darken = 0

[State 750, VelSet]
type = VelSet
triggerall = var(59) = 0
trigger1 = animelem = 3
trigger1 = anim = 750
x = 6+((prevstateno = [99,101])*2)

[State 750, VelSet]
type = VelSet
triggerall = var(59)
trigger1 = animelem = 3
x = 6.5

[State 750, VelSet]
type = VelSet
trigger1 = animelem = 8
x = 0

[State 320, Voice]
type = PlaySnd
trigger1 = animelem = 1
value = 1020,1

[State 750, Push]
type = PlayerPush
trigger1 = AnimElemTime(1) > 0 && AnimElemTime(8) < 0
value = 0

[State 750, Width]
type = Width
trigger1 = Vel X != 0
edge = 10,0

[State 810, 1]
type = AfterImage
trigger1 = time = 8
time = 10
length = 6
framegap = 4
palcontrast = 256,256,256
paladd = 0,0,0
palmul = 1,1,1

[State 750, PowerAdd]
type = PowerAdd
trigger1 = prevstateno = 150
trigger2 = prevstateno = 151
trigger3 = prevstateno = 152
value = -1000
persistent = 0

[State 750, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 750, 1]
type = Changestate
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;=====================================================
; 后AB
;=====================================================
[Statedef 760]
type = S
movetype= I
physics = N
velset = 0,0
ctrl = 0
anim = ifelse((prevstateno=[150,151]),761,760)

[State 750, VelSet]
type = VelSet
trigger1 = animelem = 4
x = -6

[State 750, VelSet]
type = VelSet
trigger1 = animelem = 9
x = 0

[State 750, Width]
type = Width
trigger1 = Vel X != 0
edge = 10,0

[State 320, Voice]
type = PlaySnd
trigger1 = animelem = 1
value = 1020,1

[State 750, Push]
type = PlayerPush
trigger1 = AnimElemTime(1) > 0 &&  AnimElemTime(9) < 0
value = 0

[State 810, 1]
type = AfterImage
trigger1 = time = 8
time = 10
length = 6
framegap = 3
palcontrast = 256,256,256
paladd = 0,0,0
palmul = 1,1,1

[State 750, PowerAdd]
type = PowerAdd
trigger1 = prevstateno = 150
trigger2 = prevstateno = 151
value = -1000
persistent = 0

[State 750, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 750, 1]
type = Changestate
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;=====================================================
; 原地爆气红
;=====================================================
[Statedef 780]
type = S
physics = S
movetype= I
ctrl = 0
anim = 790
velset = 0,0

[State 40002, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S14100,0
volume = 200

[State -2, Helper]
type = Helper
trigger1 = !time
helpertype = normal
ID = 70002
stateno = 70007
pos = 160,120
postype = left    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 999999999999
pausemovetime = 999999999999
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = animelemtime(3) = 0
anim = 14130
id = 14130
pos = -7,-75
postype = p1
supermovetime = 9999
pausemovetime = 9999
supermove = 1
sprpriority = -2
ownpal = 1
bindtime = -1

[State 3000, EnvShake]
type = EnvShake
trigger1 = animelemtime(3) = 0
time = 14
freq = 180
ampl = -6
persistent = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;=====================================================
; 原地爆气黄
;=====================================================
[Statedef 790]
type = S
physics = S
movetype= I
ctrl = 0
anim = 790
velset = 0,0
sprpriority = 1

[State 790]
type = VarSet
trigger1 = time = 0
fvar(39) = 0.6

[State 790, PowerAdd]
type = PowerAdd
trigger1 = time = 0
value = -1000

[State 40002, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S14100,0
volume = 200

[State -2, Helper]
type = Helper
trigger1 = !time
helpertype = normal
name = "MAX"
ID = 70001
stateno = 70005
pos = 160,120
postype = left    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 999999999999
pausemovetime = 999999999999
ignorehitpause = 1

[State 750 星]
type = Explod
trigger1 = AnimElem = 1
anim = 14130
postype = P1
pos = 0, -80
sprpriority = 5
ownpal = 1

[State 3000, EnvShake]
type = EnvShake
trigger1 = animelemtime(3) = 0
time = 14
freq = 180
ampl = -6
persistent = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;=====================================================
; BC爆气黄
;=====================================================
[Statedef 791]
type = S
physics = S
movetype= I
ctrl = 0
anim = 791
velset = 0,0
sprpriority = 1

[State 790]
type = VarSet
trigger1 = time = 0
fvar(39) = 0.4

[State 790, PowerAdd]
type = PowerAdd
trigger1 = time = 0
value = -2000

[State 40002, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S14100,1
volume = 200

[State 751, ChangeState]
type = ChangeState
triggerall = AnimTime = 0
;trigger1 = var(59)
trigger1 = enemynear(var(58)),statetype = S
value = 34

[State 751, ChangeState]
type = ChangeState
triggerall = AnimTime = 0
;trigger1 = var(59)
trigger1 = enemynear(var(58)),statetype = C
value = 99

[State -2, Helper]
type = Helper
trigger1 = !time
helpertype = normal
name = "MAX"
ID = 70001
stateno = 70005
pos = 160,120
postype = left    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 999999999999
pausemovetime = 999999999999
ignorehitpause = 1


[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;=====================================================
; 一英寸
;=====================================================
[Statedef 800]
type = S
movetype = A
physics = N
anim = 800
ctrl = 0
velset = 0

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = animelem = 5
value = 3+(1*2),2

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = animelem = 5
value = 800,0
channel = 0

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 8
movetype = I

[State 5100, EnvShake]
type = EnvShake
trigger1 = animelem = 5
time = 10
freq = 180
ampl = -4

[State 210, 1]
type = HitDef
triggerall = p2stateno != [10900,10904]
triggerall = !var(56)
trigger1 = AnimElem = 6
attr = S, NA
damage = 83 * fvar(39)
animtype = Hard
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 5, Hit
sparkno = s27001
sparkxy = -20, -60
hitsound = s5,9
guardsound = s5, 12
guard.sparkno = s27501
pausetime = 12,13
guard.pausetime = 12,11
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 28
ground.velocity = -4.5,-6.5;-11.1796875
air.type = High
air.velocity = -4.5,-6.5
air.hittime = 13
air.juggle = 0
fall = 1
getpower = 109,109
givepower = 16,16
air.fall = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
p2stateno = 10800
id = 800

[State 210, 1]
type = HitDef
triggerall = p2stateno != [10900,10904]
triggerall = var(56)
trigger1 = AnimElem = 6
attr = S, NA
damage = 83 * fvar(39)
animtype = Hard
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 5, Hit
sparkno = s27001
sparkxy = -20, -60
hitsound = s5,9
guardsound = s5, 12
guard.sparkno = s27501
pausetime = 12,13
guard.pausetime = 12,11
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 28
ground.velocity = -4.5,-6.5;-11.1796875
air.type = High
air.velocity = -4.5,-6.5
air.hittime = 13
air.juggle = 0
fall = 1
getpower = 109,109
givepower = 16,16
air.fall = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
p2stateno = 10900
id = 800

[State 220,2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Hit By One Inch Punch (For Pausetime)
[Statedef 10800]
type    = S
movetype= H
physics = N
velset = 0,0

[State 181, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 5000, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = ifelse((GetHitVar(groundtype) = 1),5000+((Name = "Gill" && AuthorName = "GM" && Facing = -1)*100000),5010+((Name = "Gill" && AuthorName = "GM" && Facing = -1)*100000)) + GetHitVar(animtype)

[State 5000, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030+((Name = "Gill" && AuthorName = "GM" && Facing = -1)*100000)

[State 5000, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047+((Name = "Gill" && AuthorName = "GM" && Facing = -1)*100000) + GetHitVar(animtype)))
value = 5047+((Name = "Gill" && AuthorName = "GM" && Facing = -1)*100000) + GetHitVar(animtype) ;5051 - 4 + type

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

[State 5000, 7]
type = ChangeState
trigger1 = HitShakeOver
value = 10801

;Hit By One Inch Punch (Air Fall)
[Statedef 10801]
type    = A
movetype= H
physics = N
velset = 0,0

[State 181, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3340, Vel]
type = VelSet
trigger1 = time = 0
x = ifelse((facing=enemynear,facing),7,-7)
y = -4

[State 3340, Gravity]
type = VelAdd
trigger1 = Time > 0
y = .5

[State 3340, Anim 5050]
type = ChangeAnim
trigger1 = !time
persistent = 0
value = 5050+((Name = "Gill" && AuthorName = "GM" && Facing = -1)*100000)

[State 5050, 6]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= ifelse((anim = [5051,5059]) || (anim = [5061,5069]), 0, 25)
value = 10802 ;HIT_BOUNCE

[State 5050, 6]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= ifelse((anim = [105051,105059]) || (anim = [105061,105069]), 0, 25)
value = 10802 ;HIT_BOUNCE

;Hit By One Inch Punch (Slide)
[Statedef 10802]
type    = S
movetype= H
physics = N
velset = 0,0

[State 181, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 803, ChangeAnim2]
type = ChangeAnim2
trigger1 = !time
value = 10802

[State 0, PosSet]
type = PosSet
trigger1 = !time
y = 0

[State InitVel]
type = VelSet
trigger1 = !time
X = ifelse((facing=enemynear,facing),3.56535983085632,-3.56535983085632)

[State Accel]
type = VelAdd
trigger1 = Vel X != 0
X = ifelse((facing=enemynear,facing),-0.176470592617989,0.176470592617989)

[State 802, VelSet]
type = VelSet
trigger1 = Time = 20
x = 0

[State 802, SelfState]
type = ChangeState
trigger1 = Vel X = 0
value = 10803

;Hit By One Inch Punch (Liedown)
[Statedef 10803]
type    = S
movetype= H
physics = N

[State 181, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 803, ChangeAnim2]
type = ChangeAnim2
trigger1 = !time
value = 10803

[State 803, SelfState]
type = SelfState
trigger1 = animtime = 0
value = Ifelse(alive,5120,5150)

;------------------
; Hit by Fast Kung Fu Palm - shaking from the hit
; (a custom gethit state)
; See State 1020 for details
[Statedef 10900]
type    = A
movetype= H
physics = N
velset = 0,0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0
ignorehitpause = 1

[State 1025, Anim] ;Custom animation
type = ChangeAnim
trigger1 = selfanimexist(5900)
trigger1 = !time
value = 5900

[State 1025, Anim] ;Custom animation
type = ChangeAnim2
trigger1 = !selfanimexist(5900)
trigger1 = !time
value = 10900

[State 1025, State]
type = ChangeState
trigger1 = HitShakeOver = 1
value = 10901

;------------------
; Hit by Fast Kung Fu Palm - flying through the air
; (a custom gethit state)
[Statedef 10901]
type    = A
movetype= H
physics = N

[State 1026, Velocity]
type = VelSet
trigger1 = time = 0
x = -15.75

[State 1026, Gravity]
type = VelSet
trigger1 = time = 0
y = -4.5

[State 0, VelMul]
type = VelMul
trigger1 = time > 0
x = 0.984375

[State 0, VelAdd]
type = VelAdd
trigger1 = time > 0
y = 0.5

[State 1026, No scroll]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 1026, Hit wall]
type = ChangeState
triggerall = time > 2;Pos y < -15
trigger1 = BackEdgeBodyDist <= 32
trigger2 = FrontEdgeBodyDist <= 32
value = 10902

[State 1026, Hit ground]
type = SelfState
trigger1 = (Vel y > 0) && (Pos y >= 0)
value = 5100

;------------------
; Hit by Fast Kung Fu Palm - hit wall
; (a custom gethit state)
[Statedef 10902]
type    = A
movetype= H
physics = N

[State 1027, Pos]
type = PosAdd
trigger1 = Time = 0
x = 15 - BackEdgeBodyDist

[State 1027, Stop moving]
type = PosFreeze
trigger1 = 1
x = 1
y = 1

[State 1027, No scroll]
type = ScreenBound
;trigger1 = (gametime%2)
trigger1 = 1
value = 1
movecamera = 0,0

[State 1027, Anim]
type = ChangeAnim
trigger1 = selfanimexist(5901)
trigger1 = !time
value = 5901

[State 1027, Anim]
type = ChangeAnim2
trigger1 = !selfanimexist(5901)
trigger1 = !time
value = 5901

[State 1027, State]
type = ChangeState
trigger1 = AnimTime = 0
value = 10903

;---------------------------------------------------------------------------
; HITG_SHAKE
[Statedef 10903]
type    = A
movetype= H
physics = N
velset = 0,0
p2facing = 1

[State 0, Turn]
type = Turn
trigger1 = !time

[State 1026, No scroll]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 5000, 3]
type = ChangeAnim2
trigger1 = Time = 0
value = 5902

[State 5000, 5] ;State type gets set to aerial if getting hit up
type = StateTypeSet
trigger1 = Time = 0
trigger1 = GetHitVar(yvel) != 0 || GetHitVar(fall)
trigger2 = Pos Y != 0
statetype = A

[State 5000, 7]
type = ChangeState
trigger1 = Pos Y > -20
trigger1 = time = 9
value = 10904

[State 5050, 6]
type = ChangeState
triggerall = time > 9
triggerall = Vel Y > 0
trigger1 = Pos Y >= ifelse((anim = [5051,5059]) || (anim = [5061,5069]), 0, 25)
trigger2 = Pos Y >= ifelse((anim = [105051,105059]) || (anim = [105061,105069]), 0, 25)
value = 10904 ;HIT_BOUNCE

[State 1008, VelSet]
type = VelSet
trigger1 = time = 0
x = -2
y = -14.908935546875

[State 0, VelMul]
type = VelMul
trigger1 = 1
x = 1

[State 1008, VelAdd]
type = VelAdd
trigger1 = time > 0
y = 0.7

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
; HIT_BOUNCE (hit ground)
[Statedef 10904]
type    = L
movetype= H
physics = N

[State 1026, No scroll]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

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
trigger1 = !SelfAnimExist(5100) + (anim % 10)
value = 5100

[State 5100, 3] ;Hit ground anim (for hit up)
type = ChangeAnim
trigger1 = time = 0
trigger1 = SelfAnimExist(5100) + (anim % 10)
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
type = VelSet
trigger1 = Time = 0
x = 0

[State 5100, 7]
type = SelfState
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
value = 5110 ;HIT_LIEDOWN

[State 5100, 9]
type = HitFallDamage
trigger1 = Time = 3

[State 5100, 11]
type = PosFreeze
trigger1 = 1

[State 5100, 12]
type = SelfState
trigger1 = AnimTime = 0
value = 5101

[State 5100, 13]
type = ForceFeedback
trigger1 = Time = 0
waveform = sinesquare
ampl = 128,-3,-.2,.005
time = 20

;========================================
;连段中一英寸
;========================================
[Statedef 801]
type = S
movetype = A
physics = N
anim = 801
ctrl = 0
velset = 0

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = animelem = 5
value = 3+(1*2),2

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = animelem = 5
value = 800,0
channel = 0

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 8
movetype = I

[State 5100, EnvShake]
type = EnvShake
trigger1 = animelem = 5
time = 10
freq = 180
ampl = -4

[State 210, 1]
type = HitDef
trigger1 = AnimElem = 6
attr = S, NA
damage = 80 * fvar(39)
animtype = Hard
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 5, Hit
sparkno = s27001
sparkxy = -20, -60
hitsound = s5,3
guardsound = s5, 12
guard.sparkno = s27501
pausetime = 12,16
guard.pausetime = 12,11
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 28
ground.velocity = -5
air.type = High
air.velocity = -4.5,-6.5
air.hittime = 13
air.juggle = 0
fall = 0
getpower = 120,120
givepower = 16,16
air.fall = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
p2stateno = 5000

[State 1000, ステート変更]
type = ChangeState
trigger1 = Animelem = 10,>= 5
value = 0
ctrl = 1

;========================================
; 膝盖踢
;========================================
[Statedef 810]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0
anim = 810

[State 300, Kick Attempt Sound]
type = PlaySnd
trigger1 = time = 0
value = 3+(1*2),4

[State 200, Punch Attempt Sound]
type = Playsnd
trigger1 = !time
value = 810,0
channel = 0

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelemtime(6) = 0
statetype = A

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 2
trigger2 = animelem = 3
x = 16

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 4
x = 8

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 7
x = 11

[State 0, VelSet]
type = VelSet
trigger1 = animelemtime(5) = 0
x = 3.8125
y = -3

[State 0, VelAdd]
type = VelAdd
trigger1 = animelemtime(6) > 0
y = 0.375

[State 0, VelMul]
type = VelMul
trigger1 = animelemtime(6) > 0
x = 0.953125

[State 0, VelSet]
type = VelSet
trigger1 = animelemtime(8) = 3
x = 0

[State 210, 1]
type = HitDef
triggerall = prevstateno != [200,599]
trigger1 = animelem = 7
attr = S, NA
damage = 85 * fvar(39)
animtype = Hard
air.animtype = Back
ground.type = Low
guardflag = H
hitflag = MAF
priority = 5, Hit
sparkno = s27001
sparkxy = -20, -70
hitsound = s5,7
guardsound = s5, 12
guard.sparkno = s27501
pausetime = 12,13
guard.pausetime = 12,11
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 28
ground.velocity = -6.5
air.type = High
air.velocity = -4.5,-6.5
air.hittime = 13
air.juggle = 0
getpower = 94,94
givepower = 16,16
air.fall = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5

[State 210, 1]
type = HitDef
triggerall = prevstateno = [200,599]
trigger1 = animelem = 5
attr = S, NA
damage = 75 * fvar(39)
animtype = Hard
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 5, Hit
sparkno = s27001
sparkxy = -20, -70
hitsound = s5,7
guardsound = s5, 12
guard.sparkno = s27501
pausetime = 12,13
guard.pausetime = 12,11
ground.slidetime = 17
ground.hittime = 17
guard.hittime = 17
guard.slidetime = 17
guard.ctrltime = 28
ground.velocity = -6.5
air.type = High
air.velocity = -4.5,-6.5
air.hittime = 13
air.juggle = 0
getpower = 94,94
givepower = 16,16
air.fall = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5


[State 220,2]
type = ChangeState
trigger1 = Vel Y + Pos Y >=0 && statetype = A
value = 811
ctrl = 0

[Statedef 811]
type = S
movetype = I
physics = S
poweradd= 0
ctrl = 0
velset = 0,0
sprpriority = 2
anim = 811

[State 300, Land]
type = PlaySnd
trigger1 = !time
value = 2+(1*10),2

[State 852, PosSet]
type = PosSet
trigger1 = !time
y = 0

[State 220,2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================================
; C投
;========================================
[Statedef 900]
type = S
movetype= A
physics = S
juggle = 0
velset = 0,0
ctrl = 0
anim = 900

[State 800, AttackDist]
type = AttackDist
trigger1 = 1
value = 0

[State 900, Grab Attempt]
type = HitDef
triggerall = p2stateNo != [150,155]
trigger1 = AnimElem = 1
attr = S, NT
hitflag = M-
priority = 4, Miss
sprpriority = 1
p2facing = 1
sparkno = -1
guard.sparkno = -1
p1stateno = 910
p2stateno = 920
fall.xvelocity = -2.5
fall.yvelocity = -4
yaccel = .5

[State 900, 2]
type = ChangeState
trigger1 = !MoveContact && Time
value = 400
ctrl = 0

;----------------------------------------------------------------------
[Statedef 910]
type = S
movetype= A
physics = N
anim = 901

[State 910, 1]
type = VarSet
trigger1 = Time = 0
fvar(8) = 0

[State 910, 1]
type = VarSet
triggerall = Time < 7 && !fVar(8)
trigger1 = ((Target,Command = "holdfwd") || (Target,Command = "holdback")) && ((Target,Command = "y") || (Target,Command = "z"))
fvar(8) = 1

[State 910, TargetBind]
type = TargetBind
trigger1 = Time < 7 && FVar(8)
pos = 40, 0

[State 910, ChangeState]
type = ChangeState
trigger1 = Time < 7 && FVar(8)
value = 950

[State 0, TargetBind]
type = TargetBind
trigger1 = animelem = 1
time = 10
id = -1
pos = 25,0

[State 0, SprPriority]
type = SprPriority
trigger1 = animelem = 3
value = -3

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = 12,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = 200,0
volume = 200
channel = 0

[State 0, Explod]
type = Explod
trigger1 = animelem = 2
anim = 20000
ID = 20000
pos = 33,-91
postype = p1
supermovetime = 9999
pausemovetime = 9999
sprpriority = 5
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 0, Width]
type = Width
trigger1 = 1
edge = 20

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
value = 5,3

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 7
value = -80

[State 0, Explod]
type = Explod
trigger1 = animelem = 7
anim = 27002
ID = 27002
pos = -5,-43
postype = p2
supermovetime = 9999
pausemovetime = 9999
sprpriority = 4
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 3303, Explod]
type = Explod
triggerall = !NumExplod(10000)
trigger1 = animelem = 7 && P2MoveType = H
anim = 12000
pos = 0,0
id = 12000
postype = p2  ;p2,front,back,left,right
sprpriority = -4
ownpal = 1
persistent = 0

[State -2, Helper]
type = Helper
trigger1 = !numhelper(50000) && !numhelper(50001)
trigger1 = WinKO
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

[State 910, State End]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

[Statedef 920]
type = A
movetype = H
physics = N
poweradd = 0
velset = 0
ctrl = 0
facep2 = 1
sprpriority = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 902

[State 0, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 921

[Statedef 921]
type    = S
movetype= H
physics = N
velset = 0,0

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = Time = 0
value = 5012

[State 0, ChangeAnim] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 0, Changestate]
type = ChangeState
trigger1 = HitShakeOver
value = 922

[Statedef 922]
type    = A
movetype= H
physics = N
velset = 0,0

[State 0, 4]
type = PosAdd
trigger1 = Time = 0
x = -10

[State 0, Envshake]
type = envshake
Trigger1 = time = 0
time = 9
ampl = -3
freq = 110

[State 0, posadd]
type = posadd
trigger1 = Time = 0
x = 0

[State 0,Nothitby]
type = nothitby
trigger1 = Time = 1
value = SCA
time = 1

[State 0, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 0, Var]
type = VarSet
trigger1 = Time = 0
sysvar(1) = floor(vel y)

[State 0, 2]
type = ChangeAnim
triggerall = time = 0
trigger1 = SelfAnimExist(5102)
value = 5102

[State 0, 2]
type = ChangeAnim
triggerall = time = 0
trigger1 = SelfAnimExist(5101)
trigger1 = !SelfAnimExist(5102)
value = 5101

[State 0, 2]
type = ChangeAnim
triggerall = time = 0
trigger1 = !SelfAnimExist(5101)
trigger1 = !SelfAnimExist(5102)
value = 5100

[State 0, 4]
type = PosSet
trigger1 = Time = 0
y = 0

[State 0, 6] ;Reduce speed
type = Null
trigger1 = Time = 0
x = 0.75

[State 0, 8]
type = GameMakeAnim
trigger1 = Time = 1
value = 61
pos = 0, 0
under = sysvar(1) <= 10

[State 0, 9]
type = HitFallDamage
trigger1 = Time = 3

[State 0, 10]
type = PlaySnd
trigger1 = Time = 1
;value = F7, 0 ;Hit ground
value = F7, (sysvar(1) > 5) + (sysvar(1) > 14)

[State 0, 12]
type = Changestate
trigger1 = Time = 7
value = 923

[Statedef 923]
type    = L
movetype= H
physics = N

[State 0, 1] ;Coming hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim != [5101,5109]
trigger2 = !SelfAnimExist(5160 + (anim % 10))
value = 5160

[State 0, 2] ;Coming hit ground anim (for hit up)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim = [5101,5109]
trigger1 = SelfAnimExist(5160 + (anim % 10))
value = 5160 + (anim % 10)

[State 0, 3]
type = Null
trigger1 = Time = 0

[State 0, 4]
type = PosSet
trigger1 = Time = 0
y = 20

[State 0, 5] ;Acceleration
type = VelAdd
trigger1 = 1
y = .4

[State 0, 6] ;Hit ground
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 12
value = 924

[Statedef 924]
type    = L
movetype= H
physics = N

[State 0, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 0, 1] ;For hit up/up-diag type (from state 5081)
type = ChangeAnim
persistent = 0
trigger1 = SelfAnimExist(5110 + (anim % 10))
trigger1 = anim = [5081,5089]
value = 5110 + (anim % 10)

[State 0, 2] ;Hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119] ;Not already changed anim
trigger1 = anim != [5161,5169]
trigger2 = !SelfAnimExist(5170 + (anim % 10))
value = 5170

[State 0, 3] ;Hit ground anim (for hit up)
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119] ;Not already changed anim
trigger1 = anim = [5161,5169]
trigger1 = SelfAnimExist(5170 + (anim % 10))
value = 5170 + (anim % 10)

[State 0, 4]
type = HitFallDamage
trigger1 = Time = 0

[State 0, 5]
type = PosSet
trigger1 = Time = 0
y = 0

[State 0, Var] ;Get fall velocity
type = VarSet
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) != 0
sysvar(1) = floor(vel y)

[State 0, 6]
type = PlaySnd
trigger1 = Time = 0
trigger1 = !SysVar(0)
;value = F7, 0 ;Hit ground
value = F7, (sysvar(1) > 5) + (sysvar(1) > 14)

[State 0, 7]
type = GameMakeAnim
trigger1 = Time = 0
trigger1 = !SysVar(0)
value = 60 + (sysvar(1) > 5) + (sysvar(1) > 14)
pos = 0, 0
under = sysvar(1) <= 10

[State 0, 8]
type = VelSet
trigger1 = Time = 0
y = 0

[State 0, 9] ;For hit up type
type = ChangeAnim
persistent = 0
triggerall = anim = [5171,5179]
triggerall = SelfAnimExist(5110 + (anim % 10))
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground anim
value = 5110 + (anim % 10)

[State 0, 10] ;For normal
type = ChangeAnim
persistent = 0
triggerall = Anim != [5111,5119]
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
value = 5110

[State 0, 11] ;If just died
type = SelfState
triggerall = !alive
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
trigger3 = Anim = [5110,5119]
value = 5150

[State 0, GETUP] ;If just died
type = SelfState
triggerall = alive
trigger1 = time = 35
value = 5120
ctrl = 0

[State 0, 12]
type = VarSet
trigger1 = SysVar(0)
trigger1 = Time = 0
sysvar(0) = 0

[State 0, 13] ;Friction
type = VelMul
trigger1 = 1
x = 0.85


[Statedef 950]
type = S
movetype = A
physics = N
anim = 5945
ctrl = 0
velset = -16, 0

[State 950, PlaySnd]
type = PlaySnd
trigger1 = !time
value = 3,3
persistent = 0

[State 810,TargetBind]
type = TargetState
trigger1 = Time = 0
value = 955

[State 810,NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 194, PosSet]
type = PosSet
trigger1 = Time = 0
y = 0

[State 105, VelMul]
type = VelMul
trigger1 = 1
x = .75

[State 4100,4]
type = PlayerPush
trigger1 = P2BodyDist X < 0
value = 0

[State 105,End]
type = ChangeState
trigger1 = Time >= 32
value = 0
ctrl = 1


[Statedef 955]
type = S
movetype = H
physics = N
ctrl = 0
velset = 0, 0
facing = enemy,facing
facep2 = 1

[State 810,NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 1040,ChangeAnim]
type = ChangeAnim
triggerall = Time = 0 && SelfAnimExist(5940)
trigger1 = authorname = "H乭" || authorname = "M.M.R." || authorname = "Mouser" || authorname = "CAMRAT Type KOF"
trigger2 = authorname = "Tin" || authorname = "Nyankoro" || authorname = "ryokucha"
trigger3 = authorname = "Third" || authorname = "adamskie" || authorname = "Bad Darkness" || authorname = "Warusaki3"
trigger4 = AuthorName = "NHK" || AuthorName = "Nyankoro" || AuthorName = "Nyan仚Kiryu"
trigger5 = AuthorName = "aoao" || AuthorName = "Mr.X-file"
trigger6 = AuthorName = "laiso_7" || AuthorName = "yu-go" || AuthorName = "MEKA"
trigger7 = AuthorName = "CROSS侕CAT" || AuthorName = "CrossCat"
trigger8 = AuthorName = "Jesuszilla" || AuthorName = "Vans"
trigger9 = AuthorName = "N64Mario" && Name = "Zero" && FVar(17) = 1
value = 5940

[State 1040,ChangeAnim]
type = ChangeAnim
triggerall = Time = 0 && SelfAnimExist(5910) && !SelfAnimExist(5940)
trigger1 = authorname = "H乭" || authorname = "M.M.R." || authorname = "Mouser" || authorname = "CAMRAT Type KOF"
trigger2 = authorname = "Tin" || authorname = "Nyankoro" || authorname = "ryokucha"
trigger3 = authorname = "Third" || authorname = "adamskie" || authorname = "Bad Darkness" || authorname = "Warusaki3"
trigger4 = AuthorName = "NHK" || AuthorName = "Nyankoro" || AuthorName = "Nyan仚Kiryu"
trigger5 = AuthorName = "aoao" || AuthorName = "Mr.X-file"
trigger6 = AuthorName = "laiso_7" || AuthorName = "yu-go" || AuthorName = "MEKA"
trigger7 = AuthorName = "CROSS侕CAT" || AuthorName = "CrossCat"
trigger8 = AuthorName = "Jesuszilla" || AuthorName = "Vans"
trigger9 = AuthorName = "N64Mario" && Name = "Zero" && FVar(17) = 1
value = 5910

[State 820,ChangeAnim2]
type = ChangeAnim
trigger1 = Time = 0 && anim != 5940 && anim != 5910
value = 5007

[State 194, PosSet]
type = PosSet
trigger1 = Time = 0
y = 0

[State 4100,4]
type = PlayerPush
trigger1 = P2BodyDist X < 0
value = 0

[State 105,End]
type = SelfState
trigger1 = Time >= 29
value = 0
ctrl = 1



;========================================
; D投
;========================================
[Statedef 956]
type = S
movetype= A
physics = S
juggle = 0
velset = 0,0
ctrl = 0
anim = 900

[State 900, Grab Attempt]
type = HitDef
triggerall = p2stateNo != [150,155]
trigger1 = AnimElem = 1
attr = S, NT
hitflag = M-
priority = 4, Miss
sprpriority = 1
sparkno = -1
guard.sparkno = -1
p1stateno = 960
p2stateno = 962
yaccel = .5

[State 900, 2]
type = ChangeState
trigger1 = !MoveContact && Time
value = 400
ctrl = 0


[Statedef 960]
type = S
physics = S
anim = 961
poweradd = 0
velset = 0
ctrl = 0
sprpriority = 2

[State 910, 1]
type = VarSet
trigger1 = Time = 0
fvar(8) = 0

[State 910, 1]
type = VarSet
triggerall = Time < 7 && !fVar(8)
trigger1 = ((Target,Command = "holdfwd") || (Target,Command = "holdback")) && ((Target,Command = "y") || (Target,Command = "z"))
fvar(8) = 1

[State 910, TargetBind]
type = TargetBind
trigger1 = Time < 7 && FVar(8)
pos = 40, 0

[State 910, ChangeState]
type = ChangeState
trigger1 = Time < 7 && FVar(8)
value = 950

[State 0, Width]
type = Width
trigger1 = 1
edge = 20,40

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 210,0
volume = 200
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = 12,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 5,3

[State 0, Explod]
type = Explod
trigger1 = animelem = 2
anim = 20000
ID = 20000
pos = 21,-106
postype = p1
removetime = 15
supermovetime = 9999
pausemovetime = 9999
sprpriority = 4
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 0, Turn]
type = Turn
trigger1 = animelem = 4

[State 0, TargetBind]
type = TargetBind
trigger1 = animelem = 1
pos = 10,0

[State 0, TargetBind]
type = TargetBind
trigger1 = animelem = 2
time = 10
id = -1
pos = 3,0

[State 0, TargetBind]
type = TargetBind
trigger1 = animelem = 4
time = 3
id = -1
pos = -3,0

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 4
value = -80

[State 0, Explod]
type = Explod
trigger1 = animelem = 4
anim = 27002
ID = 27002
pos = 7,-59
postype = p2
removetime = 16
supermovetime = 9999
pausemovetime = 9999
sprpriority = 4
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 7
trigger2 = animelem = 8
trigger3 = animelem = 9
x = -8

[State -2, Helper]
type = Helper
trigger1 = !numhelper(50000) && !numhelper(50001)
trigger1 = WinKO
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

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

[Statedef 962]
type = A
movetype = H
physics = N
poweradd = 0
velset = 0
ctrl = 0
facep2 = 1
sprpriority = 0

[State 0, ScreenBound]
Type = ScreenBound
trigger1 = 1
value = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 962

[State 0, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 963

[Statedef 963]
type = A
movetype = H
physics = N
velset = 4,-5

[State 0, VelAdd]
type = VelAdd
trigger1 = 1
y = .5

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 963

[State 0, SelfState]
type = SelfState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 5100

;========================================
; CD
;========================================
[Statedef 980]
type = S
movetype = A
physics = N
anim = 980
velset = 0,0
ctrl = 0
facep2 = 1

[State 5100, 10]
type = PlaySnd
trigger1 = animelem = 1
value = 980,0
channel = 0

[State 5100, 10]
type = PlaySnd
trigger1 = animelem = 1
value = 3+(1*2),8-(1*2)

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 6
movetype = I

[State 210, 1]
type = HitDef
trigger1 = animelem = 5
attr = S, NA
damage = 156
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = s27001
sparkxy = -10, -60
hitsound = s5,9
guardsound = s5,12;s2, 6
guard.sparkno = s27501
ground.type = High
ground.slidetime = 17
ground.hittime  = 17
ground.velocity = -4.5,-6.5
guard.velocity = -10;-14.90625
air.type = High
air.velocity = -4.5,-6.5
air.hittime = 13
air.juggle = 0
getpower = 94,94
givepower = 16,16
fall = 1
fall.recover = 1
fall.recovertime = 120
id = 980
ground.cornerpush.veloff = 0
air.cornerpush.veloff = -5
yaccel = .5

[State 1000, ステート変更]
type = ChangeState
trigger1 = Animelem = 12,>= 4
value = 0
ctrl = 1

;========================================
; 气CD
;========================================
[Statedef 981]
type = S
movetype = A
physics = S
anim = 981
velset = 0,0
ctrl = 0
facep2 = 1
poweradd = -1000

[State 3000, 超必殺技発動の時間停止]
type = SuperPause
trigger1 = AnimElem = 1
anim = -1
movetime = 10
time = 10
p2defmul = 1.0
darken = 0

[State 13000, EnvColor]
type = EnvColor
trigger1 = !time
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State -2, PalFX]
type = PalFX
trigger1 = time < 7
time = 1
add = 255,255,255
sinadd = 0,0,0
invertall = 0
color = 256
ignorehitpause = 1
persistent = 2

[State 5100, 10]
type = PlaySnd
trigger1 = animelem = 1
value = 980,0
channel = 0

[State 5100, 10]
type = PlaySnd
trigger1 = animelem = 1
value = 5,6

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 6
movetype = I

[State 305, 無敵]
type = NotHitBy
trigger1 = time = [0,12]
value = SCA

[State 210, 1]
type = HitDef
trigger1 = AnimElem = 5
attr = S, NA
damage = 100
animtype = Hard
air.animtype = back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 13
sparkno = s27001
sparkxy = -10, -80
hitsound = s5,9
guardsound = s5,11
guard.sparkno = s27501
ground.type = High
ground.slidetime = 17
ground.hittime  = 17
ground.velocity = -4.5,-6.5
guard.velocity = -14.90625
air.type = High
air.velocity = -4.5,-6.5
air.hittime = 13
air.juggle = 0
getpower = 0,0
givepower = 16,16
id = 981
fall = 1
fall.recover = 1
fall.recovertime = 120
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
;p2stateno = 10900

[State 220,2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;========================================
; JCD
;========================================
[Statedef 990]
type = A
movetype = A
physics = A
anim = 990
ctrl = 0

[State 5100, 10]
type = PlaySnd
trigger1 = animelem = 1
value = 980,0
channel = 0

[State 5100, 10]
type = PlaySnd
trigger1 = animelem = 1
value = 5,6

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 6
movetype = I

[State 600, 1]
type = HitDef
Trigger1 = EnemyNear,MoveType != A
trigger1 = animelem = 5
attr = A, NA
damage = 110
animtype = Light
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
guard.pausetime = 10,10
sparkno = s27001
sparkxy = -10, -60
hitsound = s5,9
guardsound = s5,12;s2, 6
guard.sparkno = s27501
ground.slidetime = 10
ground.hittime = 10
ground.velocity = -4.5,-6.5
guard.velocity = -14.90625
air.velocity = -4.5,-6.5
air.juggle = 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
getpower = 94,94
givepower = 16,16
fall = 1
id = 990
fall.recover = 0
yaccel = .5

[State 600, 1]
type = HitDef
Trigger1 = EnemyNear,MoveType = A
trigger1 = animelem = 5
attr = A, NA
damage = 110
animtype = Light
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
guard.pausetime = 10,10
sparkno = s27001
sparkxy = -10, -60
hitsound = s5,9
guardsound = s5,12;s2, 6
guard.sparkno = s27501
ground.slidetime = 10
ground.hittime = 10
ground.velocity = -4.5,-6.5
guard.velocity = -14.90625
air.velocity = -4.5,-6.5
air.juggle = 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
getpower = 94,94
givepower = 16,16
fall = 1
id = 991
fall.recover = 0
yaccel = .5

[State 40, 6]
type = ChangeState
trigger1 = Vel Y + Pos Y >= 0
value = 52

;---------------------------------------------------------------------------
; 通常技空中ヒット時の相手ステート(KOF用)
;---------------------------------------------------------------------------
; HITA_SHAKE
[Statedef 290]
type    = A
movetype= H
physics = N
velset = 0,0

[State 290, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = ifelse((GetHitVar(airtype) = 1),5000,5010) + GetHitVar(animtype)

[State 290, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030

[State 290, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047 + GetHitVar(animtype) ;5051 - 4 + type

[State 290, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 290, 5]
type = ChangeState
trigger1 = HitShakeOver
value = 291

[State 290, FFB Light]
type = ForceFeedback
trigger1 = anim = 5000
trigger2 = anim = 5010
persistent = 0
time = 6
waveform = square

[State 290, FFB Medium]
type = ForceFeedback
trigger1 = anim = 5001
trigger2 = anim = 5011
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 290, FFB Hard]
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
[Statedef 291]
type    = A
movetype= H
physics = N
ctrl = 0

[State 291, 1]
type = VelAdd;Gravity
trigger1 = 1
y = GetHitVar(yaccel)

[State 291, 2]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 291, 3]
type = ChangeState
triggerall = !HitFall
trigger1 = HitOver
trigger2 = Vel Y > 0    ;Hit ground
trigger2 = Pos Y >= 10  ;.
value = 293 ;HITA_RECOV

[State 291, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 292 ;HITA_UP (transition)

;---------------------------------------------------------------------------
; HITA_UP_T (transition)
[Statedef 292]
type    = A
movetype= H
physics = N

[State 292, 1]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = SelfAnimExist(5035)
trigger1 = Anim != [5051,5059] ;Not if in hit up anim
trigger1 = Anim != 5090 ;Not if hit off ground anim
value = 5035

[State 292, 2]
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 292, 3]
type = ChangeState
trigger1 = HitOver  ;Hit is over
trigger2 = AnimTime = 0 ;Animation over
trigger3 = Vel Y > 0    ;Hit ground
trigger3 = Pos Y >= 10  ;.
trigger4 = Time = 0     ;No transition anim
trigger4 = Anim != 5035 ;.
value = 293 ;HITA_RECOV

;---------------------------------------------------------------------------
; HITA_RECOV (recovering in air, not falling)
[Statedef 293]
type    = A
movetype= H
physics = N

[State 293, 1]
type = ChangeState
trigger1 = !Alive
value = 5050

[State 293, 2]
type = ChangeAnim
trigger1 = AnimTime = 0
trigger1 = Anim != 5040
trigger2 = Time = 0
trigger2 = Anim != 5035
value = 5040

[State 293, 3]
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 293, 4]
type = NotHitBy;NotHitBy
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = SCA
time = 2

[State 293, 5]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 52 ;JUMPLAND

;この下、一行以上空ける事！