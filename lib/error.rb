module SDL2

  extend Fiddle::Importer

  def self.import_error_symbols
    # function
    # [NOTE] Fiddle cannot handle variadic functions like printf. Ruby-FFI supports it via ':varargs'.
    # extern 'int SDL_SetError(const char *fmt, ...)'
    extern 'const char* SDL_GetError()'
    extern 'void SDL_ClearError()'
  end

end

