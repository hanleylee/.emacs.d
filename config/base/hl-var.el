(provide 'hl-var)

(setq hl-backup-dir (concat (getenv "XDG_CACHE_HOME") "/emacs/backup/"))
(hl-guard-dir-exists hl-backup-dir)

(setq hl-lock-dir (concat (getenv "XDG_CACHE_HOME") "/emacs/lock/"))
(hl-guard-dir-exists hl-lock-dir)

(setq hl-todo-dir (concat (getenv "HL_TODO")))
(hl-guard-dir-exists hl-todo-dir)

(setq hl-notes-file (concat (getenv "HKMS") "/notes.org"))
(hl-guard-file-exists hl-notes-file)

(setq hl-inbox-file (concat hl-todo-dir "/inbox.org"))
(hl-guard-file-exists hl-inbox-file)

