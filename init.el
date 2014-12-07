;;emacsの基本設定

;;;バックアップファイルを作成しない
(setq backup-inhibited t)
;;;スタートのメッセージを表示しない
(setq inhibit-startup-message t)
;;;yes -> y
(defalias 'yes-or-no-p 'y-or-n-p)
;;;カッコの対をハイライト
(show-paren-mode t)
;;;カーソルの行をハイライト
(global-hl-line-mode t)
;;;指定行への移動
(global-set-key "\C-x\C-g" 'goto-line)
;;;タブをスペース4つに置き換える
(setq-default tab-width 4 indent-tabs-mode nil)
;;;オートセーブファイルを消す
(setq delete-auto-save-files t)
;;;typoのチェック
(setq-default flyspell-mode t)
(setq ispell-dictionary "american")
;;; 最終行に必ず一行挿入する
(setq require-final-newline t)
;;; バッファの最後でnewlineで新規行を追加するのを禁止する
(setq next-line-add-newlines nil)
;;;スクロールを1行ずつにする
(setq scroll-step 1)

;;;package.elの設定
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


(set-face-background 'region "SkyBlue")
(set-face-foreground 'region "black")

;;;タブ,空白の設定
(require 'whitespace)

(setq whitespace-style '(face tabs tab-mark spaces space-mark lines-tail trailing space-before-tab space-after-tab::space))
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

;;文字コードの設定
(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
;;.zshrv 'export TERM=xterm-256color'
(load-theme 'zenburn t)
;;;anzu
(global-anzu-mode +1)

;;;git-gutter
(global-git-gutter-mode t)

(require 'e2wm)
(global-set-key (kbd "M-+") 'e2wm:start-management)

;;e2wm
(e2wm:add-keymap
 e2wm:pst-minor-mode-keymap
  '(("<M-left>" . e2wm:dp-code ) ; codeへ変更
    ("<M-right>"  . e2wm:dp-two) ; twoへ変更
    ("<M-up>"    . e2wm:dp-doc)  ; docへ変更
    ("<M-down>"  . e2wm:dp-dashboard) ; dashboardへ変更
    ("C-x ."       . e2wm:pst-history-forward-command) ; 履歴進む
    ("C-x ,"       . e2wm:pst-history-back-command) ; 履歴戻る
    ("C-M-s"     . e2wm:my-toggle-sub) ; subの表示をトグルする
    ("prefix L"  . ielm) ; ielm を起動する（subで起動する）
    ("M-m"       . e2wm:pst-window-select-main-command) ; メインウインドウを選択する
   ) e2wm:prefix-key)

(e2wm:add-keymap
 e2wm:dp-doc-minor-mode-map
 '(("prefix I" . info)) ; infoを起動する
 e2wm:prefix-key)

(defun e2wm:my-toggle-sub () ; Subをトグルする関数
  (interactive)
  (e2wm:pst-window-toggle 'sub t 'main))

;;;auto-complate
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)

;;;
(require 'helm-config)
(helm-mode 1)

;;;web-mode
(require 'web-mode)
;; 拡張子の設定
(add-to-list 'auto-mode-alist '("\\.ctp$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))
;; インデント関係
(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-html-offset   2)
  (setq web-mode-css-offset    2)
  (setq web-mode-script-offset 2)
  (setq web-mode-php-offset    4)
  (setq indent-tabs-mode t)
  (setq tab-width 4))
(add-hook 'web-mode-hook 'web-mode-hook)
;;;php-mode
(require 'flymake)
(eval-after-load 'flymake '(require 'flymake-cursor))
;; PHP用の設定
(require 'flymake-php)
(add-hook 'php-mode-hook 'flymake-php-load)

;; php-mode
(require 'php-mode)
(setq php-mode-force-psr t) ;psr規約のインデント設定にする
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode)) ;*.phpのファイルのときにphp-modeを自動起動する

(require 'smartparens-config)
(smartparens-global-mode t)


;;ruby-mode
(add-to-list 'load-path "(path-to)/Enhanced-Ruby-Mode") ; must be added after any path containing old ruby-mode
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

;; optional

(setq enh-ruby-program "/Users/shouhei/.rbenv/shims/ruby") ;

(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
(setq ruby-electric-expand-delimiters-list nil)

;; ruby-block.el --- highlight matching block
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)


;; rcodetools
(add-to-list 'load-path "~/.emacs.d/elpa")
(require 'rcodetools)
(setq rct-find-tag-if-available nil)
(defun ruby-mode-hook-rcodetools ()
  (define-key ruby-mode-map "\M-\C-i" 'rct-complete-symbol)
    (define-key ruby-mode-map "\C-c\C-t" 'ruby-toggle-buffer)
      (define-key ruby-mode-map "\C-c\C-f" 'rct-ri))
(add-hook 'ruby-mode-hook 'ruby-mode-hook-rcodetools)

(require 'drill-instructor)
(setq drill-instructor-global t)

(require 'popup-select-window)
(global-set-key "\C-xo" 'popup-select-window)


(autoload 'coffee-mode "coffee-mode" "Major mode for editing CoffeeScript." t)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(require 'server)
(unless (server-running-p)
    (server-start))

(defun my/kill-emacs-hook ()
    (let ((progress (read-string "進捗どうですか? " "ダメです")))
          (when (string-match-p "\\(?:ダメ\\|だめ\\|駄目\\)" progress)
                  (error "作業してください"))))
(add-hook 'kill-emacs-hook 'my/kill-emacs-hook)
(defalias 'exit 'save-buffers-kill-emacs)

(add-hook 'php-mode-hook
          (lambda ()
            (require 'php-completion)
            (php-completion-mode t)
            (define-key php-mode-map (kbd "C-o") 'phpcmp-complete) ;php-completionの補完実行キーバインドの設定
            (make-local-variable 'ac-sources)
            (setq ac-sources '(
                               ac-source-words-in-same-mode-buffers
                               ac-source-php-completion
                               ac-source-filename
                               ))))

(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

;; For find-file etc.
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
;; ;; For helm-find-files etc.
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)


(define-key global-map (kbd "M-x")     'helm-M-x)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)
(define-key global-map (kbd "M-y")     'helm-show-kill-ring)
(define-key global-map (kbd "C-c i")   'helm-imenu)
(define-key global-map (kbd "C-x b")   'helm-buffers-list)

(defun helm-select-2nd-action ()
    "Select the 2nd action for the currently selected candidate."
      (interactive)
        (helm-select-nth-action 1))

(defun helm-select-3rd-action ()
    "Select the 3rd action for the currently selected candidate."
      (interactive)
        (helm-select-nth-action 2))

(defun helm-select-4th-action ()
    "Select the 4th action for the currently selected candidate."
      (interactive)
        (helm-select-nth-action 3))

(defun helm-select-2nd-action-or-end-of-line ()
    "Select the 2nd action for the currently selected candidate.
  This happen when point is at the end of minibuffer.
  Otherwise goto the end of minibuffer."
      (interactive)
        (if (eolp)
                (helm-select-nth-action 1)
                    (end-of-line)))

(define-key helm-map (kbd "C-e")        'helm-select-2nd-action-or-end-of-line)
(define-key helm-map (kbd "C-j")        'helm-select-3rd-action)
(require 'undo-tree)
(global-undo-tree-mode)


;;;ローカルのみで動く、コードの修正
(global-auto-revert-mode 1)

(defun php-cs-fix ()
  (interactive)
  (setq filename (buffer-file-name (current-buffer)))
  (call-process "php-cs-fixer" nil nil nil "fix" filename )
  (revert-buffer t t)
  )

;; python-mode をロードする
(when (autoload 'python-mode "python-mode" "Python editing mode." t)

;; python-mode のときのみ python-pep8 のキーバインドを有効にする
(setq python-mode-hook
  (function (lambda ()
    (local-set-key "\C-c\ p" 'python-pep8))))

(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
  (setq interpreter-mode-alist (cons '("python" . python-mode)
                                                  interpreter-mode-alist)))

(require 'lcomp)
(lcomp-mode 1)

(require 'helm-config)
(require 'helm-gtags)

(add-hook 'web-mode-hook (lambda () (helm-gtags-mode)))
(add-hook 'python-mode-hook (lambda () (helm-gtags-mode)))
(add-hook 'ruby-mode-hook (lambda () (helm-gtags-mode)))
(add-hook 'php-mode-hook (lambda () (helm-gtags-mode)))

;; customize
(setq helm-c-gtags-path-style 'relative)
(setq helm-c-gtags-ignore-case t)

;; key bindings
(add-hook 'helm-gtags-mode-hook
          '(lambda ()
             (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
             (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
             (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
                               (local-set-key (kbd "C-t") 'helm-gtags-pop-stack)))
