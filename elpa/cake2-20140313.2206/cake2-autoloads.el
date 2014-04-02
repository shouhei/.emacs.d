;;; cake2-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (cake2-snippets-initialize cake2) "cake2" "cake2.el"
;;;;;;  (21307 23611 0 0))
;;; Generated autoloads from cake2.el

(autoload 'cake2 "cake2" "\
CakePHP2 minor mode.

\(fn &optional ARG)" t nil)

(when (fboundp 'define-global-minor-mode) (define-global-minor-mode global-cake2 cake2 cake2-maybe :group 'cake2))

(autoload 'cake2-snippets-initialize "cake2" "\


\(fn)" nil nil)

(eval-after-load 'yasnippet '(cake2-snippets-initialize))

;;;***

;;;### (autoloads nil nil ("cake-auto-switch.el" "cake2-pkg.el")
;;;;;;  (21307 23611 838231 0))

;;;***

(provide 'cake2-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; cake2-autoloads.el ends here
