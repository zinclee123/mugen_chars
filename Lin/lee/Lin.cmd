;-| Button Remapping |-----------------------------------------------------
; This section lets you remap the player's buttons (to easily change the
; button configuration). The format is:
;   old_button = new_button
; If new_button is left blank, the button cannot be pressed.
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 15

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1


;-| Super Motions |--------------------------------------------------------
[Command]
name = "飛賊奥義 毒手功"
command = ~D, D, D, a+b
time = 20


[Command]
name = "飛賊奥義 千手羅漢殺"
command = ~D, D, D, x+y
time = 20


[Command]
name = "飛賊奥義 影向"
command = ~B, D, F, B, D, F, b
time = 35

[Command]
name = "飛賊奥義 影向"
command = ~B, D, F, B, D, F, a
time = 35



[Command]
name = "MAX飛賊奥義 乱舞・毒蛾"
command = ~D, B, D, F, x+y
time = 25


[Command]
name = "飛賊奥義 乱舞・毒蛾"
command = ~D, B, D, F, y
time = 25

[Command]
name = "飛賊奥義 乱舞・毒蛾"
command = ~D, B, D, F, x
time = 25



;-| Special Motions |------------------------------------------------------
[Command]
name = "飛義八極拳・打開"
command = ~F, D, B, y;~F, D, DF, b

[Command]
name = "飛義八極拳・打開"
command = ~F, D, B, x;~F, D, DF, a


[Command]
name = "蛇突牙"
command = ~B, D, DB, b

[Command]
name = "蛇突牙"
command = ~B, D, DB, a

[Command]
name = "蛇突牙"
command = ~B, D, DB, y

[Command]
name = "蛇突牙"
command = ~B, D, DB, x


[Command]
name = "無影紅砂手"
command = ~F, D, DF, y

[Command]
name = "無影紅砂手"
command = ~F, D, DF, x


[Command]
name = "特殊那義"
command = ~B, D, F , b

[Command]
name = "特殊那義"
command = ~B, D, F , a

[Command]
name = "特殊那義"
command = ~B, D, F , y

[Command]
name = "特殊那義"
command = ~B, D, F , x


[Command]
name = "鉄斬舞 那義"
command = ~F, D, B, y

[Command]
name = "鉄斬舞 那義"
command = ~F, D, B, x


[Command]
name = "鉄斬舞 羅殺"
command = ~D, F, y

[Command]
name = "鉄斬舞 羅殺"
command = ~D, F, x


[Command]
name = "飛天脚・強"
command = ~F, D, B , b

[Command]
name = "飛天脚・弱"
command = ~F, D, B , a


[Command]
name = "飛毛脚"
command = ~B, D, F , b

[Command]
name = "飛毛脚"
command = ~B, D, F , a



[Command]
name = "翳"
command = ~D, B, y

[Command]
name = "翳"
command = ~D, B, x


[Command]
name = "緊急回避前"
command = x+a
time = 1

[Command]
name = "緊急回避前"
command = z
time = 1

[Command]
name = "緊急回避後"
command = /$B,x+a
time = 1

[Command]
name = "緊急回避後"
command = /$B,z
time = 1

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1

[Command]
name = "ふっ飛ばし"
command = c
time = 1

[Command]
name = "ふっ飛ばし"
command = y+b
time = 1

[Command]
name = "MAX"
command = y+a
time = 1

[Command]
name = "おしっぱなしx"
command = /$x
time = 1

[Command]
name = "おしっぱなしy"
command = /$y
time = 1

[Command]
name = "おしっぱなしa"
command = /$a
time = 1

[Command]
name = "おしっぱなしb"
command = /$b
time = 1

[Command]
name = "おしっぱなしz"
command = /$z
time = 1

[Command]
name = "おしっぱなしc"
command = /$c
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = s
time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1



; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]

;===========================================================================
;---------------------------------------------------------------------------
;飛賊奥義 毒手功
[State Hizokuougi Dokushukou]
type = ChangeState
value = 2500
triggerall = var(59) = 0
triggerall = command = "飛賊奥義 毒手功"
triggerall = power >= 3000 || (var(20) > 0 && power >= 1000 )
triggerall = life <= 300
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 215 && animelem = 4,>=0
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && time >= 1
trigger9 = stateno = 250 && movecontact
trigger10= stateno = 290 && movecontact
trigger11= stateno = 450 && movecontact

trigger12= stateno = 1310 && movecontact
trigger12= power >= 4000 || (var(20) > 0 && power >= 2000 )


