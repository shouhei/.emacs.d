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

; web-mode
(require 'web-mode)
;; 拡張子の設定
(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))
;; インデント関係
(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-html-offset   4)
  (setq web-mode-css-offset    4)
  (setq web-mode-script-offset 4)
  (setq web-mode-php-offset    4)
  (setq web-mode-java-offset   4)
  (setq web-mode-asp-offset    4)
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

(setq php-mode-force-pear t) ;PEAR規約のインデント設定にする
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode)) ;*.phpのファイルのときにphp-modeを自動起動する
