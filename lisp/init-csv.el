;;; init-csv.el ---                                  -*- lexical-binding: t; -*-
;; Copyright (C) 2023  xueshumeng
;;; Commentary:
;;
;;; Code:

(with-package csv-mode
  (add-hook 'csv-mode-hook 'csv-guess-set-separator))

(provide 'init-csv)
;;; init-csv.el ends here
