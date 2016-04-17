(setenv "GOROOT" "/usr/local/opt/go/libexec")
(setenv "GOPATH" (concat (getenv "HOME") "/WorkSpace/sample/go"))

(require 'go-autocomplete)
(require 'auto-complete-config)

(add-hook 'go-mode-hook (lambda ()
                          (setq gofmt-command "goimports")
                          (add-hook 'before-save-hook 'gofmt-before-save)
                          (set (make-local-variable 'compile-command)
                               "go build -v && go test -v && go vet")
                          (local-set-key (kbd "M-.") 'godef-jump))
                          (go-eldoc-setup)
          )

; セーブした時にgofmtを実行する
(add-hook 'before-save-hook 'gofmt-before-save)

