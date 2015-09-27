require_relative '../lib/sdl2'

include SDL2

NUM_OBJECTS = 100

$current_alpha = 255
$current_color = 255
$cycle_direction = 1

def draw_points(renderer)

  viewport = SDL_Rect.malloc

  SDL_RenderGetViewport(renderer, viewport)

  (4 * NUM_OBJECTS).times do |i|
    $current_color += $cycle_direction
    if $current_color < 0
      $current_color = 0
      $cycle_direction = -$cycle_direction
    end
    if $current_color > 255
      $current_color = 255
      $cycle_direction = -$cycle_direction
    end

    SDL_SetRenderDrawColor(renderer, 255, $current_color, $current_color, $current_alpha)
    x = rand(65535) % viewport.w
    y = rand(65535) % viewport.h
    SDL_RenderDrawPoint(renderer, x, y)
  end
end

def draw_lines(renderer)
  rect = SDL_Rect.malloc
  viewport = SDL_Rect.malloc

  SDL_RenderGetViewport(renderer, viewport)

  NUM_OBJECTS.times do |i|
    $current_color += $cycle_direction
    if $current_color < 0
      $current_color = 0
      $cycle_direction = -$cycle_direction
    end
    if $current_color > 255
      $current_color = 255
      $cycle_direction = -$cycle_direction
    end
    SDL_SetRenderDrawColor(renderer, 255, $current_color, $current_color, $current_alpha)
    if i == 0
      SDL_RenderDrawLine(renderer, 0, 0, viewport.w - 1, viewport.h - 1)
      SDL_RenderDrawLine(renderer, 0, viewport.h - 1, viewport.w - 1, 0)
      SDL_RenderDrawLine(renderer, 0, viewport.h / 2, viewport.w - 1, viewport.h / 2)
      SDL_RenderDrawLine(renderer, viewport.w / 2, 0, viewport.w / 2, viewport.h - 1)
    else
      x1 = (rand(65535) % (viewport.w * 2)) - viewport.w
      x2 = (rand(65535) % (viewport.w * 2)) - viewport.w
      y1 = (rand(65535) % (viewport.h * 2)) - viewport.h
      y2 = (rand(65535) % (viewport.h * 2)) - viewport.h
      SDL_RenderDrawLine(renderer, x1, y1, x2, y2)
    end
  end
end

def draw_rects(renderer)
  rect = SDL_Rect.malloc
  viewport = SDL_Rect.malloc

  SDL_RenderGetViewport(renderer, viewport)

  NUM_OBJECTS.times do |i|
    $current_color += $cycle_direction
    if $current_color < 0
      $current_color = 0
      $cycle_direction = -$cycle_direction
    end
    if $current_color > 255
      $current_color = 255
      $cycle_direction = -$cycle_direction
    end
    SDL_SetRenderDrawColor(renderer, 255, $current_color, $current_color, $current_alpha)
    rect.w = rand(65535) % (viewport.h / 2)
    rect.h = rand(65535) % (viewport.h / 2)

    rect.x = (rand(65535) % (viewport.w*2) - viewport.w) - (rect.w / 2)
    rect.y = (rand(65535) % (viewport.h*2) - viewport.h) - (rect.h / 2)
    SDL_RenderFillRect(renderer, rect)
  end
end



if __FILE__ == $0
  SDL2.load_lib('libSDL2.dylib') # '/usr/local/lib/libSDL2.dylib'
  SDL_SetMainReady()
  success = SDL_Init(SDL_INIT_VIDEO)
  exit if success < 0

  WINDOW_W = 640
  WINDOW_H = 360
  window = SDL_CreateWindow("OpenGL Window via sdl2-bindings", 0, 0, WINDOW_W, WINDOW_H, SDL_WINDOW_OPENGL)

  renderer = SDL_CreateRenderer(window, -1, 0)

  ratio = WINDOW_W.to_f / WINDOW_H

  event = SDL_Event.new

  done = false
  while not done
    while SDL_PollEvent(event) != 0
      # 'type' and 'timestamp' are common members for all SDL Event structs.
      event_type = event.common.type
      event_timestamp = event.common.timestamp
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

    draw_rects(renderer)
    draw_lines(renderer)
    draw_points(renderer)

    SDL_RenderPresent(renderer)

    # SDL_Delay(10)
  end

  SDL_DestroyRenderer(renderer)
  SDL_DestroyWindow(window)
  SDL_Quit()
end
