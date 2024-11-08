;;
;;
;;  �� �C���X�g�[�����@
;;
;;      �W�J�������t�@�C���Q���emacs(mule) �����C-h v load-path RET
;;      �����������\��������A�f�B���N�g���������������������������B
;;
;;      ������D�����f�B���N�g�����������������A~/.emacs �������������;;      �������������������������f�B���N�g���������鎖�����\�����B
;;
;;      (setq load-path (append load-path (list "/home/my-path")))
;;
;;      �����A�����t�@�C�����~/.emacs �������������������B
;;      �Z�~�R�����Ŏn�����R�����g�s���A���������������������B
;;
;;
;;	�� Ufm �����������������������H
;;
;;		�t�@�C���}�l�[�W�������B�v�������t�@�C�����A�R�s�[�������A���������;;		���A���k�������A���O�����������������������A���������������������@�\
;;		�����\�C�����������������������B
;;
;;	�� �����������N�����������H
;;
;;		f5 �����������������B
;;
;;	�� ���������Ďg�����������H
;;
;;		Ic-Ufm.el �����������������B�N���������A? ���������������������B
;;


;; �������������A��������������������������B

;(1) ���^�[���L�[�������F��������L�[�������������������B[RET] �����m���������B
(setq Ic-return-key [return])

;(2)(autoload 'Ufm "Ic-Ufm")����������L�[�o�C���h���������������������(load-library "Ic-Ufm")

;(3)�T���v���}�N��(�������K���������������
(setq Ufm-f2-file "~/Ufm-f2.macro")

;(4)�����t�@�C��
(setq Ufm-env-file "~/.Ufm-env"	)

;(5)f5 �L�[���N�������������������;(global-set-key [f5] 'Ufm)
(global-set-key [M-f12] 'Ufm)

;(6)�L�[�o�C���h���������������X�������������(add-hook 'Ufm-hook (lambda ()
	(define-key Ufm-map			[(meta h)]			'Ufm-up				)	; Alt + h ���f�B���N�g�����������	(define-key Ufm-map			[(meta j)]			'Ufm-return			)	; Alt + j ���{�������	(define-key Ufm-map			[(hyper ? )]		'Ufm-dir-menu		)	; Hyper + SPACE ���f�B���N�g���W�����v�����	(define-key Ufm-map [f6]	(lambda ()(Ufm-macro "%TAGS"				; �e�N�j�J�����������o�^(�������l�������������
		(lambda (s)(setq Ic-keep-buffer (progn (w3-open-local (car s))(current-buffer)))(Ufm-quit)))))
	))

;(7)���D������������t�@�C�����������Ufm �������������l�����������
;(define-key minibuffer-local-completion-map [tab] 'complate-filenamae)

;(8) Meadow�̎������Cygwin ���������������t�@�C�����������������o���������B�K���������������������B
;
(setq exec-path (append (list
;	"c:/Program Files/cygwin/cygwin-b20/H-i586-cygwin32/bin/"
	"c:/cygwin/bin/"
	)exec-path))
;
;���������A����������������PATH�������������������������������B�ifind ���Ŏg�p�j
;win2000 �����A�u�V�X�e�����v���p�e�B�v���u�����v���u���������v�����������APath�������������B

;(9) �������S���������C���f�b�N�X�������������f�B���N�g�����w���������B
;
;mknmz /home/namazu
; �����A�C���f�b�N�X���������������AC-f �������������netscape ���\��������B
;
;(setq Ufm-namazu-dir "/home/namazu")


;;�� ���������������������z�[���y�[�W�������������B
;;
;;	http://www.d4.dion.ne.jp/~usuda/
;;
;;	mail::usuda@d4.dion.ne.jp
