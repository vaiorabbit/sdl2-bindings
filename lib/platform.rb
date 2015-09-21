module SDL2

  extend Fiddle::Importer

  def self.import_platform_symbols
    # function
    extern 'const char* SDL_GetPlatform()'
  end

end

