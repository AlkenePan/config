;;; init.el --- Summary
;; Initialization file for Emacs

;;; Commentary:
;; Emacs Startup File --- initialization for Emacs

;;; Code:
(when (version< emacs-version "26")
  (error "This requires Emacs 26 and above!"))

(setq user-full-name "Alkene Pan")
(setq user-mail-address "alkenepan@gmail.com")

;; limit
(setq gc-cons-threshold 500000000)
(setq large-file-warning-threshold 1000000000)

(with-no-warnings (require 'cl))

;; package management
(load "package")
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

;;; use-packages
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))

(when (not package-archive-contents)
  (package-refresh-contents))

;; Load customized config
(add-to-list 'load-path (expand-file-name "core" user-emacs-directory))

(use-package exec-path-from-shell
  :ensure t)

(add-hook 'hack-local-variables-hook
    (lambda ()
        (when (derived-mode-p 'python-mode)
            (require 'lsp-python-ms)
                (lsp)))) ; or lsp-deferred


;;; initialize constants
(require 'init-const)
(require 'init-basic)
(require 'looks-and-feels)
(require 'init-theme)
(require 'easy-life)
(require 'intelligence)
(require 'init-evil)
(require 'init-ivy)


;; config for lang lsp
(add-to-list 'load-path (expand-file-name "lang" user-emacs-directory))
;;; cc/cpp/objc
(require 'init-ccls)
;;; rust
(require 'init-rust)
;;; Python
(require 'init-python)

;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("b89ae2d35d2e18e4286c8be8aaecb41022c1a306070f64a66fd114310ade88aa" "939ea070fb0141cd035608b2baabc4bd50d8ecc86af8528df9d41f4d83664c6a" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" default))
 '(package-selected-packages
   '(spaceline-all-the-icons tree-sitter-langs tree-sitter git-gutter magit spacemacs-theme exec-path-from-shell ivy-hydra ivy-prescient prescient amx evil doom-modeline flycheck crux smartparens company-lsp company which-key lsp-ui lsp-mode use-package))
 '(projectile-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ivy-minibuffer-match-face-1 ((t (:inherit font-lock-doc-face :foreground nil)))))


;;; init.el ends here
