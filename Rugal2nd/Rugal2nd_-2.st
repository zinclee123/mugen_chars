[Statedef -2]

;---------------------------------------------------------------------------------
;AI跳跃限制用
;---------------------------------------------------------------------------------
[State -2]
type = varadd
Trigger1 = RoundState = 2
Trigger1 = var(44) > 0
var(44) = -1
ignorehitpause = 1

;限制跳跃
[State -2]
type = varadd
Triggerall = name = "Rugal2nd"
Triggerall = EnemyNear,StateType != A
TriggerAll = EnemyNear,MoveHit = 1 && Time = 1
TriggerAll = MoveType = H
;空中攻击被打
Trigger1 = var(50)/100 = [600,699]
;起跳被打
Trigger2 = var(50)/100 = 39
;被抓落地
Trigger3 = prevStateNo = 52
Trigger4 = var(50)/100 = 330
Trigger5 = var(50)/100 = 120 && StateType = A
Trigger6 = var(50)/10000 = 39
var(44) = 120 + EnemyNear,GetHitVar(damage)

;-----------------------------------------------------------
;打逆不可防用
[State -2, 打逆不可防用]
type = AssertSpecial
triggerall = !(StateNo = [1800,1899])
triggerall = StateNo = [200,4999]
triggerall = MoveType = A
trigger1 = Enemynear,P2Dist x < 0
flag = unguardable
IgnoreHitPause = 1

;-----------------------------------------------------------
;锁气用
[State -2,锁气用]
type = powerset
triggerall = fvar(26) = 1
trigger1 = var(52) > 0
value = fvar(5)
ignorehitpause = 1

;-----------------------------------------------------------
;提前停止鞭尸炮
[State -2]
type = varset
triggerall = fvar(26) = 1
triggerall = var(33) = [1,5]
trigger1 = EnemyNear,StateNo = 3055
trigger1 = EnemyNear,Pos Y < -30
var(33) = 0
ignorehitpause = 1

;-----------------------------------------------------------
;当身记录，会传递到Helper11990里面
[State -2]
type = varset
triggerall = MoveReversed = 1
triggerall = MoveType = H
trigger1 = enemynear,movetype = A || enemynear,movetype = I
trigger1 = EnemyNear,StateNo  < 2000
var(18) = EnemyNear,StateNo 
ignorehitpause = 1

;****************************************************************
;*************************【Config】*****************************
;****************************************************************
;設定の変更はここで行ってください。

[State -2, Display Power Gauge]
type = varset
trigger1 = 1
fvar(30) = 0;(1:on/0:off)
ignorehitpause = 1
;パワーゲージの表示の有無を切り替えます。

[State -2, Display AI s Lv]
type = varset
trigger1 = 1
fvar(31) = 0;(1:on/0:off)
ignorehitpause = 1
;AILvの表示の有無を切り替えます。


[State -2, AttackMul（Normal）]
type = varset
trigger1 = 1
fvar(35) = 100.0;(%) 
ignorehitpause = 1
;通常技の攻撃力を変更します。

[State -2, AttackMul（Throws）]
type = varset
trigger1 = 1
fvar(36) = 100.0;(%) 
ignorehitpause = 1
;投げ技の攻撃力を変更します。

[State -2, AttackMul（Special）]
type = varset
trigger1 = 1
fvar(37) = 100.0;(%) 
ignorehitpause = 1
;必殺技の攻撃力を変更します。

[State -2, AttackMul（Hyper）]
type = varset
trigger1 = 1
fvar(38) = 100.0;(%) 
ignorehitpause = 1
;超必殺技の攻撃力を変更します。


[State -2, BossMode(Player)]
type = varset
triggerall = !var(59)
trigger1 = 1
fvar(28) = 0;(1:on/0:off)
ignorehitpause = 1

[State -2, BossMode(AI)]
type = varset
trigger1 = var(59)
fvar(28) = 0;(1:on/0:off)
ignorehitpause = 1


[State -2, Cutter Switch];"Genoside Cutter94" s offensive power can be as well as "KOF94".
type = varset
trigger1 = 1
fvar(27) = 1;(1:on/0:off)
ignorehitpause = 1
;ジェノサイドカッター 94の攻撃力が原作通りになります。


[State -2, Mode Setting(5～6P)];Change for Character s Voice
type = varset
trigger1 = PalNo = [5,6]
fvar(29) = 5;(2:Wakamoto/5:Arai)
ignorehitpause = 1
;5～6P時のキャラボイスを変更します。

[State -2, ModeSetting(11～12P)];Change for Character s Voice
type = varset
trigger1 = PalNo = [11,12]
fvar(29) = 6;(3:Wakamoto/6:Arai)
ignorehitpause = 1
;11～12P時のキャラボイスを変更します。



;****************************************************************
;****************************************************************
;****************************************************************


[State -2, パートナー同システムフラグ]
type = VarSet
triggerall = NumPartner = 1
trigger1 = Partner,AuthorName = "fxm508" && Partner,Name = "Goenitz_UM"
trigger2 = Partner,AuthorName = "fxm508" && Partner,Name = "Orochi_Chris"
trigger3 = Partner,AuthorName = "fxm508" && Partner,Name = "Orochi_Shermie"
trigger4 = Partner,AuthorName = "fxm508" && Partner,Name = "Orochi_Yashiro"
trigger5 = Partner,AuthorName = "fxm508" && Partner,Name = "Orochi_Mature"
trigger6 = Partner,AuthorName = "fxm508" && Partner,Name = "Orochi_Vice"
trigger7 = Partner,AuthorName = "fxm508" && Partner,Name = "Rugal2nd" && Partner,fvar(29) = 4
var(56) = 1

[State -2, パートナー同システムフラグ]
type = VarSet
trigger1 = NumPartner = 0
trigger2 = !(Partner,AuthorName = "fxm508" && Partner,Name = "Goenitz_UM")
trigger2 = !(Partner,AuthorName = "fxm508" && Partner,Name = "Orochi_Chris")
trigger2 = !(Partner,AuthorName = "fxm508" && Partner,Name = "Orochi_Shermie")
trigger2 = !(Partner,AuthorName = "fxm508" && Partner,Name = "Orochi_Yashiro")
trigger2 = !(Partner,AuthorName = "fxm508" && Partner,Name = "Orochi_Mature")
trigger2 = !(Partner,AuthorName = "fxm508" && Partner,Name = "Orochi_Vice")
trigger2 = !(Partner,AuthorName = "fxm508" && Partner,Name = "Rugal2nd" && Partner,fvar(29) = 4)
var(56) = 0




[State -2, モード設定(7～10P)]
type = varset
trigger1 = PalNo = [7,10]
fvar(29) = 4
ignorehitpause = 1

[State -2, モード設定(1～4P)]
type = varset
trigger1 = PalNo = [1,4]
trigger2 = 1
fvar(29) = 1
ignorehitpause = 1

[State -2, 02UM Mode]
type = varset
trigger1 = PalNo = [1,2]
trigger2 = 1
fvar(26) = 1
ignorehitpause = 1

;==================================================================

[State -2, EnemyNear]
type = VarSet
triggerall = !var(59)
trigger1 = NumEnemy = 1
trigger2 = NumEnemy > 1
trigger2 = EnemyNear(0),Life > 0
var(2) = 0
ignorehitpause = 1

[State -2, EnemyNear]
type = VarSet
triggerall = !var(59)
trigger1 = NumEnemy > 1
trigger1 = EnemyNear(0),Life <= 0
var(2) = 1
ignorehitpause = 1

;==================================================================
;【AI用距離計算】

[State -2, P2Dist X]
type = VarSet
trigger1 = Facing = 1
fvar(2) = EnemyNear(var(2)),ScreenPos X - ScreenPos X
ignorehitpause = 1

[State -2, P2Dist X]
type = VarSet
trigger1 = Facing = -1
fvar(2) = ScreenPos X - EnemyNear(var(2)),ScreenPos X
ignorehitpause = 1

[State -2, P2Dist Y]
type = VarSet
trigger1 = 1
fvar(3) = EnemyNear(var(2)),Pos Y - Pos Y
ignorehitpause = 1

[State -2, P2BodyDist X];右左正面（自分地上、相手地上）
type = VarSet
triggerall = Facing = 1 && EnemyNear(var(2)),Facing = -1
trigger1 = EnemyNear(var(2)),StateType != A && StateType != A
trigger1 = EnemyNear(var(2)),ScreenPos X - ScreenPos X >= 0
fvar(4) = EnemyNear(var(2)),ScreenPos X - ScreenPos X - (EnemyNear(var(2)),Const(size.ground.front)+Const(size.ground.front))
ignorehitpause = 1

[State -2, P2BodyDist X];右左裏（自分地上、相手地上）
type = VarSet
triggerall = Facing = 1 && EnemyNear(var(2)),Facing = -1
trigger1 = EnemyNear(var(2)),StateType != A && StateType != A
trigger1 = EnemyNear(var(2)),ScreenPos X - ScreenPos X < 0
fvar(4) = EnemyNear(var(2)),ScreenPos X - ScreenPos X + (EnemyNear(var(2)),Const(size.ground.back)-Const(size.ground.front))
ignorehitpause = 1

[State -2, P2BodyDist X];右左正面（自分地上、相手空中）
type = VarSet
triggerall = Facing = 1 && EnemyNear(var(2)),Facing = -1
trigger1 = EnemyNear(var(2)),StateType = A && StateType != A 
trigger1 = EnemyNear(var(2)),ScreenPos X - ScreenPos X >= 0
fvar(4) = EnemyNear(var(2)),ScreenPos X - ScreenPos X - (EnemyNear(var(2)),Const(size.air.front)+Const(size.ground.front))
ignorehitpause = 1

[State -2, P2BodyDist X];右左裏（自分地上、相手空中）
type = VarSet
triggerall = Facing = 1 && EnemyNear(var(2)),Facing = -1
trigger1 = EnemyNear(var(2)),StateType = A && StateType != A 
trigger1 = EnemyNear(var(2)),ScreenPos X - ScreenPos X < 0
fvar(4) = EnemyNear(var(2)),ScreenPos X - ScreenPos X + (EnemyNear(var(2)),Const(size.air.back)-Const(size.ground.front))
ignorehitpause = 1

[State -2, P2BodyDist X];右左正面（自分空中、相手地上）
type = VarSet
triggerall = Facing = 1 && EnemyNear(var(2)),Facing = -1
trigger1 = EnemyNear(var(2)),StateType != A && StateType = A
trigger1 = EnemyNear(var(2)),ScreenPos X - ScreenPos X >= 0
fvar(4) = EnemyNear(var(2)),ScreenPos X - ScreenPos X - (EnemyNear(var(2)),Const(size.ground.front)+Const(size.air.front))
ignorehitpause = 1

[State -2, P2BodyDist X];右左裏（自分空中、相手地上）
type = VarSet
triggerall = Facing = 1 && EnemyNear(var(2)),Facing = -1
trigger1 = EnemyNear(var(2)),StateType != A && StateType = A
trigger1 = EnemyNear(var(2)),ScreenPos X - ScreenPos X < 0
fvar(4) = EnemyNear(var(2)),ScreenPos X - ScreenPos X + (EnemyNear(var(2)),Const(size.ground.back)-Const(size.air.front))
ignorehitpause = 1

[State -2, P2BodyDist X];右左正面（自分空中、相手空中）
type = VarSet
triggerall = Facing = 1 && EnemyNear(var(2)),Facing = -1
trigger1 = EnemyNear(var(2)),StateType = A && StateType = A 
trigger1 = EnemyNear(var(2)),ScreenPos X - ScreenPos X >= 0
fvar(4) = EnemyNear(var(2)),ScreenPos X - ScreenPos X - (EnemyNear(var(2)),Const(size.air.front)+Const(size.air.front))
ignorehitpause = 1

[State -2, P2BodyDist X];右左裏（自分空中、相手空中）
type = VarSet
triggerall = Facing = 1 && EnemyNear(var(2)),Facing = -1
trigger1 = EnemyNear(var(2)),StateType = A && StateType = A 
trigger1 = EnemyNear(var(2)),ScreenPos X - ScreenPos X < 0
fvar(4) = EnemyNear(var(2)),ScreenPos X - ScreenPos X + (EnemyNear(var(2)),Const(size.air.back)-Const(size.air.front))
ignorehitpause = 1

[State -2, P2BodyDist X];右右正面（自分地上、相手地上）
type = VarSet
triggerall = Facing = 1 && EnemyNear(var(2)),Facing = 1
trigger1 = EnemyNear(var(2)),StateType != A && StateType != A
trigger1 = EnemyNear(var(2)),ScreenPos X - ScreenPos X >= 0
fvar(4) = EnemyNear(var(2)),ScreenPos X - ScreenPos X - (EnemyNear(var(2)),Const(size.ground.back)+Const(size.ground.front))
ignorehitpause = 1

[State -2, P2BodyDist X];右右裏（自分地上、相手地上）
type = VarSet
triggerall = Facing = 1 && EnemyNear(var(2)),Facing = 1
trigger1 = EnemyNear(var(2)),StateType != A && StateType != A
trigger1 = EnemyNear(var(2)),ScreenPos X - ScreenPos X < 0
fvar(4) = EnemyNear(var(2)),ScreenPos X - ScreenPos X + (EnemyNear(var(2)),Const(size.ground.front)-Const(size.ground.front))
ignorehitpause = 1

