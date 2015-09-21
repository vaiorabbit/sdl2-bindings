require_relative 'keycode'
require_relative 'scancode'

module SDL2

  extend Fiddle::Importer

  # SDL_SystemCursor
  SDL_SYSTEM_CURSOR_ARROW     = 0
  SDL_SYSTEM_CURSOR_IBEAM     = 1
  SDL_SYSTEM_CURSOR_WAIT      = 2
  SDL_SYSTEM_CURSOR_CROSSHAIR = 3
  SDL_SYSTEM_CURSOR_WAITARROW = 4
  SDL_SYSTEM_CURSOR_SIZENWSE  = 5
  SDL_SYSTEM_CURSOR_SIZENESW  = 6
  SDL_SYSTEM_CURSOR_SIZEWE    = 7
  SDL_SYSTEM_CURSOR_SIZENS    = 8
  SDL_SYSTEM_CURSOR_SIZEALL   = 9
  SDL_SYSTEM_CURSOR_NO        = 10
  SDL_SYSTEM_CURSOR_HAND      = 11
  SDL_NUM_SYSTEM_CURSORS      = 12

  def self.sdl_button(x); (1 << ((x)-1)); end
  SDL_BUTTON_LEFT     = 1
  SDL_BUTTON_MIDDLE   = 2
  SDL_BUTTON_RIGHT    = 3
  SDL_BUTTON_X1       = 4
  SDL_BUTTON_X2       = 5
  SDL_BUTTON_LMASK    = sdl_button(SDL_BUTTON_LEFT)
  SDL_BUTTON_MMASK    = sdl_button(SDL_BUTTON_MIDDLE)
  SDL_BUTTON_RMASK    = sdl_button(SDL_BUTTON_RIGHT)
  SDL_BUTTON_X1MASK   = sdl_button(SDL_BUTTON_X1)
  SDL_BUTTON_X2MASK   = sdl_button(SDL_BUTTON_X2)

  def self.import_mouse_symbols
    # function
    extern 'SDL_Window* SDL_GetMouseFocus()'
    extern 'unsigned int SDL_GetMouseState(int*, int*)'
    extern 'unsigned int SDL_GetRelativeMouseState(int*, int*)'
    extern 'void SDL_WarpMouseInWindow(SDL_Window*, int, int)'
    extern 'int SDL_SetRelativeMouseMode(int)'
    extern 'int SDL_GetRelativeMouseMode()'
    extern 'SDL_Cursor* SDL_CreateCursor(const unsigned char*, const unsigned char*, int, int, int, int)'
    extern 'SDL_Cursor* SDL_CreateColorCursor(SDL_Surface*, int, int)'
    extern 'SDL_Cursor* SDL_CreateSystemCursor(int)' # SDL_SystemCursor => int
    extern 'void SDL_SetCursor(SDL_Cursor*)'
    extern 'SDL_Cursor* SDL_GetCursor()'
    extern 'SDL_Cursor* SDL_GetDefaultCursor()'
    extern 'void SDL_FreeCursor(SDL_Cursor*)'
    extern 'int SDL_ShowCursor(int)'
  end

end

