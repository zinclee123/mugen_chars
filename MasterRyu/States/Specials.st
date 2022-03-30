; ______________________________
;| Ryu by Phantom.of.the.Server |
; 
;============================================================================================
;=====================================< SPECIAL STATES >=======================================
;============================================================================================

;======================< HADOU KEN >=============================
[Statedef 1000]
type = S
physics = S
movetype = A
anim = 1000
ctrl = 0
velset = 0, 0
poweradd = 72 * !var(20)
sprpriority = 1
facep2 = 1

[State 1000, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "qcfz", 3, ifelse(command = "qcfy", 2, 1))

[State 1000, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(p2movetype = H, 3, ifelse(random < 300, 2, 1))

[State 1000, Strength AI Special task]
type = varset
triggerall = !time && AIlevel
trigger1 = var(59) = 3 && P2Bodydist x > 180
var(10) = 3

[State 1000, Strength AI Special task]
type = varset
triggerall = !time
trigger1 = NumTarget(3025)
trigger1 = P2Bodydist x > 180
var(10) = 1


[State 1000, CO Moves]
type = ChangeAnim
trigger1 = var(20)
trigger1 = Anim = 1000 && AnimElemtime(2) = 0
value = 1000
Elem = 5

[State 1000, CO Moves]
type = ChangeAnim
trigger1 = var(20)
trigger1 = Anim = 1000 && AnimElemtime(8) = 0
value = 1000
Elem = 10

[State 1000, width]
type = width
trigger1 = animelemtime(5) = 0
value = 30, 0

[State 1000, NotHitby]
type = Hitby
trigger1 = AnimElemtime(5) = [0,2]
value = SCA, AA,AT


[State 1000, Hadouken]
type = helper
trigger1 = animelemtime(5) = 1
helpertype = normal
stateno = 1005
ID = 1005
name = "Hadouken"
postype = p1
pos = 80, -68
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1000, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4 + (var(1) = 2) * 10, 0
channel = 0
[State 1000, Snd]
type = playsnd
trigger1 = animelemtime(5) = 1
value = 5, 0

[State 1000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================< SHAKUNETSU HADOU KEN >=============================
[Statedef 1020]
type = S
physics = S
movetype = A
anim = 1000
ctrl = 0
velset = 0, 0
poweradd = 72 * !var(20)
sprpriority = 1
facep2 = 1

[State 1020, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "qcfz", 3, ifelse(command = "qcfy", 2, 1))
[State 1020, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || random < 500), 3, ifelse(random < 500, 2, 1))

[State 1020, width]
type = width
trigger1 = animelemtime(5) = 0
value = 30, 0

[State 1020, Hadouken]
type = helper
trigger1 = animelemtime(5) = 1
helpertype = normal
stateno = 1025
ID = 1025
name = "Shakunetsu Hadouken"
postype = p1
pos = 80, -68
ownpal = 1

[State 1020, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4 + (var(1) = 2) * 10, 0
channel = 0
[State 1020, Snd]
type = playsnd
trigger1 = animelemtime(5) = 1
value = 5, 0

[State 1020, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================< SHORYUU KEN >=============================
[Statedef 1100]
type = S
physics = S
movetype = A
anim = 1100
ctrl = 0
velset = 0, 0
poweradd = 72 * (!var(20) && prevstateno != 750)
juggle = ifelse(var(1) = 1, 8, ifelse((p2movetype = H && p2statetype = A), 7, 9))
sprpriority = 1
facep2 = 1

[State 1100, Pos Fix]
type=posadd
triggerall = FrontEdgeBodyDist > 18
trigger1=animelem= 4
x= 18 * const(size.xscale)
persistent=0

[State 1100, Push]
type = playerpush
trigger1 = anim = 1100
value = 0
ignorehitpause = 1

[State 1100, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "dfz"), 3, ifelse(command = "dfy", 2, 1))

[State 1100, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || random < 333), 3, 1)

[State 1100, Strength AI]
type = varset
trigger1 = !time && AIlevel
trigger1 = var(50) = 110071
var(10) = 2

[State 1100, Strength AI]
type = varset
trigger1 = !time && AIlevel
trigger1 = var(59) = 1310 || var(59) = 5300
var(10) = 1 + 2*((var(1) != 1) || Power < 1000)

[State 1100, Strength OC]
type = varset
trigger1 = !time && AIlevel
trigger1 = var(59) = 40
var(10) = 1 + 2*(var(20) < 130)

[State 1100, Strength Alpha Counter]
type = varset
trigger1 = !time && prevstateno = 750
var(10) = 2

[State 1100, nothitby]
type = nothitby
trigger1 = anim = 1100 && animelemtime(4) < 0 && prevstateno != 750
value = SCA
time = 1
ignorehitpause = 1

[State NHB -ZC]
type = nothitby
triggerall = prevstateno = 750
trigger1 = var(1) = 1 && animelemtime(3) < 0
trigger2 = var(1) != 1 && animelemtime(2) < 0
value = SCA
time = 1

[State 1100, Vel]
type = velset
trigger1 = anim = 1100 && animelem = 4
x = ifelse(var(10) = 3, 6, ifelse(var(10) = 2, 4, 2))
y = ifelse(var(10) = 3, -11, ifelse(var(10) = 2, -8.5, -6))

[State 1100, Vel]
type = velmul
trigger1 = 1
x = 0.88

[State 1100, Vel]
type = velmul
trigger1 = vel y > 0
x = 0

[State 1100, Snd]
type = playsnd
trigger1 = anim = 1100 && animelem = 4
value = 0, 41

[State 1100, Dust]
type = helper
trigger1 = anim = 1100 && animelem = 4
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 1100, Snd]
type = playsnd
trigger1 = anim = 1100 && animelem = 2
value = 4 + (var(1) = 2) * 10, 1
channel = 0
ignorehitpause = 1
persistent = 0

