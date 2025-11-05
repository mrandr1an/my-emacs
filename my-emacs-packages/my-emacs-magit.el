(use-package transient
  :ensure t
  )

(use-package magit
  :ensure t
  :general
  (:prefix "C-c m"
      "g" 'magit-status
      "i" 'magit-init
      "c" 'magit-clone)
)
