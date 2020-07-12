(use-package expand-region
  :ensure t
  :defer t
  :bind
  (("M-@" . er/expand-region)
   ("C-M-@" . er/contract-region)))

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
