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

  MESSAGEBOX_ERROR = 16
  MESSAGEBOX_WARNING = 32
  MESSAGEBOX_INFORMATION = 64
  MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT = 128
  MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT = 256
  MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT = 1
  MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT = 2
  MESSAGEBOX_COLOR_BACKGROUND = 0
  MESSAGEBOX_COLOR_TEXT = 1
  MESSAGEBOX_COLOR_BUTTON_BORDER = 2
  MESSAGEBOX_COLOR_BUTTON_BACKGROUND = 3
  MESSAGEBOX_COLOR_BUTTON_SELECTED = 4
  MESSAGEBOX_COLOR_MAX = 5

  # Typedef

  typedef :int, :SDL_MessageBoxFlags
  typedef :int, :SDL_MessageBoxButtonFlags
  typedef :int, :SDL_MessageBoxColorType

  # Struct

  class MessageBoxButtonData < FFI::Struct
    layout(
      :flags, :uint,
      :buttonid, :int,
      :text, :pointer,
    )
  end

  class MessageBoxColor < FFI::Struct
    layout(
      :r, :uchar,
      :g, :uchar,
      :b, :uchar,
    )
  end

  class MessageBoxColorScheme < FFI::Struct
    layout(
      :colors, [MessageBoxColor, 5],
    )
  end

  class MessageBoxData < FFI::Struct
    layout(
      :flags, :uint,
      :window, :pointer,
      :title, :pointer,
      :message, :pointer,
      :numbuttons, :int,
      :buttons, :pointer,
      :colorScheme, :pointer,
    )
  end


  # Function

  def self.setup_messagebox_symbols(output_error = false)
    symbols = [
      :SDL_ShowMessageBox,
      :SDL_ShowSimpleMessageBox,
    ]
    apis = {
      :SDL_ShowMessageBox => :ShowMessageBox,
      :SDL_ShowSimpleMessageBox => :ShowSimpleMessageBox,
    }
    args = {
      :SDL_ShowMessageBox => [:pointer, :pointer],
      :SDL_ShowSimpleMessageBox => [:uint, :pointer, :pointer, :pointer],
    }
    retvals = {
      :SDL_ShowMessageBox => :int,
      :SDL_ShowSimpleMessageBox => :int,
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

