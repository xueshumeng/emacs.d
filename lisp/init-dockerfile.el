;;; init-dockerfile.el ---                       -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; https://github.com/spotify/dockerfile-mode.git
(with-package dockerfile-mode
  (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

(with-package docker
  (add-hook 'docker-image-mode-hook 'hl-line-mode)
  (add-hook 'docker-container-mode-hook 'hl-line-mode))

(provide 'init-dockerfile)
;;; init-dockerfile.el ends here
