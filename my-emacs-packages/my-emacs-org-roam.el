(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  (org-roam-db-sync)
  :custom
  (org-roam-node-display-template
      (concat "${title:*} "
              (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-directory (file-truename my-emacs-notes-dir))
  (org-roam-dailies-directory  (file-truename my-emacs-dailies-dir))
  :config
  (require 'org-roam-export) 
  :general
  (:prefix "C-c n"

	   "D r" 'org-roam-db-sync
	   
	   "n i" 'org-roam-node-insert
	   "n f" 'org-roam-node-find
	   "n d" 'org-roam-node-remove

	   "r i" 'org-roam-ref-add
	   "r d"  'org-roam-ref-remove

	   "t i" 'org-roam-tag-add
	   "t d" 'org-roam-tag-remove

	   "d i" 'org-roam-dailies-capture-today
	   "d f" 'org-roam-dailies-goto-date
)