[State 1100, Normal Ryu 1st Hard Hit]
type = hitdef
triggerall = PrevstateNo != 750
trigger1 = var(1) <= 1 && anim = 1100
trigger1 = animelem = 3
attr = S, SA
damage = ifelse(var(20), 60 + var(10) * 7, 100 + var(10) * 7), 15
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -79
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 22
ground.hittime = 22
ground.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -8))
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -8))
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 140, 300) * (!var(20) && prevstateno != 750), 70 * (!var(20) && prevstateno != 750)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 0
fall.recovertime = 42
yaccel = 0.5
ID = 1100


[State 1100, Normal Ryu 2nd Air Hit]
type = hitdef
triggerall = PrevstateNo != 750
trigger1 = anim = 1100 && var(1) <= 1
trigger1 = animelemtime(4) >= 0
trigger1 = !movecontact && !movereversed
attr = A, SA
damage = 60, 10
animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -106
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -8))
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -8))
guard.cornerpush.veloff = 0
guard.velocity = -10.52
getpower = ifelse(p2movetype = H, 140, 300) * (!var(20) && prevstateno != 750), 70 * (!var(20) && prevstateno != 750)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = var(10)<2
fall.recovertime = 42
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0
ID = 1100

[State 1100, Evil Hit 1 and 2]
type = hitdef
triggerall = PrevstateNo != 750
trigger1 = animelem = 2 && anim = 1100 && var(1) != 1
trigger2 = animelem = 3 && anim = 1100 && var(1) != 1
attr = S, SA
damage = 50 + var(10) * 7, 7
animtype = Medium
fall.animtype = Medium
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, ifelse((animelem = 2), -52, -79)
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, -8
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -2, -8
guard.cornerpush.veloff = 0
guard.velocity = -10.52
getpower = ifelse(p2movetype = H, 140, 300) * (!var(20) && prevstateno != 750), 70 * (!var(20) && prevstateno != 750)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 0
fall.recovertime = 42
fall.animtype = Medium
yaccel = 0.5
forcestand = 1
ID = 1100

[State 1100, Evil Air Hit]
type = hitdef
triggerall = PrevstateNo != 750
trigger1 = animelem = 4 && anim = 1100 && var(1) != 1
attr = A, SA
damage = ifelse(MoveHit,30,60), 10
animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -106
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(10) = 3, -5, ifelse(var(10) = 2, -4, -3)), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -8))
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse(var(10) = 3, -5, ifelse(var(10) = 2, -4, -3)), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -8))
guard.cornerpush.veloff = 0
guard.velocity = -10.52
getpower = ifelse(p2movetype = H, 140, 300) * (!var(20) && prevstateno != 750), 70 * (!var(20) && prevstateno != 750)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 0
fall.recovertime = 42
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0
ID = 1100

[State 1100, statetype]
type = statetypeset
trigger1 = anim = 1100 && animelemtime(4) >= 0
trigger2 = anim = 1101
statetype = A
physics = A

[State 1100, Anim]
type = changeanim
trigger1 = anim = 1100 && animelemtime(4) > 0 && vel y > (ifelse(var(10) = 3, -5.3, ifelse(var(10) = 2, -4, -2.7)))
value = 1101
persistent = 0

[State 255, Alpha FX]
type = Helper
triggerall = Prevstateno = 750
trigger1 = !NumHelper(751)
trigger1 = MoveHit && NumTarget(1100)
trigger1 = Target,StateNo = [5000,5099]
trigger1 = AnimElemtime(4)>=0 || var(1)=1
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 751
ID = 751
name = "Alpha FX"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 1100, Normal Ryu 1st Hard Hit Aplha]
type = hitdef
triggerall = PrevstateNo = 750
trigger1 = animelem = 3 && anim = 1100 && var(1) <= 1
attr = S, SA
damage = ifelse(var(20), 60 + var(10) * 7, 100 + var(10) * 7), 15
animtype = DiagUp
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -79
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -8))
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -8))
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 140, 300) * (!var(20) && prevstateno != 750), 70 * (!var(20) && prevstateno != 750)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 0
fall.recovertime = 42
yaccel = 0.5
forcestand = 1
ID = 1100

[State 1100, Normal Ryu 2nd Air Hit Alpha]
type = hitdef
triggerall = PrevstateNo = 750
trigger1 = animelem = 4 && anim = 1100 && var(1) <= 1
trigger1 = !movecontact && !movereversed
attr = A, SA
damage = 60, 10
animtype = DiagUp
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -106
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -8))
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -8))
guard.cornerpush.veloff = 0
guard.velocity = -10.52
getpower = ifelse(p2movetype = H, 140, 300) * (!var(20) && prevstateno != 750), 70 * (!var(20) && prevstateno != 750)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = var(10)<2
fall.recovertime = 42
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0
ID = 1100

