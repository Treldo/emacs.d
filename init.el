
(package-initialize)

;;(add-to-list 'load-path "~/.emacs.d/lisp")

(load-file "~/.emacs.d/lisp/init-ui.el")
(load-file "~/.emacs.d/lisp/init-packages.el")
(load-file "~/.emacs.d/lisp/init-org.elc")
(load-file "~/.emacs.d/lisp/init-keybindings.elc")
(load-file "~/.emacs.d/lisp/init-better-defaults.elc")

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(load-file custom-file)
