(require 'ibuffer)
(add-hook 'ibuffer-mode-hook (lambda () (ibuffer-auto-mode 1)))
(setq ibuffer-show-empty-filter-groups nil)

(setq ibuffer-saved-filter-groups
          (quote (("default"
                   ("dired" (mode . dired-mode))
                   ("shell" (mode . shell-mode))
                   ;;("perl" (mode . cperl-mode))
                   ("python" (mode . python-mode))
                   ("web" (mode . web-mode))
                   ("c++" (mode . cpp-mode))
                   ("haskell" (mode . haskell-mode))
                   ("elisp" (mode . emacs-lisp-mode))
                   ("latex" (mode . tex-mode))
                   ("sql" (mode . sql-mode))
                   ("org" (or
                           (name . "^\*\.org$")))
                   ("pdf" (or
                           (name . "^\*.pdf$")))
                   ("erc" (mode . erc-mode))
                   ("planner" (or
                               (name . "^\\*Calendar\\*$")
                               (name . "^diary$")
                               (mode . muse-mode)))
                   ("emacs" (or
                             (name . "^\\*scratch\\*$")
                             (name . "^\\*Messages\\*$")
                             (name . "^\\*Completions\\*$")))
                   ("gnus" (or
                            (mode . message-mode)
                            (mode . bbdb-mode)
                            (mode . mail-mode)
                            (mode . gnus-group-mode)
                            (mode . gnus-summary-mode)
                            (mode . gnus-article-mode)
                            (name . "^\\.bbdb$")
                            (name . "^\\.newsrc-dribble")))))))

(add-hook 'ibuffer-mode-hook
              (lambda ()
                (ibuffer-switch-to-saved-filter-groups "default")))

;;;; turn off header for ibuffer
;;(defadvice ibuffer-update-title-and-summary (after remove-column-titles)
;;   (save-excursion
;;      (set-buffer "*Ibuffer*")
;;      (toggle-read-only 0)
;;      (goto-char 1)
;;      (search-forward "-\n" nil t)
;;      (delete-region 1 (point))
;;      (let ((window-min-height 1))
;;        ;; save a little screen estate
;;        (shrink-window-if-larger-than-buffer))
;;      (toggle-read-only)))
;;
;;(ad-activate 'ibuffer-update-title-and-summary)

;; Use human readable Size column instead of original one
(define-ibuffer-column size-h
  (:name "Size" );;:inline t)
  (cond
   ((> (buffer-size) 1000000) (format "%7.1fM" (/ (buffer-size) 1000000.0)))
   ((> (buffer-size) 100000) (format "%7.0fk" (/ (buffer-size) 1000.0)))
   ((> (buffer-size) 1000) (format "%7.1fk" (/ (buffer-size) 1000.0)))
   (t (format "%8d" (buffer-size)))))

;; Modify the default ibuffer-formats
(setq ibuffer-formats
      '((mark modified read-only " "
              (name 18 18 :left :elide)
              " "
              (size-h 9 -1 :right)
              " "
              (mode 16 16 :left :elide)
              " "
              filename-and-process)))

;; wrap at top and bottom
;; and use up and down to skip names of filtered groups and
;; jump to next group
;; left and right jump to beginning and end of a group
(defun ibuffer-advance-motion (direction)
  (forward-line direction)
  (beginning-of-line)
  (if (not (get-text-property (point) 'ibuffer-filter-group-name))
      t
    (ibuffer-skip-properties '(ibuffer-filter-group-name)
                             direction)
    nil))

(defun ibuffer-previous-line (&optional arg)
  "Move backwards ARG lines, wrapping around the list if necessary."
  (interactive "P")
  (or arg (setq arg 1))
  (let (err1 err2)
    (while (> arg 0)
      (cl-decf arg)
      (setq err1 (ibuffer-advance-motion -1)
            err2 (if (not (get-text-property (point) 'ibuffer-title))
                     t
                   (goto-char (point-max))
                   (beginning-of-line)
                   (ibuffer-skip-properties '(ibuffer-summary
                                              ibuffer-filter-group-name)
                                            -1)
                   nil)))
    (and err1 err2)))
(defun ibuffer-next-line (&optional arg)
  "Move forward ARG lines, wrapping around the list if necessary."
  (interactive "P")
  (or arg (setq arg 1))
  (let (err1 err2)
    (while (> arg 0)
      (cl-decf arg)
      (setq err1 (ibuffer-advance-motion 1)
            err2 (if (not (get-text-property (point) 'ibuffer-summary))
                     t
                   (goto-char (point-min))
                   (beginning-of-line)
                   (ibuffer-skip-properties '(ibuffer-summary
                                              ibuffer-filter-group-name
                                              ibuffer-title)
                                            1)
                   nil)))
    (and err1 err2)))

(defun ibuffer-next-header ()
  (interactive)
  (while (ibuffer-next-line)))

(defun ibuffer-previous-header ()
  (interactive)
  (while (ibuffer-previous-line)))

;;(define-key (kbd "<up>") #'compile)

(define-key ibuffer-mode-map (kbd "<up>") 'ibuffer-previous-line)
(define-key ibuffer-mode-map (kbd "<down>") 'ibuffer-next-line)
(define-key ibuffer-mode-map (kbd "<right>") 'ibuffer-previous-header)
(define-key ibuffer-mode-map (kbd "<left>") 'ibuffer-next-header)
