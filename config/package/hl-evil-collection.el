(provide 'hl-evil-collection)

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init)
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  ;; (evil-set-initial-state 'dashboard-mode 'normal)

  (evil-set-initial-state 'calendar-mode 'emacs)
  (evil-collection-define-key 'normal 'dired-mode-map
    " " 'dired-mark
    )
  )
