(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-solarized-dark)))

(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(set-face-attribute 'default nil :height 140)

(add-hook 'c-mode-common-hook '(lambda ()
				 (local-set-key (kbd "RET") 'newline-and-indent)))
(add-hook 'python-mode-hook '(lambda ()
				 (local-set-key (kbd "RET") 'newline-and-indent)))
(setq column-number-mode t)

(global-set-key (kbd "C-, c") 'comment-region)
(global-set-key (kbd "C-, u") 'uncomment-region)
(global-set-key (kbd "C-, b") 'compile)
(global-set-key (kbd "C-, d") 'gdb)
(global-set-key (kbd "C-, g") 'magit-status)
(global-set-key (kbd "C-c k") 'compile)

(setq c-default-style "linux")

(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\.md" . markdown-mode) auto-mode-alist))

