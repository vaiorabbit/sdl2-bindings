require_relative 'lib/sdl2'

include SDL2

if __FILE__ == $0
  SDL2.load_lib('libSDL2.dylib') # '/usr/local/lib/libSDL2.dylib'
  SDL_SetMainReady()
  success = SDL_Init(SDL_INIT_EVERYTHING)
  exit if success < 0

  fpsdelay = 1000 / 30;


  safety = 0
  event = Fiddle.malloc(1024)
  done = false
  while not done
    while SDL_PollEvent(event) != 0
      p event
    end
    safety += 1
    p safety
    done = true if safety >= 100
    SDL_Delay(fpsdelay)
  end

  SDL_Quit()
end
