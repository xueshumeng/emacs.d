;;; init.el ---                       -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Emacs 矩形操作
;; - [C-RET] phi-rectangle-set-mark-command

;;  Activate the rectangle mark.

;; - phi-rectangle-kill-region (replaces "kill-region")

;;  A dwim version of "kill-region". If the rectangle mark is active,
;;  kill rectangle. If the normal mark is active, kill region as usual.
;;  Otherwise, kill whole line.

;; - phi-rectangle-kill-ring-save (replaces "kill-ring-save")

;;  A dwim version of "kill-ring-save" like "phi-rectangle-kill-region".

;; - phi-rectangle-yank (replaces "yank")

;;  A dwim version of "yank". If the last killed object is a rectangle,
;;  yank rectangle. Otherwise yank a kill-ring item as usual.

(when (maybe-require-package 'phi-rectangle)
  (phi-rectangle-mode))

(provide 'init-rectangle)
;;; init-rectangle.el ends here
