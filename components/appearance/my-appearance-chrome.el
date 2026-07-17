;;; my-appearance-chrome.el --- Minimal Emacs interface chrome -*- lexical-binding: t; -*-

;;; Commentary:

;; Remove nonessential graphical interface elements such as menu bars,
;; tool bars, scroll bars, tab bars, tooltips, and graphical dialogs.

;;; Code:

(defconst my-appearance-chrome--frame-parameters
  '((menu-bar-lines . 0)
    (tool-bar-lines . 0)
    (tab-bar-lines . 0)
    (vertical-scroll-bars . nil)
    (horizontal-scroll-bars . nil))
  "Frame parameters used for the minimal interface.")

(defun my-appearance-chrome--disable-mode (mode)
  "Disable MODE when its function is available."
  (when (fboundp mode)
    (funcall mode -1)))

(defun my-appearance-chrome--set-default-frame-parameter (parameter value)
  "Set default frame PARAMETER to VALUE."
  (setf (alist-get parameter default-frame-alist) value))

(defun my-appearance-chrome--configure-frame-defaults ()
  "Configure minimal appearance parameters for future frames."
  (dolist (entry my-appearance-chrome--frame-parameters)
    (my-appearance-chrome--set-default-frame-parameter
     (car entry)
     (cdr entry))))

(defun my-appearance-chrome-apply-to-frame (frame)
  "Apply the minimal graphical interface to FRAME."
  (when (and (frame-live-p frame)
             (display-graphic-p frame))
    (modify-frame-parameters
     frame
     my-appearance-chrome--frame-parameters)))

(defun my-appearance-chrome-refresh ()
  "Reapply the minimal interface to all frames."
  (interactive)

  ;; Standard Emacs interface bars.
  (my-appearance-chrome--disable-mode 'menu-bar-mode)
  (my-appearance-chrome--disable-mode 'tool-bar-mode)
  (my-appearance-chrome--disable-mode 'scroll-bar-mode)
  (my-appearance-chrome--disable-mode 'horizontal-scroll-bar-mode)

  ;; Optional tab interfaces.
  (my-appearance-chrome--disable-mode 'tab-bar-mode)
  (my-appearance-chrome--disable-mode 'global-tab-line-mode)

  ;; Display help in the echo area instead of graphical tooltip windows.
  (my-appearance-chrome--disable-mode 'tooltip-mode)

  ;; Use the minibuffer instead of graphical file and question dialogs.
  (setq use-dialog-box nil
        use-file-dialog nil)

  ;; Apply settings to future frames.
  (my-appearance-chrome--configure-frame-defaults)

  ;; Apply settings to frames that already exist.
  (dolist (frame (frame-list))
    (my-appearance-chrome-apply-to-frame frame)))

(defun my-appearance-chrome-setup ()
  "Set up the minimal Emacs interface."
  (interactive)

  ;; `add-hook' avoids adding the same function multiple times.
  (add-hook 'after-make-frame-functions
            #'my-appearance-chrome-apply-to-frame)

  (my-appearance-chrome-refresh))

(provide 'my-appearance-chrome)

;;; my-appearance-chrome.el ends here
