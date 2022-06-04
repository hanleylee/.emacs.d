(use-package evil-search-highlight-persist
  :config
  (global-evil-search-highlight-persist t)
  ;; To only display string whose length is greater than or equal to 3
  ;; (setq evil-search-highlight-string-min-len 3)
  )

(provide 'hl-evil-search-highlight-persist)