[State 1100, Evil Hit 1 and 2 Alpha]
type = hitdef
triggerall = PrevstateNo = 750
trigger1 = animelem = 2 && anim = 1100 && var(1) != 1
trigger2 = animelem = 3 && anim = 1100 && var(1) != 1
attr = S, SA
damage = 50 + var(10) * 7, 7
animtype = DiagUp
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, ifelse((animelem = 2), -52, -79)
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, -8
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -2, -8
guard.cornerpush.veloff = 0
guard.velocity = -10.52
getpower = ifelse(p2movetype = H, 140, 300) * (!var(20) && prevstateno != 750), 70 * (!var(20) && prevstateno != 750)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 0
fall.recovertime = 42
yaccel = 0.5
forcestand = 1
ID = 1100

[State 1100, Evil Air Hit]
type = hitdef
triggerall = PrevstateNo = 750
trigger1 = animelem = 4 && anim = 1100 && var(1) != 1
attr = A, SA
damage = ifelse(MoveHit,30,60), 10
animtype = DiagUp
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -106
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(10) = 3, -5, ifelse(var(10) = 2, -4, -3)), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -8))
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse(var(10) = 3, -5, ifelse(var(10) = 2, -4, -3)), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -8))
guard.cornerpush.veloff = 0
guard.velocity = -10.52
getpower = ifelse(p2movetype = H, 140, 300) * (!var(20) && prevstateno != 750), 70 * (!var(20) && prevstateno != 750)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 0
fall.recovertime = 42
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0
ID = 1100

[State AI Dont Combo set]
type = varset
trigger1 = var(16) = 0
trigger1 = AILevel
trigger1 = Anim = 1100 && AnimElemtime(3) < 0
var(16) = 99

[State AI Dont Combo Clear]
type = varset
trigger1 = var(16) = 99
trigger1 = AILevel
trigger1 = Anim = 1100 && AnimElemtime(3) >= 1
var(16) = 0

[State Idle]
type = statetypeset
trigger1 = anim = 1101
movetype = I

;======================< SHORYUU KEN LANDING >=============================
[Statedef 1102]
type = S
physics = S
movetype = I
ctrl = 0
velset = 0, 0

[State 1102 Change State]
type = statetypeset
triggerall = !time
trigger1 = !AILevel && command="holddown"
trigger2 = AILevel && Random%2 = 0
value = C

[State 1102 Change Anim]
type = ChangeAnim
trigger1 = !time
value = 1102 + (StateType = C)

[State 52, Snd]
type = playsnd
trigger1 = !time
value = 0, 52

[State 52, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1000, End]
type = changestate
triggerall = anim = 1102 || anim = 1103
trigger1 = !animtime
value = 0 + 11* (StateType = C)
ctrl = 1


;======================< TATSUMAKI SENPUU KYAKU >=============================
[Statedef 1200]
type = A
physics = N
movetype = A
anim = 1200
ctrl = 0
velset = 0, 0
poweradd = 72 * !var(20)
juggle = 8
sprpriority = 1
facep2 = 1

[State 1200, HB]
type = Hitby
trigger1= Anim = [1200,1201]
value = SCA, AA,HP
ignorehitpause = 1

[State 1200, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "qcbc"), 3, ifelse(command = "qcbb", 2, 1))

[State 1200, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H && P2Bodydist x < 25), 1 + 2*(var(1)>1 && Random < 400), 1+(var(1)>1))

[State 1200, Strength AI var(20) override]
type = varset
trigger1 = !time && AIlevel && var(20)
var(10) = 1

[State 1200, Snd]
type = playsnd
trigger1 = anim = 1200 && animelem = 1
value = 4 + (var(1) = 2) * 10, 2
channel = 0

[State 1200, Snd]
type = playsnd
trigger1 = anim = 1200 && animelem = 1
value = 0, 40

[State 1200, Dust]
type = helper
trigger1 = anim = 1200 && animelem = 1
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 1200, Anim]
type = changeanim
trigger1 = anim = 1200 && !animtime
value = 1201

[State 1200, statetype]
type = statetypeset
trigger1 = anim = 1200 || anim = 1205
statetype = A
physics = A
[State 1200, statetype]
type = statetypeset
trigger1 = anim = 1201
statetype = A
physics = N

[State 1200, Vel]
type = velset
trigger1 = anim = 1200 && animelem = 1
x = 3.5
y = -4

[State 1200, Vel]
type = velset
trigger1 = anim = 1201
x = 3.5
y = 0

[State 1200, spin]
type = playsnd
trigger1 = anim = 1201 && !(animelemtime(1) % 9)
value = 1, 6
channel = 1

[State 1100, targetstate]
type = TargetState
triggerall = Target,StateType = A
triggerall = Target,MoveType = H
trigger1 = MoveHit
value = 10060
persistent = 0
ignorehitpause = 1

[State 1200, Anim]
type = changeanim
trigger1 = var(1) = 1
trigger1 = anim = 1201 && ifelse(var(10) = 3, animelemtime(18) >= 0, ifelse(var(10) = 2, animelemtime(12) >= 0, animelemtime(6) >= 0))
value = 1205
persistent = 0

