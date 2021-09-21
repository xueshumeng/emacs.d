(add-hook 'term-mode-hook
	  (lambda ()
	    ;; C-x is the prefix command, rather than C-c
	    (term-set-escape-char ?\C-x)
	    (define-key term-raw-map "\M-y" 'yank-pop)
	    (define-key term-raw-map "\M-w" 'kill-ring-save)))
