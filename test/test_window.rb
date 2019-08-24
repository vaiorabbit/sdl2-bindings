require_relative '../lib/sdl2'

include SDL2

if __FILE__ == $0
  SDL2.load_lib('libSDL2.dylib') # '/usr/local/lib/libSDL2.dylib'
  success = SDL_Init(SDL_INIT_EVERYTHING)
  exit if success < 0

  WINDOW_W = 320
  WINDOW_H = 240
  window = SDL_CreateWindow("1st SDL Window via sdl2-bindings", 0, 0, WINDOW_W, WINDOW_H, 0)

  fpsdelay = 100;

  count = 0
  event = SDL_Event.new
  done = false
  while not done
    while SDL_PollEvent(event) != 0
      # 'type' and 'timestamp' are common members for all SDL Event structs.
      event_type = event[:common][:type]
      event_timestamp = event[:common][:timestamp]
      puts "Event : type=0x#{event_type.to_s(16)}, timestamp=#{event_timestamp}"

      case event_type
      when SDL_KEYDOWN
        if event[:key][:keysym][:sym] == SDL2::SDLK_SPACE
          puts "\tSPACE key pressed."
        end
      end
    end

    count += 1
    done = true if count >= 100
    SDL_Delay(fpsdelay)
  end

  SDL_DestroyWindow(window)
  SDL_Quit()
end
