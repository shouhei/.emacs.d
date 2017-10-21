(require 'undohist)
(undohist-initialize)
(use-package undohist
  :ensure t
  :config
  (setq undohist-ignored-files '("/tmp" "COMMIT_EDITMSG"))
  (undohist-initialize)
  )
