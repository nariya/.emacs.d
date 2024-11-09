;;; ---------------------------------------------------------------------------
;;; byte-compile (.emacs)
;;;
(defun compare-timestamp (el elc)
  "compare timestamp
-: el is older.
+: el is newner.
nil: elc is not exist."
  (let ((f.el (expand-file-name el))
        (f.elc (expand-file-name elc))
        (tfunc (function (lambda (f)
           (+ (* 65536 (- (nth 0 (nth 5 (file-attributes f))) 10000)) 
              (nth 1 (nth 5 (file-attributes f))))))) ;; 10000 is magic num!
                                                      ;; = 6.98 years.
        )
    (if (null (file-exists-p f.elc))
        nil
      (- (funcall tfunc el) (funcall tfunc elc)))))

;;; ---------------------------------------------------------------------------
;;; byte-compile (.emacs)  --- do!!
;;
(let* ((el "~/.emacs")(elc "~/.emacs.elc")
      (tm (compare-timestamp el elc)))
  (if (and tm (> 0 tm))
      ()
    (save-excursion
      (byte-compile-file el))))
