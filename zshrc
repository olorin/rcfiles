HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory extendedglob notify
unsetopt beep
bindkey -e
zstyle :compinstall filename '/home/sio/.zshrc'

autoload -Uz compinit
compinit

eval $(keychain --eval --agents ssh -Q --quiet id_rsa)
eval $(keychain --eval --agents ssh -Q --quiet id_ed25519)

export GPG_TTY=$(tty)

if [ -d ${HOME}/.zshrc.d/enabled ]; then
	for f in ${HOME}/.zshrc.d/enabled/*.sh ; do
		. $f
	done
fi

PS1="∃ "
export EDITOR=emacs
