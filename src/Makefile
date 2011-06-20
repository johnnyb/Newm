### NOTE - see http://developer.apple.com/library/mac/#qa/qa1490/_index.html
# -ObjC and -all_load

all: views
	gcc -I . -Wall generated/*.m *.m -I include -L build -framework Foundation -lnewm -ObjC

newm: 
	cd Newm; $(MAKE)

views:
	find view layout -type f -name '*.nmv'|xargs -n 1 ./buildview
clean:
	cd generated; $(MAKE) clean
	cd build; $(MAKE) clean
	cd Newm; $(MAKE) clean
	rm -f a.out
