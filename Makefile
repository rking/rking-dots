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
	@echo
	@echo -ne "\e[36mSymlinking ~/bin/*'s\e[0m: "
	@for n in bin/*; do echo -n "$${n##bin/} "; ln -fs `pwd`/$$n ~/bin; done
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
