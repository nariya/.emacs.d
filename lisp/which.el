;;;From: janssen@titan.sw.mcc.com (Bill Janssen)
;;;Newsgroups: comp.emacs
;;;Subject: Re: Is a file loadable?
;;;Summary: Here is the `which' command for loadables
;;;Date: 31 Aug 88 22:51:49 GMT
;;;Reply-To: janssen@titan.sw.mcc.com (Bill Janssen)
;;;Organization: MCC Software Technology
;;;In-reply-to: Ram-Ashwin@cs.yale.edu (Ashwin Ram)

(defun remove (item list)
  (let ((tmp list)
        (new-list nil)
        )
    (while (consp tmp)
      (if (not (eq item (car tmp)))
          (setq new-list (append new-list (list (car tmp)))))
      (setq tmp (cdr tmp))
      )
    new-list
    ))

(defun make-which-list (file)
  "Find out what FILE would be loaded with the current load-path."
  (remove nil (mapcar '(lambda (dir)
                         (let ((filename (concat dir "/" file))
                               )
                           (if (file-exists-p (expand-file-name filename))
                               (expand-file-name filename)
                             (if (file-exists-p (expand-file-name (concat
                                                                   filename
                                                                   ".elc")))
                                 (expand-file-name (concat filename ".elc"))
                               (if (file-exists-p (expand-file-name (concat
                                                                     filename
                                                                     ".el")))
                                   (expand-file-name (concat filename ".el"))
                                 nil
                                 )))
                           ))
                      load-path))
  )

(defun which (file)
  (interactive "sFile:  ")
  (message (or (car (make-which-list file))
               "No file found."))
  )

(defun show-loads (file)
  "Show all possible loadings for file FILE in a buffer"
  (interactive "sFile:  ")
  (let ((whiches (make-which-list file))
        (b (get-buffer-create (concat "*Load Files for " file "*")))
        )
      (if whiches
          (progn
            (set-buffer b)
            (erase-buffer)
            (mapcar '(lambda (string)
                       (goto-char (point-max))
                       (insert string "\n")
                       )
                    whiches)
            (goto-char (point-min))
            (display-buffer b)
            )
        (message "No files found."))
      ))