;;e2wm
(autoload 'e2wm "e2wm" nil t)
(global-set-key (kbd "M-+") 'e2wm:start-management)

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