[State 1200, Anim]
type = changeanim
trigger1 = var(1) != 1
trigger1 = anim = 1201 && ifelse(var(10) = 3, !animtime, ifelse(var(10) = 2, animelemtime(12) >= 0, animelemtime(6) >= 0))
value = 1205
persistent = 0

[State 1200, Hit Again]
type = movehitreset
trigger1 = var(1) = 1
trigger1 = movehit = 1 && !numtarget

[State 1200, Hit]
type = hitdef
trigger1 = var(1) = 1 && (!movehit || var(20))
trigger1 = anim = 1201 && (animelem = 2 || animelem = 8 || animelem = 14)
attr = A, SA
damage = ifelse(movehit, 21, 98), 7
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -70
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = IFElse(P2Bodydist x > 15,-2,-4), -7.5
air.type = Low
air.velocity = IFElse(P2Bodydist x > 15,-2,-4), -7.5
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 70 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 0
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0
ID= 1200

[State 1200, hitb]
type = hitdef
trigger1 = var(1) = 1 && (!movehit || var(20))
trigger1 = anim = 1201 && (animelem = 5 || animelem = 11 || animelem = 17)
attr = A, SA
damage = ifelse(movehit, 21, 98), 7
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -70
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 4, -7.5
air.type = Low
air.velocity = 4, -7.5
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 70 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 0
yaccel = 0.5
p2facing = -1
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0
ID= 1200

[State 1200, Hit]
type = hitdef
trigger1 = var(1) != 1 && hitcount < 3
trigger1 = anim = 1201 && (animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20)
attr = A, SA
damage = 35, 7
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -70
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2.5, -8
air.type = Low
air.velocity = -2.5, -6.5
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 70 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 0
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0
ID= 1200

[State 1200, hitb]
type = hitdef
trigger1 = var(1) != 1 && hitcount < 3
trigger1 = anim = 1201 && (animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23)
attr = A, SA
damage = 35, 7
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -70
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 2.5, -8
air.type = Low
air.velocity = 2.5, -6.5
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 70 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 0
yaccel = 0.5
p2facing = -1
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0
ID= 1200

[State Idle]
type = statetypeset
trigger1 = anim = 1205
movetype = I


;======================< KUUCHUU TATSUMAKI SENPUU KYAKU >=============================
[Statedef 1250]
type = A
physics = A
movetype = A
anim = 1250
ctrl = 0
velset = (vel x) + ifelse(vel x >= 0, 1, -1), (vel y) -1
poweradd = 72 * !var(20)
sprpriority = 1
juggle = 8

[State 1250, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "qcbc"), 3, ifelse(command = "qcbb", 2, 1))
[State 1250, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = 3

[State 1250, slow]
type = veladd
trigger1 = anim = 1250 && animelemtime(24) < 0
y = -const(movement.yaccel) * 0.33

[State 1250, Snd]
type = playsnd
trigger1 = animelem = 1 && anim = 1250 && vel y <= 0
value = 4 + (var(1) = 2) * 10, 2
channel = 0
[State 1250, Snd]
type = playsnd
trigger1 = animelem = 1 && anim = 1250 && vel y > 0
value = 3 + (var(1) = 2) * 10, 2
channel = 0

[State 1250, spin]
type = playsnd
trigger1 = anim = 1250 && !(animelemtime(4) % 9) && animelemtime(26) < 0
value = 1, 6
channel = 1

[State 1250, Hit Again]
type = movehitreset
trigger1 = var(1) = 1
trigger1 = movehit = 1 && !numtarget

[State 1250, Hit]
type = hitdef
triggerall = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23
trigger1 = var(1) = 1 && !MoveHit && !MoveReversed
trigger2 = var(1)>1 || var(20)
attr = A, SA
damage = ifelse(var(1) = 1, 60, 40), 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -69
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, -7 + IFElse(vel y < 0,vel y / 3.8,0) - 2.4*(HITCount > 1)
air.type = Low
air.velocity = -2, -6 + IFElse(vel y < 0,vel y / 3.8,0) - 2.4*(HITCount > 1)
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 70 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 0
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
ID = 1250 + (HITCount > 1)

[State 1250, hitb]
type = hitdef
triggerall = animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
trigger1 = var(1) = 1 && !MoveHit && !MoveReversed
trigger2 = var(1)>1 || var(20)
attr = A, SA
damage = ifelse(var(1) = 1, 60, 40), 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -70
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 2, -7 + IFElse(vel y < 0,vel y / 3.8,0) - 2.4*(HITCount > 1)
air.type = Low
air.velocity = 2, -6 + IFElse(vel y < 0,vel y / 3.8,0) - 2.4*(HITCount > 1)
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 70 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 0
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0
ID = 1250 + (HITCount > 1)

[State 1100, targetstate]
type = TargetState
triggerall = Target,StateType = A
triggerall = Target,MoveType = H
trigger1 = MoveHit
value = 10060
persistent = 0
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(27) >= 0
movetype = I


;======================< CLASSIC AERIAL TATSUMAKI >=============================
[Statedef 1270]
type = A
physics = N
movetype = A
anim = 1270
ctrl = 0
poweradd = 72 * !var(20)
sprpriority = 1
juggle = 8

[State 1270, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "hcbc"), 3, ifelse(command = "hcbb", 2, 1))
[State 1270, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = 3

[State 1270, Vel]
type = velset
trigger1 = !time
x = ifelse(vel x < 0, -3.5, 3.5)
y = 0
[State 1270, Vel]
type = veladd
trigger1 = var(10) = 1 && time >= 13
trigger2 = var(10) = 2 && time >= 23
trigger3 = time >= ifelse((backedgebodydist <= 0 || frontedgebodydist <= 0), 13, 33)
y = 0.4
[State 1270, Vel]
type = velmul
trigger1 = vel y > 0
x = 0.975

[State 1270, Snd]
type = playsnd
trigger1 = !time
value = 4 + (var(1) = 2) * 10, 2
channel = 0

[State 1270, spin]
type = playsnd
trigger1 = animelem = 5
value = 1, 6
channel = 1

[State 1270, Hit]
type = hitdef
trigger1 = animelem = 5
trigger1 = (!movehit || var(20))
attr = A, SA
damage = 35, 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -69
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -3, -6
air.type = Low
air.velocity = -3, -6
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 70 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 42
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0

[State 1270, hitb]
type = hitdef
trigger1 = animelem = 8
trigger1 = (!movehit || var(20))
attr = A, SA
damage = 35, 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -70
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 3, -6
air.type = Low
air.velocity = 3, -6
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 70 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 42
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1270, End]
type = changestate
trigger1 = pos y > -vel y
value = 52


