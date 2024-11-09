;;==============================================
;;
;;
;;		fontset-meadow.el
;;
;;
;;----------------------------------------------
;; Time-stamp: <1998-07-04 02:57:04 Administrator>
;; Description : 
;; Compiler    : 
;; Host        : 
;; Release     : 
;;----------------------------------------------
;;  version   date       comment           by
;;----------------------------------------------
;;  0.00                                  mfuse
;;==============================================

(cond
 ((eq window-system 'w32)
   
  
  ;;------------------------------------------
  ;; Gothic-16
  ;;
  (let ((font "Gothic-16"))
    (w32-add-font font
		  '((encoding-type . 4)
		    (charset-num . 0)
		    (overhang . 0)
		    (base . 14)
		    (height . 16)
		    (width . 8)))
    (w32-change-font-logfont 
     font 0 
     '(w32-logfont "ÇlÇr ÉSÉVÉbÉN" 0 -16 400 0 nil nil nil 128 1 3 49))
    (w32-change-font-logfont 
     font 1 
     '(w32-logfont "ÇlÇr ÉSÉVÉbÉN" 0 -16 700 0 nil nil nil 128 1 3 49))
    (w32-change-font-logfont 
     font 2 
     '(w32-logfont "ÇlÇr ÉSÉVÉbÉN" 0 -16 400 0 nil nil nil 128 1 3 49))
    (w32-change-font-logfont 
     font 3 
     '(w32-logfont "ÇlÇr ÉSÉVÉbÉN" 0 -16 700 0 nil nil nil 128 1 3 49)))
  
  ;;------------------------------------------
  ;; Gothic-14
  ;;
  (let ((font "Gothic-14"))
    (w32-add-font font
		  '((encoding-type . 4)
		    (charset-num . 0)
		    (overhang . 0)
		    (base . 12)
		    (height . 14)
		    (width . 7)))
    (w32-change-font-logfont 
     font 0 
     '(w32-logfont "ÇlÇr ÉSÉVÉbÉN" 0 -14 400 0 nil nil nil 128 1 3 49))
    (w32-change-font-logfont 
     font 1 
     '(w32-logfont "ÇlÇr ÉSÉVÉbÉN" 0 -14 700 0 nil nil nil 128 1 3 49))
    (w32-change-font-logfont 
     font 2 
     '(w32-logfont "ÇlÇr ÉSÉVÉbÉN" 0 -14 400 0 nil nil nil 128 1 3 49))
    (w32-change-font-logfont 
     font 3 
     '(w32-logfont "ÇlÇr ÉSÉVÉbÉN" 0 -14 700 0 nil nil nil 128 1 3 49)))
  
  ;;------------------------------------------
  ;; Gothic-13
  ;;
  (let ((font "Gothic-13"))
    (w32-add-font font
		  '((encoding-type . 4)
		    (charset-num . 0)
		    (overhang . 0)
		    (base . 11)
		    (height . 13)
		    (width . 7)))
    (w32-change-font-logfont 
     font 0 
     '(w32-logfont "ÇlÇr ÉSÉVÉbÉN" 0 -13 400 0 nil nil nil 128 1 3 49))
    (w32-change-font-logfont 
     font 1 
     '(w32-logfont "ÇlÇr ÉSÉVÉbÉN" 0 -13 700 0 nil nil nil 128 1 3 49))
    (w32-change-font-logfont 
     font 2 
     '(w32-logfont "ÇlÇr ÉSÉVÉbÉN" 0 -13 400 0 nil nil nil 128 1 3 49))
    (w32-change-font-logfont 
     font 3 
     '(w32-logfont "ÇlÇr ÉSÉVÉbÉN" 0 -13 700 0 nil nil nil 128 1 3 49)))
  
  ;;-----------------------------------------
  ;; Gothic-12
  ;;
  (let ((font "Gothic-12"))
    (w32-add-font font
		  '((encoding-type . 4)
		    (charset-num . 0)
		    (overhang . 0)
		    (base . 10)
		    (height . 12)
		    (width . 6)))
    (w32-change-font-logfont 
     font 0 
     '(w32-logfont "ÇlÇr ÉSÉVÉbÉN" 0 -12 400 0 nil nil nil 128 1 3 49))
    (w32-change-font-logfont 
     font 1 
     '(w32-logfont "ÇlÇr ÉSÉVÉbÉN" 0 -12 700 0 nil nil nil 128 1 3 49))
    (w32-change-font-logfont 
     font 2 
     '(w32-logfont "ÇlÇr ÉSÉVÉbÉN" 0 -12 400 0 nil nil nil 128 1 3 49))
    (w32-change-font-logfont 
     font 3 
     '(w32-logfont "ÇlÇr ÉSÉVÉbÉN" 0 -12 700 0 nil nil nil 128 1 3 49)))
  
  ;;------------------------------------------
  ;; Gothic-11
  ;;
  (let ((font "Gothic-11"))
    (w32-add-font font
		  '((encoding-type . 4)
		    (charset-num . 0)
		    (overhang . 0)
		    (base . 9)
		    (height . 11)
		    (width . 6)))
    (w32-change-font-logfont 
     font 0 
     '(w32-logfont "ÇlÇr ÉSÉVÉbÉN" 0 -11 400 0 nil nil nil 128 1 3 49))
    (w32-change-font-logfont 
     font 1 
     '(w32-logfont "ÇlÇr ÉSÉVÉbÉN" 0 -11 700 0 nil nil nil 128 1 3 49))
    (w32-change-font-logfont 
     font 2 
     '(w32-logfont "ÇlÇr ÉSÉVÉbÉN" 0 -11 400 0 nil nil nil 128 1 3 49))
    (w32-change-font-logfont 
     font 3 
     '(w32-logfont "ÇlÇr ÉSÉVÉbÉN" 0 -11 700 0 nil nil nil 128 1 3 49)))
  

  ;;-------------------------------------------
  ;; Mincyo-27
  ;;
  (let ((font "Mincyo-27"))
    (w32-add-font font
		  '((encoding-type . 4)
		    (charset-num . 0)
		    (overhang . 0)
		    (base . 25)
		    (height . 30)
		    (width . 13)))
    (w32-change-font-logfont 
     font 0 
     '(w32-logfont "ÇlÇr ñæí©" 0 -27 400 0 nil nil nil 128 1 3 17))
    (w32-change-font-logfont 
     font 1 
     '(w32-logfont "ÇlÇr ñæí©" 0 -27 700 0 nil nil nil 128 1 3 17))
    (w32-change-font-logfont
     font 2
     '(w32-logfont "ÇlÇr ñæí©" 0 -27 400 0 nil nil nil 128 1 3 17))
    (w32-change-font-logfont
     font 3
     '(w32-logfont "ÇlÇr ñæí©" 0 -27 700 0 nil nil nil 128 1 3 17)))
  
  ;;------------------------------------------
  ;; Terminal
  ;;
      (let ((font "Terminal-13"))
	 (w32-add-font font
		       '((encoding-type . 4)
			 (charset-num . 0)
			 (overhang . 0)
			 (base . 12)
			 (height . 14)
			 (width . 6)))
	 (w32-change-font-logfont 
	  font 0 
	  '(w32-logfont "Terminal" 0 -13 400 0 nil nil nil 128 1 1 1))
	 (w32-change-font-logfont 
	  font 1 
	  '(w32-logfont "Terminal" 0 -13 700 0 nil nil nil 128 1 1 1))
	 (w32-change-font-logfont
	  font 2
	  '(w32-logfont "Terminal" 0 -13 400 0 nil nil nil 128 1 1 1))
	 (w32-change-font-logfont
	  font 3
	  '(w32-logfont "Terminal" 0 -13 700 0 nil nil nil 128 1 1 1)))

  ;;------------------------------------------
  ;; Terminal
  ;;
      (let ((font "Fixedsys-18"))
	 (w32-add-font font
		       '((encoding-type . 4)
			 (charset-num . 0)
			 (overhang . 0)
			 (base . 19)
			 (height . 20)
			 (width . 10)))
	 (w32-change-font-logfont 
	  font 0 
'(w32-logfont "FixedSys" 0 -22 400 0 nil nil nil 128 1 1 1))
	 (w32-change-font-logfont 
	  font 1 
'(w32-logfont "FixedSys" 0 -22 400 0 nil nil nil 128 1 1 1))
	 (w32-change-font-logfont
	  font 2
'(w32-logfont "FixedSys" 0 -22 400 0 nil nil nil 128 1 1 1))
	 (w32-change-font-logfont
	  font 3
'(w32-logfont "FixedSys" 0 -22 400 0 nil nil nil 128 1 1 1)))


      
;;;============================================
;;;
;;; private fontset
;;;
    (new-fontset "main-fontset" '((ascii . "Gothic-12")
				  (latin-iso8859-1 . "Gothic-12")
				  (katakana-jisx0201 . "Gothic-12")
				  (japanese-jisx0208 . "Gothic-12")
				  (latin-jisx0201    . "Gothic-12")
				  ))
      
      (new-fontset "Gothic-14-fontset" '((ascii . "Gothic-14")
					 (latin-iso8859-1 . "Gothic-14")
					 (katakana-jisx0201 . "Gothic-14")
					 (japanese-jisx0208 . "Gothic-14")
					 (latin-jisx0201    . "Gothic-14")
					 ))

      (new-fontset "Gothic-13-fontset" '((ascii . "Gothic-13")
					 (latin-iso8859-1 . "Gothic-13")
					 (katakana-jisx0201 . "Gothic-13")
					 (japanese-jisx0208 . "Gothic-13")
					 (latin-jisx0201    . "Gothic-13")
					 ))

      (new-fontset "Gothic-12-fontset" '((ascii . "Gothic-12")
					 (latin-iso8859-1 . "Gothic-12")
					 (katakana-jisx0201 . "Gothic-12")
					 (japanese-jisx0208 . "Gothic-12")
					 (latin-jisx0201    . "Gothic-12")
					 ))

      (new-fontset "Gothic-11-fontset" '((ascii . "Gothic-11")
					 (latin-iso8859-1 . "Gothic-11")
					 (katakana-jisx0201 . "Gothic-11")
					 (japanese-jisx0208 . "Gothic-11")
					 (latin-jisx0201    . "Gothic-11")
					 ))

      
      (new-fontset "Mincyo-fontset" '((ascii . "Mincyo-27")
				      (latin-iso8859-1 . "Mincyo-27")
				      (katakana-jisx0201 . "Mincyo-27")
				      (japanese-jisx0208 . "Mincyo-27")
				      (latin-jisx0201    . "Mincyo-27")
				      ))

      (new-fontset "Terminal-fontset" '((ascii . "Terminal-13")
				      (latin-iso8859-1 . "Terminal-13")
				      (katakana-jisx0201 . "Terminal-13")
				      (japanese-jisx0208 . "Terminal-13")
				      (latin-jisx0201    . "Terminal-13")
				      ))
      (new-fontset "Fixedsys18-fontset" '((ascii . "Fixedsys-18")
				      (latin-iso8859-1 . "Fixedsys-18")
				      (katakana-jisx0201 . "Fixedsys-18")
				      (japanese-jisx0208 . "Fixedsys-18")
				      (latin-jisx0201    . "Fixedsys-18")
				      ))
      )
 )
;;========== END OF FILE =====================



