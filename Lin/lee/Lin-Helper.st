;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;ヘルパー
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]
;----------------------------------------------------------------------------
;(HELPER)ＫＯ勝利演出・待機
[Statedef 8010]
type = A
ctrl = 0
anim = 8000
velset = 0,0
movetype = I
physics = N
sprpriority = 7

[state a]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = invisible
;---------------------[移動関係]
[state a]
type = bindtoroot
trigger1 = 1
pos = 0,0

;---------------------[透過]
;---------------------[]
[state a]
type = changestate
trigger1 = winko
value = 8011


;----------------------------------------------------------------------------
;(HELPER)ＫＯ勝利演出・通常
[Statedef 8011]
type = A
ctrl = 0
anim = 8000
velset = 0,0
movetype = I
physics = N
sprpriority = 7

[state a]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = invisible
;---------------------[移動関係]
[state a]
type = bindtoroot
trigger1 = 1
pos = 0,0

;---------------------[効果音]
[State 200, 1];
type = PlaySnd
trigger1 = time = 0
value = 12, 0

[State 200, 1];
type = PlaySnd
trigger1 = time = 0
value = 12, 1

;---------------------[エフェクト]
[State 3040, 7];画面フラッシュ
type = EnvColor
trigger1 = time % 9 = 0
trigger1 = time <= 33
;persistent = 0
;ignorehitpause = 1
time = 3
value = 0,0,0
under = 1

[State 3040, 7];画面フラッシュ
type = EnvColor
trigger1 = time % 9 = 3
trigger1 = time <= 33
;persistent = 0
;ignorehitpause = 1
time = 3
value = 255,0,0
under = 1

[State 3040, 7];画面フラッシュ
type = EnvColor
trigger1 = time % 9 = 6
trigger1 = time <= 33
;persistent = 0
;ignorehitpause = 1
time = 3
value = 255,255,255
under = 1





;----------------------------------------------------------------------------
;(HELPER)炎攻撃ヒット
[Statedef 7020]
type = A
ctrl = 0
anim = 8000
velset = 0,0
movetype = I
physics = N
sprpriority = 10

[state a]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = invisible

;---------------------[効果音]
[State 2000, 6];炎
type = PlaySnd
trigger1 = time = 0
value = 1500,2

;---------------------[]
[State explod];炎
type = Explod
trigger1 = 1
anim = 7020+random%3
id = 3000
sprpriority = 10
postype = p1
pos = -40 + random%80,-10 - random%90
bindtime = 1
supermovetime = 28
under = 0
trans = addalpha
alpha = 256,40

;---------------------[ステート移行]
[state a]
type = destroyself
trigger1 = time = 3

;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;ゲージ関連
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;----------------------------------------------------------------------------
;(HELPER)ゲージ
[Statedef 7500]
type = A
ctrl = 0
anim = 8000
velset = 0,0
movetype = I
physics = N
sprpriority = 10

;---------------------[透過]
[state a]
type = null;Trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

;---------------------[]
[state -2,a];ゲージ枠a
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = 1
trigger1 = numexplod(7501) = 0
anim = 7501
id = 7501
postype = back
bindtime = -1
pos = 36,230
sprpriority = 98
removetime = -1
ownpal = 1
ontop = 1

[state -2,a];ゲージ枠a
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = -1
trigger1 = numexplod(7501) = 0
anim = 7501
id = 7501
postype = back
bindtime = -1
pos = 36,230
sprpriority = 98
removetime = -1
ownpal = 1
facing = 1
ontop = 1

[state -2,a];ゲージ枠b
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = 1
trigger1 = numexplod(7502) = 0
anim = 7502
id = 7502
postype = back
bindtime = -1
pos = 36,230
sprpriority = 98
removetime = -1
ownpal = 1
ontop = 1
trans = addalpha
alpha = 250,130

[state -2,a];ゲージ枠b
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = -1
trigger1 = numexplod(7502) = 0
anim = 7502
id = 7502
postype = back
bindtime = -1
pos = 36,230
sprpriority = 98
removetime = -1
ownpal = 1
facing = 1
ontop = 1
trans = addalpha
alpha = 250,130

[state a]
type = removeexplod
trigger1 = RoundState > 2
id = 7501

[state a]
type = removeexplod
trigger1 = RoundState > 2
id = 7502

[state a]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = invisible

;---------------------[ゲージ量]

