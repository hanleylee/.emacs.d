(provide 'hl-evil-leader)

(use-package evil-leader
  :after evil
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "\\")
  (evil-leader/set-key
    "fa" 'counsel-ag
    "hp" 'git-gutter:popup-hunk
    ;; Stage current hunk
    "hs" 'git-gutter:stage-hunk
    ;; Revert current hunk
    "hu" 'git-gutter:revert-hunk
    )
  (evil-leader/set-key-for-mode
    'emacs-lisp-mode "b" 'byte-compile-file
    )
  ;; (setq evil-leader/no-prefix-mode-rx '("magit-.*-mode" "gnus-.*-mode"))
  )
