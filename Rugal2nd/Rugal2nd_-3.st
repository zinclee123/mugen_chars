[Statedef -3]


;===================================================================================
:===================================================================================
;敌人识别
;===================================================================================
;===================================================================================

;1个敌人时

[State -2, EnemyNear]
type = VarSet
triggerall = (var(59) || fvar(39))
trigger1 = NumEnemy = 1
trigger2 = NumEnemy > 1
trigger2 = EnemyNear(1),Life = 0
var(2) = 0
ignorehitpause = 1

[State -2, EnemyNear]
type = VarSet
triggerall = (var(59) || fvar(39))
trigger1 = NumEnemy > 1
trigger1 = EnemyNear(0),Life = 0
var(2) = 1
ignorehitpause = 1

;2个敌人时

[State -2, EnemyNear]
type = VarSet
triggerall = var(59)
triggerall = NumPartner > 0
triggerall = Partner,Life > 0
triggerall = NumEnemy > 1
triggerall = EnemyNear(0),Life > 0 && EnemyNear(1),Life > 0
trigger1 = !(Partner,MoveType = A && Partner,NumTarget && EnemyNear(0),MoveType = H && EnemyNear(1),MoveType != H && !((EnemyNear(0),StateNo = [5000,5300]) || (EnemyNear(0),StateNo = [120,160])) && EnemyNear(0),GetHitVar(hitshaketime) = 0)
trigger1 = !(Partner,MoveType = H && EnemyNear(0),NumTarget && EnemyNear(0),MoveType = A && !((Partner,StateNo = [5000,5300]) || (Partner,StateNo = [120,160])) && Partner,GetHitVar(hitshaketime) = 0)
var(2) = 0
ignorehitpause = 1

[State -2, EnemyNear]
type = VarSet
triggerall = var(59)
triggerall = NumPartner > 0
triggerall = Partner,Life > 0
triggerall = NumEnemy > 1
triggerall = EnemyNear(0),Life > 0 && EnemyNear(1),Life > 0
trigger1 = (Partner,MoveType = A && Partner,NumTarget && EnemyNear(0),MoveType = H && EnemyNear(1),MoveType != H && !((EnemyNear(0),StateNo = [5000,5300]) || (EnemyNear(0),StateNo = [120,160])) && EnemyNear(0),GetHitVar(hitshaketime) = 0)
trigger2 = (Partner,MoveType = H && EnemyNear(0),NumTarget && EnemyNear(0),MoveType = A && !((Partner,StateNo = [5000,5300]) || (Partner,StateNo = [120,160])) && Partner,GetHitVar(hitshaketime) = 0)
var(2) = 1
ignorehitpause = 1




