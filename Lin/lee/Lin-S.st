;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;必殺技
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
; 翳
[Statedef 1000]
type    = S
movetype= A
physics = N
poweradd= 50
velset = 0,0
anim = 1000
sprpriority = 1
ctrl = 0

[state a]
type = varset
trigger1 = time = 0
var(30) = 0

;---------------------[コマンド判定]
[state a]
type = varset
trigger1 = time = 0
var(6) = 0

[state a]
type = varset
triggerall = var(59) = 0
trigger1 = time = 0
trigger1 = command = "x"
var(5) = 1

[state a]
type = varset
triggerall = var(59) = 0
trigger1 = time = 0
trigger1 = command = "y"
var(5) = 2

[state a]
type = changeanim
trigger1 = time = 0
trigger1 = var(5) = 2
value = 1001

;---------------------[サウンド]
[State a];毒吐き
type = PlaySnd
trigger1 = var(5) = 1
trigger1 = animelem = 6
value = 1000, 0

[State a];毒吐き
type = PlaySnd
trigger1 = var(5) = 2
trigger1 = animelem = 7
value = 1000, 1

;---------------------[エフェクト]
[State explod];毒
type = Explod
trigger1 = var(5) = 1
trigger1 = animelemtime(6) = 1
anim = 1005
id = 1000
sprpriority = 2
postype = p1
pos = 0,0
bindtime = 1
supermove = 0
under = 0
trans = addalpha
alpha = 245,80
ownpal = 1

[State explod];毒
type = Explod
trigger1 = var(5) = 2
trigger1 = animelemtime(7) = 1
anim = 1006
id = 1000
sprpriority = 2
postype = p1
pos = 0,0
bindtime = 1
supermove = 0
under = 0
trans = addalpha
alpha = 245,80
ownpal = 1
;---------------------[ヘルパー]
[state a];残像
type = Helper
trigger1 = var(5) = 1
trigger1 = animelemtime(6) = 1
id = 1010
name = "kage"
pos = 0,0
postype = p1
stateno = 1010
helpertype = normal
pausemovetime = 0
keyctrl = 0 
ownpal = 1


[state a];残像
type = Helper
trigger1 = var(5) = 2
trigger1 = animelemtime(8) = 2
id = 1012
name = "kage"
pos = 0,0
postype = p1
stateno = 1010
helpertype = normal
pausemovetime = 0
keyctrl = 0 
ownpal = 1

;---------------------[立ちステートに戻る]
[state a]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;(HELPER)攻撃用ヘルパー・弱
[Statedef 1010]
type = A
ctrl = 0
anim = 1010
velset = 0,0
movetype = A
physics = N
sprpriority = 5

[state a]
type = changeanim
trigger1 = time = 0
trigger1 = ishelper(1012)
value = 1012

[State -3, 打逆不可防用]
type = AssertSpecial
triggerall = MoveType = A
trigger1 = Enemynear,P2Dist x < 0
flag = unguardable

;---------------------[攻撃]
[State 210, 2]
type = HitDef
trigger1 = ishelper(1010)
trigger1 = time = 0
attr = S, SP
animtype  = hard
damage    = 90 * root,fvar(39), 10
priority = 8, Hit
getpower = 0,0
givepower = 8,8
hitflag = MAF
guardflag = M
pausetime = 0,0
sparkno = s7002
sparkxy = -12,-76
hitsound   = s400,1
guardsound = s120,1
guard.sparkno = s7012
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -4,-7.2
air.velocity = -4.5,-7.2
yaccel = 0.47
fall = 1
fall.recover = 0
ID = 1010
palfx.time =32
palfx.mul = 100,120,80
palfx.sinadd = 93,115,68,16
palfx.add = -30,-20,-50


[State 210, 2]
type = HitDef
triggerall = ishelper(1012)
trigger1 = time = 0
attr = S, SP
animtype  = hard
damage    = 70 * root,fvar(39), 10
priority = 8, Hit
getpower = 0,0
givepower = 8,8
hitflag = MAF
guardflag = M
pausetime = 0,11
sparkno = s7002
sparkxy = -12,-76
hitsound   = s400,1
guardsound = s120,1
guard.sparkno = s7012
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = 0
air.velocity = -4.5,-7.2
yaccel = 0.47
air.fall = 1
fall.recover = 0
ID = 1012
palfx.time =32
palfx.mul = 100,120,80
palfx.sinadd = 93,115,68,16
palfx.add = -30,-20,-50

[State 210, 2]
type = HitDef
triggerall = ishelper(1012)
trigger1 = animelem = 3
attr = S, SP
animtype  = hard
damage    = 20 * root,fvar(39), 10
priority = 8, Hit
getpower = 0,0
givepower = 8,8
hitflag = MAF
guardflag = M
pausetime = 0,11
sparkno = s7002
sparkxy = -12,-76
hitsound   = s400,1
guardsound = s120,1
guard.sparkno = s7012
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = 0
air.velocity = -4.5,-7.2
yaccel = 0.47
air.fall = 1
fall.recover = 0
ID = 1012
palfx.time =32
palfx.mul = 100,120,80
palfx.sinadd = 93,115,68,16
palfx.add = -30,-20,-50

[State 210, 2]
type = HitDef
triggerall = ishelper(1012)
trigger1 = animelem = 5
attr = S, SP
animtype  = hard
damage    = 10 * root,fvar(39), 10
priority = 8, Hit
getpower = 0,0
givepower = 8,8
hitflag = MAF
guardflag = M
pausetime = 0,11
sparkno = s7002
sparkxy = -12,-76
hitsound   = s400,1
guardsound = s120,1
guard.sparkno = s7012
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = 0
air.velocity = -4.5,-7.2
yaccel = 0.47
fall = 1
fall.recover = 0
ID = 1012
palfx.time =32
palfx.mul = 100,120,80
palfx.sinadd = 93,115,68,16
palfx.add = -30,-20,-50


