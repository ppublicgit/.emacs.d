(defun my-c-mode-common-hook ()
 ;; my customizations for all of c-mode, c++-mode, objc-mode, java-mode
 (c-set-offset 'substatement-open 0)
 ;; other customizations can go here
 (setq c++-tab-always-indent t)
 (setq c-basic-offset 4) ;; Default is 2
 (setq c-indent-level 4) ;; Default is 2
 (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
 (setq tab-width 4)
 (setq indent-tabs-mode t)  ; use spaces only if nil
 )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;;(require 'rtags)
;;(require 'company-rtags)

;;(setq rtags-completions-enabled t)
;;(eval-after-load 'company
;;  '(add-to-list
;;    'company-backends 'company-rtags))
;;(setq rtags-autostart-diagnostics t)
;;(rtags-enable-standard-keybindings)

;;(require 'rtags-helm)
;;(setq rtags-use-helm t)

;;(add-hook 'c++-mode-hook 'irony-mode)
;;(add-hook 'c-mode-hook 'irony-mode)
;;(add-hook 'objc-mode-hook 'irony-mode)

;;(defun my-irony-mode-hook ()
;;  (define-key irony-mode-map [remap completion-at-point]
;;    'irony-completion-at-point-async)
;;  (define-key irony-mode-map [remap complete-symbol]
;;    'irony-completion-at-point-async))

;;(add-hook 'irony-mode-hook 'my-irony-mode-hook)
;;(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)