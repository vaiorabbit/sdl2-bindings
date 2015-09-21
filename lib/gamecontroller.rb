module SDL2

  extend Fiddle::Importer

  # SDL_GameControllerBindType
  SDL_CONTROLLER_BINDTYPE_NONE   = 0
  SDL_CONTROLLER_BINDTYPE_BUTTON = 1
  SDL_CONTROLLER_BINDTYPE_AXIS   = 2
  SDL_CONTROLLER_BINDTYPE_HAT    = 3

  SDL_GameControllerButtonBind = struct(["int bindType", # SDL_GameControllerBindType => int
                                         # [NOTE] Original definition
                                         # union
                                         # {
                                         #   int button;
                                         #   int axis;
                                         #   struct {
                                         #     int hat;
                                         #     int hat_mask;
                                         #   } hat;
                                         # } value;
                                         "int value[2]"])

  # SDL_GameControllerAxis
  SDL_CONTROLLER_AXIS_INVALID      = -1
  SDL_CONTROLLER_AXIS_LEFTX        = 0
  SDL_CONTROLLER_AXIS_LEFTY        = 1
  SDL_CONTROLLER_AXIS_RIGHTX       = 2
  SDL_CONTROLLER_AXIS_RIGHTY       = 3
  SDL_CONTROLLER_AXIS_TRIGGERLEFT  = 4
  SDL_CONTROLLER_AXIS_TRIGGERRIGHT = 5
  SDL_CONTROLLER_AXIS_MAX          = 6

  # SDL_GameControllerButton
  SDL_CONTROLLER_BUTTON_INVALID       = -1
  SDL_CONTROLLER_BUTTON_A             = 0
  SDL_CONTROLLER_BUTTON_B             = 1
  SDL_CONTROLLER_BUTTON_X             = 2
  SDL_CONTROLLER_BUTTON_Y             = 3
  SDL_CONTROLLER_BUTTON_BACK          = 4
  SDL_CONTROLLER_BUTTON_GUIDE         = 5
  SDL_CONTROLLER_BUTTON_START         = 6
  SDL_CONTROLLER_BUTTON_LEFTSTICK     = 7
  SDL_CONTROLLER_BUTTON_RIGHTSTICK    = 8
  SDL_CONTROLLER_BUTTON_LEFTSHOULDER  = 9
  SDL_CONTROLLER_BUTTON_RIGHTSHOULDER = 10
  SDL_CONTROLLER_BUTTON_DPAD_UP       = 11
  SDL_CONTROLLER_BUTTON_DPAD_DOWN     = 12
  SDL_CONTROLLER_BUTTON_DPAD_LEFT     = 13
  SDL_CONTROLLER_BUTTON_DPAD_RIGHT    = 14
  SDL_CONTROLLER_BUTTON_MAX           = 15


  # TODO : SDL_GameControllerAddMappingsFromRW, SDL_GameControllerAddMappingsFromFile

  def self.import_gamecontroller_symbols
    # function
    extern 'int SDL_GameControllerAddMapping( const char* )'
    # [NOTE] We cannot specify a struct as a by-value argument in Fiddle::Import.extern format.
    # extern 'char * SDL_GameControllerMappingForGUID( unsigned char[8] )' # SDL_JoystickGUID => unsigned char[8]
    extern 'char * SDL_GameControllerMapping( SDL_GameController* )'
    extern 'int SDL_IsGameController(int)'
    extern 'const char *SDL_GameControllerNameForIndex(int)'
    extern 'SDL_GameController* SDL_GameControllerOpen(int)'
    extern 'const char *SDL_GameControllerName(SDL_GameController*)'
    extern 'int SDL_GameControllerGetAttached(SDL_GameController*)'
    extern 'SDL_Joystick *SDL_GameControllerGetJoystick(SDL_GameController*)'
    extern 'int SDL_GameControllerEventState(int)'
    extern 'void SDL_GameControllerUpdate()'
    extern 'int SDL_GameControllerGetAxisFromString(const char*)' # SDL_GameControllerAxis => int
    extern 'const char* SDL_GameControllerGetStringForAxis(int)' # SDL_GameControllerAxis => int
    # [NOTE] We cannot specify a struct instance as a return value in Fiddle::Import.extern format.
    # extern 'SDL_GameControllerButtonBind SDL_GameControllerGetBindForAxis(SDL_GameController*, int)' # SDL_GameControllerAxis => int
    extern 'unsigned short SDL_GameControllerGetAxis(SDL_GameController*, int)' # SDL_GameControllerAxis => int
    extern 'int SDL_GameControllerGetButtonFromString(const char*)' # SDL_GameControllerButton => int
    extern 'const char* SDL_GameControllerGetStringForButton(int)' # SDL_GameControllerButton => int
    # [NOTE] We cannot specify a struct instance as a return value in Fiddle::Import.extern format.
    # extern 'SDL_GameControllerButtonBind SDL_GameControllerGetBindForButton(SDL_GameController*, int)' # SDL_GameControllerButton => int
    extern 'unsigned char SDL_GameControllerGetButton(SDL_GameController*, int)' # SDL_GameControllerButton => int
    extern 'void SDL_GameControllerClose(SDL_GameController*)'
  end

end

