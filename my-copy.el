

(defun my-select-all()
  (beginning-of-buffer)
  (interactive)
  (set-mark 0)
  (end-of-buffer)
)


