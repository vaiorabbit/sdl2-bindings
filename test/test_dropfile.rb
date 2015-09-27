# TODO : Prepare Info.plist to support D&D on Mac OS X.
require_relative '../lib/sdl2'

include SDL2

if __FILE__ == $0
  SDL2.load_lib('libSDL2.dylib') # '/usr/local/lib/libSDL2.dylib'
  SDL_SetMainReady()
  success = SDL_Init(SDL_INIT_VIDEO)
  exit if success < 0

  WINDOW_W = 640
  WINDOW_H = 360
  window = SDL_CreateWindow("Drop File Test (sdl2-bindings)", 0, 0, WINDOW_W, WINDOW_H, SDL_WINDOW_OPENGL)

  renderer = SDL_CreateRenderer(window, -1, 0)
  SDL_SetRenderDrawColor(renderer, 0xA0, 0xA0, 0xA0, 0xFF)
  SDL_RenderClear(renderer)
  SDL_RenderPresent(renderer)

  event = SDL_Event.new

  p SDL_EventState(SDL_DROPFILE, SDL_QUERY)
  p SDL_DROPFILE.to_s(16), SDL_EventState(SDL_DROPFILE, SDL_ENABLE)
  p SDL_EventState(SDL_DROPFILE, SDL_QUERY)

  done = false
  while not done
    while SDL_PollEvent(event) != 0
      # 'type' and 'timestamp' are common members for all SDL Event structs.
      event_type = event.common.type
      event_timestamp = event.common.timestamp
      puts "Event : type=0x#{event_type.to_s(16)}, timestamp=#{event_timestamp}"
      case event_type
      when SDL_KEYDOWN
        if event.key.keysym_sym == SDLK_ESCAPE
          done = true
        end
      when SDL_DROPFILE
        printf("File dropped on window: %s", event.drop.file);
        SDL_free(event.drop.file)
      end
    end

    # SDL_Delay(10)
  end

  SDL_DestroyRenderer(renderer)
  SDL_DestroyWindow(window)
  SDL_Quit()
end