[State -2, P2BodyDist X];右右正面（自分地上、相手空中）
type = VarSet
triggerall = Facing = 1 && EnemyNear(var(2)),Facing = 1
trigger1 = EnemyNear(var(2)),StateType = A && StateType != A 
trigger1 = EnemyNear(var(2)),ScreenPos X - ScreenPos X >= 0
fvar(4) = EnemyNear(var(2)),ScreenPos X - ScreenPos X - (EnemyNear(var(2)),Const(size.air.back)+Const(size.ground.front))
ignorehitpause = 1

[State -2, P2BodyDist X];右右裏（自分地上、相手空中）
type = VarSet
triggerall = Facing = 1 && EnemyNear(var(2)),Facing = 1
trigger1 = EnemyNear(var(2)),StateType = A && StateType != A 
trigger1 = EnemyNear(var(2)),ScreenPos X - ScreenPos X < 0
fvar(4) = EnemyNear(var(2)),ScreenPos X - ScreenPos X + (EnemyNear(var(2)),Const(size.air.front)-Const(size.ground.front))
ignorehitpause = 1

[State -2, P2BodyDist X];右右正面（自分空中、相手地上）
type = VarSet
triggerall = Facing = 1 && EnemyNear(var(2)),Facing = 1
trigger1 = EnemyNear(var(2)),StateType != A && StateType = A
trigger1 = EnemyNear(var(2)),ScreenPos X - ScreenPos X >= 0
fvar(4) = EnemyNear(var(2)),ScreenPos X - ScreenPos X - (EnemyNear(var(2)),Const(size.ground.back)+Const(size.air.front))
ignorehitpause = 1

[State -2, P2BodyDist X];右右裏（自分空中、相手地上）
type = VarSet
triggerall = Facing = 1 && EnemyNear(var(2)),Facing = 1
trigger1 = EnemyNear(var(2)),StateType != A && StateType = A
trigger1 = EnemyNear(var(2)),ScreenPos X - ScreenPos X < 0
fvar(4) = EnemyNear(var(2)),ScreenPos X - ScreenPos X + (EnemyNear(var(2)),Const(size.ground.front)-Const(size.air.front))
ignorehitpause = 1

[State -2, P2BodyDist X];右左正面（自分空中、相手空中）
type = VarSet
triggerall = Facing = 1 && EnemyNear(var(2)),Facing = 1
trigger1 = EnemyNear(var(2)),StateType = A && StateType = A 
trigger1 = EnemyNear(var(2)),ScreenPos X - ScreenPos X >= 0
fvar(4) = EnemyNear(var(2)),ScreenPos X - ScreenPos X - (EnemyNear(var(2)),Const(size.air.back)+Const(size.air.front))
ignorehitpause = 1

[State -2, P2BodyDist X];右左裏（自分空中、相手空中）
type = VarSet
triggerall = Facing = 1 && EnemyNear(var(2)),Facing = 1
trigger1 = EnemyNear(var(2)),StateType = A && StateType = A 
trigger1 = EnemyNear(var(2)),ScreenPos X - ScreenPos X < 0
fvar(4) = EnemyNear(var(2)),ScreenPos X - ScreenPos X + (EnemyNear(var(2)),Const(size.air.front)-Const(size.air.front))
ignorehitpause = 1

[State -2, P2BodyDist X];左右正面（自分地上、相手地上）
type = VarSet
triggerall = Facing = -1 && EnemyNear(var(2)),Facing = 1
trigger1 = EnemyNear(var(2)),StateType != A && StateType != A
trigger1 = ScreenPos X - EnemyNear(var(2)),ScreenPos X >= 0
fvar(4) = ScreenPos X - EnemyNear(var(2)),ScreenPos X - (EnemyNear(var(2)),Const(size.ground.front)+Const(size.ground.front))
ignorehitpause = 1

[State -2, P2BodyDist X];左右裏（自分地上、相手地上）
type = VarSet
triggerall = Facing = -1 && EnemyNear(var(2)),Facing = 1
trigger1 = EnemyNear(var(2)),StateType != A && StateType != A
trigger1 = ScreenPos X - EnemyNear(var(2)),ScreenPos X < 0
fvar(4) = ScreenPos X - EnemyNear(var(2)),ScreenPos X + (EnemyNear(var(2)),Const(size.ground.back)-Const(size.ground.front))
ignorehitpause = 1

[State -2, P2BodyDist X];左右正面（自分地上、相手空中）
type = VarSet
triggerall = Facing = -1 && EnemyNear(var(2)),Facing = 1
trigger1 = EnemyNear(var(2)),StateType = A && StateType != A 
trigger1 = ScreenPos X - EnemyNear(var(2)),ScreenPos X >= 0
fvar(4) = ScreenPos X - EnemyNear(var(2)),ScreenPos X - (EnemyNear(var(2)),Const(size.air.front)+Const(size.ground.front))
ignorehitpause = 1

[State -2, P2BodyDist X];左右裏（自分地上、相手空中）
type = VarSet

triggerall = Facing = -1 && EnemyNear(var(2)),Facing = 1
trigger1 = EnemyNear(var(2)),StateType = A && StateType != A 
trigger1 = ScreenPos X - EnemyNear(var(2)),ScreenPos X < 0
fvar(4) = ScreenPos X - EnemyNear(var(2)),ScreenPos X + (EnemyNear(var(2)),Const(size.air.back)-Const(size.ground.front))
ignorehitpause = 1

[State -2, P2BodyDist X];左右正面（自分空中、相手地上）
type = VarSet

triggerall = Facing = -1 && EnemyNear(var(2)),Facing = 1
trigger1 = EnemyNear(var(2)),StateType != A && StateType = A
trigger1 = ScreenPos X - EnemyNear(var(2)),ScreenPos X >= 0
fvar(4) = ScreenPos X - EnemyNear(var(2)),ScreenPos X - (EnemyNear(var(2)),Const(size.ground.front)+Const(size.air.front))
ignorehitpause = 1

[State -2, P2BodyDist X];左右裏（自分空中、相手地上）
type = VarSet

triggerall = Facing = -1 && EnemyNear(var(2)),Facing = 1
trigger1 = EnemyNear(var(2)),StateType != A && StateType = A
trigger1 = ScreenPos X - EnemyNear(var(2)),ScreenPos X < 0
fvar(4) = ScreenPos X - EnemyNear(var(2)),ScreenPos X + (EnemyNear(var(2)),Const(size.ground.back)-Const(size.air.front))
ignorehitpause = 1

[State -2, P2BodyDist X];左右正面（自分空中、相手空中）
type = VarSet

triggerall = Facing = -1 && EnemyNear(var(2)),Facing = 1
trigger1 = EnemyNear(var(2)),StateType = A && StateType = A 
trigger1 = ScreenPos X - EnemyNear(var(2)),ScreenPos X >= 0
fvar(4) = ScreenPos X - EnemyNear(var(2)),ScreenPos X - (EnemyNear(var(2)),Const(size.air.front)+Const(size.air.front))
ignorehitpause = 1

[State -2, P2BodyDist X];左右裏（自分空中、相手空中）
type = VarSet

triggerall = Facing = -1 && EnemyNear(var(2)),Facing = 1
trigger1 = EnemyNear(var(2)),StateType = A && StateType = A 
trigger1 = ScreenPos X - EnemyNear(var(2)),ScreenPos X < 0
fvar(4) = ScreenPos X - EnemyNear(var(2)),ScreenPos X + (EnemyNear(var(2)),Const(size.air.back)-Const(size.air.front))
ignorehitpause = 1

[State -2, P2BodyDist X];左左正面（自分地上、相手地上）
type = VarSet

triggerall = Facing = -1 && EnemyNear(var(2)),Facing = -1
trigger1 = EnemyNear(var(2)),StateType != A && StateType != A
trigger1 = ScreenPos X - EnemyNear(var(2)),ScreenPos X >= 0
fvar(4) = ScreenPos X - EnemyNear(var(2)),ScreenPos X - (EnemyNear(var(2)),Const(size.ground.back)+Const(size.ground.front))
ignorehitpause = 1

[State -2, P2BodyDist X];左左裏（自分地上、相手地上）
type = VarSet

triggerall = Facing = -1 && EnemyNear(var(2)),Facing = -1
trigger1 = EnemyNear(var(2)),StateType != A && StateType != A
trigger1 = ScreenPos X - EnemyNear(var(2)),ScreenPos X < 0
fvar(4) = ScreenPos X - EnemyNear(var(2)),ScreenPos X + (EnemyNear(var(2)),Const(size.ground.front)-Const(size.ground.front))
ignorehitpause = 1

[State -2, P2BodyDist X];左左正面（自分地上、相手空中）
type = VarSet

triggerall = Facing = -1 && EnemyNear(var(2)),Facing = -1
trigger1 = EnemyNear(var(2)),StateType = A && StateType != A 
trigger1 = ScreenPos X - EnemyNear(var(2)),ScreenPos X >= 0
fvar(4) = ScreenPos X - EnemyNear(var(2)),ScreenPos X - (EnemyNear(var(2)),Const(size.air.back)+Const(size.ground.front))
ignorehitpause = 1

[State -2, P2BodyDist X];左左裏（自分地上、相手空中）
type = VarSet

triggerall = Facing = -1 && EnemyNear(var(2)),Facing = -1
trigger1 = EnemyNear(var(2)),StateType = A && StateType != A 
trigger1 = ScreenPos X - EnemyNear(var(2)),ScreenPos X < 0
fvar(4) = ScreenPos X - EnemyNear(var(2)),ScreenPos X + (EnemyNear(var(2)),Const(size.air.front)-Const(size.ground.front))
ignorehitpause = 1

[State -2, P2BodyDist X];左左正面（自分空中、相手地上）
type = VarSet

triggerall = Facing = -1 && EnemyNear(var(2)),Facing = -1
trigger1 = EnemyNear(var(2)),StateType != A && StateType = A
trigger1 = ScreenPos X - EnemyNear(var(2)),ScreenPos X >= 0
fvar(4) = ScreenPos X - EnemyNear(var(2)),ScreenPos X - (EnemyNear(var(2)),Const(size.ground.back)+Const(size.air.front))
ignorehitpause = 1

[State -2, P2BodyDist X];左左裏（自分空中、相手地上）
type = VarSet

triggerall = Facing = -1 && EnemyNear(var(2)),Facing = -1
trigger1 = EnemyNear(var(2)),StateType != A && StateType = A
trigger1 = ScreenPos X - EnemyNear(var(2)),ScreenPos X < 0
fvar(4) = ScreenPos X - EnemyNear(var(2)),ScreenPos X + (EnemyNear(var(2)),Const(size.ground.front)-Const(size.air.front))
ignorehitpause = 1

[State -2, P2BodyDist X];左左正面（自分空中、相手空中）
type = VarSet

triggerall = Facing = -1 && EnemyNear(var(2)),Facing = -1
trigger1 = EnemyNear(var(2)),StateType = A && StateType = A 
trigger1 = ScreenPos X - EnemyNear(var(2)),ScreenPos X >= 0
fvar(4) = ScreenPos X - EnemyNear(var(2)),ScreenPos X - (EnemyNear(var(2)),Const(size.air.back)+Const(size.air.front))
ignorehitpause = 1

[State -2, P2BodyDist X];左左裏（自分空中、相手空中）
type = VarSet

triggerall = Facing = -1 && EnemyNear(var(2)),Facing = -1
trigger1 = EnemyNear(var(2)),StateType = A && StateType = A 
trigger1 = ScreenPos X - EnemyNear(var(2)),ScreenPos X < 0
fvar(4) = ScreenPos X - EnemyNear(var(2)),ScreenPos X + (EnemyNear(var(2)),Const(size.air.front)-Const(size.air.front))
ignorehitpause = 1


[State -2, EnemyNear(Target代用)]
type = VarSet

trigger1 = NumEnemy = 1 || NumTarget = 1
trigger2 = NumEnemy > 1 && NumTarget > 1
trigger2 = EnemyNear(0),MoveType = H && EnemyNear(1),MoveType = H
trigger2 = EnemyNear(0),Const(size.head.pos.y) >= EnemyNear(1),Const(size.head.pos.y) 
trigger3 = NumEnemy > 1
trigger3 = EnemyNear(0),MoveType = H && EnemyNear(1),MoveType != H
var(5) = 0
ignorehitpause = 1

[State -2, EnemyNear(Target代用)]
type = VarSet

trigger1 = NumEnemy > 1 && NumTarget > 1
trigger1 = EnemyNear(0),MoveType = H && EnemyNear(1),MoveType = H
trigger1 = EnemyNear(0),Const(size.head.pos.y) < EnemyNear(1),Const(size.head.pos.y) 
trigger2 = NumEnemy > 1
trigger2 = EnemyNear(0),MoveType != H && EnemyNear(1),MoveType = H
var(5) = 1
ignorehitpause = 1


[State -2, Facing];1で対峙、-1で同一方向
type = VarSet

trigger1 = 1
var(6) = -(Facing)*(EnemyNear(var(2)),Facing)
ignorehitpause = 1

;==================================================================

[State -2, ラウンド開始時間]
type = varset

trigger1 = RoundState != 2
var(7) = 0

[State -2]
type = varset

triggerall = !var(7)
trigger1 = Ctrl
var(7) = GameTime

[State -2, ステート奪取判定用]
type = VarSet

trigger1 = 1
var(23) = GameTime
ignorehitpause = 1

;==================================================================

[State -2, ランダム変数(1-10)]
type = varrandom

trigger1 = 1
v = 10
range = 1,10
ignorehitpause = 1

;==================================================================

