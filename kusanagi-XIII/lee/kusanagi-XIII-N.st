;===============================================================================================
;远轻拳
;===============================================================================================
[Statedef 200]
type     = S                 ;キャラの状態を指定
                             ;S=立ち　C=しゃがみ　A=空中　L=倒れている　U=前のステートの状態を引き継ぐ
movetype = A                 ;キャラの行動内容を指定 I=何もしない　A=攻撃している　H=攻撃を食らっている
physics  = S                 ;キャラの物理的な体勢
                             ;S=立ち　C=しゃがみ　A=空中　N=重力や摩擦の影響を受けない　U=前のステートの体勢を引き継ぐ
velset   = 0,0               ;移動初速度の設定（このステートでは0,0なので移動せず止まります）
ctrl     = 0                 ;コントロールの可否（0=キー操作不可・1=キー操作可能）
anim     = 200               ;airファイルの[Begin Action 200]のアニメを使っています
sprpriority = 2              ;画像表示優先度　数値が多いと手前に、少ないと奥に優先されます
facep2 = 1

[State 200, ヒット定義]
type = HitDef                ;攻撃ヒット定義（Hit Definition）のステートコントローラ
trigger1 = time = 0          ;攻撃判定ボックスがあればアニメーション３番目のコマで適用されます
attr = S, NA                 ;攻撃属性: これは Standing, Normal Attack（立ち通常攻撃）、重要項目です
damage = 25, 0              ;相手に与えるダメージ（ヒットした時,ガードされた時）
animtype = Light             ;当たった時の相手のアニメの種類: Light, Medium, Hard, Back, Up, DiagUp
guardflag = M               ;相手が立ち・しゃがみ・空中どのガードが出来るかを決めます（MiddleAir 全部ガードされます）
hitflag = MAF                ;相手がどの状態の時で攻撃を当てられるかを決めます（MiddleAirFall）
priority = 4, Hit            ;攻撃優先度: 0 (最低) 7 (最高) 4がデフォルト・種類はHit/Miss/Dodge (デフォルト：Hit)
pausetime = 10,12            ;攻撃を当てた時の自分と相手の硬直時間（自分,相手）
sparkno = s13003              ;ヒットスパーク (デフォルト：[Data]の項目で設定したモノが適用される) ★３
guard.sparkno = s13022        ;ガードスパーク (デフォルト：[Data]の項目で設定したモノが適用される) ★３
sparkxy = -20, -80           ;ヒットスパークの位置（Ｘ軸,Ｙ軸）
hitsound = s1,0              ;ヒットサウンド（Sを付けると自分のSNDファイルから）
guardsound = s2,0            ;ガードサウンド（Sを付けないとMUGENデフォルトから）
ground.type = High           ;当たった時の地上の相手のアニメの属性　High：頭、体, Low：足, Trip：足払い
ground.slidetime = 8         ;当たった時の地上の相手がのけぞる時間
ground.hittime  = 10         ;当たった時の地上の相手のやられ状態の時間
ground.velocity = -4.5,0     ;当たった時の地上の相手の初速度（Ｘ軸,Ｙ軸）
air.animtype = Back
air.velocity = -4.5,-4
airguard.velocity = -5.5,-2.5
air.hittime = 13
forcenofall = 1
getpower = 50,50
givepower = 16,16
id = 200
air.cornerpush.veloff = 0

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
trigger1 = random < 700
value = 10,0
channel = 4

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = 0,0

[State 200]
type = StateTypeSet
trigger1 = AnimElem = 3
movetype = I

