module SDL2

  extend Fiddle::Importer

  SDL_JoystickGUID = struct(["unsigned char data[16]"])

  # Hat positions
  SDL_HAT_CENTERED    = 0x00
  SDL_HAT_UP          = 0x01
  SDL_HAT_RIGHT       = 0x02
  SDL_HAT_DOWN        = 0x04
  SDL_HAT_LEFT        = 0x08
  SDL_HAT_RIGHTUP     = (SDL_HAT_RIGHT|SDL_HAT_UP)
  SDL_HAT_RIGHTDOWN   = (SDL_HAT_RIGHT|SDL_HAT_DOWN)
  SDL_HAT_LEFTUP      = (SDL_HAT_LEFT|SDL_HAT_UP)
  SDL_HAT_LEFTDOWN    = (SDL_HAT_LEFT|SDL_HAT_DOWN)

  def self.import_joystick_symbols
    # function
    extern 'int SDL_NumJoysticks()'
    extern 'const char *SDL_JoystickNameForIndex(int)'
    extern 'SDL_Joystick* SDL_JoystickOpen(int)'
    extern 'const char *SDL_JoystickName(SDL_Joystick*)'
    # [NOTE] We cannot specify a struct instance as an argument or a return value in Fiddle::Import.extern format.
    # extern 'SDL_JoystickGUID SDL_JoystickGetDeviceGUID(int)'
    # extern 'SDL_JoystickGUID SDL_JoystickGetGUID(SDL_Joystick*)'
    # extern 'void SDL_JoystickGetGUIDString(SDL_JoystickGUID, char*, int)'
    # extern 'SDL_JoystickGUID SDL_JoystickGetGUIDFromString(const char*)'
    extern 'int SDL_JoystickGetAttached(SDL_Joystick*)'
    extern 'int SDL_JoystickInstanceID(SDL_Joystick*)' # SDL_JoystickID => int
    extern 'int SDL_JoystickNumAxes(SDL_Joystick*)'
    extern 'int SDL_JoystickNumBalls(SDL_Joystick*)'
    extern 'int SDL_JoystickNumHats(SDL_Joystick*)'
    extern 'int SDL_JoystickNumButtons(SDL_Joystick*)'
    extern 'void SDL_JoystickUpdate()'
    extern 'int SDL_JoystickEventState(int)'
    extern 'unsigned short SDL_JoystickGetAxis(SDL_Joystick*, int)'
    extern 'unsigned char SDL_JoystickGetHat(SDL_Joystick*, int)'
    extern 'int SDL_JoystickGetBall(SDL_Joystick*, int, int*, int*)'
    extern 'unsigned char SDL_JoystickGetButton(SDL_Joystick*, int)'
    extern 'void SDL_JoystickClose(SDL_Joystick*)'
  end

end

