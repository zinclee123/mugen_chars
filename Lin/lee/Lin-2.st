[Statedef -2]


[state -2, a];右向き設定
type = varset
trigger1 = var(10) = 0
trigger1 = facing = 1
v = 10
value = 1

[state -2, a];左向き設定
type = varset
trigger1 = var(10) = 0
trigger1 = facing = -1
v = 10
value = 2

[State -2, 1];ダッシュの音止め
type = stopSnd
trigger1 = stateno != 100
channel = 1

[State -2, 4];ハイジャンプ判定
type = varadd
trigger1 = 1
v = 15
value = -1

[State -2, 1];ナナナナナの音止め
type = stopSnd
trigger1 = movetype = H
channel = 6

[State -2, 1];ナナナナナの音止め２
type = stopSnd
trigger1 = movetype = H
channel = 7

[State -2, 1];ファイナルインパクト、吼える大地・音止め
type = stopSnd
trigger1 = movetype = H
channel = 8

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;::::::::パレットによるモード判別(1でオロチ)
[state -2, a]
type = varset
triggerall = stateno = 5900
trigger1 = palno = 1
trigger2 = palno = 2
trigger3 = palno = 3
trigger4 = palno = 4
trigger5 = palno = 5
trigger6 = palno = 6
v = 1
value = 0

[state -2, a]
type = varset
triggerall = stateno = 5900
trigger1 = palno = 7
trigger2 = palno = 8
trigger3 = palno = 9
trigger4 = palno = 10
trigger5 = palno = 11
trigger6 = palno = 12
v = 1
value = 1

[state -2, a]
type = varset
trigger1 = var(24) = 1
v = 1
value = 0

[state -2, a]
type = varset
trigger1 = var(24) = 2
v = 1
value = 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;::::::::カウンターヒット設定
[state a]
type = varset
trigger1 = enemy,movetype = A
v = 8
value = 1
ignorehitpause = 1

[State a]
type = EnvColor
trigger1 = movehit
trigger1 = var(8) = 1
persistent = 0
ignorehitpause = 1
time = 1
value = 255,255,255
under = 2

[state a]
type = varset
trigger1 = enemy,movetype != A
v = 8
value = 0
ignorehitpause = 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;::::::::スロー処理

[state -2, a];スロー処理をする時間のカウント
type = varadd
trigger1 = 1
persistent = 0
ignorehitpause = 1
v = 4
value = -1

[state -2, a];スロー処理
type = pause
trigger1 = var(4) >= 1
trigger1 = gametime % 2
persistent = 0
ignorehitpause = 1
time = 1


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;ダメージ時のエフェクト、サウンドの消去
;//////////////////////////////////////////////////////////////////////////
;ダッシュ終了時のエフェクトの消去
[State 1];ブレスレットのエフェクト消去、主に通常動作
type = removeexplod
trigger1 = MoveType = H && stateno != [120,159]
ID = 3000

[State 1]
type = removeexplod
trigger1 = MoveType = H
ID = 2200


[State removeexplod]
type = removeexplod
trigger1 = anim != 1
ID = 2

[State removeexplod]
type = removeexplod
trigger1 = stateno != 199
ID = 199

;ダメージ時の残像の消去
[state a];
type = afterimagetime
trigger1 = MoveType = H
time = 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;//////////////////////////////////////////////////////////////////////////
;ダメージボイス
[state a]
type = PlaySnd
triggerall = stateno = 5000 ||  stateno = 5010 || stateno = 5020
triggerall = time = 0
triggerall = alive = 1
trigger1 = GetHitVar(animtype) = 0
value = 5000,0+(random%4)
persistent = 0

[state a]
type = PlaySnd
triggerall = stateno = 5000 ||  stateno = 5010 || stateno = 5020
triggerall = time = 0
triggerall = alive = 1
trigger1 = GetHitVar(animtype) = 1
value = 5001,0+(random%4)
persistent = 0

