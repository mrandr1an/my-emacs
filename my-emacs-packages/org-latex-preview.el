(use-package org-latex-preview
  :ensure nil
  :config
  (plist-put org-latex-preview-appearance-options
           :page-width 0.8)
  :custom
  (org-latex-preview-mode-display-live t)
  (org-latex-preview-mode-update-delay 0.25)
  (org-latex-preview-ltxpng-directory my-emacs-latex-png-dir)
  (org-latex-create-formula-image-program 'dvisvgm)
  :hook
  (org-mode)
)
