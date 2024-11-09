;;;for html.
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))

(setq auto-mode-alist
      (append
       '(
   ("\\.htm" . html-helper-mode)
   ("\\.shtml$" . html-helper-mode)
   ("\\.asp" . html-helper-mode)
   ) auto-mode-alist))


(defun insert-tag-br()
  (interactive)
  (insert "<br>\n"))



(defun unhtml (start end)
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region start end)
      (goto-char (point-min))
      (replace-string "&" "&amp;")
      (goto-char (point-min))
      (replace-string "<" "&lt;")
      (goto-char (point-min))
      (replace-string ">" "&gt;")
      )))

;(define-key html-mode-map "\S-\n" 'insert-tag-br)






