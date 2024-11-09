;;; -*- coding: iso-2022-7bit -*-

(w32-auto-regist-bdf-font
 "shinonome14-ascii"
 "c:/bdffont/shinonome/bdf/shnm7x14a.bdf" 0)
(w32-change-font-logfont
 "shinonome14-ascii" 1 ; bold
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm7x14ab.bdf"))
(w32-change-font-logfont
 "shinonome14-ascii" 2 ; italic
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm7x14ai.bdf"))
(w32-change-font-logfont
 "shinonome14-ascii" 3 ; bold-italic
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm7x14abi.bdf"))

(w32-auto-regist-bdf-font
 "shinonome14-latin-iso8859-1" 
 "c:/bdffont/shinonome/bdf/shnm7x14a.bdf" 1)
(w32-change-font-logfont
 "shinonome14-latin-iso8859-1" 1
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm7x14ab.bdf"))
(w32-change-font-logfont
 "shinonome14-latin-iso8859-1" 2
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm7x14ai.bdf"))
(w32-change-font-logfont
 "shinonome14-latin-iso8859-1" 3
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm7x14abi.bdf"))

(w32-auto-regist-bdf-font
 "shinonome14-latin-jisx0201"
 "c:/bdffont/shinonome/bdf/shnm7x14r.bdf" 0)
(w32-change-font-logfont
 "shinonome14-latin-jisx0201" 1
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm7x14rb.bdf"))
(w32-change-font-logfont
 "shinonome14-latin-jisx0201" 2
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm7x14ri.bdf"))
(w32-change-font-logfont
 "shinonome14-latin-jisx0201" 3
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm7x14rbi.bdf"))

(w32-auto-regist-bdf-font 
 "shinonome14-katakana-jisx0201" 
 "c:/bdffont/shinonome/bdf/shnm7x14r.bdf" 1)
(w32-change-font-logfont
 "shinonome14-katakana-jisx0201" 1
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm7x14rb.bdf"))
(w32-change-font-logfont
 "shinonome14-katakana-jisx0201" 2
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm7x14ri.bdf"))
(w32-change-font-logfont
 "shinonome14-katakana-jisx0201" 3
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm7x14rbi.bdf"))

(w32-auto-regist-bdf-font
 "shinonome14-japanese-jisx0208" 
 "c:/bdffont/shinonome/bdf/shnmk14.bdf" 0)
(w32-change-font-logfont
 "shinonome14-japanese-jisx0208" 1
 '(bdf-font "c:/bdffont/shinonome/bdf/shnmk14b.bdf"))
(w32-change-font-logfont
 "shinonome14-japanese-jisx0208" 2
 '(bdf-font "c:/bdffont/shinonome/bdf/shnmk14i.bdf"))
(w32-change-font-logfont
 "shinonome14-japanese-jisx0208" 3
 '(bdf-font "c:/bdffont/shinonome/bdf/shnmk14bi.bdf"))


;;;
(new-fontset "shinonome14-fontset" 
	     '((ascii . "shinonome14-ascii")
	       (latin-iso8859-1 . "shinonome14-latin-iso8859-1")
	       (latin-jisx0201    . "shinonome14-latin-jisx0201")
	       (katakana-jisx0201 . "shinonome14-katakana-jisx0201")
	       (japanese-jisx0208 . "shinonome14-japanese-jisx0208")
	       ))


;;; Mincho(shinonome14min)
(w32-auto-regist-bdf-font
 "shinonome14min-japanese-jisx0208" 
 "c:/bdffont/shinonome/bdf/shnmk14min.bdf" 0)
(w32-change-font-logfont
 "shinonome14min-japanese-jisx0208" 1
 '(bdf-font "c:/bdffont/shinonome/bdf/shnmk14minb.bdf"))
(w32-change-font-logfont
 "shinonome14min-japanese-jisx0208" 2
 '(bdf-font "c:/bdffont/shinonome/bdf/shnmk14mini.bdf"))
(w32-change-font-logfont
 "shinonome14min-japanese-jisx0208" 3
 '(bdf-font "c:/bdffont/shinonome/bdf/shnmk14minbi.bdf"))

;;;
(new-fontset "shinonome14min-fontset" 
	     '((ascii . "shinonome14-ascii")
	       (latin-iso8859-1 . "shinonome14-latin-iso8859-1")
	       (latin-jisx0201    . "shinonome14-latin-jisx0201")
	       (katakana-jisx0201 . "shinonome14-katakana-jisx0201")
	       (japanese-jisx0208 . "shinonome14min-japanese-jisx0208") ;
	       ))


;; End of File
