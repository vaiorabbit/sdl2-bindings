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
      attach_function :SDL_SetClipboardText, [:pointer], :int
      attach_function :SDL_GetClipboardText, [], :pointer
      attach_function :SDL_HasClipboardText, [], :int
  end

end

