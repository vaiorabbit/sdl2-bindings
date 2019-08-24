require_relative '../lib/sdl2'

include SDL2

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
    @pos = SDL_Rect.new
    @vel = SDL_Rect.new
  end
end
$sprites = nil

WINDOW_W = 640
WINDOW_H = 360
NUM_SPRITES = 100

def load_sprite(file, renderer)
  temp = SDL_Surface.new(SDL_LoadBMP_RW(SDL_RWFromFile(file, "rb"), 1)) # temp = SDL_Surface.new(SDL2.SDL_LoadBMP(file))
  $texture = Texture.new
  $texture.w = temp[:w]
  $texture.h = temp[:h]

  format = SDL_PixelFormat.new(temp[:format])
  if format[:palette] != nil
    SDL_SetColorKey(temp, 1, temp[:pixels].read(:uint))
  else
    case format[:BitsPerPixel]
    when 15; SDL_SetColorKey(temp, 1, (temp[:pixels].read(:short)) & 0x00007FFF);
    when 16; SDL_SetColorKey(temp, 1, (temp[:pixels].read(:short)) & 0x00007FFF);
    when 24; SDL_SetColorKey(temp, 1, (temp[:pixels].read(:int)) & 0x00007FFF);
    when 32; SDL_SetColorKey(temp, 1, (temp[:pixels].read(:int)));
    end
  end

  $texture.sprite = SDL_CreateTextureFromSurface(renderer, temp)
  SDL_FreeSurface(temp)
end

def move_sprite(renderer)
  SDL_SetRenderDrawColor(renderer, 0xA0, 0xA0, 0xA0, 0xFF)
  SDL_RenderClear(renderer)

  NUM_SPRITES.times do |i|
    $sprites[i].pos[:x] += $sprites[i].vel[:x]
    if $sprites[i].pos[:x] < 0 || $sprites[i].pos[:x] > (WINDOW_W - $texture.w)
      $sprites[i].vel[:x] = -$sprites[i].vel[:x]
    end
    $sprites[i].pos[:y] += $sprites[i].vel[:y]
    if $sprites[i].pos[:y] < 0 || $sprites[i].pos[:y] > (WINDOW_H - $texture.w)
      $sprites[i].vel[:y] = -$sprites[i].vel[:y]
    end

    SDL_RenderCopy(renderer, $texture.sprite, nil, $sprites[i].pos)
  end
  SDL_RenderPresent(renderer)
end

if __FILE__ == $0
  SDL2.load_lib('libSDL2.dylib') # '/usr/local/lib/libSDL2.dylib'
  success = SDL_Init(SDL_INIT_EVERYTHING)
  exit if success < 0

  window = SDL_CreateWindow("Minimal Sprite Test via sdl2-bindings", 0, 0, WINDOW_W, WINDOW_H, 0)

  renderer = SDL_CreateRenderer(window, -1, 0)

  load_sprite("Globe.bmp", renderer)

  $sprites = Array.new(NUM_SPRITES) { Sprite.new }
  NUM_SPRITES.times do |i|
    $sprites[i].pos[:x] = WINDOW_W / 2 + 100*rand() - 50
    $sprites[i].pos[:y] = WINDOW_H / 2 + 100*rand() - 50
    $sprites[i].pos[:w] = $texture.w
    $sprites[i].pos[:h] = $texture.h
    $sprites[i].vel[:x] = 20*rand() - 10
    $sprites[i].vel[:y] = 20*rand() - 10
  end

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
    move_sprite(renderer)
    SDL_Delay(10)
  end

  SDL_DestroyRenderer(renderer)
  SDL_DestroyWindow(window)
  SDL_Quit()
end