[state -2,a];ゲージ数0
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = 1
trigger1 = power >= 0
trigger1 = power < 1000
trigger1 = numexplod(7510) = 0
anim = 7510
id = 7510
postype = back
bindtime = -1
pos = 17,230
sprpriority = 97
;removetime = -1
ownpal = 1
ontop = 1

[state -2,a];ゲージ数0
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = -1
trigger1 = power >= 0
trigger1 = power < 1000
trigger1 = numexplod(7510) = 0
anim = 7510
id = 7510
postype = back
bindtime = -1
pos = 16,230
sprpriority = 97
;removetime = -1
facing = -1
ownpal = 1
ontop = 1

[state -2,a];ゲージ数1
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = 1
trigger1 = power >= 1000
trigger1 = power < 2000
trigger1 = numexplod(7511) = 0
anim = 7511
id = 7511
postype = back
bindtime = -1
pos = 17,230
sprpriority = 97
;removetime = -1
ownpal = 1
ontop = 1

[state -2,a];ゲージ数1
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = -1
trigger1 = power >= 1000
trigger1 = power < 2000
trigger1 = numexplod(7511) = 0
anim = 7511
id = 7511
postype = back
bindtime = -1
pos = 16,230
sprpriority = 97
;removetime = -1
facing = -1
ownpal = 1
ontop = 1

[state -2,a];ゲージ数2
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = 1
trigger1 = power >= 2000
trigger1 = power < 3000
trigger1 = numexplod(7512) = 0
anim = 7512
id = 7512
postype = back
bindtime = -1
pos = 17,230
sprpriority = 97
;removetime = -1
ownpal = 1
ontop = 1

[state -2,a];ゲージ数2
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = -1
trigger1 = power >= 2000
trigger1 = power < 3000
trigger1 = numexplod(7512) = 0
anim = 7512
id = 7512
postype = back
bindtime = -1
pos = 16,230
sprpriority = 97
;removetime = -1
facing = -1
ownpal = 1
ontop = 1


[state -2,a];ゲージ数3
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = 1
trigger1 = power >= 3000
trigger1 = power < 4000
trigger1 = numexplod(7513) = 0
anim = 7513
id = 7513
postype = back
bindtime = -1
pos = 17,230
sprpriority = 97
;removetime = -1
ownpal = 1
ontop = 1

[state -2,a];ゲージ数3
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = -1
trigger1 = power >= 3000
trigger1 = power < 4000
trigger1 = numexplod(7513) = 0
anim = 7513
id = 7513
postype = back
bindtime = -1
pos = 16,230
sprpriority = 97
;removetime = -1
facing = -1
ownpal = 1
ontop = 1

[state -2,a];ゲージ数4
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = 1
trigger1 = power >= 4000
trigger1 = power < 5000
trigger1 = numexplod(7514) = 0
anim = 7514
id = 7514
postype = back
bindtime = -1
pos = 17,230
sprpriority = 97
;removetime = -1
ownpal = 1
ontop = 1

[state -2,a];ゲージ数4
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = -1
trigger1 = power >= 4000
trigger1 = power < 5000
trigger1 = numexplod(7514) = 0
anim = 7514
id = 7514
postype = back
bindtime = -1
pos = 16,230
sprpriority = 97
;removetime = -1
facing = -1
ownpal = 1
ontop = 1

[state -2,a];ゲージ数5
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = 1
trigger1 = power >= 5000
trigger1 = power < 6000
trigger1 = numexplod(7515) = 0
anim = 7515
id = 7515
postype = back
bindtime = -1
pos = 17,230
sprpriority = 97
;removetime = -1
ownpal = 1
ontop = 1

[state -2,a];ゲージ数5
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = -1
trigger1 = power >= 5000
trigger1 = power < 6000
trigger1 = numexplod(7515) = 0
anim = 7515
id = 7515
postype = back
bindtime = -1
pos = 16,230
sprpriority = 97
;removetime = -1
facing = -1
ownpal = 1
ontop = 1



[state a];0
type = removeexplod
trigger1 = RoundState > 2
trigger2 = power >= 1000
id = 7510

[state a];1
type = removeexplod
trigger1 = RoundState > 2
trigger2 = power >= 2000
trigger3 = power < 1000
id = 7511

[state a];2
type = removeexplod
trigger1 = RoundState > 2
trigger2 = power >= 3000
trigger3 = power < 2000
id = 7512

