;;; 何かを連打した時に動作する
(require 'sequential-command-config)
;;; C-aの連打でバッファの先頭
(global-set-key "\C-a" 'seq-home)
;;; C-eの連打でバッファの最後尾
(global-set-key "\C-e" 'seq-end)
