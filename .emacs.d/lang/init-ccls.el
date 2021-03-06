;;; package --- Summary
;;; Commentary:
;;; LSP CCLS
;;; Code:
(setq ccls-executable "~/.local/bin/ccls")

(use-package ccls
  :ensure t
  :config
  (setq ccls-executable "ccls")
  (setq ccls-args '("--log-file=/tmp/ccls.log"))
  (setq lsp-prefer-flymake nil)
  (setq-default flycheck-disable-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  :hook ((c-mode c++-mode objc-mode) .
    (lambda () (require 'ccls) (lsp))))

(provide 'init-ccls)
;;; init-ccls ends here