[State 200, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0 ;アニメーション時間が０、つまりアニメが終了した時に有効になります。
value = 0
ctrl = 1

;===============================================================================================
;近轻拳
;===============================================================================================
[Statedef 205]
type     = S
movetype = A
physics  = S
velset   = 0,0
ctrl     = 0
anim     = 205
sprpriority = 2
facep2 = 1

[State 200, ヒット定義]
type = HitDef
trigger1 = time = 0
attr = S, NA
damage = 25, 0
animtype = Light
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10,12
sparkno = s13003              ;ヒットスパーク (デフォルト：[Data]の項目で設定したモノが適用される) ★３
guard.sparkno = s13022        ;ガードスパーク (デフォルト：[Data]の項目で設定したモノが適用される) ★３
sparkxy = -15, -80
hitsound = s1,0
guardsound = s2,0
ground.type = High
ground.slidetime = 8
ground.hittime  = 10
ground.velocity = -4.5,0
air.animtype = Back
air.velocity = -4.5,-4
airguard.velocity = -5.5,-2.5
air.hittime = 13
forcenofall = 1
getpower = 50,50
givepower = 16,16
id=205
air.cornerpush.veloff = 0

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
trigger1 = random < 700
value = 10, 0
channel = 4

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = 0, 0

[State 200]
type = StateTypeSet
trigger1 = AnimElem = 3
movetype = I

[State 200, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;===============================================================================================
;远重拳
;===============================================================================================
[Statedef 210]
type     = S
movetype = A
physics  = S
ctrl     = 0
velset   = 0,0
anim     = 210
sprpriority = 2
facep2 = 1

[State 200, ヒット定義]
type = HitDef
trigger1 = time = 0
attr = S, NA
damage = 65, 0
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10,12
sparkno = s13004              ;ヒットスパーク (デフォルト：[Data]の項目で設定したモノが適用される) ★３
guard.sparkno = s13022        ;ガードスパーク (デフォルト：[Data]の項目で設定したモノが適用される) ★３
sparkxy = -25, -80
hitsound = s1,1
guardsound = s2,0
ground.type = High
ground.slidetime = 16
ground.hittime  = 18
ground.velocity = -7.5
air.animtype = Back
air.velocity = -4.5,-4
airguard.velocity = -5.5,-2.5
air.hittime = 13
forcenofall = 1
guard.velocity = -11
getpower = 100,100
givepower = 16,16
EnvShake.Time      =  4
EnvShake.Ampl      = -10
id = 210
air.cornerpush.veloff = 0


[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
trigger1 = random < 700
value = 10, 1
channel = 4

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = 0, 1

[State 200]
type = StateTypeSet
trigger1 = AnimElem = 5
movetype = I

[State 210, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;===============================================================================================
;近重拳
;===============================================================================================
[Statedef 215]
type     = S
movetype = A
physics  = S
ctrl     = 0
velset   = 0,0
anim     = 215
sprpriority = 2
facep2 = 1

[State 200, ヒット定義]
type = HitDef
trigger1 = time = 0
attr = S, NA
damage = 65, 0
animtype = Hard
guardflag = M
hitflag = MAF
priority = 5, Hit
pausetime = 10,12
sparkno = s13004              ;ヒットスパーク (デフォルト：[Data]の項目で設定したモノが適用される) ★３
guard.sparkno = s13022        ;ガードスパーク (デフォルト：[Data]の項目で設定したモノが適用される) ★３
sparkxy = -20, -65
hitsound = s1,1
guardsound = s2,0
ground.type = High
ground.slidetime = 18
ground.hittime  = 20
ground.velocity = -8.3
air.animtype = Back
air.velocity = -4.5,-4
airguard.velocity = -5.5,-2.5
air.hittime = 13
forcenofall = 1
guard.velocity = -7
guard.hittime = 17
guard.ctrltime = 17
getpower = 100,100
givepower = 16,16
EnvShake.Time      =  4
EnvShake.Ampl      = -10
id = 215
air.cornerpush.veloff = 0

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 1
trigger1 = random < 700
value = 10, 1
channel = 4

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 1
value = 0, 1

[State 200]
type = StateTypeSet
trigger1 = AnimElem = 4
movetype = I

[State 210, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;===============================================================================================
;远轻脚
;===============================================================================================
[Statedef 230]
type     = S
movetype = A
physics  = S
ctrl     = 0
velset   = 0,0
anim     = 230
sprpriority = 2
facep2 = 1

[State 200,]
type = Posadd
trigger1 = AnimElem = 3 | AnimElem = 4 | AnimElem = 5
x = 10

[State 200,]
type = Posadd
trigger1 = AnimElem = 6 | AnimElem = 7 | AnimElem = 8
x = -10

[State 230, ヒット定義]
type = HitDef
trigger1 = time = 0
attr = S, NA
animtype  = Medium
damage    = 25,0
guardflag = M
pausetime = 10,12
priority = 4, Hit
sparkno = s13003              ;ヒットスパーク (デフォルト：[Data]の項目で設定したモノが適用される) ★３
guard.sparkno = s13022        ;ガードスパーク (デフォルト：[Data]の項目で設定したモノが適用される) ★３
sparkxy = -20, -70
hitsound = s1,2
guardsound = s2,0
ground.type = Low
ground.slidetime = 8
ground.hittime  = 9
ground.velocity = -4.5
air.animtype = Back
air.velocity = -4.5,-4
airguard.velocity = -5.5,-2.5
air.hittime = 13
forcenofall = 1
getpower = 50,50
givepower = 16,16
id = 230
air.cornerpush.veloff = 0


[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
trigger1 = random < 700
value = 10, 0
channel = 4

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = 0, 2

[State 200]
type = StateTypeSet
trigger1 = AnimElem = 7
movetype = I

[State 230, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;===============================================================================================
;近轻脚
;===============================================================================================
[Statedef 235]
type     = S
movetype = A
physics  = S
ctrl     = 0
velset   = 0,0
anim     = 235
sprpriority = 2
facep2 = 1

[State 230, ヒット定義]
type = HitDef
trigger1 = time = 0
attr = S, NA
animtype  = Medium
damage    = 25,0
guardflag = L
pausetime = 10,12
priority = 4, Hit
sparkno = s13003              ;ヒットスパーク (デフォルト：[Data]の項目で設定したモノが適用される) ★３
guard.sparkno = s13022        ;ガードスパーク (デフォルト：[Data]の項目で設定したモノが適用される) ★３
sparkxy = -20, -35
hitsound = s1,2
guardsound = s2,0
ground.type = Low
ground.slidetime = 9
ground.hittime  = 9
ground.velocity = -6
air.animtype = Back
air.velocity = -4.5,-4
airguard.velocity = -5.5,-2.5
air.hittime = 13
forcenofall = 1
getpower = 50,50
givepower = 16,16
ID                 =235
air.cornerpush.veloff = 0
ground.cornerpush.veloff = -6
guard.cornerpush.veloff = -7

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
trigger1 = random < 700
value = 10, 0
channel = 4

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = 0, 2

[State 230, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;===============================================================================================
;远重脚
;===============================================================================================
[Statedef 240]
type     = S
movetype = A
physics  = S
ctrl     = 0
velset   = 0,0
anim     = 240
sprpriority = 2
facep2 = 1

[State 240,Posadd]
type = Posadd
trigger1 = animelem = 3
trigger2 = animelem = 4
trigger3 = animelem = 5
trigger4 = animelem = 6
trigger5 = animelem = 7
trigger6 = animelem = 8
x = 5

[State 240, ヒット定義]
type = HitDef
trigger1 = Time = 0
attr = S, NA
animtype  = Hard
damage    = 65,0
guardflag = M
pausetime = 10,12
priority = 5, Hit
sparkno = s13004       
guard.sparkno = s13022        
sparkxy = -25,-70
hitsound   = s1,3
guardsound = s2,0
ground.type = low
ground.slidetime = 16
ground.hittime  = 18
ground.velocity = -9
air.animtype = Back
air.velocity = -4.5,-4
airguard.velocity = -5.5,-2.5
air.hittime = 18
forcenofall = 1
guard.velocity = -11
getpower = 100,100
givepower = 16,16
EnvShake.Time      =  4
EnvShake.Ampl      = -10
ID                 =240
air.cornerpush.veloff = 0


[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 1
trigger1 = random < 700
value = 10, 1
channel = 4


[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = 0, 3

[State 240, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;===============================================================================================
;远重脚
;===============================================================================================
[Statedef 245]
type     = S
movetype = A
physics  = S
ctrl     = 0
velset   = 0,0
anim     = 245
sprpriority = 2
facep2 = 1

[State 200,]
type = Posadd
trigger1 = AnimElem = 1 | AnimElem = 2 | AnimElem = 3
x = 10

[State 200,]
type = Posadd
trigger1 = AnimElem = 6 | AnimElem = 9 | AnimElem = 10
x = -10

[State 240, ヒット定義]
type = HitDef
trigger1 = time = 0
attr = S, NA
animtype  = Hard
damage    = 65,0
guardflag = M
pausetime = 10,12
priority = 5, Hit
sparkno = s13004              ;ヒットスパーク (デフォルト：[Data]の項目で設定したモノが適用される) ★３
guard.sparkno = s13022        ;ガードスパーク (デフォルト：[Data]の項目で設定したモノが適用される) ★３
sparkxy = -20,-70
hitsound   = s1,3
guardsound = s2,0
ground.type = High
ground.slidetime = 20
ground.hittime  = 22
ground.velocity = -8.2
air.animtype = Back
air.velocity = -4.5,-4
airguard.velocity = -5.5,-2.5
air.hittime = 22
forcenofall = 1
guard.velocity = -11
getpower = 100,100
givepower = 16,16
EnvShake.Time      =  4
EnvShake.Ampl      = -10
ID                 =245
air.cornerpush.veloff = 0


[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
trigger1 = random < 700
value = 10, 1
channel = 4

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = 0, 3

[State 240, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;---------------------------------------------------------------------------
[Statedef 400]
type     = C
movetype = A
physics  = C
ctrl     = 0
velset   = 0,0
anim     = 400
sprpriority = 2
facep2 = 1

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
trigger1 = random < 700
value = 10, 0
channel = 4

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = 0, 0

[State 400, ヒット定義]
type = HitDef
trigger1 = time = 0
attr = C, NA
damage    = 25,0
priority = 5, Hit
animtype  = Light
hitflag = MAF
guardflag = M
pausetime = 11,13
sparkno = s13003 
guard.sparkno = s13022
sparkxy = -10,-40
hitsound   = s1,0
guardsound = s2,0
ground.type = Low
ground.slidetime = 9
ground.hittime = 9
ground.velocity = -6
air.animtype = Back
air.velocity = -4.5,-4
airguard.velocity = -5.5,-2.5
air.hittime = 13
forcenofall = 1
guard.velocity = -9
getpower = 50,50
givepower = 16,16
ID                 =400
air.cornerpush.veloff = 0
ground.cornerpush.veloff = -6
guard.cornerpush.veloff = -7


[State 400, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1


[Statedef 410]
type     = C
movetype = A
physics  = C
ctrl     = 0
anim     = 410
velset   = 0,0
sprpriority = 2
facep2 = 1

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
trigger1 = random < 700
value = 10, 1
channel = 4

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = 0, 1

[State 200, ヒット定義]
type = HitDef
trigger1 = time = 0
attr = S, NA
damage = 70, 0
animtype = Hard
guardflag = M
hitflag = MAF
priority = 6, Hit
pausetime = 11,13
sparkno = s13004            
guard.sparkno = s13022
sparkxy = -20,-80
hitsound = s1,1
guardsound = s2,0
ground.type = High
ground.slidetime = 21
ground.hittime  = 22
ground.velocity = -7.5
air.animtype = Back
air.velocity = -4.5,-4
airguard.velocity = -5.5,-2.5
air.hittime = 22
forcenofall = 1
guard.velocity = -10
getpower = 100,100
givepower = 16,16
EnvShake.Time      =  4
EnvShake.Ampl      = -10
ID                 =410
air.cornerpush.veloff = 0


[State 410, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1




[Statedef 430]
type     = C
movetype = A
physics  = C
ctrl     = 0
velset   = 0,0
anim     = 430
sprpriority = 2
facep2 = 1

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
trigger1 = random < 700
value = 10, 0
channel = 4

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = 0, 2

[State 430, ヒット定義]
type = HitDef
trigger1 = Time = 0
attr = C, NA
damage = 30,0
priority = 5, Hit
animtype  = Light
hitflag = MAF
guardflag = L
pausetime = 11,13
sparkno = s13003 
guard.sparkno = s13022
sparkxy = -10,-8
hitsound   = s1,2
guardsound = s2,0
ground.type = Low
ground.slidetime = 9
ground.hittime = 9
ground.velocity = -5.62
air.animtype = Back
air.velocity = -4.5,-4
airguard.velocity = -5.5,-2.5
air.hittime = 13
forcenofall = 1
guard.velocity = -7
getpower = 50,50
givepower = 16,16
ID                 =430
air.cornerpush.veloff = 0
ground.cornerpush.veloff = -6
guard.cornerpush.veloff = -7



[State 430, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1


[Statedef 440]
type     = C
movetype = A
physics  = C
ctrl     = 0
anim     = 440
velset   = 0,0
sprpriority = 2
facep2 = 1

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 5
trigger1 = random < 700
value = 10, 1
channel = 4

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 5
value = 0, 3

[State 440, ヒット定義]
type = HitDef
trigger1 = Time = 0
attr = C, NA
damage    = 80,0
priority = 5, Hit
hitflag = MAF
guardflag = L
pausetime = 11,13
sparkno = s13004            
guard.sparkno = s13022
sparkxy = -20,-10
hitsound   = s1,3
guardsound = s2,0
ground.type = Trip
ground.slidetime = 13
ground.hittime  = 15
ground.velocity = -2,-6.7
air.animtype = Back
air.velocity = -4.5,-4
airguard.velocity = -5.5,-2.5
air.hittime = 15
guard.velocity = -12
yaccel = .45
fall = 1
getpower = 100,100
givepower = 16,16
EnvShake.Time      =  4
EnvShake.Ampl      = -10
ID                 =440
air.cornerpush.veloff = 0

[State 440, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1



[Statedef 600]
type     = A
movetype = A
physics  = A
ctrl     = 0
anim     = 600
sprpriority = 2

[State 600, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = 10, 0

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = 0, 0

[State 600, ヒット定義]
type = HitDef
trigger1 = Time = 0
attr = A, NA   
damage    = 45,0
guardflag = H
priority = 4,Hit
pausetime = 10,12
ID                 =600
sparkno = s13003 
guard.sparkno = s13022
sparkxy = -15,-60
hitsound   = s1,0
guardsound = s2,0
ground.type = High
ground.slidetime = 9
ground.hittime  = 9
ground.velocity = -4
air.animtype = Back
air.velocity = -4.5,-4
airguard.velocity = -5.5,-2.5
air.hittime = 13
forcenofall = 1
getpower = 75,75
givepower = 16,16
id = 600
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0






[Statedef 610]
type     = A
movetype = A
physics  = A
ctrl     = 0
anim     = 610
sprpriority = 2

[State 610, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = 10, 1

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = 0, 1

[State 610, ヒット定義]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage = 70,0
guardflag = H
priority = 5, Hit
pausetime = 11,13
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -20,-80
hitsound   = s1,1
guardsound = s2,0
animtype = Medium
ground.type = High
ground.slidetime = 9
ground.hittime  = 9
ground.velocity = -6
air.animtype = Back
air.velocity = -4.5,-4
airguard.velocity = -5.5,-2.5
air.hittime = 13
forcenofall = 1
guard.velocity = -9
getpower = 100,100
givepower = 16,16
EnvShake.Time      =  4
EnvShake.Ampl      = -10
ID                 = 610
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0



[Statedef 630]
type     = A
movetype = A
physics  = A
ctrl     = 0
anim     = 630
sprpriority = 2

[State 630, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = 10,0

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = 0, 2

[State 630, ヒット定義]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage = 40,0
guardflag = H
priority = 4, Hit
pausetime = 10,12
ID                 =630
sparkno = s13003 
guard.sparkno = s13022
sparkxy = -20,-90
hitsound   = s1,2
guardsound = s2,0
ground.type = High
ground.slidetime = 9
ground.hittime  = 9
ground.velocity = -4
air.animtype = Back
air.velocity = -4.5,-4
airguard.velocity = -5.5,-2.5
air.hittime = 13
forcenofall = 1
getpower = 50,50
givepower = 16,16
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0



[Statedef 635]
type     = A
movetype = A
physics  = A
ctrl     = 0
anim     = 635
sprpriority = 2

[State 630, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = 10, 0

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = 0, 2

[State 630, ヒット定義]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage = 40,0
guardflag = H
priority = 4, Hit
pausetime = 10,12
sparkno = s13003 
guard.sparkno = s13022
sparkxy = -20,-70
hitsound   = s1,2
guardsound = s2,0
ground.type = High
ground.slidetime = 9
ground.hittime = 9
ground.velocity = -4
air.animtype = Back
air.velocity = -4.5,-4
airguard.velocity = -5.5,-2.5
air.hittime = 13
forcenofall = 1
getpower = 50,50
givepower = 16,16
ID = 635
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0


[Statedef 640]
type     = A
movetype = A
physics  = A
ctrl     = 0
anim     = 640
sprpriority = 2

[State 640, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = 10, 1

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = 0, 3

[State 640, ヒット定義]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage    = 80,0
guardflag = H
priority = 5, Hit
pausetime = 10,12
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -25,-70
hitsound   = s1,3
guardsound = s2,0
animtype = Hard
ground.type = High
ground.slidetime = 9
ground.hittime  = 9
ground.velocity = -5
air.animtype = Back
air.velocity = -4.5,-4
airguard.velocity = -5.5,-2.5
air.hittime = 13
forcenofall = 1
guard.velocity = -9
getpower = 100,100
givepower = 16,16
EnvShake.Time      =  4
EnvShake.Ampl      = -10
ID                 =640
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0



[Statedef 645]
type     = A
movetype = A
physics  = A
ctrl     = 0
anim     = 645
sprpriority = 2

[State 640, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = 10, 1

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = 0, 3

[State 640, ヒット定義]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage    = 80,0
guardflag = H
priority = 5, Hit
pausetime = 10,12
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -25,-70
hitsound   = s1,3
guardsound = s2,0
animtype = Hard
ground.type = High
ground.slidetime = 9
ground.hittime  = 9
ground.velocity = -5
air.animtype = Back
air.velocity = -4.5,-4
airguard.velocity = -5.5,-2.5
air.hittime = 13
forcenofall = 1
guard.velocity = -9
getpower = 100,100
givepower = 16,16
EnvShake.Time      =  4
EnvShake.Ampl      = -10
ID                 = 645
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0


;---------------------------------------------------------------------------
;外式・轟斧　陽

[Statedef 310]
type     = S
movetype = A
physics  = S
ctrl     = 0
velset   = 0,0
anim     = 310
sprpriority = 2
facep2 = 1

[State 200,]
type = Posadd
trigger1 = AnimElem = 2 | AnimElem = 3 | AnimElem = 5
x = 10

[State 200,]
type = Posadd
trigger1 = AnimElem = 7
x = -10

[State 200,]
type = Posadd
trigger1 = AnimElem = 8
x = -20

[State 200, ヒット定義]
type = HitDef
trigger1 = AnimElem = 4
attr = S, NA
damage = 70, 0
animtype = Hard
guardflag = M
hitflag = MAF
priority = 5, Hit
pausetime = 12,12
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -15, -75
hitsound = s1,3
guardsound = s2,0
ground.type = High
ground.slidetime = 19
ground.hittime = 19
ground.velocity = 0
air.animtype = Back
air.velocity = -4.5,-4
airguard.velocity = -5.5,-2.5
air.hittime = 19
air.fall = 1
fall.recovertime = 30
getpower = 70,70
givepower = 16,16
ID                 =310
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 200, ヒット定義]
type = HitDef
trigger1 = AnimElem = 5
attr = S, NA
damage = 50, 0
animtype = Hard
guardflag = H
hitflag = MAF
priority = 3, Hit
pausetime = 10,12
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -20, -70
hitsound = s1,3
guardsound = s2,0
ground.type = Low
ground.slidetime = 21
ground.hittime  = 22
ground.velocity = -10.5
air.animtype = Back
air.velocity = -4.5,-4
airguard.velocity = -5.5,-2.5
air.hittime = 22
fall.recover = 1
getpower = 70,70
givepower = 16,16
ID                 =311
air.cornerpush.veloff = 0

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 5
value = 10, 2

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = 0, 2

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 5
value = 0, 3

[State 210, ステート変更]
type = ChangeState
triggerall = prevstateno = [200,440]
trigger1 = time = 0
value = 315

[State 210, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;外式・轟斧　陽　キャンセルver

[Statedef 315]
type     = S
movetype = A
physics  = S
ctrl     = 0
velset   = 0,0
anim     = 310
sprpriority = 2
facep2 = 1

[State 200,]
type = Posadd
trigger1 = AnimElem = 2 | AnimElem = 3 | AnimElem = 5
x = 10

[State 200,]
type = Posadd
trigger1 = AnimElem = 7
x = -10

[State 200,]
type = Posadd
trigger1 = AnimElem = 8
x = -20

[State 200, ヒット定義]
type = HitDef
trigger1 = AnimElem = 4
attr = S, NA
damage = 30, 0
animtype = Hard
guardflag = M
hitflag = MAF
priority = 5, Hit
pausetime = 12,12
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -15, -75
hitsound = s1,3
guardsound = s2,0
ground.type = High
ground.slidetime = 19
ground.hittime = 19
ground.velocity = 0
air.animtype = Back
air.velocity = -4.5,-4
airguard.velocity = -5.5,-2.5
air.hittime = 19
air.fall = 1
fall.recovertime = 30
getpower = 70,70
givepower = 16,16
ID                 = 315
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 200, ヒット定義]
type = HitDef
trigger1 = AnimElem = 5
attr = S, NA
damage = 30, 0
animtype = Hard
guardflag = M
hitflag = MAF
priority = 3, Hit
pausetime = 10,12
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -20, -70
hitsound = s1,3
guardsound = s2,0
ground.type = Low
ground.slidetime = 21
ground.hittime  = 22
ground.velocity = -9
air.animtype = Back
air.velocity = -4.5,-4
airguard.velocity = -5.5,-2.5
air.hittime = 22
fall.recover = 1
getpower = 70,70
givepower = 16,16
EnvShake.Time      =  4
EnvShake.Ampl      = -10
ID                 =316
air.cornerpush.veloff = 0

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 5
value = 10, 2

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = 0, 2

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 5
value = 0, 3

[State 210, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;八拾八式

[Statedef 320]
type     = C
movetype = A
physics  = C
ctrl     = 0
velset   = 0,0
anim     = 320
sprpriority = 2
facep2 = 1

[State 200,]
type = Posadd
trigger1 = AnimElem = 1 | AnimElem = 2 | AnimElem = 3 | AnimElem = 4 | AnimElem = 5 | AnimElem = 6
x = 10

[State 200,]
type = Posadd
trigger1 = AnimElem = 9
x = -10

[State 200, ヒット定義]
type = HitDef
trigger1 = AnimElem = 2
attr = C, NA
damage = 30, 0
animtype = Hard
guardflag = L
hitflag = MAF
priority = 5, Hit
pausetime = 11, 12
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -15, -25
hitsound = s1,3
guardsound = s2,0
ground.type = Low
ground.slidetime = 21
ground.hittime  = 22
ground.velocity = -8
air.animtype = Back
air.velocity = -3.5,-4.5
air.hittime = 22
air.fall = 1
fall.recover = 0
getpower = 50,50
givepower = 16,16
EnvShake.Time      =  4
EnvShake.Ampl      = -10
ID                 =320
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 200, ヒット定義]
type = HitDef
trigger1 = AnimElem = 6
attr = C, NA
damage = 40, 0
animtype = Hard
guardflag = L
hitflag = MAF
priority = 3, Hit
pausetime = 11, 12
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -20, -25
hitsound = s1,3
guardsound = s2,0
ground.type = Low
ground.slidetime = 21
ground.hittime  = 22
ground.velocity = -12
guard.velocity = -12
air.animtype = Back
air.velocity = -4.5,-4.5
air.hittime = 22
air.fall = 1
fall.recover = 0
getpower = 50,50
givepower = 16,16
EnvShake.Time      =  4
EnvShake.Ampl      = -10
ID                 =321
air.cornerpush.veloff = 0

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 1
value = 10, 0

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 6
value = 10, 2

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 5
value = 0, 3

[State 210, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; 外式・奈落落とし

[Statedef 330]
type     = A
movetype = A
physics  = A
ctrl     = 0
anim     = 330
sprpriority = 3

[State 610, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = 10, 2

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = 0, 1

[State 330, HitDef]
type = HitDef
trigger1 = Time = 0
attr = A, NA
animtype = high
damage = 50,0
guardflag = H
priority = 7, Hit
pausetime = 7,10
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -10,-80
hitsound = s1,1
guardsound = s2,0
ground.type = Low
ground.slidetime = 17
ground.hittime = 17
ground.velocity = -10
air.animtype = Back
air.velocity = -5,15
air.hittime = 17
air.fall = 1
fall.recover = 0
getpower = 130,130
givepower = 16,16
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20
EnvShake.Time      =  6
EnvShake.Ampl      = -7
ID                 =330
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 330]
type = VelAdd
trigger1 = MoveContact
Y = 0.6


;---------------------------------------------------------------------------
[Statedef 800]
type     = S
movetype = A
physics  = S
juggle   = 0
velset   = 0,0
ctrl     = 0
anim     = 800
sprpriority = 2

[State 800, ヒット定義（投げ用）]
type = HitDef
trigger1 = p2movetype != H
trigger1 = Time = 0
attr = S, NT          ;攻撃属性: これは Standing, Normal Throw（立ち通常投げ）
hitflag = M-          ;相手がやられ状態ではない地上の時でしか掴む事が出来ません
priority = 1, Miss    ;投げなので優先度を低く、かつmissかdodgeの属性でなければなりません
sparkno = 80       ;-1にすればヒットスパークが表示しなくなります
sparkxy = -25,-80
p1sprpriority = 1     ;攻撃が当たった時に自分の画像表示優先度を1にします
p2sprpriority = 0     ;攻撃が当たった時に相手の画像表示優先度を0にします
p1facing = 1          ;攻撃が当たった時の自分の向き ★６
p2facing = 1          ;攻撃が当たった時の相手の向き
p1stateno = 810
p2stateno = 820
guard.dist = 0        ;相手がガード状態に移行出来る距離（現在は0なのでガード不可）
fall = 1              ;1にすれば相手がダウン状態になる
numhits = 0
getpower = 0,0
givepower = 0,0

[State 1000, ChangeState]
type = ChangeState
trigger1 = p2bodydist X < 15
trigger1 = animtime = 0
value = 215

[State 170, 無敵]
type = NotHitBy
trigger1 = time = 0
value = SCA,NT,ST,HT
time = 1

[State 800, ステート変更]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
[Statedef 801]
type     = S
movetype = A
physics  = S
juggle   = 0
velset   = 0,0
ctrl     = 0
anim     = 800
sprpriority = 2

[State 800, ヒット定義（投げ用）]
type = HitDef
trigger1 = p2movetype != H
trigger1 = Time = 0
attr = S, NT          ;攻撃属性: これは Standing, Normal Throw（立ち通常投げ）
hitflag = M-          ;相手がやられ状態ではない地上の時でしか掴む事が出来ません
priority = 1, Miss    ;投げなので優先度を低く、かつmissかdodgeの属性でなければなりません
sparkno = 80       ;-1にすればヒットスパークが表示しなくなります
sparkxy = -25,-80
p1sprpriority = 1     ;攻撃が当たった時に自分の画像表示優先度を1にします
p2sprpriority = 0     ;攻撃が当たった時に相手の画像表示優先度を0にします
p1facing = 1          ;攻撃が当たった時の自分の向き ★６
p2facing = 1          ;攻撃が当たった時の相手の向き
p1stateno = 830
p2stateno = 840
guard.dist = 0        ;相手がガード状態に移行出来る距離（現在は0なのでガード不可）
fall = 1              ;1にすれば相手がダウン状態になる
numhits = 0
getpower = 0,0
givepower = 0,0


[State 1000, ChangeState]
type = ChangeState
trigger1 = p2bodydist X < 15
trigger1 = animtime = 0
value = 245

[State 170, 無敵]
type = NotHitBy
trigger1 = time = 0
value = SCA,NT,ST,HT
time = 1

[State 800, ステート変更]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;-----------------------------------------------------------------------------
;投げ１・投げている（自分）
[Statedef 810]
type    = S
movetype= A
physics = N
anim = 810

[State 30000, 落地?土]
type = Explod
trigger1 = time = 0
anim = 13023
pos = 39, -83
postype = p1
scale = 0.45,0.45
ontop = 1
ownpal = 1
pausemovetime = 999
supermovetime = 999

[State 170, 無敵]
type = NotHitBy
trigger1 = 1
value = SCA

[State 810, 物理的なキャラの幅]
type = Width
trigger1 = 1
edge = 60,0

[State 810, 1]
type = PlaySnd
Trigger1 = time = 0
value = s1,5

[State 810, 1]
type = PlaySnd
Trigger1 = AnimElem = 4
value = s0,4

[State 810, 1]
type = PlaySnd
Trigger1 = AnimElem = 4
value = s10,12

[State 200,]
type = Posadd
trigger1 = AnimElem = 5
x = 10

[State 810, 3]
type = TargetBind
Trigger1 = AnimElemtime(1) >= 0 && AnimElemtime(4) < 0
pos = 40, 0

[State 810, 3]
type = TargetBind
Trigger1 = AnimElemtime(4) >= 0 && AnimElemtime(5) < 0
pos = 60, 0

[State 300 , 1]
type = HitDef
trigger1 = time = 0
attr = S, NT
animtype  = Hard
damage    = 80
priority = 3
pausetime = 5,10
sparkno = s13004            
guard.sparkno = s13022 
sparkxy = -20,-75
hitsound = s1,4
hitflag = MAF
guardsound = s2,0
ground.type = High
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = -4.5,-5.5
air.velocity = -4.5,-5.5
air.animtype = Back
fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = 0,0
givepower = 0,0
EnvShake.Time      =  4
EnvShake.Ampl      = -10
ID                 = 810

[State 810, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;投げ１・投げられている（相手の動作）動作
[Statedef 820]
type    = A
movetype= H
physics = N
velset = 0,0

[State 2120]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 820

[State 820, 1]
type = SelfState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;-----------------------------------------------------------------------------
;投げ２・投げている（自分）
[Statedef 830]
type    = S
movetype= A
physics = N
anim = 830

[State 30000, 落地?土]
type = Explod
trigger1 = time = 0
anim = 13023
pos = 39, -83
postype = p1
scale = 0.45,0.45
ownpal = 1
ontop = 1
pausemovetime = 999
supermovetime = 999

[State 30000, 落地?土]
type = Explod
trigger1 = time = 29
anim = 13021
pos = 0, 0
postype = p2
scale = 0.45,0.45
ownpal = 1
ontop = 1
pausemovetime = 999
supermovetime = 999

[State 30000, 底?]
type = Explod
trigger1 = time = 29
anim = 13020
postype = p2
scale = 0.45,0.45
ownpal = 1
under = 1
pausemovetime = 999
supermovetime = 999

[State 170, 無敵]
type = NotHitBy
trigger1 = 1
value = SCA

[State 810, 物理的なキャラの幅]
type = Width
trigger1 = 1
edge = 60,0

[State 810, ]
type = Turn
trigger1 = AnimElem = 4

[State 810, 1]
type = PlaySnd
Trigger1 = time = 0
value = s1,5

[State 810, 1]
type = PlaySnd
Trigger1 = AnimElem = 3
value = s0,4

[State 810, 1]
type = PlaySnd
Trigger1 = AnimElemtime(4) = 4
value = s12,7

[State 810, 1]
type = PlaySnd
Trigger1 = AnimElem = 7
value = s10,12

[State 810, 1]
type = PlaySnd
Trigger1 = AnimElem = 7
value = s1,1

[State 200,]
type = Posadd
trigger1 = AnimElem = 2 | AnimElem = 3
x = -10

[State 200,]
type = Posadd
trigger1 = AnimElem = 6 | AnimElem = 7
x = 10

[State 200,]
type = Posadd
trigger1 = AnimElem = 4
x = 20

[State 810, 3]
type = TargetBind
Trigger1 = AnimElemtime(1) >= 0 && AnimElemtime(2) < 0
pos = 40, 0

[State 810, 3]
type = TargetBind
Trigger1 = AnimElemtime(2) >= 0 && AnimElemtime(3) < 0
pos = 5, -95

[State 810, 3]
type = TargetBind
Trigger1 = AnimElemtime(3) >= 0 && AnimElemtime(4) < 0
pos = -20, -95

[State 810, 3]
type = TargetBind
Trigger1 = AnimElemtime(4) >= 0 && AnimElemtime(5) < 0
pos = 50, 0

[State 810, 3]
type = TargetBind
Trigger1 = AnimElemtime(5) >= 0 && AnimElemtime(6) < 0
pos = 60, 0

[State 700, エフェクト表示]
type = Explod
trigger1 = AnimElem = 7
anim = 13004
postype = P1
pos = 40, -10
sprpriority = 5
ownpal = 1

[State 810, 1]
type = TargetLifeAdd
trigger1 = AnimElemtime(4) = 4
value = -65
kill = 0

[State 810, 1]
type = TargetLifeAdd
trigger1 = AnimElem = 7
value =-25

[State 810,]
type = EnvShake
trigger1 = AnimElem = 7
ampl = -10
freq = 30
time = 10

[State 810,]
type = EnvShake
trigger1 = AnimElemtime(4) = 4
ampl = 5
freq = 80
time = 15

[State 810,]
type = EnvShake
trigger1 = AnimElem = 7
ampl = 6
freq = 80
time = 20

[State 810, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;投げ１・投げられている（相手の動作）動作
[Statedef 840]
type    = A
movetype= H
physics = N
velset = 0,0

[State 2120]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 840

[State 820, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 845

[State 820, 1]
type = SelfState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
[Statedef 845]
type    = A
movetype= H
physics = N
velset = 4,-5

[State 170, 無敵]
type = NotHitBy
trigger1 = 1
value = SCA

[State 1322]
type = veladd
trigger1 = time > 0
y = .4

[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 845

[State 1323]
type = changeState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 116100
