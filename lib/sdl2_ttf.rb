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

  # Enum


  # Typedef


  # Struct


  # Function

  def self.setup_ttf_symbols()
      attach_function :TTF_Linked_Version, [], :pointer
      attach_function :TTF_ByteSwappedUNICODE, [:int], :void
      attach_function :TTF_Init, [], :int
      attach_function :TTF_OpenFont, [:pointer, :int], :pointer
      attach_function :TTF_OpenFontIndex, [:pointer, :int, :long], :pointer
      attach_function :TTF_OpenFontRW, [:pointer, :int, :int], :pointer
      attach_function :TTF_OpenFontIndexRW, [:pointer, :int, :int, :long], :pointer
      attach_function :TTF_GetFontStyle, [:pointer], :int
      attach_function :TTF_SetFontStyle, [:pointer, :int], :void
      attach_function :TTF_GetFontOutline, [:pointer], :int
      attach_function :TTF_SetFontOutline, [:pointer, :int], :void
      attach_function :TTF_GetFontHinting, [:pointer], :int
      attach_function :TTF_SetFontHinting, [:pointer, :int], :void
      attach_function :TTF_FontHeight, [:pointer], :int
      attach_function :TTF_FontAscent, [:pointer], :int
      attach_function :TTF_FontDescent, [:pointer], :int
      attach_function :TTF_FontLineSkip, [:pointer], :int
      attach_function :TTF_GetFontKerning, [:pointer], :int
      attach_function :TTF_SetFontKerning, [:pointer, :int], :void
      attach_function :TTF_FontFaces, [:pointer], :long
      attach_function :TTF_FontFaceIsFixedWidth, [:pointer], :int
      attach_function :TTF_FontFaceFamilyName, [:pointer], :pointer
      attach_function :TTF_FontFaceStyleName, [:pointer], :pointer
      attach_function :TTF_GlyphIsProvided, [:pointer, :ushort], :int
      attach_function :TTF_GlyphMetrics, [:pointer, :ushort, :pointer, :pointer, :pointer, :pointer, :pointer], :int
      attach_function :TTF_SizeText, [:pointer, :pointer, :pointer, :pointer], :int
      attach_function :TTF_SizeUTF8, [:pointer, :pointer, :pointer, :pointer], :int
      attach_function :TTF_SizeUNICODE, [:pointer, :pointer, :pointer, :pointer], :int
      attach_function :TTF_RenderText_Solid, [:pointer, :pointer, SDL_Color], :pointer
      attach_function :TTF_RenderUTF8_Solid, [:pointer, :pointer, SDL_Color], :pointer
      attach_function :TTF_RenderUNICODE_Solid, [:pointer, :pointer, SDL_Color], :pointer
      attach_function :TTF_RenderGlyph_Solid, [:pointer, :ushort, SDL_Color], :pointer
      attach_function :TTF_RenderText_Shaded, [:pointer, :pointer, SDL_Color, SDL_Color], :pointer
      attach_function :TTF_RenderUTF8_Shaded, [:pointer, :pointer, SDL_Color, SDL_Color], :pointer
      attach_function :TTF_RenderUNICODE_Shaded, [:pointer, :pointer, SDL_Color, SDL_Color], :pointer
      attach_function :TTF_RenderGlyph_Shaded, [:pointer, :ushort, SDL_Color, SDL_Color], :pointer
      attach_function :TTF_RenderText_Blended, [:pointer, :pointer, SDL_Color], :pointer
      attach_function :TTF_RenderUTF8_Blended, [:pointer, :pointer, SDL_Color], :pointer
      attach_function :TTF_RenderUNICODE_Blended, [:pointer, :pointer, SDL_Color], :pointer
      attach_function :TTF_RenderText_Blended_Wrapped, [:pointer, :pointer, SDL_Color, :uint], :pointer
      attach_function :TTF_RenderUTF8_Blended_Wrapped, [:pointer, :pointer, SDL_Color, :uint], :pointer
      attach_function :TTF_RenderUNICODE_Blended_Wrapped, [:pointer, :pointer, SDL_Color, :uint], :pointer
      attach_function :TTF_RenderGlyph_Blended, [:pointer, :ushort, SDL_Color], :pointer
      attach_function :TTF_CloseFont, [:pointer], :void
      attach_function :TTF_Quit, [], :void
      attach_function :TTF_WasInit, [], :int
      attach_function :TTF_GetFontKerningSize, [:pointer, :int, :int], :int
      attach_function :TTF_GetFontKerningSizeGlyphs, [:pointer, :ushort, :ushort], :int
  end

end

