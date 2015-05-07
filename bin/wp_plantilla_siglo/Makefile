SHELL:=/bin/bash

README.sec: plantilla_siglo.pl
	$^ -h > $@

test: plantilla_siglo.pl
	diff <($^ -i | $^) <($^ -o) && echo "OK Sin modificadores";
	diff <($^ -i | $^ -t) <($^ -o -t) && echo "OK ignorando títulos";
	diff <($^ -i | $^ -c) <($^ -o -c) && echo "OK ignorando categorías";
