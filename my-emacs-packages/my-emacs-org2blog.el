(use-package org2blog
  :ensure t
  :commands (org2blog-user-interface)
  :config
  (org2blog-user-login)
  :preface
  (defun my-emacs-blog--creds ()
    (let* ((entry (car (auth-source-search
			:host my-emacs-blog-domain
			:require '(:user :secret))))
	   (user (plist-get entry :user))
	   (secret (plist-get entry :secret))
	   (pass (if (functionp secret) (funcall secret) secret)))
      (list user pass)))
  (defun my-emacs-blog--run-after-save (post)
    (pp post)
  )
  :custom
  (org2blog/wp-blog-alist
   (let* ((creds (my-emacs-blog--creds))
	  (user (car creds))
	  (pass (cadr creds)))
     `((,my-emacs-blog-name
	:url ,my-emacs-blog-url
	:username ,user
	:password ,pass))))
  (org2blog/wp-image-thumbnails t)
  (org2blog/wp-use-wp-latex t)
  (org2blog/wp-image-upload t)
  (org2blog/wp-show-post-in-browser 'show)
  :general
  (:prefix "C-c b" 
	   "i"     'org2blog-user-interface
	   "n"     'org2blog-buffer-new

	   "b p"   'org2blog-buffer-post-publish
	   "b s"   'org2blog-buffer-post-save 
	   "b v"   'org2blog-buffer-post-view
	   "b d"   'org2blog-buffer-post-trash

	   "p p"   'org2blog-buffer-page-publish
	   "p s"   'org2blog-buffer-page-save
	   "p v"   'org2blog-buffer-page-view
	   "p d"   'org2blog-buffer-page-trash
	   )
  :hook
  (org2blog-buffer-entry-save . my-emacs-blog--run-after-save)
)
