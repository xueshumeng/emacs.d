;;; init-evil.el --- Evail settings                  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(with-package evil
  (autoload 'evil-mode "evil" "Auto evil mode" t)
  (with-eval-after-load 'evil
    (evil-set-leader '(normal) (kbd "SPC"))

    (evil-define-key '(normal) 'global (kbd "<leader>ff") 'find-file)
    (evil-define-key '(normal) 'global (kbd "<leader>bd") 'kill-current-buffer)
    (evil-define-key '(normal) 'global (kbd "<leader>bs") 'save-buffer)
    (evil-define-key '(normal) 'global (kbd "<leader>bo") 'switch-to-buffer)
    ;; Switch window keybind
    (evil-define-key '(normal) 'global (kbd "<leader>w1") 'switch-window-then-maximize)
    (evil-define-key '(normal) 'global (kbd "<leader>w2") 'switch-window-then-split-below)
    (evil-define-key '(normal) 'global (kbd "<leader>w3") 'switch-window-then-split-right)
    (evil-define-key '(normal) 'global (kbd "<leader>w0") 'switch-window-then-delete)
    (evil-define-key '(normal) 'global (kbd "<leader>wo") 'switch-window)

    (evil-define-key '(normal insert) 'global (kbd "C-e") 'end-of-line)
    (evil-define-key '(normal insert) 'global (kbd "C-a") 'beginning-of-line)
    (evil-define-key '(normal insert) 'global (kbd "C-n") 'next-line)
    (evil-define-key '(normal insert) 'global (kbd "C-p") 'previous-line)
    (evil-define-key '(insert) 'global (kbd "C-k") 'kill-line)
    (evil-define-key '(insert) 'global (kbd "C-d") 'delete-forward-char)
    (evil-define-key '(insert) 'global (kbd "C-y") 'yank)
    (evil-define-key '(insert) 'global (kbd "C-w") 'kill-region)
    ;; evil for info mode
    (evil-set-initial-state 'Info-mode 'normal)
    (evil-define-key '(normal) Info-mode-map (kbd "<tab>") 'Info-next-reference)
    (evil-define-key '(normal) Info-mode-map (kbd "<return>") 'Info-follow-nearest-node)
    (evil-define-key '(normal) Info-mode-map (kbd "M-h") 'Info-help)
    (evil-define-key '(normal) Info-mode-map (kbd "q") 'quit-window)
    (evil-define-key '(normal) Info-mode-map (kbd "^") 'Info-up)
    (evil-define-key '(normal) Info-mode-map (kbd "u") 'Info-up)
    (evil-define-key '(normal) Info-mode-map (kbd "n") 'Info-next)
    (evil-define-key '(normal) Info-mode-map (kbd "p") 'Info-prev)
    (evil-define-key '(normal) Info-mode-map (kbd "d") 'Info-directory)
    (evil-define-key '(normal) Info-mode-map (kbd "L") 'Info-history)
    (evil-define-key '(normal) Info-mode-map (kbd "s") 'Info-search)
    (evil-define-key '(normal) Info-mode-map (kbd "S") 'Info-search-case-sensitively)
    (evil-define-key '(normal) Info-mode-map (kbd "a") 'info-apropos)
    (evil-define-key '(normal) Info-mode-map (kbd "m") 'Info-menu)
    (evil-define-key '(normal) Info-mode-map (kbd "gt") 'Info-top-node)
    ;; Evil for epub mode
    (evil-set-initial-state 'nov-mode 'normal)
    (evil-define-key '(normal) nov-mode-map (kbd "[") 'nov-previous-document)
    (evil-define-key '(normal) nov-mode-map (kbd "]") 'nov-next-document)
    (evil-define-key '(normal) nov-mode-map (kbd "a") 'nov-reopen-as-archive)
    (evil-define-key '(normal) nov-mode-map (kbd "g") 'nov-render-document)
    (evil-define-key '(normal) nov-mode-map (kbd "h") 'describe-mode)
    (evil-define-key '(normal) nov-mode-map (kbd "l") 'nov-history-back)
    (evil-define-key '(normal) nov-mode-map (kbd "m") 'nov-display-metadata)
    (evil-define-key '(normal) nov-mode-map (kbd "n") 'nov-next-document)
    (evil-define-key '(normal) nov-mode-map (kbd "p") 'nov-previous-document)
    (evil-define-key '(normal) nov-mode-map (kbd "q") 'quit-window)
    (evil-define-key '(normal) nov-mode-map (kbd "v") 'nov-view-source)
    (evil-define-key '(normal) nov-mode-map (kbd "<del>") 'nov-scroll-down)

    ;; Evil for bookmark
    ;; Jump to the bookmark named bookmark (bookmark-jump).
    (evil-define-key '(normal) 'global (kbd "<leader>xrb") 'consult-bookmark)
    ;; Set the bookmark for the visited file, at point.
    (evil-define-key '(normal) 'global (kbd "<leader>xrm") 'bookmark-set)
    ;; Like C-x r m, but don’t overwrite an existing bookmark.
    (evil-define-key '(normal) 'global (kbd "<leader>xrM") 'bookmark-set-no-overwrite)
    ;; List all bookmarks (list-bookmarks).
    (evil-define-key '(normal) 'global (kbd "<leader>xrl") 'bookmark-bmenu-list)

    ;; evil for agenda
    (evil-define-key '(normal) 'global (kbd "<leader>ca") 'org-agenda)
    (evil-define-key '(normal) 'global (kbd "<leader>cc") 'org-capture)

    ;; evil for org mode
    (evil-define-key '(normal) org-mode-map (kbd "<leader>ct") 'org-todo)
    (evil-define-key '(normal) org-mode-map (kbd "<leader>cw") 'org-refile)
    (evil-define-key '(normal) org-mode-map (kbd "<leader>cc") 'org-ctrl-c-ctrl-c)
    (evil-define-key '(normal) org-mode-map (kbd "<leader>ck") 'org-kill-note-or-show-branches)
    (evil-define-key '(normal) org-mode-map (kbd "<tab>") 'org-cycle)

    ;; evil for hs mode
    (evil-define-key '(normal) hs-minor-mode-map (kbd "<leader>za") 'evil-toggle-fold)

    ;; Evil on docker mode
    (evil-set-initial-state 'docker-image-mode 'insert)
    (evil-set-initial-state 'docker-container-mode 'insert)

    ;; Evil escape mode
    (with-package evil-escape
      (autoload 'evil-escape-mode "evil-escape" "auto load evil escape mode" t)
      (with-eval-after-load 'evil-escape
	(setf evil-escape-key-sequence "jk")
	(setq-default evil-escape-delay 0.2))
      (add-hook 'evil-mode-hook #'evil-escape-mode))

    ;; Evil surround mode
    ;; (when (add-to-load-path "evil-surround")
    ;; 	(autoload 'evil-surround-mode "evil-surround" "Auto load evil surround mode" t)
    ;; 	(autoload 'global-evil-surround-mode "evil-surround" "Auto load evil surround mode" t)
    ;; 	(add-hook 'evil-mode-hook #'global-evil-surround-mode))
    )

  (evil-mode 1))

(provide 'init-evil)
;;; init-evil.el ends here
