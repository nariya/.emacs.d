
(autoload 'navi2ch "navi2ch" "Navigator for 2ch for Emacs" t)
;; �I�����ɖK�˂Ȃ�
(setq navi2ch-ask-when-exit nil)
;; �X���̃f�t�H���g�����g��
(setq navi2ch-message-user-name "")
;; ���ځ[�񂪂������������̃t�@�C���͕ۑ����Ȃ�
(setq navi2ch-net-save-old-file-when-aborn nil)
;; ���M���ɖK�˂Ȃ�
(setq navi2ch-message-ask-before-send nil)
;; kill ����Ƃ��ɖK�˂Ȃ�
(setq navi2ch-message-ask-before-kill nil)
;; �o�b�t�@�� 5 �܂�
(setq navi2ch-article-max-buffers 5)
;; navi2ch-article-max-buffers �𒴂�����Â��o�b�t�@�͏���
(setq navi2ch-article-auto-expunge t)
;; ���ǃX���͂��ׂĕ\��
(setq navi2ch-article-exist-message-range '(1 . 1000))
;; ���ǃX�������ׂĕ\��
(setq navi2ch-article-new-message-range '(1000 . 1))
;; 3 �y�C�����[�h�ł݂�
(setq navi2ch-list-stay-list-window t)
;; C-c 2 �ŋN��
;(global-set-key "\C-c2" 'navi2ch)


;(setq navi2ch-mona-enable t)
;(add-hook 'navi2ch-mona-load-hook
;          (lambda ()
;            (set-face-attribute 'navi2ch-mona-face nil :family "���i�[")))

