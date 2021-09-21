;;; init.el ---                       -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; (let ((sbcl-path (shell-command-to-string "which sbcl")))
;;   (when (not (string= sbcl-path ""))
;;     (setf inferior-lisp-program sbcl-path)
;;     (setf slime-contribs '(slime-fancy))
;;     (push (package-path "slime") load-path)
;;     (require 'slime-autoloads)
;;     ;; (load (expand-file-name "~/.quicklisp/slime-helper.el"))
;;     ;; (setq slime-lisp-implementations
;;     ;;   '((sbcl ("sbcl" "--core" "sbcl.core-with-swank")
;;     ;; 	 :init (lambda (port-file _)
;;     ;; 		 (format "(swank:start-server %S)\n" port-file)))))
;;     ))

(provide 'init-lisp)
;;; init-lisp.el ends here
