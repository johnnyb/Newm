# This command seems to work - gcc -fconstant-string-class=NSConstantString -fobjc-exceptions -Wall -L build -L /usr/GNUstep/System/Library/Libraries/ -I . -I include -I /usr/GNUstep/System/Library/Headers Newm/*.m *.m generated/*.m -lgnustep-base -lobjc
#


### Exception Flags ###
OBJC_EXC_FLAGS=
#OBJC_EXC_FLAGS=-fobjc-exceptions -D_NATIVE_OBJC_EXCEPTIONS

LINUX_CFLAGS=-fconstant-string-class=NSConstantString $(OBJC_EXC_FLAGS) -Wall -L build -L /usr/GNUstep/System/Library/Libraries/ -I . -I include -I /usr/GNUstep/System/Library/Headers
LINUX_LINKFLAGS=-lobjc -lgnustep-base -Wl,-whole-archive -lnewm -Wl,-no-whole-archive  -lssl

OSX_CFLAGS=-Wall -I. -I include -L build -framework Foundation 
OSX_LINKFLAGS=-lnewm -ObjC -framework Foundation

CFLAGS=$(LINUX_CFLAGS)
LINKFLAGS=$(LINUX_LINKFLAGS)

all: newmlib app

app: views
	gcc $(CFLAGS) $(LINKFLAGS) *.m generated/*.m -o build/newmapp 
	#gcc -I . -Wall generated/*.m *.m -I include -L build -framework Foundation -lnewm -ObjC -o build/newmapp
	cp build/newmapp public/newmapp.cgi

newmlib:
	cd Newm; $(MAKE) 

views:
	find view layout -type f -name '*.nmv'|xargs -n 1 ./buildview
clean:
	cd generated; $(MAKE) clean
	cd build; $(MAKE) clean
	cd Newm; $(MAKE) clean
	rm public/newmapp.cgi


### NOTE - see http://developer.apple.com/library/mac/#qa/qa1490/_index.html
# -ObjC and -all_load

## NOTE - interesting discussion of compilation issues on various platforms - http://blog.lyxite.com/2008/01/compile-objective-c-programs-using-gcc.html

# Important link options - http://gcc.gnu.org/onlinedocs/gcc/Link-Options.html
#
# Other info - http://lists.gnu.org/archive/html/gnustep-dev/2010-02/msg00083.html
