(add-to-list 'auto-mode-alist '("\\.rb$latex " . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
(setq ruby-electric-expand-delimiters-list nil)

;; ruby-block.el --- highlight matching block
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

(require 'rubocop)
(add-hook 'ruby-mode-hook 'rubocop-mode)

(require 'flycheck)
(setq flycheck-check-syntax-automatically '(mode-enabled save))
(add-hook 'ruby-mode-hook 'flycheck-mode)

(flycheck-define-checker ruby-rubocop
  "A Ruby syntax and style checker using the RuboCop tool."
  :command ("rubocop" "--format" "emacs" "--silent"
            (config-file "--config" flycheck-rubocoprc)
            source)
  :error-patterns
  ((warning line-start
            (file-name) ":" line ":" column ": " (or "C" "W") ": " (message)
            line-end)
   (error line-start
          (file-name) ":" line ":" column ": " (or "E" "F") ": " (message)
          line-end))
     :modes (enh-ruby-mode motion-mode))

;; definition for flycheck
(flycheck-define-checker ruby-rubylint
  "A Ruby syntax and style checker using the rubylint tool."
  :command ("ruby-lint" source)
  :error-patterns
  ((warning line-start
            (file-name) ":" line ":" column ": " (or "C" "W") ": " (message)
            line-end)
   (error line-start
          (file-name) ":" line ":" column ": " (or "E" "F") ": " (message)
          line-end))
    :modes (enh-ruby-mode ruby-mode))
