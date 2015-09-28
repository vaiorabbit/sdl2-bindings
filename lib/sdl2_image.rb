# -*- coding: utf-8 -*-
require 'fiddle/import'

module SDL2

  extend Fiddle::Importer

  # IMG_InitFlags
  IMG_INIT_JPG  = 0x00000001
  IMG_INIT_PNG  = 0x00000002
  IMG_INIT_TIF  = 0x00000004
  IMG_INIT_WEBP = 0x00000008

  #
  # Fiddle's default 'extern' stores all methods into local variable '@func_map', that makes difficult to 'include SDL2'.
  # So I override it and replace '@func_map' into 'SDL2IMAGE_FUNCTIONS_MAP'.
  # Ref.: /lib/ruby/2.0.0/fiddle/import.rb
  #
  SDL2IMAGE_FUNCTIONS_MAP = {}
  def self.extern(signature, *opts)
    symname, ctype, argtype = parse_signature(signature, @type_alias)
    opt = parse_bind_options(opts)
    f = import_function(symname, ctype, argtype, opt[:call_type])
    name = symname.gsub(/@.+/,'')
    SDL2IMAGE_FUNCTIONS_MAP[name] = f
    begin
      /^(.+?):(\d+)/ =~ caller.first
      file, line = $1, $2.to_i
    rescue
      file, line = __FILE__, __LINE__+3
    end
    args_str="*args"
    module_eval(<<-EOS, file, line)
      def #{name}(*args, &block)
        SDL2IMAGE_FUNCTIONS_MAP['#{name}'].call(*args,&block)
      end
    EOS
    module_function(name)
    f
  end

  @@sdl2image_import_done = false

  # Load native library.
  def self.load_image_lib(libpath)
    unless @@sdl2image_import_done
      dlload(libpath)
      import_image_symbols()
    end
  end


  def self.import_image_symbols
    extern 'int IMG_Init(int)'
    extern 'void IMG_Quit()'
    extern 'SDL_Surface* IMG_LoadTyped_RW(SDL_RWops*, int, const char*)'
    extern 'SDL_Surface* IMG_Load(const char*)'
    extern 'SDL_Surface* IMG_Load_RW(SDL_RWops*, int)'
    extern 'SDL_Texture* IMG_LoadTexture(SDL_Renderer*, const char*)'
    extern 'SDL_Texture* IMG_LoadTexture_RW(SDL_Renderer*, SDL_RWops*, int)'
    extern 'SDL_Texture* IMG_LoadTextureTyped_RW(SDL_Renderer*, SDL_RWops*, int, const char*)'
    extern 'int IMG_isICO(SDL_RWops*)'
    extern 'int IMG_isCUR(SDL_RWops*)'
    extern 'int IMG_isBMP(SDL_RWops*)'
    extern 'int IMG_isGIF(SDL_RWops*)'
    extern 'int IMG_isJPG(SDL_RWops*)'
    extern 'int IMG_isLBM(SDL_RWops*)'
    extern 'int IMG_isPCX(SDL_RWops*)'
    extern 'int IMG_isPNG(SDL_RWops*)'
    extern 'int IMG_isPNM(SDL_RWops*)'
    extern 'int IMG_isTIF(SDL_RWops*)'
    extern 'int IMG_isXCF(SDL_RWops*)'
    extern 'int IMG_isXPM(SDL_RWops*)'
    extern 'int IMG_isXV(SDL_RWops*)'
    extern 'int IMG_isWEBP(SDL_RWops*)'
    extern 'SDL_Surface* IMG_LoadICO_RW(SDL_RWops*)'
    extern 'SDL_Surface* IMG_LoadCUR_RW(SDL_RWops*)'
    extern 'SDL_Surface* IMG_LoadBMP_RW(SDL_RWops*)'
    extern 'SDL_Surface* IMG_LoadGIF_RW(SDL_RWops*)'
    extern 'SDL_Surface* IMG_LoadJPG_RW(SDL_RWops*)'
    extern 'SDL_Surface* IMG_LoadLBM_RW(SDL_RWops*)'
    extern 'SDL_Surface* IMG_LoadPCX_RW(SDL_RWops*)'
    extern 'SDL_Surface* IMG_LoadPNG_RW(SDL_RWops*)'
    extern 'SDL_Surface* IMG_LoadPNM_RW(SDL_RWops*)'
    extern 'SDL_Surface* IMG_LoadTGA_RW(SDL_RWops*)'
    extern 'SDL_Surface* IMG_LoadTIF_RW(SDL_RWops*)'
    extern 'SDL_Surface* IMG_LoadXCF_RW(SDL_RWops*)'
    extern 'SDL_Surface* IMG_LoadXPM_RW(SDL_RWops*)'
    extern 'SDL_Surface* IMG_LoadXV_RW(SDL_RWops*)'
    extern 'SDL_Surface* IMG_LoadWEBP_RW(SDL_RWops*)'
    extern 'SDL_Surface* IMG_ReadXPMFromArray(char**)'
    extern 'int IMG_SavePNG(SDL_Surface*, const char*)'
    extern 'int IMG_SavePNG_RW(SDL_Surface*, SDL_RWops*, int)'

    @@sdl2image_import_done = true
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
