(use-package eglot
  :ensure nil
  :commands (eglot eglot-ensure)
  :init
  (setq eglot-autoshutdown t
        eglot-events-buffer-config 0
        eglot-sync-connect nil
        eglot-confirm-server-edits nil)
)
