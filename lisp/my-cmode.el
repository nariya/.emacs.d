;;ためしに自分用のc-modeを作ってみるテスト

  
 
;;;どの拡張子でどのモードを使うか？
;;; cc-mode.el の使用
;;;


;;(autoload 'c-mode    "cc-mode" "C Editing Mode" t)
;;(autoload 'c++-mode  "cc-mode" "C++ Editing Mode" t)
;;(autoload 'objc-mode "cc-mode" "Objective-C Editing Mode" t)
;;(autoload 'java-mode "cc-mode" "Java Editing Mode" t)
(setq auto-mode-alist
      (append
       '(
	 ;;("\\.c$"    . c++-mode)
         ("\\.cs$"    . c++-mode) ;;about C# source
	 ("\\.h$"    . c++-mode)
	 ;;("\\.h$"    . objc-mode)
	 ;;		 ("\\.java$" . java-mode)
	 ("\\.m$"    . objc-mode)
	 ("\\.mm$"    . objc-mode)
					;         ("\\.c\\+\\+$" . c++-mode)
					;         ("\\.cpp$"  . c++-mode)
					;         ("\\.cc$"   . c++-mode)
					;         ("\\.hh$"   . c++-mode)
         )
       auto-mode-alist))





;;;対応する括弧にジャンプ???
(progn
  (defvar com-point nil
        "Remember com point as a marker. \(buffer specific\)")
  (set-default 'com-point (make-marker))
  (defun getcom (arg)
        "Get com part of prefix-argument ARG."
        (cond ((null arg) nil)
                  ((consp arg) (cdr arg))
                  (t nil)))
  (defun paren-match (arg)
        "Go to the matching parenthesis."
        (interactive "P")
        (let ((com (getcom arg)))
          (if (numberp arg)
                  (if (or (> arg 99) (< arg 1))
                          (error "Prefix must be between 1 and 99.")
                        (goto-char
                         (if (> (point-max) 80000)
                                 (* (/ (point-max) 100) arg)
                           (/ (* (point-max) arg) 100)))
                        (back-to-indentation))
                (cond ((looking-at "[\(\[{]")
                           (if com (move-marker com-point (point)))
                           (forward-sexp 1)
                           (if com
                                   (paren-match nil com)
                                 (backward-char)))
                          ((looking-at "[])}]")
                           (forward-char)
                           (if com (move-marker com-point (point)))
                           (backward-sexp 1)
                           (if com (paren-match nil com)))
                          (t (error ""))))))

)

(defun my-find-file( buffer_name)
  "ファイルをすでにVisitしていようがしていまいがとりあえずそのファイルのバッファをアクティブに"
  (switch-to-buffer (find-file-noselect buffer_name))
)

(defun my-revert-buffer()
  "強制バッファ更新"
  (interactive)
  (revert-buffer nil 1))
;;; 
(defun my-revert-source-headder ()
  "ヘッダとソース入れ換え"
  (interactive)
  (let* ((name buffer-file-name) (dot_pos))
	(setq dot_pos (string-match "\.c[p]*$" name 0 )) ; for c++
;	(setq dot_pos (string-match "\.m[m]*$" name 0 )) ; for objective-c
	(if(setq dot_pos dot_pos)
		(;;C source
		 progn
		  (setq name (substring name 0 dot_pos))
		  (setq name (concat name "\.h"))
		  (my-find-file name )
		  (error nil)
		  )
	  )
	(setq dot_pos (string-match "\.h[p]*$" name 0 ))
	(if(setq dot_pos dot_pos)
		(;;Headder
		 progn
		  (setq name (substring name 0 dot_pos))
		  (setq name (concat name "\.cpp")) ; for cpp
;		  (setq name (concat name "\.mm")) ; for objective c
		  (my-find-file name)
		  (error nil)))))


(defun my-next-defun()
  "次の関数定義へジャンプ"
  (interactive)
  (beginning-of-defun -1))


(defun  my-c-kakko()
  "C-modeでも括弧使いたい"
  (interactive)
  (my-kakko)
)

(defun  my-c-brace-noindent()
  "勝手に対応する'}'を書いてしまうでも改行はしないよ"
  (interactive)
  (indent-according-to-mode)
  (insert "{}")
  (backward-char)
)




(defun  my-c-brace()
  "勝手に対応する'}'を書いてしまう"
  (interactive)
  (indent-according-to-mode)
  (insert "{")
  (indent-according-to-mode)
  (newline-and-indent)
  (delete-backward-char 1)
  (insert "}")
  (previous-line 1)
  (end-of-line)
  (newline-and-indent)
)

(defun endofline-and-indent()
  "indentして、行末へ移動"
  (interactive)
  (end-of-line)
  (indent-according-to-mode)
)

(defun my-c-newline()
  "後ろに何かついてること前提?"
  (interactive)
;  (end-of-line)
  (newline-and-indent)
)



;;(setq-default case-fold-search nil)

(setq user-mail-address "takemura@platinum-egg.com")



(add-hook 'font-lock-mode-hook
          '(lambda ()
             (my-font-lock-set-face)))
(defun my-font-lock-set-face ()
  ;;
  (make-face 'my-builtin-face)
  (set-face-foreground 'my-builtin-face "light goldenrod")
  (setq font-lock-builtin-face 'my-builtin-face)
  ;;
  (make-face 'my-keyword-face)
  (set-face-foreground 'my-keyword-face "RosyBrown")
  (setq font-lock-keyword-face 'my-keyword-face)
  ;(setq font-lock-keyword-face 'bold)
  ;;
  (make-face 'my-comment-face)
;  (set-face-foreground 'my-comment-face "salmon3")
  (set-face-foreground 'my-comment-face "light slate gray")
  (setq font-lock-comment-face 'my-comment-face)
  ;;
  (make-face 'my-string-face)
  (set-face-foreground 'my-string-face "maroon3")
  (setq font-lock-string-face 'my-string-face)
  ;;
  (make-face 'my-function-face)
  (set-face-foreground 'my-function-face "LightBlue2")
  (setq font-lock-function-name-face 'my-function-face)
  ;(setq font-lock-function-name-face 'default)
  ;;
  (make-face 'my-type-face)
  (set-face-foreground 'my-type-face "lawn green")
  (setq font-lock-type-face 'my-type-face)
  ;(setq font-lock-type-face 'default)
  ;;
  ;; document
  ;;(make-face 'my-doc-string-face)
  ;;(set-face-foreground 'my-doc-string-face "lightgrey")
  ;;(setq font-lock-doc-string-face 'my-doc-string-face)
  )

;for speed bar
(when (locate-library "speedbar")
  (require 'speedbar)
  ;; "a" で無視ファイル表示/非表示のトグル
  (define-key speedbar-file-key-map "a" 'speedbar-toggle-show-all-files)
  ;; ← や → でもディレクトリを開閉 ;;デフォルト: "=" "+", "-"
  (define-key speedbar-file-key-map [right] 'my-speedbar-expand-line)
  (define-key speedbar-file-key-map "\C-f" 'my-speedbar-expand-line)
  (define-key speedbar-file-key-map [left] 'speedbar-contract-line)
  (define-key speedbar-file-key-map "\C-b" 'speedbar-contract-line)
  ;; BS でも上位ディレクトリへ ;;デフォルト: "U"
  (define-key speedbar-file-key-map [backspace] 'speedbar-up-directory)
  (define-key speedbar-file-key-map "\C-h" 'speedbar-up-directory)
  ;; 起動位置を直接指定する
  (setq speedbar-frame-parameters
        (append (list '(top . 0)
                      '(left . 0)
                      '(width . 25))
                speedbar-frame-parameters))
  ) ;; end of speedbar


;;; C-g
(global-unset-key "\C-g")
(define-key global-map "\C-g" 'goto-line)

;(global-unset-key "\C-w")
(define-key global-map "\C-w" 'my-revert-source-headder)

(define-key global-map "\C-l" 'expand-abbrev)
(define-key global-map "\C-\\" 'paren-match) ; 元々これだったのだが動かなくなったorz.
(global-unset-key "\C-^")
(define-key global-map "\C-^" 'paren-match)
(define-key global-map [C-up] 'beginning-of-defun)
(define-key global-map [C-down] 'my-next-defun)



;; GNU global (gtag)
(when (locate-library "gtags") (require 'gtags))



;;c-modeの各種定数について..
;;(setq c-continued-statement-offset '1)
;;(setq c-tab-always-indent t)
(setq c-hungry-delete-key t)
(setq c-macro-shrink-window-flag t)
;;(setq c-indent-level '4)
;;(setq c-argdecl-indent '3)
;;(setq c-label-offset '-2) ;;;
;;(setq c-tab-always-indent nil)


;;
;; フックさせる自分のスタイル
;;
(defconst my-c-style
  '(
    ;;
    ;; もろもろの設定があるならここで定義
    ;;
	(setq c-auto-newline t)   ; 全自動インデントを有効
	(setq default-tab-width '4)
	(setq tab-width 4)
	(setq-default indent-tabs-mode t)
	(setq indent-tabs-mode t)
;;	(setq c-hungry-delete-key t)
	(setq c-macro-shrink-window-flag t)

	;;tab時にc-modeのオフセット情報を表示
    (c-echo-syntactic-information-p . t)

    ;; カッコ前後の自動改行処理の設定
    (c-hanging-braces-alist
     . (
        (class-open before after)       ; クラス宣言の'{'の前後
        (class-close after)             ; クラス宣言の'}'の後
        (defun-open before after)       ; 関数宣言の'{'の前後
        (defun-close after)             ; 関数宣言の'}'の後
        (inline-open after)             ; クラス内のインライン
                                        ; 関数宣言の'{'の後
        (inline-close after)            ; クラス内のインライン
                                        ; 関数宣言の'}'の後
        (brace-list-open after)         ; 列挙型、配列宣言の'{'の後
        (brace-list-close before after) ; 列挙型、配列宣言の'}'の前後
        (block-open after)              ; ステートメントの'{'の後
        (block-close after)             ; ステートメントの'}'前後
        (substatement-open after)       ; サブステートメント
                                        ; (if 文等)の'{'の後
        (statement-case-open after)     ; case 文の'{'の後
        (extern-lang-open before after) ; 他言語へのリンケージ宣言の
                                        ; '{'の前後
        (extern-lang-close before)      ; 他言語へのリンケージ宣言の
                                        ; '}'の前
        ))


    ;; コロン前後の自動改行処理の設定
    (c-hanging-colons-alist
     . (
        (case-label after)              ; case ラベルの':'の後
        (label after)                   ; ラベルの':'の後
        (access-label after)            ; アクセスラベル(public等)の':'の後
        (member-init-intro)             ; コンストラクタでのメンバー初期化
                                        ; リストの先頭の':'では改行しない
        (inher-intro before)            ; クラス宣言での継承リストの先頭の
                                        ; ':'では改行しない
        ))

    ;; 挿入された余計な空白文字のキャンセル条件の設定
    ;; 下記の*を削除する
    (c-cleanup-list
     . (
        brace-else-brace                ; else の直前
                                        ; "} * else {"  ->  "} else {"
        brace-elseif-brace              ; else if の直前
                                        ; "} * else if (.*) {"
                                        ; ->  } "else if (.*) {"
        empty-defun-braces              ; 空のクラス・関数定義の'}' の直前
                                        ;；"{ * }"  ->  "{}"
        defun-close-semi                ; クラス・関数定義後の';' の直前
                                        ; "} * ;"  ->  "};"
        list-close-comma                ; 配列初期化時の'},'の直前
                                        ; "} * ,"  ->  "},"
        scope-operator                  ; スコープ演算子'::' の間
                                        ; ": * :"  ->  "::"
        ))
    
    ;;
    ;; ここでインデントルールの詳細を定義
    ;; 各パラメータについては \\Meadow\X.XX\lisp\progmodes\cc-styles.el を参照のこと。
    ;;
	;;c-basic-offsetとc-offsets-alistが効いてくるわけですが、cc-modeのinfoによると、c-offsets-alistはsetqで直接いじるべきではないようです。 その代わり、c-set-offset関数を使って値を設定します。
	;;
	;;具体的な手順は次のような感じです。
	;;近いスタイルを選ぶ。
	;;気にいらないインデント部分を見つける。
	;;C-c C-sでインデントに効いてくる変数を見つける。
	;;その変数の値をc-set-offset関数で変える。


	(setq c-basic-offset 4)
;	(setq c-label-offset '-2)
	(c-set-offset 'label 1)
    	
	(c-offsets-alist . ((inline-open . 0)
;;			    ;;(c-hanging-braces-alist     . ((substatement-open before after)))
;			    (brace-list-open . 0);;       -- open brace of an enum or static array list
;			    (brace-list-close .--)     ;;  -- close brace of an enum or static array list
;			    (brace-list-entry . 0)    ;;  -- subsequent lines in an enum or static array list
;			    (brace-list-intro . --);;      -- first line in an enum or static array list
;			    (brace-entry-open .-5);;      -- subsequent lines in an enum or static array
;;			    ;;list that start with an open brace.
;			    (label              . -)
;			    (access-label       . -)   ;;   -- C++ private/protected/public access label
;			    (block-open . 0)		   ;;	-- statement block open brace
;			    (block-close . 0)		   ;;	-- statement block close brace
;
;			    (topmost-intro		   . 0)
;			    (topmost-intro-cont    . +)
;			    (statement-block-intro . +)
;			    (knr-argdecl-intro     . -)
;				(statement-case-open . +); case の中でいきなり中カッコ書いた時...
;			    (statement-cont        . 0);; -- a continuation of a C (or like) statement
;			    (substatement          . +); if, while, for, do, elseの後の最初の行。  
;			    (substatement-open     . +); substatementブロックを開く中カッコ。  
;			    (arglist-intro  	. +)
;			    (arglist-close  	. c-lineup-arglist)
;			    (inher-cont     	. c-lineup-java-inher)
;			    (func-decl-cont 	. c-lineup-java-throws)
;
			))
    ) "Myr Programming Style") ;; スタイル名




;;
;; フック関数
;;
(defun my-c-mode-common-hook ()

  ;;
  ;; 既存の設定を使うのであれば上記のスタイル設定は不要
  ;;
  ;;(c-set-style "GNU")
  (c-set-style "cc-mode")
  ;;(c-set-style "K&R")
  ;;(c-set-style "BSD")
  ;;(c-set-style "C++")
  ;;(c-set-style "Blacksmith")
  ;;
  ;; 上記の my-c-style を使うので読み込む
  ;;
  (c-add-style "PERSONAL" my-c-style t)

  ;;
  ;; その他の設定があるならここで定義
  ;;

  ;;for gtag
  (gtags-mode 1)
  (gtags-make-complete-list)
  
  ;;
  ;; キーバインドをここで設定すると各プログラミングモードでのみ有効な設定となる
  ;;
  ;;  (global-set-key   "\C-x\C-y" 'call-last-kbd-macro)
  ;; (global-set-key   "\C-c\C-c" 'compile)
  ;;(local-set-key "\C-j" 'newline) 
  ;;		 (set-buffer-file-coding-system 'sjis-dos)
  ;;		 (define-key c-mode-map "\C-w" 'comment-region)
  ;; necessary: 
  
  (local-set-key "\C-d" 'my-current-time)
  (local-set-key "\C-m" 'my-c-newline) 
;  (local-unset-key [M-RET])
  (local-set-key "\M-\r" 'newline-and-indent) 
  (local-set-key "\C-_" 'newline-and-indent)
  (local-set-key "\C-cc" 'comment-region) 
  (local-set-key "\C-c\C-c" 'compile) 
;  (local-set-key "\C-SPC" 'complete-symbol)
  (local-set-key [(control ? )]     'complete-symbol)
  (local-set-key "(" 'my-c-kakko)
  (local-set-key "{" 'my-c-brace)
;;  (local-set-key m [?(]		 "(")
  (local-set-key [(control ?{)]     'my-c-brace-noindent)
  (global-unset-key [S-f1])
  (local-set-key [S-f1] 'speedbar-get-focus)
  (local-set-key [f4] 'next-error)
  (local-set-key [f5] 'my-revert-buffer)
  (local-set-key [S-f4] 'previous-error)
  (local-set-key [S-f8] 'my-msdn-help)
  (local-set-key [C-f8] 'my-msdn-help-keyword)
  ;;(local-set-key [TAB] 'endofline-and-new-line)

  ;;(define-key c-mode-map "\C-w" 'comment-region) 

  (global-set-key "\M-t" 'gtags-find-tag)     ;関数の定義元へ
  (global-set-key "\M-r" 'gtags-find-rtag)    ;関数の参照先へ
  (global-set-key "\M-s" 'gtags-find-symbol)  ;変数の定義元/参照先へ
  (global-set-key "\M-p" 'gtags-find-pattern)
  (global-set-key "\M-f" 'gtags-find-file)    ;ファイルにジャンプ
  (global-set-key [?\C-,] 'gtags-pop-stack)   ;前のバッファに戻る


)



;;
;; C モード、C++モード、java モードに上記のフック関数をフックします。
;;
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
;(add-hook 'c++-mode-hook 'my-c-mode-common-hook)
;(add-hook 'c-mode-hook 'my-c-mode-common-hook)
;(add-hook 'java-mode-hook 'my-c-mode-common-hook)
;;(c-set-style "cc-mode")




(c++-mode)
