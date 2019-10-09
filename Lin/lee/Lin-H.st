;---------------------------------------------------------------------------
;乱舞毒蛾
[Statedef 2000]
type    = S
movetype= A
physics = N
velset = 0,0
poweradd= 0
anim = 2000
ctrl = 0
sprpriority = 1

[State 2000]
type = varset
trigger1 = time = 0
v = 30
value = 0

[State a];点滅
type = palfx
triggerall = time <= 20
triggerall = time % 2 = 0
trigger1 = prevstateno = 1310
trigger2 = prevstateno = 1406
time = 1
add = 256,256,256
color = 1
ignorehitpause = 1

[State SC消费]
type = poweradd
triggerall = time = 0
trigger1 = var(20) = 0
trigger1 = prevstateno = [1000,1999]
value = -1000

[State 正常消费]
type = poweradd
trigger1 = var(20) = 0
trigger1 = time = 0
value = -1000

[state a]
type = varset
trigger1 = time = 0
v = 20
value = 0

;---------------------[コマンド判定]
[state a]
type = varset
trigger1 = time = 0
v = 5
value = 0

[state a]
type = varset
trigger1 = time = 0
v = 6
value = 0

[state a]
type = varset
trigger1 = time = 0
trigger1 = command = "x"
v = 5
value = 0

[state a]
type = varset
trigger1 = time = 0
trigger1 = command = "y"
v = 5
value = 1

[state a]
type = changeanim
trigger1 = time = 0
trigger1 = var(5) = 1
value = 2001

;---------------------[無敵]
[state a]
type = nothitby
trigger1 = animelem = 4,<0
value = SCA
time = 1

;---------------------[超必殺技演出]
[state a]
type = removeexplod
trigger1 = time = 0
id = 3000

[State 2000, 2]
type = Pause
trigger1 = time = 1
time = 28
movetime = 28
anim = -1
darken = 0

[State 1000, 5]
type = Explod
trigger1 = time = 3
anim = 6000
sprpriority = -9999
postype = p1
pos = 11,-74
bindtime = 1
under = 0
ownpal = 1
pausemovetime = 999
supermovetime = 999

[State 1000, 5]
type = Explod
trigger1 = Time = 13
anim = 6001
sprpriority = 3
postype = p1
pos = 11,-74
bindtime = 1
under = 0
ownpal = 1
pausemovetime = 999
supermovetime = 999

[State 3040, 7]
type = EnvColor
trigger1 = time = 1
persistent = 0
ignorehitpause = 1
time = 4
value = 255,255,255
under = 2

[State 3040, 7]
type = EnvColor
trigger1 = time = 5
persistent = 0
ignorehitpause = 1
time = 24
value = 0,0,0
under = 2

[State 2000, 6]
type = PlaySnd
trigger1 = Time = 1
value = 3000,0

;---------------------[効果音]
[State 2000, 6];移動
type = PlaySnd
trigger1 = animelem = 4
value = 1100,0

;---------------------[移動]
[state a]
type = velset
trigger1 = animelem = 4
x = 8.5

;---------------------[エフェクト]
[State 50, 4];残像
type = AfterImage
trigger1 = animelem = 4
time = -1
trans = none
timegap = 2
framegap = 2
length = 5
ignorehitpause = 1
palbright = 3,3,64
;palcontrast = 225,225,225
palpostbright = 0,0,0
paladd = 0,0,0
palmul = 1,1,1

[State a]
type = EnvColor
trigger1 = movehit
persistent = 0
ignorehitpause = 1
time = 1
value = 255,255,255
under = 2

;---------------------[演出]
[State 210, Width];画面端の押し戻し判定
type = Width
trigger1 = animelem = 1
edge = 24,0

;---------------------[攻撃]
[State 210, 2]
type = HitDef
trigger1 = 1
attr = S, HA
animtype  = hard
damage    = 0,0
priority = 8, Hit
getpower = 0,0
hitflag = MAF
guardflag = M
pausetime = 12,13
sparkno = s7002
sparkxy = -24,-52
hitsound   = s410,random%2
guardsound = s120,1
guard.sparkno = s7012
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -4,-6
air.velocity = -4.2,-6
ID = 2000
fall = 1
fall.recover = 0
kill = 0

;---------------------[]
[state a]
type = changestate
trigger1 = movehit
value = 2010

[State 821, 3] 
type = changeState
trigger1 = animtime = 0
trigger2 = moveguarded
value = 2005

;----------------------------------------------------------------------------
; 飛賊奥義 乱舞・毒蛾・終了
[Statedef 2005]
type    = S
movetype= A
physics = N
juggle  = 0
poweradd= 0
;velset = 0,0
anim = 2005
sprpriority = 1
ctrl = 0

;---------------------[コマンド判定]
[State 50, 4];残像
type = AfterImagetime
trigger1 = time = 0
value = 0

;---------------------[演出]
[State 210, Width];画面端の押し戻し判定
type = Width
trigger1 = animelem = 1
edge = 24,0

;---------------------[移動]
[state a]
type = velmul
trigger1 = 1
x = 0.9

;---------------------[立ちステートに戻る]
[state a]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 飛賊奥義 乱舞・毒蛾・ヒット
[Statedef 2010]
type    = S
movetype= A
physics = N
juggle  = 0
poweradd= 0
velset = 0,0
anim = 2010
sprpriority = 1
ctrl = 0

;---------------------[サウンド]
[State a];ワープ
type = PlaySnd
trigger1 = animelem = 74
value = 1100, 0

[State a];アイーン
type = PlaySnd
trigger1 = animelem = 79
value = 1200, 1

[State a];毒
type = PlaySnd
trigger1 = animelem = 80
value = 182, 0



[State a];毒ヒット
type = PlaySnd
trigger1 = animelem = 80,>=0
trigger1 = movehit = 1
value = 2100, 2
persistent = 0
ignorehitpause = 1

;---------------------[エフェクト]
[State explod];毒手
type = Explod
trigger1 = animelem = 80
anim = 2020
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
trigger1 = animelem = 80
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

