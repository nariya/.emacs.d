(load "pcl-cvs-startup")
;(setq cvs-cvsroot ":local:/cygdrive/c/home/CVSROOT") ;;MWJQ99
(setq cvs-cvsroot "myr@192.168.1.3:/home/cvsroot")

(add-hook 'cvs-mode-hook
          (lambda ()
            (collection-set-goal-column cvs-buffer-name 38)))
(autoload 'diff-mode "diff-mode" "Diff major mode" t)
(add-to-list 'auto-mode-alist '("\\.\\(diffs?\\|patch\\|rej\\)\\'" . diff-mode))
;; log $O$I$N%3!<%I$G=q$/$+7h$a$F
(modify-coding-system-alist 'process "cvs" '(undecided . sjis))

;; pserver $G$O$J$/ local repository $r;H$&$?$a$N@_Dj. >\:Y$O
;; meadow-users-jp %a!<%j%s%0%j%9%H$N
;; Subject: about pcl-cvs    X-ML-COUNT: 1870
;; Date: Sat
;(if (featurep 'meadow)
;    (define-process-argument-editing
;      "/cvs\\.exe\\'"
;      (lambda (x)
;        (let ((command (car x))
;              (argument (cdr x)))
;          (setq argument (cygnus-process-argument-quoting argument))
;          (concat
;           (unix-to-dos-filename command) " "
;           (unix-to-dos-argument (mapconcat (function concat) argument " ")
;                                 nil nil nil nil))))))
