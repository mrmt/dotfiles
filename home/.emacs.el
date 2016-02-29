;; -*-emacs-lisp-*-

(progn
  ;; lang
  (set-language-environment 'Japanese)
  (prefer-coding-system 'utf-8)
  )

(progn
  ;; OS X specific
  (setq default-input-method "MacOSX")
  (setq mac-command-key-is-meta t)
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'meta)
  (mac-add-key-passed-to-system 'shift)
  (add-hook 'minibuffer-setup-hook 'mac-change-language-to-us)
  (add-hook 'after-init-hook 'mac-change-language-to-us)
  (setq ns-pop-up-frames nil)
  (setq browse-url-generic-program "open")
  (setq browse-url-browser-function 'browse-url-generic)

  (progn
    ;; font
    (create-fontset-from-ascii-font
     "Menlo-13:weight=normal:slant=normal" nil "menlokakugo")
    (set-fontset-font "fontset-menlokakugo"
		      'unicode
		      (font-spec :family "Hiragino Kaku Gothic ProN" :size 14)
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

  (defun dakuten ()
    "泣き別れた濁点・半濁点を修正"
    (interactive)
    (save-excursion
      (replace-all "ゔ" "ゔ")
      (replace-all "ヴ" "ヴ")
      (replace-all "が" "が")
      (replace-all "ぎ" "ぎ")
      (replace-all "ぐ" "ぐ")
      (replace-all "げ" "げ")
      (replace-all "ご" "ご")
      (replace-all "ざ" "ざ")
      (replace-all "じ" "じ")
      (replace-all "ず" "ず")
      (replace-all "ぜ" "ぜ")
      (replace-all "ぞ" "ぞ")
      (replace-all "だ" "だ")
      (replace-all "ぢ" "ぢ")
      (replace-all "づ" "づ")
      (replace-all "で" "で")
      (replace-all "ど" "ど")
      (replace-all "ば" "ば")
      (replace-all "び" "び")
      (replace-all "ぶ" "ぶ")
      (replace-all "べ" "べ")
      (replace-all "ぼ" "ぼ")
      (replace-all "ガ" "ガ")
      (replace-all "ギ" "ギ")
      (replace-all "グ" "グ")
      (replace-all "ゲ" "ゲ")
      (replace-all "ゴ" "ゴ")
      (replace-all "ザ" "ザ")
      (replace-all "ジ" "ジ")
      (replace-all "ズ" "ズ")
      (replace-all "ゼ" "ゼ")
      (replace-all "ゾ" "ゾ")
      (replace-all "ダ" "ダ")
      (replace-all "ヂ" "ヂ")
      (replace-all "ヅ" "ヅ")
      (replace-all "デ" "デ")
      (replace-all "ド" "ド")
      (replace-all "バ" "バ")
      (replace-all "ビ" "ビ")
      (replace-all "ブ" "ブ")
      (replace-all "ベ" "ベ")
      (replace-all "ボ" "ボ")
      (replace-all "ぱ" "ぱ")
      (replace-all "ぴ" "ぴ")
      (replace-all "ぷ" "ぷ")
      (replace-all "ぺ" "ぺ")
      (replace-all "ぽ" "ぽ")
      (replace-all "パ" "パ")
      (replace-all "ピ" "ピ")
      (replace-all "プ" "プ")
      (replace-all "ペ" "ペ")
      (replace-all "ポ" "ポ")))

  (defun replace-all (a b)
      (goto-char (point-min))
      (replace-string a b))
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
