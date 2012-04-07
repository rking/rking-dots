default:
	@[ -e ~/bin ] || mkdir ~/bin
	@for n in .*; do \
		if [ $$n != . -a $$n != .. -a $$n != .svn ]; then \
			echo -n "$$n "; ln -fs `pwd`/$$n ~; fi \
	done
	@echo
	@for n in bin/*; do echo -n "$${n##bin/} "; ln -fs `pwd`/$$n ~/bin; done
	@./make-screenrc
