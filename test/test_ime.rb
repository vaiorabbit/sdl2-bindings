# coding: utf-8
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
  $lineColor = SDL_Color.malloc
  $lineColor.r = 0
  $lineColor.g = 0
  $lineColor.b = 0
  $lineColor.a = 255

  $backColor = SDL_Color.malloc
  $backColor.r = 255
  $backColor.g = 255
  $backColor.b = 255
  $backColor.a = 255

  $textColor = SDL_Color.malloc
  $textColor.r = 0
  $textColor.g = 0
  $textColor.b = 0
  $textColor.a = 255

  $textRect = SDL_Rect.malloc
  $textRect.x = 100
  $textRect.y = 100
  $textRect.w = WINDOW_W - 2 * $textRect.x
  $textRect.h = 50

  $markedRect = SDL_Rect.malloc
  $markedRect.x = 100
  $markedRect.y = 100
  $markedRect.w = (WINDOW_W - 2 * $markedRect.x)
  $markedRect.h = 50

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
  w_buf = '        '
  h_buf = '        '
  unless $text.empty?
    textSur = SDL_Surface.new( SDL2::TTF_RenderUTF8_Blended($font, $text, $textColor) )
    dest = SDL_Rect.malloc
    dest.x = $textRect.x
    dest.y = $textRect.y
    dest.w = textSur.w
    dest.h = textSur.h

    texture = SDL_CreateTextureFromSurface(renderer, textSur)
    SDL_FreeSurface(textSur)

    SDL_RenderCopy(renderer, texture, nil, dest)
    SDL_DestroyTexture(texture)
    TTF_SizeUTF8($font, $text, w_buf, h_buf)
    w = w_buf.unpack("L")[0]
    h = h_buf.unpack("L")[0]
  end
p w
  $markedRect.x = $textRect.x + w
  $markedRect.w = $textRect.w - w
  if $markedRect.w < 0
    # Stop text input because we cannot hold any more characters
    SDL_StopTextInput()
    return
  else
    SDL_StartTextInput()
  end

  cursorRect = SDL_Rect.malloc
  cursorRect.x = $markedRect.x
  cursorRect.y = $markedRect.y
  cursorRect.w = 2
  cursorRect.h = h

  SDL_SetRenderDrawColor(renderer, 255,255,255,255)
  SDL_RenderFillRect(renderer, $markedRect)

  unless $markedText.empty?
    if $cursor != 0
      SDL2.TTF_SizeUTF8($font, $markedText[$cursor..-1], w_buf, 0)
      w = w_buf.unpack("L")[0]
      cursorRect.x += w
    end
    textSur = SDL_Surface.new( SDL2.TTF_RenderUTF8_Blended($font, $markedText, $textColor) )
    dest = SDL_Rect.malloc
    dest.x = $textRect.x
    dest.y = $textRect.y
    dest.w = textSur.w
    dest.h = textSur.h

    texture = SDL_CreateTextureFromSurface(renderer, textSur)
    SDL_FreeSurface(textSur)

    SDL_RenderCopy(renderer, texture, nil, dest)
    SDL_DestroyTexture(texture)

    underlineRect = SDL_Rect.malloc
    underlineRect.x = $markedRect.x
    underlineRect.y += (h - 2)
    underlineRect.h = 2
    underlineRect.w = w

    SDL_SetRenderDrawColor(renderer, 0,0,0,0)
    SDL_RenderFillRect(renderer, $markedRect)
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
  SDL2.load_lib('libSDL2.dylib', ttf_libpath: 'libSDL2_ttf.dylib' ) # '/usr/local/lib/libSDL2.dylib'
  SDL_SetMainReady()
  success = SDL_Init(SDL_INIT_EVERYTHING)
  exit if success < 0

  window = SDL_CreateWindow("Minimal SDL_TTF Test via sdl2-bindings", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, WINDOW_W, WINDOW_H, 0)

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
      event_type = event.common.type
      # event_timestamp = event.common.timestamp
      # puts "Event : type=0x#{event_type.to_s(16)}, timestamp=#{event_timestamp}"
      case event_type
      when SDL_KEYDOWN
#        p "\r".to_s, event.key.keysym_sym, event.key.keysym_scancode.to_s(2) #, '\t'.ord.to_s(16)
        case event.key.keysym_sym
        when SDLK_ESCAPE
          done = true
        when SDLK_RETURN
          $text = ""
          redraw(renderer)
        when SDLK_BACKSPACE
        end

      when SDL_TEXTINPUT
        if event.text.text[0] == "\0".ord || event.text.text[0] == "\n".ord || $markedRect.w < 0
          next
        end
        term = event.text.text.find_index(0)
        appended = event.text.text[0...term].pack("c*")
        printf("Keyboard: text input \"%s\"\n", appended)
        $text.concat(appended)
        $markedText = ""
        redraw(renderer)
      when SDL_TEXTEDITING
        term = event.edit.text.find_index(0)
        editing = event.edit.text[0...term].pack("c*")
        printf("text editing \"%s\", selected range (%d, %d)\n", editing, event.edit.start, event.edit.length)
        $markedText = editing
        $cursor = event.edit.start
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
