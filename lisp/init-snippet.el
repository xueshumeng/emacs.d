;;; init.el ---                       -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; (when (maybe-require-package 'yasnippet)
;;   (yas-global-mode 1)
;;   (when (maybe-require-package 'yasnippet-snippets))
;;   (when (auto-insert-mode)
;;     (defun autoinsert-yas-expand()
;;       "Replace text in yasnippet template."
;;       (yas/expand-snippet (buffer-string) (point-min) (point-max)))
;;     (setq auto-insert-query nil)
;;     (setf auto-insert-directory (expand-emacs-dir "templates"))
;;     (define-auto-insert "\\.org\\'" ["orgmode.temp" autoinsert-yas-expand])
;;     (define-auto-insert "\\.tex\\'" ["latex.temp" autoinsert-yas-expand])
;;     (define-auto-insert "\\.\\(html\\|htm\\)\\'" ["html.temp" autoinsert-yas-expand])
;;     (define-auto-insert "\\.p\\(er\\)?l\\'" ["perl.temp" autoinsert-yas-expand])))

(push (package-path "yasnippet") load-path)

(push (package-path "yasnippet-snippets") load-path)

(require 'yasnippet)

(require 'yasnippet-snippets)

(yas-global-mode 1)

(when (auto-insert-mode)
  (defun autoinsert-yas-expand()
    "Replace text in yasnippet template."
    (yas/expand-snippet (buffer-string) (point-min) (point-max)))
  (setq auto-insert-query nil)
  (setf auto-insert-directory (expand-emacs-dir "templates"))
  (define-auto-insert "\\.org\\'" ["orgmode.temp" autoinsert-yas-expand])
  (define-auto-insert "\\.tex\\'" ["latex.temp" autoinsert-yas-expand])
  (define-auto-insert "\\.\\(html\\|htm\\)\\'" ["html.temp" autoinsert-yas-expand])
  (define-auto-insert "\\.p\\(er\\)?l\\'" ["perl.temp" autoinsert-yas-expand]))

(provide 'init-snippet)
;;; init-snippet.el ends here
