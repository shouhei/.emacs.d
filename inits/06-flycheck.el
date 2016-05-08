(add-hook 'after-init-hook #'global-flycheck-mode)
;(require 'popup)
;(require 'flycheck-tip)
;(defconst error-tip-timer-delay 0.1)
(setq flycheck-display-errors-function
      '(lambda (errors)
               (-when-let (messages (-keep #'flycheck-error-message errors))
                          (popup-tip (s-join "\n\n" messages)))))
(eval-after-load 'flycheck
  '(custom-set-variables
    '(flycheck-disabled-checkers '(javascript-jshint javascript-jscs))
    ))
