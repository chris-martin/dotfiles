; Fix shift+up
; https://groups.google.com/forum/?fromgroups=#!topic/gnu.emacs.help/rR478H4BDU8
(define-key input-decode-map "\e[1;2A" [S-up])
(if (equal "xterm" (tty-type))
  (define-key input-decode-map "\e[1;2A" [S-up]))