;======================< JOUDAN SOKUTOU GERI >=============================
[Statedef 1300]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0, 0
poweradd = 72 * !var(20)
juggle = 8
sprpriority = 1
facep2 = 1

[State 1300, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "qcfc"), 3, ifelse(command = "qcfb", 2, 1))

[State 1300, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(Enemynear,GetHitVar(AnimType)=0, 1, Ifelse(P2Bodydist x > 62 && P2MoveType != H,3,2))

[State 1200, Strength AI var(20) override]
type = varset
trigger1 = !time && AIlevel && var(20)
var(10) = 1


[State 1300, Anim]
type = changeanim
trigger1 = !time
value = ifelse(var(10) = 3, 1302, ifelse(var(10) = 2, 1301, 1300))

[State 1300, Vel]
type = velset
trigger1 = (anim = [1301, 1302]) && animelemtime(4) < 0
trigger2 = anim = 1300 && animelemtime(2) < 0
x = 4

[State 1300, Snd]
type = playsnd
triggerall = var(1) != 2
trigger1 = (anim = [1301, 1302]) && animelem = 6
trigger2 = anim = 1300 && animelem = 4
value = 3, ifelse(var(10) = 3, 2, ifelse(var(10) = 2, 7, 6))
channel = 0
[State 1300, Snd]
type = playsnd
triggerall = var(1) = 2
trigger1 = (anim = [1301, 1302]) && animelem = 6
trigger2 = anim = 1300 && animelem = 4
value = 13, ifelse(var(10) = 3, 2, ifelse(var(10) = 2, 1, 3))
channel = 0

[State 1300, Snd]
type = playsnd
trigger1 = (anim = [1301, 1302]) && animelem = 6
trigger2 = anim = 1300 && animelem = 4
value = 1, 6
channel = 1
[State 1300, Snd]
type = playsnd
trigger1 = anim = 1300 && animelem = 3
trigger2 = (anim = [1301, 1302]) && animelem = 5
value = 0, 100

[State 1300, Hit]
type = hitdef
trigger1 = (anim = [1301, 1302]) && animelem = 6
trigger2 = anim = 1300 && animelem = 4
attr = S, SA
damage = (70 + var(10) * 14), 7
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 14)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -78
hitsound = s2, 6
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -3 -var(10) * 1, -6
air.type = Low
air.velocity = -3 -var(10) * 1, -6
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 140, 300) * !var(20), 70 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 1
fall.recovertime = 42
yaccel = 0.5
forcestand = 1
ID = 1300

[State 1300, Pos]
type = posadd
trigger1 = (anim = 1300 && animelem = 8) || ((anim = [1301, 1302]) && animelem = 10)
x = 15
[State 1300, Pos]
type = posadd
trigger1 = (anim = 1300 && animelem = 9) || ((anim = [1301, 1302]) && animelem = 11)
x = 10
[State 1300, Pos]
type = posadd
trigger1 = !animtime
x = 5

[State Idle]
type = statetypeset
trigger1 = anim = 1300 && animelemtime(6) >= 0
trigger2 = anim = 1301 && animelemtime(8) >= 0
trigger3 = anim = 1302 && animelemtime(8) >= 0
movetype = I

[State 1300, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================< Ryusokyaku >=============================
[Statedef 1320]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0, 0
poweradd = 180 * !var(20)
juggle = 8
sprpriority = 1
facep2 = 1

[State 1320, Strength Human]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "hcfc"), 3, ifelse(command = "hcfb", 2, 1))

[State 1320, Strength Human EX]
type = varset
triggerall = !time && !AIlevel && Power >= 500
trigger1 = command = "holda" && command = "holdb"
trigger2 = command = "holdb" && command = "holdc"
trigger3 = command = "holda" && command = "holdc"
var(10) = 4

