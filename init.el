; set up package manager
; sources of package-archive setup code:
; http://marmalade-repo.org/
; http://orgmode.org/elpa.html
; http://melpa.milkbox.net/#/getting-started
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
  '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)
(package-initialize)

(load "~/.emacs.d/init_evil.el")

; adaptive-wrap-mode (from the adaptive-wrap package) configuration
; TODO configure to be on by default, but only in source-code-editing major modes (especially not org-mode, which defines its own, good wrap-prefix)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(inhibit-startup-screen t)
 '(org-src-preserve-indentation t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 140 :foundry "outline" :family "Consolas"))))
 '(fringe ((t (:background "grey95" :foreground "gray75")))))

; system-specific settings
; structure from http://www.dotemacs.de/multiemacs.html
(cond
  ((string-match "mingw" system-configuration)
   (set-face-attribute 'default nil :height 110)
   ))


; from http://www.emacswiki.org/emacs/VisualLineMode
(global-visual-line-mode)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))

; disable copy-on-select (including selecting with the keyboard), allowing me to select some text and then paste to overwrite it
(load "~/.emacs.d/disable-copy-on-select-for-os-x.el")

(setq ring-bell-function 'ignore)

; org-mode configuration
(setq org-startup-indented t)
; TODO fix that dedenting subtree (org-shiftmetaleft) can cause it to aggregate headlines below it – subtrees should move below existing complete trees when dedenting

; organize my settings files so that others can easily copy my settings for just one mode (so I can tell people "copy my Org Mode settings into <path-in-.emacs.d> to get started")
