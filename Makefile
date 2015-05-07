
README.md: doc.sec bin/*/*.pl bin/*/*.sh
	( cat $<; \
	for i in $$(ls bin/*/*.pl; ls bin/*/*.sh);do \
		$$i -h; \
	done  | sed "s/^/\t/"; \
	) \
	| sectxt.py --markdown \
	> $@

clean:
	-rm README.md 

install:
	d=$$(pwd); \
	for i in $$(ls bin/*/*.pl; ls bin/*/*.sh);do \
		ln -s -f $$d/$$i ~/bin/; \
	done 
