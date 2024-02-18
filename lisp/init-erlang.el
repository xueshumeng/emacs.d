;;; init-erlang.el --- erlang mode                   -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

(let ((pkg-path "/usr/share/emacs/site-lisp/erlang"))
  (unless (member pkg-path load-path)
    (add-to-list 'load-path pkg-path))
  (add-to-list 'exec-path "/usr/lib64/erlang/bin")
  (setf erlang-root-dir "/usr/lib64/erlang")
  (require 'erlang-start))

(provide 'init-erlang)
;;; init-erlang.el ends here
