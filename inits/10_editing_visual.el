;; 現在行をハイライト
(global-hl-line-mode t)

;; 対応する括弧をハイライト
(show-paren-mode t)
;; 括弧のハイライトの設定
;; (setq show-paren-style 'mixed)

(use-package highlight-parentheses
  :ensure t
  :defer t
  :config
  (highlight-parentheses-mode t))

;; 選択範囲をハイライト
(transient-mark-mode t)

;; 数値リテラルをハイライト
(use-package highlight-numbers
  :ensure t
  :defer t
  :init
  (progn
    (add-hook 'prog-mode-hook 'highlight-numbers-mode)
    (add-hook 'asm-mode-hook (lambda () (highlight-numbers-mode -1)))))

;; インデントをリッチにハイライト
(use-package highlight-indent-guides
  :ensure t
  :defer t
  :delight
  :hook
  ((prog-mode
    yaml-mode
    org-mode
    ) . highlight-indent-guides-mode)
  :commands (highlight-indent-guides-mode)
  :custom
  (highlight-indent-guides-auto-enabled t)
  (highlight-indent-guides-responsive t)
  (highlight-indent-guides-method 'character)
  :config
  )

;; 括弧がレインボーになる
(use-package rainbow-delimiters
  :ensure t
  :defer t
  :delight
  :hook
  (prog-mode . rainbow-delimiters-mode)
  :commands
  (rainbow-delimiters-mode))

;; yank(貼り付け)やundoした時にハイライトしてくれる
(use-package volatile-highlights
  :ensure t
  :defer t
  :delight
  :commands
  (volatile-highlights-mode)
  :hook
  (after-init . volatile-highlights-mode))


;; whitespace
(use-package whitespace
  :ensure t
  :delight
  :init
  (global-whitespace-mode 1)
  (setq whitespace-style '(face           ; faceで可視化
                           trailing       ; 行末
                           ;; tabs           ; タブ
                           spaces         ; スペース
                           empty          ; 先頭/末尾の空行
                           space-mark     ; 表示のマッピング
                           ;; tab-mark
                           ))
  (setq whitespace-display-mappings
        '((space-mark ?\u3000 [?\u25a1])
          ;; WARNING: the mapping below has a problem.
          ;; When a TAB occupies exactly one column, it will display the
          ;; character ?\xBB at that column followed by a TAB which goes to
          ;; the next TAB column.
          ;; If this is a problem for you, please, comment the line below.
          (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

  ;; スペースは全角のみを可視化
  (setq whitespace-space-regexp "\\(\u3000+\\)")

  ;; ;; 保存前に自動でクリーンアップ
  ;; (setq whitespace-action '(auto-cleanup))

  (global-whitespace-mode 1)

  (defvar my/bg-color "powderblue")
  (set-face-attribute 'whitespace-trailing nil
                      :background my/bg-color)
  (set-face-attribute 'whitespace-tab nil
                      :background my/bg-color)
  (set-face-attribute 'whitespace-space nil
                      :background my/bg-color)
  (set-face-attribute 'whitespace-empty nil
                      :background my/bg-color)
  )
