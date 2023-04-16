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

  class Keysym < FFI::Struct
    layout(
      :scancode, :int,
      :sym, :int,
      :mod, :ushort,
      :unused, :uint,
    )
  end


  # Function

  def self.setup_keyboard_symbols(output_error = false)
    symbols = [
      :SDL_GetKeyboardFocus,
      :SDL_GetKeyboardState,
      :SDL_ResetKeyboard,
      :SDL_GetModState,
      :SDL_SetModState,
      :SDL_GetKeyFromScancode,
      :SDL_GetScancodeFromKey,
      :SDL_GetScancodeName,
      :SDL_GetScancodeFromName,
      :SDL_GetKeyName,
      :SDL_GetKeyFromName,
      :SDL_StartTextInput,
      :SDL_TextInputActive,
      :SDL_StopTextInput,
      :SDL_ClearComposition,
      :SDL_TextInputShown,
      :SDL_SetTextInputRect,
      :SDL_HasScreenKeyboardSupport,
      :SDL_ScreenKeyboardShown,
    ]
    apis = {
      :SDL_GetKeyboardFocus => :GetKeyboardFocus,
      :SDL_GetKeyboardState => :GetKeyboardState,
      :SDL_ResetKeyboard => :ResetKeyboard,
      :SDL_GetModState => :GetModState,
      :SDL_SetModState => :SetModState,
      :SDL_GetKeyFromScancode => :GetKeyFromScancode,
      :SDL_GetScancodeFromKey => :GetScancodeFromKey,
      :SDL_GetScancodeName => :GetScancodeName,
      :SDL_GetScancodeFromName => :GetScancodeFromName,
      :SDL_GetKeyName => :GetKeyName,
      :SDL_GetKeyFromName => :GetKeyFromName,
      :SDL_StartTextInput => :StartTextInput,
      :SDL_TextInputActive => :TextInputActive,
      :SDL_StopTextInput => :StopTextInput,
      :SDL_ClearComposition => :ClearComposition,
      :SDL_TextInputShown => :TextInputShown,
      :SDL_SetTextInputRect => :SetTextInputRect,
      :SDL_HasScreenKeyboardSupport => :HasScreenKeyboardSupport,
      :SDL_ScreenKeyboardShown => :ScreenKeyboardShown,
    }
    args = {
      :SDL_GetKeyboardFocus => [],
      :SDL_GetKeyboardState => [:pointer],
      :SDL_ResetKeyboard => [],
      :SDL_GetModState => [],
      :SDL_SetModState => [:int],
      :SDL_GetKeyFromScancode => [:int],
      :SDL_GetScancodeFromKey => [:int],
      :SDL_GetScancodeName => [:int],
      :SDL_GetScancodeFromName => [:pointer],
      :SDL_GetKeyName => [:int],
      :SDL_GetKeyFromName => [:pointer],
      :SDL_StartTextInput => [],
      :SDL_TextInputActive => [],
      :SDL_StopTextInput => [],
      :SDL_ClearComposition => [],
      :SDL_TextInputShown => [],
      :SDL_SetTextInputRect => [:pointer],
      :SDL_HasScreenKeyboardSupport => [],
      :SDL_ScreenKeyboardShown => [:pointer],
    }
    retvals = {
      :SDL_GetKeyboardFocus => :pointer,
      :SDL_GetKeyboardState => :pointer,
      :SDL_ResetKeyboard => :void,
      :SDL_GetModState => :int,
      :SDL_SetModState => :void,
      :SDL_GetKeyFromScancode => :int,
      :SDL_GetScancodeFromKey => :int,
      :SDL_GetScancodeName => :pointer,
      :SDL_GetScancodeFromName => :int,
      :SDL_GetKeyName => :pointer,
      :SDL_GetKeyFromName => :int,
      :SDL_StartTextInput => :void,
      :SDL_TextInputActive => :int,
      :SDL_StopTextInput => :void,
      :SDL_ClearComposition => :void,
      :SDL_TextInputShown => :int,
      :SDL_SetTextInputRect => :int,
      :SDL_HasScreenKeyboardSupport => :int,
      :SDL_ScreenKeyboardShown => :int,
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

