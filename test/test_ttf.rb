# coding: utf-8
# Usage : $ ruby test_ttf.rb ./GenShinGothic-Normal.ttf
require_relative '../lib/sdl2'
require_relative '../lib/sdl2_ttf'
require_relative 'util'

WINDOW_W = 640
WINDOW_H = 360

if __FILE__ == $PROGRAM_NAME
  # load_sdl2_lib()

  if ARGV[0] == nil
    $stderr.puts 'Usage: ruby test_ttf.rb [path to .ttf]'
    exit
  end

  SDL.load_lib('/opt/homebrew/lib/libSDL2.dylib', ttf_libpath: '/opt/homebrew/lib/libSDL2_ttf.dylib' ) # '/usr/local/lib/libSDL2.dylib'

  success = SDL.Init(SDL::SDL_INIT_EVERYTHING)
  exit if success < 0

  window = SDL.CreateWindow("Minimal SDL_TTF Test via sdl2-bindings", SDL::SDL_WINDOWPOS_CENTERED_MASK|0, SDL::SDL_WINDOWPOS_CENTERED_MASK|0, WINDOW_W, WINDOW_H, 0)

  renderer = SDL.CreateRenderer(window, -1, 0)

  rect = SDL::SDL_Rect.new
  rect[:x] = 0
  rect[:y] = 0
  rect[:w] = WINDOW_W
  rect[:h] = WINDOW_H

  success = SDL.TTF_Init()
  exit if success < 0

  rwops = SDL.RWFromFile(ARGV[0], "rb")
  font = SDL.TTF_OpenFontRW(rwops, 0, 42)

  renderstyle = SDL::TTF_STYLE_NORMAL
  outline = 0
  hinting = SDL::TTF_HINTING_NORMAL
  kerning = 0
  SDL.TTF_SetFontStyle(font, renderstyle)
  SDL.TTF_SetFontOutline(font, outline)
  SDL.TTF_SetFontKerning(font, kerning)
  SDL.TTF_SetFontHinting(font, hinting)

  fg = SDL::SDL_Color.new
  fg[:r] = 0xFF
  fg[:g] = 0xFF
  fg[:b] = 0xFF
  fg[:a] = 0xFF

  bg = SDL::SDL_Color.new
  bg[:r] = 0x00
  bg[:g] = 0x00
  bg[:b] = 0x00
  bg[:a] = 0x00

  pos = SDL::SDL_Rect.new
  pos[:x] = 20
  pos[:y] = 140
  pos[:w] = 600
  pos[:h] = 60

#  surface = SDL2::TTF_RenderUTF8_Solid(font, "志於道、據於徳、依於仁、游於藝", fg)
  surface = SDL::TTF_RenderUTF8_Shaded(font, "志於道、據於徳、依於仁、游於藝", fg, bg)

  texture = SDL.CreateTextureFromSurface(renderer, surface)

  SDL.FreeSurface(surface)

  SDL.SetTextureBlendMode(texture, SDL::SDL_BLENDMODE_NONE)

  event = SDL::SDL_Event.new
  done = false
  while not done
    while SDL.PollEvent(event) != 0
      # 'type' and 'timestamp' are common members for all SDL Event structs.
      event_type = event[:common][:type]
      # event_timestamp = event.common.timestamp
      # puts "Event : type=0x#{event_type.to_s(16)}, timestamp=#{event_timestamp}"
      case event_type
      when SDL::SDL_KEYDOWN
        if event[:key][:keysym][:sym] == SDL::SDLK_ESCAPE
          done = true
        end
      end
    end

    SDL.SetRenderDrawColor(renderer, bg[:r], bg[:g], bg[:b], bg[:a])
    SDL.RenderClear(renderer)

    SDL.RenderCopy(renderer, texture, nil, pos)

    SDL.RenderPresent(renderer)

    SDL.Delay(10)
  end

  SDL.DestroyTexture(texture)
  SDL.DestroyRenderer(renderer)
  SDL.DestroyWindow(window)
  SDL.TTF_Quit()
  SDL.Quit()
end
