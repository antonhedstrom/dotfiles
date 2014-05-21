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

$LIGHT_RED\u : \w\
	\n$RED\$(date +%H:%M) $WHITE\$$LIGHT_GRAY "\
	PS2='> '
	PS4='+ '
}


export PATH=/usr/bin:$PATH

export GIT_PAGER='less -r'

proml
