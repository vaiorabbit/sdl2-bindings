require_relative '../lib/sdl2'
require_relative 'util'

include SDL2

if __FILE__ == $0
  load_sdl2_lib()
  success = SDL_Init(SDL_INIT_EVERYTHING)
  exit if success < 0

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
    end

    count += 1
    done = true if count >= 100
    SDL_Delay(fpsdelay)
  end

  SDL_Quit()
end
