require_relative '../lib/sdl2'
require_relative 'util'

if __FILE__ == $PROGRAM_NAME
  load_sdl2_lib()
  success = SDL.Init(SDL::INIT_EVERYTHING)
  exit if success < 0

  WINDOW_W = 320
  WINDOW_H = 240
  window = SDL.CreateWindow("1st SDL Window via sdl2-bindings", 0, 0, WINDOW_W, WINDOW_H, 0)

  wminfo = SDL::SysWMinfo_cocoa.new
  if SDL.GetWindowWMInfo(window, wminfo) == SDL::TRUE
    pp wminfo[:subsystem], wminfo[:info][:cocoa][:window]
  end

  wmmsg = SDL::SysWMmsg_cocoa.new

  fpsdelay = 100;

  count = 0
  event = SDL::Event.new
  done = false
  while not done
    while SDL.PollEvent(event) != 0
      # 'type' and 'timestamp' are common members for all SDL Event structs.
      event_type = event[:common][:type]
      event_timestamp = event[:common][:timestamp]
      puts "Event : type=0x#{event_type.to_s(16)}, timestamp=#{event_timestamp}"

      case event_type
      when SDL::KEYDOWN
        if event[:key][:keysym][:sym] == SDL::SDLK_SPACE
          puts "\tSPACE key pressed."
        end
      when SDL::SYSWMEVENT
        wmmsg = SDL::SysWMmsg_cocoa.new(event[:syswm][:msg])
        pp wmmsg
      end
    end

    count += 1
    done = true if count >= 100
    SDL.Delay(fpsdelay)
  end

  SDL.DestroyWindow(window)
  SDL.Quit()
end
