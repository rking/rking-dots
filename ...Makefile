# This file is used by: http://github.com/ingydotnet/....git
install:
	make install
deps:
	@/bin/echo -e "\e[36mTesting for dependant -dots\e[0m: "
	[ -d $$DOTDOTDOT_ROOT/src/etcet-dots ]
	[ -d $$DOTDOTDOT_ROOT/src/sane-dots ]
	[ -d $$DOTDOTDOT_ROOT/src/vim-dots ]
	[ -d $$DOTDOTDOT_ROOT/src/riby-dots ]
	[ -d $$DOTDOTDOT_ROOT/src/perl-dots ]
	[ -d $$DOTDOTDOT_ROOT/src/linux-dots ]
	[ -d $$DOTDOTDOT_ROOT/src/zsh-git-prompt ]
	[ -d $$DOTDOTDOT_ROOT/src/git-dots ]
	[ -d $$DOTDOTDOT_ROOT/src/rking-dots ]
	[ -d $$DOTDOTDOT_ROOT/src/zu ]
