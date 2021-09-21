;;; init.el ---                       -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(when (window-system)
  (toggle-frame-fullscreen)
  (setf x-super-keysym 'meta))

(when window-system
  ;; set default font/size
  ;; 'SF Mono' 'Hack' 'Source Code Pro' 'Fira Code' 'Menlo'
  ;; 'Monaco' 'DejaVu Sans Mono' 'Consolas' 'iA Writer Mono V'
  ;; 'Sarasa Mono SC' 'SourceCodeVariable' 'Anonymous Pro'
  (when (member "Space Mono" (font-family-list))
    (set-frame-font "Space Mono-13" t t))
  ;; Set Chinese font 思源宋体
  (when (member "Source Han Serif SC" (font-family-list))
    (set-fontset-font t 'han "Source Han Serif SC-12")))

;; (when (maybe-require-package 'exec-path-from-shell)
;;   (exec-path-from-shell-initialize)
;;   (exec-path-from-shell-setenv "LANG" ""))

(provide 'init-linux)
;;; init-linux.el ends here
