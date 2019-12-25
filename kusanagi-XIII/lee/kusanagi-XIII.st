; CNSフ?イルはカンフ??ンの定数（基?デ??）と
; 状態（各動作）を記述するものです。
; キャラク??の心臓とも言える部分なのでとても重要です。
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;基?デ??部分
[Data]
life              = 1000    ;体力ゲ?ジの最大値を決めます
power             = 5000    ;パワ?ゲ?ジ最大値（デフォルトは 3000 = Lv.3 になります・オプション）
attack            = 100     ;攻撃力パ?センテ?ジ（デフォルトは 100% になります）
defence           = 100     ;防御力パ?センテ?ジ（デフォルトは 100% になります）
fall.defence_up   = 50     ;一時的に上昇する?ウン時の防御力パ?センテ?ジ
liedown.time      = 20      ;?れてから起き上がるまでの時間
airjuggle         = 30      ;ジャグル?イント限界値?★１
sparkno           = S-1       ;デフォルトのヒットスパ?ク番号（fightfx.airか、キャラのairから呼び出す）
guard.sparkno     = S-1      ;デフォルトのガ?ドスパ?ク番号（fightfx.airか、キャラのairから呼び出す）
KO.echo           = 0       ;ＫＯ時の声にエコ?を?けるかどうか（0=しない・1=する）
volumescale       = 255      ;キャラの音量?255が最高
intpersistindex   = 20      ;Varを次のラウンドへ持ち越しが可? (最小=0, 最大=59)  ★２
floatpersistindex = 40      ;FVarを次のラウンドへ持ち越しが可? (最小=0, 最大=39) ★２

;---------------------------------------------------------------------------
;サイズ設定
[Size]
xscale           = 1.01        ;キャラ画像の横のスケ?ル
yscale           = 1.01        ;キャラ画像の縦のスケ?ル
ground.back      = 15       ;キャラの幅（地上後方）
ground.front     = 16       ;キャラの幅（地上前方）
air.back         = 12       ;キャラの幅（空中後方）
air.front        = 12       ;キャラの幅（空中前方）
height           = 60       ;跳び越す相手のためのキャラの高さ
attack.dist      = 160      ;攻撃を出した時に相手がガ?ド体勢に入る最低の距離
proj.attack.dist = 90       ;相手がガ?ド体勢に入る発射物との最低の距離
proj.doscale     = 0        ;xscaleとyscaleが発射物のスケ?ルにも影響するかどうか（0=しない・1=する）
head.pos         = 0, -90  ;BindToTargetの時に必要な頭の座標
mid.pos          = 0, -60  ;BindToTargetの時に必要な体中心の座標
shadowoffset     = 0        ;影の垂直方向の位置
draw.offset      = 0,0      ;キャラ?画?示位置（Ｘ軸,Ｙ軸）

;---------------------------------------------------------------------------
[Velocity]
walk.fwd  		= 2.8     
walk.back    	= -2.8  
run.fwd      	= 7.0, 0       
run.back     	= -12,-4      
jump.neu     	= 0,-10.3      
jump.fwd     	= 3.5       
jump.back    	= -3.5
;---------------------------------------------------------------------------
[Movement]
airjump.num = 0
airjump.height = 35
yaccel = 0.6171875
stand.friction = .85
crouch.friction = .82
;---------------------------------------------------------------------------
; 基?行動のステ?ト
;---------------------------------------------------------------------------
[Statedef 170]
type = S
ctrl = 0     ;ここでCtrlSetを簡略化できます。?1=自由に動かせる
anim = 170
velset = 0,0 ;ここでVelSetを簡略化できます。?x方向,y方向 の順

[State 170, 無敵]
type = NotHitBy
trigger1 = 1 ;1にするといかなる条件でも有効で、0にするといかなる条件でも無効
value = SCA  ;※
time = 1

;---------------------------------------------------------------------------
; 勝利??ズ分岐
; CNS レベル: 基?
;
;ここで勝利??ズを選択する。?MatchOverは試合終了を判定するので、
;一回目と二回目勝利を別の??ズにしたい時に便利。

[Statedef 180]
type = S
ctrl = 0
velset = 0,0

[State -2, Helper]
type = Null;Helper
triggerall = roundno = 1
triggerall = var(52) = 1
triggerall = numhelper(10000) <= 0
trigger1 = teammode = single
helpertype = normal
name = "Unlock"
ID = 10000
stateno = 10010
pos = -99999,-99999
postype = left
keyctrl = 0
ownpal = 1

[State 180,]
type = VarRandom
trigger1 = 1
v = 22
range = 0,1

[State 180,]
type = ChangeState
trigger1 = Time = 1
trigger1 = var(22) = 0
value = 181

[State 180,]
type = ChangeState
trigger1 = Time = 1
trigger1 = var(22) = 1
value = 182

;---------------------------------------------------------------------------
; 勝利??ズ1
; CNS レベル: 基?

[Statedef 181]
type = S
ctrl = 0
anim = 181
velset = 0,0

[State 181,]
type = PlaySnd
trigger1 = AnimElem = 2
trigger1 = Alive
value = 10,5

[State 181, 特殊効果]
type = AssertSpecial
trigger1 = time = [0,200]
flag = roundnotover

;---------------------------------------------------------------------------
; 勝利??ズ2
; CNS レベル: 基?

[Statedef 182]
type = S
ctrl = 0
anim = 182
velset = 0,0

[State 181,]
type = PlaySnd
trigger1 = AnimElem = 2
trigger1 = Alive
value = 10,4

[State 1100, ???????]
type = Explod
trigger1 = time = 74
persistent = 0
anim = 13010
postype = P1
ownpal = 1
pos = -10,0
bindtime = 0
scale = .75,.65
sprpriority = 10
supermove = 1

[State 1100, ???????]
type = Explod
trigger1 = time = 74
persistent = 0
anim = 13010
postype = P1
ownpal = 1
pos = 10,0
facing = -1
bindtime = 0
scale = .75,.65
sprpriority = 10
supermove = 1

[State 30000, 底?]
type = Explod
triggerall = numexplod(13020) = 0
trigger1 = time = 74
anim = 13020
postype = p1
under = 1
id = 13020
pausemovetime = 999
supermovetime = 999
supermove = 1

[State 30000, 底?]
type = Explod
triggerall = numexplod(13021) = 0
trigger1 = time = 74
anim = 13021
postype = p1
ontop = 1
id = 13021
pausemovetime = 999
supermovetime = 999
supermove = 1

[State 30000, 底?]
type = Explod
triggerall = numexplod(13022) = 0
trigger1 = time = 74
anim = 8
postype = p1
scale = 0.4,0.4
ownpal = 1
ontop = 1
id = 13022
pausemovetime = 999
supermovetime = 999
supermove = 1

[State 30000, p2超重落地音效]
type = PlaySnd
ignorehitpause = 1
trigger1 = time = 74
channel = 6
loop = 0
value = S3500,10

[State 30000, p2落地震屏]
type = EnvShake
trigger1 = time = 74
time = 10
freq = 140
ampl = -20
ignorehitpause = 1

[State 00];
type = PlaySnd
trigger1 = time = 74
value = s3500,14

[State 00];
type = PlaySnd
trigger1 = time = 74
value = s3500,15


[State 181, 特殊効果]
type = AssertSpecial
trigger1 = time = [0,200]
flag = roundnotover

;---------------------------------------------------------------------------
; イントロ分岐
; CNS レベル: 基?
;
; ここでは変数(var)を使っていますが、詳しい説明は後ほど。
; VarRandomはrangeで指定された範囲からひとつを選ぶので、
; いろいろな分岐に便利です。

;イントロ選択
[Statedef 190]
type = S
ctrl = 0
anim = 0
velset = 0,0

[State 190, VarRandom]
type = VarRandom
trigger1 = 1
v = 24
range = 0,1

[State 190,]
type = ChangeState
trigger1 = Time = 1
trigger1 = var(24) = 0
value = 191

[State 190,]
type = ChangeState
trigger1 = Time = 1
trigger1 = var(24) = 1
value = 196
;---------------------------------------------------------------------------
; イントロ（試合開始直前のアクション）
; CNS レベル: 基?

[Statedef 191]
type = S
ctrl = 0
anim = 190
velset = 0,0

