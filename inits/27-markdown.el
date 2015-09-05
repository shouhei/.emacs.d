(require 'w3m)
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(defun w3m-browse-url-other-window (url &optional newwin)
  (let ((w3m-pop-up-windows t))
    (if (one-window-p) (split-window))
    (other-window 1)
    (w3m-browse-url url newwin)
  )
)

(defun markdown-render-w3m (n)
  (interactive "p")
  (message (buffer-file-name))
  (call-process "~/.pyenv/shims/grip" nil nil nil
                "--gfm" "--export"
                (buffer-file-name)
                "/tmp/grip.html")
  (w3m-browse-url-other-window "file://tmp/grip.html")
)

(define-key markdown-mode-map "\C-c\C-c" 'markdown-render-w3m)
