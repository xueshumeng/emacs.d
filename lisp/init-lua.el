;;; init.el ---                       -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; (when (maybe-require-package 'lua-mode)
;;   (autoload 'lua-mode "lua-mode" "Lua editing mode." t)
;;   (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
;;   (add-to-list 'interpreter-mode-alist '("lua" . lua-mode)))

(push (package-path "lua-mode") load-path)

(require 'lua-mode)

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(provide 'init-lua)
;;; init-lua.el ends here