[state a]
type = PlaySnd
triggerall = stateno = 5000 ||  stateno = 5010 || stateno = 5020
triggerall = time = 0
triggerall = alive = 1
trigger1 = GetHitVar(animtype) = 2
trigger2 = GetHitVar(animtype) = 3
trigger3 = GetHitVar(animtype) = 4
value = 5002,0+(random%4)
persistent = 0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;勝利時のサウンドストップ
;//////////////////////////////////////////////////////////////////////////

[State a]
type = AssertSpecial
trigger1 = RoundState != 2
flag = nobardisplay



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;特殊メッセージ
;//////////////////////////////////////////////////////////////////////////
[state a];紅丸
type = varset
trigger1 = p2name = "Benimaru Nikaido" || p4name = "Benimaru Nikaido"
trigger2 = p2name = "Benimaru" || p4name = "Benimaru"
trigger3 = p2name = "cvsbenimaru" || p4name = "cvsbenimaru"
v = 9
value = 3

[state a];クリザリッド
type = varset
trigger1 = p2name = "Krizalid" || p4name = "Krizalid"
trigger2 = p2name = "n-krizalid" || p4name = "n-krizalid"
v = 9
value = 4

[state a];オリジナルゼロ
type = varset
trigger1 = p2name = "ORIGINAL ZERO" || p4name = "ORIGINAL ZERO"
trigger2 = p2name = "ZERO-KO" || p4name = "ZERO-KO"
v = 9
value = 5

[state a];ケンスウ
type = varset
trigger1 = p2name = "Kensou" || p4name = "Kensou"
trigger2 = p2name = "Sie Kensou" || p4name = "Sie Kensou"
v = 9
value = 6

[state a];ネスツ勝利イントロ
type = varset
trigger1 = p2name = "k9999" || p4name = "k9999"
trigger2 = p2name = "angel" || p4name = "angel"
trigger3 = p2name = "foxy" || p4name = "foxy"
trigger4 = p2name = "zero" || p4name = "zero"
trigger5 = p2name = "Igniz" || p4name = "Igniz"
trigger6 = p2name = "KUSANAGI" || p4name = "KUSANAGI"
trigger7 = p2name = "kusanagi" || p4name = "kusanagi"
trigger8 = p2name = "clonekyo" || p4name = "clonekyo"
trigger9 = p2name = "kyo-1" || p4name = "kyo-1"
trigger10= p2name = "kyo-2" || p4name = "kyo-2"
trigger11= p2name = "Nao" || p4name = "Nao"
trigger12= p2name = "K'" || p4name = "K'"
trigger13= p2name = "AK'" || p4name = "AK'"
trigger14= p2name = "kula" || p4name = "kula"
trigger15= p2name = "hiel" || p4name = "hiel"
trigger16= p2name = "sula" || p4name = "sula"
trigger17= p2name = "fliz" || p4name = "fliz"
trigger18= p2name = "maxima" || p4name = "maxima"
trigger19= p2name = "MAXIMA_PRO" || p4name = "MAXIMA_PRO"
trigger20= p2name = "kriz" || p4name = "kriz"
trigger21= p2name = "Y'" || p4name = "Y'"
trigger22= p2name = "Long" || p4name = "Long"
trigger23= p2name = "ROBO-K'" || p4name = "ROBO-K'"
trigger24= p2name = "MAXIMA-TYPEB-_AKOF" || p4name = "MAXIMA-TYPEB-_AKOF"
trigger25= p2name = "K-BLOOD" || p4name = "K-BLOOD"
trigger26= p2name = "Reak" || p4name = "Reak"
trigger27= p2name = "nameless" || p4name = "nameless"
v = 7
value = 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;MAX
;//////////////////////////////////////////////////////////////////////////
;---------------------[変数]
[state -2 ,1];MAX発動時のパワーセット
type = varset
trigger1 = var(20) = 900
v = 21
value = power

[state a]
type = varadd
trigger1 = var(20) > 0
v = 20
value = -1

[state a]
type = varset
trigger1 = var(20) < 0
v = 20
value = 0

[state a]
type = powerset
trigger1 = var(20) > 0
trigger1 = stateno != [2000,2999]
value = var(21)
ignorehitpause = 1

