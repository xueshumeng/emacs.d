;;; init.el ---                       -*- lexical-binding: t; -*-
;;; Commentary:
;;; Homepage: https://magit.vc
;;; GitHub: https://github.com/magit/magit
;;; Code:

;; (when (maybe-require-package 'magit)
;;   (global-set-key (kbd "C-x g") 'magit-status)
;;   (setf magit-repository-directories '(("~/Codes" . 2) ("~/.emacs.d" . 0))))

(push (package-path "magit/lisp") load-path)
(push (package-path "dash.el") load-path)
(push (package-path "transient/lisp") load-path)
(push (package-path "with-editor") load-path)

(require 'dash)
(require 'transient)
(require 'with-editor)
(require 'magit)

(global-set-key (kbd "C-x g") 'magit-status)


;; (when (maybe-require-package 'diff-hl)
;;   (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
;;   (add-hook 'after-init-hook 'global-diff-hl-mode))

(provide 'init-magit)
;;; init-magit.el ends here
