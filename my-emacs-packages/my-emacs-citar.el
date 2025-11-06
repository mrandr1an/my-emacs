(use-package citar
  :ensure t
  :custom
  (citar-bibliography my-emacs-citar-bibliographies)
  (org-cite-global-bibliography my-emacs-citar-bibliographies)
  (citar-library-paths my-emacs-citar-library-paths)
  (citar-notes-paths my-emacs-citar-notes-paths)
  (org-cite-insert-processor 'citar)
  (org-cite-follow-processor 'citar)
  (org-cite-activate-processor 'citar)
  :hook
  (LaTeX-mode . citar-capf-setup)
  (org-mode . citar-capf-setup)
  :general
  (:prefix "C-c n"
           "p o" 'citar-open
           "p n" 'citar-open-note
           "p f" 'citar-open-file
           "p l" 'citar-open-links
           "p N" 'citar-open-notes
  )
)
