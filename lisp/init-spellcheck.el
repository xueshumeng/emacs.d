;;; init-spellcheck.el ---                           -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

(with-eval-after-load "ispell"
  ;; Configure `LANG`, otherwise ispell.el cannot find a 'default
  ;; dictionary' even though multiple dictionaries will be configured
  ;; in next line.
  ;; (setenv "LANG" "en_US.UTF-8")
  ;; (setq ispell-program-name "hunspell")
  ;; Configure German, Swiss German, and two variants of English.
  ;; (setq ispell-dictionary "en_GB,en_US")
  ;; ispell-set-spellchecker-params has to be called
  ;; before ispell-hunspell-add-multi-dic will work
  (ispell-set-spellchecker-params)
  ;; (ispell-hunspell-add-multi-dic "en_GB,en_US")
  ;; For saving words to the personal dictionary, don't infer it from
  ;; the locale, otherwise it would save to ~/.hunspell_de_DE.
  (setq ispell-personal-dictionary "~/.spell_personal"))

;; (add-hook 'prog-mode-hook 'flyspell-prog-mode)

(provide 'init-spellcheck)
;;; init-spellcheck.el ends here
