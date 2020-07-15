(use-package ruby-mode
  :ensure t
  :custom
  (ruby-insert-encoding-magic-comment nil) ; ruby-modeにおけるマジックコメントの自動挿入を抑制
  (ruby-align-chained-calls t)
  )

(use-package projectile-rails
  :ensure t
  :defer t
  :hook (ruby-mode . projectile-rails-mode))
