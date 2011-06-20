all: static

objectfiles:
	gcc -I ../include/ *.m -c

static: objectfiles
	libtool -static *.o -framework Foundation -o ../build/libnewm.a

# NOTE - dynamic building doesn't really work yet
dynamic: objectfiles
	libtool -dynamic *.o -framework Foundation -lc -o ../build/libnewm.so

clean:
	rm -f *.o
