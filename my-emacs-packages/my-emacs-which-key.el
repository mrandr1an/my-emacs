(use-package which-key
  :ensure nil
  :init
  (which-key-mode)
  :config 
  (which-key-setup-side-window-bottom)
  :custom
  (which-key-idle-delay 1)
  (which-key-idle-secondary-delay 0.05)
)
