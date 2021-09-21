;;; init.el ---                       -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; (when (maybe-require-package 'simple-httpd)
;;   (setf httpd-host "0.0.0.0")
;;   (setf httpd-port 8090))

(setq url-proxy-services
      '(("no_proxy" . "^\\(localhost\\|10.*\\)")
        ("http" . "socks5://127.0.0.1:1080")        ;; notice without protocol, do NOT add protocol
        ("https" . "socks5://127.0.0.1:1080")))

;; (setq request-curl-options
;;       (nconc '("--proxy" "socks5://127.0.0.1:1080")))

(provide 'init-network)
;;; init-network.el ends here
