[ -z "$PS1" ] && return

export EDITOR="mg"
export HISTSIZE=999999

PS1="∃ "

export PATH=/usr/bin/vendor_perl:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.cabal/bin:$PATH
export PATH=$HOME/var/hsutil/.cabal-sandbox/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

. /usr/bin/virtualenvwrapper.sh

alias py="ipython --pylab"
alias jp="python -m json.tool"
alias lsgpg="gpg --list-keys --keyid-format=0xlong"

if [ -d ${HOME}/.bashcomplete ]; then
	for f in ${HOME}/.bashcomplete/* ; do
		. $f
	done
fi
