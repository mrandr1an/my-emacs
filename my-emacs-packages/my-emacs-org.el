(use-package org
  :ensure `(org :repo "https://code.tecosaur.net/tec/org-mode.git/"
		:branch "dev"
	   )
  :config
   (set-face-attribute 'org-block-begin-line nil :height 150)
   (org-babel-do-load-languages
    'org-babel-load-languages
    '((python . t)
      (haskell . t)
      (latex . t)
      (shell . t))
    )
  :custom
   (org-pretty-entities t)
   (fill-column 70)
  :hook
   (org-mode . auto-fill-mode)
   (org-mode . (lambda ()
		   (font-lock-add-keywords
		    nil
		    '(
		      ("^#\\+begin_src\\(.*\\)$"
		       (0 (progn
			    (compose-region (match-beginning 0) (+ (match-beginning 0) 11) "")
			    nil)))))
		   ))

)
