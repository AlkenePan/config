(use-package projectile
  :diminish
  :hook (after-init . projectile-mode)
  :init
  (setq projectile-use-git-grep t)
  :config
  (setq projectile-git-submodule-command nil))

(provide 'init-dev)
