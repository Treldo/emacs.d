(scroll-bar-mode -1)
(tool-bar-mode -1)
(global-hl-line-mode t)

(setq inhibit-splash-screen t)

;; screen maximized
;;(setq initial-frame-alist (quote ((fullscreen . maximized))))

(set-default-font "Monaco-14")

(set-face-attribute 'default nil :height 150)

(set-frame-position (selected-frame) 550 0)
(setq default-frame-alist
      '((height . 70) (width . 120) (menu-bar-lines . 20) (tool-bar-lines . 0)))

(provide 'init-ui)
