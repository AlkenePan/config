;;; Package --- Summary
;;; Commentary:
;;; Code:
(use-package rustic
  :ensure t
  :mode ("\\.rs\\'" . rustic-mode)
  :config
  ;; (setq rustic-analyzer-command "~/.cargo/bin/rust-analyzer")
  (setq rustic-analyzer-command '("~/.local/bin/rust-analyzer"))
  (setq rustic-lsp-server 'rust-analyzer))
(setq lsp-rust-rustfmt-path '("~/.cargo/bin/rustfmt"))
(provide 'init-rust)
;;; init-rust.el ends here
