;-| Single Button |---------------------------------------------------------
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

[Command]
name = "charge"
command = /$c
time = 1

[Command]
name = "up" ;Required (do not remove)
command = U
time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

;-| Hold Button |-----------------------------------------------------------
[Command]
name = "hold_a"
command = /a
time = 1

[Command]
name = "hold_b"
command = /b
time = 1

[Command]
name = "hold_c"
command = /c
time = 1

[Command]
name = "hold_x"
command = /x
time = 1

[Command]
name = "hold_y"
command = /y
time = 1

[Command]
name = "hold_z"
command = /z
time = 1

[Command]
name = "hold_start"
command = /s
time = 1

;-| Super Desperation Move Motions |--------------------------------------------------
[Command]
name = "qcb_yx"
command = ~D, DB, B, c+z
time = 20

[Command]
name = "qcf_yx"
command = ~D, DF, F, c+z
time = 20

[Command]
name = "cld"
command = ~D, D, c+z
time = 20

[Command]
name = "dd_ybz"
command = ~D, D, y+b+z
time = 20

[Command]
name = "dd_ybz"
command = ~D, D, c+z
time = 20

[Command]
name = "hcfufd_a"
command = ~B, $D, F, UF, $D, a
time = 24
buffer.time = 3

[Command]
name = "hcfufd_b"
command = ~B, $D, F, UF, $D, b
time = 24
buffer.time = 3

[Command]
name = "hcbubd_a"
command = ~F, $D, B, UB, $D, a
time = 20
buffer.time = 3

[Command]
name = "hcbubd_b"
command = ~F, $D, B, UB, $D, b
time = 20
buffer.time = 3

[Command]
name = "hcbhcb_z"
command = ~F, $D, B, F, $D, B, z
time = 40

[Command]
name = "hcfhcf_z"
command = ~B, $D, F, B, $D, F, z
time = 40

[Command]
name = "hcbhcb_xy"
command = ~F, $D, B, F, $D, B, x+y
time = 40

[Command]
name = "hcfhcf_xy"
command = ~B, $D, F, B, $D, F, x+y
time = 40

[Command]
name = "qcfhcb_z"
command = ~D, DF, F, $D, B, z
time = 30

[Command]
name = "qcbhcf_z"
command = ~D, DB, B, $D, F, z
time = 30

[Command]
name = "hcbf_z"
command = ~F, $D, B, F, z
time = 30

[Command]
name = "hcfb_z"
command = ~B, $D, F, B, z
time = 30

[Command]
name = "qcfhcb_xy"
command = ~B, F, B, z
time = 30

[Command]
name = "qcbhcf_xy"
command = ~F, B, F, z
time = 30

[Command]
name = "2qcf_xy"
command = ~D, DF, F, D, DF, F, x+y
time = 30

[Command]
name = "2qcb_xy"
command = ~D, DB, B, D, DB, B, x+y
time = 30


;-| Desperation Move Motions |--------------------------------------------------------

[Command]
name = "qcfhcb_x"
command = ~B, F, B, x
time = 30

[Command]
name = "qcbhcf_x"
command = ~F, B, F, x
time = 30

[Command]
name = "qcfhcb_y"
command = ~B, F, B, y
time = 30

[Command]
name = "qcbhcf_y"
command = ~F, B, F, y
time = 30

[Command]
name = "qcfhcb_a"
command = ~D, F, $D, B, a
time = 30

[Command]
name = "qcbhcf_a"
command = ~D, B, $D, F, a
time = 30

[Command]
name = "qcfhcb_b"
command = ~D, F, $D, B, b
time = 30

[Command]
name = "qcbhcf_b"
command = ~D, B, $D, F, b
time = 30

[Command]
name = "hcfrqcf_a"
command = ~B, DB, F, DF, D, a
time = 30

[Command]
name = "hcfrqcf_a"
command = ~B, D, F, D, a
time = 30

[Command]
name = "hcbrqcb_a"
command = ~F, DF, B, DB, D, a
time = 30

[Command]
name = "hcbrqcb_a"
command = ~F, D, B, D, a
time = 30

[Command]
name = "hcfrqcf_b"
command = ~B, DB, F, DF, D, b
time = 30

[Command]
name = "hcfrqcf_b"
command = ~B, D, F, D, b
time = 30

[Command]
name = "hcbrqcb_b"
command = ~F, DF, B, DB, D, b
time = 30

[Command]
name = "hcbrqcb_b"
command = ~F, D, B, D, b
time = 30

[Command]
name = "2qcf_x"
command = ~D, DF, F, D, DF, F, x
time = 30

[Command]
name = "2qcf_y"
command = ~D, DF, F, D, DF, F, y
time = 30

[Command]
name = "2qcb_x"
command = ~D, DB, B, D, DB, B, x
time = 30

[Command]
name = "2qcb_y"
command = ~D, DB, B, D, DB, B, y
time = 30

[Command]
name = "2qcf_a"
command = ~D, DF, F, D, DF, F, a
time = 30

[Command]
name = "2qcf_b"
command = ~D, DF, F, D, DF, F, b
time = 30

[Command]
name = "2qcb_a"
command = ~D, DB, B, D, DB, B, a
time = 30

[Command]
name = "2qcb_b"
command = ~D, DB, B, D, DB, B, b
time = 30

[Command]
name = "rnqd"
command = ~D, DF, x+y
time = 20

;-| Special Motions |------------------------------------------------------
[Command]
name = "rdp_a"
command = ~B, D, DB, a
time = 20

[Command]
name = "rdp_b"
command = ~B, D, DB, b
time = 20

[Command]
name = "dp_a"
command = ~F, D, DF, a
time = 20

[Command]
name = "dp_b"
command = ~F, D, DF, b
time = 20

[Command]
name = "dp_y"
command = ~F, D, DF, y
time = 20

[Command]
name = "dp_x"
command = ~F, D, DF, x
time = 20

[Command]
name = "dp_z"
command = ~F, D, DF, z
time = 20

[Command]
name = "rdp_y"
command = ~B, D, DB, y
time = 20

[Command]
name = "rdp_x"
command = ~B, D, DB, x
time = 20

[Command]
name = "hcbf_p"
command = ~F, D, B, F, y
time = 30

[Command]
name = "hcbf_p"
command = ~F, D, B, F, x
time = 30

[Command]
name = "hcfb_p"
command = ~F, D, B, F, y
time = 30

[Command]
name = "hcfb_p"
command = ~F, D, B, F, x
time = 30

[Command]
name = "hcb_a"
command = ~F, D, B, a
time = 20

[Command]
name = "hcb_b"
command = ~F, D, B, b
time = 20

[Command]
name = "hcf_a"
command = ~B, D, F, a
time = 20

[Command]
name = "hcf_b"
command = ~B, D, F, b
time = 20

[Command]
name = "hcb_x"
command = ~F, D, B, x
time = 20

[Command]
name = "hcb_y"
command = ~F, D, B, y
time = 20

[Command]
name = "qcb_x"
command = ~D, DB, B, x
time = 20

[Command]
name = "qcb_y"
command = ~D, DB, B, y
time = 20

[Command]
name = "qcf_a"
command = ~D, DF, F, a
time = 20

[Command]
name = "qcf_b"
command = ~D, DF, F, b
time = 20

[Command]
name = "qcb_a"
command = ~D, DB, B, a
time = 20

[Command]
name = "qcb_b"
command = ~D, DB, B, b
time = 20

[Command]
name = "qcf_x"
command = ~D, DF, F, x
time = 20

[Command]
name = "qcf_y"
command = ~D, DF, F, y
time = 20

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = ~F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = ~B, B
time = 5

