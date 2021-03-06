;;emacsの基本設定

(set-language-environment 'Japanese)
(set-terminal-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq coding-system-for-read 'mule-utf-8-unix)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8-unix)

;;;バックアップファイルを作成しない
(setq backup-inhibited t)
;;; 自動保存の無効
(setq auto-save-default nil)
;;;スタートのメッセージを表示しない
(setq inhibit-startup-message t)
;;;yes -> y
(defalias 'yes-or-no-p 'y-or-n-p)
;;;カッコの対をハイライト
(show-paren-mode t)
(setq show-paren-style 'mixed)
;;;カーソルの行をハイライト
(global-hl-line-mode t)

(custom-set-faces
 '(hl-line ((t (:background "color-233"))))
 )
;;;指定行への移動
(global-set-key "\C-x\C-g" 'goto-line)
;;;タブをスペース4つに置き換える
(setq-default tab-width 4 indent-tabs-mode nil)
;;;オートセーブファイルを消す
(setq delete-auto-save-files t)
;;;typoのチェック
(setq-default flyspell-mode t)
(setq ispell-dictionary "american")
;;; バッファの最後でnewlineで新規行を追加するのを禁止する
(setq next-line-add-newlines nil)
;;;スクロールを1行ずつにする
(setq scroll-step 1)

;; scratchの初期メッセージ消去
(setq initial-scratch-message "")

;;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)

;;;GCを減らして軽くする
(setq gc-cons-threshold (* 10 gc-cons-threshold))

;;ログの記録行数を増やす
(setq message-log-max 10000)

(require 'server)
(unless (server-running-p)
    (server-start))

(defalias 'exit 'save-buffers-kill-emacs)

(global-auto-revert-mode 1)

(global-linum-mode t)
(setq linum-format "%3d")

;; C-x C-c を打った際に確認を挟む
;;(defun my/kill-emacs-hook ()
;;  (let ((progress (read-string "進捗どうですか? " "ダメです")))
;;      (when (string-match-p "\\(?:ダメ\\|だめ\\|駄目\\)" progress)
;;            (error "作業してください"))))
;;(add-hook 'kill-emacs-hook 'my/kill-emacs-hook)
(define-key key-translation-map [?\C-h] [?\C-?])
(require 'cl)
