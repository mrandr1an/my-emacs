(use-package lsp-bridge
  :elpaca '(lsp-bridge :type git :host github :repo "manateelazycat/lsp-bridge"
  		:files (:defaults "*.el" "*.py" "acm" "core" "langserver" "multiserver" "resources")
  		:build (:not compile))
)

(provide 'programming-lsp)
