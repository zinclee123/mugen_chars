; =========== Ryu (リュウ(隆)) by BeterHans ===============
; =========== a Project based on POTSs Ryu =============

;======================================< HYPER STATES >========================================
;============================================================================================

;======================< SHINKUU HADOU KEN >=============================
[Statedef 3000]
type = S
physics = S
movetype = A
anim = 3000
ctrl = 0
velset = 0, 0
poweradd = -1000
sprpriority = 1
facep2 = 1

[State 3000, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5
[State 3000, width]
type = width
trigger1 = animelemtime(7) = 0
value = 30, 0

[State 3000, mouth]
type = explod
trigger1 = animelem = 4
anim = 3004
sprpriority = 2
postype = p1
removeongethit = 1
supermovetime = -1

[State 3000, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Unguardable Ticks]
type = VarSet
trigger1 = anim = 3000 && time = 1
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 49

[State 3000, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4 + (var(1) = 2) * 10, 3
channel = 0
volume = 200

[State 3000, Zoom Helper]
type = helper
trigger1 = !NumHelper(7660) && !var(34) && !var(33) && Abs(P2Dist y) < 140
trigger1 = time = 1
stateno = 7660
ID = 7660
name = "ZoomHelper"
facing = 1
postype = P1
supermovetime = 65535
pausemovetime = 65535
size.xScale = Const(Size.xScale)
size.yScale = Const(Size.yScale)
size.proj.doscale = ID; Give Parent ID to Child
persistent = 0

[State 3000, Super Pause FX]
type = helper
trigger1 = time = 1
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = -15, -73
ownpal = 1
persistent = 0
supermovetime = 9999

[State 3000, Super Pause]
type = superpause
trigger1 = time = 1
time = 45
movetime = 45
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = animelem = 4
fvar(5) = 0

[State 3000, NHB]
type = nothitby
trigger1 = animelemtime(7) < 0
time = 1
value = SCA

[State 1000, NotHitby]
type = Hitby
trigger1 = AnimElemtime(7) >=0 && AnimElemtime(9) < 2
value = SCA, AA,AT


[State 3000, hadouken]
type = helper
trigger1 = animelem = 7
helpertype = normal
stateno = 3005
ID = 3005
name = "hadouken"
postype = p1
pos = 80, -68
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 3000, Dust]
type = explod
trigger1 = animelem = 7
vel = 0, 0
anim = 7106
ID = 7106
sprpriority = 3
postype = p1
pos = 30, 0
ownpal = 1
scale = 0.75, 0.75
pausemovetime = -1
supermovetime = -1

[State 3000, Snd]
type = playsnd
trigger1 = animelem = 6
value = 4 + (var(1) = 2) * 10, 5 -(var(1) = 2) * 5
channel = 0
[State 3000, Snd]
type = playsnd
trigger1 = animelem = 7
value = 5, 0

[State 3000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1



;======================< DOUBLE SHINKUU HADOU KEN READY >=============================
[Statedef 3600]
type = S
physics = S
movetype = I
ctrl = 0
anim = 3600
velset = 0, 0
sprpriority = 2
facep2 = 1

[State 3600, Voice]
type = PlaySnd
trigger1 = Anim = 3600
trigger1 = animelemtime(4) = 1
value = 4,4 + IFElse(Random < 300,4,IFElse(Random > 700,6,0))
channel = 1

[State 3000, mouth]
type = explod
trigger1 = anim = 3600
trigger1 = animelemtime(4) = 1
anim = 3604
ID = 3604
sprpriority = 3
postype = p1
removeongethit = 1
supermovetime = 256

[State 3600, remove mouth]
type = RemoveExplod
trigger1 = NumExplod(3604)
triggerall = Anim = 3600
trigger1 = animtime = 0

[State 3600, Success]
type = ChangeState
triggerall = Anim = 3600
triggerall = animelemtime(4) > 2
trigger1 = Partner,Anim = 3600
trigger1 = Partner,animelemtime(4) > 2
trigger1 = var(10) := 7
trigger2 = Partner,StateNo = 3601
trigger2 = var(10) := 7
trigger3 = Partner,MoveType = H && command = "holdfwd"
trigger3 = var(10) := 5
value = 3601

[State 3600, End failed 1]
type = ChangeAnim
triggerall = anim = 3600
trigger1 = animelemtime(4) > 80 || animtime = 0
value = 3602

[State 3600, End failed 2]
type = ChangeState
trigger1 = anim = 3602
trigger1 = !AnimTime
value = 0
ctrl = 1

;=================<Double HaDouken Action>======================
[statedef 3601]
type = S
physics = S
ctrl = 0
anim = 3601
velset = 0, 0
sprpriority = 1
movetype = A
velSet = 0,0
poweradd = -1000 - 2000*(var(10) = 7)


[State 3601, width]
type = width
trigger1 = anim = 3601
trigger1 = animelemtime(2) = 0
value = 30, 0

[State 3601, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3601, Snd]
type = playsnd
trigger1 = anim = 3601
trigger1 = animelemtime(2) = 1
value = 4,5
channel = 0

[State 3601, Snd]
type = playsnd
trigger1 = time = 1
value = 7,0
channel = 1

[State 3601, Super Pause FX 1]
type = helper
trigger1= time = 1
helpertype = normal
stateno = 7500 + 20*(var(10)=7)
ID = 7500 + 20*(var(10)=7)
name = "Super Charge"
postype = P1
pos = -15,-73
facing = 1
ownpal = 1
supermovetime = 256
pausemovetime = 256
size.xscale = Const(Size.xscale)
size.yscale = Const(Size.yscale)
size.proj.doscale = ID
persistent = 0

[State 3601, Super Pause]
type = superpause
trigger1 = time = 1
time = 60
movetime = 0
anim = -1
p2defmul = 1
darken = 0

[State 3601, Corner Push]
type = varset
trigger1 = anim = 3601
trigger1 = Animelem = 2
fvar(5) = 0

[State 3601, NHB]
type = nothitby
trigger1 = anim = 3601
trigger1 = animelemtime(4) < 1
time = 1
value = SCA
ignorehitpause = 1

[State 3601, hadouken 7]
type = helper
trigger1 = var(10) = 7
trigger1 = Anim = 3601 && animelem = 3
helpertype = normal
stateno = 3605
ID = 3605
name = "Double Hadouken"
postype = P1
pos = 80, -68
size.xscale = Const(Size.xscale) * 1.5
size.yscale = Const(Size.yscale) * 1.5
size.proj.doscale = ID
ownpal = 1

[State 3601, hadouken 5]
type = helper
trigger1 = var(10) = 5
trigger1 = Anim = 3601 && animelem = 3
helpertype = normal
stateno = 3005
ID = 3005
name = "Shinku Hadouken"
postype = P1
pos = 80, -68
size.xscale = 0.5 * Const(Size.xscale)
size.yscale = 0.5 * Const(Size.yscale)
ownpal = 1

[State 3601, Dust wind]
type = explod
trigger1 = Anim = 3601 && animelem = 3
vel = 0, 0
anim = 7106
ID = 7106
sprpriority = 3
postype = p1
pos = 30, 0
ownpal = 1
size.xscale = Const(Size.xscale)
size.yscale = Const(Size.yscale)
pausemovetime = 256
supermovetime = 256

[State 3601, Snd fx]
type = playsnd
trigger1 = NumHelper(3605)
trigger1 = Anim = 3601 && animelemtime(3) = 1
value = 5, 0
abspan = Ceil(Pos x * (600 / (gamewidth * 0.90625 / 2))) * facing
channel = 1

[State 3601, End]
type = changestate
trigger1 = !animtime && time
value = 0
ctrl = 1



;======================< DENJIN HADOU KEN >=============================
[Statedef 3020]
type = S
physics = S
movetype = A
anim = 3020
ctrl = 0
velset = 0, 0
poweradd = -1000
sprpriority = 1
facep2 = 1

[State 3020, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State 3020, width]
type = width
trigger1 = 1
value = 30, 0

[State 3020, NHB]
type = nothitby
trigger1 = anim = 3020 && animelemtime(4) < 0
time = 1
value = SCA

[State 3020, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3020, Snd]
type = playsnd
trigger1 = anim = 3020 && animelem = 3
value = 4, 15
channel = 0
volume = 200

[State 3020, Super Pause FX]
type = helper
trigger1 = anim = 3020 && animelem = 3
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = -5, -69
ownpal = 1
persistent = 0
supermovetime = 9999

[State 3020, Super Pause]
type = superpause
trigger1 = anim = 3020 && animelem = 3
time = 45
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = anim = 3020 && animelem = 3
fvar(5) = 0

[State 3020, Do not guard]
type = attackdist
trigger1 = 1
value = 0

[State 3020, electricity]
type = explod
trigger1 = !numexplod(3027)
trigger1 = anim = 3020 && animelemtime(3) >= 1
anim = 3027
ID = 3027
sprpriority = 3
postype = p1
pos = -5, -69
bindtime = -1
removetime = -1
ownpal = 1
scale = 0.25, 0.25
removeongethit = 1

[State 3020, grow]
type = modifyexplod
trigger1 = numexplod(3027)
ID = 3027
scale = 0.25 + (0.00375 * var(25)), 0.25 + (0.00375 * var(25))

[State 3020, lv1indicator]
type = explod
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(25) >= 20
anim = 3030
ID = 3030
sprpriority = 4
postype = p1
pos = -5, -69
ownpal = 1
persistent = 0

[State 3020, lv2indicator]
type = explod
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(25) >= 60
anim = 3030
ID = 3030
sprpriority = 4
postype = p1
pos = -5, -69
ownpal = 1
persistent = 0

[State 3020, lv3indicator]
type = explod
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(25) >= 120
anim = 3030
ID = 3030
sprpriority = 4
postype = p1
pos = -5, -69
ownpal = 1
persistent = 0

[State 3020, lv4indicator]
type = explod
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(25) >= 200
anim = 3030
ID = 3030
sprpriority = 4
postype = p1
pos = 68, -68
ownpal = 1
persistent = 0

[State 3020, lv1flash]
type = palfx
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(25) >= 20
time = 6
add = 0, 128, 255
sinadd = 0, -128, -255, 24
persistent = 0
[State 3020, lv2flash]
type = palfx
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(25) >= 60
time = 6
add = 0, 128, 255
sinadd = 0, -128, -255, 24
persistent = 0
[State 3020, lv3flash]
type = palfx
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(25) >= 120
time = 6
add = 0, 128, 255
sinadd = 0, -128, -255, 24
persistent = 0
[State 3020, lv4flash]
type = palfx
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(25) >= 200
time = 6
add = 0, 128, 255
sinadd = 0, -128, -255, 24
persistent = 0

[State 3020, lv1snd]
type = playsnd
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(25) >= 20
value = 5, 6 + (random % 2)
persistent = 0

[State 3020, lv2snd]
type = playsnd
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(25) >= 60
value = 5, 6 + (random % 2)
persistent = 0

[State 3020, lv3snd]
type = playsnd
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(25) >= 120
value = 5, 6 + (random % 2)
persistent = 0

[State 3020, lv4snd]
type = playsnd
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(25) >= 200
value = 5, 6 + (random % 2)
persistent = 0

[State 3020, Snd]
type = playsnd
trigger1 = anim = 3020 && animelemtime(4) >= 0 && !(time % 16)
value = 5, 14

[State 3020, denjinvarreset]
type = varset
trigger1 = anim = 3020 && animelemtime(4) < 0
trigger2 = anim = 3021 && animelemtime(1) > 0
var(25) = 0

[State 3020, denjinvar]
type = varadd
triggerall = anim = 3020 && animelemtime(4) >= 0
trigger1 = !AIlevel && (command = "holdx" || command = "holdy" || command = "holdz") && var(25) < 200
trigger2 = AIlevel
var(25) = 1

[State 3020, denjinvar]
type = varadd
triggerall = anim = 3020 && animelemtime(4) >= 0
trigger1 = !AIlevel && (command = "holdx" || command = "holdy" || command = "holdz") && var(25) < 200
trigger1 = (command = "fwd" || command = "back" || command = "up" || command = "down")
trigger2 = AIlevel && random < (Ifelse(P2MoveType=H,80,800)*(AIlevel ** 2 / 64.0))
var(25) = 3

[State 3020, Anim Human Hadoken]
type = Null;changeanim
triggerall = anim = 3020 && animelemtime(4) >= 0
trigger1 = var(25) >= 200
trigger2 = !AIlevel
trigger2 = !(command = "holdx" || command = "holdy" || command = "holdz")
value = 3021

[State 3020, Anim AI Hadoken]
type = changeanim
;triggerall = AIlevel && numenemy
triggerall = Anim = 3020 && animelemtime(4) >= 0
trigger1 = (p2dist x < 0 || enemynear, movetype = A || inguarddist)
trigger2 = (p2bodydist x <= 90) && (enemynear, stateno = 40)
trigger3 = Enemynear,StateNo=5120 && Enemynear,animtime >= (-4 -5*(P2Bodydist x > 160) +4*(P2Bodydist x =[45,70]))
trigger4 = !(P2StateNo = 5030 || P2StateNo = 5035 || P2StateNo = 5050 || P2StateNo = 5100 || P2StateNo = 5101 || P2StateNo = 5100 || P2StateNo = 5110 || P2StateNo = 5120 || (P2StateNo = [5070,5072]))&& var(25)>=120
trigger5 = Enemynear,vel x > 3
;Normal Heavy release (have lots of back space)
trigger6 = NumTarget(1100) && var(1) = 1
trigger6 = (Target(1100), vel y = [-11,-9])
trigger6 = FrontEdgeBodydist > 90 && (Target(1100),BackEdgeBodydist > 30)
;Master Normal Down release
trigger7 = NumTarget(1100) && (var(1) != 1 || (Enemynear,BackEdgeBodydist < 30) || FrontEdgeBodydist < 80)
trigger7 = Target(1100),vel y > 0 && P2Dist x > 0 && P2Bodydist x < 110
trigger7 = (Target(1100),pos y - pos y) = [-40,-20]
;Normal Light release
trigger8 = NumTarget(1100) && var(1) = 1
trigger8 = P2Bodydist x = [-5,92]
trigger8 = P2Dist y = [-60,-50]
trigger8 = Target(1100),vel y < 7
value = 3021

[State 3020, removeelectricity]
type = removeexplod
trigger1 = anim = 3021
ID = 3027

[State 3020, hadouken]
type = helper
trigger1 = anim = 3021 && animelem = 1
helpertype = normal
stateno = 3025
ID = 3025
name = "Denjin Hadouken"
postype = p1
pos = 83, -68
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 3020, Dust]
type = explod
trigger1 = anim = 3021 && animelem = 1
vel = 0, 0
anim = 7106
sprpriority = 3
postype = p1
pos = 30, 0
ownpal = 1
scale = 0.75, 0.75
pausemovetime = -1
supermovetime = -1

[State 3020, Snd]
type = playsnd
trigger1 = anim = 3021 && animelem = 1
value = 4, 5
channel = 0
[State 3020, Snd]
type = playsnd
trigger1 = anim = 3021 && animelem = 1
value = 5, 0

[State 3020, End]
type = changestate
trigger1 = anim = 3021 && !animtime
value = 0
ctrl = 1


;======================< METSU HADOU KEN >=============================
[Statedef 3040]
type = S
physics = S
movetype = A
anim = 3040
ctrl = 0
velset = 0, 0
poweradd = -3000
sprpriority = 1
facep2 = 1

[State 3040, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7

[State 3040, width]
type = width
trigger1 = anim = 3041 && animelemtime(7) < 0
value = 30, 0

[State 3040, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3040, Snd]
type = playsnd
trigger1 = !(P2Life < 200 && var(1) = 2)
trigger1 = anim = 3040 && animelem = 3
value = 4 + (var(1) = 2) * 10, 10 + (var(1) = 2)
channel = 0

[State 3040, Snd]
type = playsnd
trigger1 = (P2Life < 200 && var(1) = 2)
trigger1 = anim = 3040 && animelem = 3
value = 14,14
channel = 0

[State 3040, Super Pause FX]
type = helper
trigger1 = anim = 3040 && animelem = 4
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = -15, -73
ownpal = 1
persistent = 0
supermovetime = 9999
[State 3040, Super Pause]
type = superpause
trigger1 = anim = 3040 && animelem = 4
time = 60
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = anim = 3040 && animelem = 4
fvar(5) = 0

[State 3040, NHB]
type = nothitby
trigger1 = anim = 3040 && animelemtime(5) < 0
time = 4
value = SCA

[State 3040, NHB]
type = nothitby
trigger1 = anim = 3041
trigger1 = animelemtime(2) >= 0 && animelemtime(2) < 2
time = 1
value = SCA

[State 3040, Do not guard]
type = attackdist
trigger1 = 1
value = 0

[State 3040, metsuvarreset]
type = varset
trigger1 = anim = 3040 && animelemtime(5) < 0
trigger2 = anim = 3041 && animelemtime(2) > 0
var(26) = 0

[State 3040, metsuvar]
type = varadd
triggerall = anim = 3040 && animelemtime(5) >= 0
trigger1 = !AIlevel && (command = "holdx" || command = "holdy" || command = "holdz") && var(25) < 140
trigger2 = AIlevel
var(26) = 1

[State 3040, metsuvar]
type = varadd
triggerall = anim = 3040 && animelemtime(5) >= 0
trigger1 = !AIlevel && (command = "holdx" || command = "holdy" || command = "holdz") && var(25) < 140
trigger1 = (command = "fwd" || command = "back" || command = "up" || command = "down")
trigger2 = AIlevel && random < 333
var(26) = 2

[State 3040, Shake]
type = envshake
trigger1 = anim = 3040 && animelemtime(5) >= 0 && !(time % 4)
time = 4
freq = 120
ampl = 1 + ceil(var(26) / 40)

[State 3040, bgpal]
type = bgpalfx
trigger1 = anim = 3040 && animelemtime(5) >= 0 && (var(26) = [0, 140])
mul = 256 + ceil(1.8 * var(26)), 256 -ceil(1.8 * var(26)), 256 -ceil(1.8 * var(26))
add = -ceil(var(26) / 2), -ceil(var(26) / 2), -ceil(var(26) / 2)
color = 256 -ceil(var(26) * 1.8)
time = 2

[State 3040, Snd]
type = playsnd
trigger1 = !(P2Life < 200 && var(1) = 2)
trigger1 = anim = 3040 && animelem = 5
value = 3 + (var(1) = 2) * 10, 5 + (var(1) = 2)
channel = 0

[State 3040, Snd]
type = playsnd
trigger1 = (P2Life < 200 && var(1) = 2)
trigger1 = anim = 3040 && animelemtime(5) = 50
value = 13,10
channel = 0

[State 3040, Snd]
type = playsnd
trigger1 = anim = 3040 && animelem = 5
value = 5, 15
channel = 3
loop = 1

[State 3040, Snd]
type = playsnd
trigger1 = anim = 3040 && animelem = 5
value = 5, 9
channel = 4

[State 3040, FX]
type = explod
trigger1 = !numexplod(3047)
trigger1 = anim = 3040 && animelemtime(5) >= 0
anim = 3047
ID = 3047
sprpriority = 3
postype = p1
pos = -16, -72
bindtime = -1
removetime = -1
removeongethit = 1
ownpal = 1
persistent = 0

[State 3040, grow]
type = modifyexplod
trigger1 = numexplod(3047)
ID = 3047
scale = 0.6 + .01 * var(26), 0.6 + .01 * var(26)

[State 3040, Anim]
type = changeanim
triggerall = anim = 3040 && animelemtime(5) >= 0 && var(26) < 140
trigger1 = !AIlevel && command != "holdx" && command != "holdy" && command != "holdz"
trigger2 = AIlevel && (p2dist x < 0 || (p2movetype = A && P2Bodydist x<70) || inguarddist)
trigger3 = AILevel && NumTarget(1100)
trigger3 = Target(1100),Life > 400
trigger3 = Target(1100),vel y > -2 && (Target(1100),P2Dist y = [30,50])
value = 3041

[State 3040, removefx]
type = removeexplod
trigger1 = anim = 3041
ID = 3047

[State 3040, beam]
type = changestate
trigger1 = anim = 3040 && animelemtime(5) >= 0 && var(26) >= 140
value = 3050

[State 3040, stopsnd3]
type = stopsnd
trigger1 = anim = 3041 && animelem = 2
channel = 3

[State 3040, stopsnd4]
type = stopsnd
trigger1 = anim = 3041 && animelem = 2
channel = 4

[State 3040, hadouken]
type = helper
trigger1 = anim = 3041 && animelem = 2
helpertype = normal
stateno = 3045
ID = 3045
name = "Metsu Hadouken"
postype = p1
pos = 83, -68
ownpal = 1

[State 3040, Dust]
type = explod
trigger1 = anim = 3041 && animelem = 2
anim = 7106
sprpriority = 3
postype = p1
pos = 30, 0
ownpal = 1
scale = 0.75, 0.75
pausemovetime = -1
supermovetime = -1

[State 3040, Snd]
type = playsnd
trigger1 = !(P2Life < 200 && var(1) = 2)
trigger1 = anim = 3041 && animelem = 2
value = 4 + (var(1) = 2) * 10, 0
channel = 0

[State 3040, Snd]
type = playsnd
trigger1 = (P2Life < 200 && var(1) = 2)
trigger1 = anim = 3041 && animelem = 2
value = 14,16
channel = 0

[State 3000, Snd]
type = playsnd
trigger1 = anim = 3041 && animelem = 2
value = 5, 0

[State 3040, End]
type = changestate
trigger1 = anim = 3041 && !animtime
value = 0
ctrl = 1


;======================< Ultra Metsu! Hadoken! (Ultra  滅！ 波動拳！) >=============================
[Statedef 3050]
type = S
physics = S
movetype = A
anim = 3050
ctrl = 0
velset = 0, 0
sprpriority = 1
;facep2 = 1

[State 3050, NHB]
type = nothitby
trigger1 = anim = 3050
trigger1 = animelemtime(2) >= 0 && animelemtime(2) < 4
time = 1
value = SCA

[State 3050, Do not guard]
type = attackdist
trigger1 = 1
value = 0

[State 3050, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7
[State 3050, width]
type = width
trigger1 = anim = 3050
trigger2 = anim = 3051 && animelemtime(5) < 0
value = 30, 0

[State 3050, removefx]
type = removeexplod
trigger1 = numexplod(3047)
ID = 3047

[State 3050, Snd]
type = playsnd
trigger1 = !(P2Life < 200 && var(1) = 2)
trigger1 = anim = 3050 && animelem = 1
value = 4 + (var(1) = 2) * 10, 0
channel = 0

[State 3050, Snd]
type = playsnd
trigger1 = (P2Life < 200 && var(1) = 2)
trigger1 = anim = 3050 && animelem = 1
value = 14,16
channel = 0

[State 3050, Snd]
type = playsnd
trigger1 = anim = 3050 && animelem = 1
value = 5, 10

[State 3050, Shake]
type = envshake
trigger1 = anim = 3050 && animelemtime(2) >= 0 && !(time % 4)
time = 4
freq = 120
ampl = 6

[State 3050, hadouken]
type = helper
trigger1 = anim = 3050 && animelemtime(2) >= 0
helpertype = normal
stateno = 3055
ID = 3055
name = "Ultra Metsu Hadoken"
postype = p1
ownpal = 1
persistent = 0

[State 3050, pusher]
type = helper
trigger1 = anim = 3050 && animelemtime(2) >= 0
helpertype = normal
stateno = 3054
ID = 3054
name = "Pusher"
postype = p1
pos = 40, 0
facing = -1
size.xscale = 1
size.yscale = 1
size.ground.back = 20
size.ground.front = 20
size.height = 240
persistent = 0

[State 3050, Pushback]
type = velset
trigger1 = anim = 3050
trigger1 = FrontEdgeBodydist < 120
x = -((120 - FrontEdgeBodydist) * 0.4)

[State 3050, Dust]
type = explod
trigger1 = anim = 3050 && animelem = 2
anim = 7106
sprpriority = 3
postype = p1
pos = 45, 0
removetime = -2
scale = 1.5, 1.5
ownpal = 1
pausemovetime = -1
supermovetime = -1
[State 3050, Anim]
type = changeanim
trigger1 = anim = 3050 && animelemtime(2) >= 0 && !numhelper(3055)
value = 3051

[State 3050, Snd]
type = playsnd
trigger1 = anim = 3051 && animelem = 8
value = 5000 + (var(1) = 2) * 10, 3
channel = 0
[State 3050, Snd]
type = playsnd
trigger1 = anim = 3051 && animelem = 8
value = 0, 52
[State 3050, Dust]
type = explod
trigger1 = anim = 3051 && animelem = 8
anim = 7104
ID = 7104
sprpriority = -4
postype = p1
pos = -7, 0
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3050, statetype]
type = statetypeset
trigger1 = anim = 3051 && animelemtime(8) >= 0 && animelemtime(15) < 0
statetype = C
physics = C
[State 3050, statetype]
type = statetypeset
trigger1 = anim = 3051 && animelemtime(15) >= 0
statetype = S
physics = S
[State 3050, win]
type = changestate
trigger1 = anim = 3051 && animelemtime(7) >= 0 && winko
value = 3052

[State NO Combo]
type = varset
trigger1 = !var(16)
var(16) = 99
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = anim = 3051
movetype = I

[State 3050, End]
type = changestate
trigger1 = anim = 3051 && !animtime
value = 0
ctrl = 1


;======================< NIDAN SHORYUU TSUKI >=============================
[Statedef 3100]
type = S
physics = S
movetype = A
anim = 3100
ctrl = 0
velset = 0, 0
poweradd = -1000
sprpriority = 1
facep2 = 1

[State 3100, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State 3100, Snd]
type = playsnd
trigger1 = anim = 3100 && animelem = 4
value = 4, 19
channel = 0
volume = 200

[State 3000, Zoom Helper]
type = helper
trigger1 = !NumHelper(7660) && !var(34) && !var(33) && Abs(P2Dist y) < 140
trigger1 = anim = 3100 && animelem = 4
stateno = 7660
ID = 7660
name = "ZoomHelper"
facing = 1
postype = P1
supermovetime = 65535
pausemovetime = 65535
size.xScale = Const(Size.xScale)
size.yScale = Const(Size.yScale)
size.proj.doscale = ID; Give Parent ID to Child
persistent = 0


[State 3100, Super Pause FX]
type = helper
trigger1 = anim = 3100 && animelem = 4
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = 3, -66
ownpal = 1
persistent = 0
supermovetime = 9999

[State 3100, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State Corner Push]
type = varset
trigger1 = anim = 3100 && animelem = 4
fvar(5) = 0

[State 3100, Super Pause]
type = superpause
trigger1 = anim = 3100 && animelem = 4
time = 45
movetime = 45
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State 3100, NHB]
type = nothitby
trigger1 = anim = 3100 && animelemtime(7) < 0
time = 1
value = SCA

[State 3100, Vel]
type = velset
trigger1 = anim = 3100 && animelemtime(5) >= 0 && animelemtime(7) < 0
x = 9

[State 3100, Snd]
type = playsnd
trigger1 = anim = 3100 && animelem = 5
value = 5, 12

[State 3100, Dust]
type = explod
trigger1 = anim = 3100 && animelemtime(5) >= 0 && vel x > 0.5 && !(time % 2)
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = 45, 0
vel = -2, 0
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3100, Snd]
type = playsnd
trigger1 = anim = 3100 && animelem = 6
value = 3, 4
channel = 0

