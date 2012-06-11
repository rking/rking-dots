# This file is used by: http://github.com/ingydotnet/....git
install:
	[ -d ~/bin ] || mkdir ~/bin
	ln -fs ~/.../src/ls--/ls++ ~/bin/
deps:
	@/bin/echo -e "\e[36mTesting for dependant -dots\e[0m: "
	[ -d ~/.../src/loop-dots ]
	[ -d ~/.../src/sharp-dots ]
	[ -d ~/.../src/sane-dots ]
	[ -d ~/.../src/1337-dots ]
	[ -d ~/.../src/vim-dots ]
	[ -d ~/.../src/ruby-dots ]
	[ -d ~/.../src/perl-dots ]
	[ -d ~/.../src/linux-dots ]
	[ -d ~/.../src/zsh-git-prompt ]
	[ -d ~/.../src/git-dots ]
	[ -d ~/.../src/ls-- ]
	[ -d ~/.../src/zu ]
