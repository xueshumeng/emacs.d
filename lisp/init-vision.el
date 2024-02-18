;;; init-vision.el --- vision settings               -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:


;; Highlight current line when package-menu-mode

(add-hook 'package-menu-mode-hook 'hl-line-mode)

(add-hook 'org-agenda-mode-hook 'hl-line-mode)

(add-hook 'dired-mode-hook 'hl-line-mode)


;; Highlight todo mode
;;
;; TODO  在该注释处有功能代码待编写，待实现的功能在说明中会简略说明
;;
;; FIXME 在该注释处代码需要修正，甚至代码是错误的，不能工作，
;;       需要修复，如何修正会在说明中简略说明
;;
;; XXX   在该注释处代码虽然实现了功能，但是实现的方法有待商榷，
;;       希望将来能改进，要改进的地方会在说明中简略说明
;;
;; NOTE  在该注释处说明代码如何工作
;;
;; HACK  在该注释处编写得不好或格式错误，需要根据自己的需求去调整程序代码
;;
;; BUG   在该注释处有 BUG

(with-package hl-todo
  (global-hl-todo-mode))



;; (with-package dracula-theme)

;; (with-package zenburn-theme)

;; (with-package gruvbox-theme)

;; (with-package flucui-themes)


;; Sanityinc tomorrow theme
;; https://github.com/purcell/color-theme-sanityinc-tomorrow.git

(with-package color-theme-sanityinc-tomorrow)


;; Modus themes for GNU Emacs

(with-package modus-themes
  ;; (load-theme 'modus-operandi t)
  )


;; Apropospriate theme
;; https://github.com/waymondo/apropospriate-theme.git

(with-package apropospriate-theme)


(with-package kaolin-themes)

(with-package solarized-theme
  ;; (load-theme 'solarized-selenized-white t)
  ;; (set-face-attribute 'mode-line nil :underline nil)
  )


;; (with-package base16-theme
;;   (advice-add
;;    'custom-available-themes
;;    :filter-return (lambda (themes)
;; 		    (cl-remove-if (lambda (x) (or (eq x 'base16) (eq x 'nano))) themes)))
;;   (load-theme 'base16-selenized-light t))


;; (load-theme 'tsdh-light t)


(with-package nano-theme)


;; (with-package highlight-indent-guides
;;   (setf highlight-indent-guides-method 'character)
;;   (add-hook 'emacs-lisp-mode-hook #'highlight-indent-guides-mode)
;;   (add-hook 'yaml-mode-hook #'highlight-indent-guides-mode))



(with-package auto-highlight-symbol
  (global-auto-highlight-symbol-mode t))


;; page break lines mode

(with-package page-break-lines
  ;; (add-hook 'help-mode-hook #'page-break-lines-mode)
  (global-page-break-lines-mode)
  ;; fix the page break line is too long problem
  (set-fontset-font "fontset-default"
                    (cons page-break-lines-char page-break-lines-char)
                    "Noto Sans Mono"))

;; Suspend page-break-lines-mode while company menu is active
;; (see https://github.com/company-mode/company-mode/issues/416)
(after-load 'company
  (after-load 'page-break-lines
    (defvar-local page-break-lines-on-p nil)

    (defun page-break-lines-disable (&rest ignore)
      (when (setq page-break-lines-on-p (bound-and-true-p page-break-lines-mode))
        (page-break-lines-mode -1)))

    (defun page-break-lines-maybe-reenable (&rest ignore)
      (when page-break-lines-on-p
        (page-break-lines-mode 1)))

    (add-hook 'company-completion-started-hook 'page-break-lines-disable)
    (add-hook 'company-completion-finished-hook 'page-break-lines-maybe-reenable)
    (add-hook 'company-completion-cancelled-hook 'page-break-lines-maybe-reenable)))


;; Modeline settings

(defmacro rename-modeline (package-name mode new-name)
  "重定义 `PACKAGE-NAME' 的 `MODE' 在 mode-line 显示的名字为 `NEW-NAME'."
  `(eval-after-load ,package-name
     '(defadvice ,mode (after rename-modeline activate)
        (setq mode-name ,new-name))))

;; show column number on mode line
(column-number-mode t)

;; show date and time on mode line
(setf display-time-24hr-format t)
(setf display-time-day-and-date t)
(display-time-mode t)

(defvar mode-line-cleaner-alist
  `((company-mode . "")
    (yas-minor-mode . "")
    (auto-revert-mode . "")
    (elisp-slime-nav-mode . " SN")
    (eldoc-mode . "")
    (abbrev-mode . "")
    (ivy-mode . "")
    (flyspell-mode . "")
    ;; (valign-mode . "")
    ;; (org-indent-mode . "")
    (eldoc-box-hover-at-point-mode . "")
    (evil-escape-mode . "")
    (auto-highlight-symbol-mode . "")
    ;; Major modes
    (lisp-interaction-mode . "Elisp")
    (emacs-lisp-mode . "Elisp")
    (page-break-lines-mode . "")
    (undo-tree-mode . "")
    (beacon-mode . "")
    (which-key-mode . ""))
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


;; Shwo mode line with border

;; (set-face-attribute 'mode-line nil :underline nil :box nil)


;; Replace list hyphen with dot

(font-lock-add-keywords
 'org-mode
 '(("^ *\\([-]\\) "
    (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))



(provide 'init-vision)
;;; init-vision.el ends here
