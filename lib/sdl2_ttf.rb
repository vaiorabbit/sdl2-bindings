# -*- coding: utf-8 -*-
require 'fiddle/import'

module SDL2

  extend Fiddle::Importer

  SDL_TTF_MAJOR_VERSION  = 2
  SDL_TTF_MINOR_VERSION  = 0
  SDL_TTF_PATCHLEVEL     = 13

  # ZERO WIDTH NO-BREAKSPACE (Unicode byte order mark) */
  UNICODE_BOM_NATIVE = 0xFEFF
  UNICODE_BOM_SWAPPED = 0xFFFE

  TTF_STYLE_NORMAL        = 0x00
  TTF_STYLE_BOLD          = 0x01
  TTF_STYLE_ITALIC        = 0x02
  TTF_STYLE_UNDERLINE     = 0x04
  TTF_STYLE_STRIKETHROUGH = 0x08

  TTF_HINTING_NORMAL    = 0
  TTF_HINTING_LIGHT     = 1
  TTF_HINTING_MONO      = 2
  TTF_HINTING_NONE      = 3

  @@sdl2ttf_dll = nil
  @@sdl2ttf_import_done = false

  #
  # Fiddle's default 'extern' stores all methods into local variable '@func_map', that makes difficult to 'include SDL2'.
  # So I override it and replace '@func_map' into 'SDL2TTF_FUNCTIONS_MAP'.
  # Ref.: /lib/ruby/2.0.0/fiddle/import.rb
  #
  SDL2TTF_FUNCTIONS_MAP = {}
  SDL2TTF_FUNCTIONS_ARGS_MAP = {}
  SDL2TTF_FUNCTIONS_RETVAL_MAP = {}
  def self.extern(signature, *opts)
    symname, ctype, argtype = parse_signature(signature, @type_alias)
    opt = parse_bind_options(opts)
    f = import_function(symname, ctype, argtype, opt[:call_type])
    name = symname.gsub(/@.+/,'')
    SDL2TTF_FUNCTIONS_MAP[name] = f
    begin
      /^(.+?):(\d+)/ =~ caller.first
      file, line = $1, $2.to_i
    rescue
      file, line = __FILE__, __LINE__+3
    end
    args_str="*args"
    module_eval(<<-EOS, file, line)
      def #{name}(*args, &block)
        SDL2TTF_FUNCTIONS_MAP['#{name}'].call(*args,&block)
      end
    EOS
    module_function(name)
    f
  end

  def self.sdl2ttf_get_command(sym)
    if SDL2TTF_FUNCTIONS_MAP[sym] == nil
      sdl2ttf_bind_command(sym)
    end
    return SDL2TTF_FUNCTIONS_MAP[sym]
  end

  def self.sdl2ttf_bind_command(sym)
    SDL2TTF_FUNCTIONS_MAP[sym] = Fiddle::Function.new( @@sdl2ttf_dll[sym.to_s], 
                                                       SDL2TTF_FUNCTIONS_ARGS_MAP[sym],
                                                       SDL2TTF_FUNCTIONS_RETVAL_MAP[sym] )
  end

  def self.color_to_u32(c)
    return (c.r << 0) | (c.g << 8) | (c.b << 16) | (c.a << 24)
  end

  SDL2TTF_FUNCTIONS_ARGS_MAP[:TTF_RenderText_Solid] = [Fiddle::TYPE_VOIDP, Fiddle::TYPE_VOIDP, -Fiddle::TYPE_INT].freeze
  SDL2TTF_FUNCTIONS_RETVAL_MAP[:TTF_RenderText_Solid] = Fiddle::TYPE_VOIDP
  def self.TTF_RenderText_Solid(font, text, fg)
    f = sdl2ttf_get_command(:TTF_RenderText_Solid)
    f.call(font, text, color_to_u32(fg))
  end

  SDL2TTF_FUNCTIONS_ARGS_MAP[:TTF_RenderUTF8_Solid] = [Fiddle::TYPE_VOIDP, Fiddle::TYPE_VOIDP, -Fiddle::TYPE_INT].freeze
  SDL2TTF_FUNCTIONS_RETVAL_MAP[:TTF_RenderUTF8_Solid] = Fiddle::TYPE_VOIDP
  def self.TTF_RenderUTF8_Solid(font, text, fg)
    f = sdl2ttf_get_command(:TTF_RenderUTF8_Solid)
    f.call(font, text, color_to_u32(fg))
  end

  SDL2TTF_FUNCTIONS_ARGS_MAP[:TTF_RenderUNICODE_Solid] = [Fiddle::TYPE_VOIDP, Fiddle::TYPE_VOIDP, -Fiddle::TYPE_INT].freeze
  SDL2TTF_FUNCTIONS_RETVAL_MAP[:TTF_RenderUNICODE_Solid] = Fiddle::TYPE_VOIDP
  def self.TTF_RenderUNICODE_Solid(font, u16_text, fg)
    f = sdl2ttf_get_command(:TTF_RenderUNICODE_Solid)
    f.call(font, u16_text, color_to_u32(fg))
  end


  SDL2TTF_FUNCTIONS_ARGS_MAP[:TTF_RenderGlyph_Solid] = [Fiddle::TYPE_VOIDP, -Fiddle::TYPE_SHORT, -Fiddle::TYPE_INT].freeze
  SDL2TTF_FUNCTIONS_RETVAL_MAP[:TTF_RenderGlyph_Solid] = Fiddle::TYPE_VOIDP
  def self.TTF_RenderGlyph_Solid(font, u16_ch, fg)
    f = sdl2ttf_get_command(:TTF_RenderGlyph_Solid)
    f.call(font, u16_ch, color_to_u32(fg))
  end


  SDL2TTF_FUNCTIONS_ARGS_MAP[:TTF_RenderText_Shaded] = [Fiddle::TYPE_VOIDP, Fiddle::TYPE_VOIDP, -Fiddle::TYPE_INT, -Fiddle::TYPE_INT].freeze
  SDL2TTF_FUNCTIONS_RETVAL_MAP[:TTF_RenderText_Shaded] = Fiddle::TYPE_VOIDP
  def self.TTF_RenderText_Shaded(font, text, fg, bg)
    f = sdl2ttf_get_command(:TTF_RenderText_Shaded)
    f.call(font, text, color_to_u32(fg), color_to_u32(bg))
  end

  SDL2TTF_FUNCTIONS_ARGS_MAP[:TTF_RenderUTF8_Shaded] = [Fiddle::TYPE_VOIDP, Fiddle::TYPE_VOIDP, -Fiddle::TYPE_INT, -Fiddle::TYPE_INT].freeze
  SDL2TTF_FUNCTIONS_RETVAL_MAP[:TTF_RenderUTF8_Shaded] = Fiddle::TYPE_VOIDP
  def self.TTF_RenderUTF8_Shaded(font, text, fg, bg)
    f = sdl2ttf_get_command(:TTF_RenderUTF8_Shaded)
    f.call(font, text, color_to_u32(fg), color_to_u32(bg))
  end

  SDL2TTF_FUNCTIONS_ARGS_MAP[:TTF_RenderUNICODE_Shaded] = [Fiddle::TYPE_VOIDP, Fiddle::TYPE_VOIDP, -Fiddle::TYPE_INT, -Fiddle::TYPE_INT].freeze
  SDL2TTF_FUNCTIONS_RETVAL_MAP[:TTF_RenderUNICODE_Shaded] = Fiddle::TYPE_VOIDP
  def self.TTF_RenderUNICODE_Shaded(font, u16_text, fg, bg)
    f = sdl2ttf_get_command(:TTF_RenderUNICODE_Shaded)
    f.call(font, u16_text, color_to_u32(fg), color_to_u32(bg))
  end


  SDL2TTF_FUNCTIONS_ARGS_MAP[:TTF_RenderGlyph_Shaded] = [Fiddle::TYPE_VOIDP, -Fiddle::TYPE_SHORT, -Fiddle::TYPE_INT, -Fiddle::TYPE_INT].freeze
  SDL2TTF_FUNCTIONS_RETVAL_MAP[:TTF_RenderGlyph_Shaded] = Fiddle::TYPE_VOIDP
  def self.TTF_RenderGlyph_Shaded(font, u16_ch, fg, bg)
    f = sdl2ttf_get_command(:TTF_RenderGlyph_Shaded)
    f.call(font, u16_ch, color_to_u32(fg), color_to_u32(bg))
  end


  SDL2TTF_FUNCTIONS_ARGS_MAP[:TTF_RenderText_Blended] = [Fiddle::TYPE_VOIDP, Fiddle::TYPE_VOIDP, -Fiddle::TYPE_INT].freeze
  SDL2TTF_FUNCTIONS_RETVAL_MAP[:TTF_RenderText_Blended] = Fiddle::TYPE_VOIDP
  def self.TTF_RenderText_Blended(font, text, fg)
    f = sdl2ttf_get_command(:TTF_RenderText_Blended)
    f.call(font, text, color_to_u32(fg))
  end

  SDL2TTF_FUNCTIONS_ARGS_MAP[:TTF_RenderUTF8_Blended] = [Fiddle::TYPE_VOIDP, Fiddle::TYPE_VOIDP, -Fiddle::TYPE_INT].freeze
  SDL2TTF_FUNCTIONS_RETVAL_MAP[:TTF_RenderUTF8_Blended] = Fiddle::TYPE_VOIDP
  def self.TTF_RenderUTF8_Blended(font, text, fg)
    f = sdl2ttf_get_command(:TTF_RenderUTF8_Blended)
    f.call(font, text, color_to_u32(fg))
  end

  SDL2TTF_FUNCTIONS_ARGS_MAP[:TTF_RenderUNICODE_Blended] = [Fiddle::TYPE_VOIDP, Fiddle::TYPE_VOIDP, -Fiddle::TYPE_INT].freeze
  SDL2TTF_FUNCTIONS_RETVAL_MAP[:TTF_RenderUNICODE_Blended] = Fiddle::TYPE_VOIDP
  def self.TTF_RenderUNICODE_Blended(font, u16_text, fg)
    f = sdl2ttf_get_command(:TTF_RenderUNICODE_Blended)
    f.call(font, u16_text, color_to_u32(fg))
  end


  SDL2TTF_FUNCTIONS_ARGS_MAP[:TTF_RenderText_Blended_Wrapped] = [Fiddle::TYPE_VOIDP, Fiddle::TYPE_VOIDP, -Fiddle::TYPE_INT, -Fiddle::TYPE_INT].freeze
  SDL2TTF_FUNCTIONS_RETVAL_MAP[:TTF_RenderText_Blended_Wrapped] = Fiddle::TYPE_VOIDP
  def self.TTF_RenderText_Blended_Wrapped(font, text, fg, wrapLength)
    f = sdl2ttf_get_command(:TTF_RenderText_Blended_Wrapped)
    f.call(font, text, color_to_u32(fg), wrapLength)
  end

  SDL2TTF_FUNCTIONS_ARGS_MAP[:TTF_RenderUTF8_Blended_Wrapped] = [Fiddle::TYPE_VOIDP, Fiddle::TYPE_VOIDP, -Fiddle::TYPE_INT, -Fiddle::TYPE_INT].freeze
  SDL2TTF_FUNCTIONS_RETVAL_MAP[:TTF_RenderUTF8_Blended_Wrapped] = Fiddle::TYPE_VOIDP
  def self.TTF_RenderUTF8_Blended_Wrapped(font, text, fg, wrapLength)
    f = sdl2ttf_get_command(:TTF_RenderUTF8_Blended_Wrapped)
    f.call(font, text, color_to_u32(fg), wrapLength)
  end

  SDL2TTF_FUNCTIONS_ARGS_MAP[:TTF_RenderUNICODE_Blended_Wrapped] = [Fiddle::TYPE_VOIDP, Fiddle::TYPE_VOIDP, -Fiddle::TYPE_INT, -Fiddle::TYPE_INT].freeze
  SDL2TTF_FUNCTIONS_RETVAL_MAP[:TTF_RenderUNICODE_Blended_Wrapped] = Fiddle::TYPE_VOIDP
  def self.TTF_RenderUNICODE_Blended_Wrapped(font, u16_text, fg, wrapLength)
    f = sdl2ttf_get_command(:TTF_RenderUNICODE_Blended_Wrapped)
    f.call(font, u16_text, color_to_u32(fg), wrapLength)
  end


  SDL2TTF_FUNCTIONS_ARGS_MAP[:TTF_RenderGlyph_Blended] = [Fiddle::TYPE_VOIDP, -Fiddle::TYPE_SHORT, -Fiddle::TYPE_INT].freeze
  SDL2TTF_FUNCTIONS_RETVAL_MAP[:TTF_RenderGlyph_Blended] = Fiddle::TYPE_VOIDP
  def self.TTF_RenderGlyph_Blended(font,  u16_ch, fg)
    f = sdl2ttf_get_command(:TTF_RenderGlyph_Blended)
    f.call(font, u16_ch, color_to_u32(fg))
  end

  # Load native library.
  def self.load_ttf_lib(libpath)
    unless @@sdl2ttf_import_done
      @@sdl2ttf_dll = dlopen(libpath)
      dlload(@@sdl2ttf_dll)
      import_ttf_symbols()
    end
  end


  def self.import_ttf_symbols
    extern 'void TTF_ByteSwappedUNICODE(int)'
    extern 'int TTF_Init()'
    extern 'TTF_Font* TTF_OpenFont(const char*, int)'
    extern 'TTF_Font* TTF_OpenFontIndex(const char*, int, long)'
    extern 'TTF_Font* TTF_OpenFontRW(SDL_RWops*, int, int)'
    extern 'TTF_Font* TTF_OpenFontIndexRW(SDL_RWops*, int, int, long)'
    extern 'int TTF_GetFontStyle(const TTF_Font*)'
    extern 'void TTF_SetFontStyle(TTF_Font*, int)'
    extern 'int TTF_GetFontOutline(const TTF_Font*)'
    extern 'void TTF_SetFontOutline(TTF_Font*, int)'
    extern 'int TTF_GetFontHinting(const TTF_Font*)'
    extern 'void TTF_SetFontHinting(TTF_Font*, int)'
    extern 'int TTF_FontHeight(const TTF_Font*)'
    extern 'int TTF_FontAscent(const TTF_Font*)'
    extern 'int TTF_FontDescent(const TTF_Font*)'
    extern 'int TTF_FontLineSkip(const TTF_Font*)'
    extern 'int TTF_GetFontKerning(const TTF_Font*)'
    extern 'void TTF_SetFontKerning(TTF_Font*, int)'
    extern 'long TTF_FontFaces(const TTF_Font*)'
    extern 'int TTF_FontFaceIsFixedWidth(const TTF_Font*)'
    extern 'char * TTF_FontFaceFamilyName(const TTF_Font*)'
    extern 'char * TTF_FontFaceStyleName(const TTF_Font*)'
    extern 'int TTF_GlyphIsProvided(const TTF_Font*, unsigned short)'
    extern 'int TTF_GlyphMetrics(TTF_Font*, unsigned short, int*, int*, int*, int*, int*)'
    extern 'int TTF_SizeText(TTF_Font*, const char*, int*, int*)'
    extern 'int TTF_SizeUTF8(TTF_Font*, const char*, int*, int*)'
    extern 'int TTF_SizeUNICODE(TTF_Font*, const unsigned short*, int*, int*)'
