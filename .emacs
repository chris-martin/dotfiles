; Put backups in a designated directory
; http://ergoemacs.org/emacs/emacs_set_backup_into_a_directory.html
(setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))

; Fix shift+up
; https://groups.google.com/forum/?fromgroups=#!topic/gnu.emacs.help/rR478H4BDU8
(define-key input-decode-map "\e[1;2A" [S-up])
(if (equal "xterm" (tty-type))
  (define-key input-decode-map "\e[1;2A" [S-up]))