;===========================================================================
;---------------------------------------------------------------------------
;飛賊奥義 千手羅漢殺
[State Hizokuougi SenjuRakansatu]
type = ChangeState
value = 2300
triggerall = var(59) = 0
triggerall = command = "飛賊奥義 千手羅漢殺"
triggerall = power >= 3000 || (var(20) > 0 && power >= 1000 )
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 215 && animelem = 4,>=0
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && time >= 1
trigger9 = stateno = 250 && movecontact
trigger10= stateno = 290 && movecontact
trigger11= stateno = 450 && movecontact

trigger12= stateno = 1310 && movecontact
trigger12= power >= 4000 || (var(20) > 0 && power >= 2000 )


;---------------------------------------------------------------------------
;MAX飛賊奥義 乱舞・毒蛾
[State Hizokuougi Ranbu Dokuga]
type = ChangeState
value = 2200
triggerall = var(59) = 0
triggerall = command = "MAX飛賊奥義 乱舞・毒蛾"
triggerall = power >= 3000 || (var(20) > 0 && power >= 1000 )
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 215 && animelem = 4,>=0
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && time >= 1
trigger9 = stateno = 250 && movecontact
trigger10= stateno = 290 && movecontact
trigger11= stateno = 450 && movecontact

trigger12= stateno = 1310 && movecontact
trigger12= power >= 4000 || (var(20) > 0 && power >= 2000 )



;---------------------------------------------------------------------------
;飛賊奥義 影向
[State Hizokuougi Eikou]
type = ChangeState
value = 2100
triggerall = var(59) = 0
triggerall = command = "飛賊奥義 影向"
triggerall = power >= 1000 || var(20) > 0
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 215 && animelem = 4,>=0
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && time >= 1
trigger9 = stateno = 250 && movecontact
trigger10= stateno = 290 && movecontact
trigger11= stateno = 450 && movecontact

trigger12= stateno = 1310 && movecontact
trigger12= power >= 2000 || (var(20) > 0 && power >= 1000 )


;---------------------------------------------------------------------------
;飛賊奥義 乱舞・毒蛾
[State Hizokuougi Ranbu Dokuga]
type = ChangeState
value = 2000
triggerall = var(59) = 0
triggerall = command = "飛賊奥義 乱舞・毒蛾"
triggerall = power >= 1000 || var(20) > 0
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 215 && animelem = 4,>=0
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && time >= 1
trigger9 = stateno = 250 && movecontact
trigger10= stateno = 290 && movecontact
trigger11= stateno = 450 && movecontact

trigger12= stateno = 1310 && movecontact
trigger12= power >= 2000 || (var(20) > 0 && power >= 1000 )


;===========================================================================
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------

;飛義八極拳・打開
[State Higihakkyokuken Dakai]
type = ChangeState
value = 1600
triggerall = var(59) = 0
triggerall = command = "飛義八極拳・打開"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 215 && animelem = 4,>=0
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && time >= 1
trigger9 = stateno = 250 && movecontact
trigger10= stateno = 290 && movecontact
trigger11= stateno = 450 && movecontact

;---------------------------------------------------------------------------
;蛇突牙
[State Jatotuga]
type = ChangeState
value = 1500
triggerall = var(59) = 0
triggerall = command = "蛇突牙"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 215 && animelem = 4,>=0
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && time >= 1
trigger9 = stateno = 250 && movecontact
trigger10= stateno = 290 && movecontact
trigger11= stateno = 450 && movecontact


;---------------------------------------------------------------------------
;無影紅砂手・どこでもキャンセル
[State Muei Kousashu DC]
type = ChangeState
value = 1400
triggerall = var(59) = 0
triggerall = command = "無影紅砂手"
triggerall = statetype != A
triggerall = var(20) > 0
trigger1 = stateno = 210
trigger2 = stateno = 230
trigger3 = stateno = 240
trigger4 = stateno = 430
trigger5 = stateno = 440

trigger6 = stateno = 1300 && movecontact
trigger7 = stateno = 1310 && movecontact
trigger8 = stateno = 1320 && movecontact
trigger9 = stateno = 1600 && movecontact

;---------------------------------------------------------------------------
;無影紅砂手
[State Muei Kousashu]
type = ChangeState
value = 1400
triggerall = var(59) = 0
triggerall = command = "無影紅砂手"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 215 && animelem = 4,>=0
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && time >= 1
trigger9 = stateno = 250 && movecontact
trigger10= stateno = 290 && movecontact
trigger11= stateno = 450 && movecontact



