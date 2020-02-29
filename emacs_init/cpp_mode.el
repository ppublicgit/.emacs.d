;; may not be necessary if using rtags
;; install gnu global (global on arch)
;; run gtags at project root in terminal to create
;; a gtags database
;; add a .dir-locals.el at project root
;; ((nil . ((company-clang-arguments . ("-I/home/<user>/project_root/include1/"
;;                                      "-I/home/<user>/project_root/include2/")))))
;; in order to allow company clang to see header files
;; add to .dir-locals.el to complete project local header files for c++
;; (add-to-list 'company-c-headers-path-user "path/to/local/headers")

;; install rtags
;; setup rtags database
;; make a .dir-locals.el in root of project and add
;; ((nil . ((cmake-ide-build-dir . "<PATH_TO_PROJECT_BUILD_DIRECTORY>"))))

;; setup irony database
;; cd /path/to/project/root
;; cmake . -DCMAKE_EXPORT_COMPILE_COMMANDS=1

;; build your project using M-x cmake-ide-compile.
;; Additionally, cmake-ide will automatically update your RTags index as well.

;;(defun my-c-mode-common-hook ()
;; ;; my customizations for all of c-mode, c++-mode, objc-mode, java-mode
;; (c-set-offset 'substatement-open 0)
;; ;; other customizations can go here
;; (setq c++-tab-always-indent t)
;; (setq c-basic-offset 4) ;; Default is 2
;; (setq c-indent-level 4) ;; Default is 2
;; (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
;; (setq tab-width 4)
;; (setq indent-tabs-mode t)  ; use spaces only if nil
;; )
;;(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(cmake-ide-setup)
(add-hook 'c++-mode-hook 'yas-minor-mode)

;; i do not think is necessary if i use rtags
;;;;gtags setup
;;(require 'helm-gtags)
;;;; Enable helm-gtags-mode
;;(add-hook 'dired-mode-hook 'helm-gtags-mode)
;;(add-hook 'eshell-mode-hook 'helm-gtags-mode)
;;(add-hook 'c-mode-hook 'helm-gtags-mode)
;;(add-hook 'c++-mode-hook 'helm-gtags-mode)
;;(add-hook 'asm-mode-hook 'helm-gtags-mode)
;;
;;(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
;;(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
;;(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
;;(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
;;(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
;;(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
;;
;;(setq company-backends (delete 'company-semantic company-backends))
;;(define-key c-mode-map  [(tab)] 'company-complete)
;;(define-key c++-mode-map  [(tab)] 'company-complete)
;;
;;(add-to-list 'company-backends 'company-c-headers)
;;(add-to-list 'company-c-headers-path-system "/usr/include/c++/4.8/")

(setq
 c-default-style "stroustrup"
 )

;;rtags and irony mode setup
;; setup rtags
(require 'rtags)
(require 'company-rtags)

(setq rtags-completions-enabled t)
(eval-after-load 'company
  '(add-to-list
    'company-backends 'company-rtags))
(setq rtags-autostart-diagnostics t)
(rtags-enable-standard-keybindings)

(require 'helm-rtags)
(setq rtags-use-helm t)

;; setup irony mode
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
(setq company-backends (delete 'company-semantic company-backends))

(setq company-idle-delay 0)
(define-key c-mode-map [(tab)] 'company-complete)
(define-key c++-mode-map [(tab)] 'company-complete)

(require 'company-irony-c-headers)
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))


;; setup flycheck with rtags and irony
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)

(require 'flycheck-rtags)

(defun my-flycheck-rtags-setup ()
  (flycheck-select-checker 'rtags)
  (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
  (setq-local flycheck-check-syntax-automatically nil))
;; c-mode-common-hook is also called by c++-mode
(add-hook 'c-mode-common-hook #'my-flycheck-rtags-setup)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

;; handle whitespace
(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)
(require 'dtrt-indent)
(dtrt-indent-mode 1)
(setq dtrt-indent-verbosity 0)
(require 'ws-butler)
(add-hook 'c-mode-common-hook 'ws-butler-mode)

;; allow source code folding
(add-hook 'c-mode-common-hook   'hs-minor-mode)


;; setup gdb debugger
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )
