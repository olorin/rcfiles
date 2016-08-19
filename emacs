; Dependencies:
;  - markdown-mode
;  - scala-mode
;  - haskell-mode
;  - org-mode

;
; interface decrappening
;
(menu-bar-mode -1)
(set-face-attribute 'default nil :height 140)

(setq column-number-mode t)
(setq require-final-newline 'visit)

;
; generic keybindings
;
(global-set-key (kbd "C-, c") 'comment-region)
(global-set-key (kbd "C-, u") 'uncomment-region)
(global-set-key (kbd "C-, b") 'compile)
(global-set-key (kbd "C-, d") 'gdb)
(global-set-key (kbd "C-c k") 'compile)
(global-set-key (kbd "C-c i") 'string-insert-rectangle)
(global-set-key (kbd "C-c r") 'rectangle-mark-mode)

; default to space-indenting
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(add-to-list 'load-path "~/.emacs.d/lisp/")

;
; puppet
;

(autoload 'puppet-mode "puppet-mode.el"
    "Major mode for editing Puppet files" t)
(setq auto-mode-alist
    (cons '("\.pp" . puppet-mode) auto-mode-alist))

;
; markdown
;

(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\.md" . markdown-mode) auto-mode-alist))

;
; python
;

(add-hook 'python-mode-hook '(lambda ()
				 (local-set-key (kbd "RET") 'newline-and-indent)))

;
; haskell
;

(add-to-list 'load-path "/usr/share/emacs/site-lisp/haskell-mode/")
(require 'haskell-mode-autoloads)
(add-to-list 'Info-default-directory-list "/usr/share/emacs/site-lisp/haskell-mode/")

(autoload 'haskell-mode "haskell-mode.el"
   "Major mode for editing Haskell files" t)
(setq auto-mode-alist
   (cons '("\.hs" . haskell-mode) auto-mode-alist))

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(custom-set-variables
 '(haskell-mode-hook '(turn-on-haskell-simple-indent))
 '(haskell-process-type 'cabal-repl)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t))

;
; scala
;

(add-to-list 'load-path "/usr/share/emacs/scala-mode")
(require 'scala-mode-auto)

;
; org-mode
;

(require 'org)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)
(global-set-key (kbd "C-c t") 'org-todo)

;
; c
;

(setq c-default-style "linux")

(add-hook 'c-mode-hook
          (lambda ()
            (font-lock-mode 1)
            (set-variable 'show-trailing-whitespace t)

            (let ((fname (expand-file-name (buffer-file-name))))
              (cond

               ; tor
               ((string-match "^/home/sio/src/tor" fname)
                (set-variable 'indent-tabs-mode nil)
                (set-variable 'c-basic-offset 2))
            ))))

(add-hook 'c-mode-common-hook '(lambda ()
				 (local-set-key (kbd "RET") 'newline-and-indent)))


;
; mail
;

; mail editing
(add-to-list 'auto-mode-alist '("/sup.*eml$" . message-mode))

(add-hook 'message-mode-hook (lambda ()
  (search-forward-regexp "^$")
  (auto-fill-mode 1)))

(provide '.emacs)
;;; .emacs ends here
