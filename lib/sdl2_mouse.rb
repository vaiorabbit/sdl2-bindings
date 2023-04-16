# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL
  extend FFI::Library
  # Define/Macro

  BUTTON_LEFT = 1
  BUTTON_MIDDLE = 2
  BUTTON_RIGHT = 3
  BUTTON_X1 = 4
  BUTTON_X2 = 5

  # Enum

  SYSTEM_CURSOR_ARROW = 0
  SYSTEM_CURSOR_IBEAM = 1
  SYSTEM_CURSOR_WAIT = 2
  SYSTEM_CURSOR_CROSSHAIR = 3
  SYSTEM_CURSOR_WAITARROW = 4
  SYSTEM_CURSOR_SIZENWSE = 5
  SYSTEM_CURSOR_SIZENESW = 6
  SYSTEM_CURSOR_SIZEWE = 7
  SYSTEM_CURSOR_SIZENS = 8
  SYSTEM_CURSOR_SIZEALL = 9
  SYSTEM_CURSOR_NO = 10
  SYSTEM_CURSOR_HAND = 11
  NUM_SYSTEM_CURSORS = 12
  MOUSEWHEEL_NORMAL = 0
  MOUSEWHEEL_FLIPPED = 1

  # Typedef

  typedef :uint, :SDL_MouseID
  typedef :int, :SDL_SystemCursor
  typedef :int, :SDL_MouseWheelDirection

  # Struct


  # Function

  def self.setup_mouse_symbols(output_error = false)
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
      :SDL_DestroyCursor,
      :SDL_ShowCursor,
      :SDL_HideCursor,
      :SDL_CursorVisible,
    ]
    apis = {
      :SDL_GetMouseFocus => :GetMouseFocus,
      :SDL_GetMouseState => :GetMouseState,
      :SDL_GetGlobalMouseState => :GetGlobalMouseState,
      :SDL_GetRelativeMouseState => :GetRelativeMouseState,
      :SDL_WarpMouseInWindow => :WarpMouseInWindow,
      :SDL_WarpMouseGlobal => :WarpMouseGlobal,
      :SDL_SetRelativeMouseMode => :SetRelativeMouseMode,
      :SDL_CaptureMouse => :CaptureMouse,
      :SDL_GetRelativeMouseMode => :GetRelativeMouseMode,
      :SDL_CreateCursor => :CreateCursor,
      :SDL_CreateColorCursor => :CreateColorCursor,
      :SDL_CreateSystemCursor => :CreateSystemCursor,
      :SDL_SetCursor => :SetCursor,
      :SDL_GetCursor => :GetCursor,
      :SDL_GetDefaultCursor => :GetDefaultCursor,
      :SDL_DestroyCursor => :DestroyCursor,
      :SDL_ShowCursor => :ShowCursor,
      :SDL_HideCursor => :HideCursor,
      :SDL_CursorVisible => :CursorVisible,
    }
    args = {
      :SDL_GetMouseFocus => [],
      :SDL_GetMouseState => [:pointer, :pointer],
      :SDL_GetGlobalMouseState => [:pointer, :pointer],
      :SDL_GetRelativeMouseState => [:pointer, :pointer],
      :SDL_WarpMouseInWindow => [:pointer, :float, :float],
      :SDL_WarpMouseGlobal => [:float, :float],
      :SDL_SetRelativeMouseMode => [:int],
      :SDL_CaptureMouse => [:int],
      :SDL_GetRelativeMouseMode => [],
      :SDL_CreateCursor => [:pointer, :pointer, :int, :int, :int, :int],
      :SDL_CreateColorCursor => [:pointer, :int, :int],
      :SDL_CreateSystemCursor => [:int],
      :SDL_SetCursor => [:pointer],
      :SDL_GetCursor => [],
      :SDL_GetDefaultCursor => [],
      :SDL_DestroyCursor => [:pointer],
      :SDL_ShowCursor => [],
      :SDL_HideCursor => [],
      :SDL_CursorVisible => [],
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
      :SDL_SetCursor => :int,
      :SDL_GetCursor => :pointer,
      :SDL_GetDefaultCursor => :pointer,
      :SDL_DestroyCursor => :void,
      :SDL_ShowCursor => :int,
      :SDL_HideCursor => :int,
      :SDL_CursorVisible => :int,
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

# TODO : def self.BUTTON(X); (1 << ((X)-1)); end;

