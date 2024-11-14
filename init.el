;;; init.el --- setup
;;; Commentary:
;;; Code:

(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))
(require 'bind-key)
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
 '(package-selected-packages
   '(rg go-mode markdown-mode treemacs-magit treemacs-all-the-icons treemacs-projectile treemacs projectile jtsx vertico-prescient vertico-posframe typescript-mode treesit-auto tempel symbol-overlay spacious-padding rainbow-delimiters quelpa-use-package puni pulsar perfect-margin org-modern orderless nerd-icons-dired nerd-icons-completion mermaid-mode marginalia goggles fontaine exec-path-from-shell emojify embark-consult eldoc-box eglot-signature-eldoc-talkative eglot-booster ef-themes difftastic diff-hl corfu-prescient copilot consult-eglot cape breadcrumb blackout aggressive-indent)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
