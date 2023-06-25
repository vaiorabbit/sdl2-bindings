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

  callback :SDL_ClipboardDataCallback, [:pointer, :pointer, :pointer], :pointer

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
      :SDL_SetClipboardData,
      :SDL_GetClipboardUserdata,
      :SDL_GetClipboardData,
      :SDL_HasClipboardData,
    ]
    apis = {
      :SDL_SetClipboardText => :SetClipboardText,
      :SDL_GetClipboardText => :GetClipboardText,
      :SDL_HasClipboardText => :HasClipboardText,
      :SDL_SetPrimarySelectionText => :SetPrimarySelectionText,
      :SDL_GetPrimarySelectionText => :GetPrimarySelectionText,
      :SDL_HasPrimarySelectionText => :HasPrimarySelectionText,
      :SDL_SetClipboardData => :SetClipboardData,
      :SDL_GetClipboardUserdata => :GetClipboardUserdata,
      :SDL_GetClipboardData => :GetClipboardData,
      :SDL_HasClipboardData => :HasClipboardData,
    }
    args = {
      :SDL_SetClipboardText => [:pointer],
      :SDL_GetClipboardText => [],
      :SDL_HasClipboardText => [],
      :SDL_SetPrimarySelectionText => [:pointer],
      :SDL_GetPrimarySelectionText => [],
      :SDL_HasPrimarySelectionText => [],
      :SDL_SetClipboardData => [:SDL_ClipboardDataCallback, :ulong, :pointer, :pointer],
      :SDL_GetClipboardUserdata => [],
      :SDL_GetClipboardData => [:pointer, :pointer],
      :SDL_HasClipboardData => [:pointer],
    }
    retvals = {
      :SDL_SetClipboardText => :int,
      :SDL_GetClipboardText => :pointer,
      :SDL_HasClipboardText => :int,
      :SDL_SetPrimarySelectionText => :int,
      :SDL_GetPrimarySelectionText => :pointer,
      :SDL_HasPrimarySelectionText => :int,
      :SDL_SetClipboardData => :int,
      :SDL_GetClipboardUserdata => :pointer,
      :SDL_GetClipboardData => :pointer,
      :SDL_HasClipboardData => :int,
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

