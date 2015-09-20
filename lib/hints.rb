module SDL2

  extend Fiddle::Importer

  SDL_HINT_RENDER_DRIVER = "SDL_RENDER_DRIVER"

  # SDL_HintPriority
  SDL_HINT_DEFAULT = 0
  SDL_HINT_NORMAL = 1
  SDL_HINT_OVERRIDE = 2
  

  def self.import_hints_symbols
    # function
    extern 'void SDL_ClearHints()'
  end

end

