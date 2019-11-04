
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s


;-| Deafauls |------------------------------------------------------------------
[Defaults]
command.time = 15
command.buffer.time = 1
;-------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;-| リ???超必殺技 |----------------------------------------------------------

[Command]
name = "MAX2最終決戦奥?・零式"
command = ~D, DF, F, D, DF, F, c
time = 25
buffer.time = 6

[command]
name = "Destruction Extincion"
command = ~D,F,D,F,a+b
time = 25
buffer.time = 6

[Command]
name = "最終決戦奥?・零式"
command = ~D, DF, F, D, DF, F, x+y
time = 25
buffer.time = 6

[Command]
name = "3560"
command = ~D, DB, B, D, DB, B, a+b
time = 25

[Command]
name = "3100"
command = ~D, DB, B, D, DB, B, x+y
time = 25

;------------------------------------------------------------------------------
;-| MAX超必殺技 |--------------------------------------------------------------

[Command]
name = "MAX裏百八式・大蛇薙"
command = ~D, DB, B, DB, D, DF, F, x+y
time = 25
buffer.time = 6

[Command]
name = "MAX裏百八式・大蛇薙"
command = ~DB, DF, c
time = 25
buffer.time = 6

;------------------------------------------------------------------------------
;-| 超必殺技 |-----------------------------------------------------------------

[Command]
name = "裏百八式・大蛇薙"
command = ~DB, DF, x
time = 25
buffer.time = 6

[Command]
name = "裏百八式・大蛇薙2"
command = ~DB, DF, y
time = 25
buffer.time = 6

[Command]
name = "千九百九拾九式・霧焔"
command = ~D, DF, F, D, DF, F, a
time = 25
buffer.time = 6

[Command]
name = "千九百九拾九式・霧焔"
command = ~D, DF, F, D, DF, F, b
time = 25
buffer.time = 6

[Command]
name = "百八拾弐式"
command = ~D, DF, F, D, DF, F, x
time = 25
buffer.time = 6

[Command]
name = "百八拾弐式2"
command = ~D, DF, F, D, DF, F, y
time = 25
buffer.time = 6

;------------------------------------------------------------------------------
;-| 必殺技 |-------------------------------------------------------------------

[Command]
name = "EX・琴月?陽"
command = ~D,B, a+b
time = 25
buffer.time = 6

[Command]
name = "EX七拾五式・改"
command = ~D, DF, F, a+b
buffer.time = 6

[Command]
name = "EX朧車"
command = ~B,D,B, a+b
time = 25
buffer.time = 6

[Command]
name = "EX暗仏"
command = ~D,F, x+y
time = 25
buffer.time = 6

[Command]
name = "弱弐百拾弐式・琴月?陽"
command = ~D,B, a
time = 25
buffer.time = 6

[Command]
name = "強弐百拾弐式・琴月?陽"
command = ~D,B, b
time = 25
buffer.time = 6

[Command]
name = "百弐拾七式・八錆"
command = ~D,B,F, x
time = 25
buffer.time = 6

[Command]
name = "百弐拾七式・八錆"
command = ~D,B,F,y
time = 25
buffer.time = 6

[Command]
name = "弱百壱式・朧車"
command = ~B, D, DB, a
buffer.time = 6

[Command]
name = "強百壱式・朧車"
command = ~B, D, DB, b
buffer.time = 6

[Command]
name = "EX鬼焼き"
command = ~F, D, DF, x+y
buffer.time = 6

[Command]
name = "弱百式・鬼焼き"
command = ~F, D, DF, x
buffer.time = 6

[Command]
name = "強百式・鬼焼き"
command = ~F, D, DF, y
buffer.time = 6

[Command]
name = "弱九百拾式・?摘み"
command = ~D, DB, B, x
buffer.time = 6

[Command]
name = "強九百拾式・?摘み"
command = ~D, DB, B, y
buffer.time = 6

[Command]
name = "弱七拾五式・改"
command = ~D, DF, F, a
buffer.time = 6

[Command]
name = "強七拾五式・改"
command = ~D, DF, F, b
buffer.time = 6

[Command]
name = "弱百八式・闇払い"
command = ~D, DF, F, x
buffer.time = 6

[Command]
name = "強百八式・闇払い"
command = ~D, DF, F, y
buffer.time = 6

[Command]
name = "jump"    
command = D, $U
time = 12

;------------------------------------------------------------------------------
;-| キ?２回連続入力 |---------------------------------------------------------
[Command]
name = "FF"
command = F, F
time = 14
buffer.time = 8

[Command]
name = "BB"
command = B, B
time = 14
buffer.time = 8
;------------------------------------------------------------------------------
;-| 同時押し |-----------------------------------------------------------------
[Command]
name = "recovery"   ;要求済み (キ?の変更は可?ですが名前を変えたり無効にしてはいけません)
command = x+a
time = 1
buffer.time = 6

[Command]
name = "recovery"   ;要求済み (キ?の変更は可?ですが名前を変えたり無効にしてはいけません)
command = z
time = 1
buffer.time = 6

[Command]
name = "ふっとばし"
command = y+b
time = 1

[Command]
name = "ふっとばし"
command = c
time = 1

[Command]
name = "x+y"
command = x+y
time = 1

[Command]
name = "a+b"
command = a+b
time = 1

;------------------------------------------------------------------------------
;-| 方向キ????ン |---------------------------------------------------------

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;------------------------------------------------------------------------------
;-| ??ン単発 |---------------------------------------------------------------
[Command]
name = "a"
command = a
time = 1
buffer.time = 3

[Command]
name = "b"
command = b
time = 1
buffer.time = 3

[Command]
name = "c"
command = c
time = 1
buffer.time = 3

[Command]
name = "x"
command = x
time = 1
buffer.time = 3

[Command]
name = "y"
command = y
time = 1
buffer.time = 3

[Command]
name = "z"
command = z
time = 1
buffer.time = 3

[Command]
name = "start"
command = s
time = 1

;------------------------------------------------------------------------------
;-| 方向キ?押しっぱなし |-----------------------------------------------------
[Command]
name = "holdfwd"   ;要求済み (キ?の変更は可?ですが名前を変えたり無効にしてはいけません)
command = /$F
time = 1

