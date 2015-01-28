; -*-emacs-lisp-*-
(cd "~/")

(setq inhibit-startup-message t)

(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)
(set-keyboard-coding-system 'sjis)
(set-input-method "MacOSX")
(deactivate-input-method)

(setq mac-command-key-is-meta t)
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'meta)

(tool-bar-mode 0)
(setq make-backup-files nil)
(show-paren-mode nil)
(load-theme 'whiteboard)

(setq browse-url-generic-program "open")
(setq browse-url-browser-function 'browse-url-generic)
(setq require-final-newline t)
(setq next-line-add-newlines nil)
(put 'eval-expression 'disabled nil)

(create-fontset-from-ascii-font
 "Menlo-12:weight=normal:slant=normal" nil "menlokakugo")
(set-fontset-font "fontset-menlokakugo"
		  'unicode
		  (font-spec :family "Hiragino Kaku Gothic ProN" :size 14)
		  nil
		  'append)
(setq default-frame-alist '((width . 80) (height . 70)))
(add-to-list 'default-frame-alist '(font . "fontset-menlokakugo"))

;; Excel, Numbersからペーストするとき属性は無視する
(setq yank-excluded-properties t)

;;
;; 行末空白を取る
;;
(defun cleanup ()
  (interactive)
  (replace-regexp "[ \t]*$" ""))

;;
;; カレント行を複製(まだちゃんとできていない)
;;
(defun dup-line ()
  "カレント行を複製します."
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
(global-set-key "\e\C-h" 'backward-kill-word)
(global-set-key "\C-o" 'toggle-input-method)
(global-set-key "\ep" 'dup-line)
(global-set-key "\eg" 'grep)
(global-set-key "\ej" 'goto-line)
(global-set-key "\ec" 'compile)
(global-set-key "\C-c\C-w" 'kill-rectangle)
(global-set-key "\C-c\C-y" 'yank-rectangle)
(global-set-key "\e[" 'backward-paragraph)
(global-set-key "\e]" 'forward-paragraph)
(put 'narrow-to-region 'disabled nil)
