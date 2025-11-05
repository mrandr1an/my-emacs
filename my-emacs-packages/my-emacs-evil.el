(use-package evil
  :ensure t
  :after general
  :if my-emacs-evil
  :custom (evil-want-keybinding nil)
  (evil-want-integration t)
  (evil-want-minibuffer t) 
  :config
  (evil-mode)
   :general (:keymaps 'evil-insert-state-map
	    "C-k" nil
	    "C-j" nil
	    "C-h" nil
	    "C-l" nil
	    "C-d" nil
	    "C-a" nil)
   (:keymaps 'evil-normal-state-map
	     "C-." nil
	      )
)

(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init)
)

(use-package evil-nerd-commenter
  :ensure t
  :after evil
  :general
  (:keymaps 'evil-visual-state-map
	    "gcc" 'evilnc-comment-or-uncomment-lines)
  (:keymaps 'evil-normal-state-map
	    "gcc" 'evilnc-comment-or-uncomment-lines)
)

(use-package evil-surround
  :ensure t
  :after evil
  :hook evil-mode
)

(use-package undo-fu
  :ensure t
  :after evil
  :custom
  (evil-undo-system 'undo-fu)
)

(use-package evil-mc
  :ensure t
  :after evil
  :hook
  evil-mode
  :general
  (:keymaps 'evil-visual-state-map
	    ",a" 'evil-mc-make-all-cursors
	    )
  (:keymaps 'evil-normal-state-map
	    ",d" 'evil-mc-undo-all-cursors
	    ",r" 'evil-mc-resume-cursors
	    ",p" 'evil-mc-pause-cursors
	    ",m" 'evil-mc-make-cursor-here
	    )

  (:keymaps 'evil-insert-state-map
	    "M-, a" 'evil-mc-make-all-cursors
	    "M-, d" 'evil-mc-undo-all-cursors
	    "M-, r" 'evil-mc-resume-cursors
	    "M-, p" 'evil-mc-pause-cursors
	    "M-, m" 'evil-mc-make-cursor-here
	    )
)
