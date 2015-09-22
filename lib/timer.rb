module SDL2

  extend Fiddle::Importer

  def self.import_timer_symbols
    typealias("SDL_TimerID", "int");

    # function
    extern 'unsigned int SDL_GetTicks()'

    extern 'unsigned long SDL_GetPerformanceCounter()'
    extern 'unsigned long SDL_GetPerformanceFrequency()'

    extern 'void SDL_Delay(unsigned int)'
=begin # Using callback functionality may cause interpreter crash.
    extern 'SDL_TimerID SDL_AddTimer(unsigned int, void*, void*)' # SDL_TimerCallback => void*
    extern 'int SDL_RemoveTimer(SDL_TimerID)'
=end
  end

end

