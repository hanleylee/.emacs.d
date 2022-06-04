(add-to-list 'load-path "~/.emacs.d/config/") ; only add that path to load-path
(let ((default-directory "~/.emacs.d/config/")) ; add its all subdir to load-path 
  (normal-top-level-add-subdirs-to-load-path))

(require 'hl-func)
(require 'hl-var)
(require 'hl-option)
(require 'hl-package-entry)
(require 'hl-keymap)
(require 'hl-hook)
