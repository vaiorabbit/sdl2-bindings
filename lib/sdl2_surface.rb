# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'
require_relative 'sdl2_rect'

module SDL
  extend FFI::Library
  # Define/Macro

  SWSURFACE = 0
  PREALLOC = 0x00000001
  RLEACCEL = 0x00000002
  DONTFREE = 0x00000004
  SIMD_ALIGNED = 0x00000008

  # Enum

  YUV_CONVERSION_JPEG = 0
  YUV_CONVERSION_BT601 = 1
  YUV_CONVERSION_BT709 = 2
  YUV_CONVERSION_AUTOMATIC = 3

  # Typedef

  callback :SDL_blit, [:pointer, :pointer, :pointer, :pointer], :int
  typedef :int, :SDL_YUV_CONVERSION_MODE

  # Struct

  class Surface < FFI::Struct
    layout(
      :flags, :uint,
      :format, :pointer,
      :w, :int,
      :h, :int,
      :pitch, :int,
      :pixels, :pointer,
      :userdata, :pointer,
      :locked, :int,
      :list_blitmap, :pointer,
      :clip_rect, Rect,
      :map, :pointer,
      :refcount, :int,
    )
  end


  # Function

  def self.setup_surface_symbols(output_error = false)
    symbols = [
      :SDL_CreateSurface,
      :SDL_CreateSurfaceFrom,
      :SDL_DestroySurface,
      :SDL_SetSurfacePalette,
      :SDL_LockSurface,
      :SDL_UnlockSurface,
      :SDL_LoadBMP_RW,
      :SDL_SaveBMP_RW,
      :SDL_SetSurfaceRLE,
      :SDL_SurfaceHasRLE,
      :SDL_SetSurfaceColorKey,
      :SDL_SurfaceHasColorKey,
      :SDL_GetSurfaceColorKey,
      :SDL_SetSurfaceColorMod,
      :SDL_GetSurfaceColorMod,
      :SDL_SetSurfaceAlphaMod,
      :SDL_GetSurfaceAlphaMod,
      :SDL_SetSurfaceBlendMode,
      :SDL_GetSurfaceBlendMode,
      :SDL_SetSurfaceClipRect,
      :SDL_GetSurfaceClipRect,
      :SDL_DuplicateSurface,
      :SDL_ConvertSurface,
      :SDL_ConvertSurfaceFormat,
      :SDL_ConvertPixels,
      :SDL_PremultiplyAlpha,
      :SDL_FillSurfaceRect,
      :SDL_FillSurfaceRects,
      :SDL_BlitSurface,
      :SDL_BlitSurfaceUnchecked,
      :SDL_SoftStretch,
      :SDL_SoftStretchLinear,
      :SDL_BlitSurfaceScaled,
      :SDL_BlitSurfaceUncheckedScaled,
      :SDL_SetYUVConversionMode,
      :SDL_GetYUVConversionMode,
      :SDL_GetYUVConversionModeForResolution,
    ]
    apis = {
      :SDL_CreateSurface => :CreateSurface,
      :SDL_CreateSurfaceFrom => :CreateSurfaceFrom,
      :SDL_DestroySurface => :DestroySurface,
      :SDL_SetSurfacePalette => :SetSurfacePalette,
      :SDL_LockSurface => :LockSurface,
      :SDL_UnlockSurface => :UnlockSurface,
      :SDL_LoadBMP_RW => :LoadBMP_RW,
      :SDL_SaveBMP_RW => :SaveBMP_RW,
      :SDL_SetSurfaceRLE => :SetSurfaceRLE,
      :SDL_SurfaceHasRLE => :SurfaceHasRLE,
      :SDL_SetSurfaceColorKey => :SetSurfaceColorKey,
      :SDL_SurfaceHasColorKey => :SurfaceHasColorKey,
      :SDL_GetSurfaceColorKey => :GetSurfaceColorKey,
      :SDL_SetSurfaceColorMod => :SetSurfaceColorMod,
      :SDL_GetSurfaceColorMod => :GetSurfaceColorMod,
      :SDL_SetSurfaceAlphaMod => :SetSurfaceAlphaMod,
      :SDL_GetSurfaceAlphaMod => :GetSurfaceAlphaMod,
      :SDL_SetSurfaceBlendMode => :SetSurfaceBlendMode,
      :SDL_GetSurfaceBlendMode => :GetSurfaceBlendMode,
      :SDL_SetSurfaceClipRect => :SetSurfaceClipRect,
      :SDL_GetSurfaceClipRect => :GetSurfaceClipRect,
      :SDL_DuplicateSurface => :DuplicateSurface,
      :SDL_ConvertSurface => :ConvertSurface,
      :SDL_ConvertSurfaceFormat => :ConvertSurfaceFormat,
      :SDL_ConvertPixels => :ConvertPixels,
      :SDL_PremultiplyAlpha => :PremultiplyAlpha,
      :SDL_FillSurfaceRect => :FillSurfaceRect,
      :SDL_FillSurfaceRects => :FillSurfaceRects,
      :SDL_BlitSurface => :BlitSurface,
      :SDL_BlitSurfaceUnchecked => :BlitSurfaceUnchecked,
      :SDL_SoftStretch => :SoftStretch,
      :SDL_SoftStretchLinear => :SoftStretchLinear,
      :SDL_BlitSurfaceScaled => :BlitSurfaceScaled,
      :SDL_BlitSurfaceUncheckedScaled => :BlitSurfaceUncheckedScaled,
      :SDL_SetYUVConversionMode => :SetYUVConversionMode,
      :SDL_GetYUVConversionMode => :GetYUVConversionMode,
      :SDL_GetYUVConversionModeForResolution => :GetYUVConversionModeForResolution,
    }
    args = {
      :SDL_CreateSurface => [:int, :int, :uint],
      :SDL_CreateSurfaceFrom => [:pointer, :int, :int, :int, :uint],
      :SDL_DestroySurface => [:pointer],
      :SDL_SetSurfacePalette => [:pointer, :pointer],
      :SDL_LockSurface => [:pointer],
      :SDL_UnlockSurface => [:pointer],
      :SDL_LoadBMP_RW => [:pointer, :int],
      :SDL_SaveBMP_RW => [:pointer, :pointer, :int],
      :SDL_SetSurfaceRLE => [:pointer, :int],
      :SDL_SurfaceHasRLE => [:pointer],
      :SDL_SetSurfaceColorKey => [:pointer, :int, :uint],
      :SDL_SurfaceHasColorKey => [:pointer],
      :SDL_GetSurfaceColorKey => [:pointer, :pointer],
      :SDL_SetSurfaceColorMod => [:pointer, :uchar, :uchar, :uchar],
      :SDL_GetSurfaceColorMod => [:pointer, :pointer, :pointer, :pointer],
      :SDL_SetSurfaceAlphaMod => [:pointer, :uchar],
      :SDL_GetSurfaceAlphaMod => [:pointer, :pointer],
      :SDL_SetSurfaceBlendMode => [:pointer, :int],
      :SDL_GetSurfaceBlendMode => [:pointer, :pointer],
      :SDL_SetSurfaceClipRect => [:pointer, :pointer],
      :SDL_GetSurfaceClipRect => [:pointer, :pointer],
      :SDL_DuplicateSurface => [:pointer],
      :SDL_ConvertSurface => [:pointer, :pointer],
      :SDL_ConvertSurfaceFormat => [:pointer, :uint],
      :SDL_ConvertPixels => [:int, :int, :uint, :pointer, :int, :uint, :pointer, :int],
      :SDL_PremultiplyAlpha => [:int, :int, :uint, :pointer, :int, :uint, :pointer, :int],
      :SDL_FillSurfaceRect => [:pointer, :pointer, :uint],
      :SDL_FillSurfaceRects => [:pointer, :pointer, :int, :uint],
      :SDL_BlitSurface => [:pointer, :pointer, :pointer, :pointer],
      :SDL_BlitSurfaceUnchecked => [:pointer, :pointer, :pointer, :pointer],
      :SDL_SoftStretch => [:pointer, :pointer, :pointer, :pointer],
      :SDL_SoftStretchLinear => [:pointer, :pointer, :pointer, :pointer],
      :SDL_BlitSurfaceScaled => [:pointer, :pointer, :pointer, :pointer],
      :SDL_BlitSurfaceUncheckedScaled => [:pointer, :pointer, :pointer, :pointer],
      :SDL_SetYUVConversionMode => [:int],
      :SDL_GetYUVConversionMode => [],
      :SDL_GetYUVConversionModeForResolution => [:int, :int],
    }
    retvals = {
      :SDL_CreateSurface => :pointer,
      :SDL_CreateSurfaceFrom => :pointer,
      :SDL_DestroySurface => :void,
      :SDL_SetSurfacePalette => :int,
      :SDL_LockSurface => :int,
      :SDL_UnlockSurface => :void,
      :SDL_LoadBMP_RW => :pointer,
      :SDL_SaveBMP_RW => :int,
      :SDL_SetSurfaceRLE => :int,
      :SDL_SurfaceHasRLE => :int,
      :SDL_SetSurfaceColorKey => :int,
      :SDL_SurfaceHasColorKey => :int,
      :SDL_GetSurfaceColorKey => :int,
      :SDL_SetSurfaceColorMod => :int,
      :SDL_GetSurfaceColorMod => :int,
      :SDL_SetSurfaceAlphaMod => :int,
      :SDL_GetSurfaceAlphaMod => :int,
      :SDL_SetSurfaceBlendMode => :int,
      :SDL_GetSurfaceBlendMode => :int,
      :SDL_SetSurfaceClipRect => :int,
      :SDL_GetSurfaceClipRect => :int,
      :SDL_DuplicateSurface => :pointer,
      :SDL_ConvertSurface => :pointer,
      :SDL_ConvertSurfaceFormat => :pointer,
      :SDL_ConvertPixels => :int,
      :SDL_PremultiplyAlpha => :int,
      :SDL_FillSurfaceRect => :int,
      :SDL_FillSurfaceRects => :int,
      :SDL_BlitSurface => :int,
      :SDL_BlitSurfaceUnchecked => :int,
      :SDL_SoftStretch => :int,
      :SDL_SoftStretchLinear => :int,
      :SDL_BlitSurfaceScaled => :int,
      :SDL_BlitSurfaceUncheckedScaled => :int,
      :SDL_SetYUVConversionMode => :void,
      :SDL_GetYUVConversionMode => :int,
      :SDL_GetYUVConversionModeForResolution => :int,
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

