;;; init-evil.el --- Evail settings                  -*- lexical-binding: t; -*-
;;; Commentary:
;; GitHub: https://github.com/emacs-evil/evil
;; Document: https://evil.readthedocs.io/en/latest/overview.html
;;; Code:

(push (package-path "evil") load-path)

(require 'evil)

(when (evil-mode 1)
    (evil-set-leader '(normal) (kbd "SPC"))
    (evil-define-key '(normal) 'global (kbd "<leader>sb") 'save-buffer)
    (evil-define-key '(normal) 'global (kbd "<leader>ff") 'find-file)
    (evil-define-key '(normal) 'global (kbd "<leader>sw") 'switch-window)
    (evil-define-key '(normal) 'global (kbd "<leader>:") 'counsel-M-x))

(provide 'init-evil)
;;; init-evil.el ends here