[Command]
name = "hop"
command = D,D
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "charge";Required (do not remove)
command = x+y+a
time = 10

[Command]
name = "recovery";Required (do not remove)
command = x+a
time = 1

[Command]
name = "recovery";Required (do not remove)
command = c
time = 1

[Command]
name = "roll"
command = x+a
time = 3

[Command]
name = "knock"
command = y+b
time = 10

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "hijump"
command = ~$D, $U
time = 18

[Command]
name = "chargedhijump"
command = ~13$D, $U

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;-| CPU |--------------------------------------------------------------
; Note that if you make any changes to the basic one-button or recovery
; commands, you'll need to make the same changes to their matching commands here
; and/or in the XOR VarSet controller.  That includes things like, for example:
;  * changing the recovery command to use a different combination of buttons.
;  * renaming the b button command as "d", or the start button command as "s".
;  * switching the button names around, e.g. so button y triggers "a" and button a triggers "y".
;  * having more than one way to trigger the same command name.
; If you understand how the XOR method works, the proper changes should be obvious.
; If you don't understand it, then simply disable the lines in the XOR VarSet
; controller that correspond to the commands you've altered.

[Command]
name = "a2"
command = a
time = 1

[Command]
name = "b2"
command = b
time = 1

[Command]
name = "c2"
command = c
time = 1

[Command]
name = "x2"
command = x
time = 1

[Command]
name = "y2"
command = y
time = 1

[Command]
name = "z2"
command = z
time = 1

[Command]
name = "start2"
command = s
time = 1

[Command]
name = "holdfwd2"
command = /$F
time = 1

[Command]
name = "holdback2"
command = /$B
time = 1

[Command]
name = "holdup2"
command = /$U
time = 1

[Command]
name = "holddown2"
command = /$D
time = 1

[Command]
name = "hold_a2"
command = /a
time = 1

[Command]
name = "hold_b2"
command = /b
time = 1

[Command]
name = "hold_c2"
command = /c
time = 1

[Command]
name = "hold_x2"
command = /x
time = 1

[Command]
name = "hold_y2"
command = /y
time = 1

[Command]
name = "hold_z2"
command = /z
time = 1

[Command]
name = "hold_start2"
command = /s
time = 1

[Command]
name = "recovery2"
command = x+a
time = 1

[Command]
name = "recovery2";Required (do not remove)
command = c
time = 1
;---------------------------------------------------------------------------
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.


; Don't remove the following line. It's required by the CMD standard.

[Statedef -1]

[State -1,test]
type = ChangeState
trigger1 = !IsHelper
trigger1 = var(59) = 0 
trigger1 = command = "start"
;trigger1 = var(4) := 5
value = 3300


