; from http://stackoverflow.com/a/23254728/578288

; Override the default x-select-text function because it doesn't
; respect x-select-enable-clipboard on OS X.
(defun x-select-text (text))
(setq x-select-enable-clipboard nil)
(setq x-select-enable-primary nil)
(setq mouse-drag-copy-region nil)

; TODO make this cross-platform
(setq interprogram-cut-function 'ns-set-pasteboard)
(setq interprogram-paste-function 'ns-get-pasteboard)
