;;; init.el ---                       -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; disable menu bar
(menu-bar-mode -1)
;; disable tool bar
(tool-bar-mode -1)
;; disable scroll bar
(scroll-bar-mode -1)
;; 启用高亮显示括号匹配
(show-paren-mode t)
;; 启用自动输入匹配的括号
(electric-pair-mode t)

;; user's infomatiion
(setq user-mail-address "xue.shumeng@yahoo.com")
(setq user-full-name "xueshumeng")

;; 禁用自动保存
(setf auto-save-mode nil)
(setf make-backup-files nil)

;; 禁止启动默认画面
(setf inhibit-startup-message t)

;; 启用Y/N代替YES/NO
(fset 'yes-or-no-p 'y-or-n-p)

;; 保存文件时删除文件尾部的空白字符
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; 字符集使用环境配置
(defun utf8-locale-p (v)
  "Return whether locale string V relates to a UTF-8 locale."
  (and v (string-match "UTF-8" v)))

(defun locale-is-utf8-p ()
  "Return t iff the \"locale\" command or environment variables prefer UTF-8."
  (or (utf8-locale-p (and (executable-find "locale") (shell-command-to-string "locale")))
      (utf8-locale-p (getenv "LC_ALL"))
      (utf8-locale-p (getenv "LC_CTYPE"))
      (utf8-locale-p (getenv "LANG"))))

(when (or window-system (locale-is-utf8-p))
  (set-language-environment 'utf-8)
  (setq locale-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-selection-coding-system (if (eq system-type 'windows-nt) 'utf-16-le 'utf-8))
  (prefer-coding-system 'utf-8))


;; 这个函数是一个 vi 的 "f" 命令的替代品。vi的用户知道，vi有 一个特别好的命令 "f"。
;; 当你按 "fx", x 是任意一个字符时，光标 就会移动到下一个 "x" 处。这之后只要按 ";"(分号)，
;; 光标就到再 下一个 "x"。
(defun wy-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.
Typing `wy-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char)
		     char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))

(define-key global-map (kbd "C-c a") 'wy-go-to-char)

;;; 光标移动操作
(defun scroll-n-lines-ahead (&optional n)
  "Scroll ahead N lines (1 by default)."
  (interactive "P")
  (scroll-up (prefix-numeric-value n)))

(defun scroll-n-lines-behind (&optional n)
  "Scroll behind N lines (1 by default)."
  (interactive "P")
  (scroll-down (prefix-numeric-value n)))

(global-set-key (kbd "C-S-p") 'scroll-n-lines-ahead)
(global-set-key (kbd "C-S-n") 'scroll-n-lines-behind)

(setf indent-tabs-mode nil)
(setf tab-width 4)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(add-hook 'package-menu-mode-hook 'hl-line-mode)

(put 'narrow-to-region 'disabled nil)

(provide 'init-editor)
;;; init-editor.el ends here
