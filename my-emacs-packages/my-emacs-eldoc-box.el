(use-package eldoc-box
  :ensure t
  :init
  (add-hook 'eglot-managed-mode-hook #'eldoc-box-hover-mode t)
  (add-hook 'prog-mode-hook #'eldoc-box-hover-mode t)
)
