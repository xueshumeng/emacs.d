;;; init.el ---                       -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(with-package sdcv
  (global-set-key (kbd "C-c y") 'sdcv-search-pointer)
  (with-eval-after-load 'sdcv
    (defun sdcv-search-with-dictionary-args (word dictionary-list)
      "Construct list of arguments to search for WORD.

Specify dictionaries to search in DICTIONARY-LIST."
      (setq sdcv-current-translate-object word)
      (let ((args `("-n" ,(substring-no-properties word))))
	(dolist (dict dictionary-list)
	  (push dict args)
	  (push "-u" args))
	(push "--utf8-output" args)))

    (with-eval-after-load 'evil
      (evil-define-key '(normal) 'sdcv-mode-map (kbd "q") 'sdcv-quit))))

(provide 'init-english)
;;; init-english.el ends here
