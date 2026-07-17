;;; my-appearance-boxes.el --- Boxed Emacs window appearance -*- lexical-binding: t; -*-

;;; Commentary:

;; Creates the visual impression that each Emacs window occupies its own
;; rectangular box.
;;
;; The outer edge is produced by the frame's internal border.  Separators
;; between Emacs windows are produced by `window-divider-mode'.
;;
;; This affects Emacs windows rather than buffers.  Two windows displaying
;; the same buffer will each have their own visual boundary.

;;; Code:

;;; Customization

(defcustom my-appearance-boxes-internal-border-width 8
  "Width in pixels of the border inside each graphical frame."
  :type 'natnum
  :group 'my-appearance)

(defcustom my-appearance-boxes-right-divider-width 8
  "Width in pixels of dividers between side-by-side windows."
  :type 'natnum
  :group 'my-appearance)

(defcustom my-appearance-boxes-bottom-divider-width 8
  "Width in pixels of dividers between vertically stacked windows."
  :type 'natnum
  :group 'my-appearance)

(defcustom my-appearance-boxes-left-fringe-width 1
  "Width in pixels of the left fringe."
  :type 'natnum
  :group 'my-appearance)

(defcustom my-appearance-boxes-right-fringe-width 1
  "Width in pixels of the right fringe."
  :type 'natnum
  :group 'my-appearance)

(defcustom my-appearance-boxes-border-color "black"
  "Color used for internal borders and window dividers.

When nil, derive a color from the active theme."
  :type '(choice
          (const :tag "Derive from active theme" nil)
          (color :tag "Explicit color"))
  :group 'my-appearance)


;;; Color handling

(defun my-appearance-boxes--usable-color-p (value)
  "Return non-nil when VALUE represents a usable face color."
  (and (stringp value)
       (not (member value
                    '("unspecified"
                      "unspecified-bg"
                      "unspecified-fg")))))

(defun my-appearance-boxes--face-color (face attribute frame)
  "Return FACE's ATTRIBUTE on FRAME when it specifies a usable color."
  (let ((value (face-attribute face attribute frame 'default)))
    (when (my-appearance-boxes--usable-color-p value)
      value)))

(defun my-appearance-boxes--resolved-color (frame)
  "Return the border color that should be used on FRAME."
  (or my-appearance-boxes-border-color

      (my-appearance-boxes--face-color
       'mode-line-inactive :background frame)

      (my-appearance-boxes--face-color
       'vertical-border :foreground frame)

      (my-appearance-boxes--face-color
       'shadow :foreground frame)

      (my-appearance-boxes--face-color
       'default :background frame)

      "gray30"))


;;; Frame defaults

(defun my-appearance-boxes--set-default-frame-parameter (parameter value)
  "Set default frame PARAMETER to VALUE.

Replace the existing value in `default-frame-alist' rather than
adding a duplicate entry."
  (setf (alist-get parameter default-frame-alist) value))

(defun my-appearance-boxes--configure-frame-defaults ()
  "Configure boxed appearance parameters for future frames."
  (my-appearance-boxes--set-default-frame-parameter
   'internal-border-width
   my-appearance-boxes-internal-border-width)

  (my-appearance-boxes--set-default-frame-parameter
   'left-fringe
   my-appearance-boxes-left-fringe-width)

  (my-appearance-boxes--set-default-frame-parameter
   'right-fringe
   my-appearance-boxes-right-fringe-width))


;;; Faces

(defun my-appearance-boxes--configure-faces (frame)
  "Configure border and divider faces for FRAME."
  (let ((color (my-appearance-boxes--resolved-color frame)))
    (set-face-attribute
     'internal-border frame
     :background color)

    (dolist (face '(window-divider
                    window-divider-first-pixel
                    window-divider-last-pixel
                    vertical-border))
      (set-face-attribute
       face frame
       :foreground color))))


;;; Applying the appearance

(defun my-appearance-boxes-apply-to-frame (frame)
  "Apply the boxed appearance to graphical FRAME."
  (when (display-graphic-p frame)
    (modify-frame-parameters
     frame
     (list
      (cons 'internal-border-width
            my-appearance-boxes-internal-border-width)

      (cons 'left-fringe
            my-appearance-boxes-left-fringe-width)

      (cons 'right-fringe
            my-appearance-boxes-right-fringe-width)))

    (my-appearance-boxes--configure-faces frame)
    (redraw-frame frame)))

(defun my-appearance-boxes-refresh ()
  "Reapply the boxed appearance to every graphical frame.

Use this after changing themes or customization options."
  (interactive)

  (my-appearance-boxes--configure-frame-defaults)

  (setq window-divider-default-right-width
        my-appearance-boxes-right-divider-width

        window-divider-default-bottom-width
        my-appearance-boxes-bottom-divider-width

        window-divider-default-places
        t)

  (window-divider-mode 1)

  (dolist (frame (frame-list))
    (my-appearance-boxes-apply-to-frame frame)))

(defun my-appearance-boxes-setup ()
  "Enable the boxed Emacs appearance."
  (interactive)

  ;; Apply the appearance to frames created later, including daemon frames.
  (add-hook 'after-make-frame-functions
            #'my-appearance-boxes-apply-to-frame)

  (my-appearance-boxes-refresh))


(provide 'my-appearance-boxes)

;;; my-appearance-boxes.el ends here
