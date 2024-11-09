;;; -*- coding: iso-2022-7bit -*-

(w32-auto-regist-bdf-font
 "shinonome12-ascii"
 "c:/bdffont/shinonome/bdf/shnm6x12a.bdf" 0)
(w32-change-font-logfont
 "shinonome12-ascii" 1 ; bold
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm6x12ab.bdf"))
(w32-change-font-logfont
 "shinonome12-ascii" 2 ; italic
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm6x12ai.bdf"))
(w32-change-font-logfont
 "shinonome12-ascii" 3 ; bold-italic
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm6x12abi.bdf"))

(w32-auto-regist-bdf-font
 "shinonome12-latin-iso8859-1" 
 "c:/bdffont/shinonome/bdf/shnm6x12a.bdf" 1)
(w32-change-font-logfont
 "shinonome12-latin-iso8859-1" 1
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm6x12ab.bdf"))
(w32-change-font-logfont
 "shinonome12-latin-iso8859-1" 2
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm6x12ai.bdf"))
(w32-change-font-logfont
 "shinonome12-latin-iso8859-1" 3
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm6x12abi.bdf"))

(w32-auto-regist-bdf-font
 "shinonome12-latin-jisx0201"
 "c:/bdffont/shinonome/bdf/shnm6x12r.bdf" 0)
(w32-change-font-logfont
 "shinonome12-latin-jisx0201" 1
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm6x12rb.bdf"))
(w32-change-font-logfont
 "shinonome12-latin-jisx0201" 2
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm6x12ri.bdf"))
(w32-change-font-logfont
 "shinonome12-latin-jisx0201" 3
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm6x12rbi.bdf"))

(w32-auto-regist-bdf-font 
 "shinonome12-katakana-jisx0201" 
 "c:/bdffont/shinonome/bdf/shnm6x12r.bdf" 1)
(w32-change-font-logfont
 "shinonome12-katakana-jisx0201" 1
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm6x12rb.bdf"))
(w32-change-font-logfont
 "shinonome12-katakana-jisx0201" 2
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm6x12ri.bdf"))
(w32-change-font-logfont
 "shinonome12-katakana-jisx0201" 3
 '(bdf-font "c:/bdffont/shinonome/bdf/shnm6x12rbi.bdf"))

(w32-auto-regist-bdf-font
 "shinonome12-japanese-jisx0208" 
 "c:/bdffont/shinonome/bdf/shnmk12.bdf" 0)
(w32-change-font-logfont
 "shinonome12-japanese-jisx0208" 1
 '(bdf-font "c:/bdffont/shinonome/bdf/shnmk12b.bdf"))
(w32-change-font-logfont
 "shinonome12-japanese-jisx0208" 2
 '(bdf-font "c:/bdffont/shinonome/bdf/shnmk12i.bdf"))
(w32-change-font-logfont
 "shinonome12-japanese-jisx0208" 3
 '(bdf-font "c:/bdffont/shinonome/bdf/shnmk12bi.bdf"))


;;;
(new-fontset "shinonome12-fontset" 
	     '((ascii . "shinonome12-ascii")
	       (latin-iso8859-1 . "shinonome12-latin-iso8859-1")
	       (latin-jisx0201    . "shinonome12-latin-jisx0201")
	       (katakana-jisx0201 . "shinonome12-katakana-jisx0201")
	       (japanese-jisx0208 . "shinonome12-japanese-jisx0208")
	       ))


;;; Mincho(shinonome12min)
(w32-auto-regist-bdf-font
 "shinonome12min-japanese-jisx0208" 
 "c:/bdffont/shinonome/bdf/shnmk12min.bdf" 0)
(w32-change-font-logfont
 "shinonome12min-japanese-jisx0208" 1
 '(bdf-font "c:/bdffont/shinonome/bdf/shnmk12minb.bdf"))
(w32-change-font-logfont
 "shinonome12min-japanese-jisx0208" 2
 '(bdf-font "c:/bdffont/shinonome/bdf/shnmk12mini.bdf"))
(w32-change-font-logfont
 "shinonome12min-japanese-jisx0208" 3
 '(bdf-font "c:/bdffont/shinonome/bdf/shnmk12minbi.bdf"))

;;;
(new-fontset "shinonome12min-fontset" 
	     '((ascii . "shinonome12-ascii")
	       (latin-iso8859-1 . "shinonome12-latin-iso8859-1")
	       (latin-jisx0201    . "shinonome12-latin-jisx0201")
	       (katakana-jisx0201 . "shinonome12-katakana-jisx0201")
	       (japanese-jisx0208 . "shinonome12min-japanese-jisx0208") ;
	       ))


;;; Marumoji(shinonome12maru)
(w32-auto-regist-bdf-font
 "shinonome12maru-japanese-jisx0208" 
 "c:/bdffont/shinonome/bdf/shnmk12maru.bdf" 0)
(w32-change-font-logfont
 "shinonome12maru-japanese-jisx0208" 1
 '(bdf-font "c:/bdffont/shinonome/bdf/shnmk12marub.bdf"))
(w32-change-font-logfont
 "shinonome12maru-japanese-jisx0208" 2
 '(bdf-font "c:/bdffont/shinonome/bdf/shnmk12marui.bdf"))
(w32-change-font-logfont
 "shinonome12maru-japanese-jisx0208" 3
 '(bdf-font "c:/bdffont/shinonome/bdf/shnmk12marubi.bdf"))

;;;
(new-fontset "shinonome12maru-fontset" 
	     '((ascii . "shinonome12-ascii")
	       (latin-iso8859-1 . "shinonome12-latin-iso8859-1")
	       (latin-jisx0201    . "shinonome12-latin-jisx0201")
	       (katakana-jisx0201 . "shinonome12-katakana-jisx0201")
	       (japanese-jisx0208 . "shinonome12maru-japanese-jisx0208") ; 
	       ))


;; End of File
