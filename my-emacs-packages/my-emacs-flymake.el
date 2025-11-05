(use-package flymake
  :ensure nil
  :custom
  (flymake-show-diagnostics-at-end-of-line 'fancy)
  :hook
  (prog-mode . flymake-mode)
)
