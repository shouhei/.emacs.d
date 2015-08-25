;;.zshrv 'export TERM=xterm-256color'

(set-face-background 'region "SkyBlue")
(set-face-foreground 'region "black")

(when window-system
  ;; tool-barを非表示
  (tool-bar-mode 0)
  ;; scroll-barを非表示
  (scroll-bar-mode 0)
  (load-theme 'dracula t)
  ;; Mac用フォント設定
  ;; http://tcnksm.sakura.ne.jp/blog/2012/04/02/emacs/

  ;; 英語
  (set-face-attribute 'default nil
                      :family "Ricty Diminished Discord" ;; font
                      :height 150)    ;; font size

  ;; 日本語
  (set-fontset-font
   nil 'japanese-jisx0208
   (font-spec :family "Ricty Diminished")) ;; font

  ;; 半角と全角の比を1:2にしたければ
  (setq face-font-rescale-alist
        ;;        '((".*Hiragino_Mincho_pro.*" . 1.2)))
              '((".*Ricty Diminished.*" . 1.2)));; Mac用フォント設定
)

;; CocoaEmacs以外はメニューバーを非表示
(unless (eq window-system 'ns)
  (load-theme 'zenburn t)
)
