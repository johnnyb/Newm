
## Exceptions ##
#OBJC_EXC_FLAGS=-fobjc-exceptions -D_NATIVE_OBJC_EXCEPTIONS
OBJC_EXC_FLAGS=

LINUX_CFLAGS=-Wall -fconstant-string-class=NSConstantString -Wall -I ../include/ -I /usr/GNUstep/System/Library/Headers -I ../include/gnustepcompat
OSX_CFLAGS=-Wall -I ../include 
CFLAGS=$(LINUX_CFLAGS)

all: newmlib

newmlib: static

objectfiles:
	#gcc -Wall -I ../include/ -I /usr/GNUstep/System/Library/Headers *.m -c
	gcc $(CFLAGS) -c *.m

static: objectfiles
	ar cru ../build/libnewm.a *.o
	ranlib ../build/libnewm.a
	#libtool -static *.o -o ../build/libnewm.a

# NOTE - dynamic building doesn't really work yet
dynamic: objectfiles
	libtool -dynamic *.o -framework Foundation -lc -o ../build/libnewm.so

clean:
	rm -f *.o
