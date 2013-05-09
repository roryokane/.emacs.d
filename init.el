; set up package manager
; sources:
; http://marmalade-repo.org/
; http://orgmode.org/elpa.html
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

; load evil Vim emulation package
; this will only work with a package manager, in Emacs 24
; from http://www.emacswiki.org/emacs/Evil :
(require 'evil)
(evil-mode 1)
; evil configuration
; see evil-maps.el in the evil package for default maps
; move up/down by visual lines instead of logical lines
; from https://bitbucket.org/lyro/evil/issue/13/movement-along-visual-line-breaks-visual#comment-624510
(define-key evil-motion-state-map "j" #'evil-next-visual-line)
(define-key evil-motion-state-map "k" #'evil-previous-visual-line)
; shuffle some motions for easy access to the most common ones
(define-key evil-motion-state-map "`" #'evil-end-of-line)
(define-key evil-motion-state-map "0" #'evil-first-non-blank)
(define-key evil-motion-state-map "^" #'evil-beginning-of-line)
(define-key evil-motion-state-map "'" #'evil-goto-mark)
(define-key evil-motion-state-map "$" #'evil-goto-mark-line)
; not all of these swap mappings have been copied from my .vimrc yet
; TODO write equivalent for noremap Y y$ :
; (progn (evil-delete) (evil-end-of-line)) gives an error, so that can't be the map
; TODO copy other customizations from my .vimrc
; no need to list them individually as I remember them

; adaptive-wrap-mode (from the adaptive-wrap package) configuration
; TODO configure to be on by default, but only in source-code-editing major modes (especially not org-mode, which defines its own, good wrap-prefix)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 140 :foundry "outline" :family "Consolas"))))
 '(fringe ((t (:background "grey95" :foreground "gray75")))))


; from http://www.emacswiki.org/emacs/VisualLineMode
(global-visual-line-mode)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))

; org-mode configuration
(setq org-startup-indented t)
; TODO fix that dedenting subtree (org-shiftmetaleft) can cause it to aggregate headlines below it – subtrees should move below existing complete trees when dedenting

; organize my settings files so that others can easily copy my settings for just one mode (so I can tell people "copy my Org Mode settings into <path-in-.emacs.d> to get started")
