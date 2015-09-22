module SDL2

  extend Fiddle::Importer

  def self.import_cpuinfo_symbols
    # function
    extern 'int SDL_GetCPUCount()'
    extern 'int SDL_GetCPUCacheLineSize()'
    extern 'int SDL_HasRDTSC()'
    extern 'int SDL_HasAltiVec()'
    extern 'int SDL_HasMMX()'
    extern 'int SDL_Has3DNow()'
    extern 'int SDL_HasSSE()'
    extern 'int SDL_HasSSE2()'
    extern 'int SDL_HasSSE3()'
    extern 'int SDL_HasSSE41()'
    extern 'int SDL_HasSSE42()'
    extern 'int SDL_HasAVX()'
    extern 'int SDL_GetSystemRAM()'
  end

end

