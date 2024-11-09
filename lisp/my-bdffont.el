




(setq default-frame-alist
      (append (list
              '(font . "private-fontset") ;
               )
              default-frame-alist))

(setq default-frame-alist
      (append (list
              '(font . "private-fontset") ; font set.
              '(ime-font . "private-fontset-japanese-jisx0208") ; IME font
               )
              default-frame-alist))


(load "shinonome12-fontset")
(load "shinonome14-fontset")
(load "shinonome16-fontset")
