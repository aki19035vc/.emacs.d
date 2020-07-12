(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/") t)

(package-initialize)

(unless (file-exists-p package-user-dir)
  (package-refresh-contents))

(unless (package-installed-p 'init-loader)
  (package-refresh-contents)
  (package-install 'init-loader))

(require 'init-loader)
(setq init-loader-show-log-after-init 'error-only)
(init-loader-load)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (which-key wgrep vue-mode volatile-highlights use-package undo-tree spacemacs-theme smartparens smart-hungry-delete rainbow-delimiters pug-mode posframe popwin mwim magit jade-mode ivy-xref init-loader highlight-parentheses highlight-numbers highlight-indent-guides golden-ratio flyspell-correct-ivy flycheck expand-region exec-path-from-shell doom-themes doom-modeline delight counsel-projectile company-box amx all-the-icons-ivy-rich all-the-icons-dired)))
 '(spacemacs-theme-custom-colors (quote ((cursor . "#ffa500")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
