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

;; init.elの末尾に追記される変数等を別ファイルに分離
(setq custom-file (locate-user-emacs-file "custom.el"))

(require 'init-loader)
(setq init-loader-show-log-after-init 'error-only)
(init-loader-load)
