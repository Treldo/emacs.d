
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

;; Auto format
(defun indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    ;; If the part was selected, try to format it.
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(provide 'init-better-defaults)
