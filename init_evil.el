; load evil Vim emulation package
; this will only work with a package manager, in Emacs 24
; from http://www.emacswiki.org/emacs/Evil :
(require 'evil)
(evil-mode 1)

; evil configuration
; see evil-maps.el in the evil package for default maps

; move up/down by visual lines instead of logical lines
; from https://bitbucket.org/lyro/evil/issue/13/movement-along-visual-line-breaks-visual#comment-624510
(define-key evil-motion-state-map "k" #'evil-previous-visual-line)
(define-key evil-motion-state-map "j" #'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<up>") #'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<down>") #'evil-next-visual-line)

; shuffle some motions for easy access to the most common ones
(define-key evil-motion-state-map "`" #'evil-end-of-line)
(define-key evil-motion-state-map "0" #'evil-first-non-blank)
(define-key evil-motion-state-map "^" #'evil-beginning-of-line)
(define-key evil-motion-state-map "'" #'evil-goto-mark)
(define-key evil-motion-state-map "$" #'evil-goto-mark-line)
(define-key evil-motion-state-map "g`" #'evil-end-of-visual-line)
(define-key evil-motion-state-map "g0" #'evil-first-non-blank-of-visual-line)
(define-key evil-motion-state-map "g^" #'evil-beginning-of-visual-line)
; not all of these swap mappings have been copied from my .vimrc yet

; TODO write equivalent for noremap Y y$ :
; (progn (evil-delete) (evil-end-of-line)) gives an error, so that can't be the map

; TODO copy other customizations from my .vimrc
; no need to list them individually as I remember them

; from https://github.com/drewfrank/dotfiles/blob/master/.emacs :
; make esc quit everything.
; FIXME it isn't working, though
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'abort-recursive-edit)
(define-key minibuffer-local-ns-map [escape] 'abort-recursive-edit)
(define-key minibuffer-local-completion-map [escape] 'abort-recursive-edit)
(define-key minibuffer-local-must-match-map [escape] 'abort-recursive-edit)
(define-key minibuffer-local-isearch-map [escape] 'abort-recursive-edit)

; define a leader key for use in custom mappings.
(let ((leader ","))
(define-key evil-normal-state-map (concat leader "cc") 'comment-region)
(define-key evil-visual-state-map (concat leader "cc") 'comment-region)
(define-key evil-normal-state-map (concat leader "cu") 'uncomment-region)
(define-key evil-visual-state-map (concat leader "cu") 'uncomment-region)
)

; TODO add evil-nerd-commenter
; instructions at https://github.com/redguardtoo/evil-nerd-commenter