[State -2, Air Guard]
type = AssertSpecial
trigger1 = Vel X > 0 || !(P2StateType = A)
trigger2 = fvar(29) = 1
flag = noairguard
ignorehitpause = 1

[State -2, Air Guard]
type = AssertSpecial
triggerall = P2StateType = A
trigger1 = EnemyNear(var(2)),Vel X > 0 || !(StateType = A)
trigger2 = fvar(29) = 1
flag = unguardable
ignorehitpause = 1


[State -2, ガード中投げ無敵]
type = NotHitBy
trigger1 = (StateNo = [130,140]) || (StateNo = [140,160))
value = ,AT
time = 1
ignorehitpause = 1


[State -2]
type = VarAdd
triggerall = PalNo = 12
trigger1 = MoveType = H
var(16) = Ceil(Floor(GetHitVar(damage))/50.0)
ignorehitpause = 1

[State -2]
type = VarAdd
triggerall = PalNo = 12
triggerall = MoveType = H
triggerall = StateType = A
trigger1 = EnemyNear(var(2)),MoveType = I
var(16) = 10
ignorehitpause = 1

[State -2]
type = VarSet
triggerall = PalNo = 12
trigger1 = var(16)
trigger1 = !(MoveType = H)
var(16) = 0
ignorehitpause = 1

[State -2]
type = NotHitBy
triggerall = PalNo = 12
triggerall = MoveType = H
trigger1 = var(16) >= 10
value = SCA
time = 1
ignorehitpause = 1

[State -2]
type = SelfState
triggerall = PalNo = 12
trigger1 = MoveReversed
value = 5050
ignorehitpause = 1

[State -2]
type = LifeAdd
triggerall = PalNo = 12
triggerall = Life > 0
triggerall = !(MoveType = H)
trigger1 = ((100*life/lifemax) < 33)
value = 1
ignorehitpause = 1

[State -2]
type = LifeAdd
triggerall = PalNo = 12
trigger1 = GetHitVar(damage) = Life
trigger1 = GetHitVar(damage) >= 100
trigger2 = abs(var(22)-var(23)) > 2
trigger2 = GetHitVar(damage) = 0
trigger2 = Life = 0
value = 1
ignorehitpause = 1
kill = 1

[State -2]
type = PowerAdd
triggerall = PalNo = 12
triggerall = RoundState = 2 && Life > 0
trigger1 = var(7)
value = 2
ignorehitpause = 1


;==================================================================

[State -2, DefenceMulSet]
type = Null;DefenceMulSet
triggerall = fvar(29) != 4 && !fvar(26)
triggerall = !fvar(28)
trigger1 = 1
value = 2
ignorehitpause = 1

[State -2, DefenceMulSet]
type = Null;LifeAdd
triggerall = fvar(29) != 4 && !fvar(26)
triggerall = !fvar(28)
triggerall = !(PrevStateNo = [5000,5300])
triggerall = !(StateNo = [120,160))
trigger1 = GetHitVar(hitcount) = 1
trigger1 = GetHitVar(damage) > 0
value = -Floor(GetHitVar(damage)*(2-1))
absolute = 1
ignorehitpause = 1

[State -2, DefenceMulSet]
type = Null;DefenceMulSet
triggerall = fvar(29) = 1 && !fvar(26)
triggerall = fvar(28)
trigger1 = 1
value = 1.5
ignorehitpause = 1

[State -2, DefenceMulSet]
type = Null;LifeAdd
triggerall = fvar(29) = 1 && !fvar(26)
triggerall = fvar(28)
triggerall = !(PrevStateNo = [5000,5300])
triggerall = !(StateNo = [120,160))
trigger1 = GetHitVar(hitcount) = 1
trigger1 = GetHitVar(damage) > 0
value = -Floor(GetHitVar(damage)*(1.5-1))
absolute = 1
ignorehitpause = 1

[State -2, DefenceMulSet]
type = Null;DefenceMulSet
triggerall = fvar(29) = 4
triggerall = !fvar(28)
trigger1 = 1
value = 4
ignorehitpause = 1

[State -2, DefenceMulSet]
type = Null;LifeAdd
triggerall = fvar(29) = 4
triggerall = !fvar(28)
triggerall = !(PrevStateNo = [5000,5300])
triggerall = !(StateNo = [120,160))
trigger1 = GetHitVar(hitcount) = 1
trigger1 = GetHitVar(damage) > 0
value = -Floor(GetHitVar(damage)*(4-1))
absolute = 1
ignorehitpause = 1

[State -2, DefenceMulSet]
type = Null;DefenceMulSet
triggerall = fvar(29) = 1 && fvar(26)
triggerall = !fvar(28)
trigger1 = 1
value = 3
ignorehitpause = 1

[State -2, DefenceMulSet]
type = Null;LifeAdd
triggerall = fvar(29) = 1 && fvar(26)
triggerall = !fvar(28)
triggerall = !(PrevStateNo = [5000,5300])
triggerall = !(StateNo = [120,160))
trigger1 = GetHitVar(hitcount) = 1
trigger1 = GetHitVar(damage) > 0
value = -Floor(GetHitVar(damage)*(3-1))
absolute = 1
ignorehitpause = 1

;==================================================================

[State -2, 空中連続ヒット制限]
type = varset
triggerall = P2MoveType = H
triggerall = !(NumTarget(1000))
triggerall = !(NumTarget(1300) || NumTarget(1301) || NumTarget(1302))
triggerall = !(NumTarget(1305) || NumTarget(1306) || NumTarget(1307) || NumTarget(1308) || NumTarget(1309))
triggerall = !(NumTarget(1350) || NumTarget(1351) || NumTarget(1352))
triggerall = !(NumTarget(1355) || NumTarget(1356) || NumTarget(1357) || NumTarget(1358) || NumTarget(1359))
triggerall = !(NumTarget(1402) || NumTarget(1452) || (NumTarget(1453) && !(fvar(29) = 1 && !fvar(26))))
triggerall = !(NumTarget(1800) || NumTarget(1850))
trigger1 = P2Statetype = A
trigger1 = MoveHit = 1
trigger2 = NumTarget(240) || NumTarget(245) || NumTarget(430) || Numtarget(640)
trigger2 = MoveHit = 1
trigger3 = ProjHitTime(1000) = 0
trigger4 = ProjHitTime(1100) = 0
trigger4 = P2StateType = A
trigger5 = ProjHitTime(1150) = 0
trigger5 = P2StateType = A
trigger6 = ProjHitTime(1510) = 0
trigger6 = P2StateType = A
trigger7 = ProjHitTime(1884) = 0
var(9) = 1

[State -2, 空中連続ヒット制限]
type = varset
trigger1 = EnemyNear(var(2)),Life > 0 && EnemyNear(var(2)),Ctrl
trigger2 = var(49) = [1,2]
trigger2 = NumTarget(1302) = 0
trigger3 = !(P2MoveType = H)
trigger4 = P2StateType = L
trigger5 = P2StateNo = 5120
trigger6 = NumPartner
trigger6 = !(P2StateType = A || P2StateType = L)
trigger6 = Partner,NumTarget
var(9) = 0
ignorehitpause = 1

[State -2, 02UM超必殺技空中ヒット制限]
type = varset
triggerall = fvar(26)
triggerall = MoveHit = 1
trigger1 = NumTarget(1402) || NumTarget(1452) || NumTarget(1453)
trigger2 = NumTarget(1300) || NumTarget(1301) || NumTarget(1350) || NumTarget(1351)
var(8) = 1
ignorehitpause = 1

[State -2, 02UM超必殺技空中ヒット制限]
type = varset
trigger1 = !fvar(26)
trigger2 = !(NumTarget(1402) || NumTarget(1452) || NumTarget(1453))
trigger2 = !(NumTarget(1300) || NumTarget(1301) || NumTarget(1350) || NumTarget(1351))
trigger2 = MoveHit = 1
trigger3 = !(P2MoveType = H)
trigger4 = P2StateType = L
trigger5 = EnemyNear(var(2)),Life > 0 && EnemyNear(var(2)),Ctrl
trigger6 = ProjHitTime(0) = 0
var(8) = 0
ignorehitpause = 1


[State -2, バニシングラッシュヒット制限]
type = varset

trigger1 = ProjHitTime(1890) = 0
var(28) = 1
ignorehitpause = 1

[State -2, バニシングラッシュヒット制限]
type = varset

triggerall = var(28)
trigger1 = !(P2MoveType = H)
var(28) = 0
ignorehitpause = 1

;==================================================================
;CornerPush

[State -2, cornerpush 2002 && 98UM]
type = VelSet
triggerall = !(EnemyNear(var(2)),StateType = A)
triggerall = EnemyNear(var(2)),BackEdgeBodyDist <= 10
triggerall = MoveContact = 1
trigger1 = StateNo = 235 && NumTarget(235)
trigger2 = StateNo = 260 && NumTarget(260)
x = 0

[State -2, cornerpush 2002]
type = Null;VelSet
triggerall = !(EnemyNear(var(2)),StateType = A)
triggerall = EnemyNear(var(2)),BackEdgeBodyDist <= 10
triggerall = MoveContact = 1
trigger1 = StateNo = 200 && NumTarget(200)
trigger2 = StateNo = 205 && NumTarget(205)
trigger3 = StateNo = 220 && NumTarget(220)
trigger4 = StateNo = 225 && NumTarget(225)
trigger5 = StateNo = 230 && NumTarget(230)
trigger6 = StateNo = 400 && NumTarget(400)
trigger7 = StateNo = 420 && NumTarget(420)
x = -5.75-(fvar(29)=4&&var(52)>0)*1.35

[State -2, cornerpush 2002]
type = Null;VelSet
triggerall = !(EnemyNear(var(2)),StateType = A)
triggerall = EnemyNear(var(2)),BackEdgeBodyDist <= 10
triggerall = MoveContact = 1
trigger1 = StateNo = 215 && NumTarget(215)
x = -8-(fvar(29)=4&&var(52)>0)

[State -2, cornerpush 2002]
type = Null;VelSet
triggerall = !(EnemyNear(var(2)),StateType = A)
triggerall = EnemyNear(var(2)),BackEdgeBodyDist <= 10
triggerall = MoveContact = 1
;trigger1 = StateNo = 210 && NumTarget(210)
;trigger2 = StateNo = 215 && NumTarget(216)
;trigger3 = StateNo = 230 && NumTarget(231)
;trigger4 = StateNo = 235 && NumTarget(236)
;trigger5 = StateNo = 250 && NumTarget(250)
;trigger6 = StateNo = 260 && NumTarget(261)
;trigger7 = StateNo = 410 && NumTarget(410)
;trigger8 = StateNo = 430 && NumTarget(430)
trigger1 = StateNo = 1450 && NumTarget(1453) && (fvar(29) = 1 && !fvar(26))
x = -5.75-(fvar(29)=4&&var(52)>0)*1.35

[State -2, cornerpush 2002]
type = Null;VelSet
triggerall = !(EnemyNear(var(2)),StateType = A)
triggerall = EnemyNear(var(2)),BackEdgeBodyDist <= 10
triggerall = MoveContact = 1
trigger1 = StateNo = 2500 && NumTarget(2500) && MoveGuarded = 1
x = -11.5

[State -2, cornerpush 2002]
type = Null;VelSet
triggerall = !(EnemyNear(var(2)),StateType = A)
triggerall = EnemyNear(var(2)),BackEdgeBodyDist <= 10
triggerall = MoveContact = 1
trigger1 = StateNo = 240 && NumTarget(240) && MoveGuarded = 1
trigger2 = StateNo = 245 && NumTarget(245) && MoveGuarded = 1
x = -5.75-(fvar(29)=4&&var(52)>0)*1.35

[State -2, Air.CornerPush]
type = VarAdd
triggerall = StateType = A
trigger1 = var(11)
var(11) = 1

;==================================================================

[State -2, クイックMAX発動]
type = Pause
triggerall = fvar(29) != 1
triggerall = var(52) = IfElse((fvar(34) = 2 && var(53)),1560,1080)
trigger1 = MoveContact && StateNo < 2000
trigger1 = HitPauseTime > 0
time = HitPauseTime
movetime = HitPauseTime
ignorehitpause = 1 

[State -2, Pauseキャンセル]
type = Pause
triggerall = MoveContact = [1,5]
triggerall = HitPauseTime > 0
trigger1 = StateNo = 905 || StateNo = 935 || StateNo = 951
time = HitPauseTime
movetime = HitPauseTime
ignorehitpause = 1 

;==================================================================

[State -2, パワー溜めエフェクト消去]
type = RemoveExplod
trigger1 = !(StateNo = 980)
ID = 7500

[State -2, ダッシュ音停止]
type = StopSnd
trigger1 = !(StateNo = 100)
trigger1 = !(StateNo = 1200 || StateNo = 1250)
trigger1 = !(StateNo = 2000 || StateNo = 2050 || StateNo = 2100)
channel = 1
ignorehitpause = 1

[State -2, パワー溜め音中断]
type = stopsnd
trigger1 = !(StateNo = 980)
channel = 2
ignorehitpause = 1

[State -2, パワー溜めボイス中断]
type = stopsnd
trigger1 = !(StateNo = 980)
channel = 3
ignorehitpause = 1

[State -2, 残像消去]
type = AfterImageTime
trigger1 = !(StateNo = 38)
trigger1 = !(StateNo = 50)
trigger1 = !(StateNo = 900 || StateNo = 905)
trigger1 = !(StateNo = 910 || StateNo = 915)
trigger1 = !(StateNo = 2000 || StateNo = 2010 || StateNo = 2050)
trigger1 = !(StateNo = 2100 || StateNo = 2110 || StateNo = 2112)
trigger1 = !(StateNo = 2700 || StateNo = 2750 || StateNo = 2800)
time = 0
ignorehitpause = 1

