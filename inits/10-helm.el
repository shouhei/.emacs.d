(require 'helm-config)
(helm-mode 1)
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

;; For find-file etc.
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
;; ;; For helm-find-files etc.
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)


(define-key global-map (kbd "M-x")     'helm-M-x)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)
(define-key global-map (kbd "M-y")     'helm-show-kill-ring)
(define-key global-map (kbd "C-c i")   'helm-imenu)
(define-key global-map (kbd "C-x b")   'helm-buffers-list)

(defun helm-select-2nd-action ()
  "Select the 2nd action for the currently selected candidate."
  (interactive)
  (helm-select-nth-action 1))

(defun helm-select-3rd-action ()
  "Select the 3rd action for the currently selected candidate."
  (interactive)
  (helm-select-nth-action 2))

(defun helm-select-4th-action ()
  "Select the 4th action for the currently selected candidate."
  (interactive)
  (helm-select-nth-action 3))

(defun helm-select-2nd-action-or-end-of-line ()
      "Select the 2nd action for the currently selected candidate.
  This happen when point is at the end of minibuffer.
  Otherwise goto the end of minibuffer."
      (interactive)
      (if (eolp)
          (helm-select-nth-action 1)
        (end-of-line)))

(define-key helm-map (kbd "C-e")        'helm-select-2nd-action-or-end-of-line)
(define-key helm-map (kbd "C-j")        'helm-select-3rd-action)
