
;; key-chord
(require 'key-chord)
(key-chord-mode 1)
;; opening buffers
(key-chord-define-global "fj" 'helm-find-files)
(key-chord-define-global "lx" 'ibuffer)

;; closing buffers
(key-chord-define-global "kz" 'delete-window)
(key-chord-define-global "kx" 'kill-buffer)

;; splitting windows
(key-chord-define-global "zn" 'split-window-right)
(key-chord-define-global "zm" 'split-window-below)
(key-chord-define-global "z," 'balance-windows)
(key-chord-define-global "z." 'delete-other-windows)

;; moving windows
(key-chord-define-global "/q" 'windmove-right)
(key-chord-define-global "zp" 'windmove-left)
(key-chord-define-global "pq" 'windmove-up)
(key-chord-define-global "z/" 'windmove-down)

;; rectangle actions
(key-chord-define-global "vp" 'rectangle-mark-mode)
(key-chord-define-global "kk" 'copy-rectangle-to-register)
(key-chord-define-global "vk" 'kill-rectangle)
(key-chord-define-global "a;" 'replace-rectangle)
(key-chord-define-global "vv" 'open-rectangle)
(key-chord-define-global "cv" 'string-insert-rectangle)

;; register copy and insert
(key-chord-define-global "jq" 'copy-to-register)
(key-chord-define-global "qq" 'insert-register)

;; ace-jump, movement
(key-chord-define-global "jc" 'ace-jump-char-mode)
(key-chord-define-global "jl" 'ace-jump-line-mode)
(key-chord-define-global "jw" 'ace-jump-word-mode)
(key-chord-define-global "xh" 'backward-sexp)
(key-chord-define-global "xj" 'forward-sexp)
(key-chord-define-global "uu" 'point-to-register)
(key-chord-define-global "jj" 'jump-to-register)

;; macros
(key-chord-define-global "hh" 'start-kbd-macro)
(key-chord-define-global "xx" 'kmacro-end-and-call-macro)

;; Misc commands
;;(key-chord-define-global "fk" 'bub-revert-all-buffers)
;;(key-chord-define-global "yy" 'align-regexp)
(key-chord-define-global "qk" 'er/expand-region)
;;(key-chord-define-global "jg" 'join-region)
(key-chord-define-global "js" 'replace-string)
(key-chord-define-global "zz" 'magit-status)
;;(key-chord-define-global "qf" 'cua-mode)
