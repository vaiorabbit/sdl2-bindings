require_relative '../lib/sdl2'
require_relative '../lib/sdl2_image'

include SDL2

WINDOW_W = 640
WINDOW_H = 360

if __FILE__ == $0
  SDL2.load_lib('/usr/local/lib/libSDL2.dylib', image_libpath: '/usr/local/lib/libSDL2_image.dylib' ) # '/usr/local/lib/libSDL2.dylib'
  success = SDL_Init(SDL_INIT_EVERYTHING)
  exit if success < 0

  window = SDL_CreateWindow("Minimal SDL_Image Test via sdl2-bindings", 0, 0, WINDOW_W, WINDOW_H, 0)

  renderer = SDL_CreateRenderer(window, -1, 0)

  IMG_Init(IMG_INIT_JPG|IMG_INIT_PNG|IMG_INIT_TIF|IMG_INIT_WEBP)

  rwops = SDL_RWFromFile(ARGV[0], "rb")

  puts "PNG?: #{IMG_isPNG(rwops) == 1 ? 'true' : 'false'}"

  texture = IMG_LoadTexture_RW(renderer, rwops, 1) # 1 == freesrc : close src automatically
  wh = 300
  pos = SDL_Rect.new
  pos[:x] = (WINDOW_W - wh) / 2
  pos[:y] = (WINDOW_H - wh) / 2
  pos[:w] = wh
  pos[:h] = wh
  pp pos[:x], pos[:y], pos[:w], pos[:h]

  SDL_RenderCopy(renderer, texture, nil, pos)

  event = SDL_Event.new
  done = false
  while not done
    while SDL_PollEvent(event) != 0
      # 'type' and 'timestamp' are common members for all SDL Event structs.
      event_type = event[:common][:type]
      # event_timestamp = event.common.timestamp
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
    SDL_RenderCopy(renderer, texture, nil, pos)
    SDL_RenderPresent(renderer)

    SDL_Delay(10)
  end

  IMG_Quit()
  SDL_DestroyRenderer(renderer)
  SDL_DestroyWindow(window)
  SDL_Quit()
end
