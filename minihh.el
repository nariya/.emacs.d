;;
;; minihh.el
;;
(defvar minihh-launcher "minihh"
  "*HTMLヘルプランチャーコマンド")

(defun minihh-browse-htmlhelp (file &optional keyword)
  "*ヘルプファイルをブラウズする。keywordがnon-nilならキーワード検索する。"
  (interactive)
  (if (or (null keyword) (string-equal keyword ""))
      (call-process minihh-launcher
		    nil 0 nil
		    file)
    (call-process minihh-launcher
		  nil 0 nil
		  (concat "-" keyword) file)))

(defun minihh-browse-htmlhelp-with-keyword (file)
  "*ヘルプファイルをブラウズする。ポイント周辺を切り出してキーワードとする。"
  (interactive)
  (let ((keyword nil))
    (save-excursion
      (let ((b (+ (point) (skip-chars-backward "#a-zA-Z0-9_")))
	    (e (+ (point) (skip-chars-forward "#a-zA-Z0-9_"))))
	(setq keyword (buffer-substring b e)))
      (setq keyword (read-from-minibuffer "keyword : " keyword)))
    (minihh-browse-htmlhelp file keyword)))

;;
;; setting example
;;
; (global-set-key [f1] '(lambda ()
; 			(interactive)
; 			(minihh-browse-htmlhelp-with-keyword
; 			 "/tmp/help.chm")))
