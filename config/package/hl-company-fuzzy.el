(provide 'hl-company-fuzzy)

(use-package company-fuzzy
  :hook (company-mode . company-fuzzy-mode)
  :init
  (setq company-fuzzy-sorting-backend 'flx
        company-fuzzy-prefix-on-top t
        company-fuzzy-history-backends '(company-yasnippet)
        company-fuzzy-show-annotation t
        ;; company-fuzzy-passthrough-backends '(company-capf)
        ;; company-fuzzy-trigger-symbols '("." "->" "<" "\"" "'" "@")
        )
  :config
  (global-company-fuzzy-mode t)
  ;; ;; Some backends doesn't allow me to get the list of candidates by passing the possible prefix; hence I have created this type of special scenario
  ;; (add-to-list 'company-fuzzy-history-backends 'company-yasnippet)
  )