;---------------------[演出]
[State a];点滅
type = palfx
trigger1 = var(20) > 0
trigger1 = gametime % 2 = 0
time = 1
add = 126,126,0
color = 1
ignorehitpause = 1


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;ゲージ
;//////////////////////////////////////////////////////////////////////////
;---------------------[ヘルパー]
[state a];ＫＯ演出
type = Helper
trigger1 = numhelper(8010) = 0
id = 8010
name = "g"
sprpriority = 1
pos = 0,0
postype = p1
stateno = 8010
helpertype = normal
pausemovetime = 999999
keyctrl = 1 
ownpal = 1

;---------------------[ヘルパー]
[state a];ゲージ
type = Helper
trigger1 = numhelper(7500) = 0
id = 7500
name = "g"
sprpriority = 1
pos = 0,0
postype = p1
stateno = 7500
helpertype = normal
pausemovetime = 99999999
supermovetime = 99999999
keyctrl = 0 
ownpal = 1



;---------------------[ヘルパー]
[state a];MAX発動ゲージ
type = Helper
trigger1 = numhelper(7550) = 0
id = 7550
name = "MAX"
sprpriority = 1
pos = 0,0
postype = p1
stateno = 7550
helpertype = normal
pausemovetime = 99999999
supermovetime = 99999999
keyctrl = 0 
ownpal = 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;ガー不、その他
;//////////////////////////////////////////////////////////////////////////
[state a]
type = varset
triggerall = command = "飛賊奥義 影向"
triggerall = power < 1000 && var(20) <= 0
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
v = 30
value = 1

[state a]
type = varset
trigger1 = movetype = H
v = 31
value = 1

[State a];テスト
type = null;palfx
trigger1 = var(31) = 1
trigger1 = gametime % 2 = 0
time = 1
add = 126,126,0
color = 1
ignorehitpause = 1


[state a];特殊那義・仕込み
type = varset
trigger1 = command = "鉄斬舞 那義"
v = 32
value = 1

[state a];特殊那義・解除
type = varset
trigger1 = command = "飛天脚・弱" || command = "飛天脚・強"
v = 32
value = 0

;-----------------------------------------------------------------
;喷毒 打气用
;Helper打气有Bug，第一下不给加
;-----------------------------------------------------------------
[State 1500]
type = poweradd 
Triggerall = numhelper(1010) ||  numhelper(1012)
Trigger1 = helper(1010),animelem = 1, =1 && helper(1010),movecontact
Trigger2 = helper(1012),animelem = 1, =1 && helper(1012),movecontact
Trigger3 = helper(1012),animelem = 3, =1 && helper(1012),movecontact
Trigger4 = helper(1012),animelem = 5, =1 && helper(1012),movecontact 
value = 50
ignorehitpause = 1

;-----------------------------------------------------------------
;蛇突牙 打气用
;Helper打气有Bug，第一下不给加
;-----------------------------------------------------------------
[State 1500]
type = poweradd 
Trigger1 = NumHelper(1510)
Trigger1 = Helper(1510),movecontact = 1
Trigger2 = NumHelper(1511)
Trigger2 = Helper(1511),movecontact = 1
Trigger3 = NumHelper(1512)
Trigger3 = Helper(1512),movecontact = 1
value = 100


;--------------------------------------
;显血
[State -2,]
type = Explod
trigger1 = roundState = 2
anim = F310+life%10
pos = IfElse(TeamSide=1,122,204), 28
postype = Left
bindtime = -1
ownpal = 1
ontop = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1


[State -2,]
type =  Explod
trigger1 = roundState = 2
anim = F310+floor(life/10)%10
pos = IfElse(TeamSide=1,118,200), 28
postype = Left
bindtime = -1
ownpal = 1
ontop = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1


[State -2,]
type =  Explod
trigger1 = roundState = 2
anim = F310+floor(life/100)%10
pos = IfElse(TeamSide=1,114,196), 28
postype = Left
bindtime = -1
ownpal = 1
ontop = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1 


[State -2,]
type =  Explod
trigger1 = roundState = 2
anim = F310+floor(life/1000)%10
pos = IfElse(TeamSide=1,110,192), 28
postype = Left
bindtime = -1
ownpal = 1
ontop = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1

