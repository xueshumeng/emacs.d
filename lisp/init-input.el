;;; init.el ---                       -*- lexical-binding: t; -*-
;;; Commentary:
;;; HomePage:https://github.com/tumashu/pyim
;;; GitHub: https://github.com/tumashu/pyim
;;; Deps:
;;; https://github.com/mattiase/xr.git
;;; https://github.com/jwiegley/emacs-async.git
;;; https://github.com/tumashu/posframe.git
;;; Code:

;;; Pyim 依赖设置
(push (package-path "xr") load-path)

(push (package-path "emacs-async") load-path)

(require 'async)

(push (package-path "posframe") load-path)

(require 'posframe)

(push (package-path "pyim") load-path)

(require 'pyim)

(setq default-input-method "pyim")

;; 设置选词框的绘制方式
(if (posframe-workable-p)
    (setq pyim-page-tooltip 'posframe)
  (setq pyim-page-tooltip 'popup)
  (setq pyim-page-style 'one-line))

;; 显示5个候选词。
(setq pyim-page-length 5)

;;; 中文词库加载
;;; 清华大学开放中文词库 (http://thuocl.thunlp.org/)
;;; Github: https://github.com/redguardtoo/pyim-tsinghua-dict
(push (package-path "pyim-tsinghua-dict") load-path)
(require 'pyim-tsinghua-dict)
(pyim-tsinghua-dict-enable)
;;; pyim-greatdict
;;; 超 200 万条纪录
;;; Github: https://github.com/tumashu/pyim-greatdict.git
(push (expand-emacs-dir "pyim/pyim-greatdict") load-path)
(require 'pyim-greatdict)
(pyim-greatdict-enable)


(setf pyim-punctuation-dict '(("'" "‘" "’")
			      ("\"" "「" "」")
			      ("_" "——")
			      ("^" "…")
			      ("]" "】")
			      ("[" "【")
			      ("@" "◎")
			      ("?" "？")
			      (">" "》")
			      ("=" "＝")
			      ("<" "《")
			      (";" "；")
			      (":" "：")
			      ("/" "、")
			      ("." "。")
			      ("-" "－")
			      ("," "，")
			      ("+" "＋")
			      ("*" "×")
			      (")" "）")
			      ("(" "（")
			      ("&" "※")
			      ("%" "％")
			      ("$" "￥")
			      ("#" "＃")
			      ("!" "！")
			      ("`" "・")
			      ("~" "～")
			      ("}" "』")
			      ("|" "÷")
			      ("{" "『"))
      )

(provide 'init-input)
;;; init-input.el ends here