[State -2, 白羅滅精エフェクト消去]
type = RemoveExplod
trigger1 = !(StateNo = [2400,2401])
ID = 2440

[State -2]
type = VarAdd

trigger1 = var(24)
var(24) = 1
ignorehitpause = 1

[State -2, ジェノサイドカッター 98 ボイス]
type = PlaySnd
trigger1 = var(24)
trigger1 = var(24) = 47
value = S2,16
volume = 150
channel = 7
lowpriority = 1
ignorehitpause = 1

[State -2, ジェノサイドカッター 98 ボイス]
type = VarSet

trigger1 = var(24)
trigger1 = var(24) >= 47
trigger2 = MoveType = H
trigger3 = !((StateNo = [1300,1400)) || StateNo = 1950)
var(24) = 0
ignorehitpause = 1

[State -2, ダークバリヤーエフェクト消去]
type = RemoveExplod
trigger1 = !(StateNo = [1500,1600))
trigger2 = NumHelper(1500)
trigger2 = Helper(1500),StateNo = 1510
trigger3 = NumHelper(1500)
trigger3 = Helper(1500),GetHitVar(damage) > 0
trigger4 = NumHelper(1550)
trigger4 = Helper(1550),StateNo = 1510
trigger5 = NumHelper(1550)
trigger5 = Helper(1550),GetHitVar(damage) > 0
ID = 8112
ignorehitpause = 1

[State -2, グラビティスマッシュ中断]
type = StopSnd
trigger1 = MoveType = H
trigger1 = Time = [1,2]
channel = 8
ignorehitpause = 1

[State -2, バニシングラッシュ中断]
type = StopSnd
trigger1 = MoveType = H
trigger1 = Time = [1,2]
channel = 10
ignorehitpause = 1

[State -2, 白羅滅精終了]
type = StopSnd
trigger1 = !(StateNo = [2400,2401])
trigger2 = MoveType = H
channel = 15
ignorehitpause = 1

[State -2, MAX2背景消去]
type = RemoveExplod
trigger1 = !(StateNo = [3000,3100))
ID = 7700
ignorehitpause = 1

[State -2, イントロエフェクト消去]
type = RemoveExplod
trigger1 = !(StateNo = 197)
ID = 197
ignorehitpause = 1

;==================================================================

[State -2, ダメージボイス]
type = PlaySnd
triggerall = RoundState = 2
triggerall = Life > 0
triggerall = GetHitVar(damage) > 0
triggerall = Life > GetHitVar(damage)
triggerall = GetHitVar(guarded) = 0
triggerall = Random%2 = 1
trigger1 = NumEnemy = 1
trigger1 = !(Enemy,StateNo >= 1000 || Enemy,ProjHit = 1)
trigger2 = NumEnemy > 1
trigger2 = !(Enemy(0),StateNo >= 1000 || Enemy(0),ProjHit = 1)
trigger2 = !(Enemy(1),StateNo >= 1000 || Enemy(1),ProjHit = 1)
value = S4,((0+(GetHitVar(animtype)>1))+(fvar(29)=[1,3])*50)+(fvar(26)=1)*20
volume = 200
channel = 4
lowpriority = 1
ignorehitpause = 1


[State -2, ダメージボイス]
type = PlaySnd
triggerall = RoundState = 2
triggerall = Life > 0
triggerall = GetHitVar(damage) > 0
triggerall = Life > GetHitVar(damage)
triggerall = GetHitVar(guarded) = 0
triggerall = Random%2 = 1
trigger1 = Enemy(0),StateNo >= 1000 || Enemy(0),ProjHit = 1
trigger2 = NumEnemy > 1
trigger2 = Enemy(1),StateNo >= 1000 || Enemy(1),ProjHit = 1
value = S4,(2+(fvar(29)=[1,3])*50)+(fvar(26)=1)*20
volume = 200
channel = 4
lowpriority = 1
ignorehitpause = 1


;==================================================================

[State -2, PowerAdd 98UM EX]
type = PowerAdd
triggerall = fvar(26) != 1
triggerall = fvar(34) = 2
triggerall = !(var(52) || (NumPartner = 0 && Power >= 1000))
triggerall = MoveType = H
triggerall = !((StateNo = [120,160)) || (StateNo = [5000,5300)))
trigger1 = GetHitVar(damage) > 0
value = 62 + Random%2 - var(54) * (NumPartner = 0)
ignorehitpause = 1

;==================================================================

[State -2, 飛び道具ヒット]
type = PowerAdd
trigger1 = ProjContactTime(1000) = 0
trigger2 = ProjContactTime(1001) = 0
trigger3 = ProjContactTime(1002) = 0
trigger4 = ProjContactTime(1100) = 0
trigger5 = ProjContactTime(1150) = 0
value = IfElse(((var(52)||fvar(34)=2)&&(fvar(29)=1||fvar(29)=4)),0,175)
ignorehitpause = 1

;==================================================================


[State -2, MAX発動時パワーゲージ量記録(2002)]
type = VarSet

triggerall = fvar(29) = 1
triggerall = var(52) = 779 || Time = 1
trigger1 = var(52) = 779
trigger2 = (PrevStateNo = 150 || PrevStateNo = 152)
trigger3 = StateNo = 905 || StateNo = 935
trigger4 = StateNo = 2000 || StateNo = 2050
trigger5 = StateNo = 2100 || StateNo = 2150
trigger6 = StateNo = 2200 || StateNo = 2250
trigger7 = StateNo = 2300 || StateNo = 2350
trigger8 = StateNo = 2400 || StateNo = 2450
trigger9 = StateNo = 2500 || StateNo = 2550
trigger10 = StateNo = 2600 || StateNo = 2650
trigger11 = StateNo = 2700 || StateNo = 2750
trigger12 = StateNo = 2800 || StateNo = 2850
trigger13 = StateNo = 2900 || StateNo = 2950
trigger14 = StateNo = 3000 || StateNo = 3050
trigger15 = StateNo = 3100 || StateNo = 3150
var(45) = Power
ignorehitpause = 1

[State -2, MAX発動時パワーゲージ量記録(98UM)]
type = VarSet

triggerall = fvar(29) = 4 && fvar(34) = 1
triggerall = var(52) = 1079 || Time = 1
trigger1 = var(52) = 1079
trigger2 = (PrevStateNo = 150 || PrevStateNo = 152)
trigger3 = StateNo = 905 || StateNo = 935
trigger4 = StateNo = 1000 || StateNo = 1050
trigger5 = StateNo = 1100 || StateNo = 1150
trigger6 = StateNo = 1200 || StateNo = 1250
trigger7 = StateNo = 1300 || StateNo = 1305 || StateNo = 1350 || StateNo = 1355
trigger8 = StateNo = 1400 || StateNo = 1450
trigger9 = StateNo = 1500 || StateNo = 1550
trigger10 = StateNo = 1600 || StateNo = 1650
trigger11 = StateNo = 1700 || StateNo = 1720 || StateNo = 1750 || StateNo = 1770
trigger12 = StateNo = 1800 || StateNo = 1850
trigger13 = StateNo = 1900 || StateNo = 1950
trigger14 = StateNo = 2000 || StateNo = 2050
trigger15 = StateNo = 2100 || StateNo = 2150
trigger16 = StateNo = 2200 || StateNo = 2250
trigger17 = StateNo = 2300 || StateNo = 2350
trigger18 = StateNo = 2400 || StateNo = 2450
trigger19 = StateNo = 2500 || StateNo = 2550
trigger20 = StateNo = 2600 || StateNo = 2650
trigger21 = StateNo = 2700 || StateNo = 2750
trigger22 = StateNo = 2800 || StateNo = 2850
trigger23 = StateNo = 2900 || StateNo = 2950
trigger24 = StateNo = 3000 || StateNo = 3050
trigger25 = StateNo = 3100 || StateNo = 3150
var(45) = Power
ignorehitpause = 1

[State -2, MAX発動音]
type = PlaySnd
trigger1 = fvar(29) != 1
trigger1 = var(52) = 1080 + ((!(fvar(29) = 1 || fvar(29) = 4) || fvar(34) = 2) && var(53))*480
value = S8,0
ignorehitpause = 1

[State -2, MAX発動時パワー減少]
type = PowerAdd
trigger1 = fvar(34) = 1 || !(fvar(29) = 1 || fvar(29) = 4)
trigger1 = var(52) = 1080 + (!(fvar(29) = 1 || fvar(29) = 4) && var(53))*480
trigger2 = fvar(34) = 2
trigger2 = NumHelper(27000)
trigger2 = Helper(27000),StateNo = 27001
trigger2 = Helper(27000),Time = 1
value = -1000
ignorehitpause = 1

[State -2, MAX発動タイマー]
type = VarAdd
trigger1 = var(52) > 0
var(52) = -1
ignorehitpause = 1

[State -2, MAX発動タイマー]
type = VarSet
trigger1 = var(52) < 0
var(52) = 0
ignorehitpause = 1


[State -2, MAX発動中点滅]
type = PalFX
triggerall = fvar(29) != 1
triggerall = var(52) > 0
triggerall = MoveType != H
triggerall = !var(46) || StateNo < 1000 || Time >= 9
trigger1 = (GameTime%2) = 0
time = 1
add = 60,60,60
ignorehitpause = 1

[State -2, MAX発動中点滅]
type = PalFX
triggerall = fvar(29) = 1
triggerall = var(52) > 0
triggerall = MoveType != H
triggerall = !var(46) || StateNo < 1000 || Time >= 9
trigger1 = (GameTime%2) = 0
time = 1
add = 64,64,0
ignorehitpause = 1

[State -2, MAX発動中攻撃力補正]
type = varset
triggerall = var(52)
trigger1 = fvar(29) = 1
fvar(10) = 0.75
ignorehitpause = 1

[State -2, MAX発動中攻撃力補正]
type = varset
triggerall = var(52)
trigger1 = fvar(29) = 4
fvar(10) = 1.25
ignorehitpause = 1

[State -2, MAX発動中攻撃力補正]
type = varset
triggerall = var(52)
trigger1 = !(fvar(29) = 1 || fvar(29) = 4)
fvar(10) = 1.5*(1+(Life<=10)*0.25)
ignorehitpause = 1

[State -2, MAX発動中攻撃力補正]
type = varset
triggerall = !var(52)
trigger1 = fvar(29) = 1 || fvar(29) = 4
fvar(10) = 1
ignorehitpause = 1

[State -2, MAX発動中攻撃力補正]
type = varset
triggerall = !var(52)
trigger1 = !(fvar(29) = 1 || fvar(29) = 4)
fvar(10) = 1*(1+(Life<=10)*0.25)
ignorehitpause = 1

;==================================================================

[State -2, モード決定]
type = VarSet
trigger1 = !(fvar(29) = 4)
fvar(32) = 1

[State -2, モード決定]
type = VarSet
trigger1 = !(fvar(29) = 4)
fvar(33) = 1

[State -2, モード決定]
type = VarSet
trigger1 = !(fvar(29) = 4)
fvar(34) = 1

[State -2, モード決定（時間切れ）]
type = VarSet
triggerall = fvar(29) = 4
triggerall = RoundState = 2
triggerall = var(7)
triggerall = !fvar(32)
trigger1 = NumPartner = 0
trigger2 = NumPartner = 1
trigger2 = !var(56)
trigger3 = NumPartner = 1
trigger3 = var(56)
trigger3 = ID < Partner,ID
fvar(32) = 1+Random%2

[State -2, モード決定（時間切れ）]
type = VarSet
triggerall = fvar(29) = 4
triggerall = RoundState = 2
triggerall = var(7)
triggerall = !fvar(33)
trigger1 = NumPartner = 0
trigger2 = NumPartner = 1
trigger2 = !var(56)
trigger3 = NumPartner = 1
trigger3 = var(56)
trigger3 = ID < Partner,ID
fvar(33) = 1+Random%2

[State -2, モード決定（時間切れ）]
type = VarSet
triggerall = fvar(29) = 4
triggerall = RoundState = 2
triggerall = var(7)
triggerall = !fvar(34)
trigger1 = NumPartner = 0
trigger2 = NumPartner = 1
trigger2 = !var(56)
trigger3 = NumPartner = 1
trigger3 = var(56)
trigger3 = ID < Partner,ID
fvar(34) = 1+Random%2

[State -2, モード決定（パートナー合わせ）]
type = VarSet
triggerall = fvar(29) = 4
triggerall = RoundState = 2
triggerall = var(7)
triggerall = NumPartner = 1
triggerall = !fvar(32) || fvar(32) != Partner,fvar(32)
trigger1 = var(56)
trigger1 = ID > Partner,ID
trigger1 = Partner,fvar(32)
fvar(32) = Partner,fvar(32)

[State -2, モード決定（パートナー合わせ）]
type = VarSet
triggerall = fvar(29) = 4
triggerall = RoundState = 2
triggerall = var(7)
triggerall = NumPartner = 1
triggerall = !fvar(33) || fvar(33) != Partner,fvar(33)
trigger1 = var(56)
trigger1 = ID > Partner,ID
trigger1 = Partner,fvar(33)
fvar(33) = Partner,fvar(33)

