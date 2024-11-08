;;; Ic.el --- Menu system for Emacs
;;
;; Copyright (C) 1997 �P�c ��j (Usuda Hiroshi)

;; Author: Usuda Hiroshi <usuda-hiroshi@fujielectric.co.jp>(http://www.d4.dion.ne.jp/~usuda/)
;; Keywords: menu
;; Version : 5.1.29
;; Last-Modify : Sat Jul  1 01:34:49 2000
;; Test : GNU Emacs 20.2.2 | XEmacs21

;;; Commentary:

;;  �� ���쌠
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
;;  ���쌠�͕ێ����܂����A�����E�z�z�E�ύX�͑劽�}�B�ύX���Ă����̎���
;;  �����Ă����ΘA���͂���܂���B�z�z�̍ۂ́A���ۏ؁A�������ł��˂�
;;  �����܂��B�ڂ����� �uGNU General Public License version 2�v������
;;  ���������B
;;
;;  �� �����ł���̂��H
;;
;;  �J�[�\���ō��ڂ�I�Ԃ��Ƃ̏o���郁�j���[�ł��B�c�n�r�̃t�@�C���Z��
;;  �N�^�̂悤�Ȋ����Ŏg���܂��B���ڂ͊ȒP�ɒǉ��ł���̂ŁA�}�E�X�Ń�
;;  �j���[�o�[���N���b�N�������Ȃ��l�́A���܂�g��Ȃ��R�}���h��o�^��
;;  �Ă��������ł��֗��ł��傤�B�T���v���v���O�����ł��A�܂��܂����ꂵ
;;  ���@�\�������Ă���͂��ł��B�����ł�������x�̓J�X�^�}�C�Y�ł��܂�
;;  ���A������Ƃk��������׋�����ƌ��\�F�X�o���Ă��܂��܂��B�g������
;;  ���Ȃ�����I�ʓr�Amisc-Uz.el ���K�v�ł��B�܂��A�P�̂ł͓��삵��
;;  ����B�����܂Ń��C�u�����ł��B Ic ���C�u�����ƁA�Ă�ł��������B
;;
;;  �������͒��ɃT���v��������܂��B
;;
;;	Ver.5 ���A�؍\���̕\�����o����悤�ɂȂ�܂����B
;;
;;  �� �C���X�g�[�����@
;;
;;  ���̃t�@�C�����A�ϐ� load-path �ɁA�o�^���ꂽ�f�B���N�g���ɁA�R�s�[
;;  ���Ă��������B�ǂ�����Ȃ��l�́AC-h C-v load-path �Ɠ��͂���ƁA�R
;;  �s�[���ׂ��f�B���N�g�����\������܂��B���Ɏ��ۂɃ��j���[���`����
;;  �t�@�C��(�Ⴆ�� : Ic-Um4.el)��p�ӂ��āA~ /.emacs �Ɉȉ��̂悤
;;  �ɁA�ǉ����Ă��������B
;;
;;      (load-library "Ic-Um4")
;;
;;  ���x�ȗ�Ƃ��āA�t�@�C���}�l�[�W���ƁA�f�o�b�K�֘A�̃v���O��������
;;  �����������B���\�֗��ł��B
;;
;;  �F�̒�`���C�ɓ���Ȃ����́A�\�[�X�̈�ԍŏ��ɂ���悤�Ɏ��R�ɕς�
;;  �Ă���č\���܂���B
;;
;;  ���x�ȃT���v���ł́A�������ҏW���͂���Ƃ��ɍċA�ҏW���g���Ă���
;;  ���B���̎��A�ċA�ҏW�𔲂��邽�߂ɁA�ʏ�� C-x C-s ����͂��܂����A
;;  �ȉ��̕ϐ���~/.emacs �Ɏw�肷�邱�ƂŕύX�ł��܂��B
;;
;;  (setq Ic-recursive-key "\C-x\C-s")
;;
;;  ����A�ċN�ҏW���L�����Z���������Ƃ��ɂ͈ȉ��̃L�[�o�C���h�ŁA���A
;;  ���܂��B(���̐����ł͗ǂ�����Ȃ���������܂���ˁBUfm �� f2 f4 ��
;;  �����ĕ\�����������͂����ʂŁA�L�����Z���������Ƃ��ɑ������܂�)
;;
;;  (setq Ic-recursive-key2 "\C-x\C-k")
;;
;;  ���f�t�H���g�E�L�[�o�C���h
;;
;;  Ic-mode-map �ɃL�[�o�C���h���Ă��������B
;;
;;      q                       �L�����Z��
;;
;;      RET                     ���s
;;
;;      up      down            �J�[�\���㉺
;;      C-n     C-p
;;
;;      C-up    C-down          �J�[�\���㉺(5��)
;;
;;      left    right           �J�[�\�����E
;;      C-f     C-b
;;
;;      spase   BS              �m�[�h�ړ�
;;      C-left  C-right
;;      M-n     M-p
;;
;;      prior   next            �\�����X�N���[��
;;      S-up    S-down
;;      C-v     M-v
;;
;;		home    end				�\���̍ŏ�(�Ō�)�Ɉړ�
;;
;;      C-s C-r                 �\���E�C���h�E���̃C���N�������^���T�[�`
;;      M-s M-r
;;
;;      S-right S-left          �C���f�b�N�X�𐳋K�\���T�[�`
;;      C-M-s   C-M-r
;;
;;      + -                     �E�C���h�E�̕�������ς���
;;
;;      mouse-1                 �Z���N�V����
;;      mouse-2                 ���ڃZ���N�g(�_�u���N���b�N�Ŏ��s)
;;
;;      tab                     ����������̓o�^
;;      M-up M-down             ������̌���
;;
;;  �� �g�p��i�����܂ŗ�ł��B�ǂ�ȕ��ɂ��g���܂��j
;;
;;  �ȉ��� [~/.emacs] �ɒǉ����Ă݂āA���P�O�������Ă݂�ƁE�E�E
;;
;;  (require 'Ic)
;;  (define-key global-map [f10] 'sample-func)
;;
;;  ;���ȒP�Ȋ֐��̗�
;;  (defun sample-func ()
;;      (interactive)
;;      (let ((func (Ic 'sample-table 'sample-option)))(if func (call-interactively func)))
;;      )
;;
;;  ;��option �́A�薼�����L�[�o�C���h�Ȃǂ�^���܂�
;;  (setq sample-option '(
;;          (title "�T���v��")
;;      ))
;;
;;  ;��table �́A�e���ڂ̑薼����������A�Ԃ��l����ێ����郊�X�g�ł��B
;;  (setq sample-table '(
;;      ("�ꊇ�u��"             query-replace                   "�ϊ�������ƕϊ���̕���������ɓ��͂��Ă��������B")
;;      ("�ꊇ�u�� ���K�\��"    query-replace-regexp            )
;;      ("���� �O��"            search-forward                  )
;;      ("���� �O�� ��"         re-search-forward               )
;;      ("���� �O�� ���K�\��"   search-forward-regexp           )
;;      ("���� ���"            search-backward                 )
;;      ("���� ��� ��"         re-search-backward              )
;;      ("���� ��� ���K�\��"   search-backward-regexp          )
;;      ("��`   Kill"          kill-rectangle                  "�|�C���g�ƃ}�[�N�̊Ԃ��A�l�p�`�ɐ؂�o���܂��B")
;;      ("��`   Yank"          yank-rectangle                  "�l�p�`�̈���R�s�[���܂��B")
;;      ("��`   ���W�X�^��"    copy-rectangle-to-register      )
;;      ))
;;
;;  �����Ƃ��A���̗p�r�ɂٍ͐� Um4 ���g�������������ł��B���X��������
;;  ���p�r�̂��߂ɍ�����悤�Ȃ��̂ł�����B
;;
;;  �������ЂƂ�������Ƃ��܂��傤�B���̕�����؂�o���� .emacs �ɒǉ�
;;  ����Ȃ肵�Ă݂Ă��������Byank ���e���݂Ȃ���}���ҏW�o������̂ŁA
;;  �ꍇ�ɂ���Ă͗L�p�ł��B
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
;; 	(title "e:�ҏW D:�폜 l:�����ݒ� ret:�}��")
;; 	(wink 3)(refresh (progn (Ic-yank-refresh)(Ic-refresh)))
;; 	(keymap Yank-map)
;; 	))
;; (defvar Yank-map (make-keymap))
;; (define-key Yank-map "e" '(lambda () (Ic-redit '(U-mod kill-ring Ic-IDX (buffer-substring (point-min) (point-max))))(Ic-yank-refresh)))
;; (define-key Yank-map Ic-return-key	'Ic-yank-return)
;; (define-key Yank-map "D" '(lambda ()(U-del kill-ring Ic-IDX)(Ic-yank-refresh)))
;; (define-key Yank-map "l" '(lambda ()(setq kill-ring-max (string-to-number (read-from-minibuffer "�폜�����O�̒��� : " "30")))))
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
;;  �� �@�����`
;;
;;      �ȉ��̕��͂́A���D���Ȃd���������k�������v���O���}�̂��߂̃��C
;;      �u�������ł���B���Ă������A���̃����ł��B
;;
;;      ���̕��������������l�̐l���ǂނ�����Ȃ�����ǁA�����A���̃��C
;;      �u�������g���Ă݂����Ƃ����l��������A�����������[���Ŏ��₵��
;;      ���������B�����A�ǂ�ł�����Ȃ����낤����B
;;
;;  �E�Ăяo����
;;
;;      (Ic 'table 'option)
;;
;;      table �� list �Ɖ]����̃V���{���������ɂƂ�B�ڍׂ͎��͂Ɏ�
;;      �����A�T�����������ƁAtable �͊e���ڂɑ΂�����ŁAoption
;;      �̓��j���[�S�̂ɑ΂����񂾁B
;;
;;      Ic �֐��� �E�C���h�E���Q��邪�A����� milk �� wine �Ɩ�
;;      �t����Bmilk �ɂ́A���ڂ��\������Ă�����J�[�\���őI�Ԃƈȉ�
;;      �̒l��Ԃ��B
;;
;;      (nth 1 (nth Ic-IDX table))
;;
;;      �����ŁAIc-IDX �̓J�[�\���ʒu�������C���f�b�N�X�ŁA���̃�
;;      �C�u�����ł͂����Ƃ��d�v�ȕϐ��ł��B
;;
;;      ����Awine �E�C���h�E�ɂ̓J�[�\���̈ړ��ɔ����ĐF�X�ȏ�񂪕\
;;      �������B�\���������̂́A(nth 2 (nth Ic-IDX table)) ��
;;      �l�ł���B
;;
;;      ���Ȃ݂� (nth 0 (nth Ic-IDX table))�́A���ڂ̑薼��^����B
;;
;;      ���������̓���͂���Ȋ����B�����ĐF�X�ȋ@�\�����čs��������
;;      �����ł��킯������Ȃ��Ȃ����B
;;
;;      ���Ƃ��΁Amilk �E�C���h�E�𕪊����đ�R�\���ł��郂�[�h(wink
;;      mode)�ٍ͐� Ufm �ȂǂŎg����B
;;
;;      ���L�ȃL�[�o�C���h�� Ic �֐��ɓn�����ƂŁAUfm �̂悤�ɐF�X
;;      �ȓ�����w�肷�邱�Ƃ��ł���B
;;
;;      Ic �֐��̒��� Ic ���Ă�ł��A���v�Ȃ悤�ɍ���Ă���B
;;      �~�j�o�b�t�@����Ă΂�Ă��A���Ԃ���v�B
;;
;;  �Etable �́A���̌`���̒l�����V���{��(�S�Ă̗v�f�����K�v�͂Ȃ�)
;;
;;      (("string" return expression next1 next2 user emphasize rest key-select local-keymap open-treep)...)
;;
;;      [0]string
;;
;;              �\�蕶��
;;
;;              �������Ȃ�΁A�ԍ��\��������B�A�g���Ȃ�󎚌��ʂ�\��
;;              ����B���X�g�Ȃ�A�]�����Č��ʂ𕶎���ɒ����ĕ\������B
;;
;;      [1]return
;;
;;              ���^�[���L�[�������ꂽ�Ƃ��ɁAIc �֐����Ԃ��l
;;
;;              �V���{���E������E���l�Ȃǂ͑����� Ic �֐��̖߂�l
;;              �Ƃ��ĕԂ���邪�A���X�g�̏ꍇ�͊֐��Ăяo���Ƃ��ĕ]��
;;              ���āAnil �����^�[�����܂��B���̎��A����̒l��Ԃ�����
;;              ��΁A(Ic-return ***) �̂悤�ȌĂяo��������Ηǂ��B
;;              �������A�������� �������ł��郊�X�g�͓��ʂŁA��������
;;              ���������]�����ă��^�[�����Ȃ��B
;;
;;      [2]expression
;;
;;              �J�[�\���������Ƃ��ɂ�����̃E�C���h�E Ic-name-wine
;;              �ɕ\������镶����
;;
;;              ������͂��̂܂ܕ\���A�A�g���͕ϐ��Ƃ��Ĉ󎚌��ʂ�\���A
;;              ���X�g�Ȃ�A�]�����Č��ʂ𕶎���ɒ����ĕ\������B����
;;              ���Ŏn�܂郊�X�g�̏ꍇ�A�E�C���h�E�̓��e�͏������ꂸ�A
;;              �����������������]������BIc wine ���Z���N�g���̃E
;;              �C���h�E�ɂȂ�̂ŁA���R�ɑ��삵�ėǂ��B����́A�J�[�\
;;              �����ړ�����x�ɋN�������֐��Ƃ��Ďg���Ă������̂��B
;;
;;      [3]next1 [4]next2
;;
;;              ���ꂼ�ꎟ�̃m�[�h�̈������X�g�ƃI�v�V�������X�g�B
;;              �܂��́A���̒l���������V���{���B
;;
;;      [5]user
;;
;;              ���[�U������ɗ��p�ł���̈�ł��B�����o�[�W�����̌݊�
;;              ����ۂ��߂ɋ@�\��ǉ�����Ƃ��ɂ́A���̃t�B�[���h��
;;              �g���Ă��������B�i���������N���g���̂��H�j
;;
;;      [6]emphasize
;;
;;              ���̍��ڂɑ΂���A�I����Ԃł̕\�����@���ȉ��̌`���ŗ^
;;              ����B((line top end face)(0 0 10 face)...)  ����́A
;;              ���ڂ��\������ line �s�ڂ� �J���� top �` end �� face
;;              �ŕ\��������Ď��Bnil �̏ꍇ�ɂ́A�ŏ��̍s�����F������
;;              ���B�i���ʃm�[�h������Ȃ�΁A�΁j
;;
;;      [7]rest
;;
;;              ���̍��ڂɑ΂���A���I����Ԃł̕\�����@���ȉ��̌`����
;;              �^����B((line top end face)(0 0 10 face)...)  ����́A
;;              ���ڂ��\������ line �s�ڂ� �J���� top �` end �� face
;;              �ŕ\��������Ď��Bnil �̏ꍇ�ɂ́A���������������܂���B
;;
;;      [8]key-select
;;
;;              �V���[�g�J�b�g�����̖����w��
;;
;;      [9]local-keymap
;;
;;              ���̍��ڂɓ��L�ȁA���[�J���L�[�}�b�v��^����B
;;
;;      [10]open-treep
;;
;;              tree ���[�ǂ̎��ɉ��ʂ̃m�[�h��\�����邩�H
;;
;;
;;  �Eoption    �́A���̌`���̒l�����V���{��
;;
;;      ((name arg arg ...)...)
;;
;;      name            �I�v�V������
;;      args            �����E�E�E
;;
;;  �E�I�v�V�����ڍ�
;;
;;      (title "title strings")
;;
;;          �擪�Ɏ��F�ɕ\�����܂��B���̂Ƃ���P�s�����T�|�[�g���Ă���
;;          ����B����ȏ�g����������w�肷��ƁA�\�����������������Ȃ�
;;          �Ă��܂��܂��B������łȂ��ꍇ�́A�]�����Č��ʂ�\�����܂��B
;;
;;      (milk-width 45)
;;
;;          Ic-name-milk �E�C���h�E�̕����w�肵�܂��BIc-wink ��
;;          �w�肳��Ă��Ȃ��Ƃ��Ɍ����āAwine-width �ɗD�悵�Đݒ肵
;;          �܂��B
;;
;;      (wine-width 54)
;;
;;          Ic-name-wine �E�C���h�E�̕��� 54 �Ɏw�肵�܂��B
;;
;;      (wine-split 1 3)
;;
;;          Ic-name-wine �E�C���h�E�̕��� 1 / 3 �Ɏw�肵�܂��B
;;
;;      (vertical)
;;
;;          Ic-name-milk �� Ic-name-wine �𐂒��������܂��B
;;
;;      (keymap ...)
;;
;;          �Ǝ��̊g���L�[�o�C���h�� keymap �ŗ^���܂��B�f�B�t�H���g��
;;          �o�C���h�̑O�Ɍ�������̂ŁA�㏑���\�ł��B���ʃm�[�h�ł́A
;;          �V���Ƀo�C���h�������Ȃ�����A��ʃm�[�h�̊g���L�[�o�C���h
;;          ���p������܂��B
;;
;;      (no-keymap)
;;
;;          �f�t�H���g�̃L�[�}�b�v�̌��������s���܂���B�m�[�h�Ǝ��̃L�[
;;          �}�b�v���A���ړƎ��̃��[�J���L�[�}�b�v�����Ă�����Ă��Ȃ�
;;          �ƁA�����܂��Ⴄ�̂��B
;;
;;      (wink 3)				�R��������
;;      (wink (15 27 36 17))	�������ƃE�C���h�E�̕��ݒ�(������)
;;
;;          �����s�\�����[�h�BIc milk �E�C���h�E���c�ɕ�������B�E
;;          ���L�[�ŉ��Ɉړ��ł��܂��B�m�[�h�؂�ւ��́AC-left C-right
;;          �ōs���Ă��������B�^�C�g���⍀�ڂɂ���s�ȏ���g���悤�ȁA
;;          ���j���[�ɂ͌����܂���B�\����J�[�\���ړ����ςɂȂ�܂��B
;;
;;      (wink-less 10)
;;
;;          �����s�\�����[�h�B�Œ�P�O�s���m�ۂ��ĕ������܂��B
;;
;;      (no-wine)
;;
;;          wine �E�C���h�E��\�����܂���B
;;
;;      (before-exec    (progn �]�X))   �L�[�o�C���h���ꂽ�֐������s����O
;;      (after-exec     (progn �]�X))   �L�[�o�C���h���ꂽ�֐������s�����
;;      (start          (progn �]�X))   �N�������Ƃ��Ɏ��s
;;      (end            (progn �]�X))   Ic �I������Ƃ��ɕK�����s
;;      (refresh        (progn �]�X))   �m�[�h���؂�ւ�������Ɏ��s
;;      (after-key      (progn �]�X))   ���[�J���L�[�o�C���h�����s������Ɏ��s
;;
;;          �E�C���h�E�������̂܂ܕۑ�����ɂ́A���̕������s����Ηǂ��B
;;          (setq Ic-history (current-window-configuration))
;;
;;      (wine-cut)
;;      (milk-cut)
;;
;;          �͂ݏo�����s��܂�Ԃ��\�����Ȃ��悤�ɂ���
;;
;;      (wine-mode-line ....)
;;      (milk-mode-line ....)
;;
;;          ���[�h���C��������ݒ肷��
;;
;;      (short-cut &rest eval)
;;
;;          �P�`�X�E�O�E���`���ɑ΂��āA���ڂ�I�����邩�A����Ή��ʂ�
;;          �m�[�h�Ɉڂ�悤�ɂ��܂��B���������͏I���L�[�Ɏg���̂ŋ֎~�B
;;          table �� key-select �̍��ڂ�����΁A�����D�悵�܂��Beval
;;          ���w�肵�Ă���΂�������s���A������΃m�[�h���~�����A�m�[
;;          �h���Ȃ���΂��̎��_�����s����B
;;
;;      (short-disp)
;;
;;          �V���[�g�J�b�g�̕������A���ڂ̍ŏ��Ɉ󎚂��܂��B
;;
;;      (notcls-win)
;;
;;          ��O������ nil �̏ꍇ�� Ic wine �o�b�t�@���N���A���Ȃ��B�J�[
;;			�\�����ړ�����Ƃ��A�K�� Ic wine �o�b�t�@�̓N���A�[�����B
;;			����Ȃ��̂́A���̃I�v�V�������w�肳��Ă���Ƃ����A(nil
;;			eval) �`���̕\���̎��݂̂ł���B
;;
;;
;;      (save-node Ic-Table-list)
;;
;;          ���ɋN�������Ƃ��Ƀm�[�h�̈ʒu�����Č�����B�����Ɏw�肳
;;          ��Ă���l�͈ʒu����^���邪�A�l���̂͏I���̍ۂ� Ufm ��
;;          �����I�ɕۑ�����̂ŋC�ɂ��Ȃ��ł����B
;;
;;      (tree)
;;
;;          �c���[���[�h�łł���B���������ł�����B�Ȃ񂾂����������
;;          �����݂����ł������B����Ă݂�΁A�킩���ł���B
;;		    speedbar.el �݂����H
;;
;;      (under-milk)
;;
;;			�\��������� wine �ł͂Ȃ��Amilk �̌��ɏo�͂���
;;
;;
;;  �E�R�����g
;;
;;      Ic�̈������A�V���{�����œn�������R�́A����������׋��Œ���
;;      �������̂œ����ō��ڂ�ύX���Ă��Ăяo�����߂����Ƃ��ɂ́A��
;;      �Ƃ̏�Ԃɖ߂��Ă��鎖�����҂�������ł���B�������A���X�g�̓R
;;      �s�[���ēn�����킯�ł͂Ȃ��ŁA����Ȃ��Ƃ͋N��Ȃ������B����
;;      �Ȃ��ẮA���̎d�l�͉����������悤�ȋC�����邵�A��ςȑ��g�ɂȂ�
;;      �Ă��܂����悤�ȋC�����邪�A�ύX�͗e�Ղł͂Ȃ��B�܁A�������B
;;
;;		���N����A���̎d�l�͑�ςȃf�U�C���s�ǂŗL�邱�Ƃ����������B�����B
;;
;;
;;   (define-key [S-f1]	'Ic-menu-insert  )   ; �}��
;;   ([M-f1]          Ic-menu-delete  )   ; �폜
;;   ([delete]        Ic-menu-push    )   ; �o�t�r�g
;;   ([insert]        Ic-menu-pop     )   ; �o�n�o
;;   ([f1]            Ic-menu-insert  )   ; �ǉ�
;;   ([f7]            Ic-menu-short)      ; �V���[�g�J�b�g�w��
;;   ([M-f7]          Ic-menu-short-del)  ; �V���[�g�J�b�g�폜
;;   (format "%10s : %s\n" (U-map-to-keystr 'Ic-menu-insert  Ugdb-map)   "���ڂ̒ǉ�")
;;   (format "%10s : %s\n" (U-map-to-keystr 'Ic-menu-title       Ugdb-map)   "�^�C�g���̕ύX")
;;   (format "%10s : %s\n" (U-map-to-keystr 'Ic-menu-push        Ugdb-map)   "���ڂ��폜���ċL���o�b�t�@�ɕۑ�")
;;   (format "%10s : %s\n" (U-map-to-keystr 'Ic-menu-pop     Ugdb-map)   "�L���o�b�t�@���炻���ɑ}��")
;;   (format "%10s : %s\n" (U-map-to-keystr 'Ic-menu-short       Ugdb-map)   "�V���[�g�J�b�g�̐ݒ�")
;;   (format "%10s : %s\n" (U-map-to-keystr 'Ic-menu-short-del   Ugdb-map)   "�V���[�g�J�b�g�̍폜")
;;
;;
;;�����ʊ֐��Ŏg���֐�(����)
;;
;;
;;	(defvar Ic-return-key [return])
;;	(defconst Ic-name-milk " *Ic milk*")
;;	(defconst Ic-name-wine " *Ic wine*")
;;
;;	(catch 'Ic-NEXT t)				�S�Ă��L�����Z�����Ď��̃L�[�o�C���h��ǂݍ���
;;	(catch 'Ic-BREAK t)				�S�Ă��L�����Z�����ă��C�u�������I������
;;
;;	�L�[�o�C���h�̓ǂݍ���
;;			��
;;	(Ic-option 'before-exec) �̎��s
;;			��
;;	keybind �� (Ic-idx 1) �̎��s
;;			��
;;	���� (= t Ic-ae) �Ȃ�A(Ic-option 'after-exec) �̎��s(�ݒ肵�Ȃ������� t)
;;			��
;;	Ic-keep-buffer �́A���j���[�I�����ɕ\������o�b�t�@��ێ�����B
;;			��
;;	�����A(eq Ic-refresh t)		�Ȃ烁�j���[�̍ĕ\��(�ݒ肵�Ȃ������� t)
;;	�����A(eq Ic-refresh save)	�Ȃ烁�j���[�̍ĕ\��(�ݒ肵�Ȃ������� t) �A���\�����̃o�b�t�@�ʒu�̓L�[�v����B
;;
;;	(before-exec    (progn �]�X))   �L�[�o�C���h���ꂽ�֐������s����O
;;	(after-exec     (progn �]�X))   �L�[�o�C���h���ꂽ�֐������s�����
;;	(start          (progn �]�X))   �N�������Ƃ��Ɏ��s
;;	(end            (progn �]�X))   Ic �I������Ƃ��ɕK�����s
;;	(refresh        (progn �]�X))   �m�[�h���؂�ւ�������Ɏ��s
;;	(after-key      (progn �]�X))   ���[�J���L�[�o�C���h�����s������Ɏ��s
;;
;;
;;  (notcls-win)
;;
;;          ��O������ nil �̏ꍇ�� Ic wine �o�b�t�@���N���A���Ȃ��B
;;
;;   (save-node Ic-Table-list)
;;
;;          ���ɋN�������Ƃ��Ƀm�[�h�̈ʒu�����Č�����B�����Ɏw�肳
;;          ��Ă���l�͈ʒu����^���邪�A�l���̂͏I���̍ۂ� Ufm ��
;;          �����I�ɕۑ�����̂ŋC�ɂ��Ȃ��ł����B
;;
;;  �� �Ƃ茾
;;
;;  1997.12.21
;;
;;      ������������A����Ȃ��̂͂����Ƃ����ɒN��������Ă���̂����m
;;      ��Ȃ��B�������A�����Ɛ������̂��B�����������������Ƃ���҂ɋ�
;;      ���Ă͂����Ȃ��B�ނ͋x���̑傫�ȕ��������̃v���O���~���O�ɔ��
;;      ���Ă���̂��B�����āA�����΂���̐l���֗����Ɗ����Ă����΁A
;;      �K���ȋC���ɂȂ��čX�ɋM�d�ȋx��������邱�Ƃ��낤�B
;;
;;  1998.5.5
;;
;;      �\�[�X�����ꂢ�ɂ����B�Y��ɂ��Ă����������������߂��͂Ȃ�����A
;;      �����ƁA�V�����o�O�������Ă���B�ł��A�Y��ɂ����ɂ͂���Ȃ��B
;;      ���ꂪ�A�}�`���A�v���O���}�B�����B
;;
;;  1999.3.5
;;
;;      �\�������������Ȃ�o�O��ގ����܂����B�����Ŏ���22�˂ɂȂ�܂����B
;;      �ŋ� SNES �ŗV��ł܂��B�ł�������Ď��Ԃ̖��ʂ���ȁB
;;
;;  2000.8.29
;;
;;      �Q�N�����̂��E�E�E�E�����Q�R�˂��B�����B�������Đ�������
;;      �Ȃ��C������B�x���̓t���[�\�t�g�����A�������Ă��܂��Ȃ��M�^�[
;;      ��e���A����t���ǂ݊w���Ƃ������ĕς��Ȃ������𑗂��Ă���B
;;
;;  2000.10.28
;;
;;      tree-mode �ǉ�
;;
;;  2001.02.17
;;
;;		customize �ɑΉ��Bdefgroup �� Ic ��ǉ��B
;;
;;
;;

;;; Code:

(require 'misc-Uz)

;-------------------------------------------------------------------------------
;
;   ��� :  �J�X�^�}�C�Y�p�ϐ�
;
(defgroup Ic nil "Customization of the multI purpose object seleCtor { Ic }.")

(defcustom Ic-return-key	 [return]
	"���j���[�̒��ō��ڂ̑I���Ȃǃ��^�[���L�[�Ƃ��Ĉ�����L�["
	:group 'Ic :type 'sexp)

(defcustom Ic-recursive-key	 "\C-x\C-s"
	"���j���[�̒��ōċN�ҏW���A�ׂ̈̃L�["
	:group 'Ic :type 'sexp)

(defcustom Ic-recursive-key2	 "\C-x\C-k"
	"���j���[�̒��ōċN�ҏW�L�����Z���ׂ̈̃L�["
	:group 'Ic :type 'sexp)

(defcustom Ic-Face-cur       'R-Yellow
	"�J�[�\���̐F" :group 'Ic)

(defcustom Ic-Face-cur2      'R-Green
	"�J�[�\���̐F�i���~�m�[�h������Ƃ��j" :group 'Ic)

(defcustom Ic-Face-title     'R-Ic1
	"�^�C�g���o�[�̐F" :group 'Ic)

(defface C-Blue '(
;;	(((class color)(background dark))	(:foreground "#10d5d5"))
;;	(((class color)(background light))	(:foreground "#2222FF"))
	(((class color)(background dark))	(:foreground "#10d5d5"))
	(((class color)(background light))	(:foreground "SlateBlue1"))
    )
	"�F" :group 'Ic)

(defface R-Blue '(
	(((class color)(background dark))	(:background "#00dddd" :foreground "black"))
	(((class color)(background light))	(:background "#7777FF" :bold t))
    )
	"�F ���]" :group 'Ic)

(defface C-Red '(
	(((class color)(background dark))	(:foreground "#ff4030"))
	(((class color)(background light))	(:foreground "#aa0000"))
    )
	"�ԐF" :group 'Ic)

(defface R-Red '(
	(((class color)(background dark))	(:background "#ff4030" :foreground "black"))
	(((class color)(background light))	(:background "#FFAAAA")); :foreground "blue"))
    )
	"�ԐF ���]" :group 'Ic)

(defface C-Yellow '(
;;	(((class color)(background dark))	(:foreground "#d9de10"))
;;	(((class color)(background light))	(:foreground "#333300"))
	(((class color)(background dark))	(:foreground "#d9de10"))
	(((class color)(background light))	(:foreground "salmon3"))
    )
	"���F" :group 'Ic)

(defface R-Yellow '(
;	(((class color)(background dark))	(:background "#d9de10" :foreground "black"))
;	(((class color)(background light))	(:background "#eeee55" :foreground "black"))
	(((class color)(background dark))	(:background "#ff0000" :foreground "black"))
	(((class color)(background light))	(:background "#a08000" :foreground "black"))
    )
	"���F ���]" :group 'Ic)

(defface C-Green '(
	(((class color)(background dark))	(:foreground "#10f010"))
	(((class color)(background light))	(:foreground "#009000"))
    )
	"�ΐF" :group 'Ic)

(defface R-Green '(
	(((class color)(background dark))	(:background "#10f010" :foreground "black"))
	(((class color)(background light))	(:background "#a0e0a0"))
    )
	"�ΐF ���]" :group 'Ic)

(defface C-Purple '(
;;	(((class color)(background dark))	(:foreground "#ff80ff"))
;;	(((class color)(background light))	(:foreground "#e050e0"))
	(((class color)(background dark))	(:foreground "#ff80ff"))
	(((class color)(background light))	(:foreground "#e050e0"))
    )
	"���F" :group 'Ic)

(defface R-Purple '(
	(((class color)(background dark))	(:background "#ff80ff" :foreground "black"))
	(((class color)(background light))	(:background "#F060F0" :foreground "#00FF00" :bold t))
    )
	"���F ���]" :group 'Ic)

(defface R-Ic1 '(
	(((class color)(background dark))	(:foreground "#00ff00" :background "#a020f0"))
	(((class color)(background light))	(:foreground "#00aa00" :background "#F060F0"))
    )
	"�\��" :group 'Ic)
;------------------------------------------------------------------------------------------

(defconst Ic-name-milk " *Ic milk*")
(defconst Ic-name-wine " *Ic wine*")

(defvar Ic-PP         nil)			; �v�b�V���|�b�v�̂��߂̕ϐ�
(defvar Ic-before-rec-hook  nil)    ; �ċN�ҏW�̑O�Ɏ��s�����t�b�N
(defvar Ic-tajyuu   0)
(defvar Ic-hook   nil)
;-------------------------------------------------------------------------------
;
;   ��� :  �L�[�o�C���h
;
;

(defvar Ic-mode-map (make-sparse-keymap))

;���s�ƏI��
(define-key Ic-mode-map Ic-return-key		'Ic-exec        )
(define-key Ic-mode-map "q"                 'Ic-quit        )
(define-key Ic-mode-map "+"                 (lambda ()(Ic-resplit '+)))
(define-key Ic-mode-map "-"                 (lambda ()(Ic-resplit '-)))

;�㉺
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

;�W�����v�ړ�
(define-key Ic-mode-map [(control up)]      'Ic-5-up        )
(define-key Ic-mode-map [(control down)]    'Ic-5-down      )

;���E�L�[
(define-key Ic-mode-map [right]             'Ic-right       )
(define-key Ic-mode-map [left]              'Ic-left        )
(define-key Ic-mode-map "\C-f"              'Ic-right       )
(define-key Ic-mode-map "\C-b"              'Ic-left        )

;�m�[�h�ړ�
(define-key Ic-mode-map [(control right)]   'Ic-next-node   )
(define-key Ic-mode-map [(control left)]    'Ic-prev-node   )
(define-key Ic-mode-map [spase]             'Ic-next-node   )
(define-key Ic-mode-map [backspase]         'Ic-prev-node   )
(define-key Ic-mode-map "\M-n"              'Ic-next-node   )
(define-key Ic-mode-map "\M-p"              'Ic-prev-node   )

;���݂̕��͂�����
(define-key Ic-mode-map "\C-s"              (lambda () (Ic-write-wine (setq Ic-refresh nil)(isearch-forward))))
(define-key Ic-mode-map "\C-r"              (lambda () (Ic-write-wine (setq Ic-refresh nil)(isearch-backward))))
(define-key Ic-mode-map "\M-s"              (lambda () (Ic-write-wine (setq Ic-refresh nil)(isearch-forward-regexp))))
(define-key Ic-mode-map "\M-r"              (lambda () (Ic-write-wine (setq Ic-refresh nil)(isearch-backward-regexp))))


;�薼���������č��ڂɈړ�
(define-key Ic-mode-map "\C-\M-r"           'Ic-search-b-IDX)
(define-key Ic-mode-map "\C-\M-s"           'Ic-search-f-IDX)
(define-key Ic-mode-map [(shift left)]      'Ic-search-b-IDX)
(define-key Ic-mode-map [(shift right)]     'Ic-search-f-IDX)

;���͂��������č��ڂɈړ�
(define-key Ic-mode-map [tab]               'Ic-search-STR  )
(define-key Ic-mode-map [(meta down)]       'Ic-search-r-STR)
(define-key Ic-mode-map [(meta up)]         'Ic-search-b-STR)

;�X�N���[��
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

;�}�E�X
(define-key Ic-mode-map [down-mouse-1]      'Ic-mouse-1         )
(define-key Ic-mode-map [mouse-2]           'Ic-mouse-2         )
(define-key Ic-mode-map [double-mouse-2]    'Ic-mouse-2         )
(define-key Ic-mode-map [(control meta end)]'Ic-recursive-edit  )

;�t���[���ԍċA�ҏW
;(define-key Ic-mode-map [switch-frame]      'Ic-recursive-edit	)

(defun Ic-recursive-edit ()
    (condition-case nil (handle-switch-frame last-input-event)(error))
    (message (concat "Ic : �ċN�ҏW�ɓ���܂��B�K�� " (U-map-to-keystr 'exit-recursive-edit global-map) " �ŁA�I�����Ă�������"))
    (if Ic-history (set-window-configuration Ic-history))
    (recursive-edit)
    )

;����
(if (string-match "XEmacs" (version))(progn
    (defun read-event ()
        (let (( e (let ((a (next-event)))(while (not (key-press-event-p a))(setq a (next-event)))a)))
            (if (event-modifiers e)(append (event-modifiers e) (list (event-key e)))(list (event-key e)))
        )
    )))
;-------------------------------------------------------------------------------
;
;   ��� :  �Ђ݂̊֐�
;
;   ���̃\�[�X�͑�R�R�����g�����邯��ǉ�ǂ��Ȃ������g�̂��߂ł��B��
;   �ɂ́A椂�ł�����Ȃ����Ď������邵�A���Ƃ�椂߂Ă������v���O��
;   ���ł��邱�Ƃ����邾��������ł��B
;
;	table �� option �Ƃ����f�[�^�\���������Ɣėp�I�Ɍ������K�v��������
;	���܂��B�ł��A���� Emacs Lisp �����肽���Ȃ��ȁBGuile Emacs ����
;	�y��������܂��B(�C�c�_��)
;
(defun Ic (table option)
    "Ic menu is multi purpose Lisp OBJECT selector.
If you want to use this function , See Ic.el.
"   ;�����������̉p�ꃂ�h�L�{���ɂ����Ă�H
    (interactive)
	;�t�b�N�̎��s
	(if Ic-hook(progn (run-hooks 'Ic-hook)(setq Ic-hook nil)))
    ;�G���[����
    (cond   ((or(not (boundp table))(not (boundp option)))(message "�������ݒ肳��ĂȂ���")(ding))
            ((boundp 'Ic-rec-flg)(message (concat "�ċN�ҏW������B" (U-event-string Ic-recursive-key) "�������Ă�"))(ding))
            (t
    ;���d�Ăяo���̓E�C���h�E����x���A���Ă���g��
    (if (< 0 Ic-tajyuu)(set-window-configuration Ic-history))
    ;���s�J�n
    (let* (
        ;-------------------------------------------------------------------------------
        ;�ϐ�����
        (Ic-Table           table                                   )   ; �\���v�f
        (Ic-Option          option                                  )   ; �I�v�V����
        (Ic-IDX             0                                       )   ; �J�[�\�����w���Ă��鏊�i�O����n�܂�ԍ��j
        (Ic-return          nil                                     )   ; �Ԓl
        (Ic-quit            nil                                     )   ; ���j���[���o��Ƃ��ɃZ�b�g���Ă����
        (Ic-title-str       nil                                     )   ; �擪�̕\���s
        (Ic-max             0                                       )   ; �v�f��
        (Ic-Table-list                                                  ; �m�[�h���オ��Ƃ��̂��߂́A�L�^�p�X�^�b�N((table option IDX)()...)
            (let* (
                (OP(Ic-option 'save-node 1))                ;
                (B  (if OP (nth (1- (length OP)) OP)nil))                   ;�Ō�̒l���g��
                )                                               ;IDX �ɂ��Ă͍ŏ��̒l���g��
            (if OP  (progn (setq Ic-Table (car B))(setq Ic-Option (nth 1 B))(setq Ic-IDX (nth 2 (car OP)))OP)
                    (list (list table option 0)))
            ))
        (Ic-win-milk        nil                                     )   ; milk window �N���O�̃E�C���h�E
        (Ic-win-wine        nil                                     )   ; wine window �V����������E�C���h�E
        (Ic-before-buffer   (current-buffer)                        )   ; �N���O�̑I���o�b�t�@
        (Ic-history         (current-window-configuration)          )   ; �N���O�̃E�C���h�E���
        (Ic-owin            nil                                     )   ; �N�����̂��̑��̃E�C���h�E
        (Ic-keep-buffer     nil                                     )   ; �I�����ɊJ�n�Ƃ͈Ⴄ�o�b�t�@��\����������
        (Ic-keep-windows    nil                                     )   ; �I�����ɊJ�n�Ƃ͈Ⴄ�E�C���h�E�\����\����������
        (Ic-wink            nil                                     )   ; wink mode �� ���� milk �E�C���h�E��
        (Ic-milk-list       nil                                     )   ; wink mode �� ���� milk ���X�g(��R���邩���)
        (Ic-no-wine         nil                                     )   ; wine �E�C���h�E�̕\�������Ȃ���

        (Ic-keymap          nil                                     )   ; �Ǝ��̃L�[�}�b�v
        (Ic-local-keymap    nil                                     )   ; ���[�J���L�[�}�b�v
        (Ic-lines           nil                                     )   ; �\���s���̕ۑ��X�^�b�N (2 3 4 ...)

        (Ic-refresh         t                                       )   ; �L�[���s�� t �̓��t���b�V��(default) save �� wine�̕\���J�n�ʒu��ۑ�����
        (Ic-before-exec     nil                                     )   ; �L�[���s�O �]������
        (Ic-after-exec      nil                                     )   ; �L�[���s�� �]������
        (Ic-ae			    nil                                     )   ; �L�[���s�� �]�����Ȃ��t���O
        (Ic-first           t                                       )   ; �͂��߂Ă��ǂ����̃t���O
        (Ic-short-cut       nil                                     )   ; �V���[�g�J�b�g�̕]�����X�g�������̓V���[�g�J�b�g�F���p�t���O
        (Ic-short-disp      nil                                     )   ; �V���[�g�J�b�g��\�����邩�ǂ���
        (Ic-null-format     '(format "----< %d >----" Ic-IDX)       )   ; ���ڂ̕\��������nil�̎��̎��s���X�g

        (Ic-wink-ofs        0                                       )   ; �y�[�W���̂̎n�܂鍀��IDX
        (echo-keystrokes    0                                       )   ; �ς��̂ł�

        (Ic-directory-wine  (if (get-buffer Ic-name-wine)           ; �f�B���N�g���̕ۑ�
                (save-excursion (set-buffer (get-buffer Ic-name-wine))default-directory)))
        (Ic-directory-milk  (if (get-buffer Ic-name-milk)           ; �f�B���N�g���̕ۑ�
                (save-excursion (set-buffer (get-buffer Ic-name-milk))default-directory)))

;       (Ic-recbuf-wine (if (and (boundp 'Ic-rec-flg) (get-buffer Ic-name-wine))    ; �o�b�t�@���e�̕ۑ�
;               (save-excursion (set-buffer (get-buffer Ic-name-wine))(buffer-string))
;               ))
;       (Ic-recbuf-milk (if (and (boundp 'Ic-rec-flg) (get-buffer Ic-name-milk))    ; �o�b�t�@���e�̕ۑ�
;               (save-excursion (set-buffer (get-buffer Ic-name-milk))(buffer-string))
;               ))

;       (Ic-history-win     nil                                     )   ;!!!
;       (Ic-history-refresh     nil                                 )   ;!!! �E�C���h�E�T�C�Y�Ȃǂ̕ύX������ꍇ�ɂ͂�������s����B
        )
        ;-------------------------------------------------------------------------------
        ;�~�j�o�b�t�@����̌Ăяo���́A�~�j�o�b�t�@�̃E�C���h�E���瓦����
        (if (window-minibuffer-p (selected-window))(progn (while (window-minibuffer-p (selected-window))(other-window 1))(delete-other-windows)))
        ;�{��
        (unwind-protect (progn
        (setq Ic-tajyuu (1+ Ic-tajyuu))
        (walk-windows (lambda (WIN)(if (eq WIN (selected-window))()(setq Ic-owin (append Ic-owin (list WIN))))))
        (Ic-refresh)
        (setq major-mode            'Ic-mode                )
        (setq mode-name             "Ic"                    )
        (if (Ic-option 'start 0)(eval (Ic-option 'start 1)))
        (catch 'Ic-BREAK (let ((KEY nil)(PREFIX nil)                )
        ;���C�����[�v
        (condition-case nil (while t
            (if Ic-quit     (throw 'Ic-BREAK t))    ; �I��
            (if Ic-return   (throw 'Ic-BREAK t))    ; �I��
            (setq KEY (vector (read-event)))        ; �C�x���g�擾
            ;�R�}���h����
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
            ;���s
            (catch 'Ic-NEXT (cond
                ((null func)    (throw 'Ic-NEXT t))     ; no function
                ((numberp func) (throw 'Ic-NEXT t))     ; why we need?
                ((keymapp func)(setq PREFIX func))      ; prefix
                (t  (if Ic-before-exec (eval Ic-before-exec))                                               ; �O���s

                    (condition-case VAR (funcall func)														; �֐����s
                        (error (message (concat "Ic exec error : " (prin1-to-string VAR)))(ding))
                        (quit (ding))
                        )

                    (setq PREFIX nil)       ; ���s
                    (if Ic-ae (setq Ic-ae nil)(if Ic-after-exec(eval Ic-after-exec)))                       ; ����s
                    (if(eq t Ic-keep-buffer)(setq Ic-keep-buffer (current-buffer)))							; �o�b�t�@�ۑ�
                    (if Ic-quit nil (cond   
							; �I���łȂ���΃��t���b�V������
							((eq Ic-refresh t)(Ic-refresh))			
							; �o�b�t�@�̈ʒu��ύX
                            ((eq Ic-refresh 'save)
                                    (let ((START (window-start Ic-win-wine)))
                                    (Ic-refresh)
                                    (set-window-start Ic-win-wine START)))
							; �\���o�b�t�@�̈ꎞ�I�ύX
							((stringp Ic-refresh)(let ((f Ic-refresh))(Ic-refresh)(select-window Ic-win-wine)(switch-to-buffer f)(select-window Ic-win-milk)))
							; ��Ƀ��t���b�V������
                            ((eq Ic-refresh nil)(setq Ic-refresh t))
                        )	; Ic-name-def ���ݒ肳��Ă�����A�����\������
						(if (and Ic-name-def (get-buffer Ic-name-def)) (progn (select-window Ic-win-wine)(switch-to-buffer Ic-name-def)(select-window Ic-win-milk)))
						)
                    )
                ))
            ))(quit(ding)(message "Ic ���C�u�������f������"))))))
        ;-------------------------------------------------------------------------------
        ;�I���ۏ�
        (mapcar (lambda (SYM)(unintern (symbol-name SYM)))Ic-temp-symbols)(setq Ic-temp-symbols nil)
        (setq Ic-tajyuu (1- Ic-tajyuu))
        (if (eq 0 Ic-tajyuu)(progn
            ;�g�b�v���x���̌Ăяo���̏ꍇ
            (set-window-configuration (if Ic-keep-windows Ic-keep-windows Ic-history))
            (if Ic-keep-buffer (switch-to-buffer Ic-keep-buffer))
            (let ((BUFF (get-buffer Ic-name-milk)))(if BUFF (kill-buffer BUFF)))    ; ��ƃo�b�t�@�̍폜
            (let ((BUFF (get-buffer Ic-name-wine)))(if BUFF (kill-buffer BUFF)))    ; ��ƃo�b�t�@�̍폜
            );���d�Ăяo���̏ꍇ
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
            ;�m�[�h�̋L��(�ŏ�ʃm�[�h�̕ϐ��ɂ��܂�Ȃ��Ƃ����Ȃ������)
            (let ((SY (nth 1 (nth 0 Ic-Table-list))))(if (Ic-option 'save-node 0 (eval SY))(progn
                (set SY (U-del3 'save-node (eval SY)))            ;save-node �̍�����������
                (setq Ic-Table-list (append (list (list
                        (nth 0(car Ic-Table-list))(nth 1 (car Ic-Table-list)) Ic-IDX))
                        (cdr Ic-Table-list)));�ŏ���IDX�����݂̒l�ɕύX����(�ŏ��� IDX �͎g���Ȃ��̂ł����Ŏg�p����)
                (set SY (append (eval SY) (list (list 'save-node Ic-Table-list))))
                )))
        )
        (if (Ic-option 'end)(eval (Ic-option 'end 1)))
        Ic-return
    ))))
;-------------------------------------------------------------------------------
;
;   ��� :  �V���[�g�J�b�g���s
;
;   ���̒��ŁA���s����͔̂������Ȃ����B
;
(defun Ic-short-sub (IDX)
    (if (> Ic-max IDX)(let (FUNC)
    (Ic-before-cur)
    (setq Ic-IDX IDX)
    (Ic-after-cur)
    (cond
        ((listp Ic-short-cut)   (mapcar (function eval) Ic-short-cut))          ;�������������ꍇ
        ((Ic-next-node)         )                                               ;�m�[�h���~
        ((and   (keymapp Ic-keymap)
            (setq FUNC (lookup-key Ic-keymap Ic-return-key t)))(funcall FUNC))  ;node map �� return �̓���
        (t                          (Ic-exec))                                  ;�|�C���g���s
    )
    (Ic-refresh)
    )))

;-------------------------------------------------------------------------------
;
;   ��� :  ���t���b�V���B�ǂ�ȏ�Ԃ���ł����ǂ���ɖ߂��Ă��܂��B�d���B
;           �\�����e�ɕύX���Ȃ�����A���΂Ȃ��ōς܂��̂�����
;
;	(defvar Ic-refresh	nil)	�ĕ\�����Ȃ�
;						t		����	(�f�B�t�H���g)
;						'save	�o�b�t�@�� Ic-name-wine �𕜋A�B�\���J�n�ʒu�͕ۑ��B
;						"buff"	�w��o�b�t�@��\��
;
;	Ic-keep-buffer		Ic �I�����Ɏw��o�b�t�@��\��
;
;	Ic-noaf				wine �ɏ������Ȃ�����t�ɐݒ肷��
;
;	(notcls-win)		table[3]==nil �̎��Ƀo�b�t�@���N���A�[���Ȃ�
;
;	Ic-name-def			Ic-name-wine �̑���ɏ�ɕ\������o�b�t�@�̖��O
;
(defvar Ic-name-def nil)

(defun Ic-refresh ()
    (interactive)
    ;�E�C���h�E�`��
    (Ic-window)
    ;�e��ϐ�������
    (let((KEYMAP (assoc 'keymap (eval Ic-Option))))(if KEYMAP (setq Ic-keymap (eval (nth 1 KEYMAP)))))
    (setq Ic-before-exec    (Ic-option 'before-exec 1))
    (setq Ic-after-exec     (Ic-option 'after-exec 1))
    (setq Ic-short-cut (let ((CUT (Ic-option 'short-cut 1 nil t)))(if CUT CUT (Ic-option 'short-cut 0))))
    (setq Ic-short-disp (Ic-option 'short-disp 0))
    ;�^�C�g������
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
	; ���� (0)
	; ���� (1)
	; ���� (2)
	; ������ (2 0)
	; ������ (2 1)
	; ������ (2 2)
	; ������ (2 3)
	; �������� (2 3 0)		(Ic-table nil 2 nil 3 0)
	; ������ (2 4)
	; �������� (2 4 1)
	; ������ (2 5)
	; ������ (2 6)
	; ���� (3)
	; ������ (3 0)
	; ������ (3 1)
	; ������ (3 2)
	; ���� (4)
	; ���� (5)
	; LL : �s����̂Ȃ��}�����Ȃ������p LL : (nil t nil t t) �́A"��  ��    " ����� nil
	; o  : ���̍s�ɕ\�����鍀�ڂ̓��e
	; NOW: ���ݕ\�����鍀��
	; I  : �S�s��

    (setq Ic-lines nil)
    (let ((OLD Ic-IDX)o(LL nil)(NEST (list 0))NOW)
	    (setq Ic-IDX 0)
		(catch 'B (while t
		;get table
		(while  (not (setq NOW (Ic-table nil NEST)))			;���̌���T��
				(if (eq 1 (length NEST))(throw 'B t))			;���X�g���Ȃ���ΏI��
				(U-del NEST -1)								;���X�g�̍Ō�����
				(U-add-end NEST)								;���X�g�̍Ō���{1����
				(if (eq 0 (length LL))(setq LL nil)(U-del LL -1))					;���X�g�̍Ō�����
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

		;���̃m�[�h�Ŏc��̕\�����ڂ����邩�ȁH
		(let ((A (apply 'list NEST)))
				(U-add-end A)(setq o (Ic-table nil A))
				)
        ;tree
        (if (Ic-option 'tree)(let (z l (a 0))
            (setq l (1- (length NEST)))(while (> l a)(insert (if (nth a LL)"  ""��"))(setq a (1+ a)))
            (insert (if (and (not z) o)"��""��"))
            (insert (if (and (nth 3 NOW)(nth 10 NOW))"�� " "�� "))
            ))

        ;�\��������
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
			;���̃m�[�h���\����ԂȂ��
			(setq LL (append LL (list (eq nil o))))
			(setq NEST (append NEST (list 0)))													;���X�g�̍Ō�ɗv�f(0)��ǉ�
			)
			;�m�[�h�͕\�����Ȃ�
			(U-add-end NEST)			;���X�g�̍Ō���{1����
			)
		(setq o nil)
		(setq Ic-IDX (1+ Ic-IDX))
        ))
	(setq Ic-max Ic-IDX)
	(setq Ic-IDX (if(>= OLD Ic-IDX)(1- Ic-IDX) OLD))	;Ic-IDX �𕜋A����
	(if (< Ic-IDX 0)(setq Ic-IDX 0));�^�}�ɂ��̎��Ԃ��N���� ���ڐ��O�̎�
    )
    ;�㏈��

	;wine �E�C���h�E�̕`��
	(Ic-after-cur)

	;�͂��߂Ɏ��s����ׂ�����
    (if Ic-first (progn (setq Ic-first nil)(if (Ic-option 'refresh)(eval (Ic-option 'refresh 1)))))

	;���t���b�V���͏�ɂ���̂�
    (setq Ic-refresh t)
    )

;�ŏ��̋N�����ɗv�f�͂Ȃ��I�v�V�����̒���
;
;   (refresh (�]�X)(Ic-refresh))
;
;�̂悤�ɗv�f��}������悤�ɂ���ƁA�ŏ��̓����o�[���O�Ȃ̂�
;Ic-max �� 0 �ɂȂ��Ă��܂���OLD �� -1 �ƂȂ�̂ŁA���ɏ�Ɉړ�����
;�Ƃ��Ɍ��Ă��܂��B

;-------------------------------------------------------------------------------
;
;   �薼 :  �E�C���h�E�쐬�i���t���b�V���̂Ƃ��ɌĂ΂��j
;
;   ��� :  �E�C���h�E�\���͈�x�N���O�̏�Ԃɖ߂���āA�܂��\�����꒼���B
;           �������A�E�C���h�E�̓��e(�o�b�t�@�ƈʒu)�́A����������Ȃ��悤�ɂ���B
;
;   Ic-win-wine �̒l�́AIc �̍ċA�Ăяo�����s������͈ȑO�̃E
;   �C���h�E�̒l�ɂȂ��Ă͂��邪�A Ic-win-wine �� Ic-refresh
;   �̂��ƂɕύX�����̂ŁA���ۂɂ͎g���Ȃ��ϐ��ł��邱�Ƃɒ��ӁB
;
(defun Ic-window ()
    ;���̃E�C���h�E�󋵂̕ۑ�
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

    ; wine �E�C���h�E�ƃo�b�t�@�̍쐬
;   (if (and Ic-history-win (not Ic-history-refresh))   ;!!!
;       (set-window-configuration Ic-history-win)           ;!!!

    (setq Ic-no-wine (Ic-option 'no-wine))
    (if (null Ic-no-wine)
    (let*(
        (Ic-horizontal (Ic-option 'vertical 0))
        (Ic-milk-width (Ic-option 'milk-width 1))   ; �D��
        (Ic-wine-width                                  ; ����
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
        (error (message "�E�C���h�E�̎w�蕝�����܂���ł���")
            (setq Ic-win-wine
                (split-window (selected-window)
                (/ (if Ic-horizontal (window-width) (window-height)) 2)
                Ic-horizontal))
        ))
    ))
;   (setq Ic-history-win (current-window-configuration)))   ;!!!

    ; milk �o�b�t�@�̍쐬
    (switch-to-buffer   (get-buffer-create Ic-name-milk))
    (setq tab-width 4)                                                                      ; tab
    (setq truncate-partial-width-windows (Ic-option 'milk-cut 0))                       ; cut lines
    (let ((LINE (Ic-option 'milk-mode-line 1)))(if LINE (progn(setq mode-line-format LINE)(force-mode-line-update))))   ; mode line

    ; wink ���[�h�̎��̃E�C���h�E�̕���
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
;   ��� :  �E�C���h�E�𕪊�����B�o���Ȃ���΁A�����������炵�čs���A
;           ���Ǖ����ł��Ȃ���΁AIc-wink �� 1 �ɐݒ肷��B
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
        (setq Ic-wink-ofs 0);�擪�ɖ߂�
        )
    (error (progn (setq Ic-wink (1- Ic-wink))
            (if (> 2 Ic-wink)(progn(setq Ic-wink 1)(throw 'BREAK t)))); 2 > �͏璷�H
            (Ic-wink-mode)
        )
    ))
    (select-window (get-buffer-window Ic-name-milk))
    )

;-------------------------------------------------------------------------------
;
;   ��� :  �J�[�\���̐F����
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
(defun Ic-face ()           ;�J�[�\���̐F�t��
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

(defun Ic-paint (line top end face)     ;�F�t���{��
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
;                (t              (condition-case nil (forward-char end)(error))))			���̎d�l�͌��ۂ�
                (t              (move-to-column end)))
        ;paint
        (put-text-property  x (point) 'face face nil)
    )))
    ;(Ic-paint 0 1 'end Ic-Face-cur2)

;-------------------------------------------------------------------------------
;
;   ��� :  ����������������
;
;
(defun  Ic-before-cur ()                ;�J�[�\���ړ��O�Ɏ��s
    (Ic-face-del Ic-IDX)
    )
(defvar Ic-noaf nil)					;���񂾂� wine �ɏ������ׂ݈Ȃ����߂ɂ�t�ɐݒ肷��
(defun  Ic-after-cur ()                 ;�J�[�\���ړ���Ɏ��s
    ;�J�[�\���F
    (Ic-face)
    ;���������o�b�t�@�ɏ�������
    (if (and (not Ic-noaf)(null Ic-no-wine))(progn
    (select-window Ic-win-wine)(switch-to-buffer Ic-name-wine)
    (let ((EXEC (Ic-idx 2)))
    (cond
            ; nil �Ȃ�o�b�t�@������
            ((null      EXEC)   (if (Ic-option 'notcls-win 0)()(erase-buffer)))
            ; �x�N�^�̓L�[�ɒ����ĕ\��
            ((vectorp   EXEC)   (erase-buffer)(insert(U-vector-to-keystr EXEC)))
            ; ������Ȃ炻�̂܂ܕ\��
            ((stringp   EXEC)   (erase-buffer)(insert EXEC))
            ; �A�g���Ȃ�Εϐ����e�̕\�� �֐����Ȃ�L�[�o�C���h���\��
            ((atom      EXEC)   (erase-buffer)(insert (concat
                (prin1-to-string (if (boundp EXEC)(eval EXEC)EXEC))
                " "(if (functionp EXEC)(U-map-to-keystr EXEC global-map))
                )))
            ; ���X�g�̏ꍇ�A���s���ʂ̕\��
            ((listp     EXEC)   (condition-case nil(if (null (car EXEC))
                                    (eval(cdr EXEC))		;�������Ŏn�܂郊�X�g�͒P�Ɏ��s
                                    (let ((STR (eval EXEC)));���s���ʂ̕\��
										(erase-buffer)
										(insert (if (stringp STR)STR(if STR (prin1-to-string STR)"")))		; nil �͕\�����Ȃ�
								))
                                ;�]���G���[
                                (error
                                    (erase-buffer)(insert (prin1-to-string EXEC))
                                    (ding)
                                    (message "�ւ�Ă��Ȋ֐����w�肳��Ă���"))
                                ))
            ; ���̑�(�����\��)
            (t                  (erase-buffer)(insert(prin1-to-string EXEC)))
        ))
    (if (Ic-option 'notcls-win 0)()(goto-char (point-min)))
    )(setq Ic-noaf nil))

	;wink mode �̍s�𑵂���
    (if (< 1 Ic-wink)
        (let ((I 0)(HEIGHT (progn (select-window (car Ic-milk-list))(1- (window-height)))));window has mode line
            (setq Ic-wink-ofs (*(* Ic-wink HEIGHT)(/ Ic-IDX (* Ic-wink HEIGHT))))
            (while (not(eq I (length Ic-milk-list)))
                (select-window (nth I Ic-milk-list))
                (goto-line (+ 1 (* I HEIGHT) Ic-wink-ofs))(recenter 0)
                (setq I (1+ I))
            )))

    (select-window Ic-win-milk)

    ;���[�J���L�[�}�b�v�̐ݒ�
    (setq Ic-local-keymap (Ic-idx 9))
    )
;-------------------------------------------------------------------------------
;
;   ��� :  ��ʃL�[�V�[�P���X
;

(defun Ic-quit (&optional RET)      ;�����܂�
    (interactive)
    (setq Ic-refresh nil)
    (if RET (setq Ic-return RET))
    (setq Ic-quit t)
    )

(defun Ic-exec (&optional IDX)      ;���s
    (interactive)
    (let ((FUNC (Ic-idx 1 IDX)))
    (cond
        ((null  FUNC)t)
        ((and (listp FUNC)(null(car FUNC)))         (eval (cdr FUNC)))                                  ; �]��
        ((and (listp FUNC)(not (null(car FUNC))))   (eval FUNC)(setq Ic-quit t))                        ; �]�������^�[��
        (t                                          (setq Ic-return FUNC)(setq Ic-quit t))              ; ���̑�
    )))

(defun Ic-up (&optional N)          ;��i�Y���͌���j
    (interactive)
    (Ic-before-cur)
    (if N ()(setq N 1))
    (setq Ic-IDX (let ((ANS (- Ic-IDX N)))(if(< ANS 0)(+ Ic-max ANS)ANS)))
    (setq Ic-refresh nil)
    (Ic-after-cur)
;    (setq Ic-ae t)		; ����̃f�B�t�H���g�ς��܂���
    )
(defun Ic-down (&optional N)        ;���i�Y���͑�����j
    (interactive)
    (Ic-before-cur)
    (if N ()(setq N 1))
    (setq Ic-IDX (let ((ANS (+ Ic-IDX N)))(if(>= ANS Ic-max)(- Ic-max ANS)ANS)))
    (setq Ic-refresh nil)
    (Ic-after-cur)
;    (setq Ic-ae t)
    )

(defun Ic-right ()                  ;�E
;    (cond
;		((and (eq 1 Ic-wink)(Ic-option 'tree))(Ic-wink-next))
;		((eq 1 Ic-wink)(Ic-next-node))
;		(t (Ic-wink-next))
;		)
	(if (eq 1 Ic-wink)(Ic-next-node)(Ic-wink-next))
    )
(defun Ic-left ()                   ;��
;    (cond
;		((and (eq 1 Ic-wink)(Ic-option 'tree))(Ic-wink-prev))
;		((eq 1 Ic-wink)(Ic-prev-node))
;		(t (Ic-wink-prev))
;		)
    (if (eq 1 Ic-wink)(Ic-prev-node)(Ic-wink-prev))
    )

(defvar Ic-temp-symbols ())
(defun Ic-next-node ()              ;�E�i���̃m�[�h�ցj
    (interactive)
    (if (Ic-option 'tree)(if (Ic-idx 3)(progn (Ic-idx 10 nil nil t t)(setq Ic-first t)))
    (let(( NEXT-LST (Ic-idx 3))(NEXT-OPT(nth 4(nth Ic-IDX (eval Ic-Table)))))
        (cond
            ((null NEXT-LST)(message "���̃m�[�h�͂Ȃ����")nil)
            ((symbolp NEXT-LST)
                (setq Ic-Table-list (append Ic-Table-list (list (list NEXT-LST NEXT-OPT Ic-IDX))))
                (setq Ic-Option NEXT-OPT)
                (setq Ic-Table  NEXT-LST)
                (setq Ic-IDX 0)
                (setq Ic-first t)
                )
            ((listp NEXT-LST)   ;���X�g���̂��̂�o�^���Ă���ꍇ�́A�ꎞ�ϐ����쐬���� setq ����B
                (setq Ic-Option (intern (make-temp-name "Ic")))(set Ic-Option (if (symbolp NEXT-OPT)(eval NEXT-OPT)NEXT-OPT))
                (setq Ic-Table  (intern (make-temp-name "Ic")))(set Ic-Table  (if (symbolp NEXT-LST)(eval NEXT-LST)NEXT-LST))
                (setq Ic-temp-symbols (append Ic-temp-symbols (list Ic-Table Ic-Option)))
                (setq Ic-Table-list (append Ic-Table-list (list (list Ic-Table Ic-Option Ic-IDX))))
                (setq Ic-IDX 0)
                (setq Ic-first t)
                )
        ))))

(defun Ic-prev-node (&optional N F)   ;�E�i��̃m�[�h�ցj
    ; +N �O���琔���� N �ԖڂɈړ� 0 �͈�ԍŏ����m�[�h�B-N �� N ��O�ɖ߂���Ă���
    ; ((1st-table 1st-opt 0)(2st-table 2st-opt 1st-idx) ... )�̂悤�Ɋi�[����Ă���
	; F ���w�肳��Ă���� tree ���[�h�̎��ɂ��A�m�[�h�����~����
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
    (if (< N 0);�}�C�i�X
    (if (>= (- N) (length Ic-Table-list))(message "�m�[�h�~���ł��Ȃ���")
        (while (not (eq 0 N))
        (setq Ic-IDX    (nth 2 (nth (1- (length Ic-Table-list))Ic-Table-list)))
		(U-del Ic-Table-list -1)
        (setq Ic-Table  (nth 0 (nth (1- (length Ic-Table-list))Ic-Table-list)))
        (setq Ic-Option (nth 1 (nth (1- (length Ic-Table-list))Ic-Table-list)))
        (setq N (1+ N))
    ));�v���X
        (if (< N 0)()
        (setq Ic-IDX    (nth 2 (nth (- (length Ic-Table-list) N 1)Ic-Table-list)))
        (let ((M (- (length Ic-Table-list) N)))(while (> M 1)(U-del Ic-Table-list -1)(setq M (1- M))))
        (setq Ic-Table  (nth 0 (nth N Ic-Table-list)))
        (setq Ic-Option (nth 1 (nth N Ic-Table-list)))
    ))
    (setq Ic-first t)))

(defun Ic-wink-next ()              ;wink ���i���̃E�C���h�E�ցj
    (interactive)
    (Ic-face-del Ic-IDX)
    (setq Ic-IDX (+ Ic-IDX (1-(window-height))))
    (if(<= Ic-max Ic-IDX)(setq Ic-IDX (1- Ic-max)))
    (setq Ic-refresh nil)
    (Ic-after-cur)  )

(defun Ic-wink-prev ()              ;wink ���i�O�̃E�C���h�E�ցj
    (interactive)
    (Ic-face-del Ic-IDX)
    (setq Ic-IDX (- Ic-IDX (1-(window-height))))
    (if(< Ic-IDX 0)(setq Ic-IDX 0))
    (setq Ic-refresh nil)
    (Ic-after-cur)
    )

(defun Ic-idx-spec (N)              ;IDX����
    (Ic-face-del Ic-IDX)
    (setq Ic-IDX N)
    (if(< Ic-IDX 0)(setq Ic-IDX 0))
    (if(<= Ic-max Ic-IDX)(setq Ic-IDX 0))
    (setq Ic-refresh nil)
    (Ic-after-cur)
    )

(defun Ic-5-up ()                   ;��T�i�Y���͌���j
    (interactive)
    (Ic-face-del Ic-IDX)
    (setq Ic-IDX (- Ic-IDX 5))
    (if(< Ic-IDX 0)(setq Ic-IDX 0))
    (setq Ic-refresh nil)
    (Ic-after-cur)
;    (setq Ic-ae t)
    )
(defun Ic-5-down ()                 ;���T�i�Y���͑�����j
    (interactive)
    (Ic-face-del Ic-IDX)
    (setq Ic-IDX (+ Ic-IDX 5))
    (if(<= Ic-max Ic-IDX)(setq Ic-IDX (1- Ic-max)))
    (setq Ic-refresh nil)
    (Ic-after-cur)
;    (setq Ic-ae t)
    )
(defun Ic-resplit (to)              ;wink �� ��������ς��܂� to �� '+ �� '-
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
;   ��� :  �}�E�X�̓���
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

;�|�C���g�ʒu�̍s�ԍ�����AIc-lines ���������āA���̓Y����Ԃ��B
(defun Ic-mouse-2 ()
    (interactive)
    ;MILK �E�C���h�E��������
    (if (or (eq Ic-win-milk (posn-window (event-start last-input-event)))
		(member (posn-window (event-start last-input-event)) Ic-milk-list)
		)
    (catch 'BREAK (let((IDX)(POINT (posn-point (event-start last-input-event))))
        (if (numberp POINT)()(throw 'BREAK nil))    ; ���[�h���C����
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
;   ��� :  �e�팟�����[�`��
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
    (if (eq 0 Ic-search-IDX)(message "��ɂ͗v�f���Ȃ��ł���")(Ic-search-sub Ic-search-REGEXP (1- Ic-search-IDX) t))
    )
(defun Ic-search-r-STR ()
    (setq Ic-refresh 'save)
    (Ic-search-sub Ic-search-REGEXP (1+ Ic-search-IDX) nil)
    )

(defun Ic-search-STR ()
    (setq Ic-search-IDX Ic-IDX)
    (setq Ic-search-REGEXP(read-from-minibuffer "�����񌟍� REGEXP :"))
    (message (concat "���K�\����o�^���܂����B"
        (U-map-to-keystr 'Ic-search-r-STR Ic-mode-map)" "
        (U-map-to-keystr 'Ic-search-b-STR Ic-mode-map)" "
        "�ɂ���Č����ł��܂�"))
    )

(defun Ic-search-sub (REGEXP start dire)            ;dire = nil : 0 to 999
    "��������������āA���̍��ڂɈړ����܂�"
    (catch 'END (let ((POS 0)(STR)(IDX start)(EXEC nil))
    (Ic-idx-spec (setq Ic-search-IDX(catch 'BREAK (while t
        ;������̎�o��
        (setq EXEC (nth 2 (nth IDX (eval Ic-Table))))
        (setq STR (cond
            ((vectorp   EXEC)(U-vector-to-keystr EXEC))
            ((stringp   EXEC)EXEC)
            ((atom      EXEC)(concat
                (prin1-to-string (if (boundp EXEC)(eval EXEC)EXEC))
                " "(if (functionp EXEC)(U-map-to-keystr EXEC global-map))
                ))
            ;���X�g�ɕ���p������ꍇ�ɍ��邵�A�]���̌��ʃo�b�t�@�ɒ��ڏ������ނ悤��
            ;���ڂ������Ƃ���Ɛ����������ł��܂���ˁB
            ((listp     EXEC)   (condition-case nil(if (null (car EXEC))
                                    (eval(cdr EXEC))
                                    (let ((STR (eval EXEC)))(if (stringp STR)STR(prin1-to-string STR))))
                                (error(prin1-to-string EXEC))))
            (t          (prin1-to-string EXEC))))
        ;������̌���
        (if (setq POS (condition-case nil (string-match REGEXP STR)(error)))(throw 'BREAK IDX)(setq IDX (if dire (1- IDX)(1+ IDX))))
        (if (if dire (< IDX 0)(> IDX Ic-max))(progn(message "���̕�����͖����悤����")(throw 'END t)))
        ))))
    ;�ړ����܂�
    (Ic-write-wine (goto-char POS)(recenter 0))
    (message (concat REGEXP " ����܂���"))
    )))

;-------------------------------------------------------------------------------
;
; ����FIc-table �ƈ���āA�J�[�\���ʒu����e�[�u���̒l�����o���B
;
;
;
(defun Ic-idx (elem &optional idx table f rep)        ; ���ڃ��X�g�Q��(Ic-IDX ���猟�� tree-mode �̎��ɂł�)
	" �J�[�\���ʒu�� (\"�\��\" ���^�[�� \"��������\" ...) ��Ԃ�

	ELEM	: �v�f�ԍ�
	IDX		: ���ڔԍ� def : Ic-IDX
	TABLE	: �e�[�u�� def : Ic-Table �V���{����n����
	F		: �����o�u����������t���O(���L�Q��)
	REP		: �u���������

		nil	: �Q��
		t	: �u������	table[idx][elem]=rep
		ins	: �}��
		del	: �폜
		push: �v�b�V��
		pop	: �|�b�v
"
	(if idx		nil (setq idx Ic-IDX))
	(if table	nil (setq table Ic-Table))

	(if (or (condition-case nil (Ic-option 'tree 0)(error nil))f)
	;�����ʃm�[�h�̒T���t
	(cond
	; ���ڂ��v�f��Ԃ�
	((eq f nil)	(let ((A (Ic-xdi idx (eval table) 0 (list 0) 0)))(if (numberp (car-safe A))nil(if elem (nth elem A)A))))
	; �v�f��ύX
	((eq f t)	(let ((A (Ic-xdi idx (eval table) 0 (list 0) 0)))(if (numberp (car-safe A))nil (U-modq A elem rep))))
	; ���ڂ�}��(�V�������ڂ̔ԍ���Ԃ�)
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
	; ���ڂ��폜
	((eq f 'del)	(if (> 2 (length (eval table)))(set table nil)(let* (
						(A (Ic-xdi idx (eval table) 0 (list 0) 0 (list 0)))
						(B (elt A 0))
						(I (nth (1- (length B)) B))
						(C (progn (U-del B -1)(if B (nth 3 (Ic-table nil B (eval table)))(eval table))))
						(D (if (symbolp C)(eval C)C))
						)
						(U-del D I)
				)))
	; ���ڂ��폜(&push)
	((equal f 'push)(if (eval table)(let (
						(A (Ic-xdi idx (eval table) 0 (list 0) 0))
						)
					(setq Ic-PP (append Ic-PP (list A)))
					(Ic-idx nil idx table 'del)
				)))

	; ���ڂ�}��(pop)
	((equal f 'pop) (if Ic-PP(progn (if (eval table)
						(Ic-idx elem idx table 'ins (nth (1- (length Ic-PP)) Ic-PP))
						(set table (list (nth (1- (length Ic-PP)) Ic-PP))))
						(U-del Ic-PP -1)
					)))
		)
	;�����ʃm�[�h�̒T������(Ic-xdi�͍ċA���x�������ɂȂ鎞�����邩�ȁH)
	(Ic-table elem idx (eval table))
	))

;(setq Ic-PP nil)
;(setq Um4-nil-table nil)

(defun Ic-menu-pop      ()"���ڂ��o�n�o"(Ic-idx nil nil nil 'pop))
(defun Ic-menu-push     ()"���ڂ��o�t�r�g"(Ic-idx nil nil nil 'push))
(defun Ic-menu-insert   ()"���ڂ�}��"(Ic-idx nil nil nil 'ins (list nil)))
(defun Ic-menu-delete   ()"���ڂ��폜"(Ic-idx nil nil nil 'del))
(defun Ic-menu-title	()"���ڂ̃^�C�g���ݒ�"(Ic-idx 0	nil nil t (read-from-minibuffer "�\�� : " (Ic-idx 0))))
(defun Ic-menu-short	()"�V���[�g�J�b�g�����̓o�^"(let (CH)(message "�V���[�g�J�b�g���� : ")(setq CH (read-event))(Ic-idx 8 nil nil t CH)))
(defun Ic-menu-short-del()"�V���[�g�J�b�g�����̍폜"(Ic-idx 8 nil nil t nil))
(defun Ic-toggle-tree	()"�؍\���̃g�O��"(Ic-optmod nil 'tree (not (Ic-option 'tree 0))))				; �؍\��

;-------------------------------------------------------------------------------
;
; ����FIc-idx ���ʃ��[�`��
;
; idx	: �Y��		def = Ic-IDX
; table	: �e�[�u��	def = (eval Ic-Table)
; n,s,i	: �����ϐ�	�ȉ��Q��
; p		: '(0) ��n���΁AIc-table �� IDX �ɑ������郊�X�g���܂ރx�N�^��Ԃ�
;
;			n	s			i		p
; ����0		0	(1)			0		(0)
; ������1	1	(1 1)		0		(0 0)
; ������2	1	(1 2)		1		(0 1)
; ����3		0	(2 2)		1		(1)
; ������4	1	(2 3)		0		(1 0)
; ������5	1	(2 4)		1		(1 1)
; ��  ����6	2	(2 4 1)		0		(1 1 0)
; ��  ����7	2	(2 4 2)		1		(1 1 1)
; ��  ����8	2	(2 4 3)		2		(1 1 2)
; ����9		0	(3 4 3)		2		(2)
;
;
; table = (nil) �� p �w�肵�Ă��x�N�^���A��Ȃ��s�s���L��B
;
;

(defun Ic-xdi (idx table n s i &optional p)
	(U-mod s n (let ((K (nth n s)))(1+ (if K K 0))))	;���̃m�[�h�ɑΉ�����l���{1����
	(let* (
		(L (nth i table))
		(l3 (nth 3 L))(L3 (if (symbolp l3)(eval l3)l3))
		)(cond
		((not L) (U-mod s n (let ((K (nth n s)))(1- (if K K 0)))) s)
		((eq (1- (apply '+ s)) idx) (if p (vector p) L))
		((and (Ic-option 'tree)L3 (nth 10 L))
			(let ((R (Ic-xdi idx L3 (1+ n) s 0 (if p (append p (list 0))))))(if							; ���ʃm�[�h��T��
					(numberp (car-safe R))(progn (if p (U-add-end p))(Ic-xdi idx table n R (1+ i) p))R)	; �Ȃ���Ύ�
			))
		(t (if p (U-add-end p))(Ic-xdi idx table n s (1+ i) p))											; ��
	)))


;-------------------------------------------------------------------------------
;
; ����FIc-idx �ƈ���āA�m�[�h���w�肵�ăe�[�u���̒l�����o���B
;
(defun Ic-table (ELEM &optional IDX TABLE)        ; ���ڃ��X�g�Q��
"	ELEM	: (([0]string [1]return [2]expression [3]next1 [4]next2 [5]user [6]emphasize [7]rest [8]key-select [9]local-keymap [10]open-treep)...)
	IDX		: default = Ic-IDX ���ʃm�[�h���w�肷��Ƃ��ɂ́A(0 1 2 3) �ȂǂƂ���B
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
; ���� : �I�v�V�����ύX
;
;	(Ic-optmod Ic-Option top etc...)
;
;	(top c1 c2 c3 ... )
;
;
;
(defun Ic-optmod (list idx &rest to)  ;�I�v�V�����������ĐV�����o�^����(�����́A�V���{��)
	(if list nil (setq list Ic-Option))
    (set list (U-del3 idx (eval list)))						;list �� car �� idx �ł��郊�X�g��S�č폜���āAto ��u��
    (if (equal '(nil) to)nil(set list (append (list (if to (append (list idx) to) (list idx))) (eval list))))
    )

;
; �I�v�V�������X�g�Q��
;
(defun Ic-option (key &optional num list A)
"(Ic-option 'title 1 t) �̂悤�Ɏ��s����B
0 �� 'title ���̂�Ԃ��B
A ���񂎂����Ȃ�΁Anum �ȍ~��Ԃ��B"
    (let ((LIST (assoc key (if (null list)(eval Ic-Option)list))))
    (if A (nthcdr (if num num 0) LIST)(nth (if num num 0) LIST)))
    )

;-------------------------------------------------------------------------------
;
;   ��� :  �m�[�h�̖����I�I���~���i�m�[�h�����ɓo�^�����̂ŁA��ɂ����̂ڂ�܂��j
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
;   ��� :  �ċA�ҏW�̃��C�����[�`��
;
;	�ċA�ҏW�����āA(eval do-last) �̌��ʂ�Ԃ��B
;	do-first �́A�ċA�ҏW����O�Ɏ��s���镶�B�������������}�������肷��B
;	do-ing	�́A�ċA�ҏW�����ɂ��̕������s����̂݁B
;
(defun  Ic-redit (&optional do-last do-first do-ing)
    (let (RET
        (history    (current-window-configuration))
        (OLD        (global-key-binding Ic-recursive-key))
        (OLD2       (global-key-binding Ic-recursive-key2))
        (Cancel		nil)                ; �L�����Z���t���O
        )
	;���̕ۑ�
    (global-set-key Ic-recursive-key 'exit-recursive-edit)
    (global-set-key Ic-recursive-key2 'Ic-redit-kill)
    (unwind-protect(let(
        (Ic-save-milk   nil)    ; milk �o�b�t�@�Ҕ�
        (Ic-save-wine   nil)    ; wine �o�b�t�@�Ҕ�
        )
	    (select-window Ic-win-wine)
        (save-excursion
            (if (get-buffer Ic-name-wine)(set-buffer Ic-name-wine)(rename-buffer (setq Ic-save-wine (generate-new-buffer-name "Ic-wine"))))
            (if (get-buffer Ic-name-milk)(set-buffer Ic-name-milk)(rename-buffer (setq Ic-save-milk (generate-new-buffer-name "Ic-milk"))))
            )
		;�ŏ��ɂ�鎖
        (switch-to-buffer Ic-name-wine)           ; wine �� Ic-name-wine ���\������Ă���Ƃ͌���Ȃ��̂ł�
        (eval do-first)
        (run-hooks 'Ic-before-rec-hook)
		;�ċN�ҏW�ɂ͂���B
        (let (Ic-rec-flg)	;Ic-rec-flg ����`����Ă���Ԃ́Amilk  �o�b�t�@�̓��e�� Ic �̍ċA�Ăяo����������B������
			(if do-ing (eval do-ing)(recursive-edit))
            )
		;�������ɖ߂�
        (save-excursion
            (if Ic-save-wine (progn (set-buffer Ic-save-wine)(rename-buffer Ic-name-wine)))
            (if Ic-save-milk (progn (set-buffer Ic-save-milk)(rename-buffer Ic-name-milk)))
            )
        (switch-to-buffer   Ic-name-wine)           ; �߂��Ȃ��ƍċA�𔲂����Ƃ��ɂ��̎��_�̃o�b�t�@���ΏۂɂȂ��Ă��܂�
		;�Ԃ��l�̌v�Z
        (setq RET (if do-last (eval do-last)(buffer-string)))
		)
		;�������ɖ߂�
        (global-set-key Ic-recursive-key OLD)
        (global-set-key Ic-recursive-key2 OLD2)
		(set-window-configuration history)
		)
    (if Cancel (throw 'Ic-NEXT t));Ic �̃��C�����[�v�ŕߑ������
    RET
    ))


(defun Ic-redit-kill ()
	(interactive)
	(message "�ҏW��������܂�")
	(setq Cancel t)
	(exit-recursive-edit)
	)


;-------------------------------------------------------------------------------
;
;   ��� :  �ċA�ҏW�����Ăr����ǂݎ���ĕԂ��B
;
;       ELE     �e�[�u���̗v�f��ύX����Ƃ��̈ʒu(���ꂪ�Ȃ���΁A�P�ɂr����Ԃ��̂�)
;       LIST    �e�[�u���̗v�f��ύX����Ƃ��� �r���� RET �Ƀo�C���h���āA���̃��X�g�����s����B
;       INIT    �ҏW����Ƃ��̏�����������(nil �ŁAELE ���w�肳��Ă����Ƃ��ɂ́A���̓��e���\�������)

(defun Ic-table-s(&optional ELE LIST INIT)
    (Ic-redit
        ;�Ԃ��l
        '(let ((RET nil))
            (goto-char (point-min))(insert "(quote ")
            (goto-char (point-max))(insert ")")
            (condition-case nil (setq RET (eval-last-sexp 1))(error nil))
            (if (numberp ELE) (if LIST
                    (Ic-idx ELE nil nil t (eval LIST))  ;LIST is like this. (` (prin1 (,@ RET)))
                    (Ic-idx ELE nil nil t RET)))
            RET)
        ;�ŏ��ɂ�铮��
        (cond
            ((stringp INIT) '(progn (erase-buffer)(insert INIT)(goto-char (point-min))))
            ((numberp ELE) '(progn (erase-buffer)(insert (prin1-to-string (Ic-idx ELE)))(goto-char (point-min))))
    )))

;-------------------------------------------------------------------------------
;
;   ��� :  �������Ԃ�
;
;	��ɁA(Ic-idx n) ��ҏW����ׂɎg�p�����B
;
;	INIT	�� ��������������w�肷��Bn ���w�肵�Ă��ǂ��B�����w�肵�Ȃ���΁AELE �̍��ڂ��A�����B
;	ELE		�� �ҏW���I�������ɁA�����I�� n �̗v�f��ύX���Ă����B
;	di-ing	�� �ċA�ҏW�ł͂Ȃ��A���s���������������B
;

(defun Ic-table-str (&optional INIT ELE do-ing)
    (Ic-redit
        ;�Ԃ��l
        (if (numberp ELE)
            '(Ic-idx ELE nil nil t (buffer-substring (point-min) (point-max)))
            '(buffer-substring (point-min) (point-max)))
        ;�ŏ��ɂ�铮��
        (cond
            ((stringp INIT) '(progn (erase-buffer)(insert INIT)(goto-char (point-min))))
            ((numberp INIT) '(let ((STR(Ic-idx INIT))) (erase-buffer)(if (stringp STR)(insert STR))(goto-char (point-min))))
            ((numberp ELE) '(let ((STR(Ic-idx ELE))) (erase-buffer)(if (stringp STR)(insert STR))(goto-char (point-min))))
    )do-ing))

;-------------------------------------------------------------------------------
;
;   ��� :  �e�[�u���ϐ��̃Z�[�u������
;
;	N �Ԗڂ̃A�g�����ċA���Ċi�[���܂��B
;	Opt �͖������ŃZ�[�u���鍀�� OTHERS �͓����t�@�C���ɕۑ�����ׂ��V���{���B
;	�Ăяo���Ƃ��ɂ́A�N�I�[�g��Y�ꂸ�ɁB
;
;	��F(Ic-table-save \"~/.emacs.save\" 'Um4-Table 3 4 'Um4-mod 'Um4-ded)

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
;   ��� :  �e�[�u���̃t�@�C���ւ̃Z�[�u
;
;   LIST �� �e�v�f��N�Ԗڗv�f���V���{���A�g���Ȃ��STACK�ɐς�ōX�ɂ��̒l�ōċA����B
;   Opt �́A�������ɃZ�[�u����V���{���B
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
;   ��� :  �E�C���h�E�����Z�[�u����
;
(defmacro   Ic-keep-windows (&rest EVAL)(`(
    (set-window-configuration Ic-history)
    (,@ EVAL)
    (setq Ic-keep-windows (current-window-configuration)))
    ))

;-------------------------------------------------------------------------------
;
;   ��� :  ���������o�b�t�@�ɏ�������
;
;   ��F(Ic-write-wine (insert "��") (insert "�[��"))
;
(defmacro Ic-write-wine (&rest list)(`
    (if Ic-no-wine nil
        (select-window (if (window-live-p Ic-win-wine)Ic-win-wine(get-buffer-window Ic-name-wine)))
        (,@ list)
        (select-window (if (window-live-p Ic-win-milk)Ic-win-milk(get-buffer-window Ic-name-milk)))
    )))

;(defun Ic-write-wine (&rest list)		;�֐��o�[�W����
;    (if (and (not Ic-no-wine)(get-buffer-window Ic-name-wine))(progn
;        (select-window (if (window-live-p Ic-win-wine)Ic-win-wine(get-buffer-window Ic-name-wine)))
;        (eval (cons 'progn list))
;        (select-window (if (window-live-p Ic-win-milk)Ic-win-milk(get-buffer-window Ic-name-milk)))
;    )(message "Ic error : wine �E�C���h�E������܂���")))

;-------------------------------------------------------------------------------
;
;   ��� :  �m�[�h�ȉ��̑S�Ăɑ΂��� exp �����s����
;
;	���f�����������ꍇ�ɂ́A
;
;    (throw 'Ic-NEXT Ic-IDX)
;
;	�����s����Ηǂ��B
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