[Command]
name = "holdback"  ;要求済み (キ?の変更は可?ですが名前を変えたり無効にしてはいけません)
command = /$B
time = 1

[Command]
name = "holdup"    ;要求済み (キ?の変更は可?ですが名前を変えたり無効にしてはいけません)
command = /$U
time = 1

[Command]
name = "holddown"  ;要求済み (キ?の変更は可?ですが名前を変えたり無効にしてはいけません)
command = /$D
time = 1

[Command]
name = "holdxy"
command = /$x+y
time = 1

[Command]
name = "holdc"
command = /$c
time = 1

[Command]
name = "holdx"
command = /$x
time = 1

[Command]
name = "holdy"
command = /$y
time = 1

[Command]
name = "holda"
command = /$a
time = 1

[Command]
name = "holdb"
command = /$b
time = 1

[Command]
name = "holdc"
command = /$c
time = 1

[Command]
name = "holdz"
command = /$z
time = 1
;------------------------------------------------------------------------------
;==============================================================================
; 技を実行するための条件の設定（ステ?トエントリ?パ?ト）
;==============================================================================
;------------------------------------------------------------------------------
; ここから下は「どのコ?ンドでどの番号のステ?トをどういう条件で出せるか」を設定する場所です。
;（ステ?トに関してはCNSフ?イルを参照）
; 
;■設定は基?的にこの?になります。
;
; [State -1, Label]                  ;「Label」の部分はただのラベルです。何でも良いです。それ以外は変更不可。
; type = ChangeState                 ;「別のステ?トに変更する」という意味のステ?トコントロ?ラ
; value = new_state_number           ;出したい技のステ?ト番号を入れます
; trigger1 = command = command_name  ;入力キ?設定パ?トで登?したコ?ンドの名前をどれか入れます
; . . .  (any additional triggers)   ;trigger（条件を指定するトリガ?）を追加出来ます
;
;■triggerに使える基?的な条件（通常は「トリガ?」と呼ばれています）
;
;   - StateType    - キャラク??がどの状態の時にそのステ?トを出せるかどうかを決められます。
;                    S=立った状態・C=座った状態・A=空中にいる状態・L=横に?れた状態、の４つが決まり事です。
;                    CNSのStatedefの下にある「Type = *」の?目が状態の意味なので、これをこのトリガ?で判断します。
;
;   - Ctrl         - コントロ?ルが可?か不可?かどちらかの時にそのステ?トを出せるかどうかを決められます。
;                    0=コントロ?ル不可?状態・1=コントロ?ル可?状態、ですが通常は Ctrl = 1 ( = 1 省略可?)が基?。
;
;   - StateNo      - 別の番号のステ?トから出せる事が可?になります。
;                    これを応用してス?パ?キャンセルも可?です。
;
;   - MoveContact  - 物理攻撃が相手に当たった時（攻撃がヒットした時、もしくはガ?ドされた時）に、
;                    そのステ?トを出せるかどうかを決められます。２種類４パ??ンあります。
;                    MoveContact or MoveContact = 1  （攻撃が当たった時）
;                    !MoveContact or MoveContact = 0 （攻撃が当たってない時）
;                    これを応用してス?パ?キャンセルも可?です。
;
;?※上の４つ以外にもありますが、他のトリガ?はM.U.G.E.N?体docsフォル?の中の
;??CNSドキュメンテ?ションを参照してください。
;
;■ステ?トエントリ?の順序
;
; ChangeStateの登?の順番は重要です。上に来れば来るほどコ?ンド入力の優先度が高くなります。
;
; 引用になりますが、例えば「波動拳コ?ンドのChangeState（↓?→?パン?）」を
;「昇龍拳コ?ンドのChangeState（→↓??パン?）」よりも上に登?した場合、
; ゲ??中では昇龍拳を出そうとしても波動拳が誤って?発しやすくなってしまいます。
; 防?するためには、「波動拳のChangeState」を「昇龍拳のChangeState」よりも下に登?しなくてはなりません。
;「レバ?を前に入れて出す特殊技」と「投げ技」の関係なども同様です。
;
; 順番をよく考えて登?しましょう。
;
;■AI(CPU)はどう動くのか
;MUGENの標?CPUは相手に近づき適当に攻撃を繰り出すだけなので、AIスイッ?による制御が必要なこともあります。
;
;■[Statedef -1]とは？
;
; この部分はCNSプログラ?ングの拡張部分の、常時監視ステ?トになります。
; どのいかなる状態でも設定した記述が常に有効になるステ?トです（CNSの[Statedef -2]と似たような部分）。
;
; 必要な記述と行なので、絶対に消さないでください。
;
;==============================================================================
;------------------------------------------------------------------------------

[Statedef -1];←この行は絶対に消さないでください。必?の?目です。

[State -1,test]
type = ChangeState
value = 3100
trigger1 = var(59) = 0
;trigger1 = ctrl
triggerall = StateType != A
trigger1 = command = "start"
;trigger1 = var(4) := 1

