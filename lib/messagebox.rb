module SDL2

  extend Fiddle::Importer

  # SDL_MessageBoxFlags
  SDL_MESSAGEBOX_ERROR        = 0x00000010
  SDL_MESSAGEBOX_WARNING      = 0x00000020
  SDL_MESSAGEBOX_INFORMATION  = 0x00000040

  # SDL_MessageBoxButtonFlags
  SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT = 0x00000001
  SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT = 0x00000002

  SDL_MessageBoxButtonData = struct(["unsigned int flags",
                                     "int buttonid",
                                     "const char* text"])

  SDL_MessageBoxColor = struct(["unsigned char r",
                                "unsigned char g",
                                "unsigned char b"])

  # SDL_MessageBoxColorType
  SDL_MESSAGEBOX_COLOR_BACKGROUND        = 0
  SDL_MESSAGEBOX_COLOR_TEXT              = 1
  SDL_MESSAGEBOX_COLOR_BUTTON_BORDER     = 2
  SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND = 3
  SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED   = 4
  SDL_MESSAGEBOX_COLOR_MAX               = 5

  SDL_MessageBoxColorScheme = struct(["int colors[5]"]) # SDL_MessageBoxColor => int, SDL_MESSAGEBOX_COLOR_MAX => 5

  SDL_MessageBoxData = struct(["unsigned int flags",
                               "SDL_Window* window",
                               "const char* title",
                               "const char* message",
                               "int numbuttons",
                               "const SDL_MessageBoxButtonData* buttons",
                               "const SDL_MessageBoxColorScheme* colorScheme"])

  def self.import_messagebox_symbols
    # function
    extern 'int SDL_ShowMessageBox(const SDL_MessageBoxData*, int*)'
    extern 'int SDL_ShowSimpleMessageBox(unsigned int, const char*, const char*, SDL_Window*)'
  end

end