[State 3100, elbowhit]
type = hitdef
trigger1 = animelem = 7 && anim = 3100
ID = 3100
attr = S, HA
damage = 115, 14
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 24
guard.pausetime = 12, 12
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -15, -64
hitsound = s2, 3
guardsound = s2, 0
p2facing = 1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 0, 0
guard.velocity = -10.52
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.type = Low
air.velocity = -.5, -3
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 9
forcestand = 1
yaccel = 0.5
forcestand = 1

[State 3100, switch]
type = changeanim
trigger1 = anim = 3100
trigger1 = animelemtime(7) >= 0 && animelemtime(8) < 0 && movehit
value = 3101
ignorehitpause = 0

[State 3100, Vel]
type = velset
trigger1 = anim = 3101 && animelemtime(5) >= 0 && animelemtime(7) < 0 && p2bodydist x > 0
x = 5

[State 3100, Vel]
type = velset
trigger1 = anim = 3101 && animelem = 7
x = 12
y = -11

[State 3100, Vel]
type = velmul
trigger1 = 1
x = 0.88

[State 3100, Vel]
type = velmul
trigger1 = vel y > 0
x = 0

[State 3100, statetype]
type = statetypeset
trigger1 = anim = 3101 && animelemtime(7) >= 0
trigger2 = anim = 1101
statetype = A
physics = A

[State 3100, Anim]
type = changeanim
trigger1 = anim = 3101 && animelemtime(7) > 0 && vel y > -5
value = 1101
persistent = 0

[State 3100, Snd]
type = playsnd
trigger1 = anim = 3101 && animelem = 6 && !var(23)
value = 4, 1
channel = 0
ignorehitpause = 1
persistent = 0

[State 3100, shinvar]
type = poweradd
triggerall = anim = 3101 && animelemtime(6) < 0 && power >= 2000
trigger1 = !AIlevel
trigger1 = (var(1) = 1 && command = "2df2k") || (var(1) = 3 && command = "qcbhcfk")
trigger2 = AIlevel 
trigger2 = Animelem = 3 && (p2bodydist x = [0, 48]) && random < 800
value = -2000 + 0 * (var(23) := 1)
ignorehitpause = 1
persistent = 0

[State 3100, Zoom Helper]
type = helper
triggerall = !NumHelper(7660) && var(23)
triggerall = NumTarget(3100)
triggerall = Target(3100),StateNo = [5000,5080]
trigger1 = anim = 3101
stateno = 7663
ID = 7663
name = "ZoomHelper"
facing = 1
postype = P1
pos = 0,0
facing = 1
supermovetime = 999
pausemovetime = 999
size.xScale = Const(Size.xScale)
size.yScale = Const(Size.yScale)
size.proj.doscale = Target(3100),ID; Give Parent ID to Child
ownpal = 1
persistent = 0
ignorehitpause = 1

[State 3100, palfx]
type = palfx
trigger1 = anim = 3101 && animelemtime(6) < 0 && var(23)
time = 20
add = 255, 255, 255
sinadd = -255, -255, -255, 80
ignorehitpause = 1
persistent = 0

[State 3100, shinshoryuken]
type = changestate
trigger1 = anim = 3101 && animelem = 7 && var(23)
value = 3120

[State 3100, Snd]
type = playsnd
trigger1 = anim = 3101 && animelem = 7
value = 0, 41

[State 3100, Dust]
type = helper
trigger1 = anim = 1100 && animelem = 4
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 3100, Push]
type = playerpush
trigger1 = anim = 3101 && animelemtime(6) >= 0 && var(23) && power >= 2000
value = 0
ignorehitpause = 1

[State 3100, Snd]
type = playsnd
trigger1 = anim = 3101 && var(23)
value = 4, 11
channel = 0
ignorehitpause = 1
persistent = 0

[State 3100, Dust]
type = helper
trigger1 = anim = 3101 && animelem = 6
helpertype = normal
stateno = 3125
ID = 3125
name = "B&W Dust"
postype = p1
pos = 0, 0
ownpal = 1
ignorehitpause = 1
size.xscale = 2
size.yscale = 2

[State 3100, lowhit]
type = hitdef
trigger1 = animelem = 6 && anim = 3101
ID = 3100
attr = S, HA
damage = 58, 7
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(23), 45, 16), ifelse(var(23), 35, 16)
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -79
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(23), (p2dist x) / 30.0, 0.5), -6
air.type = Low
air.velocity = ifelse(var(23), (p2dist x) / 30.0, 0.5), ifelse(var(23), -6, -4)
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
fall.animtype = Medium
yaccel = 0.5
forcestand = 1

[State 3100, shoryuuhit]
type = hitdef
trigger1 = animelem = 7 && anim = 3101
ID = 3100
attr = A, HA
damage = 58, 7
animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -106
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4, -12
air.type = Low
air.velocity = -4, -12
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
yaccel = 0.5
forcestand = 1

[State Idle]
type = statetypeset
trigger1 = anim = 3100 && animelemtime(8) >= 0
trigger2 = anim = 1101 || anim = 3102
movetype = I

[State 3100, End]
type = changestate
trigger1 = anim = 3100 && !animtime
value = 0
ctrl = 1

[State 3100, End]
type = changestate
trigger1 = anim = 3102 && !animtime
value = 11
ctrl = 1


;======================< 真・昇龍拳 Shin Shōryūken >=============================
[Statedef 3120]
type = S
physics = S
movetype = A
anim = 3120
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = ifelse(prevstateno = 3100, 0, -3000)
juggle = 0
facep2 = (prevstateno != 3100)

