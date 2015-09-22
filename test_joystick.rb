require_relative 'lib/sdl2'

include SDL2

if __FILE__ == $0
  SDL2.load_lib('libSDL2.dylib') # '/usr/local/lib/libSDL2.dylib'
  SDL_SetMainReady()
  success = SDL_Init(SDL_INIT_EVERYTHING)
  exit if success < 0

  n_joysticks = SDL_NumJoysticks()
  for i in 0...n_joysticks
    name = SDL_JoystickNameForIndex(i)
    printf("Joystick %d: %s\n", i, name ? name : "Unknown Joystick")
  end

  WINDOW_W = 320
  WINDOW_H = 240
  window = SDL_CreateWindow("1st SDL Window via sdl2-bindings", 0, 0, WINDOW_W, WINDOW_H, 0)

  fpsdelay = 100;

  event = SDL_Event.new
  done = false
  while not done
    while SDL_PollEvent(event) != 0
      # 'type' and 'timestamp' are common members for all SDL Event structs.
      event_type = event.common.type
      event_timestamp = event.common.timestamp
      puts "Event : type=0x#{event_type.to_s(16)}, timestamp=#{event_timestamp}"

      case event_type
      when SDL_KEYDOWN
        if event.key.keysym_sym == SDLK_SPACE
          puts "\tSPACE key pressed."
        end
        if event.key.keysym_sym == SDLK_ESCAPE
          puts "\tESC key pressed."
          done = true
        end
      end
    end

    SDL_Delay(fpsdelay)
  end

  SDL_DestroyWindow(window)
  SDL_Quit()
end
