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

;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ivy-hydra ivy-prescient prescient amx evil doom-modeline flycheck crux smartparens company-lsp company which-key lsp-ui lsp-mode use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ivy-minibuffer-match-face-1 ((t (:inherit font-lock-doc-face :foreground nil)))))


;;; init.el ends here
