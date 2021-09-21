;;; init-yaml.el --- Yaml mode                       -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; (when (maybe-require-package 'yaml-mode)
;;   (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)))

;; https://github.com/yoshiki/yaml-mode.git
(push (package-path "yaml-mode") load-path)
(require 'yaml-mode)

(provide 'init-yaml)
;;; init-yaml.el ends here
