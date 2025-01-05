;; ======== Setup ========

(customize-set-variable
 'package-archives '(("org" . "https://orgmode.org/elpa/")
                     ("melpa" . "https://melpa.org/packages/")
                     ("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless (package-installed-p 'leaf)
  (package-refresh-contents)
  (package-install 'leaf))

(leaf leaf-keywords
  :ensure t
  :config
  (leaf-keywords-init))

;; ======== Global ========

;; タブインデントを無効
(setq-default indent-tabs-mode nil)

;; init.elの末尾に追記される変数等を別ファイルに分離
(setq custom-file (locate-user-emacs-file "custom.el"))

;; 起動メッセージの非表示
(setq inhibit-startup-message t)

;; 音消去
(setq ring-bell-function 'ignore)

;; クリップボード
(setq select-enable-clipboard t)

;; 自動バックアップ無効
(setq make-backup-files nil)
(setq create-lockfiles nil)
(setq auto-save-default nil)

;; ======== Font ========

(set-face-attribute 'default nil :family "Source Han Code JP" :height 120)
(setq-default line-spacing 0.1)

;; ======== Icon ========

(leaf nerd-icons
  :ensure t
  :init
  (unless (member "Symbols Nerd Font Mono" (font-family-list))
    (nerd-icons-install-fonts t)))

(leaf nerd-icons-dired
  :ensure t
  :hook
  (dired-mode-hook . nerd-icons-dired-mode))

;; ======== Theme ========

(leaf spacemacs-theme
  :ensure t
  :custom
  (spacemacs-theme-custom-colors . '((cursor . "#ffa500")))
  :config
  (load-theme 'spacemacs-dark t))

(leaf doom-modeline
  :ensure t
  :custom
  (doom-modeline-buffer-file-name-style . 'truncate-with-project)
  :config
  (doom-modeline-mode))

;; ======== UI ========

(blink-cursor-mode 0) ;; カーソルの点滅
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(tab-bar-mode t)
(winner-mode t)
(global-display-line-numbers-mode t) ;; 行番号
(global-hl-line-mode t) ;; 現在行のハイライト
(show-paren-mode t) ;; カッコのハイライト
(transient-mark-mode t) ;; 選択範囲をハイライト

;; 折り返しの設定
(setq-default truncate-lines t)
(setq-default truncate-partial-width-windows t)

(leaf posframe
  :ensure t)

(leaf rainbow-delimiters
  :ensure t
  :hook
  (prog-mode-hook . rainbow-delimiters-mode)
  :commands
  (rainbow-delimiters-mode))

(leaf volatile-highlights
  :ensure t
  :config
  (volatile-highlights-mode))

(leaf highlight-indent-guides
  :ensure t
  :require t
  :hook
  ((prog-mode-hook
    yaml-mode-hook
    markdown-mode-hook) . highlight-indent-guides-mode)
  :commands (highlight-indent-guides-mode)
  :custom
  (highlight-indent-guides-auto-enabled . nil)
  (highlight-indent-guides-responsive . nil)
  (highlight-indent-guides-method . 'bitmap)
  :config
  ;; Emacs29からcolor-lighten-nameの仕様が変わるため、highlight-indent-guides内のデフォルトの実装では色が上手く調整できなくなってしまう
  ;; https://github.com/DarthFennec/highlight-indent-guides/blob/cf352c85cd15dd18aa096ba9d9ab9b7ab493e8f6/highlight-indent-guides.el#L904
  (let* ((bk (face-background 'default nil 'default)))
    (set-face-background 'highlight-indent-guides-odd-face (color-lighten-name bk 150))
    (set-face-background 'highlight-indent-guides-even-face (color-lighten-name bk 150))
    (set-face-foreground 'highlight-indent-guides-character-face (color-lighten-name bk 150))
    (set-face-background 'highlight-indent-guides-top-odd-face (color-lighten-name bk 150))
    (set-face-background 'highlight-indent-guides-top-even-face (color-lighten-name bk 150))
    (set-face-foreground 'highlight-indent-guides-top-character-face (color-lighten-name bk 150))
    (set-face-background 'highlight-indent-guides-stack-odd-face (color-lighten-name bk 150))
    (set-face-background 'highlight-indent-guides-stack-even-face (color-lighten-name bk 150))
    (set-face-foreground 'highlight-indent-guides-stack-character-face (color-lighten-name bk 150))))

(leaf whitespace
  :ensure t
  :hook
  ((prog-mode-hook
    yaml-mode-hook
    markdown-mode-hook) . whitespace-mode)
  :custom
  (whitespace-space-regexp . "\\(\u3000+\\)")
  (whitespace-style . '(face         ; faceで可視化
                        trailing     ; 行末
                        tabs         ; タブ
                        spaces       ; スペース
                        empty        ; 先頭/末尾の空行
                        space-mark)) ; 表示のマッピング
  (whitespace-display-mappings . '((space-mark ?\u3000 [?\u25a1])))
  :custom-face
  (whitespace-trailing . '((t (:background "#444444"))))
  (whitespace-tab . '((t (:background "#444444"))))
  (whitespace-space . '((t (:background "#444444"))))
  (whitespace-empty . '((t (:background "#444444")))))

;; ======== Git ========

(leaf projectile
  :ensure t)

(leaf magit
  :ensure t
  :hook
  (git-commit-mode-hook . (lambda() (setq fill-column 200)))
  :commands
  (magit-status))

;; ======== Ivy ========

(leaf ivy
  :ensure t
  :config
  (ivy-mode))

(leaf ivy-posframe
  :ensure t
  :custom
  (ivy-posframe-parameters . '((left-fringe . 10)
                               (right-fringe . 10)))
  :custom-face
  (ivy-posframe . '((t (:background "#292b2e"))))
  :config
  (ivy-posframe-mode))

(leaf counsel
  :ensure t
  :custom
  (enable-recursive-minibuffers . t)
  (ivy-use-virtual-buffers . t)
  (ivy-count-format . "(%d/%d) ")
  (counsel-yank-pop-separator . "\n------------------\n")
  :config
  (setq ivy-height-alist '((t
                            lambda (_caller)
                            (/ (frame-height) 3))))
  (add-to-list 'ivy-height-alist
               (cons 'counsel-yank-pop
                     (lambda (_caller) (/ (frame-height) 8))))
  (setq ivy-initial-inputs-alist nil))

(leaf counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode))

(leaf ivy-rich
  :ensure t
  :config
  (ivy-rich-mode))

(leaf nerd-icons-ivy-rich
  :ensure t
  :require t
  :config
  (setq nerd-icons-ivy-rich-display-transformers-list
        (append nerd-icons-ivy-rich-display-transformers-list
                '(counsel-projectile-find-file
                  (:columns
                   ((nerd-icons-ivy-rich-file-icon)
                    (counsel-projectile-find-file-transformer))
                   :delimiter " "))))
  (nerd-icons-ivy-rich-mode))

(leaf smex
  :ensure t
  :custom
  (smex-history-length . 35)
  (smex-completion-method . 'ivy))

(leaf swiper
  :ensure t
  :commands
  (swiper)
  :custom
  (swiper-include-line-number-in-search . t)
  (swiper-action-recenter . t))

;; ======== Dired ========

(leaf ls-lisp
  :require t
  :custom
  (ls-lisp-use-insert-directory-program . nil)
  (ls-lisp-dirs-first . t))

;; ======== Neotree ========

(leaf neotree
  :ensure t
  :custom
  (neo-theme . 'icons)
  (neo-show-hidden-files . t)
  (neo-window-fixed-size . nil)
  (neo-window-width . 40))

(defun my--neotree-projectile-toggle ()
  (interactive)
  (let ((project-dir (ignore-errors (projectile-project-root)))
        (file-name (buffer-file-name))
        (neo-smart-open t))
    (if (and (fboundp 'neo-global--window-exists-p)
             (neo-global--window-exists-p))
        (neotree-hide)
      (progn (neotree-show)
             (if project-dir (neotree-dir project-dir))
             (if file-name (neotree-find file-name))))))

;; ======== Company ========

(leaf company
  :ensure t
  :hook
  (after-init-hook . global-company-mode)
  :bind
  (:company-active-map
   ("C-n" . company-select-next)
   ("C-p" . company-select-previous)
   ("<tab>" . company-complete-common-or-cycle)
   ("C-h" . nil))
  :custom
  (company-idle-delay . 0.1)
  (company-minimum-prefix-length . 2)
  (company-format-margin-function . nil)
  (company-transformers . '(delete-dups company-sort-by-backend-importance))
  (company-dabbrev-downcase . nil) ;; 保管時に大文字小文字を区別するようにする(デフォルトだと区別されない)
  (company-dabbrev-char-regexp . "\\(\\sw\\|\\s_\\|_\\|-\\)") ; -や_などを含む語句も補完
  (company-dabbrev-ignore-case . nil)
  :config
  ;; company-backendsは、本当に使いたいものの要素とは別に、リストの要素にcompany-capfを入れておかないとlspで上書きされる
  (setq company-backends '((company-capf company-files company-dabbrev company-css) company-capf)))

;; ======== Misc ========

(leaf mwim :ensure t)

(leaf expand-region :ensure t)

(leaf smart-hungry-delete :ensure t)

(leaf string-inflection :ensure t)

(leaf multiple-cursors :ensure t)

(leaf exec-path-from-shell
  :ensure t
  :init
  (exec-path-from-shell-initialize))

(leaf which-key
  :ensure t
  :config
  (which-key-mode))

(leaf smartparens
  :ensure t
  :custom
  (sp-highlight-pair-overlay . nil)
  (sp-highlight-wrap-overlay . nil)
  (sp-highlight-wrap-tag-overlay . nil)
  :config
  (require 'smartparens-config)
  (smartparens-global-mode))

(leaf undo-tree
  :ensure t
  :custom
  (undo-tree-auto-save-history . nil)
  :config
  (global-undo-tree-mode t))

;; ======== Tree-sitter ========

(leaf treesit
  :custom
  (treesit-font-lock-level . 4)
  (treesit-language-source-alist . '((typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
                                     (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")))
  :config
  (dolist (element treesit-language-source-alist)
    (let* ((lang (car element)))
      (if (treesit-language-available-p lang)
          (message "tree-sistter: %s is already installed" lang)
        (message "tree-sitter: %s is not installed" lang)
        (treesit-install-language-grammar lang)))))

(leaf tree-sitter
  :ensure (t tree-sitter-langs)
  :require tree-sitter-langs
  :hook
  (tree-sitter-after-on-hook . tree-sitter-hl-mode)
  :config
  (global-tree-sitter-mode))

;; ======== Language ========

(leaf git-modes :ensure t)

(leaf dockerfile-mode :ensure t)

(leaf terraform-mode :ensure t)

(leaf systemd :ensure t)

(leaf shell-mode
  :custom
  (sh-basic-offset . 2)
  (sh-indentation . 2))

(leaf markdown-mode
  :ensure t
  :custom-face
  (markdown-header-face-1 . '((t (:weight bold :height 1.0))))
  (markdown-header-face-2 . '((t (:weight bold :height 1.0))))
  (markdown-header-face-3 . '((t (:weight bold :height 1.0)))))

(leaf yaml-mode
  :ensure t
  :mode
  "\\.dig\\'")

(leaf go-mode :ensure t)

(leaf protobuf-mode :ensure t)

(leaf scala-mode :ensure t)

;; ======== Language: Web ========

(leaf web-mode
  :ensure t
  :custom
  (web-mode-markup-indent-offset . 2)
  :mode
  "\\.erb\\'")

(leaf js-mode
  :mode
  "\\.json\\'"
  :custom
  (js-switch-indent-offset . 2)
  (js-indent-level . 2))

(leaf typescript-ts-mode
  :mode
  "\\.ts\\'"
  :init
  (tree-sitter-require 'typescript)
  (add-to-list 'tree-sitter-major-mode-language-alist '(typescript-ts-mode . typescript)))

(leaf tsx-ts-mode
  :mode
  "\\.tsx\\'"
  :init
  (tree-sitter-require 'tsx)
  (add-to-list 'tree-sitter-major-mode-language-alist '(tsx-ts-mode . tsx)))

;; ======== Language: CSS ========

(leaf css-mode
  :ensure t
  :custom
  (css-indent-offset . 2))

(leaf scss-mode
  :ensure t
  :custom
  (css-indent-offset . 2))

;; ======== Language: Ruby ========

(leaf ruby-mode
  :ensure t
  :custom
  (ruby-insert-encoding-magic-comment . nil) ; ruby-modeにおけるマジックコメントの自動挿入を抑制
  (ruby-align-chained-calls . t))

(leaf rbs-mode :ensure t) ; TODO: インデントの計算を正しく行えるようにする

;; ======== LSP ========

(leaf lsp-mode
  :ensure t
  :require t
  :hook
  (ruby-mode-hook . lsp-deferred)
  (python-mode-hook . lsp-deferred)
  :custom
  (lsp-headerline-breadcrumb-enable-diagnostics . nil)
  (lsp-response-timeout . 10)
  (lsp-client-packages . '(lsp-pylsp
                           lsp-solargraph
                           ;; lsp-steep
                           ;; lsp-ruby-lsp
                           ))
  ;; solargraph
  (lsp-solargraph-diagnostics . nil)
  (lsp-solargraph-autoformat . nil)
  (lsp-solargraph-formatting . nil)
  ;; pylsp
  (lsp-pylsp-plugins-flake8-enabled . nil)
  (lsp-pylsp-plugins-mccabe-enabled . nil) ;; Disable cyclomatic complexity check
  (lsp-pylsp-plugins-pydocstyle-enabled . nil)
  :config
  (setq lsp-document-sync-method lsp--sync-incremental)
  :bind
  ((:lsp-mode-map ("M-." . lsp-ui-peek-find-definitions))))

(leaf lsp-ui
  :ensure t
  :hook
  (lsp-mode-hook . lsp-ui-mode)
  :custom
  (lsp-ui-doc-enable . nil)
  (lsp-ui-doc-header . nil)
  (lsp-ui-flycheck-enable . nil)
  (lsp-ui-sideline-enable . nil)
  (lsp-ui-imenu-enable . t)
  (lsp-ui-imenu-kind-position . 'top)
  (lsp-ui-peek-enable . t)
  (lsp-ui-peek-peek-height . 20)
  (lsp-ui-peek-list-width . 50)
  (lsp-ui-peek-fontify . 'on-demand)
  :custom-face
  (lsp-ui-peek-peek . '((t (:background "#292b2e"))))
  (lsp-ui-peek-list . '((t (:background "#292b2e"))))
  (lsp-ui-peek-header . '((t (:background "#292b2e" :foreground "#a45bad" :weight bold :box (:line-width -1 :color "#a45bad")))))
  (lsp-ui-peek-footer . '((t (:background "#3b314d"))))
  (lsp-ui-peek-filename . '((t (:foreground "#dc752f" :weight bold))))
  (lsp-ui-peek-selection . '((t (:background "#444155"))))
  (lsp-ui-peek-highlight . '((t (:background "#827591")))))

(use-package lsp-ivy
  :ensure t)

;; steepのクライアントは自前で登録。:add-on?を指定しないとsolargraphと同時に起動できないため。
(require 'lsp-steep)

(defcustom lsp-steep-enable nil
  "Enable Steep."
  :type 'boolean
  :safe #'booleanp
  :group 'lsp-steep)

(lsp-register-client
 (make-lsp-client
  :add-on? t
  :new-connection (lsp-stdio-connection #'lsp-steep--build-command)
  :activation-fn (lambda (_file-name _mode) lsp-steep-enable)
  :priority -3
  :server-id 'steep-ls--self))

;; ======== Scroll ========

(setq scroll-conservatively 100)
(setq scroll-preserve-screen-position t)

(defun my--scroll-up-command ()
  (interactive)
  (scroll-up-command (/ (window-height) 10)))

(defun my--scroll-down-command ()
  (interactive)
  (scroll-down-command (/ (window-height) 10)))

;; ======== Window balance ========

(defun my--delete-window-with-balance ()
  (interactive)
  (delete-window)
  (balance-windows))

(defun my--split-window-below-with-balance ()
  (interactive)
  (split-window-below)
  (balance-windows))

(defun my--split-window-right-with-balance ()
  (interactive)
  (split-window-right)
  (balance-windows))

;; ======== Keybind ========

(leaf global-1*
  :bind
  ("C-j" . newline-and-indent)
  ("C-a" . mwim-beginning)
  ("C-e" . mwim-end)
  ("<backspace>" . smart-hungry-delete-backward-char)
  ("C-d" . smart-hungry-delete-forward-char)
  ("C-v" . my--scroll-up-command)
  ("M-v" . my--scroll-down-command)
  ("C-M-@" . er/expand-region)
  ("C-M-." . mc/mark-next-like-this)
  ("C-M-," . mc/mark-previous-like-this)
  :bind*
  ("C-h" . delete-backward-char)
  ("M-x" . counsel-M-x)
  ("M-y" . counsel-yank-pop)
  ("M-/" . undo-tree-redo)
  ("M-8" . switch-to-prev-buffer)
  ("M-9" . switch-to-next-buffer)
  ("M-s" . save-buffer)
  ("C-M-j" . windmove-left)
  ("C-M-l" . windmove-right)
  ("C-M-i" . windmove-up)
  ("C-M-k" . windmove-down)
  ("C-M-n" . tab-bar-switch-to-prev-tab)
  ("C-M-p" . tab-bar-switch-to-next-tab)
  ([?¥] . [?\\]))

;; C-l マップを定義
(define-prefix-command 'ctrl-l-map)
(global-set-key (kbd "C-l") 'ctrl-l-map)

(dolist (binding '(("0" . my--delete-window-with-balance)
                   ("1" . delete-other-windows)
                   ("2" . my--split-window-below-with-balance)
                   ("3" . my--split-window-right-with-balance)
                   ("C-f" . counsel-find-file)
                   ("C-b" . ivy-switch-buffer)
                   ("C-r" . counsel-rg)
                   ("C-s" . swiper)
                   ("C-p" . counsel-projectile-find-file)
                   ("C-m" . magit-status)
                   ;; string-inflection
                   ("C-u" . string-inflection-underscore)
                   ("C-l" . string-inflection-lower-camelcase)
                   ("C-i" . string-inflection-camelcase)
                   ;; window関連
                   ("C-w u" . winner-undo)
                   ("C-w r" . winner-redo)
                   ;; tab-bar-mode
                   ("C-n" . tab-bar-switch-to-next-tab)
                   ("C-t c" . tab-bar-new-tab)
                   ("C-t x" . tab-bar-close-tab)
                   ;; multiple-cursors
                   ("C-c" . mc/edit-lines)
                   ("C-." . mc/mark-all-like-this)
                   ;; neotree
                   ("n t" . my--neotree-projectile-toggle)
                   ("n f" . neotree-find)
                   ("n d" . neotree-dir)
                   ;; lsp
                   ("C-q" . lsp-ui-peek-find-references)))
  (define-key 'ctrl-l-map (kbd (car binding)) (cdr binding)))
