;;; Ic.el --- Menu system for Emacs
;;
;; Copyright (C) 1997 臼田 拓史 (Usuda Hiroshi)

;; Author: Usuda Hiroshi <usuda-hiroshi@fujielectric.co.jp>(http://www.d4.dion.ne.jp/~usuda/)
;; Keywords: menu
;; Version : 5.1.29
;; Last-Modify : Sat Jul  1 01:34:49 2000
;; Test : GNU Emacs 20.2.2 | XEmacs21

;;; Commentary:

;;  ■ 著作権
;;
;;  This program is free software; you can redistribute it and/or modify
;;  it under the terms of the GNU General Public License as published by
;;  the Free Software Foundation; either version 2 of the License, or
;;  (at your option) any later version.
;;
;;  This program is distributed in the hope that it will be useful,
;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;  GNU General Public License for more details.
;;
;;  You should have received a copy of the GNU General Public License
;;  along with this program; if not, write to the Free Software
;;  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
;;
;;  著作権は保持しますが、複製・配布・変更は大歓迎。変更してもその事を
;;  書いてくれれば連絡はいりません。配布の際は、無保証、無請求でおねが
;;  いします。詳しくは 「GNU General Public License version 2」を見て
;;  ください。
;;
;;  ■ 何ができるのか？
;;
;;  カーソルで項目を選ぶことの出来るメニューです。ＤＯＳのファイルセレ
;;  クタのような感じで使えます。項目は簡単に追加できるので、マウスでメ
;;  ニューバーをクリックしたくない人は、あまり使わないコマンドを登録し
;;  ておくだけでも便利でしょう。サンプルプログラムでも、まあまあうれし
;;  い機能を持っているはずです。直感でもある程度はカスタマイズできます
;;  が、ちょっとＬｉｓｐを勉強すると結構色々出来てしまいます。使い方は
;;  あなた次第！別途、misc-Uz.el が必要です。また、単体では動作しま
;;  せん。あくまでライブラリです。 Ic ライブラリと、呼んでください。
;;
;;  説明文章中にサンプルがあります。
;;
;;	Ver.5 より、木構造の表現が出来るようになりました。
;;
;;  ■ インストール方法
;;
;;  このファイルを、変数 load-path に、登録されたディレクトリに、コピー
;;  してください。良く解らない人は、C-h C-v load-path と入力すると、コ
;;  ピーすべきディレクトリが表示されます。次に実際にメニューを定義する
;;  ファイル(例えば : Ic-Um4.el)を用意して、~ /.emacs に以下のよう
;;  に、追加してください。
;;
;;      (load-library "Ic-Um4")
;;
;;  高度な例として、ファイルマネージャと、デバッガ関連のプログラムもお
;;  試し下さい。結構便利です。
;;
;;  色の定義が気に入らない方は、ソースの一番最初にあるように自由に変え
;;  てくれて構いません。
;;
;;  高度なサンプルでは、文字列を編集入力するときに再帰編集を使っていま
;;  す。この時、再帰編集を抜けるために、通常は C-x C-s を入力しますが、
;;  以下の変数を~/.emacs に指定することで変更できます。
;;
;;  (setq Ic-recursive-key "\C-x\C-s")
;;
;;  一方、再起編集をキャンセルしたいときには以下のキーバインドで、復帰
;;  します。(この説明では良く判らないかもしれませんね。Ufm で f2 f4 と
;;  押して表示文字列を入力する場面で、キャンセルしたいときに相当します)
;;
;;  (setq Ic-recursive-key2 "\C-x\C-k")
;;
;;  ■デフォルト・キーバインド
;;
;;  Ic-mode-map にキーバインドしてください。
;;
;;      q                       キャンセル
;;
;;      RET                     実行
;;
;;      up      down            カーソル上下
;;      C-n     C-p
;;
;;      C-up    C-down          カーソル上下(5つ)
;;
;;      left    right           カーソル左右
;;      C-f     C-b
;;
;;      spase   BS              ノード移動
;;      C-left  C-right
;;      M-n     M-p
;;
;;      prior   next            表示をスクロール
;;      S-up    S-down
;;      C-v     M-v
;;
;;		home    end				表示の最初(最後)に移動
;;
;;      C-s C-r                 表示ウインドウ内のインクリメンタルサーチ
;;      M-s M-r
;;
;;      S-right S-left          インデックスを正規表現サーチ
;;      C-M-s   C-M-r
;;
;;      + -                     ウインドウの分割数を変える
;;
;;      mouse-1                 セレクション
;;      mouse-2                 項目セレクト(ダブルクリックで実行)
;;
;;      tab                     検索文字列の登録
;;      M-up M-down             文字列の検索
;;
;;  ■ 使用例（あくまで例です。どんな風にも使えます）
;;
;;  以下を [~/.emacs] に追加してみて、ｆ１０を押してみると・・・
;;
;;  (require 'Ic)
;;  (define-key global-map [f10] 'sample-func)
;;
;;  ;▼簡単な関数の例
;;  (defun sample-func ()
;;      (interactive)
;;      (let ((func (Ic 'sample-table 'sample-option)))(if func (call-interactively func)))
;;      )
;;
;;  ;▼option は、題名や特殊キーバインドなどを与えます
;;  (setq sample-option '(
;;          (title "サンプル")
;;      ))
;;
;;  ;▼table は、各項目の題名や説明文字、返す値等を保持するリストです。
;;  (setq sample-table '(
;;      ("一括置換"             query-replace                   "変換文字列と変換後の文字列を順に入力してください。")
;;      ("一括置換 正規表現"    query-replace-regexp            )
;;      ("検索 前方"            search-forward                  )
;;      ("検索 前方 再"         re-search-forward               )
;;      ("検索 前方 正規表現"   search-forward-regexp           )
;;      ("検索 後方"            search-backward                 )
;;      ("検索 後方 再"         re-search-backward              )
;;      ("検索 後方 正規表現"   search-backward-regexp          )
;;      ("矩形   Kill"          kill-rectangle                  "ポイントとマークの間を、四角形に切り出します。")
;;      ("矩形   Yank"          yank-rectangle                  "四角形領域をコピーします。")
;;      ("矩形   レジスタに"    copy-rectangle-to-register      )
;;      ))
;;
;;  もっとも、この用途には拙作 Um4 を使った方がいいです。元々こういっ
;;  た用途のために作ったようなものですから。
;;
;;  ●もうひとつ例を挙げときましょう。この部分を切り出して .emacs に追加
;;  するなりしてみてください。yank 内容をみながら挿入編集出来るもので、
;;  場合によっては有用です。
;;
;; (require 'Ic)
;; (require 'misc-Uz)
;; 
;; (global-set-key [f10] 'Ic-Yank)
;;
;; (defun Ic-Yank ()
;; 	(interactive)
;; 	(let ((STR (Ic 'Ic-Yank-table 'Ic-Yank-option)))(if STR (insert STR)))
;; 	)
;; 
;; (defvar Ic-Yank-table nil)
;; (defvar Ic-Yank-option '(
;; 	(title "e:編集 D:削除 l:長さ設定 ret:挿入")
;; 	(wink 3)(refresh (progn (Ic-yank-refresh)(Ic-refresh)))
;; 	(keymap Yank-map)
;; 	))
;; (defvar Yank-map (make-keymap))
;; (define-key Yank-map "e" '(lambda () (Ic-redit '(U-mod kill-ring Ic-IDX (buffer-substring (point-min) (point-max))))(Ic-yank-refresh)))
;; (define-key Yank-map Ic-return-key	'Ic-yank-return)
;; (define-key Yank-map "D" '(lambda ()(U-del kill-ring Ic-IDX)(Ic-yank-refresh)))
;; (define-key Yank-map "l" '(lambda ()(setq kill-ring-max (string-to-number (read-from-minibuffer "削除リングの長さ : " "30")))))
;; 
;; (defun Ic-yank-refresh ()
;; 	(setq Ic-Yank-table (mapcar (function(lambda (A)(list nil nil A))) kill-ring))
;; 	)
;; 
;; (defun Ic-yank-return (&optional F)
;; 	(let ((N(nth Ic-IDX kill-ring)))
;; 	(U-del kill-ring Ic-IDX)
;; 	(setq kill-ring (append (list N) kill-ring))
;; 	(x-set-selection t N)
;; 	(setq Ic-return N)
;; 	(setq kill-ring-yank-pointer (cons N (nthcdr 1 kill-ring)))
;; 	(Ic-quit)
;; 	))
;; 
;;  ■ 機密情報Ａ
;;
;;      以下の文章は、物好きなＥｍａｃｓＬｉｓｐプログラマのためのライ
;;      ブラリ情報である。っていうか、俺のメモです。
;;
;;      この文をいったい何人の人が読むか判らないけれど、もし、このライ
;;      ブラリを使ってみたいという人がいたら、遠慮無くメールで質問して
;;      ください。多分、読んでも判らないだろうから。
;;
;;  ・呼び出し方
;;
;;      (Ic 'table 'option)
;;
;;      table と list と云う二つのシンボルを引数にとる。詳細は次章に示
;;      すが、概略を説明すると、table は各項目に対する情報で、option
;;      はメニュー全体に対する情報だ。
;;
;;      Ic 関数は ウインドウを２つ作るが、これを milk と wine と名
;;      付ける。milk には、項目が表示されてこれをカーソルで選ぶと以下
;;      の値を返す。
;;
;;      (nth 1 (nth Ic-IDX table))
;;
;;      ここで、Ic-IDX はカーソル位置を示すインデックスで、このラ
;;      イブラリではもっとも重要な変数です。
;;
;;      一方、wine ウインドウにはカーソルの移動に伴って色々な情報が表
;;      示される。表示されるものは、(nth 2 (nth Ic-IDX table)) の
;;      値である。
;;
;;      ちなみに (nth 0 (nth Ic-IDX table))は、項目の題名を与える。
;;
;;      だいたいの動作はこんな感じ。加えて色々な機能をつけて行くうちに
;;      自分でもわけが判らなくなった。
;;
;;      たとえば、milk ウインドウを分割して沢山表示できるモード(wink
;;      mode)は拙作 Ufm などで使われる。
;;
;;      特有なキーバインドを Ic 関数に渡すことで、Ufm のように色々
;;      な動作を指定することができる。
;;
;;      Ic 関数の中で Ic を呼んでも、大丈夫なように作ってある。
;;      ミニバッファから呼ばれても、たぶん大丈夫。
;;
;;  ・table は、次の形式の値を持つシンボル(全ての要素を持つ必要はない)
;;
;;      (("string" return expression next1 next2 user emphasize rest key-select local-keymap open-treep)...)
;;
;;      [0]string
;;
;;              表題文字
;;
;;              ｎｉｌならば、番号表示をする。アトムなら印字結果を表示
;;              する。リストなら、評価して結果を文字列に直して表示する。
;;
;;      [1]return
;;
;;              リターンキーが押されたときに、Ic 関数が返す値
;;
;;              シンボル・文字列・数値などは即座に Ic 関数の戻り値
;;              として返されるが、リストの場合は関数呼び出しとして評価
;;              して、nil をリターンします。この時、特定の値を返したけ
;;              れば、(Ic-return ***) のような呼び出しをすれば良い。
;;              だたし、ｃａｒが ｎｉｌであるリストは特別で、ｃｄｒを
;;              ｅｖａｌ評価してリターンしない。
;;
;;      [2]expression
;;
;;              カーソルが来たときにもう一つのウインドウ Ic-name-wine
;;              に表示される文字列
;;
;;              文字列はそのまま表示、アトムは変数として印字結果を表示、
;;              リストなら、評価して結果を文字列に直して表示する。ｎｉ
;;              ｌで始まるリストの場合、ウインドウの内容は消去されず、
;;              ｃｄｒをｅｖａｌ評価する。Ic wine がセレクト中のウ
;;              インドウになるので、自由に操作して良い。これは、カーソ
;;              ルが移動する度に起動される関数として使ってもいいのだ。
;;
;;      [3]next1 [4]next2
;;
;;              それぞれ次のノードの引数リストとオプションリスト。
;;              または、その値を持つを持つシンボル。
;;
;;      [5]user
;;
;;              ユーザが勝手に利用できる領域です。次期バージョンの互換
;;              性を保つために機能を追加するときには、このフィールドを
;;              使ってください。（いったい誰が使うのか？）
;;
;;      [6]emphasize
;;
;;              その項目に対する、選択状態での表示方法を以下の形式で与
;;              える。((line top end face)(0 0 10 face)...)  これは、
;;              項目を構成する line 行目の カラム top ～ end を face
;;              で表示するって事。nil の場合には、最初の行を黄色くしま
;;              す。（下位ノードがあるならば、緑）
;;
;;      [7]rest
;;
;;              その項目に対する、未選択状態での表示方法を以下の形式で
;;              与える。((line top end face)(0 0 10 face)...)  これは、
;;              項目を構成する line 行目の カラム top ～ end を face
;;              で表示するって事。nil の場合には、ｆａｃｅをかけません。
;;
;;      [8]key-select
;;
;;              ショートカット文字の明示指定
;;
;;      [9]local-keymap
;;
;;              その項目に特有な、ローカルキーマップを与える。
;;
;;      [10]open-treep
;;
;;              tree もーどの時に下位のノードを表示するか？
;;
;;
;;  ・option    は、次の形式の値を持つシンボル
;;
;;      ((name arg arg ...)...)
;;
;;      name            オプション名
;;      args            引数・・・
;;
;;  ・オプション詳細
;;
;;      (title "title strings")
;;
;;          先頭に紫色に表示します。今のところ１行しかサポートしていま
;;          せん。それ以上使う文字列を指定すると、表示が少しおかしくなっ
;;          てしまいます。文字列でない場合は、評価して結果を表示します。
;;
;;      (milk-width 45)
;;
;;          Ic-name-milk ウインドウの幅を指定します。Ic-wink が
;;          指定されていないときに限って、wine-width に優先して設定し
;;          ます。
;;
;;      (wine-width 54)
;;
;;          Ic-name-wine ウインドウの幅を 54 に指定します。
;;
;;      (wine-split 1 3)
;;
;;          Ic-name-wine ウインドウの幅を 1 / 3 に指定します。
;;
;;      (vertical)
;;
;;          Ic-name-milk と Ic-name-wine を垂直分割します。
;;
;;      (keymap ...)
;;
;;          独自の拡張キーバインドを keymap で与えます。ディフォルトの
;;          バインドの前に検索するので、上書き可能です。下位ノードでは、
;;          新たにバインドし直さない限り、上位ノードの拡張キーバインド
;;          が継承されます。
;;
;;      (no-keymap)
;;
;;          デフォルトのキーマップの検索を実行しません。ノード独自のキー
;;          マップか、項目独自のローカルキーマップがしていされていない
;;          と、かたまちゃうのだ。
;;
;;      (wink 3)				３分割刷る
;;      (wink (15 27 36 17))	分割数とウインドウの幅設定(未実装)
;;
;;          複数行表示モード。Ic milk ウインドウを縦に分割する。右
;;          左キーで横に移動できます。ノード切り替えは、C-left C-right
;;          で行ってください。タイトルや項目につき一行以上を使うような、
;;          メニューには向きません。表示やカーソル移動が変になります。
;;
;;      (wink-less 10)
;;
;;          複数行表示モード。最低１０行を確保して分割します。
;;
;;      (no-wine)
;;
;;          wine ウインドウを表示しません。
;;
;;      (before-exec    (progn 云々))   キーバインドされた関数を実行する前
;;      (after-exec     (progn 云々))   キーバインドされた関数を実行する後
;;      (start          (progn 云々))   起動したときに実行
;;      (end            (progn 云々))   Ic 終了するときに必ず実行
;;      (refresh        (progn 云々))   ノードが切り替わった時に実行
;;      (after-key      (progn 云々))   ローカルキーバインドを実行した後に実行
;;
;;          ウインドウ情報をそのまま保存するには、次の文を実行すれば良い。
;;          (setq Ic-history (current-window-configuration))
;;
;;      (wine-cut)
;;      (milk-cut)
;;
;;          はみ出した行を折り返し表示しないようにする
;;
;;      (wine-mode-line ....)
;;      (milk-mode-line ....)
;;
;;          モードライン書式を設定する
;;
;;      (short-cut &rest eval)
;;
;;          １～９・０・ａ～ｚに対して、項目を選択するか、あれば下位の
;;          ノードに移るようにします。ただしｑは終了キーに使うので禁止。
;;          table に key-select の項目があれば、それを優先します。eval
;;          が指定してあればそれを実行し、無ければノードを降下し、ノー
;;          ドもなければその時点を実行する。
;;
;;      (short-disp)
;;
;;          ショートカットの文字を、項目の最初に印字します。
;;
;;      (notcls-win)
;;
;;          第三引数が nil の場合に Ic wine バッファをクリアしない。カー
;;			ソルが移動するとき、必ず Ic wine バッファはクリアーされる。
;;			されないのは、このオプションが指定されているときか、(nil
;;			eval) 形式の表示の時のみである。
;;
;;
;;      (save-node Ic-Table-list)
;;
;;          次に起動したときにノードの位置情報を再現する。引数に指定さ
;;          れている値は位置情報を与えるが、値自体は終了の際に Ufm が
;;          自動的に保存するので気にしないでいい。
;;
;;      (tree)
;;
;;          ツリーモードでですよ。すごいいですすよ。なんだかういいんど
;;          うずみたいですすよよ。やってみれば、わかるるですよ。
;;		    speedbar.el みたい？
;;
;;      (under-milk)
;;
;;			表示文字列を wine ではなく、milk の後ろに出力する
;;
;;
;;  ・コメント
;;
;;      Icの引数を、シンボル名で渡した理由は、ｌｉｓｐを勉強最中に
;;      つくったので内部で項目を変更しても呼び出しが戻ったときには、も
;;      との状態に戻っている事を期待したからである。しかし、リストはコ
;;      ピーして渡されるわけではないで、そんなことは起らなかった。今と
;;      なっては、この仕様は何だかいいような気もするし、大変な足枷になっ
;;      てしまったような気もするが、変更は容易ではない。ま、いいか。
;;
;;		何年か後、この仕様は大変なデザイン不良で有ることが判明した。やれやれ。
;;
;;
;;   (define-key [S-f1]	'Ic-menu-insert  )   ; 挿入
;;   ([M-f1]          Ic-menu-delete  )   ; 削除
;;   ([delete]        Ic-menu-push    )   ; ＰＵＳＨ
;;   ([insert]        Ic-menu-pop     )   ; ＰＯＰ
;;   ([f1]            Ic-menu-insert  )   ; 追加
;;   ([f7]            Ic-menu-short)      ; ショートカット指定
;;   ([M-f7]          Ic-menu-short-del)  ; ショートカット削除
;;   (format "%10s : %s\n" (U-map-to-keystr 'Ic-menu-insert  Ugdb-map)   "項目の追加")
;;   (format "%10s : %s\n" (U-map-to-keystr 'Ic-menu-title       Ugdb-map)   "タイトルの変更")
;;   (format "%10s : %s\n" (U-map-to-keystr 'Ic-menu-push        Ugdb-map)   "項目を削除して記憶バッファに保存")
;;   (format "%10s : %s\n" (U-map-to-keystr 'Ic-menu-pop     Ugdb-map)   "記憶バッファからそこに挿入")
;;   (format "%10s : %s\n" (U-map-to-keystr 'Ic-menu-short       Ugdb-map)   "ショートカットの設定")
;;   (format "%10s : %s\n" (U-map-to-keystr 'Ic-menu-short-del   Ugdb-map)   "ショートカットの削除")
;;
;;
;;●下位関数で使う関数(メモ)
;;
;;
;;	(defvar Ic-return-key [return])
;;	(defconst Ic-name-milk " *Ic milk*")
;;	(defconst Ic-name-wine " *Ic wine*")
;;
;;	(catch 'Ic-NEXT t)				全てをキャンセルして次のキーバインドを読み込む
;;	(catch 'Ic-BREAK t)				全てをキャンセルしてライブラリを終了する
;;
;;	キーバインドの読み込み
;;			↓
;;	(Ic-option 'before-exec) の実行
;;			↓
;;	keybind か (Ic-idx 1) の実行
;;			↓
;;	もし (= t Ic-ae) なら、(Ic-option 'after-exec) の実行(設定しない限り常に t)
;;			↓
;;	Ic-keep-buffer は、メニュー終了時に表示するバッファを保持する。
;;			↓
;;	もし、(eq Ic-refresh t)		ならメニューの再表示(設定しない限り常に t)
;;	もし、(eq Ic-refresh save)	ならメニューの再表示(設定しない限り常に t) 但し表示窓のバッファ位置はキープする。
;;
;;	(before-exec    (progn 云々))   キーバインドされた関数を実行する前
;;	(after-exec     (progn 云々))   キーバインドされた関数を実行する後
;;	(start          (progn 云々))   起動したときに実行
;;	(end            (progn 云々))   Ic 終了するときに必ず実行
;;	(refresh        (progn 云々))   ノードが切り替わった時に実行
;;	(after-key      (progn 云々))   ローカルキーバインドを実行した後に実行
;;
;;
;;  (notcls-win)
;;
;;          第三引数が nil の場合に Ic wine バッファをクリアしない。
;;
;;   (save-node Ic-Table-list)
;;
;;          次に起動したときにノードの位置情報を再現する。引数に指定さ
;;          れている値は位置情報を与えるが、値自体は終了の際に Ufm が
;;          自動的に保存するので気にしないでいい。
;;
;;  ■ 独り言
;;
;;  1997.12.21
;;
;;      もしかしたら、こんなものはもうとっくに誰かが作っているのかも知
;;      れない。しかも、もっと凄いものが。しかしそういうことを作者に教
;;      えてはいけない。彼は休日の大きな部分をこのプログラミングに費や
;;      しているのだ。そして、少しばかりの人が便利だと感じてくれれば、
;;      幸せな気分になって更に貴重な休日を捧げることだろう。
;;
;;  1998.5.5
;;
;;      ソースをきれいにした。綺麗にしていい事があったためしはないから、
;;      きっと、新しいバグが入っている。でも、綺麗にせずにはおれない。
;;      それがアマチュアプログラマ。やれやれ。
;;
;;  1999.3.5
;;
;;      表示がおかしくなるバグを退治しました。今日で私は22才になりました。
;;      最近 SNES で遊んでます。でもこれって時間の無駄だよな。
;;
;;  2000.8.29
;;
;;      ２年もたつのか・・・・もう２３才だ。やれやれ。たいして成長して
;;      ない気がする。休日はフリーソフトを作り、たいしてうまくないギター
;;      を弾き、村上春樹読み学生とたいして変わらない毎日を送っている。
;;
;;  2000.10.28
;;
;;      tree-mode 追加
;;
;;  2001.02.17
;;
;;		customize に対応。defgroup に Ic を追加。
;;
;;
;;

;;; Code:

(require 'misc-Uz)

;-------------------------------------------------------------------------------
;
;   解説 :  カスタマイズ用変数
;
(defgroup Ic nil "Customization of the multI purpose object seleCtor { Ic }.")

(defcustom Ic-return-key	 [return]
	"メニューの中で項目の選択などリターンキーとして扱われるキー"
	:group 'Ic :type 'sexp)

(defcustom Ic-recursive-key	 "\C-x\C-s"
	"メニューの中で再起編集復帰の為のキー"
	:group 'Ic :type 'sexp)

(defcustom Ic-recursive-key2	 "\C-x\C-k"
	"メニューの中で再起編集キャンセルの為のキー"
	:group 'Ic :type 'sexp)

(defcustom Ic-Face-cur       'R-Yellow
	"カーソルの色" :group 'Ic)

(defcustom Ic-Face-cur2      'R-Green
	"カーソルの色（下降ノードがあるとき）" :group 'Ic)

(defcustom Ic-Face-title     'R-Ic1
	"タイトルバーの色" :group 'Ic)

(defface C-Blue '(
;;	(((class color)(background dark))	(:foreground "#10d5d5"))
;;	(((class color)(background light))	(:foreground "#2222FF"))
	(((class color)(background dark))	(:foreground "#10d5d5"))
	(((class color)(background light))	(:foreground "SlateBlue1"))
    )
	"青色" :group 'Ic)

(defface R-Blue '(
	(((class color)(background dark))	(:background "#00dddd" :foreground "black"))
	(((class color)(background light))	(:background "#7777FF" :bold t))
    )
	"青色 反転" :group 'Ic)

(defface C-Red '(
	(((class color)(background dark))	(:foreground "#ff4030"))
	(((class color)(background light))	(:foreground "#aa0000"))
    )
	"赤色" :group 'Ic)

(defface R-Red '(
	(((class color)(background dark))	(:background "#ff4030" :foreground "black"))
	(((class color)(background light))	(:background "#FFAAAA")); :foreground "blue"))
    )
	"赤色 反転" :group 'Ic)

(defface C-Yellow '(
;;	(((class color)(background dark))	(:foreground "#d9de10"))
;;	(((class color)(background light))	(:foreground "#333300"))
	(((class color)(background dark))	(:foreground "#d9de10"))
	(((class color)(background light))	(:foreground "salmon3"))
    )
	"黄色" :group 'Ic)

(defface R-Yellow '(
;	(((class color)(background dark))	(:background "#d9de10" :foreground "black"))
;	(((class color)(background light))	(:background "#eeee55" :foreground "black"))
	(((class color)(background dark))	(:background "#ff0000" :foreground "black"))
	(((class color)(background light))	(:background "#a08000" :foreground "black"))
    )
	"黄色 反転" :group 'Ic)

(defface C-Green '(
	(((class color)(background dark))	(:foreground "#10f010"))
	(((class color)(background light))	(:foreground "#009000"))
    )
	"緑色" :group 'Ic)

(defface R-Green '(
	(((class color)(background dark))	(:background "#10f010" :foreground "black"))
	(((class color)(background light))	(:background "#a0e0a0"))
    )
	"緑色 反転" :group 'Ic)

(defface C-Purple '(
;;	(((class color)(background dark))	(:foreground "#ff80ff"))
;;	(((class color)(background light))	(:foreground "#e050e0"))
	(((class color)(background dark))	(:foreground "#ff80ff"))
	(((class color)(background light))	(:foreground "#e050e0"))
    )
	"紫色" :group 'Ic)

(defface R-Purple '(
	(((class color)(background dark))	(:background "#ff80ff" :foreground "black"))
	(((class color)(background light))	(:background "#F060F0" :foreground "#00FF00" :bold t))
    )
	"紫色 反転" :group 'Ic)

(defface R-Ic1 '(
	(((class color)(background dark))	(:foreground "#00ff00" :background "#a020f0"))
	(((class color)(background light))	(:foreground "#00aa00" :background "#F060F0"))
    )
	"表題" :group 'Ic)
;------------------------------------------------------------------------------------------

(defconst Ic-name-milk " *Ic milk*")
(defconst Ic-name-wine " *Ic wine*")

(defvar Ic-PP         nil)			; プッシュポップのための変数
(defvar Ic-before-rec-hook  nil)    ; 再起編集の前に実行されるフック
(defvar Ic-tajyuu   0)
(defvar Ic-hook   nil)
;-------------------------------------------------------------------------------
;
;   解説 :  キーバインド
;
;

(defvar Ic-mode-map (make-sparse-keymap))

;実行と終了
(define-key Ic-mode-map Ic-return-key		'Ic-exec        )
(define-key Ic-mode-map "q"                 'Ic-quit        )
(define-key Ic-mode-map "+"                 (lambda ()(Ic-resplit '+)))
(define-key Ic-mode-map "-"                 (lambda ()(Ic-resplit '-)))

;上下
(define-key Ic-mode-map [up]                'Ic-up          )
(define-key Ic-mode-map [down]              'Ic-down        )
(define-key Ic-mode-map "\C-p"              'Ic-up          )
(define-key Ic-mode-map "\C-n"              'Ic-down        )

;for term
(define-key Ic-mode-map "OA" 'Ic-up)
(define-key Ic-mode-map "OB" 'Ic-down)
(define-key Ic-mode-map "OC" 'Ic-right)
(define-key Ic-mode-map "OD" 'Ic-left)
(define-key Ic-mode-map [13] 'Ic-exec)
;(define-key Ic-mode-map [RET] 'Ic-exec)	;comment out for xemacs
(define-key Ic-mode-map [return] 'Ic-exec)

;ジャンプ移動
(define-key Ic-mode-map [(control up)]      'Ic-5-up        )
(define-key Ic-mode-map [(control down)]    'Ic-5-down      )

;左右キー
(define-key Ic-mode-map [right]             'Ic-right       )
(define-key Ic-mode-map [left]              'Ic-left        )
(define-key Ic-mode-map "\C-f"              'Ic-right       )
(define-key Ic-mode-map "\C-b"              'Ic-left        )

;ノード移動
(define-key Ic-mode-map [(control right)]   'Ic-next-node   )
(define-key Ic-mode-map [(control left)]    'Ic-prev-node   )
(define-key Ic-mode-map [spase]             'Ic-next-node   )
(define-key Ic-mode-map [backspase]         'Ic-prev-node   )
(define-key Ic-mode-map "\M-n"              'Ic-next-node   )
(define-key Ic-mode-map "\M-p"              'Ic-prev-node   )

;現在の文章を検索
(define-key Ic-mode-map "\C-s"              (lambda () (Ic-write-wine (setq Ic-refresh nil)(isearch-forward))))
(define-key Ic-mode-map "\C-r"              (lambda () (Ic-write-wine (setq Ic-refresh nil)(isearch-backward))))
(define-key Ic-mode-map "\M-s"              (lambda () (Ic-write-wine (setq Ic-refresh nil)(isearch-forward-regexp))))
(define-key Ic-mode-map "\M-r"              (lambda () (Ic-write-wine (setq Ic-refresh nil)(isearch-backward-regexp))))


;題名を検索して項目に移動
(define-key Ic-mode-map "\C-\M-r"           'Ic-search-b-IDX)
(define-key Ic-mode-map "\C-\M-s"           'Ic-search-f-IDX)
(define-key Ic-mode-map [(shift left)]      'Ic-search-b-IDX)
(define-key Ic-mode-map [(shift right)]     'Ic-search-f-IDX)

;文章を検索して項目に移動
(define-key Ic-mode-map [tab]               'Ic-search-STR  )
(define-key Ic-mode-map [(meta down)]       'Ic-search-r-STR)
(define-key Ic-mode-map [(meta up)]         'Ic-search-b-STR)

;スクロール
(define-key Ic-mode-map [(shift down)]				'Ic-wine-sdown)
(define-key Ic-mode-map [(shift up)]				'Ic-wine-sup)
(define-key Ic-mode-map [next]              		'Ic-wine-sdown)
(define-key Ic-mode-map [prior]             		'Ic-wine-sup)
(define-key Ic-mode-map "\C-v"              		'Ic-wine-sdown)
(define-key Ic-mode-map "\M-v"              		'Ic-wine-sup)
(define-key Ic-mode-map [mouse-5]           		'Ic-wine-sdown)
(define-key Ic-mode-map [mouse-4]           		'Ic-wine-sup)
(define-key Ic-mode-map [double-mouse-5]    		'Ic-wine-sdown)
(define-key Ic-mode-map [double-mouse-4]    		'Ic-wine-sup)
(define-key Ic-mode-map [triple-mouse-5]    		'Ic-wine-sdown)
(define-key Ic-mode-map [triple-mouse-4]    		'Ic-wine-sup)
;
(define-key Ic-mode-map [end]	(lambda () (Ic-write-wine (setq Ic-refresh nil)(goto-char (point-max)))))
(define-key Ic-mode-map [home]	(lambda () (Ic-write-wine (setq Ic-refresh nil)(goto-char 0))))

;マウス
(define-key Ic-mode-map [down-mouse-1]      'Ic-mouse-1         )
(define-key Ic-mode-map [mouse-2]           'Ic-mouse-2         )
(define-key Ic-mode-map [double-mouse-2]    'Ic-mouse-2         )
(define-key Ic-mode-map [(control meta end)]'Ic-recursive-edit  )

;フレーム間再帰編集
;(define-key Ic-mode-map [switch-frame]      'Ic-recursive-edit	)

(defun Ic-recursive-edit ()
    (condition-case nil (handle-switch-frame last-input-event)(error))
    (message (concat "Ic : 再起編集に入ります。必ず " (U-map-to-keystr 'exit-recursive-edit global-map) " で、終了してください"))
    (if Ic-history (set-window-configuration Ic-history))
    (recursive-edit)
    )

;うざ
(if (string-match "XEmacs" (version))(progn
    (defun read-event ()
        (let (( e (let ((a (next-event)))(while (not (key-press-event-p a))(setq a (next-event)))a)))
            (if (event-modifiers e)(append (event-modifiers e) (list (event-key e)))(list (event-key e)))
        )
    )))
;-------------------------------------------------------------------------------
;
;   解説 :  ひみつの関数
;
;   このソースは沢山コメントがあるけれど解読しない方が身のためです。一
;   つには、讀んでも判らないって事もあるし、たとえ讀めても汚いプログラ
;   ムであることが判るだけだからです。
;
;	table と option というデータ構造をもっと汎用的に見直す必要を感じて
;	います。でも、今の Emacs Lisp じゃやりたくないな。Guile Emacs が普
;	及したらやります。(イツダヨ)
;
(defun Ic (table option)
    "Ic menu is multi purpose Lisp OBJECT selector.
If you want to use this function , See Ic.el.
"   ;おいおいこの英語モドキ本当にあってる？
    (interactive)
	;フックの実行
	(if Ic-hook(progn (run-hooks 'Ic-hook)(setq Ic-hook nil)))
    ;エラー処理
    (cond   ((or(not (boundp table))(not (boundp option)))(message "引数が設定されてないよ")(ding))
            ((boundp 'Ic-rec-flg)(message (concat "再起編集中だよ。" (U-event-string Ic-recursive-key) "を押してね"))(ding))
            (t
    ;多重呼び出しはウインドウを一度復帰してから使う
    (if (< 0 Ic-tajyuu)(set-window-configuration Ic-history))
    ;実行開始
    (let* (
        ;-------------------------------------------------------------------------------
        ;変数束縛
        (Ic-Table           table                                   )   ; 表示要素
        (Ic-Option          option                                  )   ; オプション
        (Ic-IDX             0                                       )   ; カーソルが指している所（０から始まる番号）
        (Ic-return          nil                                     )   ; 返値
        (Ic-quit            nil                                     )   ; メニューを出るときにセットしてくれな
        (Ic-title-str       nil                                     )   ; 先頭の表示行
        (Ic-max             0                                       )   ; 要素数
        (Ic-Table-list                                                  ; ノードを上がるときのための、記録用スタック((table option IDX)()...)
            (let* (
                (OP(Ic-option 'save-node 1))                ;
                (B  (if OP (nth (1- (length OP)) OP)nil))                   ;最後の値を使う
                )                                               ;IDX については最初の値を使う
            (if OP  (progn (setq Ic-Table (car B))(setq Ic-Option (nth 1 B))(setq Ic-IDX (nth 2 (car OP)))OP)
                    (list (list table option 0)))
            ))
        (Ic-win-milk        nil                                     )   ; milk window 起動前のウインドウ
        (Ic-win-wine        nil                                     )   ; wine window 新しく作ったウインドウ
        (Ic-before-buffer   (current-buffer)                        )   ; 起動前の選択バッファ
        (Ic-history         (current-window-configuration)          )   ; 起動前のウインドウ状態
        (Ic-owin            nil                                     )   ; 起動時のその他のウインドウ
        (Ic-keep-buffer     nil                                     )   ; 終了時に開始とは違うバッファを表示したい時
        (Ic-keep-windows    nil                                     )   ; 終了時に開始とは違うウインドウ構成を表示したい時
        (Ic-wink            nil                                     )   ; wink mode の 分割 milk ウインドウ数
        (Ic-milk-list       nil                                     )   ; wink mode の 分割 milk リスト(沢山あるからね)
        (Ic-no-wine         nil                                     )   ; wine ウインドウの表示をしないか

        (Ic-keymap          nil                                     )   ; 独自のキーマップ
        (Ic-local-keymap    nil                                     )   ; ローカルキーマップ
        (Ic-lines           nil                                     )   ; 表示行数の保存スタック (2 3 4 ...)

        (Ic-refresh         t                                       )   ; キー実行後 t はリフレッシュ(default) save は wineの表示開始位置を保存する
        (Ic-before-exec     nil                                     )   ; キー実行前 評価する
        (Ic-after-exec      nil                                     )   ; キー実行後 評価する
        (Ic-ae			    nil                                     )   ; キー実行後 評価しないフラグ
        (Ic-first           t                                       )   ; はじめてかどうかのフラグ
        (Ic-short-cut       nil                                     )   ; ショートカットの評価リストもしくはショートカット認識用フラグ
        (Ic-short-disp      nil                                     )   ; ショートカットを表示するかどうか
        (Ic-null-format     '(format "----< %d >----" Ic-IDX)       )   ; 項目の表示文字がnilの時の実行リスト

        (Ic-wink-ofs        0                                       )   ; ページ自体の始まる項目IDX
        (echo-keystrokes    0                                       )   ; 煩いのでな

        (Ic-directory-wine  (if (get-buffer Ic-name-wine)           ; ディレクトリの保存
                (save-excursion (set-buffer (get-buffer Ic-name-wine))default-directory)))
        (Ic-directory-milk  (if (get-buffer Ic-name-milk)           ; ディレクトリの保存
                (save-excursion (set-buffer (get-buffer Ic-name-milk))default-directory)))

;       (Ic-recbuf-wine (if (and (boundp 'Ic-rec-flg) (get-buffer Ic-name-wine))    ; バッファ内容の保存
;               (save-excursion (set-buffer (get-buffer Ic-name-wine))(buffer-string))
;               ))
;       (Ic-recbuf-milk (if (and (boundp 'Ic-rec-flg) (get-buffer Ic-name-milk))    ; バッファ内容の保存
;               (save-excursion (set-buffer (get-buffer Ic-name-milk))(buffer-string))
;               ))

;       (Ic-history-win     nil                                     )   ;!!!
;       (Ic-history-refresh     nil                                 )   ;!!! ウインドウサイズなどの変更がある場合にはこれを実行する。
        )
        ;-------------------------------------------------------------------------------
        ;ミニバッファからの呼び出しは、ミニバッファのウインドウから逃げる
        (if (window-minibuffer-p (selected-window))(progn (while (window-minibuffer-p (selected-window))(other-window 1))(delete-other-windows)))
        ;本体
        (unwind-protect (progn
        (setq Ic-tajyuu (1+ Ic-tajyuu))
        (walk-windows (lambda (WIN)(if (eq WIN (selected-window))()(setq Ic-owin (append Ic-owin (list WIN))))))
        (Ic-refresh)
        (setq major-mode            'Ic-mode                )
        (setq mode-name             "Ic"                    )
        (if (Ic-option 'start 0)(eval (Ic-option 'start 1)))
        (catch 'Ic-BREAK (let ((KEY nil)(PREFIX nil)                )
        ;メインループ
        (condition-case nil (while t
            (if Ic-quit     (throw 'Ic-BREAK t))    ; 終了
            (if Ic-return   (throw 'Ic-BREAK t))    ; 終了
            (setq KEY (vector (read-event)))        ; イベント取得
            ;コマンド検索
            (let((func))(cond
                ((and (keymapp PREFIX)                  (setq func (lookup-key PREFIX KEY t))(not (numberp func)))func)			; prefix    map
                ((and (keymapp Ic-local-keymap)     (setq func (lookup-key Ic-local-keymap KEY t))(not (numberp func)))func)    ; point     map
                ((and (keymapp Ic-keymap)           (setq func (lookup-key Ic-keymap KEY t))(not (numberp func)))func)          ; node      map
                ((and (not(Ic-option 'no-keymap))   (setq func (lookup-key Ic-mode-map KEY t))(not (numberp func)))func)        ; global    map
                ((and Ic-short-cut (let ((I Ic-IDX)(NUM(elt KEY 0)))(cond															; short cut
                    ((catch 'SHORT (while(< I Ic-max)(if (eq (Ic-idx 8 I)NUM)(throw 'SHORT t))(setq I (1+ I))))
                            (Ic-short-sub I))               ;specify
                    ((and(numberp NUM)(setq NUM (cond
                        ((and (>= NUM (string-to-char "0"))(<= NUM (string-to-char "9")))(string-to-number (char-to-string NUM)))
                        ((and (>= NUM (string-to-char "a"))(<= NUM (string-to-char "z")))(+ (- NUM (string-to-char "a"))10))
                        ((and (>= NUM (string-to-char "A"))(<= NUM (string-to-char "Z")))(+ (- NUM (string-to-char "A"))36))
                        )))
                            (if NUM (Ic-short-sub NUM)))    ;not specify
                    ))))
                )
            ;実行
            (catch 'Ic-NEXT (cond
                ((null func)    (throw 'Ic-NEXT t))     ; no function
                ((numberp func) (throw 'Ic-NEXT t))     ; why we need?
                ((keymapp func)(setq PREFIX func))      ; prefix
                (t  (if Ic-before-exec (eval Ic-before-exec))                                               ; 前実行

                    (condition-case VAR (funcall func)														; 関数実行
                        (error (message (concat "Ic exec error : " (prin1-to-string VAR)))(ding))
                        (quit (ding))
                        )

                    (setq PREFIX nil)       ; 実行
                    (if Ic-ae (setq Ic-ae nil)(if Ic-after-exec(eval Ic-after-exec)))                       ; 後実行
                    (if(eq t Ic-keep-buffer)(setq Ic-keep-buffer (current-buffer)))							; バッファ保存
                    (if Ic-quit nil (cond   
							; 終了でなければリフレッシュする
							((eq Ic-refresh t)(Ic-refresh))			
							; バッファの位置を変更
                            ((eq Ic-refresh 'save)
                                    (let ((START (window-start Ic-win-wine)))
                                    (Ic-refresh)
                                    (set-window-start Ic-win-wine START)))
							; 表示バッファの一時的変更
							((stringp Ic-refresh)(let ((f Ic-refresh))(Ic-refresh)(select-window Ic-win-wine)(switch-to-buffer f)(select-window Ic-win-milk)))
							; 常にリフレッシュする
                            ((eq Ic-refresh nil)(setq Ic-refresh t))
                        )	; Ic-name-def が設定されていたら、それを表示する
						(if (and Ic-name-def (get-buffer Ic-name-def)) (progn (select-window Ic-win-wine)(switch-to-buffer Ic-name-def)(select-window Ic-win-milk)))
						)
                    )
                ))
            ))(quit(ding)(message "Ic ライブラリ中断したよ"))))))
        ;-------------------------------------------------------------------------------
        ;終了保証
        (mapcar (lambda (SYM)(unintern (symbol-name SYM)))Ic-temp-symbols)(setq Ic-temp-symbols nil)
        (setq Ic-tajyuu (1- Ic-tajyuu))
        (if (eq 0 Ic-tajyuu)(progn
            ;トップレベルの呼び出しの場合
            (set-window-configuration (if Ic-keep-windows Ic-keep-windows Ic-history))
            (if Ic-keep-buffer (switch-to-buffer Ic-keep-buffer))
            (let ((BUFF (get-buffer Ic-name-milk)))(if BUFF (kill-buffer BUFF)))    ; 作業バッファの削除
            (let ((BUFF (get-buffer Ic-name-wine)))(if BUFF (kill-buffer BUFF)))    ; 作業バッファの削除
            );多重呼び出しの場合
            (let ((BUFF (get-buffer Ic-name-milk)))(if (and BUFF Ic-directory-milk)
                (save-excursion
                    (set-buffer BUFF)
                    ;(if (boundp 'Ic-rec-flg)(erase-buffer)(insert Ic-recbuf-milk))
                    (setq default-directory Ic-directory-milk)
                    )))
            (let ((BUFF (get-buffer Ic-name-wine)))(if (and BUFF Ic-directory-wine)
                (save-excursion
                    (set-buffer BUFF)
                    ;(if (boundp 'Ic-rec-flg)(erase-buffer)(insert Ic-recbuf-wine))
                    (setq default-directory Ic-directory-wine)
                    )))
            )
            ;ノードの記憶(最上位ノードの変数にしまわないといけないからね)
            (let ((SY (nth 1 (nth 0 Ic-Table-list))))(if (Ic-option 'save-node 0 (eval SY))(progn
                (set SY (U-del3 'save-node (eval SY)))            ;save-node の項を消去する
                (setq Ic-Table-list (append (list (list
                        (nth 0(car Ic-Table-list))(nth 1 (car Ic-Table-list)) Ic-IDX))
                        (cdr Ic-Table-list)));最初のIDXを現在の値に変更する(最初の IDX は使われないのでここで使用する)
                (set SY (append (eval SY) (list (list 'save-node Ic-Table-list))))
                )))
        )
        (if (Ic-option 'end)(eval (Ic-option 'end 1)))
        Ic-return
    ))))
;-------------------------------------------------------------------------------
;
;   解説 :  ショートカット実行
;
;   この中で、実行するのは美しくないが。
;
(defun Ic-short-sub (IDX)
    (if (> Ic-max IDX)(let (FUNC)
    (Ic-before-cur)
    (setq Ic-IDX IDX)
    (Ic-after-cur)
    (cond
        ((listp Ic-short-cut)   (mapcar (function eval) Ic-short-cut))          ;引数があった場合
        ((Ic-next-node)         )                                               ;ノード下降
        ((and   (keymapp Ic-keymap)
            (setq FUNC (lookup-key Ic-keymap Ic-return-key t)))(funcall FUNC))  ;node map の return の動作
        (t                          (Ic-exec))                                  ;ポイント実行
    )
    (Ic-refresh)
    )))

;-------------------------------------------------------------------------------
;
;   解説 :  リフレッシュ。どんな状態からでも元どおりに戻してしまう。重い。
;           表示内容に変更がない限り、喚ばないで済ますのがいい
;
;	(defvar Ic-refresh	nil)	再表示しない
;						t		する	(ディフォルト)
;						'save	バッファは Ic-name-wine を復帰。表示開始位置は保存。
;						"buff"	指定バッファを表示
;
;	Ic-keep-buffer		Ic 終了時に指定バッファを表示
;
;	Ic-noaf				wine に書込しない時にtに設定する
;
;	(notcls-win)		table[3]==nil の時にバッファをクリアーしない
;
;	Ic-name-def			Ic-name-wine の代わりに常に表示するバッファの名前
;
(defvar Ic-name-def nil)

(defun Ic-refresh ()
    (interactive)
    ;ウインドウ描画
    (Ic-window)
    ;各種変数初期化
    (let((KEYMAP (assoc 'keymap (eval Ic-Option))))(if KEYMAP (setq Ic-keymap (eval (nth 1 KEYMAP)))))
    (setq Ic-before-exec    (Ic-option 'before-exec 1))
    (setq Ic-after-exec     (Ic-option 'after-exec 1))
    (setq Ic-short-cut (let ((CUT (Ic-option 'short-cut 1 nil t)))(if CUT CUT (Ic-option 'short-cut 0))))
    (setq Ic-short-disp (Ic-option 'short-disp 0))
    ;タイトル文字
    (erase-buffer)
	(setq truncate-lines t)
    (let((STR (Ic-option 'title 1)))
        (setq Ic-title-str (if(stringp STR)STR(eval STR))))
    (if Ic-title-str (progn
        (insert Ic-title-str)
        (if (Ic-option 'title 2)()
            (let ((X (/ (- (window-width) (current-column) Ic-wink 2) 2)))
                (if (< 0 X)(let ((SPC (make-string X ?\ )))(insert SPC)(beginning-of-line)(insert SPC)))))
        (goto-char(point-min))
        (setq x (point))
        (goto-char (point-max))
        (put-text-property x (point) 'face Ic-Face-title nil)
        (insert "\n")
    ))
	; NEST : 
	; ├─ (0)
	; ├─ (1)
	; ├┬ (2)
	; │├─ (2 0)
	; │├─ (2 1)
	; │├─ (2 2)
	; │├┬ (2 3)
	; ││└─ (2 3 0)		(Ic-table nil 2 nil 3 0)
	; │├┬ (2 4)
	; ││└─ (2 4 1)
	; │├─ (2 5)
	; │└─ (2 6)
	; ├┬ (3)
	; │├─ (3 0)
	; │├─ (3 1)
	; │└─ (3 2)
	; ├─ (4)
	; └─ (5)
	; LL : 行き場のない枝を作らない処理用 LL : (nil t nil t t) は、"│  │    " あれば nil
	; o  : 次の行に表示する項目の内容
	; NOW: 現在表示する項目
	; I  : 全行数

    (setq Ic-lines nil)
    (let ((OLD Ic-IDX)o(LL nil)(NEST (list 0))NOW)
	    (setq Ic-IDX 0)
		(catch 'B (while t
		;get table
		(while  (not (setq NOW (Ic-table nil NEST)))			;次の候補を探す
				(if (eq 1 (length NEST))(throw 'B t))			;リストがなければ終了
				(U-del NEST -1)								;リストの最後を削る
				(U-add-end NEST)								;リストの最後を＋1する
				(if (eq 0 (length LL))(setq LL nil)(U-del LL -1))					;リストの最後を削る
				)
        ;save line
        (setq Ic-lines (append Ic-lines (list (1+ (count-lines (point-min) (point))))))

        ;short cut
        (if Ic-short-disp (insert (concat "["(cond
            ((nth 8 NOW)(let ((CH (nth 8 NOW)))(if (numberp CH)(char-to-string CH)(prin1-to-string CH)))) ;short cut
            ((and (<= 0 Ic-IDX)(>= 9 Ic-IDX))     (number-to-string Ic-IDX))       ;0-9
            ((and (<= 10 Ic-IDX)(>= 35 Ic-IDX))   (char-to-string (+ 87 Ic-IDX)))  ;a-z
            ((and (<= 36 Ic-IDX)(>= 61 Ic-IDX))   (char-to-string (+ 29 Ic-IDX)))  ;A-Z
            (t " "))
            "] ")))

		;今のノードで残りの表示項目があるかな？
		(let ((A (apply 'list NEST)))
				(U-add-end A)(setq o (Ic-table nil A))
				)
        ;tree
        (if (Ic-option 'tree)(let (z l (a 0))
            (setq l (1- (length NEST)))(while (> l a)(insert (if (nth a LL)"  ""│"))(setq a (1+ a)))
            (insert (if (and (not z) o)"├""└"))
            (insert (if (and (nth 3 NOW)(nth 10 NOW))"┬ " "─ "))
            ))

        ;表示文字列
		(let ((STR (car NOW))) (insert
            (cond   ((null		STR)	(eval Ic-null-format)												)
                    ((stringp	STR)	STR																	)
                    ((atom		STR)	(prin1-to-string (eval STR))										)
                    ((listp		STR)	(let ((RET(eval STR))) (if (stringp RET)RET (make-string 10 ?*)))	)
        )))
        (insert "\n")

        ;color
        (let ((option (nth 7 NOW)))  ;When emphasize is specified.
            (if option
            (mapcar (lambda (a)(Ic-paint (+ (nth Ic-IDX Ic-lines) (nth 0 a))(nth 1 a)(nth 2 a)(nth 3 a))) option)
            )(goto-char(point-max)))

		;next
		(if (and (Ic-option 'tree)(nth 3 NOW)(nth 10 NOW))(progn
			;次のノードが表示状態ならば
			(setq LL (append LL (list (eq nil o))))
			(setq NEST (append NEST (list 0)))													;リストの最後に要素(0)を追加
			)
			;ノードは表示しない
			(U-add-end NEST)			;リストの最後を＋1する
			)
		(setq o nil)
		(setq Ic-IDX (1+ Ic-IDX))
        ))
	(setq Ic-max Ic-IDX)
	(setq Ic-IDX (if(>= OLD Ic-IDX)(1- Ic-IDX) OLD))	;Ic-IDX を復帰する
	(if (< Ic-IDX 0)(setq Ic-IDX 0));タマにこの事態が起きる 項目数０の時
    )
    ;後処理

	;wine ウインドウの描画
	(Ic-after-cur)

	;はじめに実行するべきもの
    (if Ic-first (progn (setq Ic-first nil)(if (Ic-option 'refresh)(eval (Ic-option 'refresh 1)))))

	;リフレッシュは常にするのだ
    (setq Ic-refresh t)
    )

;最初の起動時に要素はなくオプションの中で
;
;   (refresh (云々)(Ic-refresh))
;
;のように要素を挿入するようにすると、最初はメンバーが０なので
;Ic-max が 0 になってしまってOLD が -1 となるので、次に上に移動した
;ときに欠てしまう。

;-------------------------------------------------------------------------------
;
;   題名 :  ウインドウ作成（リフレッシュのときに呼ばれる）
;
;   解説 :  ウインドウ構成は一度起動前の状態に戻されて、また構成され直す。
;           しかし、ウインドウの内容(バッファと位置)は、初期化されないようにする。
;
;   Ic-win-wine の値は、Ic の再帰呼び出しを行った後は以前のウ
;   インドウの値になってはいるが、 Ic-win-wine は Ic-refresh
;   のごとに変更されるので、実際には使えない変数であることに注意。
;
(defun Ic-window ()
    ;他のウインドウ状況の保存
    (let (NEW)
        (mapcar
            (lambda (TMP)(if (window-live-p TMP)(setq NEW (append NEW (list
                (`((, TMP) (,(window-buffer TMP)) (,(window-start TMP))))
                )))))
            Ic-owin)
        (set-window-configuration Ic-history)
        (mapcar
            (lambda (TMP) (if (window-live-p (nth 0 TMP))(progn
            ;(message (prin1-to-string TMP))
            (set-window-buffer (nth 0 TMP)(nth 1 TMP))(set-window-start (nth 0 TMP)(nth 2 TMP)))))
            NEW)
        )

    ; wine ウインドウとバッファの作成
;   (if (and Ic-history-win (not Ic-history-refresh))   ;!!!
;       (set-window-configuration Ic-history-win)           ;!!!

    (setq Ic-no-wine (Ic-option 'no-wine))
    (if (null Ic-no-wine)
    (let*(
        (Ic-horizontal (Ic-option 'vertical 0))
        (Ic-milk-width (Ic-option 'milk-width 1))   ; 優先
        (Ic-wine-width                                  ; 次先
            (let ((MILK (Ic-option 'wine-width 1)))
            (if MILK MILK
                    (*
                        (if (Ic-option 'wine-split 0)(Ic-option 'wine-split 1)1)
                        (/  (if Ic-horizontal(window-width)(window-height))
                            (if (Ic-option 'wine-split 0)(Ic-option 'wine-split 2)2)
                ))))))
    (switch-to-buffer   (get-buffer-create Ic-name-wine))
    (setq tab-width 4)                                      ; tab
    (let ((LINE (Ic-option 'wine-mode-line 1)))         ; mode line
        (if LINE (progn(setq mode-line-format LINE)(force-mode-line-update))))
    (setq truncate-lines (Ic-option 'wine-cut 0))       ; cut lines
    (setq Ic-win-milk (selected-window))                ; window name

    (condition-case
        nil
        (setq Ic-win-wine                               ; split window
            (split-window (selected-window)
                (if Ic-milk-width Ic-milk-width
                (- (if Ic-horizontal (window-width) (window-height)) Ic-wine-width))
                Ic-horizontal))
        (error (message "ウインドウの指定幅が取れませんでした")
            (setq Ic-win-wine
                (split-window (selected-window)
                (/ (if Ic-horizontal (window-width) (window-height)) 2)
                Ic-horizontal))
        ))
    ))
;   (setq Ic-history-win (current-window-configuration)))   ;!!!

    ; milk バッファの作成
    (switch-to-buffer   (get-buffer-create Ic-name-milk))
    (setq tab-width 4)                                                                      ; tab
    (setq truncate-partial-width-windows (Ic-option 'milk-cut 0))                       ; cut lines
    (let ((LINE (Ic-option 'milk-mode-line 1)))(if LINE (progn(setq mode-line-format LINE)(force-mode-line-update))))   ; mode line

    ; wink モードの時のウインドウの分割
    (setq Ic-wink                                                   ; set width
            (cond   ((Ic-option 'wink 1)(Ic-option 'wink 1))
                    ((Ic-option 'wink-less 1)(1-(/(window-width)(Ic-option 'wink-less 1))))
                    (t 1)
            ))
    ; wink mode
    (let ((tmp-hist (current-window-configuration)))(if (< 1 Ic-wink) (Ic-wink-mode)))
    )

;-------------------------------------------------------------------------------
;
;   解説 :  ウインドウを分割する。出来なければ、分割数を減らして行き、
;           結局分割できなければ、Ic-wink を 1 に設定する。
;
(defun Ic-wink-mode ()
    (catch 'BREAK (condition-case nil
    (progn
        (set-window-configuration tmp-hist)
        (setq Ic-milk-list (list Ic-win-milk))
        (let ((I 1)(WIDTH (/ (window-width) Ic-wink)))(while (not(eq I Ic-wink))
            (setq Ic-milk-list (append Ic-milk-list (list
                (split-window (selected-window) WIDTH t))))
            (select-window (nth (1- (length Ic-milk-list)) Ic-milk-list))
            (setq I (1+ I))
            ))
        (setq Ic-wink-ofs 0);先頭に戻す
        )
    (error (progn (setq Ic-wink (1- Ic-wink))
            (if (> 2 Ic-wink)(progn(setq Ic-wink 1)(throw 'BREAK t)))); 2 > は冗長？
            (Ic-wink-mode)
        )
    ))
    (select-window (get-buffer-window Ic-name-milk))
    )

;-------------------------------------------------------------------------------
;
;   解説 :  カーソルの色消し
;
;
(defun Ic-face-del (idx)

    ;erase face
    (let ((line (if (nth Ic-IDX Ic-lines)   ;Because if there is no element,nth Ic-lines is nil.
                (nth Ic-IDX Ic-lines)
                (1+ (count-lines (point-min) (point))))
        ))
    (goto-line line)
	(if (null window-system) 
		nil;(while (eq 62 (char-after))(delete-char 1))
    (let((x)(y))
        (setq x (point))
        (goto-line (if (nth (1+ Ic-IDX) Ic-lines)(nth (1+ Ic-IDX) Ic-lines)(1+(count-lines (point-min) (point-max)))))
        (setq y (point))
        (remove-text-properties x y '(face nil))
    ))
    ;If specified rest
    (let ((option (Ic-idx 7)))    ;When emphasize is specified.
            (if option
            (mapcar (lambda (a)(Ic-paint (+ line (nth 0 a))(nth 1 a)(nth 2 a)(nth 3 a))) option)
            ))
    ))
(defun Ic-face ()           ;カーソルの色付け
    (let ((line (if (nth Ic-IDX Ic-lines)   ;Because if there is no element,nth Ic-lines is nil.
                (nth Ic-IDX Ic-lines)
                (1+ (count-lines (point-min) (point))))
        ))
        (if(null (Ic-idx 6))      ;When emphasize is not specified.
        (let((x)(face  (if(Ic-idx 3)Ic-Face-cur2 Ic-Face-cur)))
            (Ic-paint line 0 'end face)
            )
        (let ((option (Ic-idx 6)))    ;When emphasize is specified.
            (mapcar (lambda (a)(Ic-paint (+ line (nth 0 a))(nth 1 a)(nth 2 a)(nth 3 a))) option)
            )
    )))

(defun Ic-paint (line top end face)     ;色付け本体
    (let ((x))
        ;start
        (goto-line line)
	(if (null window-system)
		nil;(progn (if (eq 62 (char-after))nil(insert ">")(backward-char 1)))
        (move-to-column top)
        (setq x (point))
        ;end
        (beginning-of-line)
        (cond   ((eq end 'end)  (end-of-line))
                ((eq end 'last) (condition-case nil (goto-line (nth (1+ Ic-IDX) Ic-lines))(error (goto-char (point-max)))))
;                (t              (condition-case nil (forward-char end)(error))))			この仕様は剣呑だ
                (t              (move-to-column end)))
        ;paint
        (put-text-property  x (point) 'face face nil)
    )))
    ;(Ic-paint 0 1 'end Ic-Face-cur2)

;-------------------------------------------------------------------------------
;
;   解説 :  ｗｉｎｅ書き込み
;
;
(defun  Ic-before-cur ()                ;カーソル移動前に実行
    (Ic-face-del Ic-IDX)
    )
(defvar Ic-noaf nil)					;今回だけ wine に書き込み為ないためにはtに設定する
(defun  Ic-after-cur ()                 ;カーソル移動後に実行
    ;カーソル色
    (Ic-face)
    ;ｗｉｎｅバッファに書き込み
    (if (and (not Ic-noaf)(null Ic-no-wine))(progn
    (select-window Ic-win-wine)(switch-to-buffer Ic-name-wine)
    (let ((EXEC (Ic-idx 2)))
    (cond
            ; nil ならバッファを消去
            ((null      EXEC)   (if (Ic-option 'notcls-win 0)()(erase-buffer)))
            ; ベクタはキーに直して表示
            ((vectorp   EXEC)   (erase-buffer)(insert(U-vector-to-keystr EXEC)))
            ; 文字列ならそのまま表示
            ((stringp   EXEC)   (erase-buffer)(insert EXEC))
            ; アトムならば変数内容の表示 関数名ならキーバインドも表示
            ((atom      EXEC)   (erase-buffer)(insert (concat
                (prin1-to-string (if (boundp EXEC)(eval EXEC)EXEC))
                " "(if (functionp EXEC)(U-map-to-keystr EXEC global-map))
                )))
            ; リストの場合、実行結果の表示
            ((listp     EXEC)   (condition-case nil(if (null (car EXEC))
                                    (eval(cdr EXEC))		;ｎｉｌで始まるリストは単に実行
                                    (let ((STR (eval EXEC)));実行結果の表示
										(erase-buffer)
										(insert (if (stringp STR)STR(if STR (prin1-to-string STR)"")))		; nil は表示しない
								))
                                ;評価エラー
                                (error
                                    (erase-buffer)(insert (prin1-to-string EXEC))
                                    (ding)
                                    (message "へんてこな関数が指定されている"))
                                ))
            ; その他(強制表示)
            (t                  (erase-buffer)(insert(prin1-to-string EXEC)))
        ))
    (if (Ic-option 'notcls-win 0)()(goto-char (point-min)))
    )(setq Ic-noaf nil))

	;wink mode の行を揃える
    (if (< 1 Ic-wink)
        (let ((I 0)(HEIGHT (progn (select-window (car Ic-milk-list))(1- (window-height)))));window has mode line
            (setq Ic-wink-ofs (*(* Ic-wink HEIGHT)(/ Ic-IDX (* Ic-wink HEIGHT))))
            (while (not(eq I (length Ic-milk-list)))
                (select-window (nth I Ic-milk-list))
                (goto-line (+ 1 (* I HEIGHT) Ic-wink-ofs))(recenter 0)
                (setq I (1+ I))
            )))

    (select-window Ic-win-milk)

    ;ローカルキーマップの設定
    (setq Ic-local-keymap (Ic-idx 9))
    )
;-------------------------------------------------------------------------------
;
;   解説 :  一般キーシーケンス
;

(defun Ic-quit (&optional RET)      ;おしまい
    (interactive)
    (setq Ic-refresh nil)
    (if RET (setq Ic-return RET))
    (setq Ic-quit t)
    )

(defun Ic-exec (&optional IDX)      ;実行
    (interactive)
    (let ((FUNC (Ic-idx 1 IDX)))
    (cond
        ((null  FUNC)t)
        ((and (listp FUNC)(null(car FUNC)))         (eval (cdr FUNC)))                                  ; 評価
        ((and (listp FUNC)(not (null(car FUNC))))   (eval FUNC)(setq Ic-quit t))                        ; 評価＆リターン
        (t                                          (setq Ic-return FUNC)(setq Ic-quit t))              ; その他
    )))

(defun Ic-up (&optional N)          ;上（添字は減る）
    (interactive)
    (Ic-before-cur)
    (if N ()(setq N 1))
    (setq Ic-IDX (let ((ANS (- Ic-IDX N)))(if(< ANS 0)(+ Ic-max ANS)ANS)))
    (setq Ic-refresh nil)
    (Ic-after-cur)
;    (setq Ic-ae t)		; 動作のディフォルト変えました
    )
(defun Ic-down (&optional N)        ;下（添字は増える）
    (interactive)
    (Ic-before-cur)
    (if N ()(setq N 1))
    (setq Ic-IDX (let ((ANS (+ Ic-IDX N)))(if(>= ANS Ic-max)(- Ic-max ANS)ANS)))
    (setq Ic-refresh nil)
    (Ic-after-cur)
;    (setq Ic-ae t)
    )

(defun Ic-right ()                  ;右
;    (cond
;		((and (eq 1 Ic-wink)(Ic-option 'tree))(Ic-wink-next))
;		((eq 1 Ic-wink)(Ic-next-node))
;		(t (Ic-wink-next))
;		)
	(if (eq 1 Ic-wink)(Ic-next-node)(Ic-wink-next))
    )
(defun Ic-left ()                   ;左
;    (cond
;		((and (eq 1 Ic-wink)(Ic-option 'tree))(Ic-wink-prev))
;		((eq 1 Ic-wink)(Ic-prev-node))
;		(t (Ic-wink-prev))
;		)
    (if (eq 1 Ic-wink)(Ic-prev-node)(Ic-wink-prev))
    )

(defvar Ic-temp-symbols ())
(defun Ic-next-node ()              ;右（次のノードへ）
    (interactive)
    (if (Ic-option 'tree)(if (Ic-idx 3)(progn (Ic-idx 10 nil nil t t)(setq Ic-first t)))
    (let(( NEXT-LST (Ic-idx 3))(NEXT-OPT(nth 4(nth Ic-IDX (eval Ic-Table)))))
        (cond
            ((null NEXT-LST)(message "次のノードはないよん")nil)
            ((symbolp NEXT-LST)
                (setq Ic-Table-list (append Ic-Table-list (list (list NEXT-LST NEXT-OPT Ic-IDX))))
                (setq Ic-Option NEXT-OPT)
                (setq Ic-Table  NEXT-LST)
                (setq Ic-IDX 0)
                (setq Ic-first t)
                )
            ((listp NEXT-LST)   ;リストそのものを登録してある場合は、一時変数を作成して setq する。
                (setq Ic-Option (intern (make-temp-name "Ic")))(set Ic-Option (if (symbolp NEXT-OPT)(eval NEXT-OPT)NEXT-OPT))
                (setq Ic-Table  (intern (make-temp-name "Ic")))(set Ic-Table  (if (symbolp NEXT-LST)(eval NEXT-LST)NEXT-LST))
                (setq Ic-temp-symbols (append Ic-temp-symbols (list Ic-Table Ic-Option)))
                (setq Ic-Table-list (append Ic-Table-list (list (list Ic-Table Ic-Option Ic-IDX))))
                (setq Ic-IDX 0)
                (setq Ic-first t)
                )
        ))))

(defun Ic-prev-node (&optional N F)   ;右（上のノードへ）
    ; +N 前から数えて N 番目に移動 0 は一番最初もノード。-N は N 回前に戻るってこと
    ; ((1st-table 1st-opt 0)(2st-table 2st-opt 1st-idx) ... )のように格納されている
	; F が指定されていると tree モードの時にも、ノードを下降する
    (interactive)
    (if (and (not F)(Ic-option 'tree))(progn (if (Ic-idx 10)(Ic-idx 10 nil nil t nil)

	(let* (
		(A (elt (Ic-xdi Ic-IDX (eval Ic-Table) 0 (list 0) 0 (list 0)) 0))
		(B (nth (1- (length A)) A))
		(C )
		)
		(if (eq (length A) 1)nil
		(U-del A -1)
		(setq C (Ic-table nil (if A A (list B))))
		(U-mod C 10 nil)
		(setq Ic-IDX (- Ic-IDX (1+ B)))
		(if (< Ic-IDX 0)(setq Ic-IDX 0))
		))
	))
    (if N ()(setq N -1))
    (if (< N 0);マイナス
    (if (>= (- N) (length Ic-Table-list))(message "ノード降下できないよ")
        (while (not (eq 0 N))
        (setq Ic-IDX    (nth 2 (nth (1- (length Ic-Table-list))Ic-Table-list)))
		(U-del Ic-Table-list -1)
        (setq Ic-Table  (nth 0 (nth (1- (length Ic-Table-list))Ic-Table-list)))
        (setq Ic-Option (nth 1 (nth (1- (length Ic-Table-list))Ic-Table-list)))
        (setq N (1+ N))
    ));プラス
        (if (< N 0)()
        (setq Ic-IDX    (nth 2 (nth (- (length Ic-Table-list) N 1)Ic-Table-list)))
        (let ((M (- (length Ic-Table-list) N)))(while (> M 1)(U-del Ic-Table-list -1)(setq M (1- M))))
        (setq Ic-Table  (nth 0 (nth N Ic-Table-list)))
        (setq Ic-Option (nth 1 (nth N Ic-Table-list)))
    ))
    (setq Ic-first t)))

(defun Ic-wink-next ()              ;wink 左（次のウインドウへ）
    (interactive)
    (Ic-face-del Ic-IDX)
    (setq Ic-IDX (+ Ic-IDX (1-(window-height))))
    (if(<= Ic-max Ic-IDX)(setq Ic-IDX (1- Ic-max)))
    (setq Ic-refresh nil)
    (Ic-after-cur)  )

(defun Ic-wink-prev ()              ;wink 左（前のウインドウへ）
    (interactive)
    (Ic-face-del Ic-IDX)
    (setq Ic-IDX (- Ic-IDX (1-(window-height))))
    (if(< Ic-IDX 0)(setq Ic-IDX 0))
    (setq Ic-refresh nil)
    (Ic-after-cur)
    )

(defun Ic-idx-spec (N)              ;IDX明示
    (Ic-face-del Ic-IDX)
    (setq Ic-IDX N)
    (if(< Ic-IDX 0)(setq Ic-IDX 0))
    (if(<= Ic-max Ic-IDX)(setq Ic-IDX 0))
    (setq Ic-refresh nil)
    (Ic-after-cur)
    )

(defun Ic-5-up ()                   ;上５（添字は減る）
    (interactive)
    (Ic-face-del Ic-IDX)
    (setq Ic-IDX (- Ic-IDX 5))
    (if(< Ic-IDX 0)(setq Ic-IDX 0))
    (setq Ic-refresh nil)
    (Ic-after-cur)
;    (setq Ic-ae t)
    )
(defun Ic-5-down ()                 ;下５（添字は増える）
    (interactive)
    (Ic-face-del Ic-IDX)
    (setq Ic-IDX (+ Ic-IDX 5))
    (if(<= Ic-max Ic-IDX)(setq Ic-IDX (1- Ic-max)))
    (setq Ic-refresh nil)
    (Ic-after-cur)
;    (setq Ic-ae t)
    )
(defun Ic-resplit (to)              ;wink の 分割数を変えます to は '+ か '-
    (interactive)
	(Ic-optmod Ic-Option 'wink (funcall to  Ic-wink 1))
    (if (= 0 Ic-wink)(setq Ic-wink 1))
    )

(defun Ic-wine-sdown ()
	(Ic-write-wine (setq Ic-refresh nil)(condition-case var (scroll-up 3)(error))))

(defun Ic-wine-sup   ()
	(Ic-write-wine (setq Ic-refresh nil)(condition-case var (scroll-down 3)(error))))


;-------------------------------------------------------------------------------
;
;   解説 :  マウスの動作
;
(defun Ic-mouse-1 ()
    (interactive)
    (save-window-excursion(condition-case nil(let ((FIRST last-input-event)(KEY nil))
        (select-window (posn-window (car(cdr FIRST))))
        (goto-char (posn-point (car(cdr FIRST))))
;       (goto-char (let ((POS(posn-point (car(cdr FIRST)))))(if(integer-or-marker-p POS)POS (throw 'BREAK t)))); We can't click bar
        (set-mark (point))
        (setq transient-mark-mode t)
        (track-mouse
            (while (not (equal "mouse-1" (prin1-to-string (event-basic-type KEY))))
                (setq KEY (elt (read-key-sequence nil) 0))
                (let((POS(posn-point (nth 1 KEY))))(cond
                    ((integer-or-marker-p POS)  (goto-char POS))
                    ((eq nil POS)               (scroll-down 3))
                    ((eq 'mode-line POS)        (scroll-up   3))
                    (t(message (prin1-to-string POS)))
                ))))
        (if (eq(posn-window (event-start KEY))(posn-window(event-end KEY)));must same window
            (let ((X (posn-point (event-start KEY)))(Y (posn-point(event-end KEY))))
                (if(and(integer-or-marker-p X)(integer-or-marker-p Y))(copy-region-as-kill X Y))))
        (setq transient-mark-mode nil)
        (setq Ic-refresh 'save)
    )(error nil))))

;ポイント位置の行番号から、Ic-lines を検索して、その添字を返す。
(defun Ic-mouse-2 ()
    (interactive)
    ;MILK ウインドウだったら
    (if (or (eq Ic-win-milk (posn-window (event-start last-input-event)))
		(member (posn-window (event-start last-input-event)) Ic-milk-list)
		)
    (catch 'BREAK (let((IDX)(POINT (posn-point (event-start last-input-event))))
        (if (numberp POINT)()(throw 'BREAK nil))    ; モードラインは
        (setq IDX (Ic-point-to-idx POINT))
        (if (eq IDX Ic-IDX)(setq unread-command-events '(return))(Ic-idx-spec IDX))
    ))))

(defvar Ic-not-str "[] \t\n/;:{}()\\\\\\[\\\"#$%&'~=|\\*\\+><.,]")

;(point)->Ic-IDX
(defun Ic-point-to-idx (POINT)
    (catch 'FIND
        (let ((I (1- (length Ic-lines))))
            (while (not (< I 0))
                (if (>= (U-point-to-line POINT) (nth I Ic-lines))(throw 'FIND I))
                (setq I (1- I))
                )
            (throw 'FIND 0)
        )))

;-------------------------------------------------------------------------------
;
;   解説 :  各種検索ルーチン
;
(defun Ic-search-f-IDX ()
    (goto-char 1)
    (isearch-forward-regexp)
    (Ic-idx-spec (Ic-point-to-idx (point)))
    )

(defun Ic-search-b-IDX ()
    (goto-char 1)
    (isearch-backward-regexp)
    (Ic-idx-spec (Ic-point-to-idx (point)))
    )

(defvar Ic-search-IDX 0)
(defvar Ic-search-REGEXP 0)

(defun Ic-search-b-STR ()
    (setq Ic-refresh 'save)
    (if (eq 0 Ic-search-IDX)(message "上には要素がないですね")(Ic-search-sub Ic-search-REGEXP (1- Ic-search-IDX) t))
    )
(defun Ic-search-r-STR ()
    (setq Ic-refresh 'save)
    (Ic-search-sub Ic-search-REGEXP (1+ Ic-search-IDX) nil)
    )

(defun Ic-search-STR ()
    (setq Ic-search-IDX Ic-IDX)
    (setq Ic-search-REGEXP(read-from-minibuffer "文字列検索 REGEXP :"))
    (message (concat "正規表現を登録しました。"
        (U-map-to-keystr 'Ic-search-r-STR Ic-mode-map)" "
        (U-map-to-keystr 'Ic-search-b-STR Ic-mode-map)" "
        "によって検索できます"))
    )

(defun Ic-search-sub (REGEXP start dire)            ;dire = nil : 0 to 999
    "文字列を検索して、その項目に移動します"
    (catch 'END (let ((POS 0)(STR)(IDX start)(EXEC nil))
    (Ic-idx-spec (setq Ic-search-IDX(catch 'BREAK (while t
        ;文字列の取出し
        (setq EXEC (nth 2 (nth IDX (eval Ic-Table))))
        (setq STR (cond
            ((vectorp   EXEC)(U-vector-to-keystr EXEC))
            ((stringp   EXEC)EXEC)
            ((atom      EXEC)(concat
                (prin1-to-string (if (boundp EXEC)(eval EXEC)EXEC))
                " "(if (functionp EXEC)(U-map-to-keystr EXEC global-map))
                ))
            ;リストに副作用がある場合に困るし、評価の結果バッファに直接書き込むような
            ;項目だったとすると正しく検索できませんね。
            ((listp     EXEC)   (condition-case nil(if (null (car EXEC))
                                    (eval(cdr EXEC))
                                    (let ((STR (eval EXEC)))(if (stringp STR)STR(prin1-to-string STR))))
                                (error(prin1-to-string EXEC))))
            (t          (prin1-to-string EXEC))))
        ;文字列の検索
        (if (setq POS (condition-case nil (string-match REGEXP STR)(error)))(throw 'BREAK IDX)(setq IDX (if dire (1- IDX)(1+ IDX))))
        (if (if dire (< IDX 0)(> IDX Ic-max))(progn(message "その文字列は無いようだよ")(throw 'END t)))
        ))))
    ;移動します
    (Ic-write-wine (goto-char POS)(recenter 0))
    (message (concat REGEXP " ありました"))
    )))

;-------------------------------------------------------------------------------
;
; 動作：Ic-table と違って、カーソル位置からテーブルの値を取り出す。
;
;
;
(defun Ic-idx (elem &optional idx table f rep)        ; 項目リスト参照(Ic-IDX から検索 tree-mode の時にでも)
	" カーソル位置の (\"表題\" リターン \"説明文章\" ...) を返す

	ELEM	: 要素番号
	IDX		: 項目番号 def : Ic-IDX
	TABLE	: テーブル def : Ic-Table シンボルを渡す事
	F		: メンバ置き換え動作フラグ(下記参照)
	REP		: 置き換え情報

		nil	: 参照
		t	: 置き換え	table[idx][elem]=rep
		ins	: 挿入
		del	: 削除
		push: プッシュ
		pop	: ポップ
"
	(if idx		nil (setq idx Ic-IDX))
	(if table	nil (setq table Ic-Table))

	(if (or (condition-case nil (Ic-option 'tree 0)(error nil))f)
	;○下位ノードの探索付
	(cond
	; 項目か要素を返す
	((eq f nil)	(let ((A (Ic-xdi idx (eval table) 0 (list 0) 0)))(if (numberp (car-safe A))nil(if elem (nth elem A)A))))
	; 要素を変更
	((eq f t)	(let ((A (Ic-xdi idx (eval table) 0 (list 0) 0)))(if (numberp (car-safe A))nil (U-modq A elem rep))))
	; 項目を挿入(新しい項目の番号を返す)
	((eq f 'ins)(if (eval table) (let* (
					(A (Ic-xdi idx (eval table) 0 (list 0) 0 (list 0)))
					(B (if (vectorp A)(elt A 0)(list 0)))
					(I (nth (1- (length B)) B))
					(C (progn (U-del B -1)(if B (nth 3 (Ic-table nil B (eval table)))(eval table))))
					(D (if (symbolp C)(eval C)C))
					)
					(setcdr (nthcdr I D) (cons rep (nthcdr (1+ I) D)))
				(1+ I))
				(set table (list rep))
				))
	; 項目を削除
	((eq f 'del)	(if (> 2 (length (eval table)))(set table nil)(let* (
						(A (Ic-xdi idx (eval table) 0 (list 0) 0 (list 0)))
						(B (elt A 0))
						(I (nth (1- (length B)) B))
						(C (progn (U-del B -1)(if B (nth 3 (Ic-table nil B (eval table)))(eval table))))
						(D (if (symbolp C)(eval C)C))
						)
						(U-del D I)
				)))
	; 項目を削除(&push)
	((equal f 'push)(if (eval table)(let (
						(A (Ic-xdi idx (eval table) 0 (list 0) 0))
						)
					(setq Ic-PP (append Ic-PP (list A)))
					(Ic-idx nil idx table 'del)
				)))

	; 項目を挿入(pop)
	((equal f 'pop) (if Ic-PP(progn (if (eval table)
						(Ic-idx elem idx table 'ins (nth (1- (length Ic-PP)) Ic-PP))
						(set table (list (nth (1- (length Ic-PP)) Ic-PP))))
						(U-del Ic-PP -1)
					)))
		)
	;○下位ノードの探索無し(Ic-xdiは再帰レベルが問題になる時があるかな？)
	(Ic-table elem idx (eval table))
	))

;(setq Ic-PP nil)
;(setq Um4-nil-table nil)

(defun Ic-menu-pop      ()"項目をＰＯＰ"(Ic-idx nil nil nil 'pop))
(defun Ic-menu-push     ()"項目をＰＵＳＨ"(Ic-idx nil nil nil 'push))
(defun Ic-menu-insert   ()"項目を挿入"(Ic-idx nil nil nil 'ins (list nil)))
(defun Ic-menu-delete   ()"項目を削除"(Ic-idx nil nil nil 'del))
(defun Ic-menu-title	()"項目のタイトル設定"(Ic-idx 0	nil nil t (read-from-minibuffer "表題 : " (Ic-idx 0))))
(defun Ic-menu-short	()"ショートカット文字の登録"(let (CH)(message "ショートカット文字 : ")(setq CH (read-event))(Ic-idx 8 nil nil t CH)))
(defun Ic-menu-short-del()"ショートカット文字の削除"(Ic-idx 8 nil nil t nil))
(defun Ic-toggle-tree	()"木構造のトグル"(Ic-optmod nil 'tree (not (Ic-option 'tree 0))))				; 木構造

;-------------------------------------------------------------------------------
;
; 動作：Ic-idx 下位ルーチン
;
; idx	: 添字		def = Ic-IDX
; table	: テーブル	def = (eval Ic-Table)
; n,s,i	: 内部変数	以下参照
; p		: '(0) を渡せば、Ic-table の IDX に相当するリストを含むベクタを返す
;
;			n	s			i		p
; ├┬0		0	(1)			0		(0)
; │├─1	1	(1 1)		0		(0 0)
; │└─2	1	(1 2)		1		(0 1)
; ├┬3		0	(2 2)		1		(1)
; │├─4	1	(2 3)		0		(1 0)
; │└┬5	1	(2 4)		1		(1 1)
; │  ├─6	2	(2 4 1)		0		(1 1 0)
; │  ├─7	2	(2 4 2)		1		(1 1 1)
; │  └─8	2	(2 4 3)		2		(1 1 2)
; └─9		0	(3 4 3)		2		(2)
;
;
; table = (nil) で p 指定してもベクタが帰らない不都合有り。
;
;

(defun Ic-xdi (idx table n s i &optional p)
	(U-mod s n (let ((K (nth n s)))(1+ (if K K 0))))	;そのノードに対応する値を＋1する
	(let* (
		(L (nth i table))
		(l3 (nth 3 L))(L3 (if (symbolp l3)(eval l3)l3))
		)(cond
		((not L) (U-mod s n (let ((K (nth n s)))(1- (if K K 0)))) s)
		((eq (1- (apply '+ s)) idx) (if p (vector p) L))
		((and (Ic-option 'tree)L3 (nth 10 L))
			(let ((R (Ic-xdi idx L3 (1+ n) s 0 (if p (append p (list 0))))))(if							; 下位ノードを探す
					(numberp (car-safe R))(progn (if p (U-add-end p))(Ic-xdi idx table n R (1+ i) p))R)	; なければ次
			))
		(t (if p (U-add-end p))(Ic-xdi idx table n s (1+ i) p))											; 次
	)))


;-------------------------------------------------------------------------------
;
; 動作：Ic-idx と違って、ノードを指定してテーブルの値を取り出す。
;
(defun Ic-table (ELEM &optional IDX TABLE)        ; 項目リスト参照
"	ELEM	: (([0]string [1]return [2]expression [3]next1 [4]next2 [5]user [6]emphasize [7]rest [8]key-select [9]local-keymap [10]open-treep)...)
	IDX		: default = Ic-IDX 下位ノードを指定するときには、(0 1 2 3) などとする。
	TABLE	: default = (eval Ic-Table)
"
	(if (listp IDX)nil(setq IDX (list (if IDX IDX Ic-IDX))))
	(if (consp (cdr IDX))
		(Ic-table ELEM (cdr IDX) (let ((R (nth 3 (nth (car IDX) (if TABLE TABLE (eval Ic-Table))))))(if (symbolp R)(eval R)R)))
		(if ELEM 
			(nth ELEM (nth (if IDX (car IDX) Ic-IDX) (if TABLE TABLE (eval Ic-Table))))
			(nth (car IDX) (if TABLE TABLE (eval Ic-Table))))
		)
    )

;-------------------------------------------------------------------------------
;
; 動作 : オプション変更
;
;	(Ic-optmod Ic-Option top etc...)
;
;	(top c1 c2 c3 ... )
;
;
;
(defun Ic-optmod (list idx &rest to)  ;オプションを消して新しく登録する(引数は、シンボル)
	(if list nil (setq list Ic-Option))
    (set list (U-del3 idx (eval list)))						;list の car が idx であるリストを全て削除して、to を置く
    (if (equal '(nil) to)nil(set list (append (list (if to (append (list idx) to) (list idx))) (eval list))))
    )

;
; オプションリスト参照
;
(defun Ic-option (key &optional num list A)
"(Ic-option 'title 1 t) のように実行する。
0 は 'title 自体を返す。
A が非ｎｉｌならば、num 以降を返す。"
    (let ((LIST (assoc key (if (null list)(eval Ic-Option)list))))
    (if A (nthcdr (if num num 0) LIST)(nth (if num num 0) LIST)))
    )

;-------------------------------------------------------------------------------
;
;   解説 :  ノードの明示的選択降下（ノード履歴に登録されるので、上にさかのぼれます）
;
(defun Ic-specify-node (NEXT-LST NEXT-OPT)
    (setq Ic-Table-list (append Ic-Table-list (list (list NEXT-LST NEXT-OPT Ic-IDX))))
    (setq Ic-Option NEXT-OPT)
    (setq Ic-Table  NEXT-LST)
    (setq Ic-IDX 0)
    (setq Ic-first t)
    )

;-------------------------------------------------------------------------------
;
;   解説 :  再帰編集のメインルーチン
;
;	再帰編集をして、(eval do-last) の結果を返す。
;	do-first は、再帰編集する前に実行する文。初期化文字列を挿入したりする。
;	do-ing	は、再帰編集せずにこの文を実行するのみ。
;
(defun  Ic-redit (&optional do-last do-first do-ing)
    (let (RET
        (history    (current-window-configuration))
        (OLD        (global-key-binding Ic-recursive-key))
        (OLD2       (global-key-binding Ic-recursive-key2))
        (Cancel		nil)                ; キャンセルフラグ
        )
	;環境の保存
    (global-set-key Ic-recursive-key 'exit-recursive-edit)
    (global-set-key Ic-recursive-key2 'Ic-redit-kill)
    (unwind-protect(let(
        (Ic-save-milk   nil)    ; milk バッファ待避
        (Ic-save-wine   nil)    ; wine バッファ待避
        )
	    (select-window Ic-win-wine)
        (save-excursion
            (if (get-buffer Ic-name-wine)(set-buffer Ic-name-wine)(rename-buffer (setq Ic-save-wine (generate-new-buffer-name "Ic-wine"))))
            (if (get-buffer Ic-name-milk)(set-buffer Ic-name-milk)(rename-buffer (setq Ic-save-milk (generate-new-buffer-name "Ic-milk"))))
            )
		;最初にやる事
        (switch-to-buffer Ic-name-wine)           ; wine に Ic-name-wine が表示されているとは限らないのでね
        (eval do-first)
        (run-hooks 'Ic-before-rec-hook)
		;再起編集にはいる。
        (let (Ic-rec-flg)	;Ic-rec-flg が定義されている間は、milk  バッファの内容は Ic の再帰呼び出しから守られる。未実装
			(if do-ing (eval do-ing)(recursive-edit))
            )
		;環境を元に戻す
        (save-excursion
            (if Ic-save-wine (progn (set-buffer Ic-save-wine)(rename-buffer Ic-name-wine)))
            (if Ic-save-milk (progn (set-buffer Ic-save-milk)(rename-buffer Ic-name-milk)))
            )
        (switch-to-buffer   Ic-name-wine)           ; 戻さないと再帰を抜けたときにその時点のバッファが対象になってしまう
		;返す値の計算
        (setq RET (if do-last (eval do-last)(buffer-string)))
		)
		;環境を元に戻す
        (global-set-key Ic-recursive-key OLD)
        (global-set-key Ic-recursive-key2 OLD2)
		(set-window-configuration history)
		)
    (if Cancel (throw 'Ic-NEXT t));Ic のメインループで捕捉される
    RET
    ))


(defun Ic-redit-kill ()
	(interactive)
	(message "編集を放棄します")
	(setq Cancel t)
	(exit-recursive-edit)
	)


;-------------------------------------------------------------------------------
;
;   解説 :  再帰編集をしてＳ式を読み取って返す。
;
;       ELE     テーブルの要素を変更するときの位置(これがなければ、単にＳ式を返すのみ)
;       LIST    テーブルの要素を変更するときに Ｓ式を RET にバインドして、このリストを実行する。
;       INIT    編集するときの初期化文字列(nil で、ELE が指定されていたときには、その内容が表示される)

(defun Ic-table-s(&optional ELE LIST INIT)
    (Ic-redit
        ;返す値
        '(let ((RET nil))
            (goto-char (point-min))(insert "(quote ")
            (goto-char (point-max))(insert ")")
            (condition-case nil (setq RET (eval-last-sexp 1))(error nil))
            (if (numberp ELE) (if LIST
                    (Ic-idx ELE nil nil t (eval LIST))  ;LIST is like this. (` (prin1 (,@ RET)))
                    (Ic-idx ELE nil nil t RET)))
            RET)
        ;最初にやる動作
        (cond
            ((stringp INIT) '(progn (erase-buffer)(insert INIT)(goto-char (point-min))))
            ((numberp ELE) '(progn (erase-buffer)(insert (prin1-to-string (Ic-idx ELE)))(goto-char (point-min))))
    )))

;-------------------------------------------------------------------------------
;
;   解説 :  文字列を返す
;
;	主に、(Ic-idx n) を編集する為に使用される。
;
;	INIT	は 初期化文字列を指定する。n を指定しても良い。何も指定しなければ、ELE の項目か、無し。
;	ELE		は 編集が終わった後に、自動的に n の要素を変更してくれる。
;	di-ing	は 再帰編集ではなく、実行したい文を書く。
;

(defun Ic-table-str (&optional INIT ELE do-ing)
    (Ic-redit
        ;返す値
        (if (numberp ELE)
            '(Ic-idx ELE nil nil t (buffer-substring (point-min) (point-max)))
            '(buffer-substring (point-min) (point-max)))
        ;最初にやる動作
        (cond
            ((stringp INIT) '(progn (erase-buffer)(insert INIT)(goto-char (point-min))))
            ((numberp INIT) '(let ((STR(Ic-idx INIT))) (erase-buffer)(if (stringp STR)(insert STR))(goto-char (point-min))))
            ((numberp ELE) '(let ((STR(Ic-idx ELE))) (erase-buffer)(if (stringp STR)(insert STR))(goto-char (point-min))))
    )do-ing))

;-------------------------------------------------------------------------------
;
;   解説 :  テーブル変数のセーブをする
;
;	N 番目のアトムを再帰して格納します。
;	Opt は無条件でセーブする項目 OTHERS は同じファイルに保存するべきシンボル。
;	呼び出すときには、クオートを忘れずに。
;
;	例：(Ic-table-save \"~/.emacs.save\" 'Um4-Table 3 4 'Um4-mod 'Um4-ded)

(defun Ic-table-save (FILENAME SYMBOL &optional N Opt &rest OTHERS)
    (let ((STACK nil))
        (if N (progn
            (Ic-table-save-sub (eval SYMBOL) N Opt)
            (setq STACK (mapcar (function (lambda (A) (list 'quote A))) STACK))
            ))
        (eval (`(U-save-symbol (, FILENAME) SYMBOL (,@ STACK) (,@ (mapcar (function (lambda (A) (list 'quote A))) OTHERS)))))
        (message "Save Ic table and option.")(ding)(sit-for 0.2)(ding)
    ))

;-------------------------------------------------------------------------------
;
;   解説 :  テーブルのファイルへのセーブ
;
;   LIST の 各要素のN番目要素がシンボルアトムならばSTACKに積んで更にその値で再帰する。
;   Opt は、無条件にセーブするシンボル。
;
(defun Ic-table-save-sub (LIST N &optional Opt)
    (let ((I 0)(LEN (length LIST)))(while (< I LEN)(let ((TMP (nth N (nth I LIST))))
        (if (and (not (null TMP))(symbolp TMP)) ; find symbl -> push and recursive.
            (progn(setq STACK (append STACK (list TMP)))(Ic-table-save-sub (eval TMP) N)))
        (if Opt (setq STACK (append STACK (list (nth Opt (nth I LIST))))))
    (setq I (1+ I)))))
    )

;-------------------------------------------------------------------------------
;
;   解説 :  ウインドウ環境をセーブする
;
(defmacro   Ic-keep-windows (&rest EVAL)(`(
    (set-window-configuration Ic-history)
    (,@ EVAL)
    (setq Ic-keep-windows (current-window-configuration)))
    ))

;-------------------------------------------------------------------------------
;
;   解説 :  ｗｉｎｅバッファに書き込み
;
;   例：(Ic-write-wine (insert "朝") (insert "夕方"))
;
(defmacro Ic-write-wine (&rest list)(`
    (if Ic-no-wine nil
        (select-window (if (window-live-p Ic-win-wine)Ic-win-wine(get-buffer-window Ic-name-wine)))
        (,@ list)
        (select-window (if (window-live-p Ic-win-milk)Ic-win-milk(get-buffer-window Ic-name-milk)))
    )))

;(defun Ic-write-wine (&rest list)		;関数バージョン
;    (if (and (not Ic-no-wine)(get-buffer-window Ic-name-wine))(progn
;        (select-window (if (window-live-p Ic-win-wine)Ic-win-wine(get-buffer-window Ic-name-wine)))
;        (eval (cons 'progn list))
;        (select-window (if (window-live-p Ic-win-milk)Ic-win-milk(get-buffer-window Ic-name-milk)))
;    )(message "Ic error : wine ウインドウがありません")))

;-------------------------------------------------------------------------------
;
;   解説 :  ノード以下の全てに対して exp を実行する
;
;	中断したかった場合には、
;
;    (throw 'Ic-NEXT Ic-IDX)
;
;	を実行すれば良い。
;
(defun Ic-all-nodes (exp &optional N)
	(setq N (if N N 0))
	(let ((Ic-IDX 0))(while (< Ic-IDX Ic-max)
		(eval exp)
		(if (Ic-next-node)(Ic-all-nodes exp (1+ N)))
		(setq Ic-IDX (1+ Ic-IDX))
	)(if (eq 0 N)nil(Ic-prev-node))))


(provide 'Ic)

;;;Ic.el ends here