=begin We can't use TTF_RenderXXX directly because the argument SDL_Color [fb]g is an struct instance, which is not supported by Fiddle.
    extern 'SDL_Surface* TTF_RenderText_Solid(TTF_Font*, const char*, unsigned int)' # SDL_Color => unsigned int
    extern 'SDL_Surface* TTF_RenderUTF8_Solid(TTF_Font*, const char*, unsigned int)' # SDL_Color => unsigned int
    extern 'SDL_Surface* TTF_RenderUNICODE_Solid(TTF_Font*, const unsigned short*, unsigned int)' # SDL_Color => unsigned int
    extern 'SDL_Surface* TTF_RenderGlyph_Solid(TTF_Font*, unsigned short, unsigned int)' # SDL_Color => unsigned int
    extern 'SDL_Surface* TTF_RenderText_Shaded(TTF_Font*, const char*, unsigned int, unsigned int)' # SDL_Color => unsigned int
    extern 'SDL_Surface* TTF_RenderUTF8_Shaded(TTF_Font*, const char*, unsigned int, unsigned int)' # SDL_Color => unsigned int
    extern 'SDL_Surface* TTF_RenderUNICODE_Shaded(TTF_Font*, const unsigned short*, unsigned int, unsigned int)' # SDL_Color => unsigned int
    extern 'SDL_Surface* TTF_RenderGlyph_Shaded(TTF_Font*, unsigned short, unsigned int, unsigned int)' # SDL_Color => unsigned int
    extern 'SDL_Surface* TTF_RenderText_Blended(TTF_Font*, const char*, unsigned int)' # SDL_Color => unsigned int
    extern 'SDL_Surface* TTF_RenderUTF8_Blended(TTF_Font*, const char*, unsigned int)' # SDL_Color => unsigned int
    extern 'SDL_Surface* TTF_RenderUNICODE_Blended(TTF_Font*, const unsigned short*, unsigned int)' # SDL_Color => unsigned int
    extern 'SDL_Surface* TTF_RenderText_Blended_Wrapped(TTF_Font*, const char*, unsigned int, unsigned int)'
    extern 'SDL_Surface* TTF_RenderUTF8_Blended_Wrapped(TTF_Font*, const char*, unsigned int, unsigned int)'
    extern 'SDL_Surface* TTF_RenderUNICODE_Blended_Wrapped(TTF_Font*, const unsigned short*, unsigned int, unsigned int)'
    extern 'SDL_Surface* TTF_RenderGlyph_Blended(TTF_Font*, unsigned short, unsigned int)' # SDL_Color => unsigned int
=end
    extern 'void TTF_CloseFont(TTF_Font*)'
    extern 'void TTF_Quit()'
    extern 'int TTF_WasInit()'
    extern 'int TTF_GetFontKerningSize(TTF_Font*, int, int)'

    @@sdl2ttf_import_done = true
  end

end

=begin
sdl2-bindings : Yet another SDL2 wrapper for Ruby
Copyright (c) 2015 vaiorabbit <http://twitter.com/vaiorabbit>

This software is provided 'as-is', without any express or implied
warranty. In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

    1. The origin of this software must not be misrepresented; you must not
    claim that you wrote the original software. If you use this software
    in a product, an acknowledgment in the product documentation would be
    appreciated but is not required.

    2. Altered source versions must be plainly marked as such, and must not be
    misrepresented as being the original software.

    3. This notice may not be removed or altered from any source
    distribution.
=end
