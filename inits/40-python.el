(with-eval-after-load "python"
  (define-key python-mode-map (kbd "C-c C-d") 'helm-pydoc))
(autoload 'python-mode "python-mode" "Python editing mode." t)
(custom-set-variables
  '(py-indent-offset 4)
)
(add-hook 'python-mode-hook
  '(lambda()
    (setq tab-width 4)
    (setq indent-tabs-mode nil)
  )
)
