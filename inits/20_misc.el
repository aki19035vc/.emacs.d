;; shell-script
(use-package shell-mode
  :defer t
  :custom
  (sh-basic-offset 2)
  (sh-indentation 2))

;; org
(use-package org-mode
  :defer t
  :init
  (custom-set-faces
   '(org-level-1 ((t (:inherit outline-1 :height 1.0))))
   '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
   '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
   '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
   '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))
  )

;; markdown
(use-package markdown-mode
  :ensure t
  :defer t
  :custom-face
  (markdown-header-face-1 ((t (:weight bold :height 1.0))))
  (markdown-header-face-2 ((t (:weight bold :height 1.0))))
  (markdown-header-face-3 ((t (:weight bold :height 1.0))))
  )


;; yaml
(use-package yaml-mode
  :ensure t
  :defer t)

;; git
(use-package gitconfig-mode
  :ensure t
  :defer t)

(use-package gitignore-mode
  :ensure t
  :defer t)

(use-package gitattributes-mode
  :ensure t
  :defer t)

;; json
(use-package json-mode
  :ensure t
  :defer t)

;; docker
(use-package dockerfile-mode
  :ensure t
  :defer t)

;; systemd
(use-package systemd
  :ensure t
  :defer t
  :mode
  ("\\.service\\'" "\\.timer\\'" "\\.target\\'" "\\.mount\\'"
   "\\.automount\\'" "\\.slice\\'" "\\.socket\\'" "\\.path\\'"
   "\\.netdev\\'" "\\.network\\'" "\\.link\\'"))
