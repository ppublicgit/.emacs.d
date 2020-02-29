;; ====================================
;; Development Setup
;; ====================================

;; Enable elpy
(pyvenv-activate "~/.virtualenvs/main/")
;;(setq elpy-rpc-python-command "/usr/bin/python")
(setq elpy-rpc-virtualenv-path 'current)
(elpy-enable)


;; Use IPython for REPL
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")



;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))


;; enable yasnippet
(add-hook 'python-mode-hook 'yas-minor-mode)
