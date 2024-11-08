;;; misc-Uz.el --- my own miscellaneous function
;;
;; Copyright (C) 1997 Usuda Hiroshi

;; Author: Usuda Hiroshi <usuda-hiroshi@d4.dion.ne.jp>(http://www.d4.dion.ne.jp/~usuda/)
;; Keywords: list
;; Version: 1.0.30
;; Last-Modify : Fri Jun 16 03:13:20 2000

;;; Commentary:

;;	�� �Ȃ񂾂����
;;
;;	���̃v���O�����ŃR���X�^���g�Ɏg���ւڂ����C�u�����B�����ꂱ��Ȃ�
;;	�Ȃ��傱���C�u�����͕s�K�v�ɂ��ׂ��ł��邯��ǁA���̂Ƃ���͂��̋C
;;	�͂Ȃ��B�p���������̂Œ��g�͂��܂�݂Ȃ��łق����B(�R�����g�Ŏg��
;;	�Ă���p������Ȃ���������AGNU Coding �͑S���������Ă���)
;;
;;	2000.11 �֐����� U- ��t���Ă��s�V�悭���܂����B�Ă�
;;
;;

;;; Code:

;--------------------------------------------------------------------------------
;
;	����F�j��I���X�g����֐��Q
;
;	(setq A '(A B C) )
;
;	(U-del A 0)			(nth 0 A)���폜
;	(U-del A 3)			(nth 3 A)���폜
;	(U-del A -1)		���X�g�̍Ō���폜
;
;	(U-mod A 0 'a)		(nth 0 A)��'a �ɂ���
;	(U-mod A 3 'a)		(nth 3 A)��'a �ɂ���
;	(U-mod A -1 'a)		���X�g�̍Ō��'a �ɂ���
;
;	(U-ins A 0 'a)		(nth 0 A)��'a ��ǉ�
;	(U-ins A 3 'a)		(nth 3 A)��'a ��ǉ�
;	(U-ins A -1 'a)		���X�g�̍Ō��'a ��ǉ�
;
;	�擪�̃Z���͏�ɓn�����Z���Ɠ����ł��B
;	�܂�A�n�������X�g�ƋA�������X�g�́A��� eq �Ȃ̂��B
;
;	�Y���̓}�C�i�X�Ń��X�g�̌�납���Ԃ������o����B



;
;��	����F�j��I�Ƀ��X�g�̗v�f���폜
;
; Emacs : (nthcdr -1 '(nil))	-> nil
;XEmacs : (nthcdr -1 '(nil))	-> Error arg must natnump

(defmacro U-del (S i)(`
	(let ((R (U-delq (, S) (, i))))(if R nil (setq (, S) nil)) (, S))
	))

(defun U-delq (L I)
	(let ((len (length L)))(cond 
	((eq I 0)							;�ŏ��̏ꍇ�͈���V�t�g
		(let ((n 0))
			(while (> len n)(setcar (nthcdr n L) (nth (1+ n) L))(setq n (1+ n)))
			;(setcdr (nthcdr (- len 2) L) nil));for XEmacs
			(if (> len 1)(setcdr (nthcdr (- len 2) L) nil)))
		)
	((> 0 I)							; �}�C�i�X �� �Ō� �[�P
		(if (< -1 (+ len I))(U-del L (+ len I)))
		)
	(t									; �v���X   �� �ŏ�   �O
		;(setcdr (nthcdr (1- I) L) (nthcdr (1+ I) L));for XEmacs
		(if (> len 0)(setcdr (nthcdr (1- I) L) (nthcdr (1+ I) L)))
		)
	)(if (and (eq len 1)(or (eq I 0)(eq I -1)))nil L)))

	;(setq A '(0 1 2 3 4 5))
	;(U-del A -1)


;
;��	����F�j��I�Ƀ��X�g�̗v�f��ύX
;
(defmacro U-mod (S i r)(`(progn
	(if (and (or (eq 0 (, i))(eq -1 (, i)))(eq 1 (length (, S))))(setq (, S) (list (, r)))
	(U-modq (, S) (, i) (, r))
	))))

(defun U-modq (L i r)
	; �v�f������Ȃ��Ƃ��ɂ́A�������ŕ₤
	(while (>= i (length L))
		(setcdr (nthcdr (1- (length L)) L) (cons nil nil))
		)
	; �}������ꏊ�ɂ���ē��삪�ς��
	(let ((LEN (length L)))(cond
		((< (+ LEN i) 0)	nil)			; �}�C�i�X�w�肪����
		(t
			(setcar (nthcdr (if (<= 0 i)i(+ LEN i)) L) r))
	))L)

	;(setq A '(0 1 2 3 4 5))
	;(setq A '(1 1 1))
	;(U-mod A 0 t)

	;(setq A '(0))
	;(U-del A -1)

;
;��	����F�j��I�Ƀ��X�g�̗v�f��}��
;

(defmacro U-ins (S i r)(`(progn
	(if (eq nil (, S))(setq (, S) (list nil)))
	(U-insq (, S) (, i) (, r))
	)))


(defun U-insq (L i r)
	; �v�f������Ȃ��Ƃ��ɂ́A�������ŕ₤
	(while (> i (length L))
		(setcdr (nthcdr (1- (length L)) L) (cons nil nil))
		)
	; �}������ꏊ�ɂ���ē��삪�ς��
	(let* ((LEN (length L)))(cond
		((< (+ LEN i) -1)	nil)										; �}�C�i�X�w�肪����
		((or (equal i 0)(equal (+ LEN i) -1))							; i = �[��
			(let ((n LEN))												; ���X�g���V�t�g
				(setcdr (nthcdr (1- LEN) L)(list nil))	;add
				(while (< 0 n)(setcar (nthcdr n L) (nth (1- n) L))(setq n (1- n)))
				(setcar L r)
			))
		(t
			(setcdr (nthcdr (1- (if (< 0 i)i(+ LEN i 1))) L)
				(nconc (list r) (nthcdr (if (< 0 i)i(+ LEN i 1)) L))))
	))L)

	;(setq A '(0 1 2 3 4 5))
	;(U-ins A -10 'f)

;-------------------------------------------------------------------------------------------------
;
;�����X�g y ���� �A�g�� x ������������Ԃ�
;
;(U-del1 'a '(c c a a b b z x a a c c))

(defun U-del1 (x y)
	(cond	((null y)				nil)
			((not(equal x (car y)))	(cons (car y)(U-del1 x (cdr y))))
			(t						(U-del1 x (cdr y)))))

;
;�����X�g y ���� ���X�g x �Ɋ܂܂��v�f������������Ԃ�
;
;(U-del2 '(a b c) '(c c a a b b z x a a c c))

(defun U-del2 (list1 list2)
	(cond	((null (car list1))	list2)
			(t					(U-del2 (cdr list1) (U-del1 (car list1) list2)))))

;
;�����X�g y ����Acar �� x �ł�����̂���菜���B
;
;(U-del3 'a '((c d f)(a f d)(d f)(a s)))

(defun U-del3 (x y)
	(cond	((null y)				nil)
			((not(equal x (car-safe (car y))))	(cons (car y)(U-del3 x (cdr y))))
			(t								(U-del3 x (cdr y)))))

;
;�����X�g y ����Acar �� x �ł�����̂���菜���B
;
;(U-del4 'f '((c . f)(a . d)(d . f)(a . s)))

(defun U-del4 (x y)
	(cond	((null y)				nil)
			((not(equal x (cdr (car y))))	(cons (car y)(U-del4 x (cdr y))))
			(t								(U-del4 x (cdr y)))))

;
;��list ������ elem �� equal �ł���Y����Ԃ��B�Ȃ���� nil
;
;(U-htn '(a b c d e f (a d)) '(a d))

(defun	U-htn (list elem)
	(let ((RET nil)(I 0)(LEN (length list)))(while (> LEN I)(if (equal elem (nth I list))(progn(setq RET I)(setq I LEN))(setq I (1+ I))))RET)
	)

;�����X�g�̍Ō�̐�����1�𑫂�(���������ʂ̐��l��Ԃ�)
(defmacro U-add-end (LIST &optional A)
	(` (setcar (nthcdr (1- (length (, LIST))) (, LIST)) (+ (, (if A A 1))(nth (1- (length (, LIST)))(, LIST)))))				;���X�g�̍Ō���{1����
	)

;�����X�g�̗v�f�� equal �ł�����̂��P�ɂ���
;
;(U-list-itii '(a b f c s d a b c d s))
(defun U-list-itii (QQ)
	(let (AA)
	(U-list-lla QQ '(progn (setq AA (U-del1 TMP AA))(setq AA (append AA (list TMP)))))
	(setq AA (nreverse AA))
	AA
	))

;����납�珈�����čs��
;
;(U-list-lla '(a b c d e f) '(insert (prin1-to-string TMP)))
(defun U-list-lla (LIST DO)
	(let* ((I (length LIST)))(while (> I 0)(let ((TMP (nth (1- I) LIST)))
		(eval DO)
	(setq I (1- I)))))
	)

;-------------------------------------------------------------------------------
;
;	��� :	�G���Ȋ֐�
;


;
;���Ȃ񂾂����H
;

(defun U-nth-match (num list line)(substring line (nth (* num 2) list)(nth (+(* num 2)1)list)))

;
;������̃V���{�����A�ēǂݍ��݉\�ȏ�ԂŁA�t�@�C���ɃZ�[�u���܂�
;
;
(defun U-save-symbol (FILE &rest LIST)
	(switch-to-buffer (get-buffer-create "* tmp *"))
		(let ((I 0)(LEN (length LIST)))(while (< I LEN)(let ((TMP (nth I LIST)))
			(if TMP(insert (concat "(setq " (prin1-to-string TMP) (if (boundp TMP)(concat " '"(prin1-to-string (eval TMP)))" nil") ")\n")))
		(setq I (1+ I)))))
	(write-file FILE)
	(kill-buffer (current-buffer))	; save cause change buffer name.
	)
;���p�X������i�f�B���N�g���� . �t�@�C�������j�����o��
;
;(file-namae "")
;(file-namae "/")
;(file-namae "file")
;(file-namae "/file")
;(file-namae "/file/")
;(file-namae "file/")
;(file-namae "/dir/file")
;(file-namae "/dir/file/")
;(file-namae "dir/file/")
(defun file-namae (STR)
	(if (string-match "\\(.*\\)/\\([^/]*\\)$" STR)(cons (concat (match-string 1 STR) "/")(match-string 2 STR))
	(cons "" STR)
	))
;
;����������m�����ɂ���
;
;	(U-expand-string "asd" 2)
;	(U-expand-string "����" 3)
;
(defun U-expand-string (STR N &optional A)
	(let ((LEN (string-width STR)))
	(if (> LEN N)(substring STR 0 (- N (- (string-bytes STR) (string-width STR))))
	(concat (if A nil STR) (make-string (- N LEN) ? )(if A STR))
	)))

;���J��������Ԃ�
;
;(string-bytes "a��")  -> 4
;(length "a��")  -> 2
;(U-string-column "a��") ->3

(defun U-string-column(STR)
	(+(length STR)(/(-(string-bytes STR)(length STR))2))
	)




;���ꏊ����s�ɕϊ�
;
;	(U-point-to-line (point))
(defun U-point-to-line (point &optional start)
	(count-lines (if start start 1) point)
	)


;��������u������(���K�\���\)
;
;(U-string-replace "ab" "b" "abbabAAaa")
(defun U-string-replace (FROM TO STR)
	(let ((I 0))(while (setq I (string-match FROM STR I))
		(setq I (+ I (length TO)))
		(setq STR (replace-match TO t t STR))
		)STR))


;���������܂܂�邩�ǂ���
;
;(U-string-find-ch "ABC" ?B)
(defun U-string-find-ch (FROM CH)
	(let* ((N 0)(I 0)(LEN (length FROM)))(while (< I LEN)(if (eq CH (elt FROM I))(setq N (1+ N)))(setq I (1+ I)))N)
	)

;���}�b�v����A�Y������֐����Ăяo���L�[�̕\���������Ԃ�
;
;(U-map-to-keystr 'narrow-to-page global-map)
;(U-map-to-keystr 'Ufm-return Ufm-map)
(defun U-map-to-keystr (FUN MAP)
	(let ((NUM (car-safe (where-is-internal FUN MAP))))
		(mapconcat 'U-event-string NUM " ")
	))

;���x�N�^�̒��̃C�x���g�����Ղ�������ɕϊ�����
;
;	(U-vector-to-keystr [(control)(tab)])
(defun U-vector-to-keystr (VECT)
	(mapconcat 'U-event-string VECT " ")
	)

;���C�x���g�����Ղ�������ɕϊ�����
;
;	(U-event-string 255)
;	(U-event-string Ic-recursive-key)
;	(U-event-string (read-event))
;	(U-event-string 'S-f9)
(defun U-event-string (NUM)
	(cond 
		;������
		((stringp NUM)
			(let ((STACK)(I 0)(LEN (length Ic-recursive-key)))
			(while (< I LEN)(setq STACK (concat STACK (U-event-string (elt Ic-recursive-key I))))(setq I (1+ I)))
			STACK))
		;
		((symbolp NUM)(prin1-to-string NUM))
		((listp   NUM)(prin1-to-string NUM))
		;���l
		(t (let (	(MOD	(event-modifiers	NUM))
			(BAS	(event-basic-type	NUM))
			)
			(setq BAS (if (numberp BAS)(char-to-string BAS)(prin1-to-string BAS)))
			(if (equal " " BAS)(setq BAS "SPC"))
			(concat (mapconcat (function (lambda (A)(cond
				((eq 'meta A)"M-")
				((eq 'alt A)"A-")
				((eq 'control A)"C-")
				((eq 'hyper A)"H-")
				((eq 'super A)"s-")
				((eq 'shift A)(if (eq (length BAS)1)(progn(setq BAS (upcase BAS))nil)"S-"))
				))) MOD "") BAS)
		))))

;����������
;
;(defmacro U-for (I X Y &rest BODY)
;	"for��"
	;(for i 1 3 (insert (prin1-to-string i)))
;	(let ((TMP (make-symbol "MAX")))
;		(` (let (((, I) (, X))((, TMP) (, Y)))
;			(while (<= (, I) (, TMP)) (,@ BODY) (inc (, I)))
;		))))

;���{�{
;
;(defmacro U-inc
	;(setq A 1)
	;(inc A)
;	(var)(list 'setq var (list '1+ var)))

;-------------------------------------------------------------------------------
;
;	��� : �F���Emacs�����E�ɂ͑��݂���̂�
;
;		����̊֐��́A������T�|�[�g����Ă񂾂��ǂ�����Ȃ�����ˁB
;		����ł����Ɠ����񂾂낤���H�H
;
;(symbol-function 'functionp)

; functionp
(condition-case nil (functionp 'functionp)(error
	(defun functionp (SYM)(condition-case nil (symbol-function SYM)(error)))
	))

; string width
(if (functionp 'string-width)()
	(defun string-width (STR) (length STR))
	)

; (split-string "	A B CD EFG DFS ")
(if (functionp 'split-string)()
	(defun split-string (string &optional separators)
		(let ((STACK))
		(while (setq I(string-match (concat "[^"(if separators separators " \t\n")"]+") string))
		(setq STACK (append STACK (list (match-string 0 string))))
		(setq string (replace-match "" nil nil string))
		)STACK))
	)
; facep
(if (functionp 'facep)()
	(defun facep (FACE) (memq FACE (face-list)))
	)

; decode-coding-string
(if (functionp 'decode-coding-string)()
	(defun decode-coding-string(STRING CODING-SYSTEM &optional NOCOPY)STRING)
	)

; encode-coding-string
(if (functionp 'encode-coding-string)()
	(defun encode-coding-string(STRING CODING-SYSTEM &optional NOCOPY)STRING)
	)

; windows95 ���ȁH
(defun U-win32p()(or (string-match "win32"(version))(string-match "windows"(version))))

(provide 'misc-Uz)

;;;misc-Uz.el ends here
