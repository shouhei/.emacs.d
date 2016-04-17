(require 'open-junk-file)
(defun open-junk-file ()
  (interactive)
  (let* ((file (expand-file-name
                (format-time-string
                 "%Y-%m-%d-%H%M%S." (current-time))
                "~/Workspace/junk/"))
         (dir (file-name-directory file)))
    (make-directory dir t)
    (find-file-at-point (read-string "Junk Code: " file))))
(global-set-key "\C-xj" '(lambda () (interactive) (elscreen-create) (open-junk-file)))