;?焉-??
[State -1, ZEROSHIKI]
type = ChangeState
value = 2700
triggerall = var(59) = 0
triggerall = command = "Destruction Extincion"
triggerall = power >= 3000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 210
trigger4 = stateno = 215 && movecontact && time = [0,15]
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact && time = [0,6]
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact && time = [0,11]
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 440
trigger11 = stateno = 315 && movecontact && time = [22,27]
trigger12 = stateno = 1155 && AnimElemtime(1) >= 0 && AnimElemtime(2) < 0 && movecontact
trigger13 = stateno = 1405 && AnimElemtime(4) >= 0 && AnimElemtime(5) < 0 && movecontact
trigger14 = stateno = 1900 && AnimElemtime(4) >= 0 && AnimElemtime(6) < 0 && movecontact
trigger15 = stateno = 1950 && AnimElemtime(4) >= 0 && AnimElemtime(6) < 0 && movecontact
trigger16 = stateno = 1905 && AnimElemtime(1) >= 0 && AnimElemtime(5) < 0 && movecontact
trigger17 = stateno = 320 && AnimElemtime(2) >= 0 && AnimElemtime(4) < 0  && movecontact
trigger18 = stateno = 100
trigger19 = stateno = 1460 && movecontact
trigger20 = stateno = 2305 && movecontact
trigger21 = stateno = 2110 && AnimElemtime(7) >= 0 && AnimElemtime(11) < 0 && movecontact
trigger22 = stateno = 2111 && AnimElemtime(7) >= 0 && AnimElemtime(11) < 0 && movecontact
trigger23 = stateno = 2112 && AnimElemtime(7) >= 0 && AnimElemtime(11) < 0 && movecontact
trigger24 = stateno = 2305
trigger25 = stateno = 3110
;==============================================================================
;裏九拾九式・白矢
[State -1, SHIRAYA]
type = ChangeState
value = 3100
triggerall = var(59) = 0
triggerall = command = "3100"
triggerall = power >= 2000
triggerall = var(5) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 210
trigger4 = stateno = 215 && movecontact && time = [0,15]
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact && time = [0,6]
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact && time = [0,11]
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 440
trigger11 = stateno = 315 && movecontact && time = [22,27]
trigger12 = stateno = 1155 && AnimElemtime(1) >= 0 && AnimElemtime(2) < 0 && movecontact
trigger13 = stateno = 1405 && AnimElemtime(4) >= 0 && AnimElemtime(5) < 0 && movecontact
trigger14 = stateno = 1900 && AnimElemtime(4) >= 0 && AnimElemtime(6) < 0 && movecontact
trigger15 = stateno = 1950 && AnimElemtime(4) >= 0 && AnimElemtime(6) < 0 && movecontact
trigger16 = stateno = 1905 && AnimElemtime(1) >= 0 && AnimElemtime(5) < 0 && movecontact
trigger17 = stateno = 2110 && AnimElemtime(7) >= 0 && AnimElemtime(11) < 0 && movecontact
trigger18 = stateno = 2111 && AnimElemtime(7) >= 0 && AnimElemtime(11) < 0 && movecontact
trigger19 = stateno = 2112 && AnimElemtime(7) >= 0 && AnimElemtime(11) < 0 && movecontact
trigger20 = stateno = 2200 && AnimElemtime(21) >= 0 && AnimElemtime(23) < 0 && movecontact
trigger21 = stateno = 320 && AnimElemtime(2) >= 0 && AnimElemtime(4) < 0  && movecontact
trigger22 = stateno = 100
trigger23 = stateno = 1460 && movecontact
trigger24 = stateno = 2315 && movecontact
trigger25 = stateno = 2305
 
;------------------------------------------------------------------------------
;裏九拾九式・白矢
[State -1, SHIRAYA]
type = ChangeState
value = 3560
triggerall = var(59) = 0
triggerall = command = "3560"
triggerall = power >= 2000
triggerall = var(5) = 0
triggerall = var(21)
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 210
trigger4 = stateno = 215 && movecontact && time = [0,15]
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact && time = [0,6]
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact && time = [0,11]
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 440
trigger11 = stateno = 315 && movecontact && time = [22,27]
trigger12 = stateno = 1155 && AnimElemtime(1) >= 0 && AnimElemtime(2) < 0 && movecontact
trigger13 = stateno = 1405 && AnimElemtime(4) >= 0 && AnimElemtime(5) < 0 && movecontact
trigger14 = stateno = 1900 && AnimElemtime(4) >= 0 && AnimElemtime(6) < 0 && movecontact
trigger15 = stateno = 1950 && AnimElemtime(4) >= 0 && AnimElemtime(6) < 0 && movecontact
trigger16 = stateno = 1905 && AnimElemtime(1) >= 0 && AnimElemtime(5) < 0 && movecontact
trigger17 = stateno = 2110 && AnimElemtime(7) >= 0 && AnimElemtime(11) < 0 && movecontact
trigger18 = stateno = 2111 && AnimElemtime(7) >= 0 && AnimElemtime(11) < 0 && movecontact
trigger19 = stateno = 2112 && AnimElemtime(7) >= 0 && AnimElemtime(11) < 0 && movecontact
trigger20 = stateno = 2200 && AnimElemtime(21) >= 0 && AnimElemtime(23) < 0 && movecontact
trigger21 = stateno = 320 && AnimElemtime(2) >= 0 && AnimElemtime(4) < 0  && movecontact
trigger22 = stateno = 100
trigger23 = stateno = 1460 && movecontact
trigger24 = stateno = 2315 && movecontact
trigger25 = stateno = 2305
 
;------------------------------------------------------------------------------
;千九百九拾九式・霧焔
[State -1, 1999]
type = ChangeState
value = 2300
triggerall = var(59) = 0
triggerall = command = "千九百九拾九式・霧焔"
triggerall = power >= 1000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 210
trigger4 = stateno = 215 && movecontact && time = [0,15]
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact && time = [0,6]
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact && time = [0,11]
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 440
trigger11 = stateno = 315 && movecontact && time = [22,27]
trigger12 = stateno = 1155 && AnimElemtime(1) >= 0 && AnimElemtime(2) < 0 && movecontact
trigger13 = stateno = 1405 && AnimElemtime(4) >= 0 && AnimElemtime(5) < 0 && movecontact
trigger14 = stateno = 1900 && AnimElemtime(4) >= 0 && AnimElemtime(6) < 0 && movecontact
trigger15 = stateno = 1950 && AnimElemtime(4) >= 0 && AnimElemtime(6) < 0 && movecontact
trigger16 = stateno = 1905 && AnimElemtime(1) >= 0 && AnimElemtime(5) < 0 && movecontact
trigger17 = stateno = 320 && AnimElemtime(2) >= 0 && AnimElemtime(4) < 0  && movecontact
trigger18 = stateno = 100
trigger19 = stateno = 1460 && movecontact
  
