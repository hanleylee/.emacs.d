
(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-commnad)
  ([remap describe-variabel] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(provide 'hl-helpful)
