(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'init-packages)
(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

(global-hungry-delete-mode t)
(global-hl-line-mode t)

(setq ring-bell-function 'ignore)

;; Open recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

(set-frame-position (selected-frame) 550 0)
(setq default-frame-alist
      '((height . 70) (width . 120) (menu-bar-lines . 20) (tool-bar-lines . 0)))
      
(delete-selection-mode 1)

(setq make-backup-files nil)
(setq auto-save-default nil)

(scroll-bar-mode -1)
(tool-bar-mode -1)

(global-linum-mode 1)

(setq inhibit-splash-screen 1)

(set-default-font "Monaco-14")

(set-face-attribute 'default nil :height 150)



(require 'org)
(setq org-src-fontify-natively t)


(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)



(global-auto-revert-mode t)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
