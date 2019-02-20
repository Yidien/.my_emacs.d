(add-hook 'c-mode-common-hook
	  '(lambda() (require 'xcscope)))
(setq cscope-do-not-update-database t)

(load "ess-autoloads")
(require 'ess-site)

(require 'auto-save)
(auto-save-enable)             
(setq auto-save-slient t)

(provide 'personal)
