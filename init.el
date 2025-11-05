(defgroup my-emacs nil
 "User options for my-emacs."
  :group 'emacs
)

(defcustom my-emacs-notes-dir "~/Documents/Notes"
  "Where org-roam notes live."
  :group 'my-emacs
  :type 'directory
)

(defcustom my-emacs-dailies-dir "~/Documents/Dailies"
  "Where org-roam dailies live."
   :group 'my-emacs
   :type 'directory
)

(defcustom my-emacs-blog-url "https://kracked.tech/xmlrpc.php"
  "The url of the blog to contact wordpress as defined in org2blog."
  :type 'string
)

(defcustom my-emacs-blog-name "kracked"
  "Identifier of blog."
  :type 'string
)

(defcustom my-emacs-blog-domain "kracked.tech"
  "Domain of blog.."
  :type 'string
)

(defcustom my-emacs-latex-png-dir "~/Documents/LatexPng/"
  "Where latex preview pngs are stored."
  :type 'directory
)

(defcustom my-emacs-tool-bar -1
  "If non-nil, enable `tool-bar-mode`."
  :group 'my-emacs
  :type 'boolean
)

(defcustom my-emacs-menu-bar -1
  "If non-nil, enable `menu-bar-mode`."
  :group 'my-emacs
  :type 'boolean
)

(defcustom my-emacs-scroll-bar -1
  "If non-nil, enable `scroll-bar-mode`."
  :group 'my-emacs
  :type 'boolean
)

(defcustom my-emacs-vim-scrolling t
  "If non-nil, enable smooth scrolling, like vim."
   :group 'my-emacs
   :type 'boolean
)

(defcustom my-emacs-evil t
    "If non-nil, enable evil mode for vim emulation."
     :group 'my-emacs
     :type 'boolean
)

(defvar my-emacs-packages-dir
  (concat user-emacs-directory "my-emacs-packages/")
  "Directory that contains all of the `USE-PACKAGE` declarations."
)

(defvar my-emacs-packages-priority
  '("my-emacs-general.el")
  "Basenames or regexps of packages files to load first (ordered)."
)

(defvar elpaca-installer-version 0.11)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1 :inherit ignore
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (<= emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                  ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                  ,@(when-let* ((depth (plist-get order :depth)))
                                                      (list (format "--depth=%d" depth) "--no-single-branch"))
                                                  ,(plist-get order :repo) ,repo))))
                  ((zerop (call-process "git" nil buffer t "checkout"
                                        (or (plist-get order :ref) "--"))))
                  (emacs (concat invocation-directory invocation-name))
                  ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                        "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                  ((require 'elpaca))
                  ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (let ((load-source-file-function nil)) (load "./elpaca-autoloads"))))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

(elpaca elpaca-use-package
  (elpaca-use-package-mode))

(use-package emacs
  :ensure nil
  :config
  (load "my-emacs-functions")
  (tool-bar-mode my-emacs-tool-bar)
  (menu-bar-mode my-emacs-menu-bar)
  (scroll-bar-mode my-emacs-scroll-bar)
  (my-emacs-vim-scrolling-mode my-emacs-vim-scrolling)
  (my-emacs-load-packages) 
  (display-line-numbers-mode nil)
  (set-face-attribute 'default nil :family "0xProtoNerdFont" :height 120)
)
