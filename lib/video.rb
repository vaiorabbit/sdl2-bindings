module SDL2

  extend Fiddle::Importer

  def self.import_video_symbols
    # function
    # const char* name, int x, int y, int w, int h, unsigned int flags
    extern 'SDL_Window* SDL_CreateWindow(const char*, int, int, int, int, unsigned int)'

    extern 'void SDL_DestroyWindow(SDL_Window*)'
  end

end

