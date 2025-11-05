(defun my-emacs-vim-scrolling-mode (enable)
  "Enable or disable 'vim-like' smooth scrolling depending on ENABLE."
  (if enable (progn
	       (setq scroll-step 1)
	       (setq scroll-margin 1)
	       (setq scroll-conservatively 9999)))
)

(defun my-emacs--priority-match-p (file pattern)
  (let ((name (file-name-nondirectory file)))
    (or (string= name pattern)
	(string-match-p pattern name))))

(defun my-emacs-load-packages (&optional nosort)
  "Load all '.el' files in `MY-EMACS-PACKAGES-DIR` honoring,
`MY-EMACS-PACKAGES-PRIORITY`.If NOSORT is non-nil, do not sort the
non-priority tail (raw FS order)."
  (let* ((all (directory-files my-emacs-packages-dir t "\\.el\\'" nosort))
         (seen (make-hash-table :test 'equal))
         (head (cl-loop for pat in my-emacs-packages-priority append
                        (cl-remove-if-not
                         (lambda (f)
                           (and (my-emacs--priority-match-p f pat)
                                (not (gethash f seen))
                                (prog1 t (puthash f t seen))))
                         all)))
         (tail (cl-remove-if (lambda (f) (gethash f seen)) all))
         (files (nconc head tail)))
    (dolist (f files)
      (condition-case err
          (load f nil 'nomessage)
        (error
         (message "[my-emacs] Failed to load %s: %s"
                  (file-name-nondirectory f) err))))))
