;;; init.el ---                       -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; (when (maybe-require-package 'dockerfile-mode)
;;   (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

;; https://github.com/spotify/dockerfile-mode.git
(push (package-path "dockerfile-mode") load-path)
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;; https://github.com/meqif/docker-compose-mode.git
(push (package-path "docker-compose-mode") load-path)
(require 'docker-compose-mode)

(provide 'init-docker)
;;; init-docker.el ends here
