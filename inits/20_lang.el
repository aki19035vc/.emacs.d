(use-package ruby-mode
  :ensure t
  :defer t
  :custom
  (ruby-insert-encoding-magic-comment nil) ; ruby-modeにおけるマジックコメントの自動挿入を抑制
  (ruby-align-chained-calls t)
  )

(use-package rbs-mode
  :ensure t
  :defer t)

(use-package go-mode
  :ensure t
  :defer t)

(use-package projectile-rails
  :ensure t
  :defer t
  :hook (ruby-mode . projectile-rails-mode)
  :bind
  (:map ctrl-l-map
        ("r c" . projectile-rails-find-controller)
        ("r m" . projectile-rails-model)
        ("r t" . projectile-rails-test)))

(use-package protobuf-mode
  :ensure t
  :defer t)

(use-package scala-mode
  :ensure t
  :defer t)

(use-package typescript-mode
  :ensure t
  :defer t)

;; see: https://github.com/syohex/emacs-digdag-mode
(use-package yajade-mode
  :defer t
  :mode (("\\.dig\\'" . yajade-mode)))
