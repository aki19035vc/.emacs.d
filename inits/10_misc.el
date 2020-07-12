;;; スクロールの挙動のカスタマイズ
;; ウィンドウの大きさに応じて，スクロールの量を調節する
(setq scroll-conservatively 100)
;; (setq scroll-margin 1) ;スクロールマージン
;; (setq next-screen-context-lines 30)
(setq scroll-preserve-screen-position t) ;カーソル位置の保持

;; 対象ウィンドウの表示行に応じて，スクロール数を変更
(defun my/scroll-up-command()
  (interactive)
  (scroll-up-command (/ (window-height) 10)))
(defun my/scroll-down-command()
  (interactive)
  (scroll-down-command (/ (window-height) 10)))

(bind-keys
 ("C-v" . my/scroll-up-command)
 ("M-v" . my/scroll-down-command))


;; ウィンドウを分割した時に自動でリサイズするよう設定
(advice-add 'split-window-right :after 'balance-windows)
(advice-add 'split-window-below :after 'balance-windows)
(advice-add 'delete-window :after 'balance-windows)
