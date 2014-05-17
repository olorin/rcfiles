all: emacs xmonad
	cp -f $(HOME)/.emacs $(HOME)/.emacs~ ; cp emacs $(HOME)/.emacs
	mkdir -p $(HOME)/.xmonad; cp -fr $(HOME)/.xmonad $(HOME)/.xmonad~ ; cp -r xmonad/* $(HOME)/.xmonad/
