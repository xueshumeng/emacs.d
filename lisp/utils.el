;;; utils.el ---                                   -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(defmacro when-macos (&rest body)
  "When the system type is `darwin' then eval `BODY' form."
  (declare (indent defun))
  `(when (equal system-type 'darwin) ,@body))

(defmacro when-linux (&rest body)
  "When the system type is `gnu/linux' then eval `BODY' form."
  (declare (indent defun))
  `(when (equal system-type 'gnu/linux) ,@body))

(defmacro with-hook (hook &rest body)
  "Add `hook'"
  (declare (indent defun))
  `(add-hook ,hook (lambda () ,@body)))

(defmacro expand-emacs-dir (path)
  "Add `PATH' to the absolute directory of user's `emacs'."
  (declare (indent defun))
  `(locate-user-emacs-file (convert-standard-filename ,path)))

(defmacro expand-package-dir (pkg)
  `(expand-emacs-dir (concat "packages/" ,pkg)))

(defmacro add-custom-theme (path)
  (declare (indent defun))
  (let ((abs-path (expand-emacs-dir path)))
    `(unless (member ,abs-path load-path)
       (push ,abs-path custom-theme-load-path))))

(defmacro add-auto-mode-alist (regex mode)
  "Add `REGEX' to `MODE' auto mode alist."
  (declare (indent defun))
  `(add-to-list 'auto-mode-alist '(,regex . ,mode)))


;; A macro for add path to `load-path'
(defmacro add-to-load-path (path)
  "Add `PATH' to `load-path'"
  `(let ((pkg-path (expand-package-dir ,path)))
     (unless (member pkg-path load-path)
       (add-to-list 'load-path pkg-path))
     (member pkg-path load-path)))



(if (fboundp 'with-eval-after-load)
    (defalias 'after-load 'with-eval-after-load)
  (defmacro after-load (feature &rest body)
    "After FEATURE is loaded, evaluate BODY."
    (declare (indent defun))
    `(eval-after-load ,feature
       '(progn ,@body))))

(defvar current-date-time-format "%a %b %d %H:%M:%S %Z %Y"
  "*Format for \\[insert-current-date-time] (c.f. 'format-time-string').")

(defvar current-time-format "%a %H:%M:%S"
  "*Format for \\[insert-current-time] (c.f. 'format-time-string').")

(defun insert-current-date-time ()
  "Insert the current datetime according to `current-date-time-format'."
  (interactive "*")
  (insert (format-time-string current-date-time-format (current-time))))

(defun insert-current-time ()
  "Insert the current time according to `current-time-format'."
  (interactive "*")
  (insert (format-time-string current-time-format (current-time))))

(defun kill-all-buffer ()
  "Kill all buffer."
  (interactive)
  (dolist (buffer (buffer-list)) (kill-buffer buffer)))

(defun kill-other-buffer ()
  "Close all of other buffer."
  (interactive)
  (dolist (buffer (delq (current-buffer) (buffer-list))) (kill-buffer buffer)))


;; (defmacro xsm/corfu-capfs (hook capfs)
;;   `(add-hook ,hook (lambda ()
;; 		     (setq-local completion-at-point-functions (list (apply 'cape-capf-super ,capfs))))))


(provide 'utils)
;;; utils.el ends here
