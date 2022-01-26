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
      :SDL_HasSurfaceRLE,
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
      :SDL_PremultiplyAlpha,
      :SDL_FillRect,
      :SDL_FillRects,
      :SDL_UpperBlit,
      :SDL_LowerBlit,
      :SDL_SoftStretch,
      :SDL_SoftStretchLinear,
      :SDL_UpperBlitScaled,
      :SDL_LowerBlitScaled,
      :SDL_SetYUVConversionMode,
      :SDL_GetYUVConversionMode,
      :SDL_GetYUVConversionModeForResolution,
    ]
    apis = {
      :SDL_CreateRGBSurface => :CreateRGBSurface,
      :SDL_CreateRGBSurfaceWithFormat => :CreateRGBSurfaceWithFormat,
      :SDL_CreateRGBSurfaceFrom => :CreateRGBSurfaceFrom,
      :SDL_CreateRGBSurfaceWithFormatFrom => :CreateRGBSurfaceWithFormatFrom,
      :SDL_FreeSurface => :FreeSurface,
      :SDL_SetSurfacePalette => :SetSurfacePalette,
      :SDL_LockSurface => :LockSurface,
      :SDL_UnlockSurface => :UnlockSurface,
      :SDL_LoadBMP_RW => :LoadBMP_RW,
      :SDL_SaveBMP_RW => :SaveBMP_RW,
      :SDL_SetSurfaceRLE => :SetSurfaceRLE,
      :SDL_HasSurfaceRLE => :HasSurfaceRLE,
      :SDL_SetColorKey => :SetColorKey,
      :SDL_HasColorKey => :HasColorKey,
      :SDL_GetColorKey => :GetColorKey,
      :SDL_SetSurfaceColorMod => :SetSurfaceColorMod,
      :SDL_GetSurfaceColorMod => :GetSurfaceColorMod,
      :SDL_SetSurfaceAlphaMod => :SetSurfaceAlphaMod,
      :SDL_GetSurfaceAlphaMod => :GetSurfaceAlphaMod,
      :SDL_SetSurfaceBlendMode => :SetSurfaceBlendMode,
      :SDL_GetSurfaceBlendMode => :GetSurfaceBlendMode,
      :SDL_SetClipRect => :SetClipRect,
      :SDL_GetClipRect => :GetClipRect,
      :SDL_DuplicateSurface => :DuplicateSurface,
      :SDL_ConvertSurface => :ConvertSurface,
      :SDL_ConvertSurfaceFormat => :ConvertSurfaceFormat,
      :SDL_ConvertPixels => :ConvertPixels,
      :SDL_PremultiplyAlpha => :PremultiplyAlpha,
      :SDL_FillRect => :FillRect,
      :SDL_FillRects => :FillRects,
      :SDL_UpperBlit => :UpperBlit,
      :SDL_LowerBlit => :LowerBlit,
      :SDL_SoftStretch => :SoftStretch,
      :SDL_SoftStretchLinear => :SoftStretchLinear,
      :SDL_UpperBlitScaled => :UpperBlitScaled,
      :SDL_LowerBlitScaled => :LowerBlitScaled,
      :SDL_SetYUVConversionMode => :SetYUVConversionMode,
      :SDL_GetYUVConversionMode => :GetYUVConversionMode,
      :SDL_GetYUVConversionModeForResolution => :GetYUVConversionModeForResolution,
    }
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
      :SDL_HasSurfaceRLE => [:pointer],
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
      :SDL_PremultiplyAlpha => [:int, :int, :uint, :pointer, :int, :uint, :pointer, :int],
      :SDL_FillRect => [:pointer, :pointer, :uint],
      :SDL_FillRects => [:pointer, :pointer, :int, :uint],
      :SDL_UpperBlit => [:pointer, :pointer, :pointer, :pointer],
      :SDL_LowerBlit => [:pointer, :pointer, :pointer, :pointer],
      :SDL_SoftStretch => [:pointer, :pointer, :pointer, :pointer],
      :SDL_SoftStretchLinear => [:pointer, :pointer, :pointer, :pointer],
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
      :SDL_HasSurfaceRLE => :int,
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
      :SDL_PremultiplyAlpha => :int,
      :SDL_FillRect => :int,
      :SDL_FillRects => :int,
      :SDL_UpperBlit => :int,
      :SDL_LowerBlit => :int,
      :SDL_SoftStretch => :int,
      :SDL_SoftStretchLinear => :int,
      :SDL_UpperBlitScaled => :int,
      :SDL_LowerBlitScaled => :int,
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

