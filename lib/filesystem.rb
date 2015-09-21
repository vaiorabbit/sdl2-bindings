module SDL2

  extend Fiddle::Importer

  def self.import_filesystem_symbols
    # function
    extern 'char* SDL_GetBasePath()'
    extern 'char* SDL_GetPrefPath(const char*, const char*)'
  end

end

