require_relative '../lib/sdl2'
require_relative '../lib/sdl2_image'

WINDOW_W = 640
WINDOW_H = 360

if __FILE__ == $PROGRAM_NAME
  SDL.load_lib('/opt/homebrew/lib/libSDL2.dylib', image_libpath: '/opt/homebrew/lib/libSDL2_image.dylib' ) # '/usr/local/lib/libSDL2.dylib'
  success = SDL.Init(SDL::INIT_EVERYTHING)
  exit if success < 0

  window = SDL.CreateWindow("Minimal SDL_Image Test via sdl2-bindings", 0, 0, WINDOW_W, WINDOW_H, 0)

  renderer = SDL.CreateRenderer(window, -1, 0)

  SDL.IMG_Init(SDL::IMG_INIT_JPG|SDL::IMG_INIT_PNG|SDL::IMG_INIT_TIF|SDL::IMG_INIT_WEBP)

  rwops = SDL.RWFromFile(ARGV[0], "rb")

  puts "PNG?: #{SDL.IMG_isPNG(rwops) == 1 ? 'true' : 'false'}"

  texture = SDL.IMG_LoadTexture_RW(renderer, rwops, 1) # 1 == freesrc : close src automatically
  wh = 300
  pos = SDL::Rect.new
  pos[:x] = (WINDOW_W - wh) / 2
  pos[:y] = (WINDOW_H - wh) / 2
  pos[:w] = wh
  pos[:h] = wh
  pp pos[:x], pos[:y], pos[:w], pos[:h]

  SDL.RenderCopy(renderer, texture, nil, pos)

  event = SDL::Event.new
  done = false
  while not done
    while SDL.PollEvent(event) != 0
      # 'type' and 'timestamp' are common members for all SDL Event structs.
      event_type = event[:common][:type]
      # event_timestamp = event.common.timestamp
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
    SDL.RenderCopy(renderer, texture, nil, pos)
    SDL.RenderPresent(renderer)

    SDL.Delay(10)
  end

  SDL.IMG_Quit()
  SDL.DestroyRenderer(renderer)
  SDL.DestroyWindow(window)
  SDL.Quit()
end
