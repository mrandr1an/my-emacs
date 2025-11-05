(use-package python-mode
  :ensure nil
  :hook
  (python-mode . eglot-ensure)
)
