require_relative '../lib/sdl2'
require_relative '../lib/sdl2_gfx'

include SDL2

WINDOW_W = 640
WINDOW_H = 360

if __FILE__ == $0
  SDL2.load_lib('/usr/local/lib/libSDL2.dylib', gfx_libpath: '/usr/local/lib/libSDL2_gfx.dylib' ) # '/usr/local/lib/libSDL2.dylib'
  SDL_SetMainReady()
  success = SDL_Init(SDL_INIT_EVERYTHING)
  exit if success < 0

  window = SDL_CreateWindow("Minimal SDL2_gfx Test via sdl2-bindings", 0, 0, WINDOW_W, WINDOW_H, 0)

  renderer = SDL_CreateRenderer(window, -1, 0)

  event = SDL_Event.new
  done = false
  while not done
    while SDL_PollEvent(event) != 0
      # 'type' and 'timestamp' are common members for all SDL Event structs.
      event_type = event.common.type
      # event_timestamp = event.common.timestamp
      # puts "Event : type=0x#{event_type.to_s(16)}, timestamp=#{event_timestamp}"
      case event_type
      when SDL_KEYDOWN
        if event.key.keysym_sym == SDLK_ESCAPE
          done = true
        end
      end
    end

    SDL_SetRenderDrawColor(renderer, 0xA0, 0xA0, 0xA0, 0xFF)
    SDL_RenderClear(renderer)
#    SDL_RenderCopy(renderer, texture, nil, pos)
    pixelColor(renderer, 100, 100, 0xFFFFFFFF)
    SDL_RenderPresent(renderer)

    SDL_Delay(10)
  end

  SDL_DestroyRenderer(renderer)
  SDL_DestroyWindow(window)
  SDL_Quit()
end
