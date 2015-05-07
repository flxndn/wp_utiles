
README.md: doc.sec
	sectxt.py --markdown $^ > $@

install:
	d=$$(pwd); \
	for i in $$(ls bin/*/*.pl; ls bin/*/*.sh);do \
		ln -s -f $$d/$$i ~/bin/; \
	done 