[state a]
type = targetstate
triggerall = ishelper(1012)
trigger1 = movehit = 1
trigger1 = animelem = 5,>=0
persistent = 0
ignorehitpause = 1
value = 996


;---------------------[ヘルパー]
[state a];相殺
type = Helper
trigger1 = ishelper(1010)
trigger1 = time = 0
id = 1011
name = "zannzo"
sprpriority = 5
pos = 0,0
postype = p1
stateno = 1011
helpertype = normal
pausemovetime = 0
keyctrl = 0 
ownpal = 1


[state a];相殺
type = Helper
trigger1 = ishelper(1012)
trigger1 = time = 0
id = 1013
name = "zannzo"
sprpriority = 5
pos = 0,0
postype = p1
stateno = 1011
helpertype = normal
pausemovetime = 0
keyctrl = 0 
ownpal = 1

;---------------------[]
[state a]
type = destroyself
trigger1 = animtime = 0


;---------------------------------------------------------------------------
;(HELPER)相殺用ヘルパー
[Statedef 1011]
type = A
ctrl = 0
anim = 1011
velset = 0,0
movetype = A
physics = N
sprpriority = 2

[state a]
type = changeanim
trigger1 = time = 0
trigger1 = ishelper(1013)
value = 1013

;---------------------[当身関係]
[state a]
type = nothitby
trigger1 = 1
value = SCA
time = -1

[state a]
type = hitby
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignorehitpause = 1

[state a]
type = hitoverride
trigger1 = 1
attr = SCA,NP,SP,HP
stateno = 1011
ignorehitpause = 1

;---------------------[]
[state a]
type = destroyself
trigger1 = numhelper(1010) = 0
trigger1 = numhelper(1012) = 0
trigger2 = animtime = 0

[state a]
type = bindtoparent
trigger1 = 1
pos = 0,0


;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
; 飛毛脚
[Statedef 1100]
type    = S
movetype= A
physics = N
poweradd= 0
velset = 0,0
anim = 1100
sprpriority = 1
ctrl = 0

[state a]
type = null;varset
trigger1 = time = 0
v = 30
value = 0

;---------------------[どこキャン]
[State a];点滅
type = palfx
triggerall = var(20) > 0
triggerall = time <= 5
trigger1 = prevstateno = 210
trigger2 = prevstateno = 230
trigger3 = prevstateno = 240
trigger4 = prevstateno = 430
trigger5 = prevstateno = 440
trigger6 = prevstateno = 1300
trigger7 = prevstateno = 1310
trigger8 = prevstateno = 1320
trigger9 = prevstateno = 1600
time = 1
add = 256,256,256
color = 1
ignorehitpause = 1

[State a];MAXゲージ
type = varadd
triggerall = var(20) > 0
triggerall = time = 0
trigger1 = prevstateno = 210
trigger2 = prevstateno = 230
trigger3 = prevstateno = 240
trigger4 = prevstateno = 430
trigger5 = prevstateno = 440
trigger6 = prevstateno = 1300
trigger7 = prevstateno = 1310
trigger8 = prevstateno = 1320
trigger9 = prevstateno = 1600
v = 20
value = -150

;---------------------[コマンド判定]
[state a]
type = varset
trigger1 = time = 0
var(6) = 0

[state a]
type = varset
triggerall = var(59) = 0
trigger1 = time = 0
trigger1 = command = "a"
var(5) = 1

[state a]
type = varset
triggerall = var(59) = 0
trigger1 = time = 0
trigger1 = command = "b"
var(5) = 2

[state a]
type = changeanim
trigger1 = time = 0
trigger1 = var(5) = 2
value = 1101

;---------------------[サウンド]
[State a];ワープ
type = PlaySnd
trigger1 = animelem = 4
value = 1100, 0

[State 1100]
type = NotHitBy
trigger1 = var(5) = 2
trigger1 = AnimElemTime(2) > 0
trigger1 = AnimElemTime(10) < 1
value = SCA,NP,SP,HP
time = 1


;---------------------[エフェクト]
[state a]
type = playerpush
trigger1 = var(5) = 1
trigger1 = animelem = 4,>=0
trigger1 = animelem = 11,<0
trigger2 = var(5) = 2
trigger2 = animelem = 4,>=0
trigger2 = animelem = 9,<0
value = 0

;---------------------[速度]
[state a]
type = velset
trigger1 = var(5) = 1
trigger1 = animelem = 4
x = 5

[state a]
type = velset
trigger1 = var(5) = 2
trigger1 = animelem = 4
x = 10

[state a]
type = velmul
trigger1 = var(5) = 1
trigger1 = animelem = 11,>=0
trigger2 = var(5) = 2
trigger2 = animelem = 9,>=0
x = 0.9

[state a]
type = velset
trigger1 = animtime = 0
x = 0

;---------------------[立ちステートに戻る]
[state a]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1


;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
; 飛天脚・弱
[Statedef 1200]
type    = S
movetype= A
physics = N
poweradd= 84
velset = 0,0
anim = 1200
sprpriority = 1
ctrl = 0

[state a]
type = varset
trigger1 = time = 0
v = 30
value = 0

;---------------------[どこキャン]
[State a];点滅
type = palfx
triggerall = var(20) > 0
triggerall = time <= 5
trigger1 = prevstateno = 210
trigger2 = prevstateno = 230
trigger3 = prevstateno = 240
trigger4 = prevstateno = 430
trigger5 = prevstateno = 440
trigger6 = prevstateno = 1300
trigger7 = prevstateno = 1310
trigger8 = prevstateno = 1320
trigger9 = prevstateno = 1600
time = 1
add = 256,256,256
color = 1
ignorehitpause = 1

[State a];MAXゲージ
type = varadd
triggerall = var(20) > 0
triggerall = time = 0
trigger1 = prevstateno = 210
trigger2 = prevstateno = 230
trigger3 = prevstateno = 240
trigger4 = prevstateno = 430
trigger5 = prevstateno = 440
trigger6 = prevstateno = 1300
trigger7 = prevstateno = 1310
trigger8 = prevstateno = 1320
trigger9 = prevstateno = 1600
v = 20
value = -150