;===========================================================================
;---------------------------------------------------------------------------
;Crimson Star Road HSDM
[State -1, Crimson Star Road HSDM]
type = ChangeState
value = 3200
triggerall = !var(59)
triggerall = ifelse((Anim!=[5,6]),command="qcb_yx",command="qcf_yx")
triggerall = statetype != A
triggerall = var(35)>4 && !var(53)
trigger1 = ctrl || stateno = 101
;Basic moves cancelable into Specials, DMs and SDMs
trigger2 = stateno = 205 && animelemtime(1) >= 0 && animelemtime(4) < 0
trigger3 = stateno = 210 && animelemtime(1) >= 0 && animelemtime(7) < 0
trigger4 = stateno = 215 && animelemtime(1) >= 0 && animelemtime(6) < 0
trigger5 = stateno = 305 && animelemtime(1) >= 0 && animelemtime(4) < 0
trigger6 = stateno = 315 && animelemtime(1) >= 0 && animelemtime(5) < 0
trigger7 = stateno = 400 && animelemtime(1) >= 0 && animelemtime(4) < 0
trigger8 = stateno = 405 && animelemtime(1) >= 0 && animelemtime(6) < 0
trigger9 = stateno = 500 && animelemtime(1) >= 0 && animelemtime(4) < 0
trigger10 = stateno = 505 && animelemtime(1) >= 0 && animelemtime(5) < 0
trigger11 = stateno = 980 && animelemtime(5) > 0 && animelemtime(6) < 0
trigger12 = stateno = 981 && animelemtime(5) > 0 && animelemtime(6) < 0
;Command moves cancelable into Specials, DMs and SDMs
trigger13 = stateno = 801 && animelemtime(6) > 0 && animelemtime(8) < 0 && movecontact = 1
;---------------------------------------------------------------------------
[State -1, Crimson Star Road HSDM]
type = ChangeState
value = 4000
triggerall = !var(59)
triggerall = command="cld"
triggerall = statetype != A
triggerall = var(35)>4 && !var(53)
trigger1 = ctrl || stateno = 101
;Basic moves cancelable into Specials, DMs and SDMs
trigger2 = stateno = 205 && animelemtime(1) >= 0 && animelemtime(4) < 0
trigger3 = stateno = 210 && animelemtime(1) >= 0 && animelemtime(7) < 0
trigger4 = stateno = 215 && animelemtime(1) >= 0 && animelemtime(6) < 0
trigger5 = stateno = 305 && animelemtime(1) >= 0 && animelemtime(4) < 0
trigger6 = stateno = 315 && animelemtime(1) >= 0 && animelemtime(5) < 0
trigger7 = stateno = 400 && animelemtime(1) >= 0 && animelemtime(4) < 0
trigger8 = stateno = 405 && animelemtime(1) >= 0 && animelemtime(6) < 0
trigger9 = stateno = 500 && animelemtime(1) >= 0 && animelemtime(4) < 0
trigger10 = stateno = 505 && animelemtime(1) >= 0 && animelemtime(5) < 0
trigger11 = stateno = 980 && animelemtime(5) > 0 && animelemtime(6) < 0
trigger12 = stateno = 981 && animelemtime(5) > 0 && animelemtime(6) < 0
;Command moves cancelable into Specials, DMs and SDMs
trigger13 = stateno = 801 && animelemtime(6) > 0 && animelemtime(8) < 0 && movecontact = 1
;---------------------------------------------------------------------------
;Chain Drive SDM
[State -1, Chain Drive SDM]
type = ChangeState
value = 3110
triggerall = !var(59)
triggerall = ifelse((Anim!=[5,6]),command="qcfhcb_xy",command="qcbhcf_xy")
triggerall = statetype != A
triggerall = var(35)>2 && !var(53)
trigger1 = ctrl || stateno = 101
;Basic moves cancelable into Specials, DMs and SDMs
trigger2 = stateno = 205 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger3 = stateno = 210 && animelemtime(5) > 0 && animelemtime(7) < 0
trigger4 = stateno = 215 && animelemtime(3) > 0 && animelemtime(6) < 0
trigger5 = stateno = 305 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger6 = stateno = 315 && animelemtime(4) > 0 && animelemtime(5) < 0
trigger7 = stateno = 400 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger8 = stateno = 405 && animelemtime(3) > 0 && animelemtime(6) < 0
trigger9 = stateno = 500 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger10 = stateno = 505 && animelemtime(4) > 0 && animelemtime(5) < 0
trigger11 = stateno = 980 && animelemtime(5) > 0 && animelemtime(6) < 0
trigger12 = stateno = 981 && animelemtime(5) > 0 && animelemtime(6) < 0
;Command moves cancelable into Specials, DMs and SDMs
trigger13 = stateno = 801 && animelemtime(6) > 0 && animelemtime(8) < 0 && movecontact = 1
;Special moves cancelable into DMs and SDMs
trigger14 = (stateno = 1200 || stateno = 1205) && movecontact = 1 && movetype = A && (var(51) || power >= 3000)
;MAX Cancels
trigger15 = stateno = 200 && var(51)>0
trigger16 = stateno = 300 && var(51)>0
trigger17 = stateno = 310 && var(51)>0
;
trigger18 = stateno = 205 && var(51)>0
trigger19 = stateno = 210 && var(51)>0
trigger20 = stateno = 215 && var(51)>0
trigger21 = stateno = 305 && var(51)>0
trigger22 = stateno = 315 && var(51)>0
trigger23 = stateno = 400 && var(51)>0
trigger24 = stateno = 405 && var(51)>0
trigger25 = stateno = 500 && var(51)>0
trigger26 = stateno = 505 && var(51)>0
trigger27 = stateno = 980 && var(51)>0
trigger28 = stateno = 981 && var(51)>0
trigger29 = stateno = 800 && var(51)>0 && movecontact = 1
;Special MAX Cancels
trigger30 = stateno = 1310 && (var(51) || power >= 3000) && animelemtime(3) > 0 && animelemtime(6) < 0 && movecontact = 1
trigger31 = stateno = 1035 && (var(51) || power >= 3000) && movecontact
;---------------------------------------------------------------------------
;Chain Drive DM
[State -1, Chain Drive DM]
type = ChangeState
value = 3100
triggerall = !var(59)
triggerall = ifelse((Anim!=[5,6]),(command="qcfhcb_x" || command = "qcfhcb_y"),(command="qcbhcf_x" || command="qcbhcf_y"))
triggerall = statetype != A
triggerall = var(35)>0 || var(53)
trigger1 = ctrl || stateno = 101
;Basic moves cancelable into Specials, DMs and SDMs
trigger2 = stateno = 205 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger3 = stateno = 210 && animelemtime(5) > 0 && animelemtime(7) < 0
trigger4 = stateno = 215 && animelemtime(3) > 0 && animelemtime(6) < 0
trigger5 = stateno = 305 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger6 = stateno = 315 && animelemtime(4) > 0 && animelemtime(5) < 0
trigger7 = stateno = 400 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger8 = stateno = 405 && animelemtime(3) > 0 && animelemtime(6) < 0
trigger9 = stateno = 500 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger10 = stateno = 505 && animelemtime(4) > 0 && animelemtime(5) < 0
trigger11 = stateno = 980 && animelemtime(5) > 0 && animelemtime(6) < 0
trigger12 = stateno = 981 && animelemtime(5) > 0 && animelemtime(6) < 0
;Command moves cancelable into Specials, DMs and SDMs
trigger13 = stateno = 801 && animelemtime(6) > 0 && animelemtime(8) < 0 && movecontact = 1
;Special moves cancelable into DMs and SDMs
trigger14 = (stateno = 1200 || stateno = 1205) && movecontact = 1 && movetype = A && (var(51) || var(53) || power >= 2000)
;MAX Cancels
trigger15 = stateno = 200 && var(51)>0
trigger16 = stateno = 300 && var(51)>0
trigger17 = stateno = 310 && var(51)>0
;
trigger18 = stateno = 205 && var(51)>0
trigger19 = stateno = 210 && var(51)>0
trigger20 = stateno = 215 && var(51)>0
trigger21 = stateno = 305 && var(51)>0
trigger22 = stateno = 315 && var(51)>0
trigger23 = stateno = 400 && var(51)>0
trigger24 = stateno = 405 && var(51)>0
trigger25 = stateno = 500 && var(51)>0
trigger26 = stateno = 505 && var(51)>0
trigger27 = stateno = 980 && var(51)>0
trigger28 = stateno = 981 && var(51)>0
trigger29 = stateno = 800 && var(51)>0 && movecontact = 1
;Special MAX Cancels
trigger30 = stateno = 1310 && (var(51) || var(53) || power >= 2000) && animelemtime(3) > 0 && animelemtime(6) < 0 && movecontact = 1
trigger31 = stateno = 1035 && (var(51) || var(53) || power >= 2000) && movecontact
;---------------------------------------------------------------------------
;Heat Drive DM
[State -1, Heat Drive DM]
type = ChangeState
value = 3000
triggerall = !var(59)
triggerall = ifelse((Anim!=[5,6]),(command="2qcf_x" || command = "2qcf_y"),(command="2qcb_x" || command="2qcb_y"))
triggerall = statetype != A
triggerall = var(35)>0 || var(53)
trigger1 = ctrl || stateno = 101
;Basic moves cancelable into Specials, DMs and SDMs
trigger2 = stateno = 205 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger3 = stateno = 210 && animelemtime(5) > 0 && animelemtime(7) < 0
trigger4 = stateno = 215 && animelemtime(3) > 0 && animelemtime(6) < 0
trigger5 = stateno = 305 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger6 = stateno = 315 && animelemtime(4) > 0 && animelemtime(5) < 0
trigger7 = stateno = 400 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger8 = stateno = 405 && animelemtime(3) > 0 && animelemtime(6) < 0
trigger9 = stateno = 500 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger10 = stateno = 505 && animelemtime(4) > 0 && animelemtime(5) < 0
trigger11 = stateno = 980 && animelemtime(5) > 0 && animelemtime(6) < 0
trigger12 = stateno = 981 && animelemtime(5) > 0 && animelemtime(6) < 0
;Command moves cancelable into Specials, DMs and SDMs
trigger13 = stateno = 801 && animelemtime(6) > 0 && animelemtime(8) < 0 && movecontact = 1
;Special moves cancelable into DMs and SDMs
trigger14 = (stateno = 1200 || stateno = 1205) && movecontact = 1 && movetype = A && (var(51) || var(53) || power >= 2000)
;MAX Cancels
trigger15 = stateno = 200 && var(51)>0
trigger16 = stateno = 300 && var(51)>0
trigger17 = stateno = 310 && var(51)>0
;
trigger18 = stateno = 205 && var(51)>0
trigger19 = stateno = 210 && var(51)>0
trigger20 = stateno = 215 && var(51)>0
trigger21 = stateno = 305 && var(51)>0
trigger22 = stateno = 315 && var(51)>0
trigger23 = stateno = 400 && var(51)>0
trigger24 = stateno = 405 && var(51)>0
trigger25 = stateno = 500 && var(51)>0
trigger26 = stateno = 505 && var(51)>0
trigger27 = stateno = 980 && var(51)>0
trigger28 = stateno = 981 && var(51)>0
trigger29 = stateno = 800 && var(51)>0 && movecontact = 1
;Special MAX Cancels
trigger30 = stateno = 1310 && (var(51) || var(53) || power >= 2000) && animelemtime(3) > 0 && animelemtime(6) < 0 && movecontact = 1
trigger31 = stateno = 1035 && (var(51) || var(53) || power >= 2000) && movecontact

