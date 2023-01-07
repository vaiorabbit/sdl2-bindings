# coding: utf-8
# Ref.: /SDL2-2.0.3/test/testime.c
require_relative '../lib/sdl2'
require_relative '../lib/sdl2_ttf'

WINDOW_W = 640
WINDOW_H = 360

$font_path = ''
$textRect = nil
$markedRect = nil
$lineColor = nil
$backColor = nil
$textColor = nil
$text = ""
$markedText = ""
$cursor = 0
$font = nil

def init_app
  $lineColor = SDL::Color.new
  $lineColor[:r] = 0
  $lineColor[:g] = 0
  $lineColor[:b] = 0
  $lineColor[:a] = 255

  $backColor = SDL::Color.new
  $backColor[:r] = 255
  $backColor[:g] = 255
  $backColor[:b] = 255
  $backColor[:a] = 255

  $textColor = SDL::Color.new
  $textColor[:r] = 0
  $textColor[:g] = 0
  $textColor[:b] = 0
  $textColor[:a] = 255

  box_height = 50
  $textRect = SDL::Rect.new
  $textRect[:x] = 100
  $textRect[:y] = WINDOW_H / 2 - box_height / 2
  $textRect[:w] = WINDOW_W - 2 * $textRect[:x]
  $textRect[:h] = box_height

  $markedRect = SDL::Rect.new
  $markedRect[:x] = $textRect[:x]
  $markedRect[:y] = $textRect[:y]
  $markedRect[:w] = $textRect[:w]
  $markedRect[:h] = $textRect[:h]

  $text = ""
  $markedText = ""
  $cursor = 0 # FIX : TEST

  SDL.TTF_Init()
  rwops = SDL.RWFromFile($font_path, "rb")
  $font = SDL.TTF_OpenFontRW(rwops, 0, 30)

  SDL.StartTextInput()
end

def term_app
  SDL.StopTextInput()
  SDL.TTF_CloseFont($font)
  SDL.TTF_Quit()
end

def redraw_internal(renderer)
  SDL.SetRenderDrawColor(renderer, 255,255,255,255)
  SDL.RenderFillRect(renderer, $textRect)

  w = 0
  h = 0
  w_buf = FFI::MemoryPointer.new :int
  h_buf = FFI::MemoryPointer.new :int

  unless $text.empty?
    textSur = SDL::Surface.new(SDL.TTF_RenderUTF8_Blended($font, $text, $textColor))
    dest = SDL::Rect.new
    dest[:x] = $textRect[:x]
    dest[:y] = $textRect[:y]
    dest[:w] = textSur[:w]
    dest[:h] = textSur[:h]

    texture = SDL.CreateTextureFromSurface(renderer, textSur)
    SDL.FreeSurface(textSur)

    SDL.RenderCopy(renderer, texture, nil, dest)
    SDL.DestroyTexture(texture)
    SDL.TTF_SizeUTF8($font, $text, w_buf, h_buf)
    w = w_buf.read_int
    h = h_buf.read_int
  end

  $markedRect[:x] = $textRect[:x] + w
  $markedRect[:w] = $textRect[:w] - w
  if $markedRect[:w] < 0
    # Stop text input because we cannot hold any more characters
    SDL.StopTextInput()
    return
  else
    SDL.StartTextInput()
  end

  cursorRect = SDL::Rect.new
  cursorRect[:x] = $markedRect[:x]
  cursorRect[:y] = $markedRect[:y]
  cursorRect[:w] = 2
  cursorRect[:h] = h

  SDL.SetRenderDrawColor(renderer, 255,255,255,255)
  SDL.RenderFillRect(renderer, $markedRect)

  unless $markedText.empty?
    if $cursor != 0
      SDL.TTF_SizeUTF8($font, $markedText, w_buf, nil)
      w = w_buf.read_int
      cursorRect[:x] += w
    end
    textSur = SDL::Surface.new(SDL.TTF_RenderUTF8_Blended($font, $markedText, $textColor))
    dest = SDL::Rect.new
    dest[:x] = $markedRect[:x]
    dest[:y] = $markedRect[:y]
    dest[:w] = textSur[:w]
    dest[:h] = textSur[:h]
    SDL.TTF_SizeUTF8($font, $markedText, w_buf, h_buf)
    w = w_buf.read_int
    h = h_buf.read_int
    texture = SDL.CreateTextureFromSurface(renderer, textSur)
    SDL.FreeSurface(textSur)

    SDL.RenderCopy(renderer, texture, nil, dest)
    SDL.DestroyTexture(texture)

    underlineRect = SDL::Rect.new
    underlineRect[:x] = $markedRect[:x]
    underlineRect[:y] = $markedRect[:y]
    underlineRect[:y] += (h - 2)
    underlineRect[:h] = 2
    underlineRect[:w] = w

    SDL.SetRenderDrawColor(renderer, 0,0,0,0)
    SDL.RenderFillRect(renderer, underlineRect)
  end

  SDL.SetRenderDrawColor(renderer, 0,0,0,0)
  SDL.RenderFillRect(renderer, cursorRect)

  SDL.SetTextInputRect($markedRect)