;---------------------[コマンド判定]
[state a]
type = varset
trigger1 = time = 0
v = 5
value = 0

;---------------------[サウンド]
[State a];ジャンプ
type = PlaySnd
trigger1 = animelem = 3
value = 40, 1

[State a];蹴り
type = PlaySnd
trigger1 = animelem = 11
trigger2 = animelem = 15
value = 300, 1

[State a];蹴り
type = PlaySnd
trigger1 = animelem = 20
value = 1200, 2

[State a];はっ！
type = PlaySnd
trigger1 = animelem = 21
value = 1200, 0

;---------------------[移動]
[state a]
type = statetypeset
trigger1 = animelem = 4
value = A

[state a];30
type = velset
trigger1 = animelem = 4
x = 4
y = -5

[state a]
type = veladd
trigger1 = animelem = 4,>0
y = 0.35

;---------------------[攻撃]
[State 240, 2]
type = HitDef
trigger1 = animelem = 12
trigger2 = animelem = 16
attr = A, SA
animtype  = hard
damage    = 30*fvar(39),10
priority = 7, Hit
getpower = 42,42
givepower = 7,7
hitflag = MA
guardflag = M
pausetime = 7,8
sparkno = s7002
sparkxy = -22,-17
hitsound   = s400,3
guard.sparkno = s7012
guardsound = s120,1
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -4
air.velocity = -5,-6
guard.velocity = -4
yaccel = 0.47
air.fall = 1
fall.recover = 0
yaccel = 0.45
id = 1200
nochainID = 9999

[State 240, 2]
type = HitDef
trigger1 = animelem = 24
trigger1 = movecontact
attr = A, SA
animtype  = up
damage    = 30*fvar(39),10
priority = 7, Hit
getpower = 42,42
givepower = 7,7
hitflag = MA
guardflag = H
pausetime = 12,13
sparkno = s7002
sparkxy = -22,-22
hitsound   = s400,4
guard.sparkno = s7012
guardsound = s120,1
ground.type = low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -1,20
air.velocity = -1,-20
guard.velocity = -12
yaccel = 0.47
fall = 1
fall.recover = 0
yaccel = 0.45
id = 1200
nochainID = 9999

[State 240, 2]
type = HitDef
trigger1 = animelem = 24
attr = A, SA
animtype  = up
damage    = 40 * fvar(39),10
priority = 7, Hit
getpower = 42,42
givepower = 7,7
hitflag = MAFLD
guardflag = H
pausetime = 12,13
sparkno = s7002
sparkxy = -22,-22
hitsound   = s400,4
guard.sparkno = s7012
guardsound = s120,1
ground.type = low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -1,20
air.velocity = -1,20
down.velocity = -3,-5
guard.velocity = -12
yaccel = 0.47
fall = 1
fall.recover = 0
yaccel = 0.45
id = 1200


;---------------------[立ちステートに戻る]
[state a]
type = changestate
trigger1 = animelem = 24,>=0
trigger1 = movecontact = 1
value = 1210

[state a]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y >= 0
value = 1205

;---------------------------------------------------------------------------
; 飛天脚・着地
[Statedef 1205]
type    = S
movetype= A
physics = N
poweradd= 0
velset = 0,0
anim = 1205
sprpriority = 1
ctrl = 0

[state a]
type = changeanim
trigger1 = prevstateno = 1210
trigger1 = time = 0
value = 1215

[state a]
type = changeanim
trigger1 = prevstateno = 1220
trigger1 = time = 0
value = 1225

;---------------------[サウンド]
[State a];着地
type = PlaySnd
trigger1 = time = 0
value = 41,0

;---------------------[エフェクト]
[state a]
type = removeexplod
trigger1 = time = 0
id = 3000

;---------------------[移動]
[state a]
type = posset
trigger1 = time = 0
y = 0

;---------------------[立ちステートに戻る]
[state a]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 飛天脚・弱・反動
[Statedef 1210]
type    = A
movetype= I
physics = N
poweradd= 0
velset = 0,0
anim = 1210
sprpriority = 1
ctrl = 0

;---------------------[移動]
[state a];36
type = velset
trigger1 = time = 0
x = -2
y = -7

[state a]
type = veladd
trigger1 = animelem = 1,>0
y = 0.43

;---------------------[立ちステートに戻る]
[state a]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y >= 0
value = 1205


;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
; 飛天脚・強
[Statedef 1220]
type    = S
movetype= A
physics = N
poweradd= 84
velset = 0,0
anim = 1220
sprpriority = 1
ctrl = 0

[state a]
type = varset
trigger1 = time = 0
v = 30
value = 0

;---------------------[どこキャン]
[State a];点滅
type = palfx
triggerall = var(20) > 0
triggerall = time <= 5
trigger1 = prevstateno = 210
trigger2 = prevstateno = 230
trigger3 = prevstateno = 240
trigger4 = prevstateno = 430
trigger5 = prevstateno = 440
trigger6 = prevstateno = 1300
trigger7 = prevstateno = 1310
trigger8 = prevstateno = 1320
trigger9 = prevstateno = 1600
time = 1
add = 256,256,256
color = 1
ignorehitpause = 1

[State a];MAXゲージ
type = varadd
triggerall = var(20) > 0
triggerall = time = 0
trigger1 = prevstateno = 210
trigger2 = prevstateno = 230
trigger3 = prevstateno = 240
trigger4 = prevstateno = 430
trigger5 = prevstateno = 440
trigger6 = prevstateno = 1300
trigger7 = prevstateno = 1310
trigger8 = prevstateno = 1320
trigger9 = prevstateno = 1600
v = 20
value = -150

;---------------------[コマンド判定]
[state a]
type = varset
trigger1 = time = 0
v = 5
value = 0

;---------------------[サウンド]
[State a];ジャンプ
type = PlaySnd
trigger1 = animelem = 6
value = 40, 1

[State a];蹴り
type = PlaySnd
trigger1 = animelem = 11
trigger2 = animelem = 15
trigger3 = animelem = 19
value = 300, 1

