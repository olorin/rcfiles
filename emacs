(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(menu-bar-mode -1)
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
(global-set-key (kbd "C-c k") 'compile)
(global-set-key (kbd "C-c i") 'string-insert-rectangle)

(setq c-default-style "linux")

(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\.md" . markdown-mode) auto-mode-alist))

(autoload 'haskell-mode "haskell-mode.el"
   "Major mode for editing Haskell files" t)
(setq auto-mode-alist
   (cons '("\.hs" . haskell-mode) auto-mode-alist))

(require 'package)
(add-to-list 'package-archives
   '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(custom-set-variables
 '(haskell-mode-hook '(turn-on-haskell-simple-indent))
 '(haskell-process-type 'cabal-repl)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t))

(require 'org)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)

(eval-after-load 'haskell-mode '(progn
                                  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
                                  (define-key haskell-mode-map (kbd "C-c C-o") 'haskell-compile)
                                  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
                                  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
                                  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
                                  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
                                  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
                                  (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)))

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