;---------------------------------------------------------------------------
;鉄斬舞 羅殺・どこでもキャンセル
[State Tetuzanbu Rasatu DC]
type = ChangeState
value = 1300
triggerall = var(59) = 0
triggerall = command = "鉄斬舞 羅殺"
triggerall = statetype != A
triggerall = var(20) > 0
trigger1 = stateno = 210
trigger2 = stateno = 230
trigger3 = stateno = 240
trigger4 = stateno = 430
trigger5 = stateno = 440

trigger6 = stateno = 1600 && movecontact

;---------------------------------------------------------------------------
;鉄斬舞 羅殺
[State Tetuzanbu Rasatu]
type = ChangeState
value = 1300
triggerall = var(59) = 0
triggerall = command = "鉄斬舞 羅殺"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 215 && animelem = 4,>=0
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && time >= 1
trigger9 = stateno = 250 && movecontact
trigger10= stateno = 290 && movecontact
trigger11= stateno = 450 && movecontact


;---------------------------------------------------------------------------
;飛天脚・強・どこでもキャンセル
[State Hiten kyaku DC]
type = ChangeState
value = 1220
triggerall = var(59) = 0
triggerall = command = "飛天脚・強"
triggerall = statetype != A
triggerall = var(20) > 0
trigger1 = stateno = 210
trigger2 = stateno = 230
trigger3 = stateno = 240
trigger4 = stateno = 430
trigger5 = stateno = 440

trigger6 = stateno = 1300 && movecontact
trigger7 = stateno = 1310 && movecontact
trigger8 = stateno = 1320 && movecontact
trigger9 = stateno = 1600 && movecontact

;---------------------------------------------------------------------------
;飛天脚・強
[State Hiten kyaku]
type = ChangeState
value = 1220
triggerall = var(59) = 0
triggerall = command = "飛天脚・強"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 215 && animelem = 4,>=0
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && time >= 1
trigger9 = stateno = 250 && movecontact
trigger10= stateno = 290 && movecontact
trigger11= stateno = 450 && movecontact



;---------------------------------------------------------------------------
;飛天脚・弱・どこでもキャンセル
[State Hiten kyaku DC]
type = ChangeState
value = 1200
triggerall = var(59) = 0
triggerall = command = "飛天脚・弱"
triggerall = statetype != A
triggerall = var(20) > 0
trigger1 = stateno = 210
trigger2 = stateno = 230
trigger3 = stateno = 240
trigger4 = stateno = 430
trigger5 = stateno = 440

trigger6 = stateno = 1300 && movecontact
trigger7 = stateno = 1310 && movecontact
trigger8 = stateno = 1320 && movecontact
trigger9 = stateno = 1600 && movecontact

;---------------------------------------------------------------------------
;飛天脚・弱
[State Hiten kyaku]
type = ChangeState
value = 1200
triggerall = var(59) = 0
triggerall = command = "飛天脚・弱"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 215 && animelem = 4,>=0
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && time >= 1
trigger9 = stateno = 250 && movecontact
trigger10= stateno = 290 && movecontact
trigger11= stateno = 450 && movecontact



[State -1,Test]
type = ChangeState
value = 1400
triggerall = var(59) = 0
triggerall = command = "start"
triggerall = statetype != A
trigger1 = ctrl
trigger1 = var(5) := 1

;---------------------------------------------------------------------------
;飛毛脚・どこでもキャンセル
[State Himou kyaku DC]
type = ChangeState
value = 1100
triggerall = var(59) = 0
triggerall = command = "飛毛脚"
triggerall = statetype != A
triggerall = var(20) > 0
trigger1 = stateno = 210
trigger2 = stateno = 230
trigger3 = stateno = 240
trigger4 = stateno = 430
trigger5 = stateno = 440

trigger6 = stateno = 1300 && movecontact
trigger7 = stateno = 1310 && movecontact
trigger8 = stateno = 1320 && movecontact
trigger9 = stateno = 1600 && movecontact


;---------------------------------------------------------------------------
;飛毛脚
[State Himou kyaku]
type = ChangeState
value = 1100
triggerall = var(59) = 0
triggerall = command = "飛毛脚"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 215 && animelem = 4,>=0
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && time >= 1
trigger9 = stateno = 250 && movecontact
trigger10= stateno = 290 && movecontact
trigger11= stateno = 450 && movecontact

;---------------------------------------------------------------------------
;翳
[State Kage]
type = ChangeState
value = 1000
triggerall = var(59) = 0
triggerall = command = "翳"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 215 && animelem = 4,>=0
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && time >= 1
trigger9 = stateno = 250 && movecontact
trigger10= stateno = 290 && movecontact
trigger11= stateno = 450 && movecontact

