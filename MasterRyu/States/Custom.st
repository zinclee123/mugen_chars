; ______________________________
;| Ryu by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;======================================< CUSTOM STATES >=========================================
;==============================================================================================

;========================< SHOCKED >=============================
[Statedef 7696]
type = U
physics = N
movetype = H
ctrl = 0
velset = 0, 0

[State 7696, sts]
type = statetypeset
trigger1 = !time
trigger1 = pos y < 0
statetype = A

[State 7696, sts]
type = statetypeset
trigger1 = !time
trigger1 = pos y >= 0
statetype = S

[State 7696, Pos]
type = posset
trigger1 = pos y >= 0
y = 0

[State 7696, Anim]
type = changeanim
trigger1 = !time
trigger1 = anim != 7696 && selfanimexist(7696)
value = 7696

[State 7696, Anim]
type = changeanim
trigger1 = !time
trigger1 = anim != 9010 && !selfanimexist(7696) && selfanimexist(9010)
value = 9010

[State 7696, Anim]
type = changeanim
trigger1 = !time
trigger1 = !selfanimexist(7696) && !selfanimexist(9010)
value = ifelse(statetype != A, 5002, 5030)

[State 7696, Var]
type = varset
trigger1 = !time
trigger1 = gethitvar(hitcount) <= 2
sysfvar(4) = 0

ignorehitpause = 1
[State 7696, Var]
type = varadd
trigger1 = !time
sysfvar(4) = 45
ignorehitpause = 1

[State 7696, nopalfx]
type = palfx
trigger1 = !time
trigger1 = (anim = 7696 || anim = 9010)
add = 0, 0, 0
time = 1

[State 7696, End]
type = changestate
trigger1 = alive && (anim = 7696 || anim = 9010) && hitshakeover
trigger2 = alive && (anim != 7696 && anim != 9010) && hitshakeover
value = ifelse(statetype = A, 1115020, 5310)

[State 7696, End]
type = selfstate
trigger1 = !alive && (anim != 7696 || anim != 9010) && hitshakeover
value = 5030


;========================< HIT by METSU HADOUKEN >=============================
[Statedef 1113045]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0

[State 1113045, Anim]
type = changeanim
trigger1 = 1
value = 5012
[State 1113045, Pos]
type = posset
trigger1 = pos y >= 0
y = 0

[State 1113045, Var]
type = varset
trigger1 = !time
trigger1 = gethitvar(hitcount) <= 2
sysfvar(4) = 0
ignorehitpause = 1
[State 1113045, Var]
type = varadd
trigger1 = !time
sysfvar(4) = 60
ignorehitpause = 1

[State 1113045, End]
type = changestate
trigger1 = alive && hitshakeover
value = 1115020
[State 1113045, End]
type = selfstate
trigger1 = !alive && hitshakeover
value = 5030


;========================< DIZZY >=============================
[Statedef 5310]
type = S
movetype = I
physics = S
velset = 0, 0
anim = 5300

[State 5310, Timer]
type = varadd
trigger1 = time
sysfvar(4) = -1

[State 5310, Timer]
type = varadd
trigger1 = sysfvar(4) > 0
trigger1 = command = "up" || command = "down" || command = "back" || command = "fwd"
sysfvar(4) = -2

[State 5310, Timer]
type = varadd
trigger1 = sysfvar(4) > 0
trigger1 = command = "x" || command = "y" || command = "z" || command = "a" || command = "b" || command = "c"
sysfvar(4) = -1

[State 5310, Skip]
type = varset
trigger1 = !time
sysfvar(3) = 0

[State 5310, Skip]
type = varadd
trigger1 = command = "up" || command = "down" || command = "back" || command = "fwd"
trigger2 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
sysfvar(3) = 1

[State 5310, Skip]
type = changeanim
trigger1 = animelemtime(animelemno(0)) > 0 && animelemtime(animelemno(0) + 1) < 0
trigger1 = animelemtime(animelemno(0) + 1) >= -sysfvar(3)
value = 5300
elem = animelemno(0) + 1

[State 5310, Skip]
type = varset
trigger1 = animelemtime(1) >= 0 && !animelemtime(animelemno(0))
sysfvar(3) = 0

