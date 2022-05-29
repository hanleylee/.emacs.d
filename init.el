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
(setq default-fill-column 150)
;; 默认 major-mode 为 text-mode
(setq default-major-mode 'text-mode)
(column-number-mode)

;; (desktop-save-mode 1)
(setq desktop-path '("~/.cache/emacs/"))
;;(desktop-read)

(show-paren-mode t)
(setq show-paren-style 'parenthesses)
;;显示语法高亮

(global-font-lock-mode t)
(global-hl-line-mode)
(blink-cursor-mode 0)
(winner-mode t)
(windmove-default-keybindings)

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
;;(set-default 'cursor-type 'hbar)
(setq org-directory "~/org/")
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
;;按ALT+/ 键进行补全
(global-set-key (kbd "M-/") 'hippie-expand)
;;一个好用的minibuffer插件ido，许多插件都基于它。
(ido-mode t)
(setq ido-enable-flex-matching t)
;; ;;设置窗口位置为左上角(0,0)
;; (set-frame-position (selected-frame) 0 0)
;; ;;设置宽和高
;; (set-frame-width (selected-frame) 110)

;; (set-frame-height (selected-frame) 103)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
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

(use-package paredit
  :config
  (paredit-mode))

(column-number-mode)
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)
;; Disable line number for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 9))))


(use-package command-log-mode)

;; MARK: doom-theme
(use-package doom-themes
  :ensure t
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
  (doom-themes-org-config))

;; save commnad history
(use-package smex
  :defines smex-save-file
  :config
  (setq smex-history-length 15)
  (smex-initialize))

;; switch themes
(define-key emacs-lisp-mode-map (kbd "C-x M-t") 'counsel-load-theme)

(use-package all-the-icons
  :ensure t)
(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode)
  :config
  (setq all-the-icons-dired-monochrome nil))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

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
    :global-prefix "C-SPC"))

(rune/leader-keys
  "t" '(:ignore t :which-key "toggles")
  "tt" '(counsel-load-theme :which-key "choose theme")
  "C-h" '(counsel-buffer-or-recentf :which-key "recentf or buffer")
  "C-f" '(counsel-projectile-find-file :which-key "project file")
  "C-b" '(counsel-switch-buffer :which-key "buffer")
  "fa" '(counsel-ag :which-key "ag")
  )

(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))
  )

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

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 2.0)
                  (org-level-2 . 1.5)
                  (org-level-3 . 1.3)
                  (org-level-4 . 1.2)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "LXGW WenKai Mono" :weight 'regular :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)
  )

(use-package org
  ;; :hook (org-mode . efs/org-mode-setup)
  :config
  (setq org-ellipsis " ...")
  (add-to-list 'auto-mode-alist  '("\\.org\\'" . org-mode))
  (setq truncate-lines nil)
  (setq org-src-fontify-natively t)
  (setq org-todo-keywords '((sequence "TODO(t)" "DOING(i)" "|" "DONE(d)" "ABORT(a)")))
  (setq org-todo-keywords-faces '(("TODO" . "red")
                                  ("DOING" . "yellow")
                                  ("DONE" . "green")))
  (setq org-use-fast-todo-selection t)
  (efs/org-font-setup)
  )

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . efs/org-mode-visual-fill))

;;; Markdown
(use-package markdown-mode
  :ensure t
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
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/repo/hkms/")
    (setq projectile-project-search-path '("~/repo/hkms/")))
  (setq projectile-switch-prject-action #'projectile-dired))

(use-package counsel
  :config
  (setq counsel-yank-pop-preselect-last t)
  :bind (("M-x" . counsel-M-x)
         ("C-x C-b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         ("C-x C-h" . counsel-buffer-or-recentf)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history)))

(use-package counsel-projectile
  :config (counsel-projectile-mode))

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
  (setq evil-want-C-i-jump nil)
  (setq evil-want-C-w-delete t)
  ;; :hook (evil-mode . evil-hook)
  :config
  (evil-mode 1)

  (setq x-select-enable-clipboard nil)
  (define-key evil-normal-state-map  (kbd "s-v") (kbd "\"+p"))
  (define-key evil-insert-state-map  (kbd "s-v") (kbd "C-r +"))
  (define-key evil-visual-state-map  (kbd "s-c") (kbd "\"+y"))
  (define-key evil-ex-completion-map (kbd "s-v") (kbd "C-r +"))
  (define-key evil-ex-search-keymap  (kbd "s-v") (kbd "C-r +"))
  

  (evil-set-undo-system 'undo-redo)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
  (define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
  (define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)

  (define-key evil-normal-state-map (kbd "-") 'dired-jump)
  (define-key evil-normal-state-map (kbd "C-S-a") 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "C-S-x") 'evil-numbers/dec-at-pt)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal)

  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode))
  
  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))

  (use-package evil-indent-textobject
    :ensure t)

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
    (evil-collection-init))

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
    (sis-global-inline-mode t))

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
        tab-always-indent 'complete
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case nil
        company-dabbrev-code-ignore-case t
        company-minimum-prefix-length 2 ; 补全的最小前缀长度
        company-backends
        '((company-files
           company-yasnippet
           company-keywords
           company-capf
           company-xcode
           )
          (company-abbrev company-dabbrev)))
  :ensure t
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
(global-set-key "\C-cg" 'show-file-name)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mini-frame-show-parameters '((top . 0) (width . 1.0) (left . 0.5) (height . 15)))
 '(package-selected-packages
   '(emacs-mini-frame which-key visual-fill-column use-package unicode-fonts smex simpleclip rainbow-delimiters parinfer-rust-mode paredit org-bullets markdown-mode magit ivy-rich ivy-posframe helpful helm general exec-path-from-shell evil-visualstar evil-surround evil-search-highlight-persist evil-numbers evil-leader evil-indent-textobject evil-commentary evil-collection doom-modeline counsel-projectile company-fuzzy command-log-mode atom-one-dark-theme all-the-icons-dired ag ack)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
