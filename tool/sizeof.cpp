#include <SDL2/SDL.h>
#include <stdio.h>

int main(int argc, char **argv)
{
    SDL_Init(SDL_INIT_EVERYTHING);
    printf("Size of %s == %lu\n", "SDL_Event", sizeof(SDL_Event));
    SDL_Quit();

    return 0;
}

// SDL 2.0.3:
//
// $ clang++ -o sizeof sizeof.cpp `sdl2-config --cflags` `sdl2-config --libs` 
// $ ./sizeof
// Size of SDL_Event == 56

