;;; init-lua.el ---                       -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:


;; Lua mode

(with-package lua-mode
  (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
  (add-to-list 'interpreter-mode-alist '("lua" . lua-mode)))



(provide 'init-lua)
;;; init-lua.el ends here
