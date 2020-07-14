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
  (enable-recursive-minibuffers t)
  (ivy-use-virtual-buffers t)
  (ivy-count-format "(%d/%d) ")
  (counsel-yank-pop-separator "\n------------------\n")
  :config
  (use-package smex
    :ensure t
    :custom
    (smex-history-length 35)
    (smex-completion-method 'ivy)
    )

  (setq ivy-height-alist
	'((t
	   lambda (_caller)
	   (/ (frame-height) 3))))
  (add-to-list 'ivy-height-alist
	       (cons 'counsel-yank-pop
		     (lambda (_caller)
		       (/ (frame-height) 8))))
  (setq ivy-initial-inputs-alist nil)

  (use-package counsel-projectile
    :ensure t
    :init
    (counsel-projectile-mode t))
  )

(use-package all-the-icons-ivy-rich
  :ensure t
  :hook (ivy-mode . all-the-icons-ivy-rich-mode)
  :config
  (use-package ivy-rich
    :ensure t
    :hook (all-the-icons-ivy-rich-mode . ivy-rich-mode))
  )
