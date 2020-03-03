;; path to workgourp
;;(add-to-list 'load-path "/path/to/workgroups.el")
(require 'workgroups2)
;;set workgroups prefix
(setq wg-prefix-key (kbd "C-c w"))
;; load workgourp paths
(setq wg-session-file "~/.emacs.d/emacs_init/.workgroups")
;; Mode Line changes
;; Display workgroups in Mode Line?
(setq wg-mode-line-display-on t)          ; Default: (not (featurep 'powerline))
(setq wg-flag-modified t)                 ; Display modified flags as well
(setq wg-mode-line-decor-left-brace "["
      wg-mode-line-decor-right-brace "]"  ; how to surround it
      wg-mode-line-decor-divider ":")
;; turn workgroups on
(workgroups-mode 1)
;; to create a workgourp: <prefix> c
;; to rename a workgourp <prefix> A
;; to switch to a workgourp <prefix> v
;; switch to workgroup one more in list <prefix> n
;; switch to workgroup one less in list <prefix> p
;; switch to workgroup in position 0 in list <prefix> 0
;; revert to base config <prefix> r
;; update base config <prefix> u
;; move workgruop left in list <prefix> ,
;; move workgroup right in list <prefix> .
;; swithc to workgourp based on buffer <prefix> b
