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

  TTF_MAJOR_VERSION = 2
  TTF_MINOR_VERSION = 20
  TTF_PATCHLEVEL = 0
  TTF_STYLE_NORMAL = 0x00
  TTF_STYLE_BOLD = 0x01
  TTF_STYLE_ITALIC = 0x02
  TTF_STYLE_UNDERLINE = 0x04
  TTF_STYLE_STRIKETHROUGH = 0x08
  TTF_HINTING_NORMAL = 0
  TTF_HINTING_LIGHT = 1
  TTF_HINTING_MONO = 2
  TTF_HINTING_NONE = 3
  TTF_HINTING_LIGHT_SUBPIXEL = 4
  TTF_WRAPPED_ALIGN_LEFT = 0
  TTF_WRAPPED_ALIGN_CENTER = 1
  TTF_WRAPPED_ALIGN_RIGHT = 2

  # Enum

  TTF_DIRECTION_LTR = 0
  TTF_DIRECTION_RTL = 1
  TTF_DIRECTION_TTB = 2
  TTF_DIRECTION_BTT = 3

  # Typedef

  typedef :int, :TTF_Direction

  # Struct


  # Function

  def self.setup_ttf_symbols(output_error = false)
    symbols = [
      :TTF_Linked_Version,
      :TTF_GetFreeTypeVersion,
      :TTF_GetHarfBuzzVersion,
      :TTF_ByteSwappedUNICODE,
      :TTF_Init,
      :TTF_OpenFont,
      :TTF_OpenFontIndex,
      :TTF_OpenFontRW,
      :TTF_OpenFontIndexRW,
      :TTF_OpenFontDPI,
      :TTF_OpenFontIndexDPI,
      :TTF_OpenFontDPIRW,
      :TTF_OpenFontIndexDPIRW,
      :TTF_SetFontSize,
      :TTF_SetFontSizeDPI,
      :TTF_GetFontStyle,
      :TTF_SetFontStyle,
      :TTF_GetFontOutline,
      :TTF_SetFontOutline,
      :TTF_GetFontHinting,
      :TTF_SetFontHinting,
      :TTF_GetFontWrappedAlign,
      :TTF_SetFontWrappedAlign,
      :TTF_FontHeight,
      :TTF_FontAscent,
      :TTF_FontDescent,
      :TTF_FontLineSkip,
      :TTF_GetFontKerning,
      :TTF_SetFontKerning,
      :TTF_FontFaces,
      :TTF_FontFaceIsFixedWidth,
      :TTF_FontFaceFamilyName,
      :TTF_FontFaceStyleName,
      :TTF_GlyphIsProvided,
      :TTF_GlyphIsProvided32,
      :TTF_GlyphMetrics,
      :TTF_GlyphMetrics32,
      :TTF_SizeText,
      :TTF_SizeUTF8,
      :TTF_SizeUNICODE,
      :TTF_MeasureText,
      :TTF_MeasureUTF8,
      :TTF_MeasureUNICODE,
      :TTF_RenderText_Solid,
      :TTF_RenderUTF8_Solid,
      :TTF_RenderUNICODE_Solid,
      :TTF_RenderText_Solid_Wrapped,
      :TTF_RenderUTF8_Solid_Wrapped,
      :TTF_RenderUNICODE_Solid_Wrapped,
      :TTF_RenderGlyph_Solid,
      :TTF_RenderGlyph32_Solid,
      :TTF_RenderText_Shaded,
      :TTF_RenderUTF8_Shaded,
      :TTF_RenderUNICODE_Shaded,
      :TTF_RenderText_Shaded_Wrapped,
      :TTF_RenderUTF8_Shaded_Wrapped,
      :TTF_RenderUNICODE_Shaded_Wrapped,
      :TTF_RenderGlyph_Shaded,
      :TTF_RenderGlyph32_Shaded,
      :TTF_RenderText_Blended,
      :TTF_RenderUTF8_Blended,
      :TTF_RenderUNICODE_Blended,
      :TTF_RenderText_Blended_Wrapped,
      :TTF_RenderUTF8_Blended_Wrapped,
      :TTF_RenderUNICODE_Blended_Wrapped,
      :TTF_RenderGlyph_Blended,
      :TTF_RenderGlyph32_Blended,
      :TTF_RenderText_LCD,
      :TTF_RenderUTF8_LCD,
      :TTF_RenderUNICODE_LCD,
      :TTF_RenderText_LCD_Wrapped,
      :TTF_RenderUTF8_LCD_Wrapped,
      :TTF_RenderUNICODE_LCD_Wrapped,
      :TTF_RenderGlyph_LCD,
      :TTF_RenderGlyph32_LCD,
      :TTF_CloseFont,
      :TTF_Quit,
      :TTF_WasInit,
      :TTF_GetFontKerningSize,
      :TTF_GetFontKerningSizeGlyphs,
      :TTF_GetFontKerningSizeGlyphs32,
      :TTF_SetFontSDF,
      :TTF_GetFontSDF,
      :TTF_SetDirection,
      :TTF_SetScript,
      :TTF_SetFontDirection,
      :TTF_SetFontScriptName,
    ]
    apis = {
      :TTF_Linked_Version => :TTF_Linked_Version,
      :TTF_GetFreeTypeVersion => :TTF_GetFreeTypeVersion,
      :TTF_GetHarfBuzzVersion => :TTF_GetHarfBuzzVersion,
      :TTF_ByteSwappedUNICODE => :TTF_ByteSwappedUNICODE,
      :TTF_Init => :TTF_Init,
      :TTF_OpenFont => :TTF_OpenFont,
      :TTF_OpenFontIndex => :TTF_OpenFontIndex,
      :TTF_OpenFontRW => :TTF_OpenFontRW,
      :TTF_OpenFontIndexRW => :TTF_OpenFontIndexRW,
      :TTF_OpenFontDPI => :TTF_OpenFontDPI,
      :TTF_OpenFontIndexDPI => :TTF_OpenFontIndexDPI,
      :TTF_OpenFontDPIRW => :TTF_OpenFontDPIRW,
      :TTF_OpenFontIndexDPIRW => :TTF_OpenFontIndexDPIRW,
      :TTF_SetFontSize => :TTF_SetFontSize,
      :TTF_SetFontSizeDPI => :TTF_SetFontSizeDPI,
      :TTF_GetFontStyle => :TTF_GetFontStyle,
      :TTF_SetFontStyle => :TTF_SetFontStyle,
      :TTF_GetFontOutline => :TTF_GetFontOutline,
      :TTF_SetFontOutline => :TTF_SetFontOutline,
      :TTF_GetFontHinting => :TTF_GetFontHinting,
      :TTF_SetFontHinting => :TTF_SetFontHinting,
      :TTF_GetFontWrappedAlign => :TTF_GetFontWrappedAlign,
      :TTF_SetFontWrappedAlign => :TTF_SetFontWrappedAlign,
      :TTF_FontHeight => :TTF_FontHeight,
      :TTF_FontAscent => :TTF_FontAscent,
      :TTF_FontDescent => :TTF_FontDescent,
      :TTF_FontLineSkip => :TTF_FontLineSkip,
      :TTF_GetFontKerning => :TTF_GetFontKerning,
      :TTF_SetFontKerning => :TTF_SetFontKerning,
      :TTF_FontFaces => :TTF_FontFaces,
      :TTF_FontFaceIsFixedWidth => :TTF_FontFaceIsFixedWidth,
      :TTF_FontFaceFamilyName => :TTF_FontFaceFamilyName,
      :TTF_FontFaceStyleName => :TTF_FontFaceStyleName,
      :TTF_GlyphIsProvided => :TTF_GlyphIsProvided,
      :TTF_GlyphIsProvided32 => :TTF_GlyphIsProvided32,
      :TTF_GlyphMetrics => :TTF_GlyphMetrics,
      :TTF_GlyphMetrics32 => :TTF_GlyphMetrics32,
      :TTF_SizeText => :TTF_SizeText,
      :TTF_SizeUTF8 => :TTF_SizeUTF8,
      :TTF_SizeUNICODE => :TTF_SizeUNICODE,
      :TTF_MeasureText => :TTF_MeasureText,
      :TTF_MeasureUTF8 => :TTF_MeasureUTF8,
      :TTF_MeasureUNICODE => :TTF_MeasureUNICODE,
      :TTF_RenderText_Solid => :TTF_RenderText_Solid,
      :TTF_RenderUTF8_Solid => :TTF_RenderUTF8_Solid,
      :TTF_RenderUNICODE_Solid => :TTF_RenderUNICODE_Solid,
      :TTF_RenderText_Solid_Wrapped => :TTF_RenderText_Solid_Wrapped,
      :TTF_RenderUTF8_Solid_Wrapped => :TTF_RenderUTF8_Solid_Wrapped,
      :TTF_RenderUNICODE_Solid_Wrapped => :TTF_RenderUNICODE_Solid_Wrapped,
      :TTF_RenderGlyph_Solid => :TTF_RenderGlyph_Solid,
      :TTF_RenderGlyph32_Solid => :TTF_RenderGlyph32_Solid,
      :TTF_RenderText_Shaded => :TTF_RenderText_Shaded,
      :TTF_RenderUTF8_Shaded => :TTF_RenderUTF8_Shaded,
      :TTF_RenderUNICODE_Shaded => :TTF_RenderUNICODE_Shaded,
      :TTF_RenderText_Shaded_Wrapped => :TTF_RenderText_Shaded_Wrapped,
      :TTF_RenderUTF8_Shaded_Wrapped => :TTF_RenderUTF8_Shaded_Wrapped,
      :TTF_RenderUNICODE_Shaded_Wrapped => :TTF_RenderUNICODE_Shaded_Wrapped,
      :TTF_RenderGlyph_Shaded => :TTF_RenderGlyph_Shaded,
      :TTF_RenderGlyph32_Shaded => :TTF_RenderGlyph32_Shaded,
      :TTF_RenderText_Blended => :TTF_RenderText_Blended,
      :TTF_RenderUTF8_Blended => :TTF_RenderUTF8_Blended,
      :TTF_RenderUNICODE_Blended => :TTF_RenderUNICODE_Blended,
      :TTF_RenderText_Blended_Wrapped => :TTF_RenderText_Blended_Wrapped,
      :TTF_RenderUTF8_Blended_Wrapped => :TTF_RenderUTF8_Blended_Wrapped,
      :TTF_RenderUNICODE_Blended_Wrapped => :TTF_RenderUNICODE_Blended_Wrapped,
      :TTF_RenderGlyph_Blended => :TTF_RenderGlyph_Blended,
      :TTF_RenderGlyph32_Blended => :TTF_RenderGlyph32_Blended,
      :TTF_RenderText_LCD => :TTF_RenderText_LCD,
      :TTF_RenderUTF8_LCD => :TTF_RenderUTF8_LCD,
      :TTF_RenderUNICODE_LCD => :TTF_RenderUNICODE_LCD,
      :TTF_RenderText_LCD_Wrapped => :TTF_RenderText_LCD_Wrapped,
      :TTF_RenderUTF8_LCD_Wrapped => :TTF_RenderUTF8_LCD_Wrapped,
      :TTF_RenderUNICODE_LCD_Wrapped => :TTF_RenderUNICODE_LCD_Wrapped,
      :TTF_RenderGlyph_LCD => :TTF_RenderGlyph_LCD,
      :TTF_RenderGlyph32_LCD => :TTF_RenderGlyph32_LCD,
      :TTF_CloseFont => :TTF_CloseFont,
      :TTF_Quit => :TTF_Quit,
      :TTF_WasInit => :TTF_WasInit,
      :TTF_GetFontKerningSize => :TTF_GetFontKerningSize,
      :TTF_GetFontKerningSizeGlyphs => :TTF_GetFontKerningSizeGlyphs,
      :TTF_GetFontKerningSizeGlyphs32 => :TTF_GetFontKerningSizeGlyphs32,
      :TTF_SetFontSDF => :TTF_SetFontSDF,
      :TTF_GetFontSDF => :TTF_GetFontSDF,
      :TTF_SetDirection => :TTF_SetDirection,
      :TTF_SetScript => :TTF_SetScript,
      :TTF_SetFontDirection => :TTF_SetFontDirection,
      :TTF_SetFontScriptName => :TTF_SetFontScriptName,
    }
    args = {
      :TTF_Linked_Version => [],
      :TTF_GetFreeTypeVersion => [:pointer, :pointer, :pointer],
      :TTF_GetHarfBuzzVersion => [:pointer, :pointer, :pointer],
      :TTF_ByteSwappedUNICODE => [:int],
      :TTF_Init => [],
      :TTF_OpenFont => [:pointer, :int],
      :TTF_OpenFontIndex => [:pointer, :int, :long],
      :TTF_OpenFontRW => [:pointer, :int, :int],
      :TTF_OpenFontIndexRW => [:pointer, :int, :int, :long],
      :TTF_OpenFontDPI => [:pointer, :int, :uint, :uint],
      :TTF_OpenFontIndexDPI => [:pointer, :int, :long, :uint, :uint],
      :TTF_OpenFontDPIRW => [:pointer, :int, :int, :uint, :uint],
      :TTF_OpenFontIndexDPIRW => [:pointer, :int, :int, :long, :uint, :uint],
      :TTF_SetFontSize => [:pointer, :int],
      :TTF_SetFontSizeDPI => [:pointer, :int, :uint, :uint],
      :TTF_GetFontStyle => [:pointer],
      :TTF_SetFontStyle => [:pointer, :int],
      :TTF_GetFontOutline => [:pointer],
      :TTF_SetFontOutline => [:pointer, :int],
      :TTF_GetFontHinting => [:pointer],
      :TTF_SetFontHinting => [:pointer, :int],
      :TTF_GetFontWrappedAlign => [:pointer],
      :TTF_SetFontWrappedAlign => [:pointer, :int],
      :TTF_FontHeight => [:pointer],
      :TTF_FontAscent => [:pointer],
      :TTF_FontDescent => [:pointer],
      :TTF_FontLineSkip => [:pointer],
      :TTF_GetFontKerning => [:pointer],
      :TTF_SetFontKerning => [:pointer, :int],
      :TTF_FontFaces => [:pointer],
      :TTF_FontFaceIsFixedWidth => [:pointer],
      :TTF_FontFaceFamilyName => [:pointer],
      :TTF_FontFaceStyleName => [:pointer],
      :TTF_GlyphIsProvided => [:pointer, :ushort],
      :TTF_GlyphIsProvided32 => [:pointer, :uint],
      :TTF_GlyphMetrics => [:pointer, :ushort, :pointer, :pointer, :pointer, :pointer, :pointer],
      :TTF_GlyphMetrics32 => [:pointer, :uint, :pointer, :pointer, :pointer, :pointer, :pointer],
      :TTF_SizeText => [:pointer, :pointer, :pointer, :pointer],
      :TTF_SizeUTF8 => [:pointer, :pointer, :pointer, :pointer],
      :TTF_SizeUNICODE => [:pointer, :pointer, :pointer, :pointer],
      :TTF_MeasureText => [:pointer, :pointer, :int, :pointer, :pointer],
      :TTF_MeasureUTF8 => [:pointer, :pointer, :int, :pointer, :pointer],
      :TTF_MeasureUNICODE => [:pointer, :pointer, :int, :pointer, :pointer],
      :TTF_RenderText_Solid => [:pointer, :pointer, Color.by_value],
      :TTF_RenderUTF8_Solid => [:pointer, :pointer, Color.by_value],
      :TTF_RenderUNICODE_Solid => [:pointer, :pointer, Color.by_value],
      :TTF_RenderText_Solid_Wrapped => [:pointer, :pointer, Color.by_value, :uint],
      :TTF_RenderUTF8_Solid_Wrapped => [:pointer, :pointer, Color.by_value, :uint],
      :TTF_RenderUNICODE_Solid_Wrapped => [:pointer, :pointer, Color.by_value, :uint],
      :TTF_RenderGlyph_Solid => [:pointer, :ushort, Color.by_value],
      :TTF_RenderGlyph32_Solid => [:pointer, :uint, Color.by_value],
      :TTF_RenderText_Shaded => [:pointer, :pointer, Color.by_value, Color.by_value],
      :TTF_RenderUTF8_Shaded => [:pointer, :pointer, Color.by_value, Color.by_value],
      :TTF_RenderUNICODE_Shaded => [:pointer, :pointer, Color.by_value, Color.by_value],
      :TTF_RenderText_Shaded_Wrapped => [:pointer, :pointer, Color.by_value, Color.by_value, :uint],
      :TTF_RenderUTF8_Shaded_Wrapped => [:pointer, :pointer, Color.by_value, Color.by_value, :uint],
      :TTF_RenderUNICODE_Shaded_Wrapped => [:pointer, :pointer, Color.by_value, Color.by_value, :uint],
      :TTF_RenderGlyph_Shaded => [:pointer, :ushort, Color.by_value, Color.by_value],
      :TTF_RenderGlyph32_Shaded => [:pointer, :uint, Color.by_value, Color.by_value],
      :TTF_RenderText_Blended => [:pointer, :pointer, Color.by_value],
      :TTF_RenderUTF8_Blended => [:pointer, :pointer, Color.by_value],
      :TTF_RenderUNICODE_Blended => [:pointer, :pointer, Color.by_value],
      :TTF_RenderText_Blended_Wrapped => [:pointer, :pointer, Color.by_value, :uint],
      :TTF_RenderUTF8_Blended_Wrapped => [:pointer, :pointer, Color.by_value, :uint],
      :TTF_RenderUNICODE_Blended_Wrapped => [:pointer, :pointer, Color.by_value, :uint],
      :TTF_RenderGlyph_Blended => [:pointer, :ushort, Color.by_value],
      :TTF_RenderGlyph32_Blended => [:pointer, :uint, Color.by_value],
      :TTF_RenderText_LCD => [:pointer, :pointer, Color.by_value, Color.by_value],
      :TTF_RenderUTF8_LCD => [:pointer, :pointer, Color.by_value, Color.by_value],
      :TTF_RenderUNICODE_LCD => [:pointer, :pointer, Color.by_value, Color.by_value],
      :TTF_RenderText_LCD_Wrapped => [:pointer, :pointer, Color.by_value, Color.by_value, :uint],
      :TTF_RenderUTF8_LCD_Wrapped => [:pointer, :pointer, Color.by_value, Color.by_value, :uint],
      :TTF_RenderUNICODE_LCD_Wrapped => [:pointer, :pointer, Color.by_value, Color.by_value, :uint],
      :TTF_RenderGlyph_LCD => [:pointer, :ushort, Color.by_value, Color.by_value],
      :TTF_RenderGlyph32_LCD => [:pointer, :uint, Color.by_value, Color.by_value],
      :TTF_CloseFont => [:pointer],
      :TTF_Quit => [],
      :TTF_WasInit => [],
      :TTF_GetFontKerningSize => [:pointer, :int, :int],
      :TTF_GetFontKerningSizeGlyphs => [:pointer, :ushort, :ushort],
      :TTF_GetFontKerningSizeGlyphs32 => [:pointer, :uint, :uint],
      :TTF_SetFontSDF => [:pointer, :int],
      :TTF_GetFontSDF => [:pointer],
      :TTF_SetDirection => [:int],
      :TTF_SetScript => [:int],
      :TTF_SetFontDirection => [:pointer, :int],
      :TTF_SetFontScriptName => [:pointer, :pointer],
    }
    retvals = {
      :TTF_Linked_Version => :pointer,
      :TTF_GetFreeTypeVersion => :void,
      :TTF_GetHarfBuzzVersion => :void,
      :TTF_ByteSwappedUNICODE => :void,
      :TTF_Init => :int,
      :TTF_OpenFont => :pointer,
      :TTF_OpenFontIndex => :pointer,
      :TTF_OpenFontRW => :pointer,
      :TTF_OpenFontIndexRW => :pointer,
      :TTF_OpenFontDPI => :pointer,
      :TTF_OpenFontIndexDPI => :pointer,
      :TTF_OpenFontDPIRW => :pointer,
      :TTF_OpenFontIndexDPIRW => :pointer,
      :TTF_SetFontSize => :int,
      :TTF_SetFontSizeDPI => :int,
      :TTF_GetFontStyle => :int,
      :TTF_SetFontStyle => :void,
      :TTF_GetFontOutline => :int,
      :TTF_SetFontOutline => :void,
      :TTF_GetFontHinting => :int,
      :TTF_SetFontHinting => :void,
      :TTF_GetFontWrappedAlign => :int,
      :TTF_SetFontWrappedAlign => :void,
      :TTF_FontHeight => :int,
      :TTF_FontAscent => :int,
      :TTF_FontDescent => :int,
      :TTF_FontLineSkip => :int,
      :TTF_GetFontKerning => :int,
      :TTF_SetFontKerning => :void,
      :TTF_FontFaces => :long,
      :TTF_FontFaceIsFixedWidth => :int,
      :TTF_FontFaceFamilyName => :pointer,
      :TTF_FontFaceStyleName => :pointer,
      :TTF_GlyphIsProvided => :int,
      :TTF_GlyphIsProvided32 => :int,
      :TTF_GlyphMetrics => :int,
      :TTF_GlyphMetrics32 => :int,
      :TTF_SizeText => :int,
      :TTF_SizeUTF8 => :int,
      :TTF_SizeUNICODE => :int,
      :TTF_MeasureText => :int,
      :TTF_MeasureUTF8 => :int,
      :TTF_MeasureUNICODE => :int,
      :TTF_RenderText_Solid => :pointer,
      :TTF_RenderUTF8_Solid => :pointer,
      :TTF_RenderUNICODE_Solid => :pointer,
      :TTF_RenderText_Solid_Wrapped => :pointer,
      :TTF_RenderUTF8_Solid_Wrapped => :pointer,
      :TTF_RenderUNICODE_Solid_Wrapped => :pointer,
      :TTF_RenderGlyph_Solid => :pointer,
      :TTF_RenderGlyph32_Solid => :pointer,
      :TTF_RenderText_Shaded => :pointer,
      :TTF_RenderUTF8_Shaded => :pointer,
      :TTF_RenderUNICODE_Shaded => :pointer,
      :TTF_RenderText_Shaded_Wrapped => :pointer,
      :TTF_RenderUTF8_Shaded_Wrapped => :pointer,
      :TTF_RenderUNICODE_Shaded_Wrapped => :pointer,
      :TTF_RenderGlyph_Shaded => :pointer,
      :TTF_RenderGlyph32_Shaded => :pointer,
      :TTF_RenderText_Blended => :pointer,
      :TTF_RenderUTF8_Blended => :pointer,
      :TTF_RenderUNICODE_Blended => :pointer,
      :TTF_RenderText_Blended_Wrapped => :pointer,
      :TTF_RenderUTF8_Blended_Wrapped => :pointer,
      :TTF_RenderUNICODE_Blended_Wrapped => :pointer,
      :TTF_RenderGlyph_Blended => :pointer,
      :TTF_RenderGlyph32_Blended => :pointer,
      :TTF_RenderText_LCD => :pointer,
      :TTF_RenderUTF8_LCD => :pointer,
      :TTF_RenderUNICODE_LCD => :pointer,
      :TTF_RenderText_LCD_Wrapped => :pointer,
      :TTF_RenderUTF8_LCD_Wrapped => :pointer,
      :TTF_RenderUNICODE_LCD_Wrapped => :pointer,
      :TTF_RenderGlyph_LCD => :pointer,
      :TTF_RenderGlyph32_LCD => :pointer,
      :TTF_CloseFont => :void,
      :TTF_Quit => :void,
      :TTF_WasInit => :int,
      :TTF_GetFontKerningSize => :int,
      :TTF_GetFontKerningSizeGlyphs => :int,
      :TTF_GetFontKerningSizeGlyphs32 => :int,
      :TTF_SetFontSDF => :int,
      :TTF_GetFontSDF => :int,
      :TTF_SetDirection => :int,
      :TTF_SetScript => :int,
      :TTF_SetFontDirection => :int,
      :TTF_SetFontScriptName => :int,
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

