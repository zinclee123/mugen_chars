;===========================================================================
; Guard Crash
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