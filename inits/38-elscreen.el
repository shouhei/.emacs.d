;;; プレフィクスキーはC-z
(setq elscreen-prefix-key (kbd "C-z"))
(elscreen-start)
;;; タブの先頭に[X]を表示しない
(setq elscreen-tab-display-kill-screen nil)
;;; header-lineの先頭に[<->]を表示しない
(setq elscreen-tab-display-control nil)

(define-key global-map "\C-xk" 'elscreen-kill)
(global-set-key (kbd "C-x <right>") 'elscreen-next)
(global-set-key (kbd "C-x <left>") 'elscreen-previous)
(global-set-key (kbd "C-x C-<right>") 'elscreen-next)
(global-set-key (kbd "C-x C-<left>") 'elscreen-previous)
(global-set-key (kbd "C-x p") 'elscreen-next)
(global-set-key (kbd "C-x n") 'elscreen-previous)
(global-set-key (kbd "C-x C-p") 'elscreen-next)
(global-set-key (kbd "C-x C-n") 'elscreen-previous)
(global-set-key (kbd "C-c <left>") 'next-buffer)
(global-set-key (kbd "C-c <right>") 'previous-buffer)
(global-set-key (kbd "C-c C-<left>") 'next-buffer)
(global-set-key (kbd "C-c C-<right>") 'previous-buffer)

(defun temp-display-tab ()
  ;; 一定時間タブを表示
  (setq elscreen-display-tab t)
  (run-at-time "0.5 sec" nil
               #'(lambda ()
                   (setq elscreen-display-tab nil)
                   (elscreen-notify-screen-modification 'force))))

(advice-add 'elscreen-next :after #'temp-display-tab)
(advice-add 'elscreen-previous :after #'temp-display-tab)

(global-set-key (kbd "C-x %") 'split-window-horizontally)
(global-set-key (kbd "C-x \"") 'split-window-vertically)
