# WIP

Just messing around with SDL2 to simulate [Jane Street's puzzle from April 2024](https://www.janestreet.com/puzzles/robot-capture-the-flag-index/)


[robot-game.webm](https://github.com/John-A-Aydin/jane-st-robot-game/assets/132794075/2d0b105d-0d4d-4bb9-99b4-852330623975)


# How to Run

For the animated simulator you need to download [SLD2](https://www.libsdl.org/).

On Debian Linux, use
```console
sudo apt-get install libsdl2-dev libsdl2-ttf-dev
```
On macOS, use
```console
brew install sdl2
```

To run the animated simulator go to the root directory of the project and use
```console
make && ./build/robot-game
```

To run the an optimized version of the simulator without the animation use
```console
make sim && ./build/sim
```




# Game Explanation

The full explanation can be found [here](https://www.janestreet.com/puzzles/robot-capture-the-flag-index/).

Two robots are placed at the center of a unit circle. A flag is placed somewhere inside the circle, at a location chosen uniformly at random. Once the flag is placed, Robot 1 (blue) is able to deduce its direction to the flag, and Robot 2 (red) is able to deduce its distance to the flag. (Equivalently: if (r, θ) are the polar coordinates of the flag’s location, Robot 1 is told r and Robot 2 is told θ.)

Both robots can choose to make a single move after the flag is placed, but they do not know what the other robot is doing. Whichever robot is closest to the flag after moving, wins the round.

Robot 1 is programmed to play a fixed distance along the detected angle θ, but otherwise both robots play optimally.


# Solution

The first step in solving this problem is finding the optimal strategies for the robots.

Let $d_{1}$ and $d_{2}$ be Robot 1 and Robot 2's distances to the flag.

Since Robot 2 knows the radius of the flag on the unit circle, $r$, and will know Robot 1's fixed radius, $R_{1}$, it will allways know Robot 1's distance to the flag, $d_{1}$.

Thinking about this problem in terms of polar coordinates, Robot 2 make a move that maximizes the interval of $\theta$ where $d_{2}\lt d_{1}$.

The ideal 
