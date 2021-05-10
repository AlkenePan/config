;;; package --- development related tools
;;; Commentary:
;; projectile

;;; Code:
(use-package projectile
  :diminish
  :hook (after-init . projectile-mode)
  :init
  (setq projectile-use-git-grep t)
  :config
  (projectile-update-mode-line)
  (setq projectile-git-submodule-command nil)
  (setq projectile-completion-system 'ivy)
  )

(provide 'init-dev)
;;; init-dev.el ends here
