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

  (defun hankaku ()
    "全角英数字を半角にする"
    (interactive)
    (save-excursion
      (replace-all "　" " ")
      (replace-all "０" "0")
      (replace-all "１" "1")
      (replace-all "２" "2")
      (replace-all "３" "3")
      (replace-all "４" "4")
      (replace-all "５" "5")
      (replace-all "６" "6")
      (replace-all "７" "7")
      (replace-all "８" "8")
      (replace-all "９" "9")
      (replace-all "！" "!")
      (replace-all "＠" "@")
      (replace-all "＃" "#")
      (replace-all "＄" "$")
      (replace-all "％" "%")
      (replace-all "＾" "^")
      (replace-all "＆" "&")
      (replace-all "＊" "*")
      (replace-all "（" "(")
      (replace-all "）" ")")
      (replace-all "＿" "_")
      (replace-all "＋" "+")
      (replace-all "ー" "ｰ")
      (replace-all "＝" "=")
      (replace-all "｛" "{")
      (replace-all "｝" "}")
      (replace-all "「" "｢")
      (replace-all "」" "｣")
      (replace-all "｜" "|")
      (replace-all "；" ";")
      (replace-all "：" ":")
      (replace-all "＜" "<")
      (replace-all "＞" ">")
      (replace-all "？" "?")
      (replace-all "｀" "`")
      (replace-all "，" ",")
      (replace-all "．" ".")
      (replace-all "ａ" "a")
      (replace-all "ｂ" "b")
      (replace-all "ｃ" "c")
      (replace-all "ｄ" "d")
      (replace-all "ｅ" "e")
      (replace-all "ｆ" "f")
      (replace-all "ｇ" "g")
      (replace-all "ｈ" "h")
      (replace-all "ｉ" "i")
      (replace-all "ｊ" "j")
      (replace-all "ｋ" "k")
      (replace-all "ｌ" "l")
      (replace-all "ｍ" "m")
      (replace-all "ｎ" "n")
      (replace-all "ｏ" "o")
      (replace-all "ｐ" "p")
      (replace-all "ｑ" "q")
      (replace-all "ｒ" "r")
      (replace-all "ｓ" "s")
      (replace-all "ｔ" "t")
      (replace-all "ｕ" "u")
      (replace-all "ｖ" "v")
      (replace-all "ｘ" "x")
      (replace-all "ｗ" "w")
      (replace-all "ｙ" "y")
      (replace-all "ｚ" "z")
      (replace-all "Ａ" "A")
      (replace-all "Ｂ" "B")
      (replace-all "Ｃ" "C")
      (replace-all "Ｄ" "D")
      (replace-all "Ｅ" "E")
      (replace-all "Ｆ" "F")
      (replace-all "Ｇ" "G")
      (replace-all "Ｈ" "H")
      (replace-all "Ｉ" "I")
      (replace-all "Ｊ" "J")
      (replace-all "Ｋ" "K")
      (replace-all "Ｌ" "L")
      (replace-all "Ｍ" "M")
      (replace-all "Ｎ" "N")
      (replace-all "Ｏ" "O")
      (replace-all "Ｐ" "P")
      (replace-all "Ｑ" "Q")
      (replace-all "Ｒ" "R")
      (replace-all "Ｓ" "S")
      (replace-all "Ｔ" "T")
      (replace-all "Ｕ" "U")
      (replace-all "Ｖ" "V")
      (replace-all "Ｘ" "X")
      (replace-all "Ｗ" "W")
      (replace-all "Ｙ" "Y")
      (replace-all "Ｚ" "Z")))

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
  (global-unset-key "\C-z")
  )

(progn
  ;; ui
  (show-paren-mode nil)
  (tool-bar-mode 0)
  (load-theme 'misterioso)
  (deactivate-input-method)
  (cd "~/")
  )

(find-file "~/a")

;; ready to go
