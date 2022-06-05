(load (concat user-emacs-directory "pre-init.el"))

(require 'hl-func)
(require 'hl-var)
(require 'hl-option)
(require 'hl-package-entry)
(require 'hl-keymap)
(require 'hl-hook)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(git-gutter:disabled-modes '(asm-mode image-mode))
 '(git-gutter:handled-backends '(git hg bzr svn))
 '(git-gutter:hide-gutter t)
 '(git-gutter:update-interval 0.2)
 '(git-gutter:window-width 1)
 '(package-selected-packages
   '(all-the-icons-ivy-rich which-key visual-fill-column use-package undo-tree toc-org swift-mode smex sis simpleclip rainbow-delimiters paredit org-bullets org-appear markdown-mode magit ivy-rich ivy-posframe helpful git-gutter-fringe general exec-path-from-shell evil-surround evil-search-highlight-persist evil-org evil-numbers evil-leader evil-indent-textobject evil-indent-plus evil-commentary evil-collection doom-themes doom-modeline diff-hl dashboard counsel-projectile company-fuzzy company-flx command-log-mode cal-china-x all-the-icons-dired ag ack)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-done ((t (:strike-through t :foreground "#585858"))))
 '(org-headline-done ((t (:strike-through t :foreground "#585858"))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.3))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.25))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.2))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.15))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.1))))
 '(org-table ((t (:font "LXGW WenKai Mono")))))