[State -1, Heat Drive DM]
type = ChangeState
value = 3300
triggerall = !var(59)
triggerall = command="2qcf_a"||command="2qcf_b"
triggerall = statetype != A
triggerall = var(35)>0 || var(53)
trigger1 = ctrl || stateno = 101
;Basic moves cancelable into Specials, DMs and SDMs
trigger2 = stateno = 205 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger3 = stateno = 210 && animelemtime(5) > 0 && animelemtime(7) < 0
trigger4 = stateno = 215 && animelemtime(3) > 0 && animelemtime(6) < 0
trigger5 = stateno = 305 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger6 = stateno = 315 && animelemtime(4) > 0 && animelemtime(5) < 0
trigger7 = stateno = 400 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger8 = stateno = 405 && animelemtime(3) > 0 && animelemtime(6) < 0
trigger9 = stateno = 500 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger10 = stateno = 505 && animelemtime(4) > 0 && animelemtime(5) < 0
trigger11 = stateno = 980 && animelemtime(5) > 0 && animelemtime(6) < 0
trigger12 = stateno = 981 && animelemtime(5) > 0 && animelemtime(6) < 0
;Command moves cancelable into Specials, DMs and SDMs
trigger13 = stateno = 801 && animelemtime(6) > 0 && animelemtime(8) < 0 && movecontact = 1
;Special moves cancelable into DMs and SDMs
trigger14 = (stateno = 1200 || stateno = 1205) && movecontact = 1 && movetype = A && (var(51) || var(53) || power >= 2000)
;MAX Cancels
trigger15 = stateno = 200 && var(51)>0
trigger16 = stateno = 300 && var(51)>0
trigger17 = stateno = 310 && var(51)>0
;
trigger18 = stateno = 205 && var(51)>0
trigger19 = stateno = 210 && var(51)>0
trigger20 = stateno = 215 && var(51)>0
trigger21 = stateno = 305 && var(51)>0
trigger22 = stateno = 315 && var(51)>0
trigger23 = stateno = 400 && var(51)>0
trigger24 = stateno = 405 && var(51)>0
trigger25 = stateno = 500 && var(51)>0
trigger26 = stateno = 505 && var(51)>0
trigger27 = stateno = 980 && var(51)>0
trigger28 = stateno = 981 && var(51)>0
trigger29 = stateno = 800 && var(51)>0 && movecontact = 1
;Special MAX Cancels
trigger30 = stateno = 1310 && (var(51) || var(53) || power >= 2000) && animelemtime(3) > 0 && animelemtime(6) < 0 && movecontact = 1
trigger31 = stateno = 1035 && (var(51) || var(53) || power >= 2000) && movecontact

;---------------------------------------------------------------------------
;EX Air Trigger
[State -1, EX Air Trigger]
type = ChangeState
value = 1400
;triggerall = var(10)=2
triggerall = !var(59)
triggerall = ifelse((Anim!=[5,6]),command="qcf_a",command="qcb_a")
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 610 && animelemtime(3) > 0 && animelemtime(4) < 0 && movecontact = 1
trigger3 = stateno = 710 && animelemtime(4) > 0 && animelemtime(6) < 0 && movecontact = 1
trigger4 = stateno = 810 && movecontact = 1
;MAX Cancels
trigger5 = stateno = 600 && var(51)>0 && animelemtime(3) > 0 && animelemtime(4) < 0 && movecontact = 1
trigger6 = stateno = 700 && anim = 700 && var(51)>0 && animelemtime(3) > 0 && animelemtime(11) < 0 && movecontact = 1
trigger7 = stateno = 700 && anim = 705 && var(51)>0 && animelemtime(4) > 0 && animelemtime(16) < 0 && movecontact = 1
trigger8 = stateno = 1205 && var(51) && movecontact && animelemtime(10) > 0 && animelemtime(12) < 0

[State -1, EX Air Trigger]
type = ChangeState
value = 1450
triggerall = !var(59)
triggerall = ifelse((Anim!=[5,6]),command="qcf_b",command="qcb_b")
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 610 && animelemtime(3) > 0 && animelemtime(4) < 0 && movecontact = 1
trigger3 = stateno = 710 && animelemtime(4) > 0 && animelemtime(6) < 0 && movecontact = 1
trigger4 = stateno = 810 && movecontact = 1
;MAX Cancels
trigger5 = stateno = 600 && var(51)>0 && animelemtime(3) > 0 && animelemtime(4) < 0 && movecontact = 1
trigger6 = stateno = 700 && anim = 700 && var(51)>0 && animelemtime(3) > 0 && animelemtime(11) < 0 && movecontact = 1
trigger7 = stateno = 700 && anim = 705 && var(51)>0 && animelemtime(4) > 0 && animelemtime(16) < 0 && movecontact = 1
trigger8 = stateno = 1205 && var(51) && movecontact && animelemtime(10) > 0 && animelemtime(12) < 0
;---------------------------------------------------------------------------
;Minute Spike Aerial Hard
[State -1, Minute Spike Aerial Hard]
type = ChangeState
value = 1325
triggerall = !var(59)
triggerall = ifelse((Anim!=[5,6]),command="qcb_b",command="qcf_b")
trigger1 = statetype = A
trigger1 = ctrl || stateno = 106
trigger2 = stateno = 610 && animelemtime(3) > 0 && animelemtime(4) < 0 && movecontact = 1
trigger3 = stateno = 710 && animelemtime(4) > 0 && animelemtime(6) < 0 && movecontact = 1
trigger4 = stateno = 810 && movecontact = 1 && animelemtime(7) >= 0
;MAX Cancels
trigger5 = stateno = 600 && var(51)>0 && animelemtime(3) > 0 && animelemtime(4) < 0 && movecontact = 1
trigger6 = stateno = 700 && anim = 700 && var(51)>0 && animelemtime(3) > 0 && animelemtime(11) < 0 && movecontact = 1
trigger7 = stateno = 700 && anim = 705 && var(51)>0 && animelemtime(4) > 0 && animelemtime(16) < 0 && movecontact = 1
;Special MAX Cancels
trigger8 = stateno = 1200 && var(51)>0 && animelemtime(9) > 0 && animelemtime(11) < 0 && movecontact = 1
trigger9 = stateno = 1205 && var(51)>0 && animelemtime(10) > 0 && animelemtime(11) < 0 && movecontact = 1
trigger10 = stateno = 1210 && var(51)>0 && animelemtime(5) > 0 && animelemtime(7) < 0 && movecontact = 1
trigger11 = stateno = 1300 && var(51)>0 && animelemtime(8) > 0 && animelemtime(10) < 0 && movecontact = 1
trigger12 = stateno = 1305 && var(51)>0 && animelemtime(8) > 0 && animelemtime(10) < 0 && movecontact = 1

;---------------------------------------------------------------------------
;Minute Spike Aerial Weak
[State -1, Minute Spike Aerial Weak]
type = ChangeState
value = 1320
triggerall = !var(59)
triggerall = ifelse((Anim!=[5,6]),command="qcb_a",command="qcf_a")
trigger1 = statetype = A
trigger1 = ctrl || stateno = 106
trigger2 = stateno = 610 && animelemtime(3) > 0 && animelemtime(4) < 0 && movecontact = 1
trigger3 = stateno = 710 && animelemtime(4) > 0 && animelemtime(6) < 0 && movecontact = 1
trigger4 = stateno = 810 && movecontact = 1 && animelemtime(7) >= 0
;MAX Cancels
trigger5 = stateno = 600 && var(51)>0 && animelemtime(3) > 0 && animelemtime(4) < 0 && movecontact = 1
trigger6 = stateno = 700 && anim = 700 && var(51)>0 && animelemtime(3) > 0 && animelemtime(11) < 0 && movecontact = 1
trigger7 = stateno = 700 && anim = 705 && var(51)>0 && animelemtime(4) > 0 && animelemtime(16) < 0 && movecontact = 1
;Special MAX Cancels
trigger8 = stateno = 1200 && var(51)>0 && animelemtime(9) > 0 && animelemtime(11) < 0 && movecontact = 1
trigger9 = stateno = 1205 && var(51)>0 && animelemtime(10) > 0 && animelemtime(11) < 0 && movecontact = 1
trigger10 = stateno = 1210 && var(51)>0 && animelemtime(5) > 0 && animelemtime(7) < 0 && movecontact = 1
trigger11 = stateno = 1300 && var(51)>0 && animelemtime(8) > 0 && animelemtime(10) < 0 && movecontact = 1
trigger12 = stateno = 1305 && var(51)>0 && animelemtime(8) > 0 && animelemtime(10) < 0 && movecontact = 1

