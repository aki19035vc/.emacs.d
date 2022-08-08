(use-package expand-region
  :ensure t
  :defer t
  :bind
  (("C-M-@" . er/expand-region)))

(use-package smart-hungry-delete
  :ensure t
  :bind
  (("<backspace>" . smart-hungry-delete-backward-char)
   ("C-d" . smart-hungry-delete-forward-char))
  :config (smart-hungry-delete-add-default-hooks))

(use-package smartparens
  :ensure t
  :defer t
  :delight
  :custom
  (sp-highlight-pair-overlay nil)
  :init
  (use-package smartparens-config)
  (smartparens-global-mode t)
  )

(use-package undo-tree
  :ensure t
  :defer t
  :bind
  ("M-/" . undo-tree-redo)
  :config
  (global-undo-tree-mode t))

(use-package smart-jump
  :ensure t
  :config
  (smart-jump-setup-default-registers))

(use-package multiple-cursors
  :ensure t
  :defer t
  :bind
  (("C-M-." . mc/mark-next-like-this)
   ("C-M-," . mc/mark-previous-like-this))
  (:map ctrl-l-map
        ("C-c" . mc/edit-lines)
        ("C-." . mc/mark-all-like-this)))
