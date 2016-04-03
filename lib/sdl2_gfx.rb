# -*- coding: utf-8 -*-
require 'fiddle/import'

module SDL2

  extend Fiddle::Importer

  # SDL2_framerate
  FPS_UPPER_LIMIT = 200
  FPS_LOWER_LIMIT = 1
  FPS_DEFAULT     = 30

  FPSmanager = struct(["unsigned int framecount",
                       "float rateticks",
                       "unsigned int baseticks",
                       "unsigned int lastticks",
                       "unsigned int rate"])

  # SDL2_gfxPrimitives
  SDL2_GFXPRIMITIVES_MAJOR = 1
  SDL2_GFXPRIMITIVES_MINOR = 0
  SDL2_GFXPRIMITIVES_MICRO = 1

  # SDL2_rotozoom
  SMOOTHING_OFF = 0
  SMOOTHING_ON  = 1

  #
  # Fiddle's default 'extern' stores all methods into local variable '@func_map', that makes difficult to 'include SDL2'.
  # So I override it and replace '@func_map' into 'SDL2GFX_FUNCTIONS_MAP'.
  # Ref.: /lib/ruby/2.0.0/fiddle/import.rb
  #
  SDL2GFX_FUNCTIONS_MAP = {}
  def self.extern(signature, *opts)
    symname, ctype, argtype = parse_signature(signature, @type_alias)
    opt = parse_bind_options(opts)
    f = import_function(symname, ctype, argtype, opt[:call_type])
    name = symname.gsub(/@.+/,'')
    SDL2GFX_FUNCTIONS_MAP[name] = f
    begin
      /^(.+?):(\d+)/ =~ caller.first
      file, line = $1, $2.to_i
    rescue
      file, line = __FILE__, __LINE__+3
    end
    args_str="*args"
    module_eval(<<-EOS, file, line)
      def #{name}(*args, &block)
        SDL2GFX_FUNCTIONS_MAP['#{name}'].call(*args,&block)
      end
    EOS
    module_function(name)
    f
  end

  @@sdl2gfx_import_done = false

  # Load native library.
  def self.load_gfx_lib(libpath)
    unless @@sdl2gfx_import_done
      dlload(libpath)
      import_gfx_symbols()
    end
  end


  def self.import_gfx_symbols

    # SDL2_framerate
    extern 'void SDL_initFramerate(FPSmanager*)'
    extern 'int SDL_setFramerate(FPSmanager*, unsigned int)'
    extern 'int SDL_getFramerate(FPSmanager*)'
    extern 'int SDL_getFramecount(FPSmanager*)'
    extern 'unsigned int SDL_framerateDelay(FPSmanager*)'


    # SDL2_gfxPrimitives
    extern 'int pixelColor(SDL_Renderer*, short, short, unsigned int)'
    extern 'int pixelRGBA(SDL_Renderer*, short, short, unsigned char, unsigned char, unsigned char, unsigned char)'

    extern 'int hlineColor(SDL_Renderer*, short, short, short, unsigned int)'
    extern 'int hlineRGBA(SDL_Renderer*, short, short, short, unsigned char, unsigned char, unsigned char, unsigned char)'

    extern 'int vlineColor(SDL_Renderer*, short, short, short, unsigned int)'
    extern 'int vlineRGBA(SDL_Renderer*, short, short, short, unsigned char, unsigned char, unsigned char, unsigned char)'

    extern 'int rectangleColor(SDL_Renderer*, short, short, short, short, unsigned int)'
    extern 'int rectangleRGBA(SDL_Renderer*, short, short, short, short, unsigned char, unsigned char, unsigned char, unsigned char)'

    extern 'int roundedRectangleColor(SDL_Renderer*, short, short, short, short, short, unsigned int)'
    extern 'int roundedRectangleRGBA(SDL_Renderer*, short, short, short, short, short, unsigned char, unsigned char, unsigned char, unsigned char)'

    extern 'int boxColor(SDL_Renderer*, short, short, short, short, unsigned int)'
    extern 'int boxRGBA(SDL_Renderer*, short, short, short, short, unsigned char, unsigned char, unsigned char, unsigned char)'

    extern 'int roundedBoxColor(SDL_Renderer*, short, short, short, short, short, unsigned int)'
    extern 'int roundedBoxRGBA(SDL_Renderer*, short, short, short, short, short, unsigned char, unsigned char, unsigned char, unsigned char)'

    extern 'int lineColor(SDL_Renderer*, short, short, short, short, unsigned int)'
    extern 'int lineRGBA(SDL_Renderer*, short, short, short, short, unsigned char, unsigned char, unsigned char, unsigned char)'

    extern 'int aalineColor(SDL_Renderer*, short, short, short, short, unsigned int)'
    extern 'int aalineRGBA(SDL_Renderer*, short, short, short, short, unsigned char, unsigned char, unsigned char, unsigned char)'

    extern 'int thickLineColor(SDL_Renderer*, short, short, short, short, unsigned char, unsigned int)'
    extern 'int thickLineRGBA(SDL_Renderer*, short, short, short, short, unsigned char, unsigned char, unsigned char, unsigned char, unsigned char)'

    extern 'int circleColor(SDL_Renderer*, short, short, short, unsigned int)'
    extern 'int circleRGBA(SDL_Renderer*, short, short, short, unsigned char, unsigned char, unsigned char, unsigned char)'

    extern 'int arcColor(SDL_Renderer*, short, short, short, short, short, unsigned int)'
    extern 'int arcRGBA(SDL_Renderer*, short, short, short, short, short, unsigned char, unsigned char, unsigned char, unsigned char)'

    extern 'int aacircleColor(SDL_Renderer*, short, short, short, unsigned int)'
    extern 'int aacircleRGBA(SDL_Renderer*, short, short, short, unsigned char, unsigned char, unsigned char, unsigned char)'

    extern 'int filledCircleColor(SDL_Renderer*, short, short, short, unsigned int)'
    extern 'int filledCircleRGBA(SDL_Renderer*, short, short, short, unsigned char, unsigned char, unsigned char, unsigned char)'

    extern 'int ellipseColor(SDL_Renderer*, short, short, short, short, unsigned int)'
    extern 'int ellipseRGBA(SDL_Renderer*, short, short, short, short, unsigned char, unsigned char, unsigned char, unsigned char)'

    extern 'int aaellipseColor(SDL_Renderer*, short, short, short, short, unsigned int)'
    extern 'int aaellipseRGBA(SDL_Renderer*, short, short, short, short, unsigned char, unsigned char, unsigned char, unsigned char)'

    extern 'int filledEllipseColor(SDL_Renderer*, short, short, short, short, unsigned int)'
    extern 'int filledEllipseRGBA(SDL_Renderer*, short, short, short, short, unsigned char, unsigned char, unsigned char, unsigned char)'

    extern 'int pieColor(SDL_Renderer*, short, short, short, short, short, unsigned int)'
    extern 'int pieRGBA(SDL_Renderer*, short, short, short, short, short, unsigned char, unsigned char, unsigned char, unsigned char)'

    extern 'int filledPieColor(SDL_Renderer*, short, short, short, short, short, unsigned int)'
    extern 'int filledPieRGBA(SDL_Renderer*, short, short, short, short, short, unsigned char, unsigned char, unsigned char, unsigned char)'

    extern 'int trigonColor(SDL_Renderer*, short, short, short, short, short, short, unsigned int)'
    extern 'int trigonRGBA(SDL_Renderer*, short, short, short, short, short, short, unsigned char, unsigned char, unsigned char, unsigned char)'

    extern 'int aatrigonColor(SDL_Renderer*, short, short, short, short, short, short, unsigned int)'
    extern 'int aatrigonRGBA(SDL_Renderer*, short, short, short, short, short, short, unsigned char, unsigned char, unsigned char, unsigned char)'

    extern 'int filledTrigonColor(SDL_Renderer*, short, short, short, short, short, short, unsigned int)'
    extern 'int filledTrigonRGBA(SDL_Renderer*, short, short, short, short, short, short, unsigned char, unsigned char, unsigned char, unsigned char)'

    extern 'int polygonColor(SDL_Renderer*, const short*, const short*, int, unsigned int)'
    extern 'int polygonRGBA(SDL_Renderer*, const short*, const short*, int, unsigned char, unsigned char, unsigned char, unsigned char)'

    extern 'int aapolygonColor(SDL_Renderer*, const short*, const short*, int, unsigned int)'
    extern 'int aapolygonRGBA(SDL_Renderer*, const short*, const short*, int, unsigned char, unsigned char, unsigned char, unsigned char)'

    extern 'int filledPolygonColor(SDL_Renderer*, const short*, const short*, int, unsigned int)'
    extern 'int filledPolygonRGBA(SDL_Renderer*, const short*, const short*, int, unsigned char, unsigned char, unsigned char, unsigned char)'

    extern 'int texturedPolygon(SDL_Renderer*, const short*, const short*, int, SDL_Surface*, int, int)'

    extern 'int bezierColor(SDL_Renderer*, const short*, const short*, int, int, unsigned int)'
    extern 'int bezierRGBA(SDL_Renderer*, const short*, const short*, int, int, unsigned char, unsigned char, unsigned char, unsigned char)'

    extern 'void gfxPrimitivesSetFont(const void*, unsigned int, unsigned int)'
    extern 'void gfxPrimitivesSetFontRotation(unsigned int)'
    extern 'int characterColor(SDL_Renderer*, short, short, char, unsigned int)'
    extern 'int characterRGBA(SDL_Renderer*, short, short, char, unsigned char, unsigned char, unsigned char, unsigned char)'
    extern 'int stringColor(SDL_Renderer*, short, short, const char*, unsigned int)'
    extern 'int stringRGBA(SDL_Renderer*, short, short, const char*, unsigned char, unsigned char, unsigned char, unsigned char)'

    # SDL2_imageFilter
    extern 'int SDL_imageFilterMMXdetect()'

    extern 'void SDL_imageFilterMMXoff()'
    extern 'void SDL_imageFilterMMXon()'

    extern 'int SDL_imageFilterAdd(unsigned char*, unsigned char*, unsigned char*, unsigned int)'
    extern 'int SDL_imageFilterMean(unsigned char*, unsigned char*, unsigned char*, unsigned int)'
    extern 'int SDL_imageFilterSub(unsigned char*, unsigned char*, unsigned char*, unsigned int)'
    extern 'int SDL_imageFilterAbsDiff(unsigned char*, unsigned char*, unsigned char*, unsigned int)'
    extern 'int SDL_imageFilterMult(unsigned char*, unsigned char*, unsigned char*, unsigned int)'
    extern 'int SDL_imageFilterMultNor(unsigned char*, unsigned char*, unsigned char*, unsigned int)'
    extern 'int SDL_imageFilterMultDivby2(unsigned char*, unsigned char*, unsigned char*, unsigned int)'
    extern 'int SDL_imageFilterMultDivby4(unsigned char*, unsigned char*, unsigned char*, unsigned int)'
    extern 'int SDL_imageFilterBitAnd(unsigned char*, unsigned char*, unsigned char*, unsigned int)'
    extern 'int SDL_imageFilterBitOr(unsigned char*, unsigned char*, unsigned char*, unsigned int)'
    extern 'int SDL_imageFilterDiv(unsigned char*, unsigned char*, unsigned char*, unsigned int)'
    extern 'int SDL_imageFilterBitNegation(unsigned char*, unsigned char*, unsigned int)'
    extern 'int SDL_imageFilterAddByte(unsigned char*, unsigned char*, unsigned int, unsigned char)'
    extern 'int SDL_imageFilterAddUint(unsigned char*, unsigned char*, unsigned int, unsigned int)'
    extern 'int SDL_imageFilterAddByteToHalf(unsigned char*, unsigned char*, unsigned int, unsigned char)'
    extern 'int SDL_imageFilterSubByte(unsigned char*, unsigned char*, unsigned int, unsigned char)'
    extern 'int SDL_imageFilterSubUint(unsigned char*, unsigned char*, unsigned int, unsigned int)'
    extern 'int SDL_imageFilterShiftRight(unsigned char*, unsigned char*, unsigned int, unsigned char)'
    extern 'int SDL_imageFilterShiftRightUint(unsigned char*, unsigned char*, unsigned int, unsigned char)'
    extern 'int SDL_imageFilterMultByByte(unsigned char*, unsigned char*, unsigned int, unsigned char)'
    extern 'int SDL_imageFilterShiftRightAndMultByByte(unsigned char*, unsigned char*, unsigned int, unsigned char, unsigned char)'
    extern 'int SDL_imageFilterShiftLeftByte(unsigned char*, unsigned char*, unsigned int, unsigned char)'
    extern 'int SDL_imageFilterShiftLeftUint(unsigned char*, unsigned char*, unsigned int, unsigned char)'
    extern 'int SDL_imageFilterShiftLeft(unsigned char*, unsigned char*, unsigned int, unsigned char)'
    extern 'int SDL_imageFilterBinarizeUsingThreshold(unsigned char*, unsigned char*, unsigned int, unsigned char)'
    extern 'int SDL_imageFilterClipToRange(unsigned char*, unsigned char*, unsigned int, unsigned char, unsigned char)'
    extern 'int SDL_imageFilterNormalizeLinear(unsigned char *Src, unsigned char*, unsigned int, int, int, int, int)'

    # SDL2_rotozoom
    extern 'SDL_Surface* rotozoomSurface(SDL_Surface*, double, double, int)'
    extern 'SDL_Surface* rotozoomSurfaceXY(SDL_Surface*, double, double, double, int)'
    extern 'void rotozoomSurfaceSize(int, int, double, double, int*, int*)'
    extern 'void rotozoomSurfaceSizeXY(int, int, double, double, double, int*, int*)'
    extern 'SDL_Surface* zoomSurface(SDL_Surface*, double, double, int)'
    extern 'void zoomSurfaceSize(int, int, double, double, int*, int*)'
    extern 'SDL_Surface* shrinkSurface(SDL_Surface*, int, int)'
    extern 'SDL_Surface* rotateSurface90Degrees(SDL_Surface*, int)'

    @@sdl2gfx_import_done = true
  end

end

=begin
sdl2-bindings : Yet another SDL2 wrapper for Ruby
Copyright (c) 2015-2016 vaiorabbit <http://twitter.com/vaiorabbit>

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
