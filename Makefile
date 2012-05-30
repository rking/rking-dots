install:
	[ -e ~/local ] || mkdir ~/local
	[ -e ~/.zsh ] || mkdir ~/.zsh
	@echo
	@echo
	@/bin/echo -ne "\e[36mInstalling XCompose\e[0m: "
	( cd xcompose && ./configure && make install )
	@echo
	@echo
	perl -MTerm::ExtendedColor -e 1 || ( \
	    echo 'Installing Term::ExtendedColor for ls++'; \
	    echo 'Try: cpanm Term::ExtendedColor' )
	ln -fs `pwd`/ls--/ls++ ~/bin/
	@echo
	@/bin/echo -ne "\e[36mInstalling zsh-git-prompt\e[0m: "
	[ -e ~/.zsh/git-prompt ] || mkdir ~/.zsh/git-prompt
	ln -fs `pwd`/zsh-git-prompt/gitstatus.py ~/.zsh/git-prompt/
	ln -fs `pwd`/zsh-git-prompt/zshrc.sh ~/.zsh-git-prompt
	# ...then this ↑ is referenced in ~/.zshenv
	@echo
	([ ! -e ~/.localrc ] && \
		/bin/echo -e 'export TMUXESC=a TMUXCOLOR=green COLOR=32' \
			> ~/.localrc) || true
	@echo
	@for n in ~/bin/* ~/.*; do \
		([ -L $$n -a ! -e $$n ] && ( \
			/bin/echo -e "\e[31mRemoving dead symlink: $$n\e[0m"; rm $$n \
		)) || true; done

deps:
	emerge dev-vcs/tig
