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

(use-package general
  :ensure t
  :config
  (general-define-key
   "M-s" 'isearch-forward
   "M-b" '(:keymap nil :which-key "buffer")
   "M-b i" 'ibuffer
   "M-b b" 'ivy-switch-buffer
   "M-b k" 'kill-this-buffer
   "M-f" '(:keymap nil :which-key "files")
   "M-f f" 'find-file)
  (general-create-definer edit-leader-def
			  :prefix "SPC"
			  :states '(normal visual emacs))
  (edit-leader-def
   "TAB" 'next-buffer
   "c" '(:ignore t :which-key "Check")
   "cn" 'flycheck-next-error
   "b" '(:ingore t :which-key "Buffer")
   "bb" 'ivy-switch-buffer
   "bk" 'kill-this-buffer
   "br" 'revert-buffer))

(provide 'init-evil)
;;; init-evil.el ends here
