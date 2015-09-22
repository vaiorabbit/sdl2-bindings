module SDL2

  extend Fiddle::Importer

  def self.import_gesture_symbols
    # function
    extern 'int SDL_RecordGesture(long)' # SDL_TouchID => long
    extern 'int SDL_SaveAllDollarTemplates(SDL_RWops*)'
    extern 'int SDL_SaveDollarTemplate(long,SDL_RWops*)' # SDL_GestureID => long
    extern 'int SDL_LoadDollarTemplates(long, SDL_RWops*)' # SDL_TouchID => long
  end

end

