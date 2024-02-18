;;; init-term.el ---                                 -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

(with-package multi-term
  (with-eval-after-load 'multi-term
    (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
    (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))))

(with-eval-after-load 'term
  (define-key term-raw-map (kbd "M-o") 'other-window)
  (define-key term-raw-map (kbd "C-e") 'term-send-end)
  (define-key term-raw-map (kbd "M-p") 'term-send-up)
  (define-key term-raw-map (kbd "M-n") 'term-send-down))

(provide 'init-term)
;;; init-term.el ends here