;------------------------------------------------------------------------------
;百八拾弐式
[State -1, 182]
type = ChangeState
value = 2150
triggerall = var(59) = 0
triggerall = command = "百八拾弐式2"
triggerall = power >= 1000
triggerall = var(5) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 210
trigger4 = stateno = 215 && movecontact && time = [0,15]
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact && time = [0,6]
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact && time = [0,11]
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 440
trigger11 = stateno = 315 && movecontact && time = [22,27]
trigger12 = stateno = 1155 && AnimElemtime(1) >= 0 && AnimElemtime(2) < 0 && movecontact
trigger13 = stateno = 1405 && AnimElemtime(4) >= 0 && AnimElemtime(5) < 0 && movecontact
trigger14 = stateno = 1900 && AnimElemtime(4) >= 0 && AnimElemtime(6) < 0 && movecontact
trigger15 = stateno = 1950 && AnimElemtime(4) >= 0 && AnimElemtime(6) < 0 && movecontact
trigger16 = stateno = 1905 && AnimElemtime(1) >= 0 && AnimElemtime(5) < 0 && movecontact
trigger17 = stateno = 320 && AnimElemtime(2) >= 0 && AnimElemtime(4) < 0  && movecontact
trigger18 = stateno = 100
trigger19 = stateno = 1460 && movecontact
 
;------------------------------------------------------------------------------
;百八拾弐式
[State -1, 182]
type = ChangeState
value = 2100
triggerall = var(59) = 0
triggerall = command = "百八拾弐式"
triggerall = power >= 1000
triggerall = var(5) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 210
trigger4 = stateno = 215 && movecontact && time = [0,15]
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact && time = [0,6]
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact && time = [0,11]
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 440
trigger11 = stateno = 315 && movecontact && time = [22,27]
trigger12 = stateno = 1155 && AnimElemtime(1) >= 0 && AnimElemtime(2) < 0 && movecontact
trigger13 = stateno = 1405 && AnimElemtime(4) >= 0 && AnimElemtime(5) < 0 && movecontact
trigger14 = stateno = 1900 && AnimElemtime(4) >= 0 && AnimElemtime(6) < 0 && movecontact
trigger15 = stateno = 1950 && AnimElemtime(4) >= 0 && AnimElemtime(6) < 0 && movecontact
trigger16 = stateno = 1905 && AnimElemtime(1) >= 0 && AnimElemtime(5) < 0 && movecontact
trigger17 = stateno = 320 && AnimElemtime(2) >= 0 && AnimElemtime(4) < 0  && movecontact
trigger18 = stateno = 100
trigger19 = stateno = 1460 && movecontact
 
 ;------------------------------------------------------------------------------
[State -1, L YAMIBARAI]
type = ChangeState
value = 1952
triggerall = var(59) = 0
triggerall = command = "EX朧車"
triggerall = statetype != A
triggerall = numprojID(1000) = 0
triggerall = power >= 500
triggerall = var(5) = 0
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 210
trigger4 = stateno = 215 && movecontact && time = [0,15]
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact && time = [0,6]
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact && time = [0,11]
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 440
trigger11 = stateno = 315 && movecontact && time = [22,27]
trigger12 = stateno = 1155 && AnimElemtime(1) >= 0 && AnimElemtime(2) < 0 && movecontact
trigger13 = stateno = 1405 && AnimElemtime(4) >= 0 && AnimElemtime(5) < 0 && movecontact
trigger14 = stateno = 1900 && AnimElemtime(4) >= 0 && AnimElemtime(6) < 0 && movecontact
trigger15 = stateno = 1950 && AnimElemtime(4) >= 0 && AnimElemtime(6) < 0 && movecontact
trigger16 = stateno = 1905 && AnimElemtime(1) >= 0 && AnimElemtime(5) < 0 && movecontact
trigger17 = stateno = 320 && AnimElemtime(2) >= 0 && AnimElemtime(4) < 0  && movecontact
trigger18 = stateno = 100
trigger19 = stateno = 1460 && movecontact
trigger20 = stateno = 1120
trigger21 = stateno = 1160
trigger22 = stateno = 1260


;弱百壱式・朧車
[State -1, L ONIYAKI]
type = ChangeState
value = 1500
triggerall = var(59) = 0
triggerall = command = "弱百壱式・朧車"
triggerall = statetype != A
triggerall = var(5) = 0
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 210
trigger4 = stateno = 215 && movecontact && time = [0,15]
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact && time = [0,6]
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact && time = [0,11]
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 440
trigger11 = stateno = 300 && prevstateno != [150,152]
trigger12 = stateno = 315 && movecontact && time = [22,27]
trigger13 = stateno = 320 && AnimElemtime(2) >= 0 && AnimElemtime(4) < 0  && movecontact
trigger14 = stateno = 100
trigger15 = var(20) > 0 && stateno = [1000,1999]
 

;強百壱式・朧車
[State -1, S ONIYAKI]
type = ChangeState
value = 1550
triggerall = var(59) = 0
triggerall = command = "強百壱式・朧車"
triggerall = statetype != A
triggerall = var(5) = 0
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 210
trigger4 = stateno = 215 && movecontact && time = [0,15]
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact && time = [0,6]
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact && time = [0,11]
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 440
trigger11 = stateno = 300 && prevstateno != [150,152]
trigger12 = stateno = 315 && movecontact && time = [22,27]
trigger13 = stateno = 320 && AnimElemtime(2) >= 0 && AnimElemtime(4) < 0  && movecontact
trigger14 = stateno = 100
trigger15 = var(20) > 0 && stateno = [1000,1999]

;------------------------------------------------------------------------------
[State -1, L YAMIBARAI]
type = ChangeState
value = 1956
triggerall = var(59) = 0
triggerall = command = "EX・琴月?陽"
triggerall = statetype != A
triggerall = numprojID(1000) = 0
triggerall = power >= 500
triggerall = var(5) = 0
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 210
trigger4 = stateno = 215 && movecontact && time = [0,15]
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact && time = [0,6]
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact && time = [0,11]
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 440
trigger11 = stateno = 315 && movecontact && time = [22,27]
trigger12 = stateno = 1155 && AnimElemtime(1) >= 0 && AnimElemtime(2) < 0 && movecontact
trigger13 = stateno = 1405 && AnimElemtime(4) >= 0 && AnimElemtime(5) < 0 && movecontact
trigger14 = stateno = 1900 && AnimElemtime(4) >= 0 && AnimElemtime(6) < 0 && movecontact
trigger15 = stateno = 1950 && AnimElemtime(4) >= 0 && AnimElemtime(6) < 0 && movecontact
trigger16 = stateno = 1905 && AnimElemtime(1) >= 0 && AnimElemtime(5) < 0 && movecontact
trigger17 = stateno = 320 && AnimElemtime(2) >= 0 && AnimElemtime(4) < 0  && movecontact
trigger18 = stateno = 100
trigger19 = stateno = 1460 && movecontact
trigger20 = stateno = 1120
trigger21 = stateno = 1160
trigger22 = stateno = 1260