[State 3120, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7

[State 3120, Pos]
type = posadd
trigger1 = !time
trigger1 = anim = 3120 && (prevstateno = 212 || prevstateno = 214)
x = ifelse((prevstateno = 212), 30, 21)

[State 3120, Snd]
type = playsnd
trigger1 = anim = 3120 && animelem = 2
value = 4, 9
channel = 0
volume = 200
fvar(21)fvar(21)
[State 3120, Unguardable Ticks]
type = VarSet
trigger1 = anim = 3120 && animelem = 2
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 5

[State 3120, Super Pause FX]
type = helper
trigger1 = anim = 3120 && animelem = 2
trigger1 = prevstateno != 3100
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = -25, -57
ownpal = 1
persistent = 0
supermovetime = 9999

[State 3120, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3120, Super Pause]
type = superpause
trigger1 = anim = 3120 && animelem = 2
trigger1 = prevstateno != 3100
time = 60
movetime = 60
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = anim = 3120 && animelem = 2
trigger1 = prevstateno != 3100
fvar(5) = 0

[State 3120, NHB]
type = nothitby
trigger1 = anim = 3120 && animelemtime(5) < 4
trigger2 = anim = 3121 && animelemtime(2) >=0 && animelemtime(5) < 3
time = 1
value = SCA
ignorehitpause = 1

[State 3120, width]
type = width
trigger1 = anim = 3120 && animelemtime(4) >= 0 && animelemtime(5) < 0 && movehit
trigger2 = anim = 3121 && animelemtime(4) < 0
player = -28, 0
ignorehitpause = 1

[State 3120, width]
type = width
trigger1 = anim = 3121 && animelemtime(4) >= 0
player = -10, 0
edge = const(size.air.front)
ignorehitpause = 1

[State 3120, switch]
type = ChangeAnim
trigger1 = anim = 3120 && animelemtime(4) > 0 && animelemtime(5) < 0
trigger1 = movehit && NumTarget(3120)
trigger1 = Target(3120),StateNo>=5000
trigger1 = AIlevel || (!AIlevel && command != "holdup")
trigger2 = prevstateno = 3100
value = 3121
ignorehitpause = 0
persistent = 0

[State 3120, Vel]
type = velset
trigger1 = anim = 3120 && animelem = 5
trigger2 = anim = 3121 && animelem = 4
x = ifelse(anim = 3121, 2, 12)
y = ifelse(anim = 3121, -14, -12)

[State 3120, Vel]
type = velmul
trigger1 = 1
x = 0.88

[State 3120, Vel]
type = velmul
trigger1 = vel y > 0
x = 0

[State 3120, Snd]
type = playsnd
trigger1 = anim = 3120 && animelem = 5
trigger2 = anim = 3121 && animelem = 4
value = 0, 41

[State 3120, Dust]
type = helper
trigger1 = anim = 3120 && animelem = 5
trigger2 = anim = 3121 && animelem = 4
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 3120, low first 1]
type = hitdef
trigger1 = anim = 3120
trigger1 = animelem = 4
attr = S, HA
damage = 192,24
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 7, Hit
pausetime = 50,50
guard.pausetime = 22, 25
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -79
hitsound = s2, 3
guardsound = s2, 0
p2facing = 1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 0.77, -6
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = 0.77, -6
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
envshake.time = 30
envshake.freq = 60
envshake.ampl = 15
envshake.phase = 90
fall = 1
fall.recover = 0
kill = ifelse(anim = 3120, (numenemy > 1), (numtarget != numenemy))
yaccel = 0.6
forcestand = 1
ID = 3120

[State 3120, low second 2]
type = hitdef
trigger1 = anim = 3121
trigger1 = animelem = 3
attr = S, HA
damage = 75,10
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 7, Hit
pausetime = 45,45
guard.pausetime = 12, 12
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10,-90
hitsound = s2, 3
guardsound = s2, 0
p2facing = 1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 0.77, -6
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = 0.77, -6
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 30
envshake.freq = 60
envshake.ampl = 15
envshake.phase = 90
fall = 1
fall.recover = 0
kill = (numtarget != numenemy)
yaccel = 0.6
forcestand = 1
ID = 3120


[State 3120, shinshoryuuhits]
type = hitdef
trigger1 = anim = 3121
trigger1 = (animelem = 4 || animelem = 5)
attr = A, HA
damage = 74, 9
animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse((animelem = 5), 36, 12), ifelse((animelem = 5), 36, 12)
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -15, -103
hitsound = s2, ifelse((animelem = 5), 8, 3)
guardsound = s2, 0
p2facing = 1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse((animelem = 4), 0, -2), ifelse((animelem = 4), -12, -30)
air.type = Low
air.velocity = ifelse((animelem = 4), 0, -2), ifelse((animelem = 4), -12, -30)
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 24
envshake.freq = 120
envshake.ampl = 8
fall = 1
fall.recover = 0
fall.envshake.time = 18
fall.envshake.freq = 120
fall.envshake.ampl = 6
fall.damage = 60
kill = (numtarget != numenemy) || (animelem = 5)
yaccel = 0.6
forcestand = 1
ID = 3120


[State 3120, No Music]
type = AssertSpecial
triggerall = NumTarget(3120)
triggerall = (Target(3120),StateNo = [5000,5099]) || (Target(3120),StateNo = 3125050)
trigger1 = Anim = 3120 && Animelemtime(4)>=0
trigger2 = Anim = 3121
flag = nomusic
ignorehitpause = 1

[State 3120, MaxHit Sound]
type = PlaySnd
trigger1 = Anim = 3120 && Animelemtime(4)>=0 && Animelemtime(5)<0
trigger1 = NumTarget(3120)
trigger1 = (Target(3120),StateNo = [5000,5099])
value = 5,21
abspan = 0
channel = 6
ignorehitpause = 1
persistent = 0

[State 3120, Zoom Helper]
type = helper
triggerall = !NumHelper(7660); && !var(34) && !var(33)
triggerall = NumTarget(3120)
triggerall = Target(3120),StateNo = [5000,5080]
trigger1 = anim = 3120 && animelemtime(4)>=0 && animelemtime(5)<0
stateno = 7663
ID = 7663
name = "ZoomHelper"
facing = 1
postype = P1
pos = 0,0
facing = 1
supermovetime = 999
pausemovetime = 999
size.xScale = Const(Size.xScale)
size.yScale = Const(Size.yScale)
size.proj.doscale = Target(3120),ID; Give Parent ID to Child
ownpal = 1
persistent = 0
ignorehitpause = 1


[State 3120, No hit shoryuuhits]
type = hitdef
trigger1 = anim = 3120
trigger1 = animelemtime(5) >= 0
trigger1 = animelemtime(5) % 5 = 0
attr = A, HA
damage = 80, 7
animtype = Up
guardflag = M
hitflag = MAF
priority = 6, Hit
pausetime = 6, 1
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -106
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 24
ground.hittime = 24
ground.velocity = -3, -13
air.type = Low
air.velocity = -3, -13
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
fall.damage = 14
yaccel = 0.5
forcestand = 1
ID = 3120


[State 3120, fix]
type = targetbind
trigger1 = numtarget(3120) = 1
trigger1 = (target, stateno != [120, 155]) && !(target(3120), hitshakeover)
trigger1 = anim = 3120 && animelemtime(4) >= 0 && animelemtime(5) < 0
ID = 3120
pos = 38 + target(3120), const(size.mid.pos.x), -88 -target(3120), const(size.mid.pos.y)
ignorehitpause = 1

[State 3120, fix]
type = targetbind
trigger1 = numtarget(3120) = 1
trigger1 = (target, stateno != [120, 155]) && !(target(3120), hitshakeover)
trigger1 = anim = 3121 && animelemtime(3) >= 0 && animelemtime(4) < 0
ID = 3120
pos = 24 + target(3120), const(size.mid.pos.x), -98 -target(3120), const(size.mid.pos.y)
ignorehitpause = 1

[State 3120, Sparks]
type = helper
triggerall = movehit && numtarget(3120)
triggerall = (target(3120),movetype = H) && (target(3120),StateNo = [5000,5099])
trigger1 = anim = 3120 && animelemtime(4) = 1 && (target(3120),time = 0)
trigger2 = anim = 3121 && animelemtime(3) = 0
trigger3 = anim = 3121 && animelemtime(4) = 0
trigger4 = anim = 3121 && animelemtime(5) = 0
helpertype = normal
stateno = 7051
ID = 7051
name = "Shin Shoryuken Spark"
postype = p1
pos = ifelse(anim = 3121, 26, 36), ifelse((anim = 3121 && animelem = 5), -128, ifelse((anim = 3121 && animelem = 4), -109, ifelse((anim = 3121 && animelem = 3), -90, -80)))
;pos = (target, const(size.ground.front) -ifelse((anim = 3121 && animelemtime(4) < 0), 15, 10)), ifelse((anim = 3120), -79, ifelse((animelemtime(4) < 0), -90, -103)) -floor(p2dist y)
ownpal = 1
facing = -1
ignorehitpause = 1
pausemovetime = 255
supermovetime = 255

[State 3120, Snd]
type = playsnd
trigger1 = movehit = 1
trigger1 = anim = 3120 && animelemtime(5) < 0
value = 3, 4
channel = 0
ignorehitpause = 1
persistent = 0

[State 3120, Snd]
type = playsnd
trigger1 = anim = 3120 && animelem = 5
value = 4, 1
channel = 0
ignorehitpause = 1
persistent = 0

[State 3120, Snd]
type = playsnd
trigger1 = anim = 3121 && animelem = 1
value = 4, 4
channel = 0
ignorehitpause = 1
persistent = 0
[State 3120, Snd]
type = playsnd
trigger1 = anim = 3121 && animelem = 4
value = 4, 6
channel = 0
ignorehitpause = 1
persistent = 0

[State 3120, Dust]
type = helper
triggerall = movehit && numtarget
triggerall = (target, movetype = H) && !(target, time)
trigger1 = anim = 3120 && animelemtime(4) > 0 && animelemtime(5) < 0
trigger2 = anim = 3121 && animelemtime(5) < 0
helpertype = normal
stateno = 3125
ID = 3125
name = "B&W Dust"
postype = p1
pos = 0, 0
ownpal = 1
ignorehitpause = 1
size.xscale = 2
size.yscale = 2

[State 3120, statetype]
type = statetypeset
trigger1 = anim = 3120 && animelemtime(5) >= 0
trigger2 = anim = 3121 && animelemtime(4) >= 0
trigger3 = anim = 1101 || anim = 1111
statetype = A
physics = N

[State 3120, Accel]
type = gravity
trigger1 = anim = 3120 && animelemtime(5) > 0
trigger2 = anim = 3121 && animelemtime(4) > 0
trigger3 = anim = 1101 || anim = 1111

[State 3120, Anim]
type = changeanim
trigger1 = anim = 3120 && animelemtime(5) > 0 && vel y > -5
trigger2 = anim = 3121 && animelemtime(4) > 0 && vel y > -4
value = ifelse(anim = 3121, 1111, 1101)
persistent = 0
[State 3120, Anim]
type = changeanim
trigger1 = pos y >= -10 && (anim = 1101 || anim = 1111)
value = ifelse(anim = 1101, 1102, 3122)
persistent = 0

[State 3120, Vel]
type = velset
trigger1 = anim = 1102 || anim = 3122
y = 0
[State 3120, Pos]
type = posset
trigger1 = anim = 1102 || anim = 3122
y = 0

[State 3120, Snd]
type = playsnd
trigger1 = anim = 1102 || anim = 3122
value = 0, 52
persistent = 0

[State 3120, Dust]
type = explod
trigger1 = anim = 1102 || anim = 3122
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
pos = 0, 0
vel = 0, 0
ownpal = 1
scale = 0.5, 0.5
persistent = 0
pausemovetime = -1
supermovetime = -1

[State Idle]
type = statetypeset
trigger1 = anim = 1101 || anim = 1111 || anim = 1102 || anim = 3122
movetype = I

[State 3120, End]
type = changestate
trigger1 = anim = 3100 && !animtime
value = 0
ctrl = 1

[State 3120, TargetState]
type = TargetState
trigger1 = (Anim = 3121 && Animelemtime(5)>= 0) || Anim = 1111
trigger1 = NumTarget(3120)
trigger1 = Target(3120),StateNo = 5050
value = 3125050
ignorehitpause = 1

[State 3120, Pause]
type = Pause
triggerall = NumTarget(3120)
trigger1 = anim = 3120
trigger2 = anim = 3121 && animelemtime(3) < 0
time = 1
movetime = 1
pausebg = 1
ignorehitpause = 1

[State 3120, End]
type = changestate
trigger1 = (anim = 1102 || anim = 3122) && !animtime
value = ifelse(anim = 3122, 11, 0)
ctrl = 1

;=============== Target flying high =======================
[Statedef 3125050]
type    = A
movetype= H
physics = N

[State 3125050, No Y follow]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 3125050, 1] ;Change anim when done with transition
type = ChangeAnim2
trigger1 = AnimTime = 0
trigger1 = Anim = 5035
trigger2 = Time = 0     ;If no transition anim
trigger2 = Anim != 5035
trigger2 = (Anim != [5051, 5059]) && (Anim != [5061, 5069])
trigger2 = Anim != 5090 ;Not if hit off ground anim
value = 5050

[State 3125050, 2] ;Coming down anim
type = ChangeAnim2
trigger1 = anim = [5050,5059]
trigger1 = Vel Y >= ifelse(anim = 5050, Const720p(4), Const720p(-8))
trigger1 = SelfAnimExist(anim+10)
value = anim+10
persistent = 0

[State 3125050, 3] ;Gravity
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 3125050, 6]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= ifelse((anim = [5051,5059]) || (anim = [5061,5069]), 0, Const(movement.air.gethit.groundlevel))
value = 5100 ;Downed get-hit (hit ground from fall)



;======================< MESSATSU GOU SHORYUU LV 1-2 >=============================
[Statedef 3140]
type = S
physics = S
movetype = A
ctrl = 0
anim = 3140
velset = 0, 0
juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
sprpriority = 1
facep2 = 1

[State 3140, Strength Human]
type = varset
trigger1 = !time && !AILevel
var(10) = 5 + (Command = "holdc" && Power >= 2000 && !var(20))

[State 3140, Strength AI]
type = varset
trigger1 = !time && AILevel
var(10) = 5 + (Random < 400 && Power >= 2000 && !var(20))

[State 3140, Unguardable Ticks]
type = VarSet
trigger1 = anim = 3140 && animelemtime(1) = 2
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 4

[State 3140, Snd]
type = playsnd
trigger1 = anim = 3140 && animelemtime(1) = 2
value = 4 + (var(1) = 2) * 10, 10 -(var(1) = 2)
channel = 0

[State 3140, Anim Skip]
type = ChangeAnim
trigger1 = var(10) = 5
trigger1 = Anim = 3140
trigger1 = AnimElemtime(13)=0
value = 3140
elem = 25
ignorehitpause = 1

[State 3000, Zoom Helper]
type = helper
trigger1 = !NumHelper(7660) && !var(34) && !var(33) && Abs(P2Dist y) < 140
trigger1 = anim = 3140 && animelemtime(1) = 1
stateno = 7660
ID = 7660
name = "ZoomHelper"
facing = 1
postype = P1
supermovetime = 65535
pausemovetime = 65535
size.xScale = Const(Size.xScale)
size.yScale = Const(Size.yScale)
size.proj.doscale = ID; Give Parent ID to Child
persistent = 0


[State 3140, Super Pause FX]
type = helper
trigger1 = anim = 3140 && animelemtime(1) = 2
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = 12, -54
ownpal = 1
persistent = 0
supermovetime = 9999

[State 3140, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3140, Super Pause]
type = superpause
trigger1 = anim = 3140 && animelemtime(1) = 2
time = 45 + 8*(var(10) = 6)
anim = -1
sound = s7, 0
poweradd = ifelse(var(20) > 0, -10 * var(20), -1000 -1000*(var(10)=6))
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = anim = 3140 && animelemtime(1) = 2
fvar(5) = 0

[State 3140, NHB]
type = hitby
trigger1 = anim = 3140 && animelemtime(4) < 0
time = 1
value = SC,HT
ignorehitpause = 1

[State 3140, Posfix]
type = Posadd
triggerall = FrontEdgeBodyDist > 14
trigger1 = anim = 3140 && (animelem = 4 || animelem = 16 || animelem = 28)
trigger1 = !(P2Bodydist x = [-30,1]) || P2Dist y < -50
x = 14

[State 3140, Vel]
type = velset
trigger1 = anim = 3140 && (animelem = 2 || animelem = 14)
x = 8 + 4*(var(10)=6)

[State 3140, Vel]
type = velset
trigger1 = anim = 3140 && animelem = 26
x = 10 + 5*(var(10)=6)

[State 3140, Dust]
type = explod
trigger1 = anim = 3140 && (animelem = 2 || animelem = 14 || animelem = 26)
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3140, Snd]
type = playsnd
trigger1 = anim = 3140 && (animelem = 4 || animelem = 16 || animelem = 28) && var(1) = 2
value = 13, ifelse((animelem = 4), 0, ifelse((animelem = 16), 3, 2))
channel = 0
[State 3140, Snd]
type = playsnd
trigger1 = anim = 3140 && (animelem = 4 || animelem = 16 || animelem = 28) && var(1) != 2
value = 3, ifelse((animelem = 4), 6, ifelse((animelem = 16), 7, 3))
channel = 0

[State 3140, Snd]
type = playsnd
trigger1 = anim = 3140 && (animelem = 4 || animelem = 16)
value = 1, 5
channel = 1
[State 3140, Snd]
type = playsnd
trigger1 = anim = 3140 && animelem = 28
value = 1, 6
channel = 1

[State 3140, Snd]
type = playsnd
trigger1 = anim = 3140 && animelemtime(28) = 1
value = 0, 41

[State 3140, Dust]
type = helper
trigger1 = anim = 3140 && animelem = 28
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 3140, Vel]
type = velset
trigger1 = anim = 3140 && animelemtime(28) = 1
x = 5 + 2*(var(10)=6)
y = -11

[State 3140, Vel]
type = velmul
trigger1 = vel y < 0
x = 0.86

[State 3140, Vel]
type = velmul
trigger1 = vel y > 0
x = 0

