# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL2
  extend FFI::Library
  # Define/Macro


  # Enum


  # Typedef


  # Struct


  # Function

  def self.setup_clipboard_symbols()
    clipboard_symbols = [
      :SDL_SetClipboardText,
      :SDL_GetClipboardText,
      :SDL_HasClipboardText,
    ]
    clipboard_args = {
      :SDL_SetClipboardText => [:pointer], 
      :SDL_GetClipboardText => [], 
      :SDL_HasClipboardText => [], 
    }
    clipboard_retvals = {
      :SDL_SetClipboardText => :int,
      :SDL_GetClipboardText => :pointer,
      :SDL_HasClipboardText => :int,
    }
    clipboard_symbols.each do |sym|
      begin
        attach_function sym, clipboard_args[sym], clipboard_retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).")
      end
    end
  end

end