end

def redraw(renderer)
  SDL.SetRenderDrawColor(renderer, 0, 0, 0, 0)
  SDL.RenderClear(renderer)

  redraw_internal(renderer)

  SDL.RenderPresent(renderer)
end

if __FILE__ == $PROGRAM_NAME
  $font_path = ARGV[0] != nil ? ARGV[0] : 'GenShinGothic-Normal.ttf'

  SDL.load_lib('/opt/homebrew/lib/libSDL2.dylib', ttf_libpath: '/opt/homebrew/lib/libSDL2_ttf.dylib') # '/usr/local/lib/libSDL2.dylib'
  success = SDL.Init(SDL::INIT_EVERYTHING)
  exit if success < 0

  window = SDL.CreateWindow("Minimal SDL_TTF Test via sdl2-bindings", 32, 32, WINDOW_W, WINDOW_H, 0)

  renderer = SDL.CreateRenderer(window, -1, 0)

  init_app()

  SDL.SetRenderDrawBlendMode(renderer, SDL::BLENDMODE_NONE)
  SDL.SetRenderDrawColor(renderer, 0xA0, 0xA0, 0xA0, 0xFF)
  SDL.RenderClear(renderer);
  redraw(renderer)

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
        # p "\r".to_s, event[:key][:keysym][:sym], event[:key][:keysym][:scancode].to_s(2) #, '\t'.ord.to_s(16)
        case event[:key][:keysym][:sym]
        when SDL::SDLK_ESCAPE
          done = true
        when SDL::SDLK_RETURN
          # $text = ""
          #redraw(renderer)
        when SDL::SDLK_BACKSPACE
          $text.chop!
          redraw(renderer)
        end

      when SDL::TEXTINPUT
        if event[:text][:text][0] == "\0".ord || event[:text][:text][0] == "\n".ord || $markedRect[:w] < 0
          next
        end
        term = event[:text][:text].find_index(0)
        # appended = event[:text][:text][0...term].pack("c*").force_encoding("UTF-8")
        appended = event[:text][:text].to_s.force_encoding(Encoding::UTF_8)
        # printf("Keyboard: text input \"%s\"\n", appended)
        $text.concat(appended)
        $markedText = ""
        redraw(renderer)
      when SDL::TEXTEDITING
        term = event[:edit][:text].find_index(0)
        editing = event[:edit][:text] # event[:edit][:text][0...term].pack("c*").force_encoding("UTF-8")
        printf("text editing \"%s\", selected range (%d, %d)\n", editing, event[:edit][:start], term)
        $markedText = editing.to_s
        $cursor = event[:edit][:start]
        redraw(renderer)
      end
    end

    SDL.Delay(10)
  end

  term_app()
  SDL.DestroyRenderer(renderer)
  SDL.DestroyWindow(window)
  SDL.Quit()
end
