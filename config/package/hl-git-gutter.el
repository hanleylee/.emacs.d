(provide 'hl-git-gutter)

(use-package git-gutter
  :hook (prog-mode . git-gutter-mode)
  :config
  (global-git-gutter-mode +1)
  (custom-set-variables
   '(git-gutter:handled-backends '(git hg bzr svn))
   '(git-gutter:window-width 1)
   '(git-gutter:update-interval 0.2)
   ;; '(git-gutter:modified-sign "=")
   ;; '(git-gutter:added-sign "+")
   ;; '(git-gutter:deleted-sign "-")
   ;; '(git-gutter:unchanged-sign nil)
   '(git-gutter:disabled-modes '(asm-mode image-mode))
   '(git-gutter:hide-gutter t) ;; hide gutter when there are no changes
   ;; '(git-gutter:revision-set-p t)
   ;; '(git-gutter:start-revision "HEAD")
   ;; '(git-gutter:diff-option "HEAD") ;; diff option
   ;; ((prog-mode . ((git-gutter:start-revision . "HEAD"))))
   )
  (add-to-list 'git-gutter:update-hooks 'focus-in-hook)

  ;; (set-face-background 'git-gutter:modified "purple") ;; background color
  ;; (set-face-foreground 'git-gutter:added "green")
  ;; (set-face-foreground 'git-gutter:deleted "red")
  ;; (set-face-background 'git-gutter:unchanged "yellow")
  )
