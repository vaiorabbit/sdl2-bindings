# require 'sdl2'
require_relative '../lib/sdl2'
require_relative 'util'

NUM_OBJECTS = 100

$current_alpha = 255
$current_color = 255
$cycle_direction = 1

def draw_points(renderer)

  viewport = SDL::Rect.new

  SDL.GetRenderViewport(renderer, viewport)

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

    SDL.SetRenderDrawColor(renderer, 255, $current_color, $current_color, $current_alpha)
    x = rand(65535) % viewport[:w]
    y = rand(65535) % viewport[:h]
    SDL.RenderPoint(renderer, x, y)
  end
end

def draw_lines(renderer)
  rect = SDL::Rect.new
  viewport = SDL::Rect.new

  SDL.GetRenderViewport(renderer, viewport)

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
    SDL.SetRenderDrawColor(renderer, 255, $current_color, $current_color, $current_alpha)
    if i == 0
      SDL.RenderLine(renderer, 0, 0, viewport[:w] - 1, viewport[:h] - 1)
      SDL.RenderLine(renderer, 0, viewport[:h] - 1, viewport[:w] - 1, 0)
      SDL.RenderLine(renderer, 0, viewport[:h] / 2, viewport[:w] - 1, viewport[:h] / 2)
      SDL.RenderLine(renderer, viewport[:w] / 2, 0, viewport[:w] / 2, viewport[:h] - 1)
    else
      x1 = (rand(65535) % (viewport[:w] * 2)) - viewport[:w]
      x2 = (rand(65535) % (viewport[:w] * 2)) - viewport[:w]
      y1 = (rand(65535) % (viewport[:h] * 2)) - viewport[:h]
      y2 = (rand(65535) % (viewport[:h] * 2)) - viewport[:h]
      SDL.RenderLine(renderer, x1, y1, x2, y2)
    end
  end
end

def draw_rects(renderer)
  rect = SDL::FRect.new
  viewport = SDL::Rect.new

  SDL.GetRenderViewport(renderer, viewport)

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
    SDL.SetRenderDrawColor(renderer, 255, $current_color, $current_color, $current_alpha)
    rect[:w] = rand(65535) % (viewport[:h] / 2)
    rect[:h] = rand(65535) % (viewport[:h] / 2)

    rect[:x] = (rand(65535) % (viewport[:w]*2) - viewport[:w]) - (rect[:w] / 2)
    rect[:y] = (rand(65535) % (viewport[:h]*2) - viewport[:h]) - (rect[:h] / 2)

    SDL.RenderFillRect(renderer, rect)
  end
end

if __FILE__ == $PROGRAM_NAME
  load_sdl2_lib()
  success = SDL.Init(SDL::INIT_VIDEO)
  exit if success < 0

  WINDOW_W = 640
  WINDOW_H = 360
  window = SDL.CreateWindow("RenderPoint/RenderLine/RenderFillRect", WINDOW_W, WINDOW_H, SDL::WINDOW_OPENGL)
  SDL.SetWindowPosition(window, 32, 32)

  renderer = SDL.CreateRenderer(window, nil, 0)

  event = SDL::Event.new

  done = false
  while not done
    while SDL.PollEvent(event) != 0
      # 'type' and 'timestamp' are common members for all SDL Event structs.
      event_type = event[:common][:type]
      event_timestamp = event[:common][:timestamp]
      # puts "Event : type=0x#{event_type.to_s(16)}, timestamp=#{event_timestamp}"
      case event_type
      when SDL::EVENT_KEY_DOWN
        if event[:key][:keysym][:sym] == SDL::SDLK_ESCAPE
          done = true
        end
      end
    end

    SDL.SetRenderDrawColor(renderer, 0xA0, 0xA0, 0xA0, 0xFF)
    SDL.RenderClear(renderer)

    draw_rects(renderer)
    draw_lines(renderer)
    draw_points(renderer)

    SDL.RenderPresent(renderer)

    # SDL.Delay(10)
  end

  SDL.DestroyRenderer(renderer)
  SDL.DestroyWindow(window)
  SDL.Quit()
end