[state a];3
type = removeexplod
trigger1 = RoundState > 2
trigger2 = power >= 4000
trigger3 = power < 3000
id = 7513

[state a];4
type = removeexplod
trigger1 = RoundState > 2
trigger2 = power >= 5000
trigger3 = power < 4000
id = 7514

[state a];5
type = removeexplod
trigger1 = RoundState > 2
trigger2 = power >= 6000
trigger3 = power < 5000
id = 7515




[state -2,a];ゲージ量
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = 1
trigger1 = power < 5000;numexplod(7520) = 0
anim = 7520+floor(power*0.001)
id = 7520
postype = left
bindtime = -1
pos = 36,230
sprpriority = 97
;removetime = -1
ownpal = 1
ontop = 1

[state -2,a];ゲージ量
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = -1
trigger1 = power < 5000;numexplod(7520) = 0
anim = 7520+ floor(power*0.001)
id = 7520
postype = right
bindtime = -1
pos = -36,230
sprpriority = 97
;removetime = -1
ownpal = 1
facing = -1
ontop = 1

[state a]
type = removeexplod
trigger1 = RoundState > 2
id = 7520

[state a]
type = ModifyExplod
trigger1 = 1
ID = 7520
scale = power * 0.001 - floor(power*0.001),1



[state -2,a];MAX
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = 1
trigger1 = power >= 5000
trigger1 = numexplod(7525) = 0
anim = 7525
id = 7525
postype = left
bindtime = -1
pos = 36,230
sprpriority = 97
removetime = -1
ownpal = 1
ontop = 1

[state -2,a];MAX
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = -1
trigger1 = power >= 5000
trigger1 = numexplod(7525) = 0
anim = 7526
id = 7525
postype = right
bindtime = -1
pos = -36,230
sprpriority = 97
removetime = -1
ownpal = 1
facing = -1
ontop = 1

[state a]
type = removeexplod
trigger1 = power < 5000
id = 7525

[state a]
type = removeexplod
trigger1 = RoundState > 2
id = 7525


;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;---------------------------------------------------------------------------
;(HELPER)MAXゲージ
[Statedef 7550]
type = A
ctrl = 0
anim = 8000
velset = 0,0
movetype = I
physics = N
sprpriority = 10

;---------------------[]
[state a]
type = varset
trigger1 = time = 0
v = 1
value = 0

[state a]
type = changestate
triggerall = root,movetype != H
trigger1 = root,stateno = 900
trigger2 = root,var(20) = 900
value = 7551

;---------------------------------------------------------------------------
;(HELPER)MAXゲージ
[Statedef 7551]
type = A
ctrl = 0
anim = 8000
velset = 0,0
movetype = I
physics = N
sprpriority = 10

;---------------------[透過]
[state a]
type = null;Trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

;---------------------[]
[state -2,a];ゲージ枠a
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = 1
trigger1 = numexplod(7530) = 0
anim = 7530
id = 7530
postype = back
bindtime = -1
pos = 56,221
sprpriority = 996
removetime = -1
ownpal = 1
;ontop = 1

[state -2,a];ゲージ枠a
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = -1
trigger1 = numexplod(7530) = 0
anim = 7531
id = 7530
postype = back
bindtime = -1
pos = 56,221
sprpriority = 996
removetime = -1
ownpal = 1
facing = 1
;ontop = 1

[state a]
type = ModifyExplod
trigger1 = time <= 33
ID = 7530
scale = 1,var(1)*0.01

[state a]
type = removeexplod
trigger1 = RoundState > 2
id = 7530

;---------------------[]
[state a]
type = varset
trigger1 = time = 0
v = 1
value = 0

[state a]
type = varadd
trigger1 = time <= 4
v = 1
value = 20

[state a]
type = varset
trigger1 = time = 5
v = 1
value = 100

[state a]
type = varadd
trigger1 = time >= 27
v = 1
value = -20

[state a]
type = varset
trigger1 = time = 32
v = 1
value = 100

;---------------------[]
[state a]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = invisible

;---------------------[ゲージ量]
[state -2,a];ゲージ量
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = 1
trigger1 = time >= 32
anim = 7532
id = 7532
postype = left
bindtime = -1
pos = 56,221
sprpriority = 997
;removetime = -1
ownpal = 1
;ontop = 1

