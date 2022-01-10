(use-package web-mode
  :ensure t
  :defer t
  :custom (web-mode-markup-indent-offset 2)
  :mode (("\\.erb\\'" . web-mode)))

(use-package css-mode
  :ensure t
  :defer t
  :custom
  (css-indent-offset 2))

(use-package scss-mode
  :ensure t
  :defer t
  :custom
  (css-indent-offset 2))

(use-package haml-mode
  :ensure t
  :defer t)

(use-package js-mode
  :defer t
  :custom
  (js-switch-indent-offset 2)
  (js-indent-level 2))

;; jade/pug
;; use-package使えなかった
(require 'yajade-mode)
(bind-keys :map yajade-mode-map
           ("C-j" . yajade-newline-and-indent)
           ("M-i" . yajade-unindent))
(setq-default tab-width 2 indent-tabs-mode nil)

;; vue
(use-package vue-mode
  :ensure t
  :defer t
  :custom
  (js-indent-level 2)
  (mmm-js-mode-enter-hook (lambda () (setq syntax-ppss-table nil)))
  (mmm-typescript-mode-enter-hook (lambda () (setq syntax-ppss-table nil)))
  (vue-modes '((:type template :name nil :mode vue-html-mode)
               (:type template :name html :mode vue-html-mode)
               (:type template :name jade :mode yajade-mode)
               (:type template :name pug :mode yajade-mode)
               (:type template :name slm :mode slim-mode)
               (:type template :name slim :mode slim-mode)
               (:type script :name nil :mode js-mode)
               (:type script :name js :mode js-mode)
               (:type script :name es6 :mode js-mode)
               (:type script :name babel :mode js-mode)
               (:type script :name coffee :mode coffee-mode)
               (:type script :name ts :mode typescript-mode)
               (:type script :name typescript :mode typescript-mode)
               (:type script :name tsx :mode typescript-tsx-mode)
               (:type style :name nil :mode css-mode)
               (:type style :name css :mode css-mode)
               (:type style :name stylus :mode stylus-mode)
               (:type style :name less :mode less-css-mode)
               (:type style :name postcss :mode css-mode)
               (:type style :name scss :mode css-mode)
               (:type style :name sass :mode ssass-mode)
               (:type i18n :name nil :mode json-mode)
               (:type i18n :name json :mode json-mode)
               (:type i18n :name yaml :mode yaml-mode)))
  :config
  (set-face-background 'mmm-default-submode-face nil)
  )
