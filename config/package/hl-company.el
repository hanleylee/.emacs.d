(provide 'hl-company)

;; (with-eval-after-load 'company
;;   (define-key company-active-map (kbd "M-n") nil)
;;   (define-key company-active-map (kbd "M-p") nil)
;;   (define-key company-active-map (kbd "M-d") 'company-next-page)
;;   (define-key company-active-map (kbd "M-u") 'company-previous-page)
;;   (define-key company-active-map (kbd "C-u") nil)
;;   (define-key company-active-map (kbd "C-n") 'company-select-next)
;;   (define-key company-active-map (kbd "C-p") 'company-select-previous)
;;   )

(use-package company
  :init
  (setq company-require-match nil            ; Don't require match, so you can still move your cursor as expected.
        company-tooltip-align-annotations t  ; Align annotation to the right side.
        company-eclim-auto-save nil          ; Stop eclim auto save.
        company-dabbrev-downcase nil        ; No downcase when completion.
        company-idle-delay 0.3                ; 开始自动补全前的延迟秒数。输入前缀长度必须要满足 company-minimum-prefix-length，该值为 nil 表示没有延迟。
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case nil
        company-dabbrev-code-ignore-case t
        company-minimum-prefix-length 2 ; 补全的最小前缀长度
        company-backends
        '((company-files
           company-yasnippet
           company-keywords
           company-capf
           company-gtags
           company-etags
           )
          (company-abbrev company-dabbrev)))
  :config
  (global-company-mode t)
  ;; Enable downcase only when completing the completion.
  (defun jcs--company-complete-selection--advice-around (fn)
    "Advice execute around `company-complete-selection' command."
    (let ((company-dabbrev-downcase t))
      (call-interactively fn)))
  (advice-add 'company-complete-selection :around #'jcs--company-complete-selection--advice-around)

  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "M-d") 'company-next-page)
  (define-key company-active-map (kbd "M-u") 'company-previous-page)
  (define-key company-active-map (kbd "C-u") nil)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  )
