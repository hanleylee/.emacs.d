;;(setq Doom-theme 'Doom-one)
(load-theme 'atom-one-dark t)
(setq frame-title-format "emacs")
;; 禁止菜单栏
(menu-bar-mode -1)
;; 禁止工具栏
(tool-bar-mode -1)
;; 进制滚动条
(scroll-bar-mode -1)
;; 禁止 emacs 一个劲的叫
(setq visible-bell t)
;; 在 console, 禁止屏幕不停地闪
(setq ring-bell-function (lambda () t))
;; 关闭启动时的开机画面
(setq inhibit-startup-message t)
;; 剪贴板最大条目 1000
(setq kill-ring-max 1000)
;; 一行最多显示 150
(setq default-fill-column 150)
;; 默认 major-mode 为 text-mode
(setq default-major-mode 'text-mode)
(column-number-mode)
(desktop-save-mode 1)
(show-paren-mode t)
(setq show-paren-style 'parenthesses)
;;显示语法高亮

(global-font-lock-mode t)
(global-hl-line-mode)
(blink-cursor-mode 0)
(winner-mode t)
(windmove-default-keybindings)
(set-frame-font "YaHei Fira Icon Hybrid 16" nil t)
(setq shell-file-name (executable-find "/bin/zsh"))
;;(set-default 'cursor-type 'hbar)
(setq org-directory "~/org/")
(setq user-full-name "Hanley Lee"
      user-mail-address "hanley.lei@gmail.com")
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
;;设置编码
(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-16-le)
(set-default-coding-systems 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)  
(set-file-name-coding-system 'gb18030)
;;内部有个自动补全功能，根据当前buffer的内容、文件名、剪切板等自动补全
(setq hippie-expand-try-functions-list
      '(
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))
;;按ALT+/ 键进行补全
(global-set-key (kbd "M-/") 'hippie-expand)
;;用ibuffer替换默认的buffer管理器
(global-set-key (kbd "C-x C-b") 'ibuffer)
;;用正则搜索替换默认搜索
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
;;一个好用的minibuffer插件ido，许多插件都基于它。
(ido-mode t)
(setq ido-enable-flex-matching t)
;;(map! :leader
;;      :desc "Export Org to HTML"
;;      "a e" #'org-html-export-to-html)
;; ;;设置窗口位置为左上角(0,0)
;; (set-frame-position (selected-frame) 0 0)
;; ;;设置宽和高
;; (set-frame-width (selected-frame) 110)

;; (set-frame-height (selected-frame) 103)

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
