
(global-linum-mode 1)

(delete-selection-mode 1)

;; 自动加载外部修改过的文件
(global-auto-revert-mode 1)

(setq make-backup-files nil)
(setq auto-save-default nil)

(setq ring-bell-function 'ignore)

;; Open recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; Auto format
(defun indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

;; 一次缩进缓冲区内的全部代码 (kbd "C-M-\\")
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

;; 增强 Hippie Expand 的功能 (kbd "s-/")
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

;; Use "y-or-n" to replace "yes-or-no" as future choise.
(fset 'yes-or-no-p 'y-or-n-p)

;;;; Dired Mode ;;;;

;; Delete and copy files always with recursive.
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(put 'dired-find-alternate-file 'disabled nil)

;; 打开当前文件所在目录的 Dired with "C-x C-j"
(require 'dired-x)

;; 在 Dired 中进行文件复制自动确定文件路径
(setq dired-dwin-target t)


(setq default-tab-width 4)

(setq-default indent-tabs-mode nil)

(setq c-default-style "linux")

(setq c-basic-offset 4)

(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;; dwim = do what i mean
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))
(global-set-key (kbd "M-s o") 'occur-dwim)

;; Use "C-n" and "C-p" to choose the correct complation with "company-mode"
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(provide 'init-better-defaults)
