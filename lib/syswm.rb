module SDL2

  extend Fiddle::Importer

  # SDL_SYSWM_TYPE
  SDL_SYSWM_UNKNOWN  = 0
  SDL_SYSWM_WINDOWS  = 1
  SDL_SYSWM_X11      = 2
  SDL_SYSWM_DIRECTFB = 3
  SDL_SYSWM_COCOA    = 4
  SDL_SYSWM_UIKIT    = 5
  SDL_SYSWM_WAYLAND  = 6
  SDL_SYSWM_MIR      = 7
  SDL_SYSWM_WINRT    = 8

  def self.import_syswm_symbols
    # function
    extern 'int SDL_GetWindowWMInfo(SDL_Window*, SDL_SysWMinfo*)'
  end

end

