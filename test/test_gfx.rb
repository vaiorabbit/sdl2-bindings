require_relative '../lib/sdl2'

WINDOW_W = 640
WINDOW_H = 360

if __FILE__ == $PROGRAM_NAME
  SDL.load_lib('/opt/homebrew/lib/libSDL2.dylib', gfx_libpath: '/opt/homebrew/lib/libSDL2_gfx.dylib') # '/usr/local/lib/libSDL2.dylib'
  success = SDL.Init(SDL::INIT_EVERYTHING)
  exit if success < 0

  window = SDL.CreateWindow("Minimal SDL2_gfx Test via sdl2-bindings", 0, 0, WINDOW_W, WINDOW_H, 0)

  renderer = SDL.CreateRenderer(window, -1, 0)

  event = SDL::Event.new
  done = false
  while not done
    while SDL.PollEvent(event) != 0
      # 'type' and 'timestamp' are common members for all SDL Event structs.
      event_type = event[:common][:type]
      # event_timestamp = event[:common][:timestamp]
      # puts "Event : type=0x#{event_type.to_s(16)}, timestamp=#{event_timestamp}"
      case event_type
      when SDL::KEYDOWN
        if event[:key][:keysym][:sym] == SDL::SDLK_ESCAPE
          done = true
        end
      end
    end

    SDL.SetRenderDrawColor(renderer, 0xA0, 0xA0, 0xA0, 0xFF)
    SDL.RenderClear(renderer)

    SDL.pixelColor(renderer, 100, 100, 0xFFFFFFFF) # Uint32 color = 0x[AA][BB][GG][RR]
    SDL.pixelRGBA(renderer, 101, 100, 0xFF, 0x00, 0x00, 0xFF)

    SDL.hlineColor(renderer, 0, 100, 50, 0xFFFFFFFF)
    SDL.vlineColor(renderer, 50, 0, 100, 0xFFFF00FF)

    SDL.rectangleColor(renderer, 5, 5, 95, 95, 0xFF00FFFF)
    SDL.rectangleRGBA(renderer, 10, 10, 90, 90, 0, 0, 0xFF, 0xFF)

    SDL.circleColor(renderer, 150, 150, 50, 0xFF00FF00)
    SDL.filledCircleRGBA(renderer, 150, 150, 45, 0x00, 0xFF, 0x00, 0xFF)

    SDL.RenderPresent(renderer)

    SDL.Delay(10)
  end

  p SDL.imageFilterMMXdetect()
  SDL.imageFilterMMXoff()
  SDL.imageFilterMMXon()


  SDL.DestroyRenderer(renderer)
  SDL.DestroyWindow(window)
  SDL.Quit()
end