[State 5310, End]
type = varset
trigger1 = sysfvar(4) < 0
sysfvar(4) = 0

[State 5310, End]
type = selfstate
trigger1 = time >= 300 || roundstate != 2
;trigger2 = sysfvar(4) <= 0
value = 0
ctrl = 1


;========================< KICKED by EX JOUDAN S.G. >=============================
;--- Hit Pause ---
[Statedef 1111300]
type = A
movetype = H
physics = N
velset = 0, 0

[State 1111300, Anim]
type = changeanim
trigger1 = 1
value = 5002

[State 1111300, End]
type = changestate
trigger1 = hitshakeover
value = 1111301


;--- Fly to wall ---
[Statedef 1111301]
type = A
movetype = H
physics = N

[State 1111301, Vel]
type = hitvelset
trigger1 = !time
x = 1
y = 1

[State 1111301, Gravity]
type = veladd
trigger1 = 1
y = GetHitvar(yaccel)

[State 1111301, screen]
type = screenbound
trigger1 = time > 12
value = 1
movecamera = 0, 1

[State 1111301, Push]
type = playerpush
trigger1 = 1
value = 0

[State 1111301, Anim]
type = changeanim
trigger1 = !time
value = 5030

[State 1111301, bounce]
type = changestate
trigger1 = backedgebodydist <= 10 || frontedgebodydist <= 10
value = 1111302

