;;; init-package.el ---                              -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'package)

(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(defmacro with-package (package &rest body)
  (declare (indent defun))		; 宏调用时缩进问题
  `(when (or (package-installed-p (quote ,package))
	     (package-install (quote ,package)))
     ,@body))

(package-initialize)

;;; Fire up package.el
;; (setq package-enable-at-startup nil)
(when (not package-archive-contents)
  (package-refresh-contents))


;; (cl-defun with-vc-package (&key (fetcher "github") repo name rev backend)
;;   "Install a package from a remote if it's not already installed.
;; This is a thin wrapper around `package-vc-install' in order to
;; make non-interactive usage more ergonomic.  Takes the following
;; named arguments:

;; - FETCHER the remote where to get the package (e.g., \"gitlab\").
;;   If omitted, this defaults to \"github\".

;; - REPO should be the name of the repository (e.g.,
;;   \"slotThe/arXiv-citation\".

;; - NAME, REV, and BACKEND are as in `package-vc-install' (which
;;   see)."
;;   (let* ((url (format "https://www.%s.com/%s" fetcher repo))
;;          (iname (when name (intern name)))
;;          (pac-name (or iname (intern (file-name-base repo)))))
;;     (unless (package-installed-p pac-name)
;;       (package-vc-install url iname rev backend))))

(provide 'init-package)
;;; init-package.el ends here
