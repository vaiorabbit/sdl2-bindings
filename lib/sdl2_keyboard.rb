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
    keyboard_symbols = [
      :SDL_GetKeyboardFocus,
      :SDL_GetKeyboardState,
      :SDL_GetModState,
      :SDL_SetModState,
      :SDL_GetKeyFromScancode,
      :SDL_GetScancodeFromKey,
      :SDL_GetScancodeName,
      :SDL_GetScancodeFromName,
      :SDL_GetKeyName,
      :SDL_GetKeyFromName,
      :SDL_StartTextInput,
      :SDL_IsTextInputActive,
      :SDL_StopTextInput,
      :SDL_SetTextInputRect,
      :SDL_HasScreenKeyboardSupport,
      :SDL_IsScreenKeyboardShown,
    ]
    keyboard_args = {
      :SDL_GetKeyboardFocus => [], 
      :SDL_GetKeyboardState => [:pointer], 
      :SDL_GetModState => [], 
      :SDL_SetModState => [:int], 
      :SDL_GetKeyFromScancode => [:int], 
      :SDL_GetScancodeFromKey => [:int], 
      :SDL_GetScancodeName => [:int], 
      :SDL_GetScancodeFromName => [:pointer], 
      :SDL_GetKeyName => [:int], 
      :SDL_GetKeyFromName => [:pointer], 
      :SDL_StartTextInput => [], 
      :SDL_IsTextInputActive => [], 
      :SDL_StopTextInput => [], 
      :SDL_SetTextInputRect => [:pointer], 
      :SDL_HasScreenKeyboardSupport => [], 
      :SDL_IsScreenKeyboardShown => [:pointer], 
    }
    keyboard_retvals = {
      :SDL_GetKeyboardFocus => :pointer,
      :SDL_GetKeyboardState => :pointer,
      :SDL_GetModState => :int,
      :SDL_SetModState => :void,
      :SDL_GetKeyFromScancode => :int,
      :SDL_GetScancodeFromKey => :int,
      :SDL_GetScancodeName => :pointer,
      :SDL_GetScancodeFromName => :int,
      :SDL_GetKeyName => :pointer,
      :SDL_GetKeyFromName => :int,
      :SDL_StartTextInput => :void,
      :SDL_IsTextInputActive => :int,
      :SDL_StopTextInput => :void,
      :SDL_SetTextInputRect => :void,
      :SDL_HasScreenKeyboardSupport => :int,
      :SDL_IsScreenKeyboardShown => :int,
    }
    keyboard_symbols.each do |sym|
      begin
        attach_function sym, keyboard_args[sym], keyboard_retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).")
      end
    end
  end

end

