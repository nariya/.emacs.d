
(defun my-select-all ()
  "Select the entire buffer."
  (interactive)
  (goto-char (point-min))  ; バッファの先頭に移動
  (set-mark (point-max))   ; バッファの最後までを範囲として設定
)
