module SDL2

  extend Fiddle::Importer

  SDL_Finger = struct(["long id", # SDL_FingerID => long
                       "float x",
                       "float y",
                       "float pressure"])

  SDL_TOUCH_MOUSEID = -1

  def self.import_touch_symbols
    # function
    extern 'int SDL_GetNumTouchDevices()'
    extern 'long SDL_GetTouchDevice(int)' # SDL_TouchID => long
    extern 'int  SDL_GetNumTouchFingers(long)' # SDL_TouchID => long
    extern 'SDL_Finger* SDL_GetTouchFinger(long, int)' # SDL_TouchID => long
  end

end

