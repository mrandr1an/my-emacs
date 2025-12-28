(use-package org-agenda
  :ensure nil
  :after (org org-capture)
  :custom
  (org-agenda-files my-emacs-agenda)
  (org-log-done 'time)
  :config
  (setq org-capture-templates
  (append org-capture-templates
      '(("p" "Personal todo" entry
         (file "~/Documents/Agenda/Study.org")
         "* TODO %?\n  %U\n")

        ("l" "Life todo" entry
         (file "~/Documents/Agenda/Life.org")
         "* TODO %?\n  %U\n")

        ("w" "Work todo (pick employer tag)" entry
         (file "~/Documents/Agenda/Work.org")
         "* TODO %?\n  :%^{Employer}:\n  %U\n"))))
  :general
  (:prefix "C-c n"
	    "a a" 'org-agenda
  )
)
