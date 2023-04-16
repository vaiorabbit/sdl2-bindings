require_relative '../lib/sdl2'
require_relative 'util'

class Texture
  attr_accessor :sprite, :w, :h
  def initialize
    @sprite = nil
    @w = 0
    @h = 0
  end
end
$texture = nil

class Sprite
  attr_accessor :pos, :vel
  def initialize
    @pos = SDL::FRect.new
    @vel = SDL::FRect.new
  end
end
$sprites = nil

WINDOW_W = 640
WINDOW_H = 360
NUM_SPRITES = 100

def load_sprite(file, renderer)
  temp = SDL::Surface.new(SDL.LoadBMP_RW(SDL.RWFromFile(file, "rb"), 1)) # temp = SDL_Surface.new(SDL2.SDL_LoadBMP(file))
  $texture = Texture.new
  $texture.w = temp[:w]
  $texture.h = temp[:h]

  format = SDL::PixelFormat.new(temp[:format])
  if format[:palette] != nil
    SDL.SetSurfaceColorKey(temp, 1, temp[:pixels].read(:uint8))
  else
    case format[:BitsPerPixel]
    when 15; SDL.SetSurfaceColorKey(temp, 1, (temp[:pixels].read(:uint16)) & 0x00007FFF)
    when 16; SDL.SetSurfaceColorKey(temp, 1, (temp[:pixels].read(:uint16)))
    when 24; SDL.SetSurfaceColorKey(temp, 1, (temp[:pixels].read(:uint32)) & 0x00FFFFFF)
    when 32; SDL.SetSurfaceColorKey(temp, 1, (temp[:pixels].read(:uint32)))
    end
  end

  $texture.sprite = SDL.CreateTextureFromSurface(renderer, temp)
  SDL.DestroySurface(temp)
end

def move_sprite(renderer)
  viewport = SDL::Rect.new
  SDL.GetRenderViewport(renderer, viewport)
  vw, vh = viewport[:w], viewport[:h]

  SDL.SetRenderDrawColor(renderer, 0xA0, 0xA0, 0xA0, 0xFF)
  SDL.RenderClear(renderer)

  NUM_SPRITES.times do |i|
    $sprites[i].pos[:x] += $sprites[i].vel[:x]
    if $sprites[i].pos[:x] < 0 || $sprites[i].pos[:x] > (vw - $texture.w)
      $sprites[i].vel[:x] = -$sprites[i].vel[:x]
    end
    $sprites[i].pos[:y] += $sprites[i].vel[:y]
    if $sprites[i].pos[:y] < 0 || $sprites[i].pos[:y] > (vh - $texture.w)
      $sprites[i].vel[:y] = -$sprites[i].vel[:y]
    end

    SDL.RenderTexture(renderer, $texture.sprite, nil, $sprites[i].pos)
  end
  SDL.RenderPresent(renderer)
end

if __FILE__ == $PROGRAM_NAME
  load_sdl2_lib()
  success = SDL.Init(SDL::INIT_EVERYTHING)
  exit if success < 0

  # SDL.SetHint(SDL::HINT_RENDER_DRIVER, "metal")

  window = SDL.CreateWindow("Minimal Sprite Test via sdl3-bindings", WINDOW_W, WINDOW_H, 0)
  SDL.SetWindowPosition(window, 32, 32)

  renderer = SDL.CreateRenderer(window, nil, 0)
  if renderer != nil
    renderer_info = SDL::RendererInfo.new
    SDL.GetRendererInfo(renderer, renderer_info)
    pp renderer_info[:name].read_string
  end

  load_sprite("Globe.bmp", renderer)

  $sprites = Array.new(NUM_SPRITES) { Sprite.new }
  NUM_SPRITES.times do |i|
    $sprites[i].pos[:x] = (rand() % (WINDOW_W - $texture.w)).to_f
    $sprites[i].pos[:y] = (rand() % (WINDOW_H - $texture.h)).to_f
    $sprites[i].pos[:w] = $texture.w.to_f
    $sprites[i].pos[:h] = $texture.h.to_f
    $sprites[i].vel[:x] = 20*rand() - 10
    $sprites[i].vel[:y] = 20*rand() - 10
  end

  event = SDL::Event.new
  done = false
  while not done
    while SDL.PollEvent(event) != 0
      # 'type' and 'timestamp' are common members for all SDL Event structs.
      event_type = event[:common][:type]
      # event_timestamp = event.common.timestamp
      # puts "Event : type=0x#{event_type.to_s(16)}, timestamp=#{event_timestamp}"
      case event_type
      when SDL::EVENT_KEY_DOWN
        if event[:key][:keysym][:sym] == SDL::SDLK_ESCAPE
          done = true
        end
      end
    end
    move_sprite(renderer)
    SDL.Delay(10)
  end

  SDL.DestroyRenderer(renderer)
  SDL.DestroyWindow(window)
  SDL.Quit()
end
