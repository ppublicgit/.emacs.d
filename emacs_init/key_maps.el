;;set f9 and C-f9 to compile or recompile respectively

(global-set-key (kbd "<f9>") #'compile)

(global-set-key (kbd "<C-f9>")
                (lambda () (interactive)
                  (save-buffer)
                  (recompile)
                  ))
