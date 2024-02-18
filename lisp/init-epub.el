;;; init-epub.el ---                                 -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

(with-package nov
  (autoload 'nov-bookmark-jump-handler "nov")
  (add-to-list 'auto-mode-alist '("\\.epub$" . nov-mode))
  (defun my-nov-font-setup ()
    (face-remap-add-relative 'variable-pitch
			     :family "LXGW WenKai"
			     :height 1.2))
  (add-hook 'nov-mode-hook 'my-nov-font-setup)

  (with-eval-after-load 'nov-mode
    (setq nov-text-width t)
    (setq visual-fill-column-center-text t)
    (add-hook 'nov-mode-hook 'visual-line-mode)
    (add-hook 'nov-mode-hook 'visual-fill-column-mode)))

(provide 'init-epub)
;;; init-epub.el ends here
