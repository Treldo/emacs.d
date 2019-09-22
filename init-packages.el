;;  __               __                       __
;; |   \    /\     /    `   |   /    /\     /    \   ___
;; |___/   /__\   |         |--|    /__\   |   ~~   |___
;; |      /    \   \_ _ /   |   \  /    \   \ __ /  |___
;;                                   __
;; |\  /|    /\    |\  |    /\     /    \    ___  |\  /|   ___  |\  |  _ _ _
;; | \/ |   /__\   | \ |   /__\   |   ~~    |___  | \/ |  |___  | \ |    |
;; |    |  /    \  |  \|  /    \   \ __ /   |___  |    |  |___  |  \|    |

(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			   ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))))

;; cl - Command Lisp Extension
;; It can be replace by cl-loop for loop
(require 'cl)

;; Add Packages
(defvar my/packages '(
		      company
		      smartparens
		      hungry-delete
		      swiper
		      counsel
		      popwin
		      ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package datebase...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; Find Executable Path on OS X
;;(when (memq window-system '(mac ns))
;;  (exec-path-from-shell-initialize))

(global-hungry-delete-mode)

(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

(global-company-mode 1)

;; load custom themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dracula t)

(require 'popwin)
(popwin-mode t)

(provide 'init-packages)