[State 3140, statetype]
type = statetypeset
trigger1 = anim = 3140 && animelemtime(28) >= 1
trigger2 = anim = 1101
statetype = A
physics = A
[State 3140, Anim]
type = changeanim
trigger1 = anim = 3140 && animelemtime(28) > 1 && vel y > -5.5
value = 1101
persistent = 0

[State 3140, hitlow]
type = hitdef
trigger1 = animelem = 14 && anim = 3140
attr = S, HA 
damage = 30, 6
animtype = Medium 
fall.animtype = Medium 
guardflag = M 
hitflag = MAF
priority = 4, Hit
pausetime = ifelse((animelem = 24), 18, 6), ifelse((animelem = 24), 18, 6)
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -52
hitsound = s2, 3 
guardsound = s2, 0
ground.type = Low
ground.slidetime = 24
ground.hittime = 24
ground.velocity = -4, 0
ground.cornerpush.veloff = 0
air.velocity = -4, -2
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
yaccel = 0.5
forcestand = 1
ID = 3140

[State 3140, hitlow2]
type = hitdef
trigger1 = (animelem = 3 || animelem = 15) && anim = 3140
attr = S, HA 
damage = 30, 6
animtype = Hard 
fall.animtype = Hard 
guardflag = M 
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -75
hitsound = s2, 3 
guardsound = s2, 0
ground.type = Low
ground.slidetime = 24
ground.hittime = 24
ground.velocity = -4, 0
ground.cornerpush.veloff = 0
air.velocity = -4, -2
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
yaccel = 0.5
forcestand = 1
ID = 3140

[State 3140, hitlow3]
type = hitdef
trigger1 = animelem = 26 && anim = 3140
attr = S, HA 
damage = 50, 6
animtype = Medium 
fall.animtype = Medium 
guardflag = M 
hitflag = MAF
priority = 4, Hit
pausetime = 18, 18
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -52
hitsound = s2, 3 
guardsound = s2, 0
ground.type = Low
ground.slidetime = 24
ground.hittime = 24
ground.velocity = 0.5, -6
air.velocity = 0.5, -6
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
yaccel = 0.5
forcestand = 1
ID = 3140

[State 3140, hitlow4]
type = hitdef
trigger1 = animelem = 27 && anim = 3140
attr = S, HA 
damage = 50, 6
animtype = Hard 
fall.animtype = Hard 
guardflag = M 
hitflag = MAF
priority = 4, Hit
pausetime = 18, 18
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -75
hitsound = s2, 3 
guardsound = s2, 0
ground.type = Low
ground.slidetime = 24
ground.hittime = 24
ground.velocity = 0.5, -6
air.velocity = 0.5, -6
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
yaccel = 0.5
forcestand = 1
ID = 3140

[State 3140, hithigh]
type = hitdef
trigger1 = (animelem = 4 || animelem = 16) && anim = 3140
attr = S, HA 
damage = 30, 6
animtype = Hard 
guardflag = M 
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -100
hitsound = s2, 3 
guardsound = s2, 0
ground.type = High
ground.slidetime = 24
ground.hittime = 24
ground.velocity = -4, 0
ground.cornerpush.veloff = 0
air.velocity = -4, -2
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
yaccel = 0.5
forcestand = 1
ID = 3140

[State 3140, hitfinal]
type = hitdef
trigger1 = animelem = 28 && anim = 3140
persistent = 0
attr = A, HA 
damage = 50, 6
animtype = Up
guardflag = M 
hitflag = MAF
priority = 4, Hit
pausetime = 2, 2
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -100
hitsound = s2, 3 
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -6, -12
air.velocity = -6, -12
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 7
fall = 1
fall.recover = 0
yaccel = 0.5
forcestand = 1
ID = 3140

[State Idle]
type = statetypeset
trigger1 = anim = 1101
movetype = I



;======================< MESSATSU GOSHORYU LV 3 The SF4 Ultra 2 for Evil Ryu >=============================
[Statedef 3150]
type = S
physics = S
movetype = A
anim = 3150
ctrl = 0
velset = 0, 0
poweradd = -3000
juggle = 6
facep2 = 1
sprpriority = 1

[State 3150, Strength]
type = varset
trigger1 = !time
trigger1 = var(10) != 7
var(10) = 7

[State 3150, Unguardable Ticks]
type = VarSet
trigger1 = anim = 3150 && time = 1
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 67

[State 3150, MAXChargeHit Phase 1]
type = varset
trigger1 = anim = 3155
trigger1 = animelemtime(1) = 19
var(10) = 11

[State 3150, MAXChargeHit Phase 2 spride fings]
type = varset
trigger1 = anim = 3155
trigger1 = animelemtime(8) = 0
var(10) = 12

[State 3150, MAXChargeHit Phase 3 Charge time = 250]
type = varset
trigger1 = anim = 3155
trigger1 = animelemtime(12) = 0
var(10) = 13

[State 3150, MAXChargeHit Phase 4 dive attack go up]
type = varset
trigger1 = anim = 3156 && var(10) < 14
var(10) = 14

[State 3150, MAXChargeHit Phase 4 dive attack go down]
type = varset
trigger1 = anim = 3156 && var(10) = 14
trigger1 = animelemtime(7) = 3
var(10) = 15

[State 3150, MAXChargeHit Phase 4 dive attack hitground]
type = varset
trigger1 = anim = 3156 && var(10) = 15
trigger1 = animelemtime(8) = 0
var(10) = 16

[State 3150, remember Ground leve]
type = varset
trigger1 = !time
var(5) = Ceil(GameHeight - Screenpos y)

;------- Not Hit By --------
[State 3150, NHB]
type = NotHitBy
trigger1 = anim = 3150 && animelemtime(13) < 0
trigger2 = anim = 3151 && animelemtime(2) >= 0 && animelemtime(8) < 0
trigger3 = anim = 3152 && animelemtime(3) >= 0 && animelemtime(12) < 0
trigger4 = anim = 3155
trigger6 = anim = 3156 && animelemtime(11) < 0
value = SCA, AA,AP,AT
ignorehitpause = 1

[State 3150, Super Pause FX]
type = helper
trigger1 = time = 3 && !NumHelper(7530)
helpertype = normal
stateno = 7530
ID = 7530
name = "Ultra Charge"
postype = P1
pos = -Ceil(36 * Const(size.xscale)), -Ceil(58 * Const(size.yscale))
ownpal = 1
supermovetime = 256
pausemovetime = 256
size.xscale = Const(size.xscale)
size.yscale = Const(size.yscale)
size.proj.doscale = ID

[State 3150, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3150, Super Pause]
type = superpause
trigger1 = time = 3
time = 60
movetime = 60
anim = -1
sound = s7, 0
poweradd = 0
p2defmul = 1
darken = 0

;------- Anim pos fix -------------
[State 3150, Posfix 1]
type = posadd
trigger1 = Anim = 3150
trigger1 = animelemtime(3) = 0
x = -5

[State 3150, Posfix 2]
type = posadd
trigger1 = Anim = 3150
trigger1 = animelemtime(4) = 0
x = 4

[State 3150, Posfix 2]
type = posadd
trigger1 = Anim = 3152
trigger1 = animelemtime(3) = 0
x = IFElse(P2Dist y > (-Const(Size.height)/2.0) && P2Bodydist x < 24 && P2BodyDist x >= 0,P2Bodydist x,24)

[State 3150, Posfix 3]
type = posadd
trigger1 = Anim = 3150
trigger1 = animelemtime(8) = 0
trigger2 = Anim = 3152
trigger2 = animelemtime(7) = 0
x = 11

[State 3150, Posfix 4 shoryuken up]
type = posadd
triggerall = FrontEdgeBodyDist > 22
trigger1 = Anim = 3150
trigger1 = animelemtime(12) = 0
trigger2 = Anim = 3151
trigger2 = animelemtime(7) = 0
trigger3 = Anim = 3152
trigger3 = animelemtime(11) = 0
trigger4 = anim = 3155
trigger4 = animelemtime(1) = 0
x = IFElse(P2Dist y > (-Const(Size.height)/2.0) && P2Bodydist x < 22 && P2BodyDist x >= 0,P2Bodydist x,22)

[State 3150, Posfix 5]
type = posadd
trigger1 = Anim = 3151
trigger1 = animelemtime(4) = 0
x = IFElse(P2Dist y > (-Const(Size.height)/2.0) && P2Bodydist x < 20 && P2BodyDist x >= 0,P2Bodydist x,20)

[State 3150, MaxCharge Phase 1 velset]
type = velset
trigger1 = var(10) = 11
trigger1 = anim = 3155
trigger1 = animelemtime(1) >= 19 && animelemtime(2) < 0
x = 0
y = 0

[State 3150, MaxCharge Phase 1 pos]
type = posset
trigger1 = anim = 3155
trigger1 = animelemtime(1) >= 19 && animelemtime(3) < 0
x = 0
y = -10

[State 3150, MaxCharge Phase 2 go up]
type = posadd
trigger1 = var(10) = 12
trigger1 = anim = 3155
y = -2

[State 3150, Voice 1]
type = PlaySnd
trigger1 = anim = 3150
trigger1 = animelemtime(1) = 1
value = 13,8
volumescale = 100
channel = 0

[State 3150, Voice 2]
type = PlaySnd
trigger1 = anim = 3150
trigger1 = animelemtime(8) = 1
value = 13,9
volumescale = 100
channel = 0

[State 3150, Sound Shoryuout]
type = PlaySnd
trigger1 = anim = 3150
trigger1 = animelemtime(10) = 0
trigger2 = anim = 3151
trigger2 = animelemtime(5) = 0
trigger3 = anim = 3152
trigger3 = animelemtime(9) = 0
value = 1,7
volumescale = 100
channel = 1

[State 3150, Sound Shoryuout MAX]
type = PlaySnd
trigger1 = anim = 3152
trigger1 = animelemtime(9) = 0
value = 1,9
volumescale = 100
channel = 7

[State 3150, Sound Shoryuken]
type = PlaySnd
trigger1 = anim = 3150
trigger1 = animelemtime(10) = 0
trigger2 = anim = 3151
trigger2 = animelemtime(5) = 0
trigger3 = anim = 3152
trigger3 = animelemtime(9) = 0
value = 1,8
volumescale = 60
channel = 2

[State 3150, Voice last]
type = PlaySnd
trigger1 = anim = 3156
trigger1 = animelemtime(1) = 1
value = 14,13
volumescale = 100
channel = 0

[State 3150, Dust 1]
type = Explod
trigger1 = anim = 3150
trigger1 = animelemtime(12) = 0
trigger2 = anim = 3151
trigger2 = animelemtime(7) = 0
trigger3 = anim = 3152
trigger3 = animelemtime(11) = 0
trigger4 = anim = 3155
trigger4 = animelemtime(1) = 0
anim = 3158
ID = 3158
space = stage
facing = facing
sprpriority = 2
bindID = ID
bindtime = 1
removetime = -2
ownpal = 1
trans = addalpha
alpha = 256,256
supermovetime = 256
pausemovetime = 256
scale = 1 * Const(Size.xscale),  1 * Const(Size.yscale)

[State 3150, Dust 2]
type = Explod
trigger1 = anim = 3150
trigger1 = animelemtime(12) = 0
trigger2 = anim = 3151
trigger2 = animelemtime(7) = 0
trigger3 = anim = 3152
trigger3 = animelemtime(11) = 0
trigger4 = anim = 3155
trigger4 = animelemtime(1) = 0
anim = 7106
ID = 7106
space = stage
facing = facing
sprpriority = 2
bindID = ID
bindtime = 1
removetime = -2
ownpal = 1
trans = addalpha
alpha = 256,256
supermovetime = 256
pausemovetime = 256
scale = IFElse(Anim = 3150,0.4,IFElse(Anim = 3151,0.6,1)) * Const(Size.xscale),IFElse(Anim = 3150,0.4,IFElse(Anim = 3151,0.6,1))  * Const(Size.yscale)

[State 3150, BG Speed Line]
type = Explod
trigger1 = !NumExplod(8490)
trigger1 = Anim = 3156
anim = 8490
ID = 8490
sprpriority = -5
space = Screen
facing = facing
pos = Screenwidth / 2, ScreenHeight / 2
bindtime = -1
removetime = 160
supermovetime = 0
pausemovetime = 0
scale = 0.6, 0.6
angle = -90
yangle = 0
ownpal = 1
trans = add

[State 3150, BG Speed Line 438-462]
type = ModifyExplod
trigger1 = NumExplod(8490)
trigger1 = time = [438,462]
ID = 8490
scale = 0.6 + 0.05*(time-438), 0.6 + 0.05*(time-438)
trans = addalpha
alpha = 256-10*(time-438),256

[State 3150, Remove BG Speed Line]
type = RemoveExplod
trigger1 = NumExplod(8490)
trigger1 = time > 462
ID = 8490

;--------- Anime Changes ----------
[State 3150, Anim Trans to next]
type = ChangeAnim
trigger1 = (anim = [3150,3152])
trigger1 = StateType = A
trigger1 = vel y > 0 && pos y >= 0
value = Anim + 1

[State 3150, MaxHit]
type = ChangeAnim
trigger1 = NumTarget(3155)
trigger1 = Anim = 3152
trigger1 = AnimElemtime(10) = 2 && MoveHit < 3
value = 3155

[State 3150, Dive attack]
type = ChangeAnim
trigger1 = NumTarget(3155)
trigger1 = Anim = 3155
trigger1 = animtime = 0
value = 3156

;--------- Aura -------------------
[State 7151, Aura]
type = Explod
trigger1 = !NumExplod(4230)
trigger1 = anim = 3156
trigger1 = animelemtime(2) = 0
anim = 4230
ID = 4230
space = Stage
pos = 0,0
facing = facing
bindID = ID
sprpriority = 3
bindtime = -1
removetime = -2
supermovetime = 65535
pausemovetime = 65535
scale = fvar(6), fvar(6)
ownpal = 1
trans = add

[State 7151, Aura scale]
type = ModifyExplod
trigger1 = NumExplod(4230)
ID = 4230
scale = fvar(6), fvar(6)
trans = addalpha
alpha = 128,256


;--------- Zoom out ---------------
[State 3150, SprPriority]
type = SprPriority
trigger1 = anim = 3156
trigger1 = animelemtime(7) < 0
value = -1

[State 3150, zoom out final 0.5]
type = AngleDraw
trigger1 = (Anim = 3155 && animelemtime(13) >= 0) || anim = 3156
trigger1 = (time = [309,349])
trigger1 = fvar(6) := 1 - 0.0125*(time-309)
scale = 1 - 0.0125*(time-309), 1 - 0.0125*(time-309)

[State 3150, pos_compensate]
type = posadd
trigger1 = (Anim = 3155 && animelemtime(13) >= 0) || anim = 3156
trigger1 = (time = [309,349])
y = -4

[State 3150, Palfx]
type = Palfx
trigger1 = (Anim = 3155 && animelemtime(13) >= 0) || anim = 3156
trigger1 = (time = [316,349])
time = 1
mul = 256-5*(time-316),256-5*(time-316),256-5*(time-316)

[State 3150, Palfx keep]
type = Palfx
trigger1 = (Anim = 3155 && animelemtime(13) >= 0) || anim = 3156
trigger1 = (time = [350,395])
time = 1
mul = 90,90,90

[State 3150, Palfx going back]
type = Palfx
trigger1 = (Anim = 3155 && animelemtime(13) >= 0) || anim = 3156
trigger1 = (time = [396,426])
time = 1
mul = 90 + 5*(time - 396),90 + 5*(time - 396),90 + 5*(time - 396)

[State 3150, zoom fix]
type = AngleDraw
trigger1 = anim = 3156
trigger1 = (time = [350,394])
trigger1 = fvar(6) := 0.5
scale = 0.5,0.5

;---------- Zoom in ----------------
[State 3150, zoom out final 1.5]
type = AngleDraw
trigger1 = var(10) = 15
trigger1 = (Anim = 3156 && animelemtime(7) >= 0)
trigger1 = (time = [395,428])
trigger1 = fvar(6) := 0.5 + 0.028*(time-395)
scale = 0.5 + 0.028*(time-395), 0.5 + 0.028*(time-395)


[State 3150, pos_compensate]
type = veladd
trigger1 = var(10) = 15
trigger1 = (Anim = 3156 && animelemtime(7) >= 0)
trigger1 = (time = [395,428])
y = 0.04 + 0.01*(time-395)



;--------- Pos and vel fix --------
[State 3150, velfix]
type = velset
trigger1 = (anim = [3150,3153])
trigger1 = animelemtime(1)=0
trigger1 = vel y != 0
y = 0

[State 3150, pos fix]
type = posset
trigger1 = (anim = [3150,3153])
trigger1 = animelemtime(1)=0
trigger1 = pos y != 0
y = 0

[State 3150, velfix for lasthit]
type = velset
trigger1 = var(10) = 16 && (vel y || vel x)
trigger1 = anim = 3156 && animelemtime(8)>=0
x = 0
y = 0

[State 3150, pos fix for lasthit]
type = posset
trigger1 = var(10) = 16 && pos y
trigger1 = anim = 3156 && animelemtime(8)>=0
y = 0

