;;; init.el ---                       -*- lexical-binding: t; -*-
;;; Commentary:
;;; go get -u github.com/nsf/gocode
;;; gocode set propose-builtins true
;;; go get -u github.com/rogpeppe/godef
;;; go get -u golang.org/x/tools/cmd/godoc
;;; Code:

(when (maybe-require-package 'go-mode)
  (add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
  (when (maybe-require-package 'go-autocomplete)
    (require 'go-autocomplete)
    (require 'auto-complete-config)
    (ac-config-default))
  )

(provide 'init-golang)
;;; init-golang.el ends here
