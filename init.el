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
;;;常に行数を表示する
(global-linum-mode t)
;;;行数表示のフォーマット
(setq linum-format "%4d")
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

;;文字コード
(set-face-attribute 'default nil
                  :family "Ricty"
                                     :height 160)
(set-fontset-font
 nil 'japanese-jisx0208
  (font-spec :family "Ricty"))

;;背景色
(set-face-background 'default "black")
(set-face-foreground 'default "green")

;;;anzu
(global-anzu-mode +1)

;;;git-gutter
(global-git-gutter-mode t)

