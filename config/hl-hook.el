(provide 'hl-hook)

;; Disable line number for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 9))))

(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (add-to-list (make-local-variable 'company-backends)
                                               'company-elisp)))
