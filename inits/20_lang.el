(use-package ruby-mode
  :ensure t
  :custom
  (ruby-insert-encoding-magic-comment nil) ; ruby-modeにおけるマジックコメントの自動挿入を抑制
  (ruby-align-chained-calls t)
  )

;; (use-package enh-ruby-mode
;;   :ensure t
;;   :defer t
;;   :custom
;;   (ruby-insert-encoding-magic-comment nil) ; ruby-modeにおけるマジックコメントの自動挿入を抑制
;;   (ruby-align-chained-calls t)
;; (ruby-deep-indent-paren nil) ; インデントを空白2つ
;; (enh-ruby-hanging-indent-level 0)
;; (enh-ruby-comment-column 32)
;; (enh-ruby-bounce-deep-indent t)
;; (enh-ruby-deep-indent-paren t)
;; (enh-ruby-hanging-brace-deep-indent-level 1)
;; (enh-ruby-hanging-brace-indent-level 2)
;; (enh-ruby-hanging-indent-level 2)
;; (enh-ruby-hanging-paren-deep-indent-level 0)
;; (enh-ruby-hanging-paren-indent-level 2)
;; (enh-ruby-indent-level 2)
;; :hook (ruby-mode . enh-ruby-mode))

(use-package projectile-rails
  :ensure t
  :defer t
  :hook (ruby-mode . projectile-rails-mode))

(use-package yaml-mode
  :ensure t)
