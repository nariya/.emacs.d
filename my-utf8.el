;;//$&$&!<$s...
;;(require 'un-define) ; Unicode
;;(require 'jisx0213)  ; JIS X 0213

; Mule-UCS ‚ÌÝ’è
; (set-language-environment) ‚Ì‘O‚ÉÝ’è‚µ‚Ü‚·
(require 'un-define)
(require 'jisx0213)

(put 'utf-8 'eol-type [utf-8-unix utf-8-dos utf-8-mac])
(put 'utf-8-unix 'eol-type 0)
(put 'utf-8-dos 'eol-type 1)
(put 'utf-8-mac 'eol-type 2)
(coding-system-put 'utf-8      'alias-coding-systems '(utf-8))
(coding-system-put 'utf-8-dos  'alias-coding-systems '(utf-8))
(coding-system-put 'utf-8-mac  'alias-coding-systems '(utf-8))
(coding-system-put 'utf-8-unix 'alias-coding-systems '(utf-8))




(defvar html-xml-charset-decl-alist
  '(("\\.html?$" nil
     "<meta\\b[^>]+content-type[^>]+charset *= *\\([a-zA-Z0-9_.-]+\\)")
    ("\\.xml$" utf-8
     "<\\?xml\\b[^>]+encoding=['\"]\\([a-zA-Z0-9_.-]+\\)")))
(defvar html-xml-auto-coding-chain)
(defun html-xml-auto-coding (filename size)
  (or (funcall html-xml-auto-coding-chain filename size)
      (let ((case-fold-search t) (alist html-xml-charset-decl-alist)
            search-limit pat cs string)
        (while (and alist (not pat))
          (if (string-match (car (car alist)) filename)
              (setq pat (cdr (car alist))))
          (setq alist (cdr alist)))
        (when pat
          (goto-char (point-min))
          (setq search-limit (+ (min size 4096) (point)))
          (if (not (search-forward-regexp (cadr pat) search-limit t))
              (car pat)
            (setq string (downcase (match-string 1)))
            (while (string-match "^x-" string)
              (setq string (substring string 2)))
            (setq cs (intern string))
            (if (coding-system-p cs) cs))))))
(setq html-xml-auto-coding-chain set-auto-coding-function
      set-auto-coding-function 'html-xml-auto-coding)

(define-coding-system-alias 'gb2312 'chinese-iso-8bit)
;;//=================================================================================================
