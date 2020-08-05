(use-package flycheck
  :ensure t
  :defer t
  :hook
  ((emacs-lisp-mode js-mode js2-mode vue-mode css-mode) . flycheck-mode)
  :custom
  (flycheck-display-errors-delay 0)
  (flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  (flycheck-add-mode 'javascript-eslint 'vue-mode)
  )

(use-package flycheck-posframe
  :ensure t
  :hook (flycheck-mode . flycheck-posframe-mode)
  :custom-face
  (flycheck-posframe-face ((t (:background "#5e5079" :foreground "white")))))
