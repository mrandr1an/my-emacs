(use-package notmuch
  :ensure t
  :config
  (setq send-mail-function 'sendmail-send-it
    sendmail-program "/usr/bin/msmtp"
    mail-specify-envelope-from t
    message-sendmail-envelope-from 'header
    mail-envelope-from 'header)
  (setq notmuch-fcc-dirs nil)
)
