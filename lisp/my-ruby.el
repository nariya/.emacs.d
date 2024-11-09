;//=================================================================================================
;for ruby
(load "ruby-mode")
(load "inf-ruby")
(load "rubydb3x")
(setq auto-mode-alist
      (append
       '(
         ("\\.rb$"    . ruby-mode) ;;
         )
       auto-mode-alist))
