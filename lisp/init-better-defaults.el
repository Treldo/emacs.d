
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

(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))

;; Use "y-or-no" to replace "yes-or-no".
(fset 'yes-or-no-p 'y-or-n-p)

;; Delete and copy files always with recursive.
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(put 'dired-find-alternate-file 'disabled nil)

;; 打开当前文件所在目录的 Dired with "C-x C-j"
(require 'dired-x)

;; 在 Dired 中进行文件复制自动确定文件路径
(setq dired-dwin-target t)

(provide 'init-better-defaults)