[State 3150, StateType land]
type = StateTypeSet
triggerall = StateType = A
trigger1 = (anim = [3150,3153])
trigger1 = animelemtime(1) = 0
type = S
physics = S

[State 3150, StateType lasthit]
type = StateTypeSet
triggerall = StateType != C && var(10) = 16
trigger1 = anim = 3156 && animelemtime(8)>=0
type = C
physics = C

------ Shoryuken vel ----------
[State 3150, 1st accel x]
type = veladd
trigger1 = anim = 3150
trigger1 = animelemtime(10) = 0
x = 6 * Const(Size.xscale)

[State 3150, 1st accel y]
type = veladd
trigger1 = anim = 3150
trigger1 = animelemtime(12) = 0
y = -6 * Const(Size.yscale)

[State 3150, 2nd accel xy]
type = veladd
trigger1 = anim = 3151
trigger1 = animelemtime(7) = 0
x = 5 * Const(Size.xscale)
y = -7 * Const(Size.yscale)

[State 3150, 3rd accel xy]
type = veladd
trigger1 = anim = 3152
trigger1 = animelemtime(11) = 0
trigger2 = anim = 3155
trigger2 = animelemtime(1) = 0
x = 8 * Const(Size.xscale)
y = -9 * Const(Size.yscale)

[State 3150, StateType Change to air1]
type = StateTypeSet
triggerall = StateType != A && vel y
trigger1 = anim = 3150
trigger1 = animelemtime(12) = 0
trigger2 = anim = 3151
trigger2 = animelemtime(7) = 0
trigger3 = anim = 3152
trigger3 = animelemtime(11) = 0
trigger4 = anim = 3155
trigger4 = animelemtime(1) = 0
statetype = A
physics = N

;--------- Frictions -----------

[State 3150, Air Friction 1]
type = velmul
trigger1 = anim = 3150
trigger1 = StateType = A && pos y < 0
x = 0.92

[State 3150, Air Friction 2]
type = velmul
trigger1 = (anim = [3151,3152])
trigger1 = StateType = A && pos y < 0
x = 0.99

[State 3150, Gravity]
type = Gravity
triggerall = anim != 3155 && anim != 3156
trigger1 = StateType = A
trigger1 = pos y < 0

-------- Hit Def --------
[State 3150, 1st low hit]
type = hitdef
trigger1 = anim = 3150 && animelem = 11
attr = S, HA 
damage = 30, 8
animtype = Up
fall.animtype = Up
guardflag = M
hitflag = MAF
priority = 7, Hit
pausetime = 14, 14
guard.pausetime = 14,14
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -64
hitsound = s2, 3 
guardsound = s2, 0
ground.type = Low
ground.slidetime = 26
ground.hittime = 26
guard.hittime = 26
ground.velocity = -1.6 * Const(Size.xscale), -12 * Const(Size.yscale)
guard.velocity = -8 * Const(Size.xscale)
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -1.6 * Const(Size.xscale), -12 * Const(Size.yscale)
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 9
fall = 1
fall.recover = 0
forcestand = 1
yaccel = 0.5
ID = 3150

[State 3150, mid other hits]
type = hitdef
triggerall = var(10) <= 7
trigger1 = anim = 3150 && animelemtime(12) >= 0 && animelemtime(13) < 0 && MoveContact > 5
trigger2 = anim = 3151 && animelem = 6
trigger3 = anim = 3151 && MoveContact > 4 && (animelemtime(7) >= 0 && animelemtime(8) < 0)
attr = S, HA 
damage = IFElse(Anim = 3151 && animelemtime(7) >= 0,15,30),8
animtype = Up
fall.animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
guard.pausetime = 6,6
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -110 + 40 * (anim = 3151 && animelem = 6)
hitsound = s2, 3 
guardsound = s2, 0
ground.type = Low
ground.slidetime = 60
ground.hittime = 60
guard.hittime = 60
ground.velocity = -((IFElse(Anim=3151,60,70)-P2Dist x)/IFElse(Anim=3151,28,22)), (-9.1 - (4*(anim = 3151 && animelem = 6 && P2StateType != A))) * Const(Size.yscale)
guard.velocity = -8 * Const(Size.xscale)
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -((IFElse(Anim=3151,60,70)-P2Dist x)/IFElse(Anim=3151,28,22)), (-9.1 - (4*(anim = 3151 && animelem = 6 && P2StateType != A))) * Const(Size.yscale)
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 9
fall = 1
fall.recover = 0
forcestand = 1
yaccel = 0.5
ID = IFElse(NumTarget(3150),3150,3151)

[State 3150, last other hits]
type = hitdef
triggerall = (!NumTarget(3155) || Enemynear,Alive = 0) && var(10) <= 7
trigger1 = anim = 3152 && animelem = 10
trigger2 = anim = 3152 && animelem = 11
trigger3 = anim = 3152 && MoveContact > 3 && (animelemtime(11) >= 0 && animelemtime(12) < 0)
attr = S, HA
damage = IFElse((Anim = 3152 && animelem = 10),75,35),12
animtype = Up
fall.animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
guard.pausetime = 6, 6
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -110 + 40 * (anim = 3152 && animelem = 10)
hitsound = s2, 3 
guardsound = s2, 0
ground.type = Low
ground.slidetime = 50
ground.hittime = 50
guard.hittime = 50
ground.velocity = -1 * Const(Size.xscale), -11 * Const(Size.yscale)
guard.velocity = -8 * Const(Size.xscale)
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -1 * Const(Size.xscale), -11 * Const(Size.yscale)
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 9
fall = 1
fall.recover = 0
forcestand = 1
yaccel = 0.5
ID = 3151

[State 3150, Max hits 1st]
type = hitdef
triggerall = Enemynear,Alive
triggerall = NumTarget(3150) && MoveHit && var(10) <= 7
trigger1 = anim = 3152 && animelem = 10
attr = S, HA
damage = 15, 8
animtype = Up
fall.animtype = Up
guardflag = M
hitflag = MAF
priority = 7, Hit
pausetime = 26, 26
guard.pausetime = 26, 26
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -110 + 40 * (anim = 3152 && animelem = 10)
hitsound = s2, 3 
guardsound = s2, 0
ground.type = Low
ground.slidetime = 50
ground.hittime = 50
guard.hittime = 50
ground.velocity = -1 * Const(Size.xscale), -13 * Const(Size.yscale)
guard.velocity = -8 * Const(Size.xscale)
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -1 * Const(Size.xscale), -13 * Const(Size.yscale)
getpower = 0
givepower = 36, 36
envshake.time = 20
envshake.freq = 90
envshake.ampl = 12
kill = 0
fall = 1
fall.recover = 0
Fall.Envshake.Ampl = ID
forcestand = 1
yaccel = 0.5
ID = 3155

[State 3150, Max hits others 4]
type = hitdef
triggerall = NumTarget(3155) && var(10) <= 7
trigger1 = anim = 3155 && animelemtime(1) = 1
trigger2 = anim = 3155 && animelemtime(1) = 6
trigger3 = anim = 3155 && animelemtime(1) = 9
trigger4 = anim = 3155 && animelemtime(1) = 17
attr = S, HA
damage = 8, 4
animtype = Up
fall.animtype = Up
guardflag = M
hitflag = MAF
priority = 7, Hit
pausetime = 0, 0
guard.pausetime = 26, 26
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -110 + 40 * (anim = 3152 && animelem = 10)
hitsound = s2, 3 
guardsound = s2, 0
ground.type = Low
ground.slidetime = 300
ground.hittime = 300
guard.hittime = 300
ground.velocity = -1 * Const(Size.xscale), -3 * Const(Size.yscale)
guard.velocity = -8 * Const(Size.xscale)
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -1 * Const(Size.xscale), -3 * Const(Size.yscale)
getpower = 0
givepower = 36, 36
kill = 0
fall = 1
fall.recover = 0
Fall.Envshake.Ampl = ID
forcestand = 1
yaccel = 0.05
ID = 3155

[State 3150, shockwave hit]
type = hitdef
trigger1 = anim = 3156 && animelem = 8
attr = C, HP 
damage = 100, 8
animtype = Diagup
guardflag = 
hitflag = MAFD
priority = 7, Hit
pausetime = 0, 40
guard.pausetime = 22,22
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -64
hitsound = s2, 3 
guardsound = s2, 0
ground.type = Low
ground.slidetime = 26
ground.hittime = 26
guard.hittime = 26
ground.velocity = -9 * Const(Size.xscale), -12 * Const(Size.yscale)
guard.velocity = -8 * Const(Size.xscale)
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -9 * Const(Size.xscale), -12 * Const(Size.yscale)
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
forcestand = 1
yaccel = 0.5
ID = 3156

[State 3150, TargetState]
type = TargetState
triggerall = NumTarget(3155) && MoveHit
triggerall = (anim = 3152 && animelemtime(10) >= 0) || Anim = 3155
trigger1 = (Target(3155),StateNo = [5000,5020])
value = 1113150
ignorehitpause = 1

[State 3150, Targetvelcorrect]
type = TargetVelSet
triggerall = NumTarget(3156) && MoveHit
trigger1 = (Target(3156),StateNo = [5000,5030])
trigger1 = (Target(3156),vel x) != 0
ID = 3156
x = IFElse((Target(3156),pos x - pos x) < 0,-1,1) * 9 * Target(3156),facing
persistent = 0

[State 3150, Sound MaxCharge]
type = PlaySnd
trigger1 = NumTarget(3155)
trigger1 = anim = 3152 && (animelemtime(10) >= 0 && animelemtime(11) < 0)
trigger1 = (Target(3155),StateNo = 1113150) || (Target(3155),StateNo = [5000,5099])
value = 5,19
volumescale = 100
;channel = 5
abspan = 0
ignorehitpause = 1
persistent = 0

[State 3150, Sound Last hit]
type = PlaySnd
trigger1 = NumTarget(3155)
trigger1 = anim = 3156 && animelemtime(8) = 0
trigger1 = (Target(3155),StateNo = 1113150) || (Target(3155),StateNo = [5000,5099])
value = 5,20
volumescale = 100
;channel = 6
ignorehitpause = 1
persistent = 0

;---------- Hit the Target IN Custom States ------------
[State 3150, 1st Hit in Custom State]
type = TargetLifeAdd
triggerall = NumTarget(3155)
trigger1 = Target(3155), StateNo = 1113150
trigger1 = anim = 3156 && animelemtime(7) = 38
value = -15
ID = 3155
kill = 0
absolute = 1

[State 3150, 2nd Hit in Custom State]
type = TargetLifeAdd
triggerall = NumTarget(3155)
trigger1 = Target(3155), StateNo = 1113150
trigger1 = anim = 3156 && animelemtime(8) = 1
value = -105
ID = 3155
kill = 0
absolute = 1

[State 3150, 3rd Hit in Custom State]
type = TargetLifeAdd
triggerall = NumTarget(3155)
trigger1 = Target(3155), StateNo = 1113150
trigger1 = anim = 3156 && animelemtime(8) = 20
value = -306
ID = 3155
kill = 1
absolute = 1

[State 3150, Hit Counter Add]
type = HitAdd
triggerall = NumTarget(3155)
triggerall = Target(3155), StateNo = 1113150
trigger1 = anim = 3156 && animelemtime(7) = 38
trigger2 = anim = 3156 && animelemtime(8) = 1
trigger3 = anim = 3156 && animelemtime(8) = 20
value = 1


;--------- <MaxHit Charge Helper> ----------------
[State 3150, No Screen bind]
type = ScreenBound
trigger1 = NumTarget(3155) && !NumHelper(7150)
trigger1 = Anim = 3152 && animelemtime(10)>=0 && animelemtime(11)<=0
trigger1 = (Target(3155),StateNo = [5000,5020]) || Target(3155),StateNo = 1113150
trigger2 = NumHelper(7150)
value = 0
movecamera = 0,0
ignorehitpause = 1

[State 3150, MaxCcharge Camera Controller]
type = helper
triggerall = NumTarget(3155) && !NumHelper(7150)
trigger1 = Anim = 3152 && animelemtime(10)>=0 && animelemtime(11)<=0
trigger1 = (Target(3155),StateNo = [5000,5020]) || Target(3155),StateNo = 1113150
helpertype = normal
stateno = 7150
ID = 7150
name = "MESSATSU Charge Camera"
postype = P1
pos = Ceil(-11 * Const(size.xscale)), Ceil(-142 * Const(size.yscale))
size.xScale = Const(Size.xScale)
size.yScale = Const(Size.yScale)
size.proj.doscale = ID; Give Parent ID to Child
ownpal = 1
supermovetime = 65535
pausemovetime = 65535
ignorehitpause = 1

[State 3150, MaxCcharge Helper]
type = helper
triggerall = NumTarget(3155) && !NumHelper(7151)
trigger1 = Anim = 3155 && animelemtime(12) >= 0
trigger1 = (Target(3155),StateNo = [5000,5020]) || Target(3155),StateNo = 1113150
helpertype = normal
stateno = 7151
ID = 7151
name = "MESSATSU Charge Helper"
postype = P1
pos = Ceil(-11 * Const(size.xscale)), Ceil(-142 * Const(size.yscale))
size.xScale = Const(Size.xScale)
size.yScale = Const(Size.yScale)
size.proj.doscale = ID; Give Parent ID to Child
ownpal = 1
supermovetime = 65535
pausemovetime = 65535
ignorehitpause = 1

[State 3150, Dive Attack Helper]
type = helper
triggerall = NumTarget(3155) && !NumHelper(7155)
trigger1 = Anim = 3156 && animelemtime(8) = 0
trigger1 = (Target(3155),StateNo = [5000,5020]) || Target(3155),StateNo = 1113150
helpertype = normal
stateno = 7155
ID = 7155
name = "MESSATSU Dive Attacker"
postype = P1
pos = Ceil(3 * Const(size.xscale)), Ceil(-2 * Const(size.yscale))
size.xScale = Const(Size.xScale)
size.yScale = Const(Size.yScale)
size.proj.doscale = ID; Give Parent ID to Child
ownpal = 1
supermovetime = 65535
pausemovetime = 65535
ignorehitpause = 1

;--------- Target vel compensate -------------
[State 3150, target vel]
type = Targetveladd
trigger1 = NumTarget(3150) && Anim = 3152
trigger1 = (Target(3150),StateNo = [5000,5070])
trigger1 = Target(3150),pos y > -70 && Target(3150),vel y > 11
y = -4.2
persistent = 0

[State Idel]
type = StateTypeSet
triggerall = MoveType != I
trigger1 = anim = 3152 && animelemtime(13) > 0
trigger2 = anim = 3153 
trigger3 = anim = 3156 && animelemtime(11) > 0
movetype = I

[State C]
type = StateTypeSet
triggerall = StateType != C
trigger1 = anim = 3153 && animelemtime(3) > 0
trigger2 = anim = 3156 && animelemtime(9) > 0
StateType = C

[State 3150, End]
type = ChangeState
trigger1 = anim = 3153
trigger1 = !animtime
trigger2 = anim = 3156
trigger2 = !animtime
value = 0
ctrl = 1


;======================< METSU SHORYUU KEN 滅・昇龍拳 >=============================
[Statedef 3160]
type = S
physics = S
movetype = A
anim = 3160
ctrl = 0
velset = 0, 0
poweradd = -2000
juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
facep2 = 1
sprpriority = 1

[State 3160, Strength]
type = varset
trigger1 = var(10) != 6
var(10) = 6

[State 3160, width]
type = width
trigger1 = anim = 3160 && animelemtime(4) >= 0 && animelemtime(9) < 0
player = 25, 0

[State 3160, Snd]
type = playsnd
trigger1 = anim = 3160 && animelem = 4
value = 3 + (var(1) = 2) * 11, 5 + (var(1) = 2)
channel = 0
volume = 200

[State 3160, Zoom Helper]
type = helper
trigger1 = !NumHelper(7660) && !var(34) && !var(33) && Abs(P2Dist y) < 140
trigger1 = anim = 3160 && animelem = 2
stateno = 7660
ID = 7660
name = "ZoomHelper"
facing = 1
postype = P1
supermovetime = 65535
pausemovetime = 65535
size.xScale = Const(Size.xScale)
size.yScale = Const(Size.yScale)
size.proj.doscale = ID; Give Parent ID to Child
persistent = 0


[State 3160, Super Pause FX]
type = helper
trigger1 = anim = 3160 && animelem = 4
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = 3, -66
ownpal = 1
persistent = 0
supermovetime = 9999

[State 3160, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3160, Super Pause]
type = superpause
trigger1 = anim = 3160 && animelem = 4
time = 53
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = anim = 3160 && animelem = 4
fvar(5) = 0

[State 3160, NHB]
type = nothitby
trigger1 = anim = 3160 && animelemtime(7) < 1
trigger2 = movehit && (anim = 3160 || (anim = 3160 && animelemtime(12) < 0))
trigger3 = anim = 3161
trigger3 = animelemtime(6) >= 0 && animelemtime(13) < 3
time = 1
value = SCA

