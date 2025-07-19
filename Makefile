.PHONY: all clean

all: myapp

# 編譯 object files
math/add.o: math/add.c math/add.h
	 gcc -Wall -std=c99 -O2 -c math/add.c -o math/add.o -I.

math/sub.o: math/sub.c math/sub.h
	 gcc -Wall -std=c99 -O2 -c math/sub.c -o math/sub.o -I.

utils.o: utils.c utils.h
	 gcc -Wall -std=c99 -O2 -c utils.c -o utils.o

plugin.o: plugin.c plugin.h math/add.h utils.h
	 gcc -Wall -std=c99 -O2 -fPIC -c plugin.c -o plugin.o

main.o: main.c math/add.h math/sub.h utils.h plugin.h
	 gcc -Wall -std=c99 -O2 -c main.c -o main.o

# 靜態函式庫
libmath.a: math/add.o math/sub.o
	 ar rcs libmath.a math/add.o math/sub.o

libutils.a: utils.o
	 ar rcs libutils.a utils.o

# 動態函式庫
libplugin.so: plugin.o libmath.a libutils.a
	 gcc -shared -o libplugin.so plugin.o libmath.a libutils.a

# 最終執行檔
myapp: libmath.a libutils.a libplugin.so main.o
	 gcc -Wall -std=c99 -O2 -o myapp main.o -L. -lplugin -lutils -lmath

# 清理所有產出
clean:
	 rm -f math/*.o *.o *.a *.so myapp

