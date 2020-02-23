(add-hook 'ibuffer-mode-hook (lambda () (ibuffer-auto-mode 1)))
(setq inhibit-startup-message t)
(setq-default buffer-file-encoding-system 'utf-8-unix)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq-default case-fold-search nil)
(add-hook 'prog-mode-hook 'linum-mode)
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives
           '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )
(setq custom-safe-themes t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(when (display-graphic-p)
  (load-theme 'dracula t)
  )
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

;; move to first non-whitespace character in the line
(defun back-to-indentation-or-beginning () (interactive)
   (if (= (point) (progn (back-to-indentation) (point)))
       (beginning-of-line)))

;; get rid of trailing whitespace before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Turn off the bell
(setq ring-bell-function (lambda nil (message "")))
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

(setq inhibit-startup-message t)
(setq-default visible-bell t)
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq-default buffer-file-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

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
;;(add-to-list 'display-buffer-alist
;;     '("^\\*shell\\*$" . (display-buffer-same-window)))

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


;; key-chord
(require 'key-chord)
(key-chord-mode 1)
;; opening buffers
(key-chord-define-global "fj" 'helm-find-files)
(key-chord-define-global "lx" 'ibuffer)

;; closing buffers
(key-chord-define-global "kz" 'delete-window)
(key-chord-define-global "kx" 'kill-buffer)

;; splitting windows
(key-chord-define-global "zn" 'split-window-right)
(key-chord-define-global "zm" 'split-window-below)
(key-chord-define-global "z," 'balance-windows)
(key-chord-define-global "z." 'delete-other-windows)

;; moving windows
(key-chord-define-global "/q" 'windmove-right)
(key-chord-define-global "zp" 'windmove-left)
(key-chord-define-global "pq" 'windmove-up)
(key-chord-define-global "z/" 'windmove-down)

;; rectangle actions
(key-chord-define-global "vp" 'rectangle-mark-mode)
(key-chord-define-global "kk" 'copy-rectangle-to-register)
(key-chord-define-global "vk" 'kill-rectangle)
(key-chord-define-global "a;" 'replace-rectangle)
(key-chord-define-global "vv" 'open-rectangle)

;; register copy and insert
(key-chord-define-global "jq" 'copy-to-register)
(key-chord-define-global "qq" 'insert-register)

;; ace-jump, movement
(key-chord-define-global "jc" 'ace-jump-char-mode)
(key-chord-define-global "jl" 'ace-jump-line-mode)
(key-chord-define-global "jw" 'ace-jump-word-mode)
(key-chord-define-global "xh" 'backward-sexp)
(key-chord-define-global "xj" 'forward-sexp)
(key-chord-define-global "uu" 'point-to-register)
(key-chord-define-global "jj" 'jump-to-register)

;; macros
(key-chord-define-global "hh" 'start-kbd-macro)
(key-chord-define-global "xx" 'kmacro-end-and-call-macro)

;; Misc commands
;;(key-chord-define-global "fk" 'bub-revert-all-buffers)
;;(key-chord-define-global "yy" 'align-regexp)
;;(key-chord-define-global "qk" 'er/expand-region)
;;(key-chord-define-global "jg" 'join-region)
;;(key-chord-define-global "js" 'replace-string)
;;(key-chord-define-global "zz" 'magit-status)
;;(key-chord-define-global "qf" 'cua-mode)

(defun haskell-setup ()
    (make-local-variable 'tab-stop-list)
    (setq tab-stop-list (number-sequence 0 120 4))
    (setq indent-line-function 'tab-to-tab-stop)
    (setq haskell-indent-spaces 4))
(add-hook 'haskell-mode-hook 'haskell-setup)


(global-visual-line-mode 1); Proper line wrapping
;;(global-hl-line-mode 1); Highlight current row
(show-paren-mode 1); Matches parentheses and such in every mode
;;(set-fringe-mode '(0 . 0)); Disable fringe because I use visual-line-mode
;;(set-face-background hl-line-face "#f2f1f0"); Same color as greyness in gtk
;;(setq inhibit-splash-screen t); Disable splash screen
(setq visible-bell t); Flashes on error
(setq calendar-week-start-day 1); Calender should start on Monday
(add-to-list 'default-frame-alist '(height . 59)); Default frame height.

;;; AUCTeX
;; Customary Customization, p. 1 and 16 in the manual, and http://www.emacswiki.org/emacs/AUCTeX#toc2
(setq TeX-parse-self t); Enable parse on load.
(setq TeX-auto-save t); Enable parse on save.
(setq-default TeX-master nil)

(setq TeX-PDF-mode t); PDF mode (rather than DVI-mode)

(add-hook 'TeX-mode-hook 'flyspell-mode); Enable Flyspell mode for TeX modes such as AUCTeX. Highlights all misspelled words.
(add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode); Enable Flyspell program mode for emacs lisp mode, which highlights all misspelled words in comments and strings.
(setq ispell-dictionary "english"); Default dictionary. To change do M-x ispell-change-dictionary RET.
(add-hook 'TeX-mode-hook
          (lambda () (TeX-fold-mode 1))); Automatically activate TeX-fold-mode.
(setq LaTeX-babel-hyphen nil); Disable language-specific hyphen insertion.

;; " expands into csquotes macros (for this to work babel must be loaded after csquotes).
(setq LaTeX-csquotes-close-quote "}"
      LaTeX-csquotes-open-quote "\\enquote{")

;; LaTeX-math-mode http://www.gnu.org/s/auctex/manual/auctex/Mathematics.html
(add-hook 'TeX-mode-hook 'LaTeX-math-mode)

;;; RefTeX
;; Turn on RefTeX for AUCTeX http://www.gnu.org/s/auctex/manual/reftex/reftex_5.html
(add-hook 'TeX-mode-hook 'turn-on-reftex)

(eval-after-load 'reftex-vars; Is this construct really needed?
  '(progn
     (setq reftex-cite-prompt-optional-args t); Prompt for empty optional arguments in cite macros.
     ;; Make RefTeX interact with AUCTeX, http://www.gnu.org/s/auctex/manual/reftex/AUCTeX_002dRefTeX-Interface.html
     (setq reftex-plug-into-AUCTeX t)
     ;; So that RefTeX also recognizes \addbibresource. Note that you
     ;; can't use $HOME in path for \addbibresource but that "~"
     ;; works.
     (setq reftex-bibliography-commands '("bibliography" "nobibliography" "addbibresource"))
;     (setq reftex-default-bibliography '("UNCOMMENT LINE AND INSERT PATH TO YOUR BIBLIOGRAPHY HERE")); So that RefTeX in Org-mode knows bibliography
     (setcdr (assoc 'caption reftex-default-context-regexps) "\\\\\\(rot\\|sub\\)?caption\\*?[[{]"); Recognize \subcaptions, e.g. reftex-citation
     (setq reftex-cite-format; Get ReTeX with biblatex, see https://tex.stackexchange.com/questions/31966/setting-up-reftex-with-biblatex-citation-commands/31992#31992
           '((?t . "\\textcite[]{%l}")
             (?a . "\\autocite[]{%l}")
             (?c . "\\cite[]{%l}")
             (?s . "\\smartcite[]{%l}")
             (?f . "\\footcite[]{%l}")
             (?n . "\\nocite{%l}")
             (?b . "\\blockcquote[]{%l}{}")))))

;; Fontification (remove unnecessary entries as you notice them) http://lists.gnu.org/archive/html/emacs-orgmode/2009-05/msg00236.html http://www.gnu.org/software/auctex/manual/auctex/Fontification-of-macros.html
(setq font-latex-match-reference-keywords
      '(
        ;; biblatex
        ("printbibliography" "[{")
        ("addbibresource" "[{")
        ;; Standard commands
        ;; ("cite" "[{")
        ("Cite" "[{")
        ("parencite" "[{")
        ("Parencite" "[{")
        ("footcite" "[{")
        ("footcitetext" "[{")
        ;; ;; Style-specific commands
        ("textcite" "[{")
        ("Textcite" "[{")
        ("smartcite" "[{")
        ("Smartcite" "[{")
        ("cite*" "[{")
        ("parencite*" "[{")
        ("supercite" "[{")
        ; Qualified citation lists
        ("cites" "[{")
        ("Cites" "[{")
        ("parencites" "[{")
        ("Parencites" "[{")
        ("footcites" "[{")
        ("footcitetexts" "[{")
        ("smartcites" "[{")
        ("Smartcites" "[{")
        ("textcites" "[{")
        ("Textcites" "[{")
        ("supercites" "[{")
        ;; Style-independent commands
        ("autocite" "[{")
        ("Autocite" "[{")
        ("autocite*" "[{")
        ("Autocite*" "[{")
        ("autocites" "[{")
        ("Autocites" "[{")
        ;; Text commands
        ("citeauthor" "[{")
        ("Citeauthor" "[{")
        ("citetitle" "[{")
        ("citetitle*" "[{")
        ("citeyear" "[{")
        ("citedate" "[{")
        ("citeurl" "[{")
        ;; Special commands
        ("fullcite" "[{")))

(setq font-latex-match-textual-keywords
      '(
        ;; biblatex brackets
        ("parentext" "{")
        ("brackettext" "{")
        ("hybridblockquote" "[{")
        ;; Auxiliary Commands
        ("textelp" "{")
        ("textelp*" "{")
        ("textins" "{")
        ("textins*" "{")
        ;; supcaption
        ("subcaption" "[{")))

(setq font-latex-match-variable-keywords
      '(
        ;; amsmath
        ("numberwithin" "{")
        ;; enumitem
        ("setlist" "[{")
        ("setlist*" "[{")
        ("newlist" "{")
        ("renewlist" "{")
        ("setlistdepth" "{")
        ("restartlist" "{")))

(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-source-correlate-start-server t)

;; Update PDF buffers after successful LaTeX runs
(add-hook 'TeX-after-compilation-finished-functions
           #'TeX-revert-document-buffer)
;;(TeX-add-style-hook
;;     "essai_classe"
;;     (lambda ()
;;       (TeX-run-style-hooks
 ;;       "latex2e"
 ;;       "beamer"
 ;;       "booktabs"
 ;;       "graphicx"
 ;;       "icone"
  ;;      "citation")
   ;;  LaTeX-dialect))
