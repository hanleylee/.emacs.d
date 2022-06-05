(provide 'hl-func)

(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name))
  (kill-new (file-truename buffer-file-name))
  )

(defun hl-guard-file-exists(filePath)
   "Create a file with FILEPATH parameter if it isn't exists."
   (if (not (file-exists-p filePath))
     (with-temp-buffer (write-file filePath))))

(defun hl-guard-dir-exists(dirPath)
  "Create a dir with DIRPATH parameter if it isn't exists."
  (if (not (file-exists-p dirPath))
      (make-directory dirPath))
  )