;-------------------------------------------------------------------------------
;Narrow Spike (M.Spike Hard Follow-up)
[State -1, Narrow Spike]
type = ChangeState
value = 1310
triggerall = !var(59)
triggerall = command="holddown"
triggerall = command="a" || command="b"
trigger1 = stateno = 1305 && time > 4
ignorehitpause = 1
;---------------------------------------------------------------------------
;Minute Spike Hard
[State -1, Minute Spike Hard]
type = ChangeState
value = 1305
triggerall = !var(59)
triggerall = ifelse((Anim!=[5,6]),command="qcb_b",command="qcf_b")
triggerall = statetype != A
trigger1 = ctrl || stateno = 101
;Basic moves cancelable into Specials, DMs and SDMs
trigger2 = stateno = 205 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger3 = stateno = 210 && animelemtime(5) > 0 && animelemtime(7) < 0
trigger4 = stateno = 215 && animelemtime(3) > 0 && animelemtime(6) < 0
trigger5 = stateno = 305 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger6 = stateno = 315 && animelemtime(4) > 0 && animelemtime(5) < 0
trigger7 = stateno = 400 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger8 = stateno = 405 && animelemtime(3) > 0 && animelemtime(6) < 0
trigger9 = stateno = 500 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger10 = stateno = 505 && animelemtime(4) > 0 && animelemtime(5) < 0
trigger11 = stateno = 980 && animelemtime(5) > 0 && animelemtime(6) < 0
trigger12 = stateno = 981 && animelemtime(5) > 0 && animelemtime(6) < 0
;Command moves cancelable into Specials, DMs and SDMs
trigger13 = stateno = 801 && animelemtime(6) > 0 && animelemtime(8) < 0 && movecontact = 1
;MAX Cancels
trigger14 = stateno = 200 && var(51)>0
trigger15 = stateno = 300 && var(51)>0
trigger16 = stateno = 310 && var(51)>0
;
trigger17 = stateno = 205 && var(51)>0
trigger18 = stateno = 210 && var(51)>0
trigger19 = stateno = 215 && var(51)>0
trigger20 = stateno = 305 && var(51)>0
trigger21 = stateno = 315 && var(51)>0
trigger22 = stateno = 400 && var(51)>0
trigger23 = stateno = 405 && var(51)>0
trigger24 = stateno = 500 && var(51)>0
trigger25 = stateno = 505 && var(51)>0
trigger26 = stateno = 980 && var(51)>0
trigger27 = stateno = 981 && var(51)>0
trigger28 = stateno = 800 && var(51)>0 && movecontact = 1
;Special MAX Cancels
trigger29 = stateno = 1200 && var(51)>0 && animelemtime(4) > 0 && animelemtime(9) < 0 && movecontact = 1
trigger30 = stateno = 1205 && var(51)>0 && animelemtime(4) > 0 && animelemtime(9) < 0 && movecontact = 1
trigger31 = stateno = 810 && animelemtime(5) > 0 && animelemtime(6) < 0 && movecontact = 1
;---------------------------------------------------------------------------
;Minute Spike Weak
[State -1, Minute Spike Weak]
type = ChangeState
value = 1300
triggerall = !var(59)
triggerall = ifelse((Anim!=[5,6]),command="qcb_a",command="qcf_a")
triggerall = statetype != A
trigger1 = ctrl || stateno = 101
;Basic moves cancelable into Specials, DMs and SDMs
trigger2 = stateno = 205 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger3 = stateno = 210 && animelemtime(5) > 0 && animelemtime(7) < 0
trigger4 = stateno = 215 && animelemtime(3) > 0 && animelemtime(6) < 0
trigger5 = stateno = 305 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger6 = stateno = 315 && animelemtime(4) > 0 && animelemtime(5) < 0
trigger7 = stateno = 400 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger8 = stateno = 405 && animelemtime(3) > 0 && animelemtime(6) < 0
trigger9 = stateno = 500 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger10 = stateno = 505 && animelemtime(4) > 0 && animelemtime(5) < 0
trigger11 = stateno = 980 && animelemtime(5) > 0 && animelemtime(6) < 0
trigger12 = stateno = 981 && animelemtime(5) > 0 && animelemtime(6) < 0
;Command moves cancelable into Specials, DMs and SDMs
trigger13 = stateno = 801 && animelemtime(6) > 0 && animelemtime(8) < 0 && movecontact = 1
;MAX Cancels
trigger14 = stateno = 200 && var(51)>0
trigger15 = stateno = 300 && var(51)>0
trigger16 = stateno = 310 && var(51)>0
;
trigger17 = stateno = 205 && var(51)>0
trigger18 = stateno = 210 && var(51)>0
trigger19 = stateno = 215 && var(51)>0
trigger20 = stateno = 305 && var(51)>0
trigger21 = stateno = 315 && var(51)>0
trigger22 = stateno = 400 && var(51)>0
trigger23 = stateno = 405 && var(51)>0
trigger24 = stateno = 500 && var(51)>0
trigger25 = stateno = 505 && var(51)>0
trigger26 = stateno = 980 && var(51)>0
trigger27 = stateno = 981 && var(51)>0
trigger28 = stateno = 800 && var(51)>0 && movecontact = 1
;Special MAX Cancels
trigger29 = stateno = 1200 && var(51)>0 && animelemtime(4) > 0 && animelemtime(9) < 0 && movecontact = 1
trigger30 = stateno = 1205 && var(51)>0 && animelemtime(4) > 0 && animelemtime(9) < 0 && movecontact = 1
trigger31 = stateno = 810 && animelemtime(5) > 0 && animelemtime(6) < 0 && movecontact = 1
;---------------------------------------------------------------------------
;Crow Bite Hard
[State -1, Crow Bite Hard]
type = ChangeState
value = 1205
triggerall = !var(59)
triggerall = ifelse((Anim!=[5,6]),command="dp_y",command="rdp_y")
triggerall = statetype != A
trigger1 = ctrl || stateno = 101
;Basic moves cancelable into Specials, DMs and SDMs
trigger2 = stateno = 205 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger3 = stateno = 210 && animelemtime(5) > 0 && animelemtime(7) < 0
trigger4 = stateno = 215 && animelemtime(3) > 0 && animelemtime(6) < 0
trigger5 = stateno = 305 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger6 = stateno = 315 && animelemtime(4) > 0 && animelemtime(5) < 0
trigger7 = stateno = 400 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger8 = stateno = 405 && animelemtime(3) > 0 && animelemtime(6) < 0
trigger9 = stateno = 500 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger10 = stateno = 505 && animelemtime(4) > 0 && animelemtime(5) < 0
trigger11 = stateno = 980 && animelemtime(5) > 0 && animelemtime(6) < 0
trigger12 = stateno = 981 && animelemtime(5) > 0 && animelemtime(6) < 0
;Command moves cancelable into Specials, DMs and SDMs
trigger13 = stateno = 801 && animelemtime(6) > 0 && animelemtime(8) < 0 && movecontact = 1
;MAX Cancels
trigger14 = stateno = 200 && var(51)>0
trigger15 = stateno = 300 && var(51)>0
trigger16 = stateno = 310 && var(51)>0
;
trigger17 = stateno = 205 && var(51)>0
trigger18 = stateno = 210 && var(51)>0
trigger19 = stateno = 215 && var(51)>0
trigger20 = stateno = 305 && var(51)>0
trigger21 = stateno = 315 && var(51)>0
trigger22 = stateno = 400 && var(51)>0
trigger23 = stateno = 405 && var(51)>0
trigger24 = stateno = 500 && var(51)>0
trigger25 = stateno = 505 && var(51)>0
trigger26 = stateno = 980 && var(51)>0
trigger27 = stateno = 981 && var(51)>0
trigger28 = stateno = 800 && var(51)>0 && movecontact = 1
;Special MAX Cancels
trigger29 = stateno = 1310 && var(51)>0 && animelemtime(3) > 0 && animelemtime(6) < 0 && movecontact = 1

