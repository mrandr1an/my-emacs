(use-package prog-mode
  :ensure nil
  :custom
  (display-line-numbers-type 'relative)
  (fill-column 100)
  :hook
  (prog-mode . display-line-numbers-mode)
  (prog-mode . auto-fill-mode)
)

(use-package rustic
  :ensure t
  :custom
  (rustic-lsp-client 'eglot)
  :hook
  (rustic-mode . eglot-ensure)
)
