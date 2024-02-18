;;; init-python.el ---                               -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

(with-package with-venv
  (defun prepare-virtual-env ()
    (with-venv
      (setq-local python-shell-virtualenv-root (getenv "VIRTUAL_ENV"))))
  (add-hook 'python-mode-hook 'prepare-virtual-env))

(provide 'init-python)
;;; init-python.el ends here