[State a];蹴り
type = PlaySnd
trigger1 = animelem = 28
value = 1200, 2

[State a];アイーーーン！！
type = PlaySnd
trigger1 = animelem = 27
value = 1200, 1

;---------------------[移動]
[state a]
type = statetypeset
trigger1 = animelem = 6
value = A

[state a];38
type = velset
trigger1 = animelem = 6
x = 5
y = -6

[state a]
type = veladd
trigger1 = animelem = 6,>0
y = 0.33

;---------------------[攻撃]
[State 240, 2]
type = HitDef
trigger1 = animelem = 13
trigger2 = animelem = 16
trigger3 = animelem = 20
attr = A, SA
animtype  = hard
damage    = 12 * fvar(39),10
priority = 7, Hit
getpower = 42,42
givepower = 7,7
guardflag = M
pausetime = 7,7
sparkno = s7002
sparkxy = -22,-17
hitsound   = s400,3
guard.sparkno = s7012
guardsound = s120,1
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -9
air.velocity = -5,-3.2
guard.velocity = -9
yaccel = 0.48
air.fall = 1
fall.recover = 0
id = 1100
nochainID = 9999

[State 240, 2]
type = HitDef
trigger1 = animelem = 29
trigger1 = movecontact
attr = A, SA
animtype  = hard
damage    = 12 * fvar(39),10
priority = 7, Hit
getpower = 42,42
givepower = 7,7
guardflag = M
pausetime = 12,13
sparkno = s7002
sparkxy = -25,-82
hitsound   = s400,4
guard.sparkno = s7012
guardsound = s120,1
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -1.1,-12
air.velocity = -1.1,-12
guard.velocity = -12
yaccel = 0.58
fall = 1
fall.recover = 0
id = 1220
nochainID = 1200,9999

[State 240, 2]
type = HitDef
trigger1 = animelem = 29
trigger1 = movecontact = 0
attr = A, SA
animtype  = hard
damage    = 30 * fvar(39),10
priority = 7, Hit
getpower = 42,42
givepower = 7,7
guardflag = M
pausetime = 12,13
sparkno = s7002
sparkxy = -25,-82
hitsound   = s400,4
guard.sparkno = s7012
guardsound = s120,1
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -1.2,-12.5
air.velocity = -1.2,-12.5
guard.velocity = -12
yaccel = 0.56
fall = 1
fall.recover = 0
yaccel = 0.45
id = 1220
nochainID = 1200,9999


;---------------------[立ちステートに戻る]
[state a]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y >= 0
value = 1205


;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
; 鉄斬舞 羅殺
[Statedef 1300]
type    = S
movetype= A
physics = N
poweradd= 80
velset = 0,0
anim = 1300
sprpriority = 1
ctrl = 0

[state a]
type = varset
trigger1 = time = 0
v = 30
value = 0

;---------------------[どこキャン]
[State a];点滅
type = palfx
triggerall = var(20) > 0
triggerall = time <= 5
trigger1 = prevstateno = 210
trigger2 = prevstateno = 230
trigger3 = prevstateno = 240
trigger4 = prevstateno = 430
trigger5 = prevstateno = 440
trigger6 = prevstateno = 1600
time = 1
add = 256,256,256
color = 1
ignorehitpause = 1

[State a];MAXゲージ
type = varadd
triggerall = var(20) > 0
triggerall = time = 0
trigger1 = prevstateno = 210
trigger2 = prevstateno = 230
trigger3 = prevstateno = 240
trigger4 = prevstateno = 430
trigger5 = prevstateno = 440
trigger6 = prevstateno = 1600
v = 20
value = -150

;---------------------[コマンド判定]
[state a]
type = varset
trigger1 = time = 0
var(6) = 0

[state a]
type = varset
triggerall = var(59) = 0
trigger1 = time = 0
trigger1 = command = "x"
var(5) = 1

[state a]
type = varset
triggerall = var(59) = 0
trigger1 = time = 0
trigger1 = command = "y"
var(5) = 2

[state a]
type = changeanim
trigger1 = time = 0
trigger1 = var(5) = 2
value = 1301


[state a]
type = varset
triggerall = time > 0
trigger1 = command = "鉄斬舞 那義"
trigger2 = var(32) = 1
trigger2 = command = "特殊那義"
var(6) = 1

[state a]
type = varset
trigger1 = command = "特殊那義"
trigger1 = var(32) = 1
trigger1 = prevstateno = [200,499]
var(6) = 1

;---------------------[サウンド]
[State a];ナー
type = PlaySnd
trigger1 = animelem = 1
value = 1300, 0

[State a];毒
type = PlaySnd
trigger1 = animelem = 4
value = 182, 0



[State a];毒ヒット
type = PlaySnd
trigger1 = movehit = 1
trigger1 = animelem = 6,>=0
trigger1 = animelem = 7,<0
value = 1300, 3
persistent = 0
ignorehitpause = 1

[State a];毒ヒット
type = PlaySnd
trigger1 = movehit = 1
trigger1 = animelem = 7,>=0
trigger1 = animelem = 8,<0
value = 1300, 3
persistent = 0
ignorehitpause = 1
;---------------------[移動]

[state a]
type = posadd
trigger1 = animelem = 6
trigger2 = animelem = 7
x = 25

;---------------------[エフェクト]
[State explod];毒手
type = Explod
trigger1 = animelem = 5
anim = 1305 + (var(5) - 1)
id = 3000
sprpriority = 2
postype = p1
pos = 0,0
bindtime = -1
supermove = 0
under = 0
ownpal = 1
ignorehitpause = 0

[State explod];毒
type = Explod
trigger1 = animelem = 7
anim = 1307
id = 1300
sprpriority = 3
postype = p1
pos = -11,3
bindtime = 1
supermove = 0
under = 0
trans = addalpha
alpha = 245,80
ownpal = 1
ignorehitpause = 1