[State 1111301, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= 0
value = 5100


;--- Hitting Wall ---
[Statedef 1111302]
type = A
movetype = H
physics = N

[State 1111302, turn]
type = turn
trigger1 = !time
trigger1 = frontedgedist < backedgedist

[State 1111302, Pos]
type = posfreeze
trigger1 = 1
x = 1
y = 1

[State 1111302, screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 1

[State 1111302, Push]
type = playerpush
trigger1 = 1
value = 1

[State 1111302, Anim]
type = changeanim
trigger1 = 1
value = 5000

[State 1111302, snd]
type = playsnd
trigger1 = !time
volumescale = 100
abspan = -500
value = f7, 2

[State 1111302, FX-Stage-Type]
type = explod
trigger1 = !time
anim = f72
space = stage
sprpriority = 3
bindID = ID
bindtime = 1
removetime = -2
facing = facing
pos = ifelse(facing = 1, -Const(size.air.back), Const(size.air.back)) * Const(Size.xscale), Const(Size.mid.pos.y) * Const(Size.yscale)
supermovetime = 255
pausemovetime = 255
scale = Const(Size.xscale), Const(Size.yscale)
ownpal = 1

[State 1111302, Shake]
type = envshake
trigger1 = !time
time = 18
freq = 40
ampl = 6
persistent = 0

[State 1111302, End]
type = changestate
trigger1 = time >= 10
value = 1111303


;--- Falling ---
[Statedef 1111303]
type = A
movetype = H
physics = N

[State 1111303, turn]
type = turn
trigger1 = !time

[State 1111303, Gravity]
type = veladd
trigger1 = 1
y = GetHitvar(yaccel)

[State 1111303, Vel]
type = velset
trigger1 = !time
x = -2.5
y = -9

[State 1111303, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5051), 5051, 5030)

[State 1111303, Anim]
type = changeanim
trigger1 = anim = 5030 && !animtime

value = 5050
[State 1111303, Anim]
type = changeanim
trigger1 = vel y > -3 && anim = 5051
value = 5061

[State 1111303, screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[State 1111303, Push]
type = playerpush
trigger1 = 1
value = 0

[State 1111303, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 1111303, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= 0
value = 5100

; Hit by Pushdown  ------------ 
[Statedef 1115080]
type    = L
movetype= H
physics = N
velset = 0,0
sprpriority = 0

[State 1115080, pos fix]
type = posset
trigger1 = !time && PrevStateNo != 1115080
y = 0

[State 1115080, Locate the Attacker]
type = varset
trigger1 = !time && GetHitVar(Fall.Envshake.Ampl)
sysvar(2) = GetHitVar(Fall.Envshake.Ampl)

[State 1115080, 3] ;freez
type = ChangeAnim
trigger1 = 1
value = 5030 + 50*SelfAnimExist(5080)

[State 1115080, 8]
type = Explod
trigger1 = !Time
anim = F(60 + (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56)))
postype = none
pos = pos x + camerapos x, 0
facing = facing
sprpriority = ifelse (sysvar(1) <= Const720p(56), -10, 10)

[State 1115080, 9]
type = HitFallDamage
trigger1 = !time

[State 5100, 10]
type = PlaySnd
trigger1 = !time
value = F7, (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56))

[State 1115080, 5]
type = ChangeState
triggerall = anim = 5080
triggerall = HitOver && HitShakeOver
trigger1 = PlayerIDExist(sysvar(2)) = 0
trigger2 = PlayerIDExist(sysvar(2))
trigger2 = PlayerID(sysvar(2)),MoveType != A
value = 1115081

; Hit by Pushdown (Exit) ------------ 
[Statedef 1115081]
type    = L
movetype= H
physics = N
velset = 0,0
sprpriority = 0

[State 1115081, 3]
type = ChangeAnim
trigger1 = !time
value = 5030 + 50*SelfAnimExist(5080)
elem = 2

[State 1115081]
type = SelfState
trigger1 = !animtime
trigger2 = time > 30
value = IFElse(Alive,5120,5150)



;========================< HIT BACK, then dizzy >=============================
[Statedef 1115020]
type = A
movetype = H
physics = N
velset = 0, 0
[State 1115020, Anim]
type = changeanim
trigger1 = 1
value = 5030
[State 1115020, End]
type = changestate
trigger1 = hitshakeover
value = 1115030

[Statedef 1115030]
type = A
movetype = H
physics = N
ctrl = 0
[State 1115030, Accel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)
[State 1115030, Vel]
type = hitvelset
trigger1 = !time
x = 1
y = 1
[State 1115030, End]
type = changestate
trigger1 = hitover
trigger2 = vel y > 0 && pos y >= 10
value = 1115050
[State 1115030, End]
type = changestate
trigger1 = !animtime
value = 1115035

[Statedef 1115035]
type = A
movetype = H
physics = N
[State 1115035, Anim]
type = changeanim
trigger1 = !time && selfanimexist(5035)
value = 5035
[State 1115035, Accel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)
[State 1115035, End]
type = changestate
trigger1 = hitover
trigger2 = !animtime
trigger3 = vel y > 0 && pos y >= 10
trigger4 = !time && anim != 5035
value = 1115050

[Statedef 1115050]
type = A
movetype = H
physics = N

[State 1115050, Anim]
type = changeanim
trigger1 = anim = 5035 && !animtime
trigger2 = anim != 5035 && !time
value = 5050

[State 1115050, Anim]
type = changeanim
trigger1 = anim = [5050, 5059]
trigger1 = vel y >= ifelse(anim = 5050, 1, -2)
trigger1 = selfanimexist(anim + 10)
value = anim + 10
persistent = 0

[State 1115050, Accel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)

[State 1115050, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y >= ifelse((anim = [5051, 5059]) || (anim = [5061, 5069]), 0, 25)
value = 1115100

[Statedef 1115100]
type = L
movetype = H
physics = N
[State 1115100, 1]
type = velset
trigger1 = !time && gethitvar(fall.yvel) = 0 && vel x > 1
x = 1
[State 1115100, Shake]
type = fallenvshake
trigger1 = !time
[State 1115100, Var]
type = varset
trigger1 = !time
sysvar(1) = floor(vel y)
[State 1115100, Anim]
type = ChangeAnim
trigger1 = !time
value = 5100
[State 1115100, Pos]
type = posset
trigger1 = !time
y = 0
[State 1115100, Vel]
type = velset
trigger1 = !time
y = 0
[State 1115100, Vel]
type = velmul
trigger1 = !time
x = 0.75
[State 1115100, End]
type = changestate
trigger1 = !time
trigger1 = gethitvar(fall.yvel) = 0
value = 1115110
[State 1115100, FX]
type = gamemakeanim
trigger1 = time = 1
value = 60 + (sysvar(1) > 5) + (sysvar(1) > 14)
pos = 0, 0
under = sysvar(1) <= 14
[State 1115100, hurt]
type = hitfalldamage
trigger1 = time = 3
[State 1115100, snd]
type = playsnd
trigger1 = Time = 1
value = F7, (sysvar(1) > 5) + (sysvar(1) > 14)
[State 1115100, freeze]
type = posfreeze
trigger1 = 1
[State 1115100, End]
type = changestate
trigger1 = !animtime
value = 1115101

[Statedef 1115101]
type = L
movetype = H
physics = N
[State 1115101, Anim]
type = changeanim
trigger1 = !time
value = 5160
[State 1115101, Vel]
type = hitfallvel
trigger1 = !time
[State 1115101, Pos]
type = posset
trigger1 = !time
y = 20
[State 1115101, accel]
type = veladd
trigger1 = 1
y = 0.4
[State 1115101, End]
type = changestate
trigger1 = vel y > 0 && pos y >= 12
value = 1115110

[Statedef 1115110]
type = L
movetype = H
physics = N
[State 1115110, Shake]
type = fallenvshake
trigger1 = !time

[State 1115110, 2]
type = changeanim
trigger1 = !time
value = 5170
[State 1115110, hurt]
type = hitfalldamage
trigger1 = !time
[State 1115110, Pos]
type = posset
trigger1 = !time
y = 0
[State 1115110, Var]
type = varset
trigger1 = !time
trigger1 = gethitvar(fall.yvel) != 0
sysvar(1) = floor(vel y)
[State 1115110, snd]
type = playsnd
trigger1 = !time && !sysvar(0)
value = F7, (sysvar(1) > 5) + (sysvar(1) > 14)
[State 1115110, FX]
type = gamemakeanim
trigger1 = !time && !sysvar(0)
value = 60 + (sysvar(1) > 5) + (sysvar(1) > 14)
pos = 0, 0
under = sysvar(1) <= 14
[State 1115110, Vel]
type = velset
trigger1 = !time
y = 0
[State 1115110, Anim]
type = changeanim
persistent = 0
triggerall = anim != [5111, 5119]
trigger1 = !animtime
trigger2 = sysvar(0)
value = 5110

[State 1115110, ko]
type = selfstate
triggerall = !alive
trigger1 = !animtime
trigger2 = sysvar(0)
trigger3 = anim = [5110, 5119]
value = 5150
[State 1115110, Var]
type = varset
trigger1 = sysvar(0)
trigger1 = !time
sysvar(0) = 0
[State 1115110, Vel]
type = velmul
trigger1 = 1
x = 0.85
[State 1115110, getup]
type = changestate
trigger1 = alive && time >= 9;const(data.liedown.time)
value = 1115120
persistent = 0

[Statedef 1115120]
type = L
movetype = H
physics = N
[State 1115120, Anim]
type = changeanim
trigger1 = !time
value = 5120
[State 1115120, Vel]
type = velset
trigger1 = !time
x = 0
[State 1115120, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 1115120, hitfall]
type = hitfallset
trigger1 = !animtime
value = 1

[State 1115120, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 1115120, dizzy]
type = changestate
trigger1 = !animtime
value = 5310



;======================< MESSATSU GOSHORYU Target >=============================
[Statedef 1113150]
type = A
movetype = H
physics = N
ctrl = 0

[State 1113150, NO ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0
ignorehitpause = 1

[State 1113150, 1st velfix]
type = velset
trigger1 = !time
trigger1 = PlayerIDExist(GetHitVar(Fall.Envshake.Ampl))
trigger1 = PlayerID(GetHitVar(Fall.Envshake.Ampl)),Anim = 3152
x = 0
y = 0

[State 1113150, hit velfix]
type = hitvelset
trigger1 = !time
trigger1 = PlayerIDExist(GetHitVar(Fall.Envshake.Ampl))
trigger1 = PlayerID(GetHitVar(Fall.Envshake.Ampl)),Anim = 3155
x = 1
y = 1


[State 1113150, 1st anime]
type = ChangeAnim2
triggerall = !time
trigger1 = PlayerIDExist(GetHitVar(Fall.Envshake.Ampl))
trigger1 = PlayerID(GetHitVar(Fall.Envshake.Ampl)),Anim = 3152
value = 1113150

[State 1113150, 2nd anime]
type = ChangeAnim2
triggerall = !time
trigger1 = PlayerIDExist(GetHitVar(Fall.Envshake.Ampl))
trigger1 = PlayerID(GetHitVar(Fall.Envshake.Ampl)),Anim = 3155
value = 1113151

[State 1113150, MaxCharge Phase 1 velset]
type = velset
triggerall = PlayerIDExist(GetHitVar(Fall.Envshake.Ampl))
trigger1 = PlayerID(GetHitVar(Fall.Envshake.Ampl)),var(10) = 11
trigger1 = PlayerID(GetHitVar(Fall.Envshake.Ampl)),anim = 3155
trigger1 = PlayerID(GetHitVar(Fall.Envshake.Ampl)),animelemtime(1) >= 22 && PlayerID(GetHitVar(Fall.Envshake.Ampl)),animelemtime(2) < 0
x = 0
y = 0

[State 1113150, MaxCharge Phase 1 pos]
type = posset
triggerall = PlayerIDExist(GetHitVar(Fall.Envshake.Ampl))
trigger1 = PlayerID(GetHitVar(Fall.Envshake.Ampl)),var(10) = 11
trigger1 = PlayerID(GetHitVar(Fall.Envshake.Ampl)),anim = 3155
trigger1 = PlayerID(GetHitVar(Fall.Envshake.Ampl)),animelemtime(1) >= 22 && PlayerID(GetHitVar(Fall.Envshake.Ampl)),animelemtime(2) < 0
x = 0
y = -10

;---------- scale up and go up ----------
[State 1113150, MaxCharge Go up set]
type = posadd
triggerall = PlayerIDExist(GetHitVar(Fall.Envshake.Ampl))
trigger1 = (PlayerID(GetHitVar(Fall.Envshake.Ampl)),time = 309)
y = -40

[State 1113150, zoom in]
type = AngleDraw
triggerall = PlayerIDExist(GetHitVar(Fall.Envshake.Ampl))
trigger1 = (PlayerID(GetHitVar(Fall.Envshake.Ampl)),time = [309,349])
scale = 1 + 0.0125*(PlayerID(GetHitVar(Fall.Envshake.Ampl)),time-309), 1 + 0.0125*(PlayerID(GetHitVar(Fall.Envshake.Ampl)),time-309)

[State 1113150, MaxCharge Go up]
type = posadd
triggerall = PlayerIDExist(GetHitVar(Fall.Envshake.Ampl))
trigger1 = (PlayerID(GetHitVar(Fall.Envshake.Ampl)),time = [309,349])
y = -2

[State 3150, Palfx]
type = Palfx
triggerall = PlayerIDExist(GetHitVar(Fall.Envshake.Ampl))
trigger1 = (PlayerID(GetHitVar(Fall.Envshake.Ampl)),time = [316,360])
time = 1
mul = 256-5*(PlayerID(GetHitVar(Fall.Envshake.Ampl)),time-316),256-5*(PlayerID(GetHitVar(Fall.Envshake.Ampl)),time-316),256-5*(PlayerID(GetHitVar(Fall.Envshake.Ampl)),time-316)

[State 1113150, zoom keep]
type = AngleDraw
triggerall = anim != 1113152
triggerall = PlayerIDExist(GetHitVar(Fall.Envshake.Ampl))
trigger1 = (PlayerID(GetHitVar(Fall.Envshake.Ampl)),time = [350,428])
scale = 1.5, 1.5

[State 1113150, Palfx keep]
type = Palfx
triggerall = PlayerIDExist(GetHitVar(Fall.Envshake.Ampl))
trigger1 = (PlayerID(GetHitVar(Fall.Envshake.Ampl)),time = [361,395])
time = 2
mul = 64,64,64


[State 1113150, Palfx going back]
type = Palfx
triggerall = PlayerIDExist(GetHitVar(Fall.Envshake.Ampl))
trigger1 = (PlayerID(GetHitVar(Fall.Envshake.Ampl)),Anim = 3155 && PlayerID(GetHitVar(Fall.Envshake.Ampl)),animelemtime(13) >= 0) || PlayerID(GetHitVar(Fall.Envshake.Ampl)),anim = 3156
trigger1 = (PlayerID(GetHitVar(Fall.Envshake.Ampl)),time = [396,426])
time = 1
mul = 90 + 5*(PlayerID(GetHitVar(Fall.Envshake.Ampl)),time - 396),90 + 5*(PlayerID(GetHitVar(Fall.Envshake.Ampl)),time - 396),90 + 5*(PlayerID(GetHitVar(Fall.Envshake.Ampl)),time - 396)

[State 1113150, anim]
type = ChangeAnim2
triggerall = PlayerIDExist(GetHitVar(Fall.Envshake.Ampl))
trigger1 = PlayerID(GetHitVar(Fall.Envshake.Ampl)),var(10) = 16 && anim != 1113152
value = 1113152

[State 1113150, velfix for lasthit]
type = velset
triggerall = anim = 1113152
trigger1 = (vel y || vel x)
x = 0
y = 0

[State 1113150, pos fix for lasthit]
type = posset
triggerall = anim = 1113152
trigger1 = pos y
y = 0

[State 1113150, StateType lasthit]
type = StateTypeSet
triggerall = anim = 1113152
trigger1 = StateType != L
type = L
physics = C
movetype = H

[State 1113150,Safe]
type = SelfState
trigger1 = PlayerIDExist(GetHitVar(Fall.Envshake.Ampl)) = 0
trigger1 = PlayerID(GetHitVar(Fall.Envshake.Ampl)), StateNo != 3150
value = 5050

[State 1113150, StateType lasthit]
type = SelfState
trigger1 = anim = 1113152
trigger1 = !animtime
value = 5100












;---------------------------------------------------------------------------
; 万用浮空击飞
;---------------------------------------------------------------------------
[Statedef 10060]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0

[State 10600]
type = Hitby
Trigger1 = 1
value = SCA,AA,AP

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
value = 5050

[State -2, anim]
type = ChangeAnim2
trigger1 = time = 0
value = 5960

[State -2, end]
type = ChangeState
trigger1 = HitShakeOver
value = 10061

[Statedef 10061]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0

[State 10600]
type = Hitby
Trigger1 = 1
value = SCA,AA,AP

[State -2]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

[State -2]
type = SelfState
trigger1 = Time > 600
value = 5050

[State -2, anim]
type = ChangeAnim2
trigger1 = time = 0
value = 5961+(GetHitVar(animtype)=[4,5])
ignorehitpause = 1

[State 1321, vel]
type = velset
trigger1 = Time = 0
x = GetHitVar(xvel)*Facing
y = GetHitVar(yvel)

[State 1321, gravity]
type = VelAdd
Trigger1 = time > 0
y = GetHitVar(yaccel)

[State 1321, end]
type = SelfState
triggerall = anim = 5961
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 5050

[State 1321, end]
type = ChangeAnim
triggerall = anim = 5962
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
trigger1 = !(SelfAnimExist(5051) || SelfAnimExist(5052))
value = 5050
persistent = 0

[State 1321, end]
type = ChangeAnim
triggerall = anim = 5962
triggerall = Pos Y >= 0
triggerall = Vel Y > 0
triggerall = SelfAnimExist(5052)
trigger1 = GetHitVar(animtype) = 5
value = 5052
persistent = 0

[State 1321, end]
type = ChangeAnim
triggerall = anim = 5962
triggerall = Pos Y >= 0
triggerall = Vel Y > 0
triggerall = SelfAnimExist(5051)
trigger1 = GetHitVar(animtype) = 4
trigger2 = GetHitVar(animtype) = 5
trigger2 = !SelfAnimExist(5052)
value = 5051
persistent = 0

[State 1321, end]
type = ChangeAnim
triggerall = anim = [5050,5059]
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
trigger1 = SelfAnimExist(anim+10)
value = anim+10
persistent = 0

[State 1321, end]
type = SelfState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 5100

