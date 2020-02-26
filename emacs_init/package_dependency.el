(require 'package)
;; Require Melpa
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))

;; Installs packages
;; myPackages contains a list of package names
(defvar myPackages
  '(;; globals
    dracula-theme                   ;; Theme
    ace-jump-mode ;;acejump
    async ;;as
    bind-key ;;bk
    helm ;; hm
    helm-core ;;hc
    key-chord ;;kc
    popup ;;pu
    use-package;;
    yasnippet;;
    rainbow-delimiters;;
    expand-region;;
    ;;company-mode;;
    magit;;
    ;; haskell
    haskell-mode ;;hm
    flycheck-ghcmod ;;fg
    ;; python
    elpy ;;el
    flycheck ;;fc
    blacken ;;bl pip install black in correct virtual environment
    ein ;;ei
    ;; latex
    auctex ;; au
    reftex ;;rf
    pdf-tools ;;pdf
    ;; web development
    web-mode;;
    company-web;;
    emmet-mode;;
    markdown-preview-eww;;
    ;; R programming
    ess;
    ess-R-data-view;;
    ;;company-ess;;
    ;; CPP
    rtags;;
    ;;rtags-helm;;
    irony;;
    company-rtags;;
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
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(require 'ido)

(use-package yasnippet
  :ensure t
  :config
  (use-package yasnippet-snippets
    :ensure t)
  (yas-reload-all))