;---------------------[攻撃]
[State 210, 2]
type = HitDef
trigger1 = animelem = 6
attr = S, SA
animtype  = hard
damage    = (35 + (var(5)-1)*10)*fvar(39),10
priority = 7, Hit
getpower = 70,70
givepower = 15,15
guardflag = M
pausetime = 5,6
sparkno = s7002
sparkxy = -12,-69
hitsound   = s410,0
guardsound = s120,1
guard.sparkno = s7012
ground.type = low
ground.slidetime = 22
ground.hittime  = 22
ground.velocity = -8
air.velocity = -4.2,-6
ID = 1300
palfx.time =32
palfx.mul = 100,120,80
palfx.sinadd = 93,115,68,16
palfx.add = -30,-20,-50
air.fall = 1
fall.recover = 0

[State 210, 2]
type = HitDef
trigger1 = animelem = 7
attr = S, SA
animtype  = hard
damage    = (35 + (var(5)-1)*10)*fvar(39),10
priority = 7, Hit
getpower = 70,70
givepower = 15,15
guardflag = M
pausetime = 5,6
sparkno = s7002
sparkxy = -44,-65
hitsound   = s410,0
guardsound = s120,1
guard.sparkno = s7012
ground.type = low
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = -8
air.velocity = -4.2,-6
ID = 1300
palfx.time =32
palfx.mul = 100,120,80
palfx.sinadd = 93,115,68,16
palfx.add = -30,-20,-50
air.fall = 1
fall.recover = 0

;---------------------[立ちステートに戻る]
[state a]
type = changestate
trigger1 = animelem = 11
trigger1 = var(6) = 1
value = 1310

[State -3,以下设置是为了不目押立a，直接接那义]
type = varset
TriggerAll = var(59)
triggerAll = animelem = 7, >0
TriggerAll = Life > 180
Trigger1 = EnemyNear,Life - Life < 300
var(52) = 1


[State -3]
type = ChangeState
trigger1 = animtime = 0
TriggerAll = var(59)
TriggerAll = StateType != A
TriggerAll = !InGuardDist
TriggerAll = EnemyNear,StateType != L
TriggerAll = EnemyNear,StateType != A && EnemyNear,MoveType = H && !EnemyNear,Ctrl
TriggerAll = EnemyNear,StateNo >= 5000 || EnemyNear,StateNo = [120,159]
;立X追击罗杀
Trigger1 = EnemyNear,StateNo >= 5000 
Trigger1 = Helper(33000),var(14) = 1300 || Helper(33000),var(14) = 200
Trigger1 = EnemyNear,gethitvar(hittime) >= 1
Trigger1 = P2BodyDist x - ifelse(EnemyNear,BackEdgeBodyDist > 10, fvar(37) * 1, 0) - ifelse(EnemyNear,BackEdgeBodyDist < 10,Vel x * 1, 0)< 60
Trigger1 = var(50) := 020068
Trigger1 = var(52) := 1
value = 200


[state a]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
; 鉄斬舞 那義
[Statedef 1310]
type    = S
movetype= A
physics = N
poweradd= 30
velset = 0,0
anim = 1310
sprpriority = 1
ctrl = 0

;---------------------[コマンド判定]
[state a]
type = varset
trigger1 = time = 0
var(6) = 0

[state a]
type = changeanim
trigger1 = time = 0
trigger1 = var(5) = 2
value = 1311

[state a]
type = varset
triggerall = var(59) = 0
triggerall = time > 1
trigger1 = command = "holdfwd"
trigger1 = command = "x" || command = "y"
var(6) = 1

;---------------------[サウンド]
[State a];ナー
type = PlaySnd
trigger1 = animelem = 2
value = 1300, 1

[State a];毒
type = PlaySnd
trigger1 = animelem = 3
value = 182, 0

[State a];毒ヒット
type = PlaySnd
trigger1 = movehit = 1
value = 1300, 4
persistent = 0
ignorehitpause = 1

;---------------------[移動]
[state a]
type = posadd
trigger1 = time = 0
trigger2 = time = 1
trigger3 = time = 5
x = 4

[state a]
type = posadd
trigger1 = time = 2
trigger2 = time = 3
trigger3 = time = 4
x = 8

[state a]
type = posadd
trigger1 = animelem = 8
x = 10

;---------------------[エフェクト]
[State explod];毒手
type = Explod
trigger1 = animelem = 4
anim = 1315 + (var(5) - 1)
id = 3000
sprpriority = 2
postype = p1
pos = 0,0
bindtime = -1
supermove = 0
under = 0
ownpal = 1
ignorehitpause = 0

[State explod];毒
type = Explod
trigger1 = animelem = 4
anim = 1317
id = 1300
sprpriority = 3
postype = p1
pos = 0,0
bindtime = 1
supermove = 0
under = 0
trans = addalpha
alpha = 245,80
ownpal = 1
ignorehitpause = 1

;---------------------[攻撃]
[State 210, 2]
type = HitDef
trigger1 = var(5) = 1
trigger1 = animelem = 4
attr = S, SA
animtype  = hard
damage    = 20 * fvar(39),10
priority = 7, Hit
getpower = 50,50
givepower = 8,8
guardflag = M
pausetime = 5,15
sparkno = s7002
sparkxy = -32,-90
hitsound   = s410,0
guardsound = s120,1
guard.sparkno = s7012
ground.type = high
ground.slidetime = 23
ground.hittime  = 23
ground.velocity = -6
guard.velocity = -10
air.velocity = -4.2,-6
ID = 1310
nochainID = 9999
palfx.time =32
palfx.mul = 100,120,80
palfx.sinadd = 93,115,68,16
palfx.add = -30,-20,-50
air.fall = 1
fall.recover = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0

