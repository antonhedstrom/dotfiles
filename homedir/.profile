
# Configure colors, if available.
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  c_reset='\[\e[0m\]'
  c_user='\[\e[1;31m\]'
  c_path='\[\e[1;31m\]'
  c_git_clean='\[\e[0;32m\]'
  c_git_staged='\[\e[0;92m\]'
  c_git_unstaged='\[\e[0;95m\]'
  c_input='\[\e[0;37m\]'
  c_grey='\[\e[2m\]'

  c_turkos='\[\e[1;36;40m\]'
else
  c_reset=
  c_user=
  c_path=
  c_git_clean=
  c_git_staged=
  c_git_unstaged=
fi

# Add the titlebar information when it is supported.
case $TERM in
xterm*|rxvt*)
  TITLEBAR='\[\e]0;\u@\h: \w\a\]';
  ;;
*)
  TITLEBAR="";
  ;;
esac

# Function to assemble the Git parsingart of our prompt.
git_prompt ()
{
  GIT_DIR=`git rev-parse --git-dir 2>/dev/null`
  if [ -z "$GIT_DIR" ]; then
    return 0
  fi
  GIT_BRANCH=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
  STATUS=`git status --porcelain`
  if [ -z "$STATUS" ]; then
    git_color="${c_git_clean}"
  else
    echo -e "$STATUS" | grep -q '^ [A-Z\?]'
    if [ $? -eq 0 ]; then
      git_color="${c_git_unstaged}"
    else
      git_color="${c_git_staged}"
    fi
  fi
  echo " - [$git_color$GIT_BRANCH$c_reset]"
}

# Thy holy prompt.
PROMPT_COMMAND="$PROMPT_COMMAND PS1=\"${TITLEBAR}${c_grey}\u${c_reset}: ${c_turkos}\w${c_reset}\$(git_prompt) \n${c_grey}\A${c_reset}# ${c_input}\" ;"
PROMPT_COMMAND="$PROMPT_COMMAND PS2=\"> \" ;"
PROMPT_COMMAND="$PROMPT_COMMAND PS4=\"+ \" ;"

function proml {
  local       BLUE="\[\033[0;34m\]"
  local        RED="\[\033[0;31m\]"
  local  LIGHT_RED="\[\033[1;31m\]"
  local      WHITE="\[\033[1;37m\]"
  local LIGHT_GRAY="\[\033[0;37m\]"

  case $TERM in
    xterm*)
       TITLEBAR='\[\033]0;\u@\h:\w\007\]'
       ;;
    *)
       TITLEBAR="hej"
       ;;
  esac


  PS1="${TITLEBAR}\

  $LIGHT_RED\u : \w \
  \n$LIGHT_GRAY\A $WHITE\$$LIGHT_GRAY "\
  PS2='> '
  PS4='+ '
}
#proml

