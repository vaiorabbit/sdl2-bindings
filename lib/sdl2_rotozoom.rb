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


  # Typedef


  # Struct


  # Function

  def self.setup_gfx_rotozoom_symbols()
      attach_function :rotozoomSurface, [:pointer, :double, :double, :int], :pointer
      attach_function :rotozoomSurfaceXY, [:pointer, :double, :double, :double, :int], :pointer
      attach_function :rotozoomSurfaceSize, [:int, :int, :double, :double, :pointer, :pointer], :void
      attach_function :rotozoomSurfaceSizeXY, [:int, :int, :double, :double, :double, :pointer, :pointer], :void
      attach_function :zoomSurface, [:pointer, :double, :double, :int], :pointer
      attach_function :zoomSurfaceSize, [:int, :int, :double, :double, :pointer, :pointer], :void
      attach_function :shrinkSurface, [:pointer, :int, :int], :pointer
      attach_function :rotateSurface90Degrees, [:pointer, :int], :pointer
  end

end