[State 210, 2]
type = HitDef
trigger1 = var(5) = 2
trigger1 = animelem = 4
attr = S, SA
animtype  = hard
damage    = 30 * fvar(39),10
priority = 7, Hit
getpower = 50,50
givepower = 8,8
guardflag = M
pausetime = 5,15
sparkno = s7002
sparkxy = -32,-90
hitsound   = s410,0
guardsound = s120,1
guard.sparkno = s7012
ground.type = high
ground.slidetime = 23
ground.hittime  = 23
ground.velocity = -3,-8.3
guard.velocity = -10
air.velocity = -3.2,-6
yaccel = 0.54
ID = 1311
nochainID = 9999
palfx.time =45
palfx.mul = 100,120,80
palfx.sinadd = 93,115,68,16
palfx.add = -30,-20,-50
fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
guard.cornerpush.veloff = -4

;---------------------[立ちステートに戻る]
[state a]
type = changestate
trigger1 = animelem = 9
trigger1 = var(6) = 1
value = 1320

[state a]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1


;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
; 鉄斬舞 波頚
[Statedef 1320]
type    = S
movetype= A
physics = N
juggle  = 0
poweradd= 20
velset = 0,0
anim = 1320
sprpriority = 1
ctrl = 0

;---------------------[コマンド判定]
[state a]
type = varset
trigger1 = time = 0
var(6) = 0

[state a]
type = changeanim
trigger1 = time = 0
trigger1 = var(5) = 2
value = 1321

;---------------------[サウンド]
[State a];ハァーン
type = PlaySnd
trigger1 = animelem = 1
value = 1300, 2

[State a];毒
type = PlaySnd
trigger1 = var(5) = 1
trigger1 = animelem = 8
trigger2 = var(5) = 2
trigger2 = animelem = 9
value = 182, 0

[State a];毒ヒット
type = PlaySnd
trigger1 = movehit = 1
value = 1300, 5
persistent = 0
ignorehitpause = 1

;---------------------[移動]
[state a]
type = posadd
trigger1 = var(5) = 1
trigger1 = time = 0
x = 12

[state a]
type = posadd
trigger1 = time = 1
trigger2 = time = 2
trigger3 = time = 3
trigger4 = time = 4
trigger5 = time = 5
trigger6 = time = 6
trigger7 = time = 7
trigger8 = time = 8
trigger9 = var(5) = 2
trigger9 = time = 9
trigger10= var(5) = 2
trigger10= time = 10
trigger11= var(5) = 2
trigger11= time = 11
x = 8

[state a]
type = posadd
trigger1 = var(5) = 1
trigger1 = animelem = 10
trigger2 = var(5) = 2
trigger2 = time = 0
trigger3 = var(5) = 1
trigger3 = animelem = 11
x = 4

;---------------------[エフェクト]
[State explod];毒手
type = Explod
trigger1 = var(5) = 1
trigger1 = animelem = 9
anim = 1325
id = 3000
sprpriority = 2
postype = p1
pos = 0,0
bindtime = -1
supermove = 0
under = 0
ownpal = 1
ignorehitpause = 0

[State explod];毒手
type = Explod
trigger1 = var(5) = 2
trigger1 = animelem = 10
anim = 1326
id = 3000
sprpriority = 2
postype = p1
pos = 0,0
bindtime = -1
supermove = 0
under = 0
ownpal = 1
ignorehitpause = 0

[State 1020, 4]
type = EnvShake
trigger1 = var(5) = 1
trigger1 = animelem = 10
trigger2 = var(5) = 2
trigger2 = animelem = 11
time = 15
ampl = -6
freq = 95
phase = 95

;---------------------[攻撃]
[State 210, 2]
type = HitDef
trigger1 = var(5) = 1
trigger1 = animelem = 10
attr = S, SA
animtype  = hard
damage    = 30 * fvar(39),10
priority = 7, Hit
getpower = 21,21
givepower = 4,4
guardflag = M
pausetime = 11,15
sparkno = s7002
sparkxy = -32,-63
hitsound   = s400,1
guardsound = s120,1
guard.sparkno = s7012
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -5,-7
guard.velocity = -10
air.velocity = -5,-7
yaccel = 0.46;28
ID = 9999
nochainID = 9999
palfx.time =48
palfx.mul = 100,120,80
palfx.sinadd = 93,115,68,16
palfx.add = -30,-20,-50
fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
guard.cornerpush.veloff = -4

[State 210, 2]
type = HitDef
trigger1 = var(5) = 2
trigger1 = animelem = 11
attr = S, SA
animtype  = hard
damage    = 40 * fvar(39),10
priority = 7, Hit
getpower = 21,21
givepower = 4,4
guardflag = M
pausetime = 11,15
sparkno = s7002
sparkxy = -32,-63
hitsound   = s400,1
guardsound = s120,1
guard.sparkno = s7012
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -5,-7
guard.velocity = -10
air.velocity = -5,-7
yaccel = 0.46;28
ID = 9999
nochainID = 9999
palfx.time =48
palfx.mul = 100,120,80
palfx.sinadd = 93,115,68,16
palfx.add = -30,-20,-50
fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
guard.cornerpush.veloff = -4


;---------------------[立ちステートに戻る]
[state a]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1


;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
; 無影紅砂手
[Statedef 1400]
type    = S
movetype= A
physics = N
poweradd= 80
velset = 0,0
anim = 1400
sprpriority = 1
ctrl = 0

[state a]
type = varset
trigger1 = time = 0
v = 30
value = 0

;---------------------[どこキャン]
[State a];点滅
type = palfx
triggerall = var(20) > 0
triggerall = time <= 5
trigger1 = prevstateno = 210
trigger2 = prevstateno = 230
trigger3 = prevstateno = 240
trigger4 = prevstateno = 430
trigger5 = prevstateno = 440
trigger6 = prevstateno = 1300
trigger7 = prevstateno = 1310
trigger8 = prevstateno = 1320
trigger9 = prevstateno = 1600
time = 1
add = 256,256,256
color = 1
ignorehitpause = 1

[State a];MAXゲージ
type = varadd
triggerall = var(20) > 0
triggerall = time = 0
trigger1 = prevstateno = 210
trigger2 = prevstateno = 230
trigger3 = prevstateno = 240
trigger4 = prevstateno = 430
trigger5 = prevstateno = 440
trigger6 = prevstateno = 1300
trigger7 = prevstateno = 1310
trigger8 = prevstateno = 1320
trigger9 = prevstateno = 1600
v = 20
value = -150

