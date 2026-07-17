;;; Initial minimal frame appearance

(dolist (parameter
         '((menu-bar-lines          . 0)
           (tool-bar-lines          . 0)
           (tab-bar-lines           . 0)
           (vertical-scroll-bars    . nil)
           (horizontal-scroll-bars  . nil)))
  (setf (alist-get (car parameter) default-frame-alist)
        (cdr parameter)))

(menu-bar-mode -1)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
