# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias rmf='sudo rm -r'
alias cpf="sudo cp -r"
# Docker operation alias
 alias drm="sudo docker rm"
 alias dps="sudo docker ps"
 alias dima="sudo docker images"
 alias drmi="sudo docker rmi"
 alias drun="sudo docker run"
 alias dexec="sudo docker exec -i -t"
 alias dbuild="sudo docker build"
 alias dstop="sudo docker stop"
 alias dstart="sudo docker start"
alias grn="grep -rn"
# Git commands
alias gcommit="git commit"
alias gco="git checkout"
alias gstatus="git status"
alias glog="git log"
alias gpush="git push origin"
alias gpushf="git push -f origin"
alias gadd="git add"
alias grm="git rm"
alias gamend="git commit --amend"
alias greset="git reset"
alias gsreset="git reset --soft" #reset soft
alias ghreset="git reset --hard" #reset hard
alias gcheckout="git checkout" #checkout
alias ggiveup="git checkout --" #git give up
alias gmbr="git branch -m" #git modify branch
alias gdbr="git branch -d" #git delete branch
# RackHD repo aliases
alias csample="cd ~/_src/samples"
alias ccore="cd ~/src/on-core"
alias vcore="cd ~/src/on-core;vim index.js"
alias chttp="cd ~/src/on-http"
alias vhttp="cd ~/src/on-http;vim index.js"
alias shttp="cd ~/src/on-http;sudo node index.js 2>&1 > /home/onrack/tmp/log/on-http.log &"
alias ctask="cd ~/src/on-tasks"
alias vtask="cd ~/src/on-tasks;vim index.js"
alias cgraph="cd ~/src/on-taskgraph"
alias vgraph="cd ~/src/on-taskgraph;vim index.js"
alias sgraph="cd ~/src/on-taskgraph;sudo node index.js 2>&1 > /home/onrack/tmp/log/on-graph.log &"
alias cimage="cd ~/_src/on-imagebuilder"
alias vimage="cd ~/_src/on-imagebuilder;vim index.js"
alias cdoc="cd ~/_src/docs/docs"
alias vdoc="cd ~/_src/docs/docs;vim README.md"
alias csku="cd ~/_src/on-skupack"
alias vsku="cd ~/_src/on-skupack;vim README.md"
alias ctftp="cd ~/src/on-tftp"
alias stftp="cd ~/src/on-tftp;sudo node index.js 2>&1 > /home/onrack/tmp/log/on-tftp.log &"
alias csyslog="cd ~/src/on-syslog"
alias ssyslog="cd ~/src/on-syslog;sudo node index.js 2>&1 > /home/onrack/tmp/log/on-sys.log &"
alias cdhcp="cd ~/src/on-dhcp-proxy"
alias sdhcp="cd ~/src/on-dhcp-proxy;sudo node index.js 2>&1 > /home/onrack/tmp/log/on-dhcp.log &"
alias srackhd="stftp;ssyslog;shttp;sgraph;sdhcp"
alias bk2="cd ../../"
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

PATH="/home/onrack/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/onrack/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/onrack/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/onrack/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/onrack/perl5"; export PERL_MM_OPT;

export TERM='xterm-256color'