;---------------------[コマンド判定]
[state a]
type = varset
trigger1 = time = 0
var(6) = 0

[state a]
type = varset
triggerall = var(59) = 0
trigger1 = time = 0
trigger1 = command = "x"
var(5) = 1

[state a]
type = varset
triggerall = var(59) = 0
trigger1 = time = 0
trigger1 = command = "y"
var(5) = 2

[state a]
type = changeanim
trigger1 = time = 0
trigger1 = var(5) = 2
value = 1401

;---------------------[サウンド]
[State a];ナナナナナナナナ
type = PlaySnd
trigger1 = animelem = 5
value = 1400, 0
channel = 6

[State a];振り
type = PlaySnd
trigger1 = animelem = 4
value = 1400, 2
channel = 7

[state a]
type = stopsnd
trigger1 = animelem = 21
channel = 6

[state a]
type = stopsnd
trigger1 = animelem = 22
channel = 7

;---------------------[無敵]
[State 700, 2];無敵の状態を作る
type = NotHitBy
trigger1 = var(5) = 2
trigger1 = animelem = 3,>=0
trigger1 = animelem = 4,<0
value = SCA

;---------------------[攻撃]
[state a];打撃防御
type = reversaldef
trigger1 = animelem = 4,<0
reversal.attr = SCA,NA,SA,HA,NP,SP,HP
pausetime = 5,6
sparkno = s7012
sparkxy = 15,0
hitsound = s120,1
numhits = 0

[State 210, 2]
type = HitDef
trigger1 = animelem = 8
trigger2 = animelem = 17
attr = S, SA
animtype  = hard
damage    = 12*fvar(39),5
priority = 7, Hit
getpower = 21,21
givepower = 4,4
guardflag = M
pausetime = 2,3
sparkno = s7006
sparkxy = -24,-93
hitsound   = s410,1
guardsound = s120,1
guard.sparkno = s7012
ground.type = low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -4,-6
air.velocity = -4.2,-6
ID = 200
fall = 1
fall.recover = 0
kill = 0

[State 210, 2]
type = HitDef
trigger1 = animelem = 11
attr = S, SA
animtype  = hard
damage    = 12*fvar(39),5
priority = 7, Hit
getpower = 21,21
givepower = 4,4
guardflag = M
pausetime = 2,2
sparkno = s7006
sparkxy = -28,-77
hitsound   = s410,1
guardsound = s120,1
guard.sparkno = s7012
ground.type = low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -4,-6
air.velocity = -4.2,-6
ID = 200
nochainID = 9999
fall = 1
fall.recover = 0
kill = 0

[State 210, 2]
type = HitDef
trigger1 = animelem = 14
trigger2 = animelem = 20
attr = S, SA
animtype  = hard
damage    = 12*fvar(39),5
priority = 7, Hit
getpower = 21,21
givepower = 4,4
guardflag = M
pausetime = 2,2
sparkno = s7006
sparkxy = -24,-61
hitsound   = s410,1
guardsound = s120,1
guard.sparkno = s7012
ground.type = low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -4,-6
air.velocity = -4.2,-6
ID = 200
nochainID = 9999
fall = 1
fall.recover = 0
kill = 0

;---------------------[立ちステートに戻る]
[state a]
type = changestate
trigger1 = movehit = 1
trigger1 = animelem = 8,>=0
value = 1405

[state a]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 無影紅砂手・ヒット
[Statedef 1405]
type    = S
movetype= A
physics = N
poweradd= 0
velset = 0,0
anim = 1405
sprpriority = 1
ctrl = 0

;---------------------[コマンド判定]
[state a]
type = varset
trigger1 = time = 0
var(5) = 0

[state a]
type = varset
trigger1 = time = 0
var(6) = 0

;---------------------[サウンド]
[State a];斬！
type = PlaySnd
trigger1 = animelem = 44
value = 1400, 1

[state a]
type = stopsnd
trigger1 = animelem = 33
channel = 7

[State a];毒ヒット
type = PlaySnd
trigger1 = animelem = 44,>=0
trigger1 = movehit = 1
value = 1300, 5
persistent = 0
ignorehitpause = 1

;---------------------[エフェクト]
[State 1020, 4]
type = EnvShake
trigger1 = animelem = 44
time = 15
ampl = -6
freq = 95
phase = 95

;---------------------[無敵]
[State 700, 2];無敵の状態を作る
type = NotHitBy
trigger1 = 1
value = SCA

;---------------------[攻撃]
[State 210, 2]
type = HitDef
trigger1 = animelem = 2
trigger2 = animelem = 5
trigger3 = animelem = 8
trigger4 = animelem = 10
trigger5 = animelem = 13
trigger6 = animelem = 16
trigger7 = animelem = 19
trigger8 = animelem = 22
trigger9 = animelem = 25
trigger10= animelem = 28
trigger11= animelem = 31
attr = S, SA
animtype  = hard
damage    = 8*fvar(39),5
priority = 9999, Hit
getpower = 21,21
givepower = 4,4
guardflag = N
pausetime = 0,1
sparkno = s7006
sparkxy = -28,-77
hitsound   = s410,random%2
guardsound = s120,1
guard.sparkno = s7012
ground.type = low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -4,-6
air.velocity = -4.2,-6
ID = 1405
fall = 1
fall.recover = 0
kill = 0

[State 210, 2]
type = HitDef
trigger1 = animelem = 44
attr = S, SA
animtype  = hard
damage    = 50,5
priority = 9999, Hit
getpower = 21,21
givepower = 4,4
guardflag = N
pausetime = 44,45
sparkno = s7007
sparkxy = -38,-77
hitsound   = s410,1
guardsound = s120,1
guard.sparkno = s7012
ground.type = low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -4,-7.5
air.velocity = -4.2,-7.5
yaccel = 0.47
ID = 1405
fall = 1
fall.recover = 0
p2stateNo = 5020

