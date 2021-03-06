(provide 'hl-option)

;; (check-parens)

(setq frame-title-format "emacs")
(setq frame-inhibit-implied-resize t)
;; 禁止菜单栏
(menu-bar-mode -1)
;; 禁止工具栏
(tool-bar-mode -1)
;; 禁止滚动条
(scroll-bar-mode -1)
(tooltip-mode -1)
;; 记录上一次文件打开的位置, 并在再次打开该文件的时候自动跳转到该位置
(save-place-mode 1)

(setq delete-by-moving-to-trash t)
;; 禁止 emacs 一个劲的叫
(setq visible-bell t)
;; 在 console, 禁止屏幕不停地闪
(setq ring-bell-function (lambda () t))
;; 关闭启动时的开机画面
(setq inhibit-startup-message t)
;; 剪贴板最大条目 1000
(setq kill-ring-max 1000)
;; 一行最多显示 150
(setq-default fill-column 150)

;; 默认 major-mode 为 fundamental-mode
(setq default-major-mode 'fundamental-mode)
(column-number-mode)

;; (desktop-save-mode 1)
(setq desktop-path '(concat (getenv "XDG_CACHE_HOME") "/emacs/"))
;;(desktop-read)

(show-paren-mode t)
(setq show-paren-style 'parenthesses)
;;显示语法高亮

(setq display-line-numbers-type 'relative)
(column-number-mode)
(global-display-line-numbers-mode t)
(global-hl-line-mode)
(blink-cursor-mode 0)
(winner-mode t)
(windmove-default-keybindings)

(setq insert-directory-program "gls" dired-use-ls-dired t)
(setq dired-listing-switches "-lhiaG --group-directories-first")
;; (require 'ls-lisp)
;; (setq ls-lisp-dirs-first t)
;; (setq ls-lisp-use-insert-directory-program nil)

;; MARK: Auto Backup
(setq
 make-backup-files t
 vc-make-backup-files t
 backup-by-copying t      ; don't clobber symlinks
 delete-old-versions t
 kept-new-versions 5
 kept-old-versions 2
 version-control t)       ; use versioned backups
(setq backup-directory-alist `(("." . ,hl-backup-dir)))
; (add-to-list 'backup-directory-alist '(("." . ,hl-backup-dir)))

;; MARK: Auto Lock
; (add-to-list 'lock-file-name-transforms `((".*" "~/.cache/emacs/lock/" t)))
(setq lock-file-name-transforms `((".*" ,hl-lock-dir t)))

;; MARK: Font
(global-font-lock-mode t)
(set-face-attribute 
 'default nil :font (font-spec :family "FiraCode Nerd Font Mono" :size 16))
(dolist (charset '(kana han cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "LXGW WenKai Mono")))
(setq face-font-rescale-alist '(("LXGW WenKai Mono" . 1.0)))
                                        ; (set-fontset-font t 'unicode (font-spec :family "Microsoft YaHei" :size 16))
                                        ; (set-fontset-font t '(#x4E00 . #x9ffc) (font-spec :family "Microsoft YaHei" :size 18))

(setq shell-file-name (executable-find "/bin/zsh"))
(setq org-directory (getenv "HKMS"))
(setq user-full-name "Hanley Lee"
      user-mail-address "hanley.lei@gmail.com")

;; MARK: Encoding
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-16-le)
(set-default-coding-systems 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-language-environment "UTF-8")

;;内部有个自动补全功能，根据当前buffer的内容、文件名、剪切板等自动补全
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
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
;;一个好用的minibuffer插件ido，许多插件都基于它。
(ido-mode t)
(setq ido-enable-flex-matching t)
;; ;;设置窗口位置为左上角(0,0)
;; (set-frame-position (selected-frame) 0 0)
;; ;;设置宽和高
;; (set-frame-width (selected-frame) 110)

;; (set-frame-height (selected-frame) 103)

(setq-default indent-tabs-mode nil)
(setq-default tab-always-indent 'complete)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

(recentf-mode 1)
(setq recentf-save-file (expand-file-name "recentf" "~/.emacs.d"))
(setq recentf-max-menu-items 10000)
(setq recentf-max-saved-items 10000)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(hl-guard-file-exists custom-file)
(load custom-file)
