; whitespace always on
(global-whitespace-mode 1)

; the tab-width is 4 by default
(setq tab-width 4)

; don't highlight lines with 8 spaces or more at the start
(setq-default indent-tabs-mode nil)

; whitespace-mode should only show this properties
(setq whitespace-style
      '(face
        tabs
        trailing
        space-before-tab
        newline
        empty
        space-after-tab
        ;space-mark
        tab-mark
        newline-mark))


; special characters for newline and tabs
(setq whitespace-display-mappings
  '(
     (space-mark ?\ [? ])
     (newline-mark ?\n [?\u00AC ?\n])
     (tab-mark ?\t [?\u25B8 ?\t])
   ))

;; ;; ; special colors for newline and tab character
  (custom-set-faces
   '(whitespace-space
     ((((class color) (background dark))
       (:background "#3A3A3A" :foreground "white"))
      (((class color) (background light))
       (:background "black" :foreground "white")))
      (t (:inverse-video t)))
   '(whitespace-space-after-tab
     ((((class color) (background dark))
       (:background "#3A3A3A" :foreground "#696969"))))
   '(whitespace-tab
     ((((class color) (background dark))
       (:background "#3A3A3A" :foreground "#696969")))))

                                        ; f4 should be whitespace-cleanup
(global-set-key (kbd "<f4> SPC") 'whitespace-cleanup)
(define-key evil-normal-state-map
  (kbd ", SPC") 'whitespace-cleanup)

(add-hook 'after-save-hook 'whitespace-cleanup)
(global-whitespace-mode 1)

(provide 'zoo-whitespace)
