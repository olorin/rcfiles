HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory extendedglob notify
unsetopt beep
bindkey -e
zstyle :compinstall filename '/home/sio/.zshrc'

autoload -Uz compinit
compinit

export GPG_TTY=$(tty)

if [ -d ${HOME}/.zshrc.d/enabled ]; then
	for f in ${HOME}/.zshrc.d/enabled/*.sh ; do
		. $f
	done
fi


PROMPT_SUBST=true
PROMPT='%(0?.%F{green}.%F{red})∃%f '
export EDITOR=emacs

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
