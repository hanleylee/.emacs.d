(provide 'hl-doom-modeline)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-vcs-max-length 50)
  :custom ((doom-modeline-height 15)))
