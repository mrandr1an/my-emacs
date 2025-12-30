(use-package org-capture
  :ensure nil
  :config
  (setq org-capture-templates
    (append org-capture-templates
        '(
	  ("c" "Capture a simple contact (phone && email)" entry
	   (file+headline "~/Documents/Contacts.org" "Contacts") 	  
	   "* %^{Contact Name}\n:PROPERTIES:\n:PHONE: %^{PHONE}\n:EMAIL: %^{Email}\n:CREATED:%U\n:END:\n%?")
	  )
  	))
  :general
  (:prefix "C-c c"
	   "c" 'org-capture
	   )
)
