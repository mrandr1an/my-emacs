(use-package eglot-fsharp
  :ensure t
)

(use-package fsharp-mode
  :ensure t
  :hook
  (fsharp-mode . eglot-ensure)
)
