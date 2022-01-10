(use-package ruby-mode
  :ensure t
  :custom
  (ruby-insert-encoding-magic-comment nil) ; ruby-modeにおけるマジックコメントの自動挿入を抑制
  (ruby-align-chained-calls t)
  )

(use-package go-mode :ensure t)

(use-package projectile-rails
  :ensure t
  :defer t
  :hook (ruby-mode . projectile-rails-mode)
  :bind
  (:map ctrl-l-map
        ("r c" . projectile-rails-find-controller)
        ("r m" . projectile-rails-model)
        ("r t" . projectile-rails-test)))
