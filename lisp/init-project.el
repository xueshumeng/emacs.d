;;; init.el ---                       -*- lexical-binding: t; -*-
;;; Commentary:
;; GitHub: https://github.com/bbatsov/projectile
;; Document: https://docs.projectile.mx
;;; Code:

(push (package-path "projectile") load-path)
(require 'projectile)
;; (custom-set-variables '(projectile-known-projects-file (expand-emacs-dir ".automake/proj-bookmarks.eld")))
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setf projectile-project-search-path '("~/Workspace"))

;; (when (maybe-require-package 'counsel-projectile)
;;   (counsel-projectile-mode))

(provide 'init-project)
;;; init-project.el ends here
