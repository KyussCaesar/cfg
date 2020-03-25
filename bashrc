#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# If bashrc already run for this shell, don't do it again
# [[ -z "$BASHRC_SET" ]] && return

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

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Use vim as man pager (this way, you can use tags to navigate to related topics.)
# (Doesn't always work though)
export MANPAGER="env MAN_PN=1 vim -M +MANPAGER -c \"set colorcolumn=0 | set foldcolumn=0 | set nonumber\" -"

# prompt on overwrite
alias rm="rm -vi"
alias mv="mv -vi"
alias cp="cp -vi"

# aliases for ls, grep, to get colour output
alias ls='ls -Fh --color=auto --group-directories-first'
alias ll='ls -l'
alias la='ls -A'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias more="more -dlsup"

# do you know how many times I've used GhostScript? Literally never.
# do you know how many times I've wanted to count graph components? Literally never.
alias gs="git status"
alias gc="git commit"
alias ga="git add"
alias gauc="git add -u && git commit"
alias gaucp="git add -u && git commit && git push"

# I use vim too much
alias :q="echo \"This is bash, not vim!\""

# quickly open config
alias vrc='vim ~/.vimrc'
alias brc='vim ~/.bashrc'

# quickly add everything that's changed
alias gads="git add \"*\"; git status"

# move to `p`arent `d`irectory
alias pd="cl .."

# Returns "git:branchname"
parse_git_branch () {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/git:\1 /'
}

# Shell Prompt
# Coloured with git branch
pre_ps1='\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\W\[\033[00m\] '
export PS1=${pre_ps1%?}' $(parse_git_branch)\n$ '

# open vim help
velp () {
    vim -c "help $1 | only"
}

# run something in background with output piped to null
# TODO: make name show up properly
quietly () {
    $@ &> /dev/null &
}

# vim keybindings
set -o vi

## Show calendar on login
cal;date;echo;

# Reminders
if [ -f ~/reminders ]; then
    echo "Reminders:"
    echo
    cat ~/reminders
fi

# Place any machine-specific commands in here.
if [ -f ~/.bash ]; then
    source ~/.bash
fi

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

export EDITOR=vim

# set so that bashrc is loaded only once
export BASHRC_SET=1

alias disk-usage="du -sh -- * | sort -h"

# expose scripts in current and subdirectories
export PATH=$PATH:.:./bin:./script


