;;
;;
;;  œ ƒCƒ“ƒXƒg[ƒ‹•ÿÿ@
;;
;;      “WŠJ‚ÿÿÿÿÿÿtƒ@ƒCƒ‹ŒQ‚ÿÿemacs(mule) ÿÿÿÿC-h v load-path RET
;;      ‚ÿÿÿÿÿÿÿÿÿÿ\¦‚ÿÿÿÿÿÿAƒfƒBƒŒƒNƒgƒŠ‚ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿB
;;
;;      ©•ÿÿÿÿD‚ÿÿÿÿfƒBƒŒƒNƒgƒŠ‚ÿÿÿÿÿÿÿÿÿÿÿÿÿÿA~/.emacs ‚ÿÿÿÿ‰‚ÿÿÿÿÿÿ;;      ‚ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿfƒBƒŒƒNƒgƒŠ‚ÿÿÿÿÿÿé–‚ÿÿÿÿ\‚ÿÿÿÿB
;;
;;      (setq load-path (append load-path (list "/home/my-path")))
;;
;;      Ÿ‚ÿÿA‚ÿÿÿÿtƒ@ƒCƒ‹‚ÿÿ~/.emacs ‚ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿB
;;      ƒZƒ~ƒRƒƒ“‚Ån‚ÿÿÿÿRƒƒ“ƒgs‚ÿÿAÿÿœ‚ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿB
;;
;;
;;	œ Ufm ‚ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿH
;;
;;		ƒtƒ@ƒCƒ‹ƒ}ƒl[ƒWƒƒ‚ÿÿÿÿB—v‚ÿÿÿÿÿÿtƒ@ƒCƒ‹‚ÿÿAƒRƒs[‚ÿÿÿÿÿÿAˆÿÿÿÿÿÿÿÿ;;		‚ÿÿAˆÿÿk‚ÿÿÿÿÿÿA–ÿÿO‚ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿA‚ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ@”\
;;		‚ÿÿ‹\‹C‡‚ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿB
;;
;;	œ ‚ÿÿÿÿÿÿÿÿÿÿN“ÿÿÿÿÿÿÿÿÿÿH
;;
;;		f5 ‚ÿÿŸ‚ÿÿÿÿÿÿÿÿÿÿÿÿB
;;
;;	œ ‚ÿÿÿÿÿÿÿÿÄg‚ÿÿÿÿÿÿÿÿÿÿH
;;
;;		Ic-Ufm.el ‚ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿB‹N“ÿÿÿÿÿÿÿÿA? ‚ÿÿŸ‚ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿB
;;


;; ˆÿÿÿÿÿÿÿÿÿÿÿÿA©•ÿÿÿÿÿÿÿÿÿÿ‡‚ÿÿÿÿÿÿÿÿÿÿÿÿB

;(1) ƒŠƒ^[ƒ“ƒL[‚ÿÿÿÿÿÿF¯‚ÿÿÿÿÿÿL[‚ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿB[RET] ‚ÿÿÿÿm‚ÿÿÿÿÿÿÿÿB
(setq Ic-return-key [return])

;(2)(autoload 'Ufm "Ic-Ufm")‚ÿÿÿÿÿÿÿÿƒL[ƒoƒCƒ“ƒh‚ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ(load-library "Ic-Ufm")

;(3)ƒTƒ“ƒvƒ‹ƒ}ƒNƒ(‚ÿÿÿÿÿÿK“–‚ÿÿÿÿÿÿÿÿÿÿÿÿ
(setq Ufm-f2-file "~/Ufm-f2.macro")

;(4)Šÿÿÿÿtƒ@ƒCƒ‹
(setq Ufm-env-file "~/.Ufm-env"	)

;(5)f5 ƒL[‚ÿÿN“ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ;(global-set-key [f5] 'Ufm)
(global-set-key [M-f12] 'Ufm)

;(6)ƒL[ƒoƒCƒ“ƒh‚ÿÿÿÿÿÿÿÿÿÿÿÿÿÿX‚ÿÿÿÿÿÿÿÿÿÿÿÿ(add-hook 'Ufm-hook (lambda ()
	(define-key Ufm-map			[(meta h)]			'Ufm-up				)	; Alt + h ‚ÿÿfƒBƒŒƒNƒgƒŠ‚ÿÿÿÿÿÿÿÿ	(define-key Ufm-map			[(meta j)]			'Ufm-return			)	; Alt + j ‚ÿÿ{——‚ÿÿÿÿ	(define-key Ufm-map			[(hyper ? )]		'Ufm-dir-menu		)	; Hyper + SPACE ‚ÿÿfƒBƒŒƒNƒgƒŠƒWƒƒƒ“ƒv‚ÿÿÿÿ	(define-key Ufm-map [f6]	(lambda ()(Ufm-macro "%TAGS"				; ƒeƒNƒjƒJƒ‹‚ÿÿÿÿ”‚ÿÿo˜^(•ÿÿÿÿÿÿl‚ÿÿÿÿÿÿÿÿÿÿÿÿ
		(lambda (s)(setq Ic-keep-buffer (progn (w3-open-local (car s))(current-buffer)))(Ufm-quit)))))
	))

;(7)‚ÿÿD‚ÿÿÿÿ‚ÿÿÿÿƒtƒ@ƒCƒ‹–ÿÿÿÿÿÿÿÿUfm ‚ÿÿÿÿÿÿÿÿÿÿÿÿl‚ÿÿÿÿÿÿÿÿÿÿ
;(define-key minibuffer-local-completion-map [tab] 'complate-filenamae)

;(8) Meadow‚Ì‚ÿÿÿÿCygwin ‚ÿÿÿÿÿÿÿÿÿÿÿÿÿÿtƒ@ƒCƒ‹‚ÿÿÿÿœ‚ÿÿ‘ÿÿÿÿo—ˆ‚ÿÿÿÿÿÿB“K“–‚ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿB
;
(setq exec-path (append (list
;	"c:/Program Files/cygwin/cygwin-b20/H-i586-cygwin32/bin/"
	"c:/cygwin/bin/"
	)exec-path))
;
;‚ÿÿÿÿÿÿÿÿA‚ÿÿÿÿÿÿÿÿÿÿÿÿÿÿ”PATH‚ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿBifind “™‚Åg—pj
;win2000 ‚ÿÿÿÿAuƒVƒXƒeƒ€‚ÿÿvƒƒpƒeƒBv‚ÿÿuÿÿÿÿv‚ÿÿuŠÿÿÿÿÿÿ”v‚ÿÿ ‚ÿÿÿÿÿÿAPath‚ÿÿÿÿÿÿÿÿÿÿÿÿB

;(9) ‚ÿÿÿÿÿÿS•ÿÿŸÿÿÿÿCƒ“ƒfƒbƒNƒX‚ÿÿÿÿÿÿÿÿÿÿÿÿfƒBƒŒƒNƒgƒŠ‚ğw’ÿÿÿÿÿÿÿÿB
;
;mknmz /home/namazu
; ‚ÿÿÿÿAƒCƒ“ƒfƒbƒNƒX‚ÿÿÿÿÿÿÿÿÿÿÿÿÿÿAC-f ‚ÿÿŸÿÿ‹‰ÿÿÿÿnetscape ‚ÿÿ\¦‚ÿÿÿÿÿÿB
;
;(setq Ufm-namazu-dir "/home/namazu")


;;š ‹ÿÿÿÿÿÿÿÿ ‚ÿÿÿÿÿÿÿÿÿÿz[ƒ€ƒy[ƒW‚ÿÿÿÿ—‰ÿÿÿÿÿÿB
;;
;;	http://www.d4.dion.ne.jp/~usuda/
;;
;;	mail::usuda@d4.dion.ne.jp
