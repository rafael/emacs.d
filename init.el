(add-to-list 'load-path (expand-file-name "~/.emacs.d/zoo"))
(require 'init-utils)
(require 'zoo-dependencies)
(require 'zoo-auto-complete)
(require 'zoo-basics)
(require 'zoo-rainbow-delimiters)
(require 'zoo-paredit)
(require 'zoo-elisp)
(require 'zoo-ido)
(require 'zoo-term)
(require 'zoo-evil)
(require 'zoo-theme)
(require 'zoo-org)
(require 'zoo-bookmarks)
(require 'zoo-whitespace)
(require 'zoo-ruby)
(require 'zoo-java)
(require 'zoo-clojure)
(require 'zoo-haskell)
(require 'zoo-recentf-history-etc)
(require 'zoo-midnight)
(require 'zoo-coffee)
(require 'zoo-jshint-mode)
(require 'navorski)
(require 'dss-hook-management)
(require 'zoo-javascript)
(require 'zoo-projectile)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Maestro support -- Added on maestro installation

(add-to-list 'load-path "~/.maestro/integration/emacs")
(require 'maestro)

;; (maestro/start)
;; ^ Uncomment line if you want to connect to maestro when emacs is started

;; M-x maestro/start, M-x maestro/stop
;; M-x maestro/css-start, M-x maestro/css-stop


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
;
;(unless (require 'el-get nil 'noerror)
;  (with-current-buffer
;      (url-retrieve-synchronously
;       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
;    (goto-char (point-max))
;    (eval-print-last-sexp)))
;
;(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
;(el-get 'sync)
