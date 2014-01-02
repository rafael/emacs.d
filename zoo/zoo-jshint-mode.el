;;(add-to-list 'load-path "/usr/local/Cellar/node/0.8.18/lib/node_modules/jshint-mode")
(require 'flymake-jshint)
(add-hook 'find-file-hook 'flymake-find-file-hook)
(add-hook 'javascript-mode-hook
               (lambda () (flymake-mode t)))
(provide 'zoo-jshint-mode)
