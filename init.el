(add-to-list 'load-path (expand-file-name "~/.emacs.d/zoo"))
(require 'cask "~/.cask/cask.el")
(cask-initialize)
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
(require 'dss-hook-management)
(require 'zoo-javascript)
(require 'zoo-projectile)
(require 'zoo-scala)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
