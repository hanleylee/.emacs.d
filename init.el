(setq hl-emacs-config-dir (concat user-emacs-directory "config/"))

(add-to-list 'load-path hl-emacs-config-dir) ; only add that path to load-path
(let ((default-directory hl-emacs-config-dir)) ; add its all subdir to load-path 
  (normal-top-level-add-subdirs-to-load-path))
;; (load (concat user-emacs-directory "pre-init.el"))

(require 'hl-func)
(require 'hl-var)
(require 'hl-option)
(require 'hl-package-entry)
(require 'hl-keymap)
(require 'hl-hook)
