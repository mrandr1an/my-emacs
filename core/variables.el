;;; Package --- Summary
;;; Commentary:
;;; Code:

(defgroup my-emacs/variables nil
  "Customization group for my-emacs variables."
  :group 'emacs
)

;;; Directory variables

(defcustom my-emacs/projects-dir "~/Projects"
  "Directory where projects are supposed to be."
  :type 'string
  :group 'my-emacs/variables
)

(defcustom my-emacs/agenda-dir "~/Documents/Agenda/"
  "Directory where agenda is supposed to be."
  :type 'string
  :group 'my-emacs/variables
)

(defcustom my-emacs/bibliography-dir "~/Documents/Bibliography/"
  "Directory where bibliography is supposed to be."
  :type 'string
  :group 'my-emacs/variables
)

(defcustom my-emacs/notes-dir "~/Documents/Notes/"
  "Directory where notes are supposed to be."
  :type 'string
  :group 'my-emacs/variables
  )

(defcustom my-emacs/journal-dir "~/Documents/Journal/"
  "Directory where notes are supposed to be."
  :type 'string
  :group 'my-emacs/variables
)

;;; Configuration Variables

(defcustom my-emacs/enable-evil t
  "Enable evil mode on startup if non-nil."
  :type 'boolean
  :group 'my-emacs/variables
)

(provide 'variables)
;;; variables.el ends here
