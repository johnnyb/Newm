all: views
	gcc -Wall *.m -framework Foundation

newm: 
	cd Newm; $(MAKE)

views:
	find view layout -type f -name '*.nmv'|xargs -n 1 ./buildview
clean:
	cd generated; $(MAKE) clean
	cd build; $(MAKE) clean
	cd Newm; $(MAKE) clean
	rm -f a.out
