(use-package counsel
  :init
  (setq counsel-yank-pop-preselect-last t)
  :bind (("M-x" . counsel-M-x)
         ("C-x C-b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         ("C-x C-h" . counsel-recentf)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history)))

(provide 'hl-counsel)
