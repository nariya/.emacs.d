;; ;;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;; ;; Added by Package.el.  This must come before configurations of
;; ;; installed packages.  Don't delete this line.  If you don't want it,
;; ;; just comment it out by adding a semicolon to the start of the line.

;; ;; カスタムファイル用のディレクトリをload-pathに追加

;; ;; パッケージ設定
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

;; ;; auto-installの部分をコメントアウトまたは削除
;; ;; (require 'auto-install)  ;; この行を削除または無効化


(package-initialize)


(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))


;; ;; auto-complete設定の前にパッケージをインストール
;; (unless (package-installed-p 'auto-complete)
;;   (package-refresh-contents)
;;   (package-install 'auto-complete))

;; ;for auto complete
;; (require 'auto-complete-config)
;; (ac-config-default)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")




(setq mew-imap-server "imap.gmail.com")
(setq mew-imap-user "takemura@nex-a.net")
(setq mew-imap-auth  t)
(setq mew-imap-ssl t)
(setq mew-imap-ssl-port "993")
(setq mew-smtp-auth t)
(setq mew-smtp-ssl t)
(setq mew-smtp-ssl-port "465")
(setq mew-smtp-user "takemura@nex-a.net")
(setq mew-smtp-server "smtp.gmail.com")




;;; to display tab, zenkaku-space, etc...
(defface my-face-r-1 '((t (:background "grey10"))) nil)
(defface my-face-b-1 '((t (:background "purple" :underline t))) nil) ; zenkaku space 
(defface my-face-b-2 '((t (:background "dark slate gray"))) nil)
(defface my-face-u-1 '((t (:foreground "SteelBlue" :underline t))) nil)

;; フェイス定義の後に変数定義を行う
(defvar my-face-r-1 'my-face-r-1)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)

(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(
;	 ("\t" 0 my-face-b-2 append)
	 ("$A!!(B" 0 my-face-b-1 append)
;	 ("[ \t]+$" 0 my-face-u-1 append)
	 ("[\r]*\n" 0 my-face-r-1 append)
	 )))

(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)

;tab width
(setq tab-width 4)
(setq-default tab-width 4)
(add-hook 'python-mode-hook
      (lambda ()
        (setq indent-tabs-mode nil)
        (setq tab-width 4)
        (setq comment-start "% ")
        (setq comment-start "%+\\s-*")
        (setq python-indent 4)))

;for japanese language
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

; for windows like key map
(cua-mode t)

;;; font-lock setting.
(global-font-lock-mode t)

;(require 'w3m-load)

;; ; for my keymap. VERY IMPORTANT!!!
(load "my-key")
;; (load "my-html")



;; ;;yasnippet$B$N@_Dj(B
;; ;(require 'yasnippet)
;; ;(yas/initialize)
;; ;(yas/load-directory "~/Dropbox/emacs.d/snipet")


;show line number
;; (global-linum-mode t)
;; (global-set-key "(J\(BM-n" 'linum-mode)

;; ;; 新しい行番号表示の設定
;; (when (version<= "26.0.50" emacs-version)
;;   (global-display-line-numbers-mode))

;; ;; 特定のモードでは行番号を表示しない場合
;; (dolist (mode '(org-mode-hook
;;                 term-mode-hook
;;                 shell-mode-hook
;;                 eshell-mode-hook))
;;   (add-hook mode (lambda () (display-line-numbers-mode 0))))


;; ;;for grep, find moccur...
;; ;(load "")
;; (require 'color-moccur)
;; (require 'moccur-edit)
;; (require 'grep-edit)


;; ;;; moccur-grep $B$GFCDj$N%U%!%$%k$rBP>]30$H$7$?$$(B
;; ;(setq moccur-grep-exclusion-buffer-name-regexp "\\(TAGS\\)\\|\\(\\.svn\\)|\\(\\.meta\\)")
;; ;;(defun delete-string-match (reg lst)
;; ;;  (cond
;; ;;   ((null lst) (reverse lst))
;; ;;   ((string-match reg (car lst))
;; ;;    (delete-string-match reg (cdr lst)))
;; ;;   (t (cons (car lst) (delete-string-match reg (cdr lst))))))
;; (defun delete-string-match (reg lst)
;;   (let ((ret nil))
;;     (while lst
;;       (unless (string-match reg (car lst))
;;         (setq ret (cons (car lst) ret)))
;;       (setq lst (cdr lst)))
;;     (reverse ret)))
;; (defadvice moccur-search-files (before moccur-search-files-with-exclusion)
;;   "enable moccur-grep-exclusion-buffer-name-regexp"
;;   (ad-set-arg 1 (delete-string-match moccur-grep-exclusion-buffer-name-regexp (ad-get-arg 1))))
;; (ad-enable-advice 'moccur-search-files 'before 'moccur-search-files-with-exclusion)
;; (ad-activate 'moccur-search-files)



;; (if window-system
;; 	(progn
;; ;	  (add-hook 'ediff-before-setup-hook  
;; ;				'new-frame)
;; ;	  (add-hook 'ediff-quit-hook 
;; ;                'delete-frame) 
;;       (add-hook 'ediff-startup-hook
;; 				'(lambda ()  
;; 				   (set-frame-size (selected-frame) 300 80)   
;; 				   (set-face-attribute 'default (selected-frame) :height 130) 
;;                    (raise-frame (selected-frame))
;; 				   )) 
;;       ))

;; ;- See more at: http://www.ogre.com/node/446#sthash.ocK71803.dpuf

;; (global-set-key "\C-xv-" 'vc-ediff)
;; (setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; (setq ediff-split-window-function 'split-window-horizontally)
;; ;- See more at: http://www.ogre.com/node/446#sthash.ocK71803.dpuf


;; (require 'jaspace)

;; ;//speedbar=========================================================================================
;; ;add extension
;; (add-hook 'speedbar-mode-hook
;;           '(lambda ()
;;              (speedbar-add-supported-extension '(".cs") )))

;; ;//=================================================================================================
;; ;(setq make-backup-files nil); make backup files

;; (setq make-backup-files t)
;; (setq backup-directory-alist
;;       (cons (cons "\\.*$" (expand-file-name "~/bak"))
;;             backup-directory-alist))



;; (define-key global-map [ns-drag-file] 'ns-find-file)
;; (setq ns-pop-up-frames nil)

;; ;????
;; (setq enable-recursive-minibuffers t) 

;; ;(load "my-change-mode");the mode, can see chnaged part..

;; ; font set
;; ;(create-fontset-from-ascii-font "Menlo-14:weight=normal:slant=normal" nil "menlokakugo")
;; ;(set-fontset-font "fontset-menlokakugo" 'unicode (font-spec :family "Hiragino Kaku Gothic ProN" ) nil 'append)
;; ;(add-to-list 'default-frame-alist '(font . "fontset-menlokakugo"))
;; ;(setq face-font-rescale-alist '((".*Hiragino.*" . 1.2) (".*Menlo.*" . 1.0)))





;; ; use my sub library
;; (load "my-comment")
(load "my-copy")
;; ;(load "my-ruby")
;; (load "my-cmode")
;; (load "php-mode")
;; (load "my-flash")
;; ;(load "my-dired")
;; (load "my-boo")
;; ;(load "my-change-mode");the mode, can see chnaged part..
;; ;(load "my-www")



;; (if window-system
;;     (progn
;;       (require 'mic-paren)
;;       (paren-activate)     ; activating
;; ;      (setq paren-match-face 'bold-italic)
;;       (setq paren-match-face 'italic)
;;       (setq paren-sexp-mode t)
;;       ))


;; (auto-compression-mode 1)


;; (defface face-file-edited-today '((t (:foreground "GreenYellow"))) nil)
;; (defface face-file-edited-this-week '((t (:foreground "LimeGreen"))) nil)
;; (defface face-file-edited-last-week '((t (:foreground "saddle brown"))) nil)
;; (defvar face-file-edited-today 'face-file-edited-today)
;; (defvar face-file-edited-this-week 'face-file-edited-this-week)
;; (defvar face-file-edited-last-week 'face-file-edited-last-week)


(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))


  
(show-paren-mode t)
;; ;
;; (set-locale-environment nil)

;; (setq initial-frame-alist
;;      '((top . 0)
;;      (left  . 180)
;;      (width . 206)
;;      (height . 64)))
     

;; ;;set initial frame
;; (add-to-list 'default-frame-alist  '(foreground-color . "white"))
;; (add-to-list 'default-frame-alist  '(background-color . "black"))
;; (add-to-list 'default-frame-alist  ''(border-color . "black"))
;; (add-to-list 'default-frame-alist  '(mouse-color . "white"))
;; (add-to-list 'default-frame-alist  '(cursor-color . "lavender"))
        
;; (put 'upcase-region 'disabled nil)
;; (custom-set-variables
;;   ;; custom-set-variables was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  )
;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  )


;; ;platform$B0MB8$NJ,4t$,$+$1$k$h$&$K$J$k(B.
;; (require 'platform-p)


;; ;(when platform-darwin-p  ; $B0J8e!"(BOSX$B8GM-$N5!G=$N5-=R(B
;; ;   ;; Meta -> Command $B$3$l$O$&$l$7$$(B.
;; ;   (setq ns-command-modifier (quote meta)) 
;; ;   (setq ns-alternate-modifier (quote super))
;; ;   )




;; ;//=================================================================================================
;; ;
;; ;(set-language-environment "Japanese")
;; ;(autoload 'js2-mode "js2" nil t) ;http://code.google.com/p/js2-mode/
;; ;
;; ;
;; ;
;; ;
;; ;
;; ;
;; ;
;; ;
;; ;(setq show-paren-match-face "dark slate gray")
;; ;(setq default-tab-width '4);;tab width
;; ;(setq kill-whole-line t)
;; ;(setq transient-mark-mode t)
;; ;(column-number-mode t) ; 
;; ;(setq ls-lisp-dirs-first t);in dired, display Directory at first.
;; ;(setq eval-expression-print-level nil
;; ; eval-expression-print-length nil
;; ; eval-expression-debug-on-error nil)
;; ;
;; ;
;; ;(load "my-key")
;; ;
;; ;
;; ;
;; ;
;; ;
;; ;
;; ;
;; ; (defun my-speedbar-expand-line ()
;; ;   (interactive)
;; ;   (if (= (point-max) (progn (speedbar-expand-line) (point-max)))
;; ;       (save-current-buffer
;; ;         (speedbar-edit-line))))
;; ; 
;; ; (when (locate-library "speedbar")
;; ;   (require 'speedbar)
;; ;   ;; "a" 
;; ;   (define-key speedbar-file-key-map "a" 'speedbar-toggle-show-all-files)
;; ;   (define-key speedbar-file-key-map [right] 'my-speedbar-expand-line)
;; ;   (define-key speedbar-file-key-map "\C-f" 'my-speedbar-expand-line)
;; ;   (define-key speedbar-file-key-map [left] 'speedbar-contract-line)
;; ;   (define-key speedbar-file-key-map "\C-b" 'speedbar-contract-line)
;; ;   (define-key speedbar-file-key-map [backspace] 'speedbar-up-directory)
;; ;   (define-key speedbar-file-key-map "\C-h" 'speedbar-up-directory)
;; ;   (setq speedbar-frame-parameters
;; ;         (append (list '(top . 40)
;; ;                       '(left . 780)
;; ;                       '(width . 25))
;; ;                 speedbar-frame-parameters))
;; ;   (setq speedbar-supported-extension-expressions
;; ;         (append '(".el" ".[ch]\\(pp\\|\\+\\+\\)?" ".java" ".tex\\(i\\(nfo\\)?\\)?"
;; ;                   ".s?html?" ".xml" ".dtd" ".css" ".js"
;; ;                   ".gif" ".jpe?g" ".png")))
;; ;   ) ;; end of speedbar
;; ;
;; ;
;; ;
;; ;;to see Emacs Lisp List...
;; ;; command is "ell-packages"
;; ;(autoload 'ell-packages "ell" "Browse the Emacs Lisp List" t)
;; ;
;; ;;to save cursor place for each files...
;; ;(load "saveplace")
;; ;(setq-default save-place t)
;; ;
;; ;
;; ;
;; ;(if window-system
;; ;    (progn
;; ;      (require 'mic-paren)
;; ;      (paren-activate)     ; activating
;; ;;      (setq paren-match-face 'bold-italic)
;; ;      (setq paren-match-face 'italic)
;; ;      (setq paren-sexp-mode t)
;; ;      ))
;; ;
;; ;
;; ;(auto-compression-mode 1)
;; ;
;; ;
;; ;
;; ;
;; ;;(require 'mi-config)
;; ;(define-key global-map "\C-hf" 'mode-info-describe-function)
;; ;(define-key global-map "\C-hv" 'mode-info-describe-variable)
;; ;(define-key global-map "\M-." 'mode-info-find-tag)
;; ;;(require 'mi-fontify)
;; ;
;; ;
;; ;(setq make-backup-files t)
;; ;(setq backup-directory-alist
;; ;      (cons (cons "\\.*$" (expand-file-name "~/bak"))
;; ;            backup-directory-alist))
;; ;
;; ;
;; ;
;; ;;;--------------------------------------------------------------------------
;; ;;; csharp-mode
;; ;;; (install-elisp-from-emacswiki "csharp-mode.el")
;; ;;;--------------------------------------------------------------------------
;; (require 'csharp-mode)
;; (require 'quickrun)
;; (add-hook 'csharp-mode-hook
;;           '(lambda()
;;              (setq comment-column 40)
;;              (setq c-basic-offset 4)
;;              (font-lock-add-magic-number)
;;              ;; $B%*%U%;%C%H$ND4@0(B
;;              (c-set-offset 'substatement-open 0)
;;              (c-set-offset 'case-label '+)
;;              (c-set-offset 'arglist-intro '+)
;;              (c-set-offset 'arglist-close 0)
;;              )
;;           )
;; ;
;; ;
;; ;
;; ;
;; ;;; VB Mode
;; ;(setq visual-basic-ide-pathname "H:/VS98/VB98/VB6.EXE")
;; ;(setq vbp-ide-pathname "H:/VS98/VB98/VB6.EXE")
;; ;(setq visual-basic-mode-indent 4)
;; ;(autoload 'visual-basic-mode "visual-basic-mode" "Basic Editing Mode" t)
;; ;(setq auto-mode-alist 
;; ;    (append '(
;; ;            ("$B!@!@(B.[Ff][Rr][Mm]$" . visual-basic-mode)  ;;Form Module
;; ;            ("$B!@!@(B.[Bb][Aa][Ss]$" . visual-basic-mode)  ;;Bas Module
;; ;("$B!@!@(B.[Cc][Ll][Ss]$" . visual-basic-mode)  ;;Class Module
;; ;("$B!@!@(B.[Vv][Bb][Ss]$" . visual-basic-mode)  ;;VBScript file
;; ;     ) auto-mode-alist))
;; ;(autoload 'vbp-mode "vbp-mode" "VBP mode." t)
;; ;(setq auto-mode-alist 
;; ;    (append '(
;; ;            ("$B!@!@(B.[Vv][Bb][Pp]$" . vbp-mode) 
;; ;            ("$B!@!@(B.[Vv][Bb][Gg]$" . vbp-mode)
;; ;     ) auto-mode-alist))
;; ;
;; ;
;; ;
;; ;
;; ;;for time stamp...
;; ;(defvar my-save-buffer-hook nil)
;; ;(defun save-buffer-wrapper ()
;; ;  (interactive)
;; ;  (let ((tostr (concat "$Lastupdate: " (format-time-string "%Y/%m/%d %k:%M:%S") " $")))
;; ;(save-excursion
;; ; (goto-char (point-min))
;; ; (while (re-search-forward
;; ; "\\$Lastupdate\\([0-9/: ]*\\)?\\$" nil t)
;; ;(replace-match tostr nil t)))
;; ;(run-hooks 'my-save-buffer-hook)
;; ;(save-buffer)))
;; ;
;; ;(global-set-key "\C-x\C-s" 'save-buffer-wrapper)
;; ;
;; ;
;; ;;;; leim
;; ;(load "leim-list")
;; ;
;; ;
;; (display-time)
;; ;(set-face-foreground 'modeline "firebrick3")
;; ;(set-face-background 'modeline "muleblue")
;; ;set-face-foreground 'modeline "white")
;; ;(set-face-background 'modeline "black")
;; (setq default-frame-alist
;;  (append (list '(foreground-color . "AntiqueWhite")
;; '(background-color . "black")
;; '(border-color . "black")
;; '(mouse-color . "white")
;; '(cursor-color . "DarkGreen")
;; ;	 '(ime-font . "Fixedsys-18")
;; ;	 '(font . "Fixedsys18-fontset")
;; )
;;  default-frame-alist
;; ))

;; ;
;; ;;????
;; ;(setq region "coral4")
;; ;(setq enable-recursive-minibuffers t) 
;; ;
;; ;
;; ;
;; ;
;; ;
;; ;
;; ;
;; ;
;; ;
;; ;
;; ;(setq tooltip-use-echo-area t); display tooltips, in minibuffer



;; (autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
;; (setq auto-mode-alist
;;       (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))



;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;;
;; ;;; For folding
;; ;;;

;; ;; C coding style
;; (add-hook 'c-mode-common-hook
;;           '(lambda ()
;;       (hs-minor-mode 1)))
;; ;; Scheme coding style
;; (add-hook 'scheme-mode-hook
;;           '(lambda ()
;;       (hs-minor-mode 1)))
;; ;; Elisp coding style
;; (add-hook 'emacs-lisp-mode-hook
;;           '(lambda ()
;;       (hs-minor-mode 1)))
;; ;; Lisp coding style
;; (add-hook 'lisp-mode-hook
;;           '(lambda ()
;;       (hs-minor-mode 1)))
;; ;; Python coding style
;; (add-hook 'python-mode-hook
;;           '(lambda ()
;;       (hs-minor-mode 1)))

;; (define-key
;;   global-map
;;   (kbd "C-:") 'hs-toggle-hiding)

