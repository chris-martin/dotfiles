export PATH="$HOME/bin:$PATH"
export PATH="$HOME/bitcoin/current/bin:$PATH"

alias emacs='/bin/emacs -nw'

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

# https://twitter.com/chris__martin/status/420992421673988096
alias such=git
alias very=git
alias wow='git status'