[State 3160, Vel]
type = velset
trigger1 = anim = 3160 && animelemtime(5) >= 0 && animelemtime(7) < 0
x = 12
[State 3160, Snd]
type = playsnd
trigger1 = anim = 3160 && animelem = 5
value = 5, 12
[State 3160, Dust]
type = explod
trigger1 = anim = 3160 && animelemtime(5) >= 0 && vel x > 0.5 && !(time % 2)
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = 45, 0
vel = -2, 0
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3160, Snd]
type = playsnd
trigger1 = anim = 3160 && animelem = 6
value = 3 + (var(1) = 2) * 10, 2 + (var(1) = 2) * 2
channel = 0

[State 3160, elbowhit]
type = hitdef
trigger1 = anim = 3160 && animelem = 7
attr = S, HA 
damage = 140, 18
animtype = Hard 
fall.animtype = Hard 
guardflag = M 
hitflag = MAF
priority = 4, Hit
pausetime = 0, 12
guard.pausetime = 12, 12
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -64
hitsound = s2, 3 
guardsound = s2, 0
p2facing = 1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
guard.hittime = 16
p2facing = 1
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = 0, 0
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 9
forcestand = 1
yaccel = 0.5
ID = 3160
forcestand = 1

[State 3160, P2state]
type = targetstate
trigger1 = anim = 3160 && animelemtime(7) >= 0 && animelemtime(8) < 0
trigger1 = movehit = 1 && numtarget(3160)
value = 3162
ID = 3160
ignorehitpause = 1

[State 3160, switch]
type = changeanim
trigger1 = anim = 3160 && animelemtime(8) >= 0 && animelemtime(9) < 0 && movehit
value = 3161
ignorehitpause = 0
persistent = 0


[State 3160, Zoom Helper]
type = helper
triggerall = !NumHelper(7664) && !var(34) && !var(33)
triggerall = NumTarget(3160)
triggerall = Target(3160),StateNo = 3162
trigger1 = anim = 3160 && animelemtime(7)>=0
stateno = 7664
ID = 7664
name = "ZoomHelper"
facing = 1
postype = P1
pos = 0,0
facing = 1
supermovetime = 999
pausemovetime = 999
size.xScale = Const(Size.xScale)
size.yScale = Const(Size.yScale)
size.proj.doscale = Target(3160),ID; Give Parent ID to Child
ownpal = 1
persistent = 0
ignorehitpause = 1

[State 3160, Vel]
type = velset
trigger1 = anim = 3161 && animelemtime(4) >= 0 && animelemtime(9) < 0 && p2bodydist x > 5
x = 3
[State 3160, Vel]
type = velset
trigger1 = anim = 3161 && animelem = 13
x = 18
y = -11
[State 3160, Vel]
type = velmul
trigger1 = 1
x = 0.88
[State 3160, Vel]
type = velmul
trigger1 = vel y > 0
x = 0
[State 3160, Snd]
type = playsnd
trigger1 = anim = 3161 && animelem = 13
value = 0, 41
[State 3160, Dust]
type = helper
trigger1 = anim = 3161 && animelem = 13
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 3160, statetype]
type = statetypeset
trigger1 = anim = 3161 && animelemtime(13) >= 0
trigger2 = anim = 1101
statetype = A
physics = A
[State 3160, Anim]
type = changeanim
trigger1 = anim = 3161 && animelemtime(13) > 0 && vel y > -4
value = 1101
persistent = 0

[State 3160, Snd]
type = playsnd
trigger1 = anim = 3161 && animelem = 12
value = 4 + (var(1) = 2) * 10, 6 -(var(1) = 2) * 5
channel = 0
[State 3160, Dust]
type = helper
trigger1 = anim = 3161 && animelem = 12
helpertype = normal
stateno = 3125
ID = 3125
name = "B&W Dust"
postype = p1
pos = 0, 0
ownpal = 1
ignorehitpause = 1
persistent = 0
size.xscale = 2
size.yscale = 2
[State 3160, fire]
type = helper
trigger1 = anim = 3161 && animelem = 13 && !numhelper(3165)
helpertype = normal
stateno = 3165
ID = 3165
name = "Metsu Shoryuu Fire"
postype = p1
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 3160, Snd]
type = playsnd
trigger1 = anim = 3161 && animelem = 9
value = 5, 13
[State 3160, Snd]
type = playsnd
trigger1 = anim = 3161 && animelem = 13
value = 5, 18

[State 3160, focus]
type = explod
trigger1 = anim = 3161 && animelem = 9
anim = 3167
sprpriority = 3
postype = p1
pos = 12, -25
removeongethit = 1

[State 3160, BG PalFX]
type = bgpalfx
trigger1 = anim = 3161 && animelem = 9
sinadd = 25, -150, -150, 32
time = 16

[State 3160, lowhit]
type = hitdef
trigger1 = animelem = 12 && anim = 3161
attr = S, HA
damage = 36, 4
animtype = Back 
guardflag = M 
hitflag = MAF
priority = 4, Hit
pausetime = 24, 24
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -75
hitsound = s2, 3 
guardsound = s2, 0
p2facing = 1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
p2facing = 1
ground.velocity = 0.5, -7.5
air.type = Low
air.velocity = 0.5, -7.5
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 24
envshake.freq = 120
envshake.ampl = 9
fall = 1
fall.recover = 0
fall.animtype = Medium
yaccel = 0.5
forcestand = 1
ID = 3160

[State 3160, shoryuuhit]
type = hitdef
trigger1 = anim = 3161 && !(animelemtime(13) % 3)
attr = A, HA 
damage = 24, 4
animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 4
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -106
hitsound = s2, 3
guardsound = s2, 0
p2facing = 1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = 1
ground.velocity = -3, -12
air.type = Low
air.velocity = -3, -12
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
fall.damage = 10
yaccel = 0.5
forcestand = 1
ID = 3160

[State 3160, Sparks]
type = helper
triggerall = movehit = 1 && numtarget
triggerall = (target, movetype = H) && !(target, time)
trigger1 = anim = 3160 && animelemtime(7) >= 0 && animelemtime(8) < 0
trigger2 = anim = 3161 && animelemtime(12) >= 0 && animelemtime(13) < 0
helpertype = normal
stateno = 7050
ID = 7050
name = "Shin Shoryuken Spark"
postype = p2
pos = (target, const(size.ground.front) -10), (ifelse(anim = 3161, -75, -64) -floor(p2dist y))
ownpal = 1
facing = -1
ignorehitpause = 1
pausemovetime = 255
supermovetime = 255

[State Idle]
type = statetypeset
trigger1 = anim = 3160 && animelemtime(8) >= 0
trigger2 = anim = 1101
movetype = I

[State 3160, End]
type = changestate
trigger1 = anim = 3160 && !animtime
value = 0
ctrl = 1


;--- --TARGET -----
[Statedef 3162]
type = S
physics = S
movetype = H
ctrl = 0
velset = 0, 0
[State 3162, Pos]
type = posset
trigger1 = 1
y = 0
[State 3162, fall]
type = hitfallset
trigger1 = 1
value = 0

[State 3162, Anim]
type = changeanim
trigger1 = 1
value = 5002
[State 3162, Shake]
type = posadd
trigger1 = 1
x = ifelse((time % 2), 1, -1)

[State 3162, End]
type = selfstate
trigger1 = time >= 90
value = 5001


;======================< REPPU JINRAI SHOU >=============================
[Statedef 3180]
type = S
physics = S
movetype = A
anim = 3180
ctrl = 0
velset = 0, 0
poweradd = -2000
sprpriority = 1
juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
facep2 = 1

[State 3180, Strength]
type = varset
trigger1 = var(10) != 6
var(10) = 6

[State 3180, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, 8
channel = 0
volume = 200

[State 3180, Zoom Helper]
type = helper
trigger1 = !NumHelper(7660) && !var(34) && !var(33) && Abs(P2Dist y) < 140
trigger1 = animelem = 2
stateno = 7660
ID = 7660
name = "ZoomHelper"
facing = 1
postype = P1
supermovetime = 65535
pausemovetime = 65535
size.xScale = Const(Size.xScale)
size.yScale = Const(Size.yScale)
size.proj.doscale = ID; Give Parent ID to Child
persistent = 0


[State 3180, Super Pause FX]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = 2, -67
ownpal = 1
persistent = 0
supermovetime = 9999

[State 3180, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3180, Super Pause]
type = superpause
trigger1 = animelem = 2
time = 53
movetime = 53
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = animelem = 2
fvar(5) = 0

[State 3180, NHB]
type = nothitby
trigger1 = animelemtime(16) < 0
time = 1
value = SCA

[State 3180, Vel]
type = velset
trigger1 = animelem = 21 || animelem = 33
x = 6
[State 3180, Vel]
type = velset
trigger1 = animelem = 38
x = 9
[State 3180, Dust]
type = explod
trigger1 = animelem = 21 || animelem = 33 || animelem = 38
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = 31, 0
vel = 1, 0
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3180, Snd]
type = playsnd
trigger1 = animelem = 15 || animelem = 18 || animelem = 27 || animelem = 30
value = 3, 6
channel = 0
[State 3180, Snd]
type = playsnd
trigger1 = animelem = 22 || animelem = 34
value = 3, 7
channel = 0
[State 3180, Snd]
type = playsnd
trigger1 = animelem = 39
value = 3, 4
channel = 0

[State 3180, Snd]
type = playsnd
trigger1 = animelem = 15 || animelem = 27
value = 1, 1
channel = 1
[State 3180, Snd]
type = playsnd
trigger1 = animelem = 18 || animelem = 30
value = 1, 2
channel = 1
[State 3180, Snd]
type = playsnd
trigger1 = animelem = 22 || animelem = 34 || animelem = 39
value = 1, 3
channel = 1

[State 3180, highhits]
type = hitdef
trigger1 = animelem = 15 || animelem = 18 || animelem = 27 || animelem = 30
attr = S, HA 
damage = 40, 5
animtype = Hard 
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 2
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -86
hitsound = s2, 2 
guardsound = s2, 0
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = ifelse(p2bodydist x > 35, 1, -2), 0
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -5, -7
getpower = 0
givepower = 36, 36
envshake.time = 8
envshake.freq = 120
envshake.ampl = 6
forcestand = 1
yaccel = 0.5
air.fall = 1
fall.recover = 0

[State 3180, lowhits]
type = hitdef
trigger1 = animelem = 22 || animelem = 34
attr = S, HA 
damage = 40, 5
animtype = Hard 
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 2
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -60
hitsound = s2, 3 
guardsound = s2, 0
ground.type = Low
ground.slidetime = 20
ground.hittime = 20
ground.velocity = ifelse(p2bodydist x > 35, 1, -3), 0
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -5, -7
getpower = 0
givepower = 36, 36
envshake.time = 8
envshake.freq = 120
envshake.ampl = 6
forcestand = 1
yaccel = 0.5
air.fall = 1
fall.recover = 0

[State 3180, uppercut]
type = hitdef
trigger1 = animelem = 39
ID = 3180
attr = S, HA 
damage = 40, 5
animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -77
hitsound = s2, 3 
guardsound = s2, 0
p2facing = 1
ground.type = Low
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -2, -13
air.type = Low
air.velocity = -2, -13
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 8
envshake.freq = 120
envshake.ampl = 6
forcestand = 1
yaccel = 0.6
forcestand = 1
fall = 1
fall.recover = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(40) >= 0
movetype = I

[State 3180, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================< SHINKUU TATSUMAKI SENPUU KYAKKU >=============================
[Statedef 3200]
type = U
physics = N
movetype = A
anim = 3200 + (50 * (StateType = A))
ctrl = 0
velset = 0, 0
poweradd = -1000
facep2 = 1
sprpriority = 1

[State 3200, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State 3200, Snd]
type = playsnd
trigger1 = (anim = 3200 || anim = 3250) && animelem = 2
value = 4 + (var(1) = 2) * 10, 3
channel = 0
volume = 200

[State 3200, Snd]
type = playsnd
trigger1 = (anim = 3200 || anim = 3250) && animelem = 2 && var(1) = 3
value = 4, 99
channel = 0
volume = 200

[State 3000, Zoom Helper]
type = helper
trigger1 = !NumHelper(7660) && !var(34) && !var(33) && Abs(P2Dist y) < 140
trigger1 = (anim = 3200 || anim = 3250) && animelem = 3
stateno = 7660
ID = 7660
name = "ZoomHelper"
facing = 1
postype = P1
supermovetime = 65535
pausemovetime = 65535
size.xScale = Const(Size.xScale)
size.yScale = Const(Size.yScale)
size.proj.doscale = ID; Give Parent ID to Child
persistent = 0


[State 3200, Super Pause FX LAND]
type = helper
trigger1 = anim = 3200 && animelem = 3
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = -27, -16
ownpal = 1
persistent = 0
supermovetime = 9999

[State 3200, Super Pause FX Air]
type = helper
trigger1 = anim = 3250 && animelem = 3
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = -8, -44
ownpal = 1
persistent = 0
supermovetime = 9999

[State 3200, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3200, Super Pause]
type = superpause
trigger1 = (anim = 3200 || anim = 3250) && animelem = 3
time = 55
movetime=55
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = (anim = 3200 || anim = 3250) && animelem = 3
fvar(5) = 0

[State 3200, NHB]
type = nothitby
trigger1 = (anim = 3200 || anim = 3250)
trigger2 = anim = 3201 || anim = 3202
trigger2 = animelemtime(2) < 1
time = 1
value = SCA


[State 3200, width]
type = width
trigger1 = (anim = [3201, 3202]) && movehit
edge = 50, 35

[State 3200, Snd]
type = playsnd
trigger1 = (anim = 3200 || anim = 3250) && animelem = 5
value = 0, 41

[State 3200, Dust]
type = helper
trigger1 = anim = 3200 && animelem = 5
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1
[State 3200, Vel]
type = velset
trigger1 = anim = 3200 && animelem = 5
y = -3.3

[State 3200, Anim]
type = changeanim
trigger1 = (anim = 3200 || anim = 3250) && !animtime
value = ifelse(var(1) = 2, 3202, 3201)

[State 3200, Snd]
type = playsnd
trigger1 = anim = [3201, 3202]
value = 4 + (var(1) = 2) * 10, 14 -(var(1) = 2) * 2
channel = 0
persistent = 0

[State 3200, Vel]
type = velset
trigger1 = anim = [3201, 3202]
;y = ifelse((var(1) = 1 && !var(34)), -.5, 0.15)
y = ifelse(var(1) = 2, -.5, 0.15)

[State 3200, Push]
type = playerpush
trigger1 = anim = 3201 || anim = 3202 || anim = 1207
value = 0
ignorehitpause = 1

[State 3200, spin]
type = playsnd
triggerall = anim = 3201 || anim = 3202
trigger1 = animelem = 1 || animelem = 7 || animelem = 13 || animelem = 19 || animelem = 25 || animelem = 31 || animelem = 37
value = 1, 5
channel = 1

[State 3200, Anim]
type = changeanim
trigger1 = (anim = [3201, 3202]) && !animtime
value = 1207
persistent = 0

[State 3200, statetype]
type = statetypeset
trigger1 = (anim = 3200 || anim = 3250) && animelemtime(5) >= 0
trigger2 = anim = 1207 && animelemtime(1) > 1
statetype = A
physics = A

[State 3200, statetype]
type = statetypeset
trigger1 = (anim = 3200 || anim = 3250) && animtime = -1
trigger2 = anim = [3201, 3202]
statetype = A
physics = N

[State 3200, Hit]
type = hitdef
trigger1 = anim = 3201 && (animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26 || animelem = 32 || animelem = 38)
attr = S, HA 
damage = 20, 3 
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 5, 0
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -70
hitsound = sifelse(hitcount, -1, 2), 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = 1
ground.velocity = ifelse((p2dist x != [ -30, 30]), 20, 15), 0
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse((p2dist x != [ -30, 30]), 6, 5), ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 45, -1, -4)
getpower = 0, 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
air.fall = 1
fall.recover = 0
sprpriority = -1
forcestand = 1
yaccel = 0.5
forcestand = 1
id = 3200

[State 3200, Hit]
type = hitdef
trigger1 = anim = 3201 && (animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29 || animelem = 35)
attr = S, HA 
damage = 20, 3 
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 5, 0
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -70
hitsound = sifelse(hitcount, -1, 2), 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = -1
ground.velocity = ifelse((p2dist x != [ -30, 30]), -20, -15), 0
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse((p2dist x != [ -30, 30]), -6, -5), ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 45, -1, -4)
getpower = 0, 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
air.fall = 1
fall.recover = 0
sprpriority = 1
forcestand = 1
yaccel = 0.5
forcestand = 1
id = 3200

[State 3200, hitfinal]
type = hitdef
trigger1 = anim = 3201 && animelem = 41
attr = S, HA 
damage = 20, 3 
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 5, 0
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -70
hitsound = sifelse(hitcount, -1, 2), 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = -1
ground.velocity = -6, -4
air.type = Low
air.velocity = -6, -4
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0, 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
sprpriority = 1
yaccel = 0.5
forcestand = 1
id = 3200

