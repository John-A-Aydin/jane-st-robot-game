all: build/robot-game

.PHONY: all

build:
	mkdir -p $@

build/robot-game: build/main.o build/sim.o | build
	g++ -std=c++20 -o $@ $^ -lm -lSDL2 -lSDL2_ttf

build/main.o: src/main.cpp | build
	g++ -std=c++20 -o $@ -c $^

build/sim.o: src/sim.cpp | build
	g++ -std=c++20 -o $@ -c $^

clean:
	rm -f build/*