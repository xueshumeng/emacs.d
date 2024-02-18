;;; init-tex.el ---                                  -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:


;; (setf TeX-auto-save t)
;; (setf TeX-parse-self t)
;; (setq-default TeX-master nil)
;; (load "auctex.el" nil t t)
;; (load "preview-latex.el" nil t t)
;; (add-hook 'LaTeX-mode-hook 'visual-line-mode)
;; ;; (add-hook 'LaTeX-mode-hook 'flyspell-mode)
;; (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;; (setq LaTeX-verbatim-environments-local '("Verbatim" "codes"))

;; (add-hook 'LaTeX-mode-hook (lambda ()
;;                              (turn-off-auto-fill)
;;                              (outline-minor-mode 1)
;;                              (setf TeX-show-compilation nil)
;;                              (setf TeX-clean-confirm nil)
;;                              (setf TeX-save-query nil)
;;                              ;; 重新定义 pdf viewer，我设定为了 evince
;;                              ;; (setf TeX-view-program-list '(("Evince" "evince %o")))
;;                              ;; (setf TeX-view-program-selection
;;                              ;; '((output-pdf "Evince")))
;;                              ;; 设置编译引擎为xetex
;;                              (setf TeX-global-PDF-mode t
;;                                    TeX-engine 'xetex)
;;                              ;; 使用 XeLaTeX 作为默认程序来编译 LaTeX
;;                              (add-to-list 'TeX-command-list
;;                                           '("XeLaTeX" "%'xelatex%(mode)%' -shell-escape %t"
;;                                             TeX-run-TeX nil t))
;;                              (setf TeX-command-default "XeLaTeX")
;;                              ;; 开启Tex折叠模式
;;                              ;; (TeX-fold-mode t)
;;                              ;; 回车自动缩紧
;;                              (setf TeX-newline-function 'newline-and-indent)
;; 			     (turn-on-page-break-lines-mode)
;;                              ))
;; (setf reftex-plug-into-AUCTeX t)

(with-package auctex
  ;; 重新定义 pdf viewer，我设定为了 evince
  (setf TeX-view-program-list '(("Evince" "evince %o")))
  (setf TeX-view-program-selection '((output-pdf "Evince")))

  ;; 设置编译引擎为xetex
  (setf TeX-global-PDF-mode t
	TeX-engine 'xetex)
  ;; 使用 XeLaTeX 作为默认程序来编译 LaTeX
  (add-to-list 'TeX-command-list
               '("XeLaTeX" "%'xelatex%(mode)%' -shell-escape %t"
                 TeX-run-TeX nil t))
  (setf TeX-command-default "XeLaTeX")
  )

(provide 'init-tex)
;;; init-tex.el ends here
