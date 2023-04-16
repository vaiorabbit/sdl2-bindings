# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'
require_relative 'sdl2_pixels'

module SDL
  extend FFI::Library
  # Define/Macro

  NONSHAPEABLE_WINDOW = -1
  INVALID_SHAPE_ARGUMENT = -2
  WINDOW_LACKS_SHAPE = -3

  # Enum

  ShapeModeDefault = 0
  ShapeModeBinarizeAlpha = 1
  ShapeModeReverseBinarizeAlpha = 2
  ShapeModeColorKey = 3

  # Typedef

  typedef :int, :WindowShapeMode

  # Struct

  class WindowShapeParams < FFI::Union
    layout(
      :binarizationCutoff, :uchar,
      :colorKey, Color,
    )
  end

  class WindowShapeMode < FFI::Struct
    layout(
      :mode, :int,
      :parameters, WindowShapeParams,
    )
  end


  # Function

  def self.setup_shape_symbols(output_error = false)
    symbols = [
      :SDL_CreateShapedWindow,
      :SDL_IsShapedWindow,
      :SDL_SetWindowShape,
      :SDL_GetShapedWindowMode,
    ]
    apis = {
      :SDL_CreateShapedWindow => :CreateShapedWindow,
      :SDL_IsShapedWindow => :IsShapedWindow,
      :SDL_SetWindowShape => :SetWindowShape,
      :SDL_GetShapedWindowMode => :GetShapedWindowMode,
    }
    args = {
      :SDL_CreateShapedWindow => [:pointer, :int, :int, :uint],
      :SDL_IsShapedWindow => [:pointer],
      :SDL_SetWindowShape => [:pointer, :pointer, :pointer],
      :SDL_GetShapedWindowMode => [:pointer, :pointer],
    }
    retvals = {
      :SDL_CreateShapedWindow => :pointer,
      :SDL_IsShapedWindow => :int,
      :SDL_SetWindowShape => :int,
      :SDL_GetShapedWindowMode => :int,
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

