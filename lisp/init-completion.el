;;; init-completion.el ---                          -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

(with-package yasnippet
  ;; load all snippets on yasnippet was evaled.
  (with-eval-after-load 'yasnippet
    (yas-reload-all))

  (when (auto-insert-mode)
    (defun autoinsert-yas-expand()
      "Replace text in yasnippet template."
      (unless (yas-minor-mode-on)
	(yas-minor-mode))
      (when (yas-minor-mode-on)
	(yas/expand-snippet (buffer-string) (point-min) (point-max))))
    (setf auto-insert-query nil)
    (setf auto-insert-directory (expand-emacs-dir "snippets/templates"))
    (define-auto-insert "\\.org\\'" ["orgmode.temp" autoinsert-yas-expand])
    (define-auto-insert "\\.tex\\'" ["latex.temp" autoinsert-yas-expand])
    (define-auto-insert "\\.html\\'" ["html.temp" autoinsert-yas-expand])
    (define-auto-insert "\\.sh\\'" ["bash-script.temp" autoinsert-yas-expand])
    (define-auto-insert "\\.lua\\'" ["lua.temp" autoinsert-yas-expand])))


;; corfu complete mode
(with-package corfu
  (with-eval-after-load 'corfu
    (setf corfu-auto t)
    (setf corfu-auto-delay 0)
    (setf corfu-auto-prefix 2))
  (add-hook 'corfu-mode-hook #'corfu-popupinfo-mode)
  (add-hook 'corfu-mode-hook #'corfu-history-mode)

  (with-package cape)
  (with-package yasnippet-capf)

  ;; (with-package tempel
  ;;   (with-eval-after-load 'tempel
  ;;     (keymap-set tempel-map "<tab>" 'tempel-next)
  ;;     (keymap-set tempel-map "<backtab>" 'tempel-previous)))

  ;; load kind icon package
  (with-package kind-icon
    (setq kind-icon-use-icons nil)
    (with-eval-after-load 'corfu
      (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter)))

  (add-hook 'emacs-lisp-mode-hook 'corfu-mode)
  (add-hook 'org-mode-hook 'corfu-mode)
  (add-hook 'corfu-mode-hook 'yas-minor-mode))

;; company mode
;; (with-package company
;;   (add-hook 'emacs-lisp-mode-hook 'company-mode)
;;   (setq company-idle-delay 0)
;;   (setq company-minimum-prefix-length 2)

;;   (defun company-mode/backend-with-yas (backend)
;;     (if (and (listp backend) (member 'company-yasnippet backend))
;; 	backend
;;       (append (if (consp backend) backend (list backend))
;; 	      '(:with company-yasnippet))))

;;   (defun attch-yasnippet ()
;;     (setq company-backends
;; 	  (mapcar #'company-mode/backend-with-yas company-backends)))

;;   (add-hook 'company-mode-hook #'attch-yasnippet)

;;   (add-hook 'company-mode-hook 'yas-minor-mode)

;;   (with-package company-quickhelp
;;     (add-hook 'company-mode-hook 'company-quickhelp-mode)))


;; load eglot package

(with-package eglot
  (with-eval-after-load 'eglot
    (custom-set-default 'eglot-autoshutdown t)
    (define-key eglot-mode-map (kbd "M-n") 'flymake-goto-next-error)
    (define-key eglot-mode-map (kbd "M-p") 'flymake-goto-prev-error)
    (define-key eglot-mode-map (kbd "M-.") 'xref-find-definitions)
    (define-key eglot-mode-map (kbd "C-c r") 'eglot-rename)
    (add-to-list 'completion-category-overrides '(eglot (styles basic orderless))))
  (add-hook 'sh-mode-hook 'eglot-ensure))


;; TODO: display more function details
;; see: https://www.emacswiki.org/emacs/ElDoc
(with-package eldoc-box
  (add-hook 'eglot-managed-mode-hook #'eldoc-box-hover-at-point-mode t))


(defvar completion-alist nil)

(add-to-list 'completion-alist '(emacs-lisp-mode . (elisp-completion-at-point yasnippet-capf)))
(add-to-list 'completion-alist '(lisp-interaction-mode . (elisp-completion-at-point yasnippet-capf)))

(add-to-list 'completion-alist '(sh-mode . (eglot-completion-at-point yasnippet-capf sh-completion-at-point-function comint-completion-at-point)))

;; (add-to-list 'completion-alist '(org-mode . (yasnippet-capf pcomplete-completions-at-point)))

(add-to-list 'completion-alist '(lua-mode . (yasnippet-capf eglot-completion-at-point)))

(defun setup-capfs ()
  (let* ((capfs (cdr (assoc major-mode completion-alist)))
	 (mixed-capfs (list (apply 'cape-capf-super capfs))))
    (setq-local completion-at-point-functions mixed-capfs)))

;; (add-hook 'eglot-managed-mode-hook 'setup-capfs)

(add-hook 'emacs-lisp-mode-hook 'setup-capfs)
(add-hook 'lisp-interaction-mode-hook 'setup-capfs)

;; (add-hook 'org-mode-hook 'setup-capfs)
;; (add-hook 'lua-mode-hook 'setup-capfs)



(provide 'init-completion)
;;; init-completion.el ends here
