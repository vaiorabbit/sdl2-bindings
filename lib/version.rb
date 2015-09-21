module SDL2

  extend Fiddle::Importer

  SDL_version = struct(["unsigned char major",
                        "unsigned char minor",
                        "unsigned char patch"])

  def self.import_version_symbols
    # function
    extern 'void SDL_GetVersion(SDL_version*)'
    extern 'const char* SDL_GetRevision()'
    extern 'int SDL_GetRevisionNumber()'
  end

end

