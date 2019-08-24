# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'
require_relative 'sdl2_pixels'

module SDL2
  extend FFI::Library
  # Define/Macro

  SDL_NONSHAPEABLE_WINDOW = -1
  SDL_INVALID_SHAPE_ARGUMENT = -2
  SDL_WINDOW_LACKS_SHAPE = -3

  # Enum

  ShapeModeDefault = 0
  ShapeModeBinarizeAlpha = 1
  ShapeModeReverseBinarizeAlpha = 2
  ShapeModeColorKey = 3

  # Typedef

  typedef :int, :WindowShapeMode

  # Struct

  class SDL_WindowShapeParams < FFI::Union
    layout(
      :binarizationCutoff, :uchar,
      :colorKey, SDL_Color,
    )
  end

  class SDL_WindowShapeMode < FFI::Struct
    layout(
      :mode, :int,
      :parameters, SDL_WindowShapeParams,
    )
  end


  # Function

  def self.setup_shape_symbols()
      attach_function :SDL_CreateShapedWindow, [:pointer, :uint, :uint, :uint, :uint, :uint], :pointer
      attach_function :SDL_IsShapedWindow, [:pointer], :int
      attach_function :SDL_SetWindowShape, [:pointer, :pointer, :pointer], :int
      attach_function :SDL_GetShapedWindowMode, [:pointer, :pointer], :int
  end

end

