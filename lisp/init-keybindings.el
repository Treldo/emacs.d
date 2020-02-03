
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; Open recent files.
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; Find files in git commitments.
(global-set-key (kbd "C-c p f") 'counsel-git)

;; Set up an agenda.
(global-set-key (kbd "C-c a") 'org-agenda)

;; Provide completion when company-mode doesn't work.
(global-set-key (kbd "s-/") 'hippie-expand)

;;;;;;;;;; "~/.emacs.d/lisp/init-better-defaults" ;;;;;;;;;;

;; Format selected content.
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; 延迟加载 Dired Mode
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;;;;;;;;;; "~/.emacs.d/lisp/init-packages" ;;;;;;;;;;

(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

(js2r-add-keybindings-with-prefix "C-c C-m")

(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "C-;") 'iedit-mode)

(provide 'init-keybindings)
