# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL
  extend FFI::Library
  # Define/Macro

  ALPHA_OPAQUE = 255
  ALPHA_TRANSPARENT = 0

  # Enum

  PIXELTYPE_UNKNOWN = 0
  PIXELTYPE_INDEX1 = 1
  PIXELTYPE_INDEX4 = 2
  PIXELTYPE_INDEX8 = 3
  PIXELTYPE_PACKED8 = 4
  PIXELTYPE_PACKED16 = 5
  PIXELTYPE_PACKED32 = 6
  PIXELTYPE_ARRAYU8 = 7
  PIXELTYPE_ARRAYU16 = 8
  PIXELTYPE_ARRAYU32 = 9
  PIXELTYPE_ARRAYF16 = 10
  PIXELTYPE_ARRAYF32 = 11
  BITMAPORDER_NONE = 0
  BITMAPORDER_4321 = 1
  BITMAPORDER_1234 = 2
  PACKEDORDER_NONE = 0
  PACKEDORDER_XRGB = 1
  PACKEDORDER_RGBX = 2
  PACKEDORDER_ARGB = 3
  PACKEDORDER_RGBA = 4
  PACKEDORDER_XBGR = 5
  PACKEDORDER_BGRX = 6
  PACKEDORDER_ABGR = 7
  PACKEDORDER_BGRA = 8
  ARRAYORDER_NONE = 0
  ARRAYORDER_RGB = 1
  ARRAYORDER_BGR = 2
  PACKEDLAYOUT_NONE = 0
  PACKEDLAYOUT_332 = 1
  PACKEDLAYOUT_4444 = 2
  PACKEDLAYOUT_1555 = 3
  PACKEDLAYOUT_5551 = 4
  PACKEDLAYOUT_565 = 5
  PACKEDLAYOUT_8888 = 6
  PACKEDLAYOUT_2101010 = 7
  PACKEDLAYOUT_1010102 = 8
  PIXELFORMAT_UNKNOWN = 0
  PIXELFORMAT_INDEX1LSB = 286261504
  PIXELFORMAT_INDEX1MSB = 287310080
  PIXELFORMAT_INDEX4LSB = 303039488
  PIXELFORMAT_INDEX4MSB = 304088064
  PIXELFORMAT_INDEX8 = 318769153
  PIXELFORMAT_RGB332 = 336660481
  PIXELFORMAT_XRGB4444 = 353504258
  PIXELFORMAT_RGB444 = 353504258
  PIXELFORMAT_XBGR4444 = 357698562
  PIXELFORMAT_BGR444 = 357698562
  PIXELFORMAT_XRGB1555 = 353570562
  PIXELFORMAT_RGB555 = 353570562
  PIXELFORMAT_XBGR1555 = 357764866
  PIXELFORMAT_BGR555 = 357764866
  PIXELFORMAT_ARGB4444 = 355602434
  PIXELFORMAT_RGBA4444 = 356651010
  PIXELFORMAT_ABGR4444 = 359796738
  PIXELFORMAT_BGRA4444 = 360845314
  PIXELFORMAT_ARGB1555 = 355667970
  PIXELFORMAT_RGBA5551 = 356782082
  PIXELFORMAT_ABGR1555 = 359862274
  PIXELFORMAT_BGRA5551 = 360976386
  PIXELFORMAT_RGB565 = 353701890
  PIXELFORMAT_BGR565 = 357896194
  PIXELFORMAT_RGB24 = 386930691
  PIXELFORMAT_BGR24 = 387979267
  PIXELFORMAT_XRGB8888 = 370546692
  PIXELFORMAT_RGB888 = 370546692
  PIXELFORMAT_RGBX8888 = 371595268
  PIXELFORMAT_XBGR8888 = 374740996
  PIXELFORMAT_BGR888 = 374740996
  PIXELFORMAT_BGRX8888 = 375789572
  PIXELFORMAT_ARGB8888 = 372645892
  PIXELFORMAT_RGBA8888 = 373694468
  PIXELFORMAT_ABGR8888 = 376840196
  PIXELFORMAT_BGRA8888 = 377888772
  PIXELFORMAT_ARGB2101010 = 372711428
  PIXELFORMAT_RGBA32 = 376840196
  PIXELFORMAT_ARGB32 = 377888772
  PIXELFORMAT_BGRA32 = 372645892
  PIXELFORMAT_ABGR32 = 373694468
  PIXELFORMAT_YV12 = 842094169
  PIXELFORMAT_IYUV = 1448433993
  PIXELFORMAT_YUY2 = 844715353
  PIXELFORMAT_UYVY = 1498831189
  PIXELFORMAT_YVYU = 1431918169
  PIXELFORMAT_NV12 = 842094158
  PIXELFORMAT_NV21 = 825382478
  PIXELFORMAT_EXTERNAL_OES = 542328143

  # Typedef

  typedef :int, :SDL_PixelType
  typedef :int, :SDL_BitmapOrder
  typedef :int, :SDL_PackedOrder
  typedef :int, :SDL_ArrayOrder
  typedef :int, :SDL_PackedLayout
  typedef :int, :SDL_PixelFormatEnum

  # Struct

  class Color < FFI::Struct
    layout(
      :r, :uchar,
      :g, :uchar,
      :b, :uchar,
      :a, :uchar,
    )
  end

  class Palette < FFI::Struct
    layout(
      :ncolors, :int,
      :colors, :pointer,
      :version, :uint,
      :refcount, :int,
    )
  end

  class PixelFormat < FFI::Struct
    layout(
      :format, :uint,
      :palette, :pointer,
      :BitsPerPixel, :uchar,
      :BytesPerPixel, :uchar,
      :padding, [:uchar, 2],
      :Rmask, :uint,
      :Gmask, :uint,
      :Bmask, :uint,
      :Amask, :uint,
      :Rloss, :uchar,
      :Gloss, :uchar,
      :Bloss, :uchar,
      :Aloss, :uchar,
      :Rshift, :uchar,
      :Gshift, :uchar,
      :Bshift, :uchar,
      :Ashift, :uchar,
      :refcount, :int,
      :next, :pointer,
    )
  end


  # Function

  def self.setup_pixels_symbols(output_error = false)
    symbols = [
      :SDL_GetPixelFormatName,
      :SDL_GetMasksForPixelFormatEnum,
      :SDL_GetPixelFormatEnumForMasks,
      :SDL_CreatePixelFormat,
      :SDL_DestroyPixelFormat,
      :SDL_CreatePalette,
      :SDL_SetPixelFormatPalette,
      :SDL_SetPaletteColors,
      :SDL_DestroyPalette,
      :SDL_MapRGB,
      :SDL_MapRGBA,
      :SDL_GetRGB,
      :SDL_GetRGBA,
    ]
    apis = {
      :SDL_GetPixelFormatName => :GetPixelFormatName,
      :SDL_GetMasksForPixelFormatEnum => :GetMasksForPixelFormatEnum,
      :SDL_GetPixelFormatEnumForMasks => :GetPixelFormatEnumForMasks,
      :SDL_CreatePixelFormat => :CreatePixelFormat,
      :SDL_DestroyPixelFormat => :DestroyPixelFormat,
      :SDL_CreatePalette => :CreatePalette,
      :SDL_SetPixelFormatPalette => :SetPixelFormatPalette,
      :SDL_SetPaletteColors => :SetPaletteColors,
      :SDL_DestroyPalette => :DestroyPalette,
      :SDL_MapRGB => :MapRGB,
      :SDL_MapRGBA => :MapRGBA,
      :SDL_GetRGB => :GetRGB,
      :SDL_GetRGBA => :GetRGBA,
    }
    args = {
      :SDL_GetPixelFormatName => [:uint],
      :SDL_GetMasksForPixelFormatEnum => [:uint, :pointer, :pointer, :pointer, :pointer, :pointer],
      :SDL_GetPixelFormatEnumForMasks => [:int, :uint, :uint, :uint, :uint],
      :SDL_CreatePixelFormat => [:uint],
      :SDL_DestroyPixelFormat => [:pointer],
      :SDL_CreatePalette => [:int],
      :SDL_SetPixelFormatPalette => [:pointer, :pointer],
      :SDL_SetPaletteColors => [:pointer, :pointer, :int, :int],
      :SDL_DestroyPalette => [:pointer],
      :SDL_MapRGB => [:pointer, :uchar, :uchar, :uchar],
      :SDL_MapRGBA => [:pointer, :uchar, :uchar, :uchar, :uchar],
      :SDL_GetRGB => [:uint, :pointer, :pointer, :pointer, :pointer],
      :SDL_GetRGBA => [:uint, :pointer, :pointer, :pointer, :pointer, :pointer],
    }
    retvals = {
      :SDL_GetPixelFormatName => :pointer,
      :SDL_GetMasksForPixelFormatEnum => :int,
      :SDL_GetPixelFormatEnumForMasks => :uint,
      :SDL_CreatePixelFormat => :pointer,
      :SDL_DestroyPixelFormat => :void,
      :SDL_CreatePalette => :pointer,
      :SDL_SetPixelFormatPalette => :int,
      :SDL_SetPaletteColors => :int,
      :SDL_DestroyPalette => :void,
      :SDL_MapRGB => :uint,
      :SDL_MapRGBA => :uint,
      :SDL_GetRGB => :void,
      :SDL_GetRGBA => :void,
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

