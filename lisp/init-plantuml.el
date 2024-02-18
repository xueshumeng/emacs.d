;;; init-plantuml.el ---                             -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(with-package plantuml-mode
  ;; Enable plantuml-mode for PlantUML files
  (add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))
  (with-eval-after-load 'plantuml-mode
    ;; jar configuration
    (setq plantuml-jar-path "/opt/plantuml/plantuml.jar")
    (setq plantuml-default-exec-mode 'jar)))

(provide 'init-plantuml)
;;; init-plantuml.el ends here
