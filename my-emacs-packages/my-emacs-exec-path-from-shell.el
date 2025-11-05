(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
   (exec-path-from-shell-initialize))
  :custom
  (exec-path-from-shell-variables '("PATH" "MANPATH"))
)
