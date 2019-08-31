# coding: utf-8
# Ref.: /SDL2-2.0.3/test/testime.c
require_relative '../lib/sdl2'
require_relative '../lib/sdl2_ttf'

include SDL2

WINDOW_W = 640
WINDOW_H = 360

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
  $lineColor = SDL_Color.new
  $lineColor[:r] = 0
  $lineColor[:g] = 0
  $lineColor[:b] = 0
  $lineColor[:a] = 255

  $backColor = SDL_Color.new
  $backColor[:r] = 255
  $backColor[:g] = 255
  $backColor[:b] = 255
  $backColor[:a] = 255

  $textColor = SDL_Color.new
  $textColor[:r] = 0
  $textColor[:g] = 0
  $textColor[:b] = 0
  $textColor[:a] = 255

  box_height = 50
  $textRect = SDL_Rect.new
  $textRect[:x] = 100
  $textRect[:y] = WINDOW_H / 2 - box_height / 2
  $textRect[:w] = WINDOW_W - 2 * $textRect[:x]
  $textRect[:h] = box_height

  $markedRect = SDL_Rect.new
  $markedRect[:x] = $textRect[:x]
  $markedRect[:y] = $textRect[:y]
  $markedRect[:w] = $textRect[:w]
  $markedRect[:h] = $textRect[:h]

  $text = ""
  $markedText = ""
  $cursor = 0 # FIX : TEST

  TTF_Init()
  rwops = SDL_RWFromFile(ARGV[0], "rb")
  $font = TTF_OpenFontRW(rwops, 0, 30)

  SDL_StartTextInput()
end

def term_app
  SDL_StopTextInput()
  TTF_CloseFont($font)
  TTF_Quit()
end

def redraw_internal(renderer)
  SDL_SetRenderDrawColor(renderer, 255,255,255,255)
  SDL_RenderFillRect(renderer, $textRect)

  w = 0
  h = 0
  w_buf = FFI::MemoryPointer.new :int
  h_buf = FFI::MemoryPointer.new :int

  unless $text.empty?
    textSur = SDL_Surface.new( SDL2::TTF_RenderUTF8_Blended($font, $text, $textColor) )
    dest = SDL_Rect.new
    dest[:x] = $textRect[:x]
    dest[:y] = $textRect[:y]
    dest[:w] = textSur[:w]
    dest[:h] = textSur[:h]

    texture = SDL_CreateTextureFromSurface(renderer, textSur)
    SDL_FreeSurface(textSur)

    SDL_RenderCopy(renderer, texture, nil, dest)
    SDL_DestroyTexture(texture)
    TTF_SizeUTF8($font, $text, w_buf, h_buf)
    w = w_buf.read_int
    h = h_buf.read_int
  end

  $markedRect[:x] = $textRect[:x] + w
  $markedRect[:w] = $textRect[:w] - w
  if $markedRect[:w] < 0
    # Stop text input because we cannot hold any more characters
    SDL_StopTextInput()
    return
  else
    SDL_StartTextInput()
  end

  cursorRect = SDL_Rect.new
  cursorRect[:x] = $markedRect[:x]
  cursorRect[:y] = $markedRect[:y]
  cursorRect[:w] = 2
  cursorRect[:h] = h

  SDL_SetRenderDrawColor(renderer, 255,255,255,255)
  SDL_RenderFillRect(renderer, $markedRect)

  unless $markedText.empty?
    if $cursor != 0
      TTF_SizeUTF8($font, $markedText, w_buf, nil)
      w = w_buf.read_int
      cursorRect[:x] += w
    end
    textSur = SDL_Surface.new( TTF_RenderUTF8_Blended($font, $markedText, $textColor) )
    dest = SDL_Rect.new
    dest[:x] = $markedRect[:x]
    dest[:y] = $markedRect[:y]
    dest[:w] = textSur[:w]
    dest[:h] = textSur[:h]
    TTF_SizeUTF8($font, $markedText, w_buf, h_buf)
    w = w_buf.read_int
    h = h_buf.read_int
    texture = SDL_CreateTextureFromSurface(renderer, textSur)
    SDL_FreeSurface(textSur)

    SDL_RenderCopy(renderer, texture, nil, dest)
    SDL_DestroyTexture(texture)

    underlineRect = SDL_Rect.new
    underlineRect[:x] = $markedRect[:x]
    underlineRect[:y] = $markedRect[:y]
    underlineRect[:y] += (h - 2)
    underlineRect[:h] = 2
    underlineRect[:w] = w

    SDL_SetRenderDrawColor(renderer, 0,0,0,0)
    SDL_RenderFillRect(renderer, underlineRect)
  end

  SDL_SetRenderDrawColor(renderer, 0,0,0,0)
  SDL_RenderFillRect(renderer, cursorRect)

  SDL_SetTextInputRect($markedRect)

end

def redraw(renderer)
  SDL_SetRenderDrawColor(renderer, 0, 0, 0, 0)
  SDL_RenderClear(renderer)

  redraw_internal(renderer)

  SDL_RenderPresent(renderer)
end

if __FILE__ == $0
  SDL2.load_lib('/usr/local/lib/libSDL2.dylib', ttf_libpath: '/usr/local/lib/libSDL2_ttf.dylib' ) # '/usr/local/lib/libSDL2.dylib'
  success = SDL_Init(SDL_INIT_EVERYTHING)
  exit if success < 0

  window = SDL_CreateWindow("Minimal SDL_TTF Test via sdl2-bindings", SDL_WINDOWPOS_CENTERED_MASK|0, SDL_WINDOWPOS_CENTERED_MASK|0, WINDOW_W, WINDOW_H, 0)

  renderer = SDL_CreateRenderer(window, -1, 0)

  init_app()

  SDL_SetRenderDrawBlendMode(renderer, SDL_BLENDMODE_NONE)
  SDL_SetRenderDrawColor(renderer, 0xA0, 0xA0, 0xA0, 0xFF)
  SDL_RenderClear(renderer);
  redraw(renderer)


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
        # p "\r".to_s, event.key.keysym_sym, event.key.keysym_scancode.to_s(2) #, '\t'.ord.to_s(16)
        case event[:key][:keysym][:sym]
        when SDLK_ESCAPE
          done = true
        when SDLK_RETURN
          # $text = ""
          redraw(renderer)
        when SDLK_BACKSPACE
          $text.chop!
          redraw(renderer)
        end

      when SDL_TEXTINPUT
        if event[:text][:text][0] == "\0".ord || event[:text][:text][0] == "\n".ord || $markedRect[:w] < 0
          next
        end
        term = event[:text][:text].find_index(0)
        # appended = event[:text][:text][0...term].pack("c*").force_encoding("UTF-8")
        appended = event[:text][:text].to_s
        # printf("Keyboard: text input \"%s\"\n", appended)
        $text.concat(appended)
        $markedText = ""
        redraw(renderer)
      when SDL_TEXTEDITING
        term = event[:edit][:text].find_index(0)
        editing = event[:edit][:text] # event[:edit][:text][0...term].pack("c*").force_encoding("UTF-8")
        printf("text editing \"%s\", selected range (%d, %d)\n", editing, event[:edit][:start], term)
        $markedText = editing.to_s
        $cursor = event[:edit][:start]
        redraw(renderer)
      end
    end

    SDL_Delay(10)
  end

  term_app()
  SDL_DestroyRenderer(renderer)
  SDL_DestroyWindow(window)
  SDL_Quit()
end
