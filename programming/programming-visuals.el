(use-package rainbow-delimiters
  :ensure t
  :defer t
  :hook
  (prog-mode .rainbow-delimiters-mode)
)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
)

(provide 'programming-visuals)
