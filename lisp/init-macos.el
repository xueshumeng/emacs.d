;;; init.el --- my emacs config                      -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(when (window-system)
  (toggle-frame-fullscreen)
  (setq mac-option-modifier 'super)
  (setq mac-command-modifier 'meta)
  (setq ns-function-modifier 'hyper))

(when window-system
  (let ((monaco-font "-apple-Monaco-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1")
	(sourcode-font "-apple-Source Code Pro-*-normal-normal-*-16-*-*-*-m-0-iso10646-1")
	(firacode-font "-*-Fira Code-*-*-*-*-14-*-*-*-*-*-*-*")
	(sarasa-font "-*-Sarasa Mono SC-*-*-*-*-12-*-*-*-*-*-*-*"))
    (set-face-attribute 'default nil :font sourcode-font)))

(when (maybe-require-package 'exec-path-from-shell)
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-setenv "LANG" ""))

(provide 'init-macos)
;;; init-macos.el ends here
