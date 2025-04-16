(use-package citar
  :ensure t
  :custom
  (citar-bibliography '("~/Documents/Bibliography/references.bib"))
)

(use-package citar-embark
  :after citar embark
  :ensure t
  :config (citar-embark-mode)
  )

(use-package citar-org-roam
  :ensure t
  :after (citar org-roam)
  :config (citar-org-roam-mode))

(provide 'bib-notes)
