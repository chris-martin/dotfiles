(add-to-list 'load-path "~/.emacs.d/lisp/")

; Disable the menu bar
(menu-bar-mode -1)

; Show line numbers
(global-linum-mode 1)

; Format line numbers right-aligned with padding
(setq linum-format (lambda (line)
  (propertize (format
    (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
      (concat "%" (number-to-string w) "d ")) line) 'face 'linum)))

; Put backups in a designated directory
; http://ergoemacs.org/emacs/emacs_set_backup_into_a_directory.html
(setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))

; Follow symlinks without prompting
; https://stackoverflow.com/questions/15390178/emacs-and-symbolic-links
(setq vc-follow-symlinks 1)

; Disable bindings that interfere with LXTerminal's clipboard bindings.
(global-unset-key (kbd "C-V"))
(global-unset-key (kbd "C-C"))

; Enable mouse integration
; https://bitheap.org/mouseterm/
(unless window-system
  (xterm-mouse-mode 1)
  (global-set-key [mouse-4] '(lambda ()
                               (interactive)
                               (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda ()
                               (interactive)
                               (scroll-up 1))))

; Fix shift+up
; https://groups.google.com/forum/?fromgroups=#!topic/gnu.emacs.help/rR478H4BDU8
(define-key input-decode-map "\e[1;2A" [S-up])
(if (equal "xterm" (tty-type))
  (define-key input-decode-map "\e[1;2A" [S-up]))

; Markdown
; http://jblevins.org/projects/markdown-mode/
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

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
