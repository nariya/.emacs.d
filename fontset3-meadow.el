;; set BDF font directory

(setq w32-bdf-filename-alist
      (w32-find-bdf-fonts '("c:/bdffont")))

(create-fontset-from-fontset-spec
 "-*-fixed-medium-r-normal-*-16-*-*-*-*-*-fontset-bdf,
latin-jisx0201:-sony-fixed-medium-r-normal--16-*-*-*-*-*-jisx0201.1976-0,
katakana-jisx0201:-sony-fixed-medium-r-normal--16-*-*-*-*-*-jisx0201.1976-0,
japanese-jisx0208-1978:-misc-fixed-medium-r-normal--16-*-*-*-*-*-jisc6226.1978-0,
japanese-jisx0208:-misc-fixed-medium-r-normal--16-*-*-*-*-*-jisx0208.1990-0"
 t t)


(setq font-encoding-alist
      (append '(("jisx0201"        (latin-jisx0201 . 0))
("jisx0201"        (katakana-jisx0201 . 1))
("JISX0208"        (japanese-jisx0208 . 0))
("JISC6226.1978"   (japanese-jisx0208-1978 . 0))
("JISX0213.2000-1" (japanese-jisx0213-1 . 0))
("JISX0213.2000-2" (japanese-jisx0213-2 . 0))
("BITMAP"        (bitmap . 0))
) font-encoding-alist))

(setq initial-frame-alist
      '((font . "fontset-bdf")
        ...
        ))