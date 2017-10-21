(autoload 'haskell-mode "haskell-mode" nil t)

(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'font-lock-mode)

(add-hook 'haskell-mode-hook (lambda () (flymake-mode)))
(add-hook 'haskell-mode-hook 'intero-mode)
