;; グローバル
(bind-keys
 ("C-j" . newline-and-indent)) ; 改行後，インデントを行う

(bind-keys*
 ;; ("C-j" . newline-and-indent) ; 改行後，インデントを行う
 ("C-h" . delete-backward-char) ; C-hをバックスペースに
 ("M-8" . switch-to-prev-buffer) ; バッファ移動
 ("M-9" . switch-to-next-buffer) ; バッファ移動
 ([?¥] . [?\\])) ; ¥の代わりにバックスラッシュを入力する

;; ウィンドウ移動のキーバインドを設定
(bind-keys
 ("C-M-j" . windmove-left)
 ("C-M-l" . windmove-right)
 ("C-M-i" . windmove-up)
 ("C-M-k" . windmove-down))


;; Ctrl-lマップ
(bind-keys
 ;; :prefix-map ctrl-l-map
 ;; :prefix "C-l"
 :map ctrl-l-map
 ("0" . delete-window)
 ("1" . delete-other-windows)
 ("2" . split-window-below)
 ("3" . split-window-right)
 ("C-f" . counsel-find-file)
 ("C-b" . ivy-switch-buffer)
 ("C-r" . counsel-recentf)
 ("C-s" . swiper)
 ("C-p" . counsel-projectile-find-file)
 ("C-m" . magit-status)
 ;; window関連
 ("C-w m" . maximize-window)
 ("C-w u" . winner-undo)
 ("C-w r" . winner-redo))

;; よくわからんやつを消す
;; (define-key override-global-map (kbd "C-u") nil)
;; (bind-keys
;;  ("C-u" . nil))
