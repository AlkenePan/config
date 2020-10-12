;;; package -- Summary
;;; Commentary:
;;; Code:

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
  (add-hook 'after-init-hook #'global-flycheck-mode)
  (setq flycheck-emacs-lisp-load-path 'inherit))

;; LSP
(use-package lsp-mode
  :commands lsp
  :ensure t)
;  :config
;  (setq rustic-lsp-server 'rust-analyzer)
;  (setq lsp-rust-server 'rust-analyzer))

(use-package lsp-ui :commands lsp-ui-mode :ensure t)
(use-package company-lsp
  :ensure t
  :commands company-lsp
  :config (push 'company-lsp company-backends))

(provide 'intelligence)
;;; intelligence ends here
