# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL2
  extend FFI::Library
  # Define/Macro

  SDL_BUTTON_LEFT = 1
  SDL_BUTTON_MIDDLE = 2
  SDL_BUTTON_RIGHT = 3
  SDL_BUTTON_X1 = 4
  SDL_BUTTON_X2 = 5

  # Enum

  SDL_SYSTEM_CURSOR_ARROW = 0
  SDL_SYSTEM_CURSOR_IBEAM = 1
  SDL_SYSTEM_CURSOR_WAIT = 2
  SDL_SYSTEM_CURSOR_CROSSHAIR = 3
  SDL_SYSTEM_CURSOR_WAITARROW = 4
  SDL_SYSTEM_CURSOR_SIZENWSE = 5
  SDL_SYSTEM_CURSOR_SIZENESW = 6
  SDL_SYSTEM_CURSOR_SIZEWE = 7
  SDL_SYSTEM_CURSOR_SIZENS = 8
  SDL_SYSTEM_CURSOR_SIZEALL = 9
  SDL_SYSTEM_CURSOR_NO = 10
  SDL_SYSTEM_CURSOR_HAND = 11
  SDL_NUM_SYSTEM_CURSORS = 12
  SDL_MOUSEWHEEL_NORMAL = 0
  SDL_MOUSEWHEEL_FLIPPED = 1

  # Typedef

  typedef :int, :SDL_SystemCursor
  typedef :int, :SDL_MouseWheelDirection

  # Struct


  # Function

  def self.setup_mouse_symbols()
    symbols = [
      :SDL_GetMouseFocus,
      :SDL_GetMouseState,
      :SDL_GetGlobalMouseState,
      :SDL_GetRelativeMouseState,
      :SDL_WarpMouseInWindow,
      :SDL_WarpMouseGlobal,
      :SDL_SetRelativeMouseMode,
      :SDL_CaptureMouse,
      :SDL_GetRelativeMouseMode,
      :SDL_CreateCursor,
      :SDL_CreateColorCursor,
      :SDL_CreateSystemCursor,
      :SDL_SetCursor,
      :SDL_GetCursor,
      :SDL_GetDefaultCursor,
      :SDL_FreeCursor,
      :SDL_ShowCursor,
    ]
    args = {
      :SDL_GetMouseFocus => [],
      :SDL_GetMouseState => [:pointer, :pointer],
      :SDL_GetGlobalMouseState => [:pointer, :pointer],
      :SDL_GetRelativeMouseState => [:pointer, :pointer],
      :SDL_WarpMouseInWindow => [:pointer, :int, :int],
      :SDL_WarpMouseGlobal => [:int, :int],
      :SDL_SetRelativeMouseMode => [:int],
      :SDL_CaptureMouse => [:int],
      :SDL_GetRelativeMouseMode => [],
      :SDL_CreateCursor => [:pointer, :pointer, :int, :int, :int, :int],
      :SDL_CreateColorCursor => [:pointer, :int, :int],
      :SDL_CreateSystemCursor => [:int],
      :SDL_SetCursor => [:pointer],
      :SDL_GetCursor => [],
      :SDL_GetDefaultCursor => [],
      :SDL_FreeCursor => [:pointer],
      :SDL_ShowCursor => [:int],
    }
    retvals = {
      :SDL_GetMouseFocus => :pointer,
      :SDL_GetMouseState => :uint,
      :SDL_GetGlobalMouseState => :uint,
      :SDL_GetRelativeMouseState => :uint,
      :SDL_WarpMouseInWindow => :void,
      :SDL_WarpMouseGlobal => :int,
      :SDL_SetRelativeMouseMode => :int,
      :SDL_CaptureMouse => :int,
      :SDL_GetRelativeMouseMode => :int,
      :SDL_CreateCursor => :pointer,
      :SDL_CreateColorCursor => :pointer,
      :SDL_CreateSystemCursor => :pointer,
      :SDL_SetCursor => :void,
      :SDL_GetCursor => :pointer,
      :SDL_GetDefaultCursor => :pointer,
      :SDL_FreeCursor => :void,
      :SDL_ShowCursor => :int,
    }
    symbols.each do |sym|
      begin
        attach_function sym, args[sym], retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).")
      end
    end
  end

end

# TODO : def SDL_BUTTON(X); (1 << ((X)-1)); end;

