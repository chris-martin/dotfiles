export PATH="$HOME/bin:$PATH"

case "$TERM" in
    xterm*|rxvt*|screen)
        PROMPT_COMMAND='
            echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"
            [ -n "$TMUX" ] && $(tmux set default-path "$(pwd)")
        '
        ;;
    *)
        ;;
esac

# https://gist.github.com/namuol/9122237
function fuck() {
  killall -9 $1;
  if [ $? == 0 ]
  then
    echo
    echo " (╯°□°）╯︵$(echo $1|flip &2>/dev/null)"
    echo
  fi
}

