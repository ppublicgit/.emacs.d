;;set f9 and C-f9 to compile or recompile respectively

(global-set-key (kbd "<f9>") #'compile)

(global-set-key (kbd "<C-f9>")
                (lambda () (interactive)
                  (save-buffer)
                  (recompile)
                  ))

(global-set-key "\C-c\C-c" 'comment-region)
(global-set-key "\C-c\C-u" 'uncomment-region)

(defun run-bash ()
      (interactive)
      (let ((shell-file-name "C:\\Program Files\\Git\\bin\\bash.exe"))
            (shell "*bash*")))

(defun run-cmdexe ()
      (interactive)
      (let ((shell-file-name "cmd.exe"))
            (shell "*cmd.exe*")))

(setenv  "PATH" (concat

                ;; "c:/Windows/System32" ";"

                 "c:/Windows/Microsoft.NET/Framework/v4.0.30319" ";"

                 "C:\\Windows\\Microsoft.NET\\Framework\\v4.0.30319" ";"

                 ;; Unix tools
                 "C:\\Program Files\\Git\\usr\\bin" ";"

                 ;; User binary files
                 "C:\\User\\paul.abers\\bin" ";"

                 ;; Mono Installation.
                 "c:\\Program Files\\Mono\\bin" ";"

                 "c:\\Program Files\\Mono\\lib\\mono\\4.5" ";"

                 (getenv "PATH")

         ))
(push (cons "\\*shell\\*" display-buffer--same-window-action) display-buffer-alist)

;; set indent unindent key code shortcut
(defun my-indent-region (N)
  (interactive "p")
  (if (use-region-p)
      (progn (indent-rigidly (region-beginning) (region-end) (* N 4))
             (setq deactivate-mark nil))
    (self-insert-command N)))

(defun my-unindent-region (N)
  (interactive "p")
  (if (use-region-p)
      (progn (indent-rigidly (region-beginning) (region-end) (* N -4))
             (setq deactivate-mark nil))
    (self-insert-command N)))

(global-set-key ">" 'my-indent-region)
(global-set-key "<" 'my-unindent-region)
