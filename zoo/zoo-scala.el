(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(evil-define-key 'normal scala-mode-map
  (kbd "M-.") 'ensime-edit-definition)
(setq ensime-sbt-perform-on-save "pack")

(defun right-arrow ()
  (interactive)
  (cond ((looking-back "=")
         (backward-delete-char 1) (insert "⇒"))
        ((looking-back "-")
         (backward-delete-char 1) (insert "→"))
        (t (insert ">"))))

(defun left-arrow ()
  (interactive)
  (if (looking-back "<")
      (progn (backward-delete-char 1)
             (insert "←"))
    (insert "-")))


(add-hook 'scala-mode-hook '(lambda () (interactive)
                              (local-set-key (kbd "-") 'left-arrow)
                              (local-set-key (kbd ">") 'right-arrow)))

(provide 'zoo-scala)
