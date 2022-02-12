# TODO : Prepare Info.plist to support D&D on Mac OS X.
require 'sdl2'
# require_relative '../lib/sdl2'
require_relative 'util'

if __FILE__ == $PROGRAM_NAME
  load_sdl2_lib()
  success = SDL.Init(SDL::INIT_VIDEO)
  exit if success < 0

  WINDOW_W = 640
  WINDOW_H = 360
  window = SDL.CreateWindow("Drop File Test (sdl2-bindings)", 0, 0, WINDOW_W, WINDOW_H, SDL::WINDOW_OPENGL)

  renderer = SDL.CreateRenderer(window, -1, 0)
  SDL.SetRenderDrawColor(renderer, 0xA0, 0xA0, 0xA0, 0xFF)
  SDL.RenderClear(renderer)
  SDL.RenderPresent(renderer)

  event = SDL::Event.new

  p SDL.EventState(SDL::DROPFILE, SDL::QUERY)
  p SDL::DROPFILE.to_s(16), SDL.EventState(SDL::DROPFILE, SDL::ENABLE)
  p SDL.EventState(SDL::DROPFILE, SDL::QUERY)

  done = false
  while not done
    while SDL.PollEvent(event) != 0
      # 'type' and 'timestamp' are common members for all SDL Event structs.
      event_type = event[:common][:type]
      event_timestamp = event[:common][:timestamp]
      puts "Event : type=0x#{event_type.to_s(16)}, timestamp=#{event_timestamp}"
      case event_type
      when SDL::KEYDOWN
        if event[:key][:keysym][:sym] == SDL::SDLK_ESCAPE
          done = true
        end
      when SDL::DROPFILE
        printf("File dropped on window: %s", event[:drop][:file]);
        # SDL.free(event[:drop][:file]) # TODO alternative of #define SDL_Free
      end
    end

    # SDL.Delay(10)
  end

  SDL.DestroyRenderer(renderer)
  SDL.DestroyWindow(window)
  SDL.Quit()
end
