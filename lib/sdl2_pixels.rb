# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL2
  extend FFI::Library
  # Define/Macro

  SDL_ALPHA_OPAQUE = 255
  SDL_ALPHA_TRANSPARENT = 0

  # Enum

  SDL_PIXELTYPE_UNKNOWN = 0
  SDL_PIXELTYPE_INDEX1 = 1
  SDL_PIXELTYPE_INDEX4 = 2
  SDL_PIXELTYPE_INDEX8 = 3
  SDL_PIXELTYPE_PACKED8 = 4
  SDL_PIXELTYPE_PACKED16 = 5
  SDL_PIXELTYPE_PACKED32 = 6
  SDL_PIXELTYPE_ARRAYU8 = 7
  SDL_PIXELTYPE_ARRAYU16 = 8
  SDL_PIXELTYPE_ARRAYU32 = 9
  SDL_PIXELTYPE_ARRAYF16 = 10
  SDL_PIXELTYPE_ARRAYF32 = 11
  SDL_BITMAPORDER_NONE = 0
  SDL_BITMAPORDER_4321 = 1
  SDL_BITMAPORDER_1234 = 2
  SDL_PACKEDORDER_NONE = 0
  SDL_PACKEDORDER_XRGB = 1
  SDL_PACKEDORDER_RGBX = 2
  SDL_PACKEDORDER_ARGB = 3
  SDL_PACKEDORDER_RGBA = 4
  SDL_PACKEDORDER_XBGR = 5
  SDL_PACKEDORDER_BGRX = 6
  SDL_PACKEDORDER_ABGR = 7
  SDL_PACKEDORDER_BGRA = 8
  SDL_ARRAYORDER_NONE = 0
  SDL_ARRAYORDER_RGB = 1
  SDL_ARRAYORDER_RGBA = 2
  SDL_ARRAYORDER_ARGB = 3
  SDL_ARRAYORDER_BGR = 4
  SDL_ARRAYORDER_BGRA = 5
  SDL_ARRAYORDER_ABGR = 6
  SDL_PACKEDLAYOUT_NONE = 0
  SDL_PACKEDLAYOUT_332 = 1
  SDL_PACKEDLAYOUT_4444 = 2
  SDL_PACKEDLAYOUT_1555 = 3
  SDL_PACKEDLAYOUT_5551 = 4
  SDL_PACKEDLAYOUT_565 = 5
  SDL_PACKEDLAYOUT_8888 = 6
  SDL_PACKEDLAYOUT_2101010 = 7
  SDL_PACKEDLAYOUT_1010102 = 8
  SDL_PIXELFORMAT_UNKNOWN = 0
  SDL_PIXELFORMAT_INDEX1LSB = 286261504
  SDL_PIXELFORMAT_INDEX1MSB = 287310080
  SDL_PIXELFORMAT_INDEX4LSB = 303039488
  SDL_PIXELFORMAT_INDEX4MSB = 304088064
  SDL_PIXELFORMAT_INDEX8 = 318769153
  SDL_PIXELFORMAT_RGB332 = 336660481
  SDL_PIXELFORMAT_RGB444 = 353504258
  SDL_PIXELFORMAT_RGB555 = 353570562
  SDL_PIXELFORMAT_BGR555 = 357764866
  SDL_PIXELFORMAT_ARGB4444 = 355602434
  SDL_PIXELFORMAT_RGBA4444 = 356651010
  SDL_PIXELFORMAT_ABGR4444 = 359796738
  SDL_PIXELFORMAT_BGRA4444 = 360845314
  SDL_PIXELFORMAT_ARGB1555 = 355667970
  SDL_PIXELFORMAT_RGBA5551 = 356782082
  SDL_PIXELFORMAT_ABGR1555 = 359862274
  SDL_PIXELFORMAT_BGRA5551 = 360976386
  SDL_PIXELFORMAT_RGB565 = 353701890
  SDL_PIXELFORMAT_BGR565 = 357896194
  SDL_PIXELFORMAT_RGB24 = 386930691
  SDL_PIXELFORMAT_BGR24 = 390076419
  SDL_PIXELFORMAT_RGB888 = 370546692
  SDL_PIXELFORMAT_RGBX8888 = 371595268
  SDL_PIXELFORMAT_BGR888 = 374740996
  SDL_PIXELFORMAT_BGRX8888 = 375789572
  SDL_PIXELFORMAT_ARGB8888 = 372645892
  SDL_PIXELFORMAT_RGBA8888 = 373694468
  SDL_PIXELFORMAT_ABGR8888 = 376840196
  SDL_PIXELFORMAT_BGRA8888 = 377888772
  SDL_PIXELFORMAT_ARGB2101010 = 372711428
  SDL_PIXELFORMAT_RGBA32 = 376840196
  SDL_PIXELFORMAT_ARGB32 = 377888772
  SDL_PIXELFORMAT_BGRA32 = 372645892
  SDL_PIXELFORMAT_ABGR32 = 373694468
  SDL_PIXELFORMAT_YV12 = 842094169
  SDL_PIXELFORMAT_IYUV = 1448433993
  SDL_PIXELFORMAT_YUY2 = 844715353
  SDL_PIXELFORMAT_UYVY = 1498831189
  SDL_PIXELFORMAT_YVYU = 1431918169
  SDL_PIXELFORMAT_NV12 = 842094158
  SDL_PIXELFORMAT_NV21 = 825382478
  SDL_PIXELFORMAT_EXTERNAL_OES = 542328143

  # Typedef

  typedef :int, :SDL_PixelFormatEnum

  # Struct

  class SDL_Color < FFI::Struct
    layout(
      :r, :uchar,
      :g, :uchar,
      :b, :uchar,
      :a, :uchar,
    )
  end

  class SDL_Palette < FFI::Struct
    layout(
      :ncolors, :int,
      :colors, :pointer,
      :version, :uint,
      :refcount, :int,
    )
  end

  class SDL_PixelFormat < FFI::Struct
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

  def self.setup_pixels_symbols()
    symbols = [
      :SDL_GetPixelFormatName,
      :SDL_PixelFormatEnumToMasks,
      :SDL_MasksToPixelFormatEnum,
      :SDL_AllocFormat,
      :SDL_FreeFormat,
      :SDL_AllocPalette,
      :SDL_SetPixelFormatPalette,
      :SDL_SetPaletteColors,
      :SDL_FreePalette,
      :SDL_MapRGB,
      :SDL_MapRGBA,
      :SDL_GetRGB,
      :SDL_GetRGBA,
      :SDL_CalculateGammaRamp,
    ]
    args = {
      :SDL_GetPixelFormatName => [:uint],
      :SDL_PixelFormatEnumToMasks => [:uint, :pointer, :pointer, :pointer, :pointer, :pointer],
      :SDL_MasksToPixelFormatEnum => [:int, :uint, :uint, :uint, :uint],
      :SDL_AllocFormat => [:uint],
      :SDL_FreeFormat => [:pointer],
      :SDL_AllocPalette => [:int],
      :SDL_SetPixelFormatPalette => [:pointer, :pointer],
      :SDL_SetPaletteColors => [:pointer, :pointer, :int, :int],
      :SDL_FreePalette => [:pointer],
      :SDL_MapRGB => [:pointer, :uchar, :uchar, :uchar],
      :SDL_MapRGBA => [:pointer, :uchar, :uchar, :uchar, :uchar],
      :SDL_GetRGB => [:uint, :pointer, :pointer, :pointer, :pointer],
      :SDL_GetRGBA => [:uint, :pointer, :pointer, :pointer, :pointer, :pointer],
      :SDL_CalculateGammaRamp => [:float, :pointer],
    }
    retvals = {
      :SDL_GetPixelFormatName => :pointer,
      :SDL_PixelFormatEnumToMasks => :int,
      :SDL_MasksToPixelFormatEnum => :uint,
      :SDL_AllocFormat => :pointer,
      :SDL_FreeFormat => :void,
      :SDL_AllocPalette => :pointer,
      :SDL_SetPixelFormatPalette => :int,
      :SDL_SetPaletteColors => :int,
      :SDL_FreePalette => :void,
      :SDL_MapRGB => :uint,
      :SDL_MapRGBA => :uint,
      :SDL_GetRGB => :void,
      :SDL_GetRGBA => :void,
      :SDL_CalculateGammaRamp => :void,
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

