; 教材用カンフーマン（ちょっとこ丸版）のコマンドファイルです。
; コマンドに関する設定は４部構成になっています。
;==============================================================================
; Win版専用パート
;==============================================================================
;------------------------------------------------------------------------------
; ここはWin版から（正確にはLinux版から）追加された要素の二つ。
; コマンド関連の初期設定を任意に指定出来るようになった(`・ω・´)
;
;『ボタンリマップ』はボタン配置変更用の項目。
; 定義パートでいちいち変更しなくても良いようになっちゃった。
; 面倒臭い人用かな！（ﾏﾃｺﾗ
;
;『デフォルト設定』では各[Command]で省略した場合の
; 入力受付時間と入力記憶時間を予め決めておく項目。
;
; この２項目は省略可能。
;------------------------------------------------------------------------------
;-| ボタンリマップ（ボタンコンフィグ）|---------------------------------------- 第１部

[Remap]
x = x      ;Ｘボタンの入力判定を実際に押すボタンに割り当てる。
y = y      ;Ｙボタン　　　　　　　　　〃
z = z      ;Ｚボタン　　　　　　　　　〃
a = a      ;Ａボタン　　　　　　　　　〃
b = b      ;Ｂボタン　　　　　　　　　〃
c = c      ;Ｃボタン　　　　　　　　　〃
s = s      ;スタートボタン　　　　　　〃

;------------------------------------------------------------------------------
; 例えば「本来Ｘボタンで出す弱パンチをＢボタンに変えたい場合」なら、
;
; x = b
;
; で簡単に出来る。使わないボタンを使っているボタンに割り当てる事も可能。
;------------------------------------------------------------------------------
;-| デフォルト設定 |----------------------------------------------------------- 第２部

[Defaults]
command.time = 15  ;標準のコマンド入力受付時間。
                   ;各コマンドで省略している場合に有効。
                   ;このパラメータを消した場合、デフォルトは１フレームになる。
                   ;（　M.U.G.E.Nでの１フレーム　＝　１／６０秒　）

command.buffer.time = 1  ;標準のコマンド入力記憶時間。
                         ;入力した直後にコマンドを記憶し、
                         ;指を離してもコマンドが成功している状態を
                         ;ここで設定した時間の分維持する。
                         ;１～３０フレームまでの間で設定可能。
                         ;デフォルトは１フレーム。

;============================================================================== 第３部
; コマンド定義パート（入力キーを設定する）
;==============================================================================
;------------------------------------------------------------------------------
; ここがキーとボタンの組み合わせで格闘ゲームにおける
;『入力コマンド』を直接設定・編集するパート。
;
; 一つずつコマンドに名前を付けて入力キーを組み合わせる単純な作業になるけど、
; 組み合わせが独特だから覚えるのは難易度が少し高い。
;
; 下記で「書式の決まり」と「組み合わせに必要なアルファベットと記号」を
; 全て説明しましょう。
;------------------------------------------------------------------------------
;■書式の決まり■
;
; [Command]         ：入力コマンドを１個定義する。
; name = "***"      ：コマンド名を決める。大文字と小文字も区別される。
; command = ###     ：実際に入力するキーを組み合わせる。詳細は後述。
; time = &&&        ：入力受付時間を設定（オプション）。
; buffer.time = @@@ ：入力記憶時間を設定（オプション）。
;
; 小ネタでも説明している通り、登録が可能な数は最大『１２８個』まで。
;
;
;※『必須コマンド名』と書いてるコマンドは、システム側で処理してます。
;　コマンド名を変えたり、消してはいけません。キーの変更は出来ます。
;------------------------------------------------------------------------------
;■必要なアルファベットと記号■
;
; 上記の「command = ###」の『###』に該当する部分で、
; 組み合わせるキーとボタンを設定しなければならない。
;
; ※設定したキーやボタンはM.U.G.E.Nのオプションモードにある
;  「キーコンフィグ」にて設定したキーなどに対応しています。
;
; ★方向キー★（全て必ず大文字で）
;
; 　B 　：「後方」にキーを入れる（ Backward ）
; 　D 　：「下方」にキーを入れる（ Downward ）
; 　F 　：「前方」にキーを入れる（ Forward ）
; 　U 　：「上方」にキーを入れる（ Upward ）
;
; 　DB　：「後ろ斜め下」にキーを入れる（「D」と「B」が同時に入力された事を認識）
; 　UB　：「後ろ斜め上」にキーを入れる（「U」と「B」が同時に入力された事を認識）
; 　DF　：「前斜め下」にキーを入れる（「D」と「F」が同時に入力された事を認識）
; 　UF　：「前斜め上」にキーを入れる（「U」と「F」が同時に入力された事を認識）
;
; ★ボタン★（全て必ず小文字で）
;
; 　a 　：「Ａボタン」を押す
; 　b 　：「Ｂボタン」を押す
; 　c 　：「Ｃボタン」を押す
; 　x 　：「Ｘボタン」を押す
; 　y 　：「Ｙボタン」を押す
; 　z 　：「Ｚボタン」を押す
; 　s 　：「スタートボタン」を押す
;
; ★記号★（入力効果を変化させる命令）
;
; 　/ 　：（スラッシュ）キーやボタンを「押しっぱなし」にしている事を認識する場合に追加する
;
; 　　（例）：　/b       = Ｂボタンを押したままにする
; 　　　　　　　/F       = 前キーを押したままにする
; 　　　　　　　/U,z     = 上キーを押したままＺボタンを入力する
;
;　　━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;
; 　~ 　：（チルダ）キーやボタンが「離された時」を認識する場合に追加する
;
; 　　（例）：　~x       = Ｘボタンを離す
; 　　　　　　　~DF      =「前斜め下」のキーを離す
; 　　　　　　　~DB,F,c  =「後ろ斜め下」を離した後に前キー・Ｃボタンの順番に入力する
;
; 　　　　　　※「ボタンを離すまでの時間（溜め時間）」も設定する事が出来る
;
; 　　　　　　　~30x     = Ｘボタンを押したままにして、３０フレーム以上経ったら離す
; 　　　　　　　~50B,F,a = 後ろキーを５０フレームまで溜めて前キー・Ａボタンの順番に入力する
;
;　　━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;
; 　$ 　：（ドル）方向キーの「複数の内どれかが入力されている事」を認識する場合に追加する
;
; 　　（例）：　$B       =「後方」「後ろ斜め下」「後ろ斜め上」のどれかが入力されている状態
; 　　　　　　　$UF      =「前」「上」「前斜め上」のどれかが入力されている状態
;
; 　　　　　　※この記号は「方向キー」でしか使えません。
;
;　　━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;
; 　+ 　：（プラス）ボタンを「同時押し」している事を認識する場合に追加する
;
; 　　（例）：　x+y      = ＸボタンとＹボタンを同時押しする
; 　　　　　　　a+b+c    = ＡボタンとＢボタンとＣボタンを同時押しする
;
; 　　　　　　※この記号は「ボタン」でしか使えません。
;
;　　━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;
; 　> 　：（グレーターザン）大なり（Win版で追加された記号）
; 　　　　　　　　　　　　「他のキーが入力されていない事を確認して、そのキーを押す」場合
;
; 　　（例）：　a,>~a    = Ａボタン以外が入力されていない状態でＡボタンを離す
; 　　　　　　　F,>~F,>F = 前キー以外が入力されていない状態で前キーを離し、
;　　　　　　　　　　　　　もう一度前キーを入力する
;
;-------------------------------------------------------------------------------
; ●これらの記号は全て組み合わせて使う事が出来る●
;
; 　　（例）：　~80$DB,DF,F,/a+y+c
; 　　　　　　　
; 　　　　　　「後方」「下」「後ろ斜め下」のどれかを８０フレームまで溜めて
; 　　　　　　「前斜め下」→「前」を入力した後、ＡとＹとＣを同時押ししたままにする
;
;------------------------------------------------------------------------------
;-| ＡＩ発動用コマンド |-------------------------------------------------------

;※ＣＰＵに『人間には入力出来ないコマンド』を入力させる事で、
;　『擬似ＡＩプログラム』を発動させるようにするテクニック。
;　発動確率はまさにランダムなので、運任せ。

[Command]
name = "AI-000"
command = ~F,a,~D,y,~U,c+x,D,b+y,F,z,z,z+a
time = 1

[Command]
name = "AI-001"
command = ~F,c,~D,y,~U,c+a,D,b+x,B,z,z,z+b
time = 1

[Command]
name = "AI-002"
command = ~F,y,~D,y,~U,c+y,D,b+z,F,z,z,z+c
time = 1

[Command]
name = "AI-003"
command = ~F,b,~D,y,~U,c+b,D,b+a,B,z,z,z+x
time = 1

[Command]
name = "AI-004"
command = ~F,x,~D,x,~U,c+x,D,b+y,F,z,z,z+y
time = 1

[Command]
name = "AI-005"
command = ~F,z,~D,y,~U,c+a,D,b+c,B,z,z,z+a
time = 1

[Command]
name = "AI-006"
command = ~D,U,x+y+z,~F,F,b,c,y,B,~B,a+b+c,U
time = 1

[Command]
name = "AI-007"
command = ~U,D,x+b+z,~F,F,b,b,x,B,~B,a+y+c,F
time = 1

[Command]
name = "AI-008"
command = ~D,U,a+y+c,~F,F,b,a,z,B,~B,x+b+z,D
time = 1

[Command]
name = "AI-009"
command = ~U,D,x+b+c,~F,F,b,c,x,B,~B,a+y+z,B
time = 1

[Command]
name = "AI-010"
command = ~x,~y,~z,~a,~b,~c,~s,a+b+c,x+y+z,~F,B
time = 1

;***********************************
[Command]
name = "AI-011"
command = F,D,F
time = 0

[Command]
name = "AI-012"
command = B,F,B
time = 0

[Command]
name = "AI-013"
command = U,B,U
time = 0

[Command]
name = "AI-014"
command = D,U,D
time = 0

;***********************************
[Command]
name = "AI-015"
command = a,s,a
time = 0

[Command]
name = "AI-016"
command = b,a,b
time = 0

[Command]
name = "AI-017"
command = c,b,c
time = 0

[Command]
name = "AI-018"
command = x,c,x
time = 0

[Command]
name = "AI-019"
command = y,x,y
time = 0

[Command]
name = "AI-020"
command = z,y,z
time = 0

[Command]
name = "AI-021"
command = s,z,s
time = 0

;------------------------------------------------------------------------------
;-| スーパーアーツ |-----------------------------------------------------------

;※名前が同じならば、違うコマンドでも同じステートの技を出す事が可能。
;***********************************
;猛獣の連撃
[Command]
name = "rengeki"
command = ~D,F,D,B,y
time = 25

;***********************************
;瞬獄
[Command]
name = "syungoku"
command = ~D,B,D,B,y
time = 25
;***********************************
;踵落し
[Command]
name = "kakato"
command = ~D,F,D,F,b
time = 25

;***********************************
;邪ッチェリアアアッ
[Command]
name = "jya"
command = ~D,F,D,F,y
time = 25

;***********************************
;ドレス
[Command]
name = "do"
command = ~D,F,D,F,x
time = 25

;***********************************
;悪魔に授かった筋肉でただ思いきりブン殴る
[Command]
name = "fatality"
command = ~D,F,D,F,x+y
time = 25

;------------------------------------------------------------------------------
;-| 必殺技 |-------------------------------------------------------------------
;***********************************
;ジェノサイドカッター
[Command]
name = "sinsain"
command = ~D,DF,F,b
;***********************************
;なんていい女なんだ・・・
[Command]
name = "bearhug"
command = ~F,D,B,x
;***********************************
;鼓膜破壊
[Command]
name = "parn"
command = ~D,D,y
;***********************************
;波動拳＆斬空波動拳
[Command]
name = "unsou"
command = ~D,DF,F,y

;***********************************
;突進
[Command]
name = "blow"
command = ~D,DB,B,y

;------------------------------------------------------------------------------
;-| 特殊技 |------------------------------------------------------------------

;***********************************
;ブロッキング
[Command]
name = "blocking-000"
command = F
time = 1

[Command]
name = "blocking-001"
command = /F
time = 1

[Command];クイックスタンディングと共用
name = "blocking-002"
command = D
time = 1

[Command]
name = "blocking-003"
command = /D
time = 1

;***********************************
;勝利メッセージ用
[Command]
name = "hold_s"
command = /s

;消力
[Command]
name = "syaori"
command = B,z
time = 1

;------------------------------------------------------------------------------
;-| キー２回連続入力 |---------------------------------------------------------

[Command]
name = "FF"       ;必須コマンド名
command = F,F
time = 10

[Command]
name = "BB"       ;必須コマンド名
command = B,B
time = 10

;------------------------------------------------------------------------------
;-| 同時押し |-----------------------------------------------------------------

[Command]
name = "recovery" ;必須コマンド名
command = a+b
time = 1

[Command]
name = "recovery" ;必須コマンド名
command = x+y
time = 1

;------------------------------------------------------------------------------
;-| 方向キー＋ボタン |---------------------------------------------------------


[Command]
name = "fwd_x"
command = /F,x

[Command]
name = "fwd_b"
command = /F,b

[Command]
name = "back_y"
command = /B,y

;------------------------------------------------------------------------------
;-| ボタン単発 |---------------------------------------------------------------

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

;------------------------------------------------------------------------------
;-| 方向キー |-----------------------------------------------------------------

[Command]
name = "holdfwd"   ;必須コマンド名
command = /$F
time = 1

[Command]
name = "holdback"  ;必須コマンド名
command = /$B
time = 1

[Command]
name = "holdup"    ;必須コマンド名
command = /$U
time = 1

[Command]
name = "holddown"  ;必須コマンド名
command = /$D
time = 1

;============================================================================== 第４部
; ステートエントリーパート（技などを出せるようにするための条件を設定）
;==============================================================================
;------------------------------------------------------------------------------
; コマンド名と入力するコマンドを設定しただけじゃ意味が無いので、ここから
;「実際に入力したコマンドでどの番号のステートをどういう条件で出せるか」
; を決めなければならない。
;
; ステートコントローラ「ChangeState」しか使わないけど、
; そんなに難しくないのでトリガーを覚えてたらすぐ出来る。
;
; ここさえ押さえておけば簡単なトリガー設定の流れは覚えられるかと。
;
; エントリーの順番にはある程度の法則があるけど、
; おまけフォルダの「小ネタ.txt」を参照。（波動拳が暴発ﾅﾝﾀﾗｶﾝﾀﾗ）
;
; ChangeStateなどステートコントローラの基本的な設置例は
; おまけフォルダの「テンプレート.txt」を参照。
;------------------------------------------------------------------------------
; ■準常時監視ステート（－１）■
; コマンドファイル（のステートエントリーパート）に必要な項目です。
; 絶対に消してはいけないので要注意。
;
; 通常の食らい状態以外の「P2StateNo」や「TargetState」等で制御された、
; 作成者が任意に指定した相手側の食らいステートに限り、
; 登録したステートコントローラが有効にはなりません。
;------------------------------------------------------------------------------

[Statedef -1] ;←この行は絶対に消さないでね。必須項目です。

;==============================================================================
; スーパーアーツ
;==============================================================================
;------------------------------------------------------------------------------

[State -1, 悪魔に授かった筋肉でただ思いきりブン殴る]
type = ChangeState
triggerall = (command = "fatality")
triggerall = (Power > 2999)
triggerall = (StateType != A)
trigger1 = (palno = [7,12]) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
trigger2 = (palno = [7,12])
trigger3 = (palno = [1,6]) && (Ctrl) && (life < ((lifemax)/2))
trigger4 = (StateNo = 1011) && (time > 6)
trigger4 = (life < ((lifemax)/2))
trigger4 = (palno = [1,6])
value = 3580

[State -1, 瞬獄殺]
type = ChangeState
triggerall = (command = "syungoku")
triggerall = (Power > 1999)
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 3500

;------------------------------------------------------------------------------

[State -1,猛獣の連撃]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "rengeki")
triggerall = (StateType != A)
triggerall = (Power > 1999)
trigger1 = (Ctrl) && (Pos Y >= 0)
trigger2 = (StateNo = 1011) && (time > 6)
value = 2014

[State -1,邪ッチェリアアアッ]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "jya")
triggerall = (StateType != A)
triggerall = (Power > 999)
trigger1 = (Ctrl) && (Pos Y >= 0)
trigger2 = (StateNo = 1011) && (time > 6)
value = 2015

[State -1,ドレス]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "do")
triggerall = (StateType != A)
triggerall = (Power > 999)
trigger1 = (Ctrl) && (Pos Y >= 0)
trigger2 = (StateNo = 1011) && (time > 6)
value = 2226

[State -1,踵落し]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "kakato")
triggerall = (Power > 999)
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 1005

[State -1,死体殴り]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "jya")
triggerall = (Power > 1999)
trigger1 = (StateNo = 1006) && (MoveContact); && (animelem = 7) 
value = 1600

;==============================================================================
; 必殺技
;==============================================================================
;------------------------------------------------------------------------------

[State -1, 瞬間移動]
type = ChangeState
triggerall = (command = "z")
triggerall = (Ctrl)
trigger1 = (StateType != A) && (Stateno != 20)
value = 1011

;------------------------------------------------------------------------------

[State -1, ジェノサイド]
type = ChangeState
triggerall = (command = "sinsain")
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 1002

[State -1, 運送]
type = ChangeState
triggerall = (command = "unsou")
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 1000

[State -1, 鼓膜破壊]
type = ChangeState
triggerall = (command = "parn") && (var(35) <= 0)
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 1009

[State -1, ベアハッグ]
type = ChangeState
triggerall = (command = "bearhug") && (var(35) <= 0)
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 2003
;------------------------------------------------------------------------------


[State -1, カンフーブロー・改]
type = ChangeState
triggerall = (command = "blow")
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 1007

;==============================================================================
; 特殊技
;==============================================================================
;------------------------------------------------------------------------------

[State -1, カンフースルー・改]
type = ChangeState
triggerall = (command = "y")
triggerall = (StateNo != 100)
triggerall = (StateNo != 101)
triggerall = (StateNo != 106)
;地上投げ
triggerall = (command = "holdfwd")
triggerall = (StateType != A)
triggerall = (P2BodyDist X < 30)
triggerall = (P2StateType != A)
triggerall = (P2MoveType != H)
trigger1 = (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 800

;※「trigger*」も条件の付け方によって何個でも増やせる。

[State -1, うどぅんでい]
type = ChangeState
triggerall = (command = "z")
trigger1 = (StateType != A) && (Stateno = 20)
value = 2002

[State -1,消力]
type = ChangeState
triggerall = (palno = [7,12])
triggerall = (Power > 999)
triggerall = (command = "syaori")
triggerall = (animtime < 2)
triggerall = (roundstate = 2)
triggerall = (var(21) = 0)
trigger1 = (movetype = H)
trigger2 = (StateNo = [150,153])
value = 2502

[State -1, どけ]
type = ChangeState
triggerall = (palno = [7,12])
triggerall = (Power > 999)
triggerall = (command = "z")
triggerall = (roundstate = 2)
trigger1 = (StateType != A) && (movetype = H)
trigger2 = (StateType != A)
trigger2 = (StateNo = [150,153])
value = 2501

;------------------------------------------------------------------------------

;==============================================================================
; 移動関連
;==============================================================================
;------------------------------------------------------------------------------

[State -1, 走る]
type = ChangeState
triggerall = (StateNo != 100)
trigger1 = (command = "FF") && (StateType = S) && (Ctrl)
value = 100

[State -1, バックステップ]
type = ChangeState
triggerall = (StateNo != 100)
trigger1 = (command = "BB") && (StateType = S) && (Ctrl)
value = 105
;==============================================================================
; 通常攻撃技
;==============================================================================
;------------------------------------------------------------------------------
[State -1, チョップ]
type = ChangeState
triggerall = (command = "back_y") && (command != "holddown")
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 270


[State -1, 立ち強パンチ]
type = ChangeState
triggerall = (command = "fwd_x") && (command != "holddown")
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 210


[State -1, 立ち弱パンチ]
type = ChangeState
triggerall = (command = "x") && (command != "holddown")
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
trigger3 = (StateNo = 200) && (time > 8)
trigger4 = (StateNo = 200) && (MoveContact)
value = 200

[State -1, 強パンチ]
type = ChangeState
triggerall = (command = "y") && (command != "holddown")
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 250

[State -1, 立ち弱キック]
type = ChangeState
triggerall = (command = "a") && (command != "holddown")
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 230


[State -1, 立ち強キック]
type = ChangeState
triggerall = (command = "fwd_b") && (command != "holddown")
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 240


[State -1, ハイキック]
type = ChangeState
triggerall = (command = "b") && (command != "holddown")
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 260


;------------------------------------------------------------------------------

[State -1, しゃがみ弱パンチ]
type = ChangeState
triggerall = (command = "x") && (command = "holddown")
trigger1 = (StateType = C) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 400

[State -1, しゃがみ強パンチ]
type = ChangeState
triggerall = (command = "y") && (command = "holddown")
trigger1 = (StateType = C) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 410

[State -1, しゃがみ弱キック]
type = ChangeState
triggerall = (command = "a") && (command = "holddown")
trigger1 = (StateType = C) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 430

[State -1, しゃがみ強キック]
type = ChangeState
triggerall = (command = "b") && (command = "holddown")
trigger1 = (StateType = C) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 440

;------------------------------------------------------------------------------

[State -1, ジャンプ弱パンチ]
type = ChangeState
triggerall = (command = "x")
trigger1 = (StateType = A) && (Ctrl)
value = 600

[State -1, ジャンプ強パンチ]
type = ChangeState
triggerall = (command = "y")
trigger1 = (StateType = A) && (Ctrl)
value = 1090

[State -1, ジャンプ弱キック]
type = ChangeState
triggerall = (command = "a")
trigger1 = (StateType = A) && (Ctrl)
value = 630

[State -1, ジャンプ強キック]
type = ChangeState
triggerall = (command = "b")
trigger1 = (StateType = A) && (Ctrl)
value = 640

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
