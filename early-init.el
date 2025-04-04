;;; package --- Summary
;;; Commentary:

;;; Code:

;;; Ensure `user-emacs-directory` is set correctly
(setq user-emacs-directory (file-name-directory load-file-name))

;;; Add core to load-path
(add-to-list 'load-path (expand-file-name "core" user-emacs-directory))
;;; Add modular-editing to load-path
(add-to-list 'load-path (expand-file-name "modular-editing" user-emacs-directory))
;;; Add file-management to load-path
(add-to-list 'load-path (expand-file-name "file-management" user-emacs-directory))

;; Disable package.el in favor of straight.el
(setq package-enable-at-startup nil)

(provide 'early-init)
;;; early-init.el ends here
