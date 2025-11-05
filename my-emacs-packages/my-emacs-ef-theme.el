(use-package ef-themes
  :ensure t
  :init
  (ef-themes-take-over-modus-themes-mode 1)
  :custom 
  (modus-themes-mixed-fonts t)
  (modus-themes-italic-constructs t)
  :config
  (modus-themes-load-theme 'ef-light)
  )
