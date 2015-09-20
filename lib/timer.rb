module SDL2

  extend Fiddle::Importer

  def self.import_timer_symbols
    # function
    extern 'unsigned int SDL_GetTicks()'

    # TODO : SDL_TICKS_PASSED

    extern 'unsigned long SDL_GetPerformanceCounter()'
    extern 'unsigned long SDL_GetPerformanceFrequency()'

    extern 'void SDL_Delay(unsigned int)'

    # TODO : SDL_TimerCallback

  end

end

