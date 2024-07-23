;;; init.el --- setup
;;; Commentary:
;;; Code:

(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))

;; ファイルの生成・読み込み（elcでは実行されない）
(eval-when-compile
  (require 'org)
  (org-babel-tangle-file (expand-file-name "config.org" user-emacs-directory))
  (byte-compile-file (expand-file-name "config.el" user-emacs-directory)))

;;; 設定ファイルをネイティブコンパイル
(defun byte-compile-config-file ()
  (interactive)
  (byte-compile-file (expand-file-name "config.el" user-emacs-directory))
  (byte-compile-file (expand-file-name "init.el" user-emacs-directory)))

;; 設定の読み込み
(load (expand-file-name "config.elc" user-emacs-directory))
(provide 'init)
