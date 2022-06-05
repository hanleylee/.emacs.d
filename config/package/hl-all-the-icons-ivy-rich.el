(provide 'hl-all-the-icons-ivy-rich)

(use-package all-the-icons-ivy-rich
  :init
  (all-the-icons-ivy-rich-mode 1)
  (setq all-the-icons-ivy-rich-icon t)

  ;; Whether display the colorful icons.
  ;; It respects `all-the-icons-color-icons'.
  (setq all-the-icons-ivy-rich-color-icon t)

  ;; The icon size
  (setq all-the-icons-ivy-rich-icon-size 1.0)

  ;; Whether support project root
  (setq all-the-icons-ivy-rich-project t)

  ;; Maximum truncation width of annotation fields.
  ;; This value is adjusted depending on the `window-width'.
  (setq all-the-icons-ivy-rich-field-width 80)

  ;; Definitions for ivy-rich transformers.
  ;; See `ivy-rich-display-transformers-list' for details."
  all-the-icons-ivy-rich-display-transformers-list

  ;; Slow Rendering
  ;; If you experience a slow down in performance when rendering multiple icons simultaneously,
  ;; you can try setting the following variable
  (setq inhibit-compacting-font-caches t)
  )
