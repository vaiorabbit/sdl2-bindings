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


  # Function

  def self.setup_gfx_rotozoom_symbols(output_error = false)
    symbols = [
      :rotozoomSurface,
      :rotozoomSurfaceXY,
      :rotozoomSurfaceSize,
      :rotozoomSurfaceSizeXY,
      :zoomSurface,
      :zoomSurfaceSize,
      :shrinkSurface,
      :rotateSurface90Degrees,
    ]
    apis = {
      :rotozoomSurface => :rotozoomSurface,
      :rotozoomSurfaceXY => :rotozoomSurfaceXY,
      :rotozoomSurfaceSize => :rotozoomSurfaceSize,
      :rotozoomSurfaceSizeXY => :rotozoomSurfaceSizeXY,
      :zoomSurface => :zoomSurface,
      :zoomSurfaceSize => :zoomSurfaceSize,
      :shrinkSurface => :shrinkSurface,
      :rotateSurface90Degrees => :rotateSurface90Degrees,
    }
    args = {
      :rotozoomSurface => [:pointer, :double, :double, :int],
      :rotozoomSurfaceXY => [:pointer, :double, :double, :double, :int],
      :rotozoomSurfaceSize => [:int, :int, :double, :double, :pointer, :pointer],
      :rotozoomSurfaceSizeXY => [:int, :int, :double, :double, :double, :pointer, :pointer],
      :zoomSurface => [:pointer, :double, :double, :int],
      :zoomSurfaceSize => [:int, :int, :double, :double, :pointer, :pointer],
      :shrinkSurface => [:pointer, :int, :int],
      :rotateSurface90Degrees => [:pointer, :int],
    }
    retvals = {
      :rotozoomSurface => :pointer,
      :rotozoomSurfaceXY => :pointer,
      :rotozoomSurfaceSize => :void,
      :rotozoomSurfaceSizeXY => :void,
      :zoomSurface => :pointer,
      :zoomSurfaceSize => :void,
      :shrinkSurface => :pointer,
      :rotateSurface90Degrees => :pointer,
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

