; ���ޗp�J���t�[�}���i������Ƃ��۔Łj�̃R�}���h�t�@�C���ł��B
; �R�}���h�Ɋւ���ݒ�͂S���\���ɂȂ��Ă��܂��B
;==============================================================================
; Win�Ő�p�p�[�g
;==============================================================================
;------------------------------------------------------------------------------
; ������Win�ł���i���m�ɂ�Linux�ł���j�ǉ����ꂽ�v�f�̓�B
; �R�}���h�֘A�̏����ݒ��C�ӂɎw��o����悤�ɂȂ���(`�E�ցE�L)
;
;�w�{�^�����}�b�v�x�̓{�^���z�u�ύX�p�̍��ځB
; ��`�p�[�g�ł��������ύX���Ȃ��Ă��ǂ��悤�ɂȂ���������B
; �ʓ|�L���l�p���ȁI�i�ú�
;
;�w�f�t�H���g�ݒ�x�ł͊e[Command]�ŏȗ������ꍇ��
; ���͎�t���ԂƓ��͋L�����Ԃ�\�ߌ��߂Ă������ځB
;
; ���̂Q���ڂ͏ȗ��\�B
;------------------------------------------------------------------------------
;-| �{�^�����}�b�v�i�{�^���R���t�B�O�j|---------------------------------------- ��P��

[Remap]
x = x      ;�w�{�^���̓��͔�������ۂɉ����{�^���Ɋ��蓖�Ă�B
y = y      ;�x�{�^���@�@�@�@�@�@�@�@�@�V
z = z      ;�y�{�^���@�@�@�@�@�@�@�@�@�V
a = a      ;�`�{�^���@�@�@�@�@�@�@�@�@�V
b = b      ;�a�{�^���@�@�@�@�@�@�@�@�@�V
c = c      ;�b�{�^���@�@�@�@�@�@�@�@�@�V
s = s      ;�X�^�[�g�{�^���@�@�@�@�@�@�V

;------------------------------------------------------------------------------
; �Ⴆ�΁u�{���w�{�^���ŏo����p���`���a�{�^���ɕς������ꍇ�v�Ȃ�A
;
; x = b
;
; �ŊȒP�ɏo����B�g��Ȃ��{�^�����g���Ă���{�^���Ɋ��蓖�Ă鎖���\�B
;------------------------------------------------------------------------------
;-| �f�t�H���g�ݒ� |----------------------------------------------------------- ��Q��

[Defaults]
command.time = 15  ;�W���̃R�}���h���͎�t���ԁB
                   ;�e�R�}���h�ŏȗ����Ă���ꍇ�ɗL���B
                   ;���̃p�����[�^���������ꍇ�A�f�t�H���g�͂P�t���[���ɂȂ�B
                   ;�i�@M.U.G.E.N�ł̂P�t���[���@���@�P�^�U�O�b�@�j

command.buffer.time = 1  ;�W���̃R�}���h���͋L�����ԁB
                         ;���͂�������ɃR�}���h���L�����A
                         ;�w�𗣂��Ă��R�}���h���������Ă����Ԃ�
                         ;�����Őݒ肵�����Ԃ̕��ێ�����B
                         ;�P�`�R�O�t���[���܂ł̊ԂŐݒ�\�B
                         ;�f�t�H���g�͂P�t���[���B

;============================================================================== ��R��
; �R�}���h��`�p�[�g�i���̓L�[��ݒ肷��j
;==============================================================================
;------------------------------------------------------------------------------
; �������L�[�ƃ{�^���̑g�ݍ��킹�Ŋi���Q�[���ɂ�����
;�w���̓R�}���h�x�𒼐ڐݒ�E�ҏW����p�[�g�B
;
; ����R�}���h�ɖ��O��t���ē��̓L�[��g�ݍ��킹��P���ȍ�ƂɂȂ邯�ǁA
; �g�ݍ��킹���Ɠ�������o����͓̂�Փx�����������B
;
; ���L�Łu�����̌��܂�v�Ɓu�g�ݍ��킹�ɕK�v�ȃA���t�@�x�b�g�ƋL���v��
; �S�Đ������܂��傤�B
;------------------------------------------------------------------------------
;�������̌��܂聡
;
; [Command]         �F���̓R�}���h���P��`����B
; name = "***"      �F�R�}���h�������߂�B�啶���Ə���������ʂ����B
; command = ###     �F���ۂɓ��͂���L�[��g�ݍ��킹��B�ڍׂ͌�q�B
; time = &&&        �F���͎�t���Ԃ�ݒ�i�I�v�V�����j�B
; buffer.time = @@@ �F���͋L�����Ԃ�ݒ�i�I�v�V�����j�B
;
; ���l�^�ł��������Ă���ʂ�A�o�^���\�Ȑ��͍ő�w�P�Q�W�x�܂ŁB
;
;
;���w�K�{�R�}���h���x�Ə����Ă�R�}���h�́A�V�X�e�����ŏ������Ă܂��B
;�@�R�}���h����ς�����A�����Ă͂����܂���B�L�[�̕ύX�͏o���܂��B
;------------------------------------------------------------------------------
;���K�v�ȃA���t�@�x�b�g�ƋL����
;
; ��L�́ucommand = ###�v�́w###�x�ɊY�����镔���ŁA
; �g�ݍ��킹��L�[�ƃ{�^����ݒ肵�Ȃ���΂Ȃ�Ȃ��B
;
; ���ݒ肵���L�[��{�^����M.U.G.E.N�̃I�v�V�������[�h�ɂ���
;  �u�L�[�R���t�B�O�v�ɂĐݒ肵���L�[�ȂǂɑΉ����Ă��܂��B
;
; �������L�[���i�S�ĕK���啶���Łj
;
; �@B �@�F�u����v�ɃL�[������i Backward �j
; �@D �@�F�u�����v�ɃL�[������i Downward �j
; �@F �@�F�u�O���v�ɃL�[������i Forward �j
; �@U �@�F�u����v�ɃL�[������i Upward �j
;
; �@DB�@�F�u���΂߉��v�ɃL�[������i�uD�v�ƁuB�v�������ɓ��͂��ꂽ����F���j
; �@UB�@�F�u���΂ߏ�v�ɃL�[������i�uU�v�ƁuB�v�������ɓ��͂��ꂽ����F���j
; �@DF�@�F�u�O�΂߉��v�ɃL�[������i�uD�v�ƁuF�v�������ɓ��͂��ꂽ����F���j
; �@UF�@�F�u�O�΂ߏ�v�ɃL�[������i�uU�v�ƁuF�v�������ɓ��͂��ꂽ����F���j
;
; ���{�^�����i�S�ĕK���������Łj
;
; �@a �@�F�u�`�{�^���v������
; �@b �@�F�u�a�{�^���v������
; �@c �@�F�u�b�{�^���v������
; �@x �@�F�u�w�{�^���v������
; �@y �@�F�u�x�{�^���v������
; �@z �@�F�u�y�{�^���v������
; �@s �@�F�u�X�^�[�g�{�^���v������
;
; ���L�����i���͌��ʂ�ω������閽�߁j
;
; �@/ �@�F�i�X���b�V���j�L�[��{�^�����u�������ςȂ��v�ɂ��Ă��鎖��F������ꍇ�ɒǉ�����
;
; �@�@�i��j�F�@/b       = �a�{�^�����������܂܂ɂ���
; �@�@�@�@�@�@�@/F       = �O�L�[���������܂܂ɂ���
; �@�@�@�@�@�@�@/U,z     = ��L�[���������܂܂y�{�^������͂���
;
;�@�@������������������������������������������������������������
;
; �@~ �@�F�i�`���_�j�L�[��{�^�����u�����ꂽ���v��F������ꍇ�ɒǉ�����
;
; �@�@�i��j�F�@~x       = �w�{�^���𗣂�
; �@�@�@�@�@�@�@~DF      =�u�O�΂߉��v�̃L�[�𗣂�
; �@�@�@�@�@�@�@~DB,F,c  =�u���΂߉��v�𗣂�����ɑO�L�[�E�b�{�^���̏��Ԃɓ��͂���
;
; �@�@�@�@�@�@���u�{�^���𗣂��܂ł̎��ԁi���ߎ��ԁj�v���ݒ肷�鎖���o����
;
; �@�@�@�@�@�@�@~30x     = �w�{�^�����������܂܂ɂ��āA�R�O�t���[���ȏ�o�����痣��
; �@�@�@�@�@�@�@~50B,F,a = ���L�[���T�O�t���[���܂ŗ��߂đO�L�[�E�`�{�^���̏��Ԃɓ��͂���
;
;�@�@������������������������������������������������������������
;
; �@$ �@�F�i�h���j�����L�[�́u�����̓��ǂꂩ�����͂���Ă��鎖�v��F������ꍇ�ɒǉ�����
;
; �@�@�i��j�F�@$B       =�u����v�u���΂߉��v�u���΂ߏ�v�̂ǂꂩ�����͂���Ă�����
; �@�@�@�@�@�@�@$UF      =�u�O�v�u��v�u�O�΂ߏ�v�̂ǂꂩ�����͂���Ă�����
;
; �@�@�@�@�@�@�����̋L���́u�����L�[�v�ł����g���܂���B
;
;�@�@������������������������������������������������������������
;
; �@+ �@�F�i�v���X�j�{�^�����u���������v���Ă��鎖��F������ꍇ�ɒǉ�����
;
; �@�@�i��j�F�@x+y      = �w�{�^���Ƃx�{�^���𓯎���������
; �@�@�@�@�@�@�@a+b+c    = �`�{�^���Ƃa�{�^���Ƃb�{�^���𓯎���������
;
; �@�@�@�@�@�@�����̋L���́u�{�^���v�ł����g���܂���B
;
;�@�@������������������������������������������������������������
;
; �@> �@�F�i�O���[�^�[�U���j��Ȃ�iWin�łŒǉ����ꂽ�L���j
; �@�@�@�@�@�@�@�@�@�@�@�@�u���̃L�[�����͂���Ă��Ȃ������m�F���āA���̃L�[�������v�ꍇ
;
; �@�@�i��j�F�@a,>~a    = �`�{�^���ȊO�����͂���Ă��Ȃ���Ԃł`�{�^���𗣂�
; �@�@�@�@�@�@�@F,>~F,>F = �O�L�[�ȊO�����͂���Ă��Ȃ���ԂőO�L�[�𗣂��A
;�@�@�@�@�@�@�@�@�@�@�@�@�@������x�O�L�[����͂���
;
;-------------------------------------------------------------------------------
; �������̋L���͑S�đg�ݍ��킹�Ďg�������o���遜
;
; �@�@�i��j�F�@~80$DB,DF,F,/a+y+c
; �@�@�@�@�@�@�@
; �@�@�@�@�@�@�u����v�u���v�u���΂߉��v�̂ǂꂩ���W�O�t���[���܂ŗ��߂�
; �@�@�@�@�@�@�u�O�΂߉��v���u�O�v����͂�����A�`�Ƃx�Ƃb�𓯎����������܂܂ɂ���
;
;------------------------------------------------------------------------------
;-| �`�h�����p�R�}���h |-------------------------------------------------------

;���b�o�t�Ɂw�l�Ԃɂ͓��͏o���Ȃ��R�}���h�x����͂����鎖�ŁA
;�@�w�[���`�h�v���O�����x�𔭓�������悤�ɂ���e�N�j�b�N�B
;�@�����m���͂܂��Ƀ����_���Ȃ̂ŁA�^�C���B

[Command]
name = "AI-000"
command = ~F,a,~D,y,~U,c+x,D,b+y,F,z,z,z+a
time = 1

[Command]
name = "AI-001"
command = ~F,c,~D,y,~U,c+a,D,b+x,B,z,z,z+b
time = 1

[Command]
name = "AI-002"
command = ~F,y,~D,y,~U,c+y,D,b+z,F,z,z,z+c
time = 1

[Command]
name = "AI-003"
command = ~F,b,~D,y,~U,c+b,D,b+a,B,z,z,z+x
time = 1

[Command]
name = "AI-004"
command = ~F,x,~D,x,~U,c+x,D,b+y,F,z,z,z+y
time = 1

[Command]
name = "AI-005"
command = ~F,z,~D,y,~U,c+a,D,b+c,B,z,z,z+a
time = 1

[Command]
name = "AI-006"
command = ~D,U,x+y+z,~F,F,b,c,y,B,~B,a+b+c,U
time = 1

[Command]
name = "AI-007"
command = ~U,D,x+b+z,~F,F,b,b,x,B,~B,a+y+c,F
time = 1

[Command]
name = "AI-008"
command = ~D,U,a+y+c,~F,F,b,a,z,B,~B,x+b+z,D
time = 1

[Command]
name = "AI-009"
command = ~U,D,x+b+c,~F,F,b,c,x,B,~B,a+y+z,B
time = 1

[Command]
name = "AI-010"
command = ~x,~y,~z,~a,~b,~c,~s,a+b+c,x+y+z,~F,B
time = 1

;***********************************
[Command]
name = "AI-011"
command = F,D,F
time = 0

[Command]
name = "AI-012"
command = B,F,B
time = 0

[Command]
name = "AI-013"
command = U,B,U
time = 0

[Command]
name = "AI-014"
command = D,U,D
time = 0

;***********************************
[Command]
name = "AI-015"
command = a,s,a
time = 0

[Command]
name = "AI-016"
command = b,a,b
time = 0

[Command]
name = "AI-017"
command = c,b,c
time = 0

[Command]
name = "AI-018"
command = x,c,x
time = 0

[Command]
name = "AI-019"
command = y,x,y
time = 0

[Command]
name = "AI-020"
command = z,y,z
time = 0

[Command]
name = "AI-021"
command = s,z,s
time = 0

;------------------------------------------------------------------------------
;-| �X�[�p�[�A�[�c |-----------------------------------------------------------

;�����O�������Ȃ�΁A�Ⴄ�R�}���h�ł������X�e�[�g�̋Z���o�������\�B
;***********************************
;�ҏb�̘A��
[Command]
name = "rengeki"
command = ~D,F,D,B,y
time = 25

;***********************************
;�u��
[Command]
name = "syungoku"
command = ~D,B,D,B,y
time = 25
;***********************************
;������
[Command]
name = "kakato"
command = ~D,F,D,F,b
time = 25

;***********************************
;�׃b�`�F���A�A�A�b
[Command]
name = "jya"
command = ~D,F,D,F,y
time = 25

;***********************************
;�h���X
[Command]
name = "do"
command = ~D,F,D,F,x
time = 25

;***********************************
;�����Ɏ��������ؓ��ł����v������u������
[Command]
name = "fatality"
command = ~D,F,D,F,x+y
time = 25

;------------------------------------------------------------------------------
;-| �K�E�Z |-------------------------------------------------------------------
;***********************************
;�W�F�m�T�C�h�J�b�^�[
[Command]
name = "sinsain"
command = ~D,DF,F,b
;***********************************
;�Ȃ�Ă������Ȃ񂾁E�E�E
[Command]
name = "bearhug"
command = ~F,D,B,x
;***********************************
;�ۖ��j��
[Command]
name = "parn"
command = ~D,D,y
;***********************************
;�g�������a��g����
[Command]
name = "unsou"
command = ~D,DF,F,y

;***********************************
;�ːi
[Command]
name = "blow"
command = ~D,DB,B,y

;------------------------------------------------------------------------------
;-| ����Z |------------------------------------------------------------------

;***********************************
;�u���b�L���O
[Command]
name = "blocking-000"
command = F
time = 1

[Command]
name = "blocking-001"
command = /F
time = 1

[Command];�N�C�b�N�X�^���f�B���O�Ƌ��p
name = "blocking-002"
command = D
time = 1

[Command]
name = "blocking-003"
command = /D
time = 1

;***********************************
;�������b�Z�[�W�p
[Command]
name = "hold_s"
command = /s

;����
[Command]
name = "syaori"
command = B,z
time = 1

;------------------------------------------------------------------------------
;-| �L�[�Q��A������ |---------------------------------------------------------

[Command]
name = "FF"       ;�K�{�R�}���h��
command = F,F
time = 10

[Command]
name = "BB"       ;�K�{�R�}���h��
command = B,B
time = 10

;------------------------------------------------------------------------------
;-| �������� |-----------------------------------------------------------------

[Command]
name = "recovery" ;�K�{�R�}���h��
command = a+b
time = 1

[Command]
name = "recovery" ;�K�{�R�}���h��
command = x+y
time = 1

;------------------------------------------------------------------------------
;-| �����L�[�{�{�^�� |---------------------------------------------------------


[Command]
name = "fwd_x"
command = /F,x

[Command]
name = "fwd_b"
command = /F,b

[Command]
name = "back_y"
command = /B,y

;------------------------------------------------------------------------------
;-| �{�^���P�� |---------------------------------------------------------------

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

;------------------------------------------------------------------------------
;-| �����L�[ |-----------------------------------------------------------------

[Command]
name = "holdfwd"   ;�K�{�R�}���h��
command = /$F
time = 1

[Command]
name = "holdback"  ;�K�{�R�}���h��
command = /$B
time = 1

[Command]
name = "holdup"    ;�K�{�R�}���h��
command = /$U
time = 1

[Command]
name = "holddown"  ;�K�{�R�}���h��
command = /$D
time = 1

;============================================================================== ��S��
; �X�e�[�g�G���g���[�p�[�g�i�Z�Ȃǂ��o����悤�ɂ��邽�߂̏�����ݒ�j
;==============================================================================
;------------------------------------------------------------------------------
; �R�}���h���Ɠ��͂���R�}���h��ݒ肵����������Ӗ��������̂ŁA��������
;�u���ۂɓ��͂����R�}���h�łǂ̔ԍ��̃X�e�[�g���ǂ����������ŏo���邩�v
; �����߂Ȃ���΂Ȃ�Ȃ��B
;
; �X�e�[�g�R���g���[���uChangeState�v�����g��Ȃ����ǁA
; ����Ȃɓ���Ȃ��̂Ńg���K�[���o���Ă��炷���o����B
;
; ���������������Ă����ΊȒP�ȃg���K�[�ݒ�̗���͊o�����邩�ƁB
;
; �G���g���[�̏��Ԃɂ͂�����x�̖@�������邯�ǁA
; ���܂��t�H���_�́u���l�^.txt�v���Q�ƁB�i�g�������\�����׶��ׁj
;
; ChangeState�ȂǃX�e�[�g�R���g���[���̊�{�I�Ȑݒu���
; ���܂��t�H���_�́u�e���v���[�g.txt�v���Q�ƁB
;------------------------------------------------------------------------------
; �����펞�Ď��X�e�[�g�i�|�P�j��
; �R�}���h�t�@�C���i�̃X�e�[�g�G���g���[�p�[�g�j�ɕK�v�ȍ��ڂł��B
; ��΂ɏ����Ă͂����Ȃ��̂ŗv���ӁB
;
; �ʏ�̐H�炢��ԈȊO�́uP2StateNo�v��uTargetState�v���Ő��䂳�ꂽ�A
; �쐬�҂��C�ӂɎw�肵�����葤�̐H�炢�X�e�[�g�Ɍ���A
; �o�^�����X�e�[�g�R���g���[�����L���ɂ͂Ȃ�܂���B
;------------------------------------------------------------------------------

[Statedef -1] ;�����̍s�͐�΂ɏ����Ȃ��łˁB�K�{���ڂł��B

;==============================================================================
; �X�[�p�[�A�[�c
;==============================================================================
;------------------------------------------------------------------------------

[State -1, �����Ɏ��������ؓ��ł����v������u������]
type = ChangeState
triggerall = (command = "fatality")
triggerall = (Power > 2999)
triggerall = (StateType != A)
trigger1 = (palno = [7,12]) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
trigger2 = (palno = [7,12])
trigger3 = (palno = [1,6]) && (Ctrl) && (life < ((lifemax)/2))
trigger4 = (StateNo = 1011) && (time > 6)
trigger4 = (life < ((lifemax)/2))
trigger4 = (palno = [1,6])
value = 3580

[State -1, �u���E]
type = ChangeState
triggerall = (command = "syungoku")
triggerall = (Power > 1999)
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 3500

;------------------------------------------------------------------------------

[State -1,�ҏb�̘A��]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "rengeki")
triggerall = (StateType != A)
triggerall = (Power > 1999)
trigger1 = (Ctrl) && (Pos Y >= 0)
trigger2 = (StateNo = 1011) && (time > 6)
value = 2014

[State -1,�׃b�`�F���A�A�A�b]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "jya")
triggerall = (StateType != A)
triggerall = (Power > 999)
trigger1 = (Ctrl) && (Pos Y >= 0)
trigger2 = (StateNo = 1011) && (time > 6)
value = 2015

[State -1,�h���X]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "do")
triggerall = (StateType != A)
triggerall = (Power > 999)
trigger1 = (Ctrl) && (Pos Y >= 0)
trigger2 = (StateNo = 1011) && (time > 6)
value = 2226

[State -1,������]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "kakato")
triggerall = (Power > 999)
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 1005

[State -1,���̉���]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "jya")
triggerall = (Power > 1999)
trigger1 = (StateNo = 1006) && (MoveContact); && (animelem = 7) 
value = 1600

;==============================================================================
; �K�E�Z
;==============================================================================
;------------------------------------------------------------------------------

[State -1, �u�Ԉړ�]
type = ChangeState
triggerall = (command = "z")
triggerall = (Ctrl)
trigger1 = (StateType != A) && (Stateno != 20)
value = 1011

;------------------------------------------------------------------------------

[State -1, �W�F�m�T�C�h]
type = ChangeState
triggerall = (command = "sinsain")
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 1002

[State -1, �^��]
type = ChangeState
triggerall = (command = "unsou")
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 1000

[State -1, �ۖ��j��]
type = ChangeState
triggerall = (command = "parn") && (var(35) <= 0)
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 1009

[State -1, �x�A�n�b�O]
type = ChangeState
triggerall = (command = "bearhug") && (var(35) <= 0)
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 2003
;------------------------------------------------------------------------------


[State -1, �J���t�[�u���[�E��]
type = ChangeState
triggerall = (command = "blow")
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 1007

;==============================================================================
; ����Z
;==============================================================================
;------------------------------------------------------------------------------

[State -1, �J���t�[�X���[�E��]
type = ChangeState
triggerall = (command = "y")
triggerall = (StateNo != 100)
triggerall = (StateNo != 101)
triggerall = (StateNo != 106)
;�n�㓊��
triggerall = (command = "holdfwd")
triggerall = (StateType != A)
triggerall = (P2BodyDist X < 30)
triggerall = (P2StateType != A)
triggerall = (P2MoveType != H)
trigger1 = (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 800

;���utrigger*�v�������̕t�����ɂ���ĉ��ł����₹��B

[State -1, ���ǂ���ł�]
type = ChangeState
triggerall = (command = "z")
trigger1 = (StateType != A) && (Stateno = 20)
value = 2002

[State -1,����]
type = ChangeState
triggerall = (palno = [7,12])
triggerall = (Power > 999)
triggerall = (command = "syaori")
triggerall = (animtime < 2)
triggerall = (roundstate = 2)
triggerall = (var(21) = 0)
trigger1 = (movetype = H)
trigger2 = (StateNo = [150,153])
value = 2502

[State -1, �ǂ�]
type = ChangeState
triggerall = (palno = [7,12])
triggerall = (Power > 999)
triggerall = (command = "z")
triggerall = (roundstate = 2)
trigger1 = (StateType != A) && (movetype = H)
trigger2 = (StateType != A)
trigger2 = (StateNo = [150,153])
value = 2501

;------------------------------------------------------------------------------

;==============================================================================
; �ړ��֘A
;==============================================================================
;------------------------------------------------------------------------------

[State -1, ����]
type = ChangeState
triggerall = (StateNo != 100)
trigger1 = (command = "FF") && (StateType = S) && (Ctrl)
value = 100

[State -1, �o�b�N�X�e�b�v]
type = ChangeState
triggerall = (StateNo != 100)
trigger1 = (command = "BB") && (StateType = S) && (Ctrl)
value = 105
;==============================================================================
; �ʏ�U���Z
;==============================================================================
;------------------------------------------------------------------------------
[State -1, �`���b�v]
type = ChangeState
triggerall = (command = "back_y") && (command != "holddown")
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 270


[State -1, �������p���`]
type = ChangeState
triggerall = (command = "fwd_x") && (command != "holddown")
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 210


[State -1, ������p���`]
type = ChangeState
triggerall = (command = "x") && (command != "holddown")
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
trigger3 = (StateNo = 200) && (time > 8)
trigger4 = (StateNo = 200) && (MoveContact)
value = 200

[State -1, ���p���`]
type = ChangeState
triggerall = (command = "y") && (command != "holddown")
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 250

[State -1, ������L�b�N]
type = ChangeState
triggerall = (command = "a") && (command != "holddown")
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 230


[State -1, �������L�b�N]
type = ChangeState
triggerall = (command = "fwd_b") && (command != "holddown")
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 240


[State -1, �n�C�L�b�N]
type = ChangeState
triggerall = (command = "b") && (command != "holddown")
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 260


;------------------------------------------------------------------------------

[State -1, ���Ⴊ�ݎ�p���`]
type = ChangeState
triggerall = (command = "x") && (command = "holddown")
trigger1 = (StateType = C) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 400

[State -1, ���Ⴊ�݋��p���`]
type = ChangeState
triggerall = (command = "y") && (command = "holddown")
trigger1 = (StateType = C) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 410

[State -1, ���Ⴊ�ݎ�L�b�N]
type = ChangeState
triggerall = (command = "a") && (command = "holddown")
trigger1 = (StateType = C) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 430

[State -1, ���Ⴊ�݋��L�b�N]
type = ChangeState
triggerall = (command = "b") && (command = "holddown")
trigger1 = (StateType = C) && (Ctrl)
trigger2 = (StateNo = 1011) && (time > 6)
value = 440

;------------------------------------------------------------------------------

[State -1, �W�����v��p���`]
type = ChangeState
triggerall = (command = "x")
trigger1 = (StateType = A) && (Ctrl)
value = 600

[State -1, �W�����v���p���`]
type = ChangeState
triggerall = (command = "y")
trigger1 = (StateType = A) && (Ctrl)
value = 1090

[State -1, �W�����v��L�b�N]
type = ChangeState
triggerall = (command = "a")
trigger1 = (StateType = A) && (Ctrl)
value = 630

[State -1, �W�����v���L�b�N]
type = ChangeState
triggerall = (command = "b")
trigger1 = (StateType = A) && (Ctrl)
value = 640

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
