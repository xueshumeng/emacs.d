;;; init.el ---                       -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(when (window-system)
  ;; (toggle-frame-fullscreen)
  (setf x-super-keysym 'meta))

(when window-system
  ;; set default font/size
  ;; IBM Plex Mono, Roboto Mono, iA Writer Mono V, Space Mono
  ;; (when (member "IBM Plex Mono" (font-family-list))
  ;;   (set-frame-font "IBM Plex Mono-14" t t))

  (when (member "iA Writer Mono V" (font-family-list))
    (set-frame-font "iA Writer Mono V-14" t t))

  ;; (when (member "PT Mono" (font-family-list))
  ;;   (set-frame-font "PT Mono-14" t t))

  ;; (when (member "Noto Sans Mono" (font-family-list))
  ;;   (set-frame-font "Noto Sans Mono-14"))

  ;; (when (member "Intel One Mono" (font-family-list))
  ;;   (set-frame-font "IntelOne Mono-14"))

  ;; (when (member "Roboto Mono" (font-family-list))
  ;;   (set-frame-font "Roboto Mono-13" t t))

  ;; (when (member "Cascadia Mono" (font-family-list))
  ;;   (set-frame-font "Cascadia Mono-14" t t))

  ;; (when (member "Space Mono" (font-family-list))
  ;;   (set-frame-font "Space Mono-13" t t))

  ;; Set Chinese font
  ;; 微软雅黑
  ;; (when (member "Microsoft YaHei" (font-family-list))
  ;;   (set-fontset-font t 'han "Microsoft YaHei-13")))

  ;; 仓颉明黑
  ;; (when (member "TsangerMingHei" (font-family-list))
  ;;   (set-fontset-font t 'han "TsangerMingHei W02-13"))

  ;; 思源宋体
  ;; (when (member "Source Han Serif SC" (font-family-list))
  ;;   (set-fontset-font t 'han "Source Han Serif SC-14"))

  ;; 霞鹜文楷
  ;; (when (member "LXGW WenKai Mono" (font-family-list))
  ;;   (set-fontset-font t 'han "LXGW WenKai Mono-14"))

  (when (member "FZYouSong GBK" (font-family-list))
    (set-fontset-font t 'han "FZYouSong GBK 507R-14"))

  ;; 朱雀仿宋
  ;; (when (member "Zhuque Fangsong (technical preview)" (font-family-list))
  ;;   (set-fontset-font t 'han "Zhuque Fangsong (technical preview)-13"))

  ;; (when (member "Sarasa Mono SC" (font-family-list))
  ;;   (set-fontset-font t 'han "Sarasa Mono SC-14"))

  ;; (when (member "TsangerJinKai03" (font-family-list))
  ;;   (set-fontset-font t 'han "TsangerJinKai03-14"))
  )


;;

(with-package exec-path-from-shell
  (exec-path-from-shell-initialize)
  ;; (exec-path-from-shell-setenv "LANG" "")
  )


;; (let ((system-site-lisp "/usr/share/emacs/site-lisp"))
;;   (unless (member system-site-lisp load-path)
;;     (add-to-list 'load-path system-site-lisp)))

(provide 'init-linux)
;;; init-linux.el ends here
