(use-package embark-consult
  :ensure t
)

(use-package consult 
  :ensure t
  :general
  ("C-x b" 'consult-buffer)
  ("C-x v r" 'consult-register)
  ("C-x r s" 'consult-register-store)
  ("C-x r l" 'consult-register-load) 
  ("C-x v M"    'consult-global-mark)
  ("C-x v m"    'consult-mark)
  ("C-x C-f" 'consult-find)
  ("M-g g" 'consult-goto-line)
  ("M-g i" 'consult-imenu)
  ("M-g p" 'consult-imenu-multi)
  ("M-g m" 'consult-outline)
  ("M-g f" 'consult-flymake)
  ("M-g c" 'consult-compile-error)
  ("M-s l" 'consult-line)
  ("M-s L" 'consult-line-multi)
  ("M-s g" 'consult-ripgrep)
)
:config
(setq consult-async-min-input 1)
