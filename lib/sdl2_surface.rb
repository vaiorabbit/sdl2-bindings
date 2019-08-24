# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'
require_relative 'sdl2_rect'

module SDL2
  extend FFI::Library
  # Define/Macro

  SDL_SWSURFACE = 0
  SDL_PREALLOC = 0x00000001
  SDL_RLEACCEL = 0x00000002
  SDL_DONTFREE = 0x00000004
  SDL_SIMD_ALIGNED = 0x00000008

  # Enum

  SDL_YUV_CONVERSION_JPEG = 0
  SDL_YUV_CONVERSION_BT601 = 1
  SDL_YUV_CONVERSION_BT709 = 2
  SDL_YUV_CONVERSION_AUTOMATIC = 3

  # Typedef

  callback :SDL_blit, [:pointer, :pointer, :pointer, :pointer], :int
  typedef :int, :SDL_YUV_CONVERSION_MODE

  # Struct

  class SDL_Surface < FFI::Struct
    layout(
      :flags, :uint,
      :format, :pointer,
      :w, :int,
      :h, :int,
      :pitch, :int,
      :pixels, :pointer,
      :userdata, :pointer,
      :locked, :int,
      :lock_data, :pointer,
      :clip_rect, SDL_Rect,
      :map, :pointer,
      :refcount, :int,
    )
  end


  # Function

  def self.setup_surface_symbols()
      attach_function :SDL_CreateRGBSurface, [:uint, :int, :int, :int, :uint, :uint, :uint, :uint], :pointer
      attach_function :SDL_CreateRGBSurfaceWithFormat, [:uint, :int, :int, :int, :uint], :pointer
      attach_function :SDL_CreateRGBSurfaceFrom, [:pointer, :int, :int, :int, :int, :uint, :uint, :uint, :uint], :pointer
      attach_function :SDL_CreateRGBSurfaceWithFormatFrom, [:pointer, :int, :int, :int, :int, :uint], :pointer
      attach_function :SDL_FreeSurface, [:pointer], :void
      attach_function :SDL_SetSurfacePalette, [:pointer, :pointer], :int
      attach_function :SDL_LockSurface, [:pointer], :int
      attach_function :SDL_UnlockSurface, [:pointer], :void
      attach_function :SDL_LoadBMP_RW, [:pointer, :int], :pointer
      attach_function :SDL_SaveBMP_RW, [:pointer, :pointer, :int], :int
      attach_function :SDL_SetSurfaceRLE, [:pointer, :int], :int
      attach_function :SDL_SetColorKey, [:pointer, :int, :uint], :int
      attach_function :SDL_HasColorKey, [:pointer], :int
      attach_function :SDL_GetColorKey, [:pointer, :pointer], :int
      attach_function :SDL_SetSurfaceColorMod, [:pointer, :uchar, :uchar, :uchar], :int
      attach_function :SDL_GetSurfaceColorMod, [:pointer, :pointer, :pointer, :pointer], :int
      attach_function :SDL_SetSurfaceAlphaMod, [:pointer, :uchar], :int
      attach_function :SDL_GetSurfaceAlphaMod, [:pointer, :pointer], :int
      attach_function :SDL_SetSurfaceBlendMode, [:pointer, :int], :int
      attach_function :SDL_GetSurfaceBlendMode, [:pointer, :pointer], :int
      attach_function :SDL_SetClipRect, [:pointer, :pointer], :int
      attach_function :SDL_GetClipRect, [:pointer, :pointer], :void
      attach_function :SDL_DuplicateSurface, [:pointer], :pointer
      attach_function :SDL_ConvertSurface, [:pointer, :pointer, :uint], :pointer
      attach_function :SDL_ConvertSurfaceFormat, [:pointer, :uint, :uint], :pointer
      attach_function :SDL_ConvertPixels, [:int, :int, :uint, :pointer, :int, :uint, :pointer, :int], :int
      attach_function :SDL_FillRect, [:pointer, :pointer, :uint], :int
      attach_function :SDL_FillRects, [:pointer, :pointer, :int, :uint], :int
      attach_function :SDL_UpperBlit, [:pointer, :pointer, :pointer, :pointer], :int
      attach_function :SDL_LowerBlit, [:pointer, :pointer, :pointer, :pointer], :int
      attach_function :SDL_SoftStretch, [:pointer, :pointer, :pointer, :pointer], :int
      attach_function :SDL_UpperBlitScaled, [:pointer, :pointer, :pointer, :pointer], :int
      attach_function :SDL_LowerBlitScaled, [:pointer, :pointer, :pointer, :pointer], :int
      attach_function :SDL_SetYUVConversionMode, [:int], :void
      attach_function :SDL_GetYUVConversionMode, [], :int
      attach_function :SDL_GetYUVConversionModeForResolution, [:int, :int], :int
  end

end

