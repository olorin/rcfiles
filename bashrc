[ -z "$PS1" ] && return

export EDITOR="vim"
export HISTSIZE=999999

PS1="λ "

export PATH=/usr/bin/vendor_perl:$PATH
export PATH=/usr/local/bin:$PATH

export GOROOT=$HOME/.go
export GOPATH=$HOME/src/go

export PATH=$HOME/.go/bin:$PATH
export PATH=$HOME/src/go/bin:$PATH
export PATH=$HOME/src/cruft/bin:$PATH
export PATH=$HOME/bin:$HOME/.cabal/bin:$HOME/src/julia/usr/bin:/usr/bin/vendor_perl:$PATH

. /usr/bin/virtualenvwrapper.sh

alias py="ipython --pylab"
