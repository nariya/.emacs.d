;HangulË^èèê\Ë^èèê\Ë^èèê\
;;; GulimChe 10x20
    (win32-add-fontset "GulimChe20" 10 20 18 0)
    (win32-add-font "default" *euc-korea* "GulimChe20")

    (win32-change-font-property "default" 0
                                '("GulimChe" 0 -16 400 0 nil nil 129 1 3 49)
                                "GulimChe20")
    (win32-change-font-property "default" 1
                                '("GulimChe" 0 -16 600 0 nil nil 129 1 3 49)
                                "GulimChe20")
    (win32-change-font-property "default" 2
                                '("GulimChe" 0 -16 400 0 t nil 129 1 3 49)
                                "GulimChe20")
    (win32-change-font-property "default" 3
                                '("GulimChe" 0 -16 600 0 t nil 129 1 3 49)
                                "GulimChe20")

;Simplified ChineseË^èèê\Ë^èèê\Ë^èèê\
;;; MS Song 10x20
    (win32-add-fontset "MSSong20" 10 20 18 0)
    (win32-add-font "default" *euc-china* "MSSong20")

    (win32-change-font-property "default" 0
                                '("MS Song" 0 -14 400 0 nil nil 134 1 3 49)
                                "MSSong20")
    (win32-change-font-property "default" 1
                                '("MS Song" 0 -14 600 0 nil nil 134 1 3 49)
                                "MSSong20")
    (win32-change-font-property "default" 2
                                '("MS Song" 0 -14 400 0 t nil 134 1 3 49)
                                "MSSong20")
    (win32-change-font-property "default" 3
                                '("MS Song" 0 -14 600 0 t nil 134 1 3 49)
                                "MSSong20")

;Traditional ChineseË^èèê\Ë^èèê\Ë^èèê\
;;; MingLiU 10x20
    (win32-add-fontset "MingLiU20" 10 20 18 0)
    (win32-add-font "default" *euc-china* "MingLiU20")

    (win32-change-font-property "default" 0
                                '("MingLiU" 0 -16 400 0 nil nil 136 1 3 49)
                                "MingLiU20")
    (win32-change-font-property "default" 1
                                '("MingLiU" 0 -16 600 0 nil nil 136 1 3 49)
                                "MingLiU20")
    (win32-change-font-property "default" 2
                                '("MingLiU" 0 -16 400 0 t nil 136 1 3 49)
                                "MingLiU20")
    (win32-change-font-property "default" 3
                                '("MingLiU" 0 -16 600 0 t nil 136 1 3 49)
                                "MingLiU20")

;latin-1Ë^èèê\Ë^èèê\Ë^èèê\
    (win32-add-fontset "latin-1" 10 20 18 0)
    (win32-add-font "default" *iso-8859-1* "latin-1")

    (win32-change-font-property "default" 0
                                '("Courier New" 0 -16 400 0 nil nil 0 1 3 49)
                                "latin-1")
    (win32-change-font-property "default" 1
                                '("Courier New" 0 -16 600 0 nil nil 0 1 3 49)
                                "latin-1")
    (win32-change-font-property "default" 2
                                '("Courier New" 0 -16 400 0 t nil 0 1 3 49)
                                "latin-1")
    (win32-change-font-property "default" 3
                                '("latin-1" 0 -16 600 0 t nil 0 1 3 49)
                                "latin-1")
;Ë^èèê\Ë^èèê\Ë^èèê\Ë^èèê\Ë^èèê\Ë^èèê\Ë^èèê\Ë^ˇˇ(setq menu-bar-lang-menu (make-sparse-keymap "Lang"))
(define-key global-map [menu-bar lang]
  (cons "Lang" menu-bar-lang-menu))
(setq menu-bar-final-items (cons 'lang menu-bar-final-items))

(define-key menu-bar-lang-menu [korean]
  '("Korean" . set-frame-korean))
(define-key menu-bar-lang-menu [japanese]
  '("Japanese" . set-frame-japanese))
(define-key menu-bar-lang-menu [Traditional-Chinese]
  '("t-Chinese(Traditional)" . set-frame-traditional-chinese))
(define-key menu-bar-lang-menu [Simplified-Chinese]
  '("Chinese(Simplified)" . set-frame-simplified-chinese))
(define-key menu-bar-lang-menu [European]
  '("Eurpoean" . set-frame-european))

(defun set-frame-korean ()
  (interactive)
  (set-primary-environment 'korean)
  (require 'quail)
  (quail-select-package "hangul")
  (set-display-coding-system *euc-korea*)
  (set-clipboard-coding-system *euc-korea*dos)
  (set-default-file-coding-system *euc-korea*dos)
  (mouse-win32-fontset-select "GulimChe20"))

(defun set-frame-japanese ()
  (interactive)
  (set-primary-environment 'japanese)
  ;;(if (boundp 'quail-mode)
  ;;    (quail-mode -1))
  (require 'quail)
  (quail-select-package "hanja-jis")
  (set-display-coding-system *sjis*)
  (set-clipboard-coding-system *sjis*dos)
  (set-default-file-coding-system *sjis*dos)
  (mouse-win32-fontset-select "default"))

(defun set-frame-traditional-chinese ()
  (interactive)
  (set-primary-environment 'chinese)
  (require 'quail)
  (quail-select-package "py-b5")
  (set-display-coding-system *big5*)
  (set-clipboard-coding-system *big5*dos)
  (set-default-file-coding-system *big5*dos)
  (mouse-win32-fontset-select "MingLiU20"))

(defun set-frame-simplified-chinese ()
  (interactive)
  (set-primary-environment 'chinese)
  (require 'quail)
  (quail-select-package "tonepy")
  (set-display-coding-system *euc-china*)
  (set-clipboard-coding-system *euc-china*dos)
  (set-default-file-coding-system *euc-china*dos)
  (mouse-win32-fontset-select "MSSong20"))

(defun set-frame-european ()
  (interactive)
  (set-primary-environment 'european)
  (require 'quail)
  (quail-select-package "latin-1")
  (set-display-coding-system *iso-8859-1*)
  (set-clipboard-coding-system *ctext*dos)
  (set-default-file-coding-system *ctext*dos)
  (mouse-win32-fontset-select "latin-1"))