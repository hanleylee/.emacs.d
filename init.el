;; (setq whitespace-display-mappings
;;       '((newline-mark 10 [172 10])))

;; (check-parens)
;;(setq Doom-theme 'Doom-one)
(load-theme 'doom-one t)

(setq frame-title-format "emacs")
;; 禁止菜单栏
(menu-bar-mode 1)
;; 禁止工具栏
(tool-bar-mode -1)
(tooltip-mode -1)
;; 记录上一次文件打开的位置, 并在再次打开该文件的时候自动跳转到该位置
(save-place-mode 1)

;; 禁止滚动条
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
(setq-default fill-column 150)

;; 默认 major-mode 为 text-mode
(setq default-major-mode 'text-mode)
(column-number-mode)

;; (desktop-save-mode 1)
(setq desktop-path '("~/.cache/emacs/"))
;;(desktop-read)

(setq mac-command-modifier 'super)
(setq mac-option-modifier 'meta)

(show-paren-mode t)
(setq show-paren-style 'parenthesses)
;;显示语法高亮

(global-font-lock-mode t)
(global-hl-line-mode)
(blink-cursor-mode 0)
(winner-mode t)
(windmove-default-keybindings)

(setq
 make-backup-files t
 vc-make-backup-files t
 backup-by-copying t      ; don't clobber symlinks
 delete-old-versions t
 kept-new-versions 256
 kept-old-versions 2
 version-control t)       ; use versioned backups

(setq hl-backup-dir (concat (getenv "XDG_CACHE_HOME") "/emacs/backup/"))
(if (not (file-exists-p hl-backup-dir))
    (make-directory hl-backup-dir))
(setq backup-directory-alist `(("." . ,hl-backup-dir)))
; (add-to-list 'backup-directory-alist '(("." . ,hl-backup-dir)))

;; (add-to-list 'load-path "~/.emacs.d/lisp/") ;; this will not add its subdir to load-path, as https://www.emacswiki.org/emacs/LoadPath
(let ((default-directory "~/.emacs.d/lisp/"))
  (normal-top-level-add-subdirs-to-load-path))
;; set default font
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

;;设置编码
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
;; 按ALT+/ 键进行补全
(global-set-key (kbd "M-/") 'hippie-expand)
;;一个好用的minibuffer插件ido，许多插件都基于它。
(ido-mode t)
(setq ido-enable-flex-matching t)
;; ;;设置窗口位置为左上角(0,0)
;; (set-frame-position (selected-frame) 0 0)
;; ;;设置宽和高
;; (set-frame-width (selected-frame) 110)

;; (set-frame-height (selected-frame) 103)

(setq org-capture-templates
      `(("t" "task" entry (file "~/repo/todo/agenda/inbox.org")
         "* TODO %?\nCaptured %<%Y-%m-%d %H:%M>") 
        ("n" "note" entry (file "~/repo/todo/notes.org")
         "* Note %<%Y-%m-%d %H:%M>\n%?")))
(setq-default indent-tabs-mode nil)
(setq-default tab-always-indent 'complete)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; MARK: Global set key
;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; MARK: Global set key - Command
(global-set-key (kbd "s-=") 'text-scale-increase)
(global-set-key (kbd "s--") 'text-scale-decrease)
(global-set-key (kbd "s-s") 'save-buffer)

(column-number-mode)
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)
;; Disable line number for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 9))))
;; Set up package.el to work with MELPA
(require 'package)
;;(add-to-list 'package-archives
;;             '("melpa" . "https://melpa.org/packages/"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; :init keyword to execute code before a package is loaded
;; :config can be used to execute code after a package is loaded
;; commands, bind, bind*, bind-keymap, bind-keymap*, mode, interpreter, hook defer 可以延迟加载
;; magic, magic-fallback to cause certain fucntion to be run if the begining of a file matches a given regular expression
;; :disabled keyword can turn off a module you're having difficulties with, or stop loading something you're not using at the present time:
;; :ensure keyword causes the package(s) to be installed automatically if not already present on your system
(require 'use-package)
(setq use-package-always-ensure t)

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  ;; Set the title
  (setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
  ;; Set the banner
  (setq dashboard-startup-banner [VALUE])
  ;; Value can be
  ;; 'official which displays the official emacs logo
  ;; 'logo which displays an alternative emacs logo
  ;; 1, 2 or 3 which displays one of the text banners
  ;; "path/to/your/image.gif", "path/to/your/image.png" or "path/to/your/text.txt" which displays whatever gif/image/text you would prefer

  ;; Content is not centered by default. To center, set
  (setq dashboard-center-content t)

  ;; To disable shortcut "jump" indicators for each section, set
  (setq dashboard-show-shortcuts t)
  (setq dashboard-items '((recents  . 10)
                          (bookmarks . 10)
                          (projects . 10)
                          (agenda . 10)
                          (registers . 5)))
  ;; (add-to-list 'dashboard-items '(agenda) t)
  (setq dashboard-item-names '(("Recent Files:" . "Recently opened files:")
                               ("Agenda for today:" . "Today's agenda:")
                               ("Agenda for the coming week:" . "Agenda:")))
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (dashboard-modify-heading-icons '((recents . "file-text")
                                    (bookmarks . "book")))
  (setq dashboard-set-navigator t)
  ;; Format: "(icon title help action face prefix suffix)"
  (setq dashboard-navigator-buttons
        `(;; line1
          ((,(all-the-icons-octicon "mark-github" :height 1.1 :v-adjust 0.0)
            "Homepage"
            "Browse homepage"
            (lambda (&rest _) (browse-url "https://github.com/hanleylee")))
           ("★" "Star" "Show stars" (lambda (&rest _) (show-stars)) warning)
           ("?" "" "?/h" #'show-help nil "<" ">"))
          ;; line 2
          ((,(all-the-icons-faicon "linkedin" :height 1.1 :v-adjust 0.0)
            "Linkedin"
            ""
            (lambda (&rest _) (browse-url "homepage")))
           ("⚑" nil "Show flags" (lambda (&rest _) (message "flag")) error))))
  (setq dashboard-set-init-info t)
  (setq dashboard-init-info "This is an init message!")
  (setq dashboard-set-footer t)
  (setq dashboard-footer-messages '("Dashboard is pretty cool!"))
  (setq dashboard-footer-icon (all-the-icons-octicon "dashboard"
                                                     :height 1.1
                                                     :v-adjust -0.05
                                                     :face 'font-lock-keyword-face))
  (setq dashboard-projects-switch-function 'counsel-projectile-switch-project-by-name)
  (setq dashboard-projects-switch-function 'projectile-persp-switch-project)
  (setq dashboard-week-agenda t)
  (setq dashboard-filter-agenda-entry 'dashboard-no-filter-agenda)
  )

(use-package git-gutter
  :hook (prog-mode . git-gutter-mode)
  :config
  (global-git-gutter-mode +1)
  (custom-set-variables
   '(git-gutter:handled-backends '(git hg bzr svn))
   '(git-gutter:window-width 1)
   '(git-gutter:update-interval 0.2)
   ;; '(git-gutter:modified-sign "=")
   ;; '(git-gutter:added-sign "+")
   ;; '(git-gutter:deleted-sign "-")
   ;; '(git-gutter:unchanged-sign nil)
   '(git-gutter:disabled-modes '(asm-mode image-mode))
   '(git-gutter:hide-gutter t) ;; hide gutter when there are no changes
   ;; '(git-gutter:revision-set-p t)
   ;; '(git-gutter:start-revision "HEAD")
   ;; '(git-gutter:diff-option "HEAD") ;; diff option
   ;; ((prog-mode . ((git-gutter:start-revision . "HEAD"))))
   )
  (add-to-list 'git-gutter:update-hooks 'focus-in-hook)

  ;; (set-face-background 'git-gutter:modified "purple") ;; background color
  ;; (set-face-foreground 'git-gutter:added "green")
  ;; (set-face-foreground 'git-gutter:deleted "red")
  ;; (set-face-background 'git-gutter:unchanged "yellow")
  )
(use-package git-gutter-fringe
  :config
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom)
  )

(use-package paredit
  :config
  (paredit-mode))


(use-package command-log-mode)

;; MARK: doom-theme
(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)
  ;; (custom-set-variables `(doom-modeline-height 15))
  (advice-add #'fit-window-to-buffer :before (lambda (&rest _) (redisplay t)))
  )

;; save commnad history
(use-package smex
  :defines smex-save-file
  :config
  (setq smex-history-length 15)
  (smex-initialize))

;; switch themes
(define-key emacs-lisp-mode-map (kbd "C-x M-t") 'counsel-load-theme)

(use-package all-the-icons)
(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode)
  :config
  (setq all-the-icons-dired-monochrome nil))

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.5))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-commnad)
  ([remap describe-variabel] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package general
  :config
  (general-create-definer rune/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "S-SPC"))

(rune/leader-keys
  "t" '(:ignore t :which-key "Toggles")
  "tt" '(counsel-load-theme :which-key "Choose theme")
  "C-h" '(counsel-buffer-or-recentf :which-key "Recentf or buffer")
  "C-f" '(counsel-projectile-find-file :which-key "Project file")
  "C-b" '(counsel-switch-buffer :which-key "Buffer")
  "C-g" '(show-file-name :which-key "Show file name")
  "gs" '(magit-status :which-key "Magit Status")
  "ct" '(org-capture :which-key "Org Capture")
  "ad" '(org-agenda :which-key "Org Agenda")

  "<DEL>" '(evil-ex-nohighlight :which-key "Remove highlight")

  ;; Jump to next/previous hunk
  "[h" '(git-gutter:previous-hunk :which-key "git-gutter previous-hunk")
  "]h" '(git-gutter:next-hunk :which-key "git-gutter next-hunk")
  )

;; Emacs-Plus 不能读取环境变量, 需要使用此 package, Emacs-mac 则可以直接读取到环境变量
;; (use-package exec-path-from-shell
;;   :config
;;   ;; (setq exec-path-from-shell-arguments '("-l"))
;;   (setq exec-path-from-shell-arguments nil)
;;   (dolist (var '("HL_LANG" "HL_LANG_PYTHON"))
;;     (add-to-list 'exec-path-from-shell-variables var))
;;   (when (memq window-system '(mac ns x))
;;     (exec-path-from-shell-initialize))
;;   )

;; (use-package helm
;;   :config (require 'helm-config))

;; Magit
(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;;; Org mode
(defun efs/org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([+]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "◦"))))))

  (custom-set-faces
   ;; '(org-level-1 ((t (:inherit outline-1 :height 1.2  :foreground "#FD971F" :bold t)))) 
   '(org-level-1 ((t (:inherit outline-1 :height 1.3))))
   '(org-level-2 ((t (:inherit outline-2 :height 1.25))))
   '(org-level-3 ((t (:inherit outline-3 :height 1.2))))
   '(org-level-4 ((t (:inherit outline-4 :height 1.15))))
   '(org-level-5 ((t (:inherit outline-5 :height 1.1))))
   ;; '(org-table ((t (:font "LXGW WenKai Mono" :size 18))))
   '(org-table ((t (:font "LXGW WenKai Mono"))))
   '(org-headline-done ((t (:strike-through t :foreground "#585858"))))
   '(org-done ((t (:strike-through t :foreground "#585858"))))
   )
  )

(use-package org
  ;; :hook (org-mode . efs/org-mode-setup)
  ;; :mode (("\\.org\\'" . org-mode))
  :config
  (setq org-M-RET-may-split-line nil)
  (add-to-list 'auto-mode-alist  '("\\.org\\'" . org-mode))
  (efs/org-font-setup)
  (add-hook 'org-mode-hook 'turn-on-visual-line-mode)
  (add-hook 'org-mode-hook (lambda ()
                             (setq tab-width 2)
                             (setq evil-shift-width 2)
                             ))
  (setq org-image-actual-width nil
        org-display-remote-inline-images 'download
        ;; org-display-remote-inline-images 'cache
        org-startup-with-inline-images "inlineimages"
        ;; org-startup-indented t
        org-ellipsis " ···"
        truncate-lines nil
        org-hide-emphasis-markers t
        org-hide-leading-stars t
        org-fontify-done-headline t
        org-pretty-entities t
        org-odd-level-only t
        org-src-fontify-natively t
        org-src-tab-acts-natively t
        )
  (setq org-todo-keywords '(
                            (sequence "TODO(t!)" "DOING(i!)" "|" "DONE(d!)" "ABORT(a!)")
                            ;; (type "工作(w!)" "学习(s!)" "休闲(l!)" "|")
                            ))
  (setq org-todo-keyword-faces
  '(("TODO" .      (:foreground "#d6a038" :background "#404040" :weight bold))
    ("DOING" .     (:foreground "#aa72c4" :background "#404040" :weight bold))
    ("DONE" .      (:foreground "#585858" :background "#404040" :weight bold :strike-through t)) 
    ("ABORT" .     (:foreground "#585858" :background "#404040" :weight bold :strike-through t :italic t))
    ))
  (setq calendar-week-start-day 1) ;设置星期一为每周的第一天
  ;; 优先级范围和默认任务的优先级
  (setq org-highest-priority ?A)
  (setq org-lowest-priority  ?E)
  (setq org-default-priority ?E)
  ;; 优先级醒目外观
  (setq org-priority-faces
        '((?A . (:foreground "red" :weight bold))
          (?B . (:foreground "orange" :weight bold))
          (?C . (:foreground "yellow" :weight bold))
          (?D . (:foreground "purple" :weight bold))
          (?E . (:foreground "green" :weight bold))
          ))
  (setq org-tag-alist '(
                        ("@waittingFor" . ?w)
                        ("@darktime" . ?d)
                        ("@metro" . ?m)
                        ("@tired" . ?t)
                        ("@shopping" . ?s)
                        ("@reading" . ?r)
                        ("@explore" . ?e)
                        ("@video" . ?v)
                        )
        )
  (setq org-tag-faces
        '(
          ("@waittingFor" . (:foreground "#B9B9B9" :background "#464646"))
          ("@darktime" . (:foreground "#B9B9B9" :background "#464646"))
          ("@metro" . (:foreground "#B9B9B9" :background "#464646"))
          ("@tired" . (:foreground "#B9B9B9" :background "#464646"))
          ("@shopping" . (:foreground "#B9B9B9" :background "#464646"))
          ("@reading" . (:foreground "#B9B9B9" :background "#464646"))
          ("@explore" . (:foreground "#B9B9B9" :background "#464646"))
          ("@video" . (:foreground "#B9B9B9" :background "#464646"))
          ))
  (setq org-enforce-todo-dependencies t) ;; 如果子任务没有全部完成, 主任务将不能设置为 DONE 状态
  (setq my-holidays
        '(;;公历节日
          (holiday-fixed 2 14 "情人节")
          (holiday-fixed 9 10 "教师节")
          (holiday-float 6 0 3 "父亲节")
          ;; 农历节日
          (holiday-lunar 1 1 "春节" 0)
          (holiday-lunar 1 15 "元宵节" 0)
          (holiday-solar-term "清明" "清明节")
          (holiday-lunar 5 5 "端午节" 0)
          (holiday-lunar 7 7 "七夕情人节" 0)
          (holiday-lunar 8 15 "中秋节" 0)
          ;;纪念日
          (holiday-lunar 1 9 "老婆生日" 0)
          (holiday-fixed 8 1 "我的生日")
          ))
  (setq calendar-holidays my-holidays)  ;只显示我定制的节假日
  (setq calendar-mark-holidays-flag t) ; 让 calendar 自动标记出节假日的日期(也可以用 x 切换状态)
  (setq calendar-mark-diary-entries-flag t) ; 让 calendar 自动标记出所有记有待办事项的日期(也可以用 m 切换状态)
  (setq org-use-fast-todo-selection t)
  (setq org-agenda-files (list "/Users/hanley/repo/todo/agenda"))
  (setq org-agenda-ndays 21)
  (setq org-agenda-include-diary t)
  (setq org-list-demote-modify-bullet
      (quote (("+" . "-")
              ("-" . "+")
              ("*" . "-")
              ("1." . "-")
              ("1)" . "-")
              ("A)" . "-")
              ("B)" . "-")
              ("a)" . "-")
              ("b)" . "-")
              ("A." . "-")
              ("B." . "-")
              ("a." . "-")
              ("b." . "-"))))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (clojure . t)
     (python . t)
     (ruby . t)
     (C . t)
     (java . t)
     (lua . t)
     (perl . t)
     (sqlite . t)))
  (setq org-confirm-babel-evaluate nil) ; 禁止 emacs 执行前询问
  (use-package cal-china-x
    :config
    (setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
    )

  (use-package org-bullets
    :after org
    :hook (org-mode . org-bullets-mode)
    :custom
    (org-bullets-bullet-list '("●" "◉" "○" "▶" "◆" "◇" "★" "✿" "❀" "✸")))

  (use-package org-appear
    :init
    (setq org-appear-autolinks t
          org-appear-autosubmarkers t
          org-appear-autoentities t
          org-appear-autokeywords t
          org-appear-inside-latex t
          org-appear-delay 0
          org-appear-trigger 'always)
    :config
    (add-hook 'org-mode-hook 'org-appear-mode)
    )
  (use-package toc-org
    :config
    (add-hook 'org-mode-hook 'toc-org-mode)
    ;; enable in markdown, too
    ;; (add-hook 'markdown-mode-hook 'toc-org-mode)
    ;; (define-key markdown-mode-map (kbd "C\-c C-o") 'toc-org-markdown-follow-thing-at-point)
    )
  )

;;; Markdown
(use-package markdown-mode
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))
                                        ;(define-key global-map (kbd "C-c t") telega-prefix-map)
                                        ;(with-eval-after-load 'telega
                                        ;  (define-key telega-msg-button-map "k" nil))

;; ivy
(use-package ag)
(use-package ack)
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
  (setq ivy-height 50)
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
  (use-package ivy-rich
    :init
    (ivy-rich-mode 1))
  (use-package ivy-posframe
    ;; display at `ivy-posframe-style'
    :config
    (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display)))
    (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
    ;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-window-center)))
    ;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-bottom-left)))
    ;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-window-bottom-left)))
    ;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center)))
    ;; Different command can use different display function.
    (setq ivy-posframe-parameters
          '((left-fringe . 8)
            (right-fringe . 8)))

    (defun my-ivy-posframe-get-size ()
      "Set the ivy-posframe size according to the current frame."
      (let ((height (or ivy-posframe-height (or ivy-height 10)))
            (width (min (or ivy-posframe-width 200) (round (* .75 (frame-width))))))
        (list :height height :width width :min-height height :min-width width)))

    (setq ivy-posframe-size-function 'my-ivy-posframe-get-size)
    
    ;; (setq ivy-posframe-min-width 90
    ;;       ivy-posframe-width 110)
    (setq ivy-posframe-height-alist '((swiper . 50)
                                      (t      . 40)))

    ;; (setq ivy-posframe-display-functions-alist
    ;;       '((swiper          . ivy-display-function-fallback)
    ;;         (complete-symbol . ivy-posframe-display-at-point)
    ;;         (counsel-M-x     . ivy-posframe-display-at-window-bottom-left)
    ;;         (t               . ivy-posframe-display)))
    (ivy-posframe-mode 1))

  )


;; (use-package mini-frame
;;   :config
;;   (mini-frame-mode)
;;   (custom-set-variables
;;  '(mini-frame-show-parameters
;;    '((top . 10)
;;      (width . 1.0)
;;      (left . 0.5)
;;      (height . 15)))))
;; (use-package maple-minibuffer
;;   :ensure nil
;;   :hook (after-init . maple-minibuffer-mode)
;;   :config
;;   (setq maple-minibuffer:position-type 'window-center
;;         maple-minibuffer:border-color "gray50"
;;         maple-minibuffer:height nil
;;         maple-minibuffer:width 0.7
;;         maple-minibuffer:cache t)

;;   (setq maple-minibuffer:action '(read-from-minibuffer read-string)
;;         maple-minibuffer:ignore-action '(evil-ex eval-expression))

;;   (add-to-list 'maple-minibuffer:ignore-action 'org-schedule)
;;   (add-to-list 'maple-minibuffer:ignore-regexp "^helm-")

;;   ;; more custom parameters for frame
;;   (defun maple-minibuffer:parameters ()
;;     "Maple minibuffer parameters."
;;     `((height . ,(or maple-minibuffer:height 10))
;;       (width . ,(or maple-minibuffer:width (window-pixel-width)))
;;       (left-fringe . 5)
;;       (right-fringe . 5))))

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :init
  (when (file-directory-p "~/repo/hkms/")
    (setq projectile-project-search-path '("~/repo/hkms/")))
  (setq projectile-switch-prject-action #'projectile-dired))

(use-package counsel
  :init
  (setq counsel-yank-pop-preselect-last t)
  :bind (("M-x" . counsel-M-x)
         ("C-x C-b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         ("C-x C-h" . counsel-buffer-or-recentf)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history)))

(use-package counsel-projectile
  :config (counsel-projectile-mode))

(use-package simpleclip
  :config
  (simpleclip-mode 1)
  )

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

(use-package highlight)

(setq evil-search-module 'evil-search)

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-d-scroll t)
  (setq evil-want-C-u-delete t)
  (setq evil-want-C-i-jump t)
  (setq evil-want-C-w-delete t)
  (setq x-select-enable-clipboard nil)
  ;; :hook (evil-mode . evil-hook)
  :config
  (evil-mode t)

  (evil-set-undo-system 'undo-redo)

  ;; (define-key evil-normal-state-map  (kbd "s-v") (kbd "\"+p"))
  (define-key evil-normal-state-map (kbd "-") 'dired-jump)
  (define-key evil-normal-state-map (kbd "C-S-a") 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "C-S-x") 'evil-numbers/dec-at-pt)

  ;; (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  ;; (define-key evil-insert-state-map (kbd "s-v") (kbd "C-r +"))
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
  (define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
  (define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
  ;; (define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)

  ;; (define-key evil-visual-state-map  (kbd "s-c") (kbd "\"+y"))

  ;; (define-key evil-ex-completion-map (kbd "s-v") (kbd "C-r +"))
  ;; (define-key evil-ex-search-keymap  (kbd "s-v") (kbd "C-r +"))

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (use-package evil-leader
    :config
    (global-evil-leader-mode)
    (evil-leader/set-leader "\\")
    (evil-leader/set-key
      "fa" 'counsel-ag
      "e" 'find-file
      "hp" 'git-gutter:popup-hunk
      ;; Stage current hunk
      "hs" 'git-gutter:stage-hunk
      ;; Revert current hunk
      "hu" 'git-gutter:revert-hunk
      )
    (evil-leader/set-key-for-mode
      'emacs-lisp-mode "b" 'byte-compile-file
      )
    ;; (setq evil-leader/no-prefix-mode-rx '("magit-.*-mode" "gnus-.*-mode"))
    )

  
  (use-package evil-surround
    :config
    (global-evil-surround-mode))

  (use-package evil-indent-textobject)

  ;;  (use-package evil-search-highlight-persist
  ;;    :config
  ;;    (global-evil-search-highlight-persist t)
  ;;    ;; To only display string whose length is greater than or equal to 3
  ;;    ;; (setq evil-search-highlight-string-min-len 3)
  ;;    )
  (use-package evil-commentary
    :config
    (evil-commentary-mode)
    )
  (use-package evil-numbers)
  (use-package evil-collection
    :after evil
    :config
    (evil-collection-init)
    (evil-set-initial-state 'messages-buffer-mode 'normal)
    ;; (evil-set-initial-state 'dashboard-mode 'normal)

    (evil-set-initial-state 'calendar-mode 'emacs)
    )

  (use-package evil-org
    :after org
    :hook (org-mode . (lambda () evil-org-mode))
    :config
    (require 'evil-org-agenda)
    (evil-org-agenda-set-keys))

  (use-package sis
    ;; :hook
    ;; enable the /follow context/ and /inline region/ mode for specific buffers
    ;; (((text-mode prog-mode) . sis-context-mode)
    ;;  ((text-mode prog-mode) . sis-inline-mode))

    :config
    ;; For MacOS
    (sis-ism-lazyman-config

     "com.apple.keylayout.ABC"
     "im.rime.inputmethod.Squirrel.Rime")

    ;; enable the /cursor color/ mode
    (sis-global-cursor-color-mode t)
    ;; enable the /respect/ mode
    (sis-global-respect-mode t)
    ;; enable the /context/ mode for all buffers
    (sis-global-context-mode t)
    ;; enable the /inline english/ mode for all buffers
    ;; (sis-global-inline-mode t)
    )
  )

;; (define-key evil-motion-state-map "," nil)
;; (evil-define-key 'normal evil-commentary-mode-map
;;   ",c" 'evil-commentary)
;; (define-key evil-commentary-mode-map
;;   (kbd "M-;") 'evil-commentary-line)

(use-package company
  :init
  (setq company-require-match nil            ; Don't require match, so you can still move your cursor as expected.
        company-tooltip-align-annotations t  ; Align annotation to the right side.
        company-eclim-auto-save nil          ; Stop eclim auto save.
        company-dabbrev-downcase nil        ; No downcase when completion.
        company-idle-delay 0.5              ; 开始自动补全前的延迟秒数。输入前缀长度必须要满足 company-minimum-prefix-length，该值为 nil 表示没有延迟。
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case nil
        company-dabbrev-code-ignore-case t
        company-minimum-prefix-length 2 ; 补全的最小前缀长度
        company-backends
        '((company-files
           company-yasnippet
           company-keywords
           company-capf
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
  (use-package company-fuzzy
    :config
    (global-company-fuzzy-mode t)
    (setq company-fuzzy-sorting-backend 'alphabetic)
    (setq company-fuzzy-prefix-on-top t)
    (setq company-fuzzy-passthrough-backends '(company-capf))
    ;; Some backends doesn't allow me to get the list of candidates by passing the possible prefix; hence I have created this type of special scenario
    (add-to-list 'company-fuzzy-history-backends 'company-yasnippet)
    )
  )

(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (add-to-list (make-local-variable 'company-backends)
                                               'company-elisp)))
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "M-d") 'company-next-page)
  (define-key company-active-map (kbd "M-u") 'company-previous-page)
  (define-key company-active-map (kbd "C-u") nil)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

;; same as below
;;(dolist (mode '(ag-mode
;;		flycheck-error-list-mode
;;		git-rebase-mode))
;;  (add-to-list 'evil-emacs-state-modes mode))

;; (evil-add-hjkl-bindings recentf-dialog 'emacs
;;   (kbd "/")       'evil-search-forward
;;   (kbd "n")       'evil-search-next
;;   (kbd "N")       'evil-search-previous
;;   (kbd "C-d")     'evil-scroll-down
;;   (kbd "C-u")     'evil-scroll-up
;;   (kbd "C-w C-w") 'other-window)

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

;; (use-package parinfer-rust-mode
;;   :hook emacs-lisp-mode)

(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name))
  (kill-new (file-truename buffer-file-name))
  )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-done ((t (:strike-through t :foreground "#585858"))))
 '(org-headline-done ((t (:strike-through t :foreground "#585858"))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.3))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.25))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.2))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.15))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.1))))
 '(org-table ((t (:font "LXGW WenKai Mono")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(git-gutter:disabled-modes '(asm-mode image-mode))
 '(git-gutter:handled-backends '(git hg bzr svn))
 '(git-gutter:hide-gutter t)
 '(git-gutter:update-interval 0.2)
 '(git-gutter:window-width 1)
 '(package-selected-packages
   '(cal-china-x simpleclip which-key visual-fill-column use-package toc-org smex sis rainbow-delimiters paredit org-bullets org-appear markdown-mode magit ivy-rich ivy-posframe highlight helpful git-gutter-fringe general exec-path-from-shell evil-surround evil-org evil-numbers evil-leader evil-indent-textobject evil-commentary evil-collection doom-themes doom-modeline dashboard counsel-projectile company-fuzzy command-log-mode all-the-icons-dired ag ack)))

;; (load "~/.emacs.d/lisp/taskpaper2org.el")
