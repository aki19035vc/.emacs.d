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
  (popwin:popup-window-position 'bottom)
  :config
  ;; magit
  (push '("*magit-edit-log*" :height 20) popwin:special-display-config)
  (push '("*magit-commit*" :height 20) popwin:special-display-config)
  (push '("*magit-diff*" :height 20) popwin:special-display-config)
  (push '(magit-status-mode :height 20) popwin:special-display-config)
  )
