;;; init-yaml.el ---                                 -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

(with-package yaml-mode
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode)))

(provide 'init-yaml)
;;; init-yaml.el ends here
