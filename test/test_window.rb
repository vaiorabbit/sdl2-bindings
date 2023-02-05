require_relative '../lib/sdl2'
require_relative 'util'

if __FILE__ == $PROGRAM_NAME
  load_sdl2_lib()
  success = SDL.Init(SDL::INIT_EVERYTHING)
  exit if success < 0

  WINDOW_W = 320
  WINDOW_H = 240
  window = SDL.CreateWindow("1st SDL Window via sdl2-bindings", 0, 0, WINDOW_W, WINDOW_H, 0)

  platform_id = case RbConfig::CONFIG['host_os']
                when /mswin|msys|mingw|cygwin/
                  :PLATFORM_WINDOWS
                when /darwin/
                  :PLATFORM_MACOSX
                when /linux/
                  :PLATFORM_LINUX
                else
                  raise RuntimeError, "Unknown OS: #{host_os.inspect}"
                end

  wminfo = case platform_id
           when :PLATFORM_WINDOWS
             SDL::SysWMinfo_win.new
           when :PLATFORM_MACOSX
             SDL::SysWMinfo_cocoa.new
           when :PLATFORM_LINUX
             SDL::SysWMinfo_x11.new
           else
             raise RuntimeError, "Unknown OS: #{host_os.inspect}"
           end
  SDL.GetVersion(wminfo[:version].pointer)

  # 1 == SDL_SYSWM_WINDOWS
  # 2 == SDL_SYSWM_X11
  # 4 == SDL_SYSWM_COCOA
  # 6 == SDL_SYSWM_WAYLAND

  if SDL.GetWindowWMInfo(window, wminfo) == SDL::TRUE
    case platform_id
    when :PLATFORM_WINDOWS
      pp [wminfo[:subsystem], wminfo[:info][:win][:window]]
    when :PLATFORM_MACOSX
      pp [wminfo[:subsystem], wminfo[:info][:cocoa][:window]]
    when :PLATFORM_LINUX
      # TODO reconsntruct wminfo if we detect Wayland subsystem
      pp [wminfo[:subsystem], wminfo[:info][:x11][:display]]
    else
      raise RuntimeError, "Unknown OS: #{host_os.inspect}"
    end
  else
    p SDL.GetError().read_string
    exit
  end

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
        wmmsg = case platform_id
                when :PLATFORM_WINDOWS
                  SDL::SysWMmsg_win.new(event[:syswm][:msg])
                when :PLATFORM_MACOSX
                  SDL::SysWMmsg_cocoa.new(event[:syswm][:msg])
                when :PLATFORM_LINUX
                  SDL::SysWMmsg_x11.new(event[:syswm][:msg])
                else
                  raise RuntimeError, "Unknown OS: #{host_os.inspect}"
                end
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
