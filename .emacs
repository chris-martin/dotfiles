; Put backups in a designated directory
; http://ergoemacs.org/emacs/emacs_set_backup_into_a_directory.html
(setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))

; Fix shift+up
; https://groups.google.com/forum/?fromgroups=#!topic/gnu.emacs.help/rR478H4BDU8
(define-key input-decode-map "\e[1;2A" [S-up])
(if (equal "xterm" (tty-type))
  (define-key input-decode-map "\e[1;2A" [S-up]))

; https://stackoverflow.com/questions/384284/how-do-i-rename-an-open-file-in-emacs
; http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "FNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

; https://sites.google.com/site/steveyegge2/my-dot-emacs-file
(defun move-buffer-file (dir)
 "Moves both current buffer and file it's visiting to DIR."
 (interactive "DNew directory: ")
 (let* ((name (buffer-name))
   (filename (buffer-file-name))
   (dir
   (if (string-match dir "\\(?:/\\|\\\\)$")
   (substring dir 0 -1) dir))
   (newname (concat dir "/" name)))
 (if (not filename)
  (message "Buffer '%s' is not visiting a file!" name)
 (progn (copy-file filename newname 1)
        (delete-file filename)
        (set-visited-file-name newname)
        (set-buffer-modified-p nil)      t))))
