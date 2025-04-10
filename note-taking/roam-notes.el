(require 'variables)

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  (org-roam-db-sync)
  :custom
  (org-roam-directory my-emacs/roam-notes-dir)
  (org-roam-capture-templates
   '(
     ("b" "Book Notes" plain
      (file "~/Documents/Notes/RoamTemplates/BookNoteTemplate.org")
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "TITLE: ${title}\n#+filetags: Book")
      :unnarrowed t
      )
      ("t" "Tutorial Notes, Quick setups etc" plain
      (file "~/Documents/Notes/RoamTemplates/TutorialTemplate.org")
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "TITLE: ${title}\n#+filetags: Tutorial")
      :unnarrowed t
      )
    )
  )
  :general
  (:prefix "C-c n"
	   "i" 'org-roam-node-insert
	   "f" 'org-roam-node-find
	   "t" 'org-roam-buffer-toggle
	   "a" 'org-roam-tag-add
	   "s" 'org-roam-tag-remove
	   "n" 'org-roam-capture
	   "d" 'org-roam-dailies-goto-date
	   "D" 'org-roam-dailies-goto-tomorrow
	   "m" 'org-roam-dailies-goto-today
	   "y" 'org-roam-ref-add
	   "u" 'org-roam-ref-remove
  )
)

(provide 'roam-notes)
