(use-package org-super-agenda
  :ensure t
  :after org
  :config
  (org-super-agenda-mode)
  (setq org-agenda-custom-commands
	'(
	  ("d" "Simple Agenda View"
	   (
	    (agenda ""
		   (
		   (org-agenda-span 1)
	           (org-agenda-overriding-header "Today's Schedule")
		   (org-super-agenda-groups
		    '(
		      (:name "Schedule" :time-grid t)
		      (:name "Due today" :deadline today)
		      (:discard (:anything t))
		     )
		    )))
	     (todo "TODO" (
			   (org-agenda-overriding-header "General Priority Tasks")
			   (org-super-agenda-groups
			  '(
			    (:name "High priority" :priority "A")
			    (:name "Medium priority" :priority "B")
			    (:name "Low priority" :priority "C")
			    (:discard (:anything t))
			    ))))
	    (agenda ""
		   (
		   (org-agenda-span 14)
	           (org-agenda-overriding-header "Week's Schedule")
		   (org-super-agenda-groups
		    '(
		      (:name "Schedule" :time-grid t)
		      (:name "Deadlines" :deadline today)
		      (:name "Scheduled" :scheduled today)
		      (:discard (:anything t))
		     )
		    )))
	     ))
	 )
	)
)
