
(setq ring-bell-function 'ignore)

(global-auto-revert-mode t)

(global-linum-mode 1)

(setq make-backup-files nil)
(setq auto-save-default nil)

;; Open recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

(delete-selection-mode 1)
(global-auto-revert-mode t)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(provide 'init-better-defaults)
