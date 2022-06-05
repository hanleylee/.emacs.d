(use-package undo-tree
  :init
  (setq undo-tree-enable-undo-in-region nil)

  (setq undo-tree-auto-save-history t)


  (setq hl-undo-dir (concat (getenv "XDG_CACHE_HOME") "/emacs/undo/"))
  ;; MARK: Auto Lock
  (if (not (file-exists-p hl-undo-dir))
      (make-directory hl-undo-dir))
  (setq undo-tree-history-directory-alist `(("." . ,hl-undo-dir)))

  :config
  (global-undo-tree-mode)

  )

(provide 'hl-undo-tree)
