;;; Packages entry

(provide 'hl-package-entry)

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

;; MARK: Major mode
(require 'hl-dashboard)
(require 'hl-org)
(require 'hl-org-appear)
(require 'hl-org-bullets)
;; (require 'hl-org-modern)
(require 'hl-toc-org)
(require 'hl-markdown-mode)
(require 'hl-swift-mode)
(require 'hl-json-mode)
(require 'hl-magit)

;; MARK: UI
(require 'hl-doom-themes)
(require 'hl-doom-modeline)
(require 'hl-git-gutter)
(require 'hl-git-gutter-fringe)
;; (require 'hl-diff-hl)

(require 'hl-all-the-icons)
(require 'hl-all-the-icons-dired)
(require 'hl-highlight)

;; Functional
;; (require 'hl-exec-path-from-shell)
(require 'hl-undo-tree)
(require 'hl-cal-china-x)
(require 'hl-command-log-mode)
(require 'hl-evil)
(require 'hl-evil-leader)
(require 'hl-evil-indent-plus)
(require 'hl-evil-search-highlight-persist)
(require 'hl-evil-surround)
(require 'hl-evil-commentary)
(require 'hl-evil-numbers)
(require 'hl-evil-collection)
(require 'hl-evil-org)
(require 'hl-sis)
(require 'hl-which-key)
(require 'hl-helpful)
(require 'hl-general)
(require 'hl-simpleclip)

;; MAKR: Edit
(require 'hl-paredit)
(require 'hl-rainbow-delimiters)
(require 'hl-flx)
(require 'hl-company)
(require 'hl-company-fuzzy)

;; MARK: Fuzzy search
(require 'hl-ag)
(require 'hl-ack)
(require 'hl-ivy)
(require 'hl-ivy-rich)
(require 'hl-all-the-icons-ivy-rich)
;; (require 'hl-ivy-posframe)
(require 'hl-projectile)
(require 'hl-counsel)
(require 'hl-counsel-projectile)
