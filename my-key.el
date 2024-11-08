
;;windowを消して、バッファも消す
(defun my-kill()
  ""
  "Kill the current buffer and delete the selected window 'Force'-ly."
  (interactive)
  (let ((buffer (current-buffer)))
;;  
;;       (delete-window (selected-window))
	(kill-buffer buffer)
	)
   (error "Aborted")
   )

(defun my-kill-line()
  "この行全部削除"
  (interactive)
  (beginning-of-line)
  (kill-line)
)


;;; C-x C-b を拡張 *Buffer List* 
(defun my-list-buffers ()
  (interactive)
  (list-buffers)
  (pop-to-buffer "*Buffer List*")
  (goto-line 4)		; 
  )


;;;
 
;;; 

;;(defun my-indent-line ()
;  (interactive)
;  (indent-according-to-mode)

(defun my-indent-and-next-line ()
  (interactive)
  (indent-according-to-mode)
  (next-line 1))

(setq my-search-word "nothing!")
(defun my-current-word ()
  "現在のカーソル位置のC単語を取得"
  ;;  (interactive)
  (let ((keyword nil))
    (save-excursion
      (let ((b (+ (point) (skip-chars-backward "#a-zA-Z0-9_")))
	    (e (+ (point) (skip-chars-forward "#a-zA-Z0-9_"))))
	(setq keyword (buffer-substring b e)))
      (setq my-search-word keyword)
;      (setq keyword (read-from-minibuffer "keyword : " keyword))
	  )
	))
;;



(defun my-search()
  (interactive)
  (search-forward my-search-word))

(defun my-search-current-word()
  (interactive)
  (my-current-word)
  (search-forward my-search-word))


(defun my-search-back()
  (interactive)
  (search-backward my-search-word))

(defun my-search-back-current-word()
  (interactive)
  (my-current-word)
  (search-backword my-search-word))





(defvar my-find-tag-current-word "ふんが" "タグ検索用で、現在検索している文字列")
;;(defvar my-find-tag-counter "今何番目のタグを見ているか")
(defun my-find-tag()
  (interactive)
  (let ((word-searching (current-word)))
;;    (if(string-match word-searching my-find-tag-current-word)
	(find-tag word-searching)
    ;;	 (tags-search word-searching))
	(setq my-find-tag-current-word word-searching)
    ))

(defun my-next-tag()
  (interactive)
  (find-tag my-find-tag-current-word 1)
)

(defun my-prev-tag()
  (interactive)
  (find-tag my-find-tag-current-word -)
)



(defun my-test-insert()
  (interactive)
  (insert (current-word))
)



(defun my-key-left()
  (interactive)
  (set-mark (point))
  (backward-char)
)

(defun my-key-right()
  (interactive)
  (set-mark (point))
  (forward-char)
)

(defun my-key-up()
  (interactive)
  (set-mark (point))
  (previous-line)
)

(defun my-key-down()
  (interactive)
  (set-mark (point))
  (next-line)
)
(defun my-current-time()
  (interactive)
  (insert (current-time-string ))
  (insert " (by myr.)")
)


(defun my-kakko()
  "'('と')'を同時に入力"
  (interactive)
  (insert "()")
  (backward-char)
)

(defun  my-macro-set-reset()
  "*キーボードマクロの記録開始・終了"
  (interactive)
  (if defining-kbd-macro
	  (end-kbd-macro)
	(start-kbd-macro nil)
	)
  )
(defun qgrep()
  "Qgrepの起動"
  (interactive)
;;  (shell-command "~/qgrep.lnk"))
  (shell-command "cd \~")
  (shell-command "ls"))

(defun my-elisp-set-break()
  "Break point 設定"
  (interactive)
  (setq debug-on-error t) ;;debug mode がもしオフだったらonにする..
  (edebug-defun)
)

;まず、、、変換された場合、必ず最初にもってこられる..
;んで、逆側、、ってのは、
;
;
;バッファの先頭、、
;後ろ側から一つ、
;
;ってので十分では?
;それぞれ違うものが出るだろ?
;
;まず、バッファのリングの順番が一定でないと困る..
;そのためには、現在のバッファが非選択になったときにかならず最後部につくか、
;後ろ側からかならず選択するかしかない??
;
;
;
;必ず

;prev-> リストの最後部からバッファをとり、それをカレントへ、その後元のバッファはリストの最前列
;next-> リストの最前列からバッファをとり、それをカレントへ、その後元のバッファはリストの最高列

(defun my-prev-window2()
  "次のウインドウを表示・改め"
  (interactive)
  ;;逆からとってこないと,,どうもバッファをチェンジしたときにかならずバッファの一番前にくるっぽいので..
  (let ((buffer_list (reverse (buffer-list))) (my_buffer (current-buffer))(buffer_name nil) (buffer nil) );
	(while buffer_list
	  ;;リスト先頭からバッファを一個取得..
	  (progn
		(setq buffer (car buffer_list))
		(setq buffer_name (buffer-file-name buffer))
		(if (or (equal buffer my_buffer) (not buffer_name) (equal buffer_name "TAGS"))
			(setq buffer_list (cdr buffer_list))
		  ;;バッファを変更する
		  (progn
			(switch-to-buffer  buffer)
			(error nil)))))))
