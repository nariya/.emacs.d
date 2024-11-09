(create-fontset-from-request "private-fontset"
                             '((width . 8)
                               (height . 16)
                               (fixed . t)
                               (italic . nil))
                             '((family . "‚l‚r ƒSƒVƒbƒN")
                               (family . "Courier New")))
(setq default-frame-alist
      (append (list '(font . "private-fontset"))
               default-frame-alist))