[State 3200, hitevil]
type = hitdef
trigger1 = anim = 3202 && (animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26 || animelem = 32 || animelem = 38)
attr = S, HA 
damage = 22, 3 
animtype = Hard 
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 3, 0
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -70
hitsound = sifelse(hitcount, -1, 2), 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = 1
ground.velocity = (P2Dist x + 45)/6.0, ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, 0, -3.5)
air.type = Low
air.velocity = (P2Dist x + 45)/6.0, ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, 0, -3.5)
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
sprpriority = -1
yaccel = 0.5
forcestand = 1
id = 3200

[State 3200, hitevil]
type = hitdef
trigger1 = anim = 3202 && (animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29 || animelem = 35)
attr = S, HA 
damage = 22, 3 
animtype = Hard 
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 3, 0
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -70
hitsound = sifelse(hitcount, -1, 2), 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = -1
ground.velocity = (P2Dist x - 45)/6.0, ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, 0, -3.5)
air.type = Low
air.velocity = (P2Dist x - 45)/6.0, ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, 0, -3.5)
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
sprpriority = 1
yaccel = 0.5
forcestand = 1
id = 3200

[State 3200, hitevilfinal]
type = hitdef
trigger1 = anim = 3202 && animelem = 41
attr = S, HA 
damage = 22, 3 
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 3, 0
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -70
hitsound = sifelse(hitcount, -1, 2), 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = 1
ground.velocity = -12, -4
air.type = Low
air.velocity = -12, -4
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
sprpriority = 1
yaccel = 0.5
forcestand = 1
id = 3200

[State 1100, targetstate]
type = TargetState
triggerall = Target,StateType = A
triggerall = Target,MoveType = H
trigger1 = MoveHit
value = 10060
persistent = 0
ignorehitpause = 1

[State 3200, HitSound]
type = playsnd
triggerall = movehit = 1 && hitcount > 1
trigger1 = anim = 3201 && hitpausetime = 4
trigger2 = anim = 3202 && hitpausetime = 2
value = 2, 6
channel = 2
ignorehitpause = 1

[State 3200, Dust]
type = explod
trigger1 = (anim = [3201, 3202]) && !numexplod(3210)
anim = 3210
ID = 3210
sprpriority = -3
postype = p1
pos = 0, -ceil(pos y)
removetime = -1
ownpal = 1
removeongethit = 1
scale = 0.75, 0.75

[State 3200, Dust]
type = modifyexplod
trigger1 = numexplod(3210)
ID = 3210
postype = p1
pos = 0, -ceil(pos y)
[State 3200, Dust]
type = removeexplod
trigger1 = (anim != [3201, 3202]) && numexplod(3210)
ID = 3210

[State 3200, Dust]
type = explod
trigger1 = (anim = [3201, 3202]) && (animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29 || animelem = 35 || animelem = 41)
anim = 3211
sprpriority = 2
postype = p1
pos = -10, -ceil(pos y)
vel = -3, 0
ownpal = 1

[State 3200, Dust]
type = explod
trigger1 = (anim = [3201, 3202]) && (animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26 || animelem = 32 || animelem = 38)
anim = 3211
sprpriority = 2
postype = p1
facing = -1
pos = 10, -ceil(pos y)
vel = 3, 0
ownpal = 1

[State 3200, ^__^]
type = helper
trigger1 = !time && var(1) = 3; && var(34)
helpertype = normal
stateno = 3215
ID = 3215
name = "Cloud"
postype = back
pos = ceil(pos x) + 160, -260
supermovetime = 9999
persistent = 0

[State 3200, pullhelper]
type = helper
trigger1 = (anim = [3201, 3202]) && !numhelper(3205)
helpertype = normal
stateno = 3205
ID = 3205
name = "Vaccum"
postype = P2
pos = enemynear, const(size.ground.back) -25, -ceil(enemy, pos y)
persistent = 0
size.ground.back = 5
size.ground.front = 5
size.height = 300

[State Idle]
type = statetypeset
trigger1 = anim = 1207
movetype = I


;======================< SHUN GOKU SATSU >=============================
[Statedef 4000]
type = S
physics = S
movetype = A
anim = 4000
ctrl = 0
velset = 0, 0
poweradd = ifelse(roundstate=2,-3000,0)
juggle = 15
facep2 = 1
sprpriority = 1