[State -2, モード決定（パートナー合わせ）]
type = VarSet
triggerall = fvar(29) = 4
triggerall = RoundState = 2
triggerall = var(7)
triggerall = NumPartner = 1
triggerall = !fvar(34) || fvar(34) != Partner,fvar(34)
trigger1 = var(56)
trigger1 = ID > Partner,ID
trigger1 = Partner,fvar(34)
fvar(34) = Partner,fvar(34)

;==================================================================

[State -2, 先行入力受付ヘルパー]
type = Helper
triggerall = RoundState > 0
triggerall = !var(59)
trigger1 = NumHelper(12000) = 0
ID = 12000
name = "ReversalCommand"
postype = p1
pos = -999,0
facing = -1
sprpriority = -1
stateno = 12000
helpertype = normal
keyctrl = 0
ignorehitpause = 1
ownpal = 1
pausemovetime = 2147483647
supermovetime = 2147483647


[State -2, モード選択用ヘルパー98UM]
type = Helper
triggerall = fvar(29) = 4
triggerall = RoundState = [0,1]
triggerall = !fvar(32) && !fvar(33) && !fvar(34)
triggerall = NumHelper(25000) = 0
triggerall = NumHelper(20000) = 0
triggerall = RoundsExisted = 0
trigger1 = NumPartner = 0
trigger2 = NumPartner = 1
trigger2 = Partner,AuthorName != "fxm508" || ID < Partner,ID
trigger3 = Partner,AuthorName = "fxm508"
ID = 20000
name = "ModeSelect"
postype = back
pos = 50,-18
facing = -1 + (TeamSide = 1)*2
sprpriority = -1
stateno = 20000
helpertype = normal
keyctrl = 0
ignorehitpause = 1
ownpal = 1
pausemovetime = 2147483647
supermovetime = 2147483647


[State -2, パワーゲージシステム管理ヘルパー98UM]
type = Helper
triggerall = fvar(29) != 1
triggerall = RoundState > 0 || RoundsExisted > 0
triggerall = fvar(30)
triggerall = NumHelper(25000) = 0
triggerall = NumHelper(20000) = 0
triggerall = fvar(32) && fvar(33) && fvar(34)
trigger1 = NumPartner = 0
trigger2 = NumPartner = 1
trigger2 = !(Partner,AuthorName = "fxm508" && Partner,fvar(30)) || ID < Partner,ID
ID = 25000
name = "PowerGauge"
postype = p1
pos = -999,0
sprpriority = -1
stateno = 25000
helpertype = normal
keyctrl = 0
ignorehitpause = 1
ownpal = 1
pausemovetime = 2147483647
supermovetime = 2147483647


[State -2, パワーゲージシステム管理ヘルパー2002]
type = Helper
triggerall = fvar(29) = 1 && !fvar(26)
triggerall = RoundState > 0
triggerall = fvar(30)
triggerall = NumHelper(25500) = 0
trigger1 = NumPartner = 0
trigger2 = NumPartner = 1
trigger2 = !(Partner,AuthorName = "fxm508" && Partner,fvar(30)) || ID < Partner,ID
ID = 25500
name = "PowerGauge"
postype = p1
pos = -999,0
sprpriority = -1
stateno = 25500
helpertype = normal
keyctrl = 0
ignorehitpause = 1
ownpal = 1
pausemovetime = 2147483647
supermovetime = 2147483647


[State -2, パワーゲージシステム管理ヘルパー2002UM]
type = Helper
triggerall = fvar(29) = 1 && fvar(26)
triggerall = RoundState > 0
triggerall = fvar(30)
triggerall = NumHelper(25600) = 0
trigger1 = NumPartner = 0
trigger2 = NumPartner = 1
trigger2 = !(Partner,AuthorName = "fxm508" && Partner,fvar(30)) || ID < Partner,ID
ID = 25600
name = "PowerGauge"
postype = p1
pos = -999,0
sprpriority = -1
stateno = 25600
helpertype = normal
keyctrl = 0
ignorehitpause = 1
ownpal = 1
pausemovetime = 2147483647
supermovetime = 2147483647

[State -2, 状態監視ヘルパー]
type = Helper
triggerall = RoundState > 0
trigger1 = NumHelper(26000) = 0
ID = 26000
name = "Watcher"
postype = p1
pos = -999,0
facing = 1
sprpriority = -1
stateno = 26000
helpertype = normal
keyctrl = 0
ignorehitpause = 1
ownpal = 1
pausemovetime = 2147483647
supermovetime = 2147483647


[State -2, MAX発動状態判別ヘルパー（EXゲージ専用）98UM]
type = Helper
triggerall = fvar(29) = 4
triggerall = RoundState > 0
triggerall = fvar(34) = 2
triggerall = NumHelper(27000) = 0
trigger1 = var(52)
ID = 27000
name = "MAX(EX)"
postype = p1
pos = -999,0
sprpriority = -1
stateno = 27000
helpertype = normal
keyctrl = 0
ignorehitpause = 1
ownpal = 1
pausemovetime = 2147483647
supermovetime = 2147483647

;==================================================================
;カウンターヒット

[State -2, カウンターヒット判定]
type = VarSet
triggerall = !var(48)
triggerall = !var(49)
trigger1 = P2MoveType = A
var(48) = 1

[State -2, カウンターヒット判定]
type = VarAdd
trigger1 = var(48)
var(48) = 1

[State -2, カウンターヒット・ダメージ];要調整
type = TargetLifeAdd
triggerall = var(48)
triggerall = NumTarget = 1
trigger1 = !(StateNo = [800,900))
trigger1 = MoveHit
trigger2 = ProjHitTime(0) = 0
trigger2 = !(ProjHitTime(1510) = 0)
value = -Ceil(Target,GetHitVar(damage)*0.25)
absolute = 1
ignorehitpause = 1

[State -2, カウンターヒット・フラッシュ]
type = EnvColor
trigger1 = var(49) = 2
value = 255,255,255
time = 1
under = 1

[State -2, カウンターヒットフラグ];要調整
type = VarSet
triggerall = !var(49)
triggerall = var(48)
trigger1 = !(StateNo = [800,900))
trigger1 = MoveHit
trigger2 = ProjHitTime(0) = 0
trigger3 = NumHelper(1506)
trigger3 = Helper(1506),MoveHit
trigger4 = NumHelper(1556)
trigger4 = Helper(1556),MoveHit
trigger5 = NumHelper(1710)
trigger5 = Helper(1710),MoveHit
trigger6 = NumHelper(1730)
trigger6 = Helper(1730),MoveHit
trigger7 = NumHelper(1760)
trigger7 = Helper(1760),MoveHit
trigger8 = NumHelper(1780)
trigger8 = Helper(1780),MoveHit
var(49) = 1
ignorehitpause = 1

[State -2, カウンターヒット判定]
type = VarSet
trigger1 = var(48) > 10
trigger1 = P2MoveType != A && ProjHit = 0
trigger2 = var(49)
var(48) = 0

[State -2, カウンターヒットフラグ]
type = VarAdd
trigger1 = var(49)
var(49) = 1

[State -2, カウンターヒットフラグ]
type = VarSet
triggerall = var(49)
trigger1 = var(49) > 10
trigger2 = P2MoveType != H
var(49) = 0

[State -2, カウンターヒット]
type = AssertSpecial
trigger1 = var(49)
flag = nojugglecheck

[State -2]
type = RemoveExplod
trigger1 = NumExplod(7650)
trigger1 = var(49) = 2
ID = 7650
ignorehitpause = 1

[State -2, Counter Hit]
type = Explod
triggerall = TeamSide = 1
triggerall = NumExplod(7650) = 0
triggerall = var(49) = 2
trigger1 = NumTarget
trigger1 = !(StateNo = [800,900))
trigger1 = Target,MoveType = H
trigger2 = NumHelper(1500) && P2MoveType = H
trigger3 = NumHelper(1550) && P2MoveType = H
trigger4 = NumHelper(1710) && P2MoveType = H
trigger5 = NumHelper(1730) && P2MoveType = H
trigger6 = NumHelper(1760) && P2MoveType = H
trigger7 = NumHelper(1780) && P2MoveType = H
anim = 7650+(fvar(29)=1)*10+(fvar(26)=1)*10
id = 7650
pos = 17,95
postype = Left
bindtime = -1
removetime = -2
ontop = 1
ownpal = 1
ignorehitpause = 1
vel = 0,0

[State -2, Counter Hit]
type = Explod
triggerall = TeamSide = 2
triggerall = NumExplod(7650) = 0
triggerall = var(49) = 2
trigger1 = !(StateNo = [800,900))
trigger1 = NumTarget
trigger1 = Target,MoveType = H
trigger2 = NumHelper(1500) && P2MoveType = H
trigger3 = NumHelper(1550) && P2MoveType = H
trigger4 = NumHelper(1710) && P2MoveType = H
trigger5 = NumHelper(1730) && P2MoveType = H
trigger6 = NumHelper(1760) && P2MoveType = H
trigger7 = NumHelper(1780) && P2MoveType = H
anim = 7651+(fvar(29)=1)*10+(fvar(26)=1)*10
id = 7650
pos = -84,95
postype = right
bindtime = -1
removetime = -2
ontop = 1
ownpal = 1
ignorehitpause = 1
vel = 0,0

;==================================================================
;GC必殺技用
[State -2]
type = VarSet
trigger1 = !(StateNo = [120,160])
trigger2 = fvar(29) = 1 || fvar(29) = 4
var(14) = 0

[State -2]
type = VarSet
triggerall = !(fvar(29) = 1 || fvar(29) = 4)
trigger1 = var(14) >= 5
var(15) = 1
ignorehitpause = 1

[State -2]
type = VarSet
trigger1 = !(var(14) >= 5)
var(15) = 0
ignorehitpause = 1

;==================================================================
;超必殺技使用条件

[State -2, 瀕死フラグ]
type = varset
trigger1 = fvar(29) = 1
trigger1 = !((100*life/lifemax) < 25+(fvar(26)=1)*6)
trigger2 = fvar(29) != 1
trigger2 = !((100*life/lifemax) < 33.4)
var(53) = 0
ignorehitpause = 1

[State -2, 瀕死フラグ]
type = varset
trigger1 = fvar(29) = 1
trigger1 = ((100*life/lifemax) < 25+(fvar(26)=1)*6)
trigger2 = fvar(29) != 1
trigger2 = ((100*life/lifemax) < 33.4)
var(53) = 1
ignorehitpause = 1


[State -2, 瀕死時、超必殺連続使用制限(02UM)]
type = VarAdd
triggerall = fvar(29) = 1
triggerall = fvar(26)
triggerall = StateNo != [3000,3100)
trigger1 = var(51)
var(51) = 1
ignorehitpause = 1

