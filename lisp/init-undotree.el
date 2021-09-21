;;; init.el ---                       -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; (when (maybe-require-package 'undo-tree)
;;   (global-undo-tree-mode))

;; https://github.com/emacsmirror/queue.git
(push (package-path "queue") load-path)

;; https://gitlab.com/tsc25/undo-tree.git
(push (package-path "undo-tree") load-path)

(require 'undo-tree)

(setf undo-tree-auto-save-history nil)

(global-undo-tree-mode)

(provide 'init-undotree)
;;; init-undotree.el ends here
