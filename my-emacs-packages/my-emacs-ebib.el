(use-package ebib
  :ensure t
  :custom
  (ebib-bibtex-dialect (car (cdr bibtex-dialect-list)))
  (ebib-bib-search-dirs my-emacs-bibliography-search-dir)
  (ebib-default-directory my-emacs-bibliography)
  (ebib-truncate-file-names nil)
)