[State -2, 瀕死時、超必殺連続使用制限(02UM）]
type = VarSet
triggerall = fvar(29) = 1
trigger1 = !fvar(26)
trigger2 = var(51) >= 180
trigger3 = !var(53)
var(51) = 0
ignorehitpause = 1

[State -2, 瀕死時、超必殺連続使用制限(EXゲージ専用）]
type = VarAdd
triggerall = fvar(29) = 4
triggerall = fvar(34) = 2
triggerall = StateNo != [2000,3000)
trigger1 = var(51)
var(51) = 1
ignorehitpause = 1

[State -2, 瀕死時、超必殺連続使用制限(EXゲージ専用）]
type = VarSet
triggerall = fvar(29) = 4
trigger1 = fvar(34) != 2
trigger2 = var(51) >= 180 - (var(50)>0)*50
trigger3 = !var(53)
var(51) = 0
ignorehitpause = 1

[State -2, 超必殺命中判定(EXゲージ専用）]
type = VarSet
triggerall = fvar(26) != 1
triggerall = fvar(29) = 4
triggerall = StateNo = [2000,3000)
triggerall = fvar(34) = 2 && var(51) && var(53)
trigger1 = MoveHit = 1 || ProjHit = 1
trigger1 = P2MoveType = H
var(50) = 1
ignorehitpause = 1

[State -2, 超必殺命中判定(EXゲージ専用）]
type = VarSet
triggerall = fvar(26) != 1
triggerall = fvar(29) = 4
triggerall = var(50)
trigger1 = !var(51)
var(50) = 0

[State -2, ゲージ増加制限(EXゲージ専用、1人の時のみ）]
type = PowerSet
triggerall = RoundState >= 2 && var(7)
triggerall = fvar(29) = 4 && fvar(34) = 2
trigger1 = NumPartner = 0
trigger1 = Power > 1000
value = 1000
ignorehitpause = 1

[State -2, ゲージ増加制限(ADVゲージ専用、1人の時のみ）]
type = PowerSet
triggerall = RoundState >= 2 && var(7)
triggerall = fvar(29) = 4 && fvar(34) = 1
trigger1 = NumPartner = 0
trigger1 = var(52) = (0,1079)
trigger1 = !(StateNo = [1000,4000))
trigger1 = !(StateNo = [900,1000))
value = var(45)
ignorehitpause = 1

[State -2, ゲージ増加制限(2002モード時、1人の時のみ）]
type = PowerSet
triggerall = RoundState >= 2 && var(7)
triggerall = fvar(29) = 1
trigger1 = NumPartner = 0
trigger1 = var(52) = (0,779)
trigger1 = !(StateNo = [2000,4000))
trigger1 = !(StateNo = [900,1000))
value = var(45)
ignorehitpause = 1

[State -2, 超必殺技使用可能フラグ 2002]
type = varset
triggerall = fvar(29) = 1
trigger1 = !(Power >= 1000 || var(52))
var(58) = 0
ignorehitpause = 1

[State -2, 超必殺技使用可能フラグ 2002]
type = varset
triggerall = fvar(29) = 1
trigger1 = Power >= 1000 || var(52)
trigger1 = !(Power >= 1000 && var(52))
var(58) = 1
ignorehitpause = 1

[State -2, 超必殺技使用可能フラグ 2002]
type = varset
triggerall = fvar(29) = 1
trigger1 = Power >= 1000 && var(52)
var(58) = 2
ignorehitpause = 1


[State -2, 超必殺技使用可能フラグ98UM]
type = varset
triggerall = fvar(29) = 4
trigger1 = fvar(34) = 1
trigger1 = Power < 1000 && !var(52)
trigger2 = fvar(34) = 2
trigger2 = (var(53) && var(51)) || !(var(53) || var(52) || Power >= 1000)
var(58) = 0
ignorehitpause = 1

[State -2, 超必殺技使用可能フラグ98UM]
type = varset
triggerall = fvar(29) = 4
trigger1 = fvar(34) = 1
trigger1 = (Power >= 1000 && !var(52)) || (Power < 1000 && var(52))
trigger2 = fvar(34) = 2
trigger2 = !(var(53) && var(51))
trigger2 = (var(53) && !var(52)) || Power >= 1000 || (var(52) && !var(53))
var(58) = 1
ignorehitpause = 1

[State -2, 超必殺技使用可能フラグ98UM]
type = varset
triggerall = fvar(29) = 4
trigger1 = fvar(34) = 1
trigger1 = (Power >= 1000 && var(52))
trigger2 = fvar(34) = 2
trigger2 = !(var(53) && var(51))
trigger2 = var(52) && var(53)
var(58) = 2
ignorehitpause = 1


[State -2, 超必殺技使用可能フラグS]
type = varset
triggerall = !(fvar(29) =1 || fvar(29) = 4)
trigger1 = !(Power >= 1000 || var(52) || var(53))
var(58) = 0
ignorehitpause = 1

[State -2, 超必殺技使用可能フラグS]
type = varset
triggerall = !(fvar(29) =1 || fvar(29) = 4)
trigger1 = (Power >= 1000 || var(52) || var(53))
trigger1 = !((Power >= 1000 && var(52)) || (var(52) && var(53)) || (var(53) && Power >= 1000))
var(58) = 1
ignorehitpause = 1

[State -2, 超必殺技使用可能フラグS]
type = varset
triggerall = !(fvar(29) =1 || fvar(29) = 4)
trigger1 = ((Power >= 1000 && var(52)) || (var(52) && var(53)) || (var(53) && Power >= 1000))
var(58) = 2
ignorehitpause = 1

;==================================================================
;どこキャン成立フラグ

[State -2]
type = varset
triggerall = var(52)
triggerall = !(fvar(29) = 4)
trigger1 = StateType = A
Trigger2 = (StateNo = 205 && ((MoveContact = [1,5]) || (!MoveContact && AnimElem = 2,>= 0 && AnimElem = 4, < 0))) 
Trigger3 = StateNo = 210 && (((MoveContact = [1,5]) && !(fvar(29) = 1 && !fvar(26))) || ((!MoveContact && AnimElem = 7,>= 0 && AnimElem = 9, < 0) && !((fvar(29) = 1 && !fvar(26)) || fvar(29) = 4)))
Trigger4 = (StateNo = 215 && ((MoveContact = [1,5]) || (!MoveContact && AnimElem = 4,>= 0 && AnimElem = 7, < 0)))
Trigger5 = (StateNo = 220 && ((MoveContact = [1,5]) || (!MoveContact && AnimElem = 4,>= 0 && AnimElem = 5, < 0)) && fvar(29) != 1)
Trigger6 = (StateNo = 225 && ((MoveContact = [1,5]) || (!MoveContact && AnimElem = 3,>= 0 && AnimElem = 4, < 0)))
Trigger7 = (StateNo = 235 && ((AnimElem = 10, < 0 && (MoveContact = [1,5])) || (!MoveContact && AnimElem = 4,>= 0 && AnimElem = 5, < 0)))
Trigger8 = (StateNo = 240 && ((MoveContact = [1,5]) || (!MoveContact && AnimElem = 4,>= 0 && AnimElem = 5, < 0)))
Trigger9 = (StateNo = 245 && (MoveContact = [1,5]) && fvar(29) != 4)
Trigger10 = (StateNo = 250 && (MoveContact = [1,5]))
Trigger11 = (StateNo = 260 && (AnimElem = 11, < 0 && (MoveContact = [1,5]))) 
Trigger12 = (StateNo = 400 && ((MoveContact = [1,5]) || (!MoveContact && AnimElem = 2,>= 0 && AnimElem = 3, < 0)))
Trigger13 = (StateNo = 410 && ((MoveContact = [1,5]) || (!MoveContact && AnimElem = 5,>= 0 && AnimElem = 7, < 0)))
Trigger14 = (StateNo = 420 && ((MoveContact = [1,5]) || (!MoveContact && AnimElem = 3, >= 0)) && (!(fvar(29) = 1 || fvar(29) = 4) || fvar(26)))
Trigger15 = (StateNo = 430 && ((MoveContact = [1,5]) || (!MoveContact && AnimElem = 6,>= 0 && AnimElem = 7, < 0)))
var(46) = 0
ignorehitpause = 1

[State -2]
type = varset
triggerall = var(52)
triggerall = !(fvar(29) = 4)
triggerall = StateType != A
Trigger1 = StateNo = [200,500)
Trigger1 = !(StateNo = 205 && ((MoveContact = [1,5]) || (!MoveContact && AnimElem = 2,>= 0 && AnimElem = 4, < 0))) 
Trigger1 = !(StateNo = 210 && (((MoveContact = [1,5]) && !(fvar(29) = 1 && !fvar(26))) || ((!MoveContact && AnimElem = 7,>= 0 && AnimElem = 9, < 0) && !((fvar(29) = 1 && !fvar(26)) || fvar(29) = 4))))
Trigger1 = !(StateNo = 215 && ((MoveContact = [1,5]) || (!MoveContact && AnimElem = 4,>= 0 && AnimElem = 7, < 0)))
Trigger1 = !(StateNo = 220 && ((MoveContact = [1,5]) || (!MoveContact && AnimElem = 4,>= 0 && AnimElem = 5, < 0)) && fvar(29) != 1)
Trigger1 = !(StateNo = 225 && ((MoveContact = [1,5]) || (!MoveContact && AnimElem = 3,>= 0 && AnimElem = 4, < 0)))
Trigger1 = !(StateNo = 235 && ((AnimElem = 10, < 0 && (MoveContact = [1,5])) || (!MoveContact && AnimElem = 4,>= 0 && AnimElem = 5, < 0)))
Trigger1 = !(StateNo = 240 && ((MoveContact = [1,5]) || (!MoveContact && AnimElem = 4,>= 0 && AnimElem = 5, < 0)))
Trigger1 = !(StateNo = 245 && (MoveContact = [1,5]) && fvar(29) != 4)
Trigger1 = !(StateNo = 250 && (MoveContact = [1,5]))
Trigger1 = !(StateNo = 260 && (AnimElem = 11, < 0 && (MoveContact = [1,5]))) 
Trigger1 = !(StateNo = 400 && ((MoveContact = [1,5]) || (!MoveContact && AnimElem = 2,>= 0 && AnimElem = 3, < 0)))
Trigger1 = !(StateNo = 410 && ((MoveContact = [1,5]) || (!MoveContact && AnimElem = 5,>= 0 && AnimElem = 7, < 0)))
Trigger1 = !(StateNo = 420 && ((MoveContact = [1,5]) || (!MoveContact && AnimElem = 3, >= 0)) && (!(fvar(29) = 1 || fvar(29) = 4) || fvar(26)))
Trigger1 = !(StateNo = 430 && ((MoveContact = [1,5]) || (!MoveContact && AnimElem = 6,>= 0 && AnimElem = 7, < 0)))
Trigger2 = (NumTarget(1300) || NumTarget(1350)) && (MoveContact = [1,5])
Trigger3 = (NumTarget(1402) || NumTarget(1452)) && (MoveContact = [1,5])
var(46) = 1
ignorehitpause = 1

[State -2]
type = varadd
trigger1 = var(46)
var(46) = 1

[State -2]
type = varset
trigger1 = var(46) > 8
trigger2 = Ctrl
var(46) = 0

;==================================================================
;屈伸ガードフラグ

[State -2, 屈伸ガード初期化]
type = varset
trigger1 = StateNo != [120,160]
trigger2 = var(13) > 15
trigger3 = !var(59)
trigger3 = Command != "holdback"
var(13) = 0
ignorehitpause = 1

[State -2, 屈伸ガード入力]
type = varset
triggerall = !var(59)
triggerall = Time = 1
triggerall = Command = "holdback"
trigger1 = PrevStateNo = 120
trigger2 = PrevStateNo = 130 && StateNo = 131
trigger2 = var(13) = [1,15]
trigger3 = PrevStateNo = 131 && StateNo = 130
trigger3 = var(13) = [1,15]
var(13) = 1
ignorehitpause = 1

[State -2, 屈伸ガードタイマー]
type = varadd
triggerall = var(13)
triggerall = !var(59)
trigger1 = Command = "holdback" && Command != "holddown"
trigger1 = StateNo = 130 || StateNo = [150,151]
var(13) = 1
ignorehitpause = 1

[State -2, 屈伸ガードタイマー]
type = varadd
triggerall = var(13)
triggerall = !var(59)
trigger1 = Command = "holdback" && Command = "holddown"
trigger1 = StateNo = 131 || StateNo = [152,153]
var(13) = 1
ignorehitpause = 1


;==================================================================
;AI Lv表示

[State -2, AI Lv]
type = Explod
triggerall = fvar(31)
triggerall = (RoundState = 2 && RoundsExisted = 0) || RoundsExisted > 0 || var(7)
triggerall = TeamSide = 1
triggerall = NumExplod(4550+var(59)+((!(fvar(29)=4)||fvar(34)=2)&&var(53))*20+((fvar(34)=2||fvar(26))&&var(51))*20) = 0
trigger1 = NumPartner = 0
trigger2 = NumPartner = 1
trigger2 = ID > Partner,ID
anim = 4550+var(59)+((!(fvar(29)=4)||fvar(34)=2)&&var(53))*20+((fvar(34)=2||fvar(26))&&var(51))*20
ID = 4550+var(59)+((!(fvar(29)=4)||fvar(34)=2)&&var(53))*20+((fvar(34)=2||fvar(26))&&var(51))*20
bindtime = -1
removetime = -1
pos = 20,230
postype = left
facing = 1
ownpal = 1
ontop = 1
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State -2, AI Lv(dead)]
type = Explod
triggerall = fvar(31)
triggerall = (RoundState = 2 && RoundsExisted = 0) || RoundsExisted > 0 || var(7)
triggerall = TeamSide = 1
triggerall = Life = 0
triggerall = NumExplod(4590) = 0
trigger1 = NumPartner = 0
trigger2 = NumPartner = 1
trigger2 = ID > Partner,ID
anim = 4590
ID = 4590
bindtime = -1
removetime = -1
pos = 20,230
postype = left
facing = 1
ownpal = 1
ontop = 1
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State -2, AI Lv]
type = Explod
triggerall = fvar(31)
triggerall = (RoundState = 2 && RoundsExisted = 0) || RoundsExisted > 0 || var(7)
triggerall = TeamSide = 1
triggerall = NumExplod(4550+var(59)+((!(fvar(29)=4)||fvar(34)=2)&&var(53))*20+((fvar(34)=2||fvar(26))&&var(51))*20) = 0
trigger1 = NumPartner = 1
trigger1 = ID < Partner,ID
anim = 4550+var(59)+((!(fvar(29)=4)||fvar(34)=2)&&var(53))*20+((fvar(34)=2||fvar(26))&&var(51))*20
ID = 4550+var(59)+((!(fvar(29)=4)||fvar(34)=2)&&var(53))*20+((fvar(34)=2||fvar(26))&&var(51))*20
bindtime = -1
removetime = -1
pos = 93,230
postype = left
facing = 1
ownpal = 1
ontop = 1
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State -2, AI Lv(dead)]
type = Explod
triggerall = fvar(31)
triggerall = (RoundState = 2 && RoundsExisted = 0) || RoundsExisted > 0 || var(7)
triggerall = TeamSide = 1
triggerall = Life = 0
triggerall = NumExplod(4590) = 0
trigger1 = NumPartner = 1
trigger1 = ID < Partner,ID
anim = 4590
ID = 4590
bindtime = -1
removetime = -1
pos = 93,230
postype = left
facing = 1
ownpal = 1
ontop = 1
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State -2, AI Lv]
type = Explod
triggerall = fvar(31)
triggerall = (RoundState = 2 && RoundsExisted = 0) || RoundsExisted > 0 || var(7)
triggerall = TeamSide = 2
triggerall = NumExplod(4550+var(59)+((!(fvar(29)=4)||fvar(34)=2)&&var(53))*20+((fvar(34)=2||fvar(26))&&var(51))*20) = 0
trigger1 = NumPartner = 0
trigger2 = NumPartner = 1
trigger2 = ID < Partner,ID
anim = 4550+var(59)+((!(fvar(29)=4)||fvar(34)=2)&&var(53))*20+((fvar(34)=2||fvar(26))&&var(51))*20
ID = 4550+var(59)+((!(fvar(29)=4)||fvar(34)=2)&&var(53))*20+((fvar(34)=2||fvar(26))&&var(51))*20
bindtime = -1
removetime = -1
pos = -76,230
postype = right
facing = 1
ownpal = 1
ontop = 1
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State -2, AI Lv(dead)]
type = Explod
triggerall = fvar(31)
triggerall = (RoundState = 2 && RoundsExisted = 0) || RoundsExisted > 0 || var(7)
triggerall = TeamSide = 2
triggerall = Life = 0
triggerall = NumExplod(4590) = 0
trigger1 = NumPartner = 0
trigger2 = NumPartner = 1
trigger2 = ID < Partner,ID
anim = 4590
ID = 4590
bindtime = -1
removetime = -1
pos = -76,230
postype = right
facing = 1
ownpal = 1
ontop = 1
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State -2, AI Lv]
type = Explod
triggerall = fvar(31)
triggerall = (RoundState = 2 && RoundsExisted = 0) || RoundsExisted > 0 || var(7)
triggerall = TeamSide = 2
triggerall = NumExplod(4550+var(59)+((!(fvar(29)=4)||fvar(34)=2)&&var(53))*20+((fvar(34)=2||fvar(26))&&var(51))*20) = 0
trigger1 = NumPartner = 1
trigger1 = ID > Partner,ID
anim = 4550+var(59)+((!(fvar(29)=4)||fvar(34)=2)&&var(53))*20+((fvar(34)=2||fvar(26))&&var(51))*20
ID = 4550+var(59)+((!(fvar(29)=4)||fvar(34)=2)&&var(53))*20+((fvar(34)=2||fvar(26))&&var(51))*20
bindtime = -1
removetime = -1
pos = -149,230
postype = right
facing = 1
ownpal = 1
ontop = 1
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State -2, AI Lv(dead)]
type = Explod
triggerall = fvar(31)
triggerall = (RoundState = 2 && RoundsExisted = 0) || RoundsExisted > 0 || var(7)
triggerall = TeamSide = 2
triggerall = Life = 0
triggerall = NumExplod(4590) = 0
trigger1 = NumPartner = 1
trigger1 = ID > Partner,ID
anim = 4590
ID = 4590
bindtime = -1
removetime = -1
pos = -149,230
postype = right
facing = 1
ownpal = 1
ontop = 1
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4550) > 0 && var(59) != 0
trigger2 = var(53) && (fvar(34) = 2 || !(fvar(29) = 4))
trigger3 = !fvar(31)
trigger4 = life = 0
trigger5 = var(51) && (fvar(34) = 2 || fvar(26))
ID = 4550
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4551) > 0 && var(59) != 1
trigger2 = var(53) && (fvar(34) = 2 || !(fvar(29) = 4))
trigger3 = !fvar(31)
trigger4 = life = 0
trigger5 = var(51) && (fvar(34) = 2 || fvar(26))
ID = 4551
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4552) > 0 && var(59) != 2
trigger2 = var(53) && (fvar(34) = 2 || !(fvar(29) = 4))
trigger3 = !fvar(31)
trigger4 = life = 0
trigger5 = var(51) && (fvar(34) = 2 || fvar(26))
ID = 4552
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4553) > 0 && var(59) != 3
trigger2 = var(53) && (fvar(34) = 2 || !(fvar(29) = 4))
trigger3 = !fvar(31)
trigger4 = life = 0
trigger5 = var(51) && (fvar(34) = 2 || fvar(26))
ID = 4553
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4554) > 0 && var(59) != 4
trigger2 = var(53) && (fvar(34) = 2 || !(fvar(29) = 4))
trigger3 = !fvar(31)
trigger4 = life = 0
trigger5 = var(51) && (fvar(34) = 2 || fvar(26))
ID = 4554
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4555) > 0 && var(59) != 5
trigger2 = var(53) && (fvar(34) = 2 || !(fvar(29) = 4))
trigger3 = !fvar(31)
trigger4 = life = 0
trigger5 = var(51) && (fvar(34) = 2 || fvar(26))
ID = 4555
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4556) > 0 && var(59) != 6
trigger2 = var(53) && (fvar(34) = 2 || !(fvar(29) = 4))
trigger3 = !fvar(31)
trigger4 = life = 0
trigger5 = var(51) && (fvar(34) = 2 || fvar(26))
ID = 4556
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4557) > 0 && var(59) != 7
trigger2 = var(53) && (fvar(34) = 2 || !(fvar(29) = 4))
trigger3 = !fvar(31)
trigger4 = life = 0
trigger5 = var(51) && (fvar(34) = 2 || fvar(26))
ID = 4557
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4558) > 0 && var(59) != 8
trigger2 = var(53) && (fvar(34) = 2 || !(fvar(29) = 4))
trigger3 = !fvar(31)
trigger4 = life = 0
trigger5 = var(51) && (fvar(34) = 2 || fvar(26))
ID = 4558
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4559) > 0 && var(59) != 9
trigger2 = var(53) && (fvar(34) = 2 || !(fvar(29) = 4))
trigger3 = !fvar(31)
trigger4 = life = 0
trigger5 = var(51) && (fvar(34) = 2 || fvar(26))
ID = 4559
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4560) > 0 && var(59) != 10
trigger2 = var(53) && (fvar(34) = 2 || !(fvar(29) = 4))
trigger3 = !fvar(31)
trigger4 = life = 0
trigger5 = var(51) && (fvar(34) = 2 || fvar(26))
ID = 4560
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4561) > 0 && var(59) != 11
trigger2 = var(53) && (fvar(34) = 2 || !(fvar(29) = 4))
trigger3 = !fvar(31)
trigger4 = life = 0
trigger5 = var(51) && (fvar(34) = 2 || fvar(26))
ID = 4561
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4570) > 0 && var(59) != 0
trigger2 = !var(53)
trigger3 = !fvar(31)
trigger4 = life = 0
trigger5 = var(51)
ID = 4570
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4571) > 0 && var(59) != 1
trigger2 = !var(53)
trigger3 = !fvar(31)
trigger4 = life = 0
trigger5 = var(51)
ID = 4571
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4572) > 0 && var(59) != 2
trigger2 = !var(53)
trigger3 = !fvar(31)
trigger4 = life = 0
trigger5 = var(51)
ID = 4572
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4573) > 0 && var(59) != 3
trigger2 = !var(53)
trigger3 = !fvar(31)
trigger4 = life = 0
trigger5 = var(51)
ID = 4573
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4574) > 0 && var(59) != 4
trigger2 = !var(53)
trigger3 = !fvar(31)
trigger4 = life = 0
trigger5 = var(51)
ID = 4574
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4575) > 0 && var(59) != 5
trigger2 = !var(53)
trigger3 = !fvar(31)
trigger4 = life = 0
trigger5 = var(51)
ID = 4575
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4576) > 0 && var(59) != 6
trigger2 = !var(53)
trigger3 = !fvar(31)
trigger4 = life = 0
trigger5 = var(51)
ID = 4576
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4577) > 0 && var(59) != 7
trigger2 = !var(53)
trigger3 = !fvar(31)
trigger4 = life = 0
trigger5 = var(51)
ID = 4577
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4578) > 0 && var(59) != 8
trigger2 = !var(53)
trigger3 = !fvar(31)
trigger4 = life = 0
trigger5 = var(51)
ID = 4578
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4579) > 0 && var(59) != 9
trigger2 = !var(53)
trigger3 = !fvar(31)
trigger4 = life = 0
trigger5 = var(51)
ID = 4579
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4580) > 0 && var(59) != 10
trigger2 = !var(53)
trigger3 = !fvar(31)
trigger4 = life = 0
trigger5 = var(51)
ID = 4580
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4581) > 0 && var(59) != 11
trigger2 = !var(53)
trigger3 = !fvar(31)
trigger4 = life = 0
trigger5 = var(51)
ID = 4581
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4590) > 0 && var(59) != 0
trigger2 = Life > 0 && !var(51)
trigger3 = !fvar(31)
ID = 4590
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4591) > 0 && var(59) != 1
trigger2 = Life > 0 && !var(51)
trigger3 = !fvar(31)
ID = 4591
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4592) > 0 && var(59) != 2
trigger2 = Life > 0 && !var(51)
trigger3 = !fvar(31)
ID = 4592
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4593) > 0 && var(59) != 3
trigger2 = Life > 0 && !var(51)
trigger3 = !fvar(31)
ID = 4593
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4594) > 0 && var(59) != 4
trigger2 = Life > 0 && !var(51)
trigger3 = !fvar(31)
ID = 4594
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4595) > 0 && var(59) != 5
trigger2 = Life > 0 && !var(51)
trigger3 = !fvar(31)
ID = 4595
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4596) > 0 && var(59) != 6
trigger2 = Life > 0 && !var(51)
trigger3 = !fvar(31)
ID = 4596
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4597) > 0 && var(59) != 7
trigger2 = Life > 0 && !var(51)
trigger3 = !fvar(31)
ID = 4597
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4598) > 0 && var(59) != 8
trigger2 = Life > 0 && !var(51)
trigger3 = !fvar(31)
ID = 4598
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4599) > 0 && var(59) != 9
trigger2 = Life > 0 && !var(51)
trigger3 = !fvar(31)
ID = 4599
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4600) > 0 && var(59) != 10
trigger2 = Life > 0 && !var(51)
trigger3 = !fvar(31)
ID = 4600
ignorehitpause = 1

