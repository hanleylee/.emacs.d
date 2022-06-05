(provide 'hl-org)

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
  (setq org-capture-templates
        `(("t" "task" entry (file "~/repo/todo/agenda/inbox.org") "* TODO %?\nCaptured %<%Y-%m-%d %H:%M>") 
          ("n" "note" entry (file "~/repo/todo/notes.org") "* Note %<%Y-%m-%d %H:%M>\n%?")))

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
