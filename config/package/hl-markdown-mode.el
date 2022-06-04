
;;; Markdown
(use-package markdown-mode
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))
                                        ;(define-key global-map (kbd "C-c t") telega-prefix-map)
                                        ;(with-eval-after-load 'telega
                                        ;  (define-key telega-msg-button-map "k" nil))

(provide 'hl-markdown-mode)
