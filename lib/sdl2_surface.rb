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
    symbols = [
      :SDL_CreateRGBSurface,
      :SDL_CreateRGBSurfaceWithFormat,
      :SDL_CreateRGBSurfaceFrom,
      :SDL_CreateRGBSurfaceWithFormatFrom,
      :SDL_FreeSurface,
      :SDL_SetSurfacePalette,
      :SDL_LockSurface,
      :SDL_UnlockSurface,
      :SDL_LoadBMP_RW,
      :SDL_SaveBMP_RW,
      :SDL_SetSurfaceRLE,
      :SDL_SetColorKey,
      :SDL_HasColorKey,
      :SDL_GetColorKey,
      :SDL_SetSurfaceColorMod,
      :SDL_GetSurfaceColorMod,
      :SDL_SetSurfaceAlphaMod,
      :SDL_GetSurfaceAlphaMod,
      :SDL_SetSurfaceBlendMode,
      :SDL_GetSurfaceBlendMode,
      :SDL_SetClipRect,
      :SDL_GetClipRect,
      :SDL_DuplicateSurface,
      :SDL_ConvertSurface,
      :SDL_ConvertSurfaceFormat,
      :SDL_ConvertPixels,
      :SDL_FillRect,
      :SDL_FillRects,
      :SDL_UpperBlit,
      :SDL_LowerBlit,
      :SDL_SoftStretch,
      :SDL_UpperBlitScaled,
      :SDL_LowerBlitScaled,
      :SDL_SetYUVConversionMode,
      :SDL_GetYUVConversionMode,
      :SDL_GetYUVConversionModeForResolution,
    ]
    args = {
      :SDL_CreateRGBSurface => [:uint, :int, :int, :int, :uint, :uint, :uint, :uint],
      :SDL_CreateRGBSurfaceWithFormat => [:uint, :int, :int, :int, :uint],
      :SDL_CreateRGBSurfaceFrom => [:pointer, :int, :int, :int, :int, :uint, :uint, :uint, :uint],
      :SDL_CreateRGBSurfaceWithFormatFrom => [:pointer, :int, :int, :int, :int, :uint],
      :SDL_FreeSurface => [:pointer],
      :SDL_SetSurfacePalette => [:pointer, :pointer],
      :SDL_LockSurface => [:pointer],
      :SDL_UnlockSurface => [:pointer],
      :SDL_LoadBMP_RW => [:pointer, :int],
      :SDL_SaveBMP_RW => [:pointer, :pointer, :int],
      :SDL_SetSurfaceRLE => [:pointer, :int],
      :SDL_SetColorKey => [:pointer, :int, :uint],
      :SDL_HasColorKey => [:pointer],
      :SDL_GetColorKey => [:pointer, :pointer],
      :SDL_SetSurfaceColorMod => [:pointer, :uchar, :uchar, :uchar],
      :SDL_GetSurfaceColorMod => [:pointer, :pointer, :pointer, :pointer],
      :SDL_SetSurfaceAlphaMod => [:pointer, :uchar],
      :SDL_GetSurfaceAlphaMod => [:pointer, :pointer],
      :SDL_SetSurfaceBlendMode => [:pointer, :int],
      :SDL_GetSurfaceBlendMode => [:pointer, :pointer],
      :SDL_SetClipRect => [:pointer, :pointer],
      :SDL_GetClipRect => [:pointer, :pointer],
      :SDL_DuplicateSurface => [:pointer],
      :SDL_ConvertSurface => [:pointer, :pointer, :uint],
      :SDL_ConvertSurfaceFormat => [:pointer, :uint, :uint],
      :SDL_ConvertPixels => [:int, :int, :uint, :pointer, :int, :uint, :pointer, :int],
      :SDL_FillRect => [:pointer, :pointer, :uint],
      :SDL_FillRects => [:pointer, :pointer, :int, :uint],
      :SDL_UpperBlit => [:pointer, :pointer, :pointer, :pointer],
      :SDL_LowerBlit => [:pointer, :pointer, :pointer, :pointer],
      :SDL_SoftStretch => [:pointer, :pointer, :pointer, :pointer],
      :SDL_UpperBlitScaled => [:pointer, :pointer, :pointer, :pointer],
      :SDL_LowerBlitScaled => [:pointer, :pointer, :pointer, :pointer],
      :SDL_SetYUVConversionMode => [:int],
      :SDL_GetYUVConversionMode => [],
      :SDL_GetYUVConversionModeForResolution => [:int, :int],
    }
    retvals = {
      :SDL_CreateRGBSurface => :pointer,
      :SDL_CreateRGBSurfaceWithFormat => :pointer,
      :SDL_CreateRGBSurfaceFrom => :pointer,
      :SDL_CreateRGBSurfaceWithFormatFrom => :pointer,
      :SDL_FreeSurface => :void,
      :SDL_SetSurfacePalette => :int,
      :SDL_LockSurface => :int,
      :SDL_UnlockSurface => :void,
      :SDL_LoadBMP_RW => :pointer,
      :SDL_SaveBMP_RW => :int,
      :SDL_SetSurfaceRLE => :int,
      :SDL_SetColorKey => :int,
      :SDL_HasColorKey => :int,
      :SDL_GetColorKey => :int,
      :SDL_SetSurfaceColorMod => :int,
      :SDL_GetSurfaceColorMod => :int,
      :SDL_SetSurfaceAlphaMod => :int,
      :SDL_GetSurfaceAlphaMod => :int,
      :SDL_SetSurfaceBlendMode => :int,
      :SDL_GetSurfaceBlendMode => :int,
      :SDL_SetClipRect => :int,
      :SDL_GetClipRect => :void,
      :SDL_DuplicateSurface => :pointer,
      :SDL_ConvertSurface => :pointer,
      :SDL_ConvertSurfaceFormat => :pointer,
      :SDL_ConvertPixels => :int,
      :SDL_FillRect => :int,
      :SDL_FillRects => :int,
      :SDL_UpperBlit => :int,
      :SDL_LowerBlit => :int,
      :SDL_SoftStretch => :int,
      :SDL_UpperBlitScaled => :int,
      :SDL_LowerBlitScaled => :int,
      :SDL_SetYUVConversionMode => :void,
      :SDL_GetYUVConversionMode => :int,
      :SDL_GetYUVConversionModeForResolution => :int,
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

