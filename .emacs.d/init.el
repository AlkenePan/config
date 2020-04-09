;;; init.el --- Summary
;; Initialization file for Emacs

;;; Commentary:
;; Emacs Startup File --- initialization for Emacs

;;; Code:

(setq user-full-name "Alkene Pan")
(setq user-mail-address "alkenepan@gmail.com")

;; limit
(setq gc-cons-threshold 500000000)
(setq large-file-warning-threshold 1000000000)

;; environment
(setenv "PATH" (concat "/usr/local/bin:/opt/local/bin:/usr/bin/bin" (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/local/bin")))
(with-no-warnings (require 'cl))

;; package management
(load "package")
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

;;; use-packages
(unless (package-installed-p 'use-package)
  (package-refresh-conggtents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))


;; looks and feel

;;; default bars
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;;; cursor
(blink-cursor-mode -1)

;;; startup screen
(setq inhibit-startup-screen t)

;;; yes and no
(defalias 'yes-or-no-p 'y-or-n-p)

;;; remember your place
(save-place-mode 1)

;;; encoding
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;;; theme
(use-package gruvbox-theme
  :ensure t
  :init
  (load-theme 'gruvbox t))

;;; text area ui
(global-hl-line-mode +1)
(line-number-mode +1)
(global-display-line-numbers-mode 1)
(column-number-mode t)
(size-indication-mode t)

;;; scroll
(setq scroll-conservatively 100000)
(setq scroll-preserve-screen-position 1)
(setq scroll-margin 10)
;;; font
(set-frame-font "JetBrainsMono 14" nil t)

;;; smart mode-line
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))


;; easy life

;;; help yor figure out the next keystroke
(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  (which-key-mode +1))

;;; smart parens
(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (progn
    (require 'smartparens-config)
    (smartparens-global-mode 1)
    (show-paren-mode t)))

;;; smarter shortcut
(use-package crux
  :ensure t
  :bind
  ("C-k" . crux-smart-kill-line)
  ("C-c n" . crux-cleanup-buffer-or-region)
  ("C-c f" . crux-recentf-find-file)
  ("C-a" . crux-move-beginning-of-line))


;; Autocomplete and syntax checking
(use-package company
  :ensure t
  :diminish company-mode
  :config
  (add-hook 'after-init-hook #'global-company-mode))

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))


;; LSP
(use-package lsp-mode :commands lsp :ensure t)
(use-package lsp-ui :commands lsp-ui-mode :ensure t)
(use-package company-lsp
  :ensure t
  :commands company-lsp
  :config (push 'company-lsp company-backends))


;;; LSP CCLS
(use-package ccls
  :ensure t
  :config
  (setq ccls-executable "ccls")
  (setq ccls-args '("--log-file=/tmp/ccls.log"))
  (setq lsp-prefer-flymake nil)
  (setq-default flycheck-disable-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  :hook ((c-mode c++-mode objc-mode) .
	 (lambda () (require 'ccls) (lsp))))


;; evil
(use-package evil
  :ensure t
  :init
  (setq evil-search-module 'evil-search)
  (setq evil-ex-complete-emacs-commands nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (setq evil-shift-round nil)
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode))
  

;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (evil doom-modeline flycheck crux smartparens company-lsp company which-key lsp-ui lsp-mode use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;; init.el ends here
