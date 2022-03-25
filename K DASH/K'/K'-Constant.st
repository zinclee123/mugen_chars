[Data]
life = 1000
attack = 100
defence = 100
fall.defence_up = 50
liedown.time = 9
airjuggle = 0
sparkno = 2
guard.sparkno = 40
KO.echo = 0
volume = 255
IntPersistIndex = 20
FloatPersistIndex = 5
power = 5000

[Size]
xscale = 1                              ;Horizontal scaling factor.
yscale = 1                               ;Vertical scaling factor.
ground.back = 15                         ;Player width (back, ground)
ground.front = 15                        ;Player width (front, ground)
air.back = 12                            ;Player width (back, air)
air.front = 12                           ;Player width (front, air)
height = 60                              ;Height of player (for opponent to jump over)
attack.dist = 160                        ;Default attack distance
proj.attack.dist = 90                    ;Default attack distance for projectiles
proj.doscale = 1                         ;Set to 1 to scale projectiles too
head.pos = 0, -95                       ;Approximate position of head
mid.pos = -5, -60                        ;Approximate position of midsection
shadowoffset = -1                         ;Number of pixels to vertically offset the shadow
draw.offset = 0,0                       ;Player drawing offset in pixels (x, y)

[Velocity]
walk.fwd  = 3.08203125                         ;Walk forward
walk.back = -3.08203125                        ;Walk backward
run.fwd  =  6.20703125                             ;Run forward (x, y)
run.back = -6.20703125,-4               ;Hop backward (x, y)
jump.neu = 0,-10.875                            ;Neutral jumping velocity (x, y)
jump.back = -3.08203125                        ;Jump back Speed (x, y)
jump.fwd = 3.08203125                          ;Jump forward Speed (x, y)
runjump.back = -5.623046875,-10.02578125                ;Running jump speeds (opt)
runjump.fwd = 5.623046875,-10.02578125                  ;.
airjump.neu = 0,-8.1                           ;.
airjump.back = -2.55                           ;Air jump speeds (opt)
airjump.fwd = 2.5                              ;.

[Movement]
airjump.num = 0                                ;Number of air jumps allowed (opt)
airjump.height = 35                            ;Minimum distance from ground before you can air jump (opt)
yaccel = 0.6171875                         ;Vertical acceleration
stand.friction = .82                           ;Friction coefficient when standing
crouch.friction = .82                          ;Friction coefficient when crouching

;Default language victory quotes **MUGEN 1.0**
;The default language victory quotes must be implemented in English.
[Quotes]
; Up to 100 victory quotes can be specified per language (victory0 - victory99)
victory1 = "手里的火焰在燃烧，是共鸣，草薙京就在附近。"
victory2 = "如果你赢不了，滚开！" ;KoF 2000


;Based on Vans Neo WLS system
;=================================================;
;Coding File           ;
;http://trinitymugen.net                          ;
;NO to code theft                                 ;
;=================================================;
;Vars Used
;Var   1 = Used
;Var   2 = Jump Shit
;Var   3 = x2
;Var   4 = Command Buffer
;Var   5 = For Win State Decider.
;Var   6 = Superpause check
;Var   7 = Used
;Var   8 = Enemy identifier
;Var   9 = Display to Clipboard Message
;Var  10 = EX Mode Detection
;Var  11 = Guard Crush
;Var  12 = Cornerpush accel counter.
;Var  13 = Dizzy Code Shit
;Var  14 = x2
;Var  15 = Used
;Var  16 = Slowmotion Time
;Var  17 = Conerpush type; 1 = Hard, 2 = Light
;Var  18 = Button Used
;Var  19 = Throw Limitation
;Var  20 = Afterimage Switch
;Var  21 = Flash Switch
;Var  22 = Blood Switch
;Var  23 = Command Var
;Var  24 = Used
;Var  25 = Used
;Var  26 = Run feature
;var 27 = heat drive unblockable activator
;Var  28 = Recent Custom States
;Var  29 = Gametime Variable
;Var  30 = Primary AI Variable
;var 31 = used
;var 32 = used
;var 33 = used
;Var 34 = Chain Drive Sunglasses Hit
;var 35 = DM/SDM powerbar detection
;Var  40 = heat drive edge detection
;Var  41 = DRINK SYSTEM
;var 42 = vs kula detector
;var 43 = eins trigger/crow bite/minute spike followup
;var 44 = eins trigger juggle
;var 45 = second shell juggle
;var 46 = damage dampening system
;var 50 = max cancel hit detect
;var 51 = max mode
;var 52 = max mode palfx
;Var  53 = max mode yes or no
;Var  54 = Super Cancel
;Var  55 = KOF Juggle System
;Var  56 = Counter Hit System
;Var  57 = x2
;Var  58 = Juggle SPECIAL
;Var  59 = Simplifier Variable
;Floats
;FVar  0 = K.O. Voice
;FVar  1 = Cheap K.O.
;FVar  2 = K.O. Voice
;FVar  3 = Intro position
;FVar  5 = Skillbar level
;FVar  6 = Cornerpush
;FVar  7 =
;FVar  8 = Throw Escape Check
;FVar 35 = K.O. Voice
;FVar 36 = K.O. Voice
