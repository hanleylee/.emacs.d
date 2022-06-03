;; taskpaper2org.el --- Convert a taskpaper file to an org file -*- lexical-binding: t -*-

;; Author: Edward Minnix <egregius313@gmail.com>
;; URL: https://gitlab.com/emacsos/taskpaper2org
;; Keywords: convenience
;; Version: 0.0.1
;; Package-Requires: ((emacs "25") (s "1.9.0") (dash "2.6.0"))

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:

;; Converter from the plaintext file format used by the TaskPaper
;; task-tracking application to Orgmode entries.

;;; Code:
(require 'org)

(require 'dash)
(require 's)

(defun taskpaper-importer-classify-line ()
  "Determine which type of line the current line is.

Lines can be classified as project, task, or note.

Projects are returned as (project . project-name).
Tasks are returned as (task depth . title-and-tags)
Notes are returned as (note depth . content)
"
  (block nil
    (save-excursion
      (beginning-of-line)
      ;; If the line is a non-whitespace followed by anything and
      ;; ending in a ':', then it is considered a project
      (when (looking-at (rx symbol-start alnum (* anything) ":" line-end))
        ;; Get the project's name, which is the line except for the
        ;; last character
        (let ((project-name (buffer-substring-no-properties
                             (line-beginning-position)
                             (1- (line-end-position)))))
          (return `(project . ,project-name))))

      (let ((depth 0))
        ;; Figure out the depth of the task/note
        (while (looking-at "\t")
          (incf depth)
          (forward-char))
        ;; If the line begins with a dash, then it's a task
        (when (looking-at "- ")
          (forward-char 2)
          (return
           `(task ,depth . ,(buffer-substring-no-properties (point) (line-end-position)))))
        ;; Otherwise, treat it as a note
        (return `(note ,depth . ,(buffer-substring-no-properties (point) (line-end-position))))))))


(defun taskpaper-importer-parse-task (task)
  (let ((tag (rx "@" (group (+ alnum)) (opt "(" (group (* (not (any ")")))) ")"))))
    (let* ((tag-info (s-match-strings-all tag task))
           (replacements (--map (cons (car it) "") tag-info))
           (title)
           (priority)
           (todo)
           (deadline)
           (tags))
      (setf title (if tag-info
                      (->> task
                           (s-replace-all replacements)
                           (s-trim)
                           (s-replace-regexp (rx (+ whitespace)) " "))
                    task))
      (cl-loop for tag in tag-info
               for tag-name = (cadr tag)
               for content = (caddr tag)
               do (pcase tag-name
                    ("priority"
                     (pcase content
                       ("1" (setf priority "A"))
                       ("2" (setf priority "B"))
                       ("3" (setf priority "C"))))
                    ("due"
                     (setf todo "TODO")
                     (when content
                       (setf deadline content)))
                    ("done"
                     (setf todo "DONE"))
                    (t (cl-pushnew tag-name tags))))
      (list :title title
            :tags tags
            :priority priority
            :todo todo
            :deadline deadline))))


(defun taskpaper2org-import-to-org (taskpaper org)
  (interactive
   (list
    (read-file-name "Taskpaper file: ")
    (read-file-name "Orgmode file: ")))
  (with-current-buffer (find-file-noselect taskpaper)
    (save-excursion
      (beginning-of-buffer)
      (block nil
        (while t
          (let ((classification (taskpaper-importer-classify-line)))
            (with-current-buffer (find-file-noselect org)
              (pcase classification
                (`(project . ,project-name)
                 (end-of-buffer)
                 (insert "* ")
                 (insert project-name)
                 (newline))
                (`(task ,depth . ,content)
                 (end-of-buffer)
                 (let* ((task-info (taskpaper-importer-parse-task content))
                        (title (plist-get task-info :title))
                        (tags (plist-get task-info :tags))
                        (priority (plist-get task-info :priority))
                        (todo (plist-get task-info :todo))
                        (deadline (plist-get task-info :deadline)))
                   (insert
                    (concat (s-repeat (1+ depth) "*")
                            " "
                            (when todo (concat todo " "))
                            (when priority (concat "[#" priority "] "))
                            title))
                   (org-set-tags tags)
                   (when deadline
                     (org-deadline nil deadline))
                   (end-of-buffer)
                   (newline)))
                (`(note ,depth . ,content)
                 (end-of-buffer)
                 (insert content)
                 (newline))))
            (when (= (forward-line) 1)
              (return)))))
      (with-current-buffer (find-file-noselect org)
        (save-buffer)))))


(provide 'taskpaper2org)
