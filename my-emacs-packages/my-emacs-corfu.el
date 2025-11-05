(use-package corfu
  :ensure t
  :init
  (global-corfu-mode)
  :general (:keymaps 'corfu-map
	    "C-k" 'corfu-previous
	    "C-j" 'corfu-next
	    "C-d" 'corfu-info-documentation
	    "C-a" 'corfu-info-location
	    "C-h" 'corfu-quit
	    "C-l" 'corfu-insert
	    "C-m" 'corfu-move-to-minibuffer)
  ("C-l" 'completion-at-point)
)
