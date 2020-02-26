(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (haskell-mode dracula-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun haskell-setup ()
    (make-local-variable 'tab-stop-list)
    (setq tab-stop-list (number-sequence 0 120 4))
    (setq indent-line-function 'tab-to-tab-stop)
    (setq haskell-indent-spaces 4))
(add-hook 'haskell-mode-hook 'haskell-setup)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(eval-after-load 'flycheck '(require 'flycheck-ghcmod))
(add-hook 'haskell-mode-hook 'yas-minor-mode)
