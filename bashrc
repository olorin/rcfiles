[ -z "$PS1" ] && return

export EDITOR="emacs"

export HISTSIZE=-1
export HISTCONTROL=ignorespace:ignoredups
export HISTTIMEFORMAT="%Y-%m-%dT%H%M%SZ"

PS1="∃ "

export PATH=/usr/bin/vendor_perl:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.cabal/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/bin:$PATH

. /usr/bin/virtualenvwrapper.sh

alias py="ipython --pylab"
alias jp="python -m json.tool"
alias lsgpg="gpg --list-keys --keyid-format=0xlong"
alias sb="stack build --haddock --test --bench"

if [ -d ${HOME}/.bashrc.d ]; then
	for f in ${HOME}/.bashrc.d/*.sh ; do
		. $f
	done
fi

eval $(keychain --eval --agents ssh -Q --quiet id_rsa)
eval $(keychain --eval --agents ssh -Q --quiet id_ed25519)

export GPG_TTY=$(tty)
