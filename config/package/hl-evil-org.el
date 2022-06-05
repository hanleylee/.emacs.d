(provide 'hl-evil-org)

(use-package evil-org
  :after evil org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))
