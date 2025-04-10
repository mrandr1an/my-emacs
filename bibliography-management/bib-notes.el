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

(provide 'bib-notes)