;弱弐百拾弐式・琴月?陽
[State -1, L KOTOTSUKI]
type = ChangeState
value = 1400
triggerall = var(59) = 0
triggerall = command = "弱弐百拾弐式・琴月?陽"
triggerall = var(5) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 210
trigger4 = stateno = 215 && movecontact && time = [0,15]
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact && time = [0,6]
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact && time = [0,11]
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 440
trigger11 = stateno = 300 && prevstateno != [150,152]
trigger12 = stateno = 315 && movecontact && time = [22,27]
trigger13 = stateno = 320 && AnimElemtime(2) >= 0 && AnimElemtime(4) < 0  && movecontact
trigger14 = stateno = 100
trigger15 = var(20) > 0 && stateno = [1000,1999]
 
 

;強弐百拾弐式・琴月?陽
[State -1, S KOTOTSUKI]
type = ChangeState
value = 1450
triggerall = var(59) = 0
triggerall = command = "強弐百拾弐式・琴月?陽"
triggerall = var(5) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 210
trigger4 = stateno = 215 && movecontact && time = [0,15]
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact && time = [0,6]
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact && time = [0,11]
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 440
trigger11 = stateno = 300 && prevstateno != [150,152]
trigger12 = stateno = 315 && movecontact && time = [22,27]
trigger13 = stateno = 320 && AnimElemtime(2) >= 0 && AnimElemtime(4) < 0  && movecontact
trigger14 = stateno = 100
trigger15 = var(20) > 0 && stateno = [1000,1999]

;------------------------------------------------------------------------------EX・琴月?陽
[State -1, L YAMIBARAI]
type = ChangeState
value = 1955
triggerall = var(59) = 0
triggerall = command = "EX鬼焼き"
triggerall = statetype != A
triggerall = numprojID(1000) = 0
triggerall = power >= 500
triggerall = var(5) = 0
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 210
trigger4 = stateno = 215 && movecontact && time = [0,15]
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact && time = [0,6]
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact && time = [0,11]
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 440
trigger11 = stateno = 315 && movecontact && time = [22,27]
trigger12 = stateno = 1155 && AnimElemtime(1) >= 0 && AnimElemtime(2) < 0 && movecontact
trigger13 = stateno = 1405 && AnimElemtime(4) >= 0 && AnimElemtime(5) < 0 && movecontact
trigger14 = stateno = 1900 && AnimElemtime(4) >= 0 && AnimElemtime(6) < 0 && movecontact
trigger15 = stateno = 1950 && AnimElemtime(4) >= 0 && AnimElemtime(6) < 0 && movecontact
trigger16 = stateno = 1905 && AnimElemtime(1) >= 0 && AnimElemtime(5) < 0 && movecontact
trigger17 = stateno = 320 && AnimElemtime(2) >= 0 && AnimElemtime(4) < 0  && movecontact
trigger18 = stateno = 100
trigger19 = stateno = 1460 && movecontact
trigger20 = stateno = 1120
trigger21 = stateno = 1160
trigger22 = stateno = 1260
;------------------------------------------------------------------------------
;弱百式・鬼焼き
[State -1, L ONIYAKI]
type = ChangeState
value = 1100
triggerall = var(59) = 0
triggerall = command = "弱百式・鬼焼き"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 210
trigger4 = stateno = 215 && movecontact && time = [0,15]
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact && time = [0,6]
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact && time = [0,11]
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 440
trigger11 = stateno = 300 && prevstateno != [150,152]
trigger12 = stateno = 315 && movecontact && time = [22,27]
trigger13 = stateno = 320 && AnimElemtime(2) >= 0 && AnimElemtime(4) < 0  && movecontact
trigger14 = stateno = 100
trigger15 = var(20) > 0 && stateno = [1000,1999]
 

;強百式・鬼焼き
[State -1, S ONIYAKI]
type = ChangeState
value = 1150
triggerall = var(59) = 0
triggerall = command = "強百式・鬼焼き"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 210
trigger4 = stateno = 215 && movecontact && time = [0,15]
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact && time = [0,6]
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact && time = [0,11]
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 440
trigger11 = stateno = 300 && prevstateno != [150,152]
trigger12 = stateno = 315 && movecontact && time = [22,27]
trigger13 = stateno = 320 && AnimElemtime(2) >= 0 && AnimElemtime(4) < 0  && movecontact
trigger14 = stateno = 100
trigger15 = var(20) > 0 && stateno = [1000,1999]
 
 

;------------------------------------------------------------------------------
;弱蒼鬼
[State -1, L AOKI]
type = ChangeState
value = 1900
triggerall = var(59) = 0
triggerall = command = "弱九百拾式・?摘み"
triggerall = statetype != A
triggerall = var(5) = 1
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 210
trigger4 = stateno = 215 && movecontact && time = [0,15]
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact && time = [0,6]
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact && time = [0,11]
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 440
trigger11 = stateno = 300 && prevstateno != [150,152]
trigger12 = stateno = 315 && movecontact && time = [22,27]
trigger13 = stateno = 320 && AnimElemtime(2) >= 0 && AnimElemtime(4) < 0  && movecontact
trigger14 = stateno = 100
trigger15 = var(20) > 0 && stateno = [1000,1999]


;強蒼鬼
[State -1, S AOKI]
type = ChangeState
value = 1950
triggerall = var(59) = 0
triggerall = command = "強九百拾式・?摘み"
triggerall = statetype != A
triggerall = var(5) = 1
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 210
trigger4 = stateno = 215 && movecontact && time = [0,15]
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact && time = [0,6]
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact && time = [0,11]
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 440
trigger11 = stateno = 300 && prevstateno != [150,152]
trigger12 = stateno = 315 && movecontact && time = [22,27]
trigger13 = stateno = 320 && AnimElemtime(2) >= 0 && AnimElemtime(4) < 0  && movecontact
trigger14 = stateno = 100
trigger15 = var(20) > 0 && stateno = [1000,1999]
 

