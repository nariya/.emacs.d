(defun my-dired-today-search (arg)
  "Fontlock search function for dired."
  (search-forward-regexp
   (concat (format-time-string "%b %e" (current-time)) " [0-9]....") arg t))

(defun my-dired-date (time)
  "Fontlock search function for dired."
  (let ((now (current-time)) (days (* -1 time)) dateh datel daysec daysh daysl dir
        (offset 0))
    (setq daysec (* -1.0 days 60 60 24))
    (setq daysh (floor (/ daysec 65536.0)))
    (setq daysl (round (- daysec (* daysh 65536.0))))
    (setq dateh (- (nth 0 now) daysh))
    (setq datel (- (nth 1 now) (* offset 3600) daysl))
    (if (< datel 0)
        (progn
          (setq datel (+ datel 65536))
          (setq dateh (- dateh 1)))) ;;(floor (/ offset 24))))))
    (if (< dateh 0)
        (setq dateh 0))
    ;;(insert (concat (int-to-string dateh) ":"))
    (list dateh datel)))

(defun my-dired-this-week-search (arg)
  "Fontlock search function for dired."
  (let ((youbi (string-to-number (format-time-string "%w" (current-time))))
        this-week-start this-week-end day ;;regexp
        (flg nil))
    (setq youbi (+ youbi 1))
    (setq regexp
          (concat "\\("))
    (while (not (= youbi 0))
      (setq regexp
            (concat
             regexp
             (if flg
                 "\\|")
             (format-time-string
              "%b %e"
              (my-dired-date youbi))))
      ;;(insert (concat (int-to-string youbi) "\n"))
      (setq flg t)
      (setq youbi (- youbi 1))))
  (setq regexp
        (concat regexp "\\)"))
  (search-forward-regexp
   (concat regexp " [0-9]....") arg t))

(defun my-dired-last-week-search (arg)
  "Fontlock search function for dired."
  (let ((youbi (string-to-number (format-time-string "%w" (current-time))))
        this-week-start this-week-end day ;;regexp
        lyoubi
        (flg nil))
    (setq youbi (+ youbi 0))
    (setq lyoubi (+ youbi 7))
    (setq regexp
          (concat "\\("))
    (while (not (= lyoubi youbi))
      (setq regexp
            (concat
             regexp
             (if flg
                 "\\|")
             (format-time-string
              "%b %e"
              (my-dired-date lyoubi))))
      ;;(insert (concat (int-to-string youbi) "\n"))
      (setq flg t)
      (setq lyoubi (- lyoubi 1))))
  (setq regexp
        (concat regexp "\\)"))
  (search-forward-regexp
   (concat regexp " [0-9]....") arg t))

(add-hook 'dired-mode-hook
          '(lambda ()
             (font-lock-add-keywords
              major-mode
              (list
               '(my-dired-today-search . face-file-edited-today)
               '(my-dired-this-week-search . face-file-edited-this-week)
               '(my-dired-last-week-search . face-file-edited-last-week)
               ))))





(defvar my-ex-isearch-next      "\C-r")
(defvar my-ex-isearch-prev      "\C-e")
(defvar my-ex-isearch-backspace "\C-h")
(defvar my-ex-isearch-return    "\C-g")
(defun my-ex-isearch (REGEX1 REGEX2 FUNC1 FUNC2 RPT)
  (interactive)
  (let ((input last-command-char)
        (inhibit-quit t)
        (oldpoint (point)) regx str)
    (save-match-data
      (catch 'END
        (while t
          (funcall FUNC1)
          (cond
           ;; character
           ((and (integerp input) (>= input ?!)(<= input ?~)
                 (not (and (>= input ?A)(<= input ?Z))))
            (setq str (concat str (char-to-string input)))
            (setq regx (concat REGEX1 str REGEX2))
            (re-search-forward regx nil t nil))
           ;; backspace
           ((and (integerp input)
                 (or (eq 'backspace input)
                     (= input (string-to-char my-ex-isearch-backspace))))
            (setq str (if (eq 0 (length str)) str (substring str 0 -1)))
            (setq regx (concat REGEX1 str REGEX2))
            (goto-char oldpoint)
            (re-search-forward regx nil t nil))
           ;; next
           ((and (integerp input) (= input (string-to-char my-ex-isearch-next)))
            (re-search-forward regx nil t RPT))
           ;; previous
           ((and (integerp input) (= input (string-to-char my-ex-isearch-prev)))
            (re-search-backward regx nil t nil))
           ;; return
           ((and (integerp input) (= input (string-to-char my-ex-isearch-return)))
            (goto-char oldpoint)
            (message "return")
            (throw 'END nil))
           ;; other command
           (t
            (setq unread-command-events (append (list input) unread-command-events))
            (throw 'END nil)))
          (funcall FUNC2)
          (highline-highlight-current-line)
          (message str)
          (setq input (read-event)))))))
(defun my-dired-isearch()
  (interactive)
  (my-ex-isearch "[0-9] " "[^ \n]+$" (lambda()(backward-char 3)) 'dired-move-to-filename 2))
(defun my-dired-isearch-define-key (str)
  (let ((i 0))
    (while (< i (length str))
      (define-key dired-mode-map (substring str i (1+ i)) 'my-dired-isearch)
      (setq i (1+ i)))))
(add-hook 'dired-mode-hook
          '(lambda ()
             (my-dired-isearch-define-key "abcdefghijklmnopqrstuvwxyz0123456789_.-+~#")
             ))