[State 50, 4];残像
type = AfterImagetime
trigger1 = time = 0
value = 0

[State 1020, 4]
type = EnvShake
trigger1 = animelem = 80
time = 24
ampl = -6
freq = 95
phase = 95

[State a]
type = EnvColor
trigger1 = animelem = 66
trigger2 = animelem = 80
time = 1
value = 255,255,255
under = 2

;---------------------[移動]
[state a]
type = velset
trigger1 = time = 0
x = 1

[state a]
type = velset
trigger1 = animelem = 74
x = 0

;---------------------[無敵]
[State 700, 2];無敵の状態を作る
type = NotHitBy
trigger1 = 1
value = SCA

;---------------------[演出]
[State 210, Width];画面端の押し戻し判定
type = Width
trigger1 = 1
edge = 90,0

;---------------------[攻撃]
[State 210, 2]
type = HitDef
trigger1 = animelem = 2
trigger2 = animelem = 27
trigger3 = animelem = 41
trigger4 = animelem = 49
trigger5 = animelem = 52
trigger6 = animelem = 56
trigger7 = animelem = 61
attr = S, HA
animtype  = hard
damage    = 15,5
priority = 9999, Hit
getpower = 0,0
guardflag = N
pausetime = 0,1
sparkno = s7007
sparkxy = -18,-68
hitsound   = s410,random%2
guardsound = s120,1
guard.sparkno = s7012
ground.type = low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -4,-6
air.velocity = -4.2,-6
ID = 200
nochainID = 9999
fall = 0
fall.recover = 0
kill = 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 210, 2]
type = HitDef
trigger1 = animelem = 11
trigger2 = animelem = 19
trigger3 = animelem = 33
attr = S, HA
animtype  = hard
damage    = 20,5
priority = 9999, Hit
getpower = 0,0
guardflag = N
pausetime = 0,1
sparkno = s7002
sparkxy = -18,-68
hitsound   = s410,random%2
guardsound = s120,1
guard.sparkno = s7012
ground.type = low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -4,-6
air.velocity = -4.2,-6
ID = 200
nochainID = 9999
fall = 0
fall.recover = 0
kill = 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 210, 2]
type = HitDef
trigger1 = animelem = 66
attr = S, HA
animtype  = hard
damage    = 30,5
priority = 9999, Hit
getpower = 0,0
guardflag = N
pausetime = 26,0
sparkno = s7003
sparkxy = -18,-68
hitsound   = s410,random%2
guardsound = s120,1
guard.sparkno = s7012
ground.type = low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -4,-6
air.velocity = -4.2,-6
ID = 200
nochainID = 9999
fall = 0
fall.recover = 0
kill = 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0


[State 210, 2]
type = HitDef
trigger1 = animelem = 80
attr = S, HA
animtype  = diagup
damage    = 50,10
priority = 9999, Hit
getpower = 0,0
givepower = -50,-50
guardflag = N
pausetime = 30,30
sparkno = s7003
sparkxy = -12,-63
hitsound   = s1300,5
guardsound = s120,1
guard.sparkno = s7012
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -8,-9
guard.velocity = -10
air.velocity = -8,-9
yaccel = 0.46
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

;---------------------[相手制御]
[state a]
type = targetbind
trigger1 = animelem = 80,< 0
pos = 68,0

[state a]
type = targetstate
trigger1 = time = 0
trigger2 = animelem = 66,<0
trigger2 = movehit = 1
value = 2015+random%2


[state a]
type = targetstate
trigger1 = animelem = 66,>=0
trigger1 = animelem = 67,<0
trigger1 = movehit = 1
value = 2017
persistent = 0
ignorehitpause = 1

;---------------------[立ちステートに戻る]
[state a]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;(ENEMY)飛賊奥義 乱舞・毒蛾・掴まれ1
[Statedef 2015]
type    = S
movetype= H
physics = N
velset = 0,0
sprpriority = -1