[State 1320, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = 1

[State 1320, EX Power]
type = poweradd
trigger1 = !time && var(10) = 4
value = -500

[State 1320, Anime]
type = ChangeAnim
trigger1 = !time && !(Anim = [1320,1323])
value = 1320 + (var(10) - 1)

[State 1320, Posfix]
type = posadd
trigger1 = (Anim = [1320,1323])
trigger1 = animelemtime(2) = 0
x = IFElse(P2Dist y > (-Const(Size.height)/2.0) && P2Bodydist x < (42-20*(var(10)=1)) && P2BodyDist x >= 0,P2Bodydist x,(42-20*(var(10)=1)))

[State 1320, Posfix]
type = posadd
trigger1 = (Anim = [1320,1323])
trigger1 = animelemtime(11) = 0
x = IFElse(P2Dist y > (-Const(Size.height)/2.0) && P2Bodydist x < 54 && P2BodyDist x >= 0,P2Bodydist x,54)

[State 1320, Posfix]
type = posadd
trigger1 = (Anim = [1320,1323])
trigger1 = animelemtime(14) = 0
x = 18


[State 1320, Push]
type = veladd
trigger1 = (Anim = [1320,1323]) && var(10) >= 3
trigger1 = animelemtime(5) = 0
x = 4


[State 1320, Wind sound]
type = PlaySnd
trigger1 = (Anim = [1320,1323])
trigger1 = Animelemtime(4)=1
value = 1, 5 + (var(10) >= 3)
channel = 1
abspan = Ceil(Pos x * (600 / (gamewidth * 0.90625 / 2))) * facing

[State 1320, Hit Ground Snd]
type = PlaySnd
trigger1 = (Anim = [1320,1323])
trigger1 = Animelemtime(9)=0
value = 5,3
channel = 1
abspan = Ceil(Pos x * (600 / (gamewidth * 0.90625 / 2))) * facing

[State 1320, Voice Good]
type = PlaySnd
triggerall = var(1) != 2
trigger1 = (Anim = [1320,1323])
trigger1 = Animelemtime(7)=1
value = 3,IFElse(var(10)>=3,4,1)
channel = 0

[State 1320, Voice Evil]
type = PlaySnd
triggerall = var(1) = 2
trigger1 = (Anim = [1320,1323])
trigger1 = Animelemtime(7)=1
value = 13,IFElse(var(10)>=3,5,(1 + (Random<500)))
channel = 0

[State 1320, EX White Flash]
type = PalFx
trigger1 = var(10) = 4 && Anim = 1323
trigger1 = (time = [18,30])
time = 1
add = 216 - 12*(time-18),216 - 12*(time-18),216 - 12*(time-18)
mul = 256,256,256
ignorehitpause = 1

[State 1320, NHB]
type = NotHitBy
trigger1 = var(10) = 4 && anim = 1323
trigger1 = animelemtime(9) >= 0 && animelemtime(11) < 3
value = SCA,AA,AP,AT
ignorehitpause = 1

[State 1320, Dust 1]
type = Explod
trigger1 = (Anim = [1320,1323])
trigger1 = Animelemtime(5)=0
Anim = 7101
ID = 7101
sprpriority = 2
Space = Stage
BindID = ID
pos = Ceil((-19 * facing) * Const(Size.xscale)),Ceil(-18 * Const(Size.yscale))
facing = facing
bindtime = 1
removetime = -2
supermovetime = 256
pausemovetime = 256
scale = 0.5 * Const(Size.xscale), 0.5 * Const(Size.yscale)
ownpal = 1
ignorehitpause = 1

[State 1320, Dust 2]
type = Explod
trigger1 = (Anim = [1320,1323])
trigger1 = Animelemtime(5)=1
Anim = 7101
ID = 7101
sprpriority = 2
Space = Stage
BindID = ID
pos = Ceil((-36 * facing) * Const(Size.xscale)),Ceil(-42 * Const(Size.yscale))
facing = facing
bindtime = 1
removetime = -2
supermovetime = 256
pausemovetime = 256
scale = 0.5 * Const(Size.xscale), 0.5 * Const(Size.yscale)
ownpal = 1
ignorehitpause = 1

[State 1320, Dust 3]
type = Explod
trigger1 = (Anim = [1320,1323])
trigger1 = Animelemtime(6)=0
Anim = 7101
ID = 7101
sprpriority = 2
Space = Stage
BindID = ID
pos = Ceil((-44 * facing) * Const(Size.xscale)),Ceil(-66 * Const(Size.yscale))
facing = facing
bindtime = 1
removetime = -2
supermovetime = 256
pausemovetime = 256
scale = 0.5 * Const(Size.xscale), 0.5 * Const(Size.yscale)
ownpal = 1
ignorehitpause = 1

[State 1320, Dust 4]
type = Explod
trigger1 = (Anim = [1320,1323])
trigger1 = Animelemtime(6)=1
Anim = 7101
ID = 7101
sprpriority = 2
Space = Stage
BindID = ID
pos = Ceil((-33 * facing) * Const(Size.xscale)),Ceil(-94 * Const(Size.yscale))
facing = facing
bindtime = 1
removetime = -2
supermovetime = 256
pausemovetime = 256
scale = 0.5 * Const(Size.xscale), 0.5 * Const(Size.yscale)
ownpal = 1
ignorehitpause = 1

[State 1320, Dust 5]
type = Explod
trigger1 = (Anim = [1320,1323])
trigger1 = Animelemtime(7)=0
Anim = 7101
ID = 7101
sprpriority = 2
Space = Stage
BindID = ID
pos = Ceil((-12 * facing) * Const(Size.xscale)),Ceil(-106 * Const(Size.yscale))
facing = facing
bindtime = 1
removetime = -2
supermovetime = 256
pausemovetime = 256
scale = 0.5 * Const(Size.xscale), 0.5 * Const(Size.yscale)
ownpal = 1
ignorehitpause = 1

[State 1320, Dust 6]
type = Explod
trigger1 = (Anim = [1320,1323])
trigger1 = Animelemtime(8)=0
Anim = 7101
ID = 7101
sprpriority = 2
Space = Stage
BindID = ID
pos = Ceil((2 * facing) * Const(Size.xscale)),Ceil(-117 * Const(Size.yscale))
facing = facing
bindtime = 1
removetime = -2
supermovetime = 256
pausemovetime = 256
scale = 0.5 * Const(Size.xscale), 0.5 * Const(Size.yscale)
ownpal = 1
ignorehitpause = 1

[State 1320, Dust 6]
type = Explod
trigger1 = (Anim = [1320,1323])
trigger1 = Animelemtime(9)=0
Anim = 7101
ID = 7101
sprpriority = 2
Space = Stage
BindID = ID
pos = Ceil((33 * facing) * Const(Size.xscale)),Ceil(-114 * Const(Size.yscale))
facing = facing
bindtime = 1
removetime = -2
supermovetime = 256
pausemovetime = 256
scale = 0.5 * Const(Size.xscale), 0.5 * Const(Size.yscale)
ownpal = 1
ignorehitpause = 1

[State 1320, Dust Land 1]
type = Explod
triggerall = (Anim = [1320,1323])
trigger1 = Animelemtime(11)=0
Anim = 3211
ID = 3211
sprpriority = 2
Space = Stage
BindID = ID
pos = Ceil((30 * facing) * Const(Size.xscale)),Ceil(0 * Const(Size.yscale))
facing = -facing
bindtime = 1
removetime = -2
supermovetime = 65535
pausemovetime = 65535
scale = (1.2 + (var(10)*0.2)) * Const(Size.xscale), (1.2 + (var(10)*0.2)) * Const(Size.yscale)
ownpal = 1
ignorehitpause = 1

[State 1320, Dust Land 2]
type = Explod
triggerall = (Anim = [1320,1323])
trigger1 = Animelemtime(11)=0
Anim = 7104
ID = 7104
sprpriority = -1
Space = Stage
BindID = ID
pos = Ceil((38 * facing) * Const(Size.xscale)),Ceil(0 * Const(Size.yscale))
facing = facing
bindtime = 1
removetime = -2
supermovetime = 65535
pausemovetime = 65535
scale = (0.5 + (var(10)*0.2)) * Const(Size.xscale), (0.5 + (var(10)*0.2)) * Const(Size.yscale)
ownpal = 1
ignorehitpause = 1

[State 1320, Dust Land 3]
type = Explod
triggerall = (Anim = [1320,1323])
trigger1 = Animelemtime(11)=0
Anim = 7106
ID = 7106
sprpriority = 2
Space = Stage
BindID = ID
pos = Ceil((38 * facing) * Const(Size.xscale)),Ceil(0 * Const(Size.yscale))
facing = -facing
bindtime = 1
removetime = -2
supermovetime = 65535
pausemovetime = 65535
scale = (0.2 + (var(10)*0.1)) * Const(Size.xscale), (0.2 + (var(10)*0.1)) * Const(Size.yscale)
ownpal = 1
ignorehitpause = 1


[State 1320, Blade FX]
type = Explod
trigger1 = !NumExplod(1320) && var(10) = 4
trigger1 = (Anim = [1320,1323])
trigger1 = Animelemtime(10)=0
Anim = 1328
ID = 1328
sprpriority = 2
Space = Stage
BindID = ID
pos = Ceil((50 * facing) * Const(Size.xscale)),Ceil(-36 * Const(Size.yscale))
facing = facing
angle = 30
bindtime = 1
removetime = -2
supermovetime = 256
pausemovetime = 256
scale = 0.5 * Const(Size.xscale), 0.5 * Const(Size.yscale)
ownpal = 1
ignorehitpause = 1

[State 1300, Hit Only Air Target]
type = hitdef
trigger1 = (anim = [1320, 1323])
trigger1 = animelem = 10
trigger1 = !(MoveContact || MoveReversed)
attr = S, SA
damage = 100 - 20*(var(10)=2) + 30*(var(10)=3) + 60*(var(10)=4), 14
animtype = Hard
hitflag = A
guardflag = 
priority = 4, Hit
pausetime = 1,0
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -84
hitsound = s2, 6
guardsound = s2, 0
ground.type = Low
ground.slidetime = 26
ground.hittime = 26
ground.velocity = -3 -var(10) * 1, 0 + 16*(var(10) >= 3)
air.type = Low
air.velocity = -3 -var(10) * 1, 16
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 144, 350) * !var(20), 36 * !var(20)
givepower = 42, 42
fall = (var(10) >= 3 || P2StateType = A)
fall.recover = 0
fall.recovertime = 42
Fall.Envshake.Ampl = ID; Send Thrower ID
envshake.time = 8 + 3*var(10)
envshake.freq = 80 - 10*var(10)
envshake.ampl = -4 - var(10)
yaccel = 0.5
forcestand = 0
ID = 1320

