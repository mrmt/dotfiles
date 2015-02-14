;; -*-emacs-lisp-*-

(progn
  ;; lang
  (set-language-environment 'Japanese)
  (prefer-coding-system 'utf-8)
  )

(progn
  ;; OS X specific
  (set-input-method "MacOSX")
  (setq mac-command-key-is-meta t)
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'meta)
  (setq browse-url-generic-program "open")
  (setq browse-url-browser-function 'browse-url-generic)

  (progn
    ;; font
    (create-fontset-from-ascii-font
     "Menlo-13:weight=normal:slant=normal" nil "menlokakugo")
    (set-fontset-font "fontset-menlokakugo"
		      'unicode
		      (font-spec :family "Hiragino Kaku Gothic ProN" :size 16)
		      nil
		      'append)
    (setq default-frame-alist '((width . 80) (height . 70)))
    (add-to-list 'default-frame-alist '(font . "fontset-menlokakugo"))
    )
  )

(progn
  ;; packages
  (require 'package)
  (add-to-list 'package-archives
	       '("melpa" . "http://melpa.milkbox.net/packages/"))
  (add-to-list 'package-archives
	       '("marmalade" . "http://marmalade-repo.org/packages/"))
  (package-initialize))

(progn
  ;; handy funcs
  (defun cleanup ()
    "行末空白を取る"
    (interactive)
    (replace-regexp "[ \t]*$" ""))

  (defun duplicate-line ()
    "カレント行を複製(まだちゃんとできていない)"
    (interactive)
    (save-excursion
      (beginning-of-line)
      (let ((start (point))
	    (end))
	(end-of-line)
	(copy-to-register 'z start (point) nil)
	(beginning-of-line)
	(insert (get-register 'z))
	(insert "\n"))))
  (global-set-key "\ep" 'duplicate-line)
  )

(progn
  ;; behavior
  (setq inhibit-startup-message t)
  (setq make-backup-files nil)
  (setq require-final-newline t)
  (setq next-line-add-newlines nil)
  (setq yank-excluded-properties t)
  (put 'eval-expression 'disabled nil)
  (put 'narrow-to-region 'disabled nil)
  )

(progn
  ;; key bindings
  (global-set-key "\e[" 'backward-paragraph)
  (global-set-key "\e]" 'forward-paragraph)
  (global-set-key "\eg" 'grep)
  (global-set-key "\ej" 'goto-line)
  (global-set-key "\ec" 'compile)
  (global-set-key "\e\C-h" 'backward-kill-word)
  (global-set-key "\C-o" 'toggle-input-method)
  (global-set-key "\C-c\C-w" 'kill-rectangle)
  (global-set-key "\C-c\C-y" 'yank-rectangle)
  )

(progn
  ;; ui
  (show-paren-mode nil)
  (tool-bar-mode 0)
  (load-theme 'misterioso)
  (deactivate-input-method)
  (cd "~/")
  )

;; ready to go
