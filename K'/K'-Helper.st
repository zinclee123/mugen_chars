;==============================================================================;
;Helpers                                                                       ;
;==============================================================================;
;---------------------------[SYSTEM HELPERS]------------------------------------
;------------------[MOVEHIT TICK-WISE DETECTOR FOR HITSOUNDS]-------------------
; WE SUNK
[Statedef 247]
anim = 1

[State -2, VarSet]
type = VarAdd
trigger1 = root,movehit = 1
var(1) = 1

[State -2, VarSet]
type = VarSet
trigger1 = root,movehit = 2
trigger2 = root,hitpausetime = 0
var(1) = 0

[State -2, VarSet]
type = VarSet
trigger1 = 1;root,movecontact = 1 && var(2) = 0
var(2) = root,movecontact

[State -2, DTC]
type = DisplayToClipboard
trigger1 = NumHelper(247)
text = "MoveHit = %d MoveContact = %d"
params = Var(1), var(2)

;---------------------------[EXPLOSION SYSTEM FOR FIRE USERS]-------------------
;--------------------------------------[CRIMSON]--------------------------------
;Double Expl
[Statedef 12500]
type    = A
movetype= A
physics = N
sprpriority = 1
velset = 0
facep2 = 1
anim = 1
ctrl = 0

[State 7001, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 65000: STAY PUT >(]
type = Bindtotarget
trigger1 = (!Time)
facing = 0
pos = -10,0
time = -1

[State 12501, VarRandom]
type = VarRandom
trigger1 = 1
v = 0
range = 5

[State 12501, Explod]
type = Explod
triggerall = random <= 250
trigger1 = time = 2
anim = 12505
pos = (-4-var(0)),-35
postype = p1  ;p2,front,back,left,right
bindtime = 4
random = 50,50
sprpriority = 3
ownpal = 1
[State 12501, Explod]
type = Explod
triggerall = random <= 250
trigger1 = time = 3
anim = 12505
pos = (-40-var(0)),-120
postype = p1  ;p2,front,back,left,right
bindtime = 4
random = 50,50
sprpriority = 3
ownpal = 1
[State 12501, Explod]
type = Explod
triggerall = random <= 250
trigger1 = time = 4
anim = 12505
pos = (-17-var(0)),-98
postype = p1  ;p2,front,back,left,right
bindtime = 4
random = 50,50
sprpriority = 3
ownpal = 1
[State 12501, Explod]
type = Explod
triggerall = random <= 250
trigger1 = time = 5
anim = 12505
pos = (-25-var(0)),-48
postype = p1  ;p2,front,back,left,right
bindtime = 4
random = 50,50
sprpriority = 3
ownpal = 1
[State 12501, Explod]
type = Explod
triggerall = random <= 250
trigger1 = time = 6
anim = 12505
pos = (-45-var(0)),-114
postype = p1  ;p2,front,back,left,right
bindtime = 4
random = 50,50
sprpriority = 3
ownpal = 1
[State 12501, Explod]
type = Explod
triggerall = random <= 250
trigger1 = time = 8
anim = 12505
pos = (-15-var(0)),-110
postype = p1  ;p2,front,back,left,right
bindtime = 4
random = 50,50
sprpriority = 3
ownpal = 1

[State 1302, Destroy]
type = DestroySelf
trigger1 = time = 6

;Normal Expl
[Statedef 12501]
type    = A
movetype= A
physics = N
sprpriority = 1
velset = 0
facep2 = 1
anim = 1
ctrl = 0

[State 7001, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 65000: STAY PUT >(]
type = Bindtotarget
trigger1 = (!Time)
facing = 0
pos = -10,0
time = -1

[State 12501, VarRandom]
type = VarRandom
trigger1 = 1
v = 0
range = 5

[State 12501, Explod]
type = Explod
triggerall = random <= 250
trigger1 = time = 2
anim = 12506
pos = (-4-var(0)),-35
postype = p1  ;p2,front,back,left,right
bindtime = 4
random = 50,50
sprpriority = 3
ownpal = 1

[State 12501, Explod]
type = Explod
triggerall = random <= 250
trigger1 = time = 3
anim = 12506
pos = (-40-var(0)),-120
postype = p1  ;p2,front,back,left,right
bindtime = 4
random = 50,50
sprpriority = 3
ownpal = 1

[State 12501, Explod]
type = Explod
triggerall = random <= 250
trigger1 = time = 4
anim = 12506
pos = (-17-var(0)),-98
postype = p1  ;p2,front,back,left,right
bindtime = 4
random = 50,50
sprpriority = 3
ownpal = 1

[State 12501, Explod]
type = Explod
triggerall = random <= 250
trigger1 = time = 5
anim = 12506
pos = (-25-var(0)),-48
postype = p1  ;p2,front,back,left,right
bindtime = 4
random = 50,50
sprpriority = 3
ownpal = 1
[State 12501, Explod]
type = Explod
triggerall = random <= 250
trigger1 = time = 6
anim = 12506
pos = (-45-var(0)),-114
postype = p1  ;p2,front,back,left,right
bindtime = 4
random = 50,50
sprpriority = 3
ownpal = 1
[State 12501, Explod]
type = Explod
triggerall = random <= 250
trigger1 = time = 8
anim = 12506
pos = (-15-var(0)),-110
postype = p1  ;p2,front,back,left,right
bindtime = 4
random = 50,50
sprpriority = 3
ownpal = 1

[State 1302, Destroy]
type = DestroySelf
trigger1 = time = 20

;Pyro Expl
[Statedef 12502]
type    = A
movetype= A
physics = N
sprpriority = 1
velset = 0
facep2 = 1
anim = 1
ctrl = 0

[State 7001, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 65000: STAY PUT >(]
type = Bindtotarget
trigger1 = (!Time)
facing = 0
pos = -10,0
time = -1

[State 12501, VarRandom]
type = VarRandom
trigger1 = 1
v = 0
range = 5

[State 12501, Explod]
type = Explod
triggerall = random <= 150
trigger1 = time = 2
anim = 12507
pos = (-41-var(0)),-53
postype = p1  ;p2,front,back,left,right
bindtime = 4
random = 50,50
sprpriority = 3
ownpal = 1
[State 12501, Explod]
type = Explod
triggerall = random <= 150
trigger1 = time = 3
anim = 12507
pos = (-30-var(0)),-46
postype = p1  ;p2,front,back,left,right
bindtime = 4
random = 50,50
sprpriority = 3
ownpal = 1
[State 12501, Explod]
type = Explod
triggerall = random <= 150
trigger1 = time = 4
anim = 12507
pos = (26-var(0)),-15
postype = p1  ;p2,front,back,left,right
bindtime = 4
random = 50,50
sprpriority = 3
ownpal = 1
[State 12501, Explod]
type = Explod
triggerall = random <= 150
trigger1 = time = 5
anim = 12507
pos = (10-var(0)),-94
postype = p1  ;p2,front,back,left,right
bindtime = 4
random = 50,50
sprpriority = 3
ownpal = 1
[State 12501, Explod]
type = Explod
triggerall = random <= 150
trigger1 = time = 6
anim = 12507
pos = (-19-var(0)),-63
postype = p1  ;p2,front,back,left,right
bindtime = 4
random = 50,50
sprpriority = 3
ownpal = 1
[State 12501, Explod]
type = Explod
triggerall = random <= 150
trigger1 = time = 8
anim = 12507
pos = (1-var(0)),-59
postype = p1  ;p2,front,back,left,right
bindtime = 4
random = 50,50
sprpriority = 3
ownpal = 1

[State 1302, Destroy]
type = DestroySelf
trigger1 = time = 20

;Multi Small Expl
[Statedef 12503]
type    = A
movetype= A
physics = N
sprpriority = 1
velset = 0
facep2 = 1
anim = 1
ctrl = 0

[State 7001, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 65000: STAY PUT >(]
type = Bindtotarget
trigger1 = (!Time)
facing = 0
pos = -10,0
time = -1

[State 12501, VarRandom]
type = VarRandom
trigger1 = 1
v = 0
range = 5
[State 12501, VarRandom]
type = VarRandom
trigger1 = 1
v = 1
range = 20

[State 12501, Explod]
type = Explod
triggerall = random <= 150
trigger1 = time = 2
anim = 12508
pos = (-41-var(0)),(-53+var(1))
postype = p1  ;p2,front,back,left,right
bindtime = 4
random = 50,50
sprpriority = 3
ownpal = 1
[State 12501, Explod]
type = Explod
triggerall = random <= 150
trigger1 = time = 3
anim = 12508
pos = (-30-var(0)),(-46+var(1))
postype = p1  ;p2,front,back,left,right
bindtime = 4
random = 50,50
sprpriority = 3
ownpal = 1
[State 12501, Explod]
type = Explod
triggerall = random <= 150
trigger1 = time = 4
anim = 12508
pos = (26-var(0)),(-15-var(1))
postype = p1  ;p2,front,back,left,right
bindtime = 4
random = 50,50
sprpriority = 3
ownpal = 1
[State 12501, Explod]
type = Explod
triggerall = random <= 150
trigger1 = time = 5
anim = 12508
pos = (10-var(0)),(-94+var(1))
postype = p1  ;p2,front,back,left,right
bindtime = 4
random = 50,50
sprpriority = 3
ownpal = 1
[State 12501, Explod]
type = Explod
triggerall = random <= 150
trigger1 = time = 6
anim = 12508
pos = (-19-var(0)),(-63+var(1))
postype = p1  ;p2,front,back,left,right
bindtime = 4
random = 50,50
sprpriority = 3
ownpal = 1
[State 12501, Explod]
type = Explod
triggerall = random <= 150
trigger1 = time = 8
anim = 12508
pos = (1-var(0)),(-59+var(1))
postype = p1  ;p2,front,back,left,right
bindtime = 4
random = 50,50
sprpriority = 3
ownpal = 1

[State 1302, Destroy]
type = DestroySelf
trigger1 = time = 20

;Small Expl
[Statedef 12504]
type    = A
movetype= A
physics = N
sprpriority = 1
velset = 0
facep2 = 1
anim = 1
ctrl = 0

[State 7001, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 65000: STAY PUT >(]
type = Bindtotarget
trigger1 = (!Time)
facing = 0
pos = -10,0
time = -1

[State 12501, VarRandom]
type = VarRandom
trigger1 = 1
v = 0
range = 5
[State 12501, VarRandom]
type = VarRandom
trigger1 = 1
v = 1
range = 20

[State 12501, Explod]
type = Explod
triggerall = random <= 500
trigger1 = time = 2
trigger2 = time = 16
trigger3 = time = 40
anim = 12509
pos = (-41-var(0)),(-53+var(1))
postype = p2  ;p2,front,back,left,right
bindtime = 1
random = 50,50
sprpriority = 3
ownpal = 1
[State 12501, Explod]
type = Explod
triggerall = random <= 500
trigger1 = time = 4
trigger2 = time = 20
trigger3 = time = 44
anim = 12509
pos = (-30-var(0)),(-46+var(1))
postype = p2  ;p2,front,back,left,right
bindtime = 1
random = 50,50
sprpriority = 3
ownpal = 1
[State 12501, Explod]
type = Explod
triggerall = random <= 500
trigger1 = time = 6
trigger2 = time = 24
trigger3 = time = 48
anim = 12509
pos = (26-var(0)),(-15-var(1))
postype = p2  ;p2,front,back,left,right
bindtime = 1
random = 50,50
sprpriority = 3
ownpal = 1
[State 12501, Explod]
type = Explod
triggerall = random <= 500
trigger1 = time = 8
trigger2 = time = 28
trigger3 = time = 52
anim = 12509
pos = (10-var(0)),(-94+var(1))
postype = p2  ;p2,front,back,left,right
bindtime = 1
random = 50,50
sprpriority = 3
ownpal = 1
[State 12501, Explod]
type = Explod
triggerall = random <= 500
trigger1 = time = 10
trigger2 = time = 32
trigger3 = time = 56
anim = 12509
pos = (-19-var(0)),(-63+var(1))
postype = p2  ;p2,front,back,left,right
bindtime = 1
random = 50,50
sprpriority = 3
ownpal = 1
[State 12501, Explod]
type = Explod
triggerall = random <= 500
trigger1 = time = 12
trigger2 = time = 36
trigger3 = time = 60
anim = 12509
pos = (1-var(0)),(-59+var(1))
postype = p2  ;p2,front,back,left,right
bindtime = 1
random = 50,50
sprpriority = 3
ownpal = 1

[State 1302, Destroy]
type = DestroySelf
trigger1 = time = 62

;---------------------------[DREAMCANCEL MARQUEE]-------------------------------
[Statedef 40000]
type = S
movetype = I
physics = S
ctrl = 0
velset = 0, 0
ownpal = 1
anim = 16003
sprpriority = -1

[State 7001, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1000, Explod] ;Black
type = Explod
trigger1 = !time
anim = 16002
ID = 16002
pos = 0,75
postype = right
supermove = 1
supermovetime = 68
pausemovetime = 68
scale = .5,.5
sprpriority = 775
bindtime = 68
ignorehitpause = 1
ontop = 1
persistent = 0
trans = addalpha
alpha = 128,128

[State 1000, Explod] ;DREAMCANCEL
type = Explod
trigger1 = !time
anim = 16000
ID = 16000
pos = 0,75;160     ;118 in KOFXI ...
facing = 1
postype = right
supermove = 1
supermovetime = 68
pausemovetime = 68
scale = .5,.5
sprpriority = 776
ignorehitpause = 1
persistent = 0
bindtime = 68
ontop = 1
ownpal = 1
removeongethit = 0

[State 1000, Explod] ;Marquee
type = Explod
trigger1 = !time
anim = 16001
ID = 16001
pos = 0,75
postype = right
supermove = 1
supermovetime = 68
pausemovetime = 68
scale = .5,.5
sprpriority = 777
bindtime = 68
ontop = 1
ignorehitpause = 1
persistent = 0

[State 65000: DestroySelf]
type = DestroySelf
trigger1 = time = 68

;----------------------------[2002 UM MAX2 BG]----------------------------------
[Statedef 40001]
anim = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noBG
flag2 = noFG

[State 40001, Tile #1-7]
type = Explod
triggerall = !numexplod(15600)
trigger1 = !time
anim = 15600
ID = 15600
pos = 0,0
postype = left  ;p2,front,back,left,right
removetime = 10
pausemovetime = -1
supermovetime = -1
scale = 1,1
sprpriority = -20
ownpal = 1
ignorehitpause = 1
bindtime = -1
persistent = 0

[State 40001, Tile #1-7]
type = Explod
triggerall = !numexplod(15601) < 2
trigger1 = !time
trigger2 = (time%10) = 0
anim = 15600
ID = 15601
pos = 320,0
postype = left  ;p2,front,back,left,right
removetime = 20
pausemovetime = -1
supermovetime = -1
scale = 1,1
sprpriority = -20
ownpal = 1
ignorehitpause = 1
bindtime = -1

[State 40001, Tile #2-6]
type = Explod
triggerall = !numexplod(15610)
trigger1 = !time
anim = 15601
ID = 15610
pos = 0,0
postype = left  ;p2,front,back,left,right
removetime = 20
pausemovetime = -1
supermovetime = -1
scale = 1,1
sprpriority = -20
ownpal = 1
ignorehitpause = 1
persistent = 0
bindtime = -1

[State 40001, Tile #2-6]
type = Explod
triggerall = !numexplod(15611) < 2
trigger1 = !time
trigger2 = (time%20) = 0
anim = 15601
ID = 15611
pos = 320,0
postype = left  ;p2,front,back,left,right
removetime = 40
pausemovetime = -1
supermovetime = -1
scale = 1,1
sprpriority = -20
ownpal = 1
ignorehitpause = 1
bindtime = -1

[State 40001, Tile #3-5]
type = Explod
triggerall = !numexplod(15620)
trigger1 = !time
anim = 15602
ID = 15620
pos = 0,0
postype = left  ;p2,front,back,left,right
removetime = 40
pausemovetime = -1
supermovetime = -1
scale = 1,1
sprpriority = -20
ownpal = 1
ignorehitpause = 1
persistent = 0
bindtime = -1

[State 40001, Tile #3-5]
type = Explod
triggerall = !numexplod(15621) < 2
trigger1 = !time
trigger2 = (time%40) = 0
anim = 15602
ID = 15621
pos = 320,0
postype = left  ;p2,front,back,left,right
removetime = 80
pausemovetime = -1
supermovetime = -1
scale = 1,1
sprpriority = -20
ownpal = 1
ignorehitpause = 1
bindtime = -1

[State 40001, Tile #4]
type = Explod
triggerall = !numexplod(15630)
trigger1 = !time
anim = 15603
ID = 15630
pos = 0,0
postype = left  ;p2,front,back,left,right
removetime = 80
pausemovetime = -1
supermovetime = -1
scale = 1,1
sprpriority = -20
ownpal = 1
ignorehitpause = 1
persistent = 0
bindtime = -1

[State 40001, Tile #4]
type = Explod
triggerall = !numexplod(15631) < 2
trigger1 = !time
trigger2 = (time%80) = 0
anim = 15603
ID = 15631
pos = 320,0
postype = left  ;p2,front,back,left,right
removetime = 160
pausemovetime = -1
supermovetime = -1
scale = 1,1
sprpriority = -20
ownpal = 1
ignorehitpause = 1
bindtime = -1

[State 40001, Glass Break]
type = ChangeState
trigger1 = root, stateno = 3200 && root, animelem = 12
trigger2 = root, stateno = 3202 && root, animelem = 24
trigger3 = root, stateno = 4000 && root, animelem = 34
trigger4 = root, movetype = H
value = stateno+1

[Statedef 40002]
anim = 1

[State 40002, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 15600
[State 40002, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 15601
[State 40002, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 15610
[State 40002, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 15611
[State 40002, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 15620
[State 40002, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 15621
[State 40002, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 15630
[State 40002, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 15631

[State 40002, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S14001,0
volume = 200

[State 40001, Glass Break]
type = Explod
triggerall = !numexplod(15640)
trigger1 = !time
anim = 15604
ID = 15640
pos = 0,0
postype = left  ;p2,front,back,left,right
pausemovetime = -1
supermovetime = -1
removetime = -2
scale = 1,1
sprpriority = -20
ownpal = 1
bindtime = -1
ignorehitpause = 1

[State 40001, DestroySelf]
type = DestroySelf
trigger1 = time = 1

;--------------------------[2002 UM MAX2 PORTRAIT]------------------------------
[Statedef 40003]
anim = 1

[State 40003, VarSet]
type = VarSet
triggerall = enemy, numhelper(40003)
triggerall = !enemy, numhelper(40004)
trigger1 = enemy, authorname = "Vans"
trigger2 = enemy, authorname = "K.O.D"
trigger3 = enemy, authorname = "K.O.D & Vans"
trigger4 = enemy, authorname = "OrochiKOF97"
trigger5 = enemy, authorname = "David Demianoff"
trigger6 = enemy, authorname = "Dark Saviour"
trigger7 = enemy, authorname = "Kung Fu Man"
trigger8 = enemy, authorname = "KoopaKoot"
trigger9 = enemy, authorname = "Anjel"
trigger10 = enemy, authorname = "David Demianoff & Kung Fu Man"
var(0) = 1

[State 40003, VarSet]
type = VarSet
triggerall = teamside = 2
triggerall = enemy, numhelper(40004)
trigger1 = enemy, authorname = "Vans"
trigger2 = enemy, authorname = "K.O.D"
trigger3 = enemy, authorname = "K.O.D & Vans"
trigger4 = enemy, authorname = "OrochiKOF97"
trigger5 = enemy, authorname = "David Demianoff"
trigger6 = enemy, authorname = "Dark Saviour"
trigger7 = enemy, authorname = "Kung Fu Man"
trigger8 = enemy, authorname = "KoopaKoot"
trigger9 = enemy, authorname = "Anjel"
trigger10 = enemy, authorname = "David Demianoff & Kung Fu Man"
var(0) = 1

[State 40001, P1 BG]
type = Explod
triggerall = !numexplod(15650)
triggerall = teamside = 1
trigger1 = !time
anim = 15605
ID = 15650
pos = 0,abs((240*var(0))-81)
postype = left  ;p2,front,back,left,right
pausemovetime = -1
supermovetime = -1
removetime = -2
bindtime = -1
scale = 1,1
sprpriority = -19
ownpal = 1
ignorehitpause = 1

[State 40001, P2 BG]
type = Explod
triggerall = !numexplod(15651)
triggerall = teamside = 2
trigger1 = !time
anim = 15606
ID = 15651
pos = 0,abs((240*var(0))-81)
postype = right  ;p2,front,back,left,right
pausemovetime = -1
supermovetime = -1
removetime = -2
bindtime = -1
scale = 1,1
facing = -1
sprpriority = -19
ownpal = 1
ignorehitpause = 1

[State 40001, P1 PORTRAIT]
type = Explod
triggerall = !numexplod(15660)
triggerall = teamside = 1
trigger1 = !time
anim = 15607
ID = 15660
pos = 0,abs((240*var(0))-81)
postype = left  ;p2,front,back,left,right
pausemovetime = -1
supermovetime = -1
removetime = -2
bindtime = -1
scale = 1,1
sprpriority = -18
ownpal = 1
ignorehitpause = 1

[State 40001, P2 PORTRAIT]
type = Explod
triggerall = !numexplod(15661)
triggerall = teamside = 2
trigger1 = !time
anim = 15607
ID = 15661
pos = 0,abs((240*var(0))-81)
postype = right  ;p2,front,back,left,right
pausemovetime = -1
supermovetime = -1
removetime = -2
bindtime = -1
scale = 1,1
facing = -1
sprpriority = -18
ownpal = 1
ignorehitpause = 1

[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 2
ID = 15650
scale = 1,0.3
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 4
ID = 15650
scale = 1,0.54
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 6
ID = 15650
scale = 1,0.77
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 8
ID = 15650
scale = 1,1
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 56
ID = 15650
scale = 1,0.77
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 57
ID = 15650
scale = 1,0.54
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 58
ID = 15650
scale = 1,0.3
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 59
ID = 15650
scale = 1,1

[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 2
ID = 15651
scale = 1,0.3
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 4
ID = 15651
scale = 1,0.54
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 6
ID = 15651
scale = 1,0.77
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 8
ID = 15651
scale = 1,1
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 56
ID = 15651
scale = 1,0.77
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 57
ID = 15651
scale = 1,0.54
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 58
ID = 15651
scale = 1,0.3
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 59
ID = 15651
scale = 1,1

[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 2
ID = 15660
scale = 1,0.3
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 4
ID = 15660
scale = 1,0.54
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 6
ID = 15660
scale = 1,0.77
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 8
ID = 15660
scale = 1,1
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 56
ID = 15660
scale = 1,0.77
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 57
ID = 15660
scale = 1,0.54
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 58
ID = 15660
scale = 1,0.3
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 59
ID = 15660
scale = 1,1

[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 2
ID = 15661
scale = 1,0.3
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 4
ID = 15661
scale = 1,0.54
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 6
ID = 15661
scale = 1,0.77
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 8
ID = 15661
scale = 1,1
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 56
ID = 15661
scale = 1,0.77
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 57
ID = 15661
scale = 1,0.54
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 58
ID = 15661
scale = 1,0.3
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 59
ID = 15661
scale = 1,1

[State 40001, DestroySelf]
type = DestroySelf
trigger1 = time = 60

[Statedef 40004]
anim = 1

[State 40001, DestroySelf]
type = DestroySelf
trigger1 = time = 1

;---------------------------[KOF K.O. SYSTEM]-----------------------------------
;This is as accurate as it ll get with MUGEN s K.O. slow system.
[Statedef 50000]
ctrl = 0
anim = 1
ownpal = 1

[State 50000, VarSet]
type = VarSet
trigger1 = root, stateno = [200,991]
var(0) = 1

[State 50000, PlaySnd]
type = PlaySnd
trigger1 = IsHelper(50000) && !time
value = 3,18
volume = 255
channel = 1
ignorehitpause = 1

[State 50000, PlaySnd]
type = PlaySnd
trigger1 = IsHelper(50001) && !time
value = 3,19
volume = 255
channel = 1
ignorehitpause = 1

[State 3000, AssertSpecial]
type = AssertSpecial
triggerall = !var(0)
trigger1 = time = [0,17]
flag = noBG
flag2 = noFG
ignorehitpause = 1

[State 3501, EnvColor]
type = EnvColor
triggerall = !var(0)
trigger1 = !time
value = 0,0,0
time = 0;6
under = 1
ignorehitpause = 1

[State 3501, EnvColor]
type = EnvColor
triggerall = !var(0)
trigger1 = time = 1
value = 255,0,0
time = 1
under = 1
ignorehitpause = 1

[State 3501, EnvColor]
type = EnvColor
triggerall = !var(0)
trigger1 = time = 2
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1

[State 3501, EnvColor]
type = EnvColor
triggerall = !var(0)
trigger1 = time = 3
value = 255,0,0
time = 1
under = 1
ignorehitpause = 1

[State 3501, EnvColor]
type = EnvColor
triggerall = !var(0)
trigger1 = time = 4
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1

[State 3501, EnvColor]
type = EnvColor
triggerall = !var(0)
trigger1 = time = 5
value = 255,0,0
time = 1
under = 1
ignorehitpause = 1

[State 3501, EnvColor]
type = EnvColor
triggerall = !var(0)
trigger1 = time = 7
value = 255,255,255
time = 2
under = 1
ignorehitpause = 1

[State 3501, EnvColor]
type = EnvColor
triggerall = !var(0)
trigger1 = time = 9
value = 255,0,0
time = 2
under = 1
ignorehitpause = 1

[State 3501, EnvColor]
type = EnvColor
triggerall = !var(0)
trigger1 = time = 11
value = 255,255,255
time = 2
under = 1
ignorehitpause = 1

[State 3501, EnvColor]
type = EnvColor
triggerall = !var(0)
trigger1 = time = 13
value = 255,0,0
time = 2
under = 1
ignorehitpause = 1

[State 3501, EnvColor];Must last two ticks!
type = EnvColor
trigger1 = time = 15
value = 0,0,0
time = 1
under = 1
ignorehitpause = 1

[State 3501, EnvColor];One tick.
type = EnvColor
trigger1 = time = 16
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1

[State 3501, EnvColor];One tick.
type = EnvColor
triggerall = !var(0)
trigger1 = time = 17
value = 255,0,0
time = 1
under = 1
ignorehitpause = 1

;---------------------------[SKILLBAR SYSTEM]-----------------------------------
[Statedef 70000]
ctrl = 0
anim = 1
ownpal = 1

[State 60000, Explod]
type = Explod
trigger1 = !NumExplod(14006)
trigger1 = TeamSide = 1
anim = 14009
ID = 14006
postype = Back
pos = 23,225+(root,var(25))
ownpal = 1
bindtime = -1
scale = 0.5,0.5
ignorehitpause = 1
ontop = 1
pausemovetime = -1
supermovetime = -1

[State 60000, Explod]
type = Explod
trigger1 = !NumExplod(14006)
trigger1 = TeamSide = 2
anim = 14010
ID = 14006
postype = Back
pos = 23,225+(root,var(25))
ownpal = 1
bindtime = -1
scale = 0.5,0.5
ignorehitpause = 1
ontop = 1
pausemovetime = -1
supermovetime = -1

[State 60000, Explod]
type = Explod
triggerall = parent,fvar(5) < 1000
trigger1 = !NumExplod(14000)
trigger1 = TeamSide = 1
anim = 14000
ID = 14000
postype = Back
pos = 37,229+(root,var(25))
ownpal = 1
bindtime = -1
scale = 1,0.5
ignorehitpause = 1
ontop = 1
pausemovetime = -1
supermovetime = -1

[State 60000, Explod]
type = Explod
triggerall = parent,fvar(5) < 1000
trigger1 = !NumExplod(14000)
trigger1 = TeamSide = 2
anim = 14000
ID = 14000
postype = Back
pos = 38,229+(root,var(25))
ownpal = 1
bindtime = -1
scale = 1,0.5
ignorehitpause = 1
ontop = 1
pausemovetime = -1
supermovetime = -1

[State 60000, Explod]
type = Explod
triggerall = parent,fvar(5) > 1000
trigger1 = !NumExplod(14007)
trigger1 = TeamSide = 1
anim = 14000
ID = 14007
postype = Back
pos = 37,229+(root,var(25))
ownpal = 1
bindtime = -1
scale = 1,.5
ignorehitpause = 1
ontop = 1
pausemovetime = -1
supermovetime = -1

[State 60000, Explod]
type = Explod
triggerall = parent,fvar(5) > 1000
trigger1 = !NumExplod(14007)
trigger1 = TeamSide = 2
anim = 14000
ID = 14007
postype = Back
pos = 38,229+(root,var(25))
ownpal = 1
bindtime = -1
scale = 1,.5
ignorehitpause = 1
ontop = 1
pausemovetime = -1
supermovetime = -1

[State 60000, Explod]
type = Explod
triggerall = parent,fvar(5) > 1000
trigger1 = !NumExplod(14001)
trigger1 = TeamSide = 1
anim = 14001
ID = 14001
postype = Back
pos = 37,229+(root,var(25))
ownpal = 1
bindtime = -1
ignorehitpause = 1
ontop = 1
pausemovetime = -1
supermovetime = -1

[State 60000, Explod]
type = Explod
triggerall = parent,fvar(5) > 1000
trigger1 = !NumExplod(14001)
trigger1 = TeamSide = 2
anim = 14001
ID = 14001
postype = Back
pos = 37,229+(root,var(25))
ownpal = 1
bindtime = -1
ignorehitpause = 1
ontop = 1
pausemovetime = -1
supermovetime = -1

[State 60000, Explod];Stock Numbah One
type = Explod
trigger1 = parent,fvar(5) > 1000
trigger1 = !NumExplod(14003)
trigger1 = TeamSide = 1
anim = 14003
ID = 14003
postype = Back
pos = 31,228+(root,var(25))
ownpal = 1
bindtime = -1
ignorehitpause = 1
ontop = 1
removetime = -1
pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 60000, Explod]
type = Explod
trigger1 = parent,fvar(5) > 1000
trigger1 = !NumExplod(14003)
trigger1 = TeamSide = 2
anim = 14006
ID = 14003
postype = Back
pos = 31,228+(root,var(25))
ownpal = 1
bindtime = -1
ignorehitpause = 1
ontop = 1
removetime = -1
pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 60000, Explod];Stock Numbah One Silver
type = Explod
trigger1 = parent,fvar(5) > 1999
trigger1 = !NumExplod(14005)
trigger1 = TeamSide = 1
anim = 14005
ID = 14005
postype = Back
pos = 31,228+(root,var(25))
ownpal = 1
bindtime = -1
ignorehitpause = 1
ontop = 1
removetime = -1
pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 60000, Explod]
type = Explod
trigger1 = parent,fvar(5) > 1999
trigger1 = !NumExplod(14005)
trigger1 = TeamSide = 2
anim = 14007
ID = 14005
postype = Back
pos = 31,228+(root,var(25))
ownpal = 1
bindtime = -1
ignorehitpause = 1
ontop = 1
removetime = -1
pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 6140, ModifyExplod]
type = ModifyExplod
triggerall = parent,fvar(5) < 1001
trigger1 = NumExplod(14000)
ID = 14000
scale = (parent,fvar(5))/1000.0,.5
ignorehitpause = 1

[State 60000, Explod]
type = Explod
triggerall = parent,fvar(5) > 1999
trigger1 = !NumExplod(14002)
trigger1 = TeamSide = 1
anim = 14002
ID = 14002
postype = Back
pos = 37,229+(root,var(25))
ownpal = 1
bindtime = -1
ignorehitpause = 1
ontop = 1
removetime = -1
pausemovetime = -1
supermovetime = -1

[State 60000, Explod]
type = Explod
triggerall = parent,fvar(5) > 1999
trigger1 = !NumExplod(14002)
trigger1 = TeamSide = 2
anim = 14002
ID = 14002
postype = Back
pos = 38,229+(root,var(25))
ownpal = 1
bindtime = -1
ignorehitpause = 1
ontop = 1
removetime = -1
pausemovetime = -1
supermovetime = -1

[State 6140, ModifyExplod]
type = ModifyExplod
triggerall = parent,fvar(5) > 1000
trigger1 = NumExplod(14001)
ID = 14001
scale = ((parent,fvar(5)-1000)/1000.0),.5
ignorehitpause = 1

[State 6140, ModifyExplod]
type = ModifyExplod
triggerall = parent,fvar(5) > 1999
trigger1 = NumExplod(14002)
ID = 14002
scale = (parent,fvar(5)-1000)/1000.0,.5
ignorehitpause = 1

[State 6140, ModifyExplod]
type = RemoveExplod
triggerall = parent,fvar(5) > 1000
trigger1 = NumExplod(14000)
ID = 14000
ignorehitpause = 1

[State 6140, ModifyExplod]
type = RemoveExplod
triggerall = NumExplod(14001)
trigger1 = parent,fvar(5) > 1999
trigger2 = parent,fvar(5) < 999
ID = 14001
ignorehitpause = 1

[State 6140, ModifyExplod]
type = RemoveExplod
triggerall = parent,fvar(5) < 1999
trigger1 = NumExplod(14002)
ID = 14002
ignorehitpause = 1

[State 6140, ModifyExplod]
type = RemoveExplod
triggerall = NumExplod(14003)
trigger1 = parent,fvar(5) > 1999
trigger2 = parent,fvar(5) < 999
ID = 14003
ignorehitpause = 1

[State 6140, ModifyExplod]
type = RemoveExplod
triggerall = parent,fvar(5) < 1999
trigger1 = NumExplod(14004)
ID = 14004
ignorehitpause = 1

[State 6140, ModifyExplod]
type = RemoveExplod
triggerall = parent,fvar(5) < 1999
trigger1 = NumExplod(14005)
ID = 14005
ignorehitpause = 1

[State 6140, ModifyExplod]
type = RemoveExplod
triggerall = NumExplod(14007)
trigger1 = parent,fvar(5) > 1999
trigger2 = parent,fvar(5) < 999
ID = 14007
ignorehitpause = 1

[State 60000, Explod];Stock Numbah Two
type = Explod
trigger1 = parent,fvar(5) > 1999
trigger1 = !NumExplod(14004)
trigger1 = TeamSide = 1
anim = 14004
ID = 14004
postype = Back
pos = 24,228+(root,var(25))
ownpal = 1
bindtime = -1
ignorehitpause = 1
ontop = 1
removetime = -1
pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 60000, Explod]
type = Explod
trigger1 = parent,fvar(5) > 1999
trigger1 = !NumExplod(14004)
trigger1 = TeamSide = 2
anim = 14005
ID = 14004
postype = Back
pos = 25,228+(root,var(25))
ownpal = 1
bindtime = -1
ignorehitpause = 1
ontop = 1
removetime = -1
pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 132121321, DisplayToClipboard]
type = DisplayToClipboard
trigger1 = 1
text = "Gauge 2 = %d Gauge 1 = %d"
params = numexplod(14001), numexplod(14000)
;ignorehitpause =
;persistent =

;Skill Bar Snd
[Statedef 70001]
ctrl = 0
anim = 1
ownpal = 1

[State 60000, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S3,14
volume = 256
persistent = 0
channel = 23
ignorehitpause = 1

[State 60000, StopSnd]
type = StopSnd
trigger1 = Roundstate < 2
channel = 23

[State 70001, DestroySelf]
type = DestroySelf
trigger1 = Parent, fvar(5) = [1002,1998]
trigger2 = Parent, fvar(5) = [0,1001]
trigger3 = Parent, fvar(5) = 2000

;---------------------------[2002 UM MAX MODE]----------------------------------
[Statedef 70005]
ctrl = 0
anim = 1

[State 70001, VarSet]
type = VarSet
trigger1 = !time
var(0) = power

[State 70001, PowerSet]
type = PowerSet
trigger1 = root,stateno != [3000,4000]
value = var(0)

[State 70001, ParentVarSet]
type = ParentVarSet
trigger1 = !time
var(51) = 800

[State 70001, MAX2 INDICATOR]
type = PalFX
trigger1 = root, life <= 300
time = 1
add = ceil(37/6*sin(2*pi*(root,var(51))/2)),ceil(-170/2*sin(2*pi*(root,var(51))/2)),ceil(-200*2*sin(2*pi*(root,var(51))/2))
mul = 256,128,128
invertall = 1
color = 256
ignorehitpause = 1

[State 60000, P1 MAX-ON !!]
type = Explod
trigger1 = !NumExplod(14110)
trigger1 = TeamSide = 1
anim = 14110
ID = 14110
postype = left
pos = 33,223
ownpal = 1
bindtime = -1
scale = 1,1
ignorehitpause = 1
ontop = 1
pausemovetime = -1
supermovetime = -1
persistent = 0
[State 60000, P2 MAX-ON !!]
type = Explod
trigger1 = !NumExplod(14110)
trigger1 = TeamSide = 2
anim = 14110
ID = 14110
postype = right
pos = -(68+33),223
ownpal = 1
bindtime = -1
scale = 1,1
ignorehitpause = 1
ontop = 1
pausemovetime = -1
supermovetime = -1
persistent = 0
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = !time
trigger2 = time = 26
ID = 14110
scale = 1,0.14
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 1
trigger2 = time = 25
ID = 14110
scale = 1,0.29
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 2
trigger2 = time = 24
ID = 14110
scale = 1,0.43
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 3
trigger2 = time = 23
ID = 14110
scale = 1,0.57
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 4
trigger2 = time = 22
ID = 14110
scale = 1,0.71
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 5
trigger2 = time = 21
ID = 14110
scale = 1,0.86
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 6
ID = 14110
scale = 1,1

[State 60000, P1 HOLD]
type = Explod
trigger1 = !NumExplod(14100)
trigger1 = TeamSide = 1
trigger1 = time = 27
anim = 14100
ID = 14100
postype = left
pos = 33,223
ownpal = 1
bindtime = -1
scale = 1,1
ignorehitpause = 1
ontop = 1
removetime = -1
pausemovetime = -1
supermovetime = -1
persistent = 0
[State 60000, P2 HOLD]
type = Explod
trigger1 = !NumExplod(14100)
trigger1 = TeamSide = 2
trigger1 = time = 27
anim = 14101
ID = 14100
postype = right
pos = -(72+33),223
ownpal = 1
bindtime = -1
scale = 1,1
ignorehitpause = 1
ontop = 1
removetime = -1
pausemovetime = -1
supermovetime = -1
persistent = 0
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 27
ID = 14100
scale = 1,0.14
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 28
ID = 14100
scale = 1,0.29
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 29
ID = 14100
scale = 1,0.43
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 30
ID = 14100
scale = 1,0.57
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 31
ID = 14100
scale = 1,0.71
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 32
ID = 14100
scale = 1,0.86
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 33
ID = 14100
scale = 1,1

[State 70001, P1 METER]
type = Explod
trigger1 = !NumExplod(14120)
trigger1 = TeamSide = 1
trigger1 = time = 27
anim = 14120
ID = 14120
postype = left
pos = 56,222
bindtime = -1
scale = 1,1
ignorehitpause = 1
ontop = 1
removetime = -1
pausemovetime = -1
supermovetime = -1
persistent = 0
[State 70001, P2 METER]
type = Explod
trigger1 = !NumExplod(14120)
trigger1 = TeamSide = 2
trigger1 = time = 27
anim = 14120
ID = 14120
postype = right
pos = -56,222
bindtime = -1
scale = 1,1
ignorehitpause = 1
ontop = 1
removetime = -1
facing = -1
pausemovetime = -1
supermovetime = -1
persistent = 0
[State 70001, ModifyExplod]
type = ModifyExplod
trigger1 = NumExplod(14120)
ID = 14120
scale = (root,var(51)/752.0)*0.96,1

;7 scale changes. Seventh change is a reset.
;Total time is 16 ticks*47 points, 752 ticks. Varadd should be 1 point
; every 16th tick
;Or... converted to MUGEN tick-wise system...
;Every MAX cancel should take 128 total points out of 752.
[State 40001, DestroySelf]
type = ChangeState
trigger1 = root,var(51) <= 0;time = 752
value = stateno+1

[Statedef 70007]
ctrl = 0
anim = 1

[State 70001, PowerAdd]
type = PowerAdd
trigger1 = !time
value = -3000

[State 70001, VarSet]
type = VarSet
trigger1 = !time
var(0) = power

[State 70001, PowerSet]
type = PowerSet
trigger1 = root,stateno != [3000,3999]
value = var(0)

[State 40002, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S14100,0
volume = 200

[State 70001, ParentVarSet]
type = ParentVarSet
trigger1 = !time
var(53) = 753

[State 70001, MAX2 INDICATOR]
type = PalFX
trigger1 = root, life <= 300
time = 1
add = ceil(37/6*sin(2*pi*(root,var(53))/2)),ceil(-170/2*sin(2*pi*(root,var(53))/2)),ceil(-200*2*sin(2*pi*(root,var(53))/2))
mul = 256,128,128
invertall = 1
color = 256
ignorehitpause = 1

[State 60000, P1 MAX-ON !!]
type = Explod
trigger1 = !NumExplod(14110)
trigger1 = TeamSide = 1
anim = 14110
ID = 14110
postype = left
pos = 33,223
ownpal = 1
bindtime = -1
scale = 1,1
ignorehitpause = 1
ontop = 1
pausemovetime = -1
supermovetime = -1
persistent = 0
[State 60000, P2 MAX-ON !!]
type = Explod
trigger1 = !NumExplod(14110)
trigger1 = TeamSide = 2
anim = 14110
ID = 14110
postype = right
pos = -(68+33),223
ownpal = 1
bindtime = -1
scale = 1,1
ignorehitpause = 1
ontop = 1
pausemovetime = -1
supermovetime = -1
persistent = 0
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = !time
trigger2 = time = 26
ID = 14110
scale = 1,0.14
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 1
trigger2 = time = 25
ID = 14110
scale = 1,0.29
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 2
trigger2 = time = 24
ID = 14110
scale = 1,0.43
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 3
trigger2 = time = 23
ID = 14110
scale = 1,0.57
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 4
trigger2 = time = 22
ID = 14110
scale = 1,0.71
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 5
trigger2 = time = 21
ID = 14110
scale = 1,0.86
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 6
ID = 14110
scale = 1,1

[State 60000, P1 HOLD]
type = Explod
trigger1 = !NumExplod(14100)
trigger1 = TeamSide = 1
trigger1 = time = 27
anim = 14100
ID = 14100
postype = left
pos = 33,223
ownpal = 1
bindtime = -1
scale = 1,1
ignorehitpause = 1
ontop = 1
removetime = -1
pausemovetime = -1
supermovetime = -1
persistent = 0
[State 60000, P2 HOLD]
type = Explod
trigger1 = !NumExplod(14100)
trigger1 = TeamSide = 2
trigger1 = time = 27
anim = 14101
ID = 14100
postype = right
pos = -(72+33),223
ownpal = 1
bindtime = -1
scale = 1,1
ignorehitpause = 1
ontop = 1
removetime = -1
pausemovetime = -1
supermovetime = -1
persistent = 0
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 27
ID = 14100
scale = 1,0.14
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 28
ID = 14100
scale = 1,0.29
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 29
ID = 14100
scale = 1,0.43
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 30
ID = 14100
scale = 1,0.57
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 31
ID = 14100
scale = 1,0.71
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 32
ID = 14100
scale = 1,0.86
[State 40003, ModifyExplod]
type = ModifyExplod
trigger1 = time = 33
ID = 14100
scale = 1,1

[State 70001, P1 METER]
type = Explod
trigger1 = !NumExplod(14120)
trigger1 = TeamSide = 1
trigger1 = time = 27
anim = 14120
ID = 14120
postype = left
pos = 56,222
bindtime = -1
scale = 1,1
ignorehitpause = 1
ontop = 1
removetime = -1
pausemovetime = -1
supermovetime = -1
persistent = 0
[State 70001, P2 METER]
type = Explod
trigger1 = !NumExplod(14120)
trigger1 = TeamSide = 2
trigger1 = time = 27
anim = 14120
ID = 14120
postype = right
pos = -56,222
bindtime = -1
scale = 1,1
ignorehitpause = 1
ontop = 1
removetime = -1
facing = -1
pausemovetime = -1
supermovetime = -1
persistent = 0
[State 70001, ModifyExplod]
type = ModifyExplod
trigger1 = NumExplod(14120)
ID = 14120
scale = (root,var(53)/752.0)*0.96,1

[State 40001, DestroySelf]
type = ChangeState
trigger1 = root,var(53) <= 0;time = 752
value = stateno-1

[Statedef 70006]
ctrl = 0
anim = 1
ownpal = 1

[State 70002, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 14100
[State 70002, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 14101
[State 70002, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 14110
[State 70002, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 14120

[State 40001, DestroySelf]
type = DestroySelf
trigger1 = !time

[statedef 999999]
anim = 1
ctrl=0

;helper for command check

[State esp]
Type = null
Trigger1 = 0

;=========================================================================================
; 打康用Helper
;=========================================================================================
[Statedef 6500]
type = A
movetype = I
physics = N
anim = 9999
velset = 0,0
ctrl = 0

[State 6500, カウンターヒット・フラッシュ]
type = EnvColor
trigger1 = time = 0
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 6500]
type = PlaySnd
trigger1 = time = 0
value = 0,2501

[State 6500, VarSet]
type = VarSet
trigger1 = time = 0
var(1) = -52

[State 6500, VarAdd]
type = VarAdd
trigger1 = time < 10
var(1) = 10

[State 6500, VarAdd]
type = VarAdd
trigger1 = time > 59
var(1) = -10

[State 6500, Explod]
type = Explod
triggerall = TeamSide = 1
trigger1 = time < 10
trigger2 = time > 59
anim = 6500
id = 6500
ontop = 1
postype = left
pos = var(1),88
bindtime = -1
supermove = 1
pausemovetime = 99999999999999
ownpal = 1
scale = .5,.5

[State 6500, Explod]
type = Explod
triggerall = TeamSide = 1
trigger1 = time = 10
anim = 6501
id = 6500
ontop = 1
postype = left
pos = var(1),88
bindtime = -1
supermove = 1
pausemovetime = 99999999999999
ownpal = 1
scale = .5,.5

[State 6500, Explod]
type = Explod
triggerall = TeamSide = 2
trigger1 = time < 10
trigger2 = time > 59
anim = 6500
id = 6500
ontop = 1
postype = right
pos = -var(1),88
bindtime = -1
supermove = 1
pausemovetime = 99999999999999
ownpal = 1
scale = .5,.5

[State 6500, Explod]
type = Explod
triggerall = TeamSide = 2
trigger1 = time = 10
anim = 6501
id = 6500
ontop = 1
postype = right
pos = -var(1),88
bindtime = -1
supermove = 1
pausemovetime = 99999999999999
ownpal = 1
scale = .5,.5

[State 6500, DestroySelf]
type = DestroySelf
trigger1 = time = 70


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







;=========================================================================================
; 02UM 血条用Helper 
;=========================================================================================
[Statedef 7500]
type = A
ctrl = 0
anim = 9999
velset = 0,0
movetype = I
physics = N
sprpriority = 10

[state a]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = invisible

;---------------------[透過]
[state a]
type = null;Trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

;---------------------[]
[state -2,a];ゲージ枠a
type = Explod
triggerall = root,var(37) = 0
trigger1 = Facing = 1
trigger1 = numexplod(7501) = 0
anim = 7501
id = 7501
postype = back
bindtime = -1
pos = 36,230 ;AIレベル表示のため若干上に
sprpriority = 98
removetime = -1
ownpal = 1
ontop = 1

[state -2,a];ゲージ枠a
type = Explod
triggerall = root,var(37) = 0
trigger1 = Facing = -1
trigger1 = numexplod(7501) = 0
anim = 7501
id = 7501
postype = back
bindtime = -1
pos = 36,230 ;AIレベル表示のため若干上に
sprpriority = 98
removetime = -1
ownpal = 1
facing = 1
ontop = 1

[state -2,a];ゲージ枠b
type = Explod
triggerall = root,var(37) = 0
trigger1 = Facing = 1
trigger1 = numexplod(7502) = 0
anim = 7502
id = 7502
postype = back
bindtime = -1
pos = 36,230 ;AIレベル表示のため若干上に
sprpriority = 98
removetime = -1
ownpal = 1
ontop = 1
trans = addalpha
alpha = 250,130

[state -2,a];ゲージ枠b
type = Explod
triggerall = root,var(37) = 0
trigger1 = Facing = -1
trigger1 = numexplod(7502) = 0
anim = 7502
id = 7502
postype = back
bindtime = -1
pos = 36,230 ;AIレベル表示のため若干上に
sprpriority = 98
removetime = -1
ownpal = 1
facing = 1
ontop = 1
trans = addalpha
alpha = 250,130

;---------------------[ゲージ量]
[state -2,a];ゲージ量
type = Explod
triggerall = root,var(37) = 0
trigger1 = Facing = 1
trigger1 = numexplod(7520) = 0
anim = 7520
id = 7520
postype = left
bindtime = -1
pos = 36,230 ;AIレベル表示のため若干上に
sprpriority = 97
removetime = -1
ownpal = 1
ontop = 1

[state -2,a];ゲージ量
type = Explod
triggerall = root,var(37) = 0
trigger1 = Facing = 1
trigger1 = numexplod(7521) = 0
anim = 7521
id = 7521
postype = left
bindtime = -1
pos = 36,230 ;AIレベル表示のため若干上に
sprpriority = 97
removetime = -1
ownpal = 1
ontop = 1

[state -2,a];ゲージ量
type = Explod
triggerall = root,var(37) = 0
trigger1 = Facing = 1
trigger1 = numexplod(7522) = 0
anim = 7522
id = 7522
postype = left
bindtime = -1
pos = 36,230 ;AIレベル表示のため若干上に
sprpriority = 97
removetime = -1
ownpal = 1
ontop = 1

[state -2,a];ゲージ量
type = Explod
triggerall = root,var(37) = 0
trigger1 = Facing = 1
trigger1 = numexplod(7523) = 0
anim = 7523
id = 7523
postype = left
bindtime = -1
pos = 36,230 ;AIレベル表示のため若干上に
sprpriority = 97
removetime = -1
ownpal = 1
ontop = 1

[state -2,a];ゲージ量
type = Explod
triggerall = root,var(37) = 0
trigger1 = Facing = 1
trigger1 = numexplod(7524) = 0
anim = 7524
id = 7524
postype = left
bindtime = -1
pos = 36,230 ;AIレベル表示のため若干上に
sprpriority = 97
removetime = -1
ownpal = 1
ontop = 1

[state -2,a];ゲージ量
type = Explod
triggerall = root,var(37) = 0
trigger1 = Facing = -1
trigger1 = numexplod(7520) = 0
anim = 7520
id = 7520
postype = right
bindtime = -1
pos = -36,230 ;AIレベル表示のため若干上に
sprpriority = 97
removetime = -1
ownpal = 1
facing = -1
ontop = 1

[state -2,a];ゲージ量
type = Explod
triggerall = root,var(37) = 0
trigger1 = Facing = -1
trigger1 = numexplod(7521) = 0
anim = 7521
id = 7521
postype = right
bindtime = -1
pos = -36,230 ;AIレベル表示のため若干上に
sprpriority = 97
removetime = -1
ownpal = 1
facing = -1
ontop = 1

[state -2,a];ゲージ量
type = Explod
triggerall = root,var(37) = 0
trigger1 = Facing = -1
trigger1 = numexplod(7522) = 0
anim = 7522
id = 7522
postype = right
bindtime = -1
pos = -36,230 ;AIレベル表示のため若干上に
sprpriority = 97
removetime = -1
ownpal = 1
facing = -1
ontop = 1

[state -2,a];ゲージ量
type = Explod
triggerall = root,var(37) = 0
trigger1 = Facing = -1
trigger1 = numexplod(7523) = 0
anim = 7523
id = 7523
postype = right
bindtime = -1
pos = -36,230 ;AIレベル表示のため若干上に
sprpriority = 97
removetime = -1
ownpal = 1
facing = -1
ontop = 1

[state -2,a];ゲージ量
type = Explod
triggerall = root,var(37) = 0
trigger1 = Facing = -1
trigger1 = numexplod(7524) = 0
anim = 7524
id = 7524
postype = right
bindtime = -1
pos = -36,230 ;AIレベル表示のため若干上に
sprpriority = 97
removetime = -1
ownpal = 1
facing = -1
ontop = 1

;ゲージLV1
[State 3802]
type = ModifyExplod
trigger1 = NumExplod(7520)
ID = 7520;      power***～***の間はXsizeを変動、***以上でXsize=.52、それ以外はXsize=0で消す。
scale = ifelse((root,Power<1000),(root,Power)/1000.0,0),1
ignorehitpause = 1
supermovetime = 999
pausemovetime = 999

;ゲージLV2
[State 3802]
type = ModifyExplod
trigger1 = NumExplod(7521)
ID = 7521;      power***～***の間はXsizeを変動、***以上でXsize=.52、それ以外はXsize=0で消す。
scale = ifelse((root,Power=[1000,1999]),(root,Power-1000)/1000.0,0),1
ignorehitpause = 1
supermovetime = 999
pausemovetime = 999

;ゲージLV3
[State 3802]
type = ModifyExplod
trigger1 = NumExplod(7522)
ID = 7522;      power***～***の間はXsizeを変動、***以上でXsize=.52、それ以外はXsize=0で消す。
scale = ifelse((root,Power=[2000,2999]),(root,Power-2000)/1000.0,0),1
ignorehitpause = 1
supermovetime = 999
pausemovetime = 999

;ゲージLV4
[State 3802]
type = ModifyExplod
trigger1 = NumExplod(7523)
ID = 7523;      power***～***の間はXsizeを変動、***以上でXsize=.52、それ以外はXsize=0で消す。
scale = ifelse((root,Power=[3000,3999]),(root,Power-3000)/1000.0,0),1
ignorehitpause = 1
supermovetime = 999
pausemovetime = 999

;ゲージLV5
[State 3802]
type = ModifyExplod
trigger1 = NumExplod(7524)
ID = 7524;      power***～***の間はXsizeを変動、***以上でXsize=.52、それ以外はXsize=0で消す。
scale = ifelse((root,Power=[4000,4999]),(root,Power-4000)/1000.0,0),1
ignorehitpause = 1
supermovetime = 999
pausemovetime = 999


[state -2,a];MAX
type = Explod
triggerall = root,var(37) = 0
trigger1 = Facing = 1
trigger1 = power >= 5000
trigger1 = numexplod(7525) = 0
anim = 7525
id = 7525
postype = left
bindtime = -1
pos = 36,230 ;AIレベル表示のため若干上に
sprpriority = 97
removetime = -1
ownpal = 1
ontop = 1

[state -2,a];MAX
type = Explod
triggerall = root,var(37) = 0
trigger1 = Facing = -1
trigger1 = power >= 5000
trigger1 = numexplod(7525) = 0
anim = 7526
id = 7525
postype = right
bindtime = -1
pos = -36,230 ;AIレベル表示のため若干上に
sprpriority = 97
removetime = -1
ownpal = 1
facing = -1
ontop = 1

[state a]
type = removeexplod
trigger1 = power < 5000
id = 7525


[state -2, ゲージ数]
type = Explod
triggerall = root,var(37) = 0
trigger1 = Facing = 1
trigger1 = numexplod(7510) = 0
anim = 7510
id = 7510
postype = back
bindtime = -1
pos = 17,230 ;AIレベル表示のため若干上に
sprpriority = 97
removetime = -1
ownpal = 1
ontop = 1

[state -2, ゲージ数]
type = Explod
triggerall = root,var(37) = 0
trigger1 = Facing = 1
trigger1 = numexplod(7511) = 0
anim = 7511
id = 7511
postype = back
bindtime = -1
pos = 17,230 ;AIレベル表示のため若干上に
sprpriority = 97
removetime = -1
ownpal = 1
ontop = 1

[state -2, ゲージ数]
type = Explod
triggerall = root,var(37) = 0
trigger1 = Facing = 1
trigger1 = numexplod(7512) = 0
anim = 7512
id = 7512
postype = back
bindtime = -1
pos = 17,230 ;AIレベル表示のため若干上に
sprpriority = 97
removetime = -1
ownpal = 1
ontop = 1

[state -2, ゲージ数]
type = Explod
triggerall = root,var(37) = 0
trigger1 = Facing = 1
trigger1 = numexplod(7513) = 0
anim = 7513
id = 7513
postype = back
bindtime = -1
pos = 17,230 ;AIレベル表示のため若干上に
sprpriority = 97
removetime = -1
ownpal = 1
ontop = 1

[state -2, ゲージ数]
type = Explod
triggerall = root,var(37) = 0
trigger1 = Facing = 1
trigger1 = numexplod(7514) = 0
anim = 7514
id = 7514
postype = back
bindtime = -1
pos = 17,230 ;AIレベル表示のため若干上に
sprpriority = 97
removetime = -1
ownpal = 1
ontop = 1

[state -2, ゲージ数]
type = Explod
triggerall = root,var(37) = 0
trigger1 = Facing = 1
trigger1 = numexplod(7515) = 0
anim = 7515
id = 7515
postype = back
bindtime = -1
pos = 17,230 ;AIレベル表示のため若干上に
sprpriority = 97
removetime = -1
ownpal = 1
ontop = 1

[state -2, ゲージ数]
type = Explod
triggerall = root,var(37) = 0
trigger1 = Facing = -1
trigger1 = numexplod(7510) = 0
anim = 7510
id = 7510
postype = back
bindtime = -1
pos = 16,230 ;AIレベル表示のため若干上に
sprpriority = 97
removetime = -1
facing = -1
ownpal = 1
ontop = 1

[state -2, ゲージ数]
type = Explod
triggerall = root,var(37) = 0
trigger1 = Facing = -1
trigger1 = numexplod(7511) = 0
anim = 7511
id = 7511
postype = back
bindtime = -1
pos = 16,230 ;AIレベル表示のため若干上に
sprpriority = 97
removetime = -1
facing = -1
ownpal = 1
ontop = 1

[state -2, ゲージ数]
type = Explod
triggerall = root,var(37) = 0
trigger1 = Facing = -1
trigger1 = numexplod(7512) = 0
anim = 7512
id = 7512
postype = back
bindtime = -1
pos = 16,230 ;AIレベル表示のため若干上に
sprpriority = 97
removetime = -1
facing = -1
ownpal = 1
ontop = 1

[state -2, ゲージ数]
type = Explod
triggerall = root,var(37) = 0
trigger1 = Facing = -1
trigger1 = numexplod(7513) = 0
anim = 7513
id = 7513
postype = back
bindtime = -1
pos = 16,230 ;AIレベル表示のため若干上に
sprpriority = 97
removetime = -1
facing = -1
ownpal = 1
ontop = 1

[state -2, ゲージ数]
type = Explod
triggerall = root,var(37) = 0
trigger1 = Facing = -1
trigger1 = numexplod(7514) = 0
anim = 7514
id = 7514
postype = back
bindtime = -1
pos = 16,230 ;AIレベル表示のため若干上に
sprpriority = 97
removetime = -1
facing = -1
ownpal = 1
ontop = 1

[state -2, ゲージ数]
type = Explod
triggerall = root,var(37) = 0
trigger1 = Facing = -1
trigger1 = numexplod(7515) = 0
anim = 7515
id = 7515
postype = back
bindtime = -1
pos = 16,230 ;AIレベル表示のため若干上に
sprpriority = 97
removetime = -1
facing = -1
ownpal = 1
ontop = 1

;ゲージLV1
[State 3802]
type = ModifyExplod
trigger1 = NumExplod(7510)
ID = 7510
scale = ifelse((root,Power<1000),1,0),1
ignorehitpause = 1
supermovetime = 999
pausemovetime = 999

;ゲージLV2
[State 3802]
type = ModifyExplod
trigger1 = NumExplod(7511)
ID = 7511
scale = ifelse((root,Power=[1000,1999]),1,0),1
ignorehitpause = 1
supermovetime = 999
pausemovetime = 999

;ゲージLV3
[State 3802]
type = ModifyExplod
trigger1 = NumExplod(7512)
ID = 7512
scale = ifelse((root,Power=[2000,2999]),1,0),1
ignorehitpause = 1
supermovetime = 999
pausemovetime = 999

;ゲージLV4
[State 3802]
type = ModifyExplod
trigger1 = NumExplod(7513)
ID = 7513
scale = ifelse((root,Power=[3000,3999]),1,0),1
ignorehitpause = 1
supermovetime = 999
pausemovetime = 999

;ゲージLV5
[State 3802]
type = ModifyExplod
trigger1 = NumExplod(7514)
ID = 7514
scale = ifelse((root,Power=[4000,4999]),1,0),1
ignorehitpause = 1
supermovetime = 999
pausemovetime = 999

;ゲージLV5
[State 3802]
type = ModifyExplod
trigger1 = NumExplod(7515)
ID = 7515
scale = ifelse((root,Power>=5000),1,0),1
ignorehitpause = 1
supermovetime = 999
pausemovetime = 999

[State 7500, RemoveExplod]
type = RemoveExplod
trigger1 = root,var(37) = 1