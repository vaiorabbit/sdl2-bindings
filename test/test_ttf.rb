# coding: utf-8
# Usage : $ ruby test_ttf.rb ./GenShinGothic-Normal.ttf
require_relative '../lib/sdl2'
require_relative '../lib/sdl2_ttf'

include SDL2

WINDOW_W = 640
WINDOW_H = 360

if __FILE__ == $0
  SDL2.load_lib('/usr/local/lib/libSDL2.dylib', ttf_libpath: '/usr/local/lib/libSDL2_ttf.dylib' ) # '/usr/local/lib/libSDL2.dylib'
  SDL_SetMainReady()
  success = SDL_Init(SDL_INIT_EVERYTHING)
  exit if success < 0

  window = SDL_CreateWindow("Minimal SDL_TTF Test via sdl2-bindings", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, WINDOW_W, WINDOW_H, 0)

  renderer = SDL_CreateRenderer(window, -1, 0)

  rect = SDL_Rect.malloc
  rect.x = 0
  rect.y = 0
  rect.w = WINDOW_W
  rect.h = WINDOW_H

  TTF_Init()

  rwops = SDL_RWFromFile(ARGV[0], "rb")
  font = TTF_OpenFontRW(rwops, 0, 42)

  fg = SDL_Color.malloc
  fg.r = 96
  fg.g = 96
  fg.b = 96
  fg.a = 255

  bg = SDL_Color.malloc
  bg.r = 0xE0
  bg.g = 0xE0
  bg.b = 0xE0
  bg.a = 255

  pos = SDL_Rect.malloc
  pos.x = 20
  pos.y = 140
  pos.w = 600
  pos.h = 60

#  surface = SDL2::TTF_RenderUTF8_Solid(font, "志於道、據於徳、依於仁、游於藝", fg)
  surface = SDL2::TTF_RenderUTF8_Shaded(font, "志於道、據於徳、依於仁、游於藝", fg, bg)

  texture = SDL_CreateTextureFromSurface(renderer, surface)

  SDL_SetRenderDrawColor(renderer, bg.r, bg.g, bg.b, bg.a)
  SDL_RenderFillRect(renderer, rect)
  SDL_RenderCopy(renderer, texture, nil, pos)

  SDL_RenderPresent(renderer)

  SDL_FreeSurface(surface)

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

    SDL_Delay(10)
  end

  TTF_Quit()
  SDL_DestroyRenderer(renderer)
  SDL_DestroyWindow(window)
  SDL_Quit()
end