;------------------------------------------------------------------------------
;弱九百拾式・?摘み
[State -1, L 910]
type = ChangeState
value = 1300
triggerall = var(59) = 0
triggerall = command = "弱九百拾式・?摘み"
triggerall = statetype != A
triggerall = var(5) = 0
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 210
trigger4 = stateno = 215 && movecontact && time = [0,15]
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact && time = [0,6]
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact && time = [0,11]
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 440
trigger11 = stateno = 300 && prevstateno != [150,152]
trigger12 = stateno = 315 && movecontact && time = [22,27]
trigger13 = stateno = 320 && AnimElemtime(2) >= 0 && AnimElemtime(4) < 0  && movecontact
trigger14 = stateno = 100
trigger15 = var(20) > 0 && stateno = [1000,1999]
 

;------------------------------------------------------------------------------
;強九百拾式・?摘み
[State -1, S 910]
type = ChangeState
value = 1350
triggerall = var(59) = 0
triggerall = command = "強九百拾式・?摘み"
triggerall = statetype != A
triggerall = var(5) = 0
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 210
trigger4 = stateno = 215 && movecontact && time = [0,15]
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact && time = [0,6]
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact && time = [0,11]
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 440
trigger11 = stateno = 300 && prevstateno != [150,152]
trigger12 = stateno = 315 && movecontact && time = [22,27]
trigger13 = stateno = 320 && AnimElemtime(2) >= 0 && AnimElemtime(4) < 0  && movecontact
trigger14 = stateno = 100
trigger15 = var(20) > 0 && stateno = [1000,1999]
 

;------------------------------------------------------------------------------
[State -1, L YAMIBARAI]
type = ChangeState
value = 1953
triggerall = var(59) = 0
triggerall = command = "EX七拾五式・改"
triggerall = statetype != A
triggerall = numprojID(1000) = 0
triggerall = power >= 500
triggerall = var(5) = 0
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 210
trigger4 = stateno = 215 && movecontact && time = [0,15]
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact && time = [0,6]
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact && time = [0,11]
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 440
trigger11 = stateno = 315 && movecontact && time = [22,27]
trigger12 = stateno = 1155 && AnimElemtime(1) >= 0 && AnimElemtime(2) < 0 && movecontact
trigger13 = stateno = 1405 && AnimElemtime(4) >= 0 && AnimElemtime(5) < 0 && movecontact
trigger14 = stateno = 1900 && AnimElemtime(4) >= 0 && AnimElemtime(6) < 0 && movecontact
trigger15 = stateno = 1950 && AnimElemtime(4) >= 0 && AnimElemtime(6) < 0 && movecontact
trigger16 = stateno = 1905 && AnimElemtime(1) >= 0 && AnimElemtime(5) < 0 && movecontact
trigger17 = stateno = 320 && AnimElemtime(2) >= 0 && AnimElemtime(4) < 0  && movecontact
trigger18 = stateno = 100
trigger19 = stateno = 1460 && movecontact
trigger20 = stateno = 1120
trigger21 = stateno = 1160
trigger22 = stateno = 1260

;弱七拾五式・改
[State -1, L 75]
type = ChangeState
value = 1200
triggerall = var(59) = 0
triggerall = command = "弱七拾五式・改"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 210
trigger4 = stateno = 215 && movecontact && time = [0,15]
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact && time = [0,6]
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact && time = [0,11]
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 440
trigger11 = stateno = 300 && prevstateno != [150,152]
trigger12 = stateno = 315 && movecontact && time = [22,27]
trigger13 = stateno = 320 && AnimElemtime(2) >= 0 && AnimElemtime(4) < 0  && movecontact
trigger14 = stateno = 100
trigger15 = var(20) > 0 && stateno = [1000,1999]
 

;強七拾五式・改
[State -1, S 75]
type = ChangeState
value = 1250
triggerall = var(59) = 0
triggerall = command = "強七拾五式・改"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 210
trigger4 = stateno = 215 && movecontact && time = [0,15]
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact && time = [0,6]
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact && time = [0,11]
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 440
trigger11 = stateno = 300 && prevstateno != [150,152]
trigger12 = stateno = 315 && movecontact && time = [22,27]
trigger13 = stateno = 320 && AnimElemtime(2) >= 0 && AnimElemtime(4) < 0  && movecontact
trigger14 = stateno = 100
trigger15 = var(20) > 0 && stateno = [1000,1999]
 

;------------------------------------------------------------------------------

;百拾四式・荒咬み
[State -1, ARAGAMI]
type = ChangeState
value = 1600
triggerall = var(59) = 0
triggerall = command = "弱百八式・闇払い"
triggerall = statetype != A
triggerall = var(5) = 1
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 210
trigger4 = stateno = 215 && movecontact && time = [0,15]
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact && time = [0,6]
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact && time = [0,11]
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 440
trigger11 = stateno = 300 && prevstateno != [150,152]
trigger12 = stateno = 315 && movecontact && time = [22,27]
trigger13 = stateno = 320 && AnimElemtime(2) >= 0 && AnimElemtime(4) < 0  && movecontact
trigger14 = stateno = 100
trigger15 = var(20) > 0 && stateno = [1000,1999]
 
 

;百拾五式・毒咬み
[State -1, DOKUGAMI]
type = ChangeState
value = 1700
triggerall = var(59) = 0
triggerall = command = "強百八式・闇払い"
triggerall = statetype != A
triggerall = var(5) = 1
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 210
trigger4 = stateno = 215 && movecontact && time = [0,15]
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact && time = [0,6]
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact && time = [0,11]
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 440
trigger11 = stateno = 300 && prevstateno != [150,152]
trigger12 = stateno = 315 && movecontact && time = [22,27]
trigger13 = stateno = 320 && AnimElemtime(2) >= 0 && AnimElemtime(4) < 0  && movecontact
trigger14 = stateno = 100
trigger15 = var(20) > 0 && stateno = [1000,1999]
 
 