[State -1, Crow Bite Hard]
type = ChangeState
value = 1205
triggerall = !var(59)
triggerall = command="dp_y" || (command="up" && command="y")
triggerall = var(51) && movecontact
trigger1 = stateno = 1035
trigger2 = stateno = 1310
;---------------------------------------------------------------------------
;Crow Bite Weak
[State -1, Crow Bite Weak]
type = ChangeState
value = 1200
triggerall = !var(59)
triggerall = ifelse((Anim!=[5,6]),command="dp_x",command="rdp_x")
triggerall = statetype != A
trigger1 = ctrl || stateno = 101
;Basic moves cancelable into Specials, DMs and SDMs
trigger2 = stateno = 205 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger3 = stateno = 210 && animelemtime(5) > 0 && animelemtime(7) < 0
trigger4 = stateno = 215 && animelemtime(3) > 0 && animelemtime(6) < 0
trigger5 = stateno = 305 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger6 = stateno = 315 && animelemtime(4) > 0 && animelemtime(5) < 0
trigger7 = stateno = 400 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger8 = stateno = 405 && animelemtime(3) > 0 && animelemtime(6) < 0
trigger9 = stateno = 500 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger10 = stateno = 505 && animelemtime(4) > 0 && animelemtime(5) < 0
trigger11 = stateno = 980 && animelemtime(5) > 0 && animelemtime(6) < 0
trigger12 = stateno = 981 && animelemtime(5) > 0 && animelemtime(6) < 0
;Command moves cancelable into Specials, DMs and SDMs
trigger13 = stateno = 801 && animelemtime(6) > 0 && animelemtime(8) < 0 && movecontact = 1
;Basic MAX Cancels
trigger14 = stateno = 200 && var(51)>0
trigger15 = stateno = 300 && var(51)>0
trigger16 = stateno = 310 && var(51)>0
;
trigger17 = stateno = 205 && var(51)>0
trigger18 = stateno = 210 && var(51)>0
trigger19 = stateno = 215 && var(51)>0
trigger20 = stateno = 305 && var(51)>0
trigger21 = stateno = 315 && var(51)>0
trigger22 = stateno = 400 && var(51)>0
trigger23 = stateno = 405 && var(51)>0
trigger24 = stateno = 500 && var(51)>0
trigger25 = stateno = 505 && var(51)>0
trigger26 = stateno = 980 && var(51)>0
trigger27 = stateno = 981 && var(51)>0
trigger28 = stateno = 800 && var(51)>0 && movecontact = 1
;Special MAX Cancels
trigger29 = stateno = 1310 && var(51)>0 && animelemtime(3) > 0 && animelemtime(6) < 0 && movecontact = 1
trigger30 = stateno = 1035 && var(51) && movecontact
trigger31 = stateno = 1310 && var(51) && movecontact

;---------------------------------------------------------------------------
;Blackout Hard
[State -1, Blackout Hard]
type = ChangeState
value = 1105
triggerall = !var(59)
triggerall = ifelse((Anim!=[5,6]),command="qcf_b",command="qcb_b")
triggerall = statetype != A
trigger1 = ctrl || stateno = 101
;Basic moves cancelable into Specials, DMs and SDMs
trigger2 = stateno = 205 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger3 = stateno = 210 && animelemtime(5) > 0 && animelemtime(7) < 0
trigger4 = stateno = 215 && animelemtime(3) > 0 && animelemtime(6) < 0
trigger5 = stateno = 305 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger6 = stateno = 315 && animelemtime(4) > 0 && animelemtime(5) < 0
trigger7 = stateno = 400 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger8 = stateno = 405 && animelemtime(3) > 0 && animelemtime(6) < 0
trigger9 = stateno = 500 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger10 = stateno = 505 && animelemtime(4) > 0 && animelemtime(5) < 0
trigger11 = stateno = 980 && animelemtime(5) > 0 && animelemtime(6) < 0
trigger12 = stateno = 981 && animelemtime(5) > 0 && animelemtime(6) < 0
;Command moves cancelable into Specials, DMs and SDMs
trigger13 = stateno = 801 && animelemtime(6) > 0 && animelemtime(8) < 0 && movecontact = 1
trigger14 = stateno = 1035 && var(51) && movecontact
trigger15 = stateno = 1310 && var(51) && movecontact
trigger16 = stateno = 1205 && var(51) && movecontact
;---------------------------------------------------------------------------
;Blackout Weak
[State -1, Blackout Weak]
type = ChangeState
value = 1100
triggerall = !var(59)
triggerall = ifelse((Anim!=[5,6]),command="qcf_a",command="qcb_a")
triggerall = statetype != A
trigger1 = ctrl || stateno = 101
;Basic moves cancelable into Specials, DMs and SDMs
trigger2 = stateno = 205 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger3 = stateno = 210 && animelemtime(5) > 0 && animelemtime(7) < 0
trigger4 = stateno = 215 && animelemtime(3) > 0 && animelemtime(6) < 0
trigger5 = stateno = 305 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger6 = stateno = 315 && animelemtime(4) > 0 && animelemtime(5) < 0
trigger7 = stateno = 400 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger8 = stateno = 405 && animelemtime(3) > 0 && animelemtime(6) < 0
trigger9 = stateno = 500 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger10 = stateno = 505 && animelemtime(4) > 0 && animelemtime(5) < 0
trigger11 = stateno = 980 && animelemtime(5) > 0 && animelemtime(6) < 0
trigger12 = stateno = 981 && animelemtime(5) > 0 && animelemtime(6) < 0
;Command moves cancelable into Specials, DMs and SDMs
trigger13 = stateno = 801 && animelemtime(6) > 0 && animelemtime(8) < 0 && movecontact = 1
trigger14 = stateno = 1035 && var(51) && movecontact
trigger15 = stateno = 1310 && var(51) && movecontact
trigger16 = stateno = 1205 && var(51) && movecontact
;---------------------------------------------------------------------------
;Eins Trigger Hard
[State -1, Eins Trigger Hard]
type = ChangeState
value = 1015
triggerall = !var(59)
triggerall = ifelse((Anim!=[5,6]),command="qcf_y",command="qcb_y")
triggerall = statetype != A
trigger1 = ctrl || stateno = 101
;Basic moves cancelable into Specials, DMs and SDMs
trigger2 = stateno = 205 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger3 = stateno = 210 && animelemtime(5) > 0 && animelemtime(7) < 0
trigger4 = stateno = 215 && animelemtime(3) > 0 && animelemtime(6) < 0
trigger5 = stateno = 305 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger6 = stateno = 315 && animelemtime(4) > 0 && animelemtime(5) < 0
trigger7 = stateno = 400 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger8 = stateno = 405 && animelemtime(3) > 0 && animelemtime(6) < 0
trigger9 = stateno = 500 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger10 = stateno = 505 && animelemtime(4) > 0 && animelemtime(5) < 0
trigger11 = stateno = 980 && animelemtime(5) > 0 && animelemtime(6) < 0
trigger12 = stateno = 981 && animelemtime(5) > 0 && animelemtime(6) < 0
;Command moves cancelable into Specials, DMs and SDMs
trigger13 = stateno = 801 && animelemtime(6) > 0 && animelemtime(8) < 0 && movecontact = 1
trigger14 = stateno = 1310 && var(51) && movecontact
trigger15 = stateno = 1205 && var(51) && movecontact
;---------------------------------------------------------------------------
;Eins Trigger Weak
[State -1, Eins Trigger Weak]
type = ChangeState
value = 1000
triggerall = !var(59)
triggerall = ifelse((Anim!=[5,6]),command="qcf_x",command="qcb_x")
triggerall = statetype != A
trigger1 = ctrl || stateno = 101
;Basic moves cancelable into Specials, DMs and SDMs
trigger2 = stateno = 205 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger3 = stateno = 210 && animelemtime(5) > 0 && animelemtime(7) < 0
trigger4 = stateno = 215 && animelemtime(3) > 0 && animelemtime(6) < 0
trigger5 = stateno = 305 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger6 = stateno = 315 && animelemtime(4) > 0 && animelemtime(5) < 0
trigger7 = stateno = 400 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger8 = stateno = 405 && animelemtime(3) > 0 && animelemtime(6) < 0
trigger9 = stateno = 500 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger10 = stateno = 505 && animelemtime(4) > 0 && animelemtime(5) < 0
trigger11 = stateno = 980 && animelemtime(5) > 0 && animelemtime(6) < 0
trigger12 = stateno = 981 && animelemtime(5) > 0 && animelemtime(6) < 0
;Command moves cancelable into Specials, DMs and SDMs
trigger13 = stateno = 801 && animelemtime(6) > 0 && animelemtime(8) < 0 && movecontact = 1
trigger14 = stateno = 1310 && var(51) && movecontact
trigger15 = stateno = 1205 && var(51) && movecontact

