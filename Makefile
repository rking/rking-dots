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
	@echo
	@echo -e "\e[32mMaking ~/.screenrc\e[0m: "
	([ ! -e ~/.localrc ] && \
		echo -e 'export SCREENESC=a SCREENCOLOR=g' > ~/.localrc) || true
	./make-screenrc
	@echo
	@for n in ~/bin/* ~/.*; do \
		([ -L $$n -a ! -e $$n ] && ( \
			echo -e "\e[31mRemoving dead symlink: $$n\e[0m"; echo rm $$n \
		)) || true; done

uninstall:
	@echo -ne "\e[31mRemoving symlinks: $$n\e[0m:"
	@for n in .* bin/*; do \
		INST=~/$$n; \
		[ -L $$INST ] && (rm $$INST && echo -ne "$$INST"); \
		done
	@echo -e "\n\n=~("
