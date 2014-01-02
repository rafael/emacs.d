;; on irb like shells, please handle properly the ansi escape codes


(add-auto-mode 'ruby-mode
               "Rakefile\\'" "\\.rxml\\'"
               "\\.rjs\\'" ".irbrc\\'" "\\.builder\\'" "\\.ru\\'"
               "\\.gemspec\\'" "Gemfile\\'")
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '(".*\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '(".*\.js.erb$" . javascript-mode))
(add-to-list 'auto-mode-alist '(".*\.js.jsx$" . javascript-mode))
;(add-hook 'ruby-mode-hook (lambda ()
;                            (rvm-activate-corresponding-ruby)))

;(ruby-end-mode 1)
(add-hook 'ruby-mode-hook (lambda ()
                            (set (make-local-variable 'tab-width) 2)))
(add-hook 'inf-ruby-mode-hook 'ansi-color-for-comint-mode-on)

(defun copy-from-emacs-to-clipboard ()
  (interactive)
  (shell-command-on-region (region-beginning) (region-end) "pbcopy"))
(global-set-key (kbd "C-x C-y") 'copy-from-emacs-to-clipboard)

(eval-after-load 'ruby-mode
  '(progn
     (rvm-use-default)
     (require 'rcodetools)
     (define-key ruby-mode-map (kbd "C-c C-c") 'xmp)))
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'ruby-mode-hook 'rspec-mode)

;(push 'company-robe company-backends)
(push 'ac-source-robe ac-sources)
(rinari-launch)

(defadvice rspec-compile (around rspec-compile-around)
    "Use BASH shell for running the specs because of ZSH issues."
      (let ((shell-file-name "/bin/bash"))
            ad-do-it))
(defadvice xmp (around xmp-around)
    "Use BASH shell for running the specs because of ZSH issues."
      (let ((shell-file-name "/bin/bash"))
            ad-do-it))
(ad-activate 'rspec-compile)
(ad-activate 'xmp)

(add-hook 'ruby-mode-hook
  (lambda () (rvm-activate-corresponding-ruby)))

(add-hook 'ruby-mode-hook
          (lambda () (flyspell-prog-mode)))

(add-hook 'rhtml-mode-hook
          (lambda () (flyspell-prog-mode)))

(add-hook 'rhtml-mode-hook
  (lambda () (rinari-launch)))
(provide 'zoo-ruby)