;------------------------------------------------------------------------------
;EX・闇払い
[State -1, L YAMIBARAI]
type = ChangeState
value = 1951
triggerall = var(59) = 0
triggerall = command = "EX暗仏"
triggerall = statetype != A
triggerall = numprojID(1000) = 0
triggerall = power >= 500
triggerall = var(5) = 0
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 210
trigger4 = stateno = 215 && movecontact && time = [0,15]
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact && time = [0,6]
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact && time = [0,11]
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 440
trigger11 = stateno = 315 && movecontact && time = [22,27]
trigger12 = stateno = 1155 && AnimElemtime(1) >= 0 && AnimElemtime(2) < 0 && movecontact
trigger13 = stateno = 1405 && AnimElemtime(4) >= 0 && AnimElemtime(5) < 0 && movecontact
trigger14 = stateno = 1900 && AnimElemtime(4) >= 0 && AnimElemtime(6) < 0 && movecontact
trigger15 = stateno = 1950 && AnimElemtime(4) >= 0 && AnimElemtime(6) < 0 && movecontact
trigger16 = stateno = 1905 && AnimElemtime(1) >= 0 && AnimElemtime(5) < 0 && movecontact
trigger17 = stateno = 320 && AnimElemtime(2) >= 0 && AnimElemtime(4) < 0  && movecontact
trigger18 = stateno = 100
trigger19 = stateno = 1460 && movecontact
trigger20 = stateno = 1120
trigger21 = stateno = 1160
trigger22 = stateno = 1260

;弱百八式・闇払い
[State -1, L YAMIBARAI]
type = ChangeState
value = 1000
triggerall = var(59) = 0
triggerall = command = "弱百八式・闇払い"
triggerall = statetype != A
triggerall = numprojID(1000) = 0
triggerall = var(5) = 0
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 210
trigger4 = stateno = 215 && movecontact && time = [0,15]
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact && time = [0,6]
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact && time = [0,11]
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 440
trigger11 = stateno = 300 && prevstateno != [150,152]
trigger12 = stateno = 315 && movecontact && time = [22,27]
trigger13 = stateno = 320 && AnimElemtime(2) >= 0 && AnimElemtime(4) < 0  && movecontact
trigger14 = stateno = 100
trigger15 = var(20) > 0 && stateno = [1000,1999]
 
 

;強百八式・闇払い
[State -1, S YAMIBARAI]
type = ChangeState
value = 1050
triggerall = var(59) = 0
triggerall = command = "強百八式・闇払い"
triggerall = statetype != A
triggerall = numprojID(1000) = 0
triggerall = var(5) = 0
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 210
trigger4 = stateno = 215 && movecontact && time = [0,15]
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact && time = [0,6]
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact && time = [0,11]
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 440
trigger11 = stateno = 300 && prevstateno != [150,152]
trigger12 = stateno = 315 && movecontact && time = [22,27]
trigger13 = stateno = 320 && AnimElemtime(2) >= 0 && AnimElemtime(4) < 0  && movecontact
trigger14 = stateno = 100
trigger15 = var(20) > 0 && stateno = [1000,1999]
 
 

;---------------------------------------------------------------------------
;後緊?回避
[State -1, T S]
type = ChangeState
value = 710
triggerall = var(59) = 0
triggerall = command = "recovery" && command = "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = power >= 1000
trigger2 = stateno = 150
trigger3 = power >= 1000
trigger3 = stateno = 152
trigger4 = stateno = 100
 

;---------------------------------------------------------------------------
;前緊?回避
[State -1, T S]
type = ChangeState
value = 700
triggerall = var(59) = 0
triggerall = command = "recovery"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = power >= 1000
trigger2 = stateno = 150
trigger3 = power >= 1000
trigger3 = stateno = 152
trigger4 = stateno = 100
 

;------------------------------------------------------------------------------
;ふっとばし
[State -1, CD]
type = ChangeState
value = 300
triggerall = var(59) = 0
triggerall = command = "ふっとばし"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = power >= 1000
trigger2 = stateno = 150
trigger3 = power >= 1000
trigger3 = stateno = 152
trigger4 = stateno = 100
 

;------------------------------------------------------------------------------
;空中ふっとばし
[State -1, CD]
type = ChangeState
value = 650
triggerall = var(59) = 0
triggerall = command = "ふっとばし"
triggerall = statetype = A
trigger1 = ctrl
 

;------------------------------------------------------------------------------
;P投げ
[State -1, Throw]
type = ChangeState
value = 800
triggerall = var(59) = 0
triggerall = command = "y"
triggerall = command = "holdfwd" || command = "holdback"
triggerall = stateno != 100
triggerall = statetype = S
trigger1 = p2bodydist X < 15
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
trigger1 = ctrl
 
;------------------------------------------------------------------------------
;K投げ
[State -1, Throw]
type = ChangeState
value = 801
triggerall = var(59) = 0
triggerall = command = "b"
triggerall = command = "holdfwd" || command = "holdback"
triggerall = stateno != 100
triggerall = statetype = S
trigger1 = p2bodydist X < 15
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
trigger1 = ctrl
 
;------------------------------------------------------------------------------
;外式・奈落落とし
[State -1, NARAKU]
type = ChangeState
value = 330
triggerall = var(59) = 0
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 105
 
;------------------------------------------------------------------------------
;八拾八式
[State -1, 88]
type = ChangeState
value = 320
triggerall = var(59) = 0
triggerall = command = "b"
triggerall = command = "holdfwd"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 215 && movecontact && time = [0,15]
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact && time = [0,6]
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact && time = [0,11]
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 440 && movecontact
trigger11 = stateno = 100
 
;------------------------------------------------------------------------------
;外式・轟??陽
[State -1, GOUHU]
type = ChangeState
value = 310
triggerall = var(59) = 0
triggerall = command = "a"
triggerall = command = "holdfwd"
triggerall = statetype != A
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 215 && movecontact && time = [0,15]
trigger5 = stateno = 235 && movecontact
trigger6 = stateno = 245 && movecontact && time = [0,6]
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact && time = [0,11]
trigger9 = stateno = 430 && movecontact
trigger10 = stateno = 440 && movecontact
trigger11 = stateno = 100
 
;------------------------------------------------------------------------------
;Run Fwd
[State -1, Dash]
type = ChangeState
value = 100
triggerall = var(59) = 0
triggerall = (Command = "FF" && P2dist X >=0)||(Command = "BB" && P2dist X <0)
triggerall = Statetype = S
trigger1 = Ctrl
 

