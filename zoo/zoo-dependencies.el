; This dependencies module is inspired on Tavis Rudd's emacs.d, and
; Sebastian Cevey blogpost, both of these can be found at:
;
; * http://github.com/tavisrudd/emacs.d
; * http://bytes.inso.cc/2011/08/13/auto-installing-packages-in-emacs-with-elpa-and-el-get/

; Utility function derived from ELPA installation
; +info: http://tromey.com/elpa/install.html
;
(defun eval-url (url)
  (let ((buffer (url-retrieve-synchronously url)))
    (save-excursion
      (set-buffer buffer)
      (goto-char (point-min))
      (re-search-forward "^$" nil 'move)
      (eval-region (point) (point-max))
      (kill-buffer (current-buffer)))))

;;;;;;;;;;;;;;;;;;;;
;; ELPA Config
;;;;;;;;;;;;;;;;;;;;

(defun install-elpa ()
  (eval-url "http://tromey.com/elpa/package-install.el"))

(add-to-list 'load-path "~/.emacs.d/elpa")

(if (require 'package nil t)
  (package-initialize)
    ;;(progn
    ;;  ;; Emacs 24+ includes ELPA, but requires some extra setup
    ;;  ;; to use the (better) mermelade repo
    ;;  (package-initialize)
    ;;  (if (>= emacs-major-version 24)
    ;;      (add-to-list 'package-archives
    ;;                   '("marmalade" . "http://marmalade-repo.org/packages/") t)))
  (install-elpa))

;;;;;;;;;;;;;;;;;;;;
;; el-get Config
;;;;;;;;;;;;;;;;;;;;

(defun install-el-get ()
  (eval-url
   "https://raw.github.com/dimitri/el-get/862dfe1025568b90c254dd91e054ea9bad5b319a/el-get-install.el"))

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

; Ensure installation of el-get, if not there automatically
; install it
(unless (require 'el-get nil t)
  (install-el-get))

;;;;;;;;;;;;;;;;;;;;
;;  Adding Extra sources
;;;;;;;;;;;;;;;;;;;;

(setq el-get-generate-autoloads t
      el-get-sources '(
        (:name sunrise-commander
         :type git
         :url "https://github.com/escherdragon/sunrise-commander.git")

        (:name rinari
         :type git
         :url "https://github.com/eschulte/rinari.git")

        (:name flymake-ruby
               :type git
               :url "https://github.com/purcell/flymake-ruby.git")

        (:name evil-surround
               :type git
               :url "https://github.com/timcharper/evil-surround.git")
        (:name multi-term-ext
               :type git
               :url "https://github.com/roman/multi-term-ext")

       (:name jshint-mode
               :type git
               :url "https://github.com/daleharvey/jshint-mode.git")


        (:name yasnippet
               :type git
               :url "https://github.com/capitaomorte/yasnippet.git")

        (:name rhtml
               :type git
               :url "https://github.com/eschulte/rhtml")

        (:name ac-jump-mode
               :type git
               :url "https://github.com/winterTTr/ace-jump-mode.git")

        (:name pck-info
               :type git
               :url "https://github.com/lunaryorn/pkg-info.el.git")

        (:name web-mode
               :type git
               :url "https://github.com/fxbois/web-mode.git")))

;;;;;;;;;;;;;;;;;;;;
;;- Setting my dependencies
;;;;;;;;;;;;;;;;;;;;

(setq zoo-el-get-packages
      '(
       ; OH MEIN GOT! I can't live without dependencies
       evil-surround
       multi-term-ext
       sunrise-commander
      ;notify

       ;; Ruby mode extensions
       ri
       jshint-mode
       web-mode
       rhtml

       ac-jump-mode
       pck-info
       ))

(el-get 'sync zoo-el-get-packages)


(provide 'zoo-dependencies)
