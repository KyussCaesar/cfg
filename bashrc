# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# {

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
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability
force_color_prompt=yes

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w '
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

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

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

#}

# My stuff

# misc
#{

## Show calendar on login
cal;date;echo;

# Reminders
echo "Reminders:"
echo
echo "Don't forget: you made /usr/bin/python point to python3.6."
echo "If anything breaks, check if this is the reason".
echo
echo "If davfs2 keeps playing up, try fusedav instead. Also, remember"
echo "that you changed the setting 'if_match_bug 1'"
echo

shopt -s globstar
# shopt -s nullglob

#}

## ALIASES
#{
alias vim='/usr/local/bin/vim' # I've got Vim7 from ubuntu repos but also Vim8 from internet; this points 'vim' to vim8

# prompt on overwrite
alias rm="rm -vi"
alias mv="mv -vi"
alias cp="cp -vi"

# ssh to ec2
alias sshec2="ssh -i ~/.ssh/aws.pem ec2-user@ec2-13-59-255-126.us-east-2.compute.amazonaws.com"

# Makes ls look nicer
alias ls='ls -Fh --color=always --group-directories-first'

# common aliases
alias ll='ls -l'
alias la='ls -a'

# quick move up one pnrt
alias up="cl .."

alias open="gnome-open"

alias more="more -dlsup"

# I use vim too much
alias :q="echo \"This is bash, not vim!\""

# script to concatenate pdfs. currently broken
#alias staple="~/Documents/projects/staple/staple.py"

alias vrc='vim ~/.vimrc'
alias brc='vim ~/.bashrc'
alias pfp='cl ~/Documents/University/2018/fyp'

alias mdrp="sudo mount -t davfs https://files.engineering.auckland.ac.nz/pdrive/MECH/asou651-rtan781 pdrive -o uid=antony,gid=antony"
alias mdrs="sudo mount -t davfs https://files.engineering.auckland.ac.nz/sdrive sdrive -o uid=antony,gid=antony"
alias mdrh="sudo mount -t davfs https://files.engineering.auckland.ac.nz/hdrive/asou651 hdrive -o uid=antony,gid=antony"
alias mdra="mdrp; mdrs; mdrh;"

alias ump="sudo umount pdrive"
alias ums="sudo umount sdrive"
alias umh="sudo umount hdrive"
alias uma="sudo umount pdrive; sudo umount hdrive; sudo umount sdrive;"

# starts xflux.
alias xflux='/opt/xflux/start_xflux.sh'

# git
alias gads="git add \"*\"; git status"

# python
alias python="python3.6"
alias python3="python3.6"

# matlab
alias matlab="matlab -nodesktop -nodisplay -nosplash"

#}

## SHELL FUNCTIONS
#{

# Returns "git:branchname"
parse_git_branch () {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/git:\1 /'
}

PS0='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] '

PS1=${PS0%?}' $(parse_git_branch)\n$ '

# Does ls immediately after cd
# 'cl' short for "Change (directory) then List contents"
cl () {
	cd "$*"
	ls
    # update git branch name in prompt
	echo
}

# mkdir and cl
mkcl () {
	mkdir "$1"
	cl "$*"
}

# Creates a coding project environment
mkproj () {
	echo "Creating project directory..."

	# set up directory tree with build, source and dependency folders
	mkdir -v $1 $1/build $1/src $1/deps
	cd $1

	# create empty makefile
	touch makefile
    touch .gitignore
    touch README.md

	# initialise git repo
	git init
	git add "*"
	git commit -m "Project created"

	# list contents
	ls
}

# Adjusts the brightness of the screen (requires sudo privelige)
brightness () {
	max=$(cat /sys/class/backlight/intel_backlight/max_brightness)
	if [ $# -eq 0 ]; then
# PRINT USAGE INFO
		echo "Usage: brightness [ setting ]"
		echo "Where setting is one of: min, low, med, high, max, current, set [0..1]"
		echo "If an invalid option is passed, brightness will be set to max."
		echo "Probably don't set value outside of 0-1, I don't know what will happen."
		return 1
	fi
	if [ $1 == "current" ]; then
		PERCENT=`cat /sys/class/backlight/intel_backlight/actual_brightness`/$max
		echo $PERCENT
		return 0
	fi
	brightnessset=$max
	if [ $1 == "set" ]; then
		brightnessset=$(echo "($2 * $max)/1" | bc)
	fi
	if [ $1 == "min" ]; then
		brightnessset=$(echo "(0.01 * $max)/1" | bc)
	fi
	if [ $1 == "low" ]; then
		brightnessset=$(echo "(0.05 * $max)/1" | bc)
	fi
	if [ $1 == "med" ]; then
		brightnessset=$(echo "(0.15 * $max)/1" | bc)
	fi
	if [ $1 == "high" ]; then
		brightnessset=$(echo "(0.4 * $max)/1" | bc)
	fi
	if [ $1 == "max" ]; then
		brightnessset=$max
	fi
	echo $brightnessset | sudo tee /sys/class/backlight/intel_backlight/brightness
	return 0
}

# open vim help
velp () {
    vim -c "help $1 | only"
}

# Use vim as man pager (this way, you can use tags to navigate to related topics.)
export MANPAGER="env MAN_PN=1 vim -M +MANPAGER -c \"set colorcolumn=0 | set foldcolumn=0\" -"

alias 'init-report'='cp -r ~/.latex-resources/project/* .'

#}

## SHORTCUTS
#{
# General shortcut function
# $1 : the title of the folder to be displayed
# $2 : the path to the folder to cd.
shortcut () {
	echo $1
	cd $2
	ls ./
}

# Home dir shortcut.
home () {
	shortcut 'Home Folder' ~
}

# Douments folder shortcut
docs () {
	shortcut 'Documents Folder' ~/Documents
}

# Work folder shortcut
work () {
	shortcut 'Work Folder' ~/Documents/work/
}

# Projects folder shortcut
projs () {
	shortcut 'Projects Folder' ~/Documents/projects
}

# University folder shortcut
uni () {
	shortcut 'University Folder' ~/Documents/University/2018/sem1/
}

#}

export PATH=/usr/local/texlive/2017/bin/x86_64-linux/:~/ctags/build/bin/:$PATH
export PARINIT='rTbgqr B=.,?_A_a Q=_s>|'

export ec2=ec2-13-59-255-126.us-east-2.compute.amazonaws.com

# run something in background with output piped to null
# TODO: make name show up properly
quietly () {
    $@ &> /dev/null &
}
