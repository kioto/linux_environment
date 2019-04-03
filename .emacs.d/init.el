;======================================================================
; 言語・文字コード関連の設定
; Emacs 22(Gutsy)では、un-define の設定なしで utf-8 が使えます
;======================================================================

(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)


;======================================================================
; ローカルの設定
; 
;======================================================================

(setq load-path (append '("~/.emacs.d/lisp") load-path))

;======================================================================
; Package
;
;======================================================================
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;======================================================================
; Anthy
;
;======================================================================

;(require 'anthy)
;(setq default-input-method "japanese-anthy")
;(anthy-change-hiragana-map "," "，") ;デフォルトで全角コンマ
;(anthy-change-hiragana-map "." "．") ;デフォルトで全角ピリオド

;;
;=======================================================================
;フォント
;=======================================================================

;(set-default-font "Bitstream Vera Sans Mono-10")
;(set-fontset-font (frame-parameter nil 'font)
;                 'japanese-jisx0208
;                 '("VL ゴシック" . "unicode-bmp"))
;(if (>= emacs-major-version 23)
; (progn
;  (set-default-font "Liberation Mono-9")
;  (set-fontset-font (frame-parameter nil 'font)
;                     'japanese-jisx0208
;                     '("M+1P+IPAG" . "unicode-bmp")))
;)


;(if (or (getenv "SSH_TTY") "")
;    (progn
;      (set-default-font "Inconsolata-12")
;      (set-face-font 'variable-pitch "Inconsolata-12")
;      (set-fontset-font (frame-parameter nil 'font)
;                        'japanese-jisx0208
;                        '("Takaoゴシック" . "unicode-bmp")
;                        ))
;)

;;; MacOS
;; (set-face-attribute 'default nil :family "monaco" :height 120)
;; (set-fontset-font
;;   (frame-parameter nil 'font)
;;     'japanese-jisx0208
;;     '("Hiragino Kaku Gothic ProN" . "iso10646-1"))
;; (set-fontset-font
;;   (frame-parameter nil 'font)
;;     'japanese-jisx0212
;;     '("Hiragino Kaku Gothic ProN" . "iso10646-1")) 
;; (set-fontset-font
;;   (frame-parameter nil 'font)
;;     'mule-unicode-0100-24ff
;;     '("monaco" . "iso10646-1"))
;; (setq face-font-rescale-alist
;;     '(("^-apple-hiragino.*" . 1.2)
;;       (".*osaka-bold.*" . 1.2)
;;       (".*osaka-medium.*" . 1.2)
;;       (".*courier-bold-.*-mac-roman" . 1.0)
;;       (".*monaco cy-bold-.*-mac-cyrillic" . 0.9) (".*monaco-bold-.*-mac-roman" . 0.9)
;;       ("-cdac$" . 1.3)))


;=======================================================================
;フレームサイズ・位置・色など
;=======================================================================
;(setq initial-frame-alist
;       (append (list
;                  '(foreground-color . "white")                ;; 文字色
;                  '(background-color . "#333366")              ;; 背景色
;                  '(border-color . "black")
;                  '(mouse-color . "white")
;                  '(cursor-color . "white")
;                  '(width . 90)                                ;; フレームの幅
;                  '(height . 49)                               ;; フレームの高さ
;                  '(top . 0)                                   ;; Y 表示位置
;                  '(left . 340)                                ;; X 表示位置
;                  )
;               initial-frame-alist))
;(setq default-frame-alist initial-frame-alist)

(setq default-frame-alist
   '((foreground-color . "white")
     (background-color . "black")
     (alpha . (100 85))
;     (top . 2 )
;     (left . 365)
;     (width . 80)
;     (height . 47)
     )
)

;;
;=======================================================================
; Misc
;=======================================================================

;(display-time) ;;時計を表示
(global-set-key "\C-h" 'backward-delete-char) ;;Ctrl-Hでバックスペース
;(setq make-backup-files nil) ;;バックアップファイルを作成しない
;(setq visible-bell t) ;;警告音を消す
;(setq kill-whole-line t) ;;カーソルが行頭にある場合も行全体を削除

;(setq inhibit-startup-screen -1)
(global-set-key "\C-xx" 'copy-to-register)
(global-set-key "\C-xg" 'insert-register)
(global-set-key "\C-x\C-j" 'goto-line)

; for MacOS
;(define-key global-map [?¥] [?\\])  ;; \の代わりにバックスラッシュを入力する

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; c-mode/c++-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'c++-mode-hook
          '(lambda()
             (c-set-style "gnu")))

;; 対応する括弧の明示
(show-paren-mode t)

;; knownなやつも表示
(setq cpp-known-face 'default)
;; unknownなやつはハイライトする
(setq cpp-unknown-face 'highlight)
;; 選ぶのはlight background
(setq cpp-face-type 'light)
;; knownもunknownもwritable
(setq cpp-known-writable 't)
(setq cpp-unknown-writable 't)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; bison-mode
;; flex-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'bison-mode "bison-mode")
(autoload 'flex-mode "flex-mode")
(set-default 'auto-mode-alist
             (append '(("\\.y$" . bison-mode)
                       ("\\.yy$" . bison-mode)
                       ("\\.l$" . flex-mode)
                       ("\\.ll$" . flex-mode))
                     auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; yaml-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq load-path (append '("~/.emacs.d/lisp/yaml-mode") load-path))
(require 'yaml-mode)
(set-default 'auto-mode-alist
             (append '(("\\.yml$" . yaml-mode)
                       ("\\.yaml$" . yaml-mode))
                     auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ruby
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq load-path (append '("/usr/share/emacs/site-lisp/ruby1.8-elisp")
                        load-path))
(autoload 'rubydb "rubydb3x"
  "run rubydb on program file in buffer *gud-file*.
the directory containing file becomes the initial working directory
and source-file directory for your debugger." t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; lisp-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq auto-mode-alist (cons '("\\.cl$" . lisp-mode) auto-mode-alist))

;; (require 'eldoc-extension)
;; (setq eldoc-idle-delay 0)
;; (setq eldoc-echo-area-use-multiline-p t)
;; (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
;; (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
;; (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Lisp Box
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq slime-net-coding-system 'utf-8-unix)
(add-to-list 'load-path "~/.emacs.d/lisp/slime")
(setq inferior-lisp-program "/usr/local/bin/clisp -modern")
;(setq inferior-lisp-program "/Users/kioto/src/ccl/dx86cl64")
;(setq inferior-lisp-program "/usr/local/bin/sbcl")

(require 'slime)
(slime-setup '(slime-repl slime-fancy slime-banner))

;(add-to-list 'load-path "~/.emacs.d/lisp/ac-slime")
;(require 'ac-slime)
;(add-hook 'slime-mode-hook 'set-up-slime-ac)
;(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
;(eval-after-load "auto-complete"
;  '(add-to-list 'ac-modes 'slime-repl-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EasyPG
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'epa-file)
(epa-file-enable)

;(mc-setversion "gpg")
;(setq mc-gpg-user-id "kioto.hirahara@gmail.com")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; cmake-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (setq load-path
;;       (cons (expand-file-name
;; 	     "/usr/local/Cellar/cmake/3.13.0/share/emacs/site-lisp/cmake")
;; 	    load-path))
;; (require 'cmake-mode)

;; (add-hook 'text-mode-hook
;;           '(lambda ()
;;              (auto-fill-mode 1)
;;              ))

;; (require 'cmake-mode)
;; (setq auto-mode-alist
;;       (append '(("CMakeLists\\.txt\\'" . cmake-mode)
;;                 ("\\.cmake\\'" . cmake-mode))
;;               auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; thrift-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (require 'thrift-mode)
;; (add-to-list 'auto-mode-alist '("\\.thrift$" . thrift-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(global-set-key "\C-cl" ’org-store-link)
;(global-set-key "\C-cc" ’org-capture)
;(global-set-key "\C-ca" ’org-agenda)
;(global-set-key "\C-cb" ’org-iswitchb)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; markdown-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (dolist (dir (list
;;               "/sbin"
;;               "/usr/sbin"
;;               "/bin"
;;               "/usr/bin"
;;               "/opt/local/bin"
;;               "/sw/bin"
;;               "/usr/local/bin"
;;               (expand-file-name "~/bin")
;;               (expand-file-name "~/.emacs.d/bin")
;;               ))
;;  (when (and (file-exists-p dir) (not (member dir exec-path)))
;;    (setenv "PATH" (concat dir ":" (getenv "PATH")))
;;    (setq exec-path (append (list dir) exec-path))))
	      
;; (autoload 'markdown-mode "markdown-mode"
;;    "Major mode for editing Markdown files" t)
;; (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
;; (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
;; (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rust-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

;; ;;; racerやrustfmt、コンパイラにパスを通す
;; (add-to-list 'exec-path (expand-file-name "~/.cargo/bin/"))
;; ;;; rust-modeでrust-format-on-saveをtにすると自動でrustfmtが走る
;; (eval-after-load "rust-mode"
;;   '(setq-default rust-format-on-save t))
;; ;;; rustのファイルを編集するときにracerとflycheckを起動する
;; (add-hook 'rust-mode-hook (lambda ()
;;                             (racer-mode)
;;                             (flycheck-rust-setup)))
;; ;;; racerのeldocサポートを使う
;; (add-hook 'racer-mode-hook #'eldoc-mode)
;; ;;; racerの補完サポートを使う
;; ;; (add-hook 'racer-mode-hook (lambda ()
;; ;;                              (company-mode)
;; ;;                              ;;; この辺の設定はお好みで
;; ;;                              (set (make-variable-buffer-local
;; ;; 				   'company-idle-delay) 0.1)
;; ;;                              (set (make-variable-buffer-local
;; ;; 				   'company-minimum-prefix-length) 0)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ediff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; コントロール用のバッファを同一フレーム内に表示
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; diffのバッファを上下ではなく左右に並べる
(setq ediff-split-window-function 'split-window-horizontally)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; markdown-previwe-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(package-selected-packages
;;    (quote
;;     (uuidgen markdown-preview-mode cmake-mode racer plantuml-mode flycheck-rust company))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
;; (autoload 'markdown-preview-mode "markdown-preview-mode.el" t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; このファイルに間違いがあった場合に全てを無効にします
(put 'upcase-region 'disabled nil)


;;;;;;;;;; END OF FILE
