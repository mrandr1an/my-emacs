(use-package ispell
  :ensure nil 
  :custom
  (ispell-program-name "hunspell")
  (ispell-dictionary "en_US,el_GR") 
  :config
  (add-to-list 'ispell-hunspell-dictionary-alist
             '("en_US,el_GR"
               "[[:alpha:]]"
               "[^[:alpha:]]"
               "['’]"
               t
               ("-d" "en_US,el_GR")
               nil
               utf-8)))
  :hook
  (latex-mode . flyspell-mode)
  (markdown-mode . flyspell-mode)
  (org-mode . flyspell-mode)
)
