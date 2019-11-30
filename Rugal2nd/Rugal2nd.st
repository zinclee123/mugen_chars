;【設定について】(Abount Configuration)
;Attack:"Rugal2nd_-2.cns" fvar(35)～fvar(38)
;Defenceにはモードに応じて補正が掛かります。(Default:300)
; 2002(Player),S(Player),S+(Player):*1/2 = 150
; 2002(Boss):*2/3 = 200
; 98UM(Player):*1/4 = 75
; 02UM(Player):*1/3 = 100
; 98UM(Boss),02UM(Boss),S(Boss),S+(Boss):*1 = 300
; 注)02UMのボスモードは原作だと333ですが、敢えて300にしてあります。

[Data]
life = 1000
attack = 100
defence = 100;(Default:300)
power = 5000
fall.defence_up = 100
liedown.time = 30
airjuggle = 15
sparkno = 2
guard.sparkno = 40
KO.echo = 0
volume = 100
IntPersistIndex = 0;40
FloatPersistIndex = 0;25

[Size]
xscale = 1
yscale = 1
ground.front = 15
ground.back = 26
air.front = 11
air.back = 12
height = 60
attack.dist = 150
proj.attack.dist = 120
head.pos = 10,-114
mid.pos = 12,-80
shadowoffset = -2
draw.offset = 0,0

[Velocity]
walk.fwd  = 2.8
walk.back = -2.8
run.fwd = 6.0
run.back = -8.3,-5.5
jump.neu = 0,-10.2
jump.fwd = 3.5
jump.back = -3.5
runjump.fwd = 4.6
runjump.back = -4.6

[Movement]
airjump.num = 0
yaccel = .65
stand.friction = .85
crouch.friction = .82

;============================================================================

;var(1) 汎用ランダム変数
;var(2) EnemyNear
;var(3) 大ジャンプ
;var(4) 小ジャンプ
;var(5) EnemyNear（Target代用）
;var(6) Facing
;var(7) ラウンド開始時間
;var(8) 02UM超必殺技空中ヒット制限
;var(9) 空中連続ヒット制限
;var(10) ランダム変数（1-10）
;var(11) Air.CornerPush
;var(12) 先行入力受付ヘルパー
;var(13) 屈伸ガードフラグ
;var(14) 連続ガード回数
;var(15) GC必殺技使用可能フラグ
;var(16) 12P用
;var(17) 【AI】投げ無効フラグ
;var(18) 
;var(19) 
;var(20) オーバーキルフラグ
;var(21) 半数補正用カウント
;var(22) ステート奪取判定(State -1)
;var(23) ステート奪取判定(State -2)
;var(24) ジェノサイドカッター音声用
;var(25) カイザーウェイブ到達予測時間
;var(26) 白羅滅精命中フラグ 
;var(27) 【AI】滞空タイマー
;var(28) バニシングラッシュヒット制限用
;var(29) グラビティスマッシュID
;var(30) カイザーウェイブ段階
;var(31) バグ光弾判定
;var(32) バグ光弾（向き）
;var(33) 各種必殺技制御用変数
;var(34) カイザーフェニックスタイマー
;var(35) 【AI】ランダム変数(1～20)
;var(36) 【AI】ガード補助
;var(37) 【AI】敵ヘルパー検知
;var(38) 【AI】敵HitDef判定時間
;var(39) 【AI】空中敵ぶつかり判定
;var(40) 【AI】画面端距離・前
;var(41) 【AI】敵画面端距離・後
;var(42) 【AI】ステージ幅
;var(43) 【AI】対空タイマー
;var(44) 【AI】相手受身警戒
;var(45) MAX発動時、パワーゲージ量記録(2002用）
;var(46) どこキャン成立判定
;var(47) 飛び道具数制限
;var(48) カウンターヒット判定
;var(49) カウンターヒットフラグ
;var(50) 超必殺命中判定(EXゲージ専用）
;var(51) 瀕死時、超必殺連続使用制限(EXゲージ専用）
;var(52) MAX発動中フラグ
;var(53) 瀕死フラグ
;var(54) パワー増減量測定
;var(55) ライフ増減量測定
;var(56) パートナー同システムフラグ
;var(57) モード判定(ADV or EX or ULT)
;var(58) 超必殺技使用可能フラグ
;var(59) AIフラグ

;fvar(1) 着地後AirCornerPush補正
;fvar(2) P2Dist X
;fvar(3) P2Dist Y
;fvar(4) P2BodyDist X
;fvar(5) 
;fvar(6) 
;fvar(7)
;fvar(8) 
;fvar(9) 
;fvar(10) MAX時攻撃力修正
;fvar(11)
;fvar(12)
;fvar(13) 【AI】速度補正（画面端用）
;fvar(14) 【AI】相手速度補正（画面端用）
;fvar(15) 【AI】敵摩擦係数
;fvar(16) 【AI】敵重力
;fvar(17) 【AI】パートナー攻撃中
;fvar(18) 【AI】敵挟み込みフラグ（タッグ用）
;fvar(19) 【AI】タッグ用
;fvar(20) 【AI】飛び道具反射用
;fvar(21) 
;fvar(22) 
;fvar(23) 
;fvar(24) 補正後ダメージ
;fvar(25) カイザーウェイブ到達時、敵高度予測
;fvar(26) 02UMモード
;fvar(27) 94カッタースイッチ
;fvar(28) Bossモード選択
;fvar(29) モード判別（2002/98UM/S/S+)
;fvar(30) パワーゲージ表示
;fvar(31) AILv表示
;fvar(32) ULT時、ダッシュ or ステップ
;fvar(33) ULT時、緊急回避 or 避け
;fvar(34) ULT時、Advゲージ or Exゲージ
;fvar(35) 攻撃力変更（通常技）
;fvar(36) 攻撃力変更（投げ技）
;fvar(37) 攻撃力変更（必殺技）
;fvar(38) 攻撃力変更（超必殺技）
;fvar(39) デバッグ用

;【Sounds】
;Channel_1 ダッシュ
;Channel_2 パワー溜め1
;Channel_3 パワー溜め2
;Channel_4 ダメージ
;Channel_5 挑発
;Channel_6 ダブルトマホーク
;Channel_7 ジェノサイドカッター
;Channel_8 グラビティスマッシュ、溜めボイス
;Channel_9 グラビティスマッシュ、溜めSE
;Channel_10 バニシングラッシュ
;Channel_11 ルガールエクスキュージョン
;Channel_12 カイザーフェニックス
;Channel_13 デッドエンドスクリーマー
;Channel_14 ジェノサイドカッター 94
;Channel_15 白羅滅精
------------------------------------

;============================================================================
;============================================================================
;============================================================================


;============================================================================
;【勝利後】

[Statedef 180]
type = S
physics = S
anim = 180
velset = 0,0
ctrl = 0
sprpriority = 2

[State 181, win]
type = AssertSpecial
trigger1 = Time = [0,200]
flag = RoundNotOver

[State 180, random]
type = VarRandom
triggerall = fvar(29) = [5,6]
trigger1 = Time = 0
v = 1
range = 0,4

[State 180, change]
type = ChangeState
triggerall = fvar(29) = 4
trigger1 = Time = 0
value = 184

[State 180, change]
type = ChangeState
triggerall = Time = 0
trigger1 = var(1)
value = 180 + var(1)

[State 181, explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7000
pos = 3,-3
postype = p1
bindtime = -1
removetime = -2
sprpriority = 3
ownpal = 1
pausemovetime = 99999

[State 181, snd]
type = PlaySnd
trigger1 = AnimElem = 7
value = S10,(4+(fvar(29)=[1,3])*50+(fvar(26)=1)*(19+Random%3))

[Statedef 181]
type = S
physics = S
anim = 181
velset = 0,0
ctrl = 0
sprpriority = 2

[State 181, win]
type = AssertSpecial
trigger1 = Time = [0,200]
flag = RoundNotOver

[State 181, posadd]
type = PosAdd
trigger1 = AnimElem = 3
x = -4


[Statedef 182]
type = S
physics = S
anim = 182
velset = 0,0
ctrl = 0
sprpriority = 2

[State 182, win]
type = AssertSpecial
trigger1 = Time = [0,200]
flag = RoundNotOver

[State 182, snd]
type = PlaySnd
trigger1 = AnimElem = 3
value = S10,5

[State 182, explod]
type = Explod
trigger1 = AnimElem = 3, = 41
anim = 7030
pos = 0,0
postype = p1
bindtime = -1
sprpriority = 3
pausemovetime = 99999


[Statedef 183]
type = S
physics = S
anim = 183
velset = 0,0
ctrl = 0
sprpriority = 2

[State 183, helper]
type = Helper
trigger1 = Time = 0
helpertype = normal
name = "Hermione & Aya"
pos = 0,-300
postype = p1
facing = 1
stateno = 189
keyctrl = 0
ownpal = 1

[State 183, snd]
type = PlaySnd
trigger1 = AnimElem = 5
value = S10,7

[State 183, 0]
type = AssertSpecial
trigger1 = Time = [0,200]
flag = RoundNotOver


;ヒメーネ＆アヤ
[Statedef 189]
type = S
physics = N
anim = 7020
ctrl = 0
sprpriority = 3

[State 7020]
type = DestroySelf
trigger1 = Parent,StateNo != 183

[State 7020]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 7020, bind]
type = BindToParent
trigger1 = Pos Y >= -20
trigger2 = Anim = 7021
pos = 0,0
time = -1
facing = 1

[State 7020, snd]
type = PlaySnd
trigger1 = Anim = 7021
value = S10,8
persistent = 0

[State 7020]
type = VelAdd
trigger1 = Anim = 7020
trigger1 = Pos Y < 0
y = .5

[State 7020]
type = ChangeAnim
triggerall = Anim = 7020
trigger1 = Pos Y >= 0
value = 7021


[Statedef 184]
type = S
physics = S
anim = 184
velset = 0,0
ctrl = 0
sprpriority = 2

[State 184, win]
type = AssertSpecial
trigger1 = Time = [0,200]
flag = RoundNotOver

[State 184, snd]
type = PlaySnd
trigger1 = AnimElem = 3
value = S10,2
persistent = 0

[State 182, explod]
type = Explod
trigger1 = NumExplod(7040) = 0
trigger1 = AnimElem = 3
anim = 7040
ID = 7040
pos = 10,0
postype = p1
bindtime = -1
removetime = -1
sprpriority = 3
pausemovetime = 99999


;============================================================================
;【イントロ】
[Statedef 190]
type = S
ctrl = 0
anim = 190
velset = 0,0

[State 190, intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 190, vs krauser]
type = ChangeState
Triggerall = fvar(29) = [2,6]
Triggerall = Time = [0,1]
Trigger1 = Enemy,Name = "Krauser" && Enemy,AuthorName = "jin"
Trigger2 = NumEnemy = 2
Trigger2 = Enemy(1),Name = "Krauser" && Enemy(1),AuthorName = "jin"
value = 197

;対応用記述（コピペ用）
;trigger2 = (p2name = "Rugal2nd" || p4name = "Rugal2nd") && enemy,fvar(29) = [2,6]

[State 190, vs chris]
type = ChangeState
triggerall = fvar(29) = [4,6]
Triggerall = Time = [0,1]
Trigger1 = Enemy,Name = "goenitz" || Enemy,Name = "Goenitz" || Enemy,Name = "Goenitz_UM" || Enemy,Name = "Leopold Goenitz"
Trigger2 = NumEnemy = 2
Trigger2 = Enemy(1),Name = "goenitz" || Enemy(1),Name = "Goenitz" || Enemy(1),Name = "Goenitz_UM" || Enemy(1),Name = "Leopold Goenitz"
value = 193

[State 190, vs chris]
type = ChangeState
triggerall = fvar(29) = [4,6]
Triggerall = Time = [0,1]
Trigger1 = Enemy,Name = "Chris"
Trigger2 = NumEnemy = 2
Trigger2 = Enemy(1),Name = "Chris"
value = 192

[State 190, change]
type = ChangeState
triggerall = fvar(29) = [1,3]
trigger1 = Time = [0,1]
trigger1 = Random%2 = 1
value = 191

[State 190, change]
type = ChangeState
triggerall = fvar(29) = [4,6]
trigger1 = Time = [0,1]
trigger1 = Random%2 = 1 || fvar(29) = 4
value = 194

[State 190, explod]
type = Explod
trigger1 = Time = 28
anim = 7010
pos = 3,-3
postype = p1
bindtime = -1
removetime = -2
sprpriority = 3
ownpal = 1

[State 190, snd]
type = PlaySnd
triggerall = fvar(29) = [1,3]
trigger1 = Time = 28
value = S10,50+(fvar(26)=1)*20
channel = 0

[State 190, snd]
type = PlaySnd
triggerall = fvar(29) = [4,6]
trigger1 = AnimElem = 2
value = S10,3

[State 190, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0


;イントロ(2002 BOSS)
[Statedef 191]
type = S
ctrl = 0
anim = 191+(fvar(26)=1)*7
velset = 0,0

[State 191, intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 191, explod]
type = Explod
triggerall = !fvar(26)
triggerall = Time = 0
trigger1 = NumExplod(7050) = 0
anim = 7050
ID = 7050
pos = -5,0
postype = left
ownpal = 1
ontop = 1
bindtime = 60
removetime = 200
scale = 1.05,1.05
vel = 0,-2
pausemovetime = 99999

[State 191, snd]
type = PlaySnd
triggerall = !fvar(26)
trigger1 = Time = 60
value = S10,52
volume = 255
abspan = 0

[State 191, pause]
type = Pause
triggerall = !fvar(26)
trigger1 = Time = 0
time = 120
movetime = 120

[State 191, snd]
type = PlaySnd
trigger1 = AnimElem = 2
value = S10,51+(fvar(26)=1)*20
channel = 0

[State 191, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0


;イントロ(vs Chris)
[Statedef 192]
type = S
ctrl = 0
anim = 192
velset = 0,0

[State 192, intro]
type = AssertSpecial
trigger1 = 1
flag = intro

[State 192, snd]
type = PlaySnd
trigger1 = AnimElem = 3
value = S10,9

[State 192, snd]
type = PlaySnd
trigger1 = AnimElem = 28
value = S10,6

[State 192, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0


;イントロ(vs Goenitz)
[Statedef 193]
type = S
ctrl = 0
anim = 193
velset = 0,0

[State 193, intro]
type = AssertSpecial
trigger1 = 1
flag = intro

[State 193, pause]
type = Pause
trigger1 = Time = 0
time = 20
movetime = 20

[State 193, snd]
type = PlaySnd
trigger1 = AnimElem = 8 = 130
value = S10,7

[State 193, explod]
type = Explod
trigger1 = AnimElem = 15 = 36
anim = 7070
pos = 0,0
postype = p1
facing = 1
bindtime = -1
removetime = -2
ownpal = 1
sprpriority = 3

[State 193, snd]
type = PlaySnd
trigger1 = AnimElem = 15
value = S2,23

[State 193, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0


;イントロ(98UM OMEGA)
[Statedef 194]
type = S
ctrl = 0
anim = 194
velset = 0,0

[State 194, intro]
type = AssertSpecial
trigger1 = 1
flag = intro

[State 194, explod]
type = Explod
trigger1 = Time = 0
anim = 7060
ID = 7060
pos = 0,0
postype = p1
bindtime = -1
removetime = -1
sprpriority = 3
ownpal = 1
supermovetime = 2147483647
pausemovetime = 2147483647

[State 194]
type = RemoveExplod
trigger1 = AnimElem = 8
ID = 7060

[State 194, explod]
type = Explod
trigger1 = AnimElem = 8
anim = 7061
ID = 7061
pos = 0,0
postype = p1
bindtime = -1
removetime = -2
sprpriority = 3
ownpal = 1
supermovetime = 2147483647
pausemovetime = 2147483647

[State 194, snd]
type = PlaySnd
trigger1 = AnimElem = 2
value = S10,0

[State 194, snd]
type = PlaySnd
trigger1 = AnimElem = 14
value = S10,1

[State 194, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0


;イントロ(vs Krauser)
[Statedef 197]
type = S
ctrl = 0
anim = 197
velset = 0,0

[State 197, intro]
type = AssertSpecial
trigger1 = 1
flag = intro

[State 197, posadd]
type = PosAdd
trigger1 = Time = 0
x = -18

[State 197, posadd]
type = PosAdd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 5
x = -7

[State 197, posadd]
type = PosAdd
trigger1 = AnimElem = 28
trigger2 = AnimElem = 29
x = 20

[State 197, posadd]
type = PosAdd
trigger1 = AnimElem = 34
x = -8

[State 197, explod]
type = Explod
triggerall = NumExplod(197) = 0
trigger1 = AnimElem = 7
ID = 197
anim = 8100
pos = -62,-90
postype = p1
sprpriority = 3
bindtime = -1
removetime = -1
removeongethit = 1

[State 197, modifyexplod]
type = ModifyExplod
trigger1 = AnimElem = 8
ID = 197
pos = -60,-84
postype = p1

[State 197, modifyexplod]
type = ModifyExplod
trigger1 = AnimElem = 9
ID = 197
pos = -62,-82
postype = p1

[State 197, modifyexplod]
type = ModifyExplod
trigger1 = AnimElem = 13
ID = 197
pos = -60,-76
postype = p1

[State 197, modifyexplod]
type = ModifyExplod
trigger1 = AnimElem = 14
ID = 197
pos = -62,-73
postype = p1

[State 197, modifyexplod]
type = ModifyExplod
trigger1 = AnimElem = 15
trigger2 = AnimElem = 17
trigger3 = AnimElem = 19
trigger4 = AnimElem = 21
trigger5 = AnimElem = 23
trigger6 = AnimElem = 25
trigger7 = AnimElem = 27
ID = 197
pos = -64,-70
postype = p1

[State 197, modifyexplod]
type = ModifyExplod
trigger1 = AnimElem = 16
trigger2 = AnimElem = 18
trigger3 = AnimElem = 20
trigger4 = AnimElem = 22
trigger5 = AnimElem = 24
trigger6 = AnimElem = 26
trigger7 = AnimElem = 28
ID = 197
pos = -63,-69
postype = p1

[State 197, modifyexplod]
type = RemoveExplod
trigger1 = AnimElem = 28
ID = 197

[State 3000]
type = Projectile
trigger1 = AnimElem = 29, = 1
projID = 7080
projanim = 7080
projhitanim = 7081
projremove = 1
projpriority = 1
projsprpriority = 0
offset = 50,0
velocity = 8
attr = S,SP
hitflag = P
sparkno = -1
guard.sparkno = -1

[State 197, snd]
type = PlaySnd
trigger1 = AnimElem = 29, = 1
value = S3,6

[State 197, snd]
type = PlaySnd
triggerall = fvar(29) = 4
trigger1 = AnimElem = 2
value = S2,3
volume = 150

[State 197, snd]
type = PlaySnd
triggerall = fvar(29) = 4
trigger1 = AnimElem = 28
value = S2,4
volume = 150

[State 197, snd]
type = PlaySnd
triggerall = fvar(29) = [1,3]
trigger1 = AnimElem = 28
value = S2,52
volume = 150

[State 197, snd]
type = PlaySnd
triggerall = fvar(29) = [5,6]
trigger1 = AnimElem = 5
value = S2,12
volume = 150

[State 195, snd]
type = PlaySnd
triggerall = fvar(29) = [1,3]
trigger1 = AnimElem = 34,= 10
value = S10,65
volume = 150

[State 195, snd]
type = PlaySnd
triggerall = fvar(29) = [4,6]
trigger1 = AnimElem = 34,= 10
value = S2,2
volume = 150

[State 197, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0


;============================================================================
;【挑発】

[Statedef 195]
type = S
physics = S
movetype = I
anim = 195
velset = 0,0
ctrl = 0
sprpriority = 2

[State -2, 挑発ボイス中断]
type = stopsnd
trigger1 = Time = 0
channel = 5

[State 195, change]
type = ChangeState
triggerall = Time = 0
trigger1 = fvar(29) = 4
trigger2 = fvar(29) = [5,6]
trigger2 = Random%2 = 1
value = 196

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State 195, snd]
type = PlaySnd
triggerall = fvar(29) = [1,3]
trigger1 = Time = 0
value = S10,53+(fvar(26)=1)*19
channel = 5

[State 195, snd]
type = PlaySnd
triggerall = fvar(29) = [4,6]
trigger1 = Time = 0
value = S2,2
channel = 5

[State 195, ctrl]
type = CtrlSet
triggerall = !Win
triggerall = fvar(29) != 4
trigger1 = AnimElem = 7,= 1
value = 1

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 195, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


[Statedef 196]
type = S
physics = S
movetype = I
anim = 196
velset = 0,0
ctrl = 0
sprpriority = 2

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State -2, 挑発ボイス中断]
type = stopsnd
trigger1 = Time = 0
channel = 5

[State 196, snd]
type = PlaySnd
trigger1 = Time = 0
value = S2,2
channel = 5

[State 196, pos]
type = PosAdd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 15
x = -4

[State 196, pos]
type = PosAdd
trigger1 = AnimElem = 8
x = 7

[State 196, ctrl]
type = CtrlSet
triggerall = !Win
triggerall = fvar(29) != 4
trigger1 = AnimElem = 6, = 8
value = 1

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 196, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;-----------------------------------------------------------------
;緊急回避・前
[Statedef 900]
type = S
physics = S
movetype = I
anim = 900 + (PrevStateNo = 150 || PrevStateNo = 152)*5
ctrl = 0
sprpriority = -1
velset = 0,0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = PrevStateNo = 900
trigger1 = P2Dist X < 0

[State -2, Turn]
type = ChangeState
trigger1 = PrevStateNo = [100,101]
trigger1 = Time = 0
trigger1 = P2Dist X < 0
value = 910

[State 900, playerpush]
type = PlayerPush
trigger1 = 1
value = 0

[State -2, GC]
type = Pause
triggerall = PrevStateNo = 150 || PrevStateNo = 152
trigger1 = Time = 0
time = 10
movetime = 10

[State -2, GC]
type = EnvColor
triggerall = PrevStateNo = 150 || PrevStateNo = 152
trigger1 = Time = 0
value = 255,255,255
time = 4
under = 1

[State -2, GC]
type = Explod
triggerall = PrevStateNo = 150 || PrevStateNo = 152
trigger1 = AnimElem = 1
anim = 7590
sprpriority = 4
removetime = -2
pos = 16,-112;要調整
postype = p1
pausemovetime = 99999

[State -2, GC]
type = VarSet
triggerall = fvar(34) = 2 && var(52)
triggerall = PrevStateNo = 150 || PrevStateNo = 152
trigger1 = time = 0
var(52) = 0

[State -2, GC]
type = PowerAdd
triggerall = !(fvar(34) = 2 && var(52))
triggerall = PrevStateNo = 150 || PrevStateNo = 152
trigger1 = time = 0
value = -1000

[State 900, nothitby]
type = NotHitBy
trigger1 = PrevStateNo = 150 || PrevStateNo = 152
value = SCA
time = 1
ignorehitpause = 1

[State 900, hitby]
type = HitBy
triggerall = !(PrevStateNo = 150 || PrevStateNo = 152)
trigger1 = AnimElem = 6, < 0;要調整
value = SCA,AT
time = 1

[State 900, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),54,70),2)
channel = 0

[State 900, vel]
type = Velset
triggerall = !(PrevStateNo = 150 || PrevStateNo = 152)
trigger1 = AnimElem = 3, >= 0 && AnimElem = 6, < 1
x = 5.6 + (PrevStateNo = [99,101])*2

[State 900, stop]
type = VelSet
triggerall = !(PrevStateNo = 150 || PrevStateNo = 152)
trigger1 = AnimElem = 6, = 1
x = 0

[State 900, vel]
type = Velset
triggerall = PrevStateNo = 150 || PrevStateNo = 152
trigger1 = AnimElem = 4, >= 0 && AnimElem = 7, < 1
x = 5.6 + (fvar(29)!=1)*2

[State 900, stop]
type = VelSet
triggerall = PrevStateNo = 150 || PrevStateNo = 152
trigger1 = AnimElem = 7, = 1
x = 0

[State 900, afterimage]
type = afterimage
trigger1 = PrevStateNo = 150 || PrevStateNo = 152
trigger1 = AnimElem = 1, = 1
time = 28
length = 7
palcolor = 0
palinvertall = 0
palcontrast = 256, 256, 256
palbright = 0, 30, 100
palpostbright = 30, 0, 30
paladd = 0, 0, 0
palmul = 1, 1, 1
framegap = 3
ignorehitpause = 1
persistent = 0

[State 900, afterimage]
type = afterimage
trigger1 = !(PrevStateNo = 150 || PrevStateNo = 152)
trigger1 = AnimElem = 1, = 1
time = 14
length = 7
palinvertall = 0
palcontrast = 256, 256, 256
palbright = 0, 0, 0
palpostbright = -25, 0, 0
paladd = 0, 0, 0
palmul = 1, 1, 1
FrameGap = 3
ignorehitpause = 1
persistent = 0

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 900, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;-----------------------------------------------------------------
;クイック緊急回避
[Statedef 905]
type = S
physics = S
movetype = I
anim = 905
ctrl = 0
sprpriority = -1

[State 905]
type = PosFreeze
trigger1 = Time < 10
value = 1

[State 905, playerpush]
type = PlayerPush
trigger1 = 1
value = 0

[State -2, QC]
type = Pause
trigger1 = Time = 0
time = 10
movetime = 10

[State -2, QC]
type = EnvColor
trigger1 = Time = 0
value = 255,255,255
time = 4
under = 1

[State -2, QC]
type = Explod
trigger1 = Time = 0
anim = 7590
sprpriority = 4
removetime = -2
pos = 16,-112;要調整
postype = p1
pausemovetime = 99999

[State -2, QC]
type = VarAdd
triggerall = ((fvar(34)=2&&var(52)) || (!(fvar(29)=1||fvar(29)=4)&&var(52)))
trigger1 = time = 0
var(52) = -540

[State -2, QC]
type = PowerAdd
triggerall = !((fvar(34)=2&&var(52)) || (!(fvar(29)=1||fvar(29)=4)&&var(52)))
trigger1 = time = 0
value = -1000

[State 905, hitby]
type = HitBy
trigger1 = AnimElem = 7, < 0;要調整
value = SCA,AT
time = 1

[State 905, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),54,70),2)
channel = 0

[State 905, vel]
type = Velset
trigger1 = animelem = 4 , >= 0 && AnimElem = 7, < 1
x = 5

[State 905, stop]
type = VelSet
trigger1 = AnimElem = 7, = 1
x = 0

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 905, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;-----------------------------------------------------------------
;緊急回避・後
[Statedef 910]
type = S
physics = S
movetype = I
anim = 910 + (PrevStateNo = 150 || PrevStateNo = 152)*5
ctrl = 0
sprpriority = -1
velset = 0,0

[State -2, Turn]
type = Turn
trigger1 = PrevStateNo = 900
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State -2, Turn]
type = ChangeState
trigger1 = PrevStateNo = [100,101]
trigger1 = Time = 0
trigger1 = P2Dist X < 0
value = 900

[State 910, playerpush]
type = PlayerPush
trigger1 = 1
value = 0

[State -2, GC]
type = Pause
triggerall = PrevStateNo = 150 || PrevStateNo = 152
trigger1 = Time = 0
time = 10
movetime = 10

[State -2, GC]
type = EnvColor
triggerall = PrevStateNo = 150 || PrevStateNo = 152
trigger1 = Time = 0
value = 255,255,255
time = 4
under = 1

[State -2, GC]
type = Explod
triggerall = PrevStateNo = 150 || PrevStateNo = 152
trigger1 = Time = 0
anim = 7590
sprpriority = 4
removetime = -2
pos = 16,-112;要調整
postype = p1
pausemovetime = 99999

[State -2, GC]
type = VarSet
triggerall = fvar(34) = 2 && var(52)
triggerall = PrevStateNo = 150 || PrevStateNo = 152
trigger1 = time = 0
var(52) = 0

[State -2, GC]
type = PowerAdd
triggerall = !(fvar(34) = 2 && var(52))
triggerall = PrevStateNo = 150 || PrevStateNo = 152
trigger1 = time = 0
value = -1000

[State 910, nothitby]
type = NotHitBy
trigger1 = PrevStateNo = 150 || PrevStateNo = 152
value = SCA
time = 1
ignorehitpause = 1

[State 910, hitby]
type = HitBy
triggerall = !(PrevStateNo = 150 || PrevStateNo = 152)
trigger1 = AnimElem = 5, < 0;要調整
value = SCA,AT
time = 1

[State 910, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),54,70),2)
channel = 0

[State 910, vel]
type = Velset
triggerall = !(PrevStateNo = 150 || PrevStateNo = 152)
trigger1 = AnimElem = 3, >= 0 && AnimElem = 6, < 1
x = -5

[State 910, stop]
type = VelSet
triggerall = !(PrevStateNo = 150 || PrevStateNo = 152)
trigger1 = AnimElem = 6, = 1
x = 0

[State 910, vel]
type = Velset
triggerall = PrevStateNo = 150 || PrevStateNo = 152
trigger1 = AnimElem = 4, >= 0 && AnimElem = 7, < 1
x = -5-(fvar(29)!=1)*2

[State 910, stop]
type = VelSet
triggerall = PrevStateNo = 150 || PrevStateNo = 152
trigger1 = AnimElem = 7, = 1
x = 0

[State 910, afterimage]
type = afterimage
trigger1 = PrevStateNo = 150 || PrevStateNo = 152
trigger1 = AnimElem = 1, = 1
time = 28
length = 7
palcolor = 0
palinvertall = 0
palcontrast = 256, 256, 256
palbright = 0, 30, 100
palpostbright = 30, 0, 30
paladd = 0, 0, 0
palmul = 1, 1, 1
framegap = 3
ignorehitpause = 1
persistent = 0

[State 910, afterimage]
type = afterimage
trigger1 = !(PrevStateNo = 150 || PrevStateNo = 152)
trigger1 = AnimElem = 1, = 1
time = 14
length = 7
palinvertall = 0
palcontrast = 256, 256, 256
palbright = 0, 0, 0
palpostbright = -25, 0, 0
paladd = 0, 0, 0
palmul = 1, 1, 1
FrameGap = 3
ignorehitpause = 1
persistent = 0

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 910, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;-----------------------------------------------------------------
;攻撃避け
[Statedef 930]
type = S
physics = S
movetype = I
anim = 930
velset = 0,0
ctrl = 0
sprpriority = -1

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State 905, playerpush]
type = PlayerPush
trigger1 = 1
value = 0

[State 930, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),54,70),2)
channel = 0

[State 930, hitby]
type = HitBy
trigger1 = 1
value = SCA,AT
time = 1

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 930, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;-----------------------------------------------------------------
;クイック攻撃避け
[Statedef 935]
type = S
physics = S
movetype = I
anim = 930
velset = 0,0
ctrl = 0
sprpriority = -1

[State 935]
type = PosFreeze
trigger1 = Time < 10
value = 1

[State -2, QC]
type = Pause
trigger1 = Time = 0
time = 10
movetime = 10

[State -2, QC]
type = EnvColor
trigger1 = Time = 0
value = 255,255,255
time = 4
under = 1

[State -2, QC]
type = Explod
trigger1 = AnimElem = 1
anim = 7590
sprpriority = 4
removetime = -2
pos = 16,-112;要調整
postype = p1
pausemovetime = 99999

[State -2, QC]
type = VarAdd
triggerall = ((fvar(34)=2&&var(52)) || (!(fvar(29)=1||fvar(29)=4)&&var(52)))
trigger1 = time = 0
var(52) = -540

[State -2, QC]
type = PowerAdd
triggerall = !((fvar(34)=2&&var(52)) || (!(fvar(29)=1||fvar(29)=4)&&var(52)))
trigger1 = time = 0
value = -1000

[State 935, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),54,70),2)
channel = 0

[State 935, hitby]
type = HitBy
trigger1 = 1
value = SCA,AT
time = 1

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 935, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1



;---------------------------------------------------------------------------
;MAX発動
[Statedef 950]
type = S
movetype = I
physics = S
ctrl = 0
velset = 0,0
poweradd = -1000
anim = 950
sprpriority = 2

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State 950, max]
type = VarSet
trigger1 = fvar(29) != 1
trigger1 = AnimElem = 1
var(52) = 1080 + ((!(fvar(29) = 1 || fvar(29) = 4) || fvar(34) = 2) && var(53))*480

[State 950, max]
type = VarSet
trigger1 = fvar(29) = 1
trigger1 = AnimElem = 1
var(52) = 780

[State 951]
type = varset
trigger1 = time = 0
fvar(39) = 0.6

[State 951, 锁气用]
type = varset
trigger1 = Time = 0
trigger1 = fvar(26) = 1		;只针对02UM模式
fvar(5) = power 

[State -2, MAX発動音]
type = PlaySnd
trigger1 = fvar(29) = 1
trigger1 = AnimElem = 1
value = S8,0

[State 950, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),53,73),0)

[State 950, shake]
type = EnvShake
trigger1 = AnimElem = 5;要調整
time = 10
freq = 60
ampl = -4

[State 950, nothitby]
type = NotHitBy
triggerall = fvar(29) = 3 || fvar(29) = 6
trigger1 = 1
value = ,AT
time = 1

[State 950, nothitby]
type = NotHitBy
triggerall = fvar(29) != 4
trigger1 = Time < 3
value = ,AT
time = 1

[State 950, explod]
type = Explod
trigger1 = fvar(29) != 1
trigger1 = AnimElem = 5;要調整
anim = 7550
pos = 0,0
postype = p1
facing = 1
bindtime = -1
sprpriority = 3
ownpal = 1
pausemovetime = 99999

[State 950, explod]
type = Explod
trigger1 = fvar(29) = 1
trigger1 = AnimElem = 1;要調整
anim = 7560
pos = 10,-60
postype = p1
facing = 1
bindtime = -1
sprpriority = 0
ownpal = 1
pausemovetime = 99999

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 950, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;-----------------------------------------------------------------
[Statedef 951];クイックMAX発動
type = S
physics = S
movetype = I
anim = anim
velset = 0,0
ctrl = 0
sprpriority = 2
poweradd = -2000
ignorehitpause = 1

[State 951, nothitby]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 951, max]
type = varset
trigger1 = Time = 0
var(52) = 780

[State 951]
type = varset
trigger1 = time = 0
fvar(39) = 0.4

[State 951, 锁气用]
type = varset
trigger1 = Time = 0
trigger1 = fvar(26) = 1		;只针对02UM模式
fvar(5) = power 

[State 951, snd]
type = PlaySnd
trigger1 = Time = 0
value = S8,10

[State 950, end]
type = ChangeState
triggerall = !var(59)
trigger1 = Time = 0
trigger1 = Command = "holdfwd" || Command = "holdback"
trigger1 = !(Command = "holddown" || Command = "holdup" || Command = "longjump")
value = 20
ctrl = 1

[State 950, end]
type = ChangeState
triggerall = !var(59)
trigger1 = Time = 0
trigger1 = Command = "holdup" || Command = "longjump" 
value = 40
ctrl = 1

[State 950, end]
type = ChangeState
triggerall = !var(59)
trigger1 = Time = 0
trigger1 = Command = "holddown" 
value = 10
ctrl = 1

[State 950, end]
type = ChangeState
trigger1 = Time = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;パワー溜め
[Statedef 980]
type    = S
movetype= I
physics = S
poweradd= 0
ctrl = 0
velset = 0,0
anim = 980
sprpriority = 2

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State 980, snd]
type = PlaySnd
trigger1 = animelem = 1
value = S8,2;要調整
channel = 2

[State 980, snd]
type = PlaySnd
trigger1 = animelem = 1
value = S10,IfElse((fvar(29)=[1,3]),66,0)
channel = 3
volume = 150

[State 980, explod]
type = Explod
trigger1 = AnimElem = 3;要調整
anim = 7500
ID = 7500
pos = 0,0
postype = p1
bindtime = -1
removetime = -1
removeongethit = 1
ownpal = 1
sprpriority = 3
pausemovetime = 99999

[State 980, poweradd]
type = poweradd
trigger1 = 1
value = 11

[State 980, end]
type = ChangeState
trigger1 = Time = 0
trigger1 = var(52)
value = 0
ctrl = 1

[State 980, end]
type = ChangeState
triggerall = AnimElem = 2, > 0
Trigger1 = Power >= IfElse((fvar(29)=4&&NumPartner=0),1000,PowerMax)
Trigger2 = RoundState != 2
value = 981

[State 980, end]
type = ChangeState
triggerall = var(59) = 0
triggerall = AnimElem = 2, > 0
trigger1 = command != "holdx"
trigger2 = command != "holdy"
trigger3 = command != "holda"
value = 981


[Statedef 981];パワー溜めend
type    = S
movetype= I
physics = S
poweradd= 0
ctrl = 0
velset = 0,0
anim = 981
sprpriority = 2

[State 981, removeexplod]
type = RemoveExplod
trigger1 = time = 0
ID = 7500

[State 981, stopsnd]
type = stopsnd
trigger1 = time = 0
channel = 2

[State 981, stopsnd]
type = stopsnd
trigger1 = time = 0
channel = 3

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 981, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;============================================================================
;============================================================================
;============================================================================

;吹っ飛ばし攻撃
[Statedef 240]
type = S
physics = S
movetype = A
poweradd = 0
ctrl = 0
anim = 240
sprpriority = 2

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State 240, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),52,72),1)

[State 240, snd2]
type = PlaySnd
trigger1 = AnimElem = 1
value = S3,1

[State 240, hitdef 2002]
type = HitDef
triggerall = fvar(29) = 1 && !fvar(26)
triggerall = !var(9)
trigger1 = AnimElem = 4, = 1
attr = S,NA
damage = Ceil(16*(100-Random%11)*fvar(10)*fvar(35)/10/103)
animtype = Back
ground.type = High
guardflag = M
hitflag = MAF
priority = 7,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -15,-80-(P2StateType=A)*20
hitsound = S5,9
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 21
ground.hittime = 21
guard.ctrltime = 21
air.hittime = 60
ground.velocity = -4,-7.5
guard.velocity = -13.75
air.velocity = -4,-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125)
givepower = 15,15
ID = 240

[State 240, hitdef 2002um]
type = HitDef
triggerall = fvar(29) = 1 && fvar(26)
triggerall = !var(9)
trigger1 = AnimElem = 4, = 1
attr = S,NA
damage = 90*fvar(39)
animtype = Back
ground.type = High
guardflag = M
hitflag = MAF
priority = 7,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -15,-80-(P2StateType=A)*20
hitsound = S5,9
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 21
ground.hittime = 21
guard.ctrltime = 21
air.hittime = 60
ground.velocity = -4,-7.5
guard.velocity = -13.75
air.velocity = -4,-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,150),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,150)
givepower = 15,15
ID = 240

[State 240, hitdef 98UM]
type = HitDef
triggerall = fvar(29) != 1
triggerall = !var(9)
triggerall = !var(52)
trigger1 = AnimElem = 4, = 1
attr = S,NA
damage = Ceil(17*100*fvar(10)*fvar(35)/10/119)
animtype = Back
ground.type = High
guardflag = M
hitflag = MAF
priority = 7,hit
sparkno = S7201
guard.sparkno = S7211
sparkxy = -15,-80-(P2StateType=A)*20
hitsound = S5,4
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 21
ground.hittime = 21
guard.ctrltime = 21
air.hittime = 60
ground.velocity = -4-(fvar(29)=4&&var(52)>0),-7.5
guard.velocity = -13.75-(fvar(29)=4&&var(52)>0)*2.25
air.velocity = -4-(fvar(29)=4&&var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125)
givepower = 15,15
ID = 240

[State 240, hitdef 98UM(MAX)]
type = HitDef
triggerall = fvar(29) != 1
triggerall = !var(9)
triggerall = var(52)
trigger1 = AnimElem = 4, = 1
attr = S,NA
damage = Ceil(17*100*fvar(10)*fvar(35)/10/119)
animtype = Up
ground.type = High
guardflag = M
hitflag = MAF
priority = 7,hit
sparkno = S7201
guard.sparkno = S7211
sparkxy = -15,-80-(P2StateType=A)*20
hitsound = S5,4
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 21
ground.hittime = 21
guard.ctrltime = 21
air.hittime = 60
ground.velocity = -4-(fvar(29)=4&&var(52)>0),-7.5
guard.velocity = -13.75-(fvar(29)=4&&var(52)>0)*2.25
air.velocity = -4-(fvar(29)=4&&var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125)
givepower = 15,15
ID = 240

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 240, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;---------------------------------------------------------------------------
;ガードキャンセル吹っ飛ばし攻撃
[Statedef 245]
type = S
movetype = A
physics = S
anim = 245+(fvar(29) = 4)
ctrl = 0
velset = 0,0
poweradd = 0
sprpriority = 2

[State -2, GC]
type = PosAdd
triggerall = fvar(29) = 4
trigger1 = Time = 0
x = 4

[State -2, GC]
type = Pause
triggerall = fvar(29) = 4
trigger1 = Time = 0
time = 10
movetime = 10

[State -2, GC]
type = EnvColor
triggerall = fvar(29) = 4
trigger1 = Time = 0
value = 255,255,255
time = 4
under = 1

[State 245, nothitby]
type = NotHitBy
triggerall = fvar(29) != 4
trigger1 = AnimElem = 6, < 0
value = SCA
time = 1

[State 245, nothitby]
type = NotHitBy
triggerall = fvar(29) = 4
trigger1 = AnimElem = 5, < 0
value = SCA
time = 1

[State -2, GC]
type = Explod
triggerall = fvar(29) = 4
trigger1 = AnimElem = 1
anim = 7590
sprpriority = 4
removetime = -2
pos = -16,-80;要調整
postype = p1
pausemovetime = 99999

[State 245, hitdef 2002]
type = HitDef
triggerall = fvar(29) != 4 && !fvar(26)
triggerall = !var(9)
trigger1 = AnimElem = 5, = 1
attr = S,NA
damage = Ceil(2*(100-Random%11)*fvar(10)*fvar(35)/10/103)
animtype = Back
ground.type = High
guardflag = M
hitflag = MAF
priority = 7,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -20,-75
hitsound = S5,9
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 21
ground.hittime = 21
guard.ctrltime = 21
air.hittime = 60
ground.velocity = -4,-7.5
guard.velocity = -13.75
air.velocity = -4,-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15
ID = 245

[State 245, hitdef 2002um]
type = HitDef
triggerall = fvar(26)
triggerall = !var(9)
trigger1 = AnimElem = 5, = 1
attr = S,NA
damage = Ceil(IfElse(fvar(28)=0,2,2)*fvar(10)*fvar(35)/12)
animtype = Back
ground.type = High
guardflag = M
hitflag = MAF
priority = 7,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -20,-75
hitsound = S5,9
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 21
ground.hittime = 21
guard.ctrltime = 21
air.hittime = 60
ground.velocity = -4,-7.5
guard.velocity = -13.75
air.velocity = -4,-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15
ID = 245

[State 245, hitdef 98UM]
type = HitDef
triggerall = fvar(29) = 4
triggerall = !var(9)
triggerall = !var(52)
trigger1 = AnimElem = 3, = 1
attr = S,NA
damage = Ceil(3*100*fvar(10)*fvar(35)/10/119)
animtype = Back
ground.type = High
guardflag = M
hitflag = MAF
priority = 7,hit
sparkno = S7201
guard.sparkno = S7211
sparkxy = -20,-75
hitsound = S5,4
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 21
ground.hittime = 21
guard.ctrltime = 21
air.hittime = 60
ground.velocity = -4-(fvar(29)=4&&var(52)>0),-7.5
guard.velocity = -13.75-(fvar(29)=4&&var(52)>0)*2.25
air.velocity = -4-(fvar(29)=4&&var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15
ID = 245

[State 245, hitdef 98UM(MAX)]
type = HitDef
triggerall = fvar(29) = 4
triggerall = !var(9)
triggerall = var(52)
trigger1 = AnimElem = 3, = 1
attr = S,NA
damage = Ceil(3*100*fvar(10)*fvar(35)/10/119)
animtype = UP
ground.type = High
guardflag = M
hitflag = MAF
priority = 7,hit
sparkno = S7201
guard.sparkno = S7211
sparkxy = -20,-75
hitsound = S5,4
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 21
ground.hittime = 21
guard.ctrltime = 21
air.hittime = 60
ground.velocity = -4-(fvar(29)=4&&var(52)>0),-7.5
guard.velocity = -13.75-(fvar(29)=4&&var(52)>0)*2.25
air.velocity = -4-(fvar(29)=4&&var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15
ID = 245

[State -2, GC]
type = VarSet
triggerall = fvar(34) = 2 && var(52)
trigger1 = time = 0
var(52) = 0

[State -2, GC]
type = PowerAdd
triggerall = !(fvar(34) = 2 && var(52))
trigger1 = time = 0
value = -1000

[State 245, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S3,1

[State 245, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),52,72),1)

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 245, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;-----------------------------------------------------------------
;避け攻撃
[Statedef 250]
type = S
physics = S
movetype = A
poweradd = 0
ctrl = 0
anim = 250
sprpriority = 2

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State 250, nothitby]
type = NotHitBy
trigger1 = AnimElem = 2, < 0
value = SCA
time = 1

[State -2, hitdef]
type = HitDef
triggerall = !var(9)
trigger1 = AnimElem = 5, = 1
attr = S,NA
damage = Ceil(12*100*fvar(10)*fvar(35)/10/119)
animtype = Hard
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7201
guard.sparkno = S7211
sparkxy = -15,-75
hitsound = S5,1
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 21
ground.hittime = 21
guard.ctrltime = 21
air.hittime = 60
ground.velocity = -10.35-(fvar(29)=4&&var(52)>0)
air.velocity = -4,-7.5
yaccel = .55
air.fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = 0,0
givepower = 15,15
ID = 250

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 250, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;=================================================================
;遠距離弱パンチ
[Statedef 200]
type = S
physics = S
movetype = A
poweradd = 0
ctrl = 0
anim = 200
sprpriority = 2

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State 200, snd]
type = PlaySnd
trigger1 = random%2 = 1
trigger1 = AnimElem = 1
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),50,70),0)
channel = 0

[State 200, snd2]
type = PlaySnd
trigger1 = AnimElem = 1
value = S3,0

[State 200, hitdef 2002]
type = HitDef
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 4, = 1
attr = S,NA
damage = Ceil(8*(100-Random%11)*fvar(10)*fvar(35)/10/103)
animtype = Light
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7250
guard.sparkno = S7260
sparkxy = -10,-75
hitsound = S5,IfElse(Random%2=1,5,10)
guardsound = S6,0
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75*(1-(PrevStateNo = [200,600))*0.2)
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,59),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,59)
givepower = 15,15
ID = 200

[State 200, hitdef 2002um]
type = HitDef
triggerall = fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 4, = 1
attr = S,NA
damage = 25*fvar(39)
animtype = Light
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7250
guard.sparkno = S7260
sparkxy = -10,-75
hitsound = S5,IfElse(Random%2=1,5,10)
guardsound = S6,0
pausetime = 11,13
guard.pausetime = 11,11
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75*(1-(PrevStateNo = [200,600))*0.2)
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,75),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,75)
givepower = 15,15
ID = 200

[State 200, hitdef 98UM]
type = HitDef
triggerall = fvar(29) = 4
trigger1 = !var(9)
trigger1 = AnimElem = 4, = 1
attr = S,NA
damage = Ceil(11*100*fvar(10)*fvar(35)/10/119)
animtype = Light
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7200
guard.sparkno = S7210
sparkxy = -10,-75
hitsound = S5,0
guardsound = S6,0
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = (-5.75-(fvar(29)=4&&var(52)>0)*1.35)*(1-(PrevStateNo = [200,600))*0.2)
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,63),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,63)
givepower = 15,15
ID = 200

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 200, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;=================================================================
;近距離弱パンチ
[Statedef 205]
type = S
physics = S
movetype = A
poweradd = 0
ctrl = 0
anim = 205
sprpriority = 2

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State 205, snd]
type = PlaySnd
trigger1 = random%2 = 1
trigger1 = AnimElem = 1
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),50,70),0)
channel = 0

[State 205, snd2]
type = PlaySnd
trigger1 = AnimElem = 1
value = S3,0

[State 205, hitdef 2002]
type = HitDef
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 2, = 1
attr = S,NA
damage = Ceil(8*(100-Random%11)*fvar(10)*fvar(35)/10/103)
animtype = Light
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7250
guard.sparkno = S7260
sparkxy = -10,-75+Floor(P2BodyDist Y*0.5)
hitsound = S5,IfElse(Random%2=1,5,10)
guardsound = S6,0
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75*(1-(PrevStateNo = [200,600))*0.2)
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,59),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,59)
givepower = 15,15
ID = 205

[State 205, hitdef 2002um]
type = HitDef
triggerall = fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 2, = 1
attr = S,NA
damage = 25*fvar(39)
animtype = Light
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7250
guard.sparkno = S7260
sparkxy = -10,-75+Floor(P2BodyDist Y*0.5)
hitsound = S5,IfElse(Random%2=1,5,10)
guardsound = S6,0
pausetime = 11,13
guard.pausetime = 11,11
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75*(1-(PrevStateNo = [200,600))*0.2)
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,75),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,75)
givepower = 15,15
ID = 205

[State 205, hitdef 98UM]
type = HitDef
triggerall = fvar(29) = 4
trigger1 = !var(9)
trigger1 = AnimElem = 2, = 1
attr = S,NA
damage = Ceil(11*100*fvar(10)*fvar(35)/10/119)
animtype = Light
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7200
guard.sparkno = S7210
sparkxy = -10,-75+Floor(P2BodyDist Y*0.5)
hitsound = S5,0
guardsound = S6,0
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = (-5.75-(fvar(29)=4&&var(52)>0)*1.35)*(1-(PrevStateNo = [200,600))*0.2)
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,63),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,63)
givepower = 15,15
ID = 205

[State 205]
type = VarSet
trigger1 = NumTarget(205)
trigger1 = MoveHit
var(9) = 1
IgnoreHitPause = 1

[State 205]
type = TargetState
triggerall = NumTarget(205)
Trigger1 = Target,StateType = A
Trigger1 = Target,MoveType = H
Trigger1 = MoveHit
value = 115020
ID = 205
ignorehitpause = 1
persistent = 0



[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 205, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;=================================================================
;遠距離強パンチ
[Statedef 210]
type = S
physics = S
movetype = A
poweradd = 0
ctrl = 0
anim = 210+!(fvar(29)=1&&!fvar(26))
sprpriority = 2

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State 210, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),51,71),1)
channel = 0

[State 210, snd2]
type = PlaySnd
trigger1 = AnimElem = 1
value = S3,0

[State 210, posadd]
type = PosAdd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 6
trigger3 = AnimElem = 7
x = 8

[State 210, hitdef 2002]
type = HitDef
triggerall = fvar(29) = 1 && !fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 7, = 1
attr = S,NA
damage = Ceil(15*(100-Random%11)*fvar(10)*fvar(35)/10/103)
animtype = Hard
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -15,-60
hitsound = S5,IfElse(Random%2=1,6,11)
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -10.35
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 210

[State 210, hitdef 2002um]
type = HitDef
triggerall = fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 7, = 1
attr = S,NA
damage = 70*fvar(39)
animtype = Hard
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -15,-60
hitsound = S5,IfElse(Random%2=1,6,11)
guardsound = S6,1
pausetime = 11,13
guard.pausetime = 11,11
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -10.35
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125)
givepower = 15,15
ID = 210

[State 210, hitdef 98UM]
type = HitDef
triggerall = fvar(29) != 1
trigger1 = !var(9)
trigger1 = AnimElem = 7, = 1
attr = S,NA
damage = Ceil(17*100*fvar(10)*fvar(35)/10/119)
animtype = Hard
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7201
guard.sparkno = S7211
sparkxy = -15,-60
hitsound = S5,IfElse(Random%2=1,6,11)
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -10.35-(fvar(29)=4&&var(52)>0)
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 210

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 210, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;-----------------------------------------------------------------
;近距離強パンチ
[Statedef 215]
type = S
physics = S
movetype = A
poweradd = 0
ctrl = 0
anim = 215
sprpriority = 2

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State -2. 半数補正]
type = VarSet
trigger1 = Time = 0
var(21) = 0

[State -2. 半数補正]
type = VarAdd
trigger1 = NumTarget(215)
trigger1 = MoveContact
var(21) = 1
ignorehitpause = 1
persistent = 0

[State 215, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),51,71),1)
channel = 0

[State 215, snd2]
type = PlaySnd
trigger1 = AnimElem = 1
value = S3,0

[State 215, hitdef1 2002]
type = HitDef
triggerall = fvar(29) != 4 && !fvar(26)
triggerall = !var(9)
trigger1 = AnimElem = 4, = 1
attr = S,NA
damage = Ceil((Ceil(11*0.5**(var(21)))-1)*(100-Random%11)*fvar(10)*fvar(35)/10/103)
animtype = Hard
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -15,-60
hitsound = S5,IfElse(random%2=1,6,11)
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -8
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 215

[State 215, hitdef2 2002]
type = HitDef
triggerall = fvar(29) != 4 && !fvar(26)
triggerall = !var(9)
trigger1 = AnimElem = 6
attr = S,NA
damage = Ceil((Ceil(11*0.5**(var(21)))-1)*(100-Random%11)*fvar(10)*fvar(35)/10/103)
animtype = Hard
air.animtype = Back
ground.type = High
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -35,-70
hitsound = S5,IfElse(random%2=1,6,11)
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -10.35
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 216

[State 215, hitdef1 2002um]
type = HitDef
triggerall = fvar(26)
triggerall = !var(9)
trigger1 = AnimElem = 4, = 1
attr = S,NA
damage = 65*fvar(39)
animtype = Hard
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -15,-60
hitsound = S5,IfElse(random%2=1,6,11)
guardsound = S6,1
pausetime = 11,13
guard.pausetime = 11,11
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -8
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125)
givepower = 15,15
ID = 215

[State 215, hitdef2 2002um]
type = HitDef
triggerall = fvar(26)
triggerall = !var(9)
trigger1 = AnimElem = 6
attr = S,NA
damage = 25*fvar(39)
animtype = Hard
air.animtype = Back
ground.type = High
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -35,-70
hitsound = S5,IfElse(random%2=1,6,11)
guardsound = S6,1
pausetime = 11,13
guard.pausetime = 11,11
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -10.35
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125)
givepower = 15,15
ID = 216

[State 215, hitdef1 98UM]
type = HitDef
triggerall = fvar(29) = 4
triggerall = !var(9)
trigger1 = AnimElem = 4, = 1
attr = S,NA
damage = Ceil((Ceil(10*0.5**(var(21)))-1)*100*fvar(10)*fvar(35)/10/119)
animtype = Hard
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7201
guard.sparkno = S7211
sparkxy = -15,-60
hitsound = S5,1
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -8-(fvar(29)=4&&var(52)>0)
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 215

[State 215, hitdef2 98UM]
type = HitDef
triggerall = fvar(29) = 4
triggerall = !var(9)
trigger1 = AnimElem = 6
attr = S,NA
damage = Ceil((Ceil(10*0.5**(var(21)))-1)*100*fvar(10)*fvar(35)/10/119)
animtype = Hard
air.animtype = Back
ground.type = High
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7201
guard.sparkno = S7211
sparkxy = -35,-70
hitsound = S5,1
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -10.35-(fvar(29)=4&&var(52)>0)
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 216

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 215, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;=================================================================
;遠距離弱キック
[Statedef 220]
type = S
physics = S
movetype = A
poweradd = 0
ctrl = 0
anim = 220
sprpriority = 2

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State 220, snd]
type = PlaySnd
trigger1 = random%2 = 1
trigger1 = AnimElem = 1
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),50,70),0)
channel = 0

[State 220, snd2]
type = PlaySnd
trigger1 = AnimElem = 1
value = S3,1

[State 220, hitdef 2002]
type = HitDef
triggerall = fvar(29) = 1 && !fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 4, = 1
attr = S,NA
damage = Ceil(6*(100-Random%11)*fvar(10)*fvar(35)/10/103)
animtype = Light
air.animtype = Back
ground.type = Low
guardflag = L
hitflag = MAF
priority = 4,hit
sparkno = S7250
guard.sparkno = S7260
sparkxy = -15,-30
hitsound = S5,IfElse(Random%2=1,7,12)
guardsound = S6,0
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75*(1-(PrevStateNo = [200,600))*0.2)
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,59),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,59)
givepower = 15,15
ID = 220

[State 220, hitdef 2002um]
type = HitDef
triggerall = fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 4, = 1
attr = S,NA
damage = 25*fvar(39)
animtype = Light
air.animtype = Back
ground.type = Low
guardflag = L
hitflag = MAF
priority = 4,hit
sparkno = S7250
guard.sparkno = S7260
sparkxy = -15,-30
hitsound = S5,IfElse(Random%2=1,7,12)
guardsound = S6,0
pausetime = 11,13
guard.pausetime = 11,11
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75*(1-(PrevStateNo = [200,600))*0.2)
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,75),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,75)
givepower = 15,15
ID = 220

[State 220, hitdef 98UM]
type = HitDef
triggerall = fvar(29) != 1
trigger1 = !var(9)
trigger1 = AnimElem = 4, = 1
attr = S,NA
damage = Ceil(10*100*fvar(10)*fvar(35)/10/119)
animtype = Light
air.animtype = Back
ground.type = Low
guardflag = L
hitflag = MAF
priority = 4,hit
sparkno = S7200
guard.sparkno = S7210
sparkxy = -15,-30
hitsound = S5,2
guardsound = S6,0
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = (-5.75-(fvar(29)=4&&var(52)>0)*1.35)*(1-(PrevStateNo = [200,600))*0.2)
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,63),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,63)
givepower = 15,15
ID = 220

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 220, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;=================================================================
;近距離弱キック
[Statedef 225]
type = S
physics = S
movetype = A
poweradd = 0
ctrl = 0
anim = 225
sprpriority = 2

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State 225, snd]
type = PlaySnd
trigger1 = random%2 = 1
trigger1 = AnimElem = 1
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),50,70),0)
channel = 0

[State 225, snd2]
type = PlaySnd
trigger1 = AnimElem = 1
value = S3,1

[State 225, hitdef 2002]
type = HitDef
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 3, = 1
attr = S,NA
damage = Ceil(7*(100-Random%11)*fvar(10)*fvar(35)/10/103)
animtype = Light
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7250
guard.sparkno = S7210
sparkxy = -25,-65
hitsound = S5,IfElse(Random%2=1,7,12)
guardsound = S6,0
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75*(1-(PrevStateNo = [200,600))*0.2)
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,59),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,59)
givepower = 15,15
ID = 225

[State 225, hitdef 2002um]
type = HitDef
triggerall = fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 3, = 1
attr = S,NA
damage = 35*fvar(39)
animtype = Light
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7250
guard.sparkno = S7210
sparkxy = -25,-65
hitsound = S5,IfElse(Random%2=1,7,12)
guardsound = S6,0
pausetime = 11,13
guard.pausetime = 11,11
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75*(1-(PrevStateNo = [200,600))*0.2)
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,75),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,75)
givepower = 15,15
ID = 225

[State 200, hitdef 98UM]
type = HitDef
triggerall = fvar(29) = 4
trigger1 = !var(9)
trigger1 = AnimElem = 3, = 1
attr = S,NA
damage = Ceil(11*100*fvar(10)*fvar(35)/10/119)
animtype = Light
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7200
guard.sparkno = S7210
sparkxy = -25,-65
hitsound = S5,2
guardsound = S6,0
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = (-5.75-(fvar(29)=4&&var(52)>0)*1.35)*(1-(PrevStateNo = [200,600))*0.2)
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,63),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,63)
givepower = 15,15
ID = 225

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 225, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;=================================================================
;遠距離強キック
[Statedef 230]
type = S
physics = S
movetype = A
poweradd = 0
ctrl = 0
anim = 230+(fvar(29)!=1)
sprpriority = 2

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State -2. 半数補正]
type = VarSet
trigger1 = Time = 0
var(21) = 0

[State -2. 半数補正]
type = VarAdd
trigger1 = NumTarget(230)
trigger1 = MoveContact
var(21) = 1
ignorehitpause = 1
persistent = 0

[State 230, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),51,71),1)
channel = 0

[State 230, snd2]
type = PlaySnd
trigger1 = AnimElem = 1
value = S3,1

[State 230, hitdef1 2002]
type = HitDef
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 5, = 1
attr = S,NA
damage = Ceil((Ceil(16*0.5**(var(21)))-1)*(100-random%11)*fvar(10)*fvar(35)/10/103)
animtype = Hard
air.animtype = Back
ground.type = High
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = 0,-120
hitsound = S5,IfElse(Random%2=1,8,13)
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -5.75
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 230

[State 230, hitdef2 2002]
type = HitDef
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 7
attr = S,NA
damage = Ceil((Ceil(16*0.5**(var(21)))-1)*(100-random%11)*fvar(10)*fvar(35)/10/103)
animtype = Hard
air.animtype = Back
ground.type = High
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -20,-100
hitsound = S5,IfElse(Random%2=1,8,13)
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -10.35
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 231

[State 230, hitdef1 2002um]
type = HitDef
triggerall = fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 5, = 1
attr = S,NA
damage = 80*fvar(39)
animtype = Hard
air.animtype = Back
ground.type = High
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = 0,-120
hitsound = S5,IfElse(Random%2=1,8,13)
guardsound = S6,1
pausetime = 11,13
guard.pausetime = 11,11
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -5.75
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125)
givepower = 15,15
ID = 230

[State 230, hitdef 2002um]
type = HitDef
triggerall = fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 7
attr = S,NA
damage = 80*fvar(39)
animtype = Hard
air.animtype = Back
ground.type = High
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = 0,-120
hitsound = S5,IfElse(Random%2=1,8,13)
guardsound = S6,1
pausetime = 11,13
guard.pausetime = 11,11
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -5.75
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125)
givepower = 15,15
ID = 231

[State 230, hitdef 98UM]
type = HitDef
triggerall = fvar(29) = 4
trigger1 = !var(9)
trigger1 = AnimElem = 7
attr = S,NA
damage = Ceil(17*100*fvar(10)*fvar(35)/10/119)
animtype = Hard
air.animtype = Back
ground.type = High
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7201
guard.sparkno = S7211
sparkxy = -20,-100
hitsound = S5,3
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -10.35-(fvar(29)=4&&var(52)>0)
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 231

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 230, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;=================================================================
;近距離強キック
[Statedef 235]
type = S
physics = S
movetype = A
poweradd = 0
ctrl = 0
anim = 235
sprpriority = 2

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State -2. 半数補正]
type = VarSet
trigger1 = Time = 0
var(21) = 0

[State -2. 半数補正]
type = VarAdd
trigger1 = NumTarget(235)
trigger1 = MoveContact
var(21) = 1
ignorehitpause = 1
persistent = 0

[State 235, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),51,71),1)
channel = 0

[State 235, snd2]
type = PlaySnd
trigger1 = AnimElem = 1
value = S3,1

[State 235, hitdef1 2002]
type = HitDef
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 4, = 1
attr = S,NA
damage = Ceil((Ceil(11*0.5**(var(21)))-1)*(100-random%11)*fvar(10)*fvar(35)/10/103)
animtype = Hard
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -20,-60
hitsound = S5,IfElse(Random%2=1,8,13)
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = 0
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 235

[State 235, hitdef2 2002]
type = HitDef
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 11
attr = S,NA
damage = Ceil((Ceil(11*0.5**(var(21)))-1)*(100-random%11)*fvar(10)*fvar(35)/10/103)
animtype = Hard
air.animtype = Back
ground.type = High
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -25,-80
hitsound = S5,IfElse(Random%2=1,8,13)
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -10.35
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 236

[State 235, hitdef1 2002um]
type = HitDef
triggerall = fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 4, = 1
attr = S,NA
damage = 60*fvar(39)
animtype = Hard
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -20,-60
hitsound = S5,IfElse(Random%2=1,8,13)
guardsound = S6,1
pausetime = 11,13
guard.pausetime = 11,11
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = 0
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125)
givepower = 15,15
ID = 235

[State 235, hitdef2 2002um]
type = HitDef
triggerall = fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 11
attr = S,NA
damage = 30*fvar(39)
animtype = Hard
air.animtype = Back
ground.type = High
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -25,-80
hitsound = S5,IfElse(Random%2=1,8,13)
guardsound = S6,1
pausetime = 11,13
guard.pausetime = 11,11
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -10.35
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125)
givepower = 15,15
ID = 236

[State 235, hitdef1 98UM]
type = HitDef
triggerall = fvar(29) = 4
trigger1 = !var(9)
trigger1 = AnimElem = 4, = 1
attr = S,NA
damage = Ceil((Ceil(10*0.5**(var(21)))-1)*100*fvar(10)*fvar(35)/10/119)
animtype = Hard
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7201
guard.sparkno = S7211
sparkxy = -20,-60
hitsound = S5,3
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = 0
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 235

[State 235, hitdef2 98UM]
type = HitDef
triggerall = fvar(29) = 4
trigger1 = !var(9)
trigger1 = AnimElem = 11
attr = S,NA
damage = Ceil((Ceil(10*0.5**(var(21)))-1)*100*fvar(10)*fvar(35)/10/119)
animtype = Hard
air.animtype = Back
ground.type = High
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7201
guard.sparkno = S7211
sparkxy = -25,-80
hitsound = S5,3
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -10.35-(fvar(29)=4&&var(52)>0)
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 236

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 230, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;-----------------------------------------------------------------
;ダブルトマホーク
[Statedef 260]
type = S
physics = S
movetype = A
juggle = 15
poweradd = 0
ctrl = 0
anim = 260
sprpriority = 2

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = 261)
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State 260, snd]
type = PlaySnd
triggerall = fvar(29) = [1,3]
triggerall = !fvar(26)
trigger1 = AnimElem = 1
value = S1,56
channel = 0

[State 260, snd]
type = PlaySnd
triggerall = fvar(29) = [1,3]
triggerall = !fvar(26)
trigger1 = AnimElem = 3 
trigger2 = AnimElem = 8
value = S1,51
channel = 6

[State 260, snd]
type = PlaySnd
triggerall = fvar(29) = [4,6]
trigger1 = AnimElem = 1
value = S1,1
channel = 0

[State 260, snd]
type = PlaySnd
triggerall = fvar(29) = [1,3]
trigger1 = fvar(26) = 1
trigger1 = AnimElem = 8
value = S1,71
channel = 0

[State 260, snd2]
type = PlaySnd
trigger1 = Animelem = 3
trigger2 = Animelem = 8
value = S3,1

[State 260, hitdef1 2002]
type = HitDef
triggerall = fvar(29) != 4 && !fvar(26)
triggerall = !var(9)
trigger1 = AnimElem = 4, = 1
attr = S,NA
damage = Ceil(IfElse((PrevStateNo!=261),6,3)*(100-Random%11)*fvar(10)*fvar(35)/10/103)
animtype = Hard
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -25,-50
hitsound = S5,8
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = 0
air.velocity = -4,-7.5
yaccel = .55
air.fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,59),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,59)
givepower = 15,15
ID = 260

[State 260, hitdef2 2002]
type = HitDef
triggerall = fvar(29) != 4 && !fvar(26)
triggerall = !var(9)
trigger1 = AnimElem = 12
trigger1 = !(PrevStateNo = 261)
attr = S,NA
damage = Ceil(IfElse((PrevStateNo!=261),6,3)*(100-Random%11)*fvar(10)*fvar(35)/10/103)
animtype = Hard
air.animtype = Back
ground.type = Low
guardflag = H
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -25,-50
hitsound = S5,8
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -10.35
air.velocity = -4,-7.5
yaccel = .55
air.fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,59),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,59)
givepower = 15,15
ID = 261

[State 260, hitdef2 2002]
type = HitDef
triggerall = fvar(29) != 4 && !fvar(26)
triggerall = !var(9)
trigger1 = AnimElem = 12
trigger1 = (PrevStateNo = 261)
attr = S,NA
damage = Ceil(IfElse((PrevStateNo!=261),6,3)*(100-Random%11)*fvar(10)*fvar(35)/10/103)
animtype = Hard
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -25,-50
hitsound = S5,8
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -10.35
air.velocity = -4,-7.5
yaccel = .55
air.fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,59),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,59)
givepower = 15,15
ID = 261

[State 260, hitdef1 2002um]
type = HitDef
triggerall = fvar(26)
triggerall = !var(9)
trigger1 = AnimElem = 4, = 1
attr = S,NA
damage = 40*fvar(39)
animtype = Hard
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -25,-50
hitsound = S5,8
guardsound = S6,1
pausetime = 11,13
guard.pausetime = 11,11
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = 0
air.velocity = -4,-7.5
yaccel = .55
air.fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,60),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,60)
givepower = 15,15
ID = 260

[State 260, hitdef2 2002um]
type = HitDef
triggerall = fvar(26)
triggerall = !var(9)
trigger1 = AnimElem = 12
trigger1 = !(PrevStateNo = 261)
attr = S,NA
damage = 30*fvar(39)
animtype = Hard
air.animtype = Back
ground.type = Low
guardflag = H
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -25,-50
hitsound = S5,8
guardsound = S6,1
pausetime = 11,13
guard.pausetime = 11,11
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -10.35
air.velocity = -4,-7.5
yaccel = .55
air.fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,60),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,60)
givepower = 15,15
ID = 261

[State 260, hitdef2 2002um]
type = HitDef
triggerall = fvar(26)
triggerall = !var(9)
trigger1 = AnimElem = 12
trigger1 = PrevStateNo = 261
attr = S,NA
damage = 30*fvar(39)
animtype = Hard
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -25,-50
hitsound = S5,8
guardsound = S6,1
pausetime = 11,13
guard.pausetime = 11,11
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -10.35
air.velocity = -4,-7.5
yaccel = .55
air.fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,60),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,60)
givepower = 15,15
ID = 261

[State 260, hitdef1 98UM]
type = HitDef
triggerall = fvar(29) = 4
triggerall = !var(9)
trigger1 = AnimElem = 4, = 1
attr = S,NA
damage = Ceil(IfElse((PrevStateNo!=261),5,3)*100*fvar(10)*fvar(35)/10/119)
animtype = Hard
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7201
guard.sparkno = S7211
sparkxy = -25,-50
hitsound = S5,3
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = 0
air.velocity = -4-(fvar(29)=4&&var(52)>0),-7.5
yaccel = .55
air.fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,63),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,63)
givepower = 15,15
ID = 260

[State 260, hitdef2 98UM]
type = HitDef
triggerall = fvar(29) = 4
triggerall = !var(9)
trigger1 = AnimElem = 12
trigger1 = !(PrevStateNo = 261)
attr = S,NA
damage = Ceil(IfElse((PrevStateNo!=261),5,3)*100*fvar(10)*fvar(35)/10/119)
animtype = Hard
air.animtype = Back
ground.type = Low
guardflag = H
hitflag = MAF
priority = 4,hit
sparkno = S7201
guard.sparkno = S7211
sparkxy = -25,-50
hitsound = S5,3
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -10.35-(fvar(29)=4&&var(52)>0)
air.velocity = -4-(fvar(29)=4&&var(52)>0),-7.5
yaccel = .55
air.fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,63),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,63)
givepower = 15,15
ID = 261

[State 260, hitdef2 98UM]
type = HitDef
triggerall = fvar(29) = 4
triggerall = !var(9)
trigger1 = AnimElem = 12
trigger1 = PrevStateNo = 261
attr = S,NA
damage = Ceil(IfElse((PrevStateNo!=261),5,3)*100*fvar(10)*fvar(35)/10/119)
animtype = Hard
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7201
guard.sparkno = S7211
sparkxy = -25,-50
hitsound = S5,3
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -10.35-(fvar(29)=4&&var(52)>0)
air.velocity = -4-(fvar(29)=4&&var(52)>0),-7.5
yaccel = .55
air.fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,63),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,63)
givepower = 15,15
ID = 261

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 260, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


[Statedef 261];キャンセル判定用
type = S
physics = S
movetype = A
poweradd = 0
ctrl = 0
anim = 260
sprpriority = 2

[State 261, end]
type = ChangeState
trigger1 = Time = 0
value = 260
ignorehitpause = 1

;=================================================================
;しゃがみ弱パンチ
[Statedef 400]
type = C
physics = N
movetype = A
poweradd = 0
ctrl = 0
anim = 400
sprpriority = 2

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State 400, snd]
type = PlaySnd
trigger1 = random%2 = 1
trigger1 = AnimElem = 1
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),50,70),0)
channel = 0

[State 400, snd2]
type = PlaySnd
trigger1 = AnimElem = 1
value = S3,0

[State 400, hitdef 2002]
type = HitDef
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 2, = 1
attr = C,NA
damage = Ceil(5*(100-Random%11)*fvar(10)*fvar(35)/10/103)
animtype = Light
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7250
guard.sparkno = S7260
sparkxy = -10,-45
hitsound = S5,IfElse(Random%2=1,5,10)
guardsound = S6,0
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75*(1-(PrevStateNo = [200,600))*0.2)
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,59),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,59)
givepower = 15,15
ID = 400

[State 400, hitdef 2002um]
type = HitDef
triggerall = fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 2, = 1
attr = C,NA
damage = 25*fvar(39)
animtype = Light
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7250
guard.sparkno = S7260
sparkxy = -10,-45
hitsound = S5,IfElse(Random%2=1,5,10)
guardsound = S6,0
pausetime = 11,13
guard.pausetime = 11,11
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75*(1-(PrevStateNo = [200,600))*0.2)
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,80),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,80)
givepower = 15,15
ID = 400

[State 400, hitdef 98UM]
type = HitDef
triggerall = fvar(29) = 4
trigger1 = !var(9)
trigger1 = AnimElem = 2, = 1
attr = C,NA
damage = Ceil(9*100*fvar(10)*fvar(35)/10/119)
animtype = Light
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7200
guard.sparkno = S7210
sparkxy = -15,-45
hitsound = S5,0
guardsound = S6,0
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = (-5.75-(fvar(29)=4&&var(52)>0)*1.35)*(1-(PrevStateNo = [200,600))*0.2)
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,63),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,63)
givepower = 15,15
ID = 400

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 400, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1


;=================================================================
;しゃがみ強パンチ
[Statedef 410]
type = C
physics = N
movetype = A
poweradd = 0
ctrl = 0
anim = 410
sprpriority = 2

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State 410, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),51,71),1)
channel = 0

[State 410, snd2]
type = PlaySnd
trigger1 = AnimElem = 1
value = S3,0

[State 410, hitdef 2002]
type = HitDef
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 5, = 1
attr = C,NA
damage = Ceil(10*(100-Random%11)*fvar(10)*fvar(35)/10/103)
animtype = Hard
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -15,-50
hitsound = S5,IfElse(Random%2=1,6,11)
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -10.35
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 410

[State 410, hitdef 2002um]
type = HitDef
triggerall = fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 5, = 1
attr = C,NA
damage = 65*fvar(39)
animtype = Hard
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -15,-50
hitsound = S5,IfElse(Random%2=1,6,11)
guardsound = S6,1
pausetime = 11,13
guard.pausetime = 11,11
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -10.35
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125)
givepower = 15,15
ID = 410

[State 410, hitdef 98UM]
type = HitDef
triggerall = fvar(29) = 4
trigger1 = !var(9)
trigger1 = AnimElem = 5, = 1
attr = C,NA
damage = Ceil(13*100*fvar(10)*fvar(35)/10/119)
animtype = Hard
air.animtype = Back
ground.type = Low
guardflag = M
hitflag = MAF
priority = 4,hit
sparkno = S7201
guard.sparkno = S7211
sparkxy = -15,-50
hitsound = S5,1
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -10.35-(fvar(29)=4&&var(52)>0)
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 410

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 410, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1


;=================================================================
;しゃがみ弱キック
[Statedef 420]
type = C
physics = N
movetype = A
poweradd = 0
ctrl = 0
anim = 420
sprpriority = 2

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State 420, snd]
type = PlaySnd
trigger1 = random%2 = 1
trigger1 = AnimElem = 1
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),50,70),0)
channel = 0

[State 420, snd2]
type = PlaySnd
trigger1 = AnimElem = 1
value = S3,1

[State 420, hitdef 2002]
type = HitDef
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 2, = 1
attr = C,NA
damage = Ceil(6*(100-Random%11)*fvar(10)*fvar(35)/10/103)
animtype = Light
air.animtype = Back
ground.type = Low
guardflag = L
hitflag = MAF
priority = 4,hit
sparkno = S7250
guard.sparkno = S7260
sparkxy = -15,-5
hitsound = S5,IfElse(Random%2=1,7,12)
guardsound = S6,0
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75*(1-(PrevStateNo = [200,600))*0.2)
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,59),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,59)
givepower = 15,15
ID = 420

[State 420, hitdef 2002um]
type = HitDef
triggerall = fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 2, = 1
attr = C,NA
damage = 25*fvar(39)
animtype = Light
air.animtype = Back
ground.type = Low
guardflag = L
hitflag = MAF
priority = 4,hit
sparkno = S7250
guard.sparkno = S7260
sparkxy = -15,-5
hitsound = S5,IfElse(Random%2=1,7,12)
guardsound = S6,0
pausetime = 11,13
guard.pausetime = 11,11
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75*(1-(PrevStateNo = [200,600))*0.2)
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,80),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,80)
givepower = 15,15
ID = 420

[State 420, hitdef 98UM]
type = HitDef
triggerall = fvar(29) = 4
trigger1 = !var(9)
trigger1 = AnimElem = 2, = 1
attr = C,NA
damage = Ceil(10*100*fvar(10)*fvar(35)/10/119)
animtype = Light
air.animtype = Back
ground.type = Low
guardflag = L
hitflag = MAF
priority = 4,hit
sparkno = S7200
guard.sparkno = S7210
sparkxy = -15,-5
hitsound = S5,2
guardsound = S6,0
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = (-5.75-(var(52)>0)*1.35)*(1-(PrevStateNo = [200,600))*0.2)
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,63),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,63)
givepower = 15,15
ID = 420

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 420, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1


;=================================================================
;しゃがみ強キック
[Statedef 430]
type = C
physics = N
movetype = A
poweradd = 0
ctrl = 0
anim = 430+(fvar(29)!=1)
sprpriority = 2

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State 430, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),51,71),1)
channel = 0

[State 430, snd2]
type = PlaySnd
trigger1 = AnimElem = 1
value = S3,1

[State 430, hitdef 2002]
type = HitDef
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 6, = 1
attr = C,NA
damage = Ceil(14*(100-Random%11)*fvar(10)*fvar(35)/10/103)
animtype = Back
air.animtype = Back
ground.type = Low
guardflag = L
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -15,-5
hitsound = S5,IfElse(Random%2=1,8,13)
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -2,-8.5
guard.velocity = -10.35
air.velocity = -2,-8.5
yaccel = .65
fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 430

[State 430, hitdef 2002um]
type = HitDef
triggerall = fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 6, = 1
attr = C,NA
damage = 70*fvar(39)
animtype = Back
air.animtype = Back
ground.type = Low
guardflag = L
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -15,-5
hitsound = S5,IfElse(Random%2=1,8,13)
guardsound = S6,1
pausetime = 11,13
guard.pausetime = 11,11
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -2,-8.5
guard.velocity = -10.35
air.velocity = -2,-8.5
yaccel = .65
fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125)
givepower = 15,15
ID = 430

[State 430, hitdef 98UM]
type = HitDef
triggerall = fvar(29) = 4
trigger1 = !var(9)
trigger1 = AnimElem = 6, = 1
attr = C,NA
damage = Ceil(16*100*fvar(10)*fvar(35)/10/119)
animtype = Back
air.animtype = Back
ground.type = Low
guardflag = L
hitflag = MAF
priority = 4,hit
sparkno = S7201
guard.sparkno = S7211
sparkxy = -15,-5
hitsound = S5,3
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -2,-8.5
guard.velocity = -10.35-(fvar(29)=4&&var(52)>0)
air.velocity = -2,-8.5
yaccel = .65
fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 430

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 430, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1


;=================================================================
;垂直ジャンプ弱パンチ
[Statedef 600]
type = A
physics = A
movetype = A
poweradd = 0
ctrl = 0
anim = 600
sprpriority = 2

[State 600, snd]
type = PlaySnd
trigger1 = random%2 = 1
trigger1 = AnimElem = 1
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),50,70),0)
channel = 0

[State 600, snd2]
type = PlaySnd
trigger1 = AnimElem = 1
value = S3,0

[State 600, hitdef 2002]
type = HitDef
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 3, = 1
attr = A,NA
damage = Ceil(9*(100-Random%11)*fvar(10)*fvar(35)/10/103)
animtype = Middle
air.animtype = Back
ground.type = Low
guardflag = H
hitflag = MAF
priority = 4,hit
sparkno = S7250
guard.sparkno = S7260
sparkxy = -10,-65
hitsound = S5,IfElse(Random%2=1,5,10)
guardsound = S6,0
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,59),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,59)
givepower = 15,15
ID = 600

[State 600, hitdef 2002um]
type = HitDef
triggerall = fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 3, = 1
attr = A,NA
damage = 25*fvar(39)
animtype = Middle
air.animtype = Back
ground.type = Low
guardflag = H
hitflag = MAF
priority = 4,hit
sparkno = S7250
guard.sparkno = S7260
sparkxy = -10,-65
hitsound = S5,IfElse(Random%2=1,5,10)
guardsound = S6,0
pausetime = 11,13
guard.pausetime = 11,11
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,75),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,75)
givepower = 15,15
ID = 600

[State 600, hitdef 98UM]
type = HitDef
triggerall = fvar(29) = 4
trigger1 = !var(9)
trigger1 = AnimElem = 3, = 1
attr = A,NA
damage = Ceil(12*100*fvar(10)*fvar(35)/10/119)
animtype = Middle
air.animtype = Back
ground.type = Low
guardflag = HA
hitflag = MAF
priority = 4,hit
sparkno = S7200
guard.sparkno = S7210
sparkxy = -10,-65
hitsound = S5,0
guardsound = S6,0
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75-(fvar(29)=4&&var(52)>0)*1.35
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,63),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,63)
givepower = 15,15
ID = 600

[State -2]
type = VarSet
trigger1 = MoveContact = 1
var(11) = 1
ignorehitpause = 1


;=================================================================
;ジャンプ弱パンチ
[Statedef 605]
type = A
physics = A
movetype = A
poweradd = 0
ctrl = 0
anim = 605
sprpriority = 2

[State 605, snd]
type = PlaySnd
trigger1 = random%2 = 1
trigger1 = AnimElem = 1
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),50,70),0)
channel = 0

[State 605, snd2]
type = PlaySnd
trigger1 = AnimElem = 1
value = S3,0

[State 605, hitdef 2002]
type = HitDef
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 3, = 1
attr = A,NA
damage = Ceil(8*(100-Random%11)*fvar(10)*fvar(35)/10/103)
animtype = Middle
air.animtype = Back
ground.type = Low
guardflag = H
hitflag = MAF
priority = 4,hit
sparkno = S7250
guard.sparkno = S7260
sparkxy = -15,-60
hitsound = S5,IfElse(Random%2=1,5,10)
guardsound = S6,0
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,59),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,59)
givepower = 15,15
ID = 605

[State 605, hitdef 2002um]
type = HitDef
triggerall = fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 3, = 1
attr = A,NA
damage = 25*fvar(39)
animtype = Middle
air.animtype = Back
ground.type = Low
guardflag = H
hitflag = MAF
priority = 4,hit
sparkno = S7250
guard.sparkno = S7260
sparkxy = -15,-60
hitsound = S5,IfElse(Random%2=1,5,10)
guardsound = S6,0
pausetime = 11,13
guard.pausetime = 11,11
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,75),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,75)
givepower = 15,15
ID = 605

[State 605, hitdef 98UM]
type = HitDef
triggerall = fvar(29) = 4
trigger1 = !var(9)
trigger1 = AnimElem = 3, = 1
attr = A,NA
damage = Ceil(11*100*fvar(10)*fvar(35)/10/119)
animtype = Middle
air.animtype = Back
ground.type = Low
guardflag = HA
hitflag = MAF
priority = 4,hit
sparkno = S7200
guard.sparkno = S7210
sparkxy = -10,-65
hitsound = S5,0
guardsound = S6,0
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75-(fvar(29)=4&&var(52)>0)*1.35
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,63),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,63)
givepower = 15,15
ID = 605

[State -2]
type = VarSet
trigger1 = MoveContact = 1
var(11) = 1
ignorehitpause = 1


;=================================================================
;垂直ジャンプ強パンチ
[Statedef 610]
type = A
physics = A
movetype = A
poweradd = 0
ctrl = 0
anim = 610
sprpriority = 2

[State 610, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),51,71),1)
channel = 0

[State 610, snd2]
type = PlaySnd
trigger1 = AnimElem = 1
value = S3,0

[State 610, hitdef 2002]
type = HitDef
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 4, = 1
attr = A,NA
damage = Ceil(14*(100-Random%11)*fvar(10)*fvar(35)/10/103)
animtype = Middle
air.animtype = Back
ground.type = Low
guardflag = H
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -15,-75
hitsound = S5,IfElse(Random%2=1,6,11)
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 610

[State 610, hitdef 2002um]
type = HitDef
triggerall = fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 4, = 1
attr = A,NA
damage = 75*fvar(39)
animtype = Middle
air.animtype = Back
ground.type = Low
guardflag = H
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -15,-75
hitsound = S5,IfElse(Random%2=1,6,11)
guardsound = S6,1
pausetime = 11,13
guard.pausetime = 11,11
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125)
givepower = 15,15
ID = 610

[State 610, hitdef 98UM]
type = HitDef
triggerall = fvar(29) = 4
trigger1 = !var(9)
trigger1 = AnimElem = 4, = 1
attr = A,NA
damage = Ceil(16*100*fvar(10)*fvar(35)/10/119)
animtype = Middle
air.animtype = Back
ground.type = Low
guardflag = HA
hitflag = MAF
priority = 4,hit
sparkno = S7201
guard.sparkno = S7211
sparkxy = -15,-75
hitsound = S5,1
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75-(fvar(29)=4&&var(52)>0)*1.35
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 610

[State -2]
type = VarSet
trigger1 = MoveContact = 1
var(11) = 1
ignorehitpause = 1


;=================================================================
;ジャンプ強パンチ
[Statedef 615]
type = A
physics = A
movetype = A
poweradd = 0
ctrl = 0
anim = 615
sprpriority = 2

[State 615, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),51,71),1)
channel = 0

[State 615, snd2]
type = PlaySnd
trigger1 = AnimElem = 1
value = S3,0

[State 615, hitdef 2002]
type = HitDef
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 4, = 1
attr = A,NA
damage = Ceil(13*(100-Random%11)*fvar(10)*fvar(35)/10/103)
animtype = Middle
air.animtype = Back
ground.type = Low
guardflag = H
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -15,-70
hitsound = S5,IfElse(Random%2=1,6,11)
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 615

[State 615, hitdef 2002um]
type = HitDef
triggerall = fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 4, = 1
attr = A,NA
damage = 75*fvar(39)
animtype = Middle
air.animtype = Back
ground.type = Low
guardflag = H
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -15,-70
hitsound = S5,IfElse(Random%2=1,6,11)
guardsound = S6,1
pausetime = 11,13
guard.pausetime = 11,11
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125)
givepower = 15,15
ID = 615

[State 615, hitdef 98UM]
type = HitDef
triggerall = fvar(29) = 4
trigger1 = !var(9)
trigger1 = AnimElem = 4, = 1
attr = A,NA
damage = Ceil(15*100*fvar(10)*fvar(35)/10/119)
animtype = Middle
air.animtype = Back
ground.type = Low
guardflag = HA
hitflag = MAF
priority = 4,hit
sparkno = S7201
guard.sparkno = S7211
sparkxy = -15,-70
hitsound = S5,1
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75-(fvar(29)=4&&var(52)>0)*1.35
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 615

[State -2]
type = VarSet
trigger1 = MoveContact = 1
var(11) = 1
ignorehitpause = 1


;=================================================================
;垂直ジャンプ弱キック
[Statedef 620]
type = A
physics = A
movetype = A
poweradd = 0
ctrl = 0
anim = 620
sprpriority = 2

[State 620, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),50,70),0)
channel = 0

[State 620, snd2]
type = PlaySnd
trigger1 = AnimElem = 1
value = S3,1

[State 620, hitdef 2002]
type = HitDef
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 3, = 1
attr = A,NA
damage = Ceil(7*(100-Random%11)*fvar(10)*fvar(35)/10/103)
animtype = Middle
air.animtype = Back
ground.type = Low
guardflag = H
hitflag = MAF
priority = 4,hit
sparkno = S7250
guard.sparkno = S7260
sparkxy = -10,-30
hitsound = S5,IfElse(Random%2=1,7,12)
guardsound = S6,0
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,59),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,59)
givepower = 15,15
ID = 620

[State 620, hitdef 02um]
type = HitDef
triggerall = fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 3, = 1
attr = A,NA
damage = 25*fvar(39)
animtype = Middle
air.animtype = Back
ground.type = Low
guardflag = H
hitflag = MAF
priority = 4,hit
sparkno = S7250
guard.sparkno = S7260
sparkxy = -10,-30
hitsound = S5,IfElse(Random%2=1,7,12)
guardsound = S6,0
pausetime = 11,13
guard.pausetime = 11,11
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,75),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,75)
givepower = 15,15
ID = 620

[State 620, hitdef 98UM]
type = HitDef
triggerall = fvar(29) = 4
trigger1 = !var(9)
trigger1 = AnimElem = 3, = 1
attr = A,NA
damage = Ceil(11*100*fvar(10)*fvar(35)/10/119)
animtype = Middle
air.animtype = Back
ground.type = Low
guardflag = HA
hitflag = MAF
priority = 4,hit
sparkno = S7200
guard.sparkno = S7210
sparkxy = -10,-30
hitsound = S5,2
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75-(fvar(29)=4&&var(52)>0)*1.35
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,63),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,63)
givepower = 15,15
ID = 620

[State -2]
type = VarSet
trigger1 = MoveContact = 1
var(11) = 1
ignorehitpause = 1


;=================================================================
;ジャンプ弱キック
[Statedef 625]
type = A
physics = A
movetype = A
poweradd = 0
ctrl = 0
anim = 625
sprpriority = 2

[State 625, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),50,70),0)
channel = 0

[State 625, snd2]
type = PlaySnd
trigger1 = AnimElem = 1
value = S3,1

[State 625, hitdef 2002]
type = HitDef
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 3, = 1
attr = A,NA
damage = Ceil(7*(100-Random%11)*fvar(10)*fvar(35)/10/103)
animtype = Middle
air.animtype = Back
ground.type = Low
guardflag = H
hitflag = MAF
priority = 4,hit
sparkno = S7250
guard.sparkno = S7260
sparkxy = -15,-50
hitsound = S5,IfElse(Random%2=1,7,12)
guardsound = S6,0
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,59),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,59)
givepower = 15,15
ID = 625

[State 625, hitdef 2002um]
type = HitDef
triggerall = fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 3
attr = A,NA
damage = 25*fvar(39)
animtype = Middle
air.animtype = Back
ground.type = Low
guardflag = H
hitflag = MAF
priority = 4,hit
sparkno = S7250
guard.sparkno = S7260
sparkxy = -15,-50
hitsound = S5,IfElse(Random%2=1,7,12)
guardsound = S6,0
pausetime = 11,13
guard.pausetime = 11,11
ground.slidetime = 12
ground.hittime = 12
guard.ctrltime = 12
air.hittime = 60
ground.velocity = -5.75
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,75),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,75)
givepower = 15,15
ID = 625

[State 625, hitdef 98UM]
type = HitDef
triggerall = fvar(29) = 4
trigger1 = !var(9)
trigger1 = AnimElem = 3, = 1
attr = A,NA
damage = Ceil(11*100*fvar(10)*fvar(35)/10/119)
animtype = Middle
air.animtype = Back
ground.type = Low
guardflag = HA
hitflag = MAF
priority = 4,hit
sparkno = S7200
guard.sparkno = S7210
sparkxy = -15,-50
hitsound = S5,2
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75-(fvar(29)=4&&var(52)>0)*1.35
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,63),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,63)
givepower = 15,15
ID = 625

[State -2]
type = VarSet
trigger1 = MoveContact = 1
var(11) = 1
ignorehitpause = 1


;=================================================================
;垂直ジャンプ強キック
[Statedef 630]
type = A
physics = A
movetype = A
poweradd = 0
ctrl = 0
anim = 630
sprpriority = 2

[State -2. 半数補正]
type = VarSet
trigger1 = Time = 0
var(21) = 0

[State -2. 半数補正]
type = VarAdd
trigger1 = NumTarget(630)
trigger1 = MoveContact
var(21) = 1
ignorehitpause = 1
persistent = 0

[State 630, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),51,71),1)
channel = 0

[State 630, snd2]
type = PlaySnd
trigger1 = AnimElem = 1
value = S3,1

[State 630, hitdef1 2002]
type = HitDef
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 4, = 1
attr = A,NA
damage = Ceil((Ceil(11*0.5**(var(21)))-1)*(100-random%11)*fvar(10)*fvar(35)/10/103)
animtype = Middle
air.animtype = Back
ground.type = Low
guardflag = H
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -10,-100
hitsound = S5,IfElse(Random%2=1,8,13)
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 630

[State 630, hitdef2 2002]
type = HitDef
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 6
attr = A,NA
damage = Ceil((Ceil(11*0.5**(var(21)))-1)*(100-random%11)*fvar(10)*fvar(35)/10/103)
animtype = Middle
air.animtype = Back
ground.type = Low
guardflag = H
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -20,-70
hitsound = S5,IfElse(Random%2=1,8,13)
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 631

[State 630, hitdef1 2002um]
type = HitDef
triggerall = fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 4, = 1
attr = A,NA
damage = 75*fvar(39)
animtype = Middle
air.animtype = Back
ground.type = Low
guardflag = H
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -10,-100
hitsound = S5,IfElse(Random%2=1,8,13)
guardsound = S6,1
pausetime = 11,13
guard.pausetime = 11,11
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125)
givepower = 15,15
ID = 630

[State 630, hitdef2 2002um]
type = HitDef
triggerall = fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 6
attr = A,NA
damage = 75*fvar(39)
animtype = Middle
air.animtype = Back
ground.type = Low
guardflag = H
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -20,-70
hitsound = S5,IfElse(Random%2=1,8,13)
guardsound = S6,1
pausetime = 11,13
guard.pausetime = 11,11
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125)
givepower = 15,15
ID = 631

[State 630, hitdef1 98UM]
type = HitDef
triggerall = fvar(29) = 4
trigger1 = !var(9)
trigger1 = AnimElem = 4, = 1
attr = A,NA
damage = Ceil((Ceil(14*0.5**(var(21)))-1)*100*fvar(10)*fvar(35)/10/119)
animtype = Middle
air.animtype = Back
ground.type = Low
guardflag = HA
hitflag = MAF
priority = 4,hit
sparkno = S7201
guard.sparkno = S7211
sparkxy = -10,-100
hitsound = S5,3
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75-(fvar(29)=4&&var(52)>0)*1.35
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 630

[State 630, hitdef2 98UM]
type = HitDef
triggerall = fvar(29) = 4
trigger1 = !var(9)
trigger1 = AnimElem = 6
attr = A,NA
damage = Ceil((Ceil(14*0.5**(var(21)))-1)*100*fvar(10)*fvar(35)/10/119)
animtype = Middle
air.animtype = Back
ground.type = Low
guardflag = HA
hitflag = MAF
priority = 4,hit
sparkno = S7201
guard.sparkno = S7211
sparkxy = -20,-70
hitsound = S5,3
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75-(fvar(29)=4&&var(52)>0)*1.35
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 631

[State -2]
type = VarSet
trigger1 = MoveContact = 1
var(11) = 1
ignorehitpause = 1


;=================================================================
;ジャンプ強キック
[Statedef 635]
type = A
physics = A
movetype = A
poweradd = 0
ctrl = 0
anim = 635
sprpriority = 2

[State 635, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),51,71),1)
channel = 0

[State 635, snd2]
type = PlaySnd
trigger1 = AnimElem = 1
value = S3,1

[State 635, hitdef 2002]
type = HitDef
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 3, = 1
attr = A,NA
damage = Ceil(12*(100-Random%11)*fvar(10)*fvar(35)/10/103)
animtype = Middle
air.animtype = Back
ground.type = Low
guardflag = H
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -10,-50
hitsound = S5,IfElse(Random%2=1,8,13)
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 635

[State 635, hitdef 2002um]
type = HitDef
triggerall = fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 3
attr = A,NA
damage = Ceil(IfElse(fvar(28)=0,9,12)*fvar(10)*fvar(35)/12)
animtype = Middle
air.animtype = Back
ground.type = Low
guardflag = H
hitflag = MAF
priority = 4,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -10,-50
hitsound = S5,IfElse(Random%2=1,8,13)
guardsound = S6,1
pausetime = 11,13
guard.pausetime = 11,11
ground.slidetime = 12
ground.hittime = 12
guard.ctrltime = 12
air.hittime = 60
ground.velocity = -5.75
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 635

[State 635, hitdef 98UM]
type = HitDef
triggerall = fvar(29) = 4
trigger1 = !var(9)
trigger1 = AnimElem = 3, = 1
attr = A,NA
damage = Ceil(15*100*fvar(10)*fvar(35)/10/119)
animtype = Middle
air.animtype = Back
ground.type = Low
guardflag = HA
hitflag = MAF
priority = 4,hit
sparkno = S7201
guard.sparkno = S7211
sparkxy = -10,-50
hitsound = S5,3
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -5.75-(fvar(29)=4&&var(52)>0)*1.35
air.velocity = -4,-7
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 635

[State -2]
type = VarSet
trigger1 = MoveContact = 1
var(11) = 1
ignorehitpause = 1


;=================================================================
;ジャンプ吹っ飛ばし
[Statedef 640]
type = A
physics = A
movetype = A
poweradd = 0
ctrl = 0
anim = 640
sprpriority = 2

[State 640, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),52,72),1)
channel = 0

[State 640, snd2]
type = PlaySnd
trigger1 = AnimElem = 1
value = S3,1

[State 640, hitdef 2002]
type = HitDef
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 3, = 1
attr = A,NA
damage = Ceil(IfElse(var(4)=0,16,12)*(100-Random%11)*fvar(10)*fvar(35)/10/103)
animtype = Back
air.animtype = Back
ground.type = Low
guardflag = H
hitflag = MAF
priority = 7,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -10,-30
hitsound = S5,9
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -4,-7.5
guard.velocity = -13.75
air.velocity = -4,-7.5
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125)
givepower = 15,15
ID = 640

[State 640, hitdef 2002um]
type = HitDef
triggerall = fvar(26)
trigger1 = !var(9)
trigger1 = AnimElem = 3, = 1
attr = A,NA
damage = 90*fvar(39)
animtype = Back
air.animtype = Back
ground.type = Low
guardflag = H
hitflag = MAF
priority = 7,hit
sparkno = S7251
guard.sparkno = S7261
sparkxy = -10,-30
hitsound = S5,9
guardsound = S6,1
pausetime = 11,13
guard.pausetime = 11,11
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -4,-7.5
guard.velocity = -13.75
air.velocity = -4,-7.5
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,150),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,150)
givepower = 15,15
ID = 640

[State 640, hitdef 98UM]
type = HitDef
triggerall = fvar(29) = 4
trigger1 = !var(52)
trigger1 = !var(9)
trigger1 = AnimElem = 3, = 1
attr = A,NA
damage = Ceil(IfElse(var(4)=0,17,15)*100*fvar(10)*fvar(35)/10/119)
animtype = Back
air.animtype = Back
ground.type = Low
guardflag = HA
hitflag = MAF
priority = 7,hit
sparkno = S7201
guard.sparkno = S7211
sparkxy = -10,-30
hitsound = S5,4
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -4-(fvar(29)=4&&var(52)>0),-7.5
ground.velocity = -13.75-(fvar(29)=4&&var(52)>0)*2.25
air.velocity = -4-(fvar(29)=4&&var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125)
givepower = 15,15
ID = 640

[State 640, hitdef 98UM max]
type = HitDef
triggerall = fvar(29) = 4
trigger1 = var(52)
trigger1 = !var(9)
trigger1 = AnimElem = 3, = 1
attr = A,NA
damage = Ceil(IfElse(var(4)=0,17,15)*100*fvar(10)*fvar(35)/10/119)
animtype = UP
ground.type = Low
guardflag = HA
hitflag = MAF
priority = 7,hit
sparkno = S7201
guard.sparkno = S7211
sparkxy = -10,-30
hitsound = S5,4
guardsound = S6,1
pausetime = 11,11
guard.pausetime = 11,9
ground.slidetime = 9
ground.hittime = 9
guard.ctrltime = 9
air.hittime = 60
ground.velocity = -4-(fvar(29)=4&&var(52)>0),-7.5
ground.velocity = -13.75-(fvar(29)=4&&var(52)>0)*2.25
air.velocity = -4-(fvar(29)=4&&var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,125)
givepower = 15,15
ID = 640


[State -2]
type = VarSet
trigger1 = MoveContact = 1
var(11) = 1
ignorehitpause = 1


;-----------------------------------------------------------------
;スコーピオンデスロック
[Statedef 800]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 800
sprpriority = 2

[State -2, overkill];オーバーキルリセット
type = varset
trigger1 = Time = 0
var(20) = 0

[State 800, 1]
type = HitDef
Triggerall = (abs(P2BodyDist X) <= 18)
trigger1 = Time = 0
trigger1 = P2Movetype != H
animtype  = hard
attr = S, NT
hitflag = M-
priority = 4, Miss
sparkno = -1
sprpriority = 1
p2facing = 1
p1stateno = 810
p2stateno = 820
guard.dist = 0
fall = 1
fall.recover = 0
getpower = 0,0
ID = 800

[State 800, end]
type = ChangeState
trigger1 = AnimTime = 0
Trigger1 = !(abs(P2BodyDist X) < 29)
value = 210

[State 800, end]
type = ChangeState
trigger1 = AnimTime = 0
Trigger1 = (abs(P2BodyDist X) < 29)
value = 215


[Statedef 810];投げ動作
type = S
physics = S
movetype = A
poweradd = 0
ctrl = 0
velset = 0,0
anim = 810
sprpriority = 4

[State 810, width]
type = Width
trigger1 = Time = 0
edge = 72,0

[State 810, targetbind]
type = TargetBind
trigger1 = Time = 0
pos = 55,0
ID = 800

[State 810, targetbind]
type = TargetBind
trigger1 = Time = 1
pos = 55,-70
ID = 800

[State 811, targetstate]
type = TargetState
trigger1 = AnimElem = 2
value = 821
ID = 800

[State 810, explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7220
pos = 55,-70
postype = p1
sprpriority = 3
ownpal = 1

[State 810, snd]
type = PlaySnd
trigger1 = AnimElem = 2
value = S5,17
channel = 0

[State 811, targetstate]
type = TargetState
trigger1 = AnimElem = 5
value = 822
ID = 800

[State 810, explod]
type = Explod
trigger1 = AnimElem = 7
anim = 7230
pos = 55,-120
postype = p1
sprpriority = 5
ownpal = 1

[State 810, snd]
type = PlaySnd
trigger1 = AnimElem = 7
trigger2 = AnimElem = 9
trigger3 = AnimElem = 11
trigger4 = AnimElem = 13
value = S5,18

[State 810, targetlife 2002]
type = TargetLifeAdd
triggerall = fvar(29) = 1 && !fvar(26)
trigger1 = AnimElem = 7
trigger2 = AnimElem = 9
trigger3 = AnimElem = 11
trigger4 = AnimElem = 13
value = -Ceil(4*(100-Random%11)*fvar(10)*fvar(36)/10/103)
kill = 0
ID = 800

[State 810, targetlife 2002um]
type = TargetLifeAdd
triggerall = fvar(26)
trigger1 = AnimElem = 7
trigger2 = AnimElem = 9
trigger3 = AnimElem = 11
trigger4 = AnimElem = 13
value = -Ceil(IfElse(fvar(28)=0,3,4)*fvar(10)*fvar(36)/12)
kill = 0
ID = 800

[State 810, targetlife 98UM]
type = TargetLifeAdd
triggerall = fvar(29) != 1
trigger1 = AnimElem = 7
trigger2 = AnimElem = 9
trigger3 = AnimElem = 11
trigger4 = AnimElem = 13
value = -Ceil(4*100*fvar(10)*fvar(36)/10/119)
kill = 0
ID = 800

[State 810, overkill];オーバーキル判定
type = varset
triggerall = NumTarget(800) = 1
trigger1 = Target,life <= 1
var(20) = 1

[State 810, targetbind]
type = TargetBind
trigger1 = Time = 20
pos = 55,-120
ID = 800

[State 810, targetbind]
type = TargetBind
trigger1 = Time = 26
pos = 55, -125
ID = 800

[State 810, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 811

[Statedef 811];放り投げ
type = S
physics = S
movetype = A
poweradd = 0
ctrl = 0
velset = 0,0
anim = 811
sprpriority = 4

[State 811, targetbind]
type = TargetBind
trigger1 = Animelem = 1
pos = 40,-123
ID = 800

[State 811, targetbind]
type = TargetBind
trigger1 = Animelem = 2
pos = 20,-120
ID = 800

[State 811, 0]
type = PlaySnd
trigger1 = Animelem = 3
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),53,73),0)
channel = 0

[State 811, targetbind]
type = TargetBind
trigger1 = Animelem = 3
pos = 50,-115
ID = 800

[State 811, targetstate]
type = TargetState
trigger1 = AnimElem = 4
value = 823
ID = 800

[State 811, width]
type = Width
trigger1 = AnimElem = 4
edge = 120,0

[State 811, targetbind]
type = TargetBind
trigger1 = Animelem = 4
pos = 90-(EnemyNear(var(5)),Const(size.head.pos.x)),-150-(EnemyNear(var(5)),Const(size.head.pos.y))
ID = 800

[State 811, overkill];オーバーキル
type = TargetLifeAdd
triggerall = var(20)
trigger1 = AnimElem = 4
value = -999999
ID = 800

[State -2, targetdrop]
type = TargetDrop
trigger1 = AnimTime = -1

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 811, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


[Statedef 820];食らい動作
type = S
physics = N
movetype = H
poweradd = 0
ctrl = 0
velset = 0,0
sprpriority = 2

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
value = 5050

[State -2]
type = ChangeAnim2
trigger1 = Time = 0
value = 820

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[Statedef 821]
type = S
physics = N
movetype = H
poweradd = 0
ctrl = 0
velset = 0,0
sprpriority = 2

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
value = 5050

[State -2]
type = ChangeAnim2
trigger1 = Time = 0
value = 821

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[Statedef 822]
type = S
physics = N
movetype = H
poweradd = 0
ctrl = 0
velset = 0,0
sprpriority = 2

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
value = 5050

[State -2]
type = ChangeAnim2
trigger1 = Time = 0
value = 822

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[Statedef 823]
type = S
physics = N
movetype = H
poweradd = 0
ctrl = 0
velset = -4,-8
sprpriority = 2

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
value = 5050

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State -2]
type = ChangeAnim2
trigger1 = Time = 0
value = 823

[State 823, grav]
type = VelAdd
trigger1 = Time > 0
y = .55

[State 823, end]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100


;-----------------------------------------------------------------
;スコーピオンブロウ
[Statedef 850]
type    = S
movetype= A
physics = S
juggle  = 0
velset = 0,0
ctrl = 0
anim = 800
sprpriority = 2

[State 850, hitdef]
type = HitDef
Triggerall = (abs(P2BodyDist X) <= 18)
trigger1 = Time = 0
trigger1 = P2Movetype != H
animtype  = hard
attr = S, NT
hitflag = M-
priority = 4, Miss
sparkno = -1
sprpriority = 1
p2facing = 1
p1stateno = 860
p2stateno = 870
guard.dist = 0
fall = 1
fall.recover = 0
getpower = 0,0
ID = 850

[State 850, end]
type = ChangeState
trigger1 = AnimTime = 0
Trigger1 = !(abs(P2BodyDist X) < 24)
value = 230

[State 850, end]
type = ChangeState
trigger1 = AnimTime = 0
Trigger1 = (abs(P2BodyDist X) < 24)
value = 235


[Statedef 860]
type = S
movetype = A
physics = S
ctrl = 0
velset = 0,0
anim = 860
sprpriority = 6

[State 860, targetbind]
type = TargetBind
trigger1 = AnimElem = 1
pos = 45,0
ID = 850

[State 860, targetbind]
type = TargetBind
trigger1 = AnimElem = 2
pos = 35,0
ID = 850

[State 860, snd]
type = PlaySnd
trigger1 = AnimElem = 2
value = S5,17

[State 860, explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7220
ID = 7220
pos = 60,-75
postype = p1
sprpriority = 5
ownpal = 1

[State 860, targetbind]
type = TargetBind
trigger1 = AnimElem = 3
pos = -10,0
ID = 850

[State 860, turn]
type = Turn
trigger1 = AnimElem = 3

[State 860, sprpriority]
type = SprPriority
trigger1 = AnimElem = 3
value = 2

[State 860, explod]
type = ModifyExplod
trigger1 = AnimElem = 3
ID = 7220
sprpriority = 3

[State 860, targetbind]
type = TargetBind
trigger1 = AnimElem = 4
pos = -32,0
ID = 850

[State 860, targetbind]
type = TargetBind
trigger1 = AnimElem = 5
pos = -4,0
ID = 850

[State 860, targetbind]
type = TargetBind
trigger1 = AnimElem = 6
pos = 23,0
ID = 850

[State 860, width]
type = Width
trigger1 = AnimElem = 6
edge = 112,0

[State 860, targetbind]
type = TargetBind
trigger1 = AnimElem = 7
pos = 48,0
ID = 850

[State 860, snd]
type = PlaySnd
trigger1 = AnimElem = 7
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),53,73),0)
channel = 0

[State 860, targetbind]
type = TargetBind
trigger1 = AnimElem = 8
pos = 52,0
ID = 850

[State 860, targetbind]
type = TargetBind
trigger1 = AnimElem = 9
pos = 73,0
ID = 850

[State 860, snd]
type = PlaySnd
trigger1 = AnimElem = 9
value = S5,(1+(fvar(29)=[1,3])*5)

[State 810, targetlife 2002]
type = TargetLifeAdd
triggerall = fvar(29) = 1 && !fvar(26)
trigger1 = AnimElem = 9
value = -Ceil(17*(100-Random%11)*fvar(10)*fvar(36)/10/103)
kill = 1
ID = 850

[State 810, targetlife 2002um]
type = TargetLifeAdd
triggerall = fvar(26)
trigger1 = AnimElem = 9
value = -Ceil(IfElse(fvar(28)=0,10,16)*fvar(10)*fvar(36)/12)
kill = 1
ID = 850

[State 810, targetlife 98UM]
type = TargetLifeAdd
triggerall = fvar(29) != 1
trigger1 = AnimElem = 9
value = -Ceil(15*100*fvar(10)*fvar(36)/10/119)
kill = 1
ID = 850

[State 860, explod]
type = Explod
trigger1 = AnimElem = 9
anim = 7205+(fvar(29)=1)*50
pos = 80,-45
postype = p1
facing = -1
sprpriority = 5
ownpal = 1

[State 860, sprpriority]
type = SprPriority
trigger1 = AnimElem = 9
value = 4

[State 860, targetstate]
type = TargetState
trigger1 = AnimElem = 10
value = 871
ID = 850

[State 860, targetbind]
type = TargetBind
trigger1 = AnimElem = 10
pos = 94,0
ID = 850

[State 860, snd]
type = PlaySnd
trigger1 = Target,Pos Y = 0 && Target,StateNo = 872
value = S0,6
pan = Floor(abs(Target,Pos X - Pos X))
volume = -100
persistent = 0

[State 860, snd]
type = PlaySnd
trigger1 = Target,Pos Y = 0 && Target,StateNo = 872
value = S0,7
pan = Floor(abs(Target,Pos X - Pos X))
volume = -100
persistent = 0

[State 860, dust]
type = Helper
trigger1 = AnimTime = -1
trigger1 = NumHelper(860) = 0
ID = 860
stateno = 880
postype = p1
pos = 0,0
helpertype = normal
keyctrl = 0

[State -2, targetdrop]
type = TargetDrop
trigger1 = AnimTime = -1

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 860, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


[Statedef 870];食らい動作
type = S
physics = N
movetype = H
ctrl = 0
velset = 0,0
sprpriority = 3

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
value = 5050

[State -2]
type = ChangeAnim2
trigger1 = time = 0
value = 870

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 870, turn]
type = Turn
trigger1 = AnimElem = 4


[Statedef 871];吹き飛び
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = 3

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
value = 5050

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State -2]
type = ChangeAnim2
trigger1 = time = 0
value = 871

[State 871, vel]
type = VelSet
trigger1 = time = 0
x = -7
y = -5.5

[State 871, velmul]
type = VelAdd
trigger1 = Time > 0
y = .65

[State 871, end]
type = ChangeState
trigger1 = AnimElem = 4, >= 0
trigger1 = Pos Y >= 10
value = 872

[Statedef 872]
type = L
physics = N
movetype = H
ctrl = 0
velset = 0,0

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
value = 5050

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State -2]
type = ChangeAnim2
trigger1 = time = 0
value = 872

[State 872, pos]
type = PosSet
trigger1 = time = 0
y = 0

[State 872, 1]
type = VelSet
trigger1 = time = 0
x = -6

[State 872, ]
type = VelMul
trigger1 = 1
x = .87

[State 872, end]
type = SelfState
trigger1 = AnimTime = 0
trigger1 = life = 0
value = 5150

[State 872, end]
type = SelfState
trigger1 = AnimTime = 0
value = 5120


[Statedef 880];埃発生用
type = S
anim = 9999

[State 880, destroyself]
type = DestroySelf
trigger1 = NumEnemy = 1
trigger1 = !(EnemyNear(0),StateNo = [871,872])
trigger2 = NumEnemy > 1
trigger2 = !(EnemyNear(0),StateNo = [871,872])
trigger2 = !(EnemyNear(1),StateNo = [871,872])

[State 880]
type = BindToRoot
trigger1 = 1
pos = 0,0
facing = 1

[State 880]
type = VarSet
triggerall = Time = 0
trigger1 = EnemyNear(0),StateNo = [871,872]
var(1) = EnemyNear(0),ID

[State 880]
type = VarSet
triggerall = Time = 0
trigger1 = NumEnemy > 1
trigger1 = !(EnemyNear(0),StateNo = [871,872])
trigger1 = EnemyNear(1),StateNo = [871,872]
var(1) = EnemyNear(1),ID

[State 880, explod]
type = Explod
triggerall = NumExplod(7351) = 0
trigger1 = PlayerID(var(1)),StateNo = 872
trigger1 = PlayerID(var(1)),AnimElem = 2
anim = 7351
ID = 7351
pos = Floor(abs(PlayerID(var(1)),Pos X - Pos X)-26),-Floor(Pos Y)
postype = p1
facing = Facing*PlayerID(var(1)),Facing
sprpriority = 5
ownpal = 1

[State 880, explod]
type = Explod
triggerall = NumExplod(7352) = 0
trigger1 = PlayerID(var(1)),StateNo = 872
trigger1 = PlayerID(var(1)),AnimElem = 2
anim = 7352
ID = 7352
pos = Floor(abs(PlayerID(var(1)),Pos X - Pos X)-26),-Floor(Pos Y)
postype = p1
facing = Facing*PlayerID(var(1)),Facing
sprpriority = 5
ownpal = 1


;============================================================================
;============================================================================
;============================================================================

;カイザーウェイブ2002
[Statedef 1000]
type = S
physics = S
movetype = A
ctrl = 0
anim = 1000
sprpriority = 2
poweradd = IfElse(!(fvar(29)=1||fvar(29)=4),79,0)

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State 1000]
type = VarSet
triggerall = !fvar(26)
trigger1 = Floor(IfElse(var(30)=1,26,23)*(0.5**IfElse(HitCount>4,4,HitCount)))-1 >= 1
fvar(24) = Floor(IfElse(var(30)=1,26,23)*(0.5**IfElse(HitCount>4,4,HitCount)))-1
ignorehitpause = 1

[State 1000]
type = VarSet
triggerall = !fvar(26)
trigger1 = Floor(IfElse(var(30)=1,26,23)*(0.5**IfElse(HitCount>4,4,HitCount)))-1 < 1
fvar(24) = 1
ignorehitpause = 1

[State 1000]
type = VarSet
triggerall = fvar(26)
trigger1 = Floor(IfElse(var(30)=1,IfElse(fvar(28)=0,13,24),IfElse(fvar(28)=0,13,24))*(0.5**IfElse(HitCount>4,4,HitCount)))-1 >= 1
fvar(24) = Floor(IfElse(var(30)=1,IfElse(fvar(28)=0,13,24),IfElse(fvar(28)=0,13,24))*(0.5**IfElse(HitCount>4,4,HitCount)))-1
ignorehitpause = 1

[State 1000]
type = VarSet
triggerall = fvar(26)
trigger1 = Floor(IfElse(var(30)=1,IfElse(fvar(28)=0,18,24),IfElse(fvar(28)=0,13,24))*(0.5**IfElse(HitCount>4,4,HitCount)))-1 < 1
fvar(24) = 1
ignorehitpause = 1

[State 1000, timer];var(30)：カイザーウェイブ段階
type = varset
trigger1 = time = 0
var(30) = 0

[State 1000, timer]
type = varset
trigger1 = Animelem = 12
var(30) = 1

[State 1000, timer]
type = varset
trigger1 = AnimElem = 24
var(30) = 2

[State 1000, posadd]
type = PosAdd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 4
x = -7

[State 1000, explod]
type = Explod
triggerall = NumExplod(8100) = 0
trigger1 = AnimElem = 6
ID = 8100
anim = 8100
pos = -62,-90
postype = p1
sprpriority = 3
bindtime = -1
removetime = -1
removeongethit = 1

[State 1000, modifyexplod]
type = ModifyExplod
trigger1 = AnimElem = 7
ID = 8100
pos = -60,-84
postype = p1

[State 1000, modifyexplod]
type = ModifyExplod
trigger1 = AnimElem = 8
ID = 8100
pos = -62,-82
postype = p1

[State 1000, modifyexplod]
type = ModifyExplod
trigger1 = AnimElem = 12
ID = 8100
pos = -60,-76
postype = p1

[State 1000, removeexplod]
type = RemoveExplod
trigger1 = AnimElem = 12
ID = 8100

[State 1000, explod]
type = Explod
triggerall = NumExplod(8103) = 0
trigger1 = AnimElem = 12
ID = 8103
anim = 8103
pos = -80,-72
postype = p1
sprpriority = 3
bindtime = -1
removetime = -1
removeongethit = 1

[State 1000, removeexplod]
type = RemoveExplod
trigger1 = AnimElem = 24
ID = 8103

[State 1000, explod]
type = Explod
triggerall = NumExplod(8106) = 0
trigger1 = AnimElem = 24
ID = 8106
anim = 8106
pos = -80,-72
postype = p1
sprpriority = 3
bindtime = -1
removetime = -1
removeongethit = 1

[State 1000, hitby]
type = HitBy
trigger1 = AnimElem = 12, >= 0
value = SCA,AT
time = 1

[State 1000, hitdef];36F,12hit+26hit,51F=38hit,87F
type = HitDef
triggerall = !fvar(26)
trigger1 = var(30) = 1 && Time%3 = 2;41F～
attr = S,SP
guardflag = M
hitflag = MAF
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(37)/10/103),Ceil(IfElse(HitCount=0,2,1)*(100-Random%11)*fvar(10)*fvar(37)/10/103)
p2facing = 1
animtype = back
priority = 7,hit
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7255
guard.sparkno = S7262
sparkxy = -15,-70
hitsound = S5,9
guardsound = S6,1
ground.velocity = -2.2,-14.8
guard.velocity = 0
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
fall = 1
fall.recover = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 1000

[State 1000, hitdef];36F,12hit+26hit,51F=38hit,87F
type = HitDef
triggerall = !fvar(26)
trigger1 = fvar(29) = 1
trigger1 = var(30) = 2 && Time%2 = 1;87F～
trigger2 = fvar(29) != 1
trigger2 = var(30) = 2 && Time%2 = 0;87F～
attr = S,SP
guardflag = -1
hitflag = MAF
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(37)/10/103),Ceil(IfElse(HitCount=0,2,1)*(100-Random%11)*fvar(10)*fvar(37)/10/103)
p2facing = 1
animtype = back
priority = 7,hit
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7255
guard.sparkno = S7262
sparkxy = -15,-70
hitsound = S5,9
guardsound = S6,1
ground.velocity = -2.2,-14.8
guard.velocity = 0
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
fall = 1
fall.recover = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 1000

[State 1000, hitdef2002um];36F,12hit+26hit,51F=38hit,87F
type = HitDef
triggerall = fvar(26)
trigger1 = var(30) = 1 && Time%3 = 2;41F～
attr = S,SP
guardflag = M
hitflag = MAF
damage = Ceil(fvar(24)*fvar(10)*fvar(37)/12),Ceil(IfElse(HitCount=0,2,1)*fvar(10)*fvar(37)/12)
p2facing = 1
animtype = back
priority = 7,hit
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7255
guard.sparkno = S7262
sparkxy = -15,-70
hitsound = S5,9
guardsound = S6,1
ground.velocity = -2.2,-14.8
guard.velocity = 0
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
fall = 1
fall.recover = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 1000

[State 1000, hitdef2002um];36F,12hit+26hit,51F=38hit,87F
type = HitDef
triggerall = fvar(26)
trigger1 = var(30) = 2 && Time%2 = 0;87F～
attr = S,SP
guardflag = -1
hitflag = MAF
damage = Ceil(fvar(24)*fvar(10)*fvar(37)/12),Ceil(IfElse(HitCount=0,2,1)*fvar(10)*fvar(37)/12)
p2facing = 1
animtype = back
priority = 7,hit
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7255
guard.sparkno = S7262
sparkxy = -15,-70
hitsound = S5,9
guardsound = S6,1
ground.velocity = -2.2,-14.8
guard.velocity = 0
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
fall = 1
fall.recover = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 1000

[State 1000, targetstate]
type = TargetState
triggerall = NumTarget(1000)
trigger1 = MoveHit = 1
value = 1020
ID = 1000

[State 1000, varset]
type = VarSet
trigger1 = AnimElem = 12
var(31) = 1

[State 1000, varreset];バグ光弾出現判定
type = VarSet
trigger1 = Time = 0
trigger2 = !(AnimElem = 12)
var(31) = 0

[State 1000, end]
type = ChangeState
trigger1 = 0
trigger1 = var(59) = 0
trigger1 = !(Command = "holdx" || Command = "holdy")
trigger2 = AnimTime = 0
value = 1010


[Statedef 1010];カイザーウェイブ発射
type = S
physics = S
movetype = A
ctrl = 0
velset = 0,0
anim = 1010+var(30)
sprpriority = 2
hitcountpersist = 1

[State 1000]
type = VarSet
triggerall = !fvar(26)
trigger1 = Floor(IfElse(var(30)=1,26,23)*(0.5**IfElse(HitCount>4,4,HitCount)))-1 >= 1
fvar(24) = Floor(IfElse(var(30)=1,26,23)*(0.5**IfElse(HitCount>4,4,HitCount)))-1
ignorehitpause = 1

[State 1000]
type = VarSet
triggerall = !fvar(26)
trigger1 = Floor(IfElse(var(30)=1,26,23)*(0.5**IfElse(HitCount>4,4,HitCount)))-1 < 1
fvar(24) = 1
ignorehitpause = 1

[State 1000]
type = VarSet
triggerall = fvar(26)
trigger1 = Floor(IfElse(var(30)=1,IfElse(fvar(28)=0,13,24),IfElse(fvar(28)=0,13,24))*(0.5**IfElse(HitCount>4,4,HitCount)))-1 >= 1
fvar(24) = Floor(IfElse(var(30)=1,IfElse(fvar(28)=0,13,24),IfElse(fvar(28)=0,13,24))*(0.5**IfElse(HitCount>4,4,HitCount)))-1
ignorehitpause = 1

[State 1000]
type = VarSet
triggerall = fvar(26)
trigger1 = Floor(IfElse(var(30)=1,IfElse(fvar(28)=0,13,24),IfElse(fvar(28)=0,13,24))*(0.5**IfElse(HitCount>4,4,HitCount)))-1 < 1
fvar(24) = 1
ignorehitpause = 1

[State 1000, helper];バグ光弾
type = Helper
triggerall = !fvar(26)
triggerall = Time = [0,1]
trigger1 = var(31) && MoveHit = 1
ID = 1015
name = "bug kaizer"
stateno = 1015
sprpriority = 7
stateno = 1015
helpertype = normal
keyctrl = 0
persistent = 0
ignorehitpause = 1
ownpal = 1
supermovetime = 2147483647
pausemovetime = 2147483647
ignorehitpause = 1

[State 1000, hitdef]
type = HitDef
triggerall = !fvar(26)
trigger1 = var(30) = 1 && Time%3 = 0
attr = S,SP
guardflag = M
hitflag = MAF
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(37)/10/103),Ceil(IfElse(HitCount=0,2,1)*(100-Random%11)*fvar(10)*fvar(37)/10/103)
p2facing = 1
animtype = back
priority = 7,hit
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7255
guard.sparkno = S7262
sparkxy = -15,-70
hitsound = S5,9
guardsound = S6,1
ground.velocity = -2.2,-14.8
guard.velocity = 0
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
fall = 1
fall.recover = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 1000

[State 1000, hitdef]
type = HitDef
triggerall = !fvar(26)
trigger1 = var(30) = 2 && Time%2 = 0
attr = S,SP
guardflag = -1
hitflag = MAF
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(37)/10/103),Ceil(IfElse(HitCount=0,2,1)*(100-Random%11)*fvar(10)*fvar(37)/10/103)
p2facing = 1
animtype = back
priority = 7,hit
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7255
guard.sparkno = S7262
sparkxy = -15,-70
hitsound = S5,9
guardsound = S6,1
ground.velocity = -2.2,-14.8
guard.velocity = 0
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
fall = 1
fall.recover = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 1000

[State 1000, hitdef2002um]
type = HitDef
triggerall = fvar(26)
trigger1 = var(30) = 1 && Time%3 = 0
attr = S,SP
guardflag = M
hitflag = MAF
damage = Ceil(fvar(24)*fvar(10)*fvar(37)/12),Ceil(IfElse(HitCount=0,2,1)*fvar(10)*fvar(37)/12)
p2facing = 1
animtype = back
priority = 7,hit
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7255
guard.sparkno = S7262
sparkxy = -15,-70
hitsound = S5,9
guardsound = S6,1
ground.velocity = -2.2,-14.8
guard.velocity = 0
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
fall = 1
fall.recover = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 1000

[State 1000, hitdef2002um]
type = HitDef
triggerall = fvar(26)
trigger1 = var(30) = 2 && Time%2 = 0
attr = S,SP
guardflag = -1
hitflag = MAF
damage = Ceil(fvar(24)*fvar(10)*fvar(37)/12),Ceil(IfElse(HitCount=0,2,1)*fvar(10)*fvar(37)/12)
p2facing = 1
animtype = back
priority = 7,hit
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7255
guard.sparkno = S7262
sparkxy = -15,-70
hitsound = S5,9
guardsound = S6,1
ground.velocity = -2.2,-14.8
guard.velocity = 0
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
fall = 1
fall.recover = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,100)
givepower = 15,15
ID = 1000

[State 1000, targetstate]
type = TargetState
trigger1 = NumTarget(1000)
trigger1 = MoveHit = 1
value = 1020
ID = 1000

[State 1000, removeexplod]
type = RemoveExplod
trigger1 = NumExplod(8100) 
ID = 8100

[State 1000, removeexplod]
type = RemoveExplod
trigger1 = NumExplod(8103) 
trigger1 = AnimElem = 2
ID = 8103

[State 1000, removeexplod]
type = RemoveExplod
trigger1 = NumExplod(8106) 
trigger1 = AnimElem = 2
ID = 8106

[State 1010, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S2,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),52,72),12)
volume = 150
channel = 0

[State 1010, snd]
type = PlaySnd
trigger1 = AnimElem = 3
value = S3,6

[State 1010, posadd]
type = PosAdd
trigger1 = AnimElem = 2
x = 8

[State 1010, posadd]
type = PosAdd
trigger1 = AnimElem = 6
trigger2 = AnimElem = 7
trigger3 = AnimElem = 8
x = -8

[State 1010, カイザーウェイブ1段階目]
type = Projectile
triggerall = !fvar(26)
trigger1 = AnimElem = 3
trigger1 = var(30) = 0
attr = S,SP
ProjID = 1000
animtype = diagup
hitflag = MAF
guardflag = M
projpriority = 7
projanim = 8101
projhitanim = 8102
projremove = 1
offset = 96-16,0
postype = p1
velocity = 16,0
damage = Ceil(25*(100-Random%11)*fvar(10)*fvar(37)/10/103),Ceil(2*(100-Random%11)*fvar(10)*fvar(37)/10/103)
projedgebound = 100
projstagebound = 100
pausetime = 0,3
guard.pausetime = 0,1
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
ground.velocity = -7,-9
guard.velocity = -10.35
air.velocity = -7,-9
yaccel = .5
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-60
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 36+3+Ceil((-fvar(25))/10)
getpower = 0,0
givepower = 15,15
air.juggle = var(9)*16

[State 1010, カイザーウェイブ2段階目]
type = Projectile
triggerall = !fvar(26)
trigger1 = AnimElem = 2
trigger1 = var(30) = 1
attr = S,SP
ProjID = 1001
animtype = back
hitflag = MAF
guardflag = M
projpriority = 7
projanim = 8104
projhitanim = 8105
projremove = 1
offset = -80-16,-72
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(37)/10/103),Ceil(IfElse(HitCount=0,2,1)*(100-Random%11)*fvar(10)*fvar(37)/10/103)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 1020
getpower = 0,0
givepower = 15,15

[State 1010, カイザーウェイブ3段階目]
type = Projectile
triggerall = !fvar(26)
trigger1 = AnimElem = 2
trigger1 = var(30) = 2
attr = S,SP
ProjID = 1002
animtype = back
hitflag = MAF
guardflag = -1
projpriority = 7
projanim = 8107
projhitanim = 8108
projremove = 1
offset = 112-16,-72
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(37)/10/103),Ceil(IfElse(HitCount=0,2,1)*(100-Random%11)*fvar(10)*fvar(37)/10/103)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 1020
getpower = 0,0
givepower = 15,15


[State 1010, カイザーウェイブ1段階目]
type = Projectile
triggerall = fvar(26)
trigger1 = AnimElem = 3
trigger1 = var(30) = 0
attr = S,SP
ProjID = 1000
animtype = diagup
hitflag = MAF
guardflag = M
projpriority = 7
projanim = 8101
projhitanim = 8102
projremove = 1
offset = 96-16,0
postype = p1
velocity = 16,0
damage = 130*fvar(39),Ceil(IfElse(fvar(28)=0,1,2)*fvar(10)*fvar(37)/12)
projedgebound = 100
projstagebound = 100
pausetime = 0,3
guard.pausetime = 0,1
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
ground.velocity = -7,-9
guard.velocity = -10.35
air.velocity = -7,-9
yaccel = .5
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-60
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 36+3+Ceil((-fvar(25))/10)
getpower = 0,0
givepower = 15,15
air.juggle = var(9)*16

[State 1010, カイザーウェイブ2段階目]
type = Projectile
triggerall = fvar(26)
trigger1 = AnimElem = 2
trigger1 = var(30) = 1
attr = S,SP
ProjID = 1001
animtype = back
hitflag = MAF
guardflag = M
projpriority = 7
projanim = 8104
projhitanim = 8105
projremove = 1
offset = -80-16,-72
postype = p1
velocity = 16,0
damage = 110*fvar(39),Ceil(IfElse(HitCount=0,2,1)*fvar(10)*fvar(37)/12)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 1020
getpower = 0,0
givepower = 15,15

[State 1010, カイザーウェイブ3段階目]
type = Projectile
triggerall = fvar(26)
trigger1 = AnimElem = 2
trigger1 = var(30) = 2
attr = S,SP
ProjID = 1002
animtype = back
hitflag = MAF
guardflag = -1
projpriority = 7
projanim = 8107
projhitanim = 8108
projremove = 1
offset = 112-16,-72
postype = p1
velocity = 16,0
damage = 120*fvar(39),Ceil(IfElse(HitCount=0,2,1)*fvar(10)*fvar(37)/12)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 1020
getpower = 0,0
givepower = 15,15

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 1010, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


[Statedef 1015];バグ光弾
type = A
physics = N
movetype = A
anim = 8104
ctrl = 0
velset = 0,0
sprpriority = 7

[State -2]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noautoturn
ignorehitpause = 1

[State 1015]
type = BindToRoot
triggerall = !(Root,StateNo = 101 && Root,AnimTime >= -1)
trigger1 = Vel X = 0
pos = -80*(Root,Facing*Facing),-72
facing = 0
ignorehitpause = 1

[State 1015]
type = VarSet
trigger1 = 1
var(30) = Root,var(30)

[State 1015]
type = VarSet
trigger1 = 1
var(52) = Root,var(52)

[State 1015]
type = VarSet
trigger1 = 1
fvar(10) = Root,fvar(10)

[State 1015]
type = VarSet
trigger1 = 1
fvar(37) = Root,fvar(37)

[State 1015]
type = VarSet
trigger1 = Floor(IfElse(var(30)=1,26,23)*(0.5**IfElse(HitCount+var(1)>4,4,HitCount+var(1))))-1 >= 1
fvar(24) = Floor(IfElse(var(30)=1,26,23)*(0.5**IfElse(HitCount+var(1)>4,4,HitCount+var(1))))-1
ignorehitpause = 1

[State 1015]
type = VarSet
trigger1 = Floor(IfElse(var(30)=1,26,23)*(0.5**IfElse(HitCount+var(1)>4,4,HitCount+var(1))))-1 < 1
fvar(24) = 1
ignorehitpause = 1

[State -2]
type = PowerAdd
trigger1 = MoveContact = 1
value = IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,100)

[State -2]
type = SprPriority
trigger1 = 1
value = 7

[State -2]
type = VarSet
trigger1 = Time = 0
trigger1 = !(PrevStateNo = 1015)
var(1) = Parent,HitCount
persistent = 0

[State 1015]
type = VarSet
triggerall = Time > 10
trigger1 = Root,StateNo != 1010
var(3) = 1

[State 1015]
type = VarSet
triggerall = var(3)
trigger1 = Root,StateNo = 860 && Root,AnimElem = 13,= 2
trigger2 = Root,StateNo = 1010 && Root,AnimElem = 2,>= 0 && Root,AnimElem = 3,<= 0
trigger2 = (Root,NumProjID(1000) || Root,NumProjID(1001) || Root,NumProjID(1002))
trigger3 = (Root,StateNo = 1100 || Root,StateNo = 1150) && Root,AnimElem = 7, = 1
trigger4 = (Root,StateNo = 1230 || Root,StateNo = 2030) && Root,AnimElem = 4
trigger5 = (Root,StateNo = 1300 || Root,StateNo = 1350) && Root,AnimElem = 4
trigger6 = (Root,StateNo = 1400 || Root,StateNo = 1450) && Root,AnimElem = 12
trigger7 = (Root,StateNo = 1500 || Root,StateNo = 1550) && Root,AnimElem = 3,= 1
trigger8 = (Root,StateNo = 2011 || Root,StateNo = 2111) && Root,AnimElem = 2
trigger9 = Root,StateNo = 2510 && Root,AnimElem = 46,= 1
trigger10 = Root,StateNo = 2610 && Root,AnimElem = 94, = 1
var(2) = 1

[State 1010]
type = PlaySnd
trigger1 = var(2)
value = S3,6
persistent = 0

[State 1010, カイザーウェイブ2段階目]
type = Projectile
trigger1 = var(2)
attr = S,SP
ProjID = 1015
animtype = back
hitflag = MAF
guardflag = M
projpriority = 7
projsprpriority = 7
projanim = 8104
projhitanim = 8105
projremove = 1
offset = 16,0
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(37)/10/103),Ceil(IfElse(HitCount+var(1)=0,2,1)*(100-Random%11)*fvar(10)*fvar(37)/10/103)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 1020
getpower = IfElse((var(52)),0,100),IfElse((var(52)),0,100)
givepower = 15,15
persistent = 0

[State -2]
type = ParentVarSet
trigger1 = 1
var(32) = Facing

[State 1015, destroyself]
type = DestroySelf
trigger1 = !IsHelper
trigger2 = Root,MoveType = H
trigger3 = FrontEdgeBodyDist < -120
trigger4 = var(2)

[State 1000]
type = HitBy
trigger1 = 1
value = SCA,AP
time = 1

[State 1000]
type = HitOverRide
trigger1 = 1
attr = SCA,AP
slot = 1
stateno = 1015
time = -1
ignorehitpause = 1

[State 1000]
type = VarSet
triggerall = NumTarget
triggerall = Target,GetHitVar(fall) = 1
triggerall = Root,MoveHit
trigger1 = Root,StateNo = 240 || Root,StateNo = 245 || Root,StateNo = 260
trigger2 = Root,StateNo = 430 || Root,StateNo = 640
var(9) = 1

[State 1000]
type = VarSet
triggerall = var(9)
trigger1 = NumTarget
trigger1 = Target,StateType = L || Target,MoveType != H || Target,StateNo = [1020,1021]
trigger2 = NumTarget = 0
var(9) = 0

[State 1000, hitdef]
type = HitDef
triggerall = !var(9) 
trigger1 = Time%3 = 0
attr = S,SP
guardflag = M
hitflag = MAF
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(37)/10/103),Ceil(IfElse(HitCount+var(1)=0,2,1)*(100-Random%11)*fvar(10)*fvar(37)/10/103)
animtype = back
priority = 7,hit
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7255
guard.sparkno = S7262
sparkxy = -15+Floor(P2BodyDist X),-10
hitsound = S5,9+(RoundState != 2)*100
guardsound = S6,1+(RoundState != 2)*100
ground.velocity = -2.2*(Facing*EnemyNear,Facing),-14.8
air.velocity = -2.2*(Facing*EnemyNear,Facing),-14.8
yaccel = .64
air.hittime = 60
fall = 1
fall.recovertime = 0
getpower = 0,0
givepower = 15,15
ID = 1015

[State 1000, targetstate]
type = TargetState
triggerall = NumTarget(1015)
trigger1 = MoveHit = 1
trigger2 = MoveGuarded
value = 1020
ID = 1015

[State 1000]
type = ParentVarSet
trigger1 = MoveHit = 1
var(9) = 0

[Statedef 1020];カイザーウェイブB,Cヒット
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0


[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
value = 5050

[State 1020]
type = SelfState
trigger1 = GetHitVar(guarded) = 1
value = 150

[State 1020]
type = StateTypeSet
trigger1 = GetHitVar(fall) = 1
statetype = A

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 1020, anim]
type = ChangeAnim2
trigger1 = time = 0
value = 1021

[State 1020, freeze]
type = ChangeAnim2
trigger1 = time > 0
value = anim

[State 1020, end]
type = ChangeState
trigger1 = HitShakeOver
value = 1021

[Statedef 1021]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
value = 5050

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 1020, anim]
type = ChangeAnim2
trigger1 = time = 0
value = 1021

[State 1020, vel];47F.-177
type = velset
triggerall = Time = 0
trigger1 = NumEnemy = 1
trigger1 = Enemy(0),Name = "Rugal2nd"
trigger2 = NumEnemy > 1
trigger2 = !(Enemy(1),Name = "Rugal2nd")
trigger3 = NumEnemy > 1
trigger3 = Enemy(0),Name = "Rugal2nd" && Enemy(1),Name = "Rugal2nd"
trigger3 = Floor(abs(Enemy(0),Pos X) - Pos X) <= Floor(abs(Enemy(1),Pos X) - Pos X)
x = 2.2*Facing*(Enemy(0),var(32))
y = -14.8

[State 1020, vel]
type = velset
triggerall = Time = 0
triggerall = NumEnemy > 1
trigger1 = Enemy(1),Name = "Rugal2nd"
trigger2 = Enemy(0),Name = "Rugal2nd" && Enemy(1),Name = "Rugal2nd"
trigger2 = Floor(abs(Enemy(0),Pos X) - Pos X) <= Floor(abs(Enemy(1),Pos X) - Pos X)
x = 2.2*Facing*(Enemy(1),var(32))
y = -14.8

[State 1020, gravity]
type = VelAdd
Trigger1 = time > 0
y = .64

[State 1020, end]
type = SelfState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 5100


;-----------------------------------------------------------------
;烈風拳X
[Statedef 1100]
type = S
physics = S
movetype = A
ctrl = 0
anim = 1100
sprpriority = 2
poweradd = IfElse(!(fvar(29)=1||fvar(29)=4),47,0)

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State 1100, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S2,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),53,73),13)
volume = 150
channel = 0

[State 1100, snd]
type = PlaySnd
trigger1 = Animelem = 7, = 1
value = S3,7

[State 1100, 烈風拳]
type = Projectile
triggerall = !fvar(26)
trigger1 = Animelem = 7, = 1
attr = S,SP
hitflag = M
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = Low
projID = 1100
projanim = 8110
projhitanim = 8111
projremove = 1
velocity = 4
projpriority = 1
projedgebound = 50
projstagebound = 50
offset = 60-4,1
postype = p1
damage = Ceil(12*(100-Random%11)*fvar(10)*fvar(37)/10/103),Ceil(1*(100-Random%11)*fvar(10)*fvar(37)/10/103)
pausetime = 0,16
guard.pausetime = 0,10
sparkno = S7253
guard.sparkno = S7262
sparkxy = 15,-20
hitsound = S5,6
guardsound = S6,1
ground.slidetime = 20
ground.hittime = 20
guard.ctrltime = 20
air.hittime = 60
ground.velocity = -10.35
air.velocity = -4,-7
air.fall = 1
yaccel = .55
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 23+12+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15

[State 1100, 烈風拳]
type = Projectile
triggerall = fvar(26)
trigger1 = Animelem = 7, = 1
attr = S,SP
hitflag = M
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = Low
projID = 1100
projanim = 8110
projhitanim = 8111
projremove = 1
velocity = 4
projpriority = 1
projedgebound = 50
projstagebound = 50
offset = 60-4,1
postype = p1
damage = 50*fvar(39),10
pausetime = 0,16
guard.pausetime = 0,10
sparkno = S7253
guard.sparkno = S7262
sparkxy = 15,-20
hitsound = S5,6
guardsound = S6,1
ground.slidetime = 20
ground.hittime = 20
guard.ctrltime = 20
air.hittime = 60
ground.velocity = -10.35
air.velocity = -4,-7
air.fall = 1
yaccel = .55
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 23+12+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15

[State 1100,explod]
type = Explod
trigger1 = AnimElem = 7, = 1
anim = 8109
pos = 27,4
postype = p1
sprpriority = 5
ownpal = 1

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 1100, end]
type = ChangeState
trigger1 = Animtime = 0
value = 0
ctrl = 1


;-----------------------------------------------------------------
;烈風拳Y
[Statedef 1150]
type = S
physics = S
movetype = A
ctrl = 0
anim = 1100
sprpriority = 2
poweradd = IfElse(!(fvar(29)=1||fvar(29)=4),47,0)

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State 1150, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S2,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),53,73),13)
volume = 150
channel = 0

[State 1150, snd]
type = PlaySnd
trigger1 = Animelem = 7, = 1
value = S3,7

[State 1150, 烈風拳]
type = Projectile
triggerall = !fvar(26)
trigger1 = Animelem = 7, = 1
attr = S,SP
hitflag = M
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = Low
projID = 1150
projanim = 8110
projhitanim = 8111
projremove = 1
velocity = 7
projpriority = 1
projedgebound = 50
projstagebound = 50
offset = 60-7,1
postype = p1
damage = Ceil(14*(100-Random%11)*fvar(10)*fvar(37)/10/103),Ceil(1*(100-Random%11)*fvar(10)*fvar(37)/10/103)
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7253
guard.sparkno = S7262
sparkxy = 15,-20
hitsound = S5,6
guardsound = S6,1
ground.slidetime = 20
ground.hittime = 20
guard.ctrltime = 20
air.hittime = 60
ground.velocity = -10.35
air.velocity = -4,-7
air.fall = 1
yaccel = .55
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 23+12+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15

[State 1150, 烈風拳]
type = Projectile
triggerall = fvar(26)
trigger1 = Animelem = 7, = 1
attr = S,SP
hitflag = M
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = Low
projID = 1150
projanim = 8110
projhitanim = 8111
projremove = 1
velocity = 7
projpriority = 1
projedgebound = 50
projstagebound = 50
offset = 60-7,1
postype = p1
damage = 60*fvar(39),10
pausetime = 0,16
guard.pausetime = 0,10
sparkno = S7253
guard.sparkno = S7262
sparkxy = 15,-20
hitsound = S5,6
guardsound = S6,1
ground.slidetime = 20
ground.hittime = 20
guard.ctrltime = 20
air.hittime = 60
ground.velocity = -10.35
air.velocity = -4,-7
air.fall = 1
yaccel = .55
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 23+12+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15

[State 1150,explod]
type = Explod
trigger1 = AnimElem = 7, = 1
anim = 8109
pos = 27,4
postype = p1
sprpriority = 5
ownpal = 1

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 1150, end]
type = ChangeState
trigger1 = Animtime = 0
value = 0
ctrl = 1


;=================================================================
;ゴッドプレスX
[Statedef 1200]
type = S
physics = S
movetype = A
ctrl = 0
anim = 1200
sprpriority = 2
poweradd = IfElse(((var(52)&&fvar(29)=1)||fvar(34)=2),0,IfElse(fvar(29)=1,70,63))

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State 1200, vel]
type = VelSet
trigger1 = AnimElem = 5, >= 0 && AnimElem = 11, < 0
x = 8+(fvar(29)=3||fvar(29)=6)*4

[State 1200, snd]
type = PlaySnd
trigger1 = AnimElem = 5
value = S0,3
loop = 1
channel = 1

[State 1200, stopsnd]
type = StopSnd
trigger1 = Time = 0
trigger2 = Animelem = 11
channel = 1

[State 1200, hitdef]
type = HitDef
triggerall = fvar(26) != 1
trigger1 = !var(9)
trigger1 = AnimElem = 5
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Back
priority = 7,hit
guard.pausetime = 0,0
hitsound = S5,1
sparkno = S7255
guard.sparkno = -1
sparkxy = 0,-60
ground.type = High
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -4,-7.5
air.velocity = -4,-7.5
guard.velocity = -5
p2facing = 1
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
yaccel = .55
ID = 1200
kill = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,IfElse(fvar(29)=1,100,125)),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,IfElse(fvar(29)=1,100,125))
givepower = 15,15

[State 1200, hitdef 02um]
type = HitDef
triggerall = fvar(26) = 1
trigger1 = !var(9)
trigger1 = AnimElem = 5
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Back
priority = 7,hit
guard.pausetime = 0,0
hitsound = S5,1
sparkno = S7255
guard.sparkno = -1
sparkxy = 0,-60
ground.type = High
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -4,-7.5
air.velocity = -4,-7.5
guard.velocity = -5
p2facing = 1
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
yaccel = .55
ID = 1200
kill = 0
getpower = 130,130
givepower = 15,15

[State 1200, targetdrop]
type = TargetDrop
trigger1 = NumTarget(1200)
excludeID = 1200
keepone = 0
ignorehitpause = 1

[State 1200, nothitby]
type = NotHitBy
trigger1 = NumTarget(1200)
trigger1 = MoveHit
value = SCA
time = 1
ignorehitpause = 1

[State 1200, hit]
type = TargetState
triggerall = NumTarget(1200)
trigger1 = MoveHit
trigger1 = Target,StateNo != 1220
value = 1220
ID = 1200
ignorehitpause = 1

[State 1200, hit]
type = ChangeState
triggerall = NumTarget(1200)
trigger1 = MoveHit
trigger1 = Target,StateNo = 1220
value = 1210
ignorehitpause = 1

[State 1200, guarded]
type = ChangeState
trigger1 = MoveGuarded 
trigger2 = MoveHit > 1
trigger2 = !(Target,StateNo = 1220)
value = 1230
ignorehitpause = 1

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 1200, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;=================================================================
;ゴッドプレスY
[Statedef 1250]
type = S
physics = S
movetype = A
ctrl = 0
anim = 1250
sprpriority = 2
poweradd = IfElse(((var(52)&&fvar(29)=1)||fvar(34)=2),0,IfElse(fvar(29)=1,70,63))

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State 1200, vel]
type = VelSet
trigger1 = AnimElem = 5, >= 0 && AnimElem = 13, < 0
x = 8+(fvar(29)=3||fvar(29)=6)*4

[State 1200, snd]
type = PlaySnd
trigger1 = AnimElem = 5
value = S0,3
loop = 1
channel = 1

[State 1200, stopsnd]
type = StopSnd
trigger1 = Time = 0
trigger2 = Animelem = 13
channel = 1

[State 1200, hitdef]
type = HitDef
triggerall = fvar(26) != 1
trigger1 = !var(9)
trigger1 = AnimElem = 5
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Back
priority = 7,hit
guard.pausetime = 0,0
hitsound = S5,1
sparkno = S7255
guard.sparkno = -1
sparkxy = 0,-60
ground.type = High
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
ground.velocity = -4,-7.5
air.velocity = -4,-7.5
guard.velocity = -5
p2facing = 1
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
yaccel = .55
ID = 1250
kill = 0
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,IfElse(fvar(29)=1,100,125)),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,IfElse(fvar(29)=1,100,125))
givepower = 15,15

[State 1200, hitdef 02um]
type = HitDef
triggerall = fvar(26) = 1
trigger1 = !var(9)
trigger1 = AnimElem = 5
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Back
priority = 7,hit
guard.pausetime = 0,0
hitsound = S5,1
sparkno = S7255
guard.sparkno = -1
sparkxy = 0,-60
ground.type = High
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
ground.velocity = -4,-7.5
air.velocity = -4,-7.5
guard.velocity = -5
p2facing = 1
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
yaccel = .55
ID = 1250
kill = 0
getpower = 130,130
givepower = 15,15

[State 1200, targetdrop]
type = TargetDrop
trigger1 = NumTarget(1250)
excludeID = 1250
keepone = 0
ignorehitpause = 1

[State 1200, nothitby]
type = NotHitBy
trigger1 = NumTarget(1250)
trigger1 = MoveHit
value = SCA
time = 1
ignorehitpause = 1

[State 1200, hit]
type = TargetState
triggerall = NumTarget(1250)
trigger1 = MoveHit
trigger1 = Target,StateNo != 1220
value = 1220
ID = 1250
ignorehitpause = 1

[State 1200, hit]
type = ChangeState
triggerall = NumTarget(1250)
trigger1 = MoveHit
trigger1 = Target,StateNo = 1220
value = 1210
ignorehitpause = 1

[State 1200, guarded]
type = ChangeState
trigger1 = MoveGuarded
trigger2 = MoveHit > 1
trigger2 = !(Target,StateNo = 1220)
value = 1230
ignorehitpause = 1

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 1250, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


[Statedef 1210];運送
type = S
physics = N
movetype = A
anim = 2001
ctrl = 0
velset = 8+(fvar(29)=3||fvar(29)=6)*4,0
sprpriority = 2

[State -2]
type = VarSet
trigger1 = Time = 0
var(33) = 0

[State -2]
type = VarAdd
trigger1 = fvar(29) = 3 || fvar(29) = 6 
trigger1 = Time%3 = 0
var(33) = 1

[State -2]
type = VelAdd
trigger1 = fvar(29) = 3 || fvar(29) = 6 
x = .5

[State 1210, width]
type = Width
trigger1 = 1
edge = 17,0

[State 1210, targetbind]
type = TargetBind
trigger1 = Time = 0
time = -1
pos = -16,-70
ID = 1200

[State 1210, targetbind]
type = TargetBind
trigger1 = Time = 0
time = -1
pos = -16,-70
ID = 1250

[State 1210, snd]
type = PlaySnd
trigger1 = Time = 0
value = S0,6
volume = -100

[State 1210]
type = PlaySnd
trigger1 = fvar(26) = 1
trigger1 = FrontEdgeBodyDist < 40
value = S2,74
volume = 150
persistent = 0

[State 1210, end]
type = ChangeState
trigger1 = FrontEdgeBodyDist <= 0
trigger2 = Time > 500
value = 1211


[Statedef 1211]
type = S
physics = N
movetype = A
anim = 1202
ctrl = 0
sprpriority = 2

[State 1211, width]
type = Width
trigger1 = time = 0
edge = 95,0

[State 1211, targetbind]
type = TargetBind
trigger1 = Time = 0
pos = 68,-71
ID = 1200

[State 1211, targetbind]
type = TargetBind
trigger1 = Time = 0
pos = 68,-71
ID = 1250

[State 1211, targetstate]
type = TargetState
trigger1 = Time = 0
value = 1221
ID = 1200

[State 1211, targetstate]
type = TargetState
trigger1 = Time = 0
value = 1221
ID = 1250

[State 1211, snd]
type = PlaySnd
trigger1 = time = 0
trigger1 = fvar(29) = [1,3]
trigger1 = !fvar(26)
value = S2,54
volume = 150

[State 1211, vel]
type = VelSet
trigger1 = time = 0
x = 0

[State -2, shake]
type = EnvShake
trigger1 = AnimElem = 2
time = 12
freq = 60
ampl = -3

[State 1211, damage]
type = TargetLifeAdd
triggerall = !fvar(26)
trigger1 = Animelem = 2
value = -Ceil((17+var(33))*(100-Random%11)*fvar(10)*fvar(37)/10/103)
kill = 1
ID = 1200

[State 1211, damage]
type = TargetLifeAdd
triggerall = !fvar(26)
trigger1 = Animelem = 2
value = -Ceil((19+var(33))*(100-Random%11)*fvar(10)*fvar(37)/10/103)
kill = 1
ID = 1250

[State 1211, damage]
type = TargetLifeAdd
triggerall = fvar(26)
trigger1 = Animelem = 2
value = -90*fvar(39)
kill = 1
ID = 1200

[State 1211, damage]
type = TargetLifeAdd
triggerall = fvar(26)
trigger1 = Animelem = 2
value = -90*fvar(39)
kill = 1
ID = 1250

[State 1211, explod]
type = Explod
trigger1 = Animelem = 2
anim = 7255
pos = 110,-70
postype = p1
sprpriority = 7
ownpal = 1

[State 1211, targetbind]
type = TargetBind
trigger1 = AnimElem = 2
pos = 104,-74
ID = 1200

[State 1211, targetbind]
type = TargetBind
trigger1 = AnimElem = 2
pos = 104,-74
ID = 1250

[State 1211, snd]
type = PlaySnd
trigger1 = AnimElem = 2
value = S5,9

[State 1211, targetstate]
type = targetstate
trigger1 = Animelem = 3
value = 1222
ID = 1200

[State 1211, targetstate]
type = targetstate
trigger1 = Animelem = 3
value = 1222
ID = 1250

[State 1211, targetbind]
type = TargetBind
trigger1 = AnimElem = 3
pos = 104-(EnemyNear(var(5)),Const(size.mid.pos.x)),IfElse(-74-(EnemyNear(var(5)),Const(size.mid.pos.y))>0,0,-74-(EnemyNear(var(5)),Const(size.mid.pos.y)))
ID = 1200

[State 1211, targetbind]
type = TargetBind
trigger1 = AnimElem = 3
pos = 104-(EnemyNear(var(5)),Const(size.mid.pos.x)),IfElse(-74-(EnemyNear(var(5)),Const(size.mid.pos.y))>0,0,-74-(EnemyNear(var(5)),Const(size.mid.pos.y)))
ID = 1250

[State 1211, vel]
type = VelSet
trigger1 = Animelem = 6
x = const(velocity.run.back.x)*(1+(fvar(29)=3||fvar(29)=6)*0.5)
y = const(velocity.run.back.y)

[State 1211]
type = VelAdd
trigger1 = AnimElem = 6, >= 0
trigger1 = Vel X < -1
x = .40

[State 1211]
type = VelAdd
trigger1 = AnimElem = 6, > 0
y = .75

[State 1211, end]
type = ChangeState
triggerall = Animelem = 6, >= 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 1212


[Statedef 1212]
type = S
physics = S
anim = 2003
velset = 0,0
sprpriority = 2

[State -2, targetdrop]
type = TargetDrop
trigger1 = AnimTime = -1

[State 1212, pos]
type = PosSet
trigger1 = time = 0
y = 0

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 1212, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


[Statedef 1220]
type = S
physics = N
movetype = H
ctrl = 0
velset = 0,0
sprpriority = 3

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
trigger1 = !((P2StateNo = [1200,1300)) || (P2StateNo = [2000,2200))) 
value = 5050

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State -2]
type = ChangeAnim2
trigger1 = Time = 0
value = 2020

[Statedef 1221]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0
sprpriority = 1

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
trigger1 = !((P2StateNo = [1200,1300)) || (P2StateNo = [2000,2200))) 
value = 5050

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State -2]
type = ChangeAnim2
trigger1 = Time = 0
value = 2021

[State -2]
type = Width
trigger1 = 1
edge = 0,-100

[Statedef 1222]
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = 0

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
trigger1 = !((P2StateNo = [1200,1300)) || (P2StateNo = [2000,2200))) 
value = 5050

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State -2]
type = ChangeAnim2
trigger1 = Time = 0
value = 2022

[State 1222, vel]
type = VelSet
trigger1 = time = 0
x = -2
y = -7.8

[State 1222, gravity]
type = VelAdd
trigger1 = Time > 0
y = .50

[State 1222, 0]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100


[Statedef 1230];ガード時
type = S
movetype = A
physics = N
anim = 1230
ctrl = 0
poweradd = 0
sprpriority = 2

[State 1230, change]
type = ChangeState
triggerall = P2StateNo = [120,160]
trigger1 = !(fvar(29) = 1 || fvar(29) = 4)
trigger1 = Time = 0
value = 1235

[State 1230]
type = AfterImageTime
trigger1 = Time = 0
time = 0

[State 1230, snd]
type = PlaySnd
triggerall = P2StateNo = [120,160]
trigger1 = Time = 0
value = S6,1

[State 1230, explod]
type = Explod
triggerall = P2StateNo = [120,160]
trigger1 = Time = 0
anim = 7262
ID = 7262
pos = 24,-60
postype = p1
ontop = 1

[State 1230, veladd]
type = VelMul
trigger1 = !(Vel X = 0)
trigger1 = HitPauseTime = 0
x = .85

[State 1230, vel]
type = VelSet
trigger1 = AnimElem = 5
x = 0

[State 1230, vel]
type = VelSet
trigger1 = 1
y = 0

[State 1230, hitdef]
type = HitDef
triggerall = !fvar(26)
triggerall = !var(9)
trigger1 = AnimElem = 3
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Back
priority = 7,hit
damage = Ceil(17*(100-Random%11)*fvar(10)*fvar(37)/10/103)
pausetime = 17,17
guard.pausetime = 11,11
hitsound = S5,9
guardsound = S6,1
sparkno = S7255
guard.sparkno = S7262
sparkxy = -10-(P2StateNo!=[120,160])*50,-80
ground.type = High
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
ground.velocity = -8,-7.5
guard.velocity = -10.35
air.velocity = -8,-7.5
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = -19.8
air.cornerpush.veloff = 0
kill = 1
ID = 1230

[State 1230, hitdef]
type = HitDef
triggerall = fvar(26)
triggerall = !var(9)
trigger1 = AnimElem = 3
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Back
priority = 7,hit
damage = Ceil(IfElse(fvar(28)=0,9,18)*fvar(10)*fvar(37)/12)
pausetime = 17,17
guard.pausetime = 11,11
hitsound = S5,9
guardsound = S6,1
sparkno = S7255
guard.sparkno = S7262
sparkxy = -10-(P2StateNo!=[120,160])*50,-80
ground.type = High
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
ground.velocity = -8,-7.5
guard.velocity = -10.35
air.velocity = -8,-7.5
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = -19.8
air.cornerpush.veloff = 0
kill = 1
ID = 1230

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 1230, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[Statedef 1235];ガード時
type = A
movetype = A
physics = A
anim = 1235
ctrl = 0
poweradd = 0
sprpriority = 2
velset = 0,0

[State 105, 1]
type = VelSet
trigger1 = Time = 0
x = const(velocity.run.back.x)*(1+(fvar(29)=3||fvar(29)=6)*0.5)
y = const(velocity.run.back.y)

[State 105, 2];要調整
type = VelMul
trigger1 = 1
x = .98

[State 105, 3]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 52

;=================================================================
;ジェノサイドカッターA 2002
[Statedef 1300]
type = S
physics = S
movetype = A
ctrl = 0
anim = 1300
sprpriority = 2
poweradd = IfElse(((var(52)&&fvar(29)=1)||fvar(34)=2),0,100)

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State -2. 半数補正]
type = VarSet
trigger1 = Time = 0
var(21) = 0

[State -2. 半数補正]
type = VarAdd
trigger1 = NumTarget(1301)
trigger1 = MoveContact
var(21) = 1
ignorehitpause = 1
persistent = 0

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 1300]
type = NotHitBy
trigger1 = AnimElem = 10, < 0
value = SCA
time = 1

[State 1300, varreset]
type = VarSet
triggerall = fvar(29) = [4,6]
trigger1 = Time = 0
var(24) = 1

[State 1300, snd]
type = PlaySnd
trigger1 = Time = 0
value = S2,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),50,70),15)
volume = 150
channel = 0

[State 1300, explod]
type = Explod
trigger1 = Animelem = 4, = 1
anim = 8201
pos = 0,0
postype = p1
bindtime = -1
sprpriority = 4

[State 1300, snd]
type = PlaySnd
trigger1 = Animelem = 4, = 1
value = S3,2
volume = -50

[State 1300, snd]
type = PlaySnd
trigger1 = Animelem = 8, = 1
value = S3,2
volume = -50

[State 1300, explod]
type = Explod
trigger1 = Animelem = 8, = 1
anim = 8202
pos = 48,0
postype = p1
sprpriority = 4

[State 1300, hitdef1 2002]
type = HitDef
triggerall = !fvar(26)
triggerall = !var(9)
trigger1 = Animelem = 5, = 1
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Hard
ground.type = Low
priority = 7,hit
damage = Ceil(11*(100-Random%11)*fvar(10)*fvar(37)/10/103),Ceil(1*(100-Random%11)*fvar(10)*fvar(37)/10/103)
pausetime = 11,11-(fvar(29)!=1)*4
guard.pausetime = 11,9
sparkno = S7253
guard.sparkno = S7262
sparkxy = -20,-61+Ceil(P2BodyDist Y)
hitsound = S5,15
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 0
air.fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 39+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 0,0
guard.velocity = -12
air.velocity = 0,-11
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
;p2facing = 1
forcestand = 1
ID = 1300
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45)
givepower = 15,15

[State 1300, hitdef2]
type = HitDef
triggerall = !fvar(26)
triggerall = !var(9)
triggerall = AnimElem = 6
trigger1 = HitCount = 0
trigger2 = NumTarget(1300)
trigger2 = !(Target,StateNo = [1320,1321])
trigger3 = var(49)
trigger4 = P2MoveType != H
trigger5 = !((fvar(29) = 1 && !fvar(26)) || fvar(29) = 4)
attr = A,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Hard
ground.type = Low
priority = 7,hit
damage = Ceil((Ceil(16*0.5**(var(21)))-1)*(100-random%11)*fvar(10)*fvar(37)/10/103),Ceil(1*(100-Random%11)*fvar(10)*fvar(37)/10/103)
pausetime = 11,11
guard.pausetime = 11,9
sparkno = S7253
guard.sparkno = S7262
sparkxy = -20,-61+Ceil(P2BodyDist Y)
hitsound = S5,15
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 38+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 0,-11
guard.velocity = -12
air.velocity = 0,-11
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
;p2facing = 1
ID = 1301
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45)
givepower = 15,15

[State 1300, hitdef3]
type = HitDef
triggerall = !fvar(26)
triggerall = !var(9)
triggerall = Animelem = 11
trigger1 = !(NumTarget(1300))
trigger2 = NumTarget(1300)
trigger2 = !(Target,StateType = A)
trigger3 = var(49)
trigger4 = P2MoveType != H
trigger5 = !((fvar(29) = 1 && !fvar(26)) || fvar(29) = 4)
attr = A,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Hard
ground.type = Low
priority = 7,hit
damage = Ceil((Ceil(16*0.5**(var(21)))-1)*(100-random%11)*fvar(10)*fvar(37)/10/103),Ceil(1*(100-Random%11)*fvar(10)*fvar(37)/10/103)
pausetime = 17,17
guard.pausetime = 17,15
sparkno = S7253
guard.sparkno = S7262
sparkxy = -20,-61+Ceil(P2BodyDist Y)
hitsound = S5,15
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 38+17+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = -2,-11
guard.velocity = -12
air.velocity = -2,-11
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
;p2facing = 1
ID = 1302
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45)
givepower = 15,15


[State 1300, hitdef1 02um]
type = HitDef
triggerall = fvar(26)
triggerall = !var(9)
trigger1 = Animelem = 5, =1
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Hard
ground.type = Low
priority = 7,hit
damage = 42*fvar(39),Ceil(1*fvar(10)*fvar(37)/12)
pausetime = 11,7
guard.pausetime = 11,11
sparkno = S7253
guard.sparkno = S7262
sparkxy = -20,-61+Ceil(P2BodyDist Y)
hitsound = S5,15
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 0
air.fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 39+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 0,0
guard.velocity = -13
air.velocity = 0,-11
yaccel = .53
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
;p2facing = 1
forcestand = 1
ID = 1300
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45)
givepower = 15,15

[State 1300, hitdef2 02um]
type = HitDef
triggerall = fvar(26)
triggerall = !var(9)
triggerall = AnimElem = 6
trigger1 = HitCount = 0
trigger2 = NumTarget(1300)
trigger2 = !(Target,StateNo = [1320,1321])
trigger3 = var(49)
trigger4 = P2MoveType != H
trigger5 = !((fvar(29) = 1 && !fvar(26)) || fvar(29) = 4)
attr = A,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Hard
ground.type = Low
priority = 7,hit
damage = 34*fvar(39),Ceil(1*fvar(10)*fvar(37)/12)
pausetime = 11,11
guard.pausetime = 11,9
sparkno = S7253
guard.sparkno = S7262
sparkxy = -20,-61+Ceil(P2BodyDist Y)
hitsound = S5,15
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 38+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 0,-11
guard.velocity = -12
air.velocity = 0,-11
yaccel = .53
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
;p2facing = 1
ID = 1301
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45)
givepower = 15,15

[State 1300, hitdef3 02um]
type = HitDef
triggerall = fvar(26)
triggerall = !var(9)
triggerall = Animelem = 11
trigger1 = !(NumTarget(1300))
trigger2 = NumTarget(1300)
trigger2 = !(Target,StateType = A)
trigger3 = var(49)
trigger4 = P2MoveType != H
trigger5 = !((fvar(29) = 1 && !fvar(26)) || fvar(29) = 4)
attr = A,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Hard
ground.type = Low
priority = 7,hit
damage = 17*fvar(39),Ceil(1*fvar(10)*fvar(37)/12)
pausetime = 17,17
guard.pausetime = 17,15
sparkno = S7253
guard.sparkno = S7262
sparkxy = -20,-61+Ceil(P2BodyDist Y)
hitsound = S5,15
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 38+17+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = -2,-11
guard.velocity = -12
air.velocity = -2,-11
yaccel = .53
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
;p2facing = 1
ID = 1302
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45)
givepower = 15,15

[State 1300]
type = VarSet
trigger1 = NumTarget(1302)
trigger1 = MoveHit = 1
trigger2 = AnimElem = 12,>= 0
trigger2 = NumTarget(1300)
var(9) = 1
ignorehitpause = 1

[State -2, shake]
type = EnvShake
trigger1 = NumTarget(1302)
trigger1 = MoveHit
time = 10
freq = 60
ampl = 2
ignorehitpause = 1
persistent = 0

[State 1300, targetstate]
type = TargetState
triggerall = NumTarget(1300)
trigger1 = Target,StateType = A
trigger1 = Target,MoveType = H
trigger1 = MoveHit
value = 1320
ID = 1300
ignorehitpause = 1
persistent = 0

[State 1300, targetstate]
type = TargetState
triggerall = NumTarget(1301)
trigger1 = Target,MoveType = H
trigger1 = MoveHit
value = 1320
ID = 1301
ignorehitpause = 1
persistent = 0

[State 1300, targetstate]
type = TargetState
triggerall = NumTarget(1302)
trigger1 = Target,MoveType = H
trigger1 = MoveHit
value = 1320
ID = 1302
ignorehitpause = 1
persistent = 0

[State 1300, posadd]
type = PosAdd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 5
x = 8

[State 1300, statetype]
type = StateTypeSet
trigger1 = AnimElem = 5, = 2
StateType = A
physics = N

[State 1300, 1]
type = VelSet
trigger1 = AnimElem = 6
x = 0
y = -4

[State 1300, 1]
type = VelAdd
trigger1 = AnimElem = 6, > 0
y = .31

[State 1300, 0]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 1301


[Statedef 1301];着地
type = S
physics = N
movetype = I
ctrl = 0
anim = 1301
velset = 0,0
sprpriority = 2

[State 1301, snd]
type = PlaySnd
trigger1 = Time = 0
value = S0,2

[State 1301, pos]
type = PosSet
trigger1 = Time = 0
y = 0

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 1301, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


[Statedef 1320];相手動作
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
value = 5050

[State -2, anim]
type = ChangeAnim2
trigger1 = time = 0
value = 1320

[State -2, end]
type = ChangeState
trigger1 = HitShakeOver
value = 1321

[Statedef 1321]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
value = 5050

[State -2, anim]
type = ChangeAnim2
trigger1 = time = 0
value = 1321+(GetHitVar(animtype)=[4,5])
ignorehitpause = 1

[State 1321, vel]
type = velset
trigger1 = Time = 0
x = GetHitVar(xvel)*Facing
y = GetHitVar(yvel)

[State 1321, gravity]
type = VelAdd
Trigger1 = time > 0
y = GetHitVar(yaccel)

[State 1321, end]
type = SelfState
triggerall = anim = 1321
trigger1 = Pos Y >= -20
trigger1 = Vel Y > 0
value = 5050

[State 1321, end]
type = ChangeAnim
triggerall = anim = 1322
trigger1 = Pos Y >= -20
trigger1 = Vel Y > 0
trigger1 = !(SelfAnimExist(5051) || SelfAnimExist(5052))
value = 5050
persistent = 0

[State 1321, end]
type = ChangeAnim
triggerall = anim = 1322
triggerall = Pos Y >= 0
triggerall = Vel Y > 0
triggerall = SelfAnimExist(5052)
trigger1 = GetHitVar(animtype) = 5
value = 5052
persistent = 0

[State 1321, end]
type = ChangeAnim
triggerall = anim = 1322
triggerall = Pos Y >= 0
triggerall = Vel Y > 0
triggerall = SelfAnimExist(5051)
trigger1 = GetHitVar(animtype) = 4
trigger2 = GetHitVar(animtype) = 5
trigger2 = !SelfAnimExist(5052)
value = 5051
persistent = 0

[State 1321, end]
type = ChangeAnim
triggerall = anim = [5050,5059]
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
trigger1 = SelfAnimExist(anim+10)
value = anim+10
persistent = 0

;[State 1321, recovery]
;type = SelfState
;triggerall = Anim = 1322
;trigger1 = Pos Y >= -20
;trigger1 = Vel Y > 0
;trigger1 = alive
;trigger1 = CanRecover
;trigger1 = Command = "recovery"
;value = 5200

[State 1321, end]
type = SelfState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 5100

;=================================================================
;ジェノサイドカッターB 2002
[Statedef 1350]
type = S
physics = S
movetype = A
ctrl = 0
anim = 1350
sprpriority = 2
poweradd = IfElse(((var(52)&&fvar(29)=1)||fvar(34)=2),0,100)

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State -2. 半数補正]
type = VarSet
trigger1 = Time = 0
var(21) = 0

[State -2. 半数補正]
type = VarAdd
trigger1 = NumTarget(1351)
trigger1 = MoveContact
var(21) = 1
ignorehitpause = 1
persistent = 0

[State -2. 半数補正]
type = VarAdd
trigger1 = NumTarget(1352)
trigger1 = MoveContact
var(21) = 1
ignorehitpause = 1
persistent = 0

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 1350]
type = NotHitBy
trigger1 = AnimElem = 10, < 0
trigger2 = AnimElem = 21, >= 0 && AnimElem = 24, < 0
value = SCA
time = 1

[State 1350, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S2,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),50,70),15)
volume = 150
channel = 0

[State 1350, snd]
type = PlaySnd
trigger1 = fvar(29) = [1,3]
trigger1 = AnimElem = 20
value = S2,51+(fvar(26)=1)*20
volume = 150

[State 1350, snd]
type = PlaySnd
trigger1 = fvar(29) = [4,6]
trigger1 = AnimElem = 23
value = S2,16
volume = 150
channel = 0

[State 1350, explod]
type = Explod
trigger1 = Animelem = 4, = 1
anim = 8201
pos = 0,0
postype = p1
bindtime = -1
sprpriority = 4

[State 1350, snd]
type = PlaySnd
trigger1 = Animelem = 4, = 1
value = S3,2
volume = -50

[State 1350, snd]
type = PlaySnd
trigger1 = Animelem = 9, = 1
value = S3,2
volume = -50

[State 1350, explod]
type = Explod
trigger1 = Animelem = 9, = 1
anim = 8202
pos = 48,0
postype = p1
sprpriority = 4

[State 1350, explod]
type = Explod
trigger1 = Animelem = 21
anim = 8203
pos = 0,0
postype = p1
bindtime = -1
sprpriority = 4

[State 1350, snd]
type = PlaySnd
trigger1 = Animelem = 21
value = S3,2
volume = -50

[State 1300, posadd]
type = PosAdd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 5
x = 8

[State 1300, posadd]
type = PosAdd
trigger1 = AnimElem = 29
trigger2 = AnimElem = 30
x = 10

[State 1350, vel]
type = VelSet
trigger1 = AnimElem = 6
x = 0
y = -8

[State 1350, vel]
type = VelAdd
trigger1 = AnimElem = 6,> 0 && AnimElem = 16, < 1
trigger2 = AnimElem = 25, > 1
y = .32

[State 1350, vel]
type = VelSet
trigger1 = AnimElem = 16, = 1
y = 0

[State 1350, vel]
type = VelSet
trigger1 = AnimElem = 25, = 1
x = -2
y = -4

[State 1350]
type = StateTypeSet
trigger1 = AnimElem = 6
statetype = A
physics = N

[State 1350, hitdef1 2002]
type = HitDef
triggerall = !fvar(26)
triggerall = !var(9)
trigger1 = Animelem = 5, = 1
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Hard
ground.type = Low
priority = 7,hit
damage = Ceil(12*(100-Random%11)*fvar(10)*fvar(37)/10/103),Ceil(1*(100-Random%11)*fvar(10)*fvar(37)/10/103)
pausetime = 11,11
guard.pausetime = 11,9
sparkno = S7253
guard.sparkno = S7262
sparkxy = -20,-61+Ceil(P2BodyDist Y)
hitsound = S5,15
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 0
air.fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 38+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 0,0
guard.velocity = -12
air.velocity = 0,-11
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
;p2facing = 1
forcestand = 1
ID = 1350
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45)
givepower = 15,15

[State 1350, hitdef2]
type = HitDef
triggerall = !fvar(26)
triggerall = !var(9)
trigger1 = AnimElem = 7
attr = A,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Hard
ground.type = Low
priority = 7,hit
damage = Ceil((Ceil(17*0.5**(var(21)))-1)*(100-random%11)*fvar(10)*fvar(37)/10/103),Ceil(1*(100-Random%11)*fvar(10)*fvar(37)/10/103)
pausetime = 11,12
guard.pausetime = 11,9
sparkno = S7253
guard.sparkno = S7262
sparkxy = -20,-61+Ceil(P2BodyDist Y)
hitsound = S5,15
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 38+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 0,-11
guard.velocity = -12
air.velocity = 0,-11
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
;p2facing = 1
ID = 1351
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45)
givepower = 15,15

[State 1350, hitdef3]
type = HitDef
triggerall = !fvar(26)
triggerall = !var(9)
trigger1 = Animelem = 12
attr = A,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Hard
ground.type = Low
priority = 7,hit
damage = Ceil((Ceil(17*0.5**(var(21)))-1)*(100-random%11)*fvar(10)*fvar(37)/10/103),Ceil(1*(100-Random%11)*fvar(10)*fvar(37)/10/103)
pausetime = 11,11
guard.pausetime = 11,9
sparkno = S7253
guard.sparkno = S7262
sparkxy = -20,-61+Ceil(P2BodyDist Y)
hitsound = S5,15
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 36+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = -2,-11
guard.velocity = -12
air.velocity = -2,-11
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
;p2facing = 1
ID = 1352
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45)
givepower = 15,15

[State 1350, hitdef4]
type = HitDef
triggerall = !fvar(26)
triggerall = !var(9)
trigger1 = Animelem = 21
attr = A,SA
hitflag = MAF
guardflag = M
animtype = DiagUp
air.animtype = DiagUp
ground.type = Low
priority = 7,hit
damage = Ceil((Ceil(17*0.5**(var(21)))-1)*(100-random%11)*fvar(10)*fvar(37)/10/103),Ceil(1*(100-Random%11)*fvar(10)*fvar(37)/10/103)
pausetime = 2,2
guard.pausetime = 2,0
sparkno = S7253
guard.sparkno = S7262
sparkxy = -20,-100+Ceil(P2BodyDist Y)
hitsound = S5,15
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 32+2+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = -7,-9
guard.velocity = -12
air.velocity = -7,-9
yaccel = .5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
;p2facing = 1
ID = 1353
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45)
givepower = 15,15


[State 1350, hitdef1 02um]
type = HitDef
triggerall = fvar(26)
triggerall = !var(9)
trigger1 = Animelem = 5, = 1
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Hard
ground.type = Low
priority = 7,hit
damage = 42*fvar(39),Ceil(1*fvar(10)*fvar(37)/12)
pausetime = 11,11
guard.pausetime = 11,9
sparkno = S7253
guard.sparkno = S7262
sparkxy = -20,-61+Ceil(P2BodyDist Y)
hitsound = S5,15
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 0
air.fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 38+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 0,0
guard.velocity = -12
air.velocity = 0,-11
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
;p2facing = 1
forcestand = 1
ID = 1350
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45)
givepower = 15,15

[State 1350, hitdef2]
type = HitDef
triggerall = fvar(26)
triggerall = !var(9)
trigger1 = AnimElem = 7
attr = A,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Hard
ground.type = Low
priority = 7,hit
damage = 34*fvar(39),Ceil(1*fvar(10)*fvar(37)/12)
pausetime = 11,12
guard.pausetime = 11,9
sparkno = S7253
guard.sparkno = S7262
sparkxy = -20,-61+Ceil(P2BodyDist Y)
hitsound = S5,15
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 38+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 0,-11
guard.velocity = -12
air.velocity = 0,-11
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
;p2facing = 1
ID = 1351
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45)
givepower = 15,15

[State 1350, hitdef3]
type = HitDef
triggerall = fvar(26)
triggerall = !var(9)
trigger1 = Animelem = 12
attr = A,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Hard
ground.type = Low
priority = 7,hit
damage = 17*fvar(39),Ceil(1*fvar(10)*fvar(37)/12)
pausetime = 11,11
guard.pausetime = 11,9
sparkno = S7253
guard.sparkno = S7262
sparkxy = -20,-61+Ceil(P2BodyDist Y)
hitsound = S5,15
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 36+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = -2,-11
guard.velocity = -12
air.velocity = -2,-11
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
;p2facing = 1
ID = 1352
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45)
givepower = 15,15

[State 1350, hitdef4]
type = HitDef
triggerall = fvar(26)
triggerall = !var(9)
trigger1 = Animelem = 21
attr = A,SA
hitflag = MAF
guardflag = M
animtype = DiagUp
air.animtype = DiagUp
ground.type = Low
priority = 7,hit
damage = 10*fvar(39),Ceil(1*fvar(10)*fvar(37)/12)
pausetime = 2,2
guard.pausetime = 2,0
sparkno = S7253
guard.sparkno = S7262
sparkxy = -20,-100+Ceil(P2BodyDist Y)
hitsound = S5,15
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 32+2+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = -7,-9
guard.velocity = -12
air.velocity = -7,-9
yaccel = .5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
;p2facing = 1
ID = 1353
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45)
givepower = 15,15

[State 1300, targetstate]
type = TargetState
triggerall = NumTarget(1350)
trigger1 = Target,StateType = A
trigger1 = Target,MoveType = H
trigger1 = MoveHit
value = 1320
ID = 1350
ignorehitpause = 1
persistent = 0

[State 1300, targetstate]
type = TargetState
triggerall = NumTarget(1351)
trigger1 = Target,MoveType = H
trigger1 = MoveHit
value = 1320
ID = 1351
ignorehitpause = 1
persistent = 0

[State 1300, targetstate]
type = TargetState
triggerall = NumTarget(1352)
trigger1 = Target,MoveType = H
trigger1 = MoveHit
value = 1320
ID = 1352
ignorehitpause = 1
persistent = 0

[State 1300, 0]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 1351


[Statedef 1351];着地
type = S
physics = N
movetype = I
ctrl = 0
anim = 1351
velset = 0,0
sprpriority = 2

[State 1351, snd]
type = PlaySnd
trigger1 = Time = 0
value = S0,2

[State 1351, pos]
type = PosSet
trigger1 = Time = 0
y = 0

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 1351, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1





;=================================================================
;ジェノサイドカッターA 98UM
[Statedef 1305]
type = S
physics = S
movetype = A
ctrl = 0
anim = 1305
sprpriority = 2
poweradd = IfElse(((var(52)&&fvar(29)=1)||fvar(34)=2),0,157)

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State -2. 半数補正]
type = VarSet
trigger1 = Time = 0
var(21) = 0

[State -2. 半数補正]
type = VarAdd
trigger1 = NumTarget(1306)
trigger1 = MoveContact
var(21) = 1
ignorehitpause = 1
persistent = 0

[State -2. 半数補正]
type = VarAdd
trigger1 = NumTarget(1307)
trigger1 = MoveContact
var(21) = 1
ignorehitpause = 1
persistent = 0

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 1300]
type = NotHitBy
trigger1 = AnimElem = 6, < 0
value = SCA
time = 1

[State 1300, snd]
type = PlaySnd
trigger1 = Time = 0
value = S2,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),50,70),15)
volume = 150
channel = 0

[State 1300, varreset]
type = VarSet
triggerall = fvar(29) = [4,6]
trigger1 = Time = 0
var(24) = 1

[State 1300, explod]
type = Explod
trigger1 = Animelem = 4, = 1
anim = 8201
pos = 0,0
postype = p1
bindtime = -1
sprpriority = 4

[State 1300, snd]
type = PlaySnd
trigger1 = Animelem = 4, = 1
value = S3,2
volume = -50

[State 1300, explod]
type = Explod
trigger1 = Animelem = 9, = 1
anim = 8202
pos = 48,0
postype = p1
sprpriority = 4

[State 1300, statetype]
type = StateTypeSet
trigger1 = AnimElem = 5, = 2
StateType = A
physics = N
ignorehitpause = 1

[State 1305, hitdef1 98UM]
type = HitDef
triggerall = !var(9)
trigger1 = Animelem = 5, = 1
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Hard
ground.type = Low
priority = 7,hit
damage = Ceil(9*100*fvar(10)*fvar(37)/10/119),Ceil(1*100*fvar(10)*fvar(37)/10/119)
pausetime = 11,11
guard.pausetime = 11,9
sparkno = S7203
guard.sparkno = S7212
sparkxy = -20,-61+Ceil(P2BodyDist Y)
hitsound = S5,15
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 39+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 0,-11.5
guard.velocity = -12
air.velocity = 0,-11.5
airguard.velocity = 0,-6
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
;p2facing = 1
ID = 1305
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,94),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,94)
givepower = 15,15

[State 1305, hitdef2]
type = HitDef
triggerall = !var(9)
trigger1 = AnimElem = 6
attr = S,SA
hitflag = MAF
guardflag = MA
animtype = Hard
air.animtype = Hard
ground.type = Low
priority = 7,hit
damage = Ceil(9*100*fvar(10)*fvar(37)/10/119),Ceil(1*100*fvar(10)*fvar(37)/10/119)
pausetime = 11,11
guard.pausetime = 11,9
sparkno = S7203
guard.sparkno = S7212
sparkxy = -20,-65+Ceil(P2BodyDist Y)
hitsound = S5,15
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 38+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 0,-11.5
guard.velocity = -12
air.velocity = 0,-11.5
airguard.velocity = 0,-6
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
;p2facing = 1
ID = 1306
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,94),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,94)
givepower = 15,15

[State 1305, hitdef3]
type = HitDef
triggerall = !var(9)
trigger1 = AnimElem = 12
attr = S,SA
hitflag = MAF
guardflag = MA
animtype = Hard
air.animtype = Hard
ground.type = Low
priority = 7,hit
damage = Ceil(9*100*fvar(10)*fvar(37)/10/119),Ceil(1*100*fvar(10)*fvar(37)/10/119)
pausetime = 17,17
guard.pausetime = 17,15
sparkno = S7203
guard.sparkno = S7212
sparkxy = -20,-70+Ceil(P2BodyDist Y)
hitsound = S5,15
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 38+17+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = -2,-11.5
guard.velocity = -12
air.velocity = -2,-11.5
airguard.velocity = -2,-6
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
;p2facing = 1
ID = 1307
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,94),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,94)
givepower = 15,15

[State 1305, hitdef4]
type = HitDef
triggerall = !var(9)
trigger1 = AnimElem = 7
trigger1 = HitCount = 1 || (P2StateType = A && MoveGuarded)
attr = S,SA
hitflag = MAF
guardflag = MA
animtype = Hard
air.animtype = Hard
ground.type = Low
priority = 7,hit
damage = Ceil((Ceil(10*0.5**(var(21)))-1)*100*fvar(10)*fvar(37)/10/119),Ceil(1*100*fvar(10)*fvar(37)/10/119)
pausetime = 11,11
guard.pausetime = 11,9
sparkno = S7203
guard.sparkno = S7212
sparkxy = -20,-65+Ceil(P2BodyDist Y)
hitsound = S5,15
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 38+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 0,-11.5
guard.velocity = -12
air.velocity = 0,-11.5
airguard.velocity = 0,-6
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
;p2facing = 1
ID = 1308
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,94),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,94)
givepower = 15,15

[State 1305, hitdef5]
type = HitDef
triggerall = !var(9)
trigger1 = AnimElem = 14
trigger1 = HitCount = 1 || (P2StateType = A && MoveGuarded)
attr = S,SA
hitflag = MAF
guardflag = MA
animtype = Hard
air.animtype = Hard
ground.type = Low
priority = 7,hit
damage = Ceil((Ceil(10*0.5**(var(21)))-1)*100*fvar(10)*fvar(37)/10/119),Ceil(1*100*fvar(10)*fvar(37)/10/119)
pausetime = 17,17
guard.pausetime = 17,15
sparkno = S7203
guard.sparkno = S7212
sparkxy = -20,-70+Ceil(P2BodyDist Y)
hitsound = S5,15
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 38+17+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = -2,-11.5
guard.velocity = -12
air.velocity = -2,-11.5
airguard.velocity = -2,-6
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
;p2facing = 1
ID = 1309
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,94),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,94)
givepower = 15,15

[State 1300]
type = VarSet
trigger1 = NumTarget(1307)
trigger1 = MoveHit = 1
var(9) = 1
ignorehitpause = 1

[State -2, shake]
type = EnvShake
trigger1 = NumTarget(1307)
trigger1 = MoveHit
time = 10
freq = 60
ampl = 2
ignorehitpause = 1
persistent = 0

[State 1300, targetstate]
type = TargetState
triggerall = NumTarget(1305)
trigger1 = Target,MoveType = H
trigger1 = MoveHit
value = 1320
ID = 1305
ignorehitpause = 1
persistent = 0

[State 1300, targetstate]
type = TargetState
triggerall = NumTarget(1306)
trigger1 = Target,MoveType = H
trigger1 = MoveHit
value = 1320
ID = 1306
ignorehitpause = 1
persistent = 0

[State 1300, targetstate]
type = TargetState
triggerall = NumTarget(1307)
trigger1 = Target,MoveType = H
trigger1 = MoveHit
value = 1320
ID = 1307
ignorehitpause = 1
persistent = 0

[State 1300, targetstate]
type = TargetState
triggerall = NumTarget(1308)
trigger1 = Target,MoveType = H
trigger1 = MoveHit
value = 1320
ID = 1308
ignorehitpause = 1
persistent = 0

[State 1300, targetstate]
type = TargetState
triggerall = NumTarget(1309)
trigger1 = Target,MoveType = H
trigger1 = MoveHit
value = 1320
ID = 1309
ignorehitpause = 1
persistent = 0

[State 1300, posadd]
type = PosAdd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 5
trigger3 = AnimElem = 5, = 1
x = 8

[State 1300, 1]
type = VelSet
trigger1 = AnimElem = 6
x = 0
y = -4

[State 1300, 1]
type = VelAdd
trigger1 = AnimElem = 6, > 0
y = .31

[State 1300, end]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 1306


[Statedef 1306];着地
type = S
physics = N
movetype = I
ctrl = 0
anim = 1306
velset = 0,0
sprpriority = 2

[State 1301, snd]
type = PlaySnd
trigger1 = Time = 0
value = S0,2

[State 1306, pos]
type = PosSet
trigger1 = Time = 0
y = 0

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 1306, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;=================================================================
;ジェノサイドカッターB 98UM
[Statedef 1355]
type = S
physics = S
movetype = A
ctrl = 0
anim = 1355
sprpriority = 2
poweradd = IfElse(((var(52)&&fvar(29)=1)||fvar(34)=2),0,157)

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State -2. 半数補正]
type = VarSet
trigger1 = Time = 0
var(21) = 0

[State -2. 半数補正]
type = VarAdd
trigger1 = NumTarget(1356)
trigger1 = MoveContact
var(21) = 1
ignorehitpause = 1
persistent = 0

[State -2. 半数補正]
type = VarAdd
trigger1 = NumTarget(1357)
trigger1 = MoveContact
var(21) = 1
ignorehitpause = 1
persistent = 0

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 1355]
type = NotHitBy
trigger1 = AnimElem = 6, < 0
value = SCA
time = 1

[State 1355, snd]
type = PlaySnd
trigger1 = Time = 0
value = S2,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),50,70),15)
volume = 150
channel = 0

[State 1355, varset]
type = VarSet
triggerall = fvar(29) = [4,6]
trigger1 = Time = 0
var(24) = 1

[State 1355, explod]
type = Explod
trigger1 = Animelem = 4, = 1
anim = 8201
pos = 0,0
postype = p1
bindtime = -1
sprpriority = 4

[State 1355, snd]
type = PlaySnd
trigger1 = Animelem = 4, = 1
value = S3,2
volume = -50

[State 1355, explod]
type = Explod
trigger1 = Animelem = 9, = 1
anim = 8202
pos = 48,0
postype = p1
sprpriority = 4

[State 1355, statetype]
type = StateTypeSet
trigger1 = AnimElem = 5, = 2
StateType = A
physics = N
ignorehitpause = 1

[State 1355, hitdef1 98UM]
type = HitDef
triggerall = !var(9)
trigger1 = Animelem = 5, = 1
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Hard
ground.type = Low
priority = 7,hit
damage = Ceil(10*100*fvar(10)*fvar(37)/10/119),Ceil(1*100*fvar(10)*fvar(37)/10/119)
pausetime = 11,11
guard.pausetime = 11,9
sparkno = S7203
guard.sparkno = S7212
sparkxy = -20,-61+Ceil(P2BodyDist Y)
hitsound = S5,15
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 0
air.fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 38+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 0,-11.5
guard.velocity = -12
air.velocity = 0,-11.5
airguard.velocity = 0,-6
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
;p2facing = 1
ID = 1355
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,94),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,94)
givepower = 15,15

[State 1305, hitdef2]
type = HitDef
triggerall = !var(9)
trigger1 = AnimElem = 6
attr = S,SA
hitflag = MAF
guardflag = MA
animtype = Hard
air.animtype = Hard
ground.type = Low
priority = 7,hit
damage = Ceil(10*100*fvar(10)*fvar(37)/10/119),Ceil(1*100*fvar(10)*fvar(37)/10/119)
pausetime = 11,11
guard.pausetime = 11,9
sparkno = S7203
guard.sparkno = S7212
sparkxy = -20,-65+Ceil(P2BodyDist Y)
hitsound = S5,15
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 38+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 0,-11.5
guard.velocity = -12
air.velocity = 0,-11.5
airguard.velocity = 0,-6
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
;p2facing = 1
ID = 1356
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,94),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,94)
givepower = 15,15

[State 1355, hitdef3]
type = HitDef
triggerall = !var(9)
trigger1 = AnimElem = 12
attr = S,SA
hitflag = MAF
guardflag = MA
animtype = Hard
air.animtype = Hard
ground.type = Low
priority = 7,hit
damage = Ceil(10*100*fvar(10)*fvar(37)/10/119),Ceil(1*100*fvar(10)*fvar(37)/10/119)
pausetime = 17,17
guard.pausetime = 17,15
sparkno = S7203
guard.sparkno = S7212
sparkxy = -20,-70+Ceil(P2BodyDist Y)
hitsound = S5,15
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 37+17+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = -2,-11.5
guard.velocity = -12
air.velocity = -2,-11.5
airguard.velocity = -2,-6
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
;p2facing = 1
ID = 1357
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,94),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,94)
givepower = 15,15

[State 1305, hitdef4]
type = HitDef
triggerall = !var(9)
trigger1 = AnimElem = 7
trigger1 = HitCount = 1 || (P2StateType = A && MoveGuarded)
attr = S,SA
hitflag = MAF
guardflag = MA
animtype = Hard
air.animtype = Hard
ground.type = Low
priority = 7,hit
damage = Ceil((Ceil(11*0.5**(var(21)))-1)*100*fvar(10)*fvar(37)/10/119),Ceil(1*100*fvar(10)*fvar(37)/10/119)
pausetime = 11,11
guard.pausetime = 11,9
sparkno = S7203
guard.sparkno = S7212
sparkxy = -20,-65+Ceil(P2BodyDist Y)
hitsound = S5,15
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 38+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 0,-11.5
guard.velocity = -12
air.velocity = 0,-11.5
airguard.velocity = 0,-6
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
;p2facing = 1
ID = 1358
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,94),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,94)
givepower = 15,15

[State 1355, hitdef5]
type = HitDef
triggerall = !var(9)
trigger1 = AnimElem = 14
trigger1 = HitCount = 1 || (P2StateType = A && MoveGuarded)
attr = S,SA
hitflag = MAF
guardflag = MA
animtype = Hard
air.animtype = Hard
ground.type = Low
priority = 7,hit
damage = Ceil((Ceil(11*0.5**(var(21)))-1)*100*fvar(10)*fvar(37)/10/119),Ceil(1*100*fvar(10)*fvar(37)/10/119)
pausetime = 17,17
guard.pausetime = 17,15
sparkno = S7203
guard.sparkno = S7212
sparkxy = -20,-70+Ceil(P2BodyDist Y)
hitsound = S5,15
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 37+17+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = -2,-11.5
guard.velocity = -12
air.velocity = -2,-11.5
airguard.velocity = -2,-6
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
;p2facing = 1
ID = 1359
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,94),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,94)
givepower = 15,15

[State 1355]
type = VarSet
trigger1 = NumTarget(1357)
trigger1 = MoveHit = 1
var(9) = 1
ignorehitpause = 1

[State 1355]
type = VarSet
trigger1 = NumTarget(1359)
trigger1 = MoveHit = 1
var(9) = 1
ignorehitpause = 1

[State -2, shake]
type = EnvShake
trigger1 = NumTarget(1357)
trigger1 = MoveHit
time = 10
freq = 60
ampl = 2
ignorehitpause = 1
persistent = 0

[State 1300, targetstate]
type = TargetState
triggerall = NumTarget(1355)
trigger1 = Target,MoveType = H
trigger1 = MoveHit
value = 1320
ID = 1355
ignorehitpause = 1
persistent = 0

[State 1300, targetstate]
type = TargetState
triggerall = NumTarget(1356)
trigger1 = Target,MoveType = H
trigger1 = MoveHit
value = 1320
ID = 1356
ignorehitpause = 1
persistent = 0

[State 1300, targetstate]
type = TargetState
triggerall = NumTarget(1357)
trigger1 = Target,MoveType = H
trigger1 = MoveHit
value = 1320
ID = 1357
ignorehitpause = 1
persistent = 0

[State 1300, targetstate]
type = TargetState
triggerall = NumTarget(1358)
trigger1 = Target,MoveType = H
trigger1 = MoveHit
value = 1320
ID = 1358
ignorehitpause = 1
persistent = 0

[State 1300, targetstate]
type = TargetState
triggerall = NumTarget(1359)
trigger1 = Target,MoveType = H
trigger1 = MoveHit
value = 1320
ID = 1359
ignorehitpause = 1
persistent = 0

[State 1355, posadd]
type = PosAdd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 5
trigger3 = AnimElem = 5, = 1
x = 8

[State 1355, 1]
type = VelSet
trigger1 = AnimElem = 6
x = 0
y = -7

[State 1355, 1]
type = VelAdd
trigger1 = AnimElem = 6, > 0
y = .32

[State 1355, end]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 1356

[Statedef 1356];着地
type = S
physics = N
movetype = I
ctrl = 0
anim = 1356
velset = 0,0
sprpriority = 2

[State 1356, snd]
type = PlaySnd
trigger1 = Time = 0
value = S0,2

[State 1356, pos]
type = PosSet
trigger1 = Time = 0
y = 0

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 1356, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;=================================================================
;ビースデストラクションA
[Statedef 1400]
type = S
physics = S
movetype = A
ctrl = 0
anim = 1400
sprpriority = 2
poweradd = IfElse(((var(52)&&fvar(29)=1)||fvar(34)=2),0,120)

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State -2. 半数補正]
type = VarSet
trigger1 = Time = 0
var(21) = 0

[State -2. 半数補正]
type = VarAdd
trigger1 = NumTarget(1401)
trigger1 = MoveContact
var(21) = 1
ignorehitpause = 1
persistent = 0

[State 1400, width]
type = Width
trigger1 = 1
edge = 20,0

[State -2];どこキャン時点滅
type = PalFX
triggerall = var(46)
triggerall = Time < 9
trigger1 = Time%2 = 0
time = 1
add = 255,255,255
mul = 255,255,255
ignorehitpause = 1

[State -2];タイマー消費
type = varadd
triggerall = var(52)
trigger1 = Time = 0
trigger1 = var(46)
var(52) = -150
persistent = 0


[State 1400, hitby]
type = HitBy
triggerall = !(fvar(29) = 3 || fvar(29) = 6)
trigger1 = AnimElem = 6, >= 0 && AnimElem = 7, < 0
value = SCA,AT
time = 1

[State 1400, hitby]
type = HitBy
triggerall = (fvar(29) = 3 || fvar(29) = 6)
trigger1 = AnimElem = 7, < 0
value = SCA,AT
time = 1

[State 1400, NotHitBy]
type = NotHitBy
trigger1 = fvar(26) = 1
trigger1 = time < 6
value = SCA

[State 1400, velset]
type = VelSet
trigger1 = AnimElem = 6, >= 0 && AnimElem = 7, < 1
x = 15

[State 1400, velset]
type = VelSet
trigger1 = AnimElem = 7, = 1
x = 0

[State 1400, posadd]
type = PosAdd
trigger1 = AnimElem = 19
trigger2 = AnimElem = 22
x = 8

[State 1400, snd]
type = PlaySnd
trigger1 = time = 0
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),50,70),0)
volume = 150

[State 1400, snd]
type = PlaySnd
trigger1 = AnimElem = 16 
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),51,71),1)
volume = 150

[State 1400, explod]
type = Explod
trigger1 = AnimElem = 6
anim = 8204
pos = 8,0
postype = p1
sprpriority = 4
ownpal = 1

[State 1400, explod]
type = Explod
trigger1 = AnimElem = 13
anim = 8205
pos = 56,-16
postype = p1
bindtime = -1
sprpriority = 4
ownpal = 1

[State 1400, explod]
type = Explod
trigger1 = AnimElem = 18
anim = 8206
pos = 88,0
postype = p1
sprpriority = 4
ownpal = 1

[State 1400, hitdef1]
type = HitDef
triggerall = !fvar(26)
triggerall = Animelem = 6
trigger1 = !var(9)
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = High
priority = 7,hit
damage = Ceil(3*(100-Random%11)*fvar(10)*fvar(37)/10/103),Ceil(1*(100-Random%11)*fvar(10)*fvar(37)/10/103)
pausetime = 0,0
guard.pausetime = 0,0
sparkxy = -10,-100
sparkno = S7255
guard.sparkno = S7262
hitsound = S5,9
guardsound = S6,1
ground.hittime = 21
guard.slidetime = 21
guard.ctrltime = 21
air.hittime = 60
air.fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 24+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 0,0
air.velocity = -5,-7
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ID = 1400
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,30),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,30)
givepower = 15,15

[State 1400, hitdef2]
type = HitDef
triggerall = !fvar(26)
triggerall = Animelem = 13
trigger1 = !var(9)
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = High
priority = 7,hit
damage = Ceil((Ceil(16*0.5**(var(21)))-1)*(100-random%11)*fvar(10)*fvar(37)/10/103),Ceil(1*(100-Random%11)*fvar(10)*fvar(37)/10/103)
pausetime = 0,0
guard.pausetime = 0,0
sparkno = S7255
guard.sparkno = S7262
hitsound = S5,9
guardsound = S6,1
sparkxy = -10,-50
ground.hittime = 21
guard.slidetime = 21
guard.ctrltime = 21
air.hittime = 60
air.fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 24+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 0,0
guard.velocity = 0
air.velocity = -5,-7
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ID = 1401
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,30),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,30)
givepower = 15,15

[State 1400, hitdef3]
type = HitDef
triggerall = !fvar(26)
triggerall = Animelem = 18
trigger1 = !var(9)
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Hard
ground.type = Low
priority = 7,hit
damage = Ceil((Ceil(16*0.5**(var(21)))-1)*(100-random%11)*fvar(10)*fvar(37)/10/103),Ceil(1*(100-Random%11)*fvar(10)*fvar(37)/10/103)
pausetime = 11,11
guard.pausetime = 11,11
sparkxy = -10,-100
sparkno = S7255
guard.sparkno = S7262
hitsound = S5,9
guardsound = S6,1
ground.hittime = 21
guard.slidetime = 21
guard.ctrltime = 21
air.hittime = 60
ground.velocity = 0,-11
air.velocity = 0,-11
yaccel = .55
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 38+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ID = 1402
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,30),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,30)
givepower = 15,15


[State 1400, hitdef1 02um]
type = HitDef
triggerall = fvar(26)
triggerall = Animelem = 6
trigger1 = !var(9)
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = High
priority = 7,hit
damage = 20*fvar(39),5
pausetime = 0,0
guard.pausetime = 0,0
sparkxy = -10,-100
sparkno = S7255
guard.sparkno = S7262
hitsound = S5,9
guardsound = S6,1
ground.hittime = 21
guard.slidetime = 21
guard.ctrltime = 21
air.hittime = 60
air.fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 24+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 0,0
air.velocity = -5,-7
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ID = 1400
kill = 1
getpower = 40,40
givepower = 15,15

[State 1400, hitdef2]
type = HitDef
triggerall = fvar(26)
triggerall = Animelem = 13
trigger1 = !var(9)
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = High
priority = 7,hit
damage = 20*fvar(39),5
pausetime = 0,0
guard.pausetime = 0,0
sparkno = S7255
guard.sparkno = S7262
hitsound = S5,9
guardsound = S6,1
sparkxy = -10,-50
ground.hittime = 21
guard.slidetime = 21
guard.ctrltime = 21
air.hittime = 60
air.fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 24+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 0,0
guard.velocity = 0
air.velocity = -5,-7
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ID = 1401
kill = 1
getpower = 40,40
givepower = 15,15

[State 1400, hitdef3]
type = HitDef
triggerall = fvar(26)
triggerall = Animelem = 18
trigger1 = !var(9)
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Hard
ground.type = Low
priority = 7,hit
damage = 20*fvar(39),5
pausetime = 11,11
guard.pausetime = 11,11
sparkxy = -10,-100
sparkno = S7255
guard.sparkno = S7262
hitsound = S5,9
guardsound = S6,1
ground.hittime = 21
guard.slidetime = 21
guard.ctrltime = 21
air.hittime = 60
ground.velocity = 0,-11
air.velocity = 0,-11
yaccel = .55
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 38+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ID = 1402
kill = 1
getpower = 40,40
givepower = 15,15

[State 1400, hit]
type = TargetState
trigger1 = NumTarget(1402)
trigger1 = Target,MoveType = H
trigger1 = MoveHit
value = 1320
ID = 1402
ignorehitpause = 1
persistent = 0

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 1400 end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1




;=================================================================
;ビースデストラクションB
[Statedef 1450]
type = S
physics = S
movetype = A
ctrl = 0
anim = 1450
sprpriority = 2
poweradd = IfElse(((var(52)&&fvar(29)=1)||fvar(34)=2),0,120)

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State -2. 半数補正]
type = VarSet
trigger1 = Time = 0
var(21) = 0

[State -2. 半数補正]
type = VarAdd
trigger1 = NumTarget(1451)
trigger1 = MoveContact
var(21) = 1
ignorehitpause = 1
persistent = 0

[State -2. 半数補正]
type = VarAdd
trigger1 = NumTarget(1452)
trigger1 = MoveContact
var(21) = 1
ignorehitpause = 1
persistent = 0

[State 1450, width]
type = Width
trigger1 = 1
edge = 20,0

[State -2];どこキャン時点滅
type = PalFX
triggerall = var(46)
triggerall = Time < 9
trigger1 = Time%2 = 0
time = 1
add = 255,255,255
mul = 255,255,255
ignorehitpause = 1

[State -2];タイマー消費
type = varadd
triggerall = var(52)
trigger1 = Time = 0
trigger1 = var(46)
var(52) = -150
persistent = 0

[State 1400, hitby]
type = HitBy
triggerall = !(fvar(29) = 3 || fvar(29) = 6)
trigger1 = AnimElem = 6, >= 0 && AnimElem = 7, < 0
value = SCA,AT
time = 1

[State 1400, hitby]
type = HitBy
triggerall = (fvar(29) = 3 || fvar(29) = 6)
trigger1 = AnimElem = 7, < 0
value = SCA,AT
time = 1

[State 1400, NotHitBy]
type = NotHitBy
trigger1 = fvar(26) = 1
trigger1 = time < 6
value = SCA

[State 1450, velset]
type = VelSet
trigger1 = AnimElem = 6, >= 0 && AnimElem = 7, < 1
x = 15*(1+(fvar(29)=3||fvar(29)=6)*0.5)

[State 1450, velset]
type = VelSet
trigger1 = AnimElem = 7, = 1
x = 0

[State 1450, posadd]
type = PosAdd
trigger1 = AnimElem = 19
trigger2 = AnimElem = 20
trigger3 = AnimElem = 21
x = 15

[State 1450, posadd]
type = PosAdd
trigger1 = AnimElem = 22
x = 11

[State 1450, snd]
type = PlaySnd
trigger1 = time = 0
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),50,70),0)
volume = 150

[State 1450, snd]
type = PlaySnd
trigger1 = AnimElem = 16 
value = S1,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),51,71),1)
volume = 150

[State 1450, snd]
type = PlaySnd
trigger1 = AnimElem = 20
value = S2,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),55,75),26)
volume = 150
channel = 0

[State 1450, snd]
type = PlaySnd
triggerall = !fvar(26)
trigger1 = AnimElem = 29
value = S3,2

[State 1400, explod]
type = Explod
trigger1 = AnimElem = 6
anim = 8204
pos = 8,0
postype = p1
sprpriority = 4
ownpal = 1

[State 1400, explod]
type = Explod
trigger1 = AnimElem = 13
anim = 8205
pos = 56,-16
postype = p1
bindtime = -1
sprpriority = 4
ownpal = 1

[State 1400, explod]
type = Explod
trigger1 = AnimElem = 18
anim = 8206
pos = 88,0
postype = p1
sprpriority = 4
ownpal = 1

[State 1400, explod]
type = Explod
trigger1 = AnimElem = 29
anim = 8205
pos = 40,0
postype = p1
sprpriority = 4
ownpal = 1

[State 1450, hitdef1]
type = HitDef
triggerall = !fvar(26)
triggerall = Animelem = 6
trigger1 = !var(9)
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = High
priority = 7,hit
damage = Ceil(3*(100-Random%11)*fvar(10)*fvar(37)/10/103),Ceil(1*(100-Random%11)*fvar(10)*fvar(37)/10/103)
pausetime = 0,0
guard.pausetime = 0,0
sparkxy = -10,-100
sparkno = S7255
guard.sparkno = S7262
hitsound = S5,9
guardsound = S6,1
ground.hittime = 21
guard.slidetime = 21
guard.ctrltime = 21
air.hittime = 60
air.fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 24+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 0,0
air.velocity = -5,-7
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ID = 1450
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,30),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,30)
givepower = 15,15

[State 1450, hitdef2]
type = HitDef
triggerall = !fvar(26)
triggerall = Animelem = 13
trigger1 = !var(9)
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = High
priority = 7,hit
damage = Ceil((Ceil(12*0.5**(var(21)))-1)*(100-random%11)*fvar(10)*fvar(37)/10/103),Ceil(1*(100-Random%11)*fvar(10)*fvar(37)/10/103)
pausetime = 0,0
guard.pausetime = 0,0
sparkno = S7255
guard.sparkno = S7262
hitsound = S5,9
guardsound = S6,1
sparkxy = -10,-50
ground.hittime = 21
guard.slidetime = 21
guard.ctrltime = 21
air.hittime = 60
air.fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 24+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 0,0
guard.velocity = 0
air.velocity = -5,-7
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ID = 1451
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,30),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,30)
givepower = 15,15

[State 1450, hitdef3]
type = HitDef
triggerall = !fvar(26)
triggerall = Animelem = 18
trigger1 = !var(9)
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Hard
ground.type = Low
priority = 7,hit
damage = Ceil((Ceil(12*0.5**(var(21)))-1)*(100-random%11)*fvar(10)*fvar(37)/10/103),Ceil(1*(100-Random%11)*fvar(10)*fvar(37)/10/103)
pausetime = 11,11
guard.pausetime = 11,11+(fvar(29)=3||fvar(29)=6)*19
sparkxy = -10,-100
sparkno = S7255
guard.sparkno = S7262
hitsound = S5,9
guardsound = S6,1
ground.hittime = 21
guard.slidetime = 21
guard.ctrltime = 21
air.hittime = 60
ground.velocity = 0,-11
air.velocity = 0,-11
yaccel = .55
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 38+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ID = 1452
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,30),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,30)
givepower = 15,15

[State 1450, hitdef4]
type = HitDef
triggerall = !fvar(26)
triggerall = Animelem = 30
trigger1 = !var(9)
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = High
priority = 7,hit
damage = Ceil((Ceil(12*0.5**(var(21)))-1)*(100-random%11)*fvar(10)*fvar(37)/10/103),Ceil(1*(100-Random%11)*fvar(10)*fvar(37)/10/103)
pausetime = (fvar(29)!=1)*11,(fvar(29)!=1)*11
guard.pausetime = 11,9
sparkno = S7253
guard.sparkno = S7262
sparkxy = -10,Ceil(P2BodyDist Y - 50)
hitsound = S5,9
guardsound = S6,1
ground.hittime = 15
ground.slidetime = 15
guard.ctrltime = 15
air.hittime = 60
air.fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = -10.35
air.velocity = -4,-7.5
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ID = 1453
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,30),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,30)
givepower = 15,15
p2facing = 1


[State 1450, hitdef1 02um]
type = HitDef
triggerall = fvar(26)
triggerall = Animelem = 6
trigger1 = !var(9)
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = High
priority = 7,hit
damage = 20*fvar(39),5
pausetime = 0,0
guard.pausetime = 0,0
sparkxy = -10,-100
sparkno = S7255
guard.sparkno = S7262
hitsound = S5,9
guardsound = S6,1
ground.hittime = 21
guard.slidetime = 21
guard.ctrltime = 21
air.hittime = 60
air.fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 24+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 0,0
air.velocity = -5,-7
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ID = 1450
kill = 1
getpower = 40,40
givepower = 15,15

[State 1450, hitdef2]
type = HitDef
triggerall = fvar(26)
triggerall = Animelem = 13
trigger1 = !var(9)
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = High
priority = 7,hit
damage = 20*fvar(39),5
pausetime = 0,0
guard.pausetime = 0,0
sparkno = S7255
guard.sparkno = S7262
hitsound = S5,9
guardsound = S6,1
sparkxy = -10,-50
ground.hittime = 21
guard.slidetime = 21
guard.ctrltime = 21
air.hittime = 60
air.fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 24+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 0,0
guard.velocity = 0
air.velocity = -5,-7
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ID = 1451
kill = 1
getpower = 40,40
givepower = 15,15

[State 1450, hitdef3]
type = HitDef
triggerall = fvar(26)
triggerall = Animelem = 18
trigger1 = !var(9)
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Hard
ground.type = Low
priority = 7,hit
damage = 20*fvar(39),5
pausetime = 11,11
guard.pausetime = 11,11+(fvar(29)=3||fvar(29)=6)*19
sparkxy = -10,-100
sparkno = S7255
guard.sparkno = S7262
hitsound = S5,9
guardsound = S6,1
ground.hittime = 21
guard.slidetime = 21
guard.ctrltime = 21
air.hittime = 60
ground.velocity = 0,-11
air.velocity = 0,-11
yaccel = .55
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 38+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ID = 1452
kill = 1
getpower = 40,40
givepower = 15,15

[State 1450, hitdef4]
type = HitDef
triggerall = fvar(26)
triggerall = Animelem = 30
trigger1 = !var(9)
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = High
priority = 7,hit
damage = 10*fvar(39),5
pausetime = (fvar(29)!=1)*11,(fvar(29)!=1)*11
guard.pausetime = 11,9
sparkno = S7253
guard.sparkno = S7262
sparkxy = -10,Ceil(P2BodyDist Y - 50)
hitsound = S5,9
guardsound = S6,1
ground.hittime = 15
ground.slidetime = 15
guard.ctrltime = 15
air.hittime = 60
air.fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = -10.35
air.velocity = -4,-7.5
yaccel = .55
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ID = 1453
kill = 1
getpower = 40,40
givepower = 15,15
p2facing = 1

[State 1450, hit]
type = TargetState
trigger1 = NumTarget(1452)
trigger1 = Target,MoveType = H
trigger1 = MoveHit
value = 1320
ID = 1452
ignorehitpause = 1
persistent = 0

[State 1450, hit]
type = TargetState
triggerall = !(fvar(29) = 1 && !fvar(26))
trigger1 = NumTarget(1453)
trigger1 = Target,MoveType = H
trigger1 = MoveHit
value = 1470
ID = 1453
ignorehitpause = 1
persistent = 0


[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 1450 end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


[Statedef 1470]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0

[State -2]
type = ScreenBound
trigger1 = Time > 20
value = 1
movecamera = 0,1

[State 1470]
type = ChangeAnim2
trigger1 = Time = 0
value = 1470

[State 1470]
type = VelSet
trigger1 = Time = 10
x = -15
y = -3.5
persistent = 0

[State 1470]
type = VelAdd
trigger1 = Time > 10
y = .2

[State 1470]
type = ChangeState
trigger1 = BackEdgeBodyDist <= 20
value = 1471


[Statedef 1471]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 1471]
type = Turn
trigger1 = Time = 0

[State 1471]
type = ChangeAnim2
trigger1 = Time = 0
value = 1471

[State 1471]
type = VelSet
trigger1 = Time = 2
x = -2.5
y = -10.5

[State 1471]
type = VelAdd
trigger1 = Time > 2
y = .55

[State 1471, end]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100



;======================================================================================
;ダークバリヤーA
[Statedef 1500]
type = S
physics = S
movetype = A
ctrl = 0
anim = 1500+!(fvar(29)=1||fvar(29)=4)*10
sprpriority = 2
poweradd = IfElse(((var(52)&&fvar(29)=1)||fvar(34)=2),0,IfElse(fvar(29)=1,80,125))

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State -2];どこキャン時点滅
type = PalFX
triggerall = var(46)
triggerall = Time < 9
trigger1 = Time%2 = 0
time = 1
add = 255,255,255
mul = 255,255,255
ignorehitpause = 1

[State -2];タイマー消費
type = varadd
triggerall = var(52)
trigger1 = Time = 0
trigger1 = var(46)
var(52) = -150
persistent = 0

[State 1500, snd]
type = PlaySnd
trigger1 = Time = 0
value = S2,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),51,71),2)
volume = 150
channel = 0

[State 1500, snd]
type = PlaySnd
trigger1 = AnimElem = 2, = 1
value = S3,5

[State 1500, nothitby]
type = NotHitBy
trigger1 = fvar(29) = 1 || fvar(29) = 4
trigger1 = Time > 10
trigger2 = !(fvar(29) = 1 || fvar(29) = 4)
trigger2 = Time > 4
value = ,AP
time = 1

[State 1500, helper]
type = Helper
trigger1 = AnimElem = 2, = 1
helpertype = normal
name = "reflecter"
ID = 1500
pos = 67,-50
postype = p1
facing = 1
stateno = 1505
keyctrl = 0
ownpal = 1
persistent = 0

[State 1500, explod]
type = Explod
trigger1 = AnimElem = 2, = 1
anim = 8112
ID = 8112
pos = 67,-50
postype = p1
bindtime = -1
removetime = -1
sprpriority = 5
ownpal = 1
removeongethit = 1

[State 1500, end];46
type = ChangeState
trigger1 = (fvar(29) != 4 && Time >= 28) && (fvar(29) = 4 && Time >= 40)
trigger2 = NumHelper(1500)
trigger2 = Helper(1500),StateNo = 1510
value = 1501
ignorehitpause = 1
persistent = 0


[Statedef 1501]
type = S
physics = S
movetype = A
ctrl = 0
anim = 1501+(fvar(29)=4)
velset = 0,0
sprpriority = 2

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 1501, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


[Statedef 1505];バリヤー本体A
type = S
physics = N
movetype = A
ctrl = 0
anim = 9999
velset = 0,0
sprpriority = 5

[State -2]
type = ChangeAnim
trigger1 = Root,fvar(29) = 1 || Root,fvar(29) = 4
trigger1 = Time = 9
trigger2 = !(Root,fvar(29) = 1 || Root,fvar(29) = 4)
trigger2 = Time = 3
value = 8114

[State -2]
type = VarSet
trigger1 = 1
var(49) = Root,var(49)

[State -2]
type = ParentVarSet
triggerall = !var(49)
trigger1 = NumHelper(1506)
trigger1 = Helper(1506),MoveHit
var(9) = 1
ignorehitpause = 1
persistent = 0

[State -2]
type = ParentVarSet
triggerall = !var(49)
trigger1 = NumHelper(1506)
trigger1 = Helper(1506),MoveHit
var(8) = 0
ignorehitpause = 1
persistent = 0

[State 1505, helper]
type = Helper
triggerall = NumHelper(1506) = 0
trigger1 = Root,fvar(29) = 1 || Root,fvar(29) = 4
trigger1 = Time = 9
trigger2 = !(Root,fvar(29) = 1 || Root,fvar(29) = 4)
trigger2 = Time = 3
ID = 1506
helpertype = normal
name = "reflecter,damage"
pos = 0,0
postype = p1
stateno = 1506
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 1505]
type = BindtoRoot
trigger1 = 1
pos = 67,-50
facing = 1

[State 1505]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noautoturn

[State 1505]
type = HitBy
trigger1 = 1
value = SCA,AP
time = 1 

[State 1505]
type = HitOverride
trigger1 = 1
attr = SCA,AP
stateno = 1510
ignorehitpause = 1

[State 1505]
type = ChangeState
trigger1 = Time > 25
trigger2 = Time > 10
trigger2 = !NumHelper(1506)
trigger3 = NumHelper(1506)
trigger3 = Helper(1506),MoveContact
trigger4 = GetHitVar(damage) > 0
value = 1510
ignorehitpause = 1
persistent = 0

[State 1505]
type = DestroySelf
trigger1 = Root,MoveType = H
trigger2 = Root,StateNo != [1500,1600)
ignorehitpause = 1


;バリヤーA攻撃判定
[Statedef 1506]
anim = 1505
movetype = A
physics = N
ctrl = 0
sprpriority = 4

[State -2, カウンターヒット判定]
type = VarSet
triggerall = !var(48)
trigger1 = P2MoveType = A
var(48) = 1

[State -2, カウンターヒット判定]
type = VarAdd
trigger1 = var(48)
var(48) = 1

[State -2, カウンターヒット判定]
type = VarSet
trigger1 = var(48) > 10
trigger1 = P2MoveType != A && ProjHit = 0
var(48) = 0

[State -2, カウンターヒット・ダメージ]
type = TargetLifeAdd
triggerall = var(48)
trigger1 = MoveHit
value = -Ceil(Target,GetHitVar(damage)*0.25)
ignorehitpause = 1
absolute = 1
persistent = 0

[State 1506]
type = PowerAdd
trigger1 = MoveContact = 1
value = IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,IfElse(Root,fvar(29)=1,100,94))
ignorehitpause = 1

[State 1506]
type = DestroySelf
trigger1 = Time >= 16
trigger2 = MoveContact = 1
trigger3 = Root,StateNo != 1500
ignorehitpause = 1

[State 1506]
type = BindtoRoot
trigger1 = 1
pos = 67,-50
facing = 1

[State 1506]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noautoturn

[State 1506, hitdef 2002]
type = HitDef
triggerall = !Root,fvar(26)
triggerall = Root,fvar(29) = 1
triggerall = !Root,var(9)
trigger1 = Time = 0
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Back
priority = 7,hit
damage = Ceil(11*(100-Random%11)*(Root,fvar(10))*(Root,fvar(37))/10/103),Ceil(1*(100-Random%11)*(Root,fvar(10))*(Root,fvar(37))/10/103)
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7255
guard.sparkno = S7262
sparkxy = -20,-40
hitsound = S5,6
guard.sound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4,-7.5
guard.velocity = -13.75
air.velocity = -4,-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear,Pos Y)/10)
getpower = 0,0
givepower = 15,15

[State 1506, hitdef 2002um]
type = HitDef
triggerall = Root,fvar(26)
triggerall = Root,fvar(29) = 1
triggerall = !Root,var(9)
trigger1 = Time = 0
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Back
priority = 7,hit
damage = 65*root,fvar(39),Ceil(1*(Root,fvar(10))*(Root,fvar(37))/12)
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7255
guard.sparkno = S7262
sparkxy = -20,-40
hitsound = S5,6
guard.sound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4,-7.5
guard.velocity = -13.75
air.velocity = -4,-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear,Pos Y)/10)
getpower = 0,0
givepower = 15,15


[State 1506, hitdef 98UM]
type = HitDef
triggerall = Root,fvar(29) != 1
triggerall = !Root,var(9)
trigger1 = Time = 0
trigger1 = !Root,var(52)
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Back
priority = 7,hit
damage = Ceil(21*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(2*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7205
guard.sparkno = S7212
sparkxy = -20,-40
hitsound = S5,1
guard.sound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4-(fvar(29)=4&&var(52)>0),-7.5
guard.velocity = -13.75-(fvar(29)=4&&var(52)>0)*2.25
air.velocity = -4-(fvar(29)=4&&var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear,Pos Y)/10)
getpower = 0,0
givepower = 15,15

[State 1506, hitdef 98UM]
type = HitDef
triggerall = Root,fvar(29) != 1
triggerall = !Root,var(9)
trigger1 = Time = 0
trigger1 = Root,var(52)
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Up
priority = 7,hit
damage = Ceil(21*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(2*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7205
guard.sparkno = S7212
sparkxy = -20,-40
hitsound = S5,1
guard.sound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4-(fvar(29)=4&&var(52)>0),-7.5
guard.velocity = -13.75-(fvar(29)=4&&var(52)>0)*2.25
air.velocity = -4-(fvar(29)=4&&var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear,Pos Y)/10)
getpower = 0,0
givepower = 15,15



;=================================================================
;ダークバリヤーB
[Statedef 1550]
type = S
physics = S
movetype = A
ctrl = 0
anim = 1500+!(fvar(29)=1||fvar(29)=4)*10
sprpriority = 2
poweradd = IfElse(((var(52)&&fvar(29)=1)||fvar(34)=2),0,IfElse(fvar(29)=1,80,125))

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State -2];どこキャン時点滅
type = PalFX
triggerall = var(46)
triggerall = Time < 9
trigger1 = Time%2 = 0
time = 1
add = 255,255,255
mul = 255,255,255
ignorehitpause = 1

[State -2];タイマー消費
type = varadd
triggerall = var(52)
trigger1 = Time = 0
trigger1 = var(46)
var(52) = -150
persistent = 0

[State 1500, snd]
type = PlaySnd
trigger1 = Time = 0
value = S2,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),51,71),2)
volume = 150
channel = 0

[State 1500, snd]
type = PlaySnd
trigger1 = AnimElem = 2, = 1
value = S3,5

[State 1500, nothitby]
type = NotHitBy
trigger1 = fvar(29) = 1 || fvar(29) = 4
trigger1 = Time > 10
trigger2 = !(fvar(29) = 1 || fvar(29) = 4)
trigger2 = Time > 4
value = ,AP
time = 1

[State 1500, helper]
type = Helper
trigger1 = AnimElem = 2, = 1
helpertype = normal
name = "reflecter"
ID = 1550
pos = 67,-50
postype = p1
facing = 1
stateno = 1555
keyctrl = 0
ownpal = 1
persistent = 0

[State 1500, explod]
type = Explod
trigger1 = AnimElem = 2, = 1
anim = 8112
ID = 8112
pos = 67,-50
postype = p1
bindtime = -1
removetime = -1
sprpriority = 5
ownpal = 1
removeongethit = 1

[State 1500, end]
type = ChangeState
trigger1 = Time >= 47
trigger2 = NumHelper(1550)
trigger2 = Helper(1550),StateNo = 1510
value = 1501

[Statedef 1555];バリヤー本体B
type = S
physics = N
movetype = A
ctrl = 0
anim = 9999
velset = 0,0
sprpriority = 5

[State -2]
type = ChangeAnim
trigger1 = Root,fvar(29) = 1 || Root,fvar(29) = 4
trigger1 = Time = 9
trigger2 = !(Root,fvar(29) = 1 || Root,fvar(29) = 4)
trigger2 = Time = 3
value = 8114

[State -2]
type = VarSet
trigger1 = 1
var(49) = Root,var(49)

[State -2]
type = ParentVarSet
triggerall = !var(49)
trigger1 = NumHelper(1556)
trigger1 = Helper(1556),MoveHit
trigger1 = P2MoveType = H
var(9) = 1
ignorehitpause = 1
persistent = 0

[State -2]
type = ParentVarSet
triggerall = !var(49)
trigger1 = NumHelper(1556)
trigger1 = Helper(1556),MoveHit
trigger1 = P2MoveType = H
var(8) = 0
ignorehitpause = 1
persistent = 0

[State 1505, helper]
type = Helper
triggerall = NumHelper(1556) = 0
trigger1 = Root,fvar(29) = 1 || Root,fvar(29) = 4
trigger1 = Time = 9
trigger2 = !(Root,fvar(29) = 1 || Root,fvar(29) = 4)
trigger2 = Time = 3
ID = 1556
helpertype = normal
name = "reflecter,damage"
pos = 0,0
postype = p1
stateno = 1556
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 1505]
type = BindtoRoot
trigger1 = 1
pos = 67,-50
facing = 1

[State 1505]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noautoturn

[State 1505]
type = HitBy
trigger1 = 1
value = SCA,AP
time = 1 

[State 1505]
type = HitOverride
trigger1 = 1
attr = SCA,AP
stateno = 1510
ignorehitpause = 1

[State 1505]
type = ChangeState
trigger1 = Time > 41
trigger2 = Time > 10
trigger2 = !NumHelper(1556)
trigger3 = NumHelper(1556)
trigger3 = Helper(1556),MoveContact
trigger4 = GetHitVar(damage) > 0
value = 1510
ignorehitpause = 1
persistent = 0

[State 1505]
type = DestroySelf
trigger1 = Root,MoveType = H
trigger2 = Root,StateNo != [1500,1600)
ignorehitpause = 1


;バリヤーB攻撃判定
[Statedef 1556]
anim = 1505
movetype = A
physics = N
ctrl = 0
sprpriority = 4

[State -2, カウンターヒット判定]
type = VarSet
triggerall = !var(48)
trigger1 = P2MoveType = A
var(48) = 1

[State -2, カウンターヒット判定]
type = VarAdd
trigger1 = var(48)
var(48) = 1

[State -2, カウンターヒット判定]
type = VarSet
trigger1 = var(48) > 10
trigger1 = P2MoveType != A && ProjHit = 0
var(48) = 0

[State -2, カウンターヒット・ダメージ]
type = TargetLifeAdd
triggerall = var(48)
trigger1 = MoveHit
value = -Ceil(Target,GetHitVar(damage)*0.25)
ignorehitpause = 1
absolute = 1
persistent = 0

[State 1506]
type = PowerAdd
trigger1 = MoveContact = 1
value = IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,IfElse(Root,fvar(29)=1,100,94))
ignorehitpause = 1

[State 1506]
type = DestroySelf
trigger1 = Time >= 32
trigger2 = MoveContact = 1
trigger3 = Root,StateNo != 1550
ignorehitpause = 1

[State 1506]
type = BindtoRoot
trigger1 = 1
pos = 67,-50
facing = 1

[State 1506]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noautoturn

[State 1506, hitdef 2002]
type = HitDef
triggerall = !Root,fvar(26)
triggerall = Root,fvar(29) = 1
triggerall = !Root,var(9)
trigger1 = Time = 0
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Back
priority = 7,hit
damage = Ceil(11*(100-Random%11)*(Root,fvar(10))*(Root,fvar(37))/10/103),Ceil(1*(100-Random%11)*(Root,fvar(10))*(Root,fvar(37))/10/103)
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7255
guard.sparkno = S7262
sparkxy = -20,-40
hitsound = S5,6
guard.sound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4,-7.5
guard.velocity = -13.75
air.velocity = -4,-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear,Pos Y)/10)
getpower = 0,0
givepower = 15,15

[State 1506, hitdef 2002]
type = HitDef
triggerall = Root,fvar(26)
triggerall = Root,fvar(29) = 1
triggerall = !Root,var(9)
trigger1 = Time = 0
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Back
priority = 7,hit
damage = 65*fvar(39),Ceil(1*(Root,fvar(10))*(Root,fvar(37))/12)
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7255
guard.sparkno = S7262
sparkxy = -20,-40
hitsound = S5,6
guard.sound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4,-7.5
guard.velocity = -13.75
air.velocity = -4,-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear,Pos Y)/10)
getpower = 0,0
givepower = 15,15


[State 1506, hitdef 98UM]
type = HitDef
triggerall = Root,fvar(29) != 1
triggerall = !Root,var(9)
trigger1 = Time = 0
trigger1 = !Root,var(52)
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Back
priority = 7,hit
damage = Ceil(21*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(2*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7205
guard.sparkno = S7212
sparkxy = -20,-40
hitsound = S5,1
guard.sound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4-(fvar(29)=4&&var(52)>0),-7.5
guard.velocity = -13.75-(fvar(29)=4&&var(52)>0)*2.25
air.velocity = -4-(fvar(29)=4&&var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear,Pos Y)/10)
getpower = 0,0
givepower = 15,15

[State 1506, hitdef 98UM]
type = HitDef
triggerall = Root,fvar(29) != 1
triggerall = !Root,var(9)
trigger1 = Time = 0
trigger1 = Root,var(52)
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Up
priority = 7,hit
damage = Ceil(21*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(2*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7205
guard.sparkno = S7212
sparkxy = -20,-40
hitsound = S5,1
guard.sound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4-(fvar(29)=4&&var(52)>0),-7.5
guard.velocity = -13.75-(fvar(29)=4&&var(52)>0)*2.25
air.velocity = -4-(fvar(29)=4&&var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear,Pos Y)/10)
getpower = 0,0
givepower = 15,15


[Statedef 1510]
type = S
physics = N
movetype = A
ctrl = 0
anim = 8121
velset = 0,0
sprpriority = 7

[State 1505]
type = Explod
trigger1 = Time = 0
anim = 8113
ID = 8113
pos = 0,0
postype = p1
removetime = -2
sprpriority = 7
ownpal = 1

[State 1510]
type = PlaySnd
trigger1 = GetHitVar(damage) > 0
value = S3,18
volume = 200

[State 1510]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 1510]
type = BindtoRoot
trigger1 = 1
pos = 67,-50
facing = 1

[State 1510, 飛び道具消去用]
type = Projectile
trigger1 = GetHitVar(damage) > 0
attr = S,SP
hitflag = MAFDP
guardflag = -1
animtype = Hard
ground.type = High
priority = 7,hit
sparkno = -1
guard.sparkno = -1
sparkxy = 20,0
hitsound = -1
guard.sound = -1
offset = 0,0
velocity = 0
projID = 8120
projanim = 8120
projhitanim = -1
projremove = 1
projremovetime = 5
projhits = 99999
projpriority = 7
numhits = 0
getpower = 0,0
givepower = 0,0

[State 1510, 反射飛び道具,Hard High]
type = Projectile
trigger1 = GetHitVar(damage) > 0
trigger1 = GetHitVar(animtype) = [0,2]
trigger1 = !(GetHitVar(groundtype) = 2)
attr = S,SP
hitflag = MAF
guardflag = M
animtype = Hard
ground.type = High
priority = 7,hit
damage = Ceil(GetHitVar(damage)*(Root,Const(data.defence))/100),Ceil(GetHitVar(damage)*(Root,Const(data.defence))/1000)
pausetime = 0,GetHitVar(hitshaketime)
guard.pausetime = 0,GetHitVar(hitshaketime)
sparkno = S(7205+(Root,fvar(29)=1)*50)
guard.sparkno = S(7212+(Root,fvar(29)=1)*50)
sparkxy = 20,0
hitsound = S5,(1+(Root,fvar(29)=1)*5)
guard.sound = S6,1
ground.hittime = GetHitVar(hittime)
ground.slidetime = GetHitVar(slidetime)
guard.ctrltime = GetHitVar(ctrltime)
air.hittime = 60
ground.velocity = -abs(GetHitVar(xvel)),GetHitVar(yvel)
air.velocity = -abs(GetHitVar(xvel)),GetHitVar(yvel)
yaccel = GetHitVar(yaccel)
offset = 100-56,-65+60
velocity = (5+(GetHitVar(damage)*(Root,Const(data.defence))/100/50))*(1+(Root,fvar(29)=3||Root,fvar(29)=6)*0.5)
projID = 1510
projanim = 8165
projhitanim = 8126
projremove = 1
projhits = 1
projpriority = 7
numhits = 1
fall = GetHitVar(fall)
fall.recover = GetHitVar(fall.recover)
fall.recovertime = GetHitVar(fall.recovertime)
fall.damage = GetHitVar(fall.damage)
fall.kill = GetHitVar(fall.kill)
getpower = IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,100),IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,100)
givepower = 15,15

[State 1510, 反射飛び道具,Hard Low]
type = Projectile
trigger1 = GetHitVar(damage) > 0
trigger1 = GetHitVar(animtype) = [0,2]
trigger1 = GetHitVar(groundtype) = 2
attr = S,SP
hitflag = MAF
guardflag = M
animtype = Hard
ground.type = Low
priority = 7,hit
damage = Ceil(GetHitVar(damage)*(Root,Const(data.defence))/100),Ceil(GetHitVar(damage)*(Root,Const(data.defence))/1000)
pausetime = 0,GetHitVar(hitshaketime)
guard.pausetime = 0,GetHitVar(hitshaketime)
sparkno = S(7205+(Root,fvar(29)=1)*50)
guard.sparkno = S(7212+(Root,fvar(29)=1)*50)
sparkxy = 20,0
hitsound = S5,(1+(Root,fvar(29)=1)*5)
guard.sound = S6,1
ground.hittime = GetHitVar(hittime)
ground.slidetime = GetHitVar(slidetime)
guard.ctrltime = GetHitVar(ctrltime)
air.hittime = 60
ground.velocity = -abs(GetHitVar(xvel)),GetHitVar(yvel)
air.velocity = -abs(GetHitVar(xvel)),GetHitVar(yvel)
yaccel = GetHitVar(yaccel)
offset = 100-56,-65+60
velocity = (5+(GetHitVar(damage)*(Root,Const(data.defence))/100/50))*(1+(Root,fvar(29)=3||Root,fvar(29)=6)*0.5)
projID = 1510
projanim = 8165
projhitanim = 8126
projremove = 1
projhits = 1
projpriority = 7
numhits = 1
fall = GetHitVar(fall)
fall.recover = GetHitVar(fall.recover)
fall.recovertime = GetHitVar(fall.recovertime)
fall.damage = GetHitVar(fall.damage)
fall.kill = GetHitVar(fall.kill)
getpower = IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,100),IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,100)
givepower = 15,15

[State 1510, 反射飛び道具,Back]
type = Projectile
trigger1 = GetHitVar(damage) > 0
trigger1 = GetHitVar(animtype) = 3
attr = S,SP
hitflag = MAF
guardflag = M
animtype = Back
ground.type = High
priority = 7,hit
damage = Ceil(GetHitVar(damage)*(Root,Const(data.defence))/100),Ceil(GetHitVar(damage)*(Root,Const(data.defence))/1000)
pausetime = 0,GetHitVar(hitshaketime)
guard.pausetime = 0,GetHitVar(hitshaketime)
sparkno = S(7205+(Root,fvar(29)=1)*50)
guard.sparkno = S(7212+(Root,fvar(29)=1)*50)
sparkxy = 20,0
hitsound = S5,(1+(Root,fvar(29)=1)*5)
guard.sound = S6,1
ground.hittime = GetHitVar(hittime)
ground.slidetime = GetHitVar(slidetime)
guard.ctrltime = GetHitVar(ctrltime)
air.hittime = 60
ground.velocity = -abs(GetHitVar(xvel)),GetHitVar(yvel)
air.velocity = -abs(GetHitVar(xvel)),GetHitVar(yvel)
yaccel = GetHitVar(yaccel)
offset = 100-56,-65+60
velocity = (5+(GetHitVar(damage)*(Root,Const(data.defence))/100/50))*(1+(Root,fvar(29)=3||Root,fvar(29)=6)*0.5)
projID = 1510
projanim = 8165
projhitanim = 8126
projremove = 1
projhits = 1
projpriority = 7
numhits = 1
fall = GetHitVar(fall)
fall.recover = GetHitVar(fall.recover)
fall.recovertime = GetHitVar(fall.recovertime)
fall.damage = GetHitVar(fall.damage)
fall.kill = GetHitVar(fall.kill)
getpower = IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,100),IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,100)
givepower = 15,15

[State 1510, 反射飛び道具,Up]
type = Projectile
trigger1 = GetHitVar(damage) > 0
trigger1 = GetHitVar(animtype) = 4
attr = S,SP
hitflag = MAF
guardflag = M
animtype = Up
ground.type = High
priority = 7,hit
damage = Ceil(GetHitVar(damage)*(Root,Const(data.defence))/100),Ceil(GetHitVar(damage)*(Root,Const(data.defence))/1000)
pausetime = 0,GetHitVar(hitshaketime)
guard.pausetime = 0,GetHitVar(hitshaketime)
sparkno = S(7205+(Root,fvar(29)=1)*50)
guard.sparkno = S(7212+(Root,fvar(29)=1)*50)
sparkxy = 20,0
hitsound = S5,(1+(Root,fvar(29)=1)*5)
guard.sound = S6,1
ground.hittime = GetHitVar(hittime)
ground.slidetime = GetHitVar(slidetime)
guard.ctrltime = GetHitVar(ctrltime)
air.hittime = 60
ground.velocity = -abs(GetHitVar(xvel)),GetHitVar(yvel)
air.velocity = -abs(GetHitVar(xvel)),GetHitVar(yvel)
yaccel = GetHitVar(yaccel)
offset = 100-56,-65+60
velocity = (5+(GetHitVar(damage)*(Root,Const(data.defence))/100/50))*(1+(Root,fvar(29)=3||Root,fvar(29)=6)*0.5)
projID = 1510
projanim = 8165
projhitanim = 8126
projremove = 1
projhits = 1
projpriority = 7
numhits = 1
fall = GetHitVar(fall)
fall.recover = GetHitVar(fall.recover)
fall.recovertime = GetHitVar(fall.recovertime)
fall.damage = GetHitVar(fall.damage)
fall.kill = GetHitVar(fall.kill)
getpower = IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,100),IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,100)
givepower = 15,15

[State 1510, 反射飛び道具,DiagUp]
type = Projectile
trigger1 = GetHitVar(damage) > 0
trigger1 = GetHitVar(animtype) = 5
attr = S,SP
hitflag = MAF
guardflag = M
animtype = DiagUp
ground.type = High
priority = 7,hit
damage = Ceil(GetHitVar(damage)*(Root,Const(data.defence))/100),Ceil(GetHitVar(damage)*(Root,Const(data.defence))/1000)
pausetime = 0,GetHitVar(hitshaketime)
guard.pausetime = 0,GetHitVar(hitshaketime)
sparkno = S(7205+(Root,fvar(29)=1)*50)
guard.sparkno = S(7212+(Root,fvar(29)=1)*50)
sparkxy = 20,0
hitsound = S5,(1+(Root,fvar(29)=1)*5)
guard.sound = S6,1
ground.hittime = GetHitVar(hittime)
ground.slidetime = GetHitVar(slidetime)
guard.ctrltime = GetHitVar(ctrltime)
air.hittime = 60
ground.velocity = -abs(GetHitVar(xvel)),GetHitVar(yvel)
air.velocity = -abs(GetHitVar(xvel)),GetHitVar(yvel)
yaccel = GetHitVar(yaccel)
offset = 100-56,-65+60
velocity = (5+(GetHitVar(damage)*(Root,Const(data.defence))/100/50))*(1+(Root,fvar(29)=3||Root,fvar(29)=6)*0.5)
projID = 1510
projanim = 8165
projhitanim = 8126
projremove = 1
projhits = 1
projpriority = 7
numhits = 1
fall = GetHitVar(fall)
fall.recover = GetHitVar(fall.recover)
fall.recovertime = GetHitVar(fall.recovertime)
fall.damage = GetHitVar(fall.damage)
fall.kill = GetHitVar(fall.kill)
getpower = IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,100),IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,100)
givepower = 15,15

[State 1510]
type = ReversalDef
trigger1 = GetHitVar(damage) > 0
trigger2 = Root,NumProjID(8120)
trigger3 = Root,NumProjID(1510)
reversal.attr = SCA,AP
pausetime = 0,0
sparkno = -1
sparkxy = 0,0
p2stateno = 1580

[State 1510]
type = DestroySelf
trigger1 = AnimTime = 0
ignorehitpause = 1

;空ステート
[Statedef 1580]
physics = N
ctrl = 0

[State 1580]
type = ChangeAnim2
trigger1 = Time = 0
value = 9999

[State 1580]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State 1580]
type = SelfState
trigger1 = !IsHelper
value = 0
ctrl = 1




;=================================================================
;グラビティスマッシュX
[Statedef 1700]
type = S
movetype = A
physics = S
anim = 1700
ctrl = 0
sprpriority = 2
poweradd = IfElse(((var(52)&&fvar(29)=1)||fvar(34)=2),0,125)

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State 1700, playsnd]
type = PlaySnd
triggerall = fvar(29) = [4,6]
trigger1 = Time = 0
value = S2,6
volume = 150
channel = 8

[State 1700, playsnd]
type = PlaySnd
triggerall = fvar(29) = [1,3]
trigger1 = Time = 0
value = S10,66
volume = 150
channel = 8

[State 1700, playsnd]
type = PlaySnd
trigger1 = AnimElem = 3, = 1
value = S3,8
channel = 9

[State 1700, posadd]
type = PosAdd
trigger1 = AnimElem = 3
x = -7

[State 1700, posadd]
type = PosAdd
trigger1 = AnimElem = 4
x = -4

[State 1700, posadd]
type = PosAdd
trigger1 = AnimElem = 5
x = -8

[State 1700, ID決定]
type = VarSet
triggerall = Time = 0
trigger1 = !NumHelper(1710)
trigger2 = NumHelper(1711)
var(29) = 0

[State 1700, ID決定]
type = VarSet
triggerall = Time = 0
trigger1 = NumHelper(1710)
var(29) = 1

[State 1700, 攻撃用]
type = Helper
trigger1 = AnimElem = 3, = 1
helpertype = normal
ID = 1710+var(29)
stateno = 1710
pos = 0,-80
postype = p1
facing = 1
keyctrl = 0
ownpal = 1

[State 1700, 相殺用]
type = Helper
trigger1 = AnimElem = 6, = 1
helpertype = normal
ID = 1715+var(29)
stateno = 1715
pos = 0,-80
postype = p1
facing = 1
keyctrl = 0
ownpal = 1

[State 1700, end]
type = ChangeState
trigger1 = Time >= 120
Trigger2 = var(59) = 0
trigger2 = Time >= 30
trigger2 = !(Command = "holdx")
Value = 1701

[Statedef 1701]
type = S
movetype = A
physics = S
anim = 1701
ctrl = 0
velset = 0,0
sprpriority = 2

[State 1701, stopsnd]
type = StopSnd
trigger1 = Time = 0
channel = 8

[State 1701, stopsnd]
type = StopSnd
trigger1 = Time = 0
channel = 9

[State 1701, playsnd]
type = PlaySnd
triggerall = fvar(29) = [4,6]
trigger1 = Time = 0
value = S2,7
volume = 150

[State 1701, playsnd]
type = PlaySnd
triggerall = fvar(29) = [1,3]
trigger1 = Time = 0
value = S1,51
volume = 150

[State 1701, playsnd]
type = PlaySnd
trigger1 = Time = 0
value = S3,9
volume = 150

[State 1701, posadd]
type = PosAdd
trigger1 = AnimElem = 2
x = 8

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 1701, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;グラビティスマッシュX・気弾本体
[Statedef 1710]
movetype = A
anim = 8130
ctrl = 0
sprpriority = 4

[State -2, 打逆不可防用]
type = AssertSpecial
trigger1 = Enemynear,P2Dist x < 0
flag = unguardable
IgnoreHitPause = 1

[State 1710, ishelper]
type = SelfState
trigger1 = !IsHelper
value = 0
ctrl = 1

[State 1710, assert for helper]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noautoturn

[State 1710, bind]
type = BindToParent
trigger1 = Parent,StateNo = 1700
time = 1
facing = 1
pos = 0,-80

[State -2, EnemyNear]
type = VarSet
trigger1 = NumEnemy = 1
trigger2 = NumEnemy = 2
trigger2 = EnemyNear(0),Life > 0
var(2) = 0
ignorehitpause = 1

[State -2, EnemyNear]
type = VarSet
trigger1 = NumEnemy = 2
trigger1 = EnemyNear(0),Life <= 0
var(2) = 1
ignorehitpause = 1

[State -2]
type = PowerAdd
trigger1 = MoveContact = 1
value = IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,110)
ignorehitpause = 1

[State -2]
type = ParentVarSet
triggerall = !Root,var(49)
trigger1 = MoveHit
trigger1 = EnemyNear(var(2)),MoveType = H
var(9) = 1
ignorehitpause = 1

[State -2, カウンターヒット判定]
type = VarSet
triggerall = !var(48)
trigger1 = EnemyNear(var(2)),MoveType = A
var(48) = 1

[State -2, カウンターヒット判定]
type = VarAdd
trigger1 = var(48)
var(48) = 1

[State -2, カウンターヒット判定]
type = VarSet
trigger1 = var(48) > 10
trigger1 = EnemyNear(var(2)),MoveType != A && ProjHit = 0
var(48) = 0

[State -2, カウンターヒット・ダメージ]
type = TargetLifeAdd
triggerall = var(48)
trigger1 = NumTarget
trigger1 = MoveHit
value = -Ceil(Target,GetHitVar(damage)*0.25)
absolute = 1
ignorehitpause = 1

[State -2]
type = VarSet
triggerall = !(var(9) || Parent,var(49))
trigger1 = MoveHit = 1
trigger1 = EnemyNear(var(2)),MoveType = H
trigger2 = Time = 0
trigger2 = Root,var(9)
var(9) = 1
ignorehitpause = 1

[State -2]
type = VarSet
triggerall = var(9)
trigger1 = EnemyNear(var(2)),Life > 0 && EnemyNear(var(2)),Ctrl
trigger2 = Root,var(49) = [1,2]
trigger3 = !(EnemyNear(var(2)),MoveType = H)
trigger4 = EnemyNear(var(2)),StateType = L
trigger5 = EnemyNear(var(2)),StateNo = 5120
var(9) = 0
ignorehitpause = 1

[State -2, hitcount]
type = VarAdd
trigger1 = MoveContact = 1
trigger1 = EnemyNear(var(2)),MoveType = H
var(1) = 1
ignorehitpause = 1

[State -2]
type = VarSet
trigger1 = Floor(20*0.5**var(1))-1 >= 1
fvar(24) = Floor(20*0.5**var(1))-1 
ignorehitpause = 1

[State -2]
type = VarSet
trigger1 = Floor(20*0.5**var(1))-1 < 1
fvar(24) = 1
ignorehitpause = 1

[State 1710 98]
type = HitDef
triggerall = !var(9)
triggerall = !Root,var(52)
triggerall = Root,fvar(26) != 1
trigger1 = time%17 = 0
attr = S,SP
hitflag = MAF
guardflag = M
animtype = Back
ID = 1700
priority = 7,hit
damage = Ceil(fvar(24)*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(IfElse(var(1)>0,1,2)*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7206
guard.sparkno = S7212
sparkxy = -10,-20+(P2StateType = C)*30
hitsound = S5,22
guardsound = S6,1
ground.type = High
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
guard.velocity = -13.75-(Root,fvar(29)=4&&Root,var(52)>0)*2.25
air.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 27+12+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15
sprpriority = 4
palfx.time = 60
palfx.add = 128,128,128
palfx.mul = 200,200,200
palfx.sinadd = 128,128,128,3
palfx.color = 255

[State 1710 98]
type = HitDef
triggerall = !var(9)
triggerall = Root,var(52)
triggerall = Root,fvar(26) != 1
trigger1 = time%17 = 0
attr = S,SP
hitflag = MAF
guardflag = M
animtype = Up
ID = 1700
priority = 7,hit
damage = Ceil(fvar(24)*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(IfElse(var(1)>0,1,2)*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7206
guard.sparkno = S7212
sparkxy = -10,-20+(P2StateType = C)*30
hitsound = S5,22
guardsound = S6,1
ground.type = High
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
guard.velocity = -13.75-(Root,fvar(29)=4&&Root,var(52)>0)*2.25
air.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 27+12+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15
sprpriority = 4
palfx.time = 60
palfx.add = 128,128,128
palfx.mul = 200,200,200
palfx.sinadd = 128,128,128,3
palfx.color = 255



[State 1710 02UM]
type = HitDef
triggerall = !var(9)
triggerall = Root,fvar(26) = 1
trigger1 = time%17 = 0
attr = S,SP
hitflag = MAF
guardflag = M
animtype = Back
ID = 1700
priority = 7,hit
damage = 80 * root,fvar(39), 15
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7256
guard.sparkno = S7262
sparkxy = -10,-20+(P2StateType = C)*30
hitsound = S5,22
guardsound = S6,1
ground.type = High
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
guard.velocity = -13.75-(Root,fvar(29)=4&&Root,var(52)>0)*2.25
air.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 27+12+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15
sprpriority = 4
palfx.time = 60
palfx.add = 128,128,128
palfx.mul = 200,200,200
palfx.sinadd = 128,128,128,3
palfx.color = 255


[State -2, グラビティスマッシュ、ヒットエフェクト]
type = Helper
triggerall = NumHelper(1795) = 0
triggerall = NumTarget(1700)
triggerall = Target,MoveType = H
trigger1 = MoveHit
ID = 1795
helpertype = normal
name = "gravityhit"
pos = 0,0
postype = p2
facing = 1
stateno = 1795
keyctrl = 0
ownpal = 1

[State 1710, destroyself]
type = DestroySelf
trigger1 = Parent,MoveType = H
trigger2 = !(Parent,StateNo = 1700 || Parent,StateNo = 1701)
ignorehitpause = 1

[State 1710, Guard Crush Calculation]
type = ParentVarAdd
trigger1 = MoveGuarded = 1
fvar(23) = 600

[State 1710, end]
type = ChangeState
trigger1 = Parent,StateNo = 1701
value = 1711


[Statedef 1711]
movetype = A
anim = 8131
ctrl = 0
sprpriority = 4
velset = 4,0

[State 1711, ishelper]
type = SelfState
trigger1 = !IsHelper
value = 0
ctrl = 1

[State 1711, assert for helper]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noautoturn

[State 1711, bind]
type = BindToParent
trigger1 = time = 0
time = 1
facing = 1
pos = 0,-80

[State -2, EnemyNear]
type = VarSet
trigger1 = NumEnemy = 1
trigger2 = NumEnemy = 2
trigger2 = EnemyNear(0),Life > 0
var(2) = 0
ignorehitpause = 1

[State -2, EnemyNear]
type = VarSet
trigger1 = NumEnemy = 2
trigger1 = EnemyNear(0),Life <= 0
var(2) = 1
ignorehitpause = 1

[State -2]
type = PowerAdd
trigger1 = MoveContact = 1
value = IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,110)
ignorehitpause = 1

[State -2]
type = ParentVarSet
triggerall = !Root,var(49)
trigger1 = MoveHit
trigger1 = EnemyNear(var(2)),MoveType = H
var(9) = 1
ignorehitpause = 1

[State -2, カウンターヒット判定]
type = VarSet
triggerall = !var(48)
trigger1 = EnemyNear(var(2)),MoveType = A
var(48) = 1

[State -2, カウンターヒット判定]
type = VarAdd
trigger1 = var(48)
var(48) = 1

[State -2, カウンターヒット判定]
type = VarSet
trigger1 = var(48) > 10
trigger1 = EnemyNear(var(2)),MoveType != A && ProjHit = 0
var(48) = 0

[State -2, カウンターヒット・ダメージ]
type = TargetLifeAdd
triggerall = var(48)
trigger1 = NumTarget
trigger1 = MoveHit
value = -ceil(Target,GetHitVar(damage)*0.25)
absolute = 1
ignorehitpause = 1

[State -2]
type = VarSet
triggerall = !(var(9) || Parent,var(49))
trigger1 = MoveHit
trigger1 = EnemyNear(var(2)),MoveType = H
trigger2 = Time = 0
trigger2 = Root,var(9)
var(9) = 1
ignorehitpause = 1

[State -2]
type = VarSet
triggerall = var(9)
trigger1 = EnemyNear(var(2)),Life > 0 && EnemyNear(var(2)),Ctrl
trigger2 = Root,var(49) = [1,2]
trigger3 = !(EnemyNear(var(2)),MoveType = H)
trigger4 = EnemyNear(var(2)),StateType = L
trigger5 = EnemyNear(var(2)),StateNo = 5120
var(9) = 0
ignorehitpause = 1

[State -2, hitcount]
type = VarAdd
trigger1 = MoveContact = 1
trigger1 = EnemyNear(var(2)),MoveType = H
var(1) = 1
ignorehitpause = 1

[State -2]
type = VarSet
trigger1 = Floor(20*0.5**var(1))-1 >= 1
fvar(24) = Floor(20*0.5**var(1))-1 
ignorehitpause = 1

[State -2]
type = VarSet
trigger1 = Floor(20*0.5**var(1))-1 < 1
fvar(24) = 1
ignorehitpause = 1

[State 1711   98]
type = HitDef
triggerall = !var(9)
triggerall = !Root,var(52)
triggerall = Root,fvar(26) != 1
trigger1 = 1
attr = S,SP
hitflag = MAF
guardflag = M
animtype = Back
ID = 1700
priority = 7,hit
damage = Ceil(fvar(24)*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(IfElse(var(1)>0,1,2)*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7206
guard.sparkno = S7212
sparkxy = -10,-20
hitsound = S5,22
guardsound = S6,1
ground.type = High
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
guard.velocity = -13.75-(Root,fvar(29)=4&&Root,var(52)>0)*2.25
air.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 27+12+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15
sprpriority = 4
palfx.time = 60
palfx.add = 128,128,128
palfx.mul = 200,200,200
palfx.sinadd = 128,128,128,3
palfx.color = 255

[State 1711  98]
type = HitDef
triggerall = !var(9)
triggerall = Root,var(52)
triggerall = Root,fvar(26) != 1
trigger1 = 1
attr = S,SP
hitflag = MAF
guardflag = M
animtype = Up
ID = 1700
priority = 7,hit
damage = Ceil(fvar(24)*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(IfElse(var(1)>0,1,2)*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7206
guard.sparkno = S7212
sparkxy = -10,-20
hitsound = S5,22
guardsound = S6,1
ground.type = High
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
guard.velocity = -13.75-(Root,fvar(29)=4&&Root,var(52)>0)*2.25
air.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 27+12+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15
sprpriority = 4
palfx.time = 60
palfx.add = 128,128,128
palfx.mul = 200,200,200
palfx.sinadd = 128,128,128,3
palfx.color = 255



[State 1711   02UM]
type = HitDef
triggerall = !var(9)
triggerall = Root,fvar(26) = 1
trigger1 = 1
attr = S,SP
hitflag = MAF
guardflag = M
animtype = Back
ID = 1700
priority = 7,hit
damage = 110 * root,fvar(39), 15
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7256
guard.sparkno = S7262
sparkxy = -10,-20
hitsound = S5,22
guardsound = S6,1
ground.type = High
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
guard.velocity = -13.75-(Root,fvar(29)=4&&Root,var(52)>0)*2.25
air.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 27+12+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15
sprpriority = 4
palfx.time = 60
palfx.add = 128,128,128
palfx.mul = 200,200,200
palfx.sinadd = 128,128,128,3
palfx.color = 255


[State 1710, Guard Crush Calculation]
type = ParentVarAdd
triggerall = root,fvar(26) = 1
trigger1 = MoveGuarded = 1
fvar(23) = 1200

[State -2, グラビティスマッシュ、ヒットエフェクト]
type = Helper
triggerall = NumHelper(1795) = 0
triggerall = NumTarget(1700)
triggerall = Target,MoveType = H
trigger1 = MoveHit
ID = 1795
helpertype = normal
name = "gravityhit"
pos = 0,0
postype = p2
facing = 1
stateno = 1795
keyctrl = 0
ownpal = 1

[State 1711, anim]
type = ChangeAnim
trigger1 = time = 12
value = 8132

[State 1710 ,projID]
type = VarSet
triggerall = Time = 12
trigger1 = !Parent,NumProjID(1700)
trigger2 = Parent,NumProjID(1701)
var(10) = 1700

[State 1710 ,projID]
type = VarSet
triggerall = Time = 12
trigger1 = Parent,NumProjID(1700)
var(10) = 1701

[State 1700]
type = Projectile
trigger1 = time = 12
trigger2 = Parent,NumProjID(var(10)) = 1
attr = S,SP
hitflag = MAFP
projID = var(10)
projanim = 8137
projremanim = -1
projremove = 1
projremovetime = 1
offset = 0,0
postype = p1
velocity = 4,0
projpriority = 7
projsprpriority = 3
projheightboud = -500,0

[State 1711, destory]
type = Explod
trigger1 = Anim = 8132
trigger1 = Parent,NumProjID(var(10)) = 0
trigger2 = Time >= 12
trigger2 = MoveContact = 1
trigger2 = P2MoveType = H
ID = 8133
anim = 8133
pos = 0,0
postype = p1
sprpriority = 4
ownpal = 1
removetime = -2

[State 1711, destroy]
type = DestroySelf
trigger1 = Anim = 8132
trigger1 = Parent,NumProjID(var(10)) = 0
trigger2 = (MoveHit = 1 && Time >= 10) || MoveGuarded = 1
trigger3 = !(Parent,StateNo = 1700 || Parent,StateNo = 1701)
trigger3 = Time < 12
trigger4 = FrontEdgeBodyDist < -70
ignorehitpause = 1

;相殺用ヘルパー
[Statedef 1715]
physics = N
anim = 8135
ctrl = 0
sprpriority = 4

[State 1715]
type = SelfState
trigger1 = !IsHelper
value = 0
ctrl = 1

[State 1715]
type = BindToParent
trigger1 = 1
pos = 0,-80
facing = 1
time = 1

[State 1715]
type = HitBy
trigger1 = 1
value = SCA,AP
time = 1
ignorehitpause = 1

[State 1710,ID]
type = VarSet
triggerall = !var(29)
trigger1 = Time = 0
var(29) = Root,var(29)+1
persistent = 0

[State 1715]
type = HitOverRide
trigger1 = 1
attr = SCA,AP
stateno = 1715
ignorehitpause = 1

[State 1715]
type = DestroySelf
trigger1 = NumHelper(1710+var(29)-1) = 0
trigger2 = Parent,MoveType = H
ignorehitpause = 1

[State 1715]
type = ChangeState
trigger1 = Parent,StateNo = 1701
value = 1716
ignorehitpause = 1

[Statedef 1716]
type = S
anim = 8136
ctrl = 0
sprpriority = 4
velset = 4,0

[State 1716]
type = SelfState
trigger1 = !IsHelper
value = 0
ctrl = 1

[State 1716]
type = HitBy
trigger1 = 1
value = SCA,AP
time = 1
ignorehitpause = 1

[State 1716]
type = HitOverRide
trigger1 = 1
attr = SCA,AP
stateno = 1716
ignorehitpause = 1

[State 1716]
type = DestroySelf
trigger1 = NumHelper(1710+var(29)-1) = 0
trigger2 = time >= 12


;=================================================================
;グラビティスマッシュY
[Statedef 1720]
type = S
movetype = A
physics = S
anim = 1700
ctrl = 0
sprpriority = 2
poweradd = IfElse(((var(52)&&fvar(29)=1)||fvar(34)=2),0,125)

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State 1700, playsnd]
type = PlaySnd
triggerall = fvar(29) = [4,6]
trigger1 = Time = 0
value = S2,6
volume = 150
channel = 8

[State 1700, playsnd]
type = PlaySnd
triggerall = fvar(29) = [1,3]
trigger1 = Time = 0
value = S10,66
volume = 150
channel = 8

[State 1700, playsnd]
type = PlaySnd
trigger1 = AnimElem = 3, = 1
value = S3,8
channel = 9

[State 1700, posadd]
type = PosAdd
trigger1 = AnimElem = 3
x = -7

[State 1700, posadd]
type = PosAdd
trigger1 = AnimElem = 4
x = -4

[State 1700, posadd]
type = PosAdd
trigger1 = AnimElem = 5
x = -8

[State 1700, ID決定]
type = VarSet
triggerall = Time = 0
trigger1 = !NumHelper(1730)
trigger2 = NumHelper(1731)
var(29) = 0

[State 1700, ID決定]
type = VarSet
triggerall = Time = 0
trigger1 = NumHelper(1730)
var(29) = 1

[State 1700, 攻撃用]
type = Helper
trigger1 = AnimElem = 3, = 1
helpertype = normal
ID = 1730+var(29)
stateno = 1730
pos = 0,-80
postype = p1
facing = 1
keyctrl = 0
ownpal = 1

[State 1700, 相殺用]
type = Helper
trigger1 = AnimElem = 6, = 1
helpertype = normal
ID = 1735+var(29)
stateno = 1735
pos = 0,-80
postype = p1
facing = 1
keyctrl = 0
ownpal = 1

[State 1700, end]
type = ChangeState
trigger1 = Time >= 120
Trigger2 = var(59) = 0
trigger2 = Time >= 30
trigger2 = !(Command = "holdy")
Value = 1701



;グラビティスマッシュY・気弾本体
[Statedef 1730]
movetype = A
anim = 8130
ctrl = 0
sprpriority = 4

[State -2, 打逆不可防用]
type = AssertSpecial
trigger1 = Enemynear,P2Dist x < 0
flag = unguardable
IgnoreHitPause = 1

[State 1710, ishelper]
type = SelfState
trigger1 = !IsHelper
value = 0
ctrl = 1

[State 1710, assert for helper]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noautoturn

[State 1710, bind]
type = BindToParent
trigger1 = Parent,StateNo = 1720
time = 1
facing = 1
pos = 0,-80

[State -2, EnemyNear]
type = VarSet
trigger1 = NumEnemy = 1
trigger2 = NumEnemy = 2
trigger2 = EnemyNear(0),Life > 0
var(2) = 0
ignorehitpause = 1

[State -2, EnemyNear]
type = VarSet
trigger1 = NumEnemy = 2
trigger1 = EnemyNear(0),Life <= 0
var(2) = 1
ignorehitpause = 1

[State -2]
type = PowerAdd
trigger1 = MoveContact = 1
value = IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,110)
ignorehitpause = 1

[State -2]
type = ParentVarSet
triggerall = !Root,var(49)
trigger1 = MoveHit
trigger1 = EnemyNear(var(2)),MoveType = H
var(9) = 1
ignorehitpause = 1

[State -2, カウンターヒット判定]
type = VarSet
triggerall = !var(48)
trigger1 = EnemyNear(var(2)),MoveType = A
var(48) = 1

[State -2, カウンターヒット判定]
type = VarAdd
trigger1 = var(48)
var(48) = 1

[State -2, カウンターヒット判定]
type = VarSet
trigger1 = var(48) > 10
trigger1 = EnemyNear(var(2)),MoveType != A && ProjHit = 0
var(48) = 0

[State -2, カウンターヒット・ダメージ]
type = TargetLifeAdd
triggerall = var(48)
trigger1 = NumTarget
trigger1 = MoveHit
value = -Ceil(Target,GetHitVar(damage)*0.25)
absolute = 1
ignorehitpause = 1

[State -2]
type = VarSet
triggerall = !(var(9) || Parent,var(49))
trigger1 = MoveHit = 1
trigger1 = EnemyNear(var(2)),MoveType = H
trigger2 = Time = 0
trigger2 = Root,var(9)
var(9) = 1
ignorehitpause = 1

[State -2]
type = VarSet
triggerall = var(9)
trigger1 = EnemyNear(var(2)),Life > 0 && EnemyNear(var(2)),Ctrl
trigger2 = Root,var(49) = [1,2]
trigger3 = !(EnemyNear(var(2)),MoveType = H)
trigger4 = EnemyNear(var(2)),StateType = L
trigger5 = EnemyNear(var(2)),StateNo = 5120
var(9) = 0
ignorehitpause = 1

[State -2, hitcount]
type = VarAdd
trigger1 = MoveContact = 1
trigger1 = EnemyNear(var(2)),MoveType = H
var(1) = 1
ignorehitpause = 1

[State -2]
type = VarSet
trigger1 = Floor(20*0.5**var(1))-1 >= 1
fvar(24) = Floor(20*0.5**var(1))-1 
ignorehitpause = 1

[State -2]
type = VarSet
trigger1 = Floor(20*0.5**var(1))-1 < 1
fvar(24) = 1
ignorehitpause = 1

[State 1730, hitdef]
type = HitDef
triggerall = !var(9)
triggerall = !Root,var(52)
triggerall = Root,fvar(26) != 1
trigger1 = time%17 = 0
attr = S,SP
hitflag = MAF
guardflag = M
animtype = Back
ID = 1700
priority = 7,hit
damage = Ceil(fvar(24)*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(IfElse(var(1)>0,1,2)*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7206
guard.sparkno = S7212
sparkxy = -10,-20+(P2StateType = C)*30
hitsound = S5,22
guardsound = S6,1
ground.type = High
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
guard.velocity = -13.75-(Root,fvar(29)=4&&Root,var(52)>0)*2.25
air.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 27+12+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15
sprpriority = 4
palfx.time = 60
palfx.add = 128,128,128
palfx.mul = 200,200,200
palfx.sinadd = 128,128,128,3
palfx.color = 255

[State 1710]
type = HitDef
triggerall = !var(9)
triggerall = Root,var(52)
triggerall = Root,fvar(26) != 1
trigger1 = time%17 = 0
attr = S,SP
hitflag = MAF
guardflag = M
animtype = Up
ID = 1700
priority = 7,hit
damage = Ceil(fvar(24)*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(IfElse(var(1)>0,1,2)*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7206
guard.sparkno = S7212
sparkxy = -10,-20+(P2StateType = C)*30
hitsound = S5,22
guardsound = S6,1
ground.type = High
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
guard.velocity = -13.75-(Root,fvar(29)=4&&Root,var(52)>0)*2.25
air.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 27+12+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15
sprpriority = 4
palfx.time = 60
palfx.add = 128,128,128
palfx.mul = 200,200,200
palfx.sinadd = 128,128,128,3
palfx.color = 255


[State 1710  02UM]
type = HitDef
triggerall = !var(9)
triggerall = Root,fvar(26) = 1
trigger1 = time%17 = 0
attr = S,SP
hitflag = MAF
guardflag = M
animtype = Up
ID = 1700
priority = 7,hit
damage = 80 * root,fvar(39), 15
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7256
guard.sparkno = S7262
sparkxy = -10,-20+(P2StateType = C)*30
hitsound = S5,22
guardsound = S6,1
ground.type = High
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
guard.velocity = -13.75-(Root,fvar(29)=4&&Root,var(52)>0)*2.25
air.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 27+12+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15
sprpriority = 4
palfx.time = 60
palfx.add = 128,128,128
palfx.mul = 200,200,200
palfx.sinadd = 128,128,128,3
palfx.color = 255

[State 1710, Guard Crush Calculation]
type = ParentVarAdd
trigger1 = MoveGuarded = 1
fvar(23) = 600

[State -2, グラビティスマッシュ、ヒットエフェクト]
type = Helper
triggerall = NumHelper(1795) = 0
triggerall = NumTarget(1700)
triggerall = Target,MoveType = H
trigger1 = MoveHit
ID = 1795
helpertype = normal
name = "gravityhit"
pos = 0,0
postype = p2
facing = 1
stateno = 1795
keyctrl = 0
ownpal = 1

[State 1730, destroyself]
type = DestroySelf
trigger1 = Parent,MoveType = H
trigger2 = !(Parent,StateNo = 1720 || Parent,StateNo = 1701)
ignorehitpause = 1

[State 1730, end]
type = ChangeState
trigger1 = Parent,StateNo = 1701
value = 1731


[Statedef 1731]
movetype = A
anim = 8131
ctrl = 0
sprpriority = 4
velset = 10,0

[State 1711, ishelper]
type = SelfState
trigger1 = !IsHelper
value = 0
ctrl = 1

[State 1711, assert for helper]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noautoturn

[State 1711, bind]
type = BindToParent
trigger1 = time = 0
time = 1
facing = 1
pos = 0,-80

[State -2, EnemyNear]
type = VarSet
trigger1 = NumEnemy = 1
trigger2 = NumEnemy = 2
trigger2 = EnemyNear(0),Life > 0
var(2) = 0
ignorehitpause = 1

[State -2, EnemyNear]
type = VarSet
trigger1 = NumEnemy = 2
trigger1 = EnemyNear(0),Life <= 0
var(2) = 1
ignorehitpause = 1

[State -2]
type = PowerAdd
trigger1 = MoveContact = 1
value = IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,110)
ignorehitpause = 1

[State -2]
type = ParentVarSet
triggerall = !Root,var(49)
trigger1 = MoveHit
trigger1 = EnemyNear(var(2)),MoveType = H
var(9) = 1
ignorehitpause = 1

[State -2, カウンターヒット判定]
type = VarSet
triggerall = !var(48)
trigger1 = EnemyNear(var(2)),MoveType = A
var(48) = 1

[State -2, カウンターヒット判定]
type = VarAdd
trigger1 = var(48)
var(48) = 1

[State -2, カウンターヒット判定]
type = VarSet
trigger1 = var(48) > 10
trigger1 = EnemyNear(var(2)),MoveType != A && ProjHit = 0
var(48) = 0

[State -2, カウンターヒット・ダメージ]
type = TargetLifeAdd
triggerall = var(48)
trigger1 = NumTarget
trigger1 = MoveHit
value = -Ceil(Target,GetHitVar(damage)*0.25)
absolute = 1
ignorehitpause = 1

[State -2]
type = VarSet
triggerall = !(var(9) || Parent,var(49))
trigger1 = MoveHit
trigger1 = EnemyNear(var(2)),MoveType = H
trigger2 = Time = 0
trigger2 = Root,var(9)
var(9) = 1
ignorehitpause = 1

[State -2]
type = VarSet
triggerall = var(9)
trigger1 = EnemyNear(var(2)),Life > 0 && EnemyNear(var(2)),Ctrl
trigger2 = Root,var(49) = [1,2]
trigger3 = !(EnemyNear(var(2)),MoveType = H)
trigger4 = EnemyNear(var(2)),StateType = L
trigger5 = EnemyNear(var(2)),StateNo = 5120
var(9) = 0
ignorehitpause = 1

[State -2, hitcount]
type = VarAdd
trigger1 = MoveContact = 1
trigger1 = EnemyNear(var(2)),MoveType = H
var(1) = 1
ignorehitpause = 1

[State -2]
type = VarSet
trigger1 = Floor(20*0.5**var(1))-1 >= 1
fvar(24) = Floor(20*0.5**var(1))-1 
ignorehitpause = 1

[State -2]
type = VarSet
trigger1 = Floor(20*0.5**var(1))-1 < 1
fvar(24) = 1
ignorehitpause = 1

[State 1711]
type = HitDef
triggerall = !var(9)
triggerall = !Root,var(52)
triggerall = Root,fvar(26) != 1
trigger1 = 1
attr = S,SP
hitflag = MAF
guardflag = M
animtype = Back
ID = 1700
priority = 7,hit
damage = Ceil(fvar(24)*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(IfElse(var(1)>0,1,2)*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7206
guard.sparkno = S7212
sparkxy = -10,-20
hitsound = S5,22
guardsound = S6,1
ground.type = High
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
guard.velocity = -13.75-(Root,fvar(29)=4&&Root,var(52)>0)*2.25
air.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 27+12+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15
sprpriority = 4
palfx.time = 60
palfx.add = 128,128,128
palfx.mul = 200,200,200
palfx.sinadd = 128,128,128,3
palfx.color = 255

[State 1711]
type = HitDef
triggerall = !var(9)
triggerall = Root,var(52)
triggerall = Root,fvar(26) != 1
trigger1 = 1
attr = S,SP
hitflag = MAF
guardflag = M
animtype = Up
ID = 1700
priority = 7,hit
damage = 100 * fvar(39), 15
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7206
guard.sparkno = S7212
sparkxy = -10,-20
hitsound = S5,22
guardsound = S6,1
ground.type = High
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
guard.velocity = -13.75-(Root,fvar(29)=4&&Root,var(52)>0)*2.25
air.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 27+12+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15
sprpriority = 4
palfx.time = 60
palfx.add = 128,128,128
palfx.mul = 200,200,200
palfx.sinadd = 128,128,128,3
palfx.color = 255


[State 1711  02UM]
type = HitDef
triggerall = !var(9)
triggerall = Root,fvar(26) = 1
trigger1 = 1
attr = S,SP
hitflag = MAF
guardflag = M
animtype = Up
ID = 1700
priority = 7,hit
damage = 110 * root,fvar(39), 15
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7256
guard.sparkno = S7262
sparkxy = -10,-20
hitsound = S5,22
guardsound = S6,1
ground.type = High
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
guard.velocity = -13.75-(Root,fvar(29)=4&&Root,var(52)>0)*2.25
air.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 27+12+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15
sprpriority = 4
palfx.time = 60
palfx.add = 128,128,128
palfx.mul = 200,200,200
palfx.sinadd = 128,128,128,3
palfx.color = 255

[State 1710, Guard Crush Calculation]
type = ParentVarAdd
triggerall = root,fvar(26) = 1
trigger1 = MoveGuarded = 1
fvar(23) = 1200

[State -2, グラビティスマッシュ、ヒットエフェクト]
type = Helper
triggerall = NumHelper(1795) = 0
triggerall = NumTarget(1700)
triggerall = Target,MoveType = H
trigger1 = MoveHit
ID = 1795
helpertype = normal
name = "gravityhit"
pos = 0,0
postype = p2
facing = 1
stateno = 1795
keyctrl = 0
ownpal = 1

[State 1711, anim]
type = ChangeAnim
trigger1 = time = 12
value = 8132

[State 1710 ,projID]
type = VarSet
triggerall = Time = 12
trigger1 = !Parent,NumProjID(1700)
trigger2 = Parent,NumProjID(1701)
var(10) = 1700

[State 1710 ,projID]
type = VarSet
triggerall = Time = 12
trigger1 = Parent,NumProjID(1700)
var(10) = 1701

[State 1700]
type = Projectile
trigger1 = time = 12
trigger2 = Parent,NumProjID(var(10)) = 1
attr = S,SP
hitflag = MAFP
projID = var(10)
projanim = 8137
projremanim = -1
projremove = 1
projremovetime = 1
offset = 0,0
postype = p1
velocity = 10,0
projpriority = 7
projsprpriority = 3
projheightboud = -500,0

[State 1711, destory]
type = Explod
trigger1 = Anim = 8132
trigger1 = Parent,NumProjID(var(10)) = 0
trigger2 = Time >= 12
trigger2 = MoveContact = 1
trigger2 = P2MoveType = H
ID = 8133
anim = 8133
pos = 0,0
postype = p1
sprpriority = 4
ownpal = 1
removetime = -2

[State 1711, destroy]
type = DestroySelf
trigger1 = Anim = 8132
trigger1 = Parent,NumProjID(var(10)) = 0
trigger2 = (MoveHit = 1 && Time >= 6) || MoveGuarded = 1
trigger3 = !(Parent,StateNo = 1720 || Parent,StateNo = 1701)
trigger3 = Time < 12
trigger4 = FrontEdgeBodyDist < -70


;相殺用ヘルパー
[Statedef 1735]
physics = N
anim = 8135
ctrl = 0
sprpriority = 4

[State 1715]
type = SelfState
trigger1 = !IsHelper
value = 0
ctrl = 1

[State 1715]
type = BindToParent
trigger1 = 1
pos = 0,-80
facing = 1
time = 1

[State 1715]
type = HitBy
trigger1 = 1
value = SCA,AP
time = 1
ignorehitpause = 1

[State 1710,ID]
type = VarSet
triggerall = !var(29)
trigger1 = Time = 0
var(29) = Root,var(29)+1
persistent = 0

[State 1715]
type = HitOverRide
trigger1 = 1
attr = SCA,AP
stateno = 1735
ignorehitpause = 1

[State 1715]
type = DestroySelf
trigger1 = NumHelper(1730+var(29)-1) = 0
trigger2 = Parent,MoveType = H
ignorehitpause = 1

[State 1715]
type = ChangeState
trigger1 = Parent,StateNo = 1701
value = 1736
ignorehitpause = 1

[Statedef 1736]
type = S
anim = 8136
ctrl = 0
sprpriority = 4
velset = 10,0

[State 1716]
type = SelfState
trigger1 = !IsHelper
value = 0
ctrl = 1

[State 1716]
type = HitBy
trigger1 = 1
value = SCA,AP
time = 1
ignorehitpause = 1

[State 1716]
type = HitOverRide
trigger1 = 1
attr = SCA,AP
stateno = 1736
ignorehitpause = 1

[State 1716]
type = DestroySelf
trigger1 = NumHelper(1730+var(29)-1) = 0
trigger2 = time >= 12


;=================================================================
;空中グラビティスマッシュX
[Statedef 1750]
type = A
movetype = A
physics = N
anim = 1750
ctrl = 0
velset = 0,0
sprpriority = 2
poweradd = IfElse(((var(52)&&fvar(29)=1)||fvar(34)=2),0,125)

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State 1700, playsnd]
type = PlaySnd
triggerall = fvar(29) = [4,6]
trigger1 = Time = 0
value = S2,6
volume = 150
channel = 8

[State 1700, playsnd]
type = PlaySnd
triggerall = fvar(29) = [1,3]
trigger1 = Time = 0
value = S10,66
volume = 150
channel = 8

[State 1750, playsnd]
type = PlaySnd
trigger1 = Time = 0
value = S3,8
channel = 9

[State 1750, ID決定]
type = VarSet
triggerall = Time = 0
trigger1 = !NumHelper(1760)
trigger2 = NumHelper(1761)
var(29) = 0

[State 1750, ID決定]
type = VarSet
triggerall = Time = 0
trigger1 = NumHelper(1760)
var(29) = 1

[State 1750, 攻撃用]
type = Helper
trigger1 = AnimElem = 1
helpertype = normal
ID = 1760+var(29)
stateno = 1760
pos = -8,-92
postype = p1
facing = 1
keyctrl = 0
ownpal = 1

[State 1750, 相殺用]
type = Helper
trigger1 = AnimElem = 3, = 2
helpertype = normal
ID = 1765+var(29)
stateno = 1765
pos = -8,-92
postype = p1
facing = 1
keyctrl = 0
ownpal = 1

[State 1750, end]
type = ChangeState
trigger1 = Time >= 102
Value = 1751

[State 1750, end]
type = ChangeState
triggerall = var(59) = 0
triggerall = Time >= 11
trigger1 = !(Command = "holdx")
Value = 1751


[Statedef 1751]
type = A
movetype = A
physics = N
anim = 1751
ctrl = 0
velset = 0,0
sprpriority = 2

[State 1751, stopsnd]
type = StopSnd
trigger1 = Time = 0
channel = 8

[State 1751, stopsnd]
type = StopSnd
trigger1 = Time = 0
channel = 9

[State 1701, playsnd]
type = PlaySnd
triggerall = fvar(29) = [4,6]
trigger1 = Time = 0
value = S2,7
volume = 150

[State 1701, playsnd]
type = PlaySnd
triggerall = fvar(29) = [1,3]
trigger1 = Time = 0
value = S1,51
volume = 150

[State 1751, playsnd]
type = PlaySnd
trigger1 = Time = 0
value = S3,9
volume = 150

[State 1751, statetypeset]
type = StateTypeSet
trigger1 = AnimElem = 6
physics = A

[State 1751, end]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 52


;空中グラビティスマッシュX・気弾本体
[Statedef 1760]
physics = N
movetype = A
anim = 8130
ctrl = 0
sprpriority = 4

[State 1760, ishelper]
type = SelfState
trigger1 = !IsHelper
value = 0
ctrl = 1

[State 1760, assert for helper]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noautoturn

[State 1760, bind]
type = BindToParent
trigger1 = Parent,StateNo = 1750
time = 1
facing = 1
pos = -8,-92

[State -2, EnemyNear]
type = VarSet
trigger1 = NumEnemy = 1
trigger2 = NumEnemy = 2
trigger2 = EnemyNear(0),Life > 0
var(2) = 0
ignorehitpause = 1

[State -2, EnemyNear]
type = VarSet
trigger1 = NumEnemy = 2
trigger1 = EnemyNear(0),Life <= 0
var(2) = 1
ignorehitpause = 1

[State -2]
type = PowerAdd
trigger1 = MoveContact = 1
value = IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,110)
ignorehitpause = 1

[State -2]
type = ParentVarSet
triggerall = !Root,var(49)
trigger1 = MoveHit
trigger1 = EnemyNear(var(2)),MoveType = H
var(9) = 1
ignorehitpause = 1

[State -2, カウンターヒット判定]
type = VarSet
triggerall = !var(48)
trigger1 = EnemyNear(var(2)),MoveType = A
var(48) = 1

[State -2, カウンターヒット判定]
type = VarAdd
trigger1 = var(48)
var(48) = 1

[State -2, カウンターヒット判定]
type = VarSet
trigger1 = var(48) > 10
trigger1 = EnemyNear(var(2)),MoveType != A && ProjHit = 0
var(48) = 0

[State -2, カウンターヒット・ダメージ]
type = TargetLifeAdd
triggerall = var(48)
trigger1 = NumTarget
trigger1 = MoveHit
value = -Ceil(Target,GetHitVar(damage)*0.25)
absolute = 1
ignorehitpause = 1

[State -2]
type = VarSet
triggerall = !(var(9) || Parent,var(49))
trigger1 = MoveHit = 1
trigger1 = EnemyNear(var(2)),MoveType = H
trigger2 = Time = 0
trigger2 = Root,var(9)
var(9) = 1
ignorehitpause = 1

[State -2]
type = VarSet
triggerall = var(9)
trigger1 = EnemyNear(var(2)),Life > 0 && EnemyNear(var(2)),Ctrl
trigger2 = Root,var(49) = [1,2]
trigger3 = !(EnemyNear(var(2)),MoveType = H)
trigger4 = EnemyNear(var(2)),StateType = L
trigger5 = EnemyNear(var(2)),StateNo = 5120
var(9) = 0
ignorehitpause = 1

[State -2, hitcount]
type = VarAdd
trigger1 = MoveContact = 1
trigger1 = EnemyNear(var(2)),MoveType = H
var(1) = 1
ignorehitpause = 1

[State -2]
type = VarSet
trigger1 = Floor(20*0.5**var(1))-1 >= 1
fvar(24) = Floor(20*0.5**var(1))-1 
ignorehitpause = 1

[State -2]
type = VarSet
trigger1 = Floor(20*0.5**var(1))-1 < 1
fvar(24) = 1
ignorehitpause = 1

[State 1760, hitdef]
type = HitDef
triggerall = !var(9)
triggerall = !Root,var(52)
triggerall = Root,fvar(26) != 1
trigger1 = time%17 = 0
attr = A,SP
hitflag = MAF
guardflag = M
animtype = Back
ID = 1700
priority = 7,hit
damage = Ceil(fvar(24)*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(IfElse(var(1)>0,1,2)*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7206
guard.sparkno = S7212
sparkxy = -10,-20
hitsound = S5,22
guardsound = S6,1
ground.type = High
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
guard.velocity = -13.75-(Root,fvar(29)=4&&Root,var(52)>0)*2.25
air.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 27+12+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15
sprpriority = 4
palfx.time = 60
palfx.add = 128,128,128
palfx.mul = 200,200,200
palfx.sinadd = 128,128,128,3
palfx.color = 255

[State 1760, hitdef]
type = HitDef
triggerall = !var(9)
triggerall = Root,var(52)
triggerall = Root,fvar(26) != 1
trigger1 = time%17 = 0
attr = A,SP
hitflag = MAF
guardflag = M
animtype = Up
ID = 1700
priority = 7,hit
damage = Ceil(fvar(24)*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(IfElse(var(1)>0,1,2)*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7206
guard.sparkno = S7212
sparkxy = -10,-20+(P2StateType = C)*30
hitsound = S5,22
guardsound = S6,1
ground.type = High
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
guard.velocity = -13.75-(Root,fvar(29)=4&&Root,var(52)>0)*2.25
air.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 27+12+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15
sprpriority = 4
palfx.time = 60
palfx.add = 128,128,128
palfx.mul = 200,200,200
palfx.sinadd = 128,128,128,3
palfx.color = 255


[State 1760, hitdef 02um]
type = HitDef
triggerall = !var(9)
triggerall = Root,fvar(26) = 1
trigger1 = time%17 = 0
attr = A,SP
hitflag = MAF
guardflag = M
animtype = Up
ID = 1700
priority = 7,hit
damage = 80 * root,fvar(39), 15
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7256
guard.sparkno = S7262
sparkxy = -10,-20+(P2StateType = C)*30
hitsound = S5,22
guardsound = S6,1
ground.type = High
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
guard.velocity = -13.75-(Root,fvar(29)=4&&Root,var(52)>0)*2.25
air.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 27+12+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15
sprpriority = 4
palfx.time = 60
palfx.add = 128,128,128
palfx.mul = 200,200,200
palfx.sinadd = 128,128,128,3
palfx.color = 255

[State 1710, Guard Crush Calculation]
type = ParentVarAdd
trigger1 = MoveGuarded = 1
fvar(23) = 600

[State -2, グラビティスマッシュ、ヒットエフェクト]
type = Helper
triggerall = NumHelper(1795) = 0
triggerall = NumTarget(1700)
triggerall = Target,MoveType = H
trigger1 = MoveHit
ID = 1795
helpertype = normal
name = "gravityhit"
pos = 0,0
postype = p2
facing = 1
stateno = 1795
keyctrl = 0
ownpal = 1

[State 1760, destroyself]
type = DestroySelf
trigger1 = Parent,MoveType = H
trigger2 = !(Parent,StateNo = 1750 || Parent,StateNo = 1751)
ignorehitpause = 1

[State 1760, end]
type = ChangeState
trigger1 = Parent,StateNo = 1751
value = 1761


[Statedef 1761]
physics = N
movetype = A
anim = 8140
ctrl = 0
sprpriority = 4
velset = 0,0

[State 1761, anim]
type = ChangeAnim
trigger1 = time = 7
value = 8141

[State 1761, velset]
type = VelSet
trigger1 = time = 7
x = 5.8
y = 3.9

[State 1761, ishelper]
type = SelfState
trigger1 = !IsHelper
value = 0
ctrl = 1

[State 1761, assert for helper]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noautoturn

[State 1761, bind]
type = BindToParent
trigger1 = time < 7
time = 1
facing = 1
pos = -8,-92

[State -2, EnemyNear]
type = VarSet
trigger1 = NumEnemy = 1
trigger2 = NumEnemy = 2
trigger2 = EnemyNear(0),Life > 0
var(2) = 0
ignorehitpause = 1

[State -2, EnemyNear]
type = VarSet
trigger1 = NumEnemy = 2
trigger1 = EnemyNear(0),Life <= 0
var(2) = 1
ignorehitpause = 1

[State -2]
type = PowerAdd
trigger1 = MoveContact = 1
value = 100
ignorehitpause = 1

[State -2]
type = ParentVarSet
triggerall = !Root,var(49)
trigger1 = MoveHit
trigger1 = EnemyNear(var(2)),MoveType = H
var(9) = 1
ignorehitpause = 1

[State -2, カウンターヒット判定]
type = VarSet
triggerall = !var(48)
trigger1 = EnemyNear(var(2)),MoveType = A
var(48) = 1

[State -2, カウンターヒット判定]
type = VarAdd
trigger1 = var(48)
var(48) = 1

[State -2, カウンターヒット判定]
type = VarSet
trigger1 = var(48) > 10
trigger1 = EnemyNear(var(2)),MoveType != A && ProjHit = 0
var(48) = 0

[State -2, カウンターヒット・ダメージ]
type = TargetLifeAdd
triggerall = var(48)
trigger1 = NumTarget
trigger1 = MoveHit
value = -Ceil(Target,GetHitVar(damage)*0.25)
absolute = 1
ignorehitpause = 1

[State -2]
type = VarSet
triggerall = !(var(9) || Parent,var(49))
trigger1 = MoveHit
trigger1 = EnemyNear(var(2)),MoveType = H
trigger2 = Time = 0
trigger2 = Root,var(9)
var(9) = 1
ignorehitpause = 1

[State -2]
type = VarSet
triggerall = var(9)
trigger1 = EnemyNear(var(2)),Life > 0 && EnemyNear(var(2)),Ctrl
trigger2 = Root,var(49) = [1,2]
trigger3 = !(EnemyNear(var(2)),MoveType = H)
trigger4 = EnemyNear(var(2)),StateType = L
trigger5 = EnemyNear(var(2)),StateNo = 5120
var(9) = 0
ignorehitpause = 1

[State -2, hitcount]
type = VarAdd
trigger1 = MoveContact = 1
trigger1 = EnemyNear(var(2)),MoveType = H
var(1) = 1
ignorehitpause = 1

[State -2]
type = VarSet
trigger1 = Floor(20*0.5**var(1))-1 >= 1
fvar(24) = Floor(20*0.5**var(1))-1 
ignorehitpause = 1

[State -2]
type = VarSet
trigger1 = Floor(20*0.5**var(1))-1 < 1
fvar(24) = 1
ignorehitpause = 1

[State 1761, hitdef]
type = HitDef
triggerall = !var(9)
triggerall = !Root,var(52)
triggerall = Root,fvar(26) != 1
trigger1 = 1
attr = A,SP
hitflag = MAF
guardflag = M
animtype = Back
ID = 1700
priority = 7,hit
damage = Ceil(fvar(24)*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(IfElse(var(1)>0,1,2)*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7206
guard.sparkno = S7212
sparkxy = -10,-20
hitsound = S5,22
guardsound = S6,1
ground.type = High
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
guard.velocity = -13.75-(Root,fvar(29)=4&&Root,var(52)>0)*2.25
air.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 27+12+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15
sprpriority = 4
palfx.time = 60
palfx.add = 128,128,128
palfx.mul = 200,200,200
palfx.sinadd = 128,128,128,3
palfx.color = 255

[State 1761, hitdef]
type = HitDef
triggerall = !var(9)
triggerall = Root,var(52)
triggerall = Root,fvar(26) != 1
trigger1 = 1
attr = A,SP
hitflag = MAF
guardflag = M
animtype = Up
ID = 1700
priority = 7,hit
damage = Ceil(fvar(24)*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(IfElse(var(1)>0,1,2)*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7206
guard.sparkno = S7212
sparkxy = -10,-20
hitsound = S5,22
guardsound = S6,1
ground.type = High
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
guard.velocity = -13.75-(Root,fvar(29)=4&&Root,var(52)>0)*2.25
air.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 27+12+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15
sprpriority = 4
palfx.time = 60
palfx.add = 128,128,128
palfx.mul = 200,200,200
palfx.sinadd = 128,128,128,3
palfx.color = 255

[State 1761, hitdef 02um]
type = HitDef
triggerall = !var(9)
triggerall = Root,fvar(26) = 1
trigger1 = 1
attr = A,SP
hitflag = MAF
guardflag = M
animtype = Up
ID = 1700
priority = 7,hit
damage = 110 * root,fvar(39), 15
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7256
guard.sparkno = S7262
sparkxy = -10,-20
hitsound = S5,22
guardsound = S6,1
ground.type = High
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
guard.velocity = -13.75-(Root,fvar(29)=4&&Root,var(52)>0)*2.25
air.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 27+12+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15
sprpriority = 4
palfx.time = 60
palfx.add = 128,128,128
palfx.mul = 200,200,200
palfx.sinadd = 128,128,128,3
palfx.color = 255

[State 1710, Guard Crush Calculation]
type = ParentVarAdd
triggerall = root,fvar(26) = 1
trigger1 = MoveGuarded = 1
fvar(23) = 1200

[State -2, グラビティスマッシュ、ヒットエフェクト]
type = Helper
triggerall = NumHelper(1795) = 0
triggerall = NumTarget(1700)
triggerall = Target,MoveType = H
trigger1 = MoveHit
ID = 1795
helpertype = normal
name = "gravityhit"
pos = 0,0
postype = p2
facing = 1
stateno = 1795
keyctrl = 0
ownpal = 1

[State 1761, anim]
type = ChangeAnim
trigger1 = time = 16
value = 8132

[State 1761 ,projID]
type = VarSet
triggerall = Time = 16
trigger1 = !Parent,NumProjID(1700)
trigger2 = Parent,NumProjID(1701)
var(10) = 1700

[State 1761 ,projID]
type = VarSet
triggerall = Time = 16
trigger1 = Parent,NumProjID(1700)
var(10) = 1701

[State 1761, proj]
type = Projectile
trigger1 = time = 16
trigger2 = Parent,NumProjID(var(10)) = 1
attr = S,SP
hitflag = MAFP
projID = var(10)
projanim = 8137
projremanim = -1
projremove = 1
projremovetime = 1
offset = 0,0
postype = p1
velocity = 5.8,3.9
projpriority = 7
projsprpriority = 3
projheightboud = -500,0

[State 1761, destory]
type = Explod
trigger1 = Anim = 8132
trigger1 = Parent,NumProjID(var(10)) = 0
trigger2 = MoveContact = 1
trigger2 = P2MoveType = H
trigger3 = Pos Y >= 0
ID = 8133
anim = 8133
pos = 0,0
postype = p1
sprpriority = 4
ownpal = 1
removetime = -2

[State 1761, destroy]
type = DestroySelf
trigger1 = Anim = 8132
trigger1 = Parent,NumProjID(var(10)) = 0
trigger2 = MoveContact = 1
trigger3 = Pos Y >= 0
trigger4 = !(Parent,StateNo = 1750 || Parent,StateNo = 1751)
trigger4 = Time < 16
trigger5 = FrontEdgeBodyDist < -70


;相殺用ヘルパー
[Statedef 1765]
physics = N
anim = 8135
ctrl = 0
sprpriority = 4

[State 1765]
type = SelfState
trigger1 = !IsHelper
value = 0
ctrl = 1

[State 1765]
type = BindToParent
trigger1 = 1
pos = -8,-92
facing = 1
time = 1

[State 1765]
type = HitBy
trigger1 = 1
value = SCA,AP
time = 1
ignorehitpause = 1

[State 1765,ID]
type = VarSet
triggerall = !var(29)
trigger1 = Time = 0
var(29) = Root,var(29)+1
persistent = 0

[State 1765]
type = HitOverRide
trigger1 = 1
attr = SCA,AP
stateno = 1765
ignorehitpause = 1

[State 1765]
type = DestroySelf
trigger1 = NumHelper(1760+var(29)-1) = 0
trigger2 = Parent,MoveType = H
ignorehitpause = 1

[State 1765]
type = ChangeState
trigger1 = Parent,StateNo = 1751
value = 1766
ignorehitpause = 1

[Statedef 1766]
physics = N
anim = 8135
ctrl = 0
sprpriority = 4
velset = 0,0

[State 1766]
type = ChangeAnim
trigger1 = time = 7
value = 8136

[State 1766]
type = BindToParent
trigger1 = time < 7
pos = -8,-92
facing = 1
time = 1

[State 1766, velset]
type = VelSet
trigger1 = time = 7
x = 5.8
y = 3.9

[State 1766]
type = SelfState
trigger1 = !IsHelper
value = 0
ctrl = 1

[State 1766]
type = HitBy
trigger1 = 1
value = SCA,AP
time = 1
ignorehitpause = 1

[State 1766]
type = HitOverRide
trigger1 = 1
attr = SCA,AP
stateno = 1766
ignorehitpause = 1

[State 1766]
type = DestroySelf
trigger1 = NumHelper(1760+var(29)-1) = 0
trigger2 = time >= 16



;=================================================================
;空中グラビティスマッシュY
[Statedef 1770]
type = A
movetype = A
physics = N
anim = 1750
ctrl = 0
velset = 0,0
sprpriority = 2
poweradd = IfElse(((var(52)&&fvar(29)=1)||fvar(34)=2),0,125)

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State 1700, playsnd]
type = PlaySnd
triggerall = fvar(29) = [4,6]
trigger1 = Time = 0
value = S2,6
volume = 150
channel = 8

[State 1700, playsnd]
type = PlaySnd
triggerall = fvar(29) = [1,3]
trigger1 = Time = 0
value = S10,66
volume = 150
channel = 8

[State 1750, playsnd]
type = PlaySnd
trigger1 = Time = 0
value = S3,8
channel = 9

[State 1750, ID決定]
type = VarSet
triggerall = Time = 0
trigger1 = !NumHelper(1780)
trigger2 = NumHelper(1781)
var(29) = 0

[State 1750, ID決定]
type = VarSet
triggerall = Time = 0
trigger1 = NumHelper(1780)
var(29) = 1

[State 1750, 攻撃用]
type = Helper
trigger1 = AnimElem = 1
helpertype = normal
ID = 1780+var(29)
stateno = 1780
pos = -8,-92
postype = p1
facing = 1
keyctrl = 0
ownpal = 1

[State 1750, 相殺用]
type = Helper
trigger1 = AnimElem = 3, = 2
helpertype = normal
ID = 1785+var(29)
stateno = 1785
pos = -8,-92
postype = p1
facing = 1
keyctrl = 0
ownpal = 1

[State 1750, end]
type = ChangeState
trigger1 = Time >= 102
trigger2 = Time >= 11
trigger2 = !(Command = "holdy")
Value = 1751


;空中グラビティスマッシュY・気弾本体
[Statedef 1780]
physics = N
movetype = A
anim = 8130
ctrl = 0
sprpriority = 4

[State 1760, ishelper]
type = SelfState
trigger1 = !IsHelper
value = 0
ctrl = 1

[State 1760, assert for helper]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noautoturn

[State 1760, bind]
type = BindToParent
trigger1 = Parent,StateNo = 1770
time = 1
facing = 1
pos = -8,-92

[State -2, EnemyNear]
type = VarSet
trigger1 = NumEnemy = 1
trigger2 = NumEnemy = 2
trigger2 = EnemyNear(0),Life > 0
var(2) = 0
ignorehitpause = 1

[State -2, EnemyNear]
type = VarSet
trigger1 = NumEnemy = 2
trigger1 = EnemyNear(0),Life <= 0
var(2) = 1
ignorehitpause = 1

[State -2]
type = PowerAdd
trigger1 = MoveContact = 1
value = IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,110)
ignorehitpause = 1

[State -2]
type = ParentVarSet
triggerall = !Root,var(49)
trigger1 = MoveHit
trigger1 = EnemyNear(var(2)),MoveType = H
var(9) = 1
ignorehitpause = 1

[State -2, カウンターヒット判定]
type = VarSet
triggerall = !var(48)
trigger1 = EnemyNear(var(2)),MoveType = A
var(48) = 1

[State -2, カウンターヒット判定]
type = VarAdd
trigger1 = var(48)
var(48) = 1

[State -2, カウンターヒット判定]
type = VarSet
trigger1 = var(48) > 10
trigger1 = EnemyNear(var(2)),MoveType != A && ProjHit = 0
var(48) = 0

[State -2, カウンターヒット・ダメージ]
type = TargetLifeAdd
triggerall = var(48)
trigger1 = NumTarget
trigger1 = MoveHit
value = -Ceil(Target,GetHitVar(damage)*0.25)
absolute = 1
ignorehitpause = 1

[State -2]
type = VarSet
triggerall = !(var(9) || Parent,var(49))
trigger1 = MoveHit = 1
trigger1 = EnemyNear(var(2)),MoveType = H
trigger2 = Time = 0
trigger2 = Root,var(9)
var(9) = 1
ignorehitpause = 1

[State -2]
type = VarSet
triggerall = var(9)
trigger1 = EnemyNear(var(2)),Life > 0 && EnemyNear(var(2)),Ctrl
trigger2 = Root,var(49) = [1,2]
trigger3 = !(EnemyNear(var(2)),MoveType = H)
trigger4 = EnemyNear(var(2)),StateType = L
trigger5 = EnemyNear(var(2)),StateNo = 5120
var(9) = 0
ignorehitpause = 1

[State -2, hitcount]
type = VarAdd
trigger1 = MoveContact = 1
trigger1 = EnemyNear(var(2)),MoveType = H
var(1) = 1
ignorehitpause = 1

[State -2]
type = VarSet
trigger1 = Floor(20*0.5**var(1))-1 >= 1
fvar(24) = Floor(20*0.5**var(1))-1 
ignorehitpause = 1

[State -2]
type = VarSet
trigger1 = Floor(20*0.5**var(1))-1 < 1
fvar(24) = 1
ignorehitpause = 1

[State 1760, hitdef]
type = HitDef
triggerall = !var(9)
triggerall = !Root,var(52)
triggerall = Root,fvar(26) != 1
trigger1 = time%17 = 0
attr = A,SP
hitflag = MAF
guardflag = M
animtype = Back
ID = 1700
priority = 7,hit
damage = Ceil(fvar(24)*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(IfElse(var(1)>0,1,2)*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7206
guard.sparkno = S7212
sparkxy = -10,-20
hitsound = S5,22
guardsound = S6,1
ground.type = High
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
guard.velocity = -13.75-(Root,fvar(29)=4&&Root,var(52)>0)*2.25
air.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 27+12+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15
sprpriority = 4
palfx.time = 60
palfx.add = 128,128,128
palfx.mul = 200,200,200
palfx.sinadd = 128,128,128,3
palfx.color = 255

[State 1760, hitdef]
type = HitDef
triggerall = !var(9)
triggerall = Root,var(52)
triggerall = Root,fvar(26) != 1
trigger1 = time%17 = 0
attr = A,SP
hitflag = MAF
guardflag = M
animtype = Up
ID = 1700
priority = 7,hit
damage = Ceil(fvar(24)*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(IfElse(var(1)>0,1,2)*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7206
guard.sparkno = S7212
sparkxy = -10,-20+(P2StateType = C)*30
hitsound = S5,22
guardsound = S6,1
ground.type = High
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
guard.velocity = -13.75-(Root,fvar(29)=4&&Root,var(52)>0)*2.25
air.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 27+12+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15
sprpriority = 4
palfx.time = 60
palfx.add = 128,128,128
palfx.mul = 200,200,200
palfx.sinadd = 128,128,128,3
palfx.color = 255

[State 1760, hitdef 02um]
type = HitDef
triggerall = !var(9)
triggerall = Root,fvar(26) = 1
trigger1 = time%17 = 0
attr = A,SP
hitflag = MAF
guardflag = M
animtype = Up
ID = 1700
priority = 7,hit
damage = 80 * root,fvar(39), 15
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7256
guard.sparkno = S7262
sparkxy = -10,-20+(P2StateType = C)*30
hitsound = S5,22
guardsound = S6,1
ground.type = High
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
guard.velocity = -13.75-(Root,fvar(29)=4&&Root,var(52)>0)*2.25
air.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 27+12+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15
sprpriority = 4
palfx.time = 60
palfx.add = 128,128,128
palfx.mul = 200,200,200
palfx.sinadd = 128,128,128,3
palfx.color = 255

[State 1710, Guard Crush Calculation]
type = ParentVarAdd
trigger1 = MoveGuarded = 1
fvar(23) = 600

[State -2, グラビティスマッシュ、ヒットエフェクト]
type = Helper
triggerall = NumHelper(1795) = 0
triggerall = NumTarget(1700)
triggerall = Target,MoveType = H
trigger1 = MoveHit
ID = 1795
helpertype = normal
name = "gravityhit"
pos = 0,0
postype = p2
facing = 1
stateno = 1795
keyctrl = 0
ownpal = 1

[State 1760, destroyself]
type = DestroySelf
trigger1 = Parent,MoveType = H
trigger2 = !(Parent,StateNo = 1770 || Parent,StateNo = 1751)
ignorehitpause = 1

[State 1760, end]
type = ChangeState
trigger1 = Parent,StateNo = 1751
value = 1781


[Statedef 1781]
physics = N
movetype = A
anim = 8140
ctrl = 0
sprpriority = 4
velset = 0,0

[State 1761, anim]
type = ChangeAnim
trigger1 = time = 7
value = 8141

[State 1761, velset]
type = VelSet
trigger1 = time = 7
x = 4.9
y = 5

[State 1761, ishelper]
type = SelfState
trigger1 = !IsHelper
value = 0
ctrl = 1

[State 1761, assert for helper]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noautoturn

[State 1761, bind]
type = BindToParent
trigger1 = time < 7
time = 1
facing = 1
pos = -8,-92

[State -2, EnemyNear]
type = VarSet
trigger1 = NumEnemy = 1
trigger2 = NumEnemy = 2
trigger2 = EnemyNear(0),Life > 0
var(2) = 0
ignorehitpause = 1

[State -2, EnemyNear]
type = VarSet
trigger1 = NumEnemy = 2
trigger1 = EnemyNear(0),Life <= 0
var(2) = 1
ignorehitpause = 1

[State -2]
type = PowerAdd
trigger1 = MoveContact = 1
value = 100
ignorehitpause = 1

[State -2]
type = ParentVarSet
triggerall = !Root,var(49)
trigger1 = MoveHit
trigger1 = EnemyNear(var(2)),MoveType = H
var(9) = 1
ignorehitpause = 1

[State -2, カウンターヒット判定]
type = VarSet
triggerall = !var(48)
trigger1 = EnemyNear(var(2)),MoveType = A
var(48) = 1

[State -2, カウンターヒット判定]
type = VarAdd
trigger1 = var(48)
var(48) = 1

[State -2, カウンターヒット判定]
type = VarSet
trigger1 = var(48) > 10
trigger1 = EnemyNear(var(2)),MoveType != A && ProjHit = 0
var(48) = 0

[State -2, カウンターヒット・ダメージ]
type = TargetLifeAdd
triggerall = var(48)
trigger1 = NumTarget
trigger1 = MoveHit
value = -Ceil(Target,GetHitVar(damage)*0.25)
absolute = 1
ignorehitpause = 1

[State -2]
type = VarSet
triggerall = !(var(9) || Parent,var(49))
trigger1 = MoveHit
trigger1 = EnemyNear(var(2)),MoveType = H
trigger2 = Time = 0
trigger2 = Root,var(9)
var(9) = 1
ignorehitpause = 1

[State -2]
type = VarSet
triggerall = var(9)
trigger1 = EnemyNear(var(2)),Life > 0 && EnemyNear(var(2)),Ctrl
trigger2 = Root,var(49) = [1,2]
trigger3 = !(EnemyNear(var(2)),MoveType = H)
trigger4 = EnemyNear(var(2)),StateType = L
trigger5 = EnemyNear(var(2)),StateNo = 5120
var(9) = 0
ignorehitpause = 1

[State -2, hitcount]
type = VarAdd
trigger1 = MoveContact = 1
trigger1 = EnemyNear(var(2)),MoveType = H
var(1) = 1
ignorehitpause = 1

[State -2]
type = VarSet
trigger1 = Floor(20*0.5**var(1))-1 >= 1
fvar(24) = Floor(20*0.5**var(1))-1 
ignorehitpause = 1

[State -2]
type = VarSet
trigger1 = Floor(20*0.5**var(1))-1 < 1
fvar(24) = 1
ignorehitpause = 1

[State 1761, hitdef]
type = HitDef
triggerall = !var(9)
triggerall = !Root,var(52)
triggerall = Root,fvar(26) != 1
trigger1 = 1
attr = A,SP
hitflag = MAF
guardflag = M
animtype = Back
ID = 1700
priority = 7,hit
damage = Ceil(fvar(24)*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(IfElse(var(1)>0,1,2)*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7206
guard.sparkno = S7212
sparkxy = -10,-20
hitsound = S5,22
guardsound = S6,1
ground.type = High
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
guard.velocity = -13.75-(Root,fvar(29)=4&&Root,var(52)>0)*2.25
air.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 27+12+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15
sprpriority = 4
palfx.time = 60
palfx.add = 128,128,128
palfx.mul = 200,200,200
palfx.sinadd = 128,128,128,3
palfx.color = 255

[State 1761, hitdef]
type = HitDef
triggerall = !var(9)
triggerall = Root,var(52)
triggerall = Root,fvar(26) != 1
trigger1 = 1
attr = A,SP
hitflag = MAF
guardflag = M
animtype = Up
ID = 1700
priority = 7,hit
damage = Ceil(fvar(24)*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(IfElse(var(1)>0,1,2)*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7206
guard.sparkno = S7212
sparkxy = -10,-20
hitsound = S5,22
guardsound = S6,1
ground.type = High
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
guard.velocity = -13.75-(Root,fvar(29)=4&&Root,var(52)>0)*2.25
air.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 27+12+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15
sprpriority = 4
palfx.time = 60
palfx.add = 128,128,128
palfx.mul = 200,200,200
palfx.sinadd = 128,128,128,3
palfx.color = 255


[State 1761, hitdef 02um]
type = HitDef
triggerall = !var(9)
triggerall = Root,fvar(26) = 1
trigger1 = 1
attr = A,SP
hitflag = MAF
guardflag = M
animtype = Up
ID = 1700
priority = 7,hit
damage = 110 * root,fvar(39), 15
pausetime = 0,12
guard.pausetime = 0,10
sparkno = S7256
guard.sparkno = S7262
sparkxy = -10,-20
hitsound = S5,22
guardsound = S6,1
ground.type = High
ground.slidetime = 17
ground.hittime = 17
guard.ctrltime = 17
air.hittime = 60
ground.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
guard.velocity = -13.75-(Root,fvar(29)=4&&Root,var(52)>0)*2.25
air.velocity = -4-(Root,fvar(29)=4&&Root,var(52)>0),-7.5
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 27+12+Ceil((-EnemyNear(var(2)),Pos Y)/10)
getpower = 0,0
givepower = 15,15
sprpriority = 4
palfx.time = 60
palfx.add = 128,128,128
palfx.mul = 200,200,200
palfx.sinadd = 128,128,128,3
palfx.color = 255

[State 1710, Guard Crush Calculation]
type = ParentVarAdd
triggerall = root,fvar(26) = 1
trigger1 = MoveGuarded = 1
fvar(23) = 1200

[State -2, グラビティスマッシュ、ヒットエフェクト]
type = Helper
triggerall = NumHelper(1795) = 0
triggerall = NumTarget(1700)
triggerall = Target,MoveType = H
trigger1 = MoveHit
ID = 1795
helpertype = normal
name = "gravityhit"
pos = 0,0
postype = p2
facing = 1
stateno = 1795
keyctrl = 0
ownpal = 1

[State 1761, anim]
type = ChangeAnim
trigger1 = time = 16
value = 8132

[State 1761 ,projID]
type = VarSet
triggerall = Time = 16
trigger1 = !Parent,NumProjID(1700)
trigger2 = Parent,NumProjID(1701)
var(10) = 1700

[State 1761 ,projID]
type = VarSet
triggerall = Time = 16
trigger1 = Parent,NumProjID(1700)
var(10) = 1701

[State 1761, proj]
type = Projectile
trigger1 = time = 16
trigger2 = Parent,NumProjID(var(10)) = 1
attr = S,SP
hitflag = MAFP
projID = var(10)
projanim = 8137
projremanim = -1
projremove = 1
projremovetime = 1
offset = 0,0
postype = p1
velocity = 4.9,5
projpriority = 7
projsprpriority = 3
projheightboud = -500,0

[State 1761, destory]
type = Explod
trigger1 = Anim = 8132
trigger1 = Parent,NumProjID(var(10)) = 0
trigger2 = MoveContact = 1
trigger2 = P2MoveType = H
trigger3 = Pos Y >= 0
ID = 8133
anim = 8133
pos = 0,0
postype = p1
sprpriority = 4
ownpal = 1
removetime = -2

[State 1761, destroy]
type = DestroySelf
trigger1 = Anim = 8132
trigger1 = Parent,NumProjID(var(10)) = 0
trigger2 = MoveContact = 1
trigger3 = Pos Y >= 0
trigger4 = !(Parent,StateNo = 1770 || Parent,StateNo = 1751)
trigger4 = Time < 16
trigger5 = FrontEdgeBodyDist < -70


;相殺用ヘルパー
[Statedef 1785]
physics = N
anim = 8135
ctrl = 0
sprpriority = 4

[State 1765]
type = SelfState
trigger1 = !IsHelper
value = 0
ctrl = 1

[State 1765]
type = BindToParent
trigger1 = 1
pos = -8,-92
facing = 1
time = 1

[State 1765]
type = HitBy
trigger1 = 1
value = SCA,AP
time = 1
ignorehitpause = 1

[State 1765,ID]
type = VarSet
triggerall = !var(29)
trigger1 = Time = 0
var(29) = Root,var(29)+1
persistent = 0

[State 1765]
type = HitOverRide
trigger1 = 1
attr = SCA,AP
stateno = 1785
ignorehitpause = 1

[State 1765]
type = DestroySelf
trigger1 = NumHelper(1780+var(29)-1) = 0
trigger2 = Parent,MoveType = H
ignorehitpause = 1

[State 1765]
type = ChangeState
trigger1 = Parent,StateNo = 1751
value = 1786
ignorehitpause = 1

[Statedef 1786]
physics = N
anim = 8135
ctrl = 0
sprpriority = 4
velset = 0,0

[State 1766]
type = ChangeAnim
trigger1 = time = 7
value = 8136

[State 1766]
type = BindToParent
trigger1 = time < 7
pos = -8,-92
facing = 1
time = 1

[State 1766, velset]
type = VelSet
trigger1 = time = 7
x = 4.9
y = 5

[State 1766]
type = SelfState
trigger1 = !IsHelper
value = 0
ctrl = 1

[State 1766]
type = HitBy
trigger1 = 1
value = SCA,AP
time = 1
ignorehitpause = 1

[State 1766]
type = HitOverRide
trigger1 = 1
attr = SCA,AP
stateno = 1786
ignorehitpause = 1

[State 1766]
type = DestroySelf
trigger1 = NumHelper(1780+var(29)-1) = 0
trigger2 = time >= 16


;ヒットエフェクト用ヘルパー
[Statedef 1795]
physics = N
anim = 9999
ctrl = 0
sprpriority = 4

[State 1795]
type = SelfState
trigger1 = !IsHelper
value = 0
ctrl = 1

[State 1795]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noautoturn

[State 1795]
type = PosSet
trigger1 = 1
x = floor(EnemyNear,Pos X)
y = floor(EnemyNear,Pos Y)

[State 1795]
type = Explod
triggerall = NumExplod(8020) = 0
triggerall = P2StateType != L
trigger1 = Random%5 = 0
ID = 8020
anim = 8020
pos = 0,-50
postype = p2
facing = 1
removetime = -2
bindtime = -1
ownpal = 1
sprpriority = 4
random = 60,30

[State 1795, end]
type = ChangeState
trigger1 = P2StateNo = 5100
value = 1796

[State 1795]
type = DestroySelf
trigger1 = P2MoveType != H

[Statedef 1796]
physics = N
anim = 8021
ctrl = 0
sprpriority = 4

[State 1796]
type = DestroySelf
trigger1 = AnimTime = 0


;=================================================================
;バニシングラッシュX
[Statedef 1800]
type = S
physics = S
movetype = A
anim = 1800
velset = 0,0
ctrl = 0
sprpriority = 2
poweradd = IfElse(((var(52)&&fvar(29)=1)||fvar(34)=2),0, ifelse(fvar(26)=1,50,125))

[State 1800]
type = VarSet
trigger1 = Time = 0
var(23) = 1

[State 1800, snd]
type = PlaySnd
trigger1 = time = 0
value = S3,3
channel = 10

[State 1800, explod]
type = Explod
trigger1 = time = 9
anim = 1810
ID = 1810
postype = p1
pos = 0,0
facing = 1
sprpriority = 3
facing = 1
removeongethit = 1

[State 1800, end]
type = ChangeState
trigger1 = time = 10
value = 1801


[Statedef 1801];突進
type = S
physics = S
movetype = A
anim = 1801
ctrl = 0
sprpriority = 2

[State 1801, stopsnd]
type = StopSnd
trigger1 = time = 20
channel = 10

[State 1801, snd]
type = PlaySnd
trigger1 = time = 0
value = S3,4

[State 1801, hitdef]
type = HitDef
triggerall = !(var(9) || var(28))
triggerall = fvar(26) != 1
trigger1 = Time = 0
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = High
priority = 7,hit
damage = Ceil(6*100*fvar(10)*fvar(37)/10/119),Ceil(2*100*fvar(10)*fvar(37)/10/119)
pausetime = 0,9
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7204
guard.sparkno = S7212
sparkxy = 0,Floor(EnemyNear,Const(size.head.pos.y)*(1-(P2StateType = C)*0.5))
hitsound = S5,1
guardsound = S6,1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ID = 1800
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,47),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,47)
givepower = 15,15


[State 1801, hitdef 02um]
type = HitDef
triggerall = !var(9)
triggerall = fvar(26) = 1
trigger1 = Time = 0
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = High
priority = 7,hit
damage = 20*fvar(39),5
pausetime = 0,9
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7254
guard.sparkno = S7262
sparkxy = 0,Floor(EnemyNear,Const(size.head.pos.y)*(1-(P2StateType = C)*0.5))
hitsound = S5,1
guardsound = S6,1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ID = 1800
getpower = 50,50
givepower = 15,15

[State 1801, helper]
type = Helper
triggerall = NumHelper(1800) = [0,(NumEnemy - 1)]
trigger1 = MoveContact = 1
;trigger1 = NumTarget(1800)
;trigger1 = Target(1800),MoveType = H
helpertype = normal
name = "banishingrush"
ID = 1800
pos = 0,0
postype = p2
facing = 1
stateno = 1880
keyctrl = 0
ownpal = 1

[State 1801, push]
type = PlayerPush
trigger1 = AnimElem = 2, < 0
value = 0

[State 1801, velset]
type = VelSet
trigger1 = AnimElem = 1, >= 0 && AnimElem = 2, < 0
x = 15

[State 1801, velset]
type = NotHitBy
triggerall = (fvar(29) = 3 || fvar(29) = 6)
trigger1 = AnimElem = 1, >= 0 && AnimElem = 2, < 0
value = SCA
time = 1

[State 1801, velset]
type = VelSet
trigger1 = AnimElem = 2
x = 0

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 1801, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


[Statedef 1880]
anim = 9999

[State 1880]
type = Turn
trigger1 = Facing != Root,Facing

[State 1880]
type = PlaySnd
triggerall = Root,fvar(29) = [4,6]
trigger1 = time = 0
value = S2,1
volume = 150

[State 1880]
type = PlaySnd
triggerall = Root,fvar(29) = [1,3]
trigger1 = time = 0
value = S1,56
volume = 150

[State 1880, hit2]
type = Projectile
triggerall = Root,fvar(26) != 1
trigger1 = Time = 0
projID = 1880
projhits = 1
projremovetime = 1
projanim = 1880
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = Low
priority = 7,hit
damage = Ceil(6*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(1*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,9
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7204
guard.sparkno = S7212
sparkxy = 15,Floor(EnemyNear,Const(size.mid.pos.y)*0.8*(1-(P2StateType = C)*0.5))
hitsound = S5,1
guardsound = S6,1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
offset = 0,0
postype = p2
getpower = IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,47),IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,47)
givepower = 15,15

[State 1880, hit3]
type = Projectile
triggerall = Root,fvar(26) != 1
trigger1 = Time = 8
projID = 1881
projhits = 1
projremovetime = 1
projanim = 1880
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = High
priority = 7,hit
damage = Ceil(6*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(1*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,9
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7204
guard.sparkno = S7212
sparkxy = 25,Floor(EnemyNear,Const(size.mid.pos.y)*(1-(P2StateType = C)*0.5))
hitsound = S5,1
guardsound = S6,1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
offset = 0,0
postype = p2
getpower = IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,47),IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,47)
givepower = 15,15

[State 1880, hit4]
type = Projectile
triggerall = Root,fvar(26) != 1
trigger1 = Time = 16
projID = 1882
projhits = 1
projremovetime = 1
projanim = 1880
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = Low
priority = 7,hit
damage = Ceil(6*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(1*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,9
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7204
guard.sparkno = S7212
sparkxy = 15,Floor(EnemyNear,Const(size.mid.pos.y)*0.8*(1-(P2StateType = C)*0.5))
hitsound = S5,1
guardsound = S6,1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
offset = 0,0
postype = p2
getpower = IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,47),IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,47)
givepower = 15,15

[State 1880, hit5]
type = Projectile
triggerall = Root,fvar(26) != 1
trigger1 = Time = 24
projID = 1883
projhits = 1
projremovetime = 1
projanim = 1880
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = High
priority = 7,hit
damage = Ceil(6*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(1*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,9
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7204
guard.sparkno = S7212
sparkxy = 10,Floor(EnemyNear,Const(size.head.pos.y)*0.8*(1-(P2StateType = C)*0.5))
hitsound = S5,1
guardsound = S6,1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
offset = 0,0
postype = p2
getpower = IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,47),IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,47)
givepower = 15,15

[State 1880, hit6]
type = Projectile
triggerall = Root,fvar(26) != 1
triggerall = !Root,var(52)
trigger1 = Time = 32
projID = 1884
projhits = 1
projremovetime = 1
projanim = 1880
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Back
ground.type = High
priority = 7,hit
damage = Ceil(6*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(1*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,9
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7204
guard.sparkno = S7212
sparkxy = 15,Floor(EnemyNear,Const(size.mid.pos.y)*0.8*(1-(P2StateType = C)*0.5))
hitsound = S5,1
guardsound = S6,1
ground.velocity = -2,-11
air.velocity = -2,-11
yaccel = .55
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 39+9+Ceil((-EnemyNear,Pos Y)/10)
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
offset = 0,0
postype = p2
getpower = IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,47),IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,47)
givepower = 15,15
p2stateno = 1320

[State 1880, hit6]
type = Projectile
triggerall = Root,fvar(26) != 1
triggerall = Root,var(52)
trigger1 = Time = 32
projID = 1884
projhits = 1
projremovetime = 1
projanim = 1880
attr = S,SA
hitflag = MAF
guardflag = M
animtype = UP
ground.type = High
priority = 7,hit
damage = Ceil(6*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(1*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,9
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7204
guard.sparkno = S7212
sparkxy = 15,Floor(EnemyNear,Const(size.mid.pos.y)*0.8*(1-(P2StateType = C)*0.5))
hitsound = S5,1
guardsound = S6,1
ground.velocity = -2,-11
air.velocity = -2,-11
yaccel = .55
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 39+9+Ceil((-EnemyNear,Pos Y)/10)
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
offset = 0,0
postype = p2
getpower = IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,47),IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,47)
givepower = 15,15
p2stateno = 1320






;----------------------------------------------------------------------------------\
;02UM

[State 1880, hit2]
type = Projectile
triggerall = Root,fvar(26) = 1
trigger1 = Time = 0
projID = 1880
projhits = 1
projremovetime = 1
projanim = 1880
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = Low
priority = 7,hit
damage = 20*root,fvar(39),5
pausetime = 0,9
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7254
guard.sparkno = S7262
sparkxy = 15,Floor(EnemyNear,Const(size.mid.pos.y)*0.8*(1-(P2StateType = C)*0.5))
hitsound = S5,1
guardsound = S6,1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
offset = 0,0
postype = p2
getpower = 50,50
givepower = 15,15

[State 1880, hit3]
type = Projectile
triggerall = Root,fvar(26) = 1
trigger1 = Time = 8
projID = 1881
projhits = 1
projremovetime = 1
projanim = 1880
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = High
priority = 7,hit
damage = 20*root,fvar(39),5
pausetime = 0,9
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7254
guard.sparkno = S7262
sparkxy = 25,Floor(EnemyNear,Const(size.mid.pos.y)*(1-(P2StateType = C)*0.5))
hitsound = S5,1
guardsound = S6,1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
offset = 0,0
postype = p2
getpower = 50,50
givepower = 15,15

[State 1880, hit4]
type = Projectile
triggerall = Root,fvar(26) = 1
trigger1 = Time = 16
projID = 1882
projhits = 1
projremovetime = 1
projanim = 1880
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = Low
priority = 7,hit
damage = 20*root,fvar(39),5
pausetime = 0,9
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7254
guard.sparkno = S7262
sparkxy = 15,Floor(EnemyNear,Const(size.mid.pos.y)*0.8*(1-(P2StateType = C)*0.5))
hitsound = S5,1
guardsound = S6,1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
offset = 0,0
postype = p2
getpower = 50,50
givepower = 15,15

[State 1880, hit5]
type = Projectile
triggerall = Root,fvar(26) = 1
trigger1 = Time = 24
projID = 1883
projhits = 1
projremovetime = 1
projanim = 1880
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = High
priority = 7,hit
damage = 20*root,fvar(39),5
pausetime = 0,9
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7254
guard.sparkno = S7262
sparkxy = 10,Floor(EnemyNear,Const(size.head.pos.y)*0.8*(1-(P2StateType = C)*0.5))
hitsound = S5,1
guardsound = S6,1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
offset = 0,0
postype = p2
getpower = 50,50
givepower = 15,15

[State 1880, hit6]
type = Projectile
triggerall = !Root,var(52)
triggerall = Root,fvar(26) = 1
trigger1 = Time = 32
projID = 1884
projhits = 1
projremovetime = 1
projanim = 1880
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Back
ground.type = High
priority = 7,hit
damage = 20*root,fvar(39),5
pausetime = 0,9
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7254
guard.sparkno = S7262
sparkxy = 15,Floor(EnemyNear,Const(size.mid.pos.y)*0.8*(1-(P2StateType = C)*0.5))
hitsound = S5,1
guardsound = S6,1
ground.velocity = -2,-11
air.velocity = -2,-11
yaccel = .55
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 39+9+Ceil((-EnemyNear,Pos Y)/10)
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
offset = 0,0
postype = p2
getpower = 50,50
givepower = 15,15
p2stateno = 1320

[State 1880, hit6]
type = Projectile
triggerall = Root,var(52)
triggerall = Root,fvar(26) = 1
trigger1 = Time = 32
projID = 1884
projhits = 1
projremovetime = 1
projanim = 1880
attr = S,SA
hitflag = MAF
guardflag = M
animtype = UP
ground.type = High
priority = 7,hit
damage = 20*root,fvar(39),5
pausetime = 0,9
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7254
guard.sparkno = S7262
sparkxy = 15,Floor(EnemyNear,Const(size.mid.pos.y)*0.8*(1-(P2StateType = C)*0.5))
hitsound = S5,1
guardsound = S6,1
ground.velocity = -2,-11
air.velocity = -2,-11
yaccel = .55
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 39+9+Ceil((-EnemyNear,Pos Y)/10)
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
offset = 0,0
postype = p2
getpower = 50,50
givepower = 15,15
p2stateno = 1320


[State 1880, end]
type = DestroySelf
trigger1 = Time < 9
trigger1 = Root,MoveType = H
trigger2 = Time > 32


;=================================================================
;バニシングラッシュY
[Statedef 1850]
type = S
physics = S
movetype = A
anim = 1800
velset = 0,0
ctrl = 0
sprpriority = 2
poweradd = IfElse(((var(52)&&fvar(29)=1)||fvar(34)=2),0,ifelse(fvar(26)=1,50,125))

[State 1800]
type = VarSet
trigger1 = Time = 0
var(23) = 1

[State 1800, snd]
type = PlaySnd
trigger1 = time = 0
value = S3,3
channel = 10

[State 1850, explod]
type = Explod
trigger1 = time = 14
anim = 1810
ID = 1810
postype = p1
pos = 0,0
facing = 1
sprpriority = 3
facing = 1
removeongethit = 1

[State 1850, end]
type = ChangeState
trigger1 = time = 12
value = 1851


[Statedef 1851];突進
type = S
physics = S
movetype = A
anim = 1851
ctrl = 0
sprpriority = 2

[State 1801, stopsnd]
type = StopSnd
trigger1 = time = 20
channel = 10

[State 1801, snd]
type = PlaySnd
trigger1 = time = 0
value = S3,4

[State 1801, hitdef]
type = HitDef
triggerall = fvar(26) != 1
trigger1 = !(var(9) || var(28))
trigger1 = Time = 0
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = High
priority = 7,hit
damage = Ceil(6*100*fvar(10)*fvar(37)/10/119),Ceil(2*100*fvar(10)*fvar(37)/10/119)
pausetime = 0,9
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7204
guard.sparkno = S7212
sparkxy = 0,Floor(EnemyNear,Const(size.head.pos.y)*(1-(P2StateType = C)*0.5))
hitsound = S5,1
guardsound = S6,1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ID = 1850
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,47),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,47)
givepower = 15,15




[State 1801, hitdef 02um]
type = HitDef
triggerall = fvar(26) = 1
trigger1 = var(9) = 0
trigger1 = Time = 0
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = High
priority = 7,hit
damage = 20*fvar(39), 5
pausetime = 0,9
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7254
guard.sparkno = S7262
sparkxy = 0,Floor(EnemyNear,Const(size.head.pos.y)*(1-(P2StateType = C)*0.5))
hitsound = S5,1
guardsound = S6,1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ID = 1850
getpower = 50,50
givepower = 15,15

[State 1801, helper]
type = Helper
triggerall = NumHelper(1850) = [0,(NumEnemy - 1)]
trigger1 = MoveContact = 1
;trigger1 = NumTarget(1850)
;trigger1 = Target(1850),MoveType = H
helpertype = normal
name = "banishingrush"
ID = 1850
pos = 0,0
postype = p2
facing = 1
stateno = 1890
keyctrl = 0
ownpal = 1

[State 1801, push]
type = PlayerPush
trigger1 = AnimElem = 2, < 0
value = 0

[State 1801, velset]
type = VelSet
trigger1 = AnimElem = 1, >= 0 && AnimElem = 2, < 0
x = 15

[State 1801, velset]
type = NotHitBy
triggerall = (fvar(29) = 3 || fvar(29) = 6)
trigger1 = AnimElem = 1, >= 0 && AnimElem = 2, < 0
value = SCA
time = 1

[State 1801, velset]
type = VelSet
trigger1 = AnimElem = 2
x = 0

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 1801, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


[Statedef 1890]
anim = 9999

[State 1880]
type = Turn
trigger1 = Facing != Root,Facing

[State 1880]
type = PlaySnd
triggerall = Root,fvar(29) = [4,6]
trigger1 = time = 0
value = S2,1
volume = 150

[State 1880]
type = PlaySnd
triggerall = Root,fvar(29) = [1,3]
trigger1 = time = 0
value = S1,56
volume = 150

[State 1890, hit2]
type = Projectile
triggerall = root,fvar(26) != 1
trigger1 = Time = 0
projID = 1890
projhits = 1
projremovetime = 1
projanim = 1880
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = Low
priority = 7,hit
damage = Ceil(6*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(1*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,9
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7204
guard.sparkno = S7212
sparkxy = 15,Floor(EnemyNear,Const(size.mid.pos.y)*0.8*(1-(P2StateType = C)*0.5))
hitsound = S5,1
guardsound = S6,1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
offset = 0,0
postype = p2
getpower = IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,47),IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,47)
givepower = 15,15

[State 1890, hit3]
type = Projectile
triggerall = root,fvar(26) != 1
trigger1 = Time = 8
projID = 1891
projhits = 1
projremovetime = 1
projanim = 1880
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = High
priority = 7,hit
damage = Ceil(6*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(1*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,9
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7204
guard.sparkno = S7212
sparkxy = 25,Floor(EnemyNear,Const(size.mid.pos.y)*(1-(P2StateType = C)*0.5))
hitsound = S5,1
guardsound = S6,1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
offset = 0,0
postype = p2
getpower = IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,47),IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,47)
givepower = 15,15

[State 1890, hit4]
type = Projectile
triggerall = root,fvar(26) != 1
trigger1 = Time = 16
projID = 1892
projhits = 1
projremovetime = 1
projanim = 1880
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = Low
priority = 7,hit
damage = Ceil(6*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(1*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,9
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7204
guard.sparkno = S7212
sparkxy = 15,Floor(EnemyNear,Const(size.mid.pos.y)*0.8*(1-(P2StateType = C)*0.5))
hitsound = S5,1
guardsound = S6,1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
offset = 0,0
postype = p2
getpower = IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,47),IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,47)
givepower = 15,15

[State 1890, hit5]
type = Projectile
triggerall = root,fvar(26) != 1
trigger1 = Time = 24
projID = 1893
projhits = 1
projremovetime = 1
projanim = 1880
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = High
priority = 7,hit
damage = Ceil(6*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(1*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,9
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7204
guard.sparkno = S7212
sparkxy = 10,Floor(EnemyNear,Const(size.head.pos.y)*0.8*(1-(P2StateType = C)*0.5))
hitsound = S5,1
guardsound = S6,1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
offset = 0,0
postype = p2
getpower = IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,47),IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,47)
givepower = 15,15

[State 1890, hit6]
type = Projectile
triggerall = root,fvar(26) != 1
triggerall = !Root,var(52)
trigger1 = Time = 32
projID = 1894
projhits = 1
projremovetime = 1
projanim = 1880
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Back
ground.type = High
priority = 7,hit
damage = Ceil(6*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(1*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,9
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7204
guard.sparkno = S7212
sparkxy = 15,Floor(EnemyNear,Const(size.mid.pos.y)*0.8*(1-(P2StateType = C)*0.5))
hitsound = S5,1
guardsound = S6,1
ground.velocity = -2.5,-11
air.velocity = -2.5,-11
yaccel = .55
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 39+9+Ceil((-EnemyNear,Pos Y)/10)
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
offset = 0,0
postype = p2
getpower = IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,47),IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,47)
givepower = 15,15
p2stateno = 1320

[State 1890, hit6]
type = Projectile
triggerall = root,fvar(26) != 1
triggerall = Root,var(52)
trigger1 = Time = 32
projID = 1894
projhits = 1
projremovetime = 1
projanim = 1880
attr = S,SA
hitflag = MAF
guardflag = M
animtype = UP
ground.type = High
priority = 7,hit
damage = Ceil(6*100*(Root,fvar(10))*(Root,fvar(37))/10/119),Ceil(1*100*(Root,fvar(10))*(Root,fvar(37))/10/119)
pausetime = 0,9
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7204
guard.sparkno = S7212
sparkxy = 15,Floor(EnemyNear,Const(size.mid.pos.y)*0.8*(1-(P2StateType = C)*0.5))
hitsound = S5,1
guardsound = S6,1
ground.velocity = -2.5,-11
air.velocity = -2.5,-11
yaccel = .55
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 39+9+Ceil((-EnemyNear,Pos Y)/10)
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
offset = 0,0
postype = p2
getpower = IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,47),IfElse(((Root,var(52)||Root,fvar(34)=2)&&(Root,fvar(29)=1||Root,fvar(29)=4)),0,47)
givepower = 15,15
p2stateno = 1320


;-----------------------------------------------------------------------------------------------------
;02UM

[State 1890, hit2]
type = Projectile
triggerall = root,fvar(26) = 1
trigger1 = Time = 0
projID = 1890
projhits = 1
projremovetime = 1
projanim = 1880
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = Low
priority = 7,hit
damage = 20*root,fvar(39), 5
pausetime = 0,9
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7254
guard.sparkno = S7262
sparkxy = 15,Floor(EnemyNear,Const(size.mid.pos.y)*0.8*(1-(P2StateType = C)*0.5))
hitsound = S5,1
guardsound = S6,1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
offset = 0,0
postype = p2
getpower = 50,50
givepower = 15,15

[State 1890, hit3]
type = Projectile
triggerall = root,fvar(26) = 1
trigger1 = Time = 8
projID = 1891
projhits = 1
projremovetime = 1
projanim = 1880
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = High
priority = 7,hit
damage = 20*root,fvar(39), 5
pausetime = 0,9
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7254
guard.sparkno = S7262
sparkxy = 25,Floor(EnemyNear,Const(size.mid.pos.y)*(1-(P2StateType = C)*0.5))
hitsound = S5,1
guardsound = S6,1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
offset = 0,0
postype = p2
getpower = 50,50
givepower = 15,15

[State 1890, hit4]
type = Projectile
triggerall = root,fvar(26) = 1
trigger1 = Time = 16
projID = 1892
projhits = 1
projremovetime = 1
projanim = 1880
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = Low
priority = 7,hit
damage = 20*root,fvar(39), 5
pausetime = 0,9
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7254
guard.sparkno = S7262
sparkxy = 15,Floor(EnemyNear,Const(size.mid.pos.y)*0.8*(1-(P2StateType = C)*0.5))
hitsound = S5,1
guardsound = S6,1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
offset = 0,0
postype = p2
getpower = 50,50
givepower = 15,15

[State 1890, hit5]
type = Projectile
triggerall = root,fvar(26) = 1
trigger1 = Time = 24
projID = 1893
projhits = 1
projremovetime = 1
projanim = 1880
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = High
priority = 7,hit
damage = 20*root,fvar(39), 5
pausetime = 0,9
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7254
guard.sparkno = S7262
sparkxy = 10,Floor(EnemyNear,Const(size.head.pos.y)*0.8*(1-(P2StateType = C)*0.5))
hitsound = S5,1
guardsound = S6,1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
offset = 0,0
postype = p2
getpower = 50,50
givepower = 15,15

[State 1890, hit6]
type = Projectile
triggerall = root,fvar(26) = 1
triggerall = !Root,var(52)
trigger1 = Time = 32
projID = 1894
projhits = 1
projremovetime = 1
projanim = 1880
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Back
ground.type = High
priority = 7,hit
damage = 20*root,fvar(39), 5
pausetime = 0,9
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7254
guard.sparkno = S7262
sparkxy = 15,Floor(EnemyNear,Const(size.mid.pos.y)*0.8*(1-(P2StateType = C)*0.5))
hitsound = S5,1
guardsound = S6,1
ground.velocity = -2,-12
air.velocity = -2,-12
yaccel = .55
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 39+9+Ceil((-EnemyNear,Pos Y)/10)
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
offset = 0,0
postype = p2
getpower = 50,50
givepower = 15,15
p2stateno = 1320

[State 1890, hit6]
type = Projectile
triggerall = root,fvar(26) = 1
triggerall = Root,var(52)
trigger1 = Time = 32
projID = 1894
projhits = 1
projremovetime = 1
projanim = 1880
attr = S,SA
hitflag = MAF
guardflag = M
animtype = UP
ground.type = High
priority = 7,hit
damage = 20*root,fvar(39), 5
pausetime = 0,9
guard.pausetime = 0,7
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7254
guard.sparkno = S7262
sparkxy = 15,Floor(EnemyNear,Const(size.mid.pos.y)*0.8*(1-(P2StateType = C)*0.5))
hitsound = S5,1
guardsound = S6,1
ground.velocity = -2,-12
air.velocity = -2,-12
yaccel = .55
fall = 1
fall.recover = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
fall.recovertime = 39+9+Ceil((-EnemyNear,Pos Y)/10)
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
offset = 0,0
postype = p2
getpower = 50,50
givepower = 15,15
p2stateno = 1320

[State 1890, end]
type = DestroySelf
trigger1 = Time < 9
trigger1 = Root,MoveType = H
trigger2 = Time > 32


;=================================================================
;ジェノサイドカッター 94
[Statedef 1900]
type = S
physics = S
movetype = A
ctrl = 0
anim = 1900
sprpriority = 2
poweradd = 0

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 1300]
type = NotHitBy
trigger1 = AnimElem = 8, < 0
value = SCA
time = 1

[State 1900, explod]
type = Explod
trigger1 = Animelem = 5
anim = 8208
pos = 10,-10
postype = p1
bindtime = 8
sprpriority = 4

[State 1900, snd]
type = PlaySnd
trigger1 = fvar(29) = [4,6]
trigger1 = Time = 0
value = S2,10
volume = 150
channel = 14

[State 1900, snd]
type = PlaySnd
trigger1 = fvar(29) = [1,3]
trigger1 = Time = 0
value = S2,50
volume = 150

[State 1900, snd]
type = PlaySnd
trigger1 = fvar(29) = [4,6]
trigger1 = Vel Y > 0
trigger1 = Pos Y >= -10
value = S2,11
volume = 150
channel = 14
persistent = 0

[State 1900, snd]
type = PlaySnd
trigger1 = AnimElem = 7
value = S3,20
volume = 150

[State 1300, statetype]
type = StateTypeSet
trigger1 = AnimElem = 6
StateType = A
physics = N

[State 1300, 1]
type = VelSet
trigger1 = AnimElem = 6
x = 2
y = -4

[State 1300, 1]
type = VelAdd
triggerall = NumTarget(1900)
triggerall = Target,BackEdgeBodyDist <= 10
triggerall = MoveContact
trigger1 = Target,MoveType = H
trigger1 = AnimElem = 6
x = -8-(var(52)>0)*2
persistent = 0

[State 1300, 1]
type = VelSet
triggerall = NumTarget(1901)
triggerall = Target,BackEdgeBodyDist <= 10
triggerall = MoveContact = 1
trigger1 = Target,MoveType = H
x = -6-(var(52)>0)*2
persistent = 0

[State 1300, 1]
type = VelSet
trigger1 = AnimElem = 8
x = 0

[State 1300, 1]
type = VelAdd
trigger1 = AnimElem = 6, > 0
y = .31

[State 1900, hitdef1]
type = HitDef
triggerall = !var(9)
trigger1 = Animelem = 5, = 1
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = Low
priority = 7,hit
damage = Ceil((54+Random%18)*100*fvar(10)*fvar(37)/IfElse(fvar(27)=0,2,1)/10/207),Ceil((6+Random%2)*100*fvar(10)*fvar(37)/IfElse(fvar(27)=0,2,1)/10/207)
pausetime = 15,15
guard.pausetime = 15,15
sparkno = S7203
guard.sparkno = S7211
sparkxy = -20,-61+Ceil(P2BodyDist Y)
hitsound = S5,21
guardsound = S6,2
ground.hittime = 20
ground.slidetime = 20
ground.hittime = 20
ground.ctrltime = 20
air.hittime = 60
fall = 0
air.fall = 1
fall.recover = 0
ground.velocity = -8-(var(52)>0)*3.4
guard.velocity = -8-(var(52)>0)*3.4
air.velocity = -2-(var(52)>0),-7.2
yaccel = .5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ID = 1900
kill = 1
getpower = 0,0
givepower = 15,15

[State 1900, hitdef2]
type = HitDef
triggerall = !var(9)
trigger1 = Animelem = 7
attr = S,SA
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
ground.type = Low
priority = 7,hit
damage = Ceil((48+Random%16)*100*fvar(10)*fvar(37)/IfElse(fvar(27)=0,2,1)/10/207),Ceil((5+Random%2)*100*fvar(10)*fvar(37)/IfElse(fvar(27)=0,2,1)/10/207)
pausetime = 15,15
guard.pausetime = 15,15
sparkno = S7203
guard.sparkno = S7211
sparkxy = -20,-91+Ceil(P2BodyDist Y)
hitsound = S5,21
guardsound = S6,2
ground.hittime = 20
ground.slidetime = 20
ground.hittime = 20
ground.ctrltime = 20
air.hittime = 60
fall = 1
fall.recover = 0
ground.velocity = -2-(var(52)>0),-7.2
guard.velocity = -8-(var(52)>0)*3.4
air.velocity = -2-(var(52)>0),-7.2
yaccel = .5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ID = 1901
kill = 1
getpower = 0,0
givepower = 15,15

[State 1300, 0]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 1901


[Statedef 1901];着地
type = S
physics = N
movetype = I
ctrl = 0
anim = 1901
velset = 0,0
sprpriority = 2

[State 1301, snd]
type = PlaySnd
trigger1 = Time = 0
value = S0,2

[State 1301, pos]
type = PosSet
trigger1 = Time = 0
y = 0

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 1301, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;=================================================================
;ジェノサイドカッター・エア
[Statedef 1950]
type = A
physics = N
movetype = A
ctrl = 0
anim = 1950
sprpriority = 2
poweradd = IfElse(((var(52)&&fvar(29)=1)||fvar(34)=2),0,91)
velset = 0,0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 1950]
type = NotHitBy
trigger1 = AnimElem = 10,< 0
value = SCA
time = 1

[State 1950, snd]
type = PlaySnd
trigger1 = fvar(29) = [1,3]
trigger1 = Time = 0
value = S2,50
volume = 150
channel = 0

[State 1950, varreset]
type = VarSet
triggerall = fvar(29) = [4,6]
trigger1 = Time = 0
var(24) = 1

[State 1950, snd]
type = PlaySnd
trigger1 = fvar(29) = [4,6]
trigger1 = Time = 0
value = S2,15
volume = 150
channel = 0

[State 1950, explod]
type = Explod
trigger1 = Animelem = 7
anim = 8203
pos = 0,0
postype = p1
bindtime = -1
sprpriority = 4

[State 1950, snd]
type = PlaySnd
trigger1 = Animelem = 7
value = S3,2
volume = -50

[State 1950, posadd]
type = PosAdd
trigger1 = AnimElem = 15
trigger2 = AnimElem = 16
x = 10

[State 1950, vel]
type = VelAdd
trigger1 = AnimElem = 11, > 1
y = .32

[State 1950, vel]
type = VelSet
trigger1 = AnimElem = 2, = 1
y = 0

[State 1950, vel]
type = VelSet
trigger1 = AnimElem = 11, = 1
x = -2
y = -4

[State 1950, hitdef4]
type = HitDef
triggerall = !var(9)
trigger1 = Animelem = 7
attr = A,SA
hitflag = MAF
guardflag = M
animtype = DiagUp
air.animtype = DiagUp
ground.type = Low
priority = 7,hit
damage = Ceil(17*(100-random%11)*fvar(10)*fvar(37)/10/103),Ceil(1*(100-Random%11)*fvar(10)*fvar(37)/10/103)
pausetime = 2,2
guard.pausetime = 2,0
sparkno = S7253
guard.sparkno = S7262
sparkxy = -20,-100+Ceil(P2BodyDist Y)
hitsound = S5,15
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 32+2+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = -7,-9
guard.velocity = -12
air.velocity = -7,-9
yaccel = .5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
;p2facing = 1
ID = 1950
kill = 1
getpower = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45),IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,45)
givepower = 15,15

[State 1950, 0]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 1351


;=================================================================
;=================================================================
;=================================================================
;ギガンテックプレッシャーX
[Statedef 2000]
type = S
physics = S
movetype = A
ctrl = 0
anim = 2000
sprpriority = 2

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State -2];どこキャン時点滅
type = PalFX
triggerall = var(46)
triggerall = Time < 9
trigger1 = Time%2 = 0
time = 1
add = 255,255,255
mul = 255,255,255
ignorehitpause = 1

[State -2, 再使用制限 98UM(EX)]
type = VarSet
triggerall = fvar(29) = 4
triggerall = Time = 0
triggerall = fvar(34) = 2
triggerall = var(53)
trigger1 = !(Power >= 1000 || var(52))
var(51) = 1

[State -2, power 98UM]
type = PowerAdd
triggerall = fvar(29) = 4
trigger1 = Time = 0
value = IfElse(var(52),0,-IfElse((var(51)),0,1000))

[State -2, power 2002]
type = PowerAdd
triggerall = fvar(29) = 1
trigger1 = Time = 0
trigger1 = !var(52)
value = -1000

[State -2, power S]
type = PowerAdd
triggerall = !(fvar(29) = 1 || fvar(29) = 4)
trigger1 = Time = 0
value = IfElse((var(52)||var(53)),0,-1000)

[State -2, max reset]
type = VarSet
trigger1 = Time = 0
trigger1 = var(52)
var(52) = 0

[State -2, nothitby]
type = NotHitBy
triggerall = !(fvar(29) = 3 || fvar(29) = 6)
trigger1 = AnimElem = 5, < 0
value = SCA
time = 1

[State -2, nothitby]
type = NotHitBy
triggerall = (fvar(29) = 3 || fvar(29) = 6)
trigger1 = AnimElem = 6, < 0
value = SCA
time = 1

[State -2, pause]
type = Pause
trigger1 = Time = 2
time = 28
movetime = 28

[State -2]
type = VelSet
trigger1 = Time = 2
x = 0
y = 0

[State -2, env]
type = EnvColor
trigger1 = Time = 2
value = 255,255,255
time = 4
under = 1

[State -2, env]
type = EnvColor
trigger1 = Time = 6
value = 0,0,0
time = 24
under = 1

[State -2, snd]
type = PlaySnd
trigger1 = time = 2
value = S8,1

[State -2, explod 2002]
type = Explod
triggerall = fvar(29) = 1
trigger1 = Time = 0 + 4;要調整
anim = 7620
pos = -48,-104;要調整
postype = p1
sprpriority = -1
pausemovetime = 99999
ownpal = 1

[State -2, explod 2002]
type = Explod
triggerall = fvar(29) = 1
trigger1 = Time = 10 + 4;要調整
anim = 7560
pos = -48,-104;要調整(ID7560と同値）
postype = p1
sprpriority = 3
pausemovetime = 99999
ownpal = 1

[State -2, explod 98UM]
type = Explod
triggerall = fvar(29) != 1
trigger1 = Time = 0 + 6;要調整
anim = 7600
ID = 7600
pos = -48,-104;要調整
postype = p1
facing = 1
removetime = -2
sprpriority = -1
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State -2, explod]
type = Explod
triggerall = fvar(29) != 1
trigger1 = Time = 8 + 6;要調整
anim = 7605
ID = 7605
pos = -48,-104;要調整(ID7600と同値）
postype = p1
facing = 1
removetime = -2
sprpriority = 4
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State 2000, vel]
type = VelSet
trigger1 = AnimElem = 5, >= 0 && AnimElem = 11, < 0
x = 8+(fvar(29)=3||fvar(29)=6)*4

[State 2000, snd]
type = PlaySnd
trigger1 = AnimElem = 5
value = S0,3
loop = 1
channel = 1

[State 2000, stopsnd]
type = StopSnd
trigger1 = Time = 0
trigger2 = Animelem = 11
channel = 1

[State 2000, varreset]
type = VarSet
trigger1 = Time = 0
trigger2 = !(fvar(29) = 1 || fvar(29) = 4) || fvar(26)
trigger2 = !(P2MoveType = H && P2StateNo = [3050,3070))
var(33) = 0

[State 2000, varset]
type = VarSet
trigger1 = !(fvar(29) = 1 || fvar(29) = 4) || fvar(26)
trigger1 = P2MoveType = H && P2StateNo = [3050,3070)
var(33) = 1

[State 2000, hitdef]
type = HitDef
trigger1 = !var(9) || !(fvar(29) = 1 || fvar(29) = 4) || fvar(26)
trigger1 = !var(8)
trigger1 = AnimElem = 5
trigger1 = !var(33)
attr = S,HA
hitflag = MAF
guardflag = M
animtype = Back
priority = 7,hit
guard.pausetime = 0,0
hitsound = S5,1
sparkno = S(7205+(fvar(29)=1)*50)
guard.sparkno = -1
sparkxy = 0,-60
ground.type = High
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -5,-7.5
air.velocity = -5,-7.5
guard.velocity = -5
p2facing = 1
fall = 1
fall.recover = 0
yaccel = .45
ID = 2000
kill = 0
givepower = 15,15


[State 2000, hitdef]
type = HitDef
trigger1 = !var(9) || !(fvar(29) = 1 || fvar(29) = 4) || fvar(26)
trigger1 = !var(8)
trigger1 = AnimElem = 5
trigger1 = var(33)
attr = S,HA
hitflag = MAFD
guardflag = M
animtype = Back
priority = 7,hit
guard.pausetime = 0,0
hitsound = S5,1
sparkno = S(7205+(fvar(29)=1)*50)
guard.sparkno = -1
sparkxy = 0,-60
ground.type = High
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -5,-7.5
air.velocity = -5,-7.5
guard.velocity = -5
p2facing = 1
fall = 1
fall.recover = 0
yaccel = .45
ID = 2000
kill = 0
givepower = 15,15

[State 2000]
type = Projectile
trigger1 = !var(9) || !(fvar(29) = 1 || fvar(29) = 4) || fvar(26)
trigger1 = !var(8)
trigger1 = AnimElem = 5, >= 0 && AnimElem = 11, < 0
trigger1 = P2BodyDist X = [-5,20]
trigger1 = P2StateNo = 3070
ID = 2000
projID = 2080
projanim = 2080
projremovetime = 10
postype = p1
offset = 30,0
attr = S,HA
hitflag = MAFD
guardflag = M
hitsound = S5,1
sparkno = S(7205+(fvar(29)=1)*50)
guard.sparkno = -1
sparkxy = 0,-60
numhits = 0
p2facing = 1
p2stateno = 2020


[State 2000, targetdrop]
type = TargetDrop
trigger1 = NumTarget(2000)
excludeID = 2000
keepone = 0
ignorehitpause = 1

[State 2000, nothitby]
type = NotHitBy
trigger1 = NumTarget(2000)
trigger1 = MoveHit
value = SCA
time = 1
ignorehitpause = 1

[State 2000, hit]
type = TargetState
triggerall = NumTarget(2000)
trigger1 = MoveHit
trigger1 = Target,MoveType = H
trigger1 = Target,StateNo != 2020
value = 2020
ID = 2000
ignorehitpause = 1

[State 2000, hit]
type = ChangeState
triggerall = NumTarget(2000)
trigger1 = MoveHit
trigger1 = P2StateNo = 2020
value = 2010
ignorehitpause = 1

[State 2000, hit]
type = ChangeState
triggerall = ProjHitTime(2080) = 0
trigger1 = P2StateNo = 2020
value = 2010
ignorehitpause = 1

[State 2000, guarded]
type = ChangeState
trigger1 = MoveGuarded
trigger2 = MoveHit > 1
value = 2030
ignorehitpause = 1

[State 2000, afterimagetime]
type = afterimage
trigger1 = AnimElem = 5
time = -1
length = 7
palcolor = 0
palinvertall = 0
palcontrast = 140, 140, 230
palbright = 0, 30, 90
palpostbright = 30, 0, 30
paladd = 0, 0, 0
palmul = 1,1,1
framegap = 2
trans = add1

[State 2000, afterimage]
type = afterimage
trigger1 = AnimElem = 11
time = 1

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 2000, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;=================================================================
;ギガンテックプレッシャーY
[Statedef 2050]
type = S
physics = S
movetype = A
ctrl = 0
anim = 2050
sprpriority = 2

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State -2];どこキャン時点滅
type = PalFX
triggerall = var(46)
triggerall = Time < 9
trigger1 = Time%2 = 0
time = 1
add = 255,255,255
mul = 255,255,255
ignorehitpause = 1

[State -2, 再使用制限 98UM(EX)]
type = VarSet
triggerall = fvar(29) = 4
triggerall = Time = 0
triggerall = fvar(34) = 2
triggerall = var(53)
trigger1 = !(Power >= 1000 || var(52))
var(51) = 1

[State -2, power 98UM]
type = PowerAdd
triggerall = fvar(29) = 4
trigger1 = Time = 0
value = IfElse(var(52),0,-IfElse((var(51)),0,1000))

[State -2, power 2002]
type = PowerAdd
triggerall = fvar(29) = 1
trigger1 = Time = 0
trigger1 = !var(52)
value = -1000

[State -2, power S]
type = PowerAdd
triggerall = !(fvar(29) = 1 || fvar(29) = 4)
trigger1 = Time = 0
value = IfElse((var(52)||var(53)),0,-1000)

[State -2, max reset]
type = VarSet
trigger1 = Time = 0
trigger1 = var(52)
var(52) = 0

[State -2, nothitby]
type = NotHitBy
triggerall = !(fvar(29) = 3 || fvar(29) = 6)
trigger1 = AnimElem = 5, < 0
value = SCA
time = 1

[State -2, nothitby]
type = NotHitBy
triggerall = (fvar(29) = 3 || fvar(29) = 6)
trigger1 = AnimElem = 6, < 0
value = SCA
time = 1

[State -2, pause]
type = Pause
trigger1 = Time = 2
time = 28
movetime = 28

[State -2]
type = VelSet
trigger1 = Time = 2
x = 0
y = 0

[State -2, env]
type = EnvColor
trigger1 = Time = 2
value = 255,255,255
time = 4
under = 1

[State -2, env]
type = EnvColor
trigger1 = Time = 6
value = 0,0,0
time = 24
under = 1

[State -2, snd]
type = PlaySnd
trigger1 = time = 2
value = S8,1

[State -2, explod 2002]
type = Explod
triggerall = fvar(29) = 1
trigger1 = Time = 0 + 4;要調整
anim = 7620
pos = -48,-104;要調整
postype = p1
sprpriority = -1
pausemovetime = 99999
ownpal = 1

[State -2, explod 2002]
type = Explod
triggerall = fvar(29) = 1
trigger1 = Time = 10 + 4;要調整
anim = 7560
pos = -48,-104;要調整(ID7560と同値）
postype = p1
sprpriority = 3
pausemovetime = 99999
ownpal = 1

[State -2, explod 98UM]
type = Explod
triggerall = fvar(29) != 1
trigger1 = Time = 0 + 6;要調整
anim = 7600
ID = 7600
pos = -48,-104;要調整
postype = p1
facing = 1
removetime = -2
sprpriority = -1
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State -2, explod]
type = Explod
triggerall = fvar(29) != 1
trigger1 = Time = 8 + 6;要調整
anim = 7605
ID = 7605
pos = -48,-104;要調整(ID7600と同値）
postype = p1
facing = 1
removetime = -2
sprpriority = 4
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State 2000, vel]
type = VelSet
trigger1 = AnimElem = 5, >= 0 && AnimElem = 13, < 0
x = 8+(fvar(29)=3||fvar(29)=6)*4

[State 2000, snd]
type = PlaySnd
trigger1 = AnimElem = 5
value = S0,3
loop = 1
channel = 1

[State 2000, stopsnd]
type = StopSnd
trigger1 = Time = 0
trigger2 = Animelem = 13
channel = 1

[State 2000, varreset]
type = VarSet
trigger1 = Time = 0
trigger2 = !(fvar(29) = 1 || fvar(29) = 4) || fvar(26)
trigger2 = !(P2MoveType = H && P2StateNo = [3050,3070))
var(33) = 0

[State 2000, varset]
type = VarSet
trigger1 = !(fvar(29) = 1 || fvar(29) = 4) || fvar(26)
trigger1 = P2MoveType = H && P2StateNo = [3050,3070)
var(33) = 1

[State 2000, hitdef]
type = HitDef
trigger1 = !var(9) || !(fvar(29) = 1 || fvar(29) = 4) || fvar(26)
trigger1 = !var(8)
trigger1 = AnimElem = 5
trigger1 = !var(33)
attr = S,HA
hitflag = MAF
guardflag = M
animtype = Back
priority = 7,hit
guard.pausetime = 0,0
hitsound = S5,1
sparkno = S(7205+(fvar(29)=1)*50)
guard.sparkno = -1
sparkxy = 0,-60
ground.type = High
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -5,-7.5
air.velocity = -5,-7.5
guard.velocity = -5
p2facing = 1
fall = 1
fall.recover = 0
yaccel = .45
ID = 2000
kill = 0
givepower = 15,15

[State 2000, hitdef]
type = HitDef
trigger1 = !var(9) || !(fvar(29) = 1 || fvar(29) = 4) || fvar(26)
trigger1 = !var(8)
trigger1 = AnimElem = 5
trigger1 = var(33)
attr = S,HA
hitflag = MAFD
guardflag = M
animtype = Back
priority = 7,hit
guard.pausetime = 0,0
hitsound = S5,1
sparkno = S(7205+(fvar(29)=1)*50)
guard.sparkno = -1
sparkxy = 0,-60
ground.type = High
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -5,-7.5
air.velocity = -5,-7.5
guard.velocity = -5
p2facing = 1
fall = 1
fall.recover = 0
yaccel = .45
ID = 2000
kill = 0
givepower = 15,15

[State 2000]
type = Projectile
trigger1 = !var(9) || !(fvar(29) = 1 || fvar(29) = 4) || fvar(26)
trigger1 = !var(8)
trigger1 = AnimElem = 5, >= 0 && AnimElem = 11, < 0
trigger1 = P2BodyDist X = [-5,20]
trigger1 = P2StateNo = 3070
ID = 2000
projID = 2080
projanim = 2080
projremovetime = 10
postype = p1
offset = 30,0
attr = S,HA
hitflag = MAFD
guardflag = M
hitsound = S5,1
sparkno = S(7205+(fvar(29)=1)*50)
guard.sparkno = -1
sparkxy = 0,-60
numhits = 0
p2facing = 1
p2stateno = 2020

[State 2000, targetdrop]
type = TargetDrop
trigger1 = NumTarget(2000)
excludeID = 2000
keepone = 0
ignorehitpause = 1

[State 2000, nothitby]
type = NotHitBy
trigger1 = NumTarget(2000)
trigger1 = MoveHit
value = SCA
time = 1
ignorehitpause = 1

[State 2000, hit]
type = TargetState
triggerall = NumTarget(2000)
trigger1 = MoveHit
trigger1 = Target,MoveType = H
trigger1 = Target,StateNo != 2020
value = 2020
ID = 2000
ignorehitpause = 1

[State 2000, hit]
type = ChangeState
triggerall = NumTarget(2000)
trigger1 = MoveHit
trigger1 = P2StateNo = 2020
value = 2010
ignorehitpause = 1

[State 2000, hit]
type = ChangeState
triggerall = ProjHitTime(2080) = 0
trigger1 = P2StateNo = 2020
value = 2010
ignorehitpause = 1

[State 2000, guarded]
type = ChangeState
trigger1 = MoveGuarded 
trigger2 = MoveHit > 1
value = 2030
ignorehitpause = 1

[State 2000, afterimagetime]
type = afterimage
trigger1 = AnimElem = 5
time = -1
length = 7
palcolor = 0
palinvertall = 0
palcontrast = 140, 140, 230
palbright = 0, 30, 90
palpostbright = 30, 0, 30
paladd = 0, 0, 0
palmul = 1,1,1
framegap = 2
trans = add1

[State 2000, afterimage]
type = afterimage
trigger1 = AnimElem = 13
time = 1

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 2000, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


[Statedef 2030];ガード時
type = S
movetype = A
physics = N
anim = 2030+(fvar(29)!=1)
ctrl = 0
poweradd = 0
sprpriority = 2

[State 2030]
type = AfterImageTime
trigger1 = Time = 0
time = 0

[State 2030, snd]
type = PlaySnd
triggerall = P2StateNo = [120,160]
trigger1 = Time = 0
value = S6,1

[State 2030, explod]
type = Explod
triggerall = P2StateNo = [120,160]
trigger1 = Time = 0
anim = 7212+(fvar(29)=1)*50
ID = 7212+(fvar(29)=1)*50
pos = 24,-60
postype = p1
ontop = 1

[State 2030, veladd]
type = VelMul
trigger1 = !(Vel X = 0)
trigger1 = HitPauseTime = 0
x = .85

[State 2030, vel]
type = VelSet
trigger1 = AnimElem = 5
x = 0

[State 2030, vel]
type = VelSet
trigger1 = 1
y = 0

[State 2030, hitdef]
type = HitDef
triggerall = !fvar(26)
triggerall = !var(9)
trigger1 = AnimElem = 3
attr = S,HA
hitflag = MAF
guardflag = M
animtype = Up
priority = 7,hit
damage = Ceil(20*(100-Random%11)*fvar(10)*fvar(38)/10/103)
pausetime = 17,17
guard.pausetime = 11,11
hitsound = S5,(4+(fvar(29)=1)*5)
guardsound = S6,1
sparkno = S(7205+(fvar(29)=1)*5)
guard.sparkno = S(7212+(fvar(29)=1)*50)
sparkxy = -10-(P2StateNo!=[120,160])*50,-80
ground.type = High
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
ground.velocity = -8,-7.5
guard.velocity = -10.35
air.velocity = -8,-7.5
fall = 1
fall.recover = 0
yaccel = .45
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = -19.8
air.cornerpush.veloff = 0
kill = 1
ID = 2030

[State 2030, hitdef]
type = HitDef
triggerall = fvar(26)
triggerall = !var(9)
trigger1 = AnimElem = 3
attr = S,HA
hitflag = MAF
guardflag = M
animtype = Up
priority = 7,hit
damage = Ceil(IfElse(fvar(28)=0,15,21)*fvar(10)*fvar(38)/12)
pausetime = 17,17
guard.pausetime = 11,11
hitsound = S5,(4+(fvar(29)=1)*5)
guardsound = S6,1
sparkno = S(7205+(fvar(29)=1)*5)
guard.sparkno = S(7212+(fvar(29)=1)*50)
sparkxy = -10-(P2StateNo!=[120,160])*50,-80
ground.type = High
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
ground.velocity = -8,-7.5
guard.velocity = -10.35
air.velocity = -8,-7.5
fall = 1
fall.recover = 0
yaccel = .45
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = -19.8
air.cornerpush.veloff = 0
kill = 1
ID = 2030

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 2030, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


[Statedef 2010];運送
type = S
physics = N
movetype = A
anim = 2001
ctrl = 0
velset = 8+(fvar(29)=3||fvar(29)=6)*4,0
sprpriority = 2

[State -2]
type = VarSet
trigger1 = Time = 0
var(33) = 0

[State -2]
type = VarAdd
trigger1 = fvar(29) = 3 || fvar(29) = 6 
trigger1 = Time%3 = 0
var(33) = 1

[State -2]
type = VelAdd
trigger1 = fvar(29) = 3 || fvar(29) = 6 
x = .5

[State 2010, width]
type = Width
trigger1 = 1
edge = 17,0

[State 2010, targetbind]
type = TargetBind
trigger1 = Time = 0
time = -1
pos = -16,-70
ID = 2000

[State 2010, explod]
type = Explod
trigger1 = Time = 0
anim = 7415
ID = 7415
pos = -8,-66
postype = p1
bindtime = -1
removetime = -1
removeongethit = 1
sprpriority = 5

[State 2010, snd]
type = PlaySnd
trigger1 = Time = 0
value = S0,6
volume = -100

[State 2010, afterimage]
type = afterimage
trigger1 = Time = 0
time = -1
length = 7
palcolor = 0
palinvertall = 0
palcontrast = 140, 140, 230
palbright = 0, 30, 90
palpostbright = 30, 0, 30
paladd = 0, 0, 0
palmul = 1,1,1
framegap = 2
trans = add1

[State 2010, removeexplod]
type = RemoveExplod
trigger1 = FrontEdgeBodyDist <= 0
trigger2 = Time > 500
ID = 7415

[State 2010, afterimagetime]
type = AfterImageTime
trigger1 = FrontEdgeBodyDist <= 0
trigger2 = Time > 500
time = 0

[State 2010, end]
type = ChangeState
trigger1 = FrontEdgeBodyDist <= 0
trigger2 = Time > 500
value = 2011


[Statedef 2011]
type = S
physics = N
movetype = A
anim = 2002
ctrl = 0
sprpriority = 2

[State 2011, width]
type = Width
trigger1 = time = 0
edge = 80,0

[State 2011, targetbind]
type = TargetBind
trigger1 = Time = 0
pos = 68,-71
ID = 2000

[State 2011, targetstate]
type = TargetState
trigger1 = Time = 0
value = 2021
ID = 2000

[State 2011, vel]
type = VelSet
trigger1 = time = 0
x = 0

[State 2011, damage]
type = TargetLifeAdd
triggerall = fvar(29) = 1 && !fvar(26)
trigger1 = Animelem = 2
value = -Ceil((38+var(33))*(100-Random%11)*fvar(38)/10/103)
kill = 1
ID = 2000

[State 2011, damage]
type = TargetLifeAdd
triggerall = fvar(29) = 1 && fvar(26)
trigger1 = Animelem = 2
value = -200;Ceil(IfElse(fvar(28)=0,23,36)*fvar(10)*fvar(38)/12)
kill = 1
ID = 2000

[State 2011, damage]
type = TargetLifeAdd
triggerall = fvar(29) != 1
trigger1 = Animelem = 2
value = -Ceil((50+var(33))*100*fvar(38)/10/119)
kill = 1
ID = 2000

[State -2, shake]
type = EnvShake
trigger1 = AnimElem = 2
time = 12
freq = 60
ampl = -3

[State -2, env]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 1
under = 1

[State 2011, explod]
type = Explod
trigger1 = Animelem = 2
anim = 7410
pos = 63,2
postype = p1
sprpriority = 5
ownpal = 1

[State 2011, targetbind]
type = TargetBind
trigger1 = AnimElem = 2
pos = 104,-74
ID = 2000

[State 2011, snd]
type = PlaySnd
trigger1 = time = 0
value = S2,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),58,78),21)
volume = 150

[State 2011, snd]
type = PlaySnd
trigger1 = AnimElem = 2
value = S3,10
volume = 150

[State 2011, snd]
type = PlaySnd
trigger1 = AnimElem = 2
value = S3,11
volume = 150

[State 2011, targetstate]
type = targetstate
trigger1 = Animelem = 3
value = 2022
ID = 2000

[State 2011, targetbind]
type = TargetBind
trigger1 = AnimElem = 3
pos = 104-(EnemyNear(var(5)),Const(size.mid.pos.x)),IfElse(-74-(EnemyNear(var(5)),Const(size.mid.pos.y))>0,0,-74-(EnemyNear(var(5)),Const(size.mid.pos.y)))
ID = 2000

[State 2011, vel]
type = VelSet
trigger1 = Animelem = 6
x = const(velocity.run.back.x)*(1+(fvar(29)=3||fvar(29)=6)*0.5)
y = const(velocity.run.back.y)

[State 2011]
type = VelAdd
trigger1 = AnimElem = 6, > 0
trigger1 = Vel X < -1
x = .40

[State 2011]
type = VelAdd
trigger1 = AnimElem = 6, > 0
y = .75

[State 2011, end]
type = ChangeState
triggerall = Animelem = 6, >= 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 1212


[Statedef 2020]
type = S
physics = N
movetype = H
ctrl = 0
velset = 0,0
sprpriority = 3

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
trigger1 = !((P2StateNo = [1200,1300)) || (P2StateNo = [2000,2200))) 
value = 5050

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State -2]
type = ChangeAnim2
trigger1 = Time = 0
value = 2020

[State -2]
type = PalFX
trigger1 = time = 0
time = -1
add = 150,60,150
mul = 70,70,70
sinadd = 50,50,50,20
invertall = 1
color = 0

[Statedef 2021]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0
sprpriority = 1

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
trigger1 = !((P2StateNo = [1200,1300)) || (P2StateNo = [2000,2200))) 
value = 5050

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State -2]
type = ChangeAnim2
trigger1 = Time = 0
value = 2021

[State -2]
type = Width
trigger1 = 1
edge = 0,-100

[State -2]
type = PalFX
trigger1 = time = 0
time = -1
add = 150,60,150
mul = 70,70,70
sinadd = 50,50,50,20
invertall = 1
color = 0

[Statedef 2022]
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = 0

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
trigger1 = !((P2StateNo = [1200,1300)) || (P2StateNo = [2000,2200))) 
value = 5050

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State -2]
type = ChangeAnim2
trigger1 = Time = 0
value = 2022

[State -2]
type = PalFX
trigger1 = time = 0
time = 25
add = 150,60,150
mul = 70,70,70
sinadd = 50,50,50,20
invertall = 1
color = 0

[State 1222, vel]
type = VelSet
trigger1 = time = 0
x = -2
y = -7.8

[State 1222, gravity]
type = VelAdd
trigger1 = Time > 0
y = .50

[State 1222, 0]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100




;=================================================================
;MAX版ギガンテックプレッシャー
[Statedef 2100]
type = S
physics = S
movetype = A
ctrl = 0
anim = 2050
sprpriority = 2

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State -2];どこキャン時点滅
type = PalFX
triggerall = var(46)
triggerall = Time < 9
trigger1 = Time%2 = 0
time = 1
add = 255,255,255
mul = 255,255,255
ignorehitpause = 1

[State -2, 再使用制限 98UM(EX)]
type = VarSet
triggerall = fvar(29) = 4
triggerall = Time = 0
triggerall = fvar(34) = 2
trigger1 = var(53)
var(51) = 1

[State -2, power 98UM]
type = PowerAdd
triggerall = fvar(29) = 4
trigger1 = Time = 0
value = IfElse((fvar(34)=1&&var(58)=1),-3000,-1000)

[State -2, power 2002]
type = PowerAdd
triggerall = fvar(29) = 1
trigger1 = Time = 0
value = IfElse((fvar(26)=1&&var(58)=1),-3000,-1000)

[State -2, power S]
type = PowerAdd
triggerall = !(fvar(29) = 1 || fvar(29) = 4)
trigger1 = Time = 0
value = IfElse(var(58)=1,-2000,IfElse(!var(53),-1000,IfElse(!var(52),-1000,0)))

[State -2, max reset]
type = VarSet
trigger1 = Time = 0
trigger1 = var(52)
var(52) = 0

[State -2, nothitby]
type = NotHitBy
triggerall = !(fvar(29) = 3 || fvar(29) = 6)
trigger1 = AnimElem = 5, < 0
value = SCA
time = 1

[State -2, nothitby]
type = NotHitBy
triggerall = (fvar(29) = 3 || fvar(29) = 6)
trigger1 = AnimElem = 6, < 0
value = SCA
time = 1

[State -2, pause]
type = Pause
trigger1 = Time = 2
time = 28
movetime = 28

[State -2]
type = VelSet
trigger1 = Time = 2
x = 0
y = 0

[State -2, env]
type = EnvColor
trigger1 = Time = 2
value = 255,255,255
time = 4
under = 1

[State -2, env]
type = EnvColor
trigger1 = Time = 6
value = 0,0,0
time = 24
under = 1

[State -2, snd]
type = PlaySnd
trigger1 = time = 2
value = S8,IfElse(fvar(29)=1,11,1)

[State -2, explod 2002]
type = Explod
triggerall = fvar(29) = 1
trigger1 = Time = 0 + 4;要調整
anim = 7630
pos = -48,-104;要調整
postype = p1
sprpriority = -1
pausemovetime = 99999
ownpal = 1

[State -2, explod 2002]
type = Explod
triggerall = fvar(29) = 1
trigger1 = Time = 10 + 4;要調整
anim = 7570
pos = -48,-104;要調整
postype = p1
sprpriority = 3
pausemovetime = 99999
ownpal = 1

[State -2, explod 98UM]
type = Explod
triggerall = fvar(29) != 1
trigger1 = Time = 0 + 6;要調整
anim = 7610
ID = 7610
pos = -48,-104;要調整
postype = p1
facing = 1
removetime = -2
sprpriority = -1
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State -2, explod]
type = Explod
triggerall = fvar(29) != 1
trigger1 = Time = 8 + 6;要調整
anim = 7615
ID = 7615
pos = -48,-104;要調整
postype = p1
facing = 1
removetime = -2
sprpriority = 4
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State 2000, vel]
type = VelSet
trigger1 = AnimElem = 5, >= 0 && AnimElem = 13, < 0
x = 8+(fvar(29)=3||fvar(29)=6)*4

[State 2000, snd]
type = PlaySnd
trigger1 = AnimElem = 5
value = S0,3
loop = 1
channel = 1

[State 2000, stopsnd]
type = StopSnd
trigger1 = Time = 0
trigger2 = Animelem = 13
channel = 1

[State 2000, varreset]
type = VarSet
trigger1 = Time = 0
trigger2 = !(fvar(29) = 1 || fvar(29) = 4) || fvar(26)
trigger2 = !(P2MoveType = H && P2StateNo = [3050,3070))
var(33) = 0

[State 2000, varset]
type = VarSet
trigger1 = !(fvar(29) = 1 || fvar(29) = 4) || fvar(26)
trigger1 = P2MoveType = H && P2StateNo = [3050,3070)
var(33) = 1

[State 2000, hitdef]
type = HitDef
trigger1 = !var(9) || !(fvar(29) = 1 || fvar(29) = 4) || fvar(26)
trigger1 = !var(8)
trigger1 = AnimElem = 5
trigger1 = !var(33)
attr = S,HA
hitflag = MAF
guardflag = M
animtype = Back
priority = 7,hit
guard.pausetime = 0,0
hitsound = S5,1
sparkno = S(7205+(fvar(29)=1)*50)
guard.sparkno = -1
sparkxy = 0,-60
ground.type = High
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -5,-7.5
air.velocity = -5,-7.5
guard.velocity = -5
p2facing = 1
fall = 1
fall.recover = 0
yaccel = .45
ID = 2100
kill = 0
givepower = 15,15

[State 2000, hitdef]
type = HitDef
trigger1 = !var(9) || !(fvar(29) = 1 || fvar(29) = 4) || fvar(26)
trigger1 = !var(8)
trigger1 = AnimElem = 5
trigger1 = var(33)
attr = S,HA
hitflag = MAFD
guardflag = M
animtype = Back
priority = 7,hit
guard.pausetime = 0,0
hitsound = S5,1
sparkno = S(7205+(fvar(29)=1)*50)
guard.sparkno = -1
sparkxy = 0,-60
ground.type = High
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -5,-7.5
air.velocity = -5,-7.5
guard.velocity = -5
p2facing = 1
fall = 1
fall.recover = 0
yaccel = .45
ID = 2100
kill = 0
givepower = 15,15

[State 2000]
type = Projectile
trigger1 = !var(9) || !(fvar(29) = 1 || fvar(29) = 4) || fvar(26)
trigger1 = !var(8)
trigger1 = AnimElem = 5, >= 0 && AnimElem = 11, < 0
trigger1 = P2BodyDist X = [-5,20]
trigger1 = P2StateNo = 3070
ID = 2100
projID = 2080
projanim = 2080
projremovetime = 10
postype = p1
offset = 30,0
attr = S,HA
hitflag = MAFD
guardflag = M
hitsound = S5,1
sparkno = S(7205+(fvar(29)=1)*50)
guard.sparkno = -1
sparkxy = 0,-60
numhits = 0
p2facing = 1
p2stateno = 2120

[State 2100, targetdrop]
type = TargetDrop
trigger1 = NumTarget(2100)
excludeID = 2100
keepone = 0
ignorehitpause = 1

[State 2100, nothitby]
type = NotHitBy
trigger1 = NumTarget(2100)
trigger1 = MoveHit
value = SCA
time = 1
ignorehitpause = 1

[State 2100, hit]
type = TargetState
triggerall = NumTarget(2100)
trigger1 = MoveHit
trigger1 = Target,StateNo != 2120
value = 2120
ID = 2100
ignorehitpause = 1

[State 2000, hit]
type = ChangeState
triggerall = NumTarget(2100)
trigger1 = MoveHit
trigger1 = P2StateNo = 2120
value = 2110
ignorehitpause = 1

[State 2000, hit]
type = ChangeState
triggerall = ProjHitTime(2080) = 0
trigger1 = P2StateNo = 2120
value = 2110
ignorehitpause = 1

[State 2000, guarded]
type = ChangeState
trigger1 = MoveGuarded 
trigger2 = MoveHit > 1
value = 2030
ignorehitpause = 1

[State 2000, afterimagetime]
type = afterimage
trigger1 = AnimElem = 5
time = -1
length = 7
palcolor = 0
palinvertall = 0
palcontrast = 140, 140, 230
palbright = 0, 30, 90
palpostbright = 30, 0, 30
paladd = 0, 0, 0
palmul = 1,1,1
framegap = 2
trans = add1

[State 2000, afterimage]
type = afterimage
trigger1 = AnimElem = 13
time = 1

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 2100, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


[Statedef 2110];登り運送
type = S
physics = N
movetype = A
anim = 2001
ctrl = 0
velset = 8+(fvar(29)=3||fvar(29)=6)*4,0
sprpriority = 2

[State -2]
type = VarSet
trigger1 = Time = 0
var(33) = 0

[State -2]
type = VarAdd
trigger1 = fvar(29) = 3 || fvar(29) = 6 
trigger1 = Time%3 = 0
var(33) = 1

[State -2]
type = VelAdd
trigger1 = fvar(29) = 3 || fvar(29) = 6 
x = .5

[State 2110]
type = Width
trigger1 = 1
edge = 17,0

[State 2110, targetbind]
type = TargetBind
trigger1 = Time = 0
time = -1
pos = -16,-70
ID = 2100

[State 2110, explod]
type = Explod
trigger1 = Time = 0
anim = 7415
ID = 7415
pos = -8,-66
postype = p1
bindtime = -1
removetime = -1
removeongethit = 1
sprpriority = 5

[State 2110, snd]
type = PlaySnd
trigger1 = Time = 0
value = S0,6
volume = -100

[State 2110, afterimage]
type = afterimage
trigger1 = Time = 0
time = -1
length = 7
palcolor = 0
palinvertall = 0
palcontrast = 140, 140, 230
palbright = 0, 30, 90
palpostbright = 30, 0, 30
paladd = 0, 0, 0
palmul = 1,1,1
framegap = 2
trans = add1

[State 2110]
type = RemoveExplod
trigger1 = FrontEdgeBodyDist <= 0
trigger2 = Time > 500
ID = 7415

[State 2110, 0]
type = AfterImageTime
trigger1 = FrontEdgeBodyDist <= 0
trigger2 = Time > 500
time = 1

[State 2110, 0]
type = ChangeState
trigger1 = FrontEdgeBodyDist <= 0
trigger2 = Time > 500
value = 2111

[Statedef 2111];オロチ叩きつけ1
type = S
physics = N
movetype = A
anim = 2111
ctrl = 0
sprpriority = 2

[State 2110, 0]
type = AfterImageTime
trigger1 = Time = 0
time = 0

[State 2011, width]
type = Width
trigger1 = time = 0
edge = 95,0

[State 2010, 0]
type = TargetBind
trigger1 = Time = 0
pos = 68,-71
ID = 2100

[State 2011, 0]
type = TargetState
trigger1 = Time = 0
value = 2121
ID = 2100

[State 2010, 0]
type = VelSet
trigger1 = time = 0
x = 0

[State 2111, damage]
type = TargetLifeAdd
triggerall = fvar(29) = 1 && !fvar(26)
trigger1 = Animelem = 2
value = -Ceil((29+var(33))*(100-Random%11)*fvar(38)/10/103)
kill = 0
ID = 2100

[State 2111, damage]
type = TargetLifeAdd
triggerall = fvar(29) = 1 && fvar(26)
trigger1 = Animelem = 2
value = -Ceil(IfElse(fvar(28)=0,20,28)*fvar(10)*fvar(38)/12)
kill = 0
ID = 2100

[State 2111, damage]
type = TargetLifeAdd
triggerall = fvar(29) != 1
trigger1 = Animelem = 2
value = -Ceil((34+var(33))*100*fvar(38)/10/119)
kill = 0
ID = 2100

[State 2011, 0]
type = TargetBind
trigger1 = AnimElem = 2
pos = 104,-74
ID = 2100

[State -2, shake]
type = EnvShake
trigger1 = AnimElem = 2
time = 12
freq = 60
ampl = -3

[State -2, env]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 1
under = 1

[State 2011, orochi]
type = Explod
trigger1 = AnimElem = 2
anim = 7410
pos = 63,2
sprpriority = 5
ownpal = 1
ignorehitpause = 1

[State 2011, snd]
type = PlaySnd
trigger1 = fvar(29) != [1,3]
trigger1 = AnimElem = 2
value = S2,20
volume = 150

;[State 2011, snd]
;type = PlaySnd
;trigger1 = AnimElem = 2
;value = S3,10
;volume = 150

[State 2011, snd]
type = PlaySnd
trigger1 = AnimElem = 2
value = S3,11

[State 2111, turn]
type = TargetState
trigger1 = AnimElem = 3
value = 2122
ID = 2100

[State 2111, turn]
type = TargetBind
trigger1 = AnimElem = 3
value = 68,-71
ID = 2100

[State 2111, turn]
type = Turn
trigger1 = AnimElem = 5

[State 2111, turn]
type = TargetBind
trigger1 = AnimElem = 4
pos = 34,-73
ID = 2100

[State 2111, turn]
type = TargetBind
trigger1 = AnimElem = 5
pos = 2,-74
ID = 2100

[State 2111, targetstate]
type = TargetState
trigger1 = AnimTime = 0
value = 2120
ID = 2100

[State 2111, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 2112


[Statedef 2112];下り運送
type = S
physics = N
movetype = A
anim = 2001
ctrl = 0
velset = 0,0
sprpriority = 2

[State -2]
type = VarSet
trigger1 = Time = 0
var(33) = 0

[State -2]
type = VarAdd
triggerall = Time >= 4
trigger1 = fvar(29) = 3 || fvar(29) = 6 
trigger1 = Time%3 = 1
var(33) = 1

[State -2]
type = VelAdd
triggerall = Time >= 4
trigger1 = fvar(29) = 3 || fvar(29) = 6 
x = .5

[State 2112]
type = VelSet
trigger1 = Time = 4
x = 8+(fvar(29)=3||fvar(29)=6)*4

[State 2010]
type = Width
trigger1 = 1
edge = 17,0

[State 2010, 0]
type = TargetBind
trigger1 = Time = 0
time = -1
pos = -16,-70
ID = 2100

[State 2010, explod]
type = Explod
trigger1 = Time = 0
anim = 7415
ID = 7415
pos = -8,-66
postype = p1
bindtime = -1
removetime = -1
removeongethit = 1
sprpriority = 5

[State 2010, snd]
type = PlaySnd
trigger1 = Time = 4
value = S0,6
volume = -100

[State 2110, afterimage]
type = afterimage
trigger1 = Time = 0
time = -1
length = 7
palcolor = 0
palinvertall = 0
palcontrast = 140, 140, 230
palbright = 0, 30, 90
palpostbright = 30, 0, 30
paladd = 0, 0, 0
palmul = 1,1,1
framegap = 2
trans = add1

[State 2010]
type = RemoveExplod
trigger1 = FrontEdgeBodyDist <= 0
trigger2 = Time > 500
ID = 7415

[State 2010, 0]
type = AfterImageTime
trigger1 = FrontEdgeBodyDist <= 0
trigger2 = Time > 500
time = 1

[State 2010, 0]
type = ChangeState
trigger1 = frontEdgeBodyDist <= 0
trigger2 = Time > 500
value = 2113


[Statedef 2113];オロチ叩きつけ2
type = S
physics = N
movetype = A
anim = 2002
ctrl = 0
sprpriority = 2

[State 2011, width]
type = Width
trigger1 = time = 0
edge = 95,0

[State 2010, 0]
type = TargetBind
trigger1 = Time = 0
pos = 68,-71
ID = 2100

[State 2011, 0]
type = TargetState
trigger1 = Time = 0
value = 2121
ID = 2100

[State 2010, 0]
type = VelSet
trigger1 = time = 0
x = 0

[State 2111, damage]
type = TargetLifeAdd
triggerall = fvar(29) = 1 && !fvar(26)
trigger1 = Animelem = 2
value = -Ceil((29+var(33))*(100-Random%11)*fvar(38)/10/103)
kill = 1
ID = 2100

[State 2111, damage]
type = TargetLifeAdd
triggerall = fvar(29) = 1 && fvar(26)
trigger1 = Animelem = 2
value = -190;Ceil(IfElse(fvar(28)=0,20,28)*fvar(10)*fvar(38)/12)
kill = 1
ID = 2100

[State 2111, damage]
type = TargetLifeAdd
triggerall = fvar(29) != 1
trigger1 = Animelem = 2
value = -Ceil((34+var(33))*100*fvar(38)/10/119)
kill = 1
ID = 2100

[State 2011, 0]
type = TargetBind
trigger1 = AnimElem = 2
pos = 104,-74
ID = 2100

[State -2, shake]
type = EnvShake
trigger1 = AnimElem = 2
time = 12
freq = 60
ampl = -3

[State -2, env]
type = EnvColor
trigger1 = AnimElem = 2
value = 255,255,255
time = 1
under = 1

[State 2011, orochi]
type = Explod
trigger1 = AnimElem = 2
anim = 7410
pos = 63,2
sprpriority = 5
ownpal = 1
ignorehitpause = 1

[State 2011, snd]
type = PlaySnd
trigger1 = AnimElem = 2
value = S3,10
volume = 150

[State 2011, snd]
type = PlaySnd
trigger1 = AnimElem = 2
value = S3,11
volume = 150

[State 2011, snd]
type = PlaySnd
trigger1 = AnimElem = 1
trigger1 = fvar(29) = [4,6]
value = S2,21
volume = 150

[State 2011, snd]
type = PlaySnd
trigger1 = AnimElem = 1
trigger1 = fvar(26) = 1
value = S2,78
volume = 150

[State 2011, 0]
type = targetstate
trigger1 = Animelem = 3
value = 2123
ID = 2100

[State 2011, 0]
type = TargetBind
trigger1 = AnimElem = 3
pos = 104-(EnemyNear(var(5)),Const(size.mid.pos.x)),IfElse(-74-(EnemyNear(var(5)),Const(size.mid.pos.y))>0,0,-74-(EnemyNear(var(5)),Const(size.mid.pos.y)))
ID = 2100

[State 2111, vel]
type = VelSet
trigger1 = Animelem = 6
x = const(velocity.run.back.x)*(1+(fvar(29)=3||fvar(29)=6)*0.5)
y = const(velocity.run.back.y)

[State 2111]
type = VelAdd
trigger1 = AnimElem = 6, >= 0
trigger1 = Vel X < -1
x = .40

[State 2111]
type = VelAdd
trigger1 = AnimElem = 6, > 0
y = .75

[State 2111, end]
type = ChangeState
triggerall = Animelem = 6, >= 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 1212


[Statedef 2120];相手側
type = S
physics = N
movetype = H
ctrl = 0
velset = 0,0
sprpriority = 3

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
trigger1 = !((P2StateNo = [1200,1300)) || (P2StateNo = [2000,2200))) 
value = 5050

[State 2020, 0]
type = ChangeAnim2
trigger1 = Time = 0
value = 2020

[State 2020, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 2020, 0]
type = PalFX
trigger1 = time = 0
time = -1
add = 150,60,150
mul = 70,70,70
sinadd = 50,50,50,20
invertall = 1
color = 0

[Statedef 2121]
type = S
physics = N
movetype = H
ctrl = 0
velset = 0,0
sprpriority = 1

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
trigger1 = !((P2StateNo = [1200,1300)) || (P2StateNo = [2000,2200))) 
value = 5050

[State 2021, 0]
type = Width
trigger1 = 1
edge = 0,-100

[State 2020, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 2020, 0]
type = PalFX
trigger1 = time = 0
time = -1
add = 150,60,150
mul = 70,70,70
sinadd = 50,50,50,20
invertall = 1
color = 0

[State 2021, 0]
type = ChangeAnim2
trigger1 = time = 0
value = 2021

[Statedef 2122];折り返し
type = S
physics = N
movetype = H
ctrl = 0
velset = 0,0
sprpriority = 4

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
trigger1 = !((P2StateNo = [1200,1300)) || (P2StateNo = [2000,2200))) 
value = 5050

[State 2020, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 2020, 0]
type = PalFX
trigger1 = time = 0
time = -1
add = 150,60,150
mul = 70,70,70
sinadd = 50,50,50,20
invertall = 1
color = 0

[State 2021, 0]
type = ChangeAnim2
trigger1 = time = 0
value = 2122

[State 2122,turn]
type = Turn
trigger1 = AnimElem = 3


[Statedef 2123];吹き飛び
type = S
physics = N
movetype = H
ctrl = 0
velset = 0,0
sprpriority = 0

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
trigger1 = !((P2StateNo = [1200,1300)) || (P2StateNo = [2000,2200))) 
value = 5050

[State 2020, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 2020, 0]
type = PalFX
trigger1 = time = 0
time = 25
add = 150,60,150
mul = 70,70,70
sinadd = 50,50,50,20
invertall = 1
color = 0

[State 2022, 0]
type = Changeanim2
trigger1 = time = 0
value = 2022

[State 2022, 0]
type = VelSet
trigger1 = time = 0
x = -2
y = -7.8

[State 2022, 0]
type = VelAdd
trigger1 = Time > 0
y = .50

[State 2022, 0]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= -20
value = 5100


;=================================================================
;ルガールエクスキュージョンX
[Statedef 2200]
type = S
movetype = A
physics = S
anim = 2200
ctrl = 0
sprpriority = 2

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State -2];どこキャン時点滅
type = PalFX
triggerall = var(46)
triggerall = Time < 9
trigger1 = Time%2 = 0
time = 1
add = 255,255,255
mul = 255,255,255
ignorehitpause = 1

[State -2, 再使用制限 98UM(EX)]
type = VarSet
triggerall = fvar(29) = 4
triggerall = Time = 0
triggerall = fvar(34) = 2
triggerall = var(53)
trigger1 = !(Power >= 1000 || var(52))
var(51) = 1

[State -2, power 98UM]
type = PowerAdd
triggerall = fvar(29) = 4
trigger1 = Time = 0
value = IfElse(var(52),0,-IfElse((var(51)),0,1000))

[State -2, power 2002]
type = PowerAdd
triggerall = fvar(29) = 1
trigger1 = Time = 0
trigger1 = !var(52)
value = -1000

[State -2, power S]
type = PowerAdd
triggerall = !(fvar(29) = 1 || fvar(29) = 4)
trigger1 = Time = 0
value = IfElse((var(52)||var(53)),0,-1000)

[State -2, max reset]
type = VarSet
trigger1 = Time = 0
trigger1 = var(52)
var(52) = 0

[State -2, pause]
type = Pause
trigger1 = Time = 2
time = 28
movetime = 28

[State -2]
type = VelSet
trigger1 = Time = 2
x = 0
y = 0

[State -2, env]
type = EnvColor
trigger1 = Time = 2
value = 255,255,255
time = 4
under = 1

[State -2, env]
type = EnvColor
trigger1 = Time = 6
value = 0,0,0
time = 24
under = 1

[State -2, snd]
type = PlaySnd
trigger1 = time = 2
value = S8,1

[State -2, explod 2002]
type = Explod
triggerall = fvar(29) = 1
trigger1 = Time = 0 + 4;要調整
anim = 7620
pos = 28,-93
postype = p1
sprpriority = -1
pausemovetime = 99999
ownpal = 1

[State -2, explod 2002]
type = Explod
triggerall = fvar(29) = 1
trigger1 = Time = 10 + 4;要調整
anim = 7560
pos = 28,-93
postype = p1
sprpriority = 3
pausemovetime = 99999
ownpal = 1

[State -2, explod 98UM]
type = Explod
triggerall = fvar(29) != 1
trigger1 = Time = 0 + 6;要調整
anim = 7600
ID = 7600
pos = 28,-93
postype = p1
facing = 1
removetime = -2
sprpriority = -1
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State -2, explod]
type = Explod
triggerall = fvar(29) != 1
trigger1 = Time = 8 + 6;要調整
anim = 7605
ID = 7605
pos = 28,-93
postype = p1
facing = 1
removetime = -2
sprpriority = 4
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State 2200, explod]
type = Explod
trigger1  = AnimElem = 4
anim = 8022
ID = 8022
pos = 24,-106
postype = p1
bindtime = -1
sprpriority = 3
pausemovetime = 99999
ownpal = 1
removeongethit = 1

[State 2200, explod]
type = ModifyExplod
trigger1 = AnimElem = 5
ID = 8022
pos = 27,-88
postype = p1

[State 2200, explod]
type = ModifyExplod
trigger1 = AnimElem = 6
ID = 8022
pos = 26,-86
postype = p1
bindtime = 1

[State 2200, explod]
type = Explod
trigger1  = AnimElem = 9
anim = 8023
ID = 8023
pos = 0,0
postype = p1
bindtime = -1
removetime = -1
sprpriority = 2
pausemovetime = 99999
ownpal = 1
removeongethit = 1

[State 2200, removeexplod]
type = RemoveExplod
trigger1 = AnimElem = 10
ID = 8023

[State 2200, explod]
type = Explod
trigger1  = AnimElem = 10
anim = 8024
ID = 8024
pos = 88,-82
postype = p1
bindtime = 1
sprpriority = 3
pausemovetime = 99999
ownpal = 1
removeongethit = 1

[State 2200, nothitby]
type = NotHitBy
trigger1 = Time <= 2
value = SCA
time = 1

[State 2200, hitby]
type = HitBy
triggerall = !(fvar(29) = 3 || fvar(29) = 6)
trigger1 = Time > 2
value = SCA,AT
time = 1

[State -2, nothitby]
type = NotHitBy
triggerall = (fvar(29) = 3 || fvar(29) = 6)
trigger1 = 1
value = SCA
time = 1

[State 2200, snd]
type = PlaySnd
trigger1 = AnimElem = 9
value = S3,15

[State 2200, vel]
type = VelSet
trigger1 = AnimElem = 9, >= 0 && AnimElem = 11, < 0
x = 11.8*(1+(fvar(29)=3||fvar(29)=6)*0.5)

[State 2200, vel]
type = VelSet
trigger1 = AnimElem = 11
x = 0

[State -2, overkill];オーバーキルリセット
type = varset
trigger1 = Time = 0
var(20) = 0

[State 2200, hitdef]
type = HitDef
triggerall = fvar(26) != 1
triggerall = !var(9) || !(fvar(29) = 1 || fvar(29) = 4)
trigger1 = AnimElem = 11
attr = S,HA
hitflag = MAF
guardflag = M
animtype = Hard
priority = 7,hit
pausetime = 0,11
guard.pausetime = 5,3
hitsound = S5,15
guardsound = S6,1
sparkno = S7203
guard.sparkno = S7212
sparkxy = 0,-60
ground.type = Low
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -4,-7.5
air.velocity = -4,-7.5
guard.velocity = -10.35
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = -19.8
air.cornerpush.veloff = 0
p2facing = 1
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
yaccel = .55
ID = 2200
kill = 0
givepower = 15,15
ignorehitpause = 1

[State 2200, hitdef]
type = HitDef
triggerall = fvar(26) = 1
triggerall = var(9) = 1
trigger1 = AnimElem = 11
attr = S,HA
hitflag = MAF
guardflag = M
animtype = Hard
priority = 7,hit
pausetime = 0,11
guard.pausetime = 5,3
hitsound = S5,15
guardsound = S6,1
sparkno = S7203
guard.sparkno = S7212
sparkxy = 0,-60
ground.type = Low
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -4,-7.5
air.velocity = -4,-7.5
guard.velocity = -10.35
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = -19.8
air.cornerpush.veloff = 0
p2facing = 1
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
yaccel = .55
ID = 2200
kill = 0
givepower = 15,15
ignorehitpause = 1


[State 2200, targetdrop]
type = TargetDrop
trigger1 = NumTarget(2200)
excludeID = 2200
keepone = 0
ignorehitpause = 1

[State 2200, nothitby]
type = NotHitBy
trigger1 = NumTarget(2200)
trigger1 = MoveHit
value = SCA
time = 1
ignorehitpause = 1

[State 2200, hit]
type = TargetState
triggerall = NumTarget(2200)
trigger1 = MoveHit
trigger1 = Target,MoveType = H
trigger1 = Target,StateNo != 2230
value = 2230
ID = 2200
ignorehitpause = 1

[State 2200, hit]
type = ChangeState
trigger1 = MoveHit
trigger1 = P2StateNo = 2230
value = 2210
ignorehitpause = 1

[State 2200, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 2201


;=================================================================
;ルガールエクスキュージョンY
[Statedef 2250]
type = S
movetype = A
physics = S
anim = 2250
ctrl = 0
sprpriority = 2

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State -2];どこキャン時点滅
type = PalFX
triggerall = var(46)
triggerall = Time < 9
trigger1 = Time%2 = 0
time = 1
add = 255,255,255
mul = 255,255,255
ignorehitpause = 1

[State -2, 再使用制限 98UM(EX)]
type = VarSet
triggerall = fvar(29) = 4
triggerall = Time = 0
triggerall = fvar(34) = 2
triggerall = var(53)
trigger1 = !(Power >= 1000 || var(52))
var(51) = 1

[State -2, power 98UM]
type = PowerAdd
triggerall = fvar(29) = 4
trigger1 = Time = 0
value = IfElse(var(52),0,-IfElse((var(51)),0,1000))

[State -2, power 2002]
type = PowerAdd
triggerall = fvar(29) = 1
trigger1 = Time = 0
trigger1 = !var(52)
value = -1000

[State -2, power S]
type = PowerAdd
triggerall = !(fvar(29) = 1 || fvar(29) = 4)
trigger1 = Time = 0
value = IfElse((var(52)||var(53)),0,-1000)

[State -2, max reset]
type = VarSet
trigger1 = Time = 0
trigger1 = var(52)
var(52) = 0

[State -2, pause]
type = Pause
trigger1 = Time = 2
time = 28
movetime = 28

[State -2]
type = VelSet
trigger1 = Time = 2
x = 0
y = 0

[State -2, env]
type = EnvColor
trigger1 = Time = 2
value = 255,255,255
time = 4
under = 1

[State -2, env]
type = EnvColor
trigger1 = Time = 6
value = 0,0,0
time = 24
under = 1

[State -2, snd]
type = PlaySnd
trigger1 = time = 2
value = S8,1

[State -2, explod 2002]
type = Explod
triggerall = fvar(29) = 1
trigger1 = Time = 0 + 4;要調整
anim = 7620
pos = 28,-93
postype = p1
sprpriority = -1
pausemovetime = 99999
ownpal = 1

[State -2, explod 2002]
type = Explod
triggerall = fvar(29) = 1
trigger1 = Time = 10 + 4;要調整
anim = 7560
pos = 28,-93
postype = p1
sprpriority = 3
pausemovetime = 99999
ownpal = 1

[State -2, explod 98UM]
type = Explod
triggerall = fvar(29) != 1
trigger1 = Time = 0 + 6;要調整
anim = 7600
ID = 7600
pos = 28,-93
postype = p1
facing = 1
removetime = -2
sprpriority = -1
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State -2, explod]
type = Explod
triggerall = fvar(29) != 1
trigger1 = Time = 8 + 6;要調整
anim = 7605
ID = 7605
pos = 28,-93
postype = p1
facing = 1
removetime = -2
sprpriority = 4
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State 2200, explod]
type = Explod
trigger1  = AnimElem = 4
anim = 8022
ID = 8022
pos = 24,-106
postype = p1
bindtime = -1
sprpriority = 3
pausemovetime = 99999
ownpal = 1
removeongethit = 1

[State 2200, explod]
type = ModifyExplod
trigger1 = AnimElem = 5
ID = 8022
pos = 27,-88
postype = p1

[State 2200, explod]
type = ModifyExplod
trigger1 = AnimElem = 6
ID = 8022
pos = 26,-86
postype = p1
bindtime = 1

[State 2200, explod]
type = Explod
trigger1  = AnimElem = 9
anim = 8023
ID = 8023
pos = 0,0
postype = p1
bindtime = -1
removetime = -1
sprpriority = 2
pausemovetime = 99999
ownpal = 1
removeongethit = 1

[State 2200, removeexplod]
type = RemoveExplod
trigger1 = AnimElem = 10
ID = 8023

[State 2200, explod]
type = Explod
trigger1  = AnimElem = 10
anim = 8024
ID = 8024
pos = 88,-82
postype = p1
bindtime = 1
sprpriority = 3
pausemovetime = 99999
ownpal = 1
removeongethit = 1

[State 2200, nothitby]
type = NotHitBy
trigger1 = Time <= 2
value = SCA
time = 1

[State 2200, hitby]
type = HitBy
triggerall = !(fvar(29) = 3 || fvar(29) = 6)
trigger1 = Time > 2
value = SCA,AT
time = 1

[State -2, nothitby]
type = NotHitBy
triggerall = (fvar(29) = 3 || fvar(29) = 6)
trigger1 = 1
value = SCA
time = 1

[State 2200, snd]
type = PlaySnd
trigger1 = AnimElem = 9
value = S3,15

[State 2200, vel]
type = VelSet
trigger1 = AnimElem = 9, >= 0 && AnimElem = 11, < 0
x = 11.8*(1+(fvar(29)=3||fvar(29)=6)*0.5)

[State 2200, vel]
type = VelSet
trigger1 = AnimElem = 11
x = 0

[State -2, overkill];オーバーキルリセット
type = varset
trigger1 = Time = 0
var(20) = 0

[State 2200, hitdef]
type = HitDef
triggerall = fvar(26) != 1
trigger1 = !var(9) || !(fvar(29) = 1 || fvar(29) = 4)
trigger1 = AnimElem = 11
attr = S,HA
hitflag = MAF
guardflag = M
animtype = Hard
priority = 7,hit
pausetime = 0,11
guard.pausetime = 5,3
hitsound = S5,15
guardsound = S6,1
sparkno = S7203
guard.sparkno = S7212
sparkxy = 0,-60
ground.type = Low
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -4,-7.5
air.velocity = -4,-7.5
guard.velocity = -10.35
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = -19.8
air.cornerpush.veloff = 0
p2facing = 1
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
yaccel = .55
ID = 2200
kill = 0
givepower = 15,15

[State 2200, hitdef]
type = HitDef
triggerall = fvar(26) = 1
trigger1 = var(9) = 1
trigger1 = AnimElem = 11
attr = S,HA
hitflag = MAF
guardflag = M
animtype = Hard
priority = 7,hit
pausetime = 0,11
guard.pausetime = 5,3
hitsound = S5,15
guardsound = S6,1
sparkno = S7203
guard.sparkno = S7212
sparkxy = 0,-60
ground.type = Low
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -4,-7.5
air.velocity = -4,-7.5
guard.velocity = -10.35
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = -19.8
air.cornerpush.veloff = 0
p2facing = 1
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
yaccel = .55
ID = 2200
kill = 0
givepower = 15,15

[State 2200, targetdrop]
type = TargetDrop
trigger1 = NumTarget(2200)
excludeID = 2200
keepone = 0
ignorehitpause = 1

[State 2200, nothitby]
type = NotHitBy
trigger1 = NumTarget(2200)
trigger1 = MoveHit
value = SCA
time = 1
ignorehitpause = 1

[State 2200, hit]
type = TargetState
triggerall = NumTarget(2200)
trigger1 = MoveHit
trigger1 = Target,MoveType = H
trigger1 = Target,StateNo != 2230
value = 2230
ID = 2200
ignorehitpause = 1

[State 2200, hit]
type = ChangeState
trigger1 = MoveHit
trigger1 = P2StateNo = 2230
value = 2210
ignorehitpause = 1

[State 2200, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 2201

[Statedef 2201]
type = S
movetype = I
physics = S
ctrl = 0
anim = 2201
velset = 0,0
sprpriority = 2

[State 2201, pos]
type = PosAdd
trigger1 = AnimTime = 0
x = -12

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 2201, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


[Statedef 2210]
type = S
movetype = A
physics = S
ctrl = 0
anim = 2210
velset = 0,0
sprpriority = 2

[State 2210, bind]
type = TargetBind
trigger1 = Time = 0
pos = 95,-61
ID = 2200

[State 2210, width]
type = Width
trigger1 = Time = 0
edge = 110,0
ID = 2200

[State 2210, bind]
type = TargetBind
trigger1 = AnimElem = 2
pos = 97,-66
ID = 2200

[State 2210, bind]
type = TargetBind
trigger1 = AnimElem = 3
pos = 75,-69
ID = 2200

[State 2210, bind]
type = TargetBind
trigger1 = AnimElem = 4
pos = 48,-121
ID = 2200

[State 2210, bind]
type = TargetBind
trigger1 = AnimElem = 5
pos = 46,-125
ID = 2200

[State 2200, explod]
type = Explod
trigger1  = AnimElem = 5, = 6
anim = 8025
ID = 8025
pos = 0,0
postype = p1
bindtime = -1
removetime = -1
sprpriority = 3
pausemovetime = 99999
ownpal = 1

[State 2200, overkill];オーバーキル判定
type = varset
triggerall = NumTarget(2200) = 1
trigger1 = Target,life <= 1
var(20) = 1

[State 2200, env]
type = EnvColor
trigger1 = AnimElem = 5, > 7 && AnimElem = 5, < 168
trigger1 = Time%8= 6
value = 255,255,255
time = 1
under = 1

[State 2200, damage]
type = TargetLifeAdd
triggerall = fvar(26) != 1
trigger1 = AnimElem = 5, > 7 && AnimElem = 5, < 168
trigger1 = Time%8= 5
value = -Ceil(2*100*fvar(10)*fvar(38)/10/119)
kill = 0
ID = 2200

[State 2200, damage]
type = TargetLifeAdd
triggerall = fvar(26) != 1
triggerall = !var(20)
trigger1 = AnimElem = 5, = 168
value = -Ceil(2*100*fvar(10)*fvar(38)/10/119)
kill = 1
ID = 2200

[State 2200, damage]
type = TargetLifeAdd
triggerall = var(20)
trigger1 = AnimElem = 5, = 168
value = -999999
kill = 1
ID = 2200

;----------------------------------------------------
;02um
[State 2200, damage]
type = TargetLifeAdd
triggerall = fvar(26) = 1
trigger1 = AnimElem = 5, > 7 && AnimElem = 5, < 168
trigger1 = Time%8= 5
value = -10
kill = 0
ID = 2200

[State 2200, damage]
type = TargetLifeAdd
triggerall = fvar(26) = 1
triggerall = !var(20)
trigger1 = AnimElem = 5, = 168
value = -40
kill = 1
ID = 2200


[State 2210, snd]
type = PlaySnd
triggerall = fvar(29) = [4,6]
trigger1 = AnimElem = 5
value = S2,24
volume = 150

[State 2210, snd]
type = PlaySnd
triggerall = fvar(29) = [1,3]
trigger1 = AnimElem = 3
value = S10,66
volume = 150

[State 2210, snd]
type = PlaySnd
trigger1 = AnimElem = 5
value = S3,16
loop = 1
channel = 11

[State 2210, removeexplod]
type = RemoveExplod
trigger1 = AnimElem = 5, = 168
ID = 8025

[State 2210, snd]
type = StopSnd
trigger1 = AnimElem = 5, = 168
channel = 11

[State 2210, snd]
type = PlaySnd
triggerall = fvar(29) = [4,6]
trigger1 = AnimElem = 5, = 168
value = S2,25
volume = 150

[State 2210, snd]
type = PlaySnd
triggerall = fvar(29) = [1,3]
trigger1 = AnimElem = 5, = 168
value = S1,51
volume = 150

[State 2210, end]
type = ChangeState
trigger1 = AnimElem = 5, >= 168
value = 2220


[Statedef 2220]
type = S
movetype = I
physics = S
ctrl = 0
anim = 2220
sprpriority = 2

[State 2220]
type = TargetBind
trigger1 = Time = 0
pos = 46,-50
ID = 2200

[State 2220]
type = TargetState
trigger1 = Time = 0
value = 2231
ID = 2200

[State 2220, snd]
type = PlaySnd
trigger1 = Time = 0
value = S3,17

[State 2220, snd]
type = PlaySnd
triggerall = fvar(29) = [4,6]
trigger1 = AnimElem = 10
value = S1,1
volume = 150

[State 2220, snd]
type = PlaySnd
triggerall = fvar(29) = [1,3]
trigger1 = AnimElem = 10
value = S10,65
volume = 150

[State 2220, posadd]
type = PosAdd
trigger1 = AnimElem = 13
x = -4

[State -2, targetdrop]
type = TargetDrop
trigger1 = AnimTime = -1

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 2220, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


[Statedef 2230]
type = S
movetype = H
physics = N
ctrl = 0
sprpriority = 1

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
value = 5050

[State 2230]
type = ChangeAnim2
trigger1 = Time = 0
value = 2230

[State 2230, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 2230, 0]
type = PalFX
trigger1 = AnimElem = 3, = 4
time = -1
add = 150,60,150
mul = 70,70,70
sinadd = 50,50,50,20
invertall = 1
color = 0


[Statedef 2231]
type = S
movetype = H
physics = N
ctrl = 0
sprpriority = 1

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
value = 5050

[State 2230]
type = ChangeAnim2
trigger1 = Time = 0
value = 2231

[State 2230, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 2230, 0]
type = PalFX
trigger1 = Time = 0
time = 33
add = 150,60,150
mul = 70,70,70
sinadd = 50,50,50,20
invertall = 1
color = 0

[State 2231, vel]
type = VelSet
trigger1 = Time = 0
x = -4
y = -7.5

[State 2231, 0]
type = VelAdd
trigger1 = 1
y = .55

[State 2231, 0]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= -20
value = 5100


;=================================================================
;MAX版ルガールエクスキュージョン
[Statedef 2300]
type = S
movetype = A
physics = S
anim = 2250
ctrl = 0
sprpriority = 2

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State -2];どこキャン時点滅
type = PalFX
triggerall = var(46)
triggerall = Time < 9
trigger1 = Time%2 = 0
time = 1
add = 255,255,255
mul = 255,255,255
ignorehitpause = 1

[State -2, 再使用制限 98UM(EX)]
type = VarSet
triggerall = fvar(29) = 4
triggerall = Time = 0
triggerall = fvar(34) = 2
trigger1 = var(53)
var(51) = 1

[State -2, power 98UM]
type = PowerAdd
triggerall = fvar(29) = 4
trigger1 = Time = 0
value = IfElse((fvar(34)=1&&var(58)=1),-3000,-1000)

[State -2, power 2002]
type = PowerAdd
triggerall = fvar(26) != 1
triggerall = fvar(29) = 1
trigger1 = Time = 0
value = -1000

[State -2, power 02um]
type = PowerAdd
triggerall = fvar(26) = 1
trigger1 = Time = 0
value = ifelse(var(52)>0,-1000,-3000)

[State -2, power S]
type = PowerAdd
triggerall = !(fvar(29) = 1 || fvar(29) = 4)
trigger1 = Time = 0
value = IfElse(var(58)=1,-2000,IfElse(!var(53),-1000,IfElse(!var(52),-1000,0)))

[State -2, max reset]
type = VarSet
trigger1 = Time = 0
trigger1 = var(52)
var(52) = 0

[State -2, pause]
type = Pause
trigger1 = Time = 2
time = 28
movetime = 28

[State -2]
type = VelSet
trigger1 = Time = 2
x = 0
y = 0

[State -2, env]
type = EnvColor
trigger1 = Time = 2
value = 255,255,255
time = 4
under = 1

[State -2, env]
type = EnvColor
trigger1 = Time = 6
value = 0,0,0
time = 24
under = 1

[State -2, snd]
type = PlaySnd
trigger1 = time = 2
value = S8,IfElse(fvar(29)=1,11,1)

[State -2, explod 2002]
type = Explod
triggerall = fvar(29) = 1
trigger1 = Time = 0 + 4;要調整
anim = 7630
pos = 28,-93
postype = p1
sprpriority = -1
pausemovetime = 99999
ownpal = 1

[State -2, explod 2002]
type = Explod
triggerall = fvar(29) = 1
trigger1 = Time = 10 + 4;要調整
anim = 7570
pos = 28,-93
postype = p1
sprpriority = 3
pausemovetime = 99999
ownpal = 1

[State -2, explod 98UM]
type = Explod
triggerall = fvar(29) != 1
trigger1 = Time = 0 + 6;要調整
anim = 7610
ID = 7610
pos = 28,-93
postype = p1
facing = 1
removetime = -2
sprpriority = -1
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State -2, explod]
type = Explod
triggerall = fvar(29) != 1
trigger1 = Time = 8 + 6;要調整
anim = 7615
ID = 7615
pos = 28,-93
postype = p1
facing = 1
removetime = -2
sprpriority = 4
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State -2]
type = VelSet
trigger1 = Time = 2
x = 0
y = 0

[State 2200, explod]
type = Explod
trigger1  = AnimElem = 4
anim = 8022
ID = 8022
pos = 24,-106
postype = p1
bindtime = -1
sprpriority = 3
pausemovetime = 99999
ownpal = 1
removeongethit = 1

[State 2200, explod]
type = ModifyExplod
trigger1 = AnimElem = 5
ID = 8022
pos = 27,-88
postype = p1

[State 2200, explod]
type = ModifyExplod
trigger1 = AnimElem = 6
ID = 8022
pos = 26,-86
postype = p1
bindtime = 1

[State 2200, explod]
type = Explod
trigger1  = AnimElem = 9
anim = 8023
ID = 8023
pos = 0,0
postype = p1
bindtime = -1
removetime = -1
sprpriority = 2
pausemovetime = 99999
ownpal = 1
removeongethit = 1

[State 2200, removeexplod]
type = RemoveExplod
trigger1 = AnimElem = 10
ID = 8023

[State 2200, explod]
type = Explod
trigger1  = AnimElem = 10
anim = 8024
ID = 8024
pos = 88,-82
postype = p1
bindtime = 1
sprpriority = 3
pausemovetime = 99999
ownpal = 1
removeongethit = 1

[State 2200, nothitby]
type = NotHitBy
trigger1 = Time <= 2
value = SCA
time = 1

[State 2200, hitby]
type = HitBy
triggerall = !(fvar(29) = 3 || fvar(29) = 6)
trigger1 = Time > 2
value = SCA,AT
time = 1

[State -2, nothitby]
type = NotHitBy
triggerall = (fvar(29) = 3 || fvar(29) = 6)
trigger1 = 1
value = SCA
time = 1

[State 2200, snd]
type = PlaySnd
trigger1 = AnimElem = 9
value = S3,15

[State 2200, vel]
type = VelSet
trigger1 = AnimElem = 9, >= 0 && AnimElem = 11, < 0
x = 11.8*(1+(fvar(29)=3||fvar(29)=6)*0.5)

[State 2200, vel]
type = VelSet
trigger1 = AnimElem = 11
x = 0

[State -2, overkill];オーバーキルリセット
type = varset
trigger1 = Time = 0
var(20) = 0

[State 2200, hitdef]
type = HitDef
triggerall = fvar(26) != 1
trigger1 = !var(9) || !(fvar(29) = 1 || fvar(29) = 4)
trigger1 = AnimElem = 11
attr = S,HA
hitflag = MAF
guardflag = M
animtype = Hard
priority = 7,hit
pausetime = 0,11
guard.pausetime = 5,3
hitsound = S5,15
guardsound = S6,1
sparkno = S7203
guard.sparkno = S7212
sparkxy = 0,-60
ground.type = Low
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -4,-7.5
air.velocity = -4,-7.5
guard.velocity = -10.35
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = -19.8
air.cornerpush.veloff = 0
p2facing = 1
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
yaccel = .55
ID = 2200
kill = 0
givepower = 15,15


[State 2200, hitdef]
type = HitDef
triggerall = fvar(26) = 1
trigger1 = var(9) = 1
trigger1 = AnimElem = 11
attr = S,HA
hitflag = MAF
guardflag = M
animtype = Hard
priority = 7,hit
pausetime = 0,11
guard.pausetime = 5,3
hitsound = S5,15
guardsound = S6,1
sparkno = S7203
guard.sparkno = S7212
sparkxy = 0,-60
ground.type = Low
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -4,-7.5
air.velocity = -4,-7.5
guard.velocity = -10.35
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = -19.8
air.cornerpush.veloff = 0
p2facing = 1
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
yaccel = .55
ID = 2200
kill = 0
givepower = 15,15

[State 2200, targetdrop]
type = TargetDrop
trigger1 = NumTarget(2200)
excludeID = 2200
keepone = 0
ignorehitpause = 1

[State 2200, nothitby]
type = NotHitBy
trigger1 = NumTarget(2200)
trigger1 = MoveHit
value = SCA
time = 1
ignorehitpause = 1

[State 2200, hit]
type = TargetState
triggerall = NumTarget(2200)
trigger1 = MoveHit
trigger1 = Target,MoveType = H
trigger1 = Target,StateNo != 2230
value = 2230
ID = 2200
ignorehitpause = 1

[State 2200, hit]
type = ChangeState
triggerall = NumTarget(2200)
trigger1 = MoveHit
trigger1 = Target,StateNo = 2230
value = 2310
ignorehitpause = 1

[State 2200, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 2201


[Statedef 2310]
type = S
movetype = A
physics = S
ctrl = 0
anim = 2210
velset = 0,0
sprpriority = 2

[State 2210, bind]
type = TargetBind
trigger1 = Time = 0
pos = 95,-61
ID = 2200

[State 2210, width]
type = Width
trigger1 = Time = 0
edge = 110,0

[State 2210, bind]
type = TargetBind
trigger1 = AnimElem = 2
pos = 97,-66
ID = 2200

[State 2210, bind]
type = TargetBind
trigger1 = AnimElem = 3
pos = 75,-69
ID = 2200

[State 2210, bind]
type = TargetBind
trigger1 = AnimElem = 4
pos = 48,-121
ID = 2200

[State 2210, bind]
type = TargetBind
trigger1 = AnimElem = 5
pos = 46,-125
ID = 2200

[State 2200, explod]
type = Explod
trigger1  = AnimElem = 5, = 6
anim = 8025
ID = 8025
pos = 0,0
postype = p1
bindtime = -1
removetime = -1
sprpriority = 3
pausemovetime = 99999
ownpal = 1

[State 2200, overkill];オーバーキル判定
type = varset
triggerall = NumTarget(2200) = 1
trigger1 = Target,life <= 1
var(20) = 1

[State 2200, env]
type = EnvColor
trigger1 = AnimElem = 5, > 5 && AnimElem = 5, < 130
trigger1 = Time%4= 0
value = 255,255,255
time = 1
under = 1

[State 2200, damage];35
type = TargetLifeAdd
triggerall = fvar(26) != 1
trigger1 = AnimElem = 5, > 5 && AnimElem = 5, < 130
trigger1 = Time%4= 3
value = -Ceil(2*100*fvar(10)*fvar(38)/10/119)
kill = 0
ID = 2200

[State 2200, damage]
type = TargetLifeAdd
triggerall = fvar(26) != 1
triggerall = !var(20)
trigger1 = AnimElem = 5, = 130
value = -Ceil(2*100*fvar(10)*fvar(38)/10/119)
kill = 1
ID = 2200

[State 2200, damage]
type = TargetLifeAdd
triggerall = var(20)
trigger1 = AnimElem = 5, = 130
value = -999999
kill = 1
ID = 2200

;--------------------------------------------------------------------------
;02um
[State 2200, damage 02um]
type = TargetLifeAdd
triggerall = fvar(26) = 1
trigger1 = AnimElem = 5, > 5 && AnimElem = 5, < 130
trigger1 = Time%4= 3
value = -12
kill = 0
ID = 2200

[State 2200, damage]
type = TargetLifeAdd
triggerall = fvar(26) = 1
triggerall = !var(20)
trigger1 = AnimElem = 5, = 130
value = -30
kill = 1
ID = 2200


[State 2210, snd]
type = PlaySnd
triggerall = fvar(29) = [4,6]
trigger1 = AnimElem = 5
value = S2,24
volume = 150

[State 2210, snd]
type = PlaySnd
triggerall = fvar(29) = [1,3]
trigger1 = AnimElem = 3
value = S10,66
volume = 150

[State 2210, snd]
type = PlaySnd
trigger1 = AnimElem = 5
value = S3,16
loop = 1
channel = 11

[State 2210, removeexplod]
type = RemoveExplod
trigger1 = AnimElem = 5, = 130
ID = 8025

[State 2210, snd]
type = StopSnd
trigger1 = AnimElem = 5, = 130
channel = 11

[State 2210, snd]
type = PlaySnd
triggerall = fvar(29) = [4,6]
trigger1 = AnimElem = 5, = 130
value = S2,25
volume = 150

[State 2210, snd]
type = PlaySnd
triggerall = fvar(29) = [1,3]
trigger1 = AnimElem = 5, = 130
value = S1,51
volume = 150

[State 2210, end]
type = ChangeState
trigger1 = AnimElem = 5, >= 130
value = 2220


;=================================================================
;白羅滅精
[Statedef 2400]
type = S
physics = S
movetype = A
ctrl = 0
anim = 2400
sprpriority = 2

[State 2400]
type = AttackDist
trigger1 = 1
value = 300

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State -2];どこキャン時点滅
type = PalFX
triggerall = var(46)
triggerall = Time < 9
trigger1 = Time%2 = 0
time = 1
add = 255,255,255
mul = 255,255,255
ignorehitpause = 1

[State -2, 再使用制限 98UM(EX)]
type = VarSet
triggerall = fvar(29) = 4
triggerall = Time = 0
triggerall = fvar(34) = 2
triggerall = var(53)
trigger1 = !(Power >= 1000 || var(52))
var(51) = 1

[State -2, power 98UM]
type = PowerAdd
triggerall = fvar(29) = 4
trigger1 = Time = 0
value = IfElse(var(52),0,-IfElse((var(51)),0,1000))

[State -2, power 2002]
type = PowerAdd
triggerall = fvar(26) != 1
triggerall = fvar(29) = 1
trigger1 = Time = 0
trigger1 = !var(52)
value = -1000

[State -2, power 02um]
type = PowerAdd
triggerall = fvar(26) = 1
triggerall = roundState = 2
trigger1 = Time = 0
trigger1 = !var(52)
value = -1000

[State -2, power S]
type = PowerAdd
triggerall = !(fvar(29) = 1 || fvar(29) = 4)
trigger1 = Time = 0
value = IfElse((var(52)||var(53)),0,-1000)

[State -2, max reset]
type = VarSet
trigger1 = Time = 0
trigger1 = var(52)
var(52) = 0

[State -2, nothitby]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State -2, pause]
type = Pause
trigger1 = Time = 8
time = 28
movetime = 28


[State -2]
type = VelSet
trigger1 = Time = 8
x = 0
y = 0

[State -2, env]
type = EnvColor
trigger1 = Time = 8
value = 255,255,255
time = 4
under = 1

[State -2, env]
type = EnvColor
trigger1 = Time = 8
value = 0,0,0
time = 24
under = 1

[State -2, snd]
type = PlaySnd
trigger1 = time = 8
value = S8,1

[State -2, explod 2002]
type = Explod
trigger1 = Time = 0 + 10;要調整
anim = 7620
pos = 33,-115
postype = p1
sprpriority = -1
pausemovetime = 99999
ownpal = 1

[State -2, explod 2002]
type = Explod
trigger1 = Time = 10 + 10;要調整
anim = 7560
pos = 33,-115
postype = p1
sprpriority = 3
pausemovetime = 99999
ownpal = 1

[State 2400]
type = VarSet
trigger1 = Time = 0
var(26) = 0

[State 2400, proj]
type = Projectile
triggerall = NumProjID(2432) = 0
trigger1 = AnimElem = 8, >= 4
projanim = 2432
projID = 2432
hitflag = P
attr = S,HP
projpriority = 7
projremove = 1
projremanim = -1
projremovetime = 16

[State 2400, varreset]
type = VarSet
trigger1 = Time = 0
var(21) = 0

[State 2400, varset]
type = VarAdd
trigger1 = ProjHitTime(2410) != -1 && ProjHitTime(2410) < 1
trigger2 = ProjHitTime(2417) != -1 && ProjHitTime(2417) < 1
trigger3 = ProjHitTime(2420) != -1 && ProjHitTime(2420) < 1
trigger4 = ProjHitTime(2427) != -1 && ProjHitTime(2427) < 1
var(21) = 1
ignorehitpause = 1

[State 2400];ダメージ決定
type = VarSet
trigger1 = Floor(22*(0.5**var(21)))-1 >= 1
fvar(24) = Floor(22*(0.5**var(21)))-1
ignorehitpause = 1

[State 2400];ダメージ決定
type = VarSet
trigger1 = Floor(22*(0.5**var(21)))-1 < 1
fvar(24) = 1
ignorehitpause = 1

[State 2400, slow]
type = VarAdd
triggerall = var(26) <= 7
trigger1 = ProjHitTime(2410) = [0,7]
var(26) = 1
ignorehitpause = 1

[State 2400, slow]
type = VarSet
trigger1 = ProjHitTime(2410) > 7
var(26) = 0
ignorehitpause = 1

[State 2400, slow]
type = VarSet
trigger1 = var(26) <= 7
trigger1 = ProjHitTime(2420) = [0,7]
var(26) = 100
ignorehitpause = 1

[State 2400, proj1(front)]
type = Projectile
triggerall = AnimElem = 8, >= 4
trigger1 = NumProjID(2410) = 0
projID = 2410
projhits = 1
projremove = 0
projremovetime = 16
projanim = 2430
velocity = -20
projedgebound = 999
projstagebound = 999
offset = 320,0
postype = p1
attr = S,HP
hitflag = MAF
guardflag = M
animtype = UP
ground.type = High
priority = 7,hit
damage = ifelse(fvar(26)=1,17,Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103/IfElse(NumEnemy=1,2,1))),
         Ceil(IfElse(var(21)=0,2,1)*fvar(10)*(100-Random%11)*fvar(38)/10/103)
pausetime = 1,14
guard.pausetime = 1,12
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7255
guard.sparkno = S7262
sparkxy = 30,Floor((EnemyNear(var(2)),Const(size.mid.pos.y)+Floor(P2BodyDist Y))*(1-(P2StateType=C)*0.5))
hitsound = S5,9
guardsound = S6,1
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 24+14+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 8,-7
guard.velocity = 0
air.velocity = 8,-7
yaccel = .5
getpower = 0,0
givepower = 15,15
air.juggle = (var(9)&&!(fvar(29)=3||fvar(29)=6))*16
ID = 2410
persistent = 0

[State 2400, proj1(back)]
type = Projectile
triggerall = AnimElem = 8, >= 4
trigger1 = NumProjID(2420) = 0
projID = 2420
projhits = 1
projremove = 0
projremovetime = 16
projanim = 2430
velocity = 20
projedgebound = 999
projstagebound = 999
offset = -320,0
postype = p1
attr = S,HP
hitflag = MAF
guardflag = M
animtype = UP
ground.type = High
priority = 7,hit
damage = ifelse(fvar(26)=1,17,Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103/IfElse(NumEnemy=1,2,1))),
         Ceil(IfElse(var(21)=0,2,1)*fvar(10)*(100-Random%11)*fvar(38)/10/103)
pausetime = 1,14
guard.pausetime = 1,12
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7255
guard.sparkno = S7262
sparkxy = 60,Floor((EnemyNear(var(2)),Const(size.mid.pos.y)+Floor(P2BodyDist Y))*(1-(P2StateType=C)*0.5))
hitsound = S5,9
guardsound = S6,1
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 24+14+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = -8,-7
guard.velocity = 0
air.velocity = -8,-7
yaccel = .5
getpower = 0,0
givepower = 15,15
air.juggle = (var(9)&&!(fvar(29)=3||fvar(29)=6))*16
ID = 2420
persistent = 0

[State 2400, proj2(front)]
type = Projectile
triggerall = AnimElem = 8, >= 4
trigger1 = NumProjID(2410) = 0
projID = 2410
projhits = 1
projremove = 0
projremovetime = 16
projanim = 2430
velocity = -20
projedgebound = 999
projstagebound = 999
offset = 320,0
postype = p1
attr = S,HP
hitflag = MAF
guardflag = M
animtype = UP
ground.type = High
priority = 7,hit
damage = ifelse(fvar(26)=1,17,Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103/IfElse(NumEnemy=1,2,1))),
         Ceil(IfElse(var(21)=0,2,1)*fvar(10)*(100-Random%11)*fvar(38)/10/103)
pausetime = 1,14
guard.pausetime = 1,12
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7255
guard.sparkno = S7262
sparkxy = 30,Floor((EnemyNear(var(2)),Const(size.mid.pos.y)+Floor(P2BodyDist Y))*(1-(P2StateType=C)*0.5))
hitsound = S5,9
guardsound = S6,1
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 24+14+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 8,-7
guard.velocity = 0
air.velocity = 8,-7
yaccel = .5
getpower = 0,0
givepower = 15,15
air.juggle = (var(9)&&!(fvar(29)=3||fvar(29)=6))*16
ID = 2411
persistent = 0

[State 2400, proj2(back)]
type = Projectile
triggerall = AnimElem = 8, >= 4
trigger1 = NumProjID(2420) = 0
projID = 2420
projhits = 1
projremove = 0
projremovetime = 16
projanim = 2430
velocity = 20
projedgebound = 999
projstagebound = 999
offset = -320,0
postype = p1
attr = S,HP
hitflag = MAF
guardflag = M
animtype = UP
ground.type = High
priority = 7,hit
damage = ifelse(fvar(26)=1,17,Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103/IfElse(NumEnemy=1,2,1))),
         Ceil(IfElse(var(21)=0,2,1)*fvar(10)*(100-Random%11)*fvar(38)/10/103)
pausetime = 1,14
guard.pausetime = 1,12
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7255
guard.sparkno = S7262
sparkxy = 60,Floor((EnemyNear(var(2)),Const(size.mid.pos.y)+Floor(P2BodyDist Y))*(1-(P2StateType=C)*0.5))
hitsound = S5,9
guardsound = S6,1
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 24+14+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = -8,-7
guard.velocity = 0
air.velocity = -8,-7
yaccel = .5
getpower = 0,0
givepower = 15,15
air.juggle = (var(9)&&!(fvar(29)=3||fvar(29)=6))*16
ID = 2421
persistent = 0

[State 2400, proj3(front)]
type = Projectile
triggerall = AnimElem = 8, >= 4
trigger1 = NumProjID(2410) = 0
projID = 2410
projhits = 1
projremove = 0
projremovetime = 16
projanim = 2430
velocity = -20
projedgebound = 999
projstagebound = 999
offset = 320,0
postype = p1
attr = S,HP
hitflag = MAF
guardflag = M
animtype = UP
ground.type = High
priority = 7,hit
damage = ifelse(fvar(26)=1,17,Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103)),
		 Ceil(IfElse(var(21)=0,2,1)*fvar(10)*(100-Random%11)*fvar(38)/10/103)
pausetime = 1,14
guard.pausetime = 1,12
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7255
guard.sparkno = S7262
sparkxy = 30,Floor((EnemyNear(var(2)),Const(size.mid.pos.y)+Floor(P2BodyDist Y))*(1-(P2StateType=C)*0.5))
hitsound = S5,9
guardsound = S6,1
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 24+14+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 8,-7
guard.velocity = 0
air.velocity = 8,-7
yaccel = .5
getpower = 0,0
givepower = 15,15
air.juggle = (var(9)&&!(fvar(29)=3||fvar(29)=6))*16
ID = 2412
persistent = 0

[State 2400, proj3(back)]
type = Projectile
triggerall = AnimElem = 8, >= 4
trigger1 = NumProjID(2420) = 0
projID = 2420
projhits = 1
projremove = 0
projremovetime = 16
projanim = 2430
velocity = 20
projedgebound = 999
projstagebound = 999
offset = -320,0
postype = p1
attr = S,HP
hitflag = MAF
guardflag = M
animtype = UP
ground.type = High
priority = 7,hit
damage = ifelse(fvar(26)=1,17,Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103)),
		 Ceil(IfElse(var(21)=0,2,1)*fvar(10)*(100-Random%11)*fvar(38)/10/103)
pausetime = 1,14
guard.pausetime = 1,12
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7255
guard.sparkno = S7262
sparkxy = 60,Floor((EnemyNear(var(2)),Const(size.mid.pos.y)+Floor(P2BodyDist Y))*(1-(P2StateType=C)*0.5))
hitsound = S5,9
guardsound = S6,1
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 24+14+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = -8,-7
guard.velocity = 0
air.velocity = -8,-7
yaccel = .5
getpower = 0,0
givepower = 15,15
air.juggle = (var(9)&&!(fvar(29)=3||fvar(29)=6))*16
ID = 2422
persistent = 0

[State 2400, proj4(front)]
type = Projectile
triggerall = AnimElem = 8, >= 4
trigger1 = NumProjID(2410) = 0
projID = 2410
projhits = 1
projremove = 0
projremovetime = 16
projanim = 2430
velocity = -20
projedgebound = 999
projstagebound = 999
offset = 320,0
postype = p1
attr = S,HP
hitflag = MAF
guardflag = M
animtype = UP
ground.type = High
priority = 7,hit
damage = ifelse(fvar(26)=1,17,Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103)),
		 Ceil(IfElse(var(21)=0,2,1)*fvar(10)*(100-Random%11)*fvar(38)/10/103)
pausetime = 1,14
guard.pausetime = 1,12
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7255
guard.sparkno = S7262
sparkxy = 30,Floor((EnemyNear(var(2)),Const(size.mid.pos.y)+Floor(P2BodyDist Y))*(1-(P2StateType=C)*0.5))
hitsound = S5,9
guardsound = S6,1
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 24+14+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 8,-7
guard.velocity = 0
air.velocity = 8,-7
yaccel = .5
getpower = 0,0
givepower = 15,15
air.juggle = (var(9)&&!(fvar(29)=3||fvar(29)=6))*16
ID = 2413
persistent = 0

[State 2400, proj4(back)]
type = Projectile
triggerall = AnimElem = 8, >= 4
trigger1 = NumProjID(2420) = 0
projID = 2420
projhits = 1
projremove = 0
projremovetime = 16
projanim = 2430
velocity = 20
projedgebound = 999
projstagebound = 999
offset = -320,0
postype = p1
attr = S,HP
hitflag = MAF
guardflag = M
animtype = UP
ground.type = High
priority = 7,hit
damage = ifelse(fvar(26)=1,17,Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103)),
		 Ceil(IfElse(var(21)=0,2,1)*fvar(10)*(100-Random%11)*fvar(38)/10/103)
pausetime = 1,14
guard.pausetime = 1,12
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7255
guard.sparkno = S7262
sparkxy = 60,Floor((EnemyNear(var(2)),Const(size.mid.pos.y)+Floor(P2BodyDist Y))*(1-(P2StateType=C)*0.5))
hitsound = S5,9
guardsound = S6,1
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 24+14+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = -8,-7
guard.velocity = 0
air.velocity = -8,-7
yaccel = .5
getpower = 0,0
givepower = 15,15
air.juggle = (var(9)&&!(fvar(29)=3||fvar(29)=6))*16
ID = 2423
persistent = 0

[State 2400, proj5(front)]
type = Projectile
triggerall = AnimElem = 8, >= 4
trigger1 = NumProjID(2410) = 0
projID = 2410
projhits = 1
projremove = 0
projremovetime = 16
projanim = 2430
velocity = -20
projedgebound = 999
projstagebound = 999
offset = 320,0
postype = p1
attr = S,HP
hitflag = MAF
guardflag = M
animtype = UP
ground.type = High
priority = 7,hit
damage = ifelse(fvar(26)=1,17,Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103)),
		 Ceil(IfElse(var(21)=0,2,1)*fvar(10)*(100-Random%11)*fvar(38)/10/103)
pausetime = 1,14
guard.pausetime = 1,12
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7255
guard.sparkno = S7262
sparkxy = 30,Floor((EnemyNear(var(2)),Const(size.mid.pos.y)+Floor(P2BodyDist Y))*(1-(P2StateType=C)*0.5))
hitsound = S5,9
guardsound = S6,1
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 24+14+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 8,-7
guard.velocity = 0
air.velocity = 8,-7
yaccel = .5
getpower = 0,0
givepower = 15,15
air.juggle = (var(9)&&!(fvar(29)=3||fvar(29)=6))*16
ID = 2414
persistent = 0

[State 2400, proj5(back)]
type = Projectile
triggerall = AnimElem = 8, >= 4
trigger1 = NumProjID(2420) = 0
projID = 2420
projhits = 1
projremove = 0
projremovetime = 16
projanim = 2430
velocity = 20
projedgebound = 999
projstagebound = 999
offset = -320,0
postype = p1
attr = S,HP
hitflag = MAF
guardflag = M
animtype = UP
ground.type = High
priority = 7,hit
damage = ifelse(fvar(26)=1,17,Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103)),
		 Ceil(IfElse(var(21)=0,2,1)*fvar(10)*(100-Random%11)*fvar(38)/10/103)
pausetime = 1,14
guard.pausetime = 1,12
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7255
guard.sparkno = S7262
sparkxy = 60,Floor((EnemyNear(var(2)),Const(size.mid.pos.y)+Floor(P2BodyDist Y))*(1-(P2StateType=C)*0.5))
hitsound = S5,9
guardsound = S6,1
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 24+14+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = -8,-7
guard.velocity = 0
air.velocity = -8,-7
yaccel = .5
getpower = 0,0
givepower = 15,15
air.juggle = (var(9)&&!(fvar(29)=3||fvar(29)=6))*16
ID = 2424
persistent = 0

[State 2400, proj6(front)]
type = Projectile
triggerall = AnimElem = 8, >= 4
trigger1 = NumProjID(2410) = 0
projID = 2410
projhits = 1
projremove = 0
projremovetime = 16
projanim = 2430
velocity = -20
projedgebound = 999
projstagebound = 999
offset = 320,0
postype = p1
attr = S,HP
hitflag = MAF
guardflag = M
animtype = UP
ground.type = High
priority = 7,hit
damage = ifelse(fvar(26)=1,17,Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103)),
		 Ceil(IfElse(var(21)=0,2,1)*fvar(10)*(100-Random%11)*fvar(38)/10/103)
pausetime = 1,14
guard.pausetime = 1,12
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7255
guard.sparkno = S7262
sparkxy = 30,Floor((EnemyNear(var(2)),Const(size.mid.pos.y)+Floor(P2BodyDist Y))*(1-(P2StateType=C)*0.5))
hitsound = S5,9
guardsound = S6,1
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 24+14+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 8,-7
guard.velocity = 0
air.velocity = 8,-7
yaccel = .5
getpower = 0,0
givepower = 15,15
air.juggle = (var(9)&&!(fvar(29)=3||fvar(29)=6))*16
ID = 2415
persistent = 0

[State 2400, proj6(back)]
type = Projectile
triggerall = AnimElem = 8, >= 4
trigger1 = NumProjID(2420) = 0
projID = 2420
projhits = 1
projremove = 0
projremovetime = 16
projanim = 2430
velocity = 20
projedgebound = 999
projstagebound = 999
offset = -320,0
postype = p1
attr = S,HP
hitflag = MAF
guardflag = M
animtype = UP
ground.type = High
priority = 7,hit
damage = ifelse(fvar(26)=1,17,Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103)),
		 Ceil(IfElse(var(21)=0,2,1)*fvar(10)*(100-Random%11)*fvar(38)/10/103)
pausetime = 1,14
guard.pausetime = 1,12
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7255
guard.sparkno = S7262
sparkxy = 60,Floor((EnemyNear(var(2)),Const(size.mid.pos.y)+Floor(P2BodyDist Y))*(1-(P2StateType=C)*0.5))
hitsound = S5,9
guardsound = S6,1
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 24+14+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = -8,-7
guard.velocity = 0
air.velocity = -8,-7
yaccel = .5
getpower = 0,0
givepower = 15,15
air.juggle = (var(9)&&!(fvar(29)=3||fvar(29)=6))*16
ID = 2425
persistent = 0

[State 2400, proj7(front)]
type = Projectile
triggerall = AnimElem = 8, >= 4
trigger1 = NumProjID(2410) = 0
projID = 2410
projhits = 1
projremove = 0
projremovetime = 16
projanim = 2430
velocity = -20
projedgebound = 999
projstagebound = 999
offset = 320,0
postype = p1
attr = S,HP
hitflag = MAF
guardflag = M
animtype = UP
ground.type = High
priority = 7,hit
damage = ifelse(fvar(26)=1,17,Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103)),
		 Ceil(IfElse(var(21)=0,2,1)*fvar(10)*(100-Random%11)*fvar(38)/10/103)
pausetime = 1,14
guard.pausetime = 1,12
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7255
guard.sparkno = S7262
sparkxy = 30,Floor((EnemyNear(var(2)),Const(size.mid.pos.y)+Floor(P2BodyDist Y))*(1-(P2StateType=C)*0.5))
hitsound = S5,9
guardsound = S6,1
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 24+14+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 8,-7
guard.velocity = 0
air.velocity = 8,-7
yaccel = .5
getpower = 0,0
givepower = 15,15
air.juggle = (var(9)&&!(fvar(29)=3||fvar(29)=6))*16
ID = 2416
persistent = 0

[State 2400, proj7(back)]
type = Projectile
triggerall = AnimElem = 8, >= 4
trigger1 = NumProjID(2420) = 0
projID = 2420
projhits = 1
projremove = 0
projremovetime = 16
projanim = 2430
velocity = 20
projedgebound = 999
projstagebound = 999
offset = -320,0
postype = p1
attr = S,HP
hitflag = MAF
guardflag = M
animtype = UP
ground.type = High
priority = 7,hit
damage = ifelse(fvar(26)=1,17,Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103)),
		 Ceil(IfElse(var(21)=0,2,1)*fvar(10)*(100-Random%11)*fvar(38)/10/103)
pausetime = 1,14
guard.pausetime = 1,12
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7255
guard.sparkno = S7262
sparkxy = 60,Floor((EnemyNear(var(2)),Const(size.mid.pos.y)+Floor(P2BodyDist Y))*(1-(P2StateType=C)*0.5))
hitsound = S5,9
guardsound = S6,1
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 24+14+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = -8,-7
guard.velocity = 0
air.velocity = -8,-7
yaccel = .5
getpower = 0,0
givepower = 15,15
air.juggle = (var(9)&&!(fvar(29)=3||fvar(29)=6))*16
ID = 2426
persistent = 0

[State 2400, proj8(front)]
type = Projectile
triggerall = AnimElem = 8, >= 4
trigger1 = NumProjID(2410) = 0
projID = 2417
projhits = 1
projremove = 0
projremovetime = 16
projanim = 2430
velocity = -20
projedgebound = 999
projstagebound = 999
offset = 320,0
postype = p1
attr = S,HP
hitflag = MAF
guardflag = M
animtype = UP
ground.type = High
priority = 7,hit
damage = ifelse(fvar(26)=1,17,Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103)),
		 Ceil(IfElse(var(21)=0,2,1)*fvar(10)*(100-Random%11)*fvar(38)/10/103)
pausetime = 1,14
guard.pausetime = 1,12
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7255
guard.sparkno = S7262
sparkxy = 30,Floor((EnemyNear(var(2)),Const(size.mid.pos.y)+Floor(P2BodyDist Y))*(1-(P2StateType=C)*0.5))
hitsound = S5,9
guardsound = S6,1
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 24+14+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = 4,-7
guard.velocity = 0
air.velocity = 4,-7
yaccel = .5
getpower = 0,0
givepower = 15,15
air.juggle = (var(9)&&!(fvar(29)=3||fvar(29)=6))*16
ID = 2417
persistent = 0
p2stateno = 1320

[State 2400, proj8(back)]
type = Projectile
triggerall = AnimElem = 8, >= 4
trigger1 = NumProjID(2420) = 0
projID = 2427
projhits = 1
projremove = 0
projremovetime = 16
projanim = 2430
velocity = 20
projedgebound = 999
projstagebound = 999
offset = -320,0
postype = p1
attr = S,HP
hitflag = MAF
guardflag = M
animtype = UP
ground.type = High
priority = 7,hit
damage = ifelse(fvar(26)=1,17,Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103)),
		 Ceil(IfElse(var(21)=0,2,1)*fvar(10)*(100-Random%11)*fvar(38)/10/103)
pausetime = 1,14
guard.pausetime = 1,12
ground.slidetime = 17
ground.hittime = 17
ground.ctrltime = 17
sparkno = S7255
guard.sparkno = S7262
sparkxy = 60,Floor((EnemyNear(var(2)),Const(size.mid.pos.y)+Floor(P2BodyDist Y))*(1-(P2StateType=C)*0.5))
hitsound = S5,9
guardsound = S6,1
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 24+14+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = -4,-7
guard.velocity = 0
air.velocity = -4,-7
yaccel = .5
getpower = 0,0
givepower = 15,15
air.juggle = (var(9)&&!(fvar(29)=3||fvar(29)=6))*16
ID = 2427
persistent = 0
p2stateno = 1320

[State 2400, helper]
type = Helper
trigger1 = Time = 0
helpertype = normal
name = "noBG"
ID = 2430
pos = 0,0
postype = p1
facing = 1
stateno = 2430
keyctrl = 0
ownpal = 1
persistent = 0
pausemovetime = 999999

[State 2400, snd]
type = PlaySnd
trigger1 = AnimElem = 8
value = S3,30
channel = 15

[State 2400, snd]
type = PlaySnd
triggerall = fvar(29) = [4,6]
trigger1 = AnimElem = 8
value = S2,30
volume = 150
channel = 0

[State 2400, snd]
type = PlaySnd
triggerall = fvar(29) = [1,3]
trigger1 = AnimElem = 8
value = S10,64
volume = 150
channel = 0

[State 2400, snd]
type = PlaySnd
trigger1 = AnimElem = 8
value = S0,8
volume = -50

[State 2400, explod]
type = Explod
trigger1 = AnimElem = 8
anim = 7301
ID = 7301
pos = 0,0
postype = p1
removetime = -2
bindtime = -1
sprpriority = 1
removeongethit = 1
persistent = 0

[State 2400, explod]
type = Explod
trigger1 = AnimElem = 8
anim = 7302
ID = 7302
pos = 0,0
postype = p1
removetime = -2
bindtime = -1
sprpriority = 3
removeongethit = 1
persistent = 0

[State 2400, explod]
type = Explod
trigger1 = AnimElem = 8
anim = 2440
ID = 2440
pos = 33,-115
postype = p1
removetime = -1
bindtime = -1
sprpriority = -1
removeongethit = 1
persistent = 0

[State 2400, explod]
type = Explod
trigger1 = NumExplod(2440) || NumExplod(2441)
trigger1 = NumExplod(2445) = 0
anim = 2445
ID = 2445
pos = 33,-115
postype = p1
removetime = -2
bindtime = -1
sprpriority = 0
removeongethit = 1

[State 2400, explod]
type = Explod
trigger1 = NumExplod(2440) || NumExplod(2441)
trigger1 = NumExplod(2446) = 0
anim = 2446
ID = 2446
pos = 33,-115
postype = p1
removetime = -2
bindtime = -1
sprpriority = 0
removeongethit = 1

[State 2400, explod]
type = Explod
trigger1 = NumExplod(2440) || NumExplod(2441)
trigger1 = NumExplod(2447) = 0
anim = 2447
ID = 2447
pos = 33,-115
postype = p1
removetime = -2
bindtime = -1
sprpriority = 0
removeongethit = 1

[State 2400, explod]
type = RemoveExplod
trigger1 = Time = 165
ID = 2440

[State 2400, explod]
type = Explod
trigger1 = Time = 165
anim = 2441
ID = 2441
pos = 33,-115
postype = p1
removetime = -2
bindtime = -1
sprpriority = -1
removeongethit = 1
persistent = 0

[State 2400, end]
type = ChangeState
trigger1 = time > 172
value = 2401

[Statedef 2401]
type = S
physics = S
movetype = I
ctrl = 0
anim = 2401
sprpriority = 2

[State 2401, nothitby]
type = NotHitBy
trigger1 = AnimElem = 3, < 0
value = SCA
time = 1

[State 2401, snd]
type = StopSnd
trigger1 = NumExplod(2441) = 0
channel = 15

[State 2401,posadd]
type = PosAdd
trigger1 = AnimElem = 5
x = -2

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 2401, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


[Statedef 2430]
anim = 9999

[State 2410]
type = AssertSpecial
trigger1 = Root,StateNo = 2400 && Root,AnimElem = 8, >= 0
trigger2 = Root,StateNo = 2401 && Root,Time < 11
flag = noBG

[State 2410]
type = DestroySelf
trigger1 = !(Root,StateNo = 2400)
trigger1 = !(Root,StateNo = 2401 && Root,Time < 11)

;=================================================================
;ディストラクションオメガ
[Statedef 2500]
type = S
physics = S
movetype = A
ctrl = 0
anim = 2500
sprpriority = 2

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State -2];どこキャン時点滅
type = PalFX
triggerall = var(46)
triggerall = Time < 9
trigger1 = Time%2 = 0
time = 1
add = 255,255,255
mul = 255,255,255
ignorehitpause = 1

[State -2, 再使用制限 98UM(EX)]
type = VarSet
triggerall = fvar(29) = 4
triggerall = Time = 0
triggerall = fvar(34) = 2
triggerall = var(53)
trigger1 = !(Power >= 1000 || var(52))
var(51) = 1

[State -2, power 98UM]
type = PowerAdd
triggerall = fvar(29) = 4
trigger1 = Time = 0
value = IfElse(var(52),0,-IfElse((var(51)),0,1000))

[State -2, power 2002]
type = PowerAdd
triggerall = fvar(29) = 1
trigger1 = Time = 0
trigger1 = !var(52)
value = -1000

[State -2, power S]
type = PowerAdd
triggerall = !(fvar(29) = 1 || fvar(29) = 4)
trigger1 = Time = 0
value = IfElse((var(52)||var(53)),0,-1000)

[State -2, max reset]
type = VarSet
trigger1 = Time = 0
trigger1 = var(52)
var(52) = 0

[State -2, nothitby]
type = NotHitBy
triggerall = !(fvar(29) = 3 || fvar(29) = 6)
trigger1 = AnimElem = 6, < 1
value = SCA
time = 1

[State -2, nothitby]
type = NotHitBy
triggerall = (fvar(29) = 3 || fvar(29) = 6)
trigger1 = AnimElem = 7, < 0
value = SCA
time = 1

[State -2, pause]
type = Pause
trigger1 = Time = 2
time = 28
movetime = 28

[State -2]
type = VelSet
trigger1 = Time = 2
x = 0
y = 0

[State -2, env]
type = EnvColor
trigger1 = Time = 2
value = 255,255,255
time = 4
under = 1

[State -2, env]
type = EnvColor
trigger1 = Time = 6
value = 0,0,0
time = 24
under = 1

[State -2, snd]
type = PlaySnd
trigger1 = time = 2
value = S8,1

[State -2, explod 2002]
type = Explod
triggerall = fvar(29) != 4
trigger1 = Time = 0 + 4;要調整
anim = 7620
pos = 16,-120
postype = p1
sprpriority = -1
pausemovetime = 99999
ownpal = 1

[State -2, explod 2002]
type = Explod
triggerall = fvar(29) != 4
trigger1 = Time = 10 + 4;要調整
anim = 7560
pos = 16,-120
postype = p1
sprpriority = 3
pausemovetime = 99999
ownpal = 1

[State -2, explod 98UM]
type = Explod
triggerall = fvar(29) = 4
trigger1 = Time = 0 + 6;要調整
anim = 7600
ID = 7600
pos = 16,-120
postype = p1
facing = 1
removetime = -2
sprpriority = -1
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State -2, explod]
type = Explod
triggerall = fvar(29) = 4
trigger1 = Time = 8 + 6;要調整
anim = 7605
ID = 7605
pos = 16,-120
postype = p1
facing = 1
removetime = -2
sprpriority = 4
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State 2500, width]
type = Width
trigger1 = 0
edge = 50,0

[State 2500, snd]
type = PlaySnd
triggerall = fvar(29) = [4,6]
trigger1 = Time = 1
value = S2,22
volume = 150

[State 2500, snd]
type = PlaySnd
triggerall = fvar(29) = [1,3]
trigger1 = AnimElem = 6
value = S2,56+(fvar(26)=1)*20
volume = 150

[State 2500, hitdef]
type = HitDef
trigger1 = !var(9) || !(fvar(29) = 1 || fvar(29) = 4) || fvar(26)
trigger1 = !var(8)
trigger1 = AnimElem = 6, = 1
attr = S,HA
hitflag = MAF
guardflag = M
animtype = Hard
priority = 7,hit
pausetime = 0,11
guard.pausetime = 11,9
hitsound = S5,20
guardsound = S6,1
sparkno = S7204+(fvar(29)!=4)*50
guard.sparkno = S7212+(fvar(29)!=4)*50
sparkxy = 0,-60
ground.type = Low
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -4,-7.5
air.velocity = -4,-7.5
guard.velocity = -10.35
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
p2facing = 1
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
yaccel = .55
ID = 2500
kill = 0
givepower = 15,15


;追击D投用
[State 2500, hitdef]
type = HitDef
trigger1 = !var(9) || !(fvar(29) = 1 || fvar(29) = 4) || fvar(26)
trigger1 = !var(8)
trigger1 = AnimElem = 6, = 1
trigger1 = EnemyNear(var(2)),StateNo = 872
attr = S,HA
hitflag = MAFD
guardflag = M
animtype = Hard
priority = 7,hit
pausetime = 0,11
guard.pausetime = 11,9
hitsound = S5,20
guardsound = S6,1
sparkno = S7204+(fvar(29)!=4)*50
guard.sparkno = S7212+(fvar(29)!=4)*50
sparkxy = 0,-60
ground.type = Low
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -4,-7.5
air.velocity = -4,-7.5
guard.velocity = -10.35
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
p2facing = 1
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
yaccel = .55
ID = 2500
kill = 0
givepower = 15,15

[State 2500, targetdrop]
type = TargetDrop
trigger1 = NumTarget(2500)
excludeID = 2500
keepone = 0
ignorehitpause = 1

[State 2500, nothitby]
type = NotHitBy
trigger1 = NumTarget(2500)
trigger1 = MoveHit
value = SCA
time = 1
ignorehitpause = 1

[State 2500, hit]
type = TargetState
triggerall = NumTarget(2500)
trigger1 = MoveHit
trigger1 = Target,MoveType = H
trigger1 = Target,StateNo != 2520
value = 2520
ID = 2500
ignorehitpause = 1

[State 2500, hit]
type = ChangeState
trigger1 = MoveHit
trigger1 = P2StateNo = 2520
value = 2510
ignorehitpause = 1

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 2500, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[Statedef 2510]
type = S
physics = N
movetype = A
anim = 2510
ctrl = 0
velset = 0,0
sprpriority = 3

[State 2510, width]
type = Width
trigger1 = Time = 0
edge = 115,0

[State 2510, width]
type = Width
trigger1 = Time > 0
edge = (Target,Const(size.ground.front)+Target,Const(size.ground.back)),0

[State 2510, posadd]
type = PosAdd
trigger1 = AnimElem = 9
x = 12

[State 2510, posadd]
type = PosAdd
trigger1 = AnimElem = 30
x = 10

[State 2510, posadd]
type = PosAdd
trigger1 = AnimElem = 31
trigger2 = AnimElem = 32
x = 8

[State 2510, posadd]
type = PosAdd
trigger1 = AnimElem = 33
x = 4

[State 2510, posadd]
type = PosAdd
trigger1 = AnimElem = 51
trigger2 = AnimElem = 52
x = 6

[State 2510, target]
type = TargetBind
trigger1 = time = 0
pos = 92,0
ID = 2500

[State 2510, target]
type = TargetBind
trigger1 = AnimElem = 2
pos = 68,0
ID = 2500

[State 2510, target]
type = TargetBind
trigger1 = AnimElem = 3
pos = 56,0
ID = 2500

[State 2510, target]
type = TargetBind
trigger1 = AnimElem = 4
pos = 52,-110
ID = 2500

[State 2510, target]
type = TargetBind
trigger1 = AnimElem = 5
pos = 37,-114
ID = 2500

[State 2510, target]
type = TargetBind
trigger1 = AnimElem = 6
pos = 33,-118
ID = 2500

[State 2510, target]
type = TargetBind
trigger1 = AnimElem = 7
pos = 37,-114
ID = 2500

[State 2510, target]
type = TargetBind
trigger1 = AnimElem = 8
pos = 48,-32
ID = 2500

[State 2510, target]
type = TargetBind
trigger1 = AnimElem = 12
pos = 36,0
ID = 2500

[State 2510, target]
type = TargetBind
trigger1 = AnimElem = 30, >= 0 && AnimElem = 37, < 0 
pos = 32,0
ID = 2500

[State 2510, target]
type = TargetBind
trigger1 = AnimElem = 48, = 2
pos = 44,7
ID = 2500

[State 2510, targetstate]
type = TargetState
trigger1 = AnimElem = 48, = 2
value = 2521
ID = 2500

[State 2500, env]
type = EnvColor
trigger1 = time = 0
value = 255,255,255
time = 1
under = 1

[State 2500, snd]
type = PlaySnd
trigger1 = AnimElem = 10
value = S2,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),57,77),23)
volume = 150

[State 2500, snd]
type = PlaySnd
trigger1 = AnimElem = 11, = 1
trigger2 = AnimElem = 16, = 1
trigger3 = AnimElem = 21, = 1
trigger4 = AnimElem = 27, = 1
trigger5 = AnimElem = 32, = 1
trigger6 = AnimElem = 39, = 1
trigger7 = AnimElem = 47, = 1
value = S5,IfElse((fvar(29)=4),1,6)

[State 2500, env]
type = EnvColor
trigger1 = AnimElem = 11, = 2
trigger2 = AnimElem = 16, = 2
trigger3 = AnimElem = 21, = 2
trigger4 = AnimElem = 27, = 2
trigger5 = AnimElem = 32, = 2
trigger6 = AnimElem = 39, = 2
trigger7 = AnimElem = 47, = 2
value = 255,255,255
time = 1
under = 1

[State 2500, env]
type = EnvColor
trigger1 = AnimElem = 49
value = 255,255,255
time = 1
under = 1

[State 2500, hitadd]
type = HitAdd
trigger1 = AnimElem = 16
trigger2 = AnimElem = 21
trigger3 = AnimElem = 27
trigger4 = AnimElem = 32
trigger5 = AnimElem = 39
trigger6 = AnimElem = 47
value = NumTarget(2500)

[State 2500, damage]
type = TargetLifeAdd
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = AnimElem = 11, = 1
value = -Ceil(27*(100-random%11)*fvar(10)*fvar(38)/10/103)
kill = 0
ID = 2500

[State 2500, damage]
type = TargetLifeAdd
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = AnimElem = 16, = 1
value = -Ceil(12*(100-random%11)*fvar(10)*fvar(38)/10/103)
kill = 0
ID = 2500

[State 2500, damage]
type = TargetLifeAdd
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = AnimElem = 21, = 1
value = -Ceil(6*(100-random%11)*fvar(10)*fvar(38)/10/103)
kill = 0
ID = 2500

[State 2500, damage]
type = TargetLifeAdd
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = AnimElem = 27, = 1
value = -Ceil(2*(100-random%11)*fvar(10)*fvar(38)/10/103)
kill = 0
ID = 2500

[State 2500, damage]
type = TargetLifeAdd
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = AnimElem = 32, = 1
trigger2 = AnimElem = 39, = 1
trigger3 = AnimElem = 47, = 1
value = -Ceil(1*(100-random%11)*fvar(10)*fvar(38)/10/103)
kill = 0
ID = 2500


[State 2500, damage]
type = TargetLifeAdd
triggerall = fvar(26)
trigger1 = AnimElem = 11, = 1
value = -Ceil(IfElse(fvar(28)=0,11,26)*fvar(10)*fvar(38)/12)
kill = 0
ID = 2500

[State 2500, damage]
type = TargetLifeAdd
triggerall = fvar(26)
trigger1 = AnimElem = 16, = 1
value = -Ceil(IfElse(fvar(28)=0,5,12)*fvar(10)*fvar(38)/12)
kill = 0
ID = 2500

[State 2500, damage]
type = TargetLifeAdd
triggerall = fvar(26)
trigger1 = AnimElem = 21, = 1
value = -Ceil(IfElse(fvar(28)=0,2,5)*fvar(10)*fvar(38)/12)
kill = 0
ID = 2500

[State 2500, damage]
type = TargetLifeAdd
triggerall = fvar(26)
trigger1 = AnimElem = 27, = 1
value = -Ceil(IfElse(fvar(28)=0,1,2)*fvar(10)*fvar(38)/12)
kill = 0
ID = 2500

[State 2500, damage]
type = TargetLifeAdd
triggerall = fvar(26)
trigger1 = AnimElem = 32, = 1
trigger2 = AnimElem = 39, = 1
trigger3 = AnimElem = 47, = 1
value = -15;-Ceil(IfElse(fvar(28)=0,1,1)*fvar(10)*fvar(38)/12)
kill = 0
ID = 2500


[State 2500, damage]
type = TargetLifeAdd
triggerall = fvar(29) = 4
trigger1 = AnimElem = 11, = 1
value = -Ceil(21*100*fvar(10)*fvar(38)/10/119)
kill = 0
ID = 2500

[State 2500, damage]
type = TargetLifeAdd
triggerall = fvar(29) = 4
trigger1 = AnimElem = 16, = 1
value = -Ceil(10*100*fvar(10)*fvar(38)/10/119)
kill = 0
ID = 2500

[State 2500, damage]
type = TargetLifeAdd
triggerall = fvar(29) = 4
trigger1 = AnimElem = 21, = 1
value = -Ceil(5*100*fvar(10)*fvar(38)/10/119)
kill = 0
ID = 2500

[State 2500, damage]
type = TargetLifeAdd
triggerall = fvar(29) = 4
trigger1 = AnimElem = 27, = 1
value = -Ceil(2*100*fvar(10)*fvar(38)/10/119)
kill = 0
ID = 2500

[State 2500, damage]
type = TargetLifeAdd
triggerall = fvar(29) = 4
trigger1 = AnimElem = 32, = 1
trigger2 = AnimElem = 39, = 1
trigger3 = AnimElem = 47, = 1
value = -Ceil(1*100*fvar(10)*fvar(38)/10/119)
kill = 0
ID = 2500

[State 2500, targetpoweradd]
type = TargetPowerAdd
trigger1 = AnimElem = 11, = 1
trigger2 = AnimElem = 16, = 1
trigger3 = AnimElem = 21, = 1
trigger4 = AnimElem = 27, = 1
trigger5 = AnimElem = 32, = 1
trigger6 = AnimElem = 39, = 1
trigger7 = AnimElem = 47, = 1
value = 15
ID = 2500

[State 2510, explod]
type = Explod
trigger1 = AnimElem = 11, = 1
anim = 7204+(fvar(29)!=4)*50
pos = 44,-93
postype = p1
sprpriority = 5

[State 2510, explod]
type = Explod
trigger1 = AnimElem = 16, = 1
anim = 7204+(fvar(29)!=4)*50
pos = 36,-76
postype = p1
sprpriority = 5

[State 2510, explod]
type = Explod
trigger1 = AnimElem = 21, = 1
anim = 7204+(fvar(29)!=4)*50
pos = 37,-97
postype = p1
sprpriority = 5

[State 2510, explod]
type = Explod
trigger1 = AnimElem = 27, = 1
anim = 7204+(fvar(29)!=4)*50
pos = 51,-69
postype = p1
sprpriority = 5

[State 2510, explod]
type = Explod
trigger1 = AnimElem = 32, = 1
anim = 7204+(fvar(29)!=4)*50
pos = 31,-72
postype = p1
sprpriority = 5

[State 2510, explod]
type = Explod
trigger1 = AnimElem = 39, = 1
anim = 7204+(fvar(29)!=4)*50
pos = 41,-63
postype = p1
sprpriority = 5

[State 2510, explod]
type = Explod
trigger1 = AnimElem = 47, = 1
anim = 7203+(fvar(29)!=4)*50
pos = 51,-66
postype = p1
sprpriority = 5

[State 2500, snd]
type = PlaySnd
trigger1 = AnimElem = 48
value = S3,2

[State 2510, explod]
type = Explod
trigger1 = AnimElem = 46, = 1
anim = 8201
pos = 0,0
postype = p1
sprpriority = 4
bindtime = -1

[State 2500, hitdef]
type = HitDef
triggerall = !fvar(26)
trigger1 = Time = 0
attr = A,HA
hitflag = MAF
guardflag = -1
animtype = Up
ground.type = Low
priority = 7,hit
damage = IfElse(fvar(29)=4,(Ceil(12*100*fvar(10)*fvar(38)/10/119)),(Ceil(14*(100-random%11)*fvar(10)*fvar(38)/10/103)))
pausetime = 11,11
sparkno = S7203+(fvar(29)!=4)*50
guard.sparkno = S7212+(fvar(29)!=4)*50
sparkxy = -20,-61+Ceil(P2BodyDist Y)
hitsound = S5,4+(fvar(29)!=4)*5
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 38+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = -2,-11
guard.velocity = -12
air.velocity = -2,-11
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
p2facing = 1
ID = 2501
ChainID = 2500
kill = 1
getpower = 0,0
givepower = 15,15

[State 2500, hitdef]
type = HitDef
triggerall = fvar(26)
trigger1 = Time = 0
attr = A,HA
hitflag = MAF
guardflag = -1
animtype = Up
ground.type = Low
priority = 7,hit
damage = Ceil(IfElse(fvar(28)=0,9,14)*fvar(10)*fvar(38)/12)
pausetime = 11,11
sparkno = S7203+(fvar(29)!=4)*50
guard.sparkno = S7212+(fvar(29)!=4)*50
sparkxy = -20,-61+Ceil(P2BodyDist Y)
hitsound = S5,4+(fvar(29)!=4)*5
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 38+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = -2,-11
guard.velocity = -12
air.velocity = -2,-11
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
p2facing = 1
ID = 2501
ChainID = 2500
kill = 1
getpower = 0,0
givepower = 15,15

[State 2510,statetype]
type = StateTypeSet
trigger1 = AnimElem = 48
statetype = A

[State 2510, vel]
type = VelSet
trigger1 = AnimElem = 48
y = -7.3

[State 2510, 1]
type = VelAdd
trigger1 = AnimElem = 48, > 0
y = .34

[State 2510,end]
type = ChangeState
trigger1 = AnimElem = 54, > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 2511

[Statedef 2511]
type = S
physics = S
movetype = I
anim = 2511
ctrl = 0
velset = 0,0

[State 2511]
type = PosSet
trigger1 = time = 0
y = 0

[State -2, targetdrop]
type = TargetDrop
trigger1 = AnimTime = -1

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 2511, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[Statedef 2520]
type = S
physics = N
movetype = H
ctrl = 0
velset = 0,0

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
value = 5050

[State 2020, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 2520]
type = ChangeAnim2
trigger1 = time = 0
value = 2520

[State 2520, end]
type = SelfState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;=================================================================
;MAX版ディストラクションオメガ
[Statedef 2600]
type = S
physics = S
movetype = A
ctrl = 0
anim = 2500
sprpriority = 2

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State -2];どこキャン時点滅
type = PalFX
triggerall = var(46)
triggerall = Time < 9
trigger1 = Time%2 = 0
time = 1
add = 255,255,255
mul = 255,255,255
ignorehitpause = 1

[State -2, 再使用制限 98UM(EX)]
type = VarSet
triggerall = fvar(29) = 4
triggerall = Time = 0
triggerall = fvar(34) = 2
trigger1 = var(53)
var(51) = 1

[State -2, power 98UM]
type = PowerAdd
triggerall = fvar(29) = 4
trigger1 = Time = 0
value = IfElse((fvar(34)=1&&var(58)=1),-3000,-1000)

[State -2, power 2002]
type = PowerAdd
triggerall = fvar(29) = 1
trigger1 = Time = 0
value = IfElse((fvar(26)=1&&var(58)=1),-3000,-1000)

[State -2, power S]
type = PowerAdd
triggerall = !(fvar(29) = 1 || fvar(29) = 4)
trigger1 = Time = 0
value = IfElse(var(58)=1,-2000,IfElse(!var(53),-1000,IfElse(!var(52),-1000,0)))

[State -2, max reset]
type = VarSet
trigger1 = Time = 0
trigger1 = var(52)
var(52) = 0

[State -2, nothitby]
type = NotHitBy
trigger1 = AnimElem = 7, < 0
value = SCA
time = 1

[State -2, pause]
type = Pause
trigger1 = Time = 2
time = 28
movetime = 28

[State -2]
type = VelSet
trigger1 = Time = 2
x = 0
y = 0

[State -2, env]
type = EnvColor
trigger1 = Time = 2
value = 255,255,255
time = 4
under = 1

[State -2, env]
type = EnvColor
trigger1 = Time = 6
value = 0,0,0
time = 24
under = 1

[State -2, snd]
type = PlaySnd
trigger1 = time = 2
value = S8,IfElse(fvar(29)!=4,11,1)

[State -2, explod 2002]
type = Explod
triggerall = fvar(29) != 4
trigger1 = Time = 0 + 4;要調整
anim = 7630
pos = 16,-120
postype = p1
sprpriority = -1
pausemovetime = 99999
ownpal = 1

[State -2, explod 2002]
type = Explod
triggerall = fvar(29) != 4
trigger1 = Time = 10 + 4;要調整
anim = 7570
pos = 16,-120
postype = p1
sprpriority = 3
pausemovetime = 99999
ownpal = 1

[State -2, explod 98UM]
type = Explod
triggerall = fvar(29) = 4
trigger1 = Time = 0 + 6;要調整
anim = 7610
ID = 7610
pos = 16,-120
postype = p1
facing = 1
removetime = -2
sprpriority = -1
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State -2, explod]
type = Explod
triggerall = fvar(29) = 4
trigger1 = Time = 8 + 6;要調整
anim = 7615
ID = 7615
pos = 16,-120
postype = p1
facing = 1
removetime = -2
sprpriority = 4
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State 2500, width]
type = Width
trigger1 = 0
edge = 50,0

[State 2500, snd]
type = PlaySnd
triggerall = fvar(29) = [4,6]
trigger1 = Time = 1
value = S2,22
volume = 150

[State 2500, snd]
type = PlaySnd
triggerall = fvar(29) = [1,3]
trigger1 = AnimElem = 6
value = S2,56+(fvar(26)=1)*20
volume = 150

[State 2600, hitdef]
type = HitDef
trigger1 = !var(9) || !(fvar(29) = 1 || fvar(29) = 4) || fvar(26)
trigger1 = !var(8)
trigger1 = AnimElem = 6, = 1
attr = S,HA
hitflag = MAF
guardflag = M
animtype = Hard
priority = 7,hit
pausetime = 0,11
guard.pausetime = 11,9
hitsound = S5,20
guardsound = S6,1
sparkno = S7204+(fvar(29)!=4)*50
guard.sparkno = S7212+(fvar(29)!=4)*50
sparkxy = 0,-60
ground.type = Low
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -4,-7.5
air.velocity = -4,-7.5
guard.velocity = -10.35
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
p2facing = 1
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
yaccel = .55
ID = 2600
kill = 0
getpower = 0,0
givepower = 15,15

;---------------------------------------------
;D投抓取用
[State 2600, hitdef]
type = HitDef
trigger1 = !var(9) || !(fvar(29) = 1 || fvar(29) = 4) || fvar(26)
trigger1 = !var(8)
trigger1 = AnimElem = 6, = 1
Trigger1 = EnemyNear,StateNo = 872
attr = S,HA
hitflag = MAFD
guardflag = M
animtype = Hard
priority = 7,hit
pausetime = 0,11
guard.pausetime = 11,9
hitsound = S5,20
guardsound = S6,1
sparkno = S7204+(fvar(29)!=4)*50
guard.sparkno = S7212+(fvar(29)!=4)*50
sparkxy = 0,-60
ground.type = Low
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -4,-7.5
air.velocity = -4,-7.5
guard.velocity = -10.35
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
p2facing = 1
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 26+11+Ceil((-EnemyNear(var(2)),Pos Y)/10)
yaccel = .55
ID = 2600
kill = 0
getpower = 0,0
givepower = 15,15

[State 2600, targetdrop]
type = TargetDrop
trigger1 = NumTarget(2600)
excludeID = 2600
keepone = 0
ignorehitpause = 1

[State 2600, nothitby]
type = NotHitBy
trigger1 = NumTarget(2600)
trigger1 = MoveHit
value = SCA
time = 1
ignorehitpause = 1

[State 2600, hit]
type = TargetState
triggerall = NumTarget(2600)
trigger1 = MoveHit
trigger1 = Target,MoveType = H
trigger1 = Target,StateNo != 2620
value = 2620
ID = 2600
ignorehitpause = 1

[State 2600, hit]
type = ChangeState
trigger1 = MoveHit
trigger1 = P2StateNo = 2620
value = 2610
ignorehitpause = 1

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 2500, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


[Statedef 2610]
type = S
physics = N
movetype = A
ctrl = 0
anim = 2610
velset = 0,0
sprpriority = 2

[State 2610, width]
type = Width
trigger1 = Time = 0
edge = 115,0

[State 2610, width]
type = Width
trigger1 = Time > 0
edge = (Target,Const(size.ground.front)+Target,Const(size.ground.back)),0

[State 2610, snd]
type = PlaySnd
trigger1 = AnimElem = 10
value = S2,IfElse((fvar(29) = [1,3]),IfElse(!fvar(26),57,77),23)
volume = 150

[State 2610, pos]
type = PosAdd
trigger1 = AnimElem = 9
x = 12

[State 2610, pos]
type = PosAdd
trigger1 = AnimElem = 13
x = 6

[State 2510, target]
type = TargetBind
trigger1 = time = 0
pos = 92,0
ID = 2600

[State 2510, target]
type = TargetBind
trigger1 = AnimElem = 2
pos = 68,0
ID = 2600

[State 2510, target]
type = TargetBind
trigger1 = AnimElem = 3
pos = 56,0
ID = 2600

[State 2510, target]
type = TargetBind
trigger1 = AnimElem = 4
pos = 52,-110
ID = 2600

[State 2510, target]
type = TargetBind
trigger1 = AnimElem = 5
pos = 37,-114
ID = 2600

[State 2510, target]
type = TargetBind
trigger1 = AnimElem = 6
pos = 33,-118
ID = 2600

[State 2510, target]
type = TargetBind
trigger1 = AnimElem = 7
pos = 37,-114
ID = 2600

[State 2510, target]
type = TargetBind
trigger1 = AnimElem = 8
pos = 48,-32
ID = 2600

[State 2510, target]
type = TargetBind
trigger1 = AnimElem = 12
pos = 36,0
ID = 2600

[State 2510, target]
type = TargetBind
trigger1 = AnimElem = 13
pos = 32,0
ID = 2600

[State 2510, target]
type = TargetBind
trigger1 = AnimElem = 96, = 2
pos = 32,7
ID = 2600

[State 2610, explod]
type = Explod
trigger1 = AnimElem = 11, = 1
anim = 7204+(fvar(29)!=4)*50
pos = 36,-82
postype = p1
sprpriority = 5

[State 2610, explod]
type = Explod
trigger1 = AnimElem = 16, = 1
trigger2 = AnimElem = 44, = 1
anim = 7204+(fvar(29)!=4)*50
pos = 32,-26
postype = p1
sprpriority = 5

[State 2610, explod]
type = Explod
trigger1 = AnimElem = 24, = 1
trigger2 = AnimElem = 30, = 1
trigger3 = AnimElem = 39, = 1
trigger4 = AnimElem = 53, = 1
trigger5 = AnimElem = 59, = 1
trigger6 = AnimElem = 66, = 1
trigger7 = AnimElem = 73, = 1
trigger8 = AnimElem = 80, = 1
trigger9 = AnimElem = 88, = 1
anim = 7204+(fvar(29)!=4)*50
pos = 32,-64
postype = p1
sprpriority = 5

[State 2610, explod]
type = Explod
trigger1 = AnimElem = 95, = 1
anim = 7203+(fvar(29)!=4)*50
pos = 32,-64
postype = p1
sprpriority = 5

[State 2500, env]
type = EnvColor
trigger1 = AnimElem = 11, = 2
trigger2 = AnimElem = 16, = 2
trigger3 = AnimElem = 24, = 2
trigger4 = AnimElem = 30, = 2
trigger5 = AnimElem = 39, = 2
trigger6 = AnimElem = 44, = 2
trigger7 = AnimElem = 53, = 2
trigger8 = AnimElem = 59, = 2
trigger9 = AnimElem = 66, = 2
trigger10 = AnimElem = 73, = 2
trigger11 = AnimElem = 80, = 2
trigger12 = AnimElem = 88, = 2
value = 255,255,255
time = 1
under = 1

[State 2500, env]
type = EnvColor
trigger1 = NumTarget(2601)
trigger1 = MoveHit
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 2500, env]
type = EnvColor
trigger1 = NumTarget(2602)
trigger1 = MoveHit
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 2610, explod]
type = Explod
trigger1 = Animelem = 94, = 1
anim = 8201
pos = 0,0
postype = p1
bindtime = -1
sprpriority = 4

[State 2610, explod]
type = Explod
trigger1 = Animelem = 98, = 1
anim = 8202
pos = 48,0
postype = p1
sprpriority = 4

[State 2610, snd]
type = PlaySnd
trigger1 = AnimElem = 11, = 1
trigger2 = AnimElem = 16, = 1
trigger3 = AnimElem = 24, = 1
trigger4 = AnimElem = 30, = 1
trigger5 = AnimElem = 39, = 1
trigger6 = AnimElem = 44, = 1
trigger7 = AnimElem = 53, = 1
trigger8 = AnimElem = 59, = 1
trigger9 = AnimElem = 66, = 1
trigger10 = AnimElem = 73, = 1
trigger11 = AnimElem = 80, = 1
trigger12 = AnimElem = 88, = 1
trigger13 = AnimElem = 95, = 1
value = S5,1+(fvar(29)!=4)*5

[State 2610, snd]
type = HitAdd
trigger1 = AnimElem = 16
trigger2 = AnimElem = 24
trigger3 = AnimElem = 30
trigger4 = AnimElem = 39
trigger5 = AnimElem = 44
trigger6 = AnimElem = 53
trigger7 = AnimElem = 59
trigger8 = AnimElem = 66
trigger9 = AnimElem = 73
trigger10 = AnimElem = 80
trigger11 = AnimElem = 88
trigger12 = AnimElem = 95
value = NumTarget(2600)

[State 2610, damage]
type = TargetLifeAdd
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = AnimElem = 11, = 1
value = -Ceil(28*(100-Random%11)*fvar(10)*fvar(38)/10/103)
kill = 0
ID = 2600

[State 2610, damage]
type = TargetLifeAdd
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = AnimElem = 16, = 1
value = -Ceil(13*(100-Random%11)*fvar(10)*fvar(38)/10/103)
kill = 0
ID = 2600

[State 2610, damage]
type = TargetLifeAdd
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = AnimElem = 24, = 1
value = -Ceil(6*(100-Random%11)*fvar(10)*fvar(38)/10/103)
kill = 0
ID = 2600

[State 2610, damage]
type = TargetLifeAdd
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = AnimElem = 30, = 1
value = -Ceil(2*(100-Random%11)*fvar(10)*fvar(38)/10/103)
kill = 0
ID = 2600

[State 2610, damage]
type = TargetLifeAdd
triggerall = fvar(29) != 4 && !fvar(26)
trigger1 = AnimElem = 39, = 1
trigger2 = AnimElem = 44, = 1
trigger3 = AnimElem = 53, = 1
trigger4 = AnimElem = 59, = 1
trigger5 = AnimElem = 66, = 1
trigger6 = AnimElem = 73, = 1
trigger7 = AnimElem = 80, = 1
trigger8 = AnimElem = 88, = 1
trigger9 = AnimElem = 95, = 1
value = -Ceil(1*(100-Random%11)*fvar(10)*fvar(38)/10/103)
kill = 0
ID = 2600

[State 2610, damage]
type = TargetLifeAdd
triggerall = fvar(26)
trigger1 = AnimElem = 11, = 1
value = -Ceil(IfElse(fvar(28)=0,14,27)*fvar(10)*fvar(38)/12)
kill = 0
ID = 2600

[State 2610, damage]
type = TargetLifeAdd
triggerall = fvar(26)
trigger1 = AnimElem = 16, = 1
value = -Ceil(IfElse(fvar(28)=0,7,13)*fvar(10)*fvar(38)/12)
kill = 0
ID = 2600

[State 2610, damage]
type = TargetLifeAdd
triggerall = fvar(26)
trigger1 = AnimElem = 24, = 1
value = -Ceil(IfElse(fvar(28)=0,3,6)*fvar(10)*fvar(38)/12)
kill = 0
ID = 2600

[State 2610, damage]
type = TargetLifeAdd
triggerall = fvar(26)
trigger1 = AnimElem = 30, = 1
value = -Ceil(IfElse(fvar(28)=0,1,3)*fvar(10)*fvar(38)/12)
kill = 0
ID = 2600

[State 2610, damage]
type = TargetLifeAdd
triggerall = fvar(26)
trigger1 = AnimElem = 39, = 1
trigger2 = AnimElem = 44, = 1
trigger3 = AnimElem = 53, = 1
trigger4 = AnimElem = 59, = 1
trigger5 = AnimElem = 66, = 1
trigger6 = AnimElem = 73, = 1
trigger7 = AnimElem = 80, = 1
trigger8 = AnimElem = 88, = 1
trigger9 = AnimElem = 95, = 1
value = -Ceil(IfElse(fvar(28)=0,1,1)*fvar(10)*fvar(38)/13)
kill = 0
ID = 2600

[State 2610, damage]
type = TargetLifeAdd
triggerall = fvar(29) = 4
trigger1 = AnimElem = 11, = 1
value = -Ceil(21*100*fvar(10)*fvar(38)/10/119)
kill = 0
ID = 2600

[State 2610, damage]
type = TargetLifeAdd
triggerall = fvar(29) = 4
trigger1 = AnimElem = 16, = 1
value = -Ceil(10*100*fvar(10)*fvar(38)/10/119)
kill = 0
ID = 2600

[State 2610, damage]
type = TargetLifeAdd
triggerall = fvar(29) = 4
trigger1 = AnimElem = 24, = 1
value = -Ceil(5*100*fvar(10)*fvar(38)/10/119)
kill = 0
ID = 2600

[State 2610, damage]
type = TargetLifeAdd
triggerall = fvar(29) = 4
trigger1 = AnimElem = 30, = 1
value = -Ceil(2*100*fvar(10)*fvar(38)/10/119)
kill = 0
ID = 2600

[State 2610, damage]
type = TargetLifeAdd
triggerall = fvar(29) = 4
trigger1 = AnimElem = 39, = 1
trigger2 = AnimElem = 44, = 1
trigger3 = AnimElem = 53, = 1
trigger4 = AnimElem = 59, = 1
trigger5 = AnimElem = 66, = 1
trigger6 = AnimElem = 73, = 1
trigger7 = AnimElem = 80, = 1
trigger8 = AnimElem = 88, = 1
trigger9 = AnimElem = 95, = 1
value = -Ceil(1*100*fvar(10)*fvar(38)/10/119)
kill = 0
ID = 2600

[State 2610, targetpoweradd]
type = TargetPowerAdd
trigger1 = AnimElem = 11, = 1
trigger2 = AnimElem = 16, = 1
trigger3 = AnimElem = 24, = 1
trigger4 = AnimElem = 30, = 1
trigger5 = AnimElem = 39, = 1
trigger6 = AnimElem = 44, = 1
trigger7 = AnimElem = 53, = 1
trigger8 = AnimElem = 59, = 1
trigger9 = AnimElem = 66, = 1
trigger10 = AnimElem = 73, = 1
trigger11 = AnimElem = 80, = 1
trigger12 = AnimElem = 88, = 1
trigger13 = AnimElem = 95, = 1
value = 15
ID = 2600

[State 2610, snd]
type = PlaySnd
trigger1 = AnimElem = 96
value = S3,2

[State 2610, hitdef]
type = HitDef
triggerall = !fvar(26)
trigger1 = AnimElem = 97
attr = A,HA
hitflag = MAF
guardflag = -1
animtype = Up
ground.type = Low
priority = 7,hit
damage = IfElse(fvar(29)=4,(Ceil(12*100*fvar(10)*fvar(38)/10/119)),(Ceil(15*(100-random%11)*fvar(10)*fvar(38)/10/103)))
pausetime = 11,11
sparkno = S7203+(fvar(29)!=4)*50
guard.sparkno = S7212+(fvar(29)!=4)*50
sparkxy = -20,-61+Ceil(P2BodyDist Y)
hitsound = S5,4+(fvar(29)!=4)*5
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 1
fall.recover = 0
ground.velocity = 0,-11
guard.velocity = -12
air.velocity = 0,-11
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
p2facing = 1
kill = 0
ID = 2601
getpower = 0,0
givepower = 15,15

[State 2610, hitdef]
type = HitDef
triggerall = fvar(26)
trigger1 = AnimElem = 97
attr = A,HA
hitflag = MAF
guardflag = -1
animtype = Up
ground.type = Low
priority = 7,hit
damage = Ceil(IfElse(fvar(28)=0,9,14)*fvar(10)*fvar(38)/13)
pausetime = 11,11
sparkno = S7203+(fvar(29)!=4)*50
guard.sparkno = S7212+(fvar(29)!=4)*50
sparkxy = -20,-61+Ceil(P2BodyDist Y)
hitsound = S5,4+(fvar(29)!=4)*5
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 1
fall.recover = 0
ground.velocity = 0,-11
guard.velocity = -12
air.velocity = 0,-11
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
p2facing = 1
kill = 0
ID = 2601
getpower = 0,0
givepower = 15,15

[State 2610, targetstate]
type = TargetState
triggerall = NumTarget(2601)
trigger1 = Target,MoveType = H
trigger1 = MoveHit
value = 2621
ID = 2601
ignorehitpause = 1
persistent = 0

[State 2600, hitdef]
type = HitDef
triggerall = !fvar(26)
trigger1 = AnimElem = 102
attr = A,HA
hitflag = MAF
guardflag = -1
animtype = Up
ground.type = Low
priority = 7,hit
damage = IfElse(fvar(29)=4,(Ceil(12*100*fvar(10)*fvar(38)/10/119)),(Ceil(7*(100-random%11)*fvar(10)*fvar(38)/10/103)))
pausetime = 17,17
sparkno = S7203+(fvar(29)!=4)*50
guard.sparkno = S7212+(fvar(29)!=4)*50
sparkxy = -20,-61+Ceil(P2BodyDist Y)
hitsound = S5,4+(fvar(29)!=4)*5
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 38+17+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = -2,-11
guard.velocity = -12
air.velocity = -2,-11
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
p2facing = 1
kill = 1
ID = 2602
getpower = 0,0
givepower = 15,15

[State 2600, hitdef]
type = HitDef
triggerall = fvar(26)
trigger1 = AnimElem = 102
attr = A,HA
hitflag = MAF
guardflag = -1
animtype = Up
ground.type = Low
priority = 7,hit
damage = Ceil(IfElse(fvar(28)=0,9,14)*fvar(10)*fvar(38)/12)
pausetime = 17,17
sparkno = S7203+(fvar(29)!=4)*50
guard.sparkno = S7212+(fvar(29)!=4)*50
sparkxy = -20,-61+Ceil(P2BodyDist Y)
hitsound = S5,4+(fvar(29)!=4)*5
guardsound = S6,1
ground.hittime = 17
guard.slidetime = 17
guard.hittime = 17
guard.ctrltime = 17
air.hittime = 60
fall = 1
fall.recover = !(fvar(29) = 3 || fvar(29) = 6)
fall.recovertime = 38+17+Ceil((-EnemyNear(var(2)),Pos Y)/10)
ground.velocity = -2,-11
guard.velocity = -12
air.velocity = -2,-11
yaccel = .55
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
p2facing = 1
kill = 1
ID = 2602
getpower = 0,0
givepower = 15,15

[State 2610, targetstate]
type = TargetState
triggerall = NumTarget(2602)
trigger1 = Target,MoveType = H
trigger1 = MoveHit
value = 3050
ID = 2602
ignorehitpause = 1
persistent = 0

[State -2, shake]
type = EnvShake
trigger1 = NumTarget(2602)
trigger1 = MoveHit
time = 10
freq = 60
ampl = 2
ignorehitpause = 1
persistent = 0

[State 2600, statetype]
type = StateTypeSet
trigger1 = AnimElem = 96
StateType = A

[State 2600, 1]
type = VelSet
trigger1 = AnimElem = 96
x = 0
y = -7

[State 2600, 1]
type = VelAdd
trigger1 = AnimElem = 96, > 0
y = .31

[State 2610, end]
type = ChangeState
trigger1 = AnimElem = 104, >= 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 2611

[Statedef 2611]
type = S
physics = S
movetype = I
ctrl = 0
anim = 2611
velset = 0,0
sprpriority = 2

[State 2610, pos]
type = PosSet
trigger1 = Time = 0
y = 0

[State -2, targetdrop]
type = TargetDrop
trigger1 = AnimTime = -1

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 2610, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[Statedef 2620]
type = S
physics = N
movetype = H
ctrl = 0
velset = 0,0
sprpriority = 2

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
value = 5050

[State 2020, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 2620]
type = ChangeAnim2
trigger1 = time = 0
value = 2620

[State 2620, end]
type = SelfState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[Statedef 2621];相手動作
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
value = 5050

[State -2, anim]
type = ChangeAnim2
trigger1 = time = 0
value = 2621

[State -2, end]
type = ChangeState
trigger1 = HitShakeOver
value = 2622

[Statedef 2622]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
value = 5050

[State -2, anim]
type = ChangeAnim2
trigger1 = time = 0
value = 2622

[State 2621, vel]
type = velset
trigger1 = Time = 0
x = GetHitVar(xvel)*Facing
y = GetHitVar(yvel)

[State 2622, gravity]
type = VelAdd
Trigger1 = time > 0
y = GetHitVar(yaccel)

[State 2622, end]
type = SelfState
trigger1 = Pos Y >= -20
trigger1 = Vel Y > 0
value = 5050


;=================================================================
;デッドエンドスクリーマーA
[Statedef 2700]
type = S
movetype = A
physics = S
anim = 2700
ctrl = 0
sprpriority = 2
velset = 0,0

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State -2];どこキャン時点滅
type = PalFX
triggerall = var(46)
triggerall = Time < 9
trigger1 = Time%2 = 0
time = 1
add = 255,255,255
mul = 255,255,255
ignorehitpause = 1

[State -2, 再使用制限 98UM(EX)]
type = VarSet
triggerall = fvar(29) = 4
triggerall = Time = 0
triggerall = fvar(34) = 2
triggerall = var(53)
trigger1 = !(Power >= 1000 || var(52))
var(51) = 1

[State -2, power 98UM]
type = PowerAdd
triggerall = fvar(29) = 4
trigger1 = Time = 0
value = IfElse(var(52),0,-IfElse((var(51)),0,1000))

[State -2, power 2002]
type = PowerAdd
triggerall = fvar(29) = 1
trigger1 = Time = 0
trigger1 = !var(52)
value = -1000

[State -2, power S]
type = PowerAdd
triggerall = !(fvar(29) = 1 || fvar(29) = 4)
trigger1 = Time = 0
value = IfElse((var(52)||var(53)),0,-1000)

[State -2, max reset]
type = VarSet
trigger1 = Time = 0
trigger1 = var(52)
var(52) = 0

[State -2, nothitby]
type = NotHitBy
trigger1 = AnimElem = 4, < 0;要調整
value = SCA
time = 1

[State -2, pause]
type = Pause
trigger1 = Time = 2
time = 28
movetime = 28

[State -2]
type = VelSet
trigger1 = Time = 2
x = 0
y = 0

[State -2, env]
type = EnvColor
trigger1 = Time = 2
value = 255,255,255
time = 4
under = 1

[State -2, env]
type = EnvColor
trigger1 = Time = 6
value = 0,0,0
time = 24
under = 1

[State -2, snd]
type = PlaySnd
trigger1 = time = 2
value = S8,1

[State -2, explod 98UM]
type = Explod
triggerall = fvar(26) != 1
trigger1 = Time = 0 + 6;要調整
anim = 7600
ID = 7600
pos = 10,-80
postype = p1
facing = 1
removetime = -2
sprpriority = -1
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State -2, explod]
type = Explod
triggerall = fvar(26) != 1
trigger1 = Time = 8 + 6;要調整
anim = 7605
ID = 7605
pos = 10,-80
postype = p1
facing = 1
removetime = -2
sprpriority = 4
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

;----------------------------------------------------
;02um
[State -2, explod 02UM]
type = Explod
triggerall = fvar(26) = 1
trigger1 = Time = 2 + 6;要調整
anim = 7620
ID = 7620
pos = 10,-80
postype = p1
facing = 1
removetime = -2
sprpriority = -1
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State -2, explod]
type = Explod
triggerall = fvar(26) = 1
trigger1 = Time = 2 + 6;要調整
anim = 7560
ID = 7560
pos = 10,-80
postype = p1
facing = 1
removetime = -2
sprpriority = 4
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 2700, statetypeset]
type = StateTypeSet
trigger1 = AnimElem = 4
statetype = A
physics = N

[State 2700, velset]
type = VelSet
trigger1 = AnimElem = 4
x = 3
y = -19

[State 2700, gravity]
type = VelAdd
trigger1 = AnimElem = 4, > 0
y = 1.5

[State 2700, snd]
type = PlaySnd
trigger1 = AnimElem = 4
value = S0,1

[State 2700, afterimagetime]
type = afterimage
trigger1 = AnimElem = 4
time = -1
length = 7
palcolor = 0
palinvertall = 0
palcontrast = 140, 140, 230
palbright = 0, 30, 90
palpostbright = 30, 0, 30
paladd = 0, 0, 0
palmul = 1,1,1
framegap = 2
trans = add1

[State 2700, afterimage]
type = afterimage
trigger1 = AnimElem = 4, > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
time = 0

[State -2, overkill];オーバーキルリセット
type = varset
trigger1 = Time = 0
var(20) = 0

[State 2700]
type = AttackDist
trigger1 = 1
value = 0

[State 2700, hitdef]
type = HitDef
triggerall = !var(9) || !(fvar(29) = 1 || fvar(29) = 4)
trigger1 = !(fvar(29) = 3 || fvar(29) = 6)
trigger1 = AnimElem = 7, >= 4
attr = A,HT
hitflag = M-
guardflag = -1
animtype = Hard
priority = 7,miss
numhits = 0
pausetime = 0,0
hitsound = -1
sparkno = -1
ground.type = Low
p2facing = 1
ID = 2700
kill = 0
givepower = 0,0
fall = 1
fall.recover = 0

[State 2700, hitdef]
type = HitDef
triggerall = !var(9) || !(fvar(29) = 1 || fvar(29) = 4)
trigger1 = (fvar(29) = 3 || fvar(29) = 6)
trigger1 = AnimElem = 7, >= 0
attr = A,HT
hitflag = M
guardflag = -1
animtype = Hard
priority = 7,miss
numhits = 0
pausetime = 0,0
hitsound = -1
sparkno = -1
ground.type = Low
p2facing = 1
ID = 2700
kill = 0
givepower = 0,0
fall = 1
fall.recover = 0

[State 2700, targetdrop]
type = TargetDrop
trigger1 = NumTarget(2700)
excludeID = 2700
keepone = 0
ignorehitpause = 1

[State 2700, nothitby]
type = NotHitBy
trigger1 = NumTarget(2700)
trigger1 = MoveHit
value = SCA
time = 1
ignorehitpause = 1

[State 2700, afterimage]
type = afterimage
triggerall = NumTarget(2700)
trigger1 = MoveHit
time = 0
ignorehitpause = 1

[State 2700, hit]
type = TargetState
triggerall = NumTarget(2700)
trigger1 = MoveHit
trigger1 = Target,MoveType = H
trigger1 = Target,StateNo != 2720
value = 2720
ID = 2700
ignorehitpause = 1

[State 2700, hit]
type = ChangeState
triggerall = NumTarget(2700)
trigger1 = MoveHit
trigger1 = P2StateNo = 2720
value = 2710
ignorehitpause = 1

[State 2700, end]
type = ChangeState
trigger1 = AnimElem = 4, > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 2701

[Statedef 2701]
type = S
physics = S
movetype = I
ctrl = 0
anim = 2701
velset = 0,0
sprpriority = 2

[State 2701, posset]
type = PosSet
trigger1 = Time = 0
y = 0

[State 2701, snd]
type = PlaySnd
trigger1 = Time = 0
value = S0,2

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 2701, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;=================================================================
;デッドエンドスクリーマーB
[Statedef 2750]
type = S
movetype = A
physics = S
anim = 2750
ctrl = 0
sprpriority = 2
velset = 0,0

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State -2];どこキャン時点滅
type = PalFX
triggerall = var(46)
triggerall = Time < 9
trigger1 = Time%2 = 0
time = 1
add = 255,255,255
mul = 255,255,255
ignorehitpause = 1

[State -2, 再使用制限 98UM(EX)]
type = VarSet
triggerall = fvar(29) = 4
triggerall = Time = 0
triggerall = fvar(34) = 2
triggerall = var(53)
trigger1 = !(Power >= 1000 || var(52))
var(51) = 1

[State -2, power 98UM]
type = PowerAdd
triggerall = fvar(29) = 4
trigger1 = Time = 0
value = IfElse(var(52),0,-IfElse((var(51)),0,1000))

[State -2, power 2002]
type = PowerAdd
triggerall = fvar(29) = 1
trigger1 = Time = 0
trigger1 = !var(52)
value = -1000

[State -2, power S]
type = PowerAdd
triggerall = !(fvar(29) = 1 || fvar(29) = 4)
trigger1 = Time = 0
value = IfElse((var(52)||var(53)),0,-1000)

[State -2, max reset]
type = VarSet
trigger1 = Time = 0
trigger1 = var(52)
var(52) = 0

[State -2, nothitby]
type = NotHitBy
trigger1 = AnimElem = 4, < 0;要調整
value = SCA
time = 1

[State -2, pause]
type = Pause
trigger1 = Time = 2
time = 28
movetime = 28

[State -2]
type = VelSet
trigger1 = Time = 2
x = 0
y = 0

[State -2, env]
type = EnvColor
trigger1 = Time = 2
value = 255,255,255
time = 4
under = 1

[State -2, env]
type = EnvColor
trigger1 = Time = 6
value = 0,0,0
time = 24
under = 1

[State -2, snd]
type = PlaySnd
trigger1 = time = 2
value = S8,1

[State -2, explod 98UM]
type = Explod
triggerall = fvar(26) != 1
trigger1 = Time = 0 + 6;要調整
anim = 7600
ID = 7600
pos = 10,-80
postype = p1
facing = 1
removetime = -2
sprpriority = -1
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State -2, explod]
type = Explod
triggerall = fvar(26) != 1
trigger1 = Time = 8 + 6;要調整
anim = 7605
ID = 7605
pos = 10,-80
postype = p1
facing = 1
removetime = -2
sprpriority = 4
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

;---------------------------------------------------------
;02um
[State -2, explod 98UM]
type = Explod
triggerall = fvar(26) = 1
trigger1 = Time = 2 + 6;要調整
anim = 7620
ID = 7620
pos = 10,-80
postype = p1
facing = 1
removetime = -2
sprpriority = -1
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State -2, explod]
type = Explod
triggerall = fvar(26) = 1
trigger1 = Time = 10 + 6;要調整
anim = 7560
ID = 7560
pos = 10,-80
postype = p1
facing = 1
removetime = -2
sprpriority = 4
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1



[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 2700, statetypeset]
type = StateTypeSet
trigger1 = AnimElem = 4
statetype = A
physics = N

[State 2700, velset]
type = VelSet
trigger1 = AnimElem = 4
x = 7.5
y = -19

[State 2700, gravity]
type = VelAdd
trigger1 = AnimElem = 4, > 0
y = 1.5

[State 2700, snd]
type = PlaySnd
trigger1 = AnimElem = 4
value = S0,1

[State 2700, afterimagetime]
type = afterimage
trigger1 = AnimElem = 4
time = -1
length = 7
palcolor = 0
palinvertall = 0
palcontrast = 140, 140, 230
palbright = 0, 30, 90
palpostbright = 30, 0, 30
paladd = 0, 0, 0
palmul = 1,1,1
framegap = 2
trans = add1

[State 2700, afterimage]
type = afterimage
trigger1 = AnimElem = 4, > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
time = 0

[State -2, overkill];オーバーキルリセット
type = varset
trigger1 = Time = 0
var(20) = 0

[State 2700]
type = AttackDist
trigger1 = 1
value = 0

[State 2700, hitdef]
type = HitDef
triggerall = !var(9) || !(fvar(29) = 1 || fvar(29) = 4)
trigger1 = !(fvar(29) = 3 || fvar(29) = 6)
trigger1 = AnimElem = 7, >= 4
attr = A,HT
hitflag = M-
guardflag = -1
animtype = Hard
priority = 7,miss
numhits = 0
pausetime = 0,0
hitsound = -1
sparkno = -1
ground.type = Low
p2facing = 1
ID = 2700
kill = 0
givepower = 0,0
fall = 1
fall.recover = 0

[State 2700, hitdef]
type = HitDef
triggerall = !var(9) || !(fvar(29) = 1 || fvar(29) = 4)
trigger1 = (fvar(29) = 3 || fvar(29) = 6)
trigger1 = AnimElem = 7, >= 0
attr = A,HT
hitflag = M
guardflag = -1
animtype = Hard
priority = 7,miss
numhits = 0
pausetime = 0,0
hitsound = -1
sparkno = -1
ground.type = Low
p2facing = 1
ID = 2700
kill = 0
givepower = 0,0
fall = 1
fall.recover = 0

[State 2700, targetdrop]
type = TargetDrop
trigger1 = NumTarget(2700)
excludeID = 2700
keepone = 0
ignorehitpause = 1

[State 2700, nothitby]
type = NotHitBy
trigger1 = NumTarget(2700)
trigger1 = MoveHit
value = SCA
time = 1
ignorehitpause = 1

[State 2700, afterimage]
type = afterimage
triggerall = NumTarget(2700)
trigger1 = MoveHit
time = 0
ignorehitpause = 1

[State 2700, hit]
type = TargetState
triggerall = NumTarget(2700)
trigger1 = MoveHit
trigger1 = Target,MoveType = H
trigger1 = Target,StateNo != 2720
value = 2720
ID = 2700
ignorehitpause = 1

[State 2700, hit]
type = ChangeState
triggerall = NumTarget(2700)
trigger1 = MoveHit
trigger1 = P2StateNo = 2720
value = 2710
ignorehitpause = 1

[State 2700, end]
type = ChangeState
trigger1 = AnimElem = 4, > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 2751

[Statedef 2751]
type = S
physics = S
movetype = I
ctrl = 0
anim = 2751
velset = 0,0
sprpriority = 2

[State 2701, posset]
type = PosSet
trigger1 = Time = 0
y = 0

[State 2701, snd]
type = PlaySnd
trigger1 = Time = 0
value = S0,2

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 2701, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;スクリーマーヒット
[Statedef 2710]
type = A
movetype = A
physics = N
velset = 0,0
anim = 2710
ctrl = 0
sprpriority = 2

[State 2710, overkill];オーバーキル判定
type = varset
triggerall = NumTarget(2700) = 1
trigger1 = Target,life <= 1
var(20) = 1

[State 2710, env]
type = EnvColor
trigger1 = Time = 0
value = 255,255,255
time = 1
under = 1

[State 2710, snd]
type = PlaySnd
trigger1 = Time = 0
value = S2,26
volume = 150

[State 2710, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 2710]
type = BindToTarget
trigger1 = Time = [0,2)
time = 1
pos = -(Target,Const(size.head.pos.x)),(Target,Const(size.head.pos.y))+20
ID = 2700

[State 2710, snd]
type = PlaySnd
trigger1 = Time = 0
value = S5,4

[State 2710, explod]
type = Explod
trigger1 = Time = 0
anim = 7205
pos = 0,-20
postype = p1
facing = 1
sprpriority = 3

[State 2710]
type = PosAdd
trigger1 = AnimElem = 3
x = 4
y = 3

[State 2710]
type = PosAdd
trigger1 = AnimElem = 4
x = -4
y = -3

[State 2710]
type = TargetBind
trigger1 = AnimElem = 6, >= 0
time = 1
pos = -12,0
ID = 2700

[State 2710]
type = VelSet
trigger1 = AnimElem = 6
y = 12

[State 2710]
type = TargetState
trigger1 = AnimElem = 6, >= 0
trigger1 = Pos Y >= 0
value = 2721
ID = 2700

[State 2710]
type = ChangeState
trigger1 = AnimElem = 6, >= 0
trigger1 = Pos Y >= 0
value = 2711


[Statedef 2711];+3回転
type = S
movetype = A
physics = S
ctrl = 0
anim = 2711
velset = 0,0
sprpriority = 2

[State -2, shake]
type = EnvShake
trigger1 = Time = 0
time = 14
freq = 60
ampl = -4

[State 2711, target]
type = TargetBind
trigger1 = var(33) < 18
trigger2 = var(33) = 18 && AnimElem = 18, < 1
pos = -12,0
ID = 2700

[State 2711, env]
type = EnvColor
trigger1 = Time = 0
trigger2 = AnimElem = 12
value = 255,255,255
time = 1
under = 1

[State 2711, overkill];オーバーキル判定
type = varset
triggerall = NumTarget(2700) = 1
trigger1 = Target,life <= 1
var(20) = 1

[State 2711, damage]
type = TargetLifeAdd
triggerall = fvar(26) != 1
trigger1 = Time = 0
trigger2 = var(33) = 0
trigger2 = AnimElem = 9
trigger3 = AnimElem = 12
value = -Ceil(2*100*fvar(10)*fvar(38)/10/119)
kill = 0
ID = 2700

[State 2711, damage 02um]
type = TargetLifeAdd
triggerall = fvar(26) = 1
trigger1 = Time = 0
trigger2 = var(33) = 0
trigger2 = AnimElem = 9
trigger3 = AnimElem = 12
value = -12
kill = 0
ID = 2700

[State 2711, varreset]
type = VarSet
trigger1 = Time = 0
var(33) = 0

[State 2711, snd]
type = PlaySnd
trigger1 = Time = 0
value = S0,7

[State 2711, explod]
type = Explod
trigger1 = Time = 0
anim = 7301
sprpriority = 0
pos = 0,0
postype = p1
facing = 1

[State 2711, explod]
type = Explod
trigger1 = Time = 0
anim = 7302
sprpriority = 3
pos = 0,0
postype = p1
facing = 1

[State 2711, target]
type = TargetState
trigger1 = AnimElem = 11
value = 2722
persistent = 0
ID = 2700

[State 2711, snd]
type = PlaySnd
trigger1 = AnimElem = 11
value = 3,13
persistent = 0
channel = 13

[State 2711, snd]
type = PlaySnd
trigger1 = AnimElem = 11
value = 2,23
volume = 150
persistent = 0

[State 2711, explod]
type = Explod
trigger1 = AnimElem = 11
anim = 8028
ID = 8028
sprpriority = 3
pos = 0,0
postype = p1
removetime = -1
bindtime = -1
facing = 1
persistent = 0

[State 2711, count];回転数カウント
type = VarAdd
trigger1 = AnimElem = 11, = 1
var(33) = 1

[State 2711, snd]
type = PlaySnd
trigger1 = AnimElem = 15, = 1
trigger1 = var(33) = 18
value = 3,14

[State 2711, removeexplod]
type = RemoveExplod
trigger1 = AnimElem = 15, = 1
trigger1 = var(33) = 18
ID = 8028

[State 2711, snd]
type = StopSnd
trigger1 = AnimElem = 15, = 1
trigger1 = var(33) = 18
channel = 13

[State 2711, target]
type = TargetState
trigger1 = AnimElem = 15, = 1
trigger1 = var(33) = 18
value = 2723
ID = 2700

[State 2711, end]
type = ChangeState
trigger1 = AnimElem = 15, = 1
trigger1 = var(33) >= 18
value = 2712

[Statedef 2712]
type = S
movetype = A
physics = S
ctrl = 0
anim = 2712
velset = 0
sprpriority = 2

[State 2712, damage]
type = TargetLifeAdd
triggerall = !var(20)
trigger1 = Time = 0
value = -Ceil(2*100*fvar(10)*fvar(38)/10/119)
kill = 1
ID = 2700

[State 2712, damage]
type = TargetLifeAdd
triggerall = var(20)
trigger1 = Time = 0
value = -999999
kill = 1
ID = 2700

[State -2, targetdrop]
type = TargetDrop
trigger1 = AnimTime = -1

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 2712, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;スクリーマーP2
[Statedef 2720]
type = L
movetype = H
physics = N
ctrl = 0
velset = 0,0
sprpriority = 1

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
value = 5050

[State 2720, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 2720]
type = ChangeAnim2
trigger1 = time = 0
value = 2720

[Statedef 2721]
type = L
movetype = H
physics = N
ctrl = 0
velset = 0,0
sprpriority = 1

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
value = 5050

[State 2720]
type = ChangeAnim2
trigger1 = time = 0
value = 2721

[Statedef 2722]
type = L
movetype = H
physics = N
ctrl = 0
velset = 0,0
sprpriority = 1

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
value = 5050

[State 2720]
type = ChangeAnim2
trigger1 = time = 0
value = 2722

[Statedef 2723]
type = L
movetype = H
physics = N
ctrl = 0
sprpriority = 1

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
value = 5050

[State 2720]
type = ChangeAnim2
trigger1 = time = 0
value = 2723

[State 2720]
type = VelSet
trigger1 = Time = 0
x = -4.4
y = -6

[State 2720]
type = VelAdd
trigger1 = Time > 0
y = .5

[State 2720]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100


;=================================================================
;MAX版デッドエンドスクリーマー
[Statedef 2800]
type = S
movetype = A
physics = S
anim = 2750
ctrl = 0
sprpriority = 2
velset = 0,0

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State -2];どこキャン時点滅
type = PalFX
triggerall = var(46)
triggerall = Time < 9
trigger1 = Time%2 = 0
time = 1
add = 255,255,255
mul = 255,255,255
ignorehitpause = 1

[State -2, 再使用制限 98UM(EX)]
type = VarSet
triggerall = fvar(29) = 4
triggerall = Time = 0
triggerall = fvar(34) = 2
trigger1 = var(53)
var(51) = 1

[State -2, power 98UM]
type = PowerAdd
triggerall = fvar(29) = 4
trigger1 = Time = 0
value = IfElse((fvar(34)=1&&var(58)=1),-3000,-1000)

[State -2, power 2002]
type = PowerAdd
triggerall = fvar(26) != 1
triggerall = fvar(29) = 1
trigger1 = Time = 0
value = -1000

[State -2, power 2002]
type = PowerAdd
triggerall = fvar(26) = 1
trigger1 = Time = 0
value = ifelse(var(52)>0,-1000,-3000)

[State -2, power S]
type = PowerAdd
triggerall = !(fvar(29) = 1 || fvar(29) = 4)
trigger1 = Time = 0
value = IfElse(var(58)=1,-2000,IfElse(!var(53),-1000,IfElse(!var(52),-1000,0)))

[State -2, max reset]
type = VarSet
trigger1 = Time = 0
trigger1 = var(52)
var(52) = 0

[State -2, nothitby]
type = NotHitBy
trigger1 = AnimElem = 4, < 0;要調整
value = SCA
time = 1

[State -2, pause]
type = Pause
trigger1 = Time = 2
time = 28
movetime = 28

[State -2]
type = VelSet
trigger1 = Time = 2
x = 0
y = 0

[State -2, env]
type = EnvColor
trigger1 = Time = 2
value = 255,255,255
time = 4
under = 1

[State -2, env]
type = EnvColor
trigger1 = Time = 6
value = 0,0,0
time = 24
under = 1

[State -2, snd]
type = PlaySnd
trigger1 = time = 2
value = S8,1

[State -2, explod 98UM]
type = Explod
triggerall = fvar(26) != 1
trigger1 = Time = 0 + 6;要調整
anim = 7610
ID = 7610
pos = 10,-80
postype = p1
facing = 1
removetime = -2
sprpriority = -1
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State -2, explod]
type = Explod
triggerall = fvar(26) != 1
trigger1 = Time = 8 + 6;要調整
anim = 7615
ID = 7615
pos = 10,-80
postype = p1
facing = 1
removetime = -2
sprpriority = 4
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

;------------------------------------------------------------
;02um
[State -2, explod 02UM]
type = Explod
triggerall = fvar(26) = 1
trigger1 = Time = 2 + 6;要調整
anim = 7630
ID = 7630
pos = 10,-80
postype = p1
facing = 1
removetime = -2
sprpriority = -1
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State -2, explod]
type = Explod
triggerall = fvar(26) = 1
trigger1 = Time = 10 + 6;要調整
anim = 7570
ID = 7570
pos = 10,-80
postype = p1
facing = 1
removetime = -2
sprpriority = 4
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 2700, statetypeset]
type = StateTypeSet
trigger1 = AnimElem = 4
statetype = A
physics = N

[State 2700, velset]
type = VelSet
trigger1 = AnimElem = 4
x = 7.5
y = -19

[State 2700, gravity]
type = VelAdd
trigger1 = AnimElem = 4, > 0
y = 1.5

[State 2700, snd]
type = PlaySnd
trigger1 = AnimElem = 4
value = S0,1

[State 2700, afterimagetime]
type = afterimage
trigger1 = AnimElem = 4
time = -1
length = 7
palcolor = 0
palinvertall = 0
palcontrast = 140, 140, 230
palbright = 0, 30, 90
palpostbright = 30, 0, 30
paladd = 0, 0, 0
palmul = 1,1,1
framegap = 2
trans = add1

[State 2700, afterimage]
type = afterimage
trigger1 = AnimElem = 4, > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
time = 0

[State -2, overkill];オーバーキルリセット
type = varset
trigger1 = Time = 0
var(20) = 0

[State 2700]
type = AttackDist
trigger1 = 1
value = 0

[State 2700, hitdef]
type = HitDef
triggerall = !var(9) || !(fvar(29) = 1 || fvar(29) = 4)
trigger1 = !(fvar(29) = 3 || fvar(29) = 6)
trigger1 = AnimElem = 7, >= 4
attr = A,HT
hitflag = M-
guardflag = -1
animtype = Hard
priority = 7,miss
numhits = 0
pausetime = 0,0
hitsound = -1
sparkno = -1
ground.type = Low
p2facing = 1
ID = 2800
kill = 0
givepower = 0,0
fall = 1
fall.recover = 0

[State 2700, hitdef]
type = HitDef
triggerall = !var(9) || !(fvar(29) = 1 || fvar(29) = 4)
trigger1 = (fvar(29) = 3 || fvar(29) = 6)
trigger1 = AnimElem = 7, >= 0
attr = A,HT
hitflag = M
guardflag = -1
animtype = Hard
priority = 7,miss
numhits = 0
pausetime = 0,0
hitsound = -1
sparkno = -1
ground.type = Low
p2facing = 1
ID = 2800
kill = 0
givepower = 0,0
fall = 1
fall.recover = 0

[State 2800, targetdrop]
type = TargetDrop
trigger1 = NumTarget(2800)
excludeID = 2800
keepone = 0
ignorehitpause = 1

[State 2800, nothitby]
type = NotHitBy
trigger1 = NumTarget(2800)
trigger1 = MoveHit
value = SCA
time = 1
ignorehitpause = 1

[State 2800, afterimage]
type = afterimage
triggerall = NumTarget(2800)
trigger1 = MoveHit
time = 0
ignorehitpause = 1

[State 2800, hit]
type = TargetState
triggerall = NumTarget(2800)
trigger1 = MoveHit
trigger1 = Target,MoveType = H
trigger1 = Target,StateNo != 2820
value = 2820
ID = 2800
ignorehitpause = 1

[State 2800, hit]
type = ChangeState
triggerall = NumTarget(2800)
trigger1 = MoveHit
trigger1 = P2StateNo = 2820
value = 2810
ignorehitpause = 1

[State 2800, end]
type = ChangeState
trigger1 = AnimElem = 4, > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 2801

[Statedef 2801]
type = S
physics = S
movetype = I
ctrl = 0
anim = 2801
velset = 0,0
sprpriority = 2

[State 2701, posset]
type = PosSet
trigger1 = Time = 0
y = 0

[State 2701, snd]
type = PlaySnd
trigger1 = Time = 0
value = S0,2

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
value = 1

[State 2701, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;スクリーマーヒット
[Statedef 2810]
type = A
movetype = A
physics = N
velset = 0,0
anim = 2810
ctrl = 0
sprpriority = 2

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 2810, env]
type = EnvColor
trigger1 = Time = 0
trigger2 = AnimElem = 16, = 2
value = 255,255,255
time = 1
under = 1

[State 2810, overkill];オーバーキル判定
type = varset
triggerall = NumTarget(2800) = 1
trigger1 = Target,life <= 1
var(20) = 1

[State 2810, snd]
type = PlaySnd
trigger1 = Time = 0
value = S2,26
volume = 150

[State 2810]
type = BindToTarget
trigger1 = Time = [0,2)
time = 1
pos = -(Target,Const(size.head.pos.x)),(Target,Const(size.head.pos.y))+20
ID = 2800

[State 2810, explod]
type = Explod
trigger1 = Time = 0
anim = 7205
pos = 0,-20
postype = p1
facing = 1
sprpriority = 3

[State 2810, snd]
type = PlaySnd
trigger1 = Time = 0
value = S5,4

[State 2810]
type = PosAdd
trigger1 = AnimElem = 3
x = 4
y = 3

[State 2810]
type = PosAdd
trigger1 = AnimElem = 4
x = -4
y = -3

[State 2810, snd]
type = PlaySnd
trigger1 = AnimElem = 16
value = S3,12

[State 2810, explod]
type = Explod
trigger1 = AnimElem = 16
anim = 8029
ID = 8029
sprpriority = 3
pos = 0,0
postype = p1
facing = 1

[State 2810]
type = TargetBind
trigger1 = AnimElem = 19, >= 0
time = 1
pos = -12,0
ID = 2800

[State 2810]
type = VelSet
trigger1 = AnimElem = 19
y = 12

[State 2810]
type = TargetState
trigger1 = AnimElem = 19, >= 0
trigger1 = Pos Y >= 0
value = 2721
ID = 2800

[State 2810]
type = ChangeState
trigger1 = AnimElem = 19, >= 0
trigger1 = Pos Y >= 0
value = 2811


[Statedef 2811];+4回転
type = S
movetype = A
physics = S
ctrl = 0
anim = 2811
velset = 0,0
sprpriority = 2

[State 2811, target]
type = TargetBind
trigger1 = var(1) < 24
trigger2 = var(1) = 24 && AnimElem = 9, < 1
pos = -12,0
ID = 2800

[State 2811, env]
type = EnvColor
trigger1 = Time = 0
trigger2 = AnimElem = 5
value = 255,255,255
time = 1
under = 1

[State 2811, overkill];オーバーキル判定
type = varset
triggerall = NumTarget(2800) = 1
trigger1 = Target,life <= 1
var(20) = 1

[State 2811, damage]
type = TargetLifeAdd
triggerall = fvar(26) != 1
trigger1 = Time = 0
value = -Ceil(12*100*fvar(10)*fvar(38)/10/119)
kill = 0
ID = 2800

[State 2811, damage]
type = TargetLifeAdd
triggerall = fvar(26) != 1
trigger1 = AnimElem = 5
value = -Ceil(2*100*fvar(10)*fvar(38)/10/119)
kill = 0
ID = 2800

;---------------------------------------------------
;02um
[State 2811, damage]
type = TargetLifeAdd
triggerall = fvar(26) = 1
trigger1 = Time = 0
value = -8
kill = 0
ID = 2800

[State 2811, damage]
type = TargetLifeAdd
triggerall = fvar(26) = 1
trigger1 = AnimElem = 5
value = -18
kill = 0
ID = 2800





[State 2811, varreset]
type = VarSet
trigger1 = Time = 0
var(33) = 0

[State 2811, snd]
type = PlaySnd
trigger1 = Time = 0
value = S0,7

[State 2811, explod]
type = Explod
trigger1 = Time = 0
anim = 7301
sprpriority = 0
pos = 0,0
postype = p1
facing = 1

[State 2711, explod]
type = Explod
trigger1 = Time = 0
anim = 7302
sprpriority = 3
pos = 0,0
postype = p1
facing = 1

[State 2711, target]
type = TargetState
trigger1 = AnimElem = 3
value = 2722
persistent = 0
ID = 2800

[State 2711, snd]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3,13
persistent = 0
channel = 13

[State 2711, snd]
type = PlaySnd
trigger1 = AnimElem = 3
value = 2,23
volume = 150

[State 2711, explod]
type = Explod
trigger1 = AnimElem = 3
anim = 8028
ID = 8028
sprpriority = 3
pos = 0,0
postype = p1
removetime = -1
bindtime = -1
facing = 1
persistent = 0

[State 2711, count];回転数カウント
type = VarAdd
trigger1 = AnimElem = 3, = 1
var(33) = 1

[State 2711, snd]
type = PlaySnd
trigger1 = var(33) = 24
trigger1 = AnimElem = 9, = 1
value = 3,14

[State 2711, removeexplod]
type = RemoveExplod
trigger1 = var(33) = 24
trigger1 = AnimElem = 9, = 1
ID = 8028

[State 2711, snd]
type = StopSnd
trigger1 = var(33) = 24
trigger1 = AnimElem = 9, = 1
channel = 13

[State 2711, target]
type = TargetState
trigger1 = var(33) = 24
trigger1 = AnimElem = 9, = 1
value = 2723
ID = 2800

[State 2711, end]
type = ChangeState
trigger1 = var(33) >= 24
trigger1 = AnimElem = 9, = 1
value = 2812

[Statedef 2812]
type = L
movetype = A
physics = S
ctrl = 0
anim = 2712
velset = 0
sprpriority = 2

[State 2812, damage]
type = TargetLifeAdd
triggerall = fvar(26) != 1
triggerall = !var(20)
trigger1 = Time = 0
value = -Ceil(2*100*fvar(10)*fvar(38)/10/119)
kill = 1
ID = 2800

[State 2812, damage 02um]
type = TargetLifeAdd
triggerall = fvar(26) = 1
triggerall = !var(20)
trigger1 = Time = 0
value = -20
kill = 1
ID = 2800

[State 2812, damage]
type = TargetLifeAdd
triggerall = var(20)
trigger1 = Time = 0
value = -999999
kill = 1
ID = 2800

[State -2, targetdrop]
type = TargetDrop
trigger1 = AnimTime = -1

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
trigger1 = !var(33)
value = 1

[State 2712, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;スクリーマーP2
[Statedef 2820]
type = L
movetype = H
physics = N
ctrl = 0
velset = 0,0
sprpriority = 1

[State -2]
type = DestroySelf
trigger1 = IsHelper

[State -2]
type = SelfState
trigger1 = Time > 600
value = 5050

[State 2820, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 2820]
type = ChangeAnim2
trigger1 = time = 0
value = 2820



;=================================================================
;=================================================================
;=================================================================
;カイザーフェニックス
[Statedef 3000]
type = S
physics = S
movetype = A
ctrl = 0
anim = 3000+!(fvar(29)=1&&!fvar(26))*10
velset = 0,0
sprpriority = 2

[State 3000, posadd]
type = PosAdd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 4
x = -7

[State -2, velset]
type = VelSet
trigger1 = !(PrevStateNo = [200,700))
trigger1 = Time = 0
x = 0

[State -2, velset]
type = VelSet
trigger1 = Time = 0
y = 0

[State -2, Turn]
type = Turn
trigger1 = Time = 0
trigger1 = P2Dist X < 0

[State -2];どこキャン時点滅
type = PalFX
triggerall = var(46)
triggerall = Time < 9
trigger1 = Time%2 = 0
time = 1
add = 255,255,255
mul = 255,255,255
ignorehitpause = 1

[State -2, 再使用制限 98UM(EX)]
type = VarSet
triggerall = fvar(29) = 4
triggerall = Time = 0
triggerall = fvar(34) = 2
trigger1 = var(53)
var(51) = 1

[State -2, 再使用制限 02UM]
type = VarSet
triggerall = fvar(29) = 1
triggerall = Time = 0
triggerall = fvar(26)
trigger1 = var(53)
var(51) = 1

[State -2, power 98UM]
type = PowerAdd
triggerall = fvar(29) = 4
trigger1 = Time = 0
value = IfElse((fvar(34)=1&&var(58)=1),-3000,-1000)

[State -2, power 2002]
type = PowerAdd
triggerall = fvar(29) = 1
trigger1 = Time = 0
value = IfElse((fvar(26)=1&&var(58)=1),-3000,-1000)

[State -2, power S]
type = PowerAdd
triggerall = !(fvar(29) = 1 || fvar(29) = 4)
trigger1 = Time = 0
value = IfElse(var(58)=1,-2000,IfElse(!var(53),-1000,IfElse(!var(52),-1000,0)))

[State -2, max reset]
type = VarSet
trigger1 = Time = 0
trigger1 = var(52)
var(52) = 0

[State -2, nothitby]
type = NotHitBy
trigger1 = Time < 32
value = SCA
time = 1

[State -2, nothitby]
type = NotHitBy
trigger1 = fvar(29) = 3 || fvar(29) = 6
value = SCA
time = 1

[State -2, pause]
type = Pause
trigger1 = Time = 3
time = 28
movetime = 28

[State -2]
type = VelSet
trigger1 = Time = 3
x = 0
y = 0

[State -2, env]
type = EnvColor
trigger1 = Time = 3
value = 255,255,255
time = 4
under = 1

[State -2, env]
type = EnvColor
trigger1 = Time = 7
value = 0,0,0
time = 24
under = 1

[State -2, snd]
type = PlaySnd
trigger1 = time = 3
value = S8,21

[State -2, explod 2002]
type = Explod
trigger1 = Time = 1 + 4;要調整
anim = 7640
pos = -48,-104;要調整
postype = p1
sprpriority = -1
pausemovetime = 99999
ownpal = 1
bindtime = -1

[State -2, explod 2002]
type = Explod
trigger1 = Time = 11 + 4;要調整
anim = 7580
pos = -48,-104;要調整
postype = p1
sprpriority = 3
pausemovetime = 99999
ownpal = 1
bindtime = -1

[State 3000]
type = AssertSpecial
trigger1 = fvar(29) != 1
trigger1 = AnimElem = 24, >= 0
flag = noBG

[State 3000, 2002Max2Env]
type = Explod
triggerall = fvar(29) = 1 && !fvar(26)
trigger1 = AnimElem = 24
anim = 7700
ID = 7700
pos = 0,0
scale = 1.1,1.1
postype = left
bindtime = -1
removetime = -1
pausemovetime = 99999
sprpriority = -3
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State -2, 02umMax2Env]
type = Explod
triggerall = fvar(26)
trigger1 = Time = 31
anim = 7710
ID = 7710
postype = back
pos = 0,0
sprpriority = -3
bindtime = -1
removetime = -1
pausemovetime = 99999999
supermovetime = 99999999

[State -2, 02umMax2Env]
type = Explod
triggerall = fvar(26)
trigger1 = Time = 31
anim = 7711
ID = 7711
postype = back
pos = 0,0
sprpriority = -3
bindtime = -1
removetime = -1
pausemovetime = 99999999
supermovetime = 99999999

[State -2, 02umMax2Env]
type = Explod
triggerall = fvar(26)
trigger1 = Time = 31
anim = 7712
ID = 7712
postype = back
pos = 0,0
sprpriority = -3
bindtime = -1
removetime = -1
pausemovetime = 99999999
supermovetime = 99999999

[State -2, 02umMax2Env]
type = Explod
triggerall = fvar(26)
trigger1 = Time = 31
anim = 7713
ID = 7713
postype = back
pos = 0,0
sprpriority = -3
bindtime = -1
removetime = -1
pausemovetime = 99999999
supermovetime = 99999999

[State -2, 02umMax2Env]
type = Explod
triggerall = fvar(26)
trigger1 = Time = 31
anim = 7714
ID = 7714
postype = back
pos = 0,0
sprpriority = -3
bindtime = -1
removetime = -1
pausemovetime = 99999999
supermovetime = 99999999

[State -2, 02umMax2Env]
type = Explod
triggerall = fvar(26)
trigger1 = Time = 31
anim = 7715
ID = 7715
postype = back
pos = 0,0
sprpriority = -3
bindtime = -1
removetime = -1
pausemovetime = 99999999
supermovetime = 99999999

[State -2, 02umMax2Env]
type = Explod
triggerall = fvar(26)
trigger1 = Time = 31
anim = 7716
ID = 7716
postype = back
pos = 0,0
sprpriority = -3
bindtime = -1
removetime = -1
pausemovetime = 99999999
supermovetime = 99999999

[State -2, 02umMax2Env]
type = Explod
triggerall = fvar(26)
trigger1 = Time = 31
trigger1 = TeamSide = 1
anim = 7730
ID = 7730
postype = left
pos = 0,85
sprpriority = -2
bindtime = -1
removetime = -2
pausemovetime = 99999999
supermovetime = 99999999

[State -2, 02umMax2Env]
type = Explod
triggerall = fvar(26)
trigger1 = Time = 31
trigger1 = TeamSide = 1
anim = 7740
ID = 7740
postype = left
pos = 0,85
sprpriority = -1
bindtime = -1
removetime = -2
pausemovetime = 99999999
supermovetime = 99999999

[State -2, 02umMax2Env]
type = Explod
triggerall = fvar(26)
trigger1 = Time = 31
trigger1 = TeamSide = 2
anim = 7731
ID = 7731
postype = left
pos = 0,85
sprpriority = -2
bindtime = -1
removetime = -2
pausemovetime = 99999999
supermovetime = 99999999

[State -2, 02umMax2Env]
type = Explod
triggerall = fvar(26)
trigger1 = Time = 31
trigger1 = TeamSide = 2
anim = 7741
ID = 7741
postype = right
pos = 0,85
sprpriority = -1
bindtime = -1
removetime = -2
pausemovetime = 99999999
supermovetime = 99999999


[State 3000, varrandom];发射弹幕数量
type = varrandom
triggerall = fvar(26) != 1
trigger1 = !(fvar(29) = 3 || fvar(29) = 6)
trigger1 = time = 0
v = 33
range = IfElse(!(fvar(29)=1||fvar(29)=4),12,5),12

[State 3000, varrandom];发射弹幕数量
type = varset
triggerall = fvar(26) = 1
trigger1 = time = 0
var(33) = 14

[State 3000]
type = VarSet
trigger1 = fvar(29) = 3 || fvar(29) = 6
trigger1 = Time = 0
var(33) = 20

[State 3000, muteki]
type = HitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 3000, snd]
type = PlaySnd
triggerall = fvar(29) = [1,3]
trigger1 = Time = 0
value = S2,59+(fvar(26)=1)*(20+Random%2)
volume = 150

[State 3000, snd]
type = PlaySnd
triggerall = fvar(29) = [4,6]
trigger1 = AnimElem = 3
value = S2,24
volume = 150

[State 3000];カイザーウェイブ射出ヘルパー
type = Helper
triggerall = !NumHelper(3000)
trigger1 = AnimTime = 0
ID = 3000
name = "Phoenix"
helpertype = normal
stateno = 3030
pos = 0,0
postype = p1

[State 3000, change]
type = ChangeState
trigger1 = AnimTime = 0
value = 3010


[Statedef 3010];カイザーフェニックス1射目
type = S
physics = S
movetype = A
ctrl = 0
anim = 3001
velset = 0,0
sprpriority = 2

[State 3000]
type = AssertSpecial
trigger1 = fvar(29) != 1
flag = noBG

[State -2, nothitby]
type = NotHitBy
trigger1 = fvar(29) = 3 || fvar(29) = 6
value = SCA
time = 1

[State 3010, playsnd]
type = PlaySnd
triggerall = fvar(29) = [4,6]
trigger1 = Time = 0
value = S2,21
volume = 150

[State 3010, randomvar]
type = varadd
trigger1 = time = 0
var(33) = -1

[State 3010, varrandom]
type = varrandom
trigger1 = 1
v = 30
range = 0,IfElse((fvar(29)=3||fvar(29)=6),5,2)

[State 3010, posadd]
type = PosAdd
trigger1 = AnimElem = 2
x = 8

[State 3010, posadd]
type = PosAdd
trigger1 = AnimElem = 6
x = -8

[State 3010, change]
type = ChangeState
trigger1 = AnimTime = 0
value = 3020

[Statedef 3020];カイザーフェニックス2射目以降
type = S
physics = S
movetype = A
ctrl = 0
anim = 3002
velset = 0,0
sprpriority = 2
hitcountpersist = 1

[State 3000]
type = AssertSpecial
trigger1 = fvar(29) != 1
flag = noBG

[State -2, nothitby]
type = NotHitBy
trigger1 = fvar(29) = 3 || fvar(29) = 6
value = SCA
time = 1

[State 3010, playsnd]
type = PlaySnd
triggerall = fvar(29) = [4,6]
trigger1 = ProjContactTime(0) = [0,15]
trigger1 = Time = 0
value = S2,23
volume = 150
channel = 12

[State 3010, randomvar]
type = varadd
trigger1 = time = 0
var(33) = -1

[State 3010, varrandom]
type = varrandom
trigger1 = time = 0
trigger1 = var(33) >= 4 || fvar(26) != 1
v = 30
range = 0,IfElse((fvar(29)=3||fvar(29)=6),5,2)

[State 3010, ]
type = varset
trigger1 = var(33) < 4
trigger1 = fvar(26) = 1
var(30) = ifelse(var(30)=1,2,1)


[State 3010, posadd]
type = PosAdd
trigger1 = AnimElem = 5
x = 8

[State 3010, posadd]
type = PosAdd
trigger1 = AnimElem = 9
x = -8

[State 3000, muteki]
type = HitBy
trigger1 = AnimElem = 4, < 0
value = SCA,AT
time = 1

[State 3020,roop]
type = ChangeState
trigger1 = AnimTime = 0
trigger1 = var(33)
value = 3021

[State 3020]
type = RemoveExplod
trigger1 = AnimTime = -1
trigger1 = !var(33)
ID = 7700

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
trigger1 = !var(33)
value = 1

[State 3020, end]
type = ChangeState
trigger1 = AnimTime = 0
trigger1 = !var(33)
value = 0
ctrl = 1

[Statedef 3021];カイザーフェニックス2射目以降2
type = S
physics = S
movetype = A
ctrl = 0
anim = 3002
velset = 0,0
sprpriority = 2
hitcountpersist = 1

[State 3000]
type = AssertSpecial
trigger1 = fvar(29) != 1
flag = noBG

[State -2, nothitby]
type = NotHitBy
trigger1 = fvar(29) = 3 || fvar(29) = 6
value = SCA
time = 1

[State 3010, playsnd]
type = PlaySnd
triggerall = fvar(29) = [4,6]
trigger1 = ProjContactTime(0) = [0,15]
trigger1 = Time = 0
value = S2,23
volume = 150
channel = 12

[State 3010, randomvar]
type = varadd
trigger1 = time = 0
var(33) = -1

[State 3010, varrandom]
type = varrandom
trigger1 = time = 0
trigger1 = var(33) >= 4 || fvar(26) != 1
v = 30
range = 0,IfElse((fvar(29)=3||fvar(29)=6),5,2)

[State 3010, ]
type = varset
trigger1 = var(33) < 4
trigger1 = fvar(26) = 1
var(30) = ifelse(var(30)=1,2,1)


[State 3010, posadd]
type = PosAdd
trigger1 = AnimElem = 5
x = 8

[State 3010, posadd]
type = PosAdd
trigger1 = AnimElem = 9
x = -8

[State 3000, muteki]
type = HitBy
trigger1 = AnimElem = 4, < 0
value = SCA,AT
time = 1

[State 3020,roop]
type = ChangeState
trigger1 = AnimTime = 0
trigger1 = var(33)
value = 3020

[State 3020]
type = RemoveExplod
trigger1 = AnimTime = -1
trigger1 = !var(33)
ID = 7700

[State -2, 行動可能フラグ]
type = CtrlSet
triggerall = !Win
trigger1 = AnimTime = -1
trigger1 = !var(33)
value = 1

[State 3020, end]
type = ChangeState
trigger1 = AnimTime = 0
trigger1 = !var(33)
value = 0
ctrl = 1


[Statedef 3030]
physics = N
anim = 9999
ctrl = 0

[State 3030, bind]
type = BindToRoot
trigger1 = Root,StateNo = [3000,3100)
pos = 0,0
facing = 1

[State 3010]
type = PlaySnd
trigger1 = Root,StateNo = 3010
trigger1 = Root,AnimElem = 3
trigger2 = Root,StateNo = 3020
trigger2 = Root,AnimElem = 6
trigger3 = Root,StateNo = 3021
trigger3 = Root,AnimElem = 6
value = S3,6

[State 3010]
type = VarSet
trigger1 = 1
fvar(10) = Root,fvar(10)

[State 3010]
type = VarSet
trigger1 = 1
fvar(38) = Root,fvar(38)

[State 3010]
type = VarSet
trigger1 = 1
var(2) = Root,var(2)

[State 3010]
type = VarAdd
triggerall = !(Root,fvar(29) = 3 || Root,fvar(29) = 6)
triggerall = var(24) < 4
triggerall = EnemyNear(var(2)),MoveType = H
trigger1 = Root,ProjContactTime(3000) = 1
trigger2 = Root,ProjContactTime(3001) = 1
trigger3 = Root,ProjContactTime(3002) = 1
trigger4 = Root,ProjContactTime(3003) = 1
trigger5 = Root,ProjContactTime(3004) = 1
trigger6 = Root,ProjContactTime(3005) = 1
trigger7 = Root,ProjContactTime(3006) = 1
trigger8 = Root,ProjContactTime(3007) = 1
trigger9 = Root,ProjContactTime(3008) = 1
trigger10 = Root,ProjContactTime(3009) = 1
trigger11 = Root,ProjContactTime(3010) = 1
trigger12 = Root,ProjContactTime(3011) = 1
var(24) = 1

[State 3010];ダメージ決定
type = VarSet
triggerall = !Root,fvar(26)
trigger1 = Floor(IfElse(var(30)=1,26,23)*(0.5**var(24)))-1 >= 1
fvar(24) = Floor(IfElse(var(30)=1,26,23)*(0.5**var(24)))-1
ignorehitpause = 1

[State 3010];ダメージ決定
type = VarSet
triggerall = !Root,fvar(26)
trigger1 = Floor(IfElse(var(30)=1,26,23)*(0.5**var(24)))-1 < 1
fvar(24) = 1
ignorehitpause = 1

[State 3010];ダメージ決定
type = VarSet
triggerall = Root,fvar(26)
trigger1 = Floor(IfElse(var(30)=1,IfElse(!Root,fvar(28),18,24),IfElse(!Root,fvar(28),13,24))*(0.5**var(24)))-1 >= 2
fvar(24) = Floor(IfElse(var(30)=1,IfElse(!Root,fvar(28),18,24),IfElse(!Root,fvar(28),13,24))*(0.5**var(24)))-1
ignorehitpause = 1

[State 3010];ダメージ決定
type = VarSet
triggerall = Root,fvar(26)
trigger1 = Floor(IfElse(var(30)=1,IfElse(!Root,fvar(28),18,24),IfElse(!Root,fvar(28),13,24))*(0.5**var(24)))-1 < 2
fvar(24) = 2
ignorehitpause = 1


[State -2, カイザーウェイブ到達予測時間]
type = VarSet
trigger1 = 1
var(25) = Ceil((P2BodyDist X-(96-16-15+23))/16)-2
ignorehitpause = 1

[State -2, カイザーウェイブ到達時、敵高度予測]
type = VarSet
trigger1 = 1
fvar(25) = EnemyNear,Pos Y+EnemyNear,Vel Y*var(25)+(0.5*EnemyNear,Const(movement.yaccel)*var(25)*(var(25)-1))*(EnemyNear,Vel Y!=0)
ignorehitpause = 1 


[State 3010, カイザーウェイブ1段階目(2002)]
type = Projectile
triggerall = Root,fvar(29) = 1 && !Root,fvar(26)
triggerall = Root,StateNo = 3010
trigger1 = Root,AnimElem = 3
trigger1 = Root,var(30) = 0
attr = S,HP
ProjID = 3000
animtype = diagup
hitflag = MAF
guardflag = M
projpriority = 7
projanim = 8170+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8102
projremove = 1
offset = 96-16,0
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103),Ceil(2*(100-Random%11)*fvar(10)*fvar(38)/10/103)
projedgebound = 100
projstagebound = 100
pausetime = 0,3
guard.pausetime = 0,1
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
ground.velocity = -7,-9
guard.velocity = -10.35
air.velocity = -7,-9
yaccel = .5
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-60
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
getpower = 0,0
givepower = 15,15
air.juggle = 0

[State 3010, カイザーウェイブ2段階目(2002)]
type = Projectile
triggerall = Root,fvar(29) = 1 && !Root,fvar(26)
triggerall = Root,StateNo = 3010
trigger1 = Root,AnimElem = 3
trigger1 = Root,var(30) = 1
attr = S,HP
ProjID = 3001
animtype = back
hitflag = MAF
guardflag = M
projpriority = 7
projanim = 8171+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8105
projremove = 1
offset = 95-16,-71
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103),Ceil(2*(100-Random%11)*fvar(10)*fvar(38)/10/103)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 1020
getpower = 0,0
givepower = 15,15

[State 3010, カイザーウェイブ3段階目(2002)（停滞）]
type = Projectile
triggerall = Root,fvar(29) = 1 && !Root,fvar(26)
triggerall = Root,StateNo = 3010
trigger1 = Root,AnimElem = 3
trigger1 = Root,var(30) >= 2
attr = S,HP
ProjID = 3002
animtype = back
hitflag = MAF
guardflag = -1
projpriority = 7
projanim = 8172+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8108
projremanim = -1
projremove = 1
projremovetime = 22
offset = 95,-71
postype = p1
velocity = 0,0
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103),Ceil(2*(100-Random%11)*fvar(10)*fvar(38)/10/103)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 1020
getpower = 0,0
givepower = 15,15

[State 3010, カイザーウェイブ3段階目(2002)(射出)]
type = Projectile
triggerall = Root,fvar(29) = 1 && !Root,fvar(26)
trigger1 = var(29) = 22
attr = S,HP
ProjID = 3003
animtype = back
hitflag = MAF
guardflag = -1
projpriority = 7
projanim = 8173+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8108
projremove = 1
offset = 95,-71
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103),Ceil(2*(100-Random%11)*fvar(10)*fvar(38)/10/103)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 1020
getpower = 0,0
givepower = 15,15


[State 3010, カイザーウェイブ1段階目]
type = Projectile
triggerall = Root,fvar(29) != 1
triggerall = Root,StateNo = 3010
trigger1 = Root,AnimElem = 3
trigger1 = Root,var(30) = 0
attr = S,HP
ProjID = 3000
animtype = diagup
hitflag = MAFD
guardflag = M
projpriority = 7
projanim = 8170+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8102
projremove = 1
offset = 96-16,0
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103),Ceil(2*(100-Random%11)*fvar(10)*fvar(38)/10/103)
projedgebound = 100
projstagebound = 100
pausetime = 0,3
guard.pausetime = 0,1
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
ground.velocity = -7,-9
guard.velocity = -10.35
air.velocity = -7,-9
yaccel = .5
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-60
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recove = 0
p2stateno = 3050
getpower = 0,0
givepower = 15,15
air.juggle = 0

[State 3010, カイザーウェイブ2段階目]
type = Projectile
triggerall = Root,fvar(29) != 1
triggerall = Root,StateNo = 3010
trigger1 = Root,AnimElem = 3
trigger1 = Root,var(30) = 1
attr = S,HP
ProjID = 3001
animtype = back
hitflag = MAFD
guardflag = M
projpriority = 7
projanim = 8171+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8105
projremove = 1
offset = 95-16,-71
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103),Ceil(2*(100-Random%11)*fvar(10)*fvar(38)/10/103)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 3055
getpower = 0,0
givepower = 15,15

[State 3010, カイザーウェイブ3段階目（停滞）]
type = Projectile
triggerall = Root,fvar(29) != 1
triggerall = Root,StateNo = 3010
trigger1 = Root,AnimElem = 3
trigger1 = Root,var(30) >= 2
attr = S,HP
ProjID = 3002
animtype = back
hitflag = MAFD
guardflag = -1
projpriority = 7
projanim = 8172+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8108
projremanim = -1
projremove = 1
projremovetime = 22
offset = 95,-71
postype = p1
velocity = 0,0
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103),Ceil(2*(100-Random%11)*fvar(10)*fvar(38)/10/103)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 3055
getpower = 0,0
givepower = 15,15

[State 3010, カイザーウェイブ3段階目(射出)]
type = Projectile
triggerall = Root,fvar(29) != 1
trigger1 = var(29) = 22
attr = S,HP
ProjID = 3003
animtype = back
hitflag = MAFD
guardflag = -1
projpriority = 7
projanim = 8173+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8108
projremove = 1
offset = 95,-71
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103),Ceil(2*(100-Random%11)*fvar(10)*fvar(38)/10/103)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 3055
getpower = 0,0
givepower = 15,15



[State 3010, カイザーウェイブ1段階目(02UM)]
type = Projectile
triggerall = Root,fvar(26)
triggerall = Root,StateNo = 3010
trigger1 = Root,AnimElem = 3
trigger1 = Root,var(30) = 0
attr = S,HP
ProjID = 3000
animtype = diagup
hitflag = MAFD
guardflag = M
projpriority = 7
projanim = 8170+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8102
projremove = 1
offset = 96-16,0
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*fvar(10)*fvar(38)*10/120),Ceil(2*fvar(10)*fvar(38)*10/120)
projedgebound = 100
projstagebound = 100
pausetime = 0,3
guard.pausetime = 0,1
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
ground.velocity = -7,-9
guard.velocity = -10.35
air.velocity = -7,-9
yaccel = .5
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-60
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recove = 0
p2stateno = 3050
getpower = 0,0
givepower = 15,15
air.juggle = 0

[State 3010, カイザーウェイブ2段階目(02UM)]
type = Projectile
triggerall = Root,fvar(26)
triggerall = Root,StateNo = 3010
trigger1 = Root,AnimElem = 3
trigger1 = Root,var(30) = 1
attr = S,HP
ProjID = 3001
animtype = back
hitflag = MAFD
guardflag = M
projpriority = 7
projanim = 8171+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8105
projremove = 1
offset = 95-16,-71
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*fvar(10)*fvar(38)*10/120),Ceil(2*fvar(10)*fvar(38)*10/120)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 3055
getpower = 0,0
givepower = 15,15

[State 3010, カイザーウェイブ3段階目(02UM)（停滞）]
type = Projectile
triggerall = Root,fvar(26)
triggerall = Root,StateNo = 3010
trigger1 = Root,AnimElem = 3
trigger1 = Root,var(30) >= 2
attr = S,HP
ProjID = 3002
animtype = back
hitflag = MAFD
guardflag = -1
projpriority = 7
projanim = 8172+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8108
projremanim = -1
projremove = 1
projremovetime = 22
offset = 95,-71
postype = p1
velocity = 0,0
damage = Ceil(fvar(24)*fvar(10)*fvar(38)*10/120),Ceil(2*fvar(10)*fvar(38)*10/120)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 3055
getpower = 0,0
givepower = 15,15

[State 3010, カイザーウェイブ3段階目(02UM)(射出)]
type = Projectile
triggerall = Root,fvar(26)
trigger1 = var(29) = 22
attr = S,HP
ProjID = 3003
animtype = back
hitflag = MAFD
guardflag = -1
projpriority = 7
projanim = 8173+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8108
projremove = 1
offset = 95,-71
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*fvar(10)*fvar(38)*10/120),Ceil(2*fvar(10)*fvar(38)*10/120)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 3055
getpower = 0,0
givepower = 15,15



[State 3021, タイマー]
type = VarSet
triggerall = !var(29)
triggerall = !Root,NumProjID(3003)
trigger1 = Root,NumProjID(3002)
var(29) = 1

[State 3021, タイマー]
type = VarAdd
triggerall = var(29)
triggerall = !Root,NumProjID(3003)
trigger1 = Root,NumProjID(3002)
var(29) = 1

[State 3021, タイマー]
type = VarSet
trigger1 = var(29) > 25
trigger2 = Root,ProjContactTime(3002) = [0,1]
trigger3 = Root,NumProjID(3003)
trigger4 = !(Root,NumProjID(3002) || Root,NumProjID(3003))
var(29) = 0


[State 3020, カイザーウェイブ1段階目(2002)]
type = Projectile
triggerall = Root,fvar(29) = 1 && !Root,fvar(26)
triggerall = Root,StateNo = 3020
trigger1 = Root,AnimElem = 6
trigger1 = Root,var(30) = 0
attr = S,HP
ProjID = 3004
animtype = diagup
hitflag = MAF
guardflag = M
projpriority = 7
projanim = 8170+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8102
projremove = 1
offset = 96-16,0
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103),Ceil(2*(100-Random%11)*fvar(10)*fvar(38)/10/103)
projedgebound = 100
projstagebound = 100
pausetime = 0,3
guard.pausetime = 0,1
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
ground.velocity = -7,-9
guard.velocity = -10.35
air.velocity = -7,-9
yaccel = .5
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-60
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recovertime = 36+3+Ceil((-fvar(25))/10)
getpower = 0,0
givepower = 15,15
air.juggle = 0

[State 3020, カイザーウェイブ2段階目(2002)]
type = Projectile
triggerall = Root,fvar(29) = 1 && !Root,fvar(26)
triggerall = Root,StateNo = 3020
trigger1 = Root,AnimElem = 6
trigger1 = Root,var(30) = 1
attr = S,HP
ProjID = 3005
animtype = back
hitflag = MAF
guardflag = M
projpriority = 7
projanim = 8171+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8105
projremove = 1
offset = 95-16,-71
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103),Ceil(2*(100-Random%11)*fvar(10)*fvar(38)/10/103)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 1020
getpower = 0,0
givepower = 15,15

[State 3020, カイザーウェイブ3段階目(2002)(停滞)]
type = Projectile
triggerall = Root,fvar(29) = 1 && !Root,fvar(26)
triggerall = Root,StateNo = 3020
trigger1 = Root,AnimElem = 6
trigger1 = Root,var(30) >= 2
attr = S,HP
ProjID = 3006
animtype = back
hitflag = MAF
guardflag = -1
projpriority = 7
projanim = 8172+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8108
projremanim = -1
projremove = 1
projremovetime = 22
offset = 95,-71
postype = p1
velocity = 0,0
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103),Ceil(2*(100-Random%11)*fvar(10)*fvar(38)/10/103)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 1020
getpower = 0,0
givepower = 15,15

[State 3020, カイザーウェイブ3段階目(2002)(射出)]
type = Projectile
triggerall = Root,fvar(29) = 1 && !Root,fvar(26)
trigger1 = var(30) = 22
attr = S,HP
ProjID = 3007
animtype = back
hitflag = MAF
guardflag = -1
projpriority = 7
projanim = 8173+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8108
projremove = 1
offset = 95,-71
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103),Ceil(2*(100-Random%11)*fvar(10)*fvar(38)/10/103)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 1020
getpower = 0,0
givepower = 15,15


[State 3020, カイザーウェイブ1段階目]
type = Projectile
triggerall = Root,fvar(29) != 1
triggerall = Root,StateNo = 3020
trigger1 = Root,AnimElem = 6
trigger1 = Root,var(30) = 0
attr = S,HP
ProjID = 3004
animtype = diagup
hitflag = MAFD
guardflag = M
projpriority = 7
projanim = 8170+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8102
projremove = 1
offset = 96-16,0
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103),Ceil(2*(100-Random%11)*fvar(10)*fvar(38)/10/103)
projedgebound = 100
projstagebound = 100
pausetime = 0,3
guard.pausetime = 0,1
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
ground.velocity = -7,-9
guard.velocity = -10.35
air.velocity = -7,-9
yaccel = .5
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-60
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 3050
getpower = 0,0
givepower = 15,15
air.juggle = 0

[State 3020, カイザーウェイブ2段階目]
type = Projectile
triggerall = Root,fvar(29) != 1
triggerall = Root,StateNo = 3020
trigger1 = Root,AnimElem = 6
trigger1 = Root,var(30) = 1
attr = S,HP
ProjID = 3005
animtype = back
hitflag = MAFD
guardflag = M
projpriority = 7
projanim = 8171+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8105
projremove = 1
offset = 95-16,-71
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103),Ceil(2*(100-Random%11)*fvar(10)*fvar(38)/10/103)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 3055
getpower = 0,0
givepower = 15,15

[State 3020, カイザーウェイブ3段階目(停滞)]
type = Projectile
triggerall = Root,fvar(29) != 1
triggerall = Root,StateNo = 3020
trigger1 = Root,AnimElem = 6
trigger1 = Root,var(30) >= 2
attr = S,HP
ProjID = 3006
animtype = back
hitflag = MAFD
guardflag = -1
projpriority = 7
projanim = 8172+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8108
projremanim = -1
projremove = 1
projremovetime = 22
offset = 95,-71
postype = p1
velocity = 0,0
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103),Ceil(2*(100-Random%11)*fvar(10)*fvar(38)/10/103)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 3055
getpower = 0,0
givepower = 15,15

[State 3020, カイザーウェイブ3段階目(射出)]
type = Projectile
triggerall = Root,fvar(29) != 1
trigger1 = var(30) = 22
attr = S,HP
ProjID = 3007
animtype = back
hitflag = MAFD
guardflag = -1
projpriority = 7
projanim = 8173+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8108
projremove = 1
offset = 95,-71
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103),Ceil(2*(100-Random%11)*fvar(10)*fvar(38)/10/103)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 3055
getpower = 0,0
givepower = 15,15



[State 3020, カイザーウェイブ1段階目(02UM)]
type = Projectile
triggerall = Root,fvar(26)
triggerall = Root,StateNo = 3020
trigger1 = Root,AnimElem = 6
trigger1 = Root,var(30) = 0
attr = S,HP
ProjID = 3004
animtype = diagup
hitflag = MAFD
guardflag = M
projpriority = 7
projanim = 8170+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8102
projremove = 1
offset = 96-16,0
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*fvar(10)*fvar(38)*10/120),Ceil(2*fvar(10)*fvar(38)*10/120)
projedgebound = 100
projstagebound = 100
pausetime = 0,3
guard.pausetime = 0,1
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
ground.velocity = -7,-9
guard.velocity = -10.35
air.velocity = -7,-9
yaccel = .5
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-60
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 3050
getpower = 0,0
givepower = 15,15
air.juggle = 0

[State 3020, カイザーウェイブ2段階目(02UM)]
type = Projectile
triggerall = Root,fvar(26)
triggerall = Root,StateNo = 3020
trigger1 = Root,AnimElem = 6
trigger1 = Root,var(30) = 1
attr = S,HP
ProjID = 3005
animtype = back
hitflag = MAFD
guardflag = M
projpriority = 7
projanim = 8171+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8105
projremove = 1
offset = 95-16,-71
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*fvar(10)*fvar(38)*10/120),Ceil(2*fvar(10)*fvar(38)*10/120)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 3055
getpower = 0,0
givepower = 15,15

[State 3020, カイザーウェイブ3段階目(02UM)(停滞)]
type = Projectile
triggerall = Root,fvar(26)
triggerall = Root,StateNo = 3020
trigger1 = Root,AnimElem = 6
trigger1 = Root,var(30) >= 2
attr = S,HP
ProjID = 3006
animtype = back
hitflag = MAFD
guardflag = -1
projpriority = 7
projanim = 8172+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8108
projremanim = -1
projremove = 1
projremovetime = 22
offset = 95,-71
postype = p1
velocity = 0,0
damage = Ceil(fvar(24)*fvar(10)*fvar(38)*10/120),Ceil(2*fvar(10)*fvar(38)*10/120)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 3055
getpower = 0,0
givepower = 15,15

[State 3020, カイザーウェイブ3段階目(02UM)(射出)]
type = Projectile
triggerall = Root,fvar(26)
trigger1 = var(30) = 22
attr = S,HP
ProjID = 3007
animtype = back
hitflag = MAFD
guardflag = -1
projpriority = 7
projanim = 8173+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8108
projremove = 1
offset = 95,-71
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*fvar(10)*fvar(38)*10/120),Ceil(2*fvar(10)*fvar(38)*10/120)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 3055
getpower = 0,0
givepower = 15,15


[State 3021, タイマー]
type = VarSet
triggerall = !var(30)
triggerall = !Root,NumProjID(3007)
trigger1 = Root,NumProjID(3006)
var(30) = 1

[State 3021, タイマー]
type = VarAdd
triggerall = var(30)
triggerall = !Root,NumProjID(3007)
trigger1 = Root,NumProjID(3006)
var(30) = 1

[State 3021, タイマー]
type = VarSet
trigger1 = var(30) > 25
trigger2 = Root,ProjContactTime(3006) = [0,1]
trigger3 = Root,NumProjID(3007)
trigger4 = !(Root,NumProjID(3006) || Root,NumProjID(3007))
var(30) = 0

[State 3021, カイザーウェイブ1段階目(2002)]
type = Projectile
triggerall = Root,fvar(29) = 1 && !Root,fvar(26)
triggerall = Root,StateNo = 3021
trigger1 = Root,AnimElem = 6
trigger1 = Root,var(30) = 0
attr = S,HP
ProjID = 3008
animtype = diagup
hitflag = MAF
guardflag = M
projpriority = 7
projanim = 8170+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8102
projremove = 1
offset = 96-16,0
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103),Ceil(2*(100-Random%11)*fvar(10)*fvar(38)/10/103)
projedgebound = 100
projstagebound = 100
pausetime = 0,3
guard.pausetime = 0,1
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
ground.velocity = -7,-9
guard.velocity = -10.35
air.velocity = -7,-9
yaccel = .5
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-60
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recovertime = 36+3+Ceil((-fvar(25))/10)
getpower = 0,0
givepower = 15,15
air.juggle = 0

[State 3021, カイザーウェイブ2段階目(2002)]
type = Projectile
triggerall = Root,fvar(29) = 1 && !Root,fvar(26)
triggerall = Root,StateNo = 3021
trigger1 = Root,AnimElem = 6
trigger1 = Root,var(30) = 1
attr = S,HP
ProjID = 3009
animtype = back
hitflag = MAF
guardflag = M
projpriority = 7
projanim = 8171+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8105
projremove = 1
offset = 95-16,-71
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103),Ceil(2*(100-Random%11)*fvar(10)*fvar(38)/10/103)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 1020
getpower = 0,0
givepower = 15,15

[State 3021, カイザーウェイブ3段階目(2002)(停滞)]
type = Projectile
triggerall = Root,fvar(29) = 1 && !Root,fvar(26)
triggerall = Root,StateNo = 3021
trigger1 = Root,AnimElem = 6
trigger1 = Root,var(30) >= 2
attr = S,HP
ProjID = 3010
animtype = back
hitflag = MAF
guardflag = -1
projpriority = 7
projanim = 8172+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8108
projremanim = -1
projremove = 1
projremovetime = 22
offset = 95,-71
postype = p1
velocity = 0,0
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103),Ceil(2*(100-Random%11)*fvar(10)*fvar(38)/10/103)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 1020
getpower = 0,0
givepower = 15,15

[State 3021, カイザーウェイブ3段階目(2002)(射出)]
type = Projectile
triggerall = Root,fvar(29) = 1 && !Root,fvar(26)
trigger1 = var(31) = 22
attr = S,HP
ProjID = 3011
animtype = back
hitflag = MAF
guardflag = -1
projpriority = 7
projanim = 8173+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8108
projremove = 1
offset = 95,-71
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103),Ceil(2*(100-Random%11)*fvar(10)*fvar(38)/10/103)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 1020
getpower = 0,0
givepower = 15,15


[State 3021, カイザーウェイブ1段階目]
type = Projectile
triggerall = Root,fvar(29) != 1
triggerall = Root,StateNo = 3021
trigger1 = Root,AnimElem = 6
trigger1 = Root,var(30) = 0
attr = S,HP
ProjID = 3008
animtype = diagup
hitflag = MAFD
guardflag = M
projpriority = 7
projanim = 8170+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8102
projremove = 1
offset = 96-16,0
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103),Ceil(2*(100-Random%11)*fvar(10)*fvar(38)/10/103)
projedgebound = 100
projstagebound = 100
pausetime = 0,3
guard.pausetime = 0,1
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
ground.velocity = -7,-9
guard.velocity = -10.35
air.velocity = -7,-9
yaccel = .5
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-60
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 3050
getpower = 0,0
givepower = 15,15
air.juggle = 0

[State 3021, カイザーウェイブ2段階目]
type = Projectile
triggerall = Root,fvar(29) != 1
triggerall = Root,StateNo = 3021
trigger1 = Root,AnimElem = 6
trigger1 = Root,var(30) = 1
attr = S,HP
ProjID = 3009
animtype = back
hitflag = MAFD
guardflag = M
projpriority = 7
projanim = 8171+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8105
projremove = 1
offset = 95-16,-71
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103),Ceil(2*(100-Random%11)*fvar(10)*fvar(38)/10/103)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 3055
getpower = 0,0
givepower = 15,15

[State 3021, カイザーウェイブ3段階目(停滞)]
type = Projectile
triggerall = Root,fvar(29) != 1
triggerall = Root,StateNo = 3021
trigger1 = Root,AnimElem = 6
trigger1 = Root,var(30) >= 2
attr = S,HP
ProjID = 3010
animtype = back
hitflag = MAFD
guardflag = -1
projpriority = 7
projanim = 8172+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8108
projremanim = -1
projremove = 1
projremovetime = 22
offset = 95,-71
postype = p1
velocity = 0,0
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103),Ceil(2*(100-Random%11)*fvar(10)*fvar(38)/10/103)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 3055
getpower = 0,0
givepower = 15,15

[State 3021, カイザーウェイブ3段階目(射出)]
type = Projectile
triggerall = Root,fvar(29) != 1
trigger1 = var(31) = 22
attr = S,HP
ProjID = 3011
animtype = back
hitflag = MAFD
guardflag = -1
projpriority = 7
projanim = 8173+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8108
projremove = 1
offset = 95,-71
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*(100-Random%11)*fvar(10)*fvar(38)/10/103),Ceil(2*(100-Random%11)*fvar(10)*fvar(38)/10/103)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 3055
getpower = 0,0
givepower = 15,15


[State 3021, カイザーウェイブ1段階目(02UM)]
type = Projectile
triggerall = Root,fvar(26)
triggerall = Root,StateNo = 3021
trigger1 = Root,AnimElem = 6
trigger1 = Root,var(30) = 0
attr = S,HP
ProjID = 3008
animtype = diagup
hitflag = MAFD
guardflag = M
projpriority = 7
projanim = 8170+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8102
projremove = 1
offset = 96-16,0
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*fvar(10)*fvar(38)*10/120),Ceil(2*fvar(10)*fvar(38)*10/120)
projedgebound = 100
projstagebound = 100
pausetime = 0,3
guard.pausetime = 0,1
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
ground.velocity = -7,-9
guard.velocity = -10.35
air.velocity = -7,-9
yaccel = .5
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-60
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 3050
getpower = 0,0
givepower = 15,15
air.juggle = 0

[State 3021, カイザーウェイブ2段階目(02UM)]
type = Projectile
triggerall = Root,fvar(26)
triggerall = Root,StateNo = 3021
trigger1 = Root,AnimElem = 6
trigger1 = Root,var(30) = 1
attr = S,HP
ProjID = 3009
animtype = back
hitflag = MAFD
guardflag = M
projpriority = 7
projanim = 8171+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8105
projremove = 1
offset = 95-16,-71
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*fvar(10)*fvar(38)*10/120),Ceil(2*fvar(10)*fvar(38)*10/120)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 3055
getpower = 0,0
givepower = 15,15

[State 3021, カイザーウェイブ3段階目(02UM)(停滞)]
type = Projectile
triggerall = Root,fvar(26)
triggerall = Root,StateNo = 3021
trigger1 = Root,AnimElem = 6
trigger1 = Root,var(30) >= 2
attr = S,HP
ProjID = 3010
animtype = back
hitflag = MAFD
guardflag = -1
projpriority = 7
projanim = 8172+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8108
projremanim = -1
projremove = 1
projremovetime = 22
offset = 95,-71
postype = p1
velocity = 0,0
damage = Ceil(fvar(24)*fvar(10)*fvar(38)*10/120),Ceil(2*fvar(10)*fvar(38)*10/120)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 3055
getpower = 0,0
givepower = 15,15

[State 3021, カイザーウェイブ3段階目(02UM)(射出)]
type = Projectile
triggerall = Root,fvar(26)
trigger1 = var(31) = 22
attr = S,HP
ProjID = 3011
animtype = back
hitflag = MAFD
guardflag = -1
projpriority = 7
projanim = 8173+(Root,fvar(29)=1&&!Root,fvar(26))*4
projhitanim = 8108
projremove = 1
offset = 95,-71
postype = p1
velocity = 16,0
damage = Ceil(fvar(24)*fvar(10)*fvar(38)*10/120),Ceil(2*fvar(10)*fvar(38)*10/120)
projedgebound = 100
projstagebound = 100
pausetime = 0,12
guard.pausetime = 0,10
ground.hittime = 17
guard.slidetime = 17
guard.ctrltime = 17
guard.velocity = -10.35
ground.velocity = -2.2,-14.8
air.velocity = -2.2,-14.8
yaccel = .64
air.hittime = 60
sparkno = S7255
guard.sparkno = S7262
sparkxy = 5,-20
hitsound = S5,9
guardsound = S6,1
fall = 1
fall.recover = 0
p2stateno = 3055
getpower = 0,0
givepower = 15,15


[State 3021, タイマー]
type = VarSet
triggerall = !var(31)
triggerall = !Root,NumProjID(3011)
trigger1 = Root,NumProjID(3010)
var(31) = 1

[State 3021, タイマー]
type = VarAdd
triggerall = var(31)
triggerall = !Root,NumProjID(3011)
trigger1 = Root,NumProjID(3010)
var(31) = 1

[State 3021, タイマー]
type = VarSet
trigger1 = var(31) > 25
trigger2 = Root,ProjContactTime(3010) = [0,1]
trigger3 = Root,NumProjID(3011)
trigger4 = !(Root,NumProjID(3010) || Root,NumProjID(3011))
var(31) = 0


[State -2, Max2Env]
type = Explod
triggerall = Root,fvar(26)
trigger1 = Root,MoveType = H
trigger2 = !(Root,StateNo = [3000,3100))
anim = 7725
id = 7725
postype = left
pos = 0,0
bindtime = -1
removetime = -2
sprpriority = -3
supermovetime = 99999999
pausemovetime = 99999999
persistent = 0

[State -2]
type = PlaySnd
triggerall = Root,fvar(26)
trigger1 = Root,MoveType = H
trigger2 = !(Root,StateNo = [3000,3100))
value = S8,22
abspan = 0
persistent = 0

[State 3030]
type = DestroySelf
triggerall = !(Root,NumProjID(3002) || Root,NumProjID(3006) || Root,NumProjID(3010))
trigger1 = Root,MoveType = H
trigger2 = !(Root,StateNo = [3000,3100))



[Statedef 3050];カイザーフェニックスAヒット
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
value = 5050

[State 1020]
type = SelfState
trigger1 = GetHitVar(guarded) = 1
value = 150

[State 1020]
type = StateTypeSet
trigger1 = GetHitVar(fall) = 1
statetype = A

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

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

[State 1020, end]
type = ChangeState
trigger1 = HitShakeOver
value = 3051

[Statedef 3051]
type = A
physics = N
movetype = H
ctrl = 0

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
value = 5050

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 5030, 1]
type = VelAdd;Gravity
trigger1 = 1
y = GetHitVar(yaccel)

[State 5030, 2]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 5030, 4]
type = ChangeState
trigger1 = HitOver
trigger2 = Vel Y > 0    ;Hit ground
trigger2 = Pos Y >= 10  ;.
value = 3053 ;HITA_FALL

[State 5030, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 3052 ;HITA_UP (transition)

[Statedef 3052]
type    = A
movetype= H
physics = N

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

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

[State 5035, 4]
type = ChangeState
trigger1 = HitOver  ;Hit is over
trigger2 = AnimTime = 0 ;Anim is over
trigger3 = Vel Y > 0    ;Hit ground
trigger3 = Pos Y >= 10  ;.
trigger4 = Time = 0     ;No transition anim
trigger4 = Anim != 5035 ;.
value = 3053 ;HITA_FALL

[Statedef 3053]
type    = A
movetype= H
physics = N

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

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
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= ifelse((anim = [5051,5059]) || (anim = [5061,5069]), 0, 25)
value = 3060 ;HIT_BOUNCE


[Statedef 3055];カイザーフェニックスB,Cヒット
type = S
physics = N
movetype = H
ctrl = 0
velset = 0,0

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
value = 5050

[State 1020]
type = SelfState
trigger1 = GetHitVar(guarded) = 1
value = 150

[State 1020]
type = StateTypeSet
trigger1 = GetHitVar(fall) = 1
statetype = A

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 1020, anim]
type = ChangeAnim2
trigger1 = time = 0
value = 1021

[State 1020, freeze]
type = ChangeAnim2
trigger1 = time > 0
value = anim

[State 1020, end]
type = ChangeState
trigger1 = HitShakeOver
value = 3056

[Statedef 3056]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
value = 5050

[State -2]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 1020, anim]
type = ChangeAnim2
trigger1 = time = 0
value = 1021

[State 1020, vel];47F.-177
type = velset
triggerall = Time = 0
trigger1 = NumEnemy = 1
trigger1 = Enemy(0),Name = "Rugal2nd"
trigger2 = NumEnemy > 1
trigger2 = !(Enemy(1),Name = "Rugal2nd")
trigger3 = NumEnemy > 1
trigger3 = Enemy(0),Name = "Rugal2nd" && Enemy(1),Name = "Rugal2nd"
trigger3 = Floor(abs(Enemy(0),Pos X) - Pos X) <= Floor(abs(Enemy(1),Pos X) - Pos X)
x = 2.2*Facing*(Enemy(0),var(32))
y = -14.8

[State 1020, vel]
type = velset
triggerall = Time = 0
triggerall = NumEnemy > 1
trigger1 = Enemy(1),Name = "Rugal2nd"
trigger2 = Enemy(0),Name = "Rugal2nd" && Enemy(1),Name = "Rugal2nd"
trigger2 = Floor(abs(Enemy(0),Pos X) - Pos X) <= Floor(abs(Enemy(1),Pos X) - Pos X)
x = 2.2*Facing*(Enemy(1),var(32))
y = -14.8

[State 1020, gravity]
type = VelAdd
Trigger1 = time > 0
y = .64

[State 1020, end]
type = ChangeState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 3060

;---------------------------------------------------------------------------
; HIT_BOUNCE (hit ground)
[Statedef 3060]
type    = L
movetype= H
physics = N
ctrl = 0

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
value = 3070 ;HIT_LIEDOWN

[State 5100, 8]
type = GameMakeAnim
trigger1 = Time = 1
value = 60 + (sysvar(1) > 5) + (sysvar(1) > 14)
pos = 0, 0
under = sysvar(1) <= 14

[State 5100, 9]
type = HitFallDamage
trigger1 = Time = 3

[State 5100, 10]
type = PlaySnd
trigger1 = Time = 1
value = F7, (sysvar(1) > 5) + (sysvar(1) > 14)

[State 5100, 11]
type = PosFreeze
trigger1 = 1

[State 5100, 12]
type = ChangeState
trigger1 = AnimTime = 0
value = 3061

;---------------------------------------------------------------------------
; HIT_BOUNCE (bounce into air)
[Statedef 3061]
type    = L
movetype= H
physics = N
ctrl = 0

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
y = 20

[State 5101, 5] ;Acceleration
type = VelAdd
trigger1 = 1
y = .6

[State 5101, 6] ;Hit ground
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 12
type = ChangeState
value = 3070

;---------------------------------------------------------------------------
; HIT_LIEDOWN
[Statedef 3070]
type    = L
movetype= H
physics = N
ctrl = 0

[State 5110, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 5110, 1] ;For hit up/up-diag type (from state 5081)
type = ChangeAnim
persistent = 0
trigger1 = SelfAnimExist(5110 + (anim % 10))
trigger1 = anim = [5081,5089]
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

[State 5110, 6]
type = PlaySnd
trigger1 = Time = 0
trigger1 = !SysVar(0)
value = F7, (sysvar(1) > 5) + (sysvar(1) > 14)

[State 5110, 7]
type = GameMakeAnim
trigger1 = Time = 0
trigger1 = !SysVar(0)
value = 60 + (sysvar(1) > 5) + (sysvar(1) > 14)
pos = 0, 0
under = sysvar(1) <= 14

[State 5110, 8]
type = VelSet
trigger1 = Time = 0
y = 0

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
type = SelfState
trigger1 = Time > Const(data.liedown.time)
value = 5120

[State 5110, 11] ;If just died
type = SelfState
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

[State 5110, 13] ;Friction
type = VelMul
trigger1 = 1
x = 0.85

;===========================================================================
; 破防状态
;===========================================================================
[Statedef 5700]
type     = S
movetype = H
physics  = N
sprpriority = -1
facep2 = 1

[State 5700, ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 5700

[State 5700, PosSet]
type = PosSet
trigger1 = Time = 0
y = 0

[State 5700, VelSet]
type = VelSet
trigger1 = time = 0
x = -10

[State 5700, VelMul]
type = VelMul
trigger1 = 1
x = .85

[State 5700, SelfState]
type = SelfState
trigger1 = time >= 40
value = 0
ctrl = 1

