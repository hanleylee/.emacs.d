(provide 'hl-general)

(use-package general
  :config
  (general-create-definer rune/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "S-SPC"))

(rune/leader-keys
  "tt" '(counsel-load-theme :which-key "Choose theme")
  "C-h" '(counsel-recentf :which-key "Recentf")
  "C-f" '(counsel-projectile-find-file :which-key "Project file")
  "C-b" '(counsel-switch-buffer :which-key "Buffer")
  "C-g" '(show-file-name :which-key "Show file name")
  "C-q" '(kill-this-buffer :which-key "Kill buffer")

  "M-q" '(save-buffers-kill-terminal :which-key "Kill buffers")

  "gs" '(magit-status :which-key "Magit Status")
  "oc" '(org-capture :which-key "Org Capture")
  "oa" '(org-agenda :which-key "Org Agenda")

  "<DEL>" '(evil-ex-nohighlight :which-key "Remove highlight")

  ;; Jump to next/previous hunk
  "[h" '(git-gutter:previous-hunk :which-key "git-gutter previous-hunk")
  "]h" '(git-gutter:next-hunk :which-key "git-gutter next-hunk")
  )