;===========================================================================
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;ガードキャンセルふっ飛ばし攻撃
[State -1, 290]
type = ChangeState
value = 291
triggerall = var(59) = 0
triggerall = command = "ふっ飛ばし"
triggerall = power >= 500
trigger1 = stateno = 150
trigger2 = stateno = 151

;---------------------------------------------------------------------------
;ふっ飛ばし攻撃
[State -1, 290]
type = ChangeState
value = 290
triggerall = var(59) = 0
triggerall = command = "ふっ飛ばし"
triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;空中ふっ飛ばし攻撃
[State -1, Jump Strong Kick]
type = ChangeState
value = 690
triggerall = var(59) = 0
triggerall = command = "ふっ飛ばし"
trigger1 = statetype = A
trigger1 = stateno != 106
trigger1 = ctrl


;---------------------------------------------------------------------------
;MAX発動
[State -1, Jump Strong Kick]
type = ChangeState
value = 900
triggerall = var(59) = 0
triggerall = command = "MAX"
triggerall = statetype != A
triggerall = power >= 1000
trigger1 = var(20) = 0
trigger1 = ctrl

;---------------------------------------------------------------------------
;クイックMAX
[State -1, Jump Strong Kick]
type = ChangeState
value = 901
triggerall = var(59) = 0
triggerall = command = "MAX"
triggerall = statetype != A
triggerall = power >= 2000
trigger1 = var(20) = 0
trigger1 = stateno = [200,499]
trigger1 = movecontact

;===========================================================================
;---------------------------------------------------------------------------
;緊急回避後
[State -1, Taunt]
type = ChangeState
value = 701
triggerall = var(59) = 0
triggerall = command = "緊急回避後"
trigger1 = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
;ガードキャンセル緊急回避後
[State -1, 701]
type = ChangeState
value = 701
triggerall = var(59) = 0
triggerall = command = "緊急回避後"
triggerall = power >= 1000
trigger1 = stateno = 150
trigger2 = stateno = 151
;---------------------------------------------------------------------------
;緊急回避前
[State -1, Taunt]
type = ChangeState
value = 700
triggerall = var(59) = 0
triggerall = command = "緊急回避前"
trigger1 = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
;ガードキャンセル緊急回避前
[State -1, 700]
type = ChangeState
value = 700
triggerall = var(59) = 0
triggerall = command = "緊急回避前"
triggerall = power >= 1000
trigger1 = stateno = 150
trigger2 = stateno = 151
;---------------------------------------------------------------------------
;クイック前転
[State -1, 700]
type = ChangeState
value = 700
triggerall = var(59) = 0
triggerall = command = "緊急回避前"
triggerall = power >= 1000
trigger1 = stateno = [200,499]
trigger1 = movecontact
;---------------------------------------------------------------------------
;ダウン回避
[State -1, Taunt]
type = ChangeState
value = 702
triggerall = var(59) = 0
triggerall = command = "緊急回避前"
triggerall = alive
trigger1 = stateno = 5050
trigger1 = pos y >=-40
trigger1 = vel y > 0
;---------------------------------------------------------------------------
;Run Fwd
;ダッシュ
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = var(59) = 0
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
;後退ダッシュ
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = var(59) = 0
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;握斬
[State -1, Kung Fu Throw]
type = ChangeState
value = 800
triggerall = var(59) = 0
triggerall = command = "y"
triggerall = command = "holdfwd" || command = "holdback"
triggerall = command != "holddown"
triggerall = statetype != A
triggerall = ctrl
triggerall = stateno != 100
trigger1 = p2bodydist X < 8
trigger1 = p2statetype != A
trigger1 = p2movetype != H

;---------------------------------------------------------------------------
;握斬鬼
[State -1, Kung Fu Throw]
type = ChangeState
value = 850
triggerall = var(59) = 0
triggerall = command = "b"
triggerall = command = "holdfwd" || command = "holdback"
triggerall = command != "holddown"
triggerall = statetype != A
triggerall = ctrl
triggerall = stateno != 100
trigger1 = p2bodydist X < 8
trigger1 = p2statetype != A
trigger1 = p2movetype != H



;---------------------------------------------------------------------------
;弁髪拳1
[State -1, a]
type = ChangeState
value = 250
triggerall = var(59) = 0
triggerall = command = "x"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 215 && movecontact
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact

