;;; init.el ---                       -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:


;; Enable org mode on text mode
(add-to-list 'auto-mode-alist '("\\.txt$" . org-mode))


;; Hidden source block

(defun individual-visibility-source-blocks ()
  "Fold some blocks in the current buffer."
  (interactive)
  (org-show-block-all)
  (org-block-map
   (lambda ()
     (let ((case-fold-search t))
       (when (and
	      (save-excursion (beginning-of-line 1) (looking-at org-block-regexp))
	      (cl-assoc ':hidden (cl-third (org-babel-get-src-block-info))))
	 (org-hide-block-toggle))))))

(add-hook 'org-mode-hook (function individual-visibility-source-blocks))


;; set default LaTeX compiler to `xelatex' on org babel

(with-eval-after-load 'org
  ;; (setf org-format-latex-header (concat "% xelatex\n" org-format-latex-header))

  ;; (setf org-latex-packages-alist '(("" "ctex" t)))

  ;; (setf org-preview-latex-process-alist
  ;; 	'((imagemagick :programs
  ;; 	      ("latex" "convert")
  ;; 	      :description "pdf > png" :message "you need to install the programs: latex and imagemagick." :image-input-type "pdf" :image-output-type "png" :image-size-adjust
  ;; 	      (1.0 . 1.0)
  ;; 	      :latex-compiler
  ;; 	      ("pdflatex -interaction nonstopmode -output-directory %o %f")
  ;; 	      :image-converter
  ;; 	      ("convert -trim -antialias %f -quality 100 %O"))))

  ;; (setf org-preview-latex-process-alist
  ;;       '((imagemagick :programs
  ;;                      ("xelatex" "convert")
  ;;                      :description "pdf > png" :message "you need to install the programs: latex and imagemagick." :image-input-type "pdf" :image-output-type "png" :image-size-adjust
  ;;                      (1.0 . 1.0)
  ;;                      :latex-compiler
  ;;                      ("xelatex -interaction nonstopmode -output-directory %o %f")
  ;;                      :image-converter
  ;;                      ("convert -density %D -trim -antialias %f -quality 100 %O"))))

  ;; (setq org-preview-latex-default-process 'imagemagick)


  )


;; Turn on org indent mode for all files.
(with-eval-after-load 'org
  (setf org-startup-indented t))


(with-eval-after-load 'org
  (setcdr (assoc "\\.pdf\\'" org-file-apps) "evince %s"))


;; redisplay inline image when execute code in orgmode

(add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)



;; (add-hook 'org-mode-hook #'(lambda () (setf fill-column 80)))

;; (add-hook 'org-mode-hook 'turn-on-auto-fill)


;;; 摘抄自 https://coldnew.github.io/a1ed40e3/

(defadvice org-html-paragraph (before org-html-paragraph-advice (paragraph contents info) activate)
  "Join consecutive Chinese lines into a single long line without unwanted space when exporting `org-mode' to html."
  (let* ((origin-contents (ad-get-arg 1))
         (fix-regexp "[[:multibyte:]]")
         (fixed-contents
          (replace-regexp-in-string
           (concat
            "\\(" fix-regexp "\\) *\n *\\(" fix-regexp "\\)") "\\1\\2" origin-contents)))
    (ad-set-arg 1 fixed-contents)))


;; 改变ORG导出时的下标标注方式：AAA_{下标}，AAA_普通文字将不再转义为下标

(with-eval-after-load 'org
  (setf org-export-with-sub-superscripts (quote {})))


;; 高亮ORG代码块中的代码

(with-eval-after-load 'org
  (setf org-src-fontify-natively t))


;; 自动隐藏文本标记符号（** // __ ...）

(with-eval-after-load 'org
  (setf org-hide-emphasis-markers t))


;; Org mode Get Things Done

(with-eval-after-load 'org
  (setf org-directory "~/Documents")

  (defvar org-gtd-inbox "get-things-done/inbox.org")
  (defvar org-gtd-task "get-things-done/tasks.org")
  (defvar org-gtd-notes "get-things-done/notes.org")
  (defvar org-gtd-works "get-things-done/works.org")
  (defvar org-gtd-someday "get-things-done/someday.org")
  (defvar org-gtd-reading "get-things-done/reading.org")
  (defvar org-gtd-finished "get-things-done/finished.org")
  (defvar org-gtd-trash "get-things-done/trash.org")

  (add-to-list 'org-agenda-files org-gtd-inbox)
  (add-to-list 'org-agenda-files org-gtd-task)
  (add-to-list 'org-agenda-files org-gtd-notes)
  (add-to-list 'org-agenda-files org-gtd-works)
  (add-to-list 'org-agenda-files org-gtd-reading)

  (add-to-list
   'org-todo-keywords
   '(sequence "TODO(t@/!)" "NEXT(n@/!)" "HOLD(h@/!)" "|" "DONE(d@/!)" "CANCEL(c@/!)"))

  (add-to-list
   'org-todo-keywords
   '(sequence "TODO(t@/!)" "NEXT(n@/!)" "HOLD(h@/!)" "|" "FIXED(f@/!)" "DONE(d@/!)" "CANCEL(c@/!)"))

  (setf org-tag-alist '(("@A1") ("@A2")
			("@B1") ("@B2")
			("@C1") ("@C2")
			("@C") ("@U") ("@S")
			("@T") ("@I") ("@L")))

  (setf org-clock-sound (expand-emacs-dir "sounds/copper-bell-ding.wav"))

  (setf org-image-actual-width 600)

  (with-eval-after-load 'org-refile
    (add-to-list 'org-refile-targets
		 `(,(expand-file-name org-gtd-task org-directory) :level . 1))
    (add-to-list 'org-refile-targets
		 `(,(expand-file-name org-gtd-works org-directory) :level . 1))
    (add-to-list 'org-refile-targets
		 `(,(expand-file-name org-gtd-someday org-directory) :level . 1))
    (add-to-list 'org-refile-targets
		 `(,(expand-file-name org-gtd-notes org-directory) :level . 1))
    (add-to-list 'org-refile-targets
		 `(,(expand-file-name org-gtd-trash org-directory) :level . 1))
    (add-to-list 'org-refile-targets
		 `(,(expand-file-name org-gtd-finished org-directory) :level . 1))))

(with-eval-after-load 'org-capture
  (add-to-list 'org-capture-templates
	       `("i" "Inbox" entry  (file ,(expand-file-name org-gtd-inbox org-directory)) "\n* %?"))

  (defvar word-book "English/word-book/word-book.org")
  (defvar listen-and-write "English/work-books/listen-and-write.org")
  (add-to-list 'org-capture-templates `("e" "English"))
  (add-to-list 'org-capture-templates
	       `("ew" "New word or expression" entry (file ,(expand-file-name word-book org-directory)) "\n\n* %?"))
  (add-to-list 'org-capture-templates
	       `("el" "Listen and write" entry  (file ,(expand-file-name listen-and-write org-directory)) "\n\n* %?"))

  (add-to-list 'org-capture-templates
	       `("b" "new wait read book" entry (file ,(expand-file-name org-gtd-reading org-directory)) "\n* %?"))
  )

(define-key global-map (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "C-c c") 'org-capture)


;; Org mode Babel

;; (with-eval-after-load 'org
;;   (setf org-plantuml-exec-mode 'plantuml)	; command mode
;;   (setf org-plantuml-exec-mode 'jar)
;;   (setf org-plantuml-jar-path "/opt/plantuml/plantuml.jar")

;;   (org-babel-do-load-languages
;;    'org-babel-load-languages
;;    '((plantuml . t)
;;      (gnuplot . t)
;;      (lisp . t)
;;      (latex . t))))


;; Org mode export to pdf

;; (with-eval-after-load 'ox-latex
;;   (add-to-list 'org-latex-classes
;; 	       '("ctexart"
;; 		 "\\documentclass[UTF8,a4paper]{ctexart}"
;; 		 ("\\section{%s}" . "\\section*{%s}")
;; 		 ("\\subsection{%s}" . "\\subsection*{%s}")
;; 		 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;; 		 ("\\paragraph{%s}" . "\\paragraph*{%s}")
;; 		 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;;   (add-to-list 'org-latex-classes
;; 	       '("ctexrep"
;; 		 "\\documentclass[UTF8,a4paper]{ctexrep}"
;; 		 ("\\part{%s}" . "\\part*{%s}")
;; 		 ("\\chapter{%s}" . "\\chapter*{%s}")
;; 		 ("\\section{%s}" . "\\section*{%s}")
;; 		 ("\\subsection{%s}" . "\\subsection*{%s}")
;; 		 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

;;   (add-to-list 'org-latex-classes
;; 	       '("ctexbook"
;; 		 "\\documentclass[UTF8,a4paper]{ctexbook}"
;; 		 ;;("\\part{%s}" . "\\part*{%s}")
;; 		 ("\\chapter{%s}" . "\\chapter*{%s}")
;; 		 ("\\section{%s}" . "\\section*{%s}")
;; 		 ("\\subsection{%s}" . "\\subsection*{%s}")
;; 		 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

;;   (add-to-list 'org-latex-classes
;; 	       '("beamer"
;; 		 "\\documentclass{beamer}
;; 	       \\usepackage[fontset=none,UTF8,a4paper,zihao=-4]{ctex}"
;; 		 org-beamer-sectioning))

;;   (add-to-list 'org-latex-classes
;; 	       '("multiple"
;; 		 ""
;; 		 ("\\chapter{%s}" . "\\chapter*{%s}")
;; 		 ("\\section{%s}" . "\\section*{%s}")
;; 		 ("\\subsection{%s}" . "\\subsection*{%s}")
;; 		 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

;;   ;; (setq org-latex-default-class "ctexart")
;;   ;; (setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"))
;;   )


;; (with-package ox-reveal)

;; (when (add-to-load-path "ox-reveal")
;;   (with-eval-after-load 'org
;;     (require 'ox-reveal)))


;; emacs htmlize

;; https://github.com/hniksic/emacs-htmlize

;; (with-eval-after-load 'org
;;   (when (add-to-load-path "emacs-htmlize")))


;; valign mode

(with-package valign (add-hook 'org-mode-hook 'valign-mode))


;; (add-hook 'org-mode-hook #'visual-line-mode)
(add-hook 'org-mode-hook #'toggle-truncate-lines)


;; display inline image

(with-eval-after-load 'org
  (setf org-startup-with-inline-images t))


;;; pretty show org mode
;;; org-bars (https://github.com/tonyaldon/org-bars)
;; (when (maybe-require-local-package 'org-bars)
;;   (add-hook 'org-mode-hook #'org-bars-mode))


;; scale math picture

;; (with-eval-after-load 'org
;;   (setf org-format-latex-options (plist-put org-format-latex-options :scale 1.1)))


;; org-download mode

(with-package org-download
  (setq-default org-download-image-dir "images")
  (setq-default org-download-heading-lvl nil)
  (autoload 'org-download-edit "org-download"
    "Open the image at point for editing." t)
  (autoload 'org-download-yank "org-download"
    "Call ‘org-download-image’ with current kill." t)
  (autoload 'org-download-image "org-download"
    "Save image at address LINK to ‘org-download--dir’." t)
  (autoload 'org-download-delete "org-download"
    "Auto load org download delete" t)
  (autoload 'org-download-clipboard "org-download"
    "Capture the image from the clipboard and insert the resulting file." t)
  (autoload 'org-download-screenshot "org-download"
    "Capture screenshot and insert the resulting file.
The screenshot tool is determined by ‘org-download-screenshot-method’." t)
  (autoload 'org-download-rename-at-point "org-download" "Rename image at point." t)
  (autoload 'org-download-rename-last-file "org-download"
    "Rename the last downloaded file saved in your computer." t))



(with-eval-after-load 'org
  ;; 青色 描述
  (defface org-emphasis-desc
    '((default :inherit bold)
      (((class color) (min-colors 88) (background light))
       :foreground "#4b99d3")		;245BDB
      (((class color) (min-colors 88) (background dark))
       :foreground "#4b99d3"))
    "My bold emphasis for Org.")

  ;;  绿色 标题
  (defface org-emphasis-title
    '((default :inherit bold)
      (((class color) (min-colors 88) (background light))
       :foreground "#6cb788")
      (((class color) (min-colors 88) (background dark))
       :foreground "#6cb788"))
    "My bold emphasis for Org.")

  ;; 橙色 例子
  (defface org-emphasis-example
    '((default :inherit bold)
      (((class color) (min-colors 88) (background light))
       :foreground "#DE7802")
      (((class color) (min-colors 88) (background dark))
       :foreground "#DE7802"))
    "My bold emphasis for Org.")

  ;; 黄色 迁移
  (defface org-emphasis-trans
    '((default :inherit bold)
      (((class color) (min-colors 88) (background light))
       :foreground "#ebab37")
      (((class color) (min-colors 88) (background dark))
       :foreground "#ebab37"))
    "My bold emphasis for Org.")

  ;; 白色 其他
  (defface org-emphasis-other
    '((default :inherit bold)
      (((class color) (min-colors 88) (background light))
       :foreground "#cbc9ca")
      (((class color) (min-colors 88) (background dark))
       :foreground "#cbc9ca"))
    "My bold emphasis for Org.")

  (font-lock-add-keywords 'org-mode
			  '(("\\(##\\)\\(.*?\\)\\(##\\)" . 'org-emphasis-title)))
  (font-lock-add-keywords 'org-mode
			  '(("\\(!!.*?!!\\)" . 'org-emphasis-desc)))
  (font-lock-add-keywords 'org-mode
			  '(("\\(@@.*?@@\\)" . 'org-emphasis-example)))
  (font-lock-add-keywords 'org-mode
			  '(("\\(%%.*?%%\\)" . 'org-emphasis-trans)))
  (font-lock-add-keywords 'org-mode
			  '(("\\(&&.*?&&\\)" . 'org-emphasis-other)))
  )

;; generate file name by random chars

(defun insert-random-file-name (&optional prefix)
  (interactive)
  (let ((rand-list
	 (cl-loop for i from 1 to 100 collect (char-to-string (+ (random 93) 33))))
	(prefix (unless prefix ".png")))
    (insert (concat (substring (md5 (apply #'concat rand-list)) 0 10) prefix))))


;; 使用 font-lock 来隐藏加粗等标记前后的空格
;; 参考：https://emacs-china.org/t/org-mode/22313/2?page=2

;; (with-eval-after-load 'org
;;   (font-lock-add-keywords
;;    'org-mode
;;    '(("\\cc\\( \\)[/+*_=~][^a-zA-Z0-9/+*_=~\n]+?[/+*_=~]\\( \\)?\\cc?"
;;       (1 (prog1 () (compose-region (match-beginning 1) (match-end 1) ""))))
;;      ("\\cc?\\( \\)?[/+*_=~][^a-zA-Z0-9/+*_=~\n]+?[/+*_=~]\\( \\)\\cc"
;;       (2 (prog1 () (compose-region (match-beginning 2) (match-end 2) "")))))
;;    'append))

(with-package anki-editor
  (setq anki-editor-create-decks t))

(provide 'init-orgmode)
;;; init-orgmode.el ends here
