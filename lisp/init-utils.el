;;; init.el --- my emacs config                      -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; (defvar use-package-keywords '(:disabled :load-path :requires :init :config))

(defmacro use-package (package &rest arguments)
  "Use package from github."
  (unless (memq :disabled arguments)
    `(dolist (keyword use-package-keywords)
       (let ((keyword (car ',arguments))
             (arg (cadr ',arguments))
             (rest (cddr ',arguments)))
	 (message "Keyword: %s Argument: %s Reset: %s" keyword arg rest)
	 )
       ;; (message "%s" (plist-get (quote ,arguments) keyword))
       ))
  )

;; (use-package magit
;;   ;; :load-path (package-path "magit")
;;   :init (add-hook 'prog-mode-hook #'ace-jump-mode)
;;   (add-hook 'prog-mode-hook #'ace-jump-mode))

;; (put 'use-package 'lisp-indent-function 'defun)

;; (macroexpand-1 '(use-package magit :load-path (package-path "magit")
;; 		  :init (add-hook 'prog-mode-hook #'ace-jump-mode)))

;; (let ((abs-package-path (package-path "evil"))
;;       (abs-load-path "")
;;       (init-form '((setq isearch-lazy-highlight t)))
;;       (config-form '((use-package moccur-edit)))
;;       (commands '(isearch-moccur isearch-all))
;;       (hooks '((prog-mode . ace-jump-mode))))
;;   )

;; (use-package evil)
;; (macroexpand-1 '(use-package magit :load-path (package-path "magit")))
;; (message "%s" (macroexpand-1 '(use-package evil :load-path (package-path "evil"))))

;; (message "%s" (macroexpand-1 '(load-package "evil" 'evil (evil-mode 1))))


;; (message "%s" (macroexpand-1 '(load-package "evil")))


(defmacro when-macos (&rest body)
  "When the system type is `darwin' then eval `BODY' form."
  `(when (equal system-type 'darwin) ,@body))

(defmacro when-linux (&rest body)
  "When the system type is `gnu/linux' then eval `BODY' form."
  `(when (equal system-type 'gnu/linux) ,@body))

;; (defmacro expand-emacs-dir (path)
;;   "Add `PATH' to the absolute directory of user's `emacs'."
;;   `(expand-file-name ,path user-emacs-directory))

(defmacro expand-emacs-dir (path)
  "Add `PATH' to the absolute directory of user's `emacs'."
  `(locate-user-emacs-file (convert-standard-filename ,path)))

(defmacro package-path (package)
  "Expand `PACKAGE''s path."
  `(locate-user-emacs-file (convert-standard-filename (concat "packages/" ,package))))

(defmacro add-custom-theme (path)
  "Load theme form `PATH'."
  `(add-to-list 'custom-theme-load-path ,path))

(defmacro add-auto-mode-alist (regex mode)
  "Add `REGEX' to `MODE' auto mode alist."
  `(add-to-list 'auto-mode-alist '(,regex . ,mode)))

(if (fboundp 'with-eval-after-load)
    (defalias 'after-load 'with-eval-after-load)
  (defmacro after-load (feature &rest body)
    "After FEATURE is loaded, evaluate BODY."
    (declare (indent defun))
    `(eval-after-load ,feature
       '(progn ,@body))))


(defvar current-date-time-format "%a %b %d %H:%M:%S %Z %Y"
  "*Format for \\[insert-current-date-time] (c.f. 'format-time-string').")

(defvar current-time-format "%a %H:%M:%S"
  "*Format for \\[insert-current-time] (c.f. 'format-time-string').")

(defun insert-current-date-time ()
  "Insert the current datetime according to `current-date-time-format'."
       (interactive "*")
       (insert (format-time-string current-date-time-format (current-time))))

(defun insert-current-time ()
  "Insert the current time according to `current-time-format'."
       (interactive "*")
       (insert (format-time-string current-time-format (current-time))))


(defun kill-all-buffer ()
  "Kill all buffer."
  (interactive)
  (dolist (buffer (buffer-list)) (kill-buffer buffer)))

(defun kill-other-buffer ()
  "Close all of other buffer."
  (interactive)
  (dolist (buffer (delq (current-buffer) (buffer-list))) (kill-buffer buffer)))

(provide 'init-utils)
;;; init-utils.el ends here
