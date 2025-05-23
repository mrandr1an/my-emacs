(defun my/org-font-lock ()
  (font-lock-add-keywords
   nil
   '(
     ("^#\\+begin_src\\(.*\\)$"
      (0 (progn
	   (compose-region (match-beginning 0) (+ (match-beginning 0) 11) "")
	   nil)))
     ("^#\\+end_src$"
      (0 (progn (compose-region (match-beginning 0) (match-end 0) "") nil)))

     ("|" (0 (prog1 ()
             (compose-region (match-beginning 0)
                             (match-end 0)
                             "┃"))))
     ("TODO"
     (0 (list 'face nil 'display (svg-font-lock-todo))))
     ("\\:\\([0-9a-zA-Z]+\\)\\:"
     (0 (list 'face nil 'display (svg-font-lock-tag (match-string 1)))))
     ("DONE"
     (0 (list 'face nil 'display (svg-font-lock-done))))
     ("\\[\\([0-9]\\{1,3\\}\\)%\\]"
      (0 (list 'face nil 'display (svg-font-lock-progress_percent (match-string 1)))))
      ("\\[\\([0-9]+/[0-9]+\\)\\]"
     (0 (list 'face nil 'display (svg-font-lock-progress_count (match-string 1)))))
     ("^\\*+ "
       (0 (list 'face nil 'display (svg-font-lock-heading)) )
     )
    )
   )
)

(defun svg-font-lock-tag (label)
  (svg-lib-tag label nil :margin 0))

(defun svg-font-lock-todo ()
  (svg-lib-tag "TODO" nil :margin 0
               :font-weight 500
	       :radius 8
               :foreground "#FFFFFF" :background "#673AB7"))

(defun svg-font-lock-done ()
  (svg-lib-tag "DONE" nil :margin 0
	       :radius 8
               :font-weight 400
               :foreground "#B0BEC5" :background "white"))
  
(defun svg-font-lock-progress_percent (value)
  (svg-image (svg-lib-concat
              (svg-lib-progress-bar (/ (string-to-number value) 100.0)
                                nil :margin 0 :stroke 2 :radius 3 :padding 2 :width 12)
              (svg-lib-tag (concat value "%")
                           nil :stroke 0 :margin 0)) :ascent 'center))

(defun svg-font-lock-progress_count (value)
  (let* ((seq (mapcar #'string-to-number (split-string value "/")))
         (count (float (car seq)))
         (total (float (cadr seq))))
  (svg-image (svg-lib-concat
              (svg-lib-progress-bar (/ count total) nil
                                :margin 0 :stroke 2 :radius 3 :padding 2 :width 12)
              (svg-lib-tag value nil
                           :stroke 0 :margin 0)) :ascent 'center)))

(defun svg-font-lock-heading ()
    (svg-lib-icon "format-section" nil :collection "material"
		  :stroke 0 :scale 1 :padding 0))

(defun svg-font-lock-begin-src ()
    (svg-lib-icon "console" nil :collection "material"
		  :stroke 0 :scale 1 :padding 0))

(provide 'org-aesthetics)
