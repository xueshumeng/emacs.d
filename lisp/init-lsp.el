;;; init-lsp.el --- Language server protocol settings.  -*- lexical-binding: t; -*-

;; Copyright (C) 2021  xueshumeng

;; Author: xueshumeng <xue.shumeng@yahoo.com>
;; Keywords:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(when (maybe-require-package 'lsp-mode)
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setf lsp-keymap-prefix "C-c l")
  (add-hook lsp-mode lsp-enable-which-key-integration)
  (when (maybe-require-package 'lsp-java)
    )
  )

(provide 'init-lsp)
;;; init-lsp.el ends here
