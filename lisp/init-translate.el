;;; init.el ---                       -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; (when (maybe-require-package 'youdao-dictionary)
;;   (setq url-automatic-caching t)
;;   ;; (setq youdao-dictionary-search-history-file (expand-emacs-dir ".automake/.youdao"))
;;   (global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point))

;;; names
;;; https://github.com/Malabarba/names.git
(push (package-path "names") load-path)
;;; popup-el
;;; https://github.com/auto-complete/popup-el.git
(push (package-path "popup-el") load-path)
;;; pos-tip
;;; https://github.com/pitkali/pos-tip.git
(push (package-path "pos-tip") load-path)
;;; chinese-word-at-point.el
;;; https://github.com/xuchunyang/chinese-word-at-point.el
(push (package-path "chinese-word-at-point") load-path)
;;; youdao-dictionary.el
;;; https://github.com/xuchunyang/youdao-dictionary.el
(push (package-path "youdao-dictionary.el") load-path)
(require 'youdao-dictionary)
(setf url-automatic-caching t)
(global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point)

(push (package-path "s.el") load-path)
;; (push (package-path "fanyi") load-path)
;; (require 'fanyi)


;;; company-english-helper com
(push (expand-emacs-dir "packages/company-english-helper") load-path)
(require 'company-english-helper)

(provide 'init-translate)
;;; init-translate.el ends here
