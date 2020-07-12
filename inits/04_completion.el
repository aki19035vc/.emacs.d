(use-package ivy
  :ensure t
  :defer t
  :delight
  :hook (after-init . ivy-mode))

(use-package swiper
  :ensure t
  :defer t
  :delight
  :commands
  (swiper)
  :custom
  (swiper-include-line-number-in-search t)
  (swiper-action-recenter t))


(use-package counsel
  :ensure t
  :defer t
  :delight
  :bind
  ("M-x" . counsel-M-x)
  ("M-y" . counsel-yank-pop)
  :custom
  ;; (ivy-format-function 'ivy-format-function-arrow)
  (enable-recursive-minibuffers t)
  (ivy-use-virtual-buffers t)
  (ivy-count-format "(%d/%d) ")
  (counsel-yank-pop-separator "\n------------------\n")
  :config
  (setq ivy-height-alist
	'((t
	   lambda (_caller)
	   (/ (frame-height) 3))))
  (add-to-list 'ivy-height-alist
	       (cons 'counsel-yank-pop
		     (lambda (_caller)
		       (/ (frame-height) 8))))
  (setq ivy-initial-inputs-alist nil)
  (defvar ivy-format-function 'ivy-format-function-arrow)
  )


(use-package counsel-projectile
  :ensure t
  :defer t
  :hook (after-init . (projectile-mode t)))


(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode t))


(use-package ivy-rich
  :ensure t
  :init (ivy-rich-mode t))