;--------------------------------------

;--------------------------------------
;显气

[State -2,]
type = Explod
trigger1 = roundState = 2
anim = F300+Power%10
pos = IfElse(TeamSide=1,122,208), 4
postype = Left
bindtime = -1
ownpal = 1
ontop = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1

[State -2,]
type =  Explod
trigger1 = roundState = 2
anim = F300+floor(Power/10)%10
pos = IfElse(TeamSide=1,118,204), 4
postype = Left
bindtime = -1
ownpal = 1
ontop = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1

[State -2,]
type =  Explod
trigger1 = roundState = 2
anim = F300+floor(Power/100)%10
pos = IfElse(TeamSide=1,114,200), 4
postype = Left
bindtime = -1
ownpal = 1
ontop = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1 

[State -2,]
type =  Explod
trigger1 = roundState = 2
anim = F300+floor(Power/1000)%10
pos = IfElse(TeamSide=1,110,196), 4
postype = Left
bindtime = -1
ownpal = 1
ontop = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1

[State -2,]
type =  Explod
trigger1 = roundState = 2
anim = F300+floor(Power/10000)%10
pos = IfElse(TeamSide=1,106,192), 4
postype = Left
bindtime = -1
ownpal = 1
ontop = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1
;--------------------------------------


;===========================================================================
; Guard Crash Calculation
;===========================================================================
[State -2]
type = TargetState
TriggerAll = numtarget
TriggerAll = target,alive
TriggerAll = fvar(10) >= 10000
TriggerAll = target,StateType = S || target,StateType = C
TriggerAll = target,MoveType = H && target,StateNo = [120,159]
Trigger1 = MoveGuarded = 1
Trigger2 = ProjGuarded = 1
value = 5700

[State -2]
type = VarSet
TriggerAll = fvar(10) < 0
Trigger1 = 1
fvar(10) = 0
ignorehitpause = 1

[State -2]
type = VarAdd
TriggerAll = fvar(10) >= 1
Trigger1 = GameTime%37 = 0
fvar(10) = -100
ignorehitpause = 1

[State -2]
type = VarSet
TriggerAll = fvar(10) != 0
Trigger1 = roundstate != 2
Trigger2 = enemy,StateNo = 5700
fvar(10) = 0
ignorehitpause = 1

[State -2]
type = VarAdd
TriggerAll = RoundState = 2
TriggerAll = P2MoveType = H
TriggerAll = EnemyNear,time = 0
Trigger1 = moveguarded = 1
Trigger2 = ProjGuarded = 1
fvar(10) = ifelse(stateno < 1000, 500, 1200)
ignorehitpause = 1
persistent = 0

[State -2,]
type = Helper
triggerall = NumHelper(6510) = 0
trigger1 = p2stateno = 5700 && enemy,time = 1
trigger1 = p2movetype = H
name="crush"
id = 6510
pos = 0,0
postype = back
stateno = 6510
helpertype = normal
ownpal = 1
keyctrl = 0
size.xscale = 1
size.yscale = 1
supermovetime = 999
pausemovetime = 999

;---------------------------------------------------------------------------------
;Print
;---------------------------------------------------------------------------------
[State -2, Debug]
type = displaytoclipboard
Trigger1 = 1
text = "P2StateNo = %d p2HitTime = %d X = %d, Y = %d  FrontEdgeBodyDist = %d"
params = P2StateNo, EnemyNear,GetHitVar(hittime), P2BodyDist x,  P2BodyDist y, FrontEdgeBodyDist
ignorehitpause = 1

[State -2, Debug]
type = appendtoclipboard
Trigger1 = 1
text="\nTRACE %d, EnemyNear,pos x = %d EnemyNear,pos y = %d 19posy = %d p2BackEdgeBodyDist = %d EnemyNear,animtime = %d"  
params= var(50), EnemyNear,pos x, EnemyNear,pos y , EnemyNear,Pos Y + EnemyNear,Vel Y * 19 + fvar(38) * 19 * (19 + 1) / 2, EnemyNear,BackEdgeBodyDist, EnemyNear,animtime
ignorehitpause = 1