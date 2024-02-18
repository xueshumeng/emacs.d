;;; init-keyfreq.el ---                              -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

(with-package keyfreq
  (with-eval-after-load 'keyfreq
    (keyfreq-autosave-mode 1))
  (keyfreq-mode 1))

(provide 'init-keyfreq)
;;; init-keyfreq.el ends here
