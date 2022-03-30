; ______________________________
;| Ryu by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;================================================================================================
;========================================< MODE STATES >===========================================
;================================================================================================

;==========< PALETTE MODE SELECTION >==========
[Statedef 5900]
type = S

[State 5900, Float VarReset]
type = VarRangeSet
trigger1 = !time
fvalue = 0
first=1
last=39

[State 5900, Int VarReset]
type = VarRangeSet
trigger1 = !time
value = 0
first=2
last=37

[State 5900, Int VarReset]
type = VarRangeSet
trigger1 = !time
value = 0
first=39
last=59

[State 5900, Mode Var]
type = varset
trigger1 = time <= 1 && RoundsExisted = 0
var(1) = ifelse(palno = 9 || palno = 12, 3, ifelse(palno >= 7, 2, 1))

[State 5900, Palette]
type = remappal
trigger1 = time <= 1 && RoundsExisted = 0
source = 1,1
dest = var(1),palno + 12*(command = "holdback")

[state 5900, dizzy threshold]
type = varset
trigger1 = time <= 1 && RoundsExisted = 0
var(38) = IfElse(var(1)=3,120,IfElse(var(1)=2,100,140))

[State 5900, End]
type = changestate
trigger1 = time
value = ifelse(RoundsExisted = 0, 190, 0)
