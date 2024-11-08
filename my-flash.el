;//=================================================================================================
;for Action Script
(autoload 'actionscript-mode "actionscript-mode" "actionscript" t)
(setq auto-mode-alist
      (append '(("\\.as$" . actionscript-mode))
              auto-mode-alist))
(setq auto-mode-alist
      (append '(("\\.jsfl$" . js2-mode))
              auto-mode-alist))
