(use-package company-box
  :ensure t
  :diminish
  :hook (company-mode . company-box-mode))


(use-package company
  :ensure t
  :diminish company-mode
  :hook
  (after-init . global-company-mode)
  :bind
  (:map company-active-map
	("C-n" . company-select-next)
	("C-p" . company-select-previous)
	("<tab>" . company-complete-common-or-cycle)
	("C-h" . nil))
  :custom
  (company-idle-delay 0)
  (company-minimum-prefix-length 1)
  (company-transformers '(company-sort-by-backend-importance))
  )
