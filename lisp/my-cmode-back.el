    (c-offsets-alist . (
			 
			 (string                . c-lineup-dont-change) ;;�����s�����������������B  
			 (c                     . c-lineup-C-comments);;�����s������������l����u���b�N�R�����g�B  
			 ) "Myr Programming Style") ;; �X�^�C�����


			 (defun-open            . 0);;�������`���J�����J�b�R�B  
			 (defun-close           . 0);;�������`�����������J�b�R�B  
			 (defun-block-intro     . +);;�������efun���������s�B  
			 (class-open            . 0);;�N���X���`���J�����J�b�R�B  
			 (class-close           . 0);;�N���X���`�����������J�b�R�B  
			 
			 
;			 (inline-open           . +);�N���X���C�����C�����\�b�h���J�����J�b�R�B  
			 (inline-open           . 0);�N���X���C�����C�����\�b�h���J�����J�b�R�B  
			 (inline-close          . 0);�N���X���C�����C�����\�b�h�����������J�b�R�B  
			 
			 
;			 (func-decl-cont        . +);�������`���������X�g�������������efun���J�����J�b�R(K&R�������`��������B C�������������������R�����g���O�����������������������������BC++���ava���������������hrows���������������������������������B 
			 (func-decl-cont 	. c-lineup-java-throws)
;			 (knr-argdecl-intro     . +) ;K&R����������`���������s�B 
			 (knr-argdecl-intro     . -) ;K&R����������`���������s�B 
			 (knr-argdecl           . 0);K&R����������`����������s�B  
			 (topmost-intro         . 0);���������\���v�f���`���������s�B  
			 (topmost-intro-cont    . 0);�����������`���p���s�B  
			 (member-init-intro     . +); �����o���������X�g���������s�B  
			 (member-init-cont      . 0); �����o���������X�g���p���s�B  
			 (inher-intro           . +); ���d�p�����X�g���������s�B  
;			 (inher-cont            . c-lineup-multi-inher) ; ���d�p�����p���s�B  
			 (inher-cont     	. c-lineup-java-inher)


			 (block-open            . -); �X�e�[�g�����g�u���b�N���J�����J�b�R�B  
			 (block-close           . 0); �X�e�[�g�����g�u���b�N�����������J�b�R�B  
			 (brace-list-open       . 0);enum���tatic�z�����X�g���J�����J�b�R�B  
			 (brace-list-close      . 0); enum���tatic�z�����X�g���������J�b�R�B  
			 (brace-list-intro      . +); enum���tatic�z�����X�g���������s�B  
			 (brace-list-entry      . 0); enum���tatic�z�����X�g���p���s�B  
			 (brace-entry-open      . 0); �J�������Ŏn�����enum���tatic �z�����p���s
			 (statement             . 0); �������X�e�[�g�����g�B 
			 ;; some people might prefer
			 ;;(statement             . c-lineup-runin-statements)
			 (statement-cont        . +); �X�e�[�g�����g���p���s�B 
			 ;; some people might prefer
			 ;;(statement-cont        . c-lineup-math)
			 
			 
			 
			 (statement-block-intro . +);�V�����X�e�[�g�����g�u���b�N�����������s�B  
			 (statement-case-intro  . +); case"�u���b�N"�����������s�B  
			 (statement-case-open   . 0); ���J�b�R�Ŏn�����ase�u���b�N�����������s�B  
			 (substatement          . +); if, while, for, do, else�������������s�B  
			 (substatement-open     . +); substatement�u���b�N���J�����J�b�R�B  
			 (case-label            . 0); case���efault���x���B  
			 (access-label          . -); C++���rivate, protected, public�A�N�Z�X�������x���B  
			 (label                 . 2); ���������x���B 
			 (do-while-closure      . 0); do-while���I���hile�\���v�f�B  
			 (else-clause           . 0); if-else�\���v�f���lse�B  
			 (catch-clause          . 0); try/catch �����'catch' ���finally'
			 (comment-intro         . c-lineup-comment) ; �R�����g�����������������s�B  
			 (arglist-intro         . +); �������X�g�����������s�B 
			 (arglist-cont          . 0); �������X�g���J�����J�b�R�������s�������������������������������X�g���p���s����s�B  
			 (arglist-cont-nonempty . c-lineup-arglist); �������X�g���J���J�b�R�������s������������������������������������X�g���p���s����s�B  
;			 (arglist-close         . +) ; �������X�g�������J�b�R�B  
 			 (arglist-close  	. c-lineup-arglist)
			 (stream-op             . c-lineup-streamop); �X�g���[���I�y���[�^�R���X�g���N�^���p���s�B  
			 (inclass               . +); �N���X���`�����l�X�g�����R���X�g���N�^�B  
			 (cpp-macro             . -1000) ; cpp�}�N���̎n�����B 
			 (cpp-macro-cont        . c-lineup-dont-change)
			 (friend                . 0); C++���riend���`�B 
			 (objc-method-intro     . -1000); �I�u�W�F�N�e�B�uC�����\�b�h���`���������s�B  
			 (objc-method-args-cont . c-lineup-ObjC-method-args); �I�u�W�F�N�e�B�uC�����\�b�h���`���p���s�B  
			 (objc-method-call-cont . c-lineup-ObjC-method-call); �I�u�W�F�N�e�B�uC�����\�b�h�����o���������s�B  
			 (extern-lang-open      . 0); �O�������u���b�N���J�����J�b�R�B  
			 (extern-lang-close     . 0); �O�������u���b�N�����������J�b�R�B  
			 (inextern-lang         . +); �O�������u���b�N�������l�X�g�����R���X�g���N�^�B  
			 (namespace-open        . 0); c++ namespace ���J�n
			 (namespace-close       . 0); c++ namespace ���I���			 (innamespace           . +); inextern-lang�Ɏ����������Anamespace�p,, 
			 (template-args-cont    . +); template �������p���s..
			 (inlambda              . c-lineup-inexpr-block); lamda �������w�b�_�A�����������g
			 (lambda-intro-cont     . +); lambda �������w�b�_���p���s..
			 (inexpr-statement      . 0); ����xpression�������������
			 (inexpr-class          . +); class ���expression�������������
