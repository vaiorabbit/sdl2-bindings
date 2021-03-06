require_relative '../lib/sdl2'

include SDL2

WINDOW_W = 640
WINDOW_H = 360

if __FILE__ == $0
  SDL2.load_lib('/usr/local/lib/libSDL2.dylib', gfx_libpath: '/usr/local/lib/libSDL2_gfx.dylib' ) # '/usr/local/lib/libSDL2.dylib'
  success = SDL_Init(SDL_INIT_EVERYTHING)
  exit if success < 0

  window = SDL_CreateWindow("Minimal SDL2_gfx Test via sdl2-bindings", 0, 0, WINDOW_W, WINDOW_H, 0)

  renderer = SDL_CreateRenderer(window, -1, 0)

  event = SDL_Event.new
  done = false
  while not done
    while SDL_PollEvent(event) != 0
      # 'type' and 'timestamp' are common members for all SDL Event structs.
      event_type = event[:common][:type]
      # event_timestamp = event[:common][:timestamp]
      # puts "Event : type=0x#{event_type.to_s(16)}, timestamp=#{event_timestamp}"
      case event_type
      when SDL_KEYDOWN
        if event[:key][:keysym][:sym] == SDLK_ESCAPE
          done = true
        end
      end
    end

    SDL_SetRenderDrawColor(renderer, 0xA0, 0xA0, 0xA0, 0xFF)
    SDL_RenderClear(renderer)

    pixelColor(renderer, 100, 100, 0xFFFFFFFF) # Uint32 color = 0x[AA][BB][GG][RR]
    pixelRGBA(renderer, 101, 100, 0xFF, 0x00, 0x00, 0xFF)

    hlineColor(renderer, 0, 100, 50, 0xFFFFFFFF)
    vlineColor(renderer, 50, 0, 100, 0xFFFF00FF)

    rectangleColor(renderer, 5, 5, 95, 95, 0xFF00FFFF)
    rectangleRGBA(renderer, 10, 10, 90, 90, 0, 0, 0xFF, 0xFF)

    circleColor(renderer, 150, 150, 50, 0xFF00FF00)
    filledCircleRGBA(renderer, 150, 150, 45, 0x00, 0xFF, 0x00, 0xFF)

    SDL_RenderPresent(renderer)

    SDL_Delay(10)
  end

  p SDL_imageFilterMMXdetect()
  SDL_imageFilterMMXoff()
  SDL_imageFilterMMXon()


  SDL_DestroyRenderer(renderer)
  SDL_DestroyWindow(window)
  SDL_Quit()
end
