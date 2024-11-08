;;
;;
;;  ● インストール���@
;;
;;      展開�������tァイル群���emacs(mule) �����C-h v load-path RET
;;      �����������\ｦ�������Aディレクトリ�������������������������B
;;
;;      ｩ�����D�����fィレクトリ���������������A~/.emacs �����奄������;;      �������������������������fィレクトリ�������骼魔����\�����B
;;
;;      (setq load-path (append load-path (list "/home/my-path")))
;;
;;      次���A�����tァイル���~/.emacs �������������������B
;;      セミコロンで始�����Rメント行���A���怩����������������B
;;
;;
;;	● Ufm �����������������������H
;;
;;		ファイルマネージャ�����B要�������tァイル���Aコピー�������A���������;;		���A���k�������A���O�����������������������A���������������������@能
;;		���牛\気合���������������������B
;;
;;	● �����������N�����������H
;;
;;		f5 ���氓������������B
;;
;;	● ���������ﾄ使�����������H
;;
;;		Ic-Ufm.el �����������������B起���������A? ���氓����������������B
;;


;; �������������Aｩ�������������������������B

;(1) リターンキー�������Fｯ�������Lー�������������������B[RET] �����m���������B
(setq Ic-return-key [return])

;(2)(autoload 'Ufm "Ic-Ufm")���������キーバインド���������������������(load-library "Ic-Ufm")

;(3)サンプルマクロ(�������K当�������������
(setq Ufm-f2-file "~/Ufm-f2.macro")

;(4)�����tァイル
(setq Ufm-env-file "~/.Ufm-env"	)

;(5)f5 キー���N�������������������;(global-set-key [f5] 'Ufm)
(global-set-key [M-f12] 'Ufm)

;(6)キーバインド���������������X�������������(add-hook 'Ufm-hook (lambda ()
	(define-key Ufm-map			[(meta h)]			'Ufm-up				)	; Alt + h ���fィレクトリ���������	(define-key Ufm-map			[(meta j)]			'Ufm-return			)	; Alt + j ���{覧�����	(define-key Ufm-map			[(hyper ? )]		'Ufm-dir-menu		)	; Hyper + SPACE ���fィレクトリジャンプ�����	(define-key Ufm-map [f6]	(lambda ()(Ufm-macro "%TAGS"				; テクニカル�����狽��o録(�������l�������������
		(lambda (s)(setq Ic-keep-buffer (progn (w3-open-local (car s))(current-buffer)))(Ufm-quit)))))
	))

;(7)���D�����桙����ファイル���������Ufm �������������l�����������
;(define-key minibuffer-local-completion-map [tab] 'complate-filenamae)

;(8) Meadowの時�����Cygwin ���������������tァイル�����怩��梠����o来�������B適当�������������������B
;
(setq exec-path (append (list
;	"c:/Program Files/cygwin/cygwin-b20/H-i586-cygwin32/bin/"
	"c:/cygwin/bin/"
	)exec-path))
;
;���������A���������������捻ATH�������������������������������B（find 等で使用）
;win2000 �����A「システム���vロパティ」���u�����v���u�������煤v�����������APath�������������B

;(9) �������S���沚����Cンデックス�������������fィレクトリを指���������B
;
;mknmz /home/namazu
; �����Aインデックス���������������AC-f ���沚��級����netscape ���\ｦ�������B
;
;(setq Ufm-namazu-dir "/home/namazu")


;;★ ���������������������zームページ�����莱������B
;;
;;	http://www.d4.dion.ne.jp/~usuda/
;;
;;	mail::usuda@d4.dion.ne.jp
