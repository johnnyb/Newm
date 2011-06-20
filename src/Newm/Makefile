all:
	gcc -I ../include/ *.m -c
	libtool -static *.o -framework Foundation -o ../build/libnewm.a
	libtool -dynamic *.o -framework Foundation -lc -o ../build/libnewm.so

clean:
	rm -f *.o