[state -2,a];ゲージ量
type = Explod
triggerall = RoundState <= 2
trigger1 = Facing = -1
trigger1 = time >= 32
anim = 7532
id = 7532
postype = right
bindtime = -1
pos = -56,221
sprpriority = 997
;removetime = -1
ownpal = 1
facing = -1
;ontop = 1

[state a]
type = ModifyExplod
trigger1 = 1
ID = 7532
scale = root,var(20) * 0.001112,1

[state a]
type = removeexplod
trigger1 = RoundState > 2
id = 7532

;---------------------[]
[state a]
type = removeexplod
trigger1 = root,var(20) = 0
id = 7530

[state a]
type = removeexplod
trigger1 = root,var(20) = 0
id = 7532

[state a]
type = changestate
trigger1 = root,var(20) = 0
value = 7550



;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;---------------------------------------------------------------------------
;(HELPER)MAX2・カットイン
[Statedef 8100]
type = S
ctrl = 0
anim = 8100
velset = 0,0
movetype = I
physics = N
sprpriority = -95

[state a]
type = posset
trigger1 = facing = 1
x = -160
y = pos y - screenpos y + 95

[state a]
type = posset
trigger1 = facing = -1
x = 160
y = pos y - screenpos y + 95

[state a]
type = varset
trigger1 = time = 0
v = 1
value = 0

[state a]
type = varadd
trigger1 = animelem = 5,>0
v = 1
value = 1

;---------------------[ヘルパー]
[state a];カットイン
type = Helper
trigger1 = time = 0
id = 8105
name = "cut"
pos = 0 , 0
postype = p1
stateno = 8105
pausemovetime = 999
supermovetime = 999
helpertype = normal
persistent = 0
ignorehitpause = 1
keyctrl = 0 
ownpal = 1

;---------------------[透過]
[state a]
type = varadd
trigger1 = animelem = 23,>0
v = 2
value = 1

[state a]
type = angledraw
trigger1 = animelem = 23,>=0
scale = 1.0,1.0 - var(2)*0.1


;---------------------[]
[state a]
type = destroyself
trigger1 = animtime = 0
trigger2 = root,movetype = H

;---------------------------------------------------------------------------
;(HELPER)MAX2・カットイン・顔
[Statedef 8105]
type = S
ctrl = 0
anim = 8105+root,var(1)
velset = 0,0
movetype = I
physics = N
sprpriority = -85

[state a]
type = posset
trigger1 = facing = 1
x = -160 + var(1)*0.1
y = pos y - screenpos y + 95

[state a]
type = posset
trigger1 = facing = -1
x = 160 - var(1)*0.1
y = pos y - screenpos y + 95

[state a]
type = varset
trigger1 = time = 0
v = 1
value = 0

[state a]
type = varadd
trigger1 = animelem = 5,>0
v = 1
value = 1

[state a]
type = varadd
trigger1 = animelem = 5
v = 1
value = 320

;---------------------[透過]
[state a]
type = varadd
trigger1 = animelem = 6,>0
v = 2
value = 1

[state a]
type = angledraw
trigger1 = animelem = 6,>=0
scale = 1.0,1.0 - var(2)*0.1


;---------------------[]
[state a]
type = destroyself
trigger1 = animtime = 0
trigger2 = root,movetype = H


;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;勝利画面
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]
;----------------------------------------------------------------------------
;(HELPER)勝利画面
[Statedef 8500]
type = A
ctrl = 0
anim = 8000
velset = 0,0
movetype = I
physics = N
sprpriority = 7

[state a]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = invisible

;---------------------[変数]
[state a]
type = varset
trigger1 = 1
v = 5
value = root,var(9)

;---------------------[移動関係]
[state a]
type = bindtoroot
trigger1 = 1
pos = 0,0

;---------------------[サウンド]
[State a];
type = PlaySnd
trigger1 = time = 84
value = 8500, 0

[State a];
type = PlaySnd
trigger1 = time = 325
value = 8500, 1

;---------------------[演出]
[State 181, 4]
type = AssertSpecial
trigger1 = time = [0,600]
flag = roundnotover

[state a]
type = AssertSpecial
trigger1 = time >= 32
flag = nomusic

[state a]
type = null;SuperPause
trigger1 = time  = 32;>= 32
time = 230
movetime = 230
darken = 0

;---------------------[エフェクト]
[state a]
type = varadd
trigger1 = time <= 32
trigger2 = time >= 172
trigger2 = time < 204
v = 1
value = 8

