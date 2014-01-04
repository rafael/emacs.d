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

        (:name evil-paredit
               :type git
               :url "https://github.com/roman/evil-paredit.git")

        (:name flip-tables
               :type http
               :url "http://www.emacswiki.org/emacs/download/flip-tables.el")

        (:name rainbow-mode
               :type git
               :url "https://github.com/emacsmirror/rainbow-mode.git")

        (:name ac-nrepl
               :type git
               :url "https://github.com/purcell/ac-nrepl.git")

        (:name rainbow-delimiters
               :type git
               :url "https://github.com/jlr/rainbow-delimiters.git")

        (:name evil-surround
               :type git
               :url "https://github.com/timcharper/evil-surround.git")

        (:name window-numbering
               :type git
               :url "https://github.com/nschum/window-numbering.el.git")

        (:name golden-ratio
               :type git
               :url "https://github.com/roman/golden-ratio.el.git")

        (:name winner-mode
               :type emacswiki)

        (:name helm
               :type git
               :url "https://github.com/emacs-helm/helm.git")

        (:name helm-c-yasnippet
               :type git
               :url "https://github.com/emacs-helm/helm-c-yasnippet.git")

        (:name mmm-mode
               :type git
               :url "https://github.com/purcell/mmm-mode.git")

        (:name dash
               :type git
               :url "https://github.com/magnars/dash.el.git")

        (:name bm
               :type http
               :url "http://cvs.savannah.gnu.org/viewvc/*checkout*/bm/bm/bm.el")

        (:name lineker
               :type http
               :url "http://www.helsinki.fi/~sjpaavol/programs/lineker.el")

        (:name multi-term-ext
               :type git
               :url "https://github.com/roman/multi-term-ext")

        (:name popup
               :type git
               :url "https://github.com/emacsmirror/popup.git")

        (:name auto-complete
               :type git
               :url "https://github.com/emacsmirror/auto-complete.git")


        (:name robe
               :type git
               :url "https://github.com/dgutov/robe.git")

        (:name jshint-mode
               :type git
               :url "https://github.com/daleharvey/jshint-mode.git")


        (:name yasnippet
               :type git
               :url "https://github.com/capitaomorte/yasnippet.git")


        (:name tagedit
               :type git
               :url "https://github.com/magnars/tagedit.git")

        (:name coffee-mode
               :type git
               :url "https://github.com/defunkt/coffee-mode.git")

        (:name enhanced-ruby-mode
               :type git
               :url "https://github.com/zenspider/enhanced-ruby-mode.git")

        (:name rhtml
               :type git
               :url "https://github.com/eschulte/rhtml")

        (:name rvm
               :type git
               :url "https://github.com/senny/rvm.el.git")

        (:name magit
               :type git
               :url "https://github.com/magit/magit.git")

        (:name flymake-easy
               :type git
               :url "https://github.com/purcell/flymake-easy.git")

        (:name git-commit-mode
               :type git
               :url "https://github.com/magit/git-modes.git")

        (:name projectile
               :type git
               :url "https://github.com/bbatsov/projectile.git")

        (:name ac-jump-mode
               :type git
               :url "https://github.com/winterTTr/ace-jump-mode.git")

        (:name s
               :type git
               :url "https://github.com/magnars/s.el.git")

        (:name pck-info
               :type git
               :url "https://github.com/lunaryorn/pkg-info.el.git")

        (:name epl
               :type git
               :url "https://github.com/cask/epl.git")

        (:name grizzl
               :type git
               :url "https://github.com/d11wtq/grizzl.git")

        (:name web-mode
               :type git
               :url "https://github.com/fxbois/web-mode.git")))

;;;;;;;;;;;;;;;;;;;;
;;- Setting my dependencies
;;;;;;;;;;;;;;;;;;;;

(setq zoo-el-get-packages
      '(
       ; OH MEIN GOT! I can't live without dependencies
       package
       evil
       evil-surround
       evil-paredit
       paredit
       magit
       git-commit-mode
       multi-term
       multi-term-ext
       ack
       sunrise-commander
       window-numbering
       winner-mode
       bm
       flymake-cursor
       flymake-easy
       lineker
       goto-last-change
       smex
       golden-ratio
       popup
       auto-complete
       moz-repl
       ;notify

       ; Lispy languages
       rainbow-mode
       rainbow-delimiters

       ;; Ruby mode extensions
       rinari
       ruby-mode
       rspec-mode
       robe
       rvm
       inf-ruby
       ri
       ruby-compilation
       flymake-ruby


       ;; Color themes dependencies
       color-theme
       ;;color-theme-sunburst
       dash
       ;;
       jshint-mode
       mmm-mode
       tagedit
       ;;web-mode
       coffee-mode
       rhtml

       ; misc
       ac-jump-mode
       epl
       pck-info
       projectile
       grizzl
       s

       ))

(el-get 'sync zoo-el-get-packages)


(provide 'zoo-dependencies)
