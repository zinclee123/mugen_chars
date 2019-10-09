;変数使用表
;　1 = モード
;　2 = 
;　3 = 
;　4 = スロー処理
;　5 = ステート内自由変数１
;　6 = ステート内自由変数２
;　7 = 勝利イントロ判別
;　8 = カウンター
;　9 = 相手キャラクター判別
; 10 = プレイヤーの向き設定
; 11 = 暗転用変数
; 12 = KOサウンド
; 13 = 勝利判定
; 14 = 攻撃力
; 15 = ハイジャンプ
; 16 = 小ジャンプ
; 17 = ダメージ補正に使用
; 18 = 攻撃値の保存
; 19 = 
; 20 = MAX
; 21 = MAX発動中のパワーゲージ
; 22 = 技個別ダメージ補正１
; 23 = 技個別ダメージ補正２
; 24 = 変身使用後、モードチェンジ変数
; 25 = MAX2勝利判定
; 26 = ネバリ補正
;
; 30 = アレ１
; 31 = アレ２
; 32 = 特殊那義

; f(1) = 攻撃補正
; f(2) = 
; f(3) = 
; f(4) = 
; f(5) = MAX発動攻撃補正

; channel = 4	
; channel = 5	イントロ


[Data]
life = 1000
power = 5000
attack = 100
defence = 100
fall.defence_up = 50
liedown.time = 20
airjuggle = 15
sparkno = 2
guard.sparkno = 40
KO.echo = 0
volume = 255
IntPersistIndex = 0
FloatPersistIndex = 40

[Size]
xscale = 1           ;Horizontal scaling factor.
yscale = 1           ;Vertical scaling factor.
ground.back = 16     ;Player width (back, ground)
ground.front = 15    ;Player width (front, ground)
air.back = 15        ;Player width (back, air)
air.front = 15      ;Player width (front, air)
height = 79          ;Height of player (for opponent to jump over)
attack.dist = 160    ;Default attack distance
proj.attack.dist = 90 ;Default attack distance for projectiles
proj.doscale = 0     ;Set to 1 to scale projectiles too
head.pos = 17, -91   ;Approximate position of head
mid.pos = -5, -60    ;Approximate position of midsection
shadowoffset = 0     ;Number of pixels to vertically offset the shadow
draw.offset = 0,0    ;Player drawing offset in pixels (x, y)

[Velocity]
walk.fwd  = 2.4      ;Walk forward
walk.back = -2.4     ;Walk backward
run.fwd  = 5.9, 0    ;Run forward (x, y)
run.back = -9.0,-6.0 ;Hop backward (x, y)
jump.neu = 0,-9.4    ;Neutral jumping velocity (x, y)31
jump.back = -2.85    ;Jump back Speed (x, y)
jump.fwd = 3.5       ;Jump forward Speed (x, y)
runjump.back = -2.55,-8.1 ;Running jump speeds (opt)
runjump.fwd = 4,-8.1      ;.
airjump.neu = 0,-8.1      ;.
airjump.back = -2.55      ;Air jump speeds (opt)
airjump.fwd = 2.5         ;.

[Movement]
airjump.num = 0      ;Number of air jumps allowed (opt)
airjump.height = 35  ;Minimum distance from ground before you can air jump (opt)
yaccel = .53        ;Vertical acceleration34F
stand.friction = .85  ;Friction coefficient when standing
crouch.friction = .82 ;Friction coefficient when crouching

;---------------------------------------------------------------------------