;;元のバッファはリストの最前部...に勝手に挿入されるからOK
			

(defun my-next-window2()
  "次のウインドウを表示・改め"
  (interactive)
  ;;バッファ取得
  (let ((buffer_list (buffer-list)) (my_buffer (current-buffer))(buffer_name nil) )
	(while buffer_list
	  ;;	   ;;リスト先頭からバッファを一個取得..
	  (progn
		(setq buffer (car buffer_list))
		(setq buffer_name (buffer-file-name buffer))
		(if (or (equal buffer my_buffer) (not buffer_name) (equal buffer_name "TAGS"))
			(setq buffer_list (cdr buffer_list))
		  (progn
			;;バッファを変更する
			(switch-to-buffer  buffer)
			;;元のバッファはリストの最後部
			(bury-buffer my_buffer)
			(error nil)))))))



;;(global-set-key "\C-w" 'my-kill)
(global-set-key "\C-a" 'my-select-all)
(global-set-key "\C-n" 'find-file)

;;; C-t
(global-unset-key "\C-t")
(global-set-key "\C-t" 'my-current-time)
;;; C-l 
(global-set-key "\C-l" 'dabbrev-expand)
;;; C-x C-b の拡張
(global-set-key "\C-x\C-b" 'my-list-buffers)
;;; Buffer Menu  C-m  Return の機能を入れ換える
(global-set-key "\C-j" 'my-indent-and-next-line)
(define-key Buffer-menu-mode-map "\C-m" 'Buffer-menu-1-window)
(global-set-key "\C-z" 'undo)
;;; C-S
;;(global-set-key "\C-S" 'isearch-backward)
;;; C-Tab
;(global-set-key [C-tab] 'my-next-window)
(global-set-key [C-tab] 'my-next-window2)
;(set-extended-key-translate-table exkey-S-C-tab #\F20)(global-set-key #\F20 'my-prev-window)
;(global-set-key [S-C-tab] 'my-prev-window)
(global-set-key [S-C-tab] 'my-prev-window2)

   
;;; C-t
(global-set-key [s-left] 'windmove-left)
(global-set-key [s-right] 'windmove-right)
(global-set-key [s-up] 'windmove-up)
(global-set-key [s-down] 'windmove-down)


;;;(global-set-key  "\C-\t" 'next-window)
;;;(global-set-key  "\C-\T" 'previous-window) 
;;(setq show-paren-delay )
;;;CAPS-LOCKCTRL




;;
;;(global-set-key "\C-^" 'start-kbd-macro)
(global-set-key "\C-@" 'my-macro-set-reset)
(global-set-key "\C-]" 'call-last-kbd-macro)
;;(global-set-key "\C-." 'save-buffer)

;フォントサイズ動的変更.
(global-set-key [(meta ?+)] (lambda () (interactive) (text-scale-increase 1)))
(global-set-key [(meta ?-)] (lambda () (interactive) (text-scale-decrease 1)))

;;特殊キー
;(global-set-key [esc] ')
(global-set-key [end] 'end-of-line)
(global-set-key [home] 'beginning-of-line)
;;C-dを定義したらこいつを書き戻さないといけないらしい…(泣)
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)
(global-set-key [C-kp-delete] 'kill-word)



;(global-set-key [S-delete] 'my-kill-line)
;(global-set-key [C-SPC])
;(global-set-key [S-left] 'my-key-left)
;(global-set-key [S-right] 'my-key-right)
;(global-set-key [S-up] 'my-key-up)
;(global-set-key [S-down] 'my-key-down)

;;//////FunctionKey//////////////////////////////////////////////////////////////////////////////////
;;
;(global-set-key [mouse-2] 'my-find-tag)
;(global-set-key [mouse-2] 'my-test-insert)
(global-set-key [f1] 'info) ;GATES標準ではF1はヘルプだろ..
(global-set-key [f3] 'my-search)
(global-set-key [S-f3] 'my-search-back)
(global-set-key [C-f3] 'my-search-current-word)
(global-set-key [C-S-f3] 'my-search-back-current-word)

(global-set-key [f9] 'my-elisp-set-break)
(global-set-key [f10] 'my-next-tag)
(global-set-key [S-f10] 'my-prev-tag)
(global-set-key [C-f10] 'my-find-tag)
(global-set-key [f11] 'my-comment-func)
(global-set-key [S-f11] 'my-comment-1line)
(global-set-key [C-f11] 'my-c-file-comment)
(global-set-key [M-f11] 'my-line-comment)
(global-set-key [S-M-f11] 'my-line-comment-thisline)
;;
(global-set-key [f12]  'my-list-buffers)
(global-set-key [S-f12] 'my-kill)
;;;(global-set-key [f12] 'iconify-or-deiconify-frame)


;//=================================================================================================
;普通のキー

(global-set-key "("  'my-kakko)
