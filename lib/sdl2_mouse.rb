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
      attach_function :SDL_GetMouseFocus, [], :pointer
      attach_function :SDL_GetMouseState, [:pointer, :pointer], :uint
      attach_function :SDL_GetGlobalMouseState, [:pointer, :pointer], :uint
      attach_function :SDL_GetRelativeMouseState, [:pointer, :pointer], :uint
      attach_function :SDL_WarpMouseInWindow, [:pointer, :int, :int], :void
      attach_function :SDL_WarpMouseGlobal, [:int, :int], :int
      attach_function :SDL_SetRelativeMouseMode, [:int], :int
      attach_function :SDL_CaptureMouse, [:int], :int
      attach_function :SDL_GetRelativeMouseMode, [], :int
      attach_function :SDL_CreateCursor, [:pointer, :pointer, :int, :int, :int, :int], :pointer
      attach_function :SDL_CreateColorCursor, [:pointer, :int, :int], :pointer
      attach_function :SDL_CreateSystemCursor, [:int], :pointer
      attach_function :SDL_SetCursor, [:pointer], :void
      attach_function :SDL_GetCursor, [], :pointer
      attach_function :SDL_GetDefaultCursor, [], :pointer
      attach_function :SDL_FreeCursor, [:pointer], :void
      attach_function :SDL_ShowCursor, [:int], :int
  end

end

