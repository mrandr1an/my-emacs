(use-package rustic
  :ensure t
  :config
  (setq rustic-format-on-save t)
  :hook
  (rustic-mode . my/rustic-mode)
)

(defun my/rustic-mode ()
(when buffer-file-name
    (setq-local buffer-save-without-query t))
(add-hook 'before-save-hook 'lsp-format-buffer nil t))

(provide 'rust-programming)