;Run Back
[State -1, Back Step]
type = ChangeState
value = 105
triggerall = var(59) = 0
triggerall = (Command = "BB" && P2dist X >=0)||(Command = "FF" && P2dist X <0)
triggerall = Statetype = S
trigger1 = Ctrl
 
;==============================================================================
;近距離立ち弱パン?
[State -1, Stand Light Punch]
type = ChangeState
value = 205
triggerall = var(59) = 0
triggerall = command = "x"
triggerall = command != "holddown"
triggerall = statetype = S
triggerall = p2bodydist X < 18
trigger1 = ctrl
trigger2 = stateno = 100
 

;遠距離立ち弱パン?
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = var(59) = 0
triggerall = command = "x"
triggerall = command != "holddown"
triggerall = statetype = S
trigger1 = ctrl
trigger2 = stateno = 100
 

;近距離立ち強パン?
[State -1, Stand Strong Punch]
type = ChangeState
value = 215
triggerall = var(59) = 0
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = statetype = S
triggerall = p2bodydist X < 24
trigger1 = ctrl
trigger2 = stateno = 100
 

;遠距離立ち強パン?
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = var(59) = 0
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = statetype = S
trigger1 = ctrl
trigger2 = stateno = 100
 

;------------------------------------------------------------------------------
;近距離立ち弱キック
[State -1, Stand Light Kick]
type = ChangeState
value = 235
triggerall = var(59) = 0
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = statetype = S
triggerall = p2bodydist X < 14
trigger1 = ctrl
trigger2 = stateno = 100
 

;遠距離立ち弱キック
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = var(59) = 0
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = statetype = S
trigger1 = ctrl
trigger2 = stateno = 100
 

;近距離立ち強キック
[State -1, Standing Strong Kick]
type = ChangeState
value = 245
triggerall = var(59) = 0
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = statetype = S
triggerall = p2bodydist X < 20
trigger1 = ctrl
trigger2 = stateno = 100
 

;遠距離立ち強キック
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = var(59) = 0
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = statetype = S
trigger1 = ctrl
trigger2 = stateno = 100
 

;------------------------------------------------------------------------------
;挑発
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = var(59) = 0
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl
 

;------------------------------------------------------------------------------
;しゃがみ弱パン?
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = var(59) = 0
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 430 && movecontact
trigger3 = stateno = 100
 

;しゃがみ強パン?
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = var(59) = 0
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 100
 

;------------------------------------------------------------------------------
;しゃがみ弱キック
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = var(59) = 0
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 100
 

;しゃがみ強キック
[State -1, Crouching Strong Kick]
type = ChangeState
value = 440
triggerall = var(59) = 0
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 100
 
;------------------------------------------------------------------------------
;ジャンプ弱パン?
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = var(59) = 0
triggerall = command = "x"
triggerall = stateno != 105
trigger1 = statetype = A
trigger1 = ctrl
 

;ジャンプ強パン?
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = var(59) = 0
triggerall = command = "y"
triggerall = stateno != 105
trigger1 = statetype = A
trigger1 = ctrl
 

;------------------------------------------------------------------------------
;垂直ジャンプ弱キック
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = var(59) = 0
triggerall = command = "a"
triggerall = stateno != 105
triggerall = vel X = 0
trigger1 = statetype = A
trigger1 = ctrl
 

;斜めジャンプ弱キック
[State -1, Jump Light Kick]
type = ChangeState
value = 635
triggerall = var(59) = 0
triggerall = command = "a"
triggerall = stateno != 105
triggerall = vel X != 0
trigger1 = statetype = A
trigger1 = ctrl
 

;垂直ジャンプ強キック
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = var(59) = 0
triggerall = command = "b"
triggerall = stateno != 105
triggerall = vel X = 0
trigger1 = statetype = A
trigger1 = ctrl


;斜めジャンプ強キック
[State -1, Jump Strong Kick]
type = ChangeState
value = 645
triggerall = var(59) = 0
triggerall = command = "b"
triggerall = stateno != 105
triggerall = vel X != 0
trigger1 = statetype = A
trigger1 = ctrl
 
;------------------------------------------------------------------------------
; Power charge
[State -1]
type = ChangeState
value = 910
triggerall = var(59) = 0
triggerall = statetype = S
triggerall = Power != 6000
triggerall = ctrl = 1
trigger1 = var(20) = 0
trigger1 = command = "holdb"
trigger1 = command = "holdx"

; fire duang~
[State -1]
type = ChangeState
value = 902
triggerall = var(59) = 0
triggerall = statetype = S
triggerall = ctrl = 1
triggerall = power >= 6000
triggerALL = var(20) = 0
trigger1 = command = "holdz"
trigger1 = command = "holdc"
 
; bc
[State -1]
type = ChangeState
value = 900
triggerall = var(59) = 0
triggerall = statetype = S
triggerall = ctrl = 1
triggerall = power >= 1000
triggerALL = var(20) = 0
trigger1 = command = "holda"
trigger1 = command = "holdy"

; bc-changge
[State -1]
type = ChangeState
value = 901
triggerall = var(59) = 0
triggerall = ctrl = 0
triggerall = power >= 1000
triggerall = var(20) = 0
triggerall = command = "holda"
triggerall = command = "holdy"
trigger1 = stateno = 205 && movecontact
trigger2 = stateno = 210 && movecontact
trigger3 = stateno = 215 && movecontact && time = [0,15]
trigger4 = stateno = 235 && movecontact
trigger5 = stateno = 245 && movecontact && time = [0,6]
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 410 && movecontact && time = [0,11]
trigger8 = stateno = 430 && movecontact
trigger9 = stateno = 440 && movecontact
trigger10 = stateno = 315 && movecontact && time = [22,27]
;-------------------------------------------------------------------------------

[State -1, recovery]
type = ChangeState
value = 5201
triggerall = var(59) = 0
triggerall = command = "recovery"
triggerall = alive = 1
triggerall = var(48)= 0
trigger1 = stateno = 5050
trigger1 = pos y > 0
trigger1 = vel y > 0
;-------------------------------------------------------------------------------