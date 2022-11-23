# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL
  extend FFI::Library
  # Define/Macro


  # Enum


  # Typedef


  # Struct


  # Function

  def self.setup_clipboard_symbols(output_error = false)
    symbols = [
      :SDL_SetClipboardText,
      :SDL_GetClipboardText,
      :SDL_HasClipboardText,
      :SDL_SetPrimarySelectionText,
      :SDL_GetPrimarySelectionText,
      :SDL_HasPrimarySelectionText,
    ]
    apis = {
      :SDL_SetClipboardText => :SetClipboardText,
      :SDL_GetClipboardText => :GetClipboardText,
      :SDL_HasClipboardText => :HasClipboardText,
      :SDL_SetPrimarySelectionText => :SetPrimarySelectionText,
      :SDL_GetPrimarySelectionText => :GetPrimarySelectionText,
      :SDL_HasPrimarySelectionText => :HasPrimarySelectionText,
    }
    args = {
      :SDL_SetClipboardText => [:pointer],
      :SDL_GetClipboardText => [],
      :SDL_HasClipboardText => [],
      :SDL_SetPrimarySelectionText => [:pointer],
      :SDL_GetPrimarySelectionText => [],
      :SDL_HasPrimarySelectionText => [],
    }
    retvals = {
      :SDL_SetClipboardText => :int,
      :SDL_GetClipboardText => :pointer,
      :SDL_HasClipboardText => :int,
      :SDL_SetPrimarySelectionText => :int,
      :SDL_GetPrimarySelectionText => :pointer,
      :SDL_HasPrimarySelectionText => :int,
    }
    symbols.each do |sym|
      begin
        attach_function apis[sym], sym, args[sym], retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).") if output_error
      end
    end
  end

end

