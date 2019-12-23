;====================================================
;
; 覆面行星,移植自GoD_Ryu氏Krizalid
;
;====================================================

[Statedef 3100]
type = S
movetype = A
physics = S
juggle =  5
anim = 3100
ctrl = 0
sprpriority = 2
velset = 0,0

[State 3000, 1.1]
type = SuperPause
trigger1 = animelem = 5,=0
anim = -1
time = 28
poweradd = ifelse(var(52)>0,-1000,-3000)
movetime = 28
darken = 0
p2defmul = 1

[State 3100,清BC]
type = varset
trigger1 = time = 0
trigger1 = var(52) > 0
var(52) = 0

[State 0, EnvColor]
type = EnvColor
trigger1 = animelem = 5,=0
value = 255,255,255
time = 4
under = 1

[State 0, EnvColor]
type = EnvColor
trigger1 = animelem = 5,=4
value = 0,0,0
time = 220
under = 1

[State 3000, 星1]
type = Explod
trigger1 = animelem = 5,=1
anim = 7640
pos = 20,-73
postype = p1
sprpriority = -7
supermove = 1
bindtime = 30
ownpal = 1

[State 3000, 星2]
type = Explod
trigger1 = animelem = 5,=1
anim = 7580
pos = 20,-73
postype = p1
sprpriority = 7
supermove = 1
bindtime = 30
ontop = 1
ownpal = 1

[State -2, 02umMax2Env]
type = Explod
trigger1 = Time = 31
trigger1 = TeamSide = 1
anim = 7730
ID = 7730
postype = left
pos = 0,85
sprpriority = -2
bindtime = -1
removetime = -2
pausemovetime = 99999999
supermovetime = 99999999

[State -2, 02umMax2Env]
type = Explod
trigger1 = Time = 31
trigger1 = TeamSide = 1
anim = 7740
ID = 7740
postype = left
pos = 0,85
sprpriority = -1
bindtime = -1
removetime = -2
pausemovetime = 99999999
supermovetime = 99999999

[State -2, 02umMax2Env]
type = Explod
trigger1 = Time = 31
trigger1 = TeamSide = 2
anim = 7731
ID = 7731
postype = left
pos = 0,85
sprpriority = -2
bindtime = -1
removetime = -2
pausemovetime = 99999999
supermovetime = 99999999

[State -2, 02umMax2Env]
type = Explod
trigger1 = Time = 31
trigger1 = TeamSide = 2
anim = 7741
ID = 7741
postype = right
pos = 0,85
sprpriority = -1
bindtime = -1
removetime = -2
pausemovetime = 99999999
supermovetime = 99999999

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
ignorehitpause =1

[State 3000, 超杀星的声音]
type = playsnd
trigger1 = animelem = 5
value = 8,21

[State 3000, 奇怪的声音]
type = playsnd
trigger1 = animelem = 6,=1
value = 3,3

[State 3000, 人物的声音]
type = playsnd
trigger1 = animelem = 10,=1
value = 10,60
volume = 255

[State 0, ChangeState]
type = ChangeState
trigger1 = !Animtime
value = 3110
ctrl = 0

[Statedef 3110]
type = S
movetype = A
physics = N
anim = 3110 ;全屏攻击框
ctrl = 0
sprpriority = 2

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
ignorehitpause =1

[State 0, HitBy]
type = HitBy
trigger1 = Animelemtime(6)>= 0 && Animelemtime(13)<0
value = SCA,ST,HT
time = 1
ignorehitpause =1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 =1
flag = nojugglecheck
ignorehitpause =1

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignorehitpause =1

[State 0, VelAdd]
type = VelAdd
trigger1 = 1
x = .051250

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0
ignorehitpause =1

[State 0, 全屏攻击框带蓝框]
type = ChangeAnim
trigger1 = Anim = 3110 & !Animtime
value = 3115
ignorehitpause =1

[State 3000, 啾啾声]
type = playsnd
trigger1 = Gametime%6=0
value = s3,2
channel = 14

[State 0, 击中声音]
type = Null;PlaySnd
trigger1 = Movehit
value = s5,15
volume = -200
channel = 6
ignorehitpause =1
ignorehitpause =1
persistent =1

[State 0, 防御声音]
type = Null;PlaySnd
trigger1 = MoveGuarded
value = s2,1
volume = -200
channel = 6
ignorehitpause =1
ignorehitpause =1
persistent =1

