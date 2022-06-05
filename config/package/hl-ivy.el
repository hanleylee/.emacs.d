;; MARK: ivy
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         ("C-u" . backward-kill-paragraph) 
         ("C-w" . backward-kill-word) 
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill))
  ;; :map ivy-reverse-i-search-line
  ;; ("C-k" . ivy-previous-line)
  ;; ("C-d" . ivy-reverse-i-serach-kill))
  :config
  (ivy-mode 1)
  (setq enable-recursive-minibuffers t)
  (setq ivy-wrap t)
  (setq ivy-height 30)
  (setq use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-extra-directories nil)
  ;; keep Ivy from quitting when press backspace in the minibuffer
  (setq ivy-on-del-error-function #'ignore)
  (setq ivy-initial-inputs-alist nil)
  ;; ignore order
  (setq ivy-re-builders-alist '((t . ivy--regex-ignore-order))
        ivy-more-chars-alist '((counsel-rg . 1)
                               (counsel-ag . 0)
                               (counsel-search . 2)
                               (t . 3))
        )
  )

(provide 'hl-ivy)
