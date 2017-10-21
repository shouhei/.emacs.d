;;.zshrv 'export TERM=xterm-256color'

(when window-system
  ;; tool-barを非表示
  (tool-bar-mode 0)
  ;; scroll-barを非表示
  (scroll-bar-mode 0)
  ;; Mac用フォント設定
  ;; http://tcnksm.sakura.ne.jp/blog/2012/04/02/emacs/

  ;; 英語
  (set-face-attribute 'default nil
                      :family "Ricty Diminished Discord" ;; font
                      :height 160)    ;; font size

  ;; 日本語
  (set-fontset-font
   nil 'japanese-jisx0208
   (font-spec :family "Ricty Diminished Discord")) ;; font
  (load-theme 'django t)
  (set-cursor-color white)
)
(unless (eq window-system 'ns)
  (load-theme 'spacemacs-dark t)
)