[State 0, MoveHitReset]
type = MoveHitReset
triggerall = Anim = 3110
trigger1 = Movecontact >= 1
ignorehitpause =1
persistent =1

[State -2, 绝情打击特效1]
type = Explod
Triggerall = Time % 12 != 0
Triggerall = Time % 18 != 0
trigger1 = Time % 6 = 0
anim = 8204
ID = 8204
postype = p2
pos = 0,0
sprpriority = 0
pausemovetime = 99999999
supermovetime = 99999999

[State -2, 绝情打击特效2]
type = Explod
Triggerall = Time % 18 != 0
trigger1 = Time % 12 = 0
anim = 8205
ID = 8205
postype = p2
pos = 0,0
sprpriority = 0
pausemovetime = 99999999
supermovetime = 99999999

[State -2, 绝情打击特效2]
type = Explod
trigger1 = Time % 18 = 0
anim = 8206
ID = 8206
postype = p2
pos = 0,0
sprpriority = 0
pausemovetime = 99999999
supermovetime = 99999999

[State 0, HitDef]
type = HitDef
triggerall = Anim = 3110
triggerall = Hitcount<29
Trigger1 = Gametime%6=0
attr = S, HP
damage = 15+(hitcount<2)*20,5
animtype = hard
guardflag = MA
hitflag = MAFD
pausetime = 0,2
guard.pausetime = 0,2
getpower = 0,0
givepower = 15,15
sparkno = s7255
guard.sparkno = s7262
sparkxy = -15,-70+(Floor(P2dist Y))
;hitsound = s9999,0
guardsound = s6,1
ground.type = High
air.type = Low
ground.slidetime = 17
ground.hittime  = 17
ground.velocity = 0,-5
down.velocity = 0,-8
guard.velocity = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.velocity = 0,-2
yaccel = .54
Fall = 1
nochainid = 3101
ID = 3100
kill = 0
fall.recover = 0
forcestand = 1
ignorehitpause = 0
guard.kill = (Time >= 15)

[State 0, HitDef]
type = HitDef
triggerall = Anim = 3115
Trigger1 = Animelem = 1
attr = S, HP
damage = 29+(hitcount<5)*80,10
animtype = DiagUp
guardflag = MA
hitflag = MAFD
pausetime = 0,12
guard.pausetime = 0,12
getpower = 0,0
givepower = 15,15
sparkno = s7255
guard.sparkno = s7262
sparkxy = -10,-70+(Floor(P2dist Y))
hitsound = s5,9
guardsound = s6,1
ground.type = High
air.type = High
ground.slidetime = 17
ground.hittime  = 17
ground.velocity = Ifelse(P2dist X >= 0,-8,8),-10
air.velocity = Ifelse(P2dist X >= 0,-8,8),-8;Ifelse(Facing = Enemynear,Facing,12,-12),-8
down.velocity = Ifelse(P2dist X >= 0,-8,8),-10;Ifelse(Facing = Enemynear,Facing,12,-12),-10
guard.velocity = -12
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .64
Fall = 1
ID = 3101
p2facing = Ifelse(P2dist X >= 0,1,-1);Ifelse(Facing = Enemynear,Facing,Facing,1)
kill = 1
forcestand = 1

[State 0, Width]
type = Width
trigger1 = 1
edge = 30,0
ignorehitpause =1

[State 0, Explod]
type = Explod
trigger1 = !Animtime
anim = 7720
ID = 7720
pos = 0,0
postype = back
bindtime = -1
supermovetime = 99999
pausemovetime = 99999
ontop = 0
shadow = 0
ownpal = 1
trans = None

[State 0, ChangeState]
type = ChangeState
trigger1 = Anim = 3115 & !Animtime
trigger2 = Winko && Anim != 3115
value = 3120
ctrl = 0

[Statedef 3120]
type = S
movetype = A
physics = S
anim = 3120
ctrl = 0
sprpriority = 2
juggle = 15

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 15
ignorehitpause =1

[State 0, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 14
ignorehitpause =1

[State 0, ScreenBound]
type = ScreenBound
trigger1 =1
value = 1
movecamera = 1,1
ignorehitpause =1

[State 0, Width]
type = Width
trigger1 = Time < 10
edge = 30,30
ignorehitpause =1

[State 0, NotHitBy]
type = NotHitBy
trigger1 = Time<10
value = SCA
ignorehitpause =1

[State 0, VelSet]
type = VelSet
trigger1 = Time<2
x = 15

[State 0, ChangeState]
type = ChangeState
trigger1 = !Animtime
value = 0
ctrl = 1