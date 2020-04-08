;; RTAGS for navigation
;; add line in subdirectory Makefile if using cmake
;; cmake:
;;    cd ../build && cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..
;; then in build directory start
;; rdm & rc -J .

;; rtags navigation should now work
;;(defun ciao-goto-symbol ()
;;  (interactive)
;;  (deactivate-mark)
;;  (ring-insert find-tag-marker-ring (point-marker))
;;  (or (and (require 'rtags nil t)
;;           (rtags-find-symbol-at-point))
;;      (and (require 'semantic/ia)
;;           (condition-case nil
;;               (semantic-ia-fast-jump (point))
;;             (error nil)))))
;;(define-key c++-mode-map (kbd "M-.") 'ciao-goto-symbol)
;;(define-key c++-mode-map (kbd "M-,") 'pop-tag-mark)

;; if not cmake then use bear to create compile_commands.json
;; make clean
;; bear make



;; turn on irony mode
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
(require 'company-irony-c-headers)
;; Load with `irony-mode` as a grouped backend
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))
