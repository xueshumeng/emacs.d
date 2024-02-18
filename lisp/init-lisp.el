;;; init.el ---                       -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(with-package slime
  (let ((sbcl-program (shell-command-to-string "which sbcl")))
    (unless (string= sbcl-program "")
      (setf inferior-lisp-program sbcl-program)
      (setf slime-contribs '(slime-fancy))
      (setf slime-net-coding-system 'utf-8-unix)
      ;; (setf slime-lisp-implementations
      ;; 	'((sbcl ("sbcl") :coding-system utf-8-unix)))
      ))

  ;; (when (add-to-load-path "slime-company")
  ;;   (slime-setup '(slime-fancy slime-company)))
  )

(setf scheme-program-name "mit-scheme")

(provide 'init-lisp)
;;; init-lisp.el ends here