;---------------------------------------------------------------------------
;弁髪拳2
[State -1, a]
type = ChangeState
value = 450
triggerall = var(59) = 0
triggerall = command = "y"
triggerall = command = "holdfwd"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 215 && movecontact
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact

;===========================================================================
;---------------------------------------------------------------------------
;遠距離立ち弱パンチ
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = var(59) = 0
triggerall = command = "x"
triggerall = command != "holddown"
triggerall = P2dist X >50
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = movecontact
trigger2 = animelem = 5,>=0
trigger3 = stateno = 205
trigger3 = movecontact
trigger3 = animelem = 4,>=0

;---------------------------------------------------------------------------
;近距離立ち弱パンチ
[State -1, Stand Light Punch]
type = ChangeState
value = 205
triggerall = var(59) = 0
triggerall = command = "x"
triggerall = command != "holddown"
triggerall = P2dist X <=50
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = movecontact
trigger2 = animelem = 5,>=0
trigger3 = stateno = 205
trigger3 = movecontact
trigger3 = animelem = 4,>=0

;---------------------------------------------------------------------------
;遠距離立ち強パンチ
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = var(59) = 0
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = P2dist X >55
triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;近距離立ち強パンチ
[State -1, Stand Strong Punch]
type = ChangeState
value = 215
triggerall = var(59) = 0
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = P2dist X <=55
triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;遠距離立ち弱キック
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = var(59) = 0
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = P2dist X >50
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = movecontact
trigger2 = animelem = 5,>=0
trigger3 = stateno = 205
trigger3 = movecontact
trigger3 = animelem = 4,>=0

;---------------------------------------------------------------------------
;近距離立ち弱キック
[State -1, Stand Light Kick]
type = ChangeState
value = 235
triggerall = var(59) = 0
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = P2dist X <=50
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = movecontact
trigger2 = animelem = 5,>=0
trigger3 = stateno = 205
trigger3 = movecontact
trigger3 = animelem = 4,>=0

;---------------------------------------------------------------------------
;遠距離立ち強キック1
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = var(59) = 0
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = P2dist X >55
triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;近距離立ち強キック
[State -1, Standing Strong Kick]
type = ChangeState
value = 245
triggerall = var(59) = 0
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = P2dist X <=55
triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;挑発
[State -1, Taunt]
type = ChangeState
value = 199
triggerall = var(59) = 0
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;しゃがみ弱パンチ
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = var(59) = 0
triggerall = command = "x"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = movecontact
trigger2 = animelem = 5,>=0
trigger3 = stateno = 205
trigger3 = movecontact
trigger3 = animelem = 4,>=0
trigger4 = stateno = 400
trigger4 = movecontact
trigger4 = animelem = 5,>=0

;---------------------------------------------------------------------------
;しゃがみ強パンチ
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = var(59) = 0
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 430 && AnimElemTime(2) > 0

;---------------------------------------------------------------------------
;しゃがみ弱キック
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = var(59) = 0
triggerall = command = "a"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = movecontact
trigger2 = animelem = 5,>=0
trigger3 = stateno = 205
trigger3 = movecontact
trigger3 = animelem = 4,>=0

;---------------------------------------------------------------------------
;しゃがみ強キック
[State -1, Crouching Strong Kick]
type = ChangeState
value = 440
triggerall = var(59) = 0
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;空中弱パンチ
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = var(59) = 0
triggerall = command = "x"
trigger1 = vel x != 0
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = var(59) = 0
triggerall = command = "y"
trigger1 = vel x != 0
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = var(59) = 0
triggerall = command = "a"
trigger1 = vel x != 0
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;空中強キック
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = var(59) = 0
triggerall = command = "b"
trigger1 = vel x != 0
trigger1 = statetype = A
trigger1 = ctrl


;---------------------------------------------------------------------------
;空中弱パンチ
[State -1, Jump Light Punch]
type = ChangeState
value = 605
triggerall = var(59) = 0
triggerall = command = "x"
trigger1 = vel x = 0
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1, Jump Strong Punch]
type = ChangeState
value = 615
triggerall = var(59) = 0
triggerall = command = "y"
trigger1 = vel x = 0
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1, Jump Light Kick]
type = ChangeState
value = 635
triggerall = var(59) = 0
triggerall = command = "a"
trigger1 = vel x = 0
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;空中強キック
[State -1, Jump Strong Kick]
type = ChangeState
value = 645
triggerall = var(59) = 0
triggerall = command = "b"
trigger1 = vel x = 0
trigger1 = statetype = A
trigger1 = ctrl