[state a]
type = varset
trigger1 = time = 32
v = 1
value = 256

[state a]
type = varset
trigger1 = time = 172
v = 1
value = -256

[state a]
type = varadd
trigger1 = time >= 108
trigger1 = time < 172
v = 1
value = -8

[State a];暗転
type = AllPalfx
trigger1 = time <= 32
trigger2 = time >= 140
trigger2 = time < 204
time = 1
add = var(1),var(1),var(1)
invertall = 0
color = 256

;---------------------[エフェクト]
[State a];
type = Explod
trigger1 = time = 32
anim = 8500
id = 8500
sprpriority = 3
postype = left
pos = 0,0
bindtime = -1
under = 0
ownpal = 1
pausemovetime = 99999
supermovetime = 99999
ontop = 1
scale = 9999,9999

[State a];player won the match
type = Explod
trigger1 = time = 64
anim = 8501
id = 8500
sprpriority = 3
postype = left
pos = 56,118
bindtime = -1
under = 0
ownpal = 1
pausemovetime = 99999
supermovetime = 99999
ontop = 1

[state a]
type = removeexplod
trigger1 = time = 172
id = 8500


[State a];黒背景
type = Explod
trigger1 = time = 172
anim = 8504
;id = 8504
sprpriority = 3
postype = left
pos = 0,0
bindtime = -1
under = 0
ownpal = 1
pausemovetime = 99999
supermovetime = 99999
scale = 999999,999999
ontop = 1

[State a];背景
type = Explod
trigger1 = time = 172
anim = 8508
sprpriority = 3
postype = left
pos = 0,0
bindtime = -1
under = 0
ownpal = 1
pausemovetime = 99999
supermovetime = 99999
ontop = 1

[State a];黒背景
type = Explod
trigger1 = time = 172
anim = 8504
id = 8504
sprpriority = 3
postype = left
pos = 0,0
bindtime = -1
under = 0
ownpal = 1
pausemovetime = 99999
supermovetime = 99999
scale = 999999,999999
ontop = 1

[state a]
type = removeexplod
trigger1 = time = 238
id = 8504

[State a];上枠１
type = Explod
trigger1 = time = 172
anim = 8502
sprpriority = 3
postype = left
pos = 0,0
bindtime = -1
under = 0
ownpal = 1
pausemovetime = 99999
supermovetime = 99999
ontop = 1

[State a];上枠２
type = Explod
trigger1 = time = 172
anim = 8503
sprpriority = 3
postype = left
pos = 0,0
bindtime = -1
under = 0
ownpal = 1
pausemovetime = 99999
supermovetime = 99999
ontop = 1

[State a];黒背景2
type = Explod
trigger1 = time = 238
anim = 8504
sprpriority = 3
postype = left
pos = 0,42
vel = 0,12
bindtime = 1
under = 0
ownpal = 1
removetime = 30
pausemovetime = 99999
supermovetime = 99999
scale = 999999,999999
ontop = 1
trans = addalpha
alpha = 255,192

[State a];黒背景2
type = Explod
trigger1 = time = 238
anim = 8504
sprpriority = 3
postype = left
pos = 0,46
vel = 0,12
bindtime = 1
under = 0
ownpal = 1
removetime = 30
pausemovetime = 99999
supermovetime = 99999
scale = 999999,999999
ontop = 1
trans = addalpha
alpha = 255,192

[State a];黒背景2
type = Explod
trigger1 = time = 238
anim = 8504
sprpriority = 3
postype = left
pos = 0,50
vel = 0,12
bindtime = 1
under = 0
ownpal = 1
removetime = 30
pausemovetime = 99999
supermovetime = 99999
scale = 999999,999999
ontop = 1
trans = addalpha
alpha = 255,192

[State a];黒背景2
type = Explod
trigger1 = time = 238
anim = 8504
sprpriority = 3
postype = left
pos = 0,54
vel = 0,12
bindtime = 1
under = 0
ownpal = 1
removetime = 30
pausemovetime = 99999
supermovetime = 99999
scale = 999999,999999
ontop = 1
trans = addalpha
alpha = 255,0


[State a];下枠１
type = Explod
trigger1 = time = 250
anim = 8507
id = 8507
sprpriority = 3
postype = left
pos = 0,208
bindtime = -1
under = 0
ownpal = 1
pausemovetime = 99999
supermovetime = 99999
ontop = 1

