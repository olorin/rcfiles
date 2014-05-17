export EDITOR="vim"
## Check for an interactive session
[ -z "$PS1" ] && return

export PATH=$HOME/bin:$HOME/.cabal/bin:$HOME/src/julia/usr/bin:/usr/bin/vendor_perl:$PATH
alias ls='ls --color=auto'

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

# colored prompt
if [ "`tput colors`" = "256" ]; then
  B="\e[0;38;5;67m"
  G="\e[0;38;5;114m"
  Y="\e[0;38;5;214m"
else
  B="\e[0;34m"
  G="\e[0;32m"
  Y="\e[0;33m"
fi

W="\e[0m"

PS1="\[$B\]┌─\[$W\][ \[$Y\]\A \[$W\]][ \[$G\]\h:\w \[$W\]]\n\[$B\]└─\[$Y\]> \[$W\]"

. /usr/bin/virtualenvwrapper.sh

export GOROOT=$HOME/.go
export PATH=$HOME/.go/bin:$PATH
export GOPATH=$HOME/src/go
export PATH=$HOME/src/go/bin:$PATH
export PATH=$HOME/src/cruft/bin:$PATH

export HISTSIZE=999999
alias py="ipython --pylab"

SHELLMARKSDIR="$HOME/.shellmarks"
mkdir -p $SHELLMARKSDIR
function mark_alias { alias $(basename $1)="cd -P $1"; }

function mark { # Mark a directory
    symlink=$SHELLMARKSDIR/$1
    ln -ivs "$(pwd)" $symlink && mark_alias $symlink
}
alias m=mark

function unmark { # Remove a mark
    symlink=$SHELLMARKSDIR/$1
    rm -iv $symlink
    if [ ! -f $symlink ]; then
        unalias $1
    fi
}
alias u=unmark

function shellmarks { # List all existing marks
    LINK_COLOR=$'\e[1;35m'
    RESET_COLOR=$'\e[0m'
    for symlink in $SHELLMARKSDIR/*; do
        echo "${LINK_COLOR}    $(basename $symlink) ${RESET_COLOR} -> $(readlink $symlink)"
    done
}

for symlink in $SHELLMARKSDIR/*; do # load all existing symlinks as aliases
    mark_alias $symlink
    test -e $symlink || rm $symlink # remove symlinks if source does not exist
done

