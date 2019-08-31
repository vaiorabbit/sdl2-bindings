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
    symbols = [
      :SDL_CreateShapedWindow,
      :SDL_IsShapedWindow,
      :SDL_SetWindowShape,
      :SDL_GetShapedWindowMode,
    ]
    args = {
      :SDL_CreateShapedWindow => [:pointer, :uint, :uint, :uint, :uint, :uint],
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
        attach_function sym, args[sym], retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).")
      end
    end
  end

end

