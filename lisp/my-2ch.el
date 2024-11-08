
(autoload 'navi2ch "navi2ch" "Navigator for 2ch for Emacs" t)
;; 終了時に訪ねない
(setq navi2ch-ask-when-exit nil)
;; スレのデフォルト名を使う
(setq navi2ch-message-user-name "")
;; あぼーんがあったたき元のファイルは保存しない
(setq navi2ch-net-save-old-file-when-aborn nil)
;; 送信時に訪ねない
(setq navi2ch-message-ask-before-send nil)
;; kill するときに訪ねない
(setq navi2ch-message-ask-before-kill nil)
;; バッファは 5 つまで
(setq navi2ch-article-max-buffers 5)
;; navi2ch-article-max-buffers を超えたら古いバッファは消す
(setq navi2ch-article-auto-expunge t)
;; 既読スレはすべて表示
(setq navi2ch-article-exist-message-range '(1 . 1000))
;; 未読スレもすべて表示
(setq navi2ch-article-new-message-range '(1000 . 1))
;; 3 ペインモードでみる
(setq navi2ch-list-stay-list-window t)
;; C-c 2 で起動
;(global-set-key "\C-c2" 'navi2ch)


;(setq navi2ch-mona-enable t)
;(add-hook 'navi2ch-mona-load-hook
;          (lambda ()
;            (set-face-attribute 'navi2ch-mona-face nil :family "モナー")))

