module SDL2

  extend Fiddle::Importer

  SDL_INIT_TIMER          = 0x00000001
  SDL_INIT_AUDIO          = 0x00000010
  SDL_INIT_VIDEO          = 0x00000020  # SDL_INIT_VIDEO implies SDL_INIT_EVENTS
  SDL_INIT_JOYSTICK       = 0x00000200  # SDL_INIT_JOYSTICK implies SDL_INIT_EVENTS
  SDL_INIT_HAPTIC         = 0x00001000
  SDL_INIT_GAMECONTROLLER = 0x00002000  # SDL_INIT_GAMECONTROLLER implies SDL_INIT_JOYSTICK
  SDL_INIT_EVENTS         = 0x00004000
  SDL_INIT_NOPARACHUTE    = 0x00100000  # Don't catch fatal signals
  SDL_INIT_EVERYTHING     = (SDL_INIT_TIMER | SDL_INIT_AUDIO | SDL_INIT_VIDEO | SDL_INIT_EVENTS | SDL_INIT_JOYSTICK | SDL_INIT_HAPTIC | SDL_INIT_GAMECONTROLLER)

  def self.import_main_symbols
    # function
    extern 'void SDL_SetMainReady()'
    extern 'int SDL_Init(unsigned int)'
    extern 'void SDL_Quit()'
    extern 'int SDL_InitSubSystem(unsigned int)'
    extern 'void SDL_QuitSubSystem(unsigned int)'
    extern 'unsigned int SDL_WasInit(unsigned int)'

  end

end