[State 191, 特殊効果] ;「ROUND1, FIGHT!」のアナウンスが始まるまでは、このコントロ?ラを使ってください
type = AssertSpecial
trigger1 = 1
flag = Intro ;イントロの状態になります

[State 181,]
type = PlaySnd
trigger1 = AnimElem = 2
value = s10,6

[State 181,]
type = PlaySnd
trigger1 = AnimElem = 5
value = s12,13

[State 191, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
;---------------------------------------------------------------------------
; イントロ（試合開始直前のアクション）
; CNS レベル: 基?

[Statedef 196]
type = S
ctrl = 0
anim = 196
velset = 0,0

[State 191, 特殊効果] ;「ROUND1, FIGHT!」のアナウンスが始まるまでは、このコントロ?ラを使ってください
type = AssertSpecial
trigger1 = 1
flag = Intro ;イントロの状態になります

[State 191, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
;---------------------------------------------------------------------------
; イントロ?ＶＳ灯蛾の?く(以下略
; CNS レベル: 基?

[Statedef 192]
type = S
ctrl = 0
anim = 190
velset = 0,0

[State 191, 特殊効果] ;「ROUND1, FIGHT!」のアナウンスが始まるまでは、このコントロ?ラを使ってください
type = AssertSpecial
trigger1 = 1
flag = Intro ;イントロの状態になります

[State 181,]
type = PlaySnd
trigger1 = AnimElem = 2
value = s10,7

[State 191, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0

;---------------------------------------------------------------------------
; イントロ?ＶＳ武器持ち
; CNS レベル: 基?

[Statedef 193]
type = S
ctrl = 0
anim = 194
velset = 0,0

[State 191, 特殊効果] ;「ROUND1, FIGHT!」のアナウンスが始まるまでは、このコントロ?ラを使ってください
type = AssertSpecial
trigger1 = 1
flag = Intro ;イントロの状態になります

[State 181,]
type = PlaySnd
trigger1 = AnimElem = 2
value = s10,8

[State 191, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0

;---------------------------------------------------------------------------
; イントロ?ＶＳデコ助
; CNS レベル: 基?

[Statedef 194]
type = S
ctrl = 0
anim = 191
velset = 0,0

[State 191, 特殊効果] ;「ROUND1, FIGHT!」のアナウンスが始まるまでは、このコントロ?ラを使ってください
type = AssertSpecial
trigger1 = 1
flag = Intro ;イントロの状態になります

[State 181,]
type = PlaySnd
trigger1 = AnimElem = 2
value = s10,9

[State 181,]
type = PlaySnd
trigger1 = AnimElem = 6
value = s12,0

[State 700, エフェクト?示]
type = Explod
trigger1 = AnimElem = 4
anim = 192
postype = P1
pos = -20, -110
bindtime = -1
removetime = -1
sprpriority = -5
ownpal = 1
ID = 194

[State 1001,]
type = RemoveExplod
trigger1 = AnimElem = 5
ID = 194

[State 700, エフェクト?示]
type = Explod
trigger1 = AnimElem = 5
anim = 193
postype = P1
pos = 10, 0
sprpriority = 5
ownpal = 1

[State 191, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0

;---------------------------------------------------------------------------
; 挑発
; CNS レベル: 基?
[Statedef 195]
type     = S
movetype = I
physics  = S
anim     = 195
velset   = 0,0
ctrl     = 0
sprpriority = 2 ;ここで?示優先度を決定できます。?範囲は-5?5、大きいほど手前に?示される
facep2 = 1      ;相手の方を向いてから挑発（結?重要）

[State 195, コントロ?ル可否]
type = CtrlSet
triggerall = !winko
trigger1 = AnimElem = 16
value = 1

[State 181,]
type = PlaySnd
trigger1 = AnimElem = 2
value = s10,3

[State 195, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
; RUN_FWD
[Statedef 100]
type    = S
physics = S
anim = 100
sprpriority = 1
ctrl = 0

[State 40]
type = changeState
trigger1 = time = 0
trigger1 = var(59)
value = 1

[State 30000, 底?]
type = Explod
trigger1 = time = 2
anim = 13038
postype = p1
pos = 0,0
scale = 0.5,0.5
sprpriority = 5
id = 13020
facing = 1
ownpal = 1
pausemovetime = 999
supermovetime = 999
bindtime = 0

[State 100, 1]
type = VelSet
trigger1 = AnimElemtime(2) >= 0
x = const(velocity.run.fwd.x)

[State 191,]
type = PlaySnd
triggerall = time = 0
trigger1 = Alive
value = s3500,6
channel = 6

[State 191,]
type = PlaySnd
triggerall = gametime%15 = 0
trigger1 = Alive
value = s3500,6
channel = 6

[State 100,]
type = StopSnd
trigger1 = Anim != 100
channel = 6

[State 100, 2] ;Prevent run from canceling into walk
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 100, 3] ;Prevent from turning
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 100, 4]
type = ChangeState
trigger1 = command != "holdfwd"
trigger1 = time >= 15
value = 0
ctrl = 1

[State 100, 4]
type = ChangeState
trigger1 = command = "holdup"
value = 40
;---------------------------------------------------------------------------
; RUN_BACK
[Statedef 105]
type    = A
physics = A
ctrl = 0
anim = 105
sprpriority = 1

[State 30000]
type = Explod
trigger1 = time = 2
anim = 13038
postype = p1
pos = 0,0
scale = 0.5,0.5
sprpriority = 5
id = 13020
ownpal = 1
facing = -1
pausemovetime = 999
supermovetime = 999
bindtime = 0

[State 191,]
type = PlaySnd
triggerall = AnimElem = 2
trigger1 = Alive
value = s5,1

[State 105, 1]
type = VelSet
trigger1 = AnimElem = 2
x = const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 105, 3]
type = ChangeState
trigger1 = AnimElemtime(2) >= 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 106

;---------------------------------------------------------------------------
; RUN_BACK2 (land)
[Statedef 106]
type    = S
physics = S
ctrl = 0
anim = 106

[State 30000, 底?]
type = Explod
trigger1 = time = 0
anim = 13036
postype = p1
pos = 0,-5
scale = 0.5,0.5
sprpriority = 5
id = 13020
ownpal = 1
bindtime = 0
pausemovetime = 999
supermovetime = 999

[State 52, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = s4,0
volumescale = 50

[State 106, 1]
type = VelSet
trigger1 = Time = 0
x = 0
y = 0

[State 106, 2]
type = PosSet
trigger1 = Time = 0
y = 0


[State 106, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Jump Start
[Statedef 40]
type    = S
physics = S
anim = 40
ctrl = 0
sprpriority = 1
facep2 = 1

[State 40]
type = changeState
trigger1 = time = 0
trigger1 = var(59)
value = 1
[State 40, 1]
type = VarSet
triggerall = var(59) = 0
trigger1 = time = 0
var(4) = 0

[State 40, 1];小ジャンプ
type = VarSet
triggerall = var(59) = 0
trigger1 = command != "holdup"
var(4) = 1

[State 40, 1]
type = VarSet
triggerall = var(59) = 0
trigger1 = Time = 0
sysvar(1) = 0

[State 40, 2]
type = VarSet
triggerall = var(59) = 0
trigger1 = command = "holdfwd"
sysvar(1) = 1

[State 40, 3]
type = VarSet
triggerall = var(59) = 0
trigger1 = command = "holdback"
sysvar(1) = -1

[State 40, 4]
type = VelSet
triggerall = var(59) = 0
trigger1 = AnimTime = 0
trigger1 = Var(4) = 0
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, 4];小ジャンプ
type = VelSet
triggerall = var(59) = 0
trigger1 = AnimTime = 0
trigger1 = Var(4) = 1
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = -5.7

[State 40, 5]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = prevstateno = 100 ;RUN_FWD
trigger1 = sysvar(1) = 1
x = const(velocity.runjump.fwd.x)

[State 191,]
type = PlaySnd
trigger1 = AnimTime = 0
trigger1 = prevstateno = 100 ;RUN_FWD
trigger1 = sysvar(1) = 1
trigger1 = Alive
value = s3,2
channel = 4

[State 191,]
type = PlaySnd
triggerall = time = 0
;triggerall = Var(4) = 0
triggerall = Var(3) != 0
trigger1 = Alive
value = s3,2
channel = 4

[State 191,]
type = PlaySnd
triggerall = time = 0
triggerall = Var(4) = 0
triggerall = Var(3) = 0
trigger1 = Alive
trigger1 = prevstateno != 100 ;RUN_FWD
value = s3,1
channel = 4

[State 120, 5] ;Can t be thrown right after getting up
type = NotHitBy
trigger1 = time >= 0
value = , NT,ST,HT

[State 40, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;---------------------------------------------------------------------------
; Jump Up
[Statedef 50]
type    = A
physics = A

[State 50, 1]
type = VarSet
trigger1 = Time = 0
sysvar(1) = 0

[State 50, 2]
type = ChangeAnim
trigger1 = Time = 0
;trigger1 = Var(4) = 0
value = ifelse((vel x)=0, 41, ifelse((vel x)>0, 42, 43))

[State 50, 2];小ジャンプ
type = ChangeAnim
triggerall = Time = 0
trigger1 = var(59) = 0
trigger1 = Var(4) = [1,2]
trigger2 = var(59)
trigger2 = var(4) = [1,2]
value = 41

[State 40, VelAdd]
type = Veladd
trigger1 = time >= 0
trigger1 = Var(4) = [1,2]
y = -.10

[State 50, 3]
type = ChangeAnim
trigger1 = Vel y > -2
trigger1 = SelfAnimExist(anim + 3)
persistent = 0
value = Anim + 3
;---------------------------------------------------------------------------
; Jump Land
[Statedef 52]
type    = S
physics = S
anim    = 47
ctrl    = 0
velset  = 0,0
;facep2  = 1

[State 53]
type = NotHitBy
trigger1 = 1
value = SCA,NT,ST

[State 52, VarSet]
type = VarSet
trigger1 = Time = 0
sysvar(3) = 0

[State 52, VarSet]
type = VarSet
trigger1 = prevstateno = 155 || prevstateno = 5040
sysvar(3) = 1

[State 52, ChangeState]
type = ChangeState
trigger1 = Time = 0
value = 53


[Statedef 53]
type    = S
physics = S
ctrl = 0
anim = 47
velset = 0,0

[State 53]
type = NotHitBy
trigger1 = 1
value = SCA,NT,ST

[State 52, ChangeAnim]
type = ChangeAnim
trigger1 = sysvar(3) != 1
trigger1 = Time = 0
trigger1 = p2dist x < 0
value = Anim+1

[State 52, Turn]
type = Turn
trigger1 = sysvar(3) != 1
trigger1 = Time = 0
trigger1 = p2dist x < 0

[State 52, NotHitBy]
type = NotHitBy
trigger1 = sysvar(3) = 1
value = SCA
time = 2

[State 30000]
type = Explod
trigger1 = time = 0
anim = 13036
postype = p1
scale = 0.5,0.5
pos = 0,-5
ownpal = 1
sprpriority = 5
id = 13020
bindtime = 0
pausemovetime = 999
supermovetime = 999

[State 52, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = s4,0
volumescale = 50

[State 52, 1]
type = VelSet
trigger1 = Time = 0
y = 0

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 52, VarSet]
type = VarSet
trigger1 = time = 0
v = 49
value = 5

[State 52, NotHitBy]
type = NotHitBy
trigger1 = time = 0
value = SCA
time = 1

[State 52, 3]
type = changestate
trigger1 = var(59) = 0
trigger1 = time = 1 && command = "holdup"
value = 40
ctrl = 0

[State 52, 4]
type = VelSet
trigger1 = abs(vel x) < Const(movement.stand.friction.threshold)
x = 0

[state 52, CtrlSet]
type = CtrlSet
trigger1 = sysvar(3) != 1
trigger1 = time = 3
value = 1

[State 52, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 48
trigger1 = AnimTime = 0
value = 5

[State 52, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
;ふっとばし
[Statedef 300]
type     = S
movetype = A
physics  = S
juggle   = 0
poweradd = 0
ctrl     = 0
velset   = 0,0
anim     = 300
sprpriority = 3

[State 30000, 底?]
type = Explod
trigger1 = time = 12
anim = 13038
postype = p1
pos = 0,0
scale = 0.5,0.5
sprpriority = 5
ownpal = 1
id = 13020
facing = 1
pausemovetime = 999
supermovetime = 999
bindtime = 0

[State 1000, PowerAdd]
type = PowerAdd
trigger1 = prevstateno != [150,152]
trigger1 = time = 0
value = 20
ignorehitpause = 1

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = prevstateno = [150,152]
trigger1 = time = 0
value = 3500,7

[State 1000, Explod]
type = Explod
trigger1 = prevstateno = [150,152]
trigger1 = time = 0
anim = 7010
scale = .4,.4
pos = 0,-70
postype = p1
bindtime = 1
removetime = -2
supermove = 1
pausemove = 1
ownpal = 1
sprpriority = 5
removeongethit = 1

[State 300,]
type = PowerAdd
trigger1 = prevstateno = [150,152]
trigger1 = time = 0
value = -1000

[State 300,]
type = NotHitBy
trigger1 = prevstateno = [150,152]
trigger1 = 1
value = SCA

[state 300,]
type = Posset
trigger1 = time = 0
y = 0

[State 2100, 移動終了]
type = VelSet
trigger1 = AnimElem = 5
x = 4.5

[State 2100, 移動終了]
type = VelSet
trigger1 = AnimElem = 6
x = 0

[State 2000, SuperPause]
type = SuperPause
trigger1 = prevstateno = [150,152]
trigger1 = time = 0
anim = -1
movetime = 10
time = 10
darken = 0

[State 700, EnvColor]
type = EnvColor
trigger1 = prevstateno = [150,152]
trigger1 = time = 0
value = 255,255,255
time = 1
under = 1

[State 300, ヒット定?]
type = HitDef
trigger1 = prevstateno = [150,152]
trigger1 = Time = 0
attr = S, NA
animtype  = hard
damage    = 0
pausetime = 16,18
sparkno = -1
sparkxy = -20,-75
hitsound   = s1,4
ground.type = High
ground.slidetime = 17
ground.hittime = 17
ground.velocity = -5,-7
id = 300
air.velocity = -5,-7
fall = 1
air.fall = 1
fall.recover = 0
kill = 0
guard.velocity = -12
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = -20
yaccel = .5
getpower = 0,0
givepower = 15,15
EnvShake.Time      =  8
EnvShake.Ampl      = -12
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20

[State 300 , 1]
type = HitDef
trigger1 = prevstateno != [150,152]
trigger1 = time = 0
attr = S, NA
animtype  = Hard
damage    = 80
priority = 3
pausetime = 13,14
sparkno = -1
guard.sparkno = -1
sparkxy = -20,-75
id = 300
hitsound = s1,4
hitflag = MAF
guardflag = MA
guardsound = s2,0
ground.type = High
ground.slidetime = 17
ground.hittime = 17
ground.velocity = -5,-7
air.velocity = -5,-7
fall = 1
air.fall = 1
fall.recover = 0
guard.velocity = -12
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = -20
yaccel = .5
getpower = 35,35
givepower = 15,15
EnvShake.Time      =  8
EnvShake.Ampl      = -12
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20

[State EnvColor]
Type               = EnvColor
Trigger1           = MoveHit && NumTarGet(300)
Time               = 2
Under              = 0
Value              = 255,255,255
IgNoreHitPause     = 1 
Persistent         = 0

[State hitfire233]
Type = Explod
TriggerAll = NumTarGet(300)
Trigger1 = MoveContact = 1
Anim = IfElse(MoveHit, 13006, 13008)
PosType = P2
Pos = -20,-75
Id  = 7000
OnTop = 1
OwnPal = 1
Scale = .45,.45
IgnoreHitPause = 1
Persistent = 0

[State 300, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = s0,4

[State 300, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = s10,19

[State 300, ステ?ト変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;空中ふっとばし
[Statedef 650]
type     = A
movetype = A
physics  = A
juggle   = 0
poweradd = 20
ctrl     = 0
anim     = 650
sprpriority = 3

[State 240 , 1]
type = HitDef
trigger1 = AnimElem = 3
attr = A, NA
animtype  = Hard
damage    = 80
priority = 7,Hit
pausetime = 10,12
sparkno = -1
guard.sparkno = s-1
sparkxy = -25,-60
hitsound = s1,4
hitflag = MAF
guardflag = MA
guardsound = s2,0
ground.type = High
ground.slidetime = 14
ground.hittime  = 14
ground.velocity = -5,-5
air.velocity = -5,-5
air.animtype = Back
fall = 1
fall.recover = 0
ground.cornerpush.veloff = -14
guard.velocity = -9
getpower = 35,35
givepower = 15,15
EnvShake.Time      =  8
EnvShake.Ampl      = -12
id = 650
p2stateno = 116000+enemynear,statetype = C*10+enemynear,statetype = A*20

[State EnvColor]
Type               = EnvColor
Trigger1           = MoveHit && NumTarGet(650)
Time               = 2
Under              = 0
Value              = 255,255,255
IgNoreHitPause     = 1 
Persistent         = 0

[State hitfire233]
Type = Explod
TriggerAll = NumTarGet(650)
Trigger1 = MoveContact = 1
Anim = IfElse(MoveHit, 13006, 13008)
PosType = P2
Pos = -25,-60
Id  = 7000
OnTop = 1
OwnPal = 1
Scale = .45,.45
IgnoreHitPause = 1
Persistent = 0

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = s0,4

[State 300, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = s10,19

;---------------------------------------------------------------------------
;緊回避前

[Statedef 700]
type     = S
movetype = I
physics  = S
velset   = 0,0
anim     = 700
ctrl     = 0
velset   = 0,0
sprpriority = -2

[State 1000,]
type = PlaySnd
trigger1 = AnimElem = 3
value = s0,1
channel = 5

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = prevstateno = [150,152]
trigger1 = time = 0
value = 3500,7


[State 700, ??停止]
type = SuperPause
trigger1 = prevstateno = [150,152]
trigger1 = AnimElem = 1
anim = -1
movetime = 11
time = 11
p2defmul = 1.0
darken = 0

[State 1000, Explod]
type = Explod
trigger1 = prevstateno = [150,152]
trigger1 = time = 0
anim = 7010
scale = .4,.4
pos = 0,-70
postype = p1
bindtime = 1
removetime = -2
supermove = 1
pausemove = 1
ownpal = 1
sprpriority = 5
removeongethit = 1

[State 1000, AfterImage]
type = AfterImage
trigger1 = prevstateno = [150,152]
trigger1 = time = 0
time = 2
length = 11
timegap = 1
paladd = 60,20,100
PalContrast = 220,200,350
palcolor = 0
framegap = 3

[State 1000, Afterimage]
type = Afterimage
trigger1 = prevstateno != [150,152]
trigger1 = time = 0
time = 2
length = 7
PalBright = 0,0,0
PalContrast = 255,255,255
PalAdd = 0,0,0
PalMul = 1,1,1
FrameGap = 3

[State 2041, 2]
type = Afterimagetime
trigger1 = stateno = 700
trigger1 = time%2 = 0 && Time < 20
time = 2

[State 700,]
type = Poweradd
triggerall = time = 0
trigger1 = prevstateno = [150,152]
value = -1000

[State 700,]
type = palfx
triggerall = time = 0
trigger1 = prevstateno = [150,152]
time = 5
add = 230,230,230

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = s10,0
channel = 4

[State 2100, 非無敵] ;地上投げ属性は回避できない
type = HitBy
trigger1 = AnimElem = 9, <= 0
value = SC, NT, ST, HT    ;立S、屈C、空A , 通常N、必殺S、超必H ? 攻撃A、投げT、飛び道具Pで記述

[State 2110, ]
type = Varset
trigger1 = time = 0
trigger1 = prevstateno = 100
var(6) = 1

[State 2110, ]
type = Varset
trigger1 = Animtime = 0
var(6) = 0

[State 2100, 移動量]
type = VelSet
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(8) < 0
x = 5.6

[State 2100, 移動終了]
type = VelSet
trigger1 = AnimElem = 8
x = 0

[State 2110, 移動量]
type = VelSet
triggerall = var(6) = 1
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(8) < 0
x = 7.6

[State 2110, 移動量]
type = VelSet
triggerall = var(6) = 1
trigger1 = AnimElem = 8
x = 0

[State 2100, 相手と重なった場合]
type = PlayerPush
trigger1 = 1 
value = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = prevstateno = [700,710]
trigger1 = time = 0
value = 3500,7

[State 1000, Explod]
type = Explod
trigger1 = prevstateno = [700,710]
trigger1 = time = 0
anim = 7010
scale = .4,.4
pos = 0,-70
postype = p1
bindtime = 1
removetime = -2
supermove = 1
pausemove = 1
ownpal = 1
sprpriority = 5
removeongethit = 1

[State 2100, 終了]
type = ChangeState
triggerall = var(59) = 0
triggerall = power >= 500
triggerall = command = "recovery" && command = "holdback"
trigger1 = Time >= 20
value = 710
ctrl = 0

[State 2100, 終了]
type = ChangeState
triggerall = var(59) = 0
triggerall = power >= 500
triggerall = command = "recovery"
trigger1 = Time >= 20
value = 700
ctrl = 0

[State 2100, 終了]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;緊?回避後

[Statedef 710]
type     = S
movetype = I
physics  = S
velset   = 0,0
anim     = 710
ctrl     = 0
velset   = 0,0
sprpriority = -2

[State 1000, ?????]
type = PlaySnd
trigger1 = AnimElem = 3
value = s0,1
channel = 5

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = prevstateno = [150,152]
trigger1 = time = 0
value = 3500,7

[State 1000, Explod]
type = Explod
trigger1 = prevstateno = [150,152]
trigger1 = time = 0
anim = 7010
scale = .4,.4
pos = 0,-70
postype = p1
bindtime = 1
removetime = -2
supermove = 1
pausemove = 1
ownpal = 1
sprpriority = 5
removeongethit = 1

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = prevstateno = [700,710]
trigger1 = time = 0
value = 3500,7

[State 1000, Explod]
type = Explod
trigger1 = prevstateno = [700,710]
trigger1 = time = 0
anim = 7010
scale = .4,.4
pos = 0,-70
postype = p1
bindtime = 1
removetime = -2
supermove = 1
pausemove = 1
ownpal = 1
sprpriority = 5
removeongethit = 1

[State 700,]
type = Poweradd
triggerall = time = 0
trigger1 = prevstateno = [700,710]
value = -500

[State 700,]
type = Poweradd
triggerall = time = 0
trigger1 = prevstateno = [150,152]
value = -1000

[State 700,];?滅
type = palfx
triggerall = time = 0
trigger1 = prevstateno = [150,152]
time = 5
add = 230,230,230

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = s10,0
channel = 4

[State 1000, AfterImage]
type = AfterImage
trigger1 = prevstateno = [150,152]
trigger1 = time = 0
time = 2
length = 11
timegap = 1
paladd = 60,20,100
PalContrast = 220,200,350
palcolor = 0
framegap = 3

[State 1000, Afterimage]
type = Afterimage
trigger1 = prevstateno != [150,152]
trigger1 = time = 0
time = 2
length = 7
PalBright = 0,0,0
PalContrast = 255,255,255
PalAdd = 0,0,0
PalMul = 1,1,1
FrameGap = 3

[State 2041, 2]
type = Afterimagetime
trigger1 = stateno = 710
trigger1 = time%2 = 0 && Time < 20
time = 2

[State 2110, 非無敵]
type = HitBy
trigger1 = AnimElem = 8, <= 0
value = SC, NT, ST, HT

[State 2110, 移動量]
type = VelSet
trigger1 = AnimElemTime(3) > 0 && AnimElemTime(8) < 0
x = -5.6

[State 2110, 移動終了]
type = VelSet
trigger1 = AnimElem = 8
x = 0

[State 2110, 相手と重なった時の処理]
type = PlayerPush
trigger1 = AnimElemTime(1) > 0
value = 0

[State 2100, 終了]
type = ChangeState
triggerall = var(59) = 0
triggerall = power >= 500
triggerall = command = "recovery" && command = "holdback"
trigger1 = Time >= 20
value = 710
ctrl = 0

[State 2100, 終了]
type = ChangeState
triggerall = var(59) = 0
triggerall = power >= 500
triggerall = command = "recovery"
trigger1 = Time >= 20
value = 700
ctrl = 0

[State 2110, 終了]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; HIT_FALLRECOVER (on the ground)
[Statedef 5201]
type    = S
movetype= H
physics = S
anim = 5200
velset = 0,0

[State 5200]
type = Posset
trigger1 = time = 0
y = 0

[State 2110, 無敵]
type = NotHitBy
trigger1 = 1
value = SCA

[State 5201, Turn]
type = Turn
triggerall = time = 0
triggerall = var(59) = 0
trigger1 = command != "holdback"
trigger1 = command != "holdfwd"
trigger1 = P2Dist X < 0

[State 2110, ]
type = Varset
triggerall = var(59) = 0
trigger1 = command = "holdfwd"
trigger1 = time = 0
var(6) = 1

[State 2110, ]
type = ChangeAnim
triggerall = var(6) = 1
trigger1 = time = 0
value = 700

[State 1000, VelSet]
type = VelSet
triggerall = var(59) = 0 
trigger1 = anim = 5200 && AnimElemtime(1) >= 0 && AnimElemtime(5) <= 0
trigger2 = anim != 5200 && AnimElemtime(2) >= 0 && AnimElemtime(7) <= 0
x = ifelse(var(6)= 1,6.5,-5.0)

[State 1000, VelSet]
type = VelSet
triggerall = var(59) 
trigger1 = anim = 5200 && AnimElemtime(1) >= 0 && AnimElemtime(5) <= 0
trigger2 = anim != 5200 && AnimElemtime(2) >= 0 && AnimElemtime(7) <= 0
x = -5.0

[State 2100, 移動終了]
type = VelSet
trigger1 = var(6) = 0
trigger1 = AnimElem = 5
x = 0

[State 2100, 移動終了]
type = VelSet
trigger1 = var(6) = 1
trigger1 = AnimElem = 5
x = 0

[State 2110, ]
type = PlayerPush
trigger1 = AnimElemTime(1) > 0
value = 0

[State 5201, PalFX]
type = PalFX
trigger1 = time = 0
time = 1

[State 2110, ]
type = Varset
trigger1 = Animtime = 0
var(6) = 0

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 1
value = s10,0

[State 2110, 終了]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;-------------------------------Power up (start)
;KOF Memorial Poweradd by Zelgadis
[Statedef 910]
type = S
movetype = I
physics = S
anim = 910
velset = 0
ctrl = 0

[State 301, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = s12,9
channel = 11

[State 301, snd]
type = PlaySnd
trigger1 = AnimElem = 1
value = s10,21
channel = 12

[State 730, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 911

; Power up
[Statedef 911]
type = S
movetype = I
physics = S
anim = 911

[State 705, 2]
type = Explod
trigger1 = time = 0
anim = 13032
ID = 911
sprpriority = -3
postype = p1
scale = 0.75,0.75
pos = 0,0
ownpal = 1
bindtime = -1
removeongethit = 1

[State 705, 2]
type = Explod
trigger1 = time = 0
anim = 13034
ID = 911
sprpriority = 3
postype = p1
scale = 0.75,0.75
pos = 0,0
ownpal = 1
bindtime = -1
removeongethit = 1


[State 735, 1]
type = ChangeState
triggerall = var(59) = 0
trigger1 = command != "holdx"
trigger2 = command != "holdb"
value = 912

[State 911, 2]
type = PowerAdd
trigger1 = gameTime%1 = 0
value = 8

[State 735, 2]
type = ChangeState
trigger1 = Power >= 5000
value = 313

[State 735, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 911

; Power up (end)
[Statedef 912]
type = S
movetype = I
physics = S
anim = 912

[State 705, 2]
type = Null;Explod
trigger1 = time = 0
anim = 13033
ID = 912
sprpriority = 3
postype = p1
pos = 0,0
ownpal = 1
scale = 0.75,0.75
bindtime = -1
removeongethit = 1

[State 912, StopSnd]
type = StopSnd
trigger1 = animtime = 0
channel = 8

[State 912, StopSnd]
type = StopSnd
trigger1 = animtime = 0
channel = 9

[State 1100, 1]
type = RemoveExplod
trigger1 = AnimElem = 1
ID = 911

[State 740, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

; Power up (maxed out)
[Statedef 313]
type = S
movetype = I
physics = S
anim = 912

[State 1100, 1]
type = RemoveExplod
trigger1 = AnimElem = 1
ID = 911

[State 313, Explod]
type = Explod
trigger1 = time = 0
anim = 7101
pos = -5,0
postype = p1
facing = 1
vfacing = 1
ownpal = 1
bindtime = 1
scale = .58,.58
sprpriority = 7

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 3500,11

[State 2100,]
type = Envcolor
trigger1 = time = 0
time = 1
value = 255,255,255
under = 1

[State 1000, EnvShake]
type = EnvShake
trigger1 = AnimElem = 1
Time      =  8
Ampl      = -12

[State 1100, 1]
type = RemoveExplod
trigger1 = AnimElem = 1
ID = 910

[State 741, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;-------------------------------------------------------------------------------
; MAX
[Statedef 900]
type = S
ctrl = 0
anim = 900
velset = 0,0
movetype = I
physics = N
sprpriority = 1
poweradd = -1000

[State 00];
type = PlaySnd
trigger1 = animelem = 4
value = s3600,21

[state a]
type = varset
trigger1 = time = 0
v = 24
value = power

[state a]
type = varset
trigger1 = animelem = 4
v = 20
value = 900

[State a]
type = Explod
trigger1 = animelem = 4
anim = 7101
sprpriority = -3
postype = p1
pos = 0,4
bindtime = 1
ontop = 1
scale = .55,.55
ownpal = 1
supermovetime = 999

[State 1000, 音を鳴らす]
type = envcolor
trigger1 = animelem = 4
value = 255,255,255
time = 1
ignorehitpause = 1
persistent = 0

[State 1020, 4]
type = EnvShake
trigger1 = animelem = 4
time = 5
ampl = -5
freq = 95
phase = 95

[State 195, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;-------------------------------------------------------------------------------
; MAX
[Statedef 901]
type = S
ctrl = 0
anim = 901
velset = 10,0
movetype = I
physics = N
sprpriority = 1
poweradd = -1000

[State 1100]
type = Explod
trigger1 = time = 0
persistent = 0
anim = 13010
postype = P1
SCALE = .4,.4
pos = 0,0
sprpriority = 3
ownpal = 1
ignorehitpause = 1
supermove = 9999
pausemove = 9999

[State 00];
type = PlaySnd
trigger1 = animelem = 1
value = s3600,21

[state a]
type = varset
trigger1 = animelem = 1
v = 20
value = 900

[state a]
type = varset
trigger1 = time = 0
v = 24
value = power

[State a]
type = Explod
trigger1 = animelem = 1
anim = 7101
sprpriority = -3
postype = p1
pos = 0,4
bindtime = 1
ontop = 1
scale = .55,.55
ownpal = 1
supermovetime = 999

[State 1000, 音を鳴らす]
type = envcolor
trigger1 = animelem = 1
value = 255,255,255
time = 1
ignorehitpause = 1
persistent = 0

[State 1020, 4]
type = EnvShake
trigger1 = animelem = 1
time = 5
ampl = -5
freq = 95
phase = 95

[State 195, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
; MAX
[Statedef 902]
type = S
ctrl = 0
anim = 4
velset = 0,0
movetype = I
physics = N
sprpriority = 1
poweradd = 0

[State Zoom]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "ZOOM"
Id = 42008
stateno = 42008
pos = 0,0
postype = p1
facing = 1
ignorehitpause = 1
supermovetime = 9999
pausemovetime = 9999
ownpal = 1
persistent = 0

[State 2000, ???????????]
type = SuperPause
trigger1 = time = 0
anim = -1
poweradd = -6000
movetime = 75
time = 75
darken = 0

[State 1000, BGPalFX]
type = BGPalFX
trigger1 = Time = 0
time = 40
add = 0,0,0
mul = -256,-256,-256
sinadd =  256,256,256,51
invertall = 1
color = 256

[State 1000, EnvColor]
type = EnvColor
trigger1 = Time = 0
value = 255,255,255
time = 2
under = 1

[State 2000]
type = Explod
trigger1 = time = 33
anim = 13041
scale = .2,.2
pos = 0,-97
postype = p1
sprpriority = 999
ownpal = 1
bindtime = 1
supermove = 1

[State 2000]
type = Explod
trigger1 = time = 33
anim = 13015
scale = 1.2,1.2
pos = 0,-97
postype = p1
sprpriority = 999
ownpal = 1
bindtime = 1
supermove = 1

[State 2000]
type = Explod
trigger1 = time = 0
anim = 3
pos = -3,-97
postype = p1
sprpriority = 18
ownpal = 1
bindtime = 1
supermove = 1

[State 2000]
type = Explod
trigger1 = time = 0
anim = 13044
pos = -3,-97
scale = .15,.15
postype = p1
sprpriority = 19
ownpal = 1
bindtime = 1
supermove = 1

[State 2000]
type = Explod
trigger1 = time = 0
anim = 13000
pos = 0,-66
sprpriority = -3
ownpal = 1
postype = p1
scale = .75,.75
bindtime = 1
supermove = 1

[State 2000]
type = Explod
trigger1 = time = 0
anim = 13001
pos = 0,-66
postype = p1
sprpriority = 20
ownpal = 1
bindtime = 1
supermove = 1

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = time = 10
value = s10,15
channel = 4

[State 1100, ???????]
type = Explod
trigger1 = time = 33
persistent = 0
anim = 13010
postype = P1
ownpal = 1
pos = -10,0
bindtime = 0
scale = .75,.65
sprpriority = 10
supermove = 1

[State 1100, ???????]
type = Explod
trigger1 = time = 33
persistent = 0
anim = 13010
postype = P1
pos = 10,0
bindtime = 0
scale = .75,.75
sprpriority = 10
ownpal = 1
facing = -1
supermove = 1

[State 1000, ?????]
type = PlaySnd
trigger1 = time = 0
value = s9,2

[State 30000, 底?]
type = Explod
triggerall = numexplod(13020) = 0
trigger1 = time = 33
anim = 13020
postype = p1
scale = 0.45,0.45
under = 1
id = 13020
pausemovetime = 999
supermovetime = 999
supermove = 1

[State 30000, 底?]
type = Explod
triggerall = numexplod(13021) = 0
trigger1 = time = 33
anim = 13021
postype = p1
scale = 0.45,0.45
ontop = 1
id = 13021
pausemovetime = 999
supermovetime = 999
supermove = 1

[State 30000, p2超重落地音效]
type = PlaySnd
ignorehitpause = 1
trigger1 = time = 33
channel = 6
loop = 0
value = S3500,10

[State 30000, p2落地震屏]
type = EnvShake
trigger1 = time = 33
time = 10
freq = 140
ampl = -20
ignorehitpause = 1

[State 00];
type = PlaySnd
trigger1 = time = 33
value = s3500,14

[State 00];
type = PlaySnd
trigger1 = time = 33
value = s3500,15

[State 00];
type = PlaySnd
trigger1 = animelem = 6
value = s3600,20

[State 00];
type = PlaySnd
trigger1 = animelem = 6
value = s3600,18

[State 00];
type = PlaySnd
trigger1 = animelem = 6
value = s3600,19

[state a]
type = varset
trigger1 = animelem = 6
v = 21
value = 1

[State a]
type = Explod
trigger1 = animelem = 6
anim = 7101
sprpriority = -3
postype = p1
pos = 0,4
bindtime = 1
sprpriority = 10
scale = .55,.55
ownpal = 1
supermovetime = 999
supermove = 1

[State 30000, 底?]
type = Explod
trigger1 = animelem = 6
anim = 13020
postype = p1
under = 1
id = 13020
pos = 0,0
ownpal = 1
pausemovetime = 999
supermovetime = 999
supermove = 1

[State 30000, 底?]
type = Explod
trigger1 = animelem = 6
anim = 13021
postype = p1
ontop = 1
id = 13021
pos = 0,0
ownpal = 1
pausemovetime = 999
supermovetime = 999
supermove = 1

[State 30000, 底?]
type = Explod
trigger1 = animelem = 6
anim = 8
postype = p1
pos = -15,0
ownpal = 1
sprpriority = 20
scale = 0.4,0.4
id = 13021
pausemovetime = 999
supermovetime = 999
supermove = 1

[State 1000, 音を鳴らす]
type = envcolor
trigger1 = animelem = 6
value = 255,255,255
time = 1
ignorehitpause = 1
persistent = 0

[State 1020, 4]
type = EnvShake
trigger1 = animelem = 6
time = 5
ampl = -5
freq = 95
phase = 95

[State 195, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;-------------------------------------------------------------------------------
[Statedef 6010]
type = S
physics = S
;anim = 6010
poweradd = 0
sprpriority = 8
velset = 0,0
ctrl = 0

[State 1000, VelSet]
type = VelSet
trigger1 = time = 0
x = -7

[State 1000, VelAdd]
type = VelAdd
trigger1 = time = 10
x = .5

[State 1000, VelSet]
type = VelSet
trigger1 = time >= 15
x = 0

[State 6010, PlaySound]
type = PlaySnd
trigger1 = animelem = 3
value = s5000,0

[State 6010, Explod]
type = Explod
trigger1 = animelem = 10
anim = f61
pos = 25,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
sprpriority = -9

[State 6010, PlaySound]
type = PlaySnd
trigger1 = animelem = 10
value = f7,ifelse(Stagevar(Info.name)!="Boss",1,7)
volumescale = 50

[State 6010, EnvShake]
type = EnvShake
trigger1 = animelem = 10
time = 10
freq = 110
ampl = -4

[State 6010, PalFX]
type = PalFX
trigger1 = time = 0
time = 0

[State 1000, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 6010, 4]
type = ChangeAnim
trigger1 = time = 0
value = 150 + 1*(command = "holddown")

[State 6010, anim]
type = Changeanim
trigger1 = time = 30
value = 6010

[State 6010, air]
type = Changestate
trigger1 = pos Y != 0
value = 5000

[State 220, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 5150

; HIT_LIEDEAD
[Statedef 5150]
type    = L
movetype= H
physics = N
sprpriority = -3

[State 5150, 1]
type = ChangeAnim
triggerall = 1
trigger1 = Prevstateno = 6010
value = 6011

[State 5150, 1] ;Normal anim
type = ChangeAnim
triggerall = var(22) = 0
triggerall = Prevstateno != 6010
triggerall = Time = 0
triggerall = SelfAnimExist(5140)
trigger1 = (anim != [5111,5119]) && (anim != [5171,5179])
trigger2 = !SelfAnimExist(5140 + (anim % 10))
value = 5140

[State 5150, 3] ;Hit up type anim
type = ChangeAnim
triggerall = var(22) = 0
triggerall = Prevstateno != 6010
trigger1 = Time = 0
trigger1 = (anim = [5111,5119]) || (anim = [5171,5179])
trigger1 = SelfAnimExist(5140 + (anim % 10))
value = 5140 + (anim % 10)

[State 5150, 4] ;Match over anim
type = ChangeAnim
triggerall = var(22) = 0
triggerall = Prevstateno != 6010
persistent = 0
;trigger1 = Time = 0
trigger1 = MatchOver = 1
trigger1 = Anim = [5140,5149]
trigger1 = SelfAnimExist(anim+10)
value = anim+10

[State 5150, 5] ;Switch to 5110 if liedead anim does not exist
type = ChangeAnim
triggerall = var(22) = 0
triggerall = Prevstateno != 6010
trigger1 = Time = 0
trigger1 = Anim != [5140,5159]
trigger1 = Anim != [5110,5119]
value = 5110

[State 5150, 1] ;Normal anim
type = ChangeAnim
triggerall = var(22) != 0
triggerall = Prevstateno != 6010
triggerall = Time = 0
triggerall = SelfAnimExist(15140)
trigger1 = (anim != [15111,15119]) && (anim != [15171,15179])
trigger2 = !SelfAnimExist(15140 + (anim % 10))
value = 15140

[State 5150, 3] ;Hit up type anim
type = ChangeAnim
triggerall = var(22) != 0
triggerall = Prevstateno != 6010
trigger1 = Time = 0
trigger1 = (anim = [15111,15119]) || (anim = [15171,15179])
trigger1 = SelfAnimExist(15140 + (anim % 10))
value = 15140 + (anim % 10)

[State 5150, 4] ;Match over anim
type = ChangeAnim
triggerall = var(22) != 0
triggerall = Prevstateno != 6010
persistent = 0
;trigger1 = Time = 0
trigger1 = MatchOver = 1
trigger1 = Anim = [15140,15149]
trigger1 = SelfAnimExist(anim+10)
value = anim+10

[State 5150, 5] ;Switch to 5110 if liedead anim does not exist
type = ChangeAnim
triggerall = var(22) != 0
triggerall = Prevstateno != 6010
trigger1 = Time = 0
trigger1 = Anim != [15140,15159]
trigger1 = Anim != [15110,15119]
value = 15110

[State 5150, 6] ;Friction
type = VelMul
trigger1 = 1
x = 0.85

[State 5150, 7] ;Friction
type = VelSet
trigger1 = Vel x < .05
persistent = 0
x = 0

[State 5150, 8]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1
;-------------------------------------------------------------------------------
;Slow Effect
[Statedef 2026]
type = S
ctrl = 0
anim = 999
velset = 0,0

[State 1000, Pause]
type = Pause
triggerall = RoundState = 2
trigger1 = time = [12,25]
time = 1
movetime = 1
ignorehitpause = 1

[State 1000, DestroySelf]
type = DestroySelf
trigger1 = time = 25
;-------------------------------------------------------------------------------
;Slow Effect
[Statedef 2027]
type = S
ctrl = 0
anim = 999
velset = 0,0

[State 1000, Pause]
type = Pause
triggerall = RoundState = 2
trigger1 = time = [0,12]
time = 1
movetime = 1
ignorehitpause = 1

[State 1000, DestroySelf]
type = DestroySelf
trigger1 = time = 100



;[state -1] 
;type = powerset 
;trigger1 = 1 
;value = 3000
;---------------------------------------------------------------------------
; HITG_SHAKE
[Statedef 116000]
type    = S
movetype= H
physics = N
velset = 0,0

[State 0, DestroySelf]
type = DestroySelf
trigger1 = 1
ignorehitpause = 1

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
y = 0
ignorehitpause = 1

[State 5000, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim2
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = ifelse((GetHitVar(groundtype) = 1),116000,116010) + GetHitVar(animtype)

[State 5000, 2] ;Anim for HIT_BACK
type = ChangeAnim2
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 116030

[State 5000, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim2
trigger1 = Time = 0
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 116047 + GetHitVar(animtype) ;5051 - 4 + type

[State 5000, 4] ;Freeze anim
type = ChangeAnim2
trigger1 = Time > 0
value = anim

[State 5020, 4] ;Freeze anim
type = ChangeAnim
trigger1 = anim = 116052
value = 5052

[State 5020, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
trigger1 = anim = 5052
value = anim

[State 5000, 5] ;State type gets set to aerial if getting hit up
type = StateTypeSet
trigger1 = Time = 0
trigger1 = GetHitVar(yvel) != 0 || GetHitVar(fall)
trigger2 = Pos Y != 0
statetype = a

[State 5000, 6]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) = 0 && !GetHitVar(fall)
value = 116001 ;HITG_SLIDE

[State 5000, 7]
type = ChangeState
trigger1 = HitShakeOver
value = 116030

[State 5000, FFB Light]
type = ForceFeedback
trigger1 = anim = 116000
trigger2 = anim = 116010
persistent = 0
time = 6
waveform = square

[State 5000, FFB Medium]
type = ForceFeedback
trigger1 = anim = 116001
trigger2 = anim = 116011
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 5000, FFB Hard]
type = ForceFeedback
trigger1 = anim = 116012
trigger2 = anim = 116002
trigger3 = anim = 116030
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

;---------------------------------------------------------------------------
; HITG_SLIDE
[Statedef 116001]
type    = S
movetype= H
physics = S

[State 0, DestroySelf]
type = DestroySelf
trigger1 = 1
ignorehitpause = 1

[State 5001, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 5001, 2]
type = ChangeAnim2
trigger1 = AnimTime = 0
value = 116005 + GetHitVar(animtype) + (GetHitVar(groundtype)=2)*10

[State 5001, 3] ;Stop sliding back
type = VelMul
trigger1 = Time >= GetHitVar(slidetime)
x = .6

[State 5001, 4]
type = VelSet
trigger1 = HitOver
x = 0

[State 5001, 5]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 5001, 6]
type = SelfState
trigger1 = time > 5
trigger1 = HitOver
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; HITC_SHAKE
[Statedef 116010]
type    = C
movetype= H
physics = N
velset = 0,0

[State 0, DestroySelf]
type = DestroySelf
trigger1 = 1
ignorehitpause = 1

[State 5010, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim2
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = 116020 + GetHitVar(animtype)

[State 5010, 2] ;Anim for HIT_BACK
type = ChangeAnim2
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 116030

[State 5010, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim2
trigger1 = Time = 0
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 116047 + GetHitVar(animtype) ;5051 - 4 + type

[State 5010, 4] ;Freeze anim
type = ChangeAnim2
trigger1 = Time > 0
value = anim

[State 5020, 4] ;Freeze anim
type = ChangeAnim
trigger1 = anim = 116052
value = 5052

[State 5020, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
trigger1 = anim = 5052
value = anim

[State 5010, 5] ;State type gets set to aerial if getting hit up
type = StateTypeSet
triggerall = Time = 0
trigger1 = GetHitVar(yvel) != 0 || GetHitVar(fall)
trigger2 = Pos Y != 0
statetype = a

[State 5010, 6]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) = 0 && !GetHitVar(fall)
value = 116011 ;HITC_SLIDE

[State 5010, 7]
type = ChangeState
trigger1 = HitShakeOver
value = 116030

[State 5010, FFB Light]
type = ForceFeedback
trigger1 = anim = 116020
persistent = 0
time = 6
waveform = square

[State 5010, FFB Medium]
type = ForceFeedback
trigger1 = anim = 116021
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 5010, FFB Hard]
type = ForceFeedback
trigger1 = anim = 116022
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

;---------------------------------------------------------------------------
; HITC_SLIDE
[Statedef 116011]
type    = C
movetype= H
physics = C

[State 0, DestroySelf]
type = DestroySelf
trigger1 = 1
ignorehitpause = 1

[State 5011, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 5011, 2]
type = ChangeAnim2
trigger1 = AnimTime = 0
value = 116025 + GetHitVar(animtype)

[State 5011, 3] ;Stop sliding back
type = VelMul
trigger1 = Time >= GetHitVar(slidetime)
x = .6

[State 5011, 4]
type = VelSet
trigger1 = HitOver
x = 0

[State 5011, 5]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 5011, 6]
type = SelfState
trigger1 = time > 5
trigger1 = HitOver
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; HITA_SHAKE
[Statedef 116020]
type    = A
movetype= H
physics = N
velset = 0,0

[State 2120]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 0, DestroySelf]
type = DestroySelf
trigger1 = 1
ignorehitpause = 1

[State 5020, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim2
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = ifelse((GetHitVar(airtype) = 1),116000,116010) + GetHitVar(animtype)

[State 5020, 2] ;Anim for HIT_BACK
type = ChangeAnim2
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 116030

[State 5020, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim2
trigger1 = Time = 0
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 116047 + GetHitVar(animtype) ;5051 - 4 + type

[State 5020, 4] ;Freeze anim
type = ChangeAnim2
trigger1 = Time > 0
value = anim

[State 5020, 4] ;Freeze anim
type = ChangeAnim
trigger1 = anim = 116052
value = 5052

[State 5020, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
trigger1 = anim = 5052
value = anim

[State 5020, 5]
type = ChangeState
trigger1 = HitShakeOver
value = 116030

[State 5020, FFB Light]
type = ForceFeedback
trigger1 = anim = 116000
trigger2 = anim = 116010
persistent = 0
time = 6
waveform = square

[State 5020, FFB Medium]
type = ForceFeedback
trigger1 = anim = 116001
trigger2 = anim = 116011
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 5020, FFB Hard]
type = ForceFeedback
trigger1 = anim = 116012
trigger2 = anim = 116002
trigger3 = anim = 116030
trigger4 = anim = [116051,116059]
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

;---------------------------------------------------------------------------
; HITA_UP (initial going up)
[Statedef 116030]
type    = A
movetype= H
physics = N
ctrl = 0

[State 2120]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 0, DestroySelf]
type = DestroySelf
trigger1 = 1
ignorehitpause = 1

[State 5035, 1]
type = ChangeAnim2
trigger1 = Anim != [116000, 116199]
trigger1 = SelfAnimExist(5030)
value = 116030

[State 5030, 1]
type = VelAdd;Gravity
trigger1 = 1
y = GetHitVar(yaccel)

[State 5030, 2]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 5030, 3]
type = selfState
triggerall = !HitFall
trigger1 = HitOver
trigger2 = Vel Y > 0    ;Hit ground
trigger2 = Pos Y >= 10  ;.
value = 5040 ;HITA_RECOV

[State 5030, 4]
type = changeState
triggerall = HitFall
trigger1 = HitOver
trigger2 = Vel Y > 0    ;Hit ground
trigger2 = Pos Y >= 10  ;.
value = 116050 ;HITA_FALL

[State 5030, 5]
type = changeState
trigger1 = AnimTime = 0
value = 116035 ;HITA_UP (transition)

;---------------------------------------------------------------------------
; HITA_UP_T (transition)
[Statedef 116035]
type    = A
movetype= H
physics = N

[State 2120]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 0, DestroySelf]
type = DestroySelf
trigger1 = 1
ignorehitpause = 1

[State 5035, 1]
type = ChangeAnim2
trigger1 = Time = 0
trigger1 = SelfAnimExist(5035)
trigger1 = Anim != [116051,116059] ;Not if in hit up anim
trigger1 = Anim != 116090 ;Not if hit off ground anim
value = 116035

[State 5035, 2]
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 5035, 3]
type = selfState
triggerall = !HitFall
trigger1 = HitOver  ;Hit is over
trigger2 = AnimTime = 0 ;Animation over
trigger3 = Vel Y > 0    ;Hit ground
trigger3 = Pos Y >= 10  ;.
trigger4 = Time = 0     ;No transition anim
trigger4 = Anim != 116035 ;.
value = 5040 ;HITA_RECOV

[State 5035, 4]
type = changeState
triggerall = HitFall
trigger1 = HitOver  ;Hit is over
trigger2 = AnimTime = 0 ;Anim is over
trigger3 = Vel Y > 0    ;Hit ground
trigger3 = Pos Y >= 10  ;.
trigger4 = Time = 0     ;No transition anim
trigger4 = Anim != 116035 ;.
value = 116050 ;HITA_FALL

;---------------------------------------------------------------------------
; Air get-hit (falling)
[Statedef 116050]
type    = A
movetype= H
physics = N

[State 2120]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 0, DestroySelf]
type = DestroySelf
trigger1 = 1
ignorehitpause = 1

[State 5050, 1] ;Change anim when done with transition
type = ChangeAnim2
trigger1 = AnimTime = 0
trigger1 = Anim = 116035
trigger2 = Time = 0     ;If no transition anim
trigger2 = Anim != 116035
trigger2 = (Anim != [116051, 116059]) && (Anim != [116061, 116069])
trigger2 = Anim != 116090 ;Not if hit off ground anim
value = 116050

[State 5050, 2] ;Coming down anim
type = ChangeAnim2
trigger1 = anim = [116050,116059]
trigger1 = Vel Y >= ifelse(anim = 116050, 1, -2)
trigger1 = SelfAnimExist(anim-111000+10)
value = anim+10
persistent = 0

[State 5050, 3] ;Gravity
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 5050, 6]
type = changestate
trigger1 = Vel Y > 0
trigger1 = Pos Y >= ifelse((anim = [116051,116059]) || (anim = [116061,116069]), 0, 0)
value = 116100 ;Downed get-hit (hit ground from fall)

;---------------------------------------------------------------------------
; HIT_BOUNCE (hit ground)
[Statedef 116100]
type    = L
movetype= H
physics = N

[State 0, DestroySelf]
type = DestroySelf
trigger1 = 1
ignorehitpause = 1

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
trigger1 = (anim != [116051,116059]) && (anim != [116061,116069])
trigger2 = !SelfAnimExist(5100 + ((anim-111000) % 10))
value = 5100

[State 5100, 3] ;Hit ground anim (for hit up)
type = ChangeAnim
trigger1 = time = 0
trigger1 = (anim = [116051,116059]) || (anim = [116061,116069])
trigger1 = SelfAnimExist(5100 + ((anim-111000) % 10))
value = 5100 + ((anim-111000) % 10)

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
type = changeState
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
value = 116110 ;HIT_LIEDOWN

[State 5100, 9]
type = HitFallDamage
trigger1 = Time = 3

[State 5100, 11]
type = PosFreeze
trigger1 = 1

[State 5100, 12]
type = ChangeState
trigger1 = AnimTime = 0
value = 116101

[State 5100, 13]
type = ForceFeedback
trigger1 = Time = 0
waveform = sinesquare
ampl = 128,-3,-.2,.005
time = 20

;---------------------------------------------------------------------------
; HIT_BOUNCE (bounce into air)
[Statedef 116101]
type    = L
movetype= H
physics = N

[State 0, DestroySelf]
type = DestroySelf
trigger1 = 1
ignorehitpause = 1

[State 5101, 1] ;Coming hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim != [5101,5109]
trigger2 = !SelfAnimExist(5160 + ((anim-111000) % 10))
value = 5160

[State 5101, 2] ;Coming hit ground anim (for hit up)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim = [5101,5109]
trigger1 = SelfAnimExist(5160 + ((anim-111000) % 10))
value = 5160 + ((anim-111000) % 10)

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
y = .4

[State 5101, 6] ;Hit ground
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 12
type = changeState
value = 116110

;---------------------------------------------------------------------------
; HIT_LIEDOWN
[Statedef 116110]
type    = L
movetype= H
physics = N

[State 0, DestroySelf]
type = DestroySelf
trigger1 = 1
ignorehitpause = 1

[State 5110, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 5110, 1] ;For hit up/up-diag type (from state 5081)
type = ChangeAnim
persistent = 0
trigger1 = SelfAnimExist(5110 + ((anim-111000) % 10))
trigger1 = anim = [116081,116089]
value = 5110 + ((anim-111000) % 10)

[State 5110, 2] ;Hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119] ;Not already changed anim
trigger1 = anim != [5161,5169]
trigger2 = !SelfAnimExist(5170 + ((anim-111000) % 10))
value = 5170

[State 5110, 3] ;Hit ground anim (for hit up)
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119] ;Not already changed anim
trigger1 = anim = [5161,5169]
trigger1 = SelfAnimExist(5170 + ((anim-111000) % 10))
value = 5170 + ((anim-111000) % 10)

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

[State 5110, 8]
type = VelSet
trigger1 = Time = 0
y = 0

[State 5110, 9] ;For hit up type
type = ChangeAnim
persistent = 0
triggerall = anim = [5171,5179]
triggerall = SelfAnimExist(5110 + ((anim-111000) % 10))
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground anim
value = 5110 + ((anim-111000) % 10)

[State 5110, 10] ;For normal
type = ChangeAnim
persistent = 0
triggerall = Anim != [5111,5119]
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
value = 5110

[State 5110, 11] ;If just died
type = SelfState
triggerall = !alive
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
trigger3 = Anim = [5110,5119]
value = 5150

[State 5110, 11] ;If just died
type = SelfState
triggerall = alive
trigger1 = time= 20;AnimTime = 0
;trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
;trigger3 = Anim = [116110,116119]
value = 5120

[State 5110, 12]
type = VarSet
trigger1 = SysVar(0)
trigger1 = Time = 0
sysvar(0) = 0

[State 5110, 13] ;Friction
type = VelMul
trigger1 = 1
x = 0.85

[State 5110, 14]
type = ForceFeedback
trigger1 = alive
trigger1 = Time = 0
time = 8
ampl = 240
waveform = sine

[State 5110, 15]
type = ForceFeedback
trigger1 = !alive
trigger1 = Time = 0
ampl = 200, 7, -.467
time = 30
waveform = sine

