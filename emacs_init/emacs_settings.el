;; showing whitespace
(require 'whitespace)
(setq whitespace-style (quote (face spaces tabs newline space-mark tab-mark)))
(global-whitespace-mode)
;; change buffer mode to ibuffer mode
(add-hook 'ibuffer-mode-hook (lambda () (ibuffer-auto-mode 1)))
;; turn off startup message
(setq inhibit-startup-message t)
;; move to first non-whitespace character in the line
(defun back-to-indentation-or-beginning () (interactive)
   (if (= (point) (progn (back-to-indentation) (point)))
       (beginning-of-line)))
;; fix tabs and indents
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
;; add line numbers for files
(add-hook 'prog-mode-hook 'linum-mode)
;; get rid of trailing whitespace before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; Turn off the bell
(setq-default visible-bell t)
(setq ring-bell-function (lambda nil (message "")))
;;set all encoding to utf-8
(setq-default buffer-file-encoding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
;; no idea but it is here
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq-default case-fold-search nil)
(global-visual-line-mode 1); Proper line wrapping
;;(global-hl-line-mode 1); Highlight current row
(show-paren-mode 1); Matches parentheses and such in every mode
(setq calendar-week-start-day 1); Calender should start on Monday
;;(add-to-list 'default-frame-alist '(height . 59)); Default frame height.
(delete-selection-mode 1)
(setq completion-auto-help nil)

(set-frame-parameter (selected-frame) 'alpha '(90 . 60))
(add-to-list 'default-frame-alist '(alpha . (90 . 60)))

(defun toggle-transparency ()
   (interactive)
   (let ((alpha (frame-parameter nil 'alpha)))
     (set-frame-parameter
      nil 'alpha
      (if (eql (cond ((numberp alpha) alpha)
                     ((numberp (cdr alpha)) (cdr alpha))
                     ;; Also handle undocumented (<active> <inactive>) form.
                     ((numberp (cadr alpha)) (cadr alpha)))
               100)
          '(90 . 60) '(100 . 100)))))
 (global-set-key (kbd "C-c t") 'toggle-transparency)
(tool-bar-mode -1)
