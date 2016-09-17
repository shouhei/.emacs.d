;;;タブ,空白の設定
(autoload 'whitespace "whitespace" nil t)

(setq whitespace-style '(face tabs tab-mark spaces space-mark lines-tail trailing space-before-tab space-after-tab::s\
pace))
(setq whitespace-space-regexp "\\(\x3000+\\)")
(setq whitespace-display-mappings
      '((space-mark ?\x3000 [?\□])
               (tab-mark   ?\t   [?\xBB ?\t])
                       ))
(global-whitespace-mode t)

(set-face-attribute 'whitespace-trailing nil
                    :foreground "DeepPink"
                                        :underline t)
(set-face-attribute 'whitespace-tab nil
                    :foreground "LightSkyBlue"
                                        :underline t)
(set-face-attribute 'whitespace-space nil
                    :foreground "GreenYellow"
                                        :weight 'bold)
