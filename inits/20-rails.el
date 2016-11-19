;; Setting rbenv path
;; emacs から rbenv でいれた Ruby を利用する.
(setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:"
             (getenv "HOME") "/.rbenv/bin:" (getenv "PATH")))
(setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims")
      (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))
(add-to-list 'auto-mode-alist '("\\.rb$latex " . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.erb$latex " . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$". ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

(autoload 'flycheck "flycheck" nil t)
(setq flycheck-check-syntax-automatically '(mode-enabled save))
(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq flycheck-checker 'ruby-rubocop)
             (flycheck-mode 1)))

(add-hook 'ruby-mode-hook 'show-smartparens-mode)
(autoload 'rspec-mode "rspec-mode" nil t)
(autoload 'robe-mode "robe" "Code navigation, documentation lookup and completion for Ruby" t nil)
(autoload 'ac-robe-setup "ac-robe" "auto-complete robe" nil nil)
(add-hook 'robe-mode-hook 'ac-robe-setup)
(setq ruby-insert-encoding-magic-comment nil)
