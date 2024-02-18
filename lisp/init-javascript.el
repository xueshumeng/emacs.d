;;; init-javascript.el ---                           -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

(with-package nodejs-repl
  (with-eval-after-load 'js
    (define-key js-mode-map (kbd "C-x C-e") 'nodejs-repl-send-last-expression)
    (define-key js-mode-map (kbd "C-c C-j") 'nodejs-repl-send-line)
    (define-key js-mode-map (kbd "C-c C-r") 'nodejs-repl-send-region)
    (define-key js-mode-map (kbd "C-c C-c") 'nodejs-repl-send-buffer)
    (define-key js-mode-map (kbd "C-c C-l") 'nodejs-repl-load-file)
    (define-key js-mode-map (kbd "C-c C-z") 'nodejs-repl-switch-to-repl)))

(provide 'init-javascript)
;;; init-javascript.el ends here
