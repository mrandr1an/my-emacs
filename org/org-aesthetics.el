(defun my/org-src-block-font-lock ()
  (font-lock-add-keywords
   nil
   '(("^#\\+begin_src\\(.*\\)$"
      (0 (progn
	   (compose-region (match-beginning 0) (+ (match-beginning 0) 11) "")
	   nil)))
     ("^#\\+end_src$"
      (0 (progn (compose-region (match-beginning 0) (match-end 0) "") nil)))

     ("|" (0 (prog1 ()
             (compose-region (match-beginning 0)
                             (match-end 0)
                             "┃"))))
     )
   )
)

(defun my/pretty-org-symbols ()
  (setq prettify-symbols-alist
	'(
	   ("[ ]" . "")
	   ("[X]" . "")
	   ("[-]" . "󱞈")
	   ("*"   . "")
	   ("**"   . "")
	   ("***"   . "")
	   ("****"   . "")
	 )
	)
)

(provide 'org-aesthetics)