[state a]
type = varadd
trigger1 = time >= 252
trigger1 = time < 259
v = 2
value = 14

[state a]
type = ModifyExplod
trigger1 = 1
ID = 8507
scale = 999999,var(2)*0.01

[State a];下枠２
type = Explod
trigger1 = time = 250
anim = 8505
sprpriority = 3
postype = left
pos = 0,0
bindtime = -1
under = 0
ownpal = 1
pausemovetime = 99999999
supermovetime = 99999999
ontop = 1

[State a];下枠３
type = Explod
trigger1 = time = 250
anim = 8506
sprpriority = 3
postype = left
pos = 0,0
bindtime = -1
under = 0
ownpal = 1
pausemovetime = 99999999
supermovetime = 99999999
ontop = 1

[State a];WINNER
type = Explod
trigger1 = time = 270
anim = 8509
sprpriority = 3
postype = left
pos = 0,0
bindtime = -1
under = 0
ownpal = 1
pausemovetime = 99999999
supermovetime = 99999999
ontop = 1

[State a];麟
type = Explod
trigger1 = time = 270
anim = 8511
sprpriority = 3
postype = left
pos = 0,0
bindtime = -1
under = 0
ownpal = 1
pausemovetime = 99999999
supermovetime = 99999999
ontop = 1

[State a];LIN
type = Explod
trigger1 = time = 250
anim = 8510
sprpriority = 3
postype = left
pos = 0,0
bindtime = -1
under = -1
ownpal = 1
pausemovetime = 99999999
supermovetime = 99999999
ontop = 1

;---------------------[エフェクト]
[state a]
type = varset
trigger1 = time = 269
v = 1
value = 256

[state a]
type = varadd
trigger1 = time >= 271
trigger1 = time < 335
v = 1
value = -4

[State a];暗転
type = AllPalfx
trigger1 = time >= 269
trigger1 = time < 335
time = 1
add = var(1),var(1),var(1)
invertall = 0
color = 256

;---------------------[エフェクト]
[State a];カーソル？
type = Explod
trigger1 = time = 250
anim = 8515
sprpriority = 3
postype = left
pos = 21,192
bindtime = -1
under = -1
ownpal = 1
pausemovetime = 99999999
supermovetime = 99999999
ontop = 1

[state a]
type = varset
trigger1 = time = 0
v = 6
value = random%3

[State a];セリフ・汎用
type = Explod
trigger1 = time = 250
trigger1 = var(5) = 0
anim = 8520 + var(6)
sprpriority = 3
postype = left
pos = 0,0
bindtime = -1
under = -1
ownpal = 1
pausemovetime = 99999999
supermovetime = 99999999
ontop = 1

[State a];カーソル・汎用
type = Explod
trigger1 = time = 250
trigger1 = var(5) = 0
anim = 8530 + var(6)
sprpriority = 3
postype = left
pos = 0,0
bindtime = -1
under = -1
ownpal = 1
pausemovetime = 99999999
supermovetime = 99999999
ontop = 1


[State a];セリフ・特殊イントロ
type = Explod
trigger1 = time = 250
trigger1 = var(5) > 0
anim = 8520 + var(5)
sprpriority = 3
postype = left
pos = 0,0
bindtime = -1
under = -1
ownpal = 1
pausemovetime = 99999999
supermovetime = 99999999
ontop = 1

[State a];カーソル・特殊イントロ
type = Explod
trigger1 = time = 250
trigger1 = var(5) > 0
anim = 8530 + var(5)
sprpriority = 3
postype = left
pos = 0,0
bindtime = -1
under = -1
ownpal = 1
pausemovetime = 99999999
supermovetime = 99999999
ontop = 1




;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
; MAX2
[Statedef 8000]
type = A
movetype = I
physics = N
anim = 8000
velset = 0, 0
ctrl = 0
sprpriority = -99

[State 3020, 1]
type = AssertSpecial
trigger1 = 1
flag = NoBG
flag2 = NoFG
ignorehitpause = 1

[State 191, Wood 1]
type = Explod
trigger1 = time = 0
anim = 8001
id = 8000
postype = back
pos = 0, 0
bindtime = -1
removetime = -1
sprpriority = -999
supermovetime = 999

