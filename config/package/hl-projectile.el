(provide 'hl-projectile)

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :init
  (when (file-directory-p "~/repo/hkms/")
    (setq projectile-project-search-path '("~/repo/hkms/")))
  (setq projectile-switch-prject-action #'projectile-dired))
