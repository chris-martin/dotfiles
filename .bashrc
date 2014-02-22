export PATH="$HOME/bin:$PATH"

# https://github.com/cfree3/config/blob/8491052f08a587406233483ba1cffc7fe8e169e0/.bashrc#L43
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

