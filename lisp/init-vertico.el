;;; init.el ---                                    -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

(with-package vertico (vertico-mode))

(with-package orderless
  (setf completion-styles '(basic orderless))
  ;; TODO 打开文件的补全
  (setf completion-category-overrides
	'((file (styles basic orderless)))))

(with-package marginalia (marginalia-mode))

(with-package consult
  (global-set-key (kbd "C-s") 'consult-line)
  (global-set-key (kbd "M-g M-g") 'consult-goto-line)
  (global-set-key (kbd "C-x r b") 'consult-bookmark))

;; (when (maybe-require-package 'consult-todo))

;; (when (maybe-require-package 'embark))

(provide 'init-vertico)
;;; init-vertico.el ends here
