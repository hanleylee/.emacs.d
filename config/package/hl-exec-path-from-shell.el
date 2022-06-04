;; Emacs-Plus 不能读取环境变量, 需要使用此 package, Emacs-mac 则可以直接读取到环境变量
(use-package exec-path-from-shell
  :config
  ;; (setq exec-path-from-shell-arguments '("-l"))
  (setq exec-path-from-shell-arguments nil)
  (dolist (var '("HL_LANG" "HL_LANG_PYTHON"))
    (add-to-list 'exec-path-from-shell-variables var))
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))
  )

(provide 'hl-exec-path-from-shell)