[State 191, Wood 1]
type = Explod
trigger1 = time = 0
anim = 8001
id = 8000
postype = back
pos = -320, 0
bindtime = -1
removetime = -1
sprpriority = -999
supermovetime = 999

[State 191, Wood 1]
type = Explod
trigger1 = time = 0
anim = 8002
id = 8000
postype = back
pos = 0, 0
bindtime = -1
removetime = -1
sprpriority = -999
supermovetime = 999

[State 191, Wood 1]
type = Explod
trigger1 = time = 0
anim = 8002
id = 8000
postype = back
pos = -320, 0
bindtime = -1
removetime = -1
sprpriority = -999
supermovetime = 999

[State 191, Wood 1]
type = Explod
trigger1 = time = 0
anim = 8003
id = 8000
postype = back
pos = 0, 0
bindtime = -1
removetime = -1
sprpriority = -999
supermovetime = 999

[State 191, Wood 1]
type = Explod
trigger1 = time = 0
anim = 8003
id = 8000
postype = back
pos = -320, 0
bindtime = -1
removetime = -1
sprpriority = -999
supermovetime = 999

[State 191, Wood 1]
type = Explod
trigger1 = time = 0
anim = 8004
id = 8000
postype = back
pos = 0, 0
bindtime = -1
removetime = -1
sprpriority = -999
supermovetime = 999

[State 191, Wood 1]
type = Explod
trigger1 = time = 0
anim = 8004
id = 8000
postype = back
pos = -320, 0
bindtime = -1
removetime = -1
sprpriority = -999
supermovetime = 999

[State 191, Wood 1]
type = Explod
trigger1 = time = 0
anim = 8005
id = 8000
postype = back
pos = 0, 0
bindtime = -1
removetime = -1
sprpriority = -999
supermovetime = 999

[State 191, Wood 1]
type = Explod
trigger1 = time = 0
anim = 8005
id = 8000
postype = back
pos = -320, 0
bindtime = -1
removetime = -1
sprpriority = -999
supermovetime = 999


[State 191, Wood 1]
type = Explod
trigger1 = time = 0
anim = 8006
id = 8000
postype = back
pos = 0, 0
bindtime = -1
removetime = -1
sprpriority = -999
supermovetime = 999

[State 191, Wood 1]
type = Explod
trigger1 = time = 0
anim = 8006
id = 8000
postype = back
pos = -320, 0
bindtime = -1
removetime = -1
sprpriority = -999
supermovetime = 999


[State 191, Wood 1]
type = Explod
trigger1 = time = 0
anim = 8007
id = 8000
postype = back
pos = 0, 0
bindtime = -1
removetime = -1
sprpriority = -999
supermovetime = 999

[State 191, Wood 1]
type = Explod
trigger1 = time = 0
anim = 8007
id = 8000
postype = back
pos = -320, 0
bindtime = -1
removetime = -1
sprpriority = -999
supermovetime = 999


[State 3020, 1]
type = null;RemoveExplod
trigger1 = root,StateNo != [2500,2999]
ID = 8000

[State 3020, 1]
type = changestate
trigger1 = root,StateNo != [2500,2999]
trigger2 = root,stateno = 2510
trigger2 = root,animelem = 15
value = 8001

;-------------------------------
[Statedef 8001]
type = A
movetype = I
physics = N
anim = 8000
velset = 0, 0
ctrl = 0
sprpriority = -99

[State 3020, 1]
type = null;AssertSpecial
trigger1 = 1
flag = NoBG
flag2 = NoFG
ignorehitpause = 1

;---------------------[エフェクト]
[state a]
type = varset
trigger1 = time = 0
v = 1
value = 256

[state a]
type = varadd
trigger1 = time <= 32
v = 1
value = -8

[State a];暗転
type = BGPalfx
trigger1 = time <= 32
time = 1
add = var(1),var(1),var(1)
invertall = 0
color = 256

;---------------------[効果音]
[State a];我
type = PlaySnd
trigger1 = time = 0
value = 8000,0

[State 191, Wood 1]
type = Explod
trigger1 = time = 0
anim = 8010
id = 8010
postype = back
pos = 0, 0
bindtime = -1
sprpriority = -999
supermovetime = 999
trans = addalpha
alpha = 245,150

[State 3020, 1]
type = RemoveExplod
trigger1 = time = 0
ID = 8000

[State 3020, 1]
type = DestroySelf
trigger1 = time = 32;root,StateNo != [2500,2999]


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