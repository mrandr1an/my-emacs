(use-package org-agenda
  :ensure nil
  :after (org org-capture)
  :custom
  (org-agenda-files my-emacs-agenda)
  (org-use-fast-todo-selection t)
  (org-log-done 'note)
  (org-log-reschedule 'note)
  (org-log-redeadline 'note)
  (org-log-refile 'time)
  :config
  (setq org-todo-keywords
	(append org-todo-keywords
		'(
		  (sequence "TODO(t!)" "WAITING(w@/!)" "|" "DONE(d!)" "CANCELLED(c@)")
		  (type "PROJ(p!)" "|" "FINISHED(f!)")
		  (sequence "RECURRING(t!)" "|" "DONE(d)" "CANCELLED(c@)")
		  ))
	)
  (setq org-capture-templates
  (append org-capture-templates
      '(
	("t" "Capture a study task." entry
         (file "~/Documents/Agenda/Study.org")
         "* TODO %^{Priority| |[#A]|[#B]|[#C]} %^{Task} %? :someday: \n:PROPERTIES:\n:CREATED:%U\n:END:\n")
	
	("P" "Capture a project for studying." entry
	 (file "~/Documents/Agenda/Study.org")
	 "* PROJ %^{Project Name}%? [0%] :project: \n:PROPERTIES:\n:CREATED:%U\n:END:\n")

	("P" "Capture a project for work." entry
	 (file "~/Documents/Agenda/Work.org")
	 "* PROJ %^{Project Name}%? [0%] :%^{Employer}:project: \n:PROPERTIES:\n:CREATED:%U\n:END:\n")
	
	("l" "Capture a life task." entry
         (file "~/Documents/Agenda/Life.org")
         "* TODO %^{Priority| |[#A]|[#B]|[#C]} %^{Task} %? :someday: \n:PROPERTIES:\n:CREATED:%U:END:\n")

	("L" "Capture an apointment." entry
         (file "~/Documents/Agenda/Life.org")
         "* TODO %^{Task} %? :appointment:\nSCHEDULED: %^T\n:PROPERTIES:\n:CREATED:%U\n:END:\n")

	("w" "Capture a work task." entry
         (file+headline "~/Documents/Agenda/Work.org" "Inbox")
         "* WAITING %^{Priority| |[#A]|[#B]|[#C]} %^{Task} %? :%^{Employer}:\n:PROPERTIES:\n:CREATED:%U\n:END:\n")

	("W" "Capture a deadlined work task." entry
         (file+headline "~/Documents/Agenda/Work.org" "Inbox")
         "* TODO %^{Priority| |[#A]|[#B]|[#C]} %^{Task} %? :%^{Employer}:\nDEADLINE: %^t\n:PROPERTIES:\n:CREATED:%U\n:END:\n")

	("S" "Capture a scheduled work task." entry
         (file+headline "~/Documents/Agenda/Work.org" "Inbox")
         "* TODO %^{Priority| |[#A]|[#B]|[#C]} %^{Task} %? :%^{Employer}:\nSCHEDULED: %^t\n:PROPERTIES:\n:CREATED:%U\n:END:\n")

	("R" "Recurring work task (pick interval)" entry
	 (file "~/Documents/Agenda/Work.org")
	 "* RECURRING %^{Task}\n:%^{Employer}:\nSCHEDULED: %(let* ((tstr (org-read-date nil nil nil \"Start (date or date+time, e.g. 2025-12-29 14:30): \"))\n
              (t0   (org-time-string-to-time tstr))\n
              (rep  (completing-read \"Repeater: \"\n
                                     '(\"++1d\" \"+1d\"\n \"++1w\" \"+1w\" \"++2w\" \"+2w\"\n \"++1m\" \"+1m\" \"++1y\" \"+1y\")\n nil t))\n
              (fmt  (if (string-match-p \"[0-9][0-9]:[0-9][0-9]\" tstr)\n
                        \"%Y-%m-%d %a %H:%M\"\n
                      \"%Y-%m-%d %a\")))\n
         (format \"<%s %s>\" (format-time-string fmt t0) rep))\n:PROPERTIES:\n:CREATED: %U\n:END:\n%?")

	("r" "Recurring life task (pick interval)" entry
	 (file "~/Documents/Agenda/Life.org")
	 "* RECURRING %^{Task}\nSCHEDULED: %(let* ((tstr (org-read-date nil nil nil \"Start (date or date+time, e.g. 2025-12-29 14:30): \"))\n
             (t0   (org-time-string-to-time tstr))\n
             (rep  (completing-read \"Repeater: \"\n
                                    '(\"++1d\" \"+1d\"\n \"++1w\" \"+1w\" \"++2w\" \"+2w\"\n \"++1m\" \"+1m\" \"++1y\" \"+1y\")\n nil t))\n
             (fmt  (if (string-match-p \"[0-9][0-9]:[0-9][0-9]\" tstr)\n
                       \"%Y-%m-%d %a %H:%M\"\n
                     \"%Y-%m-%d %a\")))\n
        (format \"<%s %s>\" (format-time-string fmt t0) rep))\n:PROPERTIES:\n:CREATED: %U\n:END:\n%?")
        )))
  :general
  (:prefix "C-c n"
	    "a a" 'org-agenda
  )
)