[State -2]
type = RemoveExplod
trigger1 = NumExplod(4601) > 0 && var(59) != 11
trigger2 = Life > 0 && !var(51)
trigger3 = !fvar(31)
ID = 4601
ignorehitpause = 1


[State -2]
type = NotHitBy
trigger1 = fvar(29) = 3 || fvar(29) = 6
trigger1 = StateNo = [3000,3020]
value = SCA
time = 1
ignorehitpause = 1

;==================================================================
;==================================================================
;==================================================================
;================================================

[State -2, 飛び道具数制限]
type = VarSet
triggerall = fvar(29) = 1 || fvar(29) = 4
trigger1 = NumProjID(1000) || NumProjID(1001) || NumProjID(1002)
trigger2 = NumProjID(1100) || NumProjID(1150)
trigger3 = NumProjID(1500) || NumProjID(1550)
trigger4 = NumHelper(1710) || NumHelper(1711)
trigger5 = NumHelper(1730) || NumHelper(1731)
trigger6 = NumHelper(1760) || NumHelper(1761)
trigger7 = NumHelper(1780) || NumHelper(1781)
var(47) = 1
ignorehitpause = 1

[State -2, 飛び道具数制限]
type = VarSet
trigger1 = !(fvar(29) = 1 || fvar(29) = 4)
trigger2 = !(NumProjID(1000) || NumProjID(1001) || NumProjID(1002))
trigger2 = !(NumProjID(1100) || NumProjID(1150))
trigger2 = !(NumProjID(1500) || NumProjID(1550))
trigger2 = !(NumHelper(1710) || NumHelper(1711))
trigger2 = !(NumHelper(1730) || NumHelper(1731))
trigger2 = !(NumHelper(1760) || NumHelper(1761))
trigger2 = !(NumHelper(1780) || NumHelper(1781))
var(47) = 0
ignorehitpause = 1


[State -2]
type = VarSet
trigger1 = !(StateNo = [1000,1010])
trigger1 = !(StateNo = [3000,3021])
var(30) = 0

[State -2, カイザーウェイブ到達予測時間]
type = VarSet
triggerall = !(StateNo = [3000,3100))
trigger1 = var(30) = 0
Trigger1 = !((var(6) = 1 && EnemyNear(var(2)),BackEdgeBodyDist < 10) || (var(6) = -1 && EnemyNear(var(2)),FrontEdgeBodyDist < 10))
Trigger1 = fvar(4)+15-(96+23) > 0
var(25) = Ceil((fvar(4)+15-(96+23))/16)+(StateNo=1000)*7+(StateNo=1010)*IfElse(6-Time<0,0,6-Time)+(StateNo!=[1000,1010])*7
ignorehitpause = 1

[State -2, カイザーウェイブ到達予測時間]
type = VarSet
triggerall = !(StateNo = [3000,3100))
trigger1 = var(30) = 0
Trigger1 = !((var(6) = 1 && EnemyNear(var(2)),BackEdgeBodyDist < 10) || (var(6) = -1 && EnemyNear(var(2)),FrontEdgeBodyDist < 10))
Trigger1 = fvar(4)+15-(96+23) <= 0
var(25) = (StateNo=1000)*7+(StateNo=1010)*IfElse(6-Time<0,0,6-Time)+(StateNo!=[1000,1010])*7
ignorehitpause = 1

[State -2, カイザーウェイブ到達予測時間]
type = VarSet
triggerall = !(StateNo = [3000,3100))
trigger1 = var(30) = 0
Trigger1 = ((var(6) = 1 && EnemyNear(var(2)),BackEdgeBodyDist < 10) || (var(6) = -1 && EnemyNear(var(2)),FrontEdgeBodyDist < 10))
Trigger1 = FrontEdgeBodyDist-(96+23)-(EnemyNear(var(2)),Const(size.ground.front)+EnemyNear(var(2)),Const(size.ground.back)) > 0
var(25) = Ceil((FrontEdgeBodyDist-(96+23)-(EnemyNear(var(2)),Const(size.ground.front)+EnemyNear(var(2)),Const(size.ground.back)))/16)+(StateNo=1000)*7+(StateNo=1010)*IfElse(6-Time<0,0,6-Time)+(StateNo!=[1000,1010])*7
ignorehitpause = 1

