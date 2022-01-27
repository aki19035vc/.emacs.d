(set-face-attribute 'default nil :family "Source Code Pro" :height 130)
(setq-default line-spacing 0.1)

;; カーソルの点滅を停止
(blink-cursor-mode 0)

;; メニューバーの非表示
(menu-bar-mode 0)

;; ツールバー非表示
(tool-bar-mode 0)

;; スクロールバー非表示
(scroll-bar-mode 0)

(tab-bar-mode t)

;; 折り返しの設定
(setq-default truncate-lines t)
(setq-default truncate-partial-width-windows t)

;; 行番号表示
(global-display-line-numbers-mode t)

;; 色んなアイコンを使えるようになる
(use-package all-the-icons
  :ensure t)

(use-package all-the-icons-dired
  :ensure t)

;; theme
(use-package spacemacs-common
  :ensure spacemacs-theme
  ;; :custom
  ;; (spacemacs-theme-custom-colors (cursor . "#ffa500"))
  :config
  (custom-set-variables '(spacemacs-theme-custom-colors
                          '((cursor . "#ffa500"))))

  (load-theme 'spacemacs-dark t))

(use-package doom-modeline
  :ensure t
  :defer t
  :hook (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-buffer-file-name-style 'truncate-with-project)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-icon t)
  (doom-modeline-minor-modes nil)
  :config
  (setq doom-modeline-height 1)
  (column-number-mode t)
  (set-face-attribute 'mode-line nil :family "Source Code Pro" :height 130)
  (set-face-attribute 'mode-line-inactive nil :family "Source Code Pro" :height 130)
  (line-number-mode 0))


;; カーソル行をびこーん
(use-package beacon
  :ensure t
  :custom
  (beacon-color "magenta")
  :hook (after-init . beacon-mode))


(use-package neotree
  :ensure t
  :defer t
  :after
  projectile
  :custom
  (neo-theme (if (display-graphic-p) 'icons 'arrow))
  (neo-show-hidden-files t)
  :bind
  (:map ctrl-l-map
        ("n t" . neotree-projectile-toggle)
        ("n f" . neotree-find)
        ("n d" . neotree-dir))
  :preface
  (defun neotree-projectile-toggle ()
    (interactive)
    (let ((project-dir
           (ignore-errors
         ;;; Pick one: projectile or find-file-in-project
             (projectile-project-root)
             ))
          (file-name (buffer-file-name))
          (neo-smart-open t))
      (if (and (fboundp 'neo-global--window-exists-p)
               (neo-global--window-exists-p))
          (neotree-hide)
        (progn
          (neotree-show)
          (if project-dir
              (neotree-dir project-dir))
          (if file-name
              (neotree-find file-name)))))))
