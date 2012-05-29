install:
	[ -e ~/local ] || mkdir ~/local
	@echo
	@echo
	@echo -ne "\e[36mInstalling XCompose\e[0m: "
	( cd xcompose && ./configure && make full )
	@echo
	@echo
	@echo -ne "\e[36mInstalling zsh-git-prompt\e[0m: "
	[ -e ~/.zsh/git-prompt ] || mkdir ~/.zsh/git-prompt
	ln -fs `pwd`/zsh-git-prompt/gitstatus.py ~/.zsh/git-prompt/
	ln -fs `pwd`/zsh-git-prompt/zshrc.sh ~/.zsh-git-prompt
	# ...then this ↑ is referenced in ~/.zshenv
	@echo
	([ ! -e ~/.localrc ] && \
		echo -e 'export TMUXESC=a TMUXCOLOR=green COLOR=32' \
			> ~/.localrc) || true
	@echo
	@for n in ~/bin/* ~/.*; do \
		([ -L $$n -a ! -e $$n ] && ( \
			echo -e "\e[31mRemoving dead symlink: $$n\e[0m"; rm $$n \
		)) || true; done

deps:
	emerge dev-vcs/tig
