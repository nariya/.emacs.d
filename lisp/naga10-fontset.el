;;; -*- coding: iso-2022-7bit -*-

;;;
;;; naga10-fontset.el
;;;


;;; �������t�@�C�� ~/.emacs �Ɏ��̂悤�ɏ����Ă��������B
;;;
;;; (load "~/�ǂ���/naga10-fontset")
;;;
;;; (setq default-frame-alist
;;;       (append (list
;;;               '(font . "naga10-fontset")
;;;                )
;;;               default-frame-alist))


;;; �t�H���g�̓����ȂǁA�ڂ������ɂ��Ă�
;;;
;;;     http://kawacho.don.am/win/meadow/
;;;
;;; ���������������B


;;; ascii
(w32-auto-regist-bdf-font
 "naga10-ascii"
 "C:/bdffont/naga10/5x10a.bdf" 0)
; (w32-change-font-logfont
;  "naga10-ascii" 1 ; bold
;  '(bdf-font "C:/bdffont/naga10/5x10ab.bdf")) ; 5x10B.bdf
; (w32-change-font-logfont
;  "naga10-ascii" 2 ; italic
;  '(bdf-font "C:/bdffont/naga10/5x10ai.bdf"))
; (w32-change-font-logfont
;  "naga10-ascii" 3 ; bold-italic
;  '(bdf-font "C:/bdffont/naga10/5x10abi.bdf"))

;;; latin-iso8859-1
(w32-auto-regist-bdf-font
 "naga10-latin-iso8859-1" 
 "C:/bdffont/naga10/5x10a.bdf" 1)
; (w32-change-font-logfont
;  "naga10-latin-iso8859-1" 1
;  '(bdf-font "C:/bdffont/naga10/5x10ab.bdf")) ; 5x10B.bdf
; (w32-change-font-logfont
;  "naga10-latin-iso8859-1" 2
;  '(bdf-font "C:/bdffont/naga10/5x10ai.bdf"))
; (w32-change-font-logfont
;  "naga10-latin-iso8859-1" 3
;  '(bdf-font "C:/bdffont/naga10/5x10abi.bdf"))

;;; latin-jisx0201
(w32-auto-regist-bdf-font
 "naga10-latin-jisx0201"
 "C:/bdffont/naga10/5x10rk.bdf" 0)
; (w32-change-font-logfont
;  "naga10-latin-jisx0201" 1
;  '(bdf-font "C:/bdffont/naga10/5x10rkb.bdf"))
; (w32-change-font-logfont
;  "naga10-latin-jisx0201" 2
;  '(bdf-font "C:/bdffont/naga10/5x10rki.bdf"))
; (w32-change-font-logfont
;  "naga10-latin-jisx0201" 3
;  '(bdf-font "C:/bdffont/naga10/5x10rkbi.bdf"))

;;; katakana-jisx0201
(w32-auto-regist-bdf-font 
 "naga10-katakana-jisx0201" 
 "C:/bdffont/naga10/5x10rk.bdf" 1)
; (w32-change-font-logfont
;  "naga10-katakana-jisx0201" 1
;  '(bdf-font "C:/bdffont/naga10/5x10rkb.bdf"))
; (w32-change-font-logfont
;  "naga10-katakana-jisx0201" 2
;  '(bdf-font "C:/bdffont/naga10/5x10rki.bdf"))
; (w32-change-font-logfont
;  "naga10-katakana-jisx0201" 3
;  '(bdf-font "C:/bdffont/naga10/5x10rkbi.bdf"))

;;; japanese-jisx0208
(w32-auto-regist-bdf-font
 "naga10-japanese-jisx0208" 
 "C:/bdffont/naga10/knj10.bdf" 0)
; (w32-change-font-logfont
;  "naga10-japanese-jisx0208" 1
;  '(bdf-font "C:/bdffont/naga10/knj10b.bdf"))
; (w32-change-font-logfont
;  "naga10-japanese-jisx0208" 2
;  '(bdf-font "C:/bdffont/naga10/knj10i.bdf"))
; (w32-change-font-logfont
;  "naga10-japanese-jisx0208" 3
;  '(bdf-font "C:/bdffont/naga10/knj10bi.bdf"))



;;; naga10-fontset
(new-fontset "naga10-fontset" 
	     '((ascii             . "naga10-ascii")
	       (latin-iso8859-1   . "naga10-latin-iso8859-1")
	       (latin-jisx0201    . "naga10-latin-jisx0201")
	       (katakana-jisx0201 . "naga10-katakana-jisx0201")
	       (japanese-jisx0208 . "naga10-japanese-jisx0208")
	       ))


;; End of File
