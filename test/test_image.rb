require_relative '../lib/sdl2'
require_relative '../lib/sdl2_image'

include SDL2

WINDOW_W = 640
WINDOW_H = 360

if __FILE__ == $0
  SDL2.load_lib('libSDL2.dylib', image_libpath: 'libSDL2_image.dylib' ) # '/usr/local/lib/libSDL2.dylib'
  SDL_SetMainReady()
  success = SDL_Init(SDL_INIT_EVERYTHING)
  exit if success < 0

  window = SDL_CreateWindow("Minimal Sprite Test via sdl2-bindings", 0, 0, WINDOW_W, WINDOW_H, 0)

  renderer = SDL_CreateRenderer(window, -1, 0)

  IMG_Init(IMG_INIT_JPG|IMG_INIT_PNG|IMG_INIT_TIF|IMG_INIT_WEBP)

  rwops = SDL_RWFromFile(ARGV[0], "rb")

  p IMG_isPNG(rwops)

  texture = IMG_LoadTexture_RW(renderer, rwops, 1) # 1 == freesrc : close src automatically
  pos = SDL_Rect.malloc
  pos.x = 0
  pos.y = 0
  pos.w = 200
  pos.h = 200

  SDL_RenderCopy(renderer, texture, nil, pos)

  event = SDL_Event.new
  done = false
  while not done
    while SDL_PollEvent(event) != 0
      # 'type' and 'timestamp' are common members for all SDL Event structs.
      event_type = event.common.type
      # event_timestamp = event.common.timestamp
      # puts "Event : type=0x#{event_type.to_s(16)}, timestamp=#{event_timestamp}"
      case event_type
      when SDL_KEYDOWN
        if event.key.keysym_sym == SDLK_ESCAPE
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

=begin
  Mix_Init(MIX_INIT_FLAC|MIX_INIT_MOD|MIX_INIT_MP3|MIX_INIT_OGG)
  Mix_OpenAudio(22050, MIX_DEFAULT_FORMAT, 2, 512)

  rwops = SDL_RWFromFile(ARGV[0], "rb")
  wave = Mix_LoadWAV_RW(rwops, 1)
  Mix_FadeInChannelTimed(0, wave, 0, 600, -1)
  while Mix_Playing(0) != 0
    sleep 1
  end
  Mix_Quit()
=end
  IMG_Quit()
  SDL_DestroyRenderer(renderer)
  SDL_DestroyWindow(window)
  SDL_Quit()
end