[State 1300, Hit Low]
type = hitdef
trigger1 = (anim = [1320, 1323])
trigger1 = animelemtime(11) >= 0 && animelemtime(12) < 0
trigger1 = !(MoveContact || MoveReversed)
attr = S, SA
damage = 100 - 20*(var(10)=2) + 30*(var(10)=3) + 60*(var(10)=4), 14
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = H
hitflag = MAFL
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -20, -40
hitsound = s2, 6
guardsound = s2, 0
ground.type = Low
ground.slidetime = 26
ground.hittime = 26
ground.velocity = -3 -var(10) * 1, 0 + 16*(var(10) >= 3)
air.type = Low
air.velocity = -3 -var(10) * 1, 16
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 144, 350) * !var(20), 36 * !var(20)
givepower = 42, 42
fall = (var(10) >= 3 || P2StateType = A)
fall.recover = 0
fall.recovertime = 42
Fall.Envshake.Ampl = ID; Send Thrower ID
envshake.time = 8 + 3*var(10)
envshake.freq = 80 - 10*var(10)
envshake.ampl = -4 - var(10)
yaccel = 0.5
forcestand = 0
ID = 1320

[State 1320, Shake IF No Hit]
type = EnvShake
trigger1 = !(MoveContact || MoveReversed)
trigger1 = (Anim = [1320,1323])
trigger1 = Animelemtime(11)=1
time = 8 + 3*var(10)
freq = 80 - 10*var(10)
ampl = -4 - var(10)
ignorehitpause = 1

