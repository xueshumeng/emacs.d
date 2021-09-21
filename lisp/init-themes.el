;;; init.el ---                       -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Github: https://github.com/purcell/color-theme-sanityinc-tomorrow.git
(push (package-path "color-theme-sanityinc-tomorrow") load-path)

(require 'color-theme-sanityinc-tomorrow)

;; (when (maybe-require-package 'dracula-theme))
;; (load-theme 'dracula t))

;; (when (maybe-require-package 'solarized-theme))

;; (when (maybe-require-package 'zenburn-theme))

;; (when (maybe-require-package 'spacemacs-theme))

;; (when (maybe-require-package 'gruvbox-theme))

;; (when (maybe-require-package 'lab-themes))

;; (when (maybe-require-package 'subatomic-theme))

;; (when (maybe-require-package 'chocolate-theme))

;; (when (maybe-require-package 'flucui-themes))

;; (when (maybe-require-package 'srcery-theme))

;; (when (maybe-require-package 'kaolin-themes))

;; (setf custom-theme-directory (package-path "Ayu-Theme-Emacs"))
(push (package-path "ayu-theme") load-path)

(require 'ayu-theme)

;; (load-theme 'tsdh-light t)

;; (when (maybe-require-package 'ayu-theme)
;;   (load-theme 'ayu-light t))

;; (when (maybe-require-package 'beacon) (beacon-mode))

;; (when (maybe-require-package 'highlight-indent-guides)
;;   (setf highlight-indent-guides-method 'character))

;; (when (maybe-require-package 'page-break-lines)
;;   (global-page-break-lines-mode))

;; (when (maybe-require-package 'auto-highlight-symbol)
;;   (global-auto-highlight-symbol-mode t)
;;   (add-hook 'erlang-mode-hook 'auto-highlight-symbol-mode))

(provide 'init-themes)
;;; init-themes.el ends here
