
(scroll-bar-mode -1)
(tool-bar-mode -1)
(global-hl-line-mode t)

(setq inhibit-splash-screen t)

;; load custom themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dracula t)

;; screen maximized
;; 在Mac平台, Emacs不能进入Mac原生的全屏模式,否则会导致 `make-frame' 创建时也集成原生全屏属性后造成白屏和左右滑动现象.
;; 所以先设置 `ns-use-native-fullscreen' 和 `ns-use-fullscreen-animation' 禁止Emacs使用Mac原生的全屏模式.
;; 而是采用传统的全屏模式, 传统的全屏模式, 只会在当前工作区全屏,而不是切换到Mac那种单独的全屏工作区,
;; 这样执行 `make-frame' 先关代码或插件时,就不会因为Mac单独工作区左右滑动产生的bug.
;;
;; Mac平台下,不能直接使用 `set-frame-parameter' 和 `fullboth' 来设置全屏,
;; 那样也会导致Mac窗口管理器直接把Emacs窗口扔到单独的工作区, 从而对 `make-frame' 产生同样的Bug.
;; 所以, 启动的时候通过 `set-frame-parameter' 和 `maximized' 先设置Emacs为最大化窗口状态, 启动5秒以后再设置成全屏状态,
;; Mac就不会移动Emacs窗口到单独的工作区, 最终解决Mac平台下原生全屏窗口导致 `make-frame' 左右滑动闪烁的问题.
;;
;; 说明来自于 [https://emacs-china.org/t/topic/4662/128]

(setq ns-use-native-fullscreen nil)
(setq ns-use-fullscreen-animation nil)
(run-at-time "5sec" nil
             (lambda ()
               (let ((fullscreen (frame-parameter (selected-frame) 'fullscreen)))
                 ;; If emacs has in fullscreen status, maximized window first, drag from Mac's single space.
                 (when (memq fullscreen '(fullscreen fullboth))
                   (set-frame-parameter (selected-frame) 'fullscreen 'maximized))
                 ;; Manipulating a frame without waiting for the fullscreen
                 ;; animation to complete can cause a crash, or other unexpected
                 ;; behavior, on macOS (bug#28496).
                 (when (featurep 'cocoa) (sleep-for 0.5))
                 ;; Call `toggle-frame-fullscreen' to fullscreen emacs.
                 (toggle-frame-fullscreen))))

(set-default-font "JetBrains Mono")

(set-face-attribute 'default nil :height 170)

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

(provide 'init-ui)
