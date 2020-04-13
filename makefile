

INST_DIR = $$HOME/test_for_make/

all: main.c list.c matrix.c
	gcc -c list.c matrix.c
	ar -r static.a list.o matrix.o
	gcc -fpic -c list.c matrix.c
	gcc -shared list.o matrix.o -o dymanic.so
	gcc main.c list.c matrix.c -lm -o app.out

install: all
	@if [ -d $(INST_DIR) ]; \
	then \
	cp app.out $(INST_DIR); \
	echo "Установка в $(INST_DIR);" \
else \
	echo "Извините, $(INST_DIR) не найден"; \
fi
# Generate static lib
static: list.c matrix.c
	gcc -c list.c matrix.c
	ar -r static.a list.o matrix.o
# Generate dymanic lib
dymanic: list.c matrix.c
	gcc -fpic -c list.c matrix.c
	gcc -shared list.o matrix.o -o dymanic.so


clean:
	rm -rf *.o
