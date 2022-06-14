(use-package lsp-mode
  :ensure t
  :hook
  (ruby-mode . lsp)
  (scala-mode . lsp)
  :custom
  (lsp-auto-guess-root t)
  (lsp-prefer-capf t) ;; companyのバックエンドをcapfで使う。company-lspは非推奨になった
  (lsp-response-timeout 10)
  :config
  (setq lsp-document-sync-method lsp--sync-incremental) ;; inclemental を指定してはいけない
  (use-package lsp-ui
    :ensure t
    :hook (lsp-mode . lsp-ui-mode)
    :bind
    (:map lsp-mode-map
          ("C-q C-r" . lsp-ui-peek-find-references)
          ("C-q C-d" . lsp-ui-doc-show))
    :custom
    (lsp-ui-doc-enable nil)
    (lsp-ui-doc-header t)
    (lsp-ui-doc-include-signature nil)
    (lsp-ui-doc-position 'at-point)
    (lsp-ui-doc-max-width 120)
    (lsp-ui-doc-max-height 30)
    (lsp-ui-doc-use-childframe t)
    ;; (lsp-ui-doc-use-webkit t)
    ;; lsp-ui-flycheck
    (lsp-ui-flycheck-enable nil)
    ;; lsp-ui-sideline
    (lsp-ui-sideline-enable nil)
    (lsp-ui-sideline-ignore-duplicate t)
    (lsp-ui-sideline-show-symbol t)
    (lsp-ui-sideline-show-hover t)
    (lsp-ui-sideline-show-diagnostics nil)
    (lsp-ui-sideline-show-code-actions t)
    ;; ;; lsp-ui-imenu
    (lsp-ui-imenu-enable t)
    (lsp-ui-imenu-kind-position 'top)
    ;; lsp-ui-peek
    (lsp-ui-peek-enable t)
    (lsp-ui-peek-peek-height 20)
    (lsp-ui-peek-list-width 50)
    (lsp-ui-peek-fontify 'on-demand))

  (use-package lsp-ivy
    :ensure t))

(use-package lsp-metals
  :ensure t
  :custom
  (lsp-metals-server-args '("-J-Dmetals.allow-multiline-string-formatting=off"))
  :hook
  (scala-mode . lsp))
