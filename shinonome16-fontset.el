;;; -*- coding: iso-2022-7bit -*-

(w32-auto-regist-bdf-font
 "shinonome16-ascii"
 "c:/bdffont/shinonome/bdf/shnm8x16a.bdf" 0)
(w32-change-font-logfont
 "shinonome16-ascii" 1 ; bold
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm8x16ab.bdf"))
(w32-change-font-logfont
 "shinonome16-ascii" 2 ; italic
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm8x16ai.bdf"))
(w32-change-font-logfont
 "shinonome16-ascii" 3 ; bold-italic
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm8x16abi.bdf"))

(w32-auto-regist-bdf-font
 "shinonome16-latin-iso8859-1" 
 "c:/bdffont/shinonome/bdf/shnm8x16a.bdf" 1)
(w32-change-font-logfont
 "shinonome16-latin-iso8859-1" 1
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm8x16ab.bdf"))
(w32-change-font-logfont
 "shinonome16-latin-iso8859-1" 2
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm8x16ai.bdf"))
(w32-change-font-logfont
 "shinonome16-latin-iso8859-1" 3
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm8x16abi.bdf"))

(w32-auto-regist-bdf-font
 "shinonome16-latin-jisx0201"
 "c:/bdffont/shinonome/bdf/shnm8x16r.bdf" 0)
(w32-change-font-logfont
 "shinonome16-latin-jisx0201" 1
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm8x16rb.bdf"))
(w32-change-font-logfont
 "shinonome16-latin-jisx0201" 2
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm8x16ri.bdf"))
(w32-change-font-logfont
 "shinonome16-latin-jisx0201" 3
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm8x16rbi.bdf"))

(w32-auto-regist-bdf-font 
 "shinonome16-katakana-jisx0201" 
 "c:/bdffont/shinonome/bdf/shnm8x16r.bdf" 1)
(w32-change-font-logfont
 "shinonome16-katakana-jisx0201" 1
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm8x16rb.bdf"))
(w32-change-font-logfont
 "shinonome16-katakana-jisx0201" 2
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm8x16ri.bdf"))
(w32-change-font-logfont
 "shinonome16-katakana-jisx0201" 3
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm8x16rbi.bdf"))

(w32-auto-regist-bdf-font
 "shinonome16-japanese-jisx0208" 
 "c:/bdffont/shinonome/bdf/shnmk16.bdf" 0)
(w32-change-font-logfont
 "shinonome16-japanese-jisx0208" 1
 '(bdf-font "c:/bdffont/shinonome/bdf/shnmk16b.bdf"))
(w32-change-font-logfont
 "shinonome16-japanese-jisx0208" 2
 '(bdf-font "c:/bdffont/shinonome/bdf/shnmk16i.bdf"))
(w32-change-font-logfont
 "shinonome16-japanese-jisx0208" 3
 '(bdf-font "c:/bdffont/shinonome/bdf/shnmk16bi.bdf"))

; JISX0212
; (w32-auto-regist-bdf-font
;  "shinonome16-japanese-jisx0212" 
;  "c:/Meadow/fonts/bdf/intlfonts-1.2/Japanese/jksp16.bdf" 0)


;;;
(new-fontset "shinonome16-fontset" 
	     '((ascii . "shinonome16-ascii")
	       (latin-iso8859-1 . "shinonome16-latin-iso8859-1")
	       (latin-jisx0201    . "shinonome16-latin-jisx0201")
	       (katakana-jisx0201 . "shinonome16-katakana-jisx0201")
	       (japanese-jisx0208 . "shinonome16-japanese-jisx0208")
;	       (japanese-jisx0212 . "shinonome16-japanese-jisx0212")
	       ))


;;; Mincho(shinonome16min)
(w32-auto-regist-bdf-font
 "shinonome16min-japanese-jisx0208" 
 "c:/bdffont/shinonome/bdf/shnmk16min.bdf" 0)
(w32-change-font-logfont
 "shinonome16min-japanese-jisx0208" 1
 '(bdf-font "c:/bdffont/shinonome/bdf/shnmk16minb.bdf"))
(w32-change-font-logfont
 "shinonome16min-japanese-jisx0208" 2
 '(bdf-font "c:/bdffont/shinonome/bdf/shnmk16mini.bdf"))
(w32-change-font-logfont
 "shinonome16min-japanese-jisx0208" 3
 '(bdf-font "c:/bdffont/shinonome/bdf/shnmk16minbi.bdf"))

;;;
(new-fontset "shinonome16min-fontset" 
	     '((ascii . "shinonome16-ascii")
	       (latin-iso8859-1 . "shinonome16-latin-iso8859-1")
	       (latin-jisx0201    . "shinonome16-latin-jisx0201")
	       (katakana-jisx0201 . "shinonome16-katakana-jisx0201")
	       (japanese-jisx0208 . "shinonome16min-japanese-jisx0208") ; 
;	       (japanese-jisx0212 . "shinonome16-japanese-jisx0212")
	       ))


;; End of File
