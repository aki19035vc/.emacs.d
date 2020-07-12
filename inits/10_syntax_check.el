(use-package flycheck
  :ensure t
  :defer t
  :hook
  (emacs-lisp-mode . flycheck-mode)
  :custom
  (flycheck-disabled-checkers '(emacs-lisp-checkdoc)))
