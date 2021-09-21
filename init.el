
(setq org-directory "~/org/")
(setq user-full-name "Hanley Lee"
      user-mail-address "hanley.lei@gmail.com")
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
;;(map! :leader
;;      :desc "Export Org to HTML"
;;      "a e" #'org-html-export-to-html)
;; ;;设置窗口位置为左上角(0,0)
;; (set-frame-position (selected-frame) 0 0)
;; ;;设置宽和高
;; (set-frame-width (selected-frame) 110)

;; (set-frame-height (selected-frame) 103)

;;(setq Doom-theme 'Doom-one)
(load-theme 'atom-one-dark t)
(setq frame-title-format "emacs")
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(ido-mode)
(column-number-mode)
(desktop-save-mode 1)
(show-paren-mode)
(global-hl-line-mode)
(winner-mode t)
(windmove-default-keybindings)
(set-frame-font "YaHei Fira Icon Hybrid 16" nil t)
;;(set-default 'cursor-type 'hbar)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; 使用 c-u 向上翻页
(setq evil-want-C-u-scroll t)

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
;; (package-refresh-contents)
(require 'use-package)

(use-package evil
  :ensure t
  :config
  (evil-mode 1)

  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode))
  
  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))

  (use-package evil-indent-textobject
    :ensure t))

(add-to-list 'evil-emacs-state-modes 'ag-mode)
(add-to-list 'evil-emacs-state-modes 'flycheck-error-list-mode)
(add-to-list 'evil-emacs-state-modes 'git-rebase-mode)

;; same as below
;;(dolist (mode '(ag-mode
;;		flycheck-error-list-mode
;;		git-rebase-mode))
;;  (add-to-list 'evil-emacs-state-modes mode))

(evil-add-hjkl-bindings recentf-dialog 'emacs
  (kbd "/")       'evil-search-forward
  (kbd "n")       'evil-search-next
  (kbd "N")       'evil-search-previous
  (kbd "C-d")     'evil-scroll-down
  (kbd "C-u")     'evil-scroll-up
  (kbd "C-w C-w") 'other-window)

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

;; (with-eval-after-load 'evil
;;   ;; use evil mode in the buffer created from calling `list-packages'.
;;   (add-to-list 'evil-buffer-regexps '("*Packages*" . normal))
;; 
;;   (with-eval-after-load 'package
;;     ;; movement keys j,k,l,h set up for free by defaulting to normal mode.
;;     ;; mark, unmark, install
;;     (evil-define-key 'normal package-menu-mode-map (kbd "m") #'package-menu-mark-install)
;;     (evil-define-key 'normal package-menu-mode-map (kbd "u") #'package-menu-mark-unmark)
;;     (evil-define-key 'normal package-menu-mode-map (kbd "x") #'package-menu-execute)))

;; Download Evil
;;(unless (package-installed-p 'evil)
;;  (package-install 'evil))

;; Enable Evil
;;(require 'evil)
;;(evil-mode 1)
;; (map! :n (kbd "-") 'dired-jump)

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

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))
;;(define-key global-map (kbd "C-c t") telega-prefix-map)
;;(with-eval-after-load 'telega
;;  (define-key telega-msg-button-map "k" nil))


(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name))
  (kill-new (file-truename buffer-file-name))
  )
(global-set-key "\C-cg" 'show-file-name)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(evil-visualstar doom-modeline evil-indent-textobject evil-leader evil-surround use-package atom-one-dark-theme evil company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