[State -2, カイザーウェイブ到達予測時間]
type = VarSet
triggerall = !(StateNo = [3000,3100))
trigger1 = var(30) = 0
Trigger1 = ((var(6) = 1 && EnemyNear(var(2)),BackEdgeBodyDist < 10) || (var(6) = -1 && EnemyNear(var(2)),FrontEdgeBodyDist < 10))
Trigger1 = FrontEdgeBodyDist-(96+23)-(EnemyNear(var(2)),Const(size.ground.front)+EnemyNear(var(2)),Const(size.ground.back)) <= 0
var(25) = Ceil((FrontEdgeBodyDist-(96+23)-(EnemyNear(var(2)),Const(size.ground.front)+EnemyNear(var(2)),Const(size.ground.back)))/16)+(StateNo=1000)*7+(StateNo=1010)*IfElse(6-Time<0,0,6-Time)+(StateNo!=[1000,1010])*7
ignorehitpause = 1


[State -2, カイザーウェイブ到達予測時間]
type = VarSet
triggerall = !(StateNo = [3000,3100))
trigger1 = var(30) = 1
Trigger1 = !((var(6) = 1 && EnemyNear(var(2)),BackEdgeBodyDist < 10) || (var(6) = -1 && EnemyNear(var(2)),FrontEdgeBodyDist < 10))
Trigger1 = fvar(4)+15-(-80+31) > 0
var(25) = Ceil((fvar(4)+15-(-80+31))/16)+(StateNo=1000)*6+(StateNo=1010)*IfElse(5-Time<0,0,5-Time)
ignorehitpause = 1

[State -2, カイザーウェイブ到達予測時間]
type = VarSet
triggerall = !(StateNo = [3000,3100))
trigger1 = var(30) = 1
Trigger1 = !((var(6) = 1 && EnemyNear(var(2)),BackEdgeBodyDist < 10) || (var(6) = -1 && EnemyNear(var(2)),FrontEdgeBodyDist < 10))
Trigger1 = fvar(4)+15-(-80+31) <= 0
var(25) = (StateNo=1000)*6+(StateNo=1010)*IfElse(5-Time<0,0,5-Time)
ignorehitpause = 1

[State -2, カイザーウェイブ到達予測時間]
type = VarSet
triggerall = !(StateNo = [3000,3100))
trigger1 = var(30) = 1
Trigger1 = ((var(6) = 1 && EnemyNear(var(2)),BackEdgeBodyDist < 10) || (var(6) = -1 && EnemyNear(var(2)),FrontEdgeBodyDist < 10))
Trigger1 = FrontEdgeBodyDist-(-80+31)-(EnemyNear(var(2)),Const(size.ground.front)+EnemyNear(var(2)),Const(size.ground.back)) > 0
var(25) = Ceil((FrontEdgeBodyDist-(-80+31)-(EnemyNear(var(2)),Const(size.ground.front)+EnemyNear(var(2)),Const(size.ground.back)))/16)+(StateNo=1000)*6+(StateNo=1010)*IfElse(5-Time<0,0,5-Time)
ignorehitpause = 1

[State -2, カイザーウェイブ到達予測時間]
type = VarSet
triggerall = !(StateNo = [3000,3100))
trigger1 = var(30) = 1
Trigger1 = ((var(6) = 1 && EnemyNear(var(2)),BackEdgeBodyDist < 10) || (var(6) = -1 && EnemyNear(var(2)),FrontEdgeBodyDist < 10))
Trigger1 = FrontEdgeBodyDist-(-80+31)-(EnemyNear(var(2)),Const(size.ground.front)+EnemyNear(var(2)),Const(size.ground.back)) <= 0
var(25) = (StateNo=1000)*6+(StateNo=1010)*IfElse(5-Time<0,0,5-Time)
ignorehitpause = 1


[State -2, カイザーウェイブ到達予測時間]
type = VarSet
triggerall = !(StateNo = [3000,3100))
trigger1 = var(30) = 2
Trigger1 = !((var(6) = 1 && EnemyNear(var(2)),BackEdgeBodyDist < 10) || (var(6) = -1 && EnemyNear(var(2)),FrontEdgeBodyDist < 10))
Trigger1 = fvar(4)+15-(112+23) > 0
var(25) = Ceil((fvar(4)+15-(112+23))/16)+(StateNo=1000)*6+(StateNo=1010)*IfElse(5-Time<0,0,5-Time)
ignorehitpause = 1

[State -2, カイザーウェイブ到達予測時間]
type = VarSet
triggerall = !(StateNo = [3000,3100))
trigger1 = var(30) = 2
Trigger1 = !((var(6) = 1 && EnemyNear(var(2)),BackEdgeBodyDist < 10) || (var(6) = -1 && EnemyNear(var(2)),FrontEdgeBodyDist < 10))
Trigger1 = fvar(4)+15-(112+23) <= 0
var(25) = (StateNo=1000)*6+(StateNo=1010)*IfElse(5-Time<0,0,5-Time)
ignorehitpause = 1

[State -2, カイザーウェイブ到達予測時間]
type = VarSet
triggerall = !(StateNo = [3000,3100))
trigger1 = var(30) = 2
Trigger1 = ((var(6) = 1 && EnemyNear(var(2)),BackEdgeBodyDist < 10) || (var(6) = -1 && EnemyNear(var(2)),FrontEdgeBodyDist < 10))
Trigger1 = FrontEdgeBodyDist-(112+23)-(EnemyNear(var(2)),Const(size.ground.front)+EnemyNear(var(2)),Const(size.ground.back)) > 0
var(25) = Ceil((FrontEdgeBodyDist-(112+23)-(EnemyNear(var(2)),Const(size.ground.front)+EnemyNear(var(2)),Const(size.ground.back)))/16)+(StateNo=1000)*6+(StateNo=1010)*IfElse(5-Time<0,0,5-Time)
ignorehitpause = 1

[State -2, カイザーウェイブ到達予測時間]
type = VarSet
triggerall = !(StateNo = [3000,3100))
trigger1 = var(30) = 2
Trigger1 = ((var(6) = 1 && EnemyNear(var(2)),BackEdgeBodyDist < 10) || (var(6) = -1 && EnemyNear(var(2)),FrontEdgeBodyDist < 10))
Trigger1 = FrontEdgeBodyDist-(112+23)-(EnemyNear(var(2)),Const(size.ground.front)+EnemyNear(var(2)),Const(size.ground.back)) <= 0
var(25) = (StateNo=1000)*6+(StateNo=1010)*IfElse(5-Time<0,0,5-Time)
ignorehitpause = 1


[State -2, カイザーウェイブ到達時、敵高度予測]
type = VarSet
triggerall = !(StateNo = [3000,3100))
trigger1 = P2MoveType != H
fvar(25) = EnemyNear(var(2)),Pos Y+EnemyNear(var(2)),Vel Y*var(25)+(0.5*EnemyNear(var(2)),Const(movement.yaccel)*var(25)*(var(25)-1))*(EnemyNear(var(2)),Vel Y!=0)
ignorehitpause = 1 

[State -2, カイザーウェイブ到達時、敵高度予測]
type = VarSet
triggerall = !(StateNo = [3000,3100))
trigger1 = P2MoveType = H
fvar(25) = EnemyNear(var(2)),Pos Y+(EnemyNear(var(2)),Vel Y+fvar(16))*var(25)+(0.5*EnemyNear(var(2)),GetHitVar(yaccel)*var(25)*(var(25)-1))*(EnemyNear(var(2)),Vel Y!=0)
ignorehitpause = 1 

[State -2, var(32)]
type = VarSet
trigger1 = !NumHelper(1015)
var(32) = Facing

[State -2, pause]
type = Pause
trigger1 = !(var(26)=100)
trigger1 = (ProjHitTime(2410) = [1,7])
trigger2 = !(var(26)=100)
trigger2 = (ProjHitTime(2420) = [1,7])
trigger3 = (ProjHitTime(2427) = [1,7])
time = 1

[State -2, targetlife];白羅滅精補正
type = TargetLifeAdd
triggerall = Numenemy = 1
triggerall = NumTarget = 1
trigger1 = NumTarget(2410) && var(21) = 0
trigger1 = ProjHitTime(2410) = 0
trigger2 = NumTarget(2420) && var(21) = 0
trigger2 = ProjHitTime(2420) = 0
trigger3 = NumTarget(2411) && var(21) <= 2
trigger3 = ProjHitTime(2410) = 0
trigger4 = NumTarget(2421) && var(21) <= 2
trigger4 = ProjHitTime(2420) = 0
value = -Target,GetHitVar(damage)
ignorehitpause = 1
absolute = 1
kill = 1


[State -2,02umMax2Env]
type = RemoveExplod
trigger1 = !(StateNo = [3000,4000))
ID = 7710
ignorehitpause = 1

[State -2,02umMax2Env]
type = RemoveExplod
trigger1 = !(StateNo = [3000,4000))
ID = 7711
ignorehitpause = 1

[State -2,02umMax2Env]
type = RemoveExplod
trigger1 = !(StateNo = [3000,4000))
ID = 7712
ignorehitpause = 1

[State -2,02umMax2Env]
type = RemoveExplod
trigger1 = !(StateNo = [3000,4000))
ID = 7713
ignorehitpause = 1

[State -2,02umMax2Env]
type = RemoveExplod
trigger1 = !(StateNo = [3000,4000))
ID = 7714
ignorehitpause = 1

[State -2,02umMax2Env]
type = RemoveExplod
trigger1 = !(StateNo = [3000,4000))
ID = 7715
ignorehitpause = 1

[State -2,02umMax2Env]
type = RemoveExplod
trigger1 = !(StateNo = [3000,4000))
ID = 7716
ignorehitpause = 1

[State -2,02umMax2Env]
type = RemoveExplod
trigger1 = !(StateNo = [3000,4000))
ID = 7730
ignorehitpause = 1

[State -2,02umMax2Env]
type = RemoveExplod
trigger1 = !(StateNo = [3000,4000))
ID = 7731
ignorehitpause = 1

[State -2,02umMax2Env]
type = RemoveExplod
trigger1 = !(StateNo = [3000,4000))
ID = 7740
ignorehitpause = 1

[State -2,02umMax2Env]
type = RemoveExplod
trigger1 = !(StateNo = [3000,4000))
ID = 7741
ignorehitpause = 1


;===========================================================================
; 破防计算
;===========================================================================
[State -2]
type = TargetState
TriggerAll = fvar(26) = 1
TriggerAll = numtarget
TriggerAll = target,alive
TriggerAll = fvar(23) >= 10000
TriggerAll = target,StateType = S || target,StateType = C
TriggerAll = target,MoveType = H && target,StateNo = [120,159]
Trigger1 = MoveGuarded = 1
Trigger2 = ProjGuarded = 1
value = 5700

[State -2]
type = VarSet
TriggerAll = fvar(26) = 1
TriggerAll = fvar(23) < 0
Trigger1 = 1
fvar(23) = 0
ignorehitpause = 1

[State -2]
type = VarAdd
TriggerAll = fvar(26) = 1
TriggerAll = fvar(23) >= 1
Trigger1 = GameTime%37 = 0
fvar(23) = -100
ignorehitpause = 1

[State -2]
type = VarSet
TriggerAll = fvar(26) = 1
TriggerAll = fvar(23) != 0
Trigger1 = roundstate != 2
Trigger2 = enemy,StateNo = 5700
fvar(23) = 0
ignorehitpause = 1

[State -2]
type = VarAdd
TriggerAll = fvar(26) = 1
TriggerAll = RoundState = 2
TriggerAll = EnemyNear,MoveType = H
TriggerAll = EnemyNear,time = 0
Trigger1 = !(ProjGuarded = 1)
Trigger1 = moveguarded = 1
fvar(23) = ifelse(stateno < 1000, 400, ifelse((StateNo = [1700,1899]),600,800))
ignorehitpause = 1
persistent = 0

[State -2]
type = VarAdd
TriggerAll = fvar(26) = 1
TriggerAll = RoundState = 2
TriggerAll = EnemyNear,MoveType = H
TriggerAll = EnemyNear,time = 0
Trigger1 = ProjGuarded = 1
fvar(23) = ifelse((StateNo = [1700,1899]),400,800)
ignorehitpause = 1
persistent = 0

[State -2,]
type = Helper
TriggerAll = fvar(26) = 1
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
type = Explod
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

;===================================================================================
;Print
;===================================================================================

;----------------------------------------------------------------------------------------
;原始
[State -2, Debug]
type = displaytoclipboard
Trigger1 = 1
text = "P2ST=%d PROJOK=%d X=%d Y=%d P2T=%d P2AT=%d"
params = P2StateNo,(var(16)&2**4),P2BodyDist x,EnemyNear,Pos y,EnemyNear,Time,EnemyNear,AnimTime
ignorehitpause = 1

[State -2, Debug]
type = appendtoclipboard
Trigger1 = 1
text="\nTRACE=%d FD=%d POSY=%d CTRL=%d VX=%d PROJ=%d"   
params= var(50),fvar(15),POS y,var(17),vel x,EnemyNear,NumProj||PlayerIdExist(Helper(33333333),var(3))
ignorehitpause = 1

[State -2, Debug]
type = Null;appendtoclipboard
Trigger1 = 1
text="\nTRACE=%d F=%d EF=%d EVX=%d EHX=%d FV12=%d"   
params= var(50),Facing,EnemyNear,Facing,EnemyNear,Vel x,EnemyNear,GetHitVar(xvel),fvar(12)
ignorehitpause = 1





