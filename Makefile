install:
	@echo -ne "\e[36mSymlinking ~/.*'s\e[0m: "
	@for n in .*; do \
		vimbit=$${n##*.}; \
		vimbit=$${vimbit%%?}; \
		if [ $$n != . -a $$n != .. -a $$n != .git -a "$$vimbit" != sw ]; then \
			echo -n "$$n "; ln -fs `pwd`/$$n ~; fi; done
	@echo
	@echo
	[ -e ~/bin ] || mkdir ~/bin
	[ -e ~/local ] || mkdir ~/local
	[ -e ~/.zsh ] || mkdir ~/.zsh
	@echo
	@echo -ne "\e[36mSymlinking ~/bin/*'s\e[0m: "
	@for n in bin/*; do echo -n "$${n##bin/} "; ln -fs `pwd`/$$n ~/bin; done
	@echo
	@echo
	[ -e ~/local/bin/hub ] || ( \
	    [ -e hub/Rakefile ] || git submodule update --init hub && \
	    echo "Building 'hub'" && \
	    cd hub && rake install prefix=$$HOME/local)
	@echo
	@echo
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

uninstall:
	@echo -ne "\e[31mRemoving symlinks: $$n\e[0m:"
	@for n in .* bin/*; do \
		INST=~/$$n; \
		[ -L $$INST ] && (rm $$INST && echo -ne "$$INST"); \
		done
	@echo -e "\n\n=~("
