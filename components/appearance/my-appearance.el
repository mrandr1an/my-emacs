;;; my-appearance.el --- Personal Emacs appearance configuration -*- lexical-binding: t; -*-

;; Version: 0.0.1
;; Package-Requires: ((emacs "30.2") (vertico) (nano-modeline)
;; (marginalia) (corfu))
;; Keywords: faces

;;; Commentary:

;; Entry point for the personal appearance configuration.
;;
;; The individual parts of the configuration are separated into:
;;
;; - `my-appearance-frame'
;; - `my-appearance-windows'
;; - `my-appearance-minibuffer'
;; - `my-appearance-modeline'
;; - `my-appearance-boxes'

;;; Code:

(defgroup my-appearance nil
  "Personal Emacs appearance configuration."
  :group 'faces
  :prefix "my-appearance-")

(require 'my-appearance-boxes)
(require 'my-appearance-chrome)

(defun my-appearance-setup ()
  "Apply the complete personal appearance configuration."
  (interactive)
  (my-appearance-boxes-setup)
  (my-appearance-chrome-setup))

(provide 'my-appearance)
;;; my-appearance.el ends here
