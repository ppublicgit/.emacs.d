;; current packages installed
;; globals
;; keychord
;; acejump
;; dracula theme
;; haskell mode
;; async
;; bind-key
;; helm
;; helm-core
;; key-chord
;; popup

;; c++ support
;; rtags
;; rtags-helm
;; company-rtags


;; python support
;; elpy
;; flycheck
;; blacken (black formatting on save, must pip install black into environment)
;; ein emacs Ipython Notebook

;; haskell support
;; 

;; LaTex support
;; auctex
;; reftex

(require 'package)
;; Require Melpa
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))

(require 'ido)

;; Installs packages
;; myPackages contains a list of package names
(defvar myPackages
  '(dracula-theme                   ;; Theme
    key-chord		            ;; key-chord package
    )
  )
;; Scans the list in myPackages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

;; set dracula theme
(load-theme 'dracula t)


;;(dolist (package '(use-package))
;; (unless (package-installed-p package)
;;       (package-install package)))

;;(use-package paredit
;;  :ensure t)


