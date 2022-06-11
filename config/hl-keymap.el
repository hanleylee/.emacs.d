(provide 'hl-keymap)

;; MARK: Keys binding
(setq mac-command-modifier 'super)
;; (setq mac-command-modifier 'hyper)
(setq mac-option-modifier 'meta)

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
(global-set-key (kbd "C-h l") 'find-library)

(global-set-key [(super a)] 'mark-whole-buffer)
(global-set-key [(super s)] 'save-buffer)
;; (global-set-key [(super v)] 'yank) ;; use simpleclip instead
;; (global-set-key [(super c)] 'kill-ring-save) ;; use simpleclip instead
(global-set-key [(super l)] 'goto-line)

(global-set-key [(super w)]
                (lambda () (interactive) (delete-window)))
(global-set-key [(super z)] 'evil-undo)
(global-set-key [(super shift z)] 'evil-redo)
