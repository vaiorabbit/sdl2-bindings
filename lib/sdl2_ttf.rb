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

  SDL_TTF_MAJOR_VERSION = 2
  SDL_TTF_MINOR_VERSION = 0
  SDL_TTF_PATCHLEVEL = 15
  TTF_MAJOR_VERSION = SDL_TTF_MAJOR_VERSION
  TTF_MINOR_VERSION = SDL_TTF_MINOR_VERSION
  TTF_PATCHLEVEL = SDL_TTF_PATCHLEVEL
  TTF_STYLE_NORMAL = 0x00
  TTF_STYLE_BOLD = 0x01
  TTF_STYLE_ITALIC = 0x02
  TTF_STYLE_UNDERLINE = 0x04
  TTF_STYLE_STRIKETHROUGH = 0x08
  TTF_HINTING_NORMAL = 0
  TTF_HINTING_LIGHT = 1
  TTF_HINTING_MONO = 2
  TTF_HINTING_NONE = 3

  # Enum


  # Typedef


  # Struct


  # Function

  def self.setup_ttf_symbols()
    symbols = [
      :TTF_Linked_Version,
      :TTF_ByteSwappedUNICODE,
      :TTF_Init,
      :TTF_OpenFont,
      :TTF_OpenFontIndex,
      :TTF_OpenFontRW,
      :TTF_OpenFontIndexRW,
      :TTF_GetFontStyle,
      :TTF_SetFontStyle,
      :TTF_GetFontOutline,
      :TTF_SetFontOutline,
      :TTF_GetFontHinting,
      :TTF_SetFontHinting,
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
      :TTF_GlyphMetrics,
      :TTF_SizeText,
      :TTF_SizeUTF8,
      :TTF_SizeUNICODE,
      :TTF_RenderText_Solid,
      :TTF_RenderUTF8_Solid,
      :TTF_RenderUNICODE_Solid,
      :TTF_RenderGlyph_Solid,
      :TTF_RenderText_Shaded,
      :TTF_RenderUTF8_Shaded,
      :TTF_RenderUNICODE_Shaded,
      :TTF_RenderGlyph_Shaded,
      :TTF_RenderText_Blended,
      :TTF_RenderUTF8_Blended,
      :TTF_RenderUNICODE_Blended,
      :TTF_RenderText_Blended_Wrapped,
      :TTF_RenderUTF8_Blended_Wrapped,
      :TTF_RenderUNICODE_Blended_Wrapped,
      :TTF_RenderGlyph_Blended,
      :TTF_CloseFont,
      :TTF_Quit,
      :TTF_WasInit,
      :TTF_GetFontKerningSize,
      :TTF_GetFontKerningSizeGlyphs,
    ]
    args = {
      :TTF_Linked_Version => [],
      :TTF_ByteSwappedUNICODE => [:int],
      :TTF_Init => [],
      :TTF_OpenFont => [:pointer, :int],
      :TTF_OpenFontIndex => [:pointer, :int, :long],
      :TTF_OpenFontRW => [:pointer, :int, :int],
      :TTF_OpenFontIndexRW => [:pointer, :int, :int, :long],
      :TTF_GetFontStyle => [:pointer],
      :TTF_SetFontStyle => [:pointer, :int],
      :TTF_GetFontOutline => [:pointer],
      :TTF_SetFontOutline => [:pointer, :int],
      :TTF_GetFontHinting => [:pointer],
      :TTF_SetFontHinting => [:pointer, :int],
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
      :TTF_GlyphMetrics => [:pointer, :ushort, :pointer, :pointer, :pointer, :pointer, :pointer],
      :TTF_SizeText => [:pointer, :pointer, :pointer, :pointer],
      :TTF_SizeUTF8 => [:pointer, :pointer, :pointer, :pointer],
      :TTF_SizeUNICODE => [:pointer, :pointer, :pointer, :pointer],
      :TTF_RenderText_Solid => [:pointer, :pointer, SDL_Color],
      :TTF_RenderUTF8_Solid => [:pointer, :pointer, SDL_Color],
      :TTF_RenderUNICODE_Solid => [:pointer, :pointer, SDL_Color],
      :TTF_RenderGlyph_Solid => [:pointer, :ushort, SDL_Color],
      :TTF_RenderText_Shaded => [:pointer, :pointer, SDL_Color, SDL_Color],
      :TTF_RenderUTF8_Shaded => [:pointer, :pointer, SDL_Color, SDL_Color],
      :TTF_RenderUNICODE_Shaded => [:pointer, :pointer, SDL_Color, SDL_Color],
      :TTF_RenderGlyph_Shaded => [:pointer, :ushort, SDL_Color, SDL_Color],
      :TTF_RenderText_Blended => [:pointer, :pointer, SDL_Color],
      :TTF_RenderUTF8_Blended => [:pointer, :pointer, SDL_Color],
      :TTF_RenderUNICODE_Blended => [:pointer, :pointer, SDL_Color],
      :TTF_RenderText_Blended_Wrapped => [:pointer, :pointer, SDL_Color, :uint],
      :TTF_RenderUTF8_Blended_Wrapped => [:pointer, :pointer, SDL_Color, :uint],
      :TTF_RenderUNICODE_Blended_Wrapped => [:pointer, :pointer, SDL_Color, :uint],
      :TTF_RenderGlyph_Blended => [:pointer, :ushort, SDL_Color],
      :TTF_CloseFont => [:pointer],
      :TTF_Quit => [],
      :TTF_WasInit => [],
      :TTF_GetFontKerningSize => [:pointer, :int, :int],
      :TTF_GetFontKerningSizeGlyphs => [:pointer, :ushort, :ushort],
    }
    retvals = {
      :TTF_Linked_Version => :pointer,
      :TTF_ByteSwappedUNICODE => :void,
      :TTF_Init => :int,
      :TTF_OpenFont => :pointer,
      :TTF_OpenFontIndex => :pointer,
      :TTF_OpenFontRW => :pointer,
      :TTF_OpenFontIndexRW => :pointer,
      :TTF_GetFontStyle => :int,
      :TTF_SetFontStyle => :void,
      :TTF_GetFontOutline => :int,
      :TTF_SetFontOutline => :void,
      :TTF_GetFontHinting => :int,
      :TTF_SetFontHinting => :void,
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
      :TTF_GlyphMetrics => :int,
      :TTF_SizeText => :int,
      :TTF_SizeUTF8 => :int,
      :TTF_SizeUNICODE => :int,
      :TTF_RenderText_Solid => :pointer,
      :TTF_RenderUTF8_Solid => :pointer,
      :TTF_RenderUNICODE_Solid => :pointer,
      :TTF_RenderGlyph_Solid => :pointer,
      :TTF_RenderText_Shaded => :pointer,
      :TTF_RenderUTF8_Shaded => :pointer,
      :TTF_RenderUNICODE_Shaded => :pointer,
      :TTF_RenderGlyph_Shaded => :pointer,
      :TTF_RenderText_Blended => :pointer,
      :TTF_RenderUTF8_Blended => :pointer,
      :TTF_RenderUNICODE_Blended => :pointer,
      :TTF_RenderText_Blended_Wrapped => :pointer,
      :TTF_RenderUTF8_Blended_Wrapped => :pointer,
      :TTF_RenderUNICODE_Blended_Wrapped => :pointer,
      :TTF_RenderGlyph_Blended => :pointer,
      :TTF_CloseFont => :void,
      :TTF_Quit => :void,
      :TTF_WasInit => :int,
      :TTF_GetFontKerningSize => :int,
      :TTF_GetFontKerningSizeGlyphs => :int,
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