;---------------------[演出]
[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 2015

;---------------------[ステート移行]
[State 821, 3] 
type = SelfState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;(ENEMY)飛賊奥義 乱舞・毒蛾・掴まれ2
[Statedef 2016]
type    = S
movetype= H
physics = N
velset = 0,0
sprpriority = -1

;---------------------[演出]
[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 2016

;---------------------[ステート移行]
[State 821, 3] 
type = SelfState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;(ENEMY)飛賊奥義 乱舞・毒蛾・掴まれ2
[Statedef 2017]
type    = S
movetype= H
physics = N
velset = 0,0
sprpriority = -1

;---------------------[演出]
[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 2017

;---------------------[ステート移行]
[State 821, 3] 
type = changeState
trigger1 = time = 45
value = 2015

;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
; 飛賊奥義 影向
[Statedef 2100]
type    = S
movetype= A
physics = N
velset = 0,0
poweradd= 0
anim = 2100
ctrl = 0
sprpriority = 1


[state a]
type = varset
trigger1 = time = 0
var(30) = 0


[State a]
type = palfx
triggerall = time <= 20
triggerall = time % 2 = 0
trigger1 = prevstateno = 1310
time = 1
add = 256,256,256
color = 1
ignorehitpause = 1

[State SC消费]
type = poweradd
triggerall = time = 0
trigger1 = var(20) = 0
trigger1 = prevstateno = [1000,1999]
value = -1000

[State 正常消费]
type = poweradd
trigger1 = var(20) = 0
trigger1 = time = 0
value = -1000

[state a]
type = varset
trigger1 = time = 0
var(20) = 0


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

;---------------------[無敵]
[state a]
type = nothitby
trigger1 = animelem = 7,>=0
value = SCA
time = 1

;---------------------[効果音]
[State 2000, 6];移動
type = PlaySnd
trigger1 = animelem = 7
value = 2100,0

;---------------------[移動]
[state a]
type = velset
trigger1 = animelem = 1
x = 3.4

;---------------------[エフェクト]
[state a]
type = removeexplod
trigger1 = time = 0
id = 3000

;---------------------[攻撃]
[State a]
type = AttackDist
trigger1 = enemy,stateno != [120,159]
value = 0

[State 800, 1]
type = HitDef
trigger1 = var(5) != 2
trigger1 = p2stateno != 40
Trigger1 = p2stateno != [120,159];150 && 151 && 152 && 153 && 130 && 131 && 140
attr = A, HT
hitflag = M
priority = 5, miss
sparkno = -1
p2facing = 1
p1stateno = 2110
;p2stateno = 2120       ;投げが成功した場合の移動する２Ｐのステート
;hitsound = S800,0
fall = 0            ;落ちる力を２Ｐにかけるか
nochainID = 9999

[State a];当て身
type = ReversalDef
trigger1 = var(5) = 2
attr = S, HT
reversal.attr = SCA, NA, SA, HA
hitflag = MA-
priority = 8, Miss
pausetime = 0,0
sparkno = s-1
hitsound = S-1,0
sparkxy = 5,0
p2facing = 1
p1stateno = 2110
p2stateno = 2120


;---------------------[透過]
[state a]
type = varadd
trigger1 = animelem = 6,>=0
var(6) = 16

[state a]
type = Trans
trigger1 = animelem = 6,>=0
trans = addalpha
alpha = 256-var(6),var(6)

;---------------------[]
[State 821, 3] 
type = changeState
trigger1 = animtime = 0
value = 2101

;---------------------------------------------------------------------------
; 飛賊奥義 影向・失敗
[Statedef 2101]
type    = S
movetype= I
physics = N
juggle = 8
poweradd= 0
anim = 20
ctrl = 0
sprpriority = 1


;---------------------[効果音]
[State 2000, 6];移動
type = PlaySnd
trigger1 = animelem = 1
value = 2100,0

;---------------------[透過]
[state a]
type = varset
trigger1 = time = 0
v = 6
value = 256

[state a]
type = varadd
trigger1 = time <= 16
v = 6
value = -16

[state a]
type = varset
trigger1 = time = 16
v = 6
value = 0


[state a]
type = Trans
trigger1 = time <= 16
trans = addalpha
alpha = 256-var(6),var(6)

;---------------------[]
[State 821, 3] 
type = changeState
trigger1 = time = 50
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 飛賊奥義 影向・成功
[Statedef 2110]
type    = S
movetype= A
physics = N
juggle = 8
poweradd= 0
anim = 2110
velset = 0,0
ctrl = 0
sprpriority = -5

;---------------------[超必殺技演出]
[State 2000, 2]
type = Pause
trigger1 = time = 7
time = 28
movetime = 28
anim = -1
darken = 0

[State 1000, 5]
type = Explod
trigger1 = time = 9
anim = 6000
sprpriority = -9999
postype = p1
pos = 39,-93
bindtime = 1
under = 0
ownpal = 1
pausemovetime = 999
supermovetime = 999

[State 1000, 5]
type = Explod
trigger1 = Time = 19
anim = 6001
sprpriority = 3
postype = p1
pos = 39,-93
bindtime = 1
under = 0
ownpal = 1
pausemovetime = 999
supermovetime = 999

[State 3040, 7]
type = EnvColor
trigger1 = time = 7
persistent = 0
ignorehitpause = 1
time = 4
value = 255,255,255
under = 2

[State 3040, 7]
type = EnvColor
trigger1 = time = 11
persistent = 0
ignorehitpause = 1
time = 24
value = 0,0,0
under = 2

[State 2000, 6]
type = PlaySnd
trigger1 = Time = 7
value = 3000,0

;---------------------[効果音]
[State 2000, 6];掴み
type = PlaySnd
trigger1 = animelem = 5
value = 420,1

[State 2000, 6];斬り
type = PlaySnd
trigger1 = animelem = 8
value = 2100,1

[State 2000, 6];斬り
type = PlaySnd
trigger1 = animelem = 8
value = 2100,2

[State 2000, 6];出血
type = PlaySnd
trigger1 = animelem = 11
value = 2100,3

;---------------------[エフェクト]
[State explod];腕1
type = Explod
trigger1 = animelem = 7
anim = 2111
id = 3000
sprpriority = 2
postype = p1
pos = 0,0
bindtime = -1
supermove = 0
under = 0
ownpal = 1

[State explod];腕2
type = Explod
trigger1 = animelem = 8
anim = 2112
id = 3000
sprpriority = -4
postype = p1
pos = 0,0
bindtime = -1
supermove = 0
under = 0
ownpal = 1

[State explod];斬り
type = Explod
trigger1 = animelem = 8
anim = 2113
id = 3000
sprpriority = 6
postype = p1
pos = 0,0
bindtime = -1
supermove = 0
under = 0
trans = addalpha
alpha = 245,150
ownpal = 1

[State explod];血1
type = Explod
trigger1 = animelem = 11
anim = 2114
id = 3000
sprpriority = 5
postype = p1
pos = 13,-91
bindtime = -1
supermove = 0
under = 0
ownpal = 1

[State explod];血2
type = Explod
trigger1 = animelem = 11
anim = 2115
id = 3000
sprpriority = 5
postype = p1
pos = 7,-85
bindtime = -1
supermove = 0
under = 0
ownpal = 1

;---------------------[相手制御]
[state a]
type = targetstate
trigger1 = time = 0
value = 2120

[state a]
type = bindtotarget
trigger1 = time = 1
pos = 0,0,foot

[state a]
type = posadd
trigger1 = time = 2
x = 8

[state a]
type = targetstate
trigger1 = animelem = 12
value = 2121


[state a]
type = targetlifeadd
trigger1 = animelem = 11
value = -280
absolute = 1


[state a]
type = turn
trigger1 = animelem = 15


[state a]
type = posadd
trigger1 = animelem = 15
x = -8


;---------------------[]
[State 821, 3] 
type = changeState
trigger1 = animtime = 0
value = 0
ctrl = 1




;---------------------------------------------------------------------------
;(ENEMY)飛賊奥義 影向・掴まれ1
[Statedef 2120]
type    = A
movetype= H
physics = N
velset = 0,0
sprpriority = -1

[state a]
type = posset
trigger1 = time = 0
y = 0

;---------------------[演出]
[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 2120

;---------------------[ステート移行]
[State 821, 3] 
type = SelfState
trigger1 = time = 150
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;(ENEMY)飛賊奥義 影向・掴まれ2
[Statedef 2121]
type    = A
movetype= H
physics = N
velset = 0,0
sprpriority = -1

;---------------------[演出]
[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 2120

;---------------------[ステート移行]
[State 821, 3] 
type = changeState
trigger1 = time = 0
value = 5100



;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
; MAX飛賊奥義 乱舞・毒蛾
[Statedef 2200]
type    = S
movetype= A
physics = N
velset = 0,0
poweradd= -1000
anim = 2200
ctrl = 0
sprpriority = 1


[state a]
type = varset
trigger1 = time = 0
v = 30
value = 0

[State a];点滅
type = palfx
triggerall = time <= 20
triggerall = time % 2 = 0
trigger1 = prevstateno = 1310
trigger2 = prevstateno = 1405
time = 1
add = 256,256,256
color = 1
ignorehitpause = 1

[State 非BC状态消费]
type = poweradd
triggerall = var(20) = 0
trigger1 = time = 0
value = -2000

[state a]
type = varset
trigger1 = time = 0
v = 20
value = 0


[state a]
type = varset
trigger1 = time = 0
v = 5
value = 0

[state a]
type = varset
trigger1 = time = 0
v = 6
value = 0

;---------------------[無敵]
[state a]
type = nothitby
trigger1 = animelem = 5,<0
value = SCA
time = 1

;---------------------[超必殺技演出]
[state a]
type = removeexplod
trigger1 = time = 0
id = 3000

[State 2000, 2]
type = Pause
trigger1 = time = 1
time = 28
movetime = 28
anim = -1
darken = 0

[State 1000, 5]
type = Explod
trigger1 = time = 3
anim = 6010
sprpriority = -9999
postype = p1
pos = 11,-74
bindtime = 1
under = 0
ownpal = 1
pausemovetime = 999
supermovetime = 999

[State 1000, 5]
type = Explod
trigger1 = Time = 13
anim = 6011
sprpriority = 3
postype = p1
pos = 11,-74
bindtime = 1
under = 0
ownpal = 1
pausemovetime = 999
supermovetime = 999

[State 3040, 7]
type = EnvColor
trigger1 = time = 1
persistent = 0
ignorehitpause = 1
time = 4
value = 255,255,255
under = 2

[State 3040, 7]
type = EnvColor
trigger1 = time = 5
persistent = 0
ignorehitpause = 1
time = 24
value = 0,0,0
under = 2

[State 2000, 6]
type = PlaySnd
trigger1 = Time = 1
value = 3000,1

;---------------------[効果音]
[State 2000, 6];移動
type = PlaySnd
trigger1 = animelem = 4
value = 1100,0

;---------------------[移動]
[state a]
type = velset
trigger1 = animelem = 4
x = 10;8.5

;---------------------[エフェクト]
[State 50, 4];残像
type = AfterImage
trigger1 = animelem = 4
time = -1
trans = none
timegap = 2
framegap = 2
length = 5
ignorehitpause = 1
palbright = 3,3,64
;palcontrast = 225,225,225
palpostbright = 0,0,0
paladd = 0,0,0
palmul = 1,1,1

[State a]
type = EnvColor
trigger1 = movehit
persistent = 0
ignorehitpause = 1
time = 1
value = 255,255,255
under = 2

;---------------------[演出]
[State 210, Width];画面端の押し戻し判定
type = Width
trigger1 = animelem = 1
edge = 24,0

;---------------------[攻撃]
[State 210, 2]
type = HitDef
trigger1 = 1
attr = S, HA
animtype  = hard
damage    = 0,0
priority = 9, Hit
getpower = 0,0
hitflag = MAF
guardflag = M
pausetime = 12,13
sparkno = s7002
sparkxy = -24,-52
hitsound   = s410,random%2
guardsound = s120,1
guard.sparkno = s7012
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -4,-6
air.velocity = -4.2,-6
ID = 2200
fall = 1
fall.recover = 0
kill = 0

;---------------------[]
[state a]
type = changestate
trigger1 = movehit
value = 2210

[State 821, 3] 
type = changeState
trigger1 = animtime = 0
trigger2 = moveguarded
value = 2005

;---------------------------------------------------------------------------
; MAX飛賊奥義 乱舞・毒蛾・ヒット
[Statedef 2210]
type    = S
movetype= A
physics = N
juggle  = 0
poweradd= 0
velset = 0,0
anim = 2210
sprpriority = 1
ctrl = 0

;---------------------[サウンド]
[State a];ワープ
type = PlaySnd
trigger1 = animelem = 79
value = 1100, 0

[State a];斬！
type = PlaySnd
trigger1 = animelem = 96
value = 1400, 1

[State a];毒
type = PlaySnd
trigger1 = animelem = 85
value = 182, 0



[State a];毒ヒット
type = PlaySnd
trigger1 = animelem = 85,>=0
trigger1 = movehit = 1
value = 2100, 2
persistent = 0
ignorehitpause = 1

;---------------------[エフェクト]
[State explod];毒手
type = Explod
trigger1 = animelem = 85
anim = 2220
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
trigger1 = animelem = 85
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

[State 50, 4];残像
type = AfterImagetime
trigger1 = time = 0
value = 0

[State 1020, 4]
type = EnvShake
trigger1 = animelem = 85
time = 24
ampl = -6
freq = 95
phase = 95

[State a]
type = EnvColor
trigger1 = animelem = 85
time = 1
value = 255,255,255
under = 2

;---------------------[移動]
[state a]
type = velset
trigger1 = time = 0
x = 1

[state a]
type = velset
trigger1 = animelem = 78
x = 0

;---------------------[無敵]
[State 700, 2];無敵の状態を作る
type = NotHitBy
trigger1 = 1
value = SCA

;---------------------[演出]
[State 210, Width];画面端の押し戻し判定
type = Width
trigger1 = 1
edge = 90,0

;---------------------[攻撃]
[State 210, 2]
type = HitDef
trigger1 = animelem = 1
trigger2 = animelem = 4
trigger3 = animelem = 7
trigger4 = animelem = 12
trigger5 = animelem = 28
trigger6 = animelem = 31
trigger7 = animelem = 47
trigger8 = animelem = 50
attr = S, HA
animtype  = hard
damage    = 12,5
priority = 9999, Hit
getpower = 0,0
guardflag = N
pausetime = 0,1
sparkno = s7007
sparkxy = -18,-68
hitsound   = s410,random%2
guardsound = s120,1
guard.sparkno = s7012
ground.type = low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -4,-6
air.velocity = -4.2,-6
ID = 200
nochainID = 9999
fall = 0
fall.recover = 0
kill = 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 210, 2]
type = HitDef
trigger1 = animelem = 20
trigger2 = animelem = 36
attr = S, HA
animtype  = hard
damage    = 12,5
priority = 9999, Hit
getpower = 0,0
guardflag = N
pausetime = 0,1
sparkno = s7002
sparkxy = -18,-68
hitsound   = s410,random%2
guardsound = s120,1
guard.sparkno = s7012
ground.type = low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -4,-6
air.velocity = -4.2,-6
ID = 200
nochainID = 9999
fall = 0
fall.recover = 0
kill = 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 210, 2]
type = HitDef
trigger1 = animelem = 53
trigger2 = animelem = 57
trigger3 = animelem = 61
trigger4 = animelem = 65
trigger5 = animelem = 69
trigger6 = animelem = 73
attr = S, HA
animtype  = hard
damage    = 12,5
priority = 9999, Hit
getpower = 0,0
guardflag = N
pausetime = 0,1
sparkno = s7002
sparkxy = -18,-18
hitsound   = s410,random%2
guardsound = s120,1
guard.sparkno = s7012
ground.type = low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -4,-6
air.velocity = -4.2,-6
ID = 200
nochainID = 9999
fall = 0
fall.recover = 0
kill = 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 210, 2]
type = HitDef
trigger1 = animelem = 85
attr = S, HA
animtype  = hard
damage    = 20,5
priority = 9999, Hit
getpower = 0,0
guardflag = N
pausetime = 0,0
sparkno = s7003
sparkxy = -18,-68
hitsound   = s1300,5
guardsound = s120,1
guard.sparkno = s7012
ground.type = low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -4,-6
air.velocity = -4.2,-6
ID = 200
nochainID = 9999
fall = 0
fall.recover = 0
kill = 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
palfx.time =48
palfx.mul = 100,120,80
palfx.sinadd = 93,115,68,16
palfx.add = -30,-20,-50

;---------------------[ヘルパー]
[state a];毒
type = Helper
trigger1 = animelemtime(96) = 1
id = 2225
name = "kage"
pos = 0,0
postype = p1
stateno = 2225
helpertype = normal
pausemovetime = 0
keyctrl = 0 
ownpal = 1

;---------------------[相手制御]
[state a]
type = targetbind
trigger1 = animelem = 86,< 0
pos = 68,0

[state a]
type = targetstate
trigger1 = time = 0
trigger2 = animelem = 74,<0
trigger2 = movehit = 1
value = 2015+random%2


[state a]
type = targetstate
trigger1 = animelem = 85,>=0
trigger1 = animelem = 86,<0
trigger1 = movehit = 1
value = 2215
persistent = 0
ignorehitpause = 1

;---------------------[立ちステートに戻る]
[state a]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;(ENEMY)MAX飛賊奥義 乱舞・毒蛾・掴まれ1
[Statedef 2215]
type    = S
movetype= H
physics = N
velset = 0,0
sprpriority = -1

[state a]
type = posset
trigger1 = time = 0
y = 0

;---------------------[演出]
[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 2215

;---------------------[ステート移行]
[State 821, 3] 
type = SelfState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;(ENEMY)MAX飛賊奥義 乱舞・毒蛾・掴まれ2
[Statedef 2216]
type    = S
movetype= H
physics = N
velset = -9,0
sprpriority = -1

[state a]
type = posset
trigger1 = time = 0
y = 0

[state a]
type = velmul
trigger1 = 1
x = 0.9

;---------------------[演出]
[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 2216

;---------------------[ステート移行]
[State 821, 3] 
type = SelfState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;(HELPER)MAX飛賊奥義 乱舞・毒蛾・攻撃用ヘルパー
[Statedef 2225]
type = A
ctrl = 0
anim = 2225
velset = 0,0
movetype = A
physics = N
sprpriority = 5

[State a]
type = EnvColor
trigger1 = movehit = 1
time = 1
value = 255,255,255
under = 2

;---------------------[攻撃]
[State 210, 2]
type = HitDef
trigger1 = animelem = 1
trigger2 = animelem = 3
trigger3 = animelem = 5
trigger4 = animelem = 7
attr = S, HP
animtype  = hard
damage    = 20, 10
priority = 8, Hit
getpower = 0,0
givepower = -50,-50
hitflag = MAFLD
guardflag = N
pausetime = 0,0
sparkno = s7002
sparkxy = -12,-68
hitsound   = s2100,2
guardsound = s120,1
guard.sparkno = s7012
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -4,-7.2
air.velocity = -4.5,-7.2
yaccel = 0.47
fall = 0
fall.recover = 0
ID = 2225
nochainID = 9999
palfx.time =32
palfx.mul = 100,120,80
palfx.sinadd = 93,115,68,16
palfx.add = -30,-20,-50
kill = 0

[State 210, 2]
type = HitDef
trigger1 = animelem = 9
attr = S, HP
animtype  = diagup
damage    = 40,10
priority = 9999, Hit
getpower = 0,0
givepower = -50,-50
guardflag = N
pausetime = 0,0
sparkno = s7003
sparkxy = -12,-68
hitsound   = s2100,2
guardsound = s120,1
guard.sparkno = s7012
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -8,-9.5
guard.velocity = -10
air.velocity = -8,-9.5
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


[state a]
type = targetstate
trigger1 = movehit = 1
trigger1 = animelem = 9,<0
value = 2216

;---------------------[]
[state a]
type = destroyself
trigger1 = animtime = 0


;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
; 飛賊奥義 千手羅漢殺
[Statedef 2300]
type    = S
movetype= A
physics = N
velset = 0,0
poweradd= -1000
anim = 2300
ctrl = 0
sprpriority = 1


[state a]
type = varset
trigger1 = time = 0
v = 30
value = 0

[State a]
type = palfx
triggerall = time <= 20
triggerall = time % 2 = 0
trigger1 = prevstateno = 1310
trigger2 = prevstateno = 1405
time = 1
add = 256,256,256
color = 1
ignorehitpause = 1

[State 非BC状态消费]
type = poweradd
triggerall = var(20) = 0
trigger1 = time = 0
value = -2000

[state a]
type = varset
trigger1 = time = 0
v = 20
value = 0

[state a]
type = varset
triggerall = var(59) = 0
trigger1 = time = 0
v = 5
value = 0

[state a]
type = varset
trigger1 = time = 0
v = 6
value = 100


[state a]
type = varset
trigger1 = movehit = 1
v = 6
value = floor(var(6)*0.5)

[state a]
type = varset
trigger1 = var(6) <= 4
v = 6
value = 4

[state a]
type = null;varset
trigger1 = 1
v = 6
value = 100 - var(5)


;---------------------[無敵]
[state a]
type = nothitby
trigger1 = animelem = 5,<0
value = SCA
time = 1

;---------------------[超必殺技演出]
[state a]
type = removeexplod
trigger1 = time = 0
id = 3000

[State 2000, 2]
type = Pause
trigger1 = time = 0
time = 28
movetime = 28
anim = -1
darken = 0

[State 1000, 5]
type = Explod
trigger1 = time = 3
anim = 6010
sprpriority = -9999
postype = p1
pos = -16,-49
bindtime = 1
under = 0
ownpal = 1
pausemovetime = 999
supermovetime = 999

[State 1000, 5]
type = Explod
trigger1 = Time = 13
anim = 6011
sprpriority = 3
postype = p1
pos = -16,-49
bindtime = 1
under = 0
ownpal = 1
pausemovetime = 999
supermovetime = 999

[State 3040, 7]
type = EnvColor
trigger1 = time = 1
persistent = 0
ignorehitpause = 1
time = 4
value = 255,255,255
under = 2

[State 3040, 7]
type = EnvColor
trigger1 = time = 5
persistent = 0
ignorehitpause = 1
time = 24
value = 0,0,0
under = 2

[State 2000, 6]
type = PlaySnd
trigger1 = Time = 1
value = 3000,1

;---------------------[効果音]
[State 2000, 6];千手羅漢殺
type = PlaySnd
trigger1 = animelem = 1
value = 2300,0
[State 2000, 6];千手羅漢殺
type = null;PlaySnd
trigger1 = animelem = 1
value = 2300,0

[State 2000, 6];振り
type = PlaySnd
triggerall = movecontact = 0
trigger1 = animelem = 11
trigger2 = animelem = 13
trigger3 = animelem = 15
trigger4 = animelem = 17
trigger5 = animelem = 19
trigger6 = animelem = 21
value = 850,1

[State 2000, 6];ヒット音
type = null;PlaySnd
trigger1 = movehit = 1
value = 1300,5
channel = 7+random % 3
lowpriority = 1


;---------------------[移動]
[state a]
type = posadd
trigger1 = animelem = 2
x = 16

[state a]
type = posadd
trigger1 = animelem = 8
trigger2 = animelem = 9
x = 14


;---------------------[移動]
[state a]
type = removeexplod
trigger1 = time = 0
id = 3000

;---------------------[攻撃]
[State 210, 2]
type = HitDef
trigger1 = animelem = 12
trigger2 = animelem = 14
trigger3 = animelem = 18
attr = S, HA
animtype  = hard
damage    = 20,8
priority = 11, Hit
getpower = 0,0
guardflag = M
pausetime = 0,13
sparkno = s7002
sparkxy = -24,-60 - random%30
hitsound   = s1300,5+random%2
guardsound = s120,1+random%2
guard.sparkno = s7012
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = 0
air.velocity = -4.2,-6
ID = 200
nochainID = 9999
air.fall = 1
fall.recover = 0


[State 210, 2]
type = HitDef
trigger1 = animelem = 10
trigger2 = animelem = 16
trigger3 = animelem = 20
trigger4 = animelem = 22
attr = S, HA
animtype  = hard
damage    = 20,8
priority = 11, Hit
getpower = 0,0
guardflag = M
pausetime = 0,13
sparkno = s7002
sparkxy = -24,-60 + random%30
hitsound   = s1300,5+random%2
guardsound = s120,1+random%2
guard.sparkno = s7012
ground.type = low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = 0
air.velocity = -4.2,-6
ID = 200
nochainID = 9999
air.fall = 1
fall.recover = 0

;---------------------[]
[State 821, 3]
type = changeState
trigger1 = time = 91
value = 2301

;---------------------------------------------------------------------------
; 飛賊奥義 千手羅漢殺・終了
[Statedef 2301]
type    = S
movetype= A
physics = N
velset = 0,0
juggle = 0
poweradd= 0
anim = 2301
ctrl = 0
sprpriority = 1

;---------------------[エフェクト]
[State 3040, 7]
type = EnvColor
trigger1 = movehit
persistent = 0
ignorehitpause = 1
time = 1
value = 255,255,255
under = 2

;---------------------[移動]
[state a]
type = posadd
trigger1 = animelem = 4
trigger2 = animelem = 9
trigger3 = animelem = 10
trigger4 = animelem = 11
x = -16

;---------------------[攻撃]
[State 210, 2]
type = HitDef
trigger1 = time = 0
attr = S, HA
animtype  = hard
damage    = 40,10
priority = 15, Hit
getpower = 0,0
guardflag = M
pausetime = 0,13
sparkno = s7002
sparkxy = -24,-60 + random%30
hitsound   = s1300,5
guardsound = s120,1
guard.sparkno = s7012
ground.type = high
ground.slidetime = 22
ground.hittime  = 22
ground.velocity = -12
air.velocity = -4.2,-6
ID = 200
nochainID = 9999
air.fall = 1
fall.recover = 0

[state a]
type = targetstate
trigger1 = movehit
persistent = 0
ignorehitpause = 1
value = 996

;---------------------[]
[State 821, 3]
type = changeState
trigger1 = animtime = 0
value = 0
ctrl = 1



;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;MAX2
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
; 飛賊奥義 毒手功
[Statedef 2500]
type    = S
movetype= A
physics = N
velset = 0,0
juggle = 8
poweradd= -1000
anim = 2500
ctrl = 0

[state a]
type = varset
trigger1 = time = 0
v = 30
value = 0

;---------------------[スパキャン]
[State a];点滅
type = palfx
triggerall = time <= 20
triggerall = time % 2 = 0
trigger1 = prevstateno = 1310
time = 1
add = 256,256,256
color = 1
ignorehitpause = 1

[State 非BC状态消费]
type = poweradd
triggerall = var(20) = 0
trigger1 = time = 0
value = -2000

[state a]
type = varset
trigger1 = time = 0
v = 20
value = 0

;---------------------[超必殺技演出]
[state a]
type = removeexplod
trigger1 = time = 0
id = 3000

[State 1];無敵の状態を作る
type = NotHitBy 
trigger1 = animelem = 3,<=0
value = SCA

[State 2000, 2]
type = Pause
trigger1 = time = 1
time = 28
movetime = 28
anim = -1
darken = 0

[State 1000, 5]
type = Explod
trigger1 = time = 3
anim = 6020
sprpriority = -9999
postype = p1
pos = 37,-107
bindtime = 1
under = 0
ownpal = 1
pausemovetime = 999
supermovetime = 999

[State 1000, 5]
type = Explod
trigger1 = Time = 13
anim = 6021
sprpriority = 3
postype = p1
pos = 37,-107
bindtime = 1
under = 0
ownpal = 1
pausemovetime = 999
supermovetime = 999

[State 3040, 7]
type = EnvColor
trigger1 = time = 1
persistent = 0
ignorehitpause = 1
time = 4
value = 255,255,255
under = 2

[State 3040, 7]
type = EnvColor
trigger1 = time = 4
persistent = 0
ignorehitpause = 1
time = 24
value = 0,0,0
under = 2

[State 2000, 6]
type = PlaySnd
trigger1 = Time = 1
value = 3000,2

;---------------------[演出]
[State 1];カメラ固定
type = screenbound
trigger1 = 1
value = 1
movecamera = 1

;---------------------[無敵]
[State 700, 2];無敵の状態を作る
type = NotHitBy
trigger1 = animelem = 3,<0
value = SCA

;---------------------[攻撃]
[State 800, 1]
type = HitDef
Trigger1 = time = 0
trigger1 = p2stateno != 40
Trigger1 = p2stateno != [120,159];150 && 151 && 152 && 153 && 130 && 131 && 140
;trigger1 = p2movetype != H
attr = S, HT
hitflag = M
;guard.dist = -100
priority = 9, miss
sparkno = -1
p2facing = 1
p1stateno = 2510
p2stateno = 2520       ;投げが成功した場合の移動する２Ｐのステート
;hitsound = S800,0
fall = 0            ;落ちる力を２Ｐにかけるか
nochainID = 9999

;---------------------[立ちステートに戻る]
[state a]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;飛賊奥義 毒手功・投げ
[Statedef 2510]
type    = S
movetype= A
physics = N
anim = 2510
juggle  = 8
sprpriority = -3

;---------------------[超必殺技演出]
[State 1];無敵の状態を作る
type = NotHitBy 
trigger1 = 1
value = SCA

[State 2000, 2]
type = Pause
trigger1 = time = 1
time = 28
movetime = 28
anim = -1
darken = 0

[State 1000, 5]
type = Explod
trigger1 = time = 3
anim = 6020
sprpriority = -9999
postype = p1
pos = 37,-107
bindtime = 1
under = 0
ownpal = 1
pausemovetime = 999
supermovetime = 999

[State 1000, 5]
type = Explod
trigger1 = Time = 13
anim = 6021
sprpriority = 3
postype = p1
pos = 37,-107
bindtime = 1
under = 0
ownpal = 1
pausemovetime = 999
supermovetime = 999

[State 3040, 7]
type = EnvColor
trigger1 = time = 1
persistent = 0
ignorehitpause = 1
time = 4
value = 255,255,255
under = 2

[State 3040, 7]
type = EnvColor
trigger1 = time = 4
persistent = 0
ignorehitpause = 1
time = 24
value = 0,0,0
under = 2

[State 2000, 6]
type = PlaySnd
trigger1 = Time = 1
value = 3000,2

;---------------------[演出]
[State a]
type = null;sprpriority
trigger1 = animelem = 3
value = -2

;---------------------[エフェクト]
[State explod];毒手
type = Explod
trigger1 = animelem = 4
anim = 2511
id = 3000
sprpriority =-2
postype = p1
pos = 0,0
bindtime = -1
supermove = 0
ignorehitpause = 0
under = 0

[State explod];血
type = Explod
trigger1 = animelem = 15
trigger2 = animelem = 17
anim = 2115
id = 3000
sprpriority = 5
postype = p1
pos = 45,-116
bindtime = 1
supermove = 0
ignorehitpause = 0
under = 0

[State explod];毒
type = Explod
trigger1 = animelem = 15
anim = 2512
id = 3000
sprpriority = -1
postype = p1
pos = -9,3
bindtime = -1
supermove = 0
under = 0
trans = addalpha
alpha = 245,80
ownpal = 1

[State 3040, 7]
type = EnvColor
trigger1 = animelem = 15
trigger2 = animelemtime(15) = 2
trigger3 = animelemtime(15) = 4
time = 1
value = 255,0,0
under = 2

;---------------------[サウンド]
[State a];気持ち良くなれ…
type = PlaySnd
trigger1 = animelem = 6
value = 2500, 0

[State a];刺し
type = PlaySnd
trigger1 = animelem = 15
value = 2100, 2

[State a];抜き
type = PlaySnd
trigger1 = animelem = 17
value = 2100, 3

[State a];投げ
type = PlaySnd
trigger1 = animelem = 26
value = 850, 1

;---------------------[移動]
[State 210, Width];画面端の押し戻し判定
type = Width
trigger1 = animelem = 1
edge = 75,0

[State 210, Width];画面端の押し戻し判定
type = Width
trigger1 = animelem = 24
edge = 0,50


[state a]
type = posadd
trigger1 = animelem = 22
trigger2 = animelem = 23
trigger3 = animelem = 24
x = -16

;---------------------[ヘルパー]
[state a];MAX2
type = Helper
trigger1 = time = 27
id = 8000
name = "MAX2"
pos = 0,0
postype = p2
stateno = 8000
helpertype = normal
pausemovetime = 0
keyctrl = 0 
ownpal = 1

[state a];カットイン
type = Helper
trigger1 = time = 1
id = 8100
name = "cut"
pos = 0 , 0
postype = p1
stateno = 8100
pausemovetime = 999
supermovetime = 999
helpertype = normal
persistent = 0
ignorehitpause = 1
keyctrl = 0 
ownpal = 1

;---------------------[相手制御]
[State 801, 2]
type = TargetBind
trigger1 = animelem = 1
pos = 35,-90

[State 801, 2]
type = TargetBind
trigger1 = animelem = 2
trigger2 = animelem = 17
pos = 35,-131

[State 801, 2]
type = TargetBind
trigger1 = animelem = 15
pos = 40,-136

[State 801, 2]
type = TargetBind
trigger1 = animelem = 18
pos = 32,-132

[State 801, 2]
type = TargetBind
trigger1 = animelem = 21
pos = 16,-134

[State 801, 2]
type = TargetBind
trigger1 = animelem = 22
trigger2 = animelem = 24
pos = 3,-133

[State 801, 2]
type = TargetBind
trigger1 = animelem = 23
pos = 7,-134

[State 801, 2]
type = TargetBind
trigger1 = animelem = 25
pos = -40,-85

[State 801, 2]
type = TargetBind
trigger1 = animelem = 26
pos = -46,-64


[State 801, 2]
type = Targetlifeadd
trigger1 = animelem = 15
value = -128

[state a]
type = turn
trigger1 = animelem = 32

;---------------------[ヘルパー]
[state a];
type = Helper
trigger1 = animelem = 27
id = 2530
name = "Poison"
pos = 14,12
postype = p2
stateno = 2530
helpertype = normal
pausemovetime = 0
keyctrl = 0 
ownpal = 1

;---------------------[演出]
[State 210, Width];画面端の押し戻し判定
type = Width
trigger1 = 1
edge = 60,0

;---------------------[ステート移行]
[State 821, 3] 
type = changeState
trigger1 = animtime = 0
value = 0
ctrl = 1


;---------------------------------------------------------------------------
;(ENEMY)飛賊奥義 毒手功・掴まれ
[Statedef 2520]
type    = A
movetype= H
physics = N
velset = 0,0
sprpriority = 1

;---------------------[演出]
[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 2520

[State 1];カメラ固定
type = screenbound
trigger1 = 1
value = 1
movecamera = 1


[State a];点滅
type = palfx
trigger1 = animelem = 3
time = 80
mul = 100,120,80
sinadd = 93,115,68,16
add = -30,-20,-50
color = 1
ignorehitpause = 1

;---------------------[速度]
[state a]
type = velset
trigger1 = animelemtime(9) = 1
x = 14
y = 12

[state a]
type = velset
triggerall = Vel Y > 0
trigger1 = Pos Y >= 0
x = 2
y = 20


;---------------------[毒]
[state a]
type = poweradd
trigger1 = animelem = 3
value = -1000

[state a]
type = statetypeset
trigger1 = animelem = 9
movetype = A

[State 210, 2]
type = HitDef
trigger1 = animelem = 9
attr = A, NA
animtype  = light
damage    = 0
priority = 1, Hit
getpower = 0,0
givepower = 0,0
hitflag = MA
guardflag = N
pausetime = 0,0
sparkno = s-1
sparkxy = 0,0
hitsound   = s-1,0
guardsound = s-1,0
guard.sparkno = s-1
ground.type = high
ground.slidetime = 0
ground.hittime  = 9
ground.velocity = 0
guard.velocity = 0
air.velocity = 0,0
ID = 9999
nochainID = 9999
palfx.time =32
palfx.mul = 100,120,80
palfx.sinadd = 93,115,68,16
palfx.add = -30,-20,-50
air.fall = 1
fall.recover = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0

;---------------------[ステート移行]
[State 821, 3] 
type = SelfState
triggerall = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;---------------------------------------------------------------------------
;(HELPER)攻撃用ヘルパー・弱
[Statedef 2530]
type = A
ctrl = 0
anim = 2530
velset = 0,0
movetype = A
physics = N
sprpriority = 5

;---------------------[当身]
[state a];打撃防御
type = reversaldef
trigger1 = time = 0
reversal.attr = A,NA
pausetime = 0,0
sparkno = s-1
sparkxy = 0,0
hitsound = s-1,0
numhits = 0

[state a]
type = statetypeset
trigger1 = time = 2
movetype = I

[state a]
type = posset
trigger1 = time >= 1
x = enemy,pos x
y = enemy,pos y

;---------------------[相手制御]
[state a]
type = targetlifeadd
trigger1 = time % 32 = 0
value = -10
kill = 0
absolute = 1

[state a]
type = hitadd
trigger1 = 1
value = -1

;---------------------[消滅]
[state a]
type = destroyself
trigger1 = win
trigger2 = lose


