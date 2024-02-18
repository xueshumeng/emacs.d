;;; init-elfeed.el ---                               -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

(with-package elfeed
  (with-eval-after-load 'elfeed
    (add-to-list 'elfeed-feeds "https://sachachua.com/blog/feed/")
    (add-to-list 'elfeed-feeds "https://www.xianmin.org/index.xml")
    (add-to-list 'elfeed-feeds "https://zilongshanren.com/index.xml")
    (add-to-list 'elfeed-feeds "https://www.zmonster.me/atom.xml")
    (add-to-list 'elfeed-feeds "https://remacs.cc/index.xml")
    ))

(provide 'init-elfeed)
;;; init-elfeed.el ends here
