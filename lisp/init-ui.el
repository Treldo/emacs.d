(scroll-bar-mode -1)
(tool-bar-mode -1)
(global-hl-line-mode t)

(setq inhibit-splash-screen t)

;; screen maximized
(setq initial-frame-alist (quote ((fullscreen . maximized))))

(set-default-font "Monaco-14")

(set-face-attribute 'default nil :height 150)

;;(set-frame-position (selected-frame) 550 0)
;;(setq default-frame-alist
;;      '((height . 70) (width . 120) (menu-bar-lines . 20) (tool-bar-lines . 0)))

;; Nyan cat
(add-to-list 'load-path "~/.emacs.d/custom-mode/nyan-mode")
(require 'nyan-mode)
(setq default-mode-line-format (list ""
				     'mode-line-modified
				     "<"
				     "Vubee"
				     "> "
				     "%10b"
				     '(:eval (when nyan-mode (list (nyan-create))))
				     " "
				     'default-directory
				     " "
				     "%[("
				     'mode-name
				     'minor-mode-list
				     "%n"
				     'mode-line-process
				     ")%]--"
				     "Line %l--"
				     '(-3 . "%P")
				     "-%-"))
(nyan-mode t)
(nyan-start-animation)
(setq-default nyan-wavy-trail t)

(provide 'init-ui)
