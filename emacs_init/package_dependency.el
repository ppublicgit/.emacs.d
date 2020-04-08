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
  '(;; GLOBALS SETUP
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
    company;;
    magit;;
    git-gutter+;;
    sr-speedbar;;
    multiple-cursors;;
    workgroups2;;

    ;; HASKELL SETUP
    haskell-mode ;;hm
    flycheck-ghcmod ;;fg

    ;; PYTHON SETUP
    elpy ;;el
    flycheck ;;fc
    blacken ;;bl pip install black in correct virtual environment
    ein ;;ei

    ;; LATEX SETUP
    auctex ;; au
    reftex ;;rf
    pdf-tools ;;pdf

    ;; WEB (HTML, CSS, JS) SETUP
    web-mode;;
    company-web;;
    emmet-mode;;
    markdown-preview-eww;;

    ;; R SETUP
    ess;
    ess-R-data-view;;
    ;;company-ess;;

    ;; CPP SETUP
    ;;rtags;;
    irony;;
    ;;company-rtags;;
    company-irony;;
    company-irony-c-headers;;
    ;;flycheck-rtags;;
    flycheck-irony;;
    cmake-ide;;
    dtrt-indent;;
    clean-aindent-mode;;
    ws-butler;;

    ;; ido mode
    flx-ido;;
    ido-vertical-mode;;
    ido-completing-read+;;
    )
  )
;; Scans the list in myPackages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

;; handle installed packages and spin them up

;; set dracula theme
(load-theme 'dracula t)


;;(dolist (package '(use-package))
;; (unless (package-installed-p package)
;;       (package-install package)))

;;(use-package paredit
;;  :ensure t)
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(use-package yasnippet
  :ensure t
  :config
  (use-package yasnippet-snippets
    :ensure t)
  (yas-reload-all))

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(require 'sr-speedbar)
(setq speedbar-show-unknown-files t)
(setq speedbar-use-images nil) ; use text for buttons
(setq sr-speedbar-right-side nil) ; put on left side