;---------------------[相手制御]
[state a]
type = targetbind
trigger1 = animelem = 44,< 0
pos = 40,0

[state a]
type = targetstate
trigger1 = time = 0
trigger2 = animelem = 29,<0
trigger2 = movehit = 1
value = 1410

[state a]
type = targetstate
trigger1 = animelem = 31,>=0
trigger1 = animelem = 32,<0
trigger1 = movehit = 1
value = 1411

;---------------------[立ちステートに戻る]
[state a]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;(ENEMY)無影紅砂手・掴まれ1
[Statedef 1410]
type    = A
movetype= H
physics = N
velset = 0,0
sprpriority = -1

;---------------------[演出]
[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1410

;---------------------[ステート移行]
[State 821, 3] 
type = SelfState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;(ENEMY)無影紅砂手・掴まれ2
[Statedef 1411]
type    = A
movetype= H
physics = N
velset = 0,0
sprpriority = -1

;---------------------[演出]
[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1411

;---------------------[ステート移行]
[State 821, 3] 
type = SelfState
trigger1 = animtime = 0
value = 0
ctrl = 1

;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
; 蛇突牙
[Statedef 1500]
type    = S
movetype= A
physics = N
poweradd= 0
velset = 0,0
anim = 1500
sprpriority = 1
ctrl = 0

[state a]
type = varset
trigger1 = time = 0
v = 30
value = 0

;---------------------[コマンド判定]
[state a]
type = varset
trigger1 = time = 0
var(6) = 0

[state a]
type = varset
triggerall = var(59) = 0
trigger1 = time = 0
trigger1 = command = "x"
var(5) = 1

[state a]
type = varset
triggerall = var(59) = 0
trigger1 = time = 0
trigger1 = command = "a"
var(5) = 2

[state a]
type = varset
triggerall = var(59) = 0
trigger1 = time = 0
trigger1 = command = "y"
var(5) = 3

[state a]
type = varset
triggerall = var(59) = 0
trigger1 = time = 0
trigger1 = command = "b"
var(5) = 4

[state a]
type = changeanim
trigger1 = time = 0
trigger1 = var(5) = 4
value = 1501

[State 1500]
type = poweradd 
trigger1 = time = 0
trigger1 = var(5) = 4
value = 50

;---------------------[サウンド]
[State a];ほんっ！
type = PlaySnd
trigger1 = var(5) != 4
trigger1 = animelem = 4
value = 210, 0

;---------------------[ヘルパー]
[state a];
type = Helper
trigger1 = var(5) = 1
trigger1 = animelem = 7
id = 1510
name = "te"
pos = 100,0
postype = p1
stateno = 1510
helpertype = normal
pausemovetime = 0
keyctrl = 0 
ownpal = 1

[state a];
type = Helper
trigger1 = var(5) = 2
trigger1 = animelem = 7
id = 1511
name = "te"
pos = 144,0
postype = p1
stateno = 1510
helpertype = normal
pausemovetime = 0
keyctrl = 0 
ownpal = 1

[state a];
type = Helper
trigger1 = var(5) = 3
trigger1 = animelem = 7
id = 1512
name = "te"
pos = 208,0
postype = p1
stateno = 1510
helpertype = normal
pausemovetime = 0
keyctrl = 0 
ownpal = 1

;---------------------[立ちステートに戻る]
[state a]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;(HELPER)攻撃用ヘルパー
[Statedef 1510]
type = A
ctrl = 0
anim = 1510
velset = 0,0
movetype = A
physics = N
sprpriority = 5

[State -3, 打逆不可防用]
type = AssertSpecial
triggerall = MoveType = A
trigger1 = Enemynear,P2Dist x < 0
flag = unguardable

[state a]
type = turn
trigger1 = time = 0
trigger1 = p2dist x < 0

;---------------------[演出]
[State 210, Width];画面端の押し戻し判定
type = Width
trigger1 = time = 0
edge = 16,16

[State 1];カメラ固定
type = screenbound
trigger1 = time = 0
value = 1
movecamera = 0,0

;---------------------[攻撃]
[State 210, 2]
type = HitDef
trigger1 = ishelper(1510)
trigger1 = time = 0
attr = S, SP
animtype  = hard
damage    = 30*root,fvar(39), 10
priority = 8, Hit
getpower = 0,0
givepower = 7,7
hitflag = MAF
guardflag = M
pausetime = 1,12
sparkno = s7002
sparkxy = -12,-76
hitsound   = s410,1
guardsound = s120,1
guard.sparkno = s7012
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -1.5,-12.2
air.velocity = -1.5,-12.2
yaccel = 0.54
fall = 1
fall.recover = 0
ID = 1510

[State 210, 2]
type = HitDef
trigger1 = ishelper(1511)
trigger1 = time = 0
attr = S, SP
animtype  = hard
damage    = 30*root,fvar(39), 10
priority = 8, Hit
getpower = 0,0
givepower = 7,7
hitflag = MAF
guardflag = M
pausetime = 1,12
sparkno = s7002
sparkxy = -12,-76
hitsound   = s410,1
guardsound = s120,1
guard.sparkno = s7012
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -1.5,-12.2
air.velocity = -1.5,-12.2
yaccel = 0.54
fall = 1
fall.recover = 0
ID = 1511

[State 210, 2]
type = HitDef
trigger1 = ishelper(1512)
trigger1 = time = 0
attr = S, SP
animtype  = hard
damage    = 30*root,fvar(39), 10
priority = 8, Hit
getpower = 0,0
givepower = 7,7
hitflag = MAF
guardflag = M
pausetime = 1,12
sparkno = s7002
sparkxy = -12,-76
hitsound   = s410,1
guardsound = s120,1
guard.sparkno = s7012
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -1.5,-12.2
air.velocity = -1.5,-12.2
yaccel = 0.54
fall = 1
fall.recover = 0
ID = 1512


;---------------------[]
[state a]
type = destroyself
trigger1 = animtime = 0
