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

  SDL_MESSAGEBOX_ERROR = 16
  SDL_MESSAGEBOX_WARNING = 32
  SDL_MESSAGEBOX_INFORMATION = 64
  SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT = 1
  SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT = 2
  SDL_MESSAGEBOX_COLOR_BACKGROUND = 0
  SDL_MESSAGEBOX_COLOR_TEXT = 1
  SDL_MESSAGEBOX_COLOR_BUTTON_BORDER = 2
  SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND = 3
  SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED = 4
  SDL_MESSAGEBOX_COLOR_MAX = 5

  # Typedef

  typedef :int, :SDL_MessageBoxFlags
  typedef :int, :SDL_MessageBoxButtonFlags
  typedef :int, :SDL_MessageBoxColorType

  # Struct

  class SDL_MessageBoxButtonData < FFI::Struct
    layout(
      :flags, :uint,
      :buttonid, :int,
      :text, :pointer,
    )
  end

  class SDL_MessageBoxColor < FFI::Struct
    layout(
      :r, :uchar,
      :g, :uchar,
      :b, :uchar,
    )
  end

  class SDL_MessageBoxColorScheme < FFI::Struct
    layout(
      :colors, [SDL_MessageBoxColor, 5],
    )
  end

  class SDL_MessageBoxData < FFI::Struct
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

  def self.setup_messagebox_symbols()
    messagebox_symbols = [
      :SDL_ShowMessageBox,
      :SDL_ShowSimpleMessageBox,
    ]
    messagebox_args = {
      :SDL_ShowMessageBox => [:pointer, :pointer], 
      :SDL_ShowSimpleMessageBox => [:uint, :pointer, :pointer, :pointer], 
    }
    messagebox_retvals = {
      :SDL_ShowMessageBox => :int,
      :SDL_ShowSimpleMessageBox => :int,
    }
    messagebox_symbols.each do |sym|
      begin
        attach_function sym, messagebox_args[sym], messagebox_retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).")
      end
    end
  end

end