[State 4000, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7

[State 4000, Snd]
type = playsnd
trigger1 = !time
value = 14, 6
channel = 0
volume = 200

[State 4000, Zoom Helper]
type = helper
trigger1 = !NumHelper(7660) && !var(34) && !var(33) && Abs(P2Dist y) < 140
trigger1 = !time
stateno = 7660
ID = 7660
name = "ZoomHelper"
facing = 1
postype = P1
supermovetime = 65535
pausemovetime = 65535
size.xScale = Const(Size.xScale)
size.yScale = Const(Size.yScale)
size.proj.doscale = ID; Give Parent ID to Child
persistent = 0


[State 4000, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = -8, -94
ownpal = 1
persistent = 0
supermovetime = 9999

[State 4000, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 4000, Super Pause]
type = superpause
trigger1 = !time
time = 60
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = !time
fvar(5) = 0

[State 4000, NHB]
type = nothitby
trigger1 = time < 6
time = 1
value = SCA

[State 4000, Vel]
type = velset
trigger1 = 1
x = 5

[State 4000, Snd]
type = playsnd
trigger1 = animelemtime(1) > 1
value = 5, 4
persistent = 0

[State 4000, Miss]
type = hitdef
trigger1 = time
attr = S, HT
hitflag = 

[State 4000, Hit]
type = hitdef
trigger1 = time
attr = S, HT
hitflag = M-
priority = 6, Miss
numhits = 0
sparkno = -1
p1facing = 1
p2facing = 1
p1stateno = 4001
fall = 1 
fall.recover = 0

[State 4000, Hit]
type = hitdef
trigger1 = time
trigger1 = !EnemyNear,Alive
attr = S, HA
hitflag = MAF
priority = 6, Miss
numhits = 0
sparkno = -1
p1facing = 1
p2facing = 1
p1stateno = 4001
fall = 1 
fall.recover = 0


[State 4000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- PLAYER ---
[Statedef 4001]
type = S
physics = N
movetype = A
anim = 4001
ctrl = 0
velset = 0, 0
sprpriority = 1

[State Throw]
type = targetstate
trigger1 = !time
value = 1114002

[State 4001, Snd]
type = playsnd
trigger1 = !time
value = 5, ifelse(var(1) = 3, 17, 11)
[State 4001, grabsnd]
type = playsnd
trigger1 = !time
value = 0, 800

[State 4001, vsothers]
type = varset
trigger1 = !time
var(30) = 234

[State 4001, vsgoukiorgen]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Gouki" || target, name = "Shin Gouki" || target, name = "Akuma" || target, name = "Shin Akuma"
trigger2 = target, name = "Mech Gouki" || target, name = "Cyber Akuma" || target, name = "Gen"
trigger3 = target, name = "Pocket Shin Gouki" || target, name = "cvsgouki" || target, name = "SF3Gouki"
trigger4 = target, name = "SoulGen" || target, name = "Gouki_Cota" || target, name = "Gouki CVS 3"
var(30) = 40

[State 4001, vsevilryu]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Evil Ryu" || target, name = "ERyu"
trigger2 = target, name = "Ryu" && target, authorname = "Phantom.of.the.Server" && target, var(1) != 1
trigger3 = target, name = "CVSEvilRyu" || target, name = "Destrudo Ryu"
trigger4 = target, name = "Ryu" && target, authorname = "N64Mario" && target, palno >= 7
trigger5 = target, name = "cvsryu" && target, authorname = "Warusaki3" && target, var(12) = 10
trigger6 = target, name = "eRYU -SvsC"
var(30) = 50

[State 4001, vsothersgsusers]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "God Rugal" || target, name = "Dark Sakura"
trigger2 = target, name = "Oyaji" && target, authorname = "Mr.Chainsaw & Phantom.of.the.Server"
trigger3 = target, name = "cvsrugal" && target, authorname = "Warusaki3" && target, var(12) = 10
trigger4 = target, name = "cvsg_rugal" && target, authorname = "Warusaki3"
trigger5 = target, name = "Tin's S_Gouki" || target, name = "Blaze Agent"
var(30) = 50

[State 4001, vsCAPCOMbadguys]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Demitri" || target, name = "Jedah"
trigger2 = target, name = "Vega" && (target, authorname = "Phantom.of.the.Server" || target, authorname = "Messatsu")
trigger3 = target, name = "cvsvega" && (target, authorname = "Warusaki3" || target, authorname = "Gargoyle")
trigger4 = target, name = "M.Bison" && target, authorname = "N -Mario"
trigger5 = target, name = "[Necromancer's] M. Bison"
trigger6 = target, name = "M. Bison" && target, authorname = "VK, Updated by Terry Kuo, adapted by Tenebrous"
trigger7 = target, name = "CvSBison" && target, authorname = "Team Kai (Saiai and Koga)"
trigger8 = target, name = "Shadow DIO" || target, name = "Gill"
var(30) = 456

[State 4001, vsSNKbadguys]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Geese" || target, name = "Orochi" || target, name = "Mukai" || target, name = "Ryuji Yamazaki"
trigger2 = target, name = "Geese Howard" || target, name = "Yamazaki"
trigger3 = target, name = "cvsgeese" || target, name = "DGeese" || target, name = "ORIGINAL ZERO"
trigger4 = target, name = "cvsyamazaki" || target, name = "Orochi Rebirth" || target, name = "Tin's Mukai"
trigger5 = target, name = "geese_mmx" || target, name = "Setsuna"
var(30) = 456

[State 4001, vsrugal]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Rugal" || target, name = "Rugal Bernstein" || target, name = "Omega Rugal"
trigger2 = target, name = "Rugal94" || target, name = "Rugal94(BOSS)" || target, name = "rugal_B"
trigger3 = target, name = "Rugal_TLE" || target, name = "Omega Rugal Gb" || target, name = "Tin G_rugal"
trigger4 = target, name = "Mech Rugal" || target, name = "Tin 2002_rugal" 
trigger5 = target, name = "Rugal CvS" 
trigger6 = target, name = "cvsrugal" && target, authorname = "Warusaki3" && target, var(12) != 10
var(30) = 456

[State 4001, vsMKbadguys]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Shao Kahn" || target, name = "Shang Tsung" || target, name = "Goro"
trigger2 = target, name = "Kintaro" || target, name = "Motaro"
trigger3 = target, name = "shaokahn"
var(30) = 456

[State 4001, vsMARVELbadguys]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Dr.Doom"
trigger2 = target, name = "Dr. Doom by WhiteMagic2002"
var(30) = 456

[State 4001, vsGGbadguys]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Justice" || target, name = "Testament"
var(30) = 456

[State 4001, vsrandombadguys >= )]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Sevil Nahte" || target, name = "Perfect Weapon MB -02"
trigger2 = target, name = "Jaian"; lol = D
var(30) = 456

;NEED TO FINISH

[State 4001, Recover]
type = varadd
triggerall = animelemtime(2) > 0 && animelemtime(35) < 0
triggerall = (var(30) = [1, 99]) && numtarget
triggerall = target, life >= 0.33 * (target, lifemax)
trigger1 = (target, command = "x") || (target, command = "y") || (target, command = "z")
trigger2 = (target, command = "a") || (target, command = "b") || (target, command = "c")
trigger3 = (target, command = "up") || (target, command = "down") || (target, command = "back") || (target, command = "fwd")
var(30) = -1

[State 4001, Debug]
type = displaytoclipboard
trigger1 = var(30) < 100
text = " %d button presses to recover"
params = var(30)
[State 4001, Debug]
type = displaytoclipboard
trigger1 = var(30) = 234
text = "Normal Damage"
[State 4001, Debug]
type = displaytoclipboard
trigger1 = var(30) = 456
text = "Extra Damage"

[State 4001, Pause]
type = pause
trigger1 = animelemtime(2) >= 0 && animelemtime(17) < 0
time = 2
movetime = 2
[State 4001, Push]
type = playerpush
trigger1 = animelemtime(17) >= 0
value = 0
[State 4001, nothitby]
type = nothitby
trigger1 = animelemtime(17) < 0
value = SCA
time = 1
[State 4001, imageoff]
type = afterimagetime
trigger1 = animelemtime(5) > 0
time = 0

[State 4001, fadeout]
type = allpalfx
trigger1 = animelemtime(2) = -16
time = 16
sinadd = -255, -255, -255, 64
[State 4001, black]
type = envcolor
trigger1 = animelemtime(2) >= 0 && animelemtime(17) < 0
time = 4
value = 0, 0, 0

[State 4001, Assert]
type = assertspecial
trigger1 = animelemtime(2) >= 0 && animelemtime(17) < 0
flag = nobardisplay
flag2 = noFG
[State 4001, spr]
type = sprpriority
trigger1 = animelemtime(17) >= 0
value = 1
[State 4001, Bind]
type = targetbind
trigger1 = animelemtime(17) < 0
pos = 45, 0

[State 4001, hitadd]
type = hitadd
triggerall = var(30) > 0
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
value = 1

[State 4001, hitdamage]
type = targetlifeadd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
value = ifelse((var(30) = 456), -40, -32)
kill = animelem = 16

[State 4001, givepower]
type = targetpoweradd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
value = 36

[State 4001, HitSound]
type = playsnd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
value = 2, ifelse(!var(30), 0, ifelse((animelem = 16), 8, 3))
channel = 2

[State 4001, Sparks]
type = explod
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
anim = ifelse(!var(30), 7001, 7030 + (random % 8))
ID = 7000
sprpriority = 5
postype = p2
pos = 0, (target, const(size.mid.pos.y))
random = 60, 60
facing = -1
ownpal = 1
ontop = 1
pausemovetime = 300
supermovetime = 300

[State 4001, Shake]
type = envshake
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
time = 6
freq = 120
ampl = -4

[State 4001, Snd]
type = playsnd
trigger1 = animelemtime(16) = 10
value = 14, 7
channel = 0

[State 4001, throw]
type = targetstate
trigger1 = animelemtime(16) >= 0 && numtarget
value = 1114003
persistent = 0

[State 4001, interrupt]
type = changestate
triggerall = animelemtime(2) > 0 && animelemtime(16) < 0
trigger1 = !var(30) && numtarget
trigger2 = target, stateno = 1114010
value = 4009

[State 4001, End]
type = changestate
trigger1 = animelemtime(16) >= 0 && winko
value = 362

[State 4001, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- TARGET ---
[Statedef 1114002]
type = S
physics = N
movetype = H
velset = 0, 0
ctrl = 0
[State 1114002, Anim]
type = changeanim2
trigger1 = !time
value = 4002

[Statedef 1114003]
type = L
physics = C
movetype = H
velset = 0, 0
ctrl = 0
[State 1114003, Anim]
type = changeanim2
trigger1 = !time
value = 4003
[State 1114003, End]
type = selfstate
trigger1 = !alive
value = 5150
[State 1114003, End]
type = selfstate
trigger1 = time >= 76 && alive
value = 5120


;--- PLAYER ---
[Statedef 4009]
type = S
physics = S
movetype = H
anim = 5910
velset = -5, 0
ctrl = 0

[State 4009, target]
type = targetstate
trigger1 = !time && numtarget
value = 1114010

[State 4009, imageoff]
type = afterimagetime
trigger1 = 1
time = 0

[State 4009, Snd]
type = playsnd
trigger1 = !time
value = 5010, 5
channel = 0

[State 4009, Anim]
type = changeanim
trigger1 = anim = 5910 && time = 45
value = 5911

[State 4009, Flash]
type = palfx
trigger1 = !time
add = 30, 30, 100
sinadd = 30, 30, 100, 8
time = 8

[State 4009, Snd]
type = playsnd
trigger1 = !time
value = 7, 1

[State 4009, lightning]
type = helper
trigger1 = !time
helpertype = normal
stateno = 4012
ID = 4012
postype = p1
pos = 0, -60
ownpal = 1
persistent = 0
pausemovetime = 99
supermovetime = 99

[State 4009, End]
type = changestate
trigger1 = anim = 5911 && !animtime
value = 0
ctrl = 1


;--- PLAYER ---
[Statedef 1114010]
type = S
physics = S
movetype = H
anim = 0
velset = -5, 0
ctrl = 0
[State 1114010, Anim]
type = changeanim
trigger1 = !time && selfanimexist(150)
value = 150
[State 1114010, Anim]
type = changeanim
trigger1 = anim = 150 && selfanimexist(140) && time >= 45
value = 140
[State 1114010, Flash]
type = palfx
trigger1 = !time
add = 30, 30, 100
sinadd = 30, 30, 100, 8
time = 8
[State 1114010, End]
type = selfstate
trigger1 = anim = 140 && !animtime
trigger2 = anim = 0 && time >= 54
value = 0
ctrl = 1

;========================< HIT by Ryu Team Super >=============================
[Statedef 1113701]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 1113701, HitFall cancel]
type = HitFallSet
trigger1 = !time
value = 0
xvel = 0
yvel = 0

[State 1113701, Anim]
type = ChangeAnim2
trigger1 = !time
value = 1113700

[State 1113701, Anim]
type = ChangeAnim2
triggerall = anim = 1113700 && animelemtime(2) < 0
trigger1 = pos y >= 0
trigger2 = StateType != A
value = 1113700
elem = 2

[State 1113701, Hitvel]
type = HitVelSet
trigger1 = StateType = A
trigger1 = HitShakeOver
x = 1
y = 1
persistent = 0

[State 1113701, Gravity]
type = veladd
trigger1 = StateType = A
trigger1 = HitShakeOver
y = GetHitVar(yaccel)

[State 1113701, stop land on ground]
type = velset
triggerall = vel y != 0
trigger1 = StateType != A
trigger2 = Anim = 1113700 && animelemtime(2)>=0
y = 0

[State 1113701, Land]
type = StateTypeSet
triggerall = StateType = A
trigger1 = pos y > -10
trigger2 = Anim = 1113700 && animelemtime(2)>=0
statetype = S
physics = S
moveType = H

[State 1113701, pos-reset]
type = posset
triggerall = pos y != 0
trigger1 = StateType = S || (Anim = 1113700 && animelemtime(2)>=0)
y = 0

[State 1113701, End]
type = SelfState
trigger1 = Anim = 1113700
trigger1 = !animtime
value = 5000


;========================<SOURYUKEN 双龍拳 Target Side 2 hit by tasu>=============================
[StateDef 1113702]
type = A
physics = N
moveType = H
ctrl = 0
sprPriority = 0

[State 1113702, Give out Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0,0
ignorehitpause = 1

[State 1113702, Anim]
type = ChangeAnim
trigger1 = !time
value = 5030

[State 1113702, HitVel]
type = HitVelSet
trigger1 = HitShakeOver
x = 1
y = 1
persistent = 0

[State 1113702, Gravity]
type = Veladd
trigger1 = HitShakeOver
y = GetHitVar(yaccel)

[State 1113702, Land]
type = SelfState
trigger1 = pos y >= 0
value = 5100

[State 1113702, Debug]
type = displaytoclipboard
trigger1 = 1
text = "vel y=%d HitShakeOver %d, GetHitVar(yaccel) %d"
params = vel y, HitShakeOver, GetHitVar(yaccel)
ignorehitpause = 1


;============== <Team SOURYUKEN 双龍拳 Ryu Side >========
[StateDef 3700]
type = S
physics = N
moveType = A
anim = 3700
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3700, NotHitBy]
type = NotHitBy
trigger1 = anim = 3700
time = 1
value = SCA

[State 3700, Give out Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0,0
ignorehitpause = 1

[State 3700, NoPush]
type = PlayerPush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 3700, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3700, freejug]
type = AssertSpecial
trigger1 = 1
flag = nojugglecheck
ignorehitpause = 1

[State 3700, get var(10) target ID from ken]
type = varset
trigger1 = time < 2
trigger1 = var(10) != PlayerID(var(34)),var(10)
var(10) = PlayerID(var(34)),var(10)

[State 3700, Pre-Turn]
type = Turn
triggerall = !time
trigger1 = PlayerID(var(10)),facing != facing

;------------ Position -----
[State 3700, Pos-Reset]
type = posset
trigger1 = !time
x = Ceil(Const(Size.ground.front) + PlayerID(var(10)),Const(Size.ground.back)) * -facing
y = 0

[State 3700, Pos fix]
type = posadd
trigger1 = anim = 3704
trigger1 = animelemtime(8) = 0
x = 6

[State 3700, Pos fix]
type = posadd
trigger1 = anim = 3704
trigger1 = animelemtime(9) = 0
x = 18

[State 3700, Sync vel y with ken]
type = velset
trigger1 = anim = 3704
trigger1 = animelemtime(9) >= 0
trigger1 = partner,var(14) = [1,3]
trigger1 = vel y != Partner,vel y
y = Partner,vel y

[State 3700, Sync pos y with ken]
type = posset
trigger1 = anim = 3704
trigger1 = animelemtime(9) >= 0
trigger1 = partner,var(14) = [1,3]
trigger1 = pos y != Partner,pos y
y = Partner,pos y

[State 3700, Pos fix]
type = posset
trigger1 = anim = 3711
trigger1 = pos y != 0
x = Partner,pos x + 109 * -facing
y = 0

;------------ velocity -----
[State 3700, Tasu Jump]
type = veladd
trigger1 = anim = 3702
trigger1 = animelemtime(1) = 1
y = -5

[State 3700, Tasu UP]
type = velset
trigger1 = anim = 3702
trigger1 = animelemtime(6) >= 0 && animelemtime(28) < 0
y = -2

[State 3700, moveforward]
type = velset
trigger1 = anim = 3702
trigger1 = animelemtime(30)>0
x = 1.2

[State 3700, Tasu Land stop]
type = velset
trigger1 = anim = 3702
trigger1 = vel y > 0 && pos y >= 0
x = 0
y = 0

[State 3700, Shoryuken up]
type = velset
trigger1 = anim = 3704
trigger1 = animelemtime(9) = 0
x = 1
y = -18

[State 3700, Stay with ken 1]
type = velset
trigger1 = anim = 3704
trigger1 = animelemtime(9) > 0
trigger1 = Abs(Partner,pos x - pos x) < 45
x = 0

[State 3700, Stay with ken 2]
type = posset
trigger1 = anim = 3704
trigger1 = animelemtime(9) > 0
trigger1 = Partner,fvar(15) != 1
x = Partner,pos x + (44 * Partner,fvar(15)) * -facing

[State 3700, vel fix]
type = velset
trigger1 = anim = 3711
trigger1 = vel y != 0
x = 0
y = 0

[State 3700, POS fix land]
type = posset
trigger1 = pos y > 0 && vel y > 0
y = 0

;------------ Scale ---------
[State 3700, Scale with ken]
type = AngleDraw
trigger1 = var(34)
trigger1 = Partner,fvar(15) != 1
scale = Partner,fvar(15),Partner,fvar(15)

;------------ Anime ---------
[State 3700, ChangeAnim after hit]
type = ChangeAnim
trigger1 = anim = 3700 && NumTarget(3700)
trigger1 = animelemtime(17) >= 0 && Target(3700),pos y = 0
value = 3701

[State 3700, Tasu]
type = ChangeAnim
trigger1 = anim = 3701
trigger1 = animelemtime(26) >= 0
value = 3702

[State 3700, Shoryuken]
type = ChangeAnim
trigger1 = (NumTarget(3703) || Partner,NumTarget(3703))
trigger1 = anim = 3702 && animelemtime(30) > 0
trigger1 = pos y >= 0 && vel y >= 0
value = 3704

[State 3700, sync Shoryuken]
type = ChangeAnim
trigger1 = anim = 3704 && Partner,anim = 3704
trigger1 = AnimElemNo(0) != Partner,AnimElemNo(0)
value = 3704
elem = Partner, animelemno(0)

[State 3700, win]
type = ChangeAnim
trigger1 = anim != 3711
trigger1 = Partner,anim = 3711
value = 3711

[State 3700, Low sprpri]
type = SprPriority
trigger1 = anim = 3711
value = -3
persistent = 0

[State 3700, Shoryuken doesnt hit]
type = ChangeAnim
trigger1 = Anim = 3704 && animelemtime(9) > 10
trigger1 = !NumTarget(3704) && Partner,NumTarget(3704) = 0
value = 1101

;----------- Explods ---------------------
[State 3700, Shoryu wind]
type = Explod
trigger1 = anim = 3704
trigger1 = animelemtime(8) = 2
anim = 7106
ID = 7106
sprpriority = 3
space = stage
BindID = ID
pos = -10 * facing,0
facing = facing
bindtime = 1
removetime = -2
supermovetime = 256
pausemovetime = 256
scale = 0.75, 0.75
ownpal = 1
trans = add


;----------- State Type Changes ----------
[State 3700, Gound to Air for Tasu]
type = StateTypeSet
trigger1 = StateType != A
trigger1 = anim = 3702 && vel y < 0
StateType = A
Physics = N
MoveType = A

[State 3700, Air to GND for Tasu]
type = StateTypeSet
trigger1 = anim = 3704
trigger1 = animelemtime(1) < 2
StateType = S
Physics = S
MoveType = A

[State 3700, GND to Air for Shoryuken]
type = StateTypeSet
trigger1 = anim = 3704
trigger1 = vel y < 0
StateType = A
Physics = N
MoveType = A

[State 3700, GND to Air for Shoryuken]
type = StateTypeSet
trigger1 = anim = 3711 && StateType != S
StateType = S
Physics = S
MoveType = I

[State 3700, Gravity]
type = veladd
triggerall = StateType = A
trigger1 = anim = 3702
trigger2 = anim = 3704
trigger3 = anim = 1101
y = 0.5

;------------- Sound ---------------
[State 3700, Ooooo]
type = PlaySnd
trigger1 = anim = 3700
trigger1 = animelemtime(1) = 1
value = 3,5
channel = 0

[State 3700, CHP]
type = PlaySnd
trigger1 = anim = 3700
trigger1 = animelemtime(11)=1
value = 1,3
channel = 2

[State 3700, attacks]
type = PlaySnd
trigger1 = anim = 3701
trigger1 = animelem = 2 || animelem = 6 || animelem = 13 || animelem = 16 || animelem = 21
value = 1, 1 + (Random%3)
channel = 2

[State 3700, Tasu jump]
type = PlaySnd
trigger1 = anim = 3702
trigger1 = animelem = 1
value = 0,42
channel = 2

[State 3700, Tasu snd]
type = PlaySnd
trigger1 = anim = 3702
trigger1 = animelem = 5 || animelem = 22 || animelem = 17 || animelem = 23 || animelem = 29
value = 1,5
channel = 1

[State 3700, Tasu land]
type = PlaySnd
trigger1 = anim = 3704
trigger1 = animelem = 1
value = 0, 52
channel = 2

[State 3700, Shoryuken bgfx]
type = PlaySnd
trigger1 = anim = 3704
trigger1 = animelemtime(8) = 2
value = 5,21
channel = 3
ignorehitpause = 1

[State 3700, Shoryuken bgfx]
type = PlaySnd
trigger1 = anim = 3704
trigger1 = animelemtime(9) > 30 && time = 460
value = 5,21
channel = 3
ignorehitpause = 1

[State 3700, Shoryuken fx]
type = PlaySnd
trigger1 = anim = 3704
trigger1 = animelemtime(8) = 1
value = 1,7

[State 3700, Shoryuken fx]
type = PlaySnd
trigger1 = anim = 3704
trigger1 = animelemtime(8) = 2
value = 1,8

[State 3700, Shoryuken fx]
type = PlaySnd
trigger1 = anim = 3704
trigger1 = animelemtime(8) = 2
value = 1,9

[State 3700, Shoryuken voice]
type = PlaySnd
trigger1 = anim = 3704
trigger1 = animelemtime(9) > 0
trigger1 = Partner,var(14) = 2
trigger1 = Partner,var(12) = 60
value = 4,6
channel = 0

;------------- Hits ----------------
[State 3700, 1st Hit]
type = HitDef
triggerall = anim = 3700
trigger1 = animelemtime(13) >= 0
trigger1 = !(MoveContact || MoveReversed)
attr = S, HA
hitFlag = MAF
guardFlag = M
animtype = Up
ground.type = Low
air.type = Low
priority = 6, Hit
damage = 60, 12
pauseTime = 22,22
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = 10, -75
hitsound = s2, 11
guardsound = s2, 0
ground.slidetime = 90
ground.hittime = 90
ground.velocity = 0, -7
air.velocity = 0,-7
guard.velocity = -10.52
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
fall = 0
p2facing = 0
envshake.time = 18
envshake.freq = 100
envshake.ampl = 10
forcestand = 1
yaccel = 0.5
ID = 3700
maxdist = 80,30

[State 3700, 2-5 hits Hit]
type = HitDef
triggerall = anim = 3701
trigger1 = animelem = 3 || animelem = 7 || animelem = 14 || animelem = 17  || animelem = 23
attr = S, HA
hitFlag = MAF
guardFlag = M
animtype = Hard
ground.type = high
air.type = high
priority = 4, Hit
damage = 20, 12
pauseTime = 4 + 14*(animelem=23),4 + 14*(animelem=23)
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -15, -64
hitsound = s2, 2 + (animelem = 23)
guardsound = s2, 0
ground.slidetime = 45
ground.hittime = 45
ground.velocity = -2 + 2*(animelem=23),0 - 8*(animelem=23)
air.velocity = -2 + 2*(animelem=23),0 - 8*(animelem=23)
guard.velocity = -10.52
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
getpower = 0
givepower = 6, 6
fall = 0 + (animelem = 23)
fall.recover = 0
fall.recoverTime = 120
envshake.time = 8
envshake.freq = 120
envshake.ampl = 6
forcestand = 1
yaccel = 0.5
ID = 3701

[State 3700, Tasu Air Hits]
type = HitDef
triggerall = Anim = 3702
trigger1 = animelem = 7 || animelem = 10 || animelem = 13 || animelem = 16 || animelem = 19
trigger2 = animelem = 22 || animelem = 28
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 8,8
getPower = 0,0
givePower = 6,6
pauseTime = 2,2
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -70
hitsound = s2, 6
guardsound = s2, 0
ground.hitTime = 28
ground.slideTime = 28
guard.hitTime = 28
guard.ctrlTime = 28
air.hitTime = 120
ground.velocity = 0,-8
ground.cornerPush.velOff = 0
guard.velocity = -9
guard.cornerPush.velOff = 0
air.velocity = 0, -5
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
envShake.time = 6
envShake.ampl = 4
envShake.freq = 120
ID = 3702

[State 3700, Tasu Last Hits]
type = HitDef
triggerall = Anim = 3702
trigger1 = animelem = 25
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 10,8
getPower = 0,0
givePower = 6,6
pauseTime = 8,8
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -70
hitsound = s2, 6
guardsound = s2, 0
ground.hitTime = 28
ground.slideTime = 28
guard.hitTime = 28
guard.ctrlTime = 28
air.hitTime = 120
ground.velocity = 0,-12
ground.cornerPush.velOff = 0
guard.velocity = -9
guard.cornerPush.velOff = 0
air.velocity = 0, -9
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
envShake.time = 18
envShake.ampl = 8
envShake.freq = 120
ID = 3703

[State 3700, Shoryuken Hit]
type = HitDef
triggerall = Anim = 3704 && !NumTarget(3704)
trigger1 = animelemtime(8)>=0 && animelemtime(9) < 0
attr = C, HA
hitFlag = MAF
guardFlag = M
priority = 8, Hit
damage = 30,8
getPower = 0,0
givePower = 6,6
pauseTime = 60,62
animType = Up
ground.type = High
air.type = Low
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -70
hitsound = s2, 11
guardsound = s2, 0
ground.hitTime = 28
ground.slideTime = 28
guard.hitTime = 28
guard.ctrlTime = 28
air.hitTime = 120
ground.velocity = 0,-18
ground.cornerPush.velOff = 0
guard.velocity = -9
guard.cornerPush.velOff = 0
air.velocity = 0, -18
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
Fall.Envshake.Ampl = Partner,ID; Send Ken ID
forceStand = 1
kill = 0
envShake.time = 20
envShake.ampl = 10
envShake.freq = 90
ID = 3704


;------------- Target ----------------
[State 3700, TargetState]
type = TargetState
trigger1 = anim = 3700 && NumTarget(3700)
trigger1 = (Target(3700),StateNo = [5000,5099])
trigger1 = Target(3700),time < 2
value = 1113701
ignorehitpause = 1

[State 3700, TargetState tasu hit]
type = TargetState
trigger1 = anim = 3702 && NumTarget(3703)
trigger1 = (Target(3703),StateNo = [5000,5099])
trigger1 = Target(3703),time < 2
value = 1113702
ignorehitpause = 1

[State 3700, End to 3711 winko]
type = ChangeState
trigger1 = partner,var(14) = 2 && partner,var(12) >= 280
trigger1 = Anim = 3711 && winKO
value = 3711

[State 3700, End to 3712 NOwinko]
type = ChangeAnim
trigger1 = partner,var(14) = 2 && partner,var(12) >= 280
trigger1 = Anim = 3711 && winKO = 0
value = 3712


[State 3700, End to 52]
type = ChangeState
trigger1 = !(NumTarget(3703) || Partner,NumTarget(3703))
trigger1 = anim = 3702 && animelemtime(30) > 0
trigger1 = pos y >= 0 && vel y >= 0
trigger2 = anim = 1101
trigger2 = pos y >= 0 && vel y >= 0
value = 52

[State 3700, End]
type = ChangeState
trigger1 = anim = 3700
trigger1 = !AnimTime
trigger2 = PlayerIDExist(var(34)) = 0
trigger3 = PlayerIDExist(var(34)) = 1
trigger3 = PlayerID(var(34)), StateNo != 3700
trigger4 = anim = 3712
trigger4 = !AnimTime
value = 0
ctrl = 1




;========================<WIN BY Team SOURYUKEN 双龍拳>=============================
[Statedef 3711]
type = S
sprpriority = -3

[State 3711, Anim]
type = changeanim
trigger1 = !time && anim != 3711
value = 3711

[State 3711, win]
type = changestate
trigger1 = time >= 120 && roundstate = 3
value = ifelse(roundstate = 3, 180, 0)
ctrl = 1
