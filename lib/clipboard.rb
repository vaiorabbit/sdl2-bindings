module SDL2

  extend Fiddle::Importer

  def self.import_clipboard_symbols
    # function
    extern 'int SDL_SetClipboardText(const char*)'
    extern 'char* SDL_GetClipboardText()'
    extern 'int SDL_HasClipboardText()'
  end

end

