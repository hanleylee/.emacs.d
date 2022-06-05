;; MARK: Global set key

;; switch themes
(define-key emacs-lisp-mode-map (kbd "C-x M-t") 'counsel-load-theme)

;; 按ALT+/ 键进行补全
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)


;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;; MARK: Global set key - Command
(global-set-key (kbd "s-=") 'text-scale-increase)
(global-set-key (kbd "s--") 'text-scale-decrease)
(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "C-h l") 'find-library)


(provide 'hl-keymap)
