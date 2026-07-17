(use-package evil
  :load-path "vendored/evil"
  :custom
  (evil-want-keybinding nil)
  (evil-want-integration t)
  (evil-want-minibuffer t)

  :config
  (evil-mode)
)

(add-to-list
 'load-path
 (expand-file-name "components/appearance"
                   user-emacs-directory))

(use-package my-appearance
  :ensure nil
  :demand t
  :config
  (my-appearance-setup))
