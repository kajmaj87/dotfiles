#
# ~/.bashrc
#
## Defaults 
[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

## Source other files

[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc

[[ -f ~/.bashrc.work ]] && . ~/.bashrc.work
[[ -f ~/.bashrc.manjaro ]] && . ~/.bashrc.manjaro
[[ -f ~/.bashrc.pi ]] && . ~/.bashrc.pi

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion
## History settings
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

## Custom prompt

# Save and reload the history after each command finishes - same history in all tabs
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

## Aliases and functions
### Common 

alias ll='ls -lha'

### Git

gitCommitAndPush() {
	git commit -m "$1"
	git push
}

gitCheckoutByGrep() {
	branch_name=$1
	git checkout $(git branch | grep $branch_name)
}

alias gp='git pull'
alias gs='git status'
alias ga='git add .; git status'
alias gac='git add .; gitCommitAndPush'
alias gc='gitCommitAndPush'
alias gd='git diff'
alias gr='git checkout -- .'
alias gm='gp; git checkout -B master origin/master'
alias gco='gitCheckoutByGrep'
alias gac='git add .; git commit -m'
