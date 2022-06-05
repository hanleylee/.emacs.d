(provide 'hl-org-appear)

(use-package org-appear
  :init
  (setq org-appear-autolinks t
        org-appear-autosubmarkers t
        org-appear-autoentities t
        org-appear-autokeywords t
        org-appear-inside-latex t
        org-appear-delay 0
        org-appear-trigger 'always)
  :config
  (add-hook 'org-mode-hook 'org-appear-mode)
  )
