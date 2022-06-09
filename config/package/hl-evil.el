(provide 'hl-evil)

;; (evil-add-hjkl-bindings recentf-dialog 'emacs
;;   (kbd "/")       'evil-search-forward
;;   (kbd "n")       'evil-search-next
;;   (kbd "N")       'evil-search-previous
;;   (kbd "C-d")     'evil-scroll-down
;;   (kbd "C-u")     'evil-scroll-up
;;   (kbd "C-w C-w") 'other-window)

;; same as below
;;(dolist (mode '(ag-mode
;;		flycheck-error-list-mode
;;		git-rebase-mode))
;;  (add-to-list 'evil-emacs-state-modes mode))

;; other
;; (add-hook 'occur-mode-hook
;; 	  (lambda ()
;; 	    (evil-add-hjkl-bindings occur-mode-map 'emacs
;; 	      (kbd "/")       'evil-search-forward
;; 	      (kbd "n")       'evil-search-next
;; 	      (kbd "N")       'evil-search-previous
;; 	      (kbd "C-d")     'evil-scroll-down
;; 	      (kbd "C-u")     'evil-scroll-up
;; 	      (kbd "C-w C-w") 'other-window)))

;;(evil-find-char-pinyin-mode +1)

;;(evil-snipe-override-mode 1)

;; 恢复evil的s/S，要用evil-define-key, define-key不行，a bit tricky，一个issue里抄来的
;;(with-eval-after-load 'evil-snipe
;;  (evil-define-key* '(normal) evil-snipe-local-mode-map
;;    "s" #'evil-substitute
;;    "S" #'evil-change-whole-line)
;;  (evil-define-key* '(visual) evil-snipe-local-mode-map
;;    "s" #'evil-substitute
;;    "S" #'evil-change-whole-line)
;; (define-key evil-normal-state-map "s" #'evil-substitute)
;; (define-key evil-normal-state-map "S" #'evil-change-whole-line)
                                        ;  )
;; ;; 只用;来repeat，禁用移动后立即按f/t来repeat
;; (setq evil-snipe-repeat-keys nil)
;; ;; override-mode之后如果要给evil-repeat绑其他键位要用evil-snipe的对应函数
;; (define-key evil-normal-state-map (kbd "DEL") 'evil-snipe-repeat-reverse)
;; ;; 不用s/S那用gs之类的吧
;; (evil-define-key 'normal evil-snipe-mode-map (kbd "g s") #'evil-snipe-s)
;; (evil-define-key 'normal evil-snipe-mode-map (kbd "g S") #'evil-snipe-S)
;; (evil-define-key 'normal evil-snipe-mode-map (kbd "g t") #'evil-snipe-x)
;; (evil-define-key 'normal evil-snipe-mode-map (kbd "g T") #'evil-snipe-X)
;; (evil-define-key 'visual evil-snipe-mode-map "z" #'evil-snipe-s)
;; (evil-define-key 'visual evil-snipe-mode-map "Z" #'evil-snipe-S)
;; (evil-define-key 'visual evil-snipe-mode-map "x" #'evil-snipe-x)
;; (evil-define-key 'visual evil-snipe-mode-map "X" #'evil-snipe-X)

(defun evil-hook ()
  (dolist (mode '(custom-mode
                  eshell-mode
                  git-rebase-mode
                  erc-mode
                  circe-server-mode
                  circe-chat-mode
                  ag-mode
                  flycheck-error-list-mode
                  git-rebase-mode                          
                  circe-query-mode
                  sauron-mode
                  term-mode))
    (add-to-list 'evil-emacs-state-modes mode)))

(use-package evil
  :init
  (setq evil-search-module 'evil-search)
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-d-scroll t)
  (setq evil-want-C-u-delete t)
  (setq evil-want-C-i-jump t)
  (setq evil-want-C-w-delete t)
  (setq x-select-enable-clipboard nil)
  ;; :hook (evil-mode . evil-hook)
  (setq isearch-lazy-count t)
  :config
  (evil-mode t)

  (evil-set-undo-system 'undo-tree)

  ;; (define-key evil-normal-state-map  (kbd "s-v") (kbd "\"+p"))
  (define-key evil-normal-state-map (kbd "-") 'dired-jump)
  (define-key evil-normal-state-map (kbd "C-S-a") 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "C-S-x") 'evil-numbers/dec-at-pt)
  (define-key evil-normal-state-map (kbd "C-j") (concat ":m +1" (kbd "RET") "==")) ; move line up
  (define-key evil-normal-state-map (kbd "C-k")   (concat ":m -2" (kbd "RET") "==")) ; move line down

  ;; (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  ;; (define-key evil-insert-state-map (kbd "s-v") (kbd "C-r +"))
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
  (define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
  (define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
  ;; (define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)

  ;; (define-key evil-visual-state-map  (kbd "s-c") (kbd "\"+y"))
  (define-key evil-visual-state-map (kbd "C-j") (concat ":m '>+1" (kbd "RET") "gv=gv")) ; move line up
  (define-key evil-visual-state-map (kbd "C-k")   (concat ":m '<-2" (kbd "RET") "gv=gv")) ; move line down

  ;; (define-key evil-ex-completion-map (kbd "s-v") (kbd "C-r +"))
  ;; (define-key evil-ex-search-keymap  (kbd "s-v") (kbd "C-r +"))

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  )

;; (define-key evil-motion-state-map "," nil)
;; (evil-define-key 'normal evil-commentary-mode-map
;;   ",c" 'evil-commentary)
;; (define-key evil-commentary-mode-map
;;   (kbd "M-;") 'evil-commentary-line)
