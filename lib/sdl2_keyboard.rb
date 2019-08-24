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

  class SDL_Keysym < FFI::Struct
    layout(
      :scancode, :int,
      :sym, :int,
      :mod, :ushort,
      :unused, :uint,
    )
  end


  # Function

  def self.setup_keyboard_symbols()
      attach_function :SDL_GetKeyboardFocus, [], :pointer
      attach_function :SDL_GetKeyboardState, [:pointer], :pointer
      attach_function :SDL_GetModState, [], :int
      attach_function :SDL_SetModState, [:int], :void
      attach_function :SDL_GetKeyFromScancode, [:int], :int
      attach_function :SDL_GetScancodeFromKey, [:int], :int
      attach_function :SDL_GetScancodeName, [:int], :pointer
      attach_function :SDL_GetScancodeFromName, [:pointer], :int
      attach_function :SDL_GetKeyName, [:int], :pointer
      attach_function :SDL_GetKeyFromName, [:pointer], :int
      attach_function :SDL_StartTextInput, [], :void
      attach_function :SDL_IsTextInputActive, [], :int
      attach_function :SDL_StopTextInput, [], :void
      attach_function :SDL_SetTextInputRect, [:pointer], :void
      attach_function :SDL_HasScreenKeyboardSupport, [], :int
      attach_function :SDL_IsScreenKeyboardShown, [:pointer], :int
  end

end

