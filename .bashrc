case "$TERM" in
    xterm*|rxvt*|screen)
        PROMPT_COMMAND='
            echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"
            [ -n "$TMUX" ] && $(tmux set default-path $(pwd))
        '
        ;;
    *)
        ;;
esac