;---------------------------------------------------------------------------

[State -1, ‚Ó‚Á‚Æ‚Î‚µ]
type = ChangeState
value = 1800
triggerall = !var(59)
TriggerAll = Command = "a" && Command = "y" 
TriggerAll = RoundState = 2
TriggerAll = !NumHelper(1900) 
TriggerAll = StateType != A
Trigger1 = Ctrl

;Kung Fu Throw
;“Š‚°
[State -1, Kung Fu Throw]
type = ChangeState
value = 956
triggerall = !var(59)
triggerall = command = "b"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
triggerall = command = "holdfwd" || command = "holdback"
triggerall = var(19) = 0 ; Opponent isn't in guarding state
triggerall = p2stateno != 40 && p2stateno !=52 ; Cannot grab during jump start / jump land
trigger1 = p2bodydist X < 8
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
;---------------------------------------------------------------------------
;Kung Fu Throw
;“Š‚°
[State -1, Kung Fu Throw]
type = ChangeState
value = 900
triggerall = !var(59)
triggerall = command = "y"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
triggerall = command = "holdfwd" || command = "holdback"
triggerall = var(19) = 0 ; Opponent isn't in guarding state
triggerall = p2stateno != 40 && p2stateno !=52 ; Cannot grab during jump start / jump land
trigger1 = p2bodydist X < 8
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
;--------------------------------------------------------------------------
[State -1, MAX]
type = ChangeState
value = 780
triggerall = !var(59)
triggerall = !numhelper(70001) && !numhelper(70002)
triggerall = power >= 3000
triggerall = command = "z"
trigger1 = statetype != A
trigger1 = ctrl || stateno = 101

