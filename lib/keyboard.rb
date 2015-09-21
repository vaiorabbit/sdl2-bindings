require_relative 'keycode'
require_relative 'scancode'

module SDL2

  extend Fiddle::Importer

  SDL_Keysym = struct(["int scancode", # SDL_Scancode => int
                       "int sym", # SDL_Keycode => int
                       "unsigned short mod",
                       "unsigned int unused"])

  def self.import_keyboard_symbols
    # function
    extern 'SDL_Window* SDL_GetKeyboardFocus()'
    extern 'const unsigned char* SDL_GetKeyboardState(int*)'
    extern 'int SDL_GetModState()'
    extern 'void SDL_SetModState(int)'
    extern 'int SDL_GetKeyFromScancode(int)'
    extern 'int SDL_GetScancodeFromKey(int)'
    extern 'const char* SDL_GetScancodeName(int)'
    extern 'int SDL_GetScancodeFromName(const char*)'
    extern 'const char* SDL_GetKeyName(int)'
    extern 'int SDL_GetKeyFromName(const char*)'
    extern 'void SDL_StartTextInput()'
    extern 'int SDL_IsTextInputActive()'
    extern 'void SDL_StopTextInput()'
    extern 'void SDL_SetTextInputRect(SDL_Rect*)'
    extern 'int SDL_HasScreenKeyboardSupport()'
    extern 'int SDL_IsScreenKeyboardShown(SDL_Window*)'
  end

end

