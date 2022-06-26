;; シェルの環境変数を引き継ぐためのパッケージ
(use-package exec-path-from-shell
  :ensure t
  :init
  (exec-path-from-shell-initialize))

;; 起動メッセージの非表示
(setq inhibit-startup-message t)

;; 文字コードの指定
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;; 音消去
(setq ring-bell-function 'ignore)

;; コピー/ペーストをクリップボードで行う設定
(setq select-enable-clipboard t)

;; 自動バックアップを無効
(setq make-backup-files nil)
(setq create-lockfiles nil)
(setq auto-save-default nil)

;; which-key
(use-package which-key
  :ensure t
  :defer t
  :delight
  :hook (after-init . which-key-mode))

;; winer-mode
(winner-mode t)

;; gitクライアント
(use-package magit
  :ensure t
  :defer t
  :delight
  :commands (magit-status)
  )

;; popwin
(use-package popwin
  :ensure t
  :defer t
  :hook (after-init . popwin-mode)
  :custom
  (popwin:popup-window-position 'bottom))

;; C-l マップを定義
(define-prefix-command 'ctrl-l-map)
(global-set-key (kbd "C-l") 'ctrl-l-map)
