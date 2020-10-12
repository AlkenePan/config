;; pacakage --- Summary
;;; Commentary:
;; initialize basic setting

;;; Code:
(when (fboundp 'set-charset-priority)
  (set-charset-priority 'unicode))

(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq locale-coding-system 'utf-8
      default-process-coding-system '(utf-8 . utf-8))

;; Env
(setenv "PATH" (concat "/usr/local/bin:/opt/local/bin:/usr/bin/bin:~/.local/bin:~/.cargo/bin" (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/local/bin")))
(setq exec-path (append exec-path '("~/.local/bin")))
(setq exec-path (append exec-path '("~/.cargo/bin")))

;; Start server
(use-package server
  :ensure nil
  :defer 1
  :config
  (unless (server-running-p)
    (server-start)))

;; Misc
(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))

(setq backup-by-copying t)

(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(setq visible-bell t
      inhibit-compacting-font-caches t
      make-backup-files nil
      auto-save-default nil)


(provide 'init-basic)
;;; init-basic ends here
