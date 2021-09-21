;;; init.el ---                       -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:


(defmacro rename-modeline (package-name mode new-name)
  "重定义`PACKAGE-NAME'的`MODE'在mode-line显示的名字为`NEW-NAME'."
  `(eval-after-load ,package-name
     '(defadvice ,mode (after rename-modeline activate)
        (setq mode-name ,new-name))))

;; show column number on mode line
(column-number-mode t)

;; show date and time on mode line
(setf display-time-24hr-format t)
;; (setf display-time-day-and-date t)
(display-time-mode t)

(defvar mode-line-cleaner-alist
  `((company-mode . "")
    (yas-minor-mode . "")
    (auto-revert-mode . "")
    (elisp-slime-nav-mode . " SN")
    ;; (eldoc-mode . " Edoc")
    (abbrev-mode . "")
    (ivy-mode . "")
    ;; Major modes
    ;; (lisp-interaction-mode . "ELISP")
    ;; (emacs-lisp-mode . "ELISP")
    (which-key-mode . "")
    (page-break-lines-mode . "")
    (undo-tree-mode . "")
    (auto-highlight-symbol-mode . "")
    (projectile-mode . "")
    (beacon-mode . ""))
  "Alist for `clean-mode-line'.

When you add a new element to the alist, keep in mind that you
must pass the correct minor/major mode symbol and a string you
want to use in the modeline *in lieu of* the original.")

(defun clean-mode-line ()
  "替换所有已经定义的模式显示名称."
  (interactive)
  (dolist (cleaner mode-line-cleaner-alist)
    (let* ((mode (car cleaner))
	   (mode-str (cdr cleaner))
	   (old-mode-str (cdr (assq mode minor-mode-alist))))
      (when old-mode-str
	(setcar old-mode-str mode-str))
      ;; major mode
      (when (eq mode major-mode)
	(setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)

;; disable mode line
;; (set-face-attribute 'mode-line nil :box nil)

(provide 'init-modeline)
;;; init-modeline.el ends here
