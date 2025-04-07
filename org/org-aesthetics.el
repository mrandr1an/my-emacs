(use-package org-modern
  :ensure t
  :hook
  (org-mode . org-modern-mode)
  (org-agenda-finalize . org-modern-agenda)
  :custom
  (setq org-modern-keyword
    (quote (("options" . "T")
            (t . t))))
)

(provide 'org-aesthetics)
