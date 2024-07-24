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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe ((t :background "white")))
 '(header-line ((t :box (:line-width 4 :color "grey90" :style nil))))
 '(header-line-highlight ((t :box (:color "black"))))
 '(keycast-key ((t)))
 '(line-number ((t :background "white")))
 '(mode-line ((t (:inherit ef-themes-ui-variable-pitch :background "#111111" :foreground "#d0ffe0" :box (:line-width (2 . 2) :color "#111111") :overline "#d0ffe0" :height 0.9))))
 '(mode-line-active ((t :background "white" :overline "black" :box (:line-width 6 :color "white" :style nil))))
 '(mode-line-highlight ((t :box (:color "black"))))
 '(mode-line-inactive ((t :background "white" :overline "grey20" :box (:line-width 6 :color "white" :style nil))))
 '(tab-bar-tab ((t :box (:line-width 4 :color "grey85" :style nil))))
 '(tab-bar-tab-inactive ((t :box (:line-width 4 :color "grey75" :style nil))))
 '(tab-line-tab ((t)))
 '(tab-line-tab-active ((t)))
 '(tab-line-tab-inactive ((t)))
 '(vertical-border ((t :background "white" :foreground "white")))
 '(window-divider ((t (:background "white" :foreground "white"))))
 '(window-divider-first-pixel ((t (:background "white" :foreground "white"))))
 '(window-divider-last-pixel ((t (:background "white" :foreground "white")))))