[State 1320, P2 State]
type = TargetState
triggerall = NumTarget(1320)
triggerall = Target(1320),hitfall && (Target,StateNo = [5000,5090])
trigger1 = Target(1320),pos y >= -16
trigger2 = Target(1320),StateNo = 5100
ID = 1320
value = 1115080
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = anim = [1320,1323]
trigger1 = animelemtime(12) > 1 && MoveType != I
movetype = I

[State 1320, End]
type = ChangeState
trigger1 = (Anim = [1320,1323])
trigger1 = !Animtime
value = 10
ctrl = 1


;======================< ASHURA SENKUU >=============================
[Statedef 1400]
type = S
physics = N
movetype = I
anim = 1400
velset = 0, 0
ctrl = 0
sprpriority = -1
facep2 = 1

[State 1400, Strength]
type = Null;varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "df2p", 3, ifelse(command = "df2k", 2, ifelse(command = "db2p", -3, -2)))

[State 1400, afterimage]
type = afterimage
trigger1 = animelem = 3
time = 2
timegap = 1
framegap = 6
length = ifelse((var(10) = 3 || var(10) = -3), 24, 18)
palbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.9, 0.9, 0.9
palcontrast = 160, 160, 160
palpostbright = 0, 0, 0
trans = add1

[State 1400, Vel]
type = velset
trigger1 = animelemtime(2) > 0 && animelemtime(6) < 0
x = ifelse(var(10) = 3, -7, ifelse(var(10) = 2, -4, ifelse(var(10) = -3, 7, 4))) * sin((time -2) / 2)

[State 1400, Vel]
type = velset
trigger1 = animelem = 6
x = ifelse(var(10) = 3, 12, ifelse(var(10) = 2, 7.5, ifelse(var(10) = -3, -12, -7.5)))

[State 1400, Vel]
type = velmul
trigger1 = animelemtime(6) > ifelse((var(10) = 3 || var(10) = -3), 16, 9)
x = 0.9

[State 1400, Snd]
type = playsnd
trigger1 = animelem = 2
value = 3 + (var(1) = 2) * 10, 4 * (var(1) != 2)
channel = 0


[State 1400, Snd]
type = playsnd
trigger1 = animelem = 6
value = 5, 4
persistent = 0

[State 1400, Push]
type = playerpush
trigger1 = animelemtime(3) >= 0
value = 0

[State 1400, nothitby]
type = nothitby
triggerall = animelemtime(6) <= ifelse((var(10) = 3 || var(10) = -3), 35, 20)
trigger1 = animelemtime(6) < 0
trigger2 = vel x < 0 && backedgebodydist > ifelse((var(10) = 3 || var(10) = -3), 12, 8)
trigger3 = vel x > 0 && frontedgebodydist > ifelse((var(10) = 3 || var(10) = -3), 12, 8)
value = SCA, AA, AP, AT
time = 1
ignorehitpause = 1

[State 1400, Turn]
type = turn
trigger1 = animelemtime(6) > 0 && p2dist x < 0

[State 1400, End]
type = changestate
trigger1 = animelemtime(6) = ifelse((var(10) = 3 || var(10) = -3), 40, 25)
trigger2 = animelemtime(6) > 0 && vel x < 0 && backedgebodydist <= 0
trigger3 = animelemtime(6) > 0 && vel x > 0 && frontedgebodydist <= 0
value = 0
ctrl = 1
