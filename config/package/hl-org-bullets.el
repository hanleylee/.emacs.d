(provide 'hl-org-bullets)
  (use-package org-bullets
    :after org
    :hook (org-mode . org-bullets-mode)
    :custom
    (org-bullets-bullet-list '("●" "◉" "○" "▶" "◆" "◇" "★" "✿" "❀" "✸")))
