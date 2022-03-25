;============================================================================
; 胜利
;============================================================================
[Statedef 180]
type = S
ctrl = 0

[State 180, 1]
type = ChangeState
triggerall = var(22) = 1
trigger1 = time = 0
value = 171

[State 180, 1]
type = ChangeState
triggerall = var(22) = 0
trigger1 = command = "hold_x"
value = 172
[State 180, 1]
type = ChangeState
trigger1 = command = "hold_y"
value = 173

[State 180, 1]
type = ChangeState
trigger1 = !time
triggerall = var(22) = 0
value = 172+(random%2)

;---------------------------------------------------------------------------
; Win Action Number 1
[Statedef 171]
type = S
ctrl = 0
anim = 171
velset = 0,0

[State 181, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 191,3]
type = PlaySnd
trigger1 = animelem = 11
value = 171,0
volume = 200

[State 181, AssertSpecial]
type = AssertSpecial
trigger1 = time = [1,100]
flag = roundnotover
;---------------------------------------------------------------------------
; Win Action Number 2
[Statedef 172]
type = S
ctrl = 0
velset = 0,0

[State 172, ChangeAnim]
type = ChangeAnim
trigger1 = !time
value = 172

[State 191,3]
type = PlaySnd
trigger1 = animelem = 3
value = 172,0
volume = 200

[State 182, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 182, AssertSpecial]
type = AssertSpecial
trigger1 = time = [1,80]
flag = roundnotover

;---------------------------------------------------------------------------
; Win Action Number 3
[Statedef 173]
type = S
ctrl = 0
velset = 0,0

[State 172, ChangeAnim]
type = ChangeAnim
trigger1 = !time
value = 173

[State 191,3]
type = PlaySnd
trigger1 = animelem = 1
value = 173,0
volume = 200

[State 182, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 182, AssertSpecial]
type = AssertSpecial
trigger1 = time = [1,70]
flag = roundnotover






;============================================================================
; 开场动画
;============================================================================
[Statedef 190]
type = S
ctrl = 0
anim = 0
velset = 0,0

[State 180, 1]
type = ChangeState
trigger1 = enemy, name = "Kyo_WLS" || enemy, name = "2003Kyo_WLS" || enemy, name = "CKyo_WLS"
trigger2 = enemy, name = "Kyo" || enemy, name = "Kyo Kusanagi" || enemy, name = "cvskyo"
value = 182

[State 0, ChangeState]
type = ChangeState
trigger1 = enemy,name = "Maxima"
value = 183

[State 0, ChangeState]
type = ChangeState
trigger1 = enemy,name = "Whip"
value = 184

[State 0, ChangeState]
type = ChangeState
trigger1 = enemy,name = "Kula Diamond" && Enemy, AuthorName = "KoopaKoot"
value = 185

[State 190, 1]
type = ChangeState
trigger1 = !time
value = 181

;-------------------------------------------------------------------
[Statedef 181]
type = S
movetype = I
physics = S
anim = 180
ctrl = 0

[State 191, 1]
type = ChangeAnim
trigger1 = RoundState = 0
value = anim

[State 191,0]
type = AssertSpecial
trigger1 = 1
flag = nobardisplay
flag2 = intro

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 10
value = 180,0
volume = 200

[State 191,4]
type = ChangeState
trigger1 = Animtime = 0;RoundState = 2
value = 0
ctrl = 0

;-------------------------------------------------------------------
;Intro vs Kyo
[Statedef 182]
type = S
movetype = I
physics = S
anim = 181
ctrl = 0

[State 191, 1]
type = ChangeAnim
trigger1 = RoundState = 0
value = anim

[State 10181, PlaySnd]
type = PlaySnd
trigger1 = animelem = 13
value = 4,10

[State 0, Explod]
type = Explod
trigger1 = animelemtime(3)=2
anim = 182
ID = 182
pos = 0,0
postype = p1
facing = 1
bindtime = -1
removetime = 62
sprpriority = 4
removeongethit = 1

[State 191,0]
type = AssertSpecial
trigger1 = 1
flag = nobardisplay
flag2 = intro
;flag3 = nomusic

[State 191,4]
type = ChangeState
trigger1 = Animtime = 0;RoundState = 2
value = 0
ctrl = 0

;-------------------------------------------------------------------
;Intro vs Maxima
[Statedef 183]
type = S
movetype = I
physics = S
anim = 183
ctrl = 0

[State 191, 1]
type = ChangeAnim
trigger1 = RoundState = 0
value = anim

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = 183,0
volume = 200

[State 191,0]
type = AssertSpecial
trigger1 = 1
flag = nobardisplay
flag2 = intro
;flag3 = nomusic

[State 191,4]
type = ChangeState
trigger1 = Animtime = 0;RoundState = 2
value = 0
ctrl = 0

;-------------------------------------------------------------------
;Intro vs Whip
[Statedef 184]
type = S
movetype = I
physics = S
anim = 184
ctrl = 0

[State 191, 1]
type = ChangeAnim
trigger1 = RoundState = 0
value = anim

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
value = 184,0
volume = 200

[State 191,0]
type = AssertSpecial
trigger1 = 1
flag = nobardisplay
flag2 = intro
;flag3 = nomusic

[State 191,4]
type = ChangeState
trigger1 = Animtime = 0;RoundState = 2
value = 0
ctrl = 0

;-------------------------------------------------------------------
;Intro vs Kula
[Statedef 185]
type = S
movetype = I
physics = S
anim = 185
ctrl = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
value = 185,0
volume = 200

[State 191,0]
type = AssertSpecial
trigger1 = 1
flag = nobardisplay
flag2 = intro

[State 191,4]
type = ChangeState
trigger1 = Animtime = 0;RoundState = 2
value = 0
ctrl = 0
;---------------------------------------------------------------------------
; Taunt, taken from KFM
[Statedef 195]
type = S
ctrl = 0
velset = 0,0
anim = 195
movetype = I
physics = S
sprpriority = 2

[State 195, 1]
type = CtrlSet
triggerall = Roundstate = 2
trigger1 = Time = 40
value = 1

[State 195, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[State 191,3]
type = PlaySnd
trigger1 = animelem = 2
value = 195,0
channel = 19
volume = 200


;============================================================================
; 失败 Time Over
;============================================================================
[Statedef 170]
type = S
ctrl = 0
anim = 170
velset = 0,0

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1