;MAX
[State -1, MAX]
type = ChangeState
value = 790
triggerall = !var(59)
triggerall = !numhelper(70001) && !numhelper(70002)
triggerall = power >= 1000
triggerall = command = "c"
trigger1 = statetype != A
trigger1 = ctrl || stateno = 101
trigger2 = stateno = 200 && movecontact && power >= 2000
trigger3 = stateno = 205 && movecontact && power >= 2000
trigger4 = stateno = 210 && movecontact && power >= 2000
trigger5 = stateno = 215 && movecontact && power >= 2000
trigger6 = stateno = 300 && movecontact && power >= 2000
trigger7 = stateno = 310 && movecontact && power >= 2000
trigger8 = stateno = 315 && movecontact && power >= 2000
trigger9 = stateno = 400 && movecontact && power >= 2000
trigger10 = stateno = 405 && movecontact && power >= 2000
trigger11 = stateno = 500 && movecontact && power >= 2000
trigger12 = stateno = 505 && movecontact && power >= 2000
trigger13 = stateno = 980 && movecontact && power >= 2000
trigger14 = stateno = 800 && movecontact && power >= 2000
trigger15 = stateno = 801 && movecontact && power >= 2000
;---------------------------------------------------------------------------
;Roll 1
[State -1, Roll 1]
type = ChangeState
value = 750
triggerall = !var(59)
triggerall = (command = "roll" || command = "roll" && command = "holdfwd")
triggerall = command != "holddown" && command != "holdback"
triggerall = Statetype != A
trigger1 = Statetype = S
trigger1 = ctrl
trigger2 = stateno = 150 && power >= 1000
trigger3 = stateno = 151 && power >= 1000
trigger4 = stateno = 101
;---------------------------------------------------------------------------
;Roll 2
[State -1, Roll 1]
type = ChangeState
value = 760
triggerall = !var(59)
triggerall = command = "roll"
triggerall = command != "holddown" && command = "holdback"
triggerall = Statetype != A
trigger1 = Statetype = S
trigger1 = ctrl
trigger2 = stateno = 150 && power >= 1000
trigger3 = stateno = 151 && power >= 1000
trigger4 = stateno = 101
;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = !var(59)
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = !var(59)
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
;Taunt
;’§”­
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = !var(59)
triggerall = command = "start"
triggerall = stateno != 195
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = roundstate = 2
trigger2 = stateno = 101
;---------------------------------------------------------------------------
;Knockdown (Ground)
[State -1, Knockdown (Ground)]
type = ChangeState
value = 980
triggerall = !var(59)
triggerall = command = "knock"
triggerall = command != "holddown"
triggerall = Statetype != A
trigger1 = Statetype = S
trigger1 = ctrl
trigger2 = stateno = 101
;---------------------------------------------------------------------------
;Knockdown Counter
[State -1, Knockdown Counter]
type = ChangeState
value = 981
triggerall = !var(59)
triggerall = command = "knock"
triggerall = command != "holddown"
triggerall = Statetype != A
trigger1 = stateno = 150 && power >= 1000
trigger2 = stateno = 151 && power >= 1000
;---------------------------------------------------------------------------
;Knockdown (Air)
[State -1, Knockdown (Air)]
type = ChangeState
value = 990
triggerall = !var(59)
triggerall = command = "knock"
triggerall = Statetype != C
trigger1 = Statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Knee Assault
[State -1, Knee Assault]
type = ChangeState
value = 810
triggerall = !var(59)
triggerall = command = "holdfwd" && command = "a" && command != "holddown"
triggerall = Statetype != A
trigger1 = ctrl
trigger2 = stateno = 205 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger3 = stateno = 210 && animelemtime(5) > 0 && animelemtime(7) < 0
trigger4 = stateno = 215 && animelemtime(3) > 0 && animelemtime(6) < 0
trigger5 = stateno = 305 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger6 = stateno = 315 && animelemtime(4) > 0 && animelemtime(5) < 0
trigger7 = stateno = 400 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger8 = stateno = 405 && animelemtime(3) > 0 && animelemtime(6) < 0
trigger9 = stateno = 500 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger10 = stateno = 505 && animelemtime(4) > 0 && animelemtime(5) < 0
;---------------------------------------------------------------------------
;One Inch C.I
[State -1, One Inch C.I]
type = ChangeState
value = 801
triggerall = !var(59)
triggerall = command = "holdfwd" && command = "x" && command != "holddown"
triggerall = Statetype != A
trigger1 = stateno = 205 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger2 = stateno = 210 && animelemtime(5) > 0 && animelemtime(7) < 0
trigger3 = stateno = 215 && animelemtime(3) > 0 && animelemtime(6) < 0
trigger4 = stateno = 305 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger5 = stateno = 315 && animelemtime(4) > 0 && animelemtime(5) < 0
trigger6 = stateno = 400 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger7 = stateno = 405 && animelemtime(3) > 0 && animelemtime(6) < 0
trigger8 = stateno = 500 && animelemtime(3) > 0 && animelemtime(4) < 0
trigger9 = stateno = 505 && animelemtime(4) > 0 && animelemtime(5) < 0
;---------------------------------------------------------------------------
;One Inch
[State -1, One Inch]
type = ChangeState
value = 800
triggerall = !var(59)
triggerall = command = "holdfwd" && command = "x" && command != "holddown"
triggerall = Statetype != A
trigger1 = ctrl
trigger2 = stateno = 101
;---------------------------------------------------------------------------
;Jumping Light Punch
[State -1, Jumping Light Punch]
type = ChangeState
value = 600
triggerall = !var(59)
triggerall = command = "x"
triggerall = Statetype != C
trigger1 = Statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Jumping Light Kick
[State -1, Jumping Light Kick]
type = ChangeState
value = 700
triggerall = !var(59)
triggerall = command = "a"
triggerall = Statetype != C
trigger1 = Statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Jumping Hard Kick
[State -1, Jumping Light Kick]
type = ChangeState
value = 710
triggerall = !var(59)
triggerall = command = "b"
triggerall = Statetype != C
trigger1 = Statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Jumping Hard Punch
[State -1, Jumping Hard Punch]
type = ChangeState
value = 610
triggerall = !var(59)
triggerall = command = "y"
triggerall = Statetype != C
trigger1 = Statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = !var(59)
triggerall = command = "holddown" && command = "x" && command != "holdup"
triggerall = Statetype != A
trigger1 = ctrl
trigger2 = stateno = 101
trigger3 = stateno = 400 && animelemtime(3) > 2
trigger4 = stateno = 500 && animelemtime(3) > 2
;---------------------------------------------------------------------------
;Crouching Hard Punch
[State -1, Crouching Hard Punch]
type = ChangeState
value = 405
triggerall = !var(59)
triggerall = command = "holddown" && command = "y" && command != "holdup"
triggerall = Statetype != A
trigger1 = ctrl
trigger2 = stateno = 101
;---------------------------------------------------------------------------
;Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 500
triggerall = !var(59)
triggerall = command = "holddown" && command = "a" && command != "holdup"
triggerall = Statetype != A
trigger1 = ctrl
trigger2 = stateno = 101
trigger3 = stateno = 400 && animelemtime(3) > 2
trigger4 = stateno = 500 && animelemtime(3) > 2
;---------------------------------------------------------------------------
;Crouching Hard Kick
[State -1, Crouching Hard Kick]
type = ChangeState
value = 505
triggerall = !var(59)
triggerall = command = "holddown" && command = "b" && command != "holdup"
triggerall = Statetype != A
trigger1 = ctrl
trigger2 = stateno = 101
;---------------------------------------------------------------------------
;Light Punch (Far)
[State -1, Light Punch (Far)]
type = ChangeState
value = 200
triggerall = !var(59)
triggerall = command = "x" 
triggerall = p2bodydist x > 27
triggerall = Statetype != A
trigger1 = ctrl
trigger2 = stateno = 101
trigger3 = stateno = 200 && animelemtime(3) > 2
trigger4 = stateno = 205 && animelemtime(3) > 2
trigger5 = stateno = 305 && animelemtime(3) > 2
trigger6 = stateno = 400 && animelemtime(3) > 2
trigger7 = stateno = 500 && animelemtime(3) > 2
;---------------------------------------------------------------------------
;Light Punch (Close)
[State -1, Light Punch (Close)]
type = ChangeState
value = 205
triggerall = !var(59)
triggerall = command = "x" 
triggerall = p2bodydist x <= 27
triggerall = Statetype != A
trigger1 = ctrl
trigger2 = stateno = 101
trigger3 = stateno = 200 && animelemtime(3) > 2
trigger4 = stateno = 205 && animelemtime(3) > 2
trigger5 = stateno = 305 && animelemtime(3) > 2
trigger6 = stateno = 400 && animelemtime(3) > 2
trigger7 = stateno = 500 && animelemtime(3) > 2
;---------------------------------------------------------------------------
;Light Kick
[State -1, Light Kick]
type = ChangeState
value = 300
triggerall = !var(59)
triggerall = command = "a"
triggerall = p2bodydist x > 26
triggerall = Statetype != A
trigger1 = ctrl
trigger2 = stateno = 101
trigger3 = stateno = 200 && animelemtime(3) > 2
trigger4 = stateno = 205 && animelemtime(3) > 2
trigger5 = stateno = 305 && animelemtime(3) > 2
trigger6 = stateno = 400 && animelemtime(3) > 2
trigger7 = stateno = 500 && animelemtime(3) > 2
;---------------------------------------------------------------------------
;Light Kick (Close)
[State -1, Light Kick (Close)]
type = ChangeState
value = 305
triggerall = !var(59)
triggerall = command = "a" 
triggerall = p2bodydist x <= 26
triggerall = Statetype != A
trigger1 = ctrl
trigger2 = stateno = 101
trigger3 = stateno = 200 && animelemtime(3) > 2
trigger4 = stateno = 205 && animelemtime(3) > 2
trigger5 = stateno = 305 && animelemtime(3) > 2
trigger6 = stateno = 400 && animelemtime(3) > 2
trigger7 = stateno = 500 && animelemtime(3) > 2
;---------------------------------------------------------------------------
;Hard Punch
[State -1, Hard Punch]
type = ChangeState
value = 210
triggerall = !var(59)
triggerall = command = "y" && command != "holddown"
triggerall = P2bodydist X > 30;P2dist X >= 49
triggerall = Statetype != A
trigger1 = ctrl
trigger2 = stateno = 101
;---------------------------------------------------------------------------
;Hard Punch (Close)
[State -1, Hard Punch (Close)]
type = ChangeState
value = 215
triggerall = !var(59)
triggerall = command = "y" && command != "holddown"
triggerall = P2bodydist X <= 30;P2dist X < 49
triggerall = Statetype != A
trigger1 = ctrl
trigger2 = stateno = 101
;---------------------------------------------------------------------------
;Hard Kick
[State -1, Hard Kick]
type = ChangeState
value = 310
triggerall = !var(59)
triggerall = command = "b" && command != "holddown"
triggerall = p2bodydist x > 27
triggerall = Statetype != A
trigger1 = ctrl
trigger2 = stateno = 101
;---------------------------------------------------------------------------
;Hard Kick (Close)
[State -1, Hard Kick (Close)]
type = ChangeState
value = 315
triggerall = !var(59)
triggerall = command = "b" && command != "holddown"
triggerall = Statetype != A
triggerall = p2bodydist x <= 27
trigger1 = ctrl
trigger2 = stateno = 101