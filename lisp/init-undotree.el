;;; init-undotree.el ---                       -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(with-package undo-tree
  (setf undo-tree-auto-save-history nil)
  (global-undo-tree-mode))

(provide 'init-undotree)
;;; init-undotree.el ends